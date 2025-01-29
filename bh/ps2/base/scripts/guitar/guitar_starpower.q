
script star_power_reset 
	Change structurename = <player_status> star_power_amount = 0.0
	Change structurename = <player_status> star_power_sequence = 0
	Change structurename = <player_status> star_power_note_count = 0
	Change structurename = <player_status> star_power_used = 0
	Change structurename = <player_status> current_star_array_entry = 0
endscript
star_power_ready_on_p1 = 0
star_power_ready_on_p2 = 0

script show_star_power_ready 
	if ($Cheat_PerformanceMode = 1)
		return
	endif
	if ScreenElementExists \{id = hud_root}
		gamemode_gettype
		if (<Type> = practice)
			return
		endif
		if gamemode_isbandscoring
			hud_create_message \{Band
				text = qs(0x8ba36464)
				Priority = 2}
		elseif (($<player_status>.star_power_used) = 0)
			if ($<player_status>.part = vocals)
				vocals_message Player = ($<player_status>.Player) text = qs(0x8ba36464) rgba = [128 240 240 255]
			else
				if (($<player_status>.hud_parent) = alias_g1)
					highway_num = 1
				elseif (($<player_status>.hud_parent) = alias_g2)
					highway_num = 2
				elseif (($<player_status>.hud_parent) = alias_g3)
					highway_num = 3
				endif
				hud_create_message {
					Player = ($<player_status>.Player)
					text = qs(0x8ba36464)
					style_script = hud_message_flame_style_starpower_ready
					style_script_params = {highway_num = <highway_num>}
					Priority = 2
				}
			endif
		endif
		return
	endif
	if ($game_mode = p2_quickplay)
		<player_status> = player1_status
	endif
	if isSinglePlayerGame
		if NOT ($is_attract_mode = 1)
			SoundEvent \{event = star_power_available_gh4}
		endif
	else
		if NOT ($is_attract_mode = 1)
			SpawnScriptNow star_power_ready_sfx_multiplayer params = {Player = ($<player_status>.Player)}
		endif
	endif
	SpawnScriptNow rock_meter_star_power_on params = {player_status = <player_status>}
	formatText checksumName = player_container 'HUD_Note_Streak_Combo%d' d = ($<player_status>.Player)
	begin
	if NOT ScreenElementExists id = <player_container>
		break
	endif
	WaitOneGameFrame
	repeat
	if ($<player_status>.star_power_used = 1)
		return
	endif
	if ($<player_status>.Player = 1)
		if ($star_power_ready_on_p1 = 1)
			return
		else
			Change \{star_power_ready_on_p1 = 1}
		endif
	else
		if ($star_power_ready_on_p2 = 1)
			return
		else
			Change \{star_power_ready_on_p2 = 1}
		endif
	endif
	ExtendCrc star_power_ready_text ($<player_status>.text) out = id
	if ($game_mode = p2_pro_faceoff)
		if ($<player_status>.Player = 1)
			original_pos = (($hud_screen_elements [0].Pos) - (225.0, 50.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) + (225.0, -50.0))
		endif
		base_scale = 0.8
		scale_big_mult = 1.2
	else
		if ($game_mode = gh4_p2_career || $game_mode = p2_quickplay)
			original_pos = (($hud_screen_elements [0].Pos) - (0.0, 60.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) - (0.0, 20.0))
		endif
		base_scale = 1.2
		scale_big_mult = 1.5
	endif
	if ScreenElementExists id = <id>
		<id> :legacydomorph Pos = <original_pos> Scale = 4 rgba = [190 225 255 250] alpha = 0 rot_angle = 3
	endif
	if ScreenElementExists id = <id>
		<id> :legacydomorph Pos = <original_pos> Scale = <base_scale> alpha = 1 time = 0.3 rot_angle = -3 motion = ease_in
	endif
	if ScreenElementExists id = <id>
		<id> :legacydomorph Pos = <original_pos> Scale = (<base_scale> * <scale_big_mult>) time = 0.3 rot_angle = 4 motion = ease_out
	endif
	if ScreenElementExists id = <id>
		<id> :legacydomorph Pos = <original_pos> Scale = <base_scale> time = 0.3 rot_angle = -5 rgba = [145 215 235 250] motion = ease_in
	endif
	rotation = 10
	begin
	<rotation> = (<rotation> * -0.7)
	if ScreenElementExists id = <id>
		<id> :legacydomorph Pos = <original_pos> rot_angle = <rotation> alpha = 1 time = 0.08 motion = ease_out
	endif
	repeat 12
	if ScreenElementExists id = <id>
		<id> :legacydomorph Pos = <original_pos> rot_angle = 0 motion = ease_out
	endif
	if ScreenElementExists id = <id>
		<id> :legacydomorph Pos = (<original_pos> - (0.0, 230.0)) Scale = (<base_scale> * 0.5) alpha = 0 time = 0.3 motion = ease_in
	endif
	if ($<player_status>.Player = 1)
		Change \{star_power_ready_on_p1 = 0}
	else
		Change \{star_power_ready_on_p2 = 0}
	endif
endscript
showing_raise_axe = 0
using_starpower_camera = FALSE

script Do_StarPower_Camera 
	return
	if ($using_starpower_camera = true || $using_walk_camera = true)
		return
	endif
	Change \{using_starpower_camera = true}
	WaitOneGameFrame
	Change \{CameraCuts_AllowNoteScripts = FALSE}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_starpower'
		changetime = 2500
		length = 7000}
	Wait \{7
		Seconds}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	Change \{CameraCuts_AllowNoteScripts = true}
	Change \{using_starpower_camera = FALSE}
endscript

script Kill_StarPower_Camera \{changecamera = 1}
	if ($using_starpower_camera = FALSE)
		return
	endif
	KillSpawnedScript \{Name = Do_StarPower_Camera}
	if (<changecamera> = 1)
		CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	endif
	Change \{CameraCuts_AllowNoteScripts = true}
	Change \{using_starpower_camera = FALSE}
endscript

script set_star_request_pending 

	Wait \{2.5
		Seconds}

endscript
