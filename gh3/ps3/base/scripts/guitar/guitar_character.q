guitarist_info = {
	anim_set = judy_animations
	stance = Stance_FrontEnd
	finger_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	Strum = Normal
	guitar_model = NONE
	playing_missed_note = FALSE
	last_strum_length = Short
	current_anim = IDLE
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = FALSE
	next_stance = Stance_FrontEnd
	next_anim = NONE
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = NONE
	waiting_for_cameracut = FALSE
	allow_movement = TRUE
	target_node = NONE
	facial_anim = IDLE
	Scale = 1.0
}
bassist_info = {
	anim_set = axel_animations
	stance = Stance_FrontEnd
	finger_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	Strum = Normal
	bass_model = NONE
	playing_missed_note = FALSE
	last_strum_length = Short
	current_anim = IDLE
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = FALSE
	next_stance = Stance_FrontEnd
	next_anim = NONE
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = NONE
	waiting_for_cameracut = FALSE
	allow_movement = TRUE
	target_node = NONE
	facial_anim = IDLE
	Scale = 1.0
}
vocalist_info = {
	anim_set = vocalist_animations
	stance = Stance_A
	current_anim = IDLE
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = FALSE
	next_stance = Stance_A
	next_anim = NONE
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = NONE
	allow_movement = TRUE
	target_node = NONE
	facial_anim = IDLE
	Scale = 1.0
}
drummer_info = {
	TWIST = 0.0
	desired_twist = 0.0
	anim_set = drummer_animations
	stance = Stance_A
	current_anim = IDLE
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = FALSE
	next_stance = Stance_A
	next_anim = NONE
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = NONE
	allow_movement = TRUE
	target_node = NONE
	facial_anim = IDLE
	last_left_arm_note = 0
	last_right_arm_note = 0
	Scale = 1.0
}
current_bass_model = NONE

script create_band \{async = 0}
	if ($disable_band = 1)
		return
	endif
	GetPakManCurrent \{map = Zones}
	if (<pak> = Z_Credits)
		if NOT create_guitarist async = <async>
			return \{FALSE}
		endif
		unload_character \{Name = BASSIST}
		unload_character \{Name = VOCALIST}
		unload_character \{Name = DRUMMER}
		set_bandvisible
		return \{TRUE}
	endif
	if ($current_num_players = 1)
		if NOT create_guitarist async = <async>
			return \{FALSE}
		endif
		if NOT create_drummer async = <async>
			return \{FALSE}
		endif
		get_song_struct Song = ($current_song)
		if StructureContains Structure = <song_struct> Name = BASSIST
			bassist_profile = (<song_struct>.BASSIST)
			if NOT create_bassist profile_name = <bassist_profile> async = <async>
				return \{FALSE}
			endif
		else
			if NOT create_bassist async = <async>
				return \{FALSE}
			endif
		endif
		if StructureContains Structure = <song_struct> Name = Singer
			if (<song_struct>.Singer = NONE)
				if CompositeObjectExists \{Name = VOCALIST}
					unload_character \{Name = VOCALIST}
				endif
			else
				if (<pak> = Z_Wikker || <pak> = Z_Budokan || <pak> = Z_Hell)
					if (<song_struct>.Singer = Female)
						singer_profile = 'singer_female_alt'
					elseif (<song_struct>.Singer = bRet)
						singer_profile = 'singer_bret_alt'
					else
						singer_profile = 'singer_alt'
					endif
				else
					if (<song_struct>.Singer = Female)
						singer_profile = 'singer_female'
					elseif (<song_struct>.Singer = bRet)
						singer_profile = 'singer_bret'
					else
						singer_profile = 'singer'
					endif
				endif
				if ($Cheat_BretMichaels = 1)
					if NOT (<song_struct>.Singer = Female)
						singer_profile = 'singer_bret'
					endif
				endif
				if NOT create_vocalist profile_name = <singer_profile> async = <async>
					return \{FALSE}
				endif
			endif
		else
			if ($Cheat_BretMichaels = 1)
				singer_profile = 'singer_bret'
			else
				singer_profile = 'singer'
			endif
			if NOT create_vocalist profile_name = <singer_profile> async = <async>
				return \{FALSE}
			endif
		endif
	else
		unload_character \{Name = VOCALIST}
		if NOT create_guitarist Name = GUITARIST async = <async>
			return \{FALSE}
		endif
		if NOT create_guitarist Name = BASSIST async = <async>
			return \{FALSE}
		endif
		if NOT create_drummer async = <async>
			return \{FALSE}
		endif
	endif
	set_bandvisible
	return \{TRUE}
endscript

script create_guitarist_profile 
	player2_is_lead = FALSE
	if ($current_num_players = 2)
		if (($game_mode = p2_career) || ($game_mode = p2_coop))
			if NOT ($player1_status.part = GUITAR)
				player2_is_lead = TRUE
			endif
		endif
	endif
	if ((<Name> = GUITARIST && <player2_is_lead> = FALSE) || (<Name> = BASSIST && <player2_is_lead> = TRUE))
		player_status = player1_status
	else
		player_status = player2_status
	endif
	found = 0
	find_profile_by_id Id = ($<player_status>.character_id)
	<found> = 1
	if (<found> = 1)
		if GotParam \{no_guitar}
			<instrument_id> = NONE
		else
			if ($boss_battle = 1 && <Name> = BASSIST)
				get_musician_profile_struct Index = <Index>
				<instrument_id> = (<profile_struct>.musician_instrument.desc_id)
			else
				<instrument_id> = ($<player_status>.instrument_id)
			endif
		endif
		if ($Cheat_AirGuitar = 1)
			if NOT ($is_network_game)
				<instrument_id> = NONE
			endif
		endif
		outfit = ($<player_status>.outfit)
		style = ($<player_status>.style)
		get_musician_profile_struct Index = <Index>
		character_name = (<profile_struct>.Name)
		FormatText ChecksumName = body_id 'Guitarist_%n_Outfit%o_Style%s' N = <character_name> O = <outfit> S = <style>
		Profile = {<profile_struct>
			musician_instrument = {desc_id = <instrument_id>}
			musician_body = {desc_id = <body_id>}
			download_musician_instrument = {desc_id = <instrument_id>}
			download_musician_body = {desc_id = <body_id>}
			outfit = <outfit>}
	endif
	return <...>
endscript

script create_guitarist \{Name = GUITARIST
		profile_name = 'judy'
		instrument_id = Instrument_Les_Paul_Black
		async = 0
		animpak = 1}
	ExtendCRC <Name> '_Info' out = info_struct
	Printf Channel = AnimInfo "creating guitarist - %a ........." A = <Name>
	create_guitarist_profile <...>
	if (<found> = 1)
		if GotParam \{node_name}
			waypoint_id = <node_name>
		else
			get_start_node_id member = <Name>
		endif
		if DoesWayPointExist Name = <waypoint_id>
			Change StructureName = <info_struct> target_node = <waypoint_id>
		else
			Printf "unable to find starting position for %a ........" A = <Name>
		endif
		ClearEventHandlerGroup \{hand_events}
		if NOT create_band_member Name = <Name> Profile = <Profile> start_node = <waypoint_id> <...>
			return \{FALSE}
		endif
		find_profile_by_id Id = ($<player_status>.character_id)
		FormatText TextName = highway_name 'Guitarist_%n_Outfit%o_Style%s' N = (<profile_struct>.Name) O = <outfit> S = <style>
		AddToMaterialLibrary scene = <highway_name>
		FormatText ChecksumName = highway_material 'sys_%a_1_highway_sys_%a_1_highway' A = (<profile_struct>.Name)
		Change StructureName = <player_status> highway_material = <highway_material>
		Change StructureName = <player_status> band_Member = <Name>
		get_musician_profile_struct Index = <Index>
		Change StructureName = <info_struct> anim_set = (<profile_struct>.anim_set)
		Change StructureName = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		Change StructureName = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		Change StructureName = <info_struct> Strum = (<profile_struct>.strum_anims)
		Change StructureName = <info_struct> allow_movement = TRUE
		Change StructureName = <info_struct> arms_disabled = 0
		Change StructureName = <info_struct> disable_arms = 0
		Change StructureName = <info_struct> next_stance = ($<info_struct>.stance)
		if StructureContains Structure = <profile_struct> Name = Scale
			scale_x = ((<profile_struct>.Scale).(1.0, 0.0, 0.0))
			scale_Y = ((<profile_struct>.Scale).(0.0, 1.0, 0.0))
			scale_z = ((<profile_struct>.Scale).(0.0, 0.0, 1.0))
			if ((<scale_x> != <scale_Y>) || (<scale_Y> != <scale_z>))
				ScriptAssert \{"Attempting to create a guitarist with a non-uniform scale!"}
			endif
			Printf Channel = newdebug "found scale in character profile! %a ......." A = (<profile_struct>.Scale)
			Change StructureName = <info_struct> Scale = <scale_x>
		else
			Change StructureName = <info_struct> Scale = 1.0
		endif
		stance = ($<info_struct>.stance)
		Printf Channel = AnimInfo "creating guitarist in stance %a ........" A = <stance>
		if (<stance> = Stance_FrontEnd || <stance> = Stance_FrontEnd_Guitar)
			Change StructureName = <info_struct> arms_disabled = 2
			Change StructureName = <info_struct> disable_arms = 2
			<Name> :hero_toggle_arms num_arms = 0 prev_num_arms = 2 blend_time = 0.0
		else
			<Name> :hero_toggle_arms num_arms = 1 prev_num_arms = 0 blend_time = 0.0
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($<info_struct>.Strum)
		ExtendCRC <strum_type> '_Strums' out = strum_anims
		if NOT GotParam \{no_strum}
			<Name> :hero_play_strum_anim Anim = ($<strum_anims>.no_strum_anim)
			<Name> :hero_play_fret_anim Anim = (<fret_anims>.track_123)
			<Name> :hero_play_finger_anim Anim = (<finger_anims>.track_none)
		endif
		<Name> :Ragdoll_SetAccessoryBones accessory_bones = $Guitarist_accessory_bones
		<Name> :Obj_SwitchScript guitarist_idle
		<Name> :Obj_SpawnScriptNow facial_anim_loop
		if GotParam \{no_anim}
			SpawnScriptNow temp_hero_pause_script Params = {Name = <Name>}
		endif
		<Name> :Obj_ForceUpdate
	else
		Printf \{"profile not found in create_guitarist! ........."}
	endif
	return \{TRUE}
endscript

script temp_hero_pause_script 
	Wait \{1
		GameFrames}
	if <Name> :Anim_AnimNodeExists Id = BodyTimer
		<Name> :Anim_Command Target = BodyTimer Command = Timer_SetSpeed Params = {SPEED = 0.0}
	endif
endscript

script create_bassist \{Name = BASSIST
		profile_name = 'bassist'
		async = 0}
	ExtendCRC <Name> '_Info' out = info_struct
	Printf Channel = AnimInfo "creating bassist - %a ........." A = <Name>
	find_profile Name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <Name>
		if DoesWayPointExist Name = <waypoint_id>
			GetWaypointPos Name = <waypoint_id>
			Change StructureName = <info_struct> target_node = <waypoint_id>
		else
			Printf "unable to find starting position for %a ........" A = <Name>
		endif
		get_musician_profile_struct Index = <Index>
		if ($current_bass_model = NONE)
			Profile = <profile_struct>
		else
			Profile = {
				<profile_struct>
				musician_instrument = {desc_id = ($current_bass_model)}
			}
		endif
		if NOT create_band_member Name = <Name> Profile = <Profile> start_node = <waypoint_id> <...>
			return \{FALSE}
		endif
		get_musician_profile_struct Index = <Index>
		Change StructureName = <info_struct> anim_set = (<profile_struct>.anim_set)
		Change StructureName = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		Change StructureName = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		Change StructureName = <info_struct> Strum = (<profile_struct>.strum_anims)
		Change StructureName = <info_struct> allow_movement = TRUE
		Change StructureName = <info_struct> arms_disabled = 0
		Change StructureName = <info_struct> disable_arms = 0
		if StructureContains Structure = <profile_struct> Name = Scale
			scale_x = ((<profile_struct>.Scale) * (1.0, 0.0, 0.0))
			scale_Y = ((<profile_struct>.Scale) * (0.0, 1.0, 0.0))
			scale_z = ((<profile_struct>.Scale) * (0.0, 0.0, 1.0))
			if ((<scale_x> != <scale_Y>) || (<scale_Y> != <scale_z>))
				ScriptAssert \{"Attempting to create a guitarist with a non-uniform scale!"}
			endif
			Printf Channel = newdebug "found scale in character profile! %a ......." A = (<profile_struct>.Scale)
			Change StructureName = <info_struct> Scale = <scale_x>
		else
			Change StructureName = <info_struct> Scale = 1.0
		endif
		if GotParam \{stance}
			Change StructureName = <info_struct> stance = <stance>
		else
			Change StructureName = <info_struct> stance = (<profile_struct>.stance)
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($bassist_info.Strum)
		ExtendCRC <strum_type> '_Strums' out = strum_anims
		if NOT GotParam \{no_strum}
			<Name> :hero_play_strum_anim Anim = ($<strum_anims>.no_strum_anim)
			<Name> :hero_play_fret_anim Anim = (<fret_anims>.track_106)
			<Name> :hero_play_finger_anim Anim = (<finger_anims>.track_none)
		endif
		<Name> :Ragdoll_SetAccessoryBones accessory_bones = $Guitarist_accessory_bones
		<Name> :Obj_SwitchScript guitarist_idle
		<Name> :Obj_SpawnScriptNow facial_anim_loop
	else
		Printf \{"profile not found in create_bassist! ........."}
	endif
	return \{TRUE}
endscript

script create_vocalist \{Name = VOCALIST
		profile_name = 'singer'
		async = 0}
	ExtendCRC <Name> '_Info' out = info_struct
	Printf "creating vocalist - %a ........." A = <Name>
	find_profile Name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <Name>
		if DoesWayPointExist Name = <waypoint_id>
			GetWaypointPos Name = <waypoint_id>
			Change StructureName = <info_struct> target_node = <waypoint_id>
		else
			Printf "unable to find starting position for %a ........" A = <Name>
		endif
		get_musician_profile_struct Index = <Index>
		if NOT create_band_member Name = <Name> Profile = <profile_struct> start_node = <waypoint_id> <...>
			return \{FALSE}
		endif
		Change StructureName = <info_struct> anim_set = (<profile_struct>.anim_set)
		Change StructureName = <info_struct> allow_movement = TRUE
		if GotParam \{stance}
			Change StructureName = <info_struct> stance = <stance>
		else
			Change StructureName = <info_struct> stance = (<profile_struct>.stance)
		endif
		<Name> :Ragdoll_SetAccessoryBones accessory_bones = $Guitarist_accessory_bones
		<Name> :Obj_SwitchScript BandMember_Idle
		<Name> :Obj_SpawnScriptNow facial_anim_loop
	else
		Printf \{"profile not found in create_vocalist! ........."}
	endif
	return \{TRUE}
endscript

script create_drummer \{Name = DRUMMER
		profile_name = 'drummer'
		async = 0}
	ExtendCRC <Name> '_Info' out = info_struct
	Printf "creating drummer - %a ........." A = <Name>
	find_profile Name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <Name>
		if DoesWayPointExist Name = <waypoint_id>
			GetWaypointPos Name = <waypoint_id>
			Change StructureName = <info_struct> target_node = <waypoint_id>
		else
			Printf "unable to find starting position for %a ........" A = <Name>
		endif
		get_musician_profile_struct Index = <Index>
		if NOT create_band_member Name = <Name> Profile = <profile_struct> start_node = <waypoint_id> <...>
			return \{FALSE}
		endif
		Change StructureName = <info_struct> anim_set = (<profile_struct>.anim_set)
		Change StructureName = <info_struct> allow_movement = TRUE
		if GotParam \{stance}
			Change StructureName = <info_struct> stance = <stance>
		else
			Change StructureName = <info_struct> stance = (<profile_struct>.stance)
		endif
		<Name> :Ragdoll_SetAccessoryBones accessory_bones = $Guitarist_accessory_bones
		<Name> :Obj_KillSpawnedScript Name = drummer_autotwist
		<Name> :Obj_SpawnScriptNow drummer_autotwist
		<Name> :Obj_SwitchScript BandMember_Idle
		<Name> :Obj_SpawnScriptNow facial_anim_loop
		Change \{StructureName = drummer_info
			last_left_arm_note = 0}
		Change \{StructureName = drummer_info
			last_right_arm_note = 0}
	else
		Printf \{"profile not found in create_drummer! ........."}
	endif
	return \{TRUE}
endscript

script drummer_autotwist 
	hero_play_anim \{Tree = $drummer_twist_branch
		Target = BodyTwist
		Anim = Test_Drum_BodyTwist_D
		BlendDuration = 0.0}
	change_rate = 0.18
	begin
	TWIST = ($drummer_info.TWIST)
	compute_desired_drummer_twist
	diff = (<desired_twist> - <TWIST>)
	if (<TWIST> < <desired_twist>)
		if (<diff> < $drummer_twist_rate)
			TWIST = <desired_twist>
		else
			TWIST = (<TWIST> + $drummer_twist_rate)
		endif
	elseif (<TWIST> > <desired_twist>)
		if ((<diff> * -1) < $drummer_twist_rate)
			TWIST = <desired_twist>
		else
			TWIST = (<TWIST> - $drummer_twist_rate)
		endif
	endif
	drummer_twist Strength = <TWIST>
	Change StructureName = drummer_info TWIST = <TWIST>
	Wait \{1
		GameFrame}
	repeat
endscript

script unload_character 
	destroy_band_member Name = <Name>
endscript

script unload_band 
	destroy_band_member \{Name = GUITARIST}
	destroy_band_member \{Name = BASSIST}
	destroy_band_member \{Name = DRUMMER}
	destroy_band_member \{Name = VOCALIST}
	force_unload_all_character_paks
endscript

script hero_play_random_anim \{BlendDuration = 0.2}
	GetArraySize <Anims>
	GetRandomValue Name = newIndex Integer A = 0 B = (<array_Size> - 1)
	anim_name = (<Anims> [<newIndex>])
	if GotParam \{CYCLE}
		hero_play_anim Anim = <anim_name> BlendDuration = <BlendDuration> CYCLE
	else
		hero_play_anim Anim = <anim_name> BlendDuration = <BlendDuration>
	endif
endscript

script should_display_debug_info 
	Obj_GetID
	display_info = FALSE
	switch (<ObjID>)
		case GUITARIST
		if ($display_guitarist_anim_info = TRUE)
			display_info = TRUE
		endif
		case BASSIST
		if ($display_bassist_anim_info = TRUE)
			display_info = TRUE
		endif
		case VOCALIST
		if ($display_vocalist_anim_info = TRUE)
			display_info = TRUE
		endif
		case DRUMMER
		if ($display_drummer_anim_info = TRUE)
			display_info = TRUE
		endif
	endswitch
	return <display_info>
endscript

script hero_play_random_anims 
	count = 0
	begin
	hero_play_random_anim Anims = <anim_array>
	hero_wait_until_anim_finished
	count = (<count> + 1)
	if GotParam \{repeat_count}
		if (<count> = <repeat_count>)
			break
		endif
	endif
	repeat
endscript

script hero_play_adjusting_random_anims \{blend_time = 0.2}
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	count = 0
	begin
	Anim = ($<info_struct>.current_anim)
	CYCLE = ($<info_struct>.cycle_anim)
	repeat_count = ($<info_struct>.anim_repeat_count)
	if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
		if (($<info_struct>.disable_arms) = 2)
			Printf \{Channel = newdebug
				"want to disable both arms!"}
			if ($<info_struct>.arms_disabled != 2)
				Printf Channel = newdebug "%a arms previously disabled" A = ($<info_struct>.arms_disabled)
				hero_toggle_arms num_arms = 0 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				Change StructureName = <info_struct> arms_disabled = 2
			endif
		elseif (($<info_struct>.disable_arms) = 1)
			if ($<info_struct>.arms_disabled != 1)
				hero_toggle_arms num_arms = 1 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				Change StructureName = <info_struct> arms_disabled = 1
			endif
		else
			if ($<info_struct>.arms_disabled != 0)
				hero_toggle_arms num_arms = 2 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				Change StructureName = <info_struct> arms_disabled = 0
			endif
		endif
	endif
	if (<ObjID> = GUITARIST)
		if NOT (<Anim> = IDLE)
			Change StructureName = <info_struct> facial_anim = <Anim>
		endif
	endif
	if hero_play_tempo_anim_cfunc Anim = <Anim> BlendDuration = <blend_time>
		hero_play_anim Anim = <anim_to_run> BlendDuration = <Blend_Duration> UseMotionExtraction = <use_motion_extraction>
		hero_wait_until_anim_finished
	else
		Wait \{1
			GameFrame}
	endif
	display_debug_info = FALSE
	if (should_display_debug_info)
		display_debug_info = TRUE
	endif
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	next_stance = ($<info_struct>.next_stance)
	stance_changed = FALSE
	if NOT (<next_stance> = <stance>)
		if (<display_debug_info> = TRUE)
			Printf Channel = AnimInfo "%c stance now changing from %a to %b............" C = <ObjID> A = <stance> B = <next_stance>
		endif
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <stance> new_stance = <next_stance>
			hero_play_anim Anim = <anim_to_run>
			hero_wait_until_anim_finished
		endif
		Change StructureName = <info_struct> stance = <next_stance>
		stance = <next_stance>
		stance_changed = TRUE
	endif
	next_anim = ($<info_struct>.next_anim)
	if (<next_anim> = NONE && <stance_changed> = FALSE)
		if (<CYCLE> = FALSE)
			repeat_count = (<repeat_count> - 1)
			if (<repeat_count> < 1)
				if (<display_debug_info> = TRUE)
					Printf Channel = AnimInfo "%a has finished playing anim %b " A = <ObjID> B = <Anim>
				endif
				repeat_count = 0
			endif
		endif
		Change StructureName = <info_struct> anim_repeat_count = <repeat_count>
		if (<CYCLE> = FALSE && <repeat_count> <= 0)
			Change StructureName = <info_struct> current_anim = IDLE
			Change StructureName = <info_struct> cycle_anim = TRUE
			if (<next_stance> = INTRO || <next_stance> = Intro_SmStg || <next_stance> = Stance_FrontEnd || <next_stance> = Stance_FrontEnd_Guitar)
			else
				Change StructureName = <info_struct> disable_arms = 0
			endif
			blend_time = 0.2
			if (<display_debug_info> = TRUE)
				Printf Channel = AnimInfo "%a has no anims in queue...returning to idle" A = <ObjID>
			endif
		else
			blend_time = 0.2
			if (<display_debug_info> = TRUE)
				if (<CYCLE> = FALSE)
					Printf Channel = AnimInfo "%a repeating the %c anim (%b more times)" C = <Anim> A = <ObjID> B = <repeat_count>
				else
					Printf Channel = AnimInfo "%a %b anim is cycling" A = <ObjID> B = <Anim>
				endif
			endif
		endif
	else
		repeat_count = ($<info_struct>.next_anim_repeat_count)
		if ((<display_debug_info> = TRUE) && (<next_anim> != NONE))
			if (<repeat_count> > 1)
				Printf Channel = AnimInfo "%a will play %b anim %c times ......." A = <ObjID> B = <next_anim> C = <repeat_count>
			else
			endif
		endif
		if (<next_anim> = NONE)
			if (<display_debug_info> = TRUE)
				Printf Channel = AnimInfo "%a has no anims in queue...returning to idle" A = <ObjID>
			endif
			next_anim = IDLE
			cycle_next_anim = TRUE
		else
			cycle_next_anim = ($<info_struct>.cycle_next_anim)
		endif
		if (<next_stance> = INTRO || <next_stance> = Intro_SmStg || <next_stance> = Stance_FrontEnd || <next_stance> = Stance_FrontEnd_Guitar)
			disable_arms_next_anim = 2
		else
			disable_arms_next_anim = ($<info_struct>.next_anim_disable_arms)
		endif
		Change StructureName = <info_struct> stance = <next_stance>
		Change StructureName = <info_struct> current_anim = <next_anim>
		Change StructureName = <info_struct> cycle_anim = <cycle_next_anim>
		Change StructureName = <info_struct> disable_arms = <disable_arms_next_anim>
		Change StructureName = <info_struct> next_anim = NONE
		Change StructureName = <info_struct> cycle_next_anim = TRUE
		Change StructureName = <info_struct> anim_repeat_count = <repeat_count>
		Change StructureName = <info_struct> next_anim_disable_arms = 0
		blend_time = 0.2
	endif
	repeat
endscript

script crowd_play_adjusting_random_anims \{Anim = IDLE
		blend_time = 0.2
		startwithnoblend = 0}
	Obj_GetID
	old_speed = undefined
	begin
	hero_get_skill_level_cfunc
	get_anim_speed_for_tempo_cfunc
	if GotParam \{anim_set}
		Anims = ($<anim_set>.<Anim>.<skill>.<anim_speed>)
	else
		Anims = ($crowd_animations.<Anim>.<skill>.<anim_speed>)
	endif
	GetArraySize <Anims>
	GetRandomValue Name = newIndex Integer A = 0 B = (<array_Size> - 1)
	anim_name = (<Anims> [<newIndex>])
	if (<startwithnoblend> = 1)
		blend_time = 0.0
		startwithnoblend = 0
	elseif (<anim_speed> != <old_speed>)
		blend_time = $Crowd_BlendTime_TempoChange
	elseif (<skill> = Bad)
		blend_time = $Crowd_BlendTime_Bad
	elseif (<Anim> = Special)
		blend_time = $Crowd_BlendTime_Special
	elseif (<anim_speed> = SLOW)
		blend_time = $Crowd_BlendTime_Slow
	elseif (<anim_speed> = Med)
		blend_time = $Crowd_BlendTime_Med
	elseif (<anim_speed> = FAST)
		blend_time = $Crowd_BlendTime_Fast
	else
		blend_time = -1.0
	endif
	if ($display_crowd_anim_info = TRUE)
		Printf Channel = Crowd "%a playing %b anim (%c) with blendtime %d ..." A = <ObjID> B = <Anim> C = <anim_name> D = <blend_time>
	endif
	GameObj_PlayAnim Anim = <anim_name> BlendDuration = <blend_time> AnimEvents = ON
	GameObj_WaitAnimFinished
	old_speed = <anim_speed>
	repeat
endscript

script hero_strum_guitar \{note_length = 150}
	if (<note_length> < $short_strum_max_gem_length)
		anim_length = Short
	elseif (<note_length> < $med_strum_max_gem_length)
		anim_length = Med
	else
		anim_length = Long
	endif
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	Change StructureName = <info_struct> last_strum_length = <anim_length>
	strum_type = ($<info_struct>.Strum)
	ExtendCRC <strum_type> '_Strums' out = strum_anims
	if (($<info_struct>.playing_missed_note = FALSE) || ($always_strum = TRUE))
		GetArraySize (<strum_anims>.<anim_length>)
		GetRandomValue Name = newIndex Integer A = 0 B = (<array_Size> - 1)
		strum_anim = (<strum_anims>.<anim_length> [<newIndex>])
		hero_play_strum_anim Anim = <strum_anim> BlendDuration = 0.1
	endif
	hero_wait_until_anim_finished \{Timer = StrumTimer}
	hero_play_strum_anim Anim = (($<strum_anims>).no_strum_anim)
endscript

script hero_play_chord \{Chord = track_none}
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	finger_anims = ($<info_struct>.finger_anims)
	if StructureContains Structure = $<finger_anims> Name = <Chord>
		finger_anim = (<finger_anims>.<Chord>)
		if (<Chord> = NONE)
			blend_time = $finger_release_blend_time
		else
			blend_time = $finger_press_blend_time
		endif
	else
		finger_anim = (<finger_anims>.NONE)
		blend_time = $finger_release_blend_time
	endif
	if (<finger_anim> != NONE)
		hero_play_finger_anim Anim = <finger_anim> BlendDuration = <blend_time>
	endif
endscript

script find_profile 
	get_musician_profile_size
	if GotParam \{Name}
		GetLowerCaseString <Name>
		search_name = <LowerCaseString>
		found = 0
		Index = 0
		begin
		get_musician_profile_struct Index = <Index>
		GetLowerCaseString (<profile_struct>.Name)
		profile_name = <LowerCaseString>
		if (<profile_name> = <search_name>)
			found = 1
			break
		endif
		Index = (<Index> + 1)
		repeat <array_Size>
		return found = <found> Index = <Index>
	elseif GotParam \{body_id}
		found = 0
		Index = 0
		begin
		get_musician_profile_struct Index = <Index>
		Body = (<profile_struct>.musician_body)
		body_descid = (<Body>.desc_id)
		if (<body_id> = <body_descid>)
			found = 1
			break
		endif
		Index = (<Index> + 1)
		repeat <array_Size>
		return found = <found> Index = <Index>
	endif
endscript

script find_profile_by_id 
	get_musician_profile_size
	found = 0
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	next_name = (<profile_struct>.Name)
	FormatText ChecksumName = profile_id '%n' N = <next_name> AddToStringLookup = TRUE
	if (<profile_id> = <Id>)
		return TRUE Index = <Index>
		break
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	find_profile_by_id \{Id = Axel}
	return FALSE Index = <Index>
endscript

script get_waypoint_id \{Index = 0}
	GetPakManCurrent \{map = Zones}
	GetPakManCurrentName \{map = Zones}
	if (<Index> < 10)
		FormatText TextName = suffix '_TRG_Waypoint_0%a' A = <Index>
	else
		FormatText TextName = suffix '_TRG_Waypoint_%a' A = <Index>
	endif
	waypoint_name = (<pakname> + <suffix>)
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
endscript

script get_start_node_id \{Character = "guitarist"}
	player2_is_guitarist = FALSE
	if (($game_mode = p2_career) || ($game_mode = p2_coop))
		if NOT ($player1_status.part = GUITAR)
			player2_is_guitarist = TRUE
		endif
	endif
	art_deco_encore = FALSE
	GetPakManCurrent \{map = Zones}
	if (<pak> = Z_ArtDeco)
		if GetNodeFlag \{LS_ENCORE_POST}
			art_deco_encore = TRUE
		endif
	endif
	switch (<member>)
		case GUITARIST
		if ($current_num_players = 1)
			Character = "guitarist"
		else
			if (<player2_is_guitarist> = TRUE)
				if (<art_deco_encore> = TRUE)
					Character = "guitarist"
				else
					Character = "guitarist_player2"
				endif
			else
				Character = "guitarist_player1"
			endif
		endif
		case BASSIST
		if ($current_num_players = 1)
			Character = "bassist"
		else
			if (<player2_is_guitarist> = TRUE)
				Character = "guitarist_player1"
			else
				if (<art_deco_encore> = TRUE)
					Character = "guitarist"
				else
					Character = "guitarist_player2"
				endif
			endif
		endif
		case VOCALIST
		Character = "vocalist"
		case DRUMMER
		Character = "drummer"
		default
		Printf \{"Unknown character referenced in get_starting_position!"}
		Character = "unknown"
	endswitch
	if GetPakManCurrentName \{map = Zones}
		GetPakManCurrent \{map = Zones}
		FormatText TextName = suffix '_TRG_Waypoint_%a_start' A = <Character>
		waypoint_name = (<pakname> + <suffix>)
		AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
		return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
	else
		return \{waypoint_id = NONE
			waypoint_name = "NONE"}
	endif
endscript

script get_skill_level 
	health = ($player1_status.current_health)
	skill = Normal
	if (<health> < 0.66)
		skill = Bad
	elseif (<health> > 1.3299999)
		skill = GOOD
	endif
	return skill = <skill>
endscript

script get_target_node 
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	return target_node = ($<info_struct>.target_node)
endscript
BandMember_Idle_EventTable = [
	{
		Response = call_script
		Event = play_anim
		Scr = handle_play_anim
	}
	{
		Response = call_script
		Event = change_stance
		Scr = handle_change_stance
	}
]

script BandMember_Idle 
	ResetEventHandlersFromTable \{BandMember_Idle_EventTable
		Group = hand_events}
	Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
	Obj_SpawnScriptNow \{hero_play_adjusting_random_anims
		Params = {
			Anim = IDLE
		}}
	Block
endscript

script play_special_facial_anim 
	if NOT GotParam \{Anim}
		return
	endif
	Obj_KillSpawnedScript \{Name = facial_anim_loop}
	Obj_GetID
	if (<ObjID> = GUITARIST)
		Printf \{Channel = newdebug
			"playing special facial on guitarist......."}
	endif
	hero_play_facial_anim Anim = <Anim>
	hero_wait_until_anim_finished \{Timer = FacialTimer}
	if (<ObjID> = GUITARIST)
		Printf \{Channel = newdebug
			"done waiting for facial on guitarist......."}
	endif
	Obj_SpawnScriptNow \{facial_anim_loop}
endscript

script facial_anim_loop 
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	if NOT StructureContains Structure = $<anim_set> Name = facial_anims
		return
	endif
	if NOT StructureContains Structure = ($<anim_set>.facial_anims) Name = IDLE
		return
	endif
	begin
	Anim = ($<info_struct>.facial_anim)
	if NOT StructureContains Structure = ($<anim_set>.facial_anims) Name = <Anim>
		if ($display_facial_anim_info = TRUE)
			Printf Channel = facial "facial anims not defined for %a ... reverting to idle" A = <Anim>
		endif
		Anim = IDLE
	endif
	Anims = ($<anim_set>.facial_anims.<Anim>)
	GetArraySize <Anims>
	GetRandomValue Name = Index Integer A = 0 B = (<array_Size> - 1)
	anim_name = (<Anims> [<Index>])
	if ($display_facial_anim_info = TRUE)
		Printf Channel = facial "playing facial anim - %a (%b) ..." A = <Anim> B = <anim_name>
	endif
	Change StructureName = <info_struct> facial_anim = IDLE
	hero_play_facial_anim Anim = <anim_name>
	hero_wait_until_anim_finished \{Timer = FacialTimer}
	Wait \{1
		GameFrame}
	repeat
endscript
Guitarist_Idle_EventTable = [
	{
		Response = call_script
		Event = strum_guitar
		Scr = handle_strum_event
	}
	{
		Response = call_script
		Event = pose_fret
		Scr = handle_fret_event
	}
	{
		Response = call_script
		Event = pose_fingers
		Scr = handle_finger_event
	}
	{
		Response = call_script
		Event = Anim_MissedNote
		Scr = handle_missed_note
	}
	{
		Response = call_script
		Event = Anim_HitNote
		Scr = handle_hit_note
	}
	{
		Response = call_script
		Event = play_anim
		Scr = handle_play_anim
	}
	{
		Response = call_script
		Event = play_battle_anim
		Scr = handle_play_anim
	}
	{
		Response = call_script
		Event = change_stance
		Scr = handle_change_stance
	}
	{
		Response = call_script
		Event = WALK
		Scr = handle_walking
	}
]

script guitarist_idle 
	ResetEventHandlersFromTable \{Guitarist_Idle_EventTable
		Group = hand_events}
	Obj_GetID
	if (($player1_status.band_Member) = <ObjID>)
		SetEventHandler \{Response = call_script
			Event = star_power_onp1
			Scr = handle_star_power
			Group = hand_events}
	else (($player2_status.band_Member) = <ObjID>)
		SetEventHandler \{Response = call_script
			Event = star_power_onp2
			Scr = handle_star_power
			Group = hand_events}
	endif
	Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
	Obj_SpawnScriptNow \{hero_play_adjusting_random_anims
		Params = {
			Anim = IDLE
			blend_time = 0.2
			CYCLE
		}}
	Block
endscript

script guitarist_idle_animpreview 
	ClearEventHandlerGroup \{hand_events}
endscript
Guitarist_Walking_EventTable = [
	{
		Response = call_script
		Event = strum_guitar
		Scr = handle_strum_event
	}
	{
		Response = call_script
		Event = pose_fret
		Scr = handle_fret_event
	}
	{
		Response = call_script
		Event = pose_fingers
		Scr = handle_finger_event
	}
	{
		Response = call_script
		Event = Anim_MissedNote
		Scr = handle_missed_note
	}
	{
		Response = call_script
		Event = Anim_HitNote
		Scr = handle_hit_note
	}
	{
		Response = call_script
		Event = change_stance
		Scr = queue_change_stance
	}
]

script guitarist_walking 
	ResetEventHandlersFromTable \{Guitarist_Walking_EventTable
		Group = hand_events}
	Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
	SpawnScriptNow \{start_walk_camera}
	walk_to_waypoint <...>
	SpawnScriptNow \{Kill_Walk_Camera}
	Obj_SwitchScript \{guitarist_idle}
endscript

script play_special_anim \{stance = Stance_A
		disable_arms = 2
		BlendDuration = 0.2}
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	ClearEventHandlerGroup \{hand_events}
	if GotParam \{respond_to_hand_events}
		ResetEventHandlersFromTable \{Guitarist_Walking_EventTable
			Group = hand_events}
	else
		SetEventHandler \{Response = call_script
			Event = change_stance
			Scr = queue_change_stance
			Group = hand_events}
	endif
	Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
	if GotParam \{Wait}
		hero_wait_until_anim_finished
	endif
	if (<disable_arms> = 0)
		if (<info_struct>.arms_disabled = 2)
			hero_toggle_arms \{prev_num_arms = 0
				num_arms = 2}
			Change StructureName = <info_struct> arms_disabled = 0
			Change StructureName = <info_struct> disable_arms = 0
			Change StructureName = <info_struct> next_anim_disable_arms = 0
			Change StructureName = <info_struct> current_anim = IDLE
			Change StructureName = <info_struct> cycle_anim = IDLE
			Change StructureName = <info_struct> next_anim = IDLE
			Change StructureName = <info_struct> cycle_next_anim = TRUE
		endif
	endif
	if (<disable_arms> = 2)
		if (<ObjID> = GUITARIST || <ObjID> = BASSIST || <ObjID> = DRUMMER)
			hero_disable_arms \{blend_time = 0.0}
		endif
	endif
	Change StructureName = <info_struct> stance = <stance>
	if hero_play_tempo_anim_cfunc Anim = <Anim> BlendDuration = <BlendDuration>
		hero_play_anim Anim = <anim_to_run> BlendDuration = <Blend_Duration> UseMotionExtraction = <use_motion_extraction>
	endif
	if (<stance> = WIN || <stance> = Win_SmStg || <stance> = LOSE || <stance> = Lose_SmStg || <Anim> = STARPOWER)
		Ragdoll_MarkForReset
	endif
	if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
		if (<disable_arms> = 2)
			hero_wait_until_anim_near_end \{time_from_end = 0.25}
			hero_enable_arms \{blend_time = 0.25}
		endif
	endif
	hero_wait_until_anim_finished
	Change StructureName = <info_struct> stance = Stance_A
	if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
		Obj_SwitchScript \{guitarist_idle}
	else
		Obj_SwitchScript \{BandMember_Idle}
	endif
endscript

script play_simple_anim \{disable_arms = 2
		BlendDuration = 0.0}
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	ClearEventHandlerGroup \{hand_events}
	Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
	if (<disable_arms> = 2)
		if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
			hero_disable_arms blend_time = <BlendDuration>
		endif
	endif
	hero_play_anim Anim = <Anim> BlendDuration = <BlendDuration>
	if (BlendDuration = 0.0)
		Ragdoll_MarkForReset
	endif
	if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
		hero_wait_until_anim_near_end \{time_from_end = 0.25}
		hero_enable_arms \{blend_time = 0.25}
	endif
	hero_wait_until_anim_finished
	handle_change_stance \{stance = Stance_A
		No_wait}
	if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
		Obj_SwitchScript \{guitarist_idle}
	else
		Obj_SwitchScript \{BandMember_Idle}
	endif
endscript

script handle_star_power 
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	Change StructureName = <info_struct> waiting_for_cameracut = TRUE
	begin
	if ($<info_struct>.waiting_for_cameracut = FALSE)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	Obj_SwitchScript \{play_special_anim
		Params = {
			stance = Stance_A
			Anim = STARPOWER
			BlendDuration = 0.0
			disable_arms = 0
			respond_to_hand_events = 1
		}}
endscript

script handle_song_won 
	Obj_KillSpawnedScript \{Name = handle_star_power}
	Printf \{Channel = AnimInfo
		"handle song won............"}
	Obj_SwitchScript \{play_special_anim
		Params = {
			stance = WIN
			Anim = IDLE
			kill_transitions_when_done
		}}
endscript

script handle_song_failed 
	Obj_KillSpawnedScript \{Name = handle_star_power}
	Printf \{Channel = AnimInfo
		"handle song failed........."}
	Obj_SwitchScript \{play_special_anim
		Params = {
			stance = LOSE
			Anim = IDLE
			kill_transitions_when_done
		}}
endscript

script play_intro_anims 
	Printf \{Channel = AnimInfo
		"play_intro_anims............."}
	intro_stance = INTRO
	if (UseSmallVenueAnims)
		Printf \{Channel = AnimInfo
			"Using small venue anims! ............"}
		intro_stance = Intro_SmStg
	endif
	play_guitarist_intro = TRUE
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_ArtDeco
		if GetNodeFlag \{LS_ENCORE_POST}
			play_guitarist_intro = FALSE
		endif
	endswitch
	if (<play_guitarist_intro> = TRUE)
		Band_ChangeStance Name = GUITARIST stance = <intro_stance> No_wait
		Band_ChangeStance Name = BASSIST stance = <intro_stance> No_wait
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			Band_ChangeStance Name = ($player1_status.band_Member) stance = <intro_stance> No_wait
			Band_ChangeStance Name = ($player2_status.band_Member) stance = Stance_A No_wait
		else
			Band_ChangeStance \{Name = GUITARIST
				stance = Stance_A
				No_wait}
			Band_ChangeStance Name = BASSIST stance = <intro_stance> No_wait
		endif
	endif
	Band_ChangeStance Name = VOCALIST stance = <intro_stance> No_wait
	Band_ChangeStance \{Name = DRUMMER
		stance = INTRO
		No_wait}
	Band_ChangeStance \{Name = GUITARIST
		stance = Stance_A}
	Band_ChangeStance \{Name = BASSIST
		stance = Stance_A}
	Band_ChangeStance \{Name = VOCALIST
		stance = Stance_A}
	Band_ChangeStance \{Name = DRUMMER
		stance = Stance_A}
endscript

script UseSmallVenueAnims 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Party
		return_val = TRUE
		case Z_Dive
		return_val = TRUE
		case Z_Video
		return_val = TRUE
		case Z_Prison
		return_val = TRUE
		case Z_Hell
		return_val = TRUE
		case Z_ArtDeco
		if GetNodeFlag \{LS_ENCORE_POST}
			return \{TRUE}
		endif
		default
		return_val = FALSE
	endswitch
	return <return_val>
endscript

script play_win_anims 
	if ($disable_band = 1)
		return
	endif
	if ($game_mode = Tutorial)
		return
	endif
	Printf \{Channel = AnimInfo
		"play_win_anims............."}
	win_stance = WIN
	lose_stance = LOSE
	if (UseSmallVenueAnims)
		Printf \{Channel = AnimInfo
			"Using small venue anims! ............"}
		win_stance = Win_SmStg
		lose_stance = Lose_SmStg
	endif
	if ((($current_num_players = 1) && ($boss_battle = 0)) || ($game_mode = p2_coop) || ($game_mode = p2_career))
		if CompositeObjectExists \{Name = GUITARIST}
			GUITARIST :Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = IDLE kill_transitions_when_done BlendDuration = 0.0}
		endif
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = IDLE kill_transitions_when_done BlendDuration = 0.0}
		endif
	else
		if ($boss_battle = 1)
			GUITARIST :Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = IDLE kill_transitions_when_done BlendDuration = 0.0}
			BASSIST :Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = IDLE kill_transitions_when_done BlendDuration = 0.0}
		else
			p1_won = TRUE
			if ($game_mode = p2_battle)
				if (($player2_status.current_health) > ($player1_status.current_health))
					p1_won = FALSE
				endif
			else
				if (($player2_status.Score) > ($player1_status.Score))
					p1_won = FALSE
				endif
			endif
			if (<p1_won> = TRUE)
				($player1_status.band_Member) :Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = IDLE BlendDuration = 0.0}
				($player2_status.band_Member) :Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = IDLE BlendDuration = 0.0}
			else
				($player2_status.band_Member) :Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = IDLE BlendDuration = 0.0}
				($player1_status.band_Member) :Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = IDLE BlendDuration = 0.0}
			endif
		endif
	endif
	if CompositeObjectExists \{Name = DRUMMER}
		Change \{StructureName = drummer_info
			desired_twist = 0.0}
		Change \{StructureName = drummer_info
			last_left_arm_note = 0}
		Change \{StructureName = drummer_info
			last_right_arm_note = 0}
		DRUMMER :Obj_SwitchScript \{play_special_anim
			Params = {
				stance = WIN
				Anim = IDLE
				BlendDuration = 0.0
			}}
	endif
	if CompositeObjectExists \{Name = VOCALIST}
		VOCALIST :Obj_SwitchScript \{play_special_anim
			Params = {
				stance = WIN
				Anim = IDLE
				BlendDuration = 0.0
			}}
	endif
	restore_idle_faces
endscript

script play_lose_anims 
	Printf \{Channel = newdebug
		"play_lose_anims............"}
	if ($disable_band = 1)
		return
	endif
	win_stance = WIN
	lose_stance = LOSE
	if (UseSmallVenueAnims)
		Printf \{Channel = AnimInfo
			"Using small venue anims! ............"}
		win_stance = Win_SmStg
		lose_stance = Lose_SmStg
	endif
	if ((($current_num_players = 1) && ($boss_battle = 0)) || ($game_mode = p2_coop) || ($game_mode = p2_career))
		GUITARIST :Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = IDLE BlendDuration = 0.0}
		BASSIST :Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = IDLE BlendDuration = 0.0}
	else
		if ($boss_battle = 1)
			GUITARIST :Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = IDLE BlendDuration = 0.0}
			BASSIST :Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = IDLE BlendDuration = 0.0}
		else
			Printf \{Channel = newdebug
				"not bossbattle......"}
			p1_won = TRUE
			if ($game_mode = p2_battle)
				if (($player2_status.current_health) > ($player1_status.current_health))
					p1_won = FALSE
				endif
			else
				if (($player2_status.Score) > ($player1_status.Score))
					p1_won = FALSE
				endif
			endif
			if (<p1_won> = TRUE)
				($player1_status.band_Member) :Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = IDLE BlendDuration = 0.0}
				($player2_status.band_Member) :Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = IDLE BlendDuration = 0.0}
			else
				($player2_status.band_Member) :Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = IDLE BlendDuration = 0.0}
				($player1_status.band_Member) :Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = IDLE BlendDuration = 0.0}
			endif
		endif
	endif
	if CompositeObjectExists \{Name = DRUMMER}
		Change \{StructureName = drummer_info
			last_left_arm_note = 0}
		Change \{StructureName = drummer_info
			last_right_arm_note = 0}
		Change \{StructureName = drummer_info
			desired_twist = 0.0}
		DRUMMER :Obj_SwitchScript \{play_special_anim
			Params = {
				stance = LOSE
				Anim = IDLE
				BlendDuration = 0.0
			}}
	endif
	if CompositeObjectExists \{Name = VOCALIST}
		VOCALIST :Obj_SwitchScript \{play_special_anim
			Params = {
				stance = LOSE
				Anim = IDLE
				BlendDuration = 0.0
			}}
	endif
	restore_idle_faces
endscript

script restore_idle_faces 
	if CompositeObjectExists \{Name = GUITARIST}
		GUITARIST :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		GUITARIST :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		BASSIST :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{Name = VOCALIST}
		VOCALIST :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		VOCALIST :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{Name = DRUMMER}
		DRUMMER :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		DRUMMER :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
endscript

script Hide_Band 
	if CompositeObjectExists \{GUITARIST}
		GUITARIST :Hide
	endif
	if CompositeObjectExists \{BASSIST}
		BASSIST :Hide
	endif
	if CompositeObjectExists \{VOCALIST}
		VOCALIST :Hide
	endif
	if CompositeObjectExists \{DRUMMER}
		DRUMMER :Hide
	endif
endscript

script UnHide_Band 
	if CompositeObjectExists \{GUITARIST}
		GUITARIST :UnHide
	endif
	if CompositeObjectExists \{BASSIST}
		BASSIST :UnHide
	endif
	if CompositeObjectExists \{VOCALIST}
		VOCALIST :UnHide
	endif
	if CompositeObjectExists \{DRUMMER}
		DRUMMER :UnHide
	endif
endscript
using_walk_camera = FALSE

script start_walk_camera 
	if ($using_walk_camera = TRUE || $using_starpower_camera = TRUE || $game_mode = training)
		return
	endif
	Change \{using_walk_camera = TRUE}
	Change \{CameraCuts_AllowNoteScripts = FALSE}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_walk'
		changetime = $max_walk_camera_cut_delay}
	Wait \{7
		Seconds}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	Change \{CameraCuts_AllowNoteScripts = TRUE}
	Change \{using_walk_camera = FALSE}
endscript

script Kill_Walk_Camera \{changecamera = 1}
	if ($using_walk_camera = FALSE || $game_mode = training)
		return
	endif
	KillSpawnedScript \{Name = start_walk_camera}
	if (<changecamera> = 1)
		CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	endif
	Change \{CameraCuts_AllowNoteScripts = TRUE}
	Change \{using_walk_camera = FALSE}
endscript
