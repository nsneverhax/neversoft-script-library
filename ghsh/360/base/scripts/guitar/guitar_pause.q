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
		printscriptinfo \{'disable_pause'}
	endif
	kill_start_key_binding <...>
endscript

script enable_pause 
	if NOT GotParam \{nospam}
		printscriptinfo \{'enable_pause'}
	endif
	restore_start_key_binding <...>
endscript

script enable_pause_tutorials 
	Change \{ispauseenabled = true}
endscript

script disable_pause_tutorials 
	Change \{ispauseenabled = FALSE}
endscript

script is_pause_enabled 
	if (($ispauseenabled) = true)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script pausegh3 \{for_practice = 0}
	printf \{qs(0xa96cae1c)}
	printf \{qs(0xf385348a)}
	printf \{qs(0xa96cae1c)}
	broadcastevent \{Type = event_pause_game}
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

script unpausegh3 
	printf \{qs(0xf6b8aa2b)}
	printf \{qs(0x293a99c4)}
	printf \{qs(0xf6b8aa2b)}
	Wait \{1
		gameframe}
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
	ui_event_get_top
	if (<base_name> = 'gameplay')
		do_gh3_unpause
		return
	endif
	if GotParam \{from_handler}
		if is_ui_event_running
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
		get_savegame_from_controller controller = ($last_start_pressed_device)
		GetGlobalTags user_options param = unpause_count savegame = <savegame>
		if (<unpause_count> = 0)
			ui_event \{event = menu_change
				event = menu_back
				data = {
					state = Uistate_gameplay
				}}
			do_gh3_unpause
		else
			ui_event \{event = menu_replace
				data = {
					state = uistate_song_unpause
				}}
		endif
	else
		do_gh3_unpause
	endif
endscript

script do_gh3_unpause 
	UnPauseGh3Sounds <...>
	UnPauseFullScreenMovie
	UnPauseGame
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		ResumeMovie \{textureSlot = 1}
	endif
endscript
last_start_pressed_device = 0

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
		formatText checksumName = status 'player%n_status' n = <i>
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
				if (($current_num_players) = 1)
					Change last_start_pressed_device = ($primary_controller)
				endif
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
	printf \{qs(0x2c46a642)}
	if NOT ($view_mode = 0)
		if GameIsPaused
			UnPauseGh3Sounds <...>
			UnPauseGame
		else
			PauseGh3Sounds <...>
			PauseGame
			unpausespawnedscript \{update_crowd_model_cam}
		endif
		return
	endif
	if GameIsPaused
		unpausegh3 <...>
		broadcastevent \{Type = event_unpause_game}
		Change \{viewer_buttons_enabled = 1}
	else
		if ($net_pause = 1)
			net_unpausegh
			return
		elseif ($is_network_game && $playing_song)
			net_pausegh
			return
		endif
		pausegh3 <...>
		Change \{viewer_buttons_enabled = 0}
		SpawnScriptNow \{block_input}
	endif
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
	gamemode_gettype
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
	elseif (<Type> = career)
		if NOT progression_check_intro_complete
			if ($transition_playing = true)
				if ($current_playing_transition = careerintro)
					return
				endif
			endif
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
	printf \{qs(0xf173f764)}
	if GameIsPaused
		if ($is_attract_mode = 0)
			printf \{'KeepControllersAlive - unpause'}
			keepcontrollersalive
		endif
	endif
	SpawnScriptNow gh3_start_pressed params = {<...> from_handler}
endscript
