
script setup_pause \{pad_start_script = gh3_start_pressed}
	SetScreenElementProps {
		id = root_window
		event_handlers = [{pad_start <pad_start_script>}]
		replace_handlers
	}
	LaunchEvent \{Type = focus
		target = root_window}
endscript
pause_enabled = 1

script disable_pause 
	if NOT GotParam \{nospam}
		printf \{'disable_pause'}
	endif
	kill_start_key_binding <...>
	Change \{pause_enabled = 0}
endscript

script enable_pause 
	printf \{'enable_pause'}
	restore_start_key_binding
	Change \{pause_enabled = 1}
endscript
homepausegame = 0
homecountdown = 0
calibratelaghomepause = 0
in_pause_menu = 0

script disc_error_pause 
	printf \{'-------------------------'}
	printf \{' Disc Error Pausing Game '}
	printf \{'-------------------------'}
	home_menu_pause \{disc_error = 1}
endscript

script disc_error_unpause 
	printf \{'---------------------------'}
	printf \{' Disc Error Unpausing Game '}
	printf \{'---------------------------'}
	home_menu_unpause \{disc_error = 1}
endscript

script home_menu_pause \{disc_error = 0}
	printf \{'-----------------------------'}
	printf \{' Home Menu Pausing Game : %a '
		a = $homepausegame}
	printf \{' Pause Enabled: %a           '
		a = $pause_enabled}
	printf \{'-----------------------------'}
	if is_roadie_battle_mode
		ui_event_get_top
		if (<base_name> = 'roadie_battle_choose_sides')
			wiidscommunication :sendmessage \{pause_mode
				send_immediately = true}
		endif
	endif
	if ui_event_exists_in_stack \{Name = 'bonus_videos_credits'}
		credits_list_container :se_setprops \{pause_recursive}
	endif
	vocals_mute_all_mics \{mute = true}
	stopallmotors
	if ($freestyle_in_flow = 1)
		hide_glitch \{num_frames = 5}
		freestyle_home_menu_pause
		return
	endif
	if NOT ($pause_enabled = 1 || $game_mode = freeplay || <disc_error> = 1)
		if NOT ($playing_song_for_real = 1)
			return
		endif
		if ui_event_exists_in_stack \{Name = 'gameplay'}
			return
		endif
	endif
	if NOT ($homepausegame = 1)
		PauseGh3Sounds <...>
		if NOT isgamepaused
			SpawnScriptNow pausegh3 params = {home_menu from_handler disc_error = <disc_error>}
			Change \{homepausegame = 1}
		elseif ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'song_unpause'}
			Change \{homecountdown = 1}
		endif
	endif
	if ($g_suspend_disc_eject_soundpause = 0)
		pauseallsoundshomemenu
	endif
endscript

script home_menu_unpause \{disc_error = 0}
	printf \{'-------------------------------'}
	printf \{' Home Menu Unpausing Game : %a '
		a = $homepausegame}
	printf \{'-------------------------------'}
	getmaxlocalplayers
	Player = 1
	begin
	getplayerinfo <Player> part
	if (<part> = vocals)
		if NOT playerinfoequals <Player> freeplay_state = dropped
			vocals_muteoutput Player = <Player> mute = FALSE
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	if (($freestyle_in_flow = 1) && ($homepausegame = 0))
		freestyle_home_menu_unpause
		return
	endif
	if ($homepausegame = 1)
		if (<disc_error> = 1)
			Change \{recovering_from_disc_error = 1}
		endif
		SpawnScriptNow unpausegh3 params = {home_menu from_handler disc_error = <disc_error>}
		broadcastevent \{Type = event_unpause_game}
		Change \{homepausegame = 0}
	elseif ($homecountdown = 1)
		ui_event \{event = menu_replace
			data = {
				state = uistate_song_unpause
			}}
		Change \{homecountdown = 0}
	endif
	SpawnScriptNow \{unpause_credits}
	if NOT ui_event_exists_in_stack \{Name = 'jam'}
		ReAcquireControllers
	endif
	unpauseallsoundshomemenu
	Change \{g_suspend_disc_eject_soundpause = 0}
	if is_roadie_battle_mode
		ui_event_get_top
		if (<base_name> = 'roadie_battle_choose_sides')
			wiidscommunication :sendmessage \{set_choose_sides_mode}
		endif
	endif
endscript

script unpause_credits 
	if ui_event_exists_in_stack \{Name = 'bonus_videos_credits'}
		Wait \{1
			Frame}
		credits_list_container :se_setprops \{unpause_recursive}
	endif
endscript
pausegh3_called = 0

script pausegh3 \{for_practice = 0
		disc_error = 0}
	printf \{'--------------'}
	printf \{' Pausing Game '}
	printf \{'--------------'}
	if ($pausegh3_called = 1)
		printf \{'pausegh3_called already set! abort pause attempt.'}
		return
	endif
	Change \{pausegh3_called = 1}
	broadcastevent \{Type = event_pause_game}
	if NOT GotParam \{home_menu}
		WaitOneGameFrame
		WaitOneGameFrame
	endif
	gamemode_gettype
	if ((<Type> = freeplay) && (<disc_error> = 0))
		i = 1
		begin
		getplayerinfo <i> freeplay_state
		if NOT (<freeplay_state> = dropped)
			break
		endif
		i = (<i> + 1)
		repeat 4
		if (<i> = 5)
			return
		endif
	endif
	do_gh3_pause
	if NOT (camanimfinished Name = cutscene)
		MovieMembFunc \{Name = cutscene
			func = Cut_GEL_Pause}
	endif
	if ($practice_enabled)
		for_practice = 1
	endif
	if GotParam \{home_menu}
		ui_event_get_top
		if NOT (<base_name> = 'gameplay')
			printf \{'[guitar_pause.q: pausegh3] Home Button Pressed - Not in gameplay - early out'}
			return
		endif
		if ((($calibrate_lag_enabled) = 1) || (($vv_calibrate_lag_exiting) = 1))
			Change \{calibratelaghomepause = 1}
			return
		endif
	endif
	gamemode_gettype
	if (<Type> = tutorial)
		ui_event_wait event = menu_change data = {state = uistate_tutorial_pause for_practice = <for_practice>}
	elseif GotParam \{pause_ui_state}
		ui_event_wait event = menu_change data = {state = <pause_ui_state> <pause_ui_state_params>}
	elseif GotParam \{from_handler}
		if NOT InNetGame
			if GotParam \{home_menu}
				if ui_event_exists_in_stack \{Name = 'gameplay'}
					hide_glitch \{num_frames = 10}
				endif
			endif
			ui_event event = menu_change data = {state = Uistate_pausemenu for_practice = <for_practice>}
		endif
	endif
	WaitOneGameFrame
endscript

script do_gh3_pause 
	printf \{'[guitar_pause.q: do_gh3_pause]'}
	if ($is_network_game && $playing_song)
		return
	endif
	Change \{in_pause_menu = 1}
	PauseGh3Sounds <...>
	PauseFullScreenMovie
	PauseGame
	roadie_battle_pause_game
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		PauseMovie \{textureSlot = 1}
	endif
	destroy_cameracut_ingame_menu
	freeplay_prepare_for_pause \{hide_hud = FALSE}
endscript
recovering_from_disc_error = 0

script unpausegh3 
	printf \{'----------------'}
	printf \{' Unpausing Game '}
	printf \{'----------------'}
	LoadPakAsync \{pak_name = 'pak/ui/force_seek.pak'
		Heap = BottomUpHeap
		async = 1}
	UnloadPakAsync \{pak_name = 'pak/ui/force_seek.pak'
		Heap = BottomUpHeap
		async = 1}
	Change \{toggleviewmode_enabled = true}
	Change \{paused_for_hardware = 0}
	Change \{pausegh3_called = 0}
	if NOT is_roadie_battle_mode
		if NOT freestyle_is_active
			ui_event_get_top
			if (<base_name> = 'gameplay')
				do_gh3_unpause
				return
			endif
		endif
	endif
	WaitOneGameFrame
	WaitOneGameFrame
	gamemode_gettype
	if ((<Type> = freeplay) && (($recovering_from_disc_error) = 0))
		i = 1
		begin
		getplayerinfo <i> freeplay_state
		if NOT (<freeplay_state> = dropped)
			break
		endif
		i = (<i> + 1)
		repeat 4
		if (<i> = 5)
			UnPauseGh3Sounds <...>
			return
		endif
	endif
	if GotParam \{from_handler}
		if NOT is_roadie_battle_mode
			if NOT freestyle_is_active
				if is_ui_event_running
					if ($is_network_game)
						do_gh3_unpause
					endif
					if ($recovering_from_disc_error = 0)
						return
					endif
				endif
			endif
		endif
		if is_ui_event_running
			gamemode_gettype
			if ((<Type> = practice) && ($playing_song = 0))
				do_gh3_unpause
				return
			elseif ui_event_exists_in_stack \{Name = 'gameplay'}
				if NOT (<Type> = freeplay)
					if (($calibratelaghomepause) = 0)
						do_gh3_unpause
					endif
				else
					UI :Unpause
				endif
			else
				do_gh3_unpause
			endif
			if (<Type> = freeplay)
				hide_glitch \{num_frames = 10}
			endif
			printf \{'[guitar_pause.q: unpausegh3] - event is running, we should wait for it.'}
			ui_event_wait_for_safe
		endif
		if ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'song_unpause'}
			ui_event \{event = menu_replace
				data = {
					state = Uistate_pausemenu
				}}
			return
		endif
		if ((GotParam home_menu) || (GotParam disc_error))
			if NOT ($is_network_game)
				if ui_event_exists_in_stack \{Name = 'gameplay'}
					if (($calibratelaghomepause) = 0)
						ui_event \{event = menu_replace
							data = {
								state = Uistate_pausemenu
							}}
						return
					endif
				endif
			endif
		endif
		gamemode_gettype
		if (<Type> = tutorial)
			if GotParam \{home_menu}
				if ui_event_exists_in_stack \{Name = 'gameplay'}
				else
					do_gh3_unpause
				endif
			else
				if ui_event_exists_in_stack \{Name = 'gameplay'}
					ui_event \{event = menu_back
						data = {
							state = Uistate_gameplay
						}}
				else
					generic_event_back \{data = {
							return_from_pause = 1
						}}
				endif
				do_gh3_unpause
			endif
		elseif (($calibratelaghomepause) = 1)
			Change \{calibratelaghomepause = 0}
			do_gh3_unpause
		elseif ui_event_exists_in_stack \{Name = 'gameplay'}
			if GotParam \{home_menu}
				hide_glitch \{num_frames = 10}
			endif
			GetGlobalTags \{user_options
				param = unpause_count}
			if (<unpause_count> = 0)
				ui_event \{event = menu_back
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
		elseif ui_event_exists_in_stack \{Name = 'band_name_logo'}
			do_gh3_unpause
			edit_graphic_prepare_sprite_infos \{ignore_empty_logo}
			generatecagtexture info_array = <sprite_infos> Player = <currentskaterprofileindex> test = 0
		else
			do_gh3_unpause
		endif
	else
		do_gh3_unpause
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
endscript

script do_gh3_unpause 
	printf \{'[guitar_pause.q: do_gh3_unpause]'}
	UnPauseFullScreenMovie
	if ($recovering_from_disc_error = 1)
		printf \{'recovering from disc error'}
		UnPauseGame
		Wait \{4
			gameframes}
		UnPauseGh3Sounds <...>
	else
		printf \{'not recovering from disc error'}
		UnPauseGh3Sounds <...>
		UnPauseGame
	endif
	roadie_battle_resume_game
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
	freeplay_prepare_for_unpause
endscript
last_start_pressed_device = 0
g_pause_is_busy = 0

script gh3_start_pressed \{device_num = -1}
	if playerinfoequals \{1
			bot_play = 1}
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
		if playerinfoequals \{1
				bot_play = 1}
			start_pressed_device = ($primary_controller)
		else
			getfirstplayer
			getplayerinfo <Player> controller
			start_pressed_device = <controller>
		endif
	else
		found_device = 0
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <Player> controller
			if (<device_num> = <controller>)
				<found_device> = 1
				start_pressed_device = <device_num>
				break
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
		if (<found_device> = 0)
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
	if NOT ($view_mode = 0)
		if GameIsPaused
			UnPauseGh3Sounds <...>
			UnPauseGame
		else
			PauseGame
			PauseGh3Sounds <...>
			unpausespawnedscript \{update_crowd_model_cam}
		endif
		Change \{g_pause_is_busy = 0}
		return
	endif
	if GameIsPaused
		SpawnScriptNow \{block_input_on_exit}
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
	ScriptAssert \{'destroy_gh3_pause_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script safe_create_gh3_pause_menu 
	ScriptAssert \{'safe_create_gh3_pause_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
g_pause_event_time = 0

script handle_pause_event 
	if is_ui_event_running
		GetLocalSystemTime
		Change g_pause_event_time = (<localsystemtime>.Second)
		return
	endif
	gamemode_gettype
	if (<Type> = quickplay)
		if is_current_song_a_jam_session
			GetLocalSystemTime
			Seconds = (<localsystemtime>.Second)
			if NOT GotParam \{Force}
				if (<Seconds> >= ($g_pause_event_time) && <Seconds> < ($g_pause_event_time + 1))
					printf \{'User spamming pause! Ignore.'}
					if ScreenElementExists \{id = current_menu}
						current_menu :se_setprops \{unblock_events}
					endif
					return
				endif
			endif
			Change g_pause_event_time = <Seconds>
		endif
	elseif ((<Type> = tutorial) && ($tutorial_paused = 0))
		if NOT tutorial_anti_spam_timer_okay
			printf \{'Will not pause right after green press'}
			return
		endif
		Change \{tutorial_paused = 1}
	endif
	printf \{qs(0xf173f764)}
	SpawnScriptNow gh3_start_pressed params = {<...> from_handler}
endscript
