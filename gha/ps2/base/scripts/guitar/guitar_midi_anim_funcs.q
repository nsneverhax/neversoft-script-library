
script Band_PlaySimpleAnim \{Name = GUITARIST
		allow_in_2player = FALSE}
	if ($current_num_players = 2)
		if (<allow_in_2player> = FALSE)
			return
		endif
	endif
	if NOT Anim_AnimExists anim = <anim>
		return
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if NOT GotParam \{anim}
		return
	endif
	<Name> :Obj_SwitchScript play_simple_anim params = {<...>}
endscript

script Band_PlayAnim \{Name = GUITARIST
		anim = Idle}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<Name> = GUITARIST)
			if CompositeObjectExists \{Name = BASSIST}
				LaunchEvent Type = play_anim target = BASSIST data = {<...>}
			endif
		elseif (<Name> = BASSIST)
			return
		endif
	endif
	LaunchEvent Type = play_anim target = <Name> data = {<...>}
endscript

script Band_PlayIdle \{Name = GUITARIST}
	Band_PlayAnim Name = <Name> anim = Idle cycle
endscript

script Band_PlayFacialAnim \{Name = GUITARIST}
	if (<Name> = GUITARIST)
		get_song_struct song = ($current_song)
		if StructureContains structure = <song_struct> Name = Band
			Band = (<song_struct>.Band)
		else
			Band = default_band
		endif
		if StructureContains structure = ($<Band>) Name = allow_player_selected_guitarist

			return
		endif
	endif
	if ($current_num_players = 2)
		return
	endif
	if CompositeObjectExists Name = <Name>
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = <anim>}
	endif
endscript

script Band_SetStrumStyle \{Name = GUITARIST
		style = long}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> strum = <style>
endscript

script Band_ChangeStance \{Name = GUITARIST
		stance = Stance_A
		allow_in_2player = true}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if ($current_num_players = 2)
		if (<allow_in_2player> = FALSE)
			return
		endif
		if (<stance> = stance_d)
			stance = Stance_A
		endif
	endif
	if bassist_should_use_guitarist_commands
		if (<Name> = GUITARIST)
			if CompositeObjectExists \{Name = BASSIST}
				LaunchEvent Type = change_stance target = BASSIST data = {<...>}
			endif
		elseif (<Name> = BASSIST)
			return
		endif
	endif
	LaunchEvent Type = change_stance target = <Name> data = {<...>}
endscript

script band_forcetostance \{stance = Stance_A}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :handle_change_stance stance = <stance> no_wait
endscript

script Band_StopStrumming \{Name = GUITARIST}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> strum = None
endscript

script Band_EnableArms \{Name = GUITARIST
		blend_time = 0.25}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if (<Name> = GUITARIST || <Name> = BASSIST)
		<Name> :hero_toggle_arms num_arms = 2 pre_num_arms = 0 blend_time = <blend_time>
	else
		<Name> :hero_enable_arms blend_time = <blend_time>
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> arms_disabled = 0
	Change structurename = <info_struct> disable_arms = 0
endscript

script Band_DisableArms \{Name = GUITARIST
		blend_time = 0.25}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if (<Name> = GUITARIST || <Name> = BASSIST || <Name> = rhythm)
		<Name> :hero_toggle_arms num_arms = 0 pre_num_arms = 2 blend_time = <blend_time>
	else
		<Name> :hero_disable_arms blend_time = <blend_time>
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> arms_disabled = 2
	Change structurename = <info_struct> disable_arms = 2
endscript

script Band_SetPosition \{allow_in_2player = FALSE}
	if ($current_num_players = 2)
		if (<allow_in_2player> = FALSE)
			return
		endif
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	char_name = <Name>
	if GotParam \{index}
		get_waypoint_id index = <index>
		GetWaypointPos Name = <waypoint_id>
		Change structurename = <info_struct> target_node = <waypoint_id>
	elseif GotParam \{node}
		GetWaypointPos Name = <node>
		Change structurename = <info_struct> target_node = <node>
	endif
	<char_name> :Obj_SetPosition position = <Pos>
endscript

script band_movetonode \{allow_in_2player = FALSE}
	if ($game_mode = training)
		return
	endif
	if ($current_num_players = 2)
		if (<allow_in_2player> = FALSE)
			return
		endif
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	char_name = <Name>
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	formatText TextName = suffix '_TRG_Waypoint_%a' a = <node>
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	waypoint_id = <appended_id>
	if GotParam \{node}
		GetWaypointPos Name = <appended_id>
		GetWaypointDir Name = <appended_id>
		Change structurename = <info_struct> target_node = <appended_id>
	else

		return
	endif
	<char_name> :Obj_SetPosition position = <Pos>
	<char_name> :Obj_SetOrientation Dir = <Dir>
endscript

script band_movetostartnode \{allow_in_2player = FALSE}
	if ($current_num_players = 2)
		if (<allow_in_2player> = FALSE)
			return
		endif
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	get_start_node_id member = <Name>
	GetWaypointPos Name = <waypoint_id>
	GetWaypointDir Name = <waypoint_id>
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> target_node = <waypoint_id>
	<Name> :Obj_SetPosition position = <Pos>
	<Name> :Obj_SetOrientation Dir = <Dir>
endscript

script Band_DisableMovement 
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> allow_movement = FALSE
endscript

script Band_EnableMovement 
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> allow_movement = true
endscript

script Band_WalkToNode \{Name = GUITARIST
		faceAudience = true
		allow_in_2player = FALSE}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if ($current_num_players = 2)
		if (<allow_in_2player> = FALSE)
			return
		endif
	endif
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	formatText \{TextName = suffix
		'_TRG_Waypoint_Guitarist_Walk01'}
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	waypoint_id = <appended_id>
	if NOT DoesWaypointExist Name = <waypoint_id>
		return
	endif
	if checksumequals a = <Name> b = GUITARIST
		if LocalizedStringEquals a = <node> b = 'guitarist_start'
			SpawnScriptLater \{LightShow_WaitAndEnableSpotlights
				params = {
					enable = FALSE
					time = 4.0
				}}
		else
			SpawnScriptLater \{LightShow_WaitAndEnableSpotlights
				params = {
					enable = true
					time = 1.5
				}}
		endif
	endif
	LaunchEvent Type = walk target = <Name> data = {<...> anim_set = $normal_walk_data}
endscript

script Band_TurnToFace \{Name = GUITARIST
		node = 1}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	get_waypoint_id index = <node>
	GetWaypointPos Name = <waypoint_id>
	<Name> :turn_to_face Pos = <Pos>
endscript

script Band_RotateToFaceNode \{Name = GUITARIST
		node = 1}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	get_waypoint_id index = <node>
	GetWaypointPos Name = <waypoint_id>
	<Name> :turn_to_face Pos = <Pos>
endscript

script Band_FaceNode \{Name = GUITARIST
		node = 1}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	get_waypoint_id index = <node>
	GetWaypointPos Name = <waypoint_id>
	<Name> :turn_to_face Pos = <Pos>
endscript

script Band_FaceAudience \{Name = GUITARIST}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :face_audience
endscript

script Band_PlayAttackAnim 
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	attack_type = ($battlemode_powerups [<Type>].Name)
	if (($player1_status.band_member) = <Name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <Name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT StructureContains structure = $<battle_anims> Name = <attack_type>
		return
	endif
	anim = ($<battle_anims>.<attack_type>.attack_anim)
	if NOT (<anim> = None)
		LaunchEvent Type = play_battle_anim target = <Name> data = {<...> no_wait}
	endif
endscript

script Band_PlayResponseAnim 
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	attack_type = ($battlemode_powerups [<Type>].Name)
	if (($player1_status.band_member) = <Name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <Name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT StructureContains structure = $<battle_anims> Name = <attack_type>
		return
	endif
	anim = ($<battle_anims>.<attack_type>.response_anim)
	if NOT (<anim> = None)
		LaunchEvent Type = play_battle_anim target = <Name> data = {<...>}
	endif
endscript

script bassist_should_use_guitarist_commands 
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		if ($boss_battle = 0)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript
