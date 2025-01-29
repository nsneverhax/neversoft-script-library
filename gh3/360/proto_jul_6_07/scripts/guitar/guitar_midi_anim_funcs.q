
script band_playsimpleanim \{name = guitarist}
	if NOT compositeobjectexists name = <name>
		return
	endif
	if NOT gotparam \{anim}
		return
	endif
	<name> :obj_killspawnedscript name = play_simple_anim
	<name> :obj_spawnscriptnow play_simple_anim params = {anim = <anim>}
endscript

script band_playanim \{name = guitarist
		anim = idle}
	if NOT compositeobjectexists name = <name>
		return
	endif
	launchevent type = play_anim target = <name> data = {<...>}
endscript

script band_playidle \{name = guitarist}
	band_playanim name = <name> anim = idle cycle
endscript

script band_playfacialanim \{name = guitarist}
	if compositeobjectexists name = <name>
		<name> :obj_killspawnedscript name = hero_play_facial_anim
		<name> :obj_spawnscriptnow hero_play_facial_anim params = {anim = <anim>}
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
		stance = stance_a}
	if NOT compositeobjectexists name = <name>
		return
	endif
	launchevent type = change_stance target = <name> data = {<...>}
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
	<name> :hero_enable_arms blend_time = <blend_time>
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> arms_disabled = false
	change structurename = <info_struct> disable_arms = false
endscript

script band_disablearms \{name = guitarist
		blend_time = 0.25}
	if NOT compositeobjectexists name = <name>
		return
	endif
	<name> :hero_disable_arms blend_time = <blend_time>
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> arms_disabled = true
	change structurename = <info_struct> disable_arms = true
endscript

script band_setposition 
	if NOT compositeobjectexists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	char_name = <name>
	if gotparam index
		get_waypoint_id index = <index>
		getwaypointpos name = <waypoint_id>
		change structurename = <info_struct> target_node = <waypoint_id>
	elseif gotparam node
		getwaypointpos name = <node>
		change structurename = <info_struct> target_node = <node>
	endif
	<char_name> :obj_setposition position = <pos>
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
		faceaudience = true}
	if NOT compositeobjectexists name = <name>
		return
	endif
	if ($current_num_players = 2)
		return
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
