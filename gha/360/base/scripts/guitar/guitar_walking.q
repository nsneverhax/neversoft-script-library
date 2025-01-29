
script turn_to_face \{Pos = (0.0, 0.0, 0.0)}
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	walking_set = (<anim_set>.walking)
	target = <Pos>
	get_angle_to_target target = <target>
	angle = (<angle> * -1)
	Obj_RotY angle = <angle> speed = (<anim_set>.walking.turn_speed)
endscript

script play_turn_anim 
	blend = (<angle> / <max_turn>)
	if (<blend> < 0)
		blend = 0
	elseif (<blend> > 1.0)
		blend = 1.0
	endif
	printf "playing turn with %a, %b, and %c............." a = <turn_idle> b = <turn_left> c = <turn_right>
	if (<turning_left> = true)
		hero_play_turn_anim idleAnim = <turn_idle> turnAnim = <turn_left> turnBlend = <blend>
	else
		hero_play_turn_anim idleAnim = <turn_idle> turnAnim = <turn_right> turnBlend = <blend>
	endif
endscript

script walk_to_waypoint \{rotate = true}
	if GotParam \{index}
		get_waypoint_id index = <index>
	elseif GotParam \{node}
		GetPakManCurrent \{map = zones}
		GetPakManCurrentName \{map = zones}
		formatText TextName = suffix '_TRG_Waypoint_%a' a = <node>
		AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
		waypoint_id = <appended_id>
	else
		printf \{"node not specified in walk_to_waypoint!"}
		return
	endif
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	if DoesWaypointExist Name = <waypoint_id>
		Change structurename = <info_struct> target_node = <waypoint_id>
		GetWaypointPos Name = <waypoint_id>
		walk_to_pos dest = <Pos>
		face_audience
	else
		printf \{"waypoint not found............"}
	endif
endscript

script walk_to_pos \{walkspeed = 2
		rotate = true
		backward = FALSE}
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	Obj_GetPosition
	world_pos_dest = (<dest>)
	offset = (<world_pos_dest> - <Pos>)
	VectorLength vector = <offset>
	printf "dist to target is %a..........." a = <length>
	if (<length> < $min_walk_dist)
		return
	endif
	get_angle_to_target target = <dest>
	min_turn = (<anim_set>.walking.min_turn)
	if ((<angle> > (-180 + <min_turn>) && <angle> < (0.0 - <min_turn>)) || (<angle> > <min_turn> && <angle> < (180 - <min_turn>)))
		if (<rotate> = true)
			turn_to_face Pos = <world_pos_dest>
		endif
	else
		if (<angle> <= -90)
			angle = (<angle> + 180)
		elseif (<angle> >= 90)
			angle = (<angle> - 180)
		endif
		angle = (<angle> * -1)
		Obj_RotY angle = <angle> speed = (<anim_set>.walking.turn_speed)
	endif
	if IsFacing Pos = <dest>
		walking_set = (<anim_set>.walking.forward)
	else
		walking_set = (<anim_set>.walking.backward)
	endif
	delta = (<Pos> - <world_pos_dest>)
	X = (<delta>.(1.0, 0.0, 0.0))
	z = (<delta>.(0.0, 0.0, 1.0))
	delta = (<X> * (1.0, 0.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	VectorLength vector = <delta>
	if (<length> = 0.1)
		printf \{"not going anywhere?.........."}
		return
	endif
	time = (<length> / <walkspeed>)
	desired_dist = (<length>)
	get_anim_speed_for_tempo_cfunc
	SetSearchAllAssetContexts
	anim_scale = (<info_struct>.Scale)
	Anim_GetTotalDisplacement anim = (<walking_set>.start_anim.<anim_speed>)
	displacement = (<displacement> * <anim_scale>)
	desired_dist = (<desired_dist> - <displacement>)
	Anim_GetTotalDisplacement anim = (<walking_set>.stop_left_anim.<anim_speed>)
	displacement = (<displacement> * <anim_scale>)
	desired_dist = (<desired_dist> - <displacement>)
	Anim_GetAnimLength anim = (<walking_set>.cycle_anim.<anim_speed>)
	Anim_GetTotalDisplacement anim = (<walking_set>.cycle_anim.<anim_speed>)
	displacement = (<displacement> * <anim_scale>)
	SetSearchAllAssetContexts \{OFF}
	if (<displacement> = 0.0)
		cycles_needed = 3
	else
		cycles_needed = (<desired_dist> / <displacement>)
	endif
	precision_mode = FALSE
	if (<precision_mode> = FALSE)
		cycles_needed_float = (<cycles_needed>)
		CastToInteger \{cycles_needed}
		fraction = (<cycles_needed_float> - <cycles_needed>)
		if (<fraction> > 0.75)
			cycles_needed = (<cycles_needed> + 1)
		elseif (<fraction> > 0.25)
			cycles_needed = (<cycles_needed> + 0.5)
		endif
	endif
	time_needed = (<cycles_needed> * <length>)
	printf \{"starting to walk........."}
	hero_play_anim anim = (<walking_set>.start_anim.<anim_speed>)
	hero_wait_until_anim_finished
	printf \{"playing cycle......"}
	if (<time_needed> > 0)
		hero_play_anim anim = (<walking_set>.cycle_anim.<anim_speed>) BlendDuration = 0.0 cycle
		Wait <time_needed> Seconds
	endif
	hero_get_foot_down
	printf \{"playing stop......"}
	get_angle_to_target \{target = (0.0, 0.0, 50.0)}
	if (<angle> < <min_turn> && <angle> > (0.0 - <min_turn>))
		angle = (<angle> * -1)
		Obj_RotY angle = <angle> speed = (<anim_set>.walking.face_audience_speed)
	endif
	if (<foot> = left)
		hero_play_anim anim = (<walking_set>.stop_left_anim.<anim_speed>)
	else
		hero_play_anim anim = (<walking_set>.stop_right_anim.<anim_speed>)
	endif
	hero_wait_until_anim_finished
	printf \{"all done!................."}
endscript

script hero_get_foot_down 
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			Command = Timer_GetFrameFactor}
		if (<framefactor> > 0.120000005 && <framefactor> < 0.62)
			return \{foot = right}
		else
			return \{foot = left}
		endif
	endif
endscript

script face_audience 
	turn_to_face \{Pos = (0.0, 0.0, 50.0)}
endscript

script IsFacing 
	Obj_GetMatrix
	X = (<at>.(1.0, 0.0, 0.0))
	z = (<at>.(0.0, 0.0, 1.0))
	at = (<X> * (1.0, 0.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	dest_pos = <Pos>
	Obj_GetPosition
	delta = (<dest_pos> - <Pos>)
	X = (<delta>.(1.0, 0.0, 0.0))
	z = (<delta>.(0.0, 0.0, 1.0))
	delta = (<X> * (1.0, 0.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	if (<at>.<delta> < 0)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script get_angle_to_target 
	Obj_GetPosition
	Obj_GetMatrix
	vec_to_pos = (<target> - <Pos>)
	GetAngle vec1 = <at> vec2 = <vec_to_pos> rot_axis = y
	crossprod = (<vec_to_pos>.<left>)
	if (<crossprod> > 0.0)
		<angle> = (0.0 - <angle>)
	endif
	return {angle = <angle>}
endscript
