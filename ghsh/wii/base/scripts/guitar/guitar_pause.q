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
pause_enabled = 1

script disable_pause 
	if NOT GotParam \{nospam}
		printscriptinfo \{'disable_pause'}
	endif
	kill_start_key_binding <...>
	Change \{pause_enabled = 0}
endscript

script enable_pause 
	if ($0x586466f5 = 1)
		return
	endif
	if NOT GotParam \{nospam}
		printscriptinfo \{'enable_pause'}
	endif
	restore_start_key_binding <...>
	Change \{pause_enabled = 1}
endscript
homepausegame = 0
in_pause_menu = 0

script disc_error_pause 
	printf \{qs(0xa96cae1c)}
	printf \{qs(0x05fc2931)}
	printf \{qs(0xa96cae1c)}
	home_menu_pause \{disc_error = 1}
endscript

script disc_error_unpause 
	printf \{qs(0xa96cae1c)}
	printf \{qs(0x5d94f5ea)}
	printf \{qs(0xa96cae1c)}
	home_menu_unpause \{disc_error = 1}
endscript

script home_menu_pause \{disc_error = 0}
	printf \{qs(0xa96cae1c)}
	printf \{qs(0xf8bc3b2a)
		a = $homepausegame}
	printf \{qs(0xba7386b5)
		a = $pause_enabled}
	printf \{qs(0xa96cae1c)}
	if NOT ($pause_enabled = 1)
		if ui_event_exists_in_stack \{Name = 'gameplay'}
			if ($g_suspend_disc_eject_soundpause = 0)
				pauseallsoundshomemenu
			endif
			return
		endif
	endif
	if NOT ($homepausegame = 1)
		PauseGh3Sounds <...>
		if NOT isgamepaused
			SpawnScriptNow pausegh3 params = {home_menu from_handler disc_error = <disc_error>}
			Change \{homepausegame = 1}
		endif
	endif
	if ($g_suspend_disc_eject_soundpause = 0)
		pauseallsoundshomemenu
	endif
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
0xe6223563 = 0

script home_menu_unpause \{disc_error = 0}
	printf \{qs(0xf6b8aa2b)}
	printf \{qs(0x82c345b1)
		a = $homepausegame}
	printf \{qs(0xf6b8aa2b)}
	if ($homepausegame = 1)
		if (<disc_error> = 1)
			Change \{recovering_from_disc_error = 1}
		endif
		SpawnScriptNow unpausegh3 params = {home_menu from_handler disc_error = <disc_error>}
		broadcastevent \{Type = event_unpause_game}
		Change \{homepausegame = 0}
	endif
	if NOT ScreenElementExists \{id = loading_screen_container}
		SetButtonEventMappings \{unblock_menu_input}
	endif
	unpauseallsoundshomemenu
	Change \{g_suspend_disc_eject_soundpause = 0}
endscript
pausegh3_called = 0

script pausegh3 \{for_practice = 0
		disc_error = 0}
	printf \{qs(0xa96cae1c)}
	printf \{qs(0xf385348a)}
	printf \{qs(0xa96cae1c)}
	if ($pausegh3_called = 1)
		return
	endif
	Change \{pausegh3_called = 1}
	broadcastevent \{Type = event_pause_game}
	if NOT GotParam \{home_menu}
		WaitOneGameFrame
		WaitOneGameFrame
	endif
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
	if GotParam \{home_menu}
		ui_event_get_top
		if NOT (<base_name> = 'gameplay')
			printf \{qs(0x4b65e514)}
			return
		endif
	endif
	if GotParam \{from_handler}
		if ($transition_playing = true)
			if NOT ($current_playing_transition = careerintro)
				ui_event event = menu_change data = {state = Uistate_pausemenu for_practice = <for_practice>}
			endif
		else
			ui_event event = menu_change data = {state = Uistate_pausemenu for_practice = <for_practice>}
		endif
	endif
	WaitOneGameFrame
endscript

script do_gh3_pause 
	if ($is_network_game && $playing_song)
		return
	endif
	Change \{in_pause_menu = 1}
	PauseGh3Sounds <...>
	PauseFullScreenMovie
	PauseGame
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		PauseMovie \{textureSlot = 1}
	endif
	destroy_cameracut_ingame_menu
endscript
recovering_from_disc_error = 0

script unpausegh3 \{0xd5af9b26 = 1}
	printf \{qs(0xf6b8aa2b)}
	printf \{qs(0x293a99c4)}
	printf \{qs(0xf6b8aa2b)}
	Change \{toggleviewmode_enabled = true}
	Change \{paused_for_hardware = 0}
	Change \{pausegh3_called = 0}
	WaitOneGameFrame
	WaitOneGameFrame
	ui_event_get_top
	printstruct <...>
	if NOT ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'pausemenu'}
		do_gh3_unpause 0xd5af9b26 = <0xd5af9b26>
		return
	endif
	if GotParam \{from_handler}
		if is_ui_event_running
			return
		endif
	endif
	GetGlobalTags \{user_options
		param = unpause_count}
	if (<unpause_count> = 0 && $game_mode != training)
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
	if ($transition_playing = true)
		if ($current_playing_transition = careerintro)
			setslomo ($careerintro_current_slomo)
		endif
	endif
endscript

script do_gh3_unpause \{0xd5b464ed = 1
		0xd5af9b26 = 1}
	UnPauseFullScreenMovie
	if ($recovering_from_disc_error = 1)
		printf \{qs(0x576e0cd2)}
		UnPauseGame
		Wait \{4
			gameframes}
		UnPauseGh3Sounds <...>
	else
		printf \{qs(0x22dce6a7)}
		UnPauseGh3Sounds <...>
		UnPauseGame
	endif
	Change \{recovering_from_disc_error = 0}
	Change \{in_pause_menu = 0}
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		ResumeMovie \{textureSlot = 1}
	endif
	if ($force_sudden_death = 1)
		Change \{force_sudden_death = 0}
		GuitarEvent_SongWon
	endif
	if (($cameracut_ingame_menu_on = 1))
		create_cameracut_ingame_menu
	endif
	Change \{paused_for_hardware = 0}
endscript
last_start_pressed_device = 0
g_pause_is_busy = 0

script gh3_start_pressed \{device_num = -1}
	printscriptinfo \{qs(0x64fad4d4)}
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
	printstruct <...>
	SpawnScriptNow gh3_start_pressed_spawned params = {<...>}
endscript

script gh3_start_pressed_spawned 
	if ($g_pause_is_busy = 1)
		return
	endif
	Change \{g_pause_is_busy = 1}
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
		Change \{g_pause_is_busy = 0}
		return
	endif
	if GameIsPaused
		SpawnScriptNow \{block_input_on_exit}
		0xd5af9b26 = 1
		if ($transition_playing = true)
			if NOT ($current_playing_transition = None)
				0xd5af9b26 = 0
			endif
		endif
		unpausegh3 <...>
		broadcastevent \{Type = event_unpause_game}
		Change \{viewer_buttons_enabled = 1}
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
		pausegh3 <...>
		Change \{viewer_buttons_enabled = 0}
		SpawnScriptNow \{block_input}
	endif
	Change \{g_pause_is_busy = 0}
endscript
input_blocked = 0

script block_input 
	if ($fade_overlay_count = 0)
		SetButtonEventMappings \{block_menu_input}
		Change \{input_blocked = 1}
		Wait \{0.25
			Seconds}
		SetButtonEventMappings \{unblock_menu_input}
		Change \{input_blocked = 0}
	endif
endscript

script block_input_on_exit 
	if ($fade_overlay_count = 0)
		SetButtonEventMappings \{block_menu_input}
		Change \{input_blocked = 1}
		Wait \{0.25
			Seconds}
		SetButtonEventMappings \{unblock_menu_input}
		Change \{input_blocked = 0}
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

script clear_input_block 
	if ($input_blocked = 1)
		SetButtonEventMappings \{unblock_menu_input}
		Change \{input_blocked = 0}
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
	if ($0x586466f5 = 1)
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
	if NOT GameIsPaused
		if ($transition_playing = true)
			if (($current_playing_transition = songlost) || ($current_playing_transition = songwon))
				disable_pause
				return
			endif
		endif
	endif
	if ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'song_unpause'}
		return
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
