
script turn_to_face \{pos = (0.0, 0.0, 0.0)}
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	walking_set = (<anim_set>.walking)
	target = <pos>
	get_angle_to_target target = <target>
	angle = (<angle> * -1)
	obj_roty angle = <angle> speed = (<anim_set>.walking.turn_speed)
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
		hero_play_turn_anim idleanim = <turn_idle> turnanim = <turn_left> turnblend = <blend>
	else
		hero_play_turn_anim idleanim = <turn_idle> turnanim = <turn_right> turnblend = <blend>
	endif
endscript

script walk_to_waypoint \{rotate = true}
	if gotparam \{index}
		get_waypoint_id index = <index>
	elseif gotparam \{node}
		getpakmancurrent \{map = zones}
		getpakmancurrentname \{map = zones}
		formattext textname = suffix '_TRG_Waypoint_%a' a = <node>
		appendsuffixtochecksum base = <pak> suffixstring = <suffix>
		waypoint_id = <appended_id>
	else
		printf \{"node not specified in walk_to_waypoint!"}
		return
	endif
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	if doeswaypointexist name = <waypoint_id>
		change structurename = <info_struct> target_node = <waypoint_id>
		getwaypointpos name = <waypoint_id>
		walk_to_pos dest = <pos>
		face_audience
	else
		printf \{"waypoint not found............"}
	endif
endscript

script walk_to_pos \{walkspeed = 2
		rotate = true
		backward = false}
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	obj_getposition
	world_pos_dest = (<dest>)
	offset = (<world_pos_dest> - <pos>)
	vectorlength vector = <offset>
	printf "dist to target is %a..........." a = <length>
	if (<length> < $min_walk_dist)
		return
	endif
	get_angle_to_target target = <dest>
	min_turn = (<anim_set>.walking.min_turn)
	if ((<angle> > (-180 + <min_turn>) && <angle> < (0.0 - <min_turn>)) || (<angle> > <min_turn> && <angle> < (180 - <min_turn>)))
		if (<rotate> = true)
			turn_to_face pos = <world_pos_dest>
		endif
	else
		if (<angle> <= -90)
			angle = (<angle> + 180)
		elseif (<angle> >= 90)
			angle = (<angle> - 180)
		endif
		angle = (<angle> * -1)
		obj_roty angle = <angle> speed = (<anim_set>.walking.turn_speed)
	endif
	if isfacing pos = <dest>
		walking_set = (<anim_set>.walking.forward)
	else
		walking_set = (<anim_set>.walking.backward)
	endif
	delta = (<pos> - <world_pos_dest>)
	x = (<delta>.(1.0, 0.0, 0.0))
	z = (<delta>.(0.0, 0.0, 1.0))
	delta = (<x> * (1.0, 0.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	vectorlength vector = <delta>
	if (<length> = 0.1)
		printf \{"not going anywhere?.........."}
		return
	endif
	time = (<length> / <walkspeed>)
	desired_dist = (<length>)
	get_anim_speed_for_tempo_cfunc
	setsearchallassetcontexts
	anim_scale = (<info_struct>.scale)
	anim_gettotaldisplacement anim = (<walking_set>.start_anim.<anim_speed>)
	displacement = (<displacement> * <anim_scale>)
	desired_dist = (<desired_dist> - <displacement>)
	anim_gettotaldisplacement anim = (<walking_set>.stop_left_anim.<anim_speed>)
	displacement = (<displacement> * <anim_scale>)
	desired_dist = (<desired_dist> - <displacement>)
	anim_getanimlength anim = (<walking_set>.cycle_anim.<anim_speed>)
	anim_gettotaldisplacement anim = (<walking_set>.cycle_anim.<anim_speed>)
	displacement = (<displacement> * <anim_scale>)
	setsearchallassetcontexts \{off}
	if (<displacement> = 0.0)
		cycles_needed = 3
	else
		cycles_needed = (<desired_dist> / <displacement>)
	endif
	precision_mode = false
	if (<precision_mode> = false)
		cycles_needed_float = (<cycles_needed>)
		casttointeger \{cycles_needed}
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
		hero_play_anim anim = (<walking_set>.cycle_anim.<anim_speed>) blendduration = 0.0 cycle
		wait <time_needed> seconds
	endif
	hero_get_foot_down
	printf \{"playing stop......"}
	get_angle_to_target \{target = (0.0, 0.0, 50.0)}
	if (<angle> < <min_turn> && <angle> > (0.0 - <min_turn>))
		angle = (<angle> * -1)
		obj_roty angle = <angle> speed = (<anim_set>.walking.face_audience_speed)
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
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = timer_getframefactor}
		if (<framefactor> > 0.120000005 && <framefactor> < 0.62)
			return \{foot = right}
		else
			return \{foot = left}
		endif
	endif
endscript

script face_audience 
	turn_to_face \{pos = (0.0, 0.0, 50.0)}
endscript

script isfacing 
	obj_getmatrix
	x = (<at>.(1.0, 0.0, 0.0))
	z = (<at>.(0.0, 0.0, 1.0))
	at = (<x> * (1.0, 0.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	dest_pos = <pos>
	obj_getposition
	delta = (<dest_pos> - <pos>)
	x = (<delta>.(1.0, 0.0, 0.0))
	z = (<delta>.(0.0, 0.0, 1.0))
	delta = (<x> * (1.0, 0.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	if (<at>.<delta> < 0)
		return \{false}
	else
		return \{true}
	endif
endscript

script get_angle_to_target 
	obj_getposition
	obj_getmatrix
	vec_to_pos = (<target> - <pos>)
	getangle vec1 = <at> vec2 = <vec_to_pos> rot_axis = y
	crossprod = (<vec_to_pos>.<left>)
	if (<crossprod> > 0.0)
		<angle> = (0.0 - <angle>)
	endif
	return {angle = <angle>}
endscript
