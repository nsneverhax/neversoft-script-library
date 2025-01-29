ispauseenabled = true

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
	if NOT GotParam \{nospam}

	endif
	kill_start_key_binding <...>
endscript

script enable_pause 
	if NOT GotParam \{nospam}

	endif
	restore_start_key_binding <...>
endscript
0xf7f2af61 = 0

script PauseGame 
	0x99e89651
	if ($0xf7f2af61 = 1)
	endif
endscript

script UnPauseGame \{0xd5b464ed = 1
		0xd5af9b26 = 1}
	if ($0xf7f2af61 = 1)
		Wait \{0.5
			Seconds}
	endif

	0xc1bff55c 0xd5b464ed = <0xd5b464ed> 0xd5af9b26 = <0xd5af9b26>
endscript

script pausegh3 \{for_practice = 0}



	broadcastevent \{Type = event_pause_game}
	WaitOneGameFrame
	WaitOneGameFrame
	do_gh3_pause
	if NOT (camanimfinished Name = cutscene)
		MovieMembFunc \{Name = cutscene
			func = Cut_GEL_Pause}
	endif
	if ($practice_enabled)
		for_practice = 1
	endif
	if ($transition_playing = true)
		if ($current_playing_transition = careerintro)
			setslomo \{1.0}
		endif
	endif
	if GotParam \{from_handler}
		ui_event_wait event = menu_change event = menu_change data = {state = Uistate_pausemenu for_practice = <for_practice>}
	endif
	WaitOneGameFrame
endscript

script do_gh3_pause 
	if ($is_network_game && $playing_song)
		return
	endif
	PauseGh3Sounds <...>
	PauseFullScreenMovie
	PauseGame
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		PauseMovie \{textureSlot = 1}
	endif
endscript

script unpausegh3 \{0xd5af9b26 = 1}



	WaitOneGameFrame
	WaitOneGameFrame
	ui_event_get_top

	if (<base_name> = 'gameplay')
		do_gh3_unpause 0xd5af9b26 = <0xd5af9b26>
		return
	endif
	if ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'song_unpause'}
		ui_event \{event = menu_replace
			data = {
				state = Uistate_pausemenu
			}}
		return
	endif
	if GotParam \{from_handler}
		GetGlobalTags \{user_options
			param = unpause_count}
		if (<unpause_count> = 0)
			ui_event_block \{event = menu_change
				event = menu_back
				data = {
					state = Uistate_gameplay
				}}
			do_gh3_unpause 0xd5af9b26 = <0xd5af9b26>
		else
			ui_event \{event = menu_replace
				data = {
					state = uistate_song_unpause
				}}
		endif
	else
		do_gh3_unpause 0xd5af9b26 = <0xd5af9b26>
	endif
	WaitOneGameFrame
	if NOT (camanimfinished Name = cutscene)
		MovieMembFunc \{Name = cutscene
			func = Cut_GEL_Pause
			params = {
				OFF
			}}
	endif
	ResumeControllerChecking
	Change \{sysnotify_paused_controllers = [
		]}
	Change \{unknown_drum_type = 0}
	Change \{toggleviewmode_enabled = true}
	Change \{paused_for_hardware = 0}
	if ($transition_playing = true)
		if ($current_playing_transition = careerintro)
			setslomo ($careerintro_current_slomo)
		endif
	endif
endscript

script do_gh3_unpause \{0xd5b464ed = 1
		0xd5af9b26 = 1}
	UnPauseFullScreenMovie
	UnPauseGame 0xd5b464ed = <0xd5b464ed> 0xd5af9b26 = <0xd5af9b26>
	if (0xd5b464ed = 1)
		UnPauseGh3Sounds <...>
	endif
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		ResumeMovie \{textureSlot = 1}
	endif
endscript
last_start_pressed_device = 0
g_pause_is_busy = 0

script gh3_start_pressed \{device_num = -1}

	if ($is_attract_mode = 1)
		return
	endif
	if ($player1_status.bot_play = 1)
		if (<device_num> = ($primary_controller))
			device_num = -1
		else
			if GotParam \{from_handler}
				if GlobalExists \{Name = debug_pause_control}
					ui_event_wait_for_safe
					if GameIsPaused
						ui_event_block \{event = menu_back
							data = {
								state = Uistate_gameplay
							}}
						do_gh3_unpause
					else
						ui_event_block \{event = menu_change
							data = {
								state = uistate_debug
							}}
						do_gh3_pause
					endif
					return
				endif
			endif
			device_num = -1
		endif
	endif
	if (<device_num> = -1)
		if ($player1_status.bot_play = 1)
			start_pressed_device = ($primary_controller)
		else
			start_pressed_device = ($player1_status.controller)
		endif
	else
		i = 1
		begin
		status = ($0x2994109a [<i>])
		<controller> = (($<status>).controller)
		if (<device_num> = <controller>)
			start_pressed_device = <device_num>
			break
		endif
		i = (<i> + 1)
		repeat $current_num_players
		if ((<i> - 1) = $current_num_players)
			if NOT CD
				if GotParam \{from_handler}
					if GlobalExists \{Name = debug_pause_control}
						ui_event_wait_for_safe
						if GameIsPaused
							ui_event_block \{event = menu_back
								data = {
									state = Uistate_gameplay
								}}
							do_gh3_unpause
						else
							ui_event_block \{event = menu_change
								data = {
									state = uistate_debug
								}}
							do_gh3_pause
						endif
					endif
				endif
			endif
			return
		endif
	endif
	if GameIsPaused
		if NOT (<device_num> = -1)
			if NOT (<start_pressed_device> = $last_start_pressed_device)
				return
			endif
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
		0xd5af9b26 = 1
		if ($transition_playing = true)
			if NOT ($current_playing_transition = None)
				0xd5af9b26 = 0
			endif
		endif
		unpausegh3 <...>
		broadcastevent \{Type = event_unpause_game}
		Change \{viewer_buttons_enabled = 1}
		if (($game_mode = training) && ($training_mode = practice))
			Wait \{1.5
				Seconds}
		endif
	else
		if ($net_pause = 1)
			net_unpausegh
			Change \{g_pause_is_busy = 0}
			return
		elseif ($is_network_game && $playing_song)
			net_pausegh
			Change \{g_pause_is_busy = 0}
			return
		endif
		if NOT ScriptIsRunning \{GuitarEvent_SongWon}
			if NOT ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
				pausegh3 <...>
				Change \{viewer_buttons_enabled = 0}
				SpawnScriptNow \{block_input}
			endif
		endif
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
		]
		z_priority = 100}
endscript

script destroy_gh3_pause_menu 
	if ScreenElementExists \{id = pause_menu}
		DestroyScreenElement \{id = pause_menu}
	endif
	legacydoscreenelementmorph \{id = hud_window
		alpha = 1}
	Change \{g_pause_is_busy = 0}
endscript

script safe_create_gh3_pause_menu 
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
			texture = menu_venue_bg
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
		legacydoscreenelementmorph \{id = hud_window
			alpha = 0
			time = 0.5}
	endif
endscript

script destroy_generic_backdrop 
	if ScreenElementExists \{id = generic_backdrop_container}
		DestroyScreenElement \{id = generic_backdrop_container}
	endif
endscript

script handle_pause_event 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	elseif ($playing_song = 0)
		return
	elseif ScriptIsRunning \{sysnotify_handle_pause_controller}
		return
	elseif ScriptIsRunning \{sysnotify_handle_pause}
		return
	elseif ScriptIsRunning \{sysnotify_handle_unpause}
		return
	endif
	gamemode_gettype
	if (<Type> = career)
		if NOT progression_check_intro_complete
			if ($transition_playing = true)
				if ($current_playing_transition = careerintro)
					return
				endif
			endif
		endif
	endif
	if GotParam \{device_num}
		if ($playing_song_for_real = 0)
			return
		endif
	endif
	if NOT GameIsPaused
		if ($transition_playing = true)
			if (($current_playing_transition = songlost) || ($current_playing_transition = songwon))
				disable_pause
				return
			endif
		endif
	endif

	if GameIsPaused
		if ($is_attract_mode = 0)

			keepcontrollersalive
		endif
	endif
	SpawnScriptNow \{0x91acb55b}
	SpawnScriptNow gh3_start_pressed params = {<...> from_handler}
endscript

script 0x91acb55b \{delay_time = 1.0}
	kill_start_key_binding
	Wait <delay_time> Seconds
	if NOT GameIsPaused
		if ($transition_playing = true)
			if (($current_playing_transition != songlost) && ($current_playing_transition != songwon))
				restore_start_key_binding
			endif
		else
			restore_start_key_binding
		endif
	else
		restore_start_key_binding
	endif
endscript
