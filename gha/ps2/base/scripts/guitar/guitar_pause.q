
script setup_pause 
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	LaunchEvent \{Type = focus
		target = root_window}
endscript

script disable_pause 
	kill_start_key_binding
endscript

script enable_pause 
	restore_start_key_binding
endscript
0xf7f2af61 = 0

script PauseGame 
	0x99e89651
	if ($0xf7f2af61 = 1)
	endif
endscript

script UnPauseGame 
	if ($0xf7f2af61 = 1)
		Wait \{0.5
			Seconds}
	endif
	0xc1bff55c
endscript

script pausegh3 



	broadcastevent \{Type = event_pause_game}
	WaitOneGameFrame
	WaitOneGameFrame
	PauseGh3Sounds <...>
	PauseFullScreenMovie
	PauseGame
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		PauseMovie \{textureSlot = 1}
	endif
	if NOT (SkaterCamAnimFinished Name = cutscene)
		MovieMembFunc \{Name = cutscene
			func = Cut_GEL_Pause}
	endif
	ui_flow_manager_respond_to_action action = pause_game create_params = {device_num = <device_num>}
	WaitOneGameFrame
endscript

script unpausegh3 



	WaitOneGameFrame
	WaitOneGameFrame
	ui_flow_manager_respond_to_action \{action = select_resume}
	WaitOneGameFrame
	UnPauseFullScreenMovie
	UnPauseGame
	WaitOneGameFrame
	UnPauseGh3Sounds <...>
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		ResumeMovie \{textureSlot = 1}
	endif
	if NOT (SkaterCamAnimFinished Name = cutscene)
		MovieMembFunc \{Name = cutscene
			func = Cut_GEL_Pause
			params = {
				OFF
			}}
	endif
	Change \{toggleviewmode_enabled = true}
	if NOT isps3
		ResumeControllerChecking
	endif
	Change \{paused_for_hardware = 0}
endscript
last_start_pressed_device = 0
g_pause_is_busy = 0

script gh3_start_pressed \{device_num = -1}
	printscriptinfo \{'gh3_start_pressed'}
	if (<device_num> = -1)
		if ($player1_status.bot_play = 1)
			start_pressed_device = ($primary_controller)
		else
			start_pressed_device = -1
		endif
	else
		if ($is_attract_mode = 1)
			return
		endif
		if ($player1_status.bot_play = 1)
			start_pressed_device = ($primary_controller)
		elseif (<device_num> = ($player1_status.controller))
			start_pressed_device = <device_num>
		elseif ($current_num_players = 2 && $is_network_game = 0 && $boss_battle = 0)
			if (<device_num> = $player2_status.controller)
				start_pressed_device = <device_num>
			else
				return
			endif
		else
			return
		endif
	endif
	if GameIsPaused
		if NOT (<device_num> = -1)
			if NOT (<start_pressed_device> = $last_start_pressed_device)
				if NOT ($last_start_pressed_device = -1)
					return
				endif
			endif
		endif
		if NOT (<device_num> = -1)
			SetInput controller = <device_num> pattern = 0 strum = 0
		endif
	else
		Change last_start_pressed_device = <start_pressed_device>
	endif
	SpawnScriptNow gh3_start_pressed_spawned params = {<...>}
endscript

script gh3_start_pressed_spawned 
	if ($g_pause_is_busy = 1)
		return
	endif
	Change \{g_pause_is_busy = 1}
	if (<device_num> = -1)
		Change \{0xf7f2af61 = 0}
	else
		Change \{0xf7f2af61 = 1}
	endif

	if NOT ($view_mode = 0)
		if GameIsPaused
			UnPauseGh3Sounds <...>
			UnPauseGame
		else
			PauseGh3Sounds <...>
			PauseGame
			unpausespawnedscript \{update_crowd_model_cam}
		endif
		Change \{g_pause_is_busy = 0}
		return
	endif
	if GameIsPaused
		unpausegh3 <...>
		SpawnScriptNow \{destroy_gh3_pause_menu}
		broadcastevent \{Type = event_unpause_game}
		Change \{viewer_buttons_enabled = 1}
	else
		if ($ui_flow_manager_state [0] = online_pause_fs)
			net_unpausegh3
			Change \{g_pause_is_busy = 0}
			return
		elseif ($is_network_game && $playing_song)
			net_pausegh3
			Change \{g_pause_is_busy = 0}
			return
		endif
		pausegh3 <...>
		safe_create_gh3_pause_menu <...>
		Change \{viewer_buttons_enabled = 0}
		SpawnScriptNow \{block_input}
	endif
	Change \{g_pause_is_busy = 0}
	Change \{0xf7f2af61 = 0}
endscript

script block_input 
	if ($fade_overlay_count = 0)
		SetButtonEventMappings \{block_menu_input}
		Wait \{0.25
			Seconds}
		SetButtonEventMappings \{unblock_menu_input}
	endif
endscript

script create_gh3_pause_menu 
	Change \{toggleviewmode_enabled = FALSE}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = pause_menu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
endscript

script destroy_gh3_pause_menu 
	if ScreenElementExists \{id = pause_menu}
		DestroyScreenElement \{id = pause_menu}
	endif
	DoScreenElementMorph \{id = hud_window
		alpha = 1}
	Change \{g_pause_is_busy = 0}
endscript

script safe_create_gh3_pause_menu 
	KillSpawnedScript \{Name = destroy_loading_screen_spawned}
	if NOT ScreenElementExists \{id = pause_menu}
		create_gh3_pause_menu <...>
	endif
endscript

script create_generic_backdrop 
	if NOT ScreenElementExists \{id = generic_backdrop_container}
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = generic_backdrop_container
			Pos = (0.0, 0.0)
			just = [
				left
				top
			]}
		CreateScreenElement \{Type = SpriteElement
			id = pause_backdrop
			parent = generic_backdrop_container
			texture = Venue_BG
			rgba = [
				255
				255
				255
				255
			]
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 0
			alpha = 1}
		DoScreenElementMorph \{id = hud_window
			alpha = 0
			time = 0.5}
	endif
endscript

script destroy_generic_backdrop 
	if ScreenElementExists \{id = generic_backdrop_container}
		DestroyScreenElement \{id = generic_backdrop_container}
	endif
endscript
