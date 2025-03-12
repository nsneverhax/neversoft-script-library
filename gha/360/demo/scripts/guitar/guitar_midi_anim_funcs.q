
script band_playsimpleanim \{name = guitarist
		allow_in_2player = false}
	if ($current_num_players = 2)
		if (<allow_in_2player> = false)
			return
		endif
	endif
	if NOT compositeobjectexists name = <name>
		return
	endif
	if NOT gotparam \{anim}
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> playing_special_anim = true
	<name> :obj_switchscript play_simple_anim params = {<...>}
	if gotparam \{blendduration}
		if (<blendduration> < 0.001)
			<name> :obj_setposition
		endif
	endif
endscript

script band_playanim \{name = guitarist
		anim = idle}
	if NOT compositeobjectexists name = <name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<name> = guitarist)
			if compositeobjectexists \{name = bassist}
				launchevent type = play_anim target = bassist data = {<...>}
			endif
		elseif (<name> = bassist)
			return
		endif
	endif
	launchevent type = play_anim target = <name> data = {<...>}
endscript

script band_playidle \{name = guitarist}
	band_playanim name = <name> anim = idle cycle
endscript

script band_playfacialanim \{name = guitarist}
	if ($current_num_players = 2)
		return
	endif
	if compositeobjectexists name = <name>
		<name> :obj_killspawnedscript name = play_special_facial_anim
		<name> :obj_spawnscriptnow play_special_facial_anim params = {anim = <anim>}
	endif
endscript

script band_setstrumstyle \{name = guitarist
		style = long}
	if NOT compositeobjectexists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> strum = <style>
endscript

script band_changestance \{name = guitarist
		stance = stance_a
		allow_in_2player = true}
	if NOT compositeobjectexists name = <name>
		return
	endif
	if ($current_num_players = 2)
		if (<allow_in_2player> = false)
			return
		endif
		if (<stance> = stance_d)
			stance = stance_a
		endif
	endif
	if bassist_should_use_guitarist_commands
		if (<name> = guitarist)
			if compositeobjectexists \{name = bassist}
				launchevent type = change_stance target = bassist data = {<...>}
			endif
		elseif (<name> = bassist)
			return
		endif
	endif
	launchevent type = change_stance target = <name> data = {<...>}
endscript

script band_forcetostance \{stance = stance_a}
	if NOT compositeobjectexists name = <name>
		return
	endif
	<name> :handle_change_stance stance = <stance> no_wait
endscript

script band_stopstrumming \{name = guitarist}
	if NOT compositeobjectexists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> strum = none
endscript

script band_enablearms \{name = guitarist
		blend_time = 0.25}
	if NOT compositeobjectexists name = <name>
		return
	endif
	if (<name> = guitarist || <name> = bassist)
		<name> :hero_toggle_arms num_arms = 2 pre_num_arms = 0 blend_time = <blend_time>
	else
		<name> :hero_enable_arms blend_time = <blend_time>
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> arms_disabled = 0
	change structurename = <info_struct> disable_arms = 0
endscript

script band_disablearms \{name = guitarist
		blend_time = 0.25}
	if NOT compositeobjectexists name = <name>
		return
	endif
	if (<name> = guitarist || <name> = bassist || <name> = rhythm)
		<name> :hero_toggle_arms num_arms = 0 pre_num_arms = 2 blend_time = <blend_time>
	else
		<name> :hero_disable_arms blend_time = <blend_time>
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> arms_disabled = 2
	change structurename = <info_struct> disable_arms = 2
endscript

script band_setposition \{allow_in_2player = false}
	if ($current_num_players = 2)
		if (<allow_in_2player> = false)
			return
		endif
	endif
	if NOT compositeobjectexists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	char_name = <name>
	if gotparam \{index}
		get_waypoint_id index = <index>
		getwaypointpos name = <waypoint_id>
		change structurename = <info_struct> target_node = <waypoint_id>
	elseif gotparam \{node}
		getwaypointpos name = <node>
		change structurename = <info_struct> target_node = <node>
	endif
	<char_name> :obj_setposition position = <pos>
endscript

script band_movetonode \{allow_in_2player = false}
	if ($game_mode = training)
		return
	endif
	if ($current_num_players = 2)
		if (<allow_in_2player> = false)
			return
		endif
	endif
	if NOT compositeobjectexists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	char_name = <name>
	getpakmancurrent \{map = zones}
	getpakmancurrentname \{map = zones}
	formattext textname = suffix '_TRG_Waypoint_%a' a = <node>
	appendsuffixtochecksum base = <pak> suffixstring = <suffix>
	waypoint_id = <appended_id>
	if gotparam \{node}
		getwaypointpos name = <appended_id>
		getwaypointdir name = <appended_id>
		change structurename = <info_struct> target_node = <appended_id>
	else
		printf \{"Missing parameter 'node' in call to Band_MoveToNode"}
		return
	endif
	<char_name> :obj_setposition position = <pos>
	<char_name> :obj_setorientation dir = <dir>
endscript

script band_movetostartnode \{allow_in_2player = false}
	if ($current_num_players = 2)
		if (<allow_in_2player> = false)
			return
		endif
	endif
	if NOT compositeobjectexists name = <name>
		return
	endif
	get_start_node_id member = <name>
	getwaypointpos name = <waypoint_id>
	getwaypointdir name = <waypoint_id>
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> target_node = <waypoint_id>
	<name> :obj_setposition position = <pos>
	<name> :obj_setorientation dir = <dir>
endscript

script band_disablemovement 
	if NOT compositeobjectexists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> allow_movement = false
endscript

script band_enablemovement 
	if NOT compositeobjectexists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> allow_movement = true
endscript

script band_walktonode \{name = guitarist
		faceaudience = true
		allow_in_2player = false}
	if NOT compositeobjectexists name = <name>
		return
	endif
	if ($current_num_players = 2)
		if (<allow_in_2player> = false)
			return
		endif
	endif
	getpakmancurrent \{map = zones}
	getpakmancurrentname \{map = zones}
	formattext \{textname = suffix
		'_TRG_Waypoint_Guitarist_Walk01'}
	appendsuffixtochecksum base = <pak> suffixstring = <suffix>
	waypoint_id = <appended_id>
	if NOT doeswaypointexist name = <waypoint_id>
		return
	endif
	if checksumequals a = <name> b = guitarist
		if localizedstringequals a = <node> b = "guitarist_start"
			spawnscriptlater \{lightshow_waitandenablespotlights
				params = {
					enable = false
					time = 4.0
				}}
		else
			spawnscriptlater \{lightshow_waitandenablespotlights
				params = {
					enable = true
					time = 1.5
				}}
		endif
	endif
	launchevent type = walk target = <name> data = {<...> anim_set = $normal_walk_data}
endscript

script band_turntoface \{name = guitarist
		node = 1}
	if NOT compositeobjectexists name = <name>
		return
	endif
	get_waypoint_id index = <node>
	getwaypointpos name = <waypoint_id>
	<name> :turn_to_face pos = <pos>
endscript

script band_rotatetofacenode \{name = guitarist
		node = 1}
	if NOT compositeobjectexists name = <name>
		return
	endif
	get_waypoint_id index = <node>
	getwaypointpos name = <waypoint_id>
	<name> :turn_to_face pos = <pos>
endscript

script band_facenode \{name = guitarist
		node = 1}
	if NOT compositeobjectexists name = <name>
		return
	endif
	get_waypoint_id index = <node>
	getwaypointpos name = <waypoint_id>
	<name> :turn_to_face pos = <pos>
endscript

script band_faceaudience \{name = guitarist}
	if NOT compositeobjectexists name = <name>
		return
	endif
	<name> :face_audience
endscript

script band_playattackanim 
	if NOT compositeobjectexists name = <name>
		return
	endif
	attack_type = ($battlemode_powerups [<type>].name)
	if (($player1_status.band_member) = <name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT structurecontains structure = $<battle_anims> name = <attack_type>
		return
	endif
	anim = ($<battle_anims>.<attack_type>.attack_anim)
	if NOT (<anim> = none)
		launchevent type = play_battle_anim target = <name> data = {<...> no_wait}
	endif
endscript

script band_playresponseanim 
	if NOT compositeobjectexists name = <name>
		return
	endif
	attack_type = ($battlemode_powerups [<type>].name)
	if (($player1_status.band_member) = <name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT structurecontains structure = $<battle_anims> name = <attack_type>
		return
	endif
	anim = ($<battle_anims>.<attack_type>.response_anim)
	if NOT (<anim> = none)
		launchevent type = play_battle_anim target = <name> data = {<...>}
	endif
endscript

script bassist_should_use_guitarist_commands 
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		if ($boss_battle = 0)
			return \{true}
		endif
	endif
	return \{false}
endscript
