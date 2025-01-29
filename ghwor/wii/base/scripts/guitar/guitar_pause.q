pause_history_size = 4
spam_pause_time_threshold_ms = 10000
pause_history_num_pauses = 0
pause_history = [
	0.0
	0.0
	0.0
	0.0
]
pause_abuse_detected = 0
last_start_pressed_device = 0
last_pause_songtime = 0.0
pause_grace_period = -1.0
allowed_rewind_unpause = 0

script reset_pause_history 
	Change \{pause_abuse_detected = 0}
	Change \{pause_history_num_pauses = 0}
	<array> = []
	<i> = 0
	begin
	AddArrayElement array = <array> element = 0.0
	<i> = (<i> + 1)
	repeat ($pause_history_size)
	Change pause_history = <array>
	printf \{channel = zdebug
		qs(0x13b71aac)}
	printstruct channel = zdebug ($pause_history)
endscript

script add_to_pause_history 
	GetSongTimeMs
	pause_time = <time>
	if (($pause_history_num_pauses) < ($pause_history_size))
		SetArrayElement {
			ArrayName = pause_history
			globalarray
			index = ($pause_history_num_pauses)
			NewValue = <pause_time>
		}
	else
		<i> = 0
		begin
		SetArrayElement {
			ArrayName = pause_history
			globalarray
			index = <i>
			NewValue = (($pause_history) [(<i> + 1)])
		}
		<i> = (<i> + 1)
		repeat (($pause_history_size) - 1)
		SetArrayElement {
			ArrayName = pause_history
			globalarray
			index = <i>
			NewValue = <pause_time>
		}
	endif
	Change pause_history_num_pauses = (($pause_history_num_pauses) + 1)
	printf \{channel = zdebug
		qs(0x196f6202)}
	printstruct channel = zdebug ($pause_history)
	if NOT is_current_song_a_jam_session
		get_highest_difficulty
		if (<highest_difficulty> != beginner)
			check_pause_history_for_spam
		endif
	endif
endscript

script check_pause_history_for_spam 
	GetArraySize ($pause_history)
	if (($pause_history_num_pauses) >= ($pause_history_size))
		<first_element> = (($pause_history) [0])
		<last_element> = (($pause_history) [(($pause_history_size) - 1)])
		<time_difference> = (<last_element> - <first_element>)
		if (<time_difference> < ($spam_pause_time_threshold_ms))
			printf \{channel = zdebug
				qs(0xae693e7b)}
			Change \{pause_abuse_detected = 1}
			disable_challenge_meters
		endif
	endif
endscript

script disable_challenge_meters 
	gamemode_gettype
	if (<Type> = quickplay)
		if GMan_GoalIsActive \{goal = quickplay}
			gman_getdata \{goal = quickplay
				Name = targeted_challenge}
			if (<targeted_challenge> != NULL)
				gman_meterfunc \{goal = quickplay
					tool = challenge_meter
					func = disable_challenge_meter}
			endif
			quickplay_unload_challenges
		endif
	endif
endscript

script setup_pause \{pad_start_script = gh_start_pressed}
	<params> = {}
	if (<pad_start_script> = gh_start_pressed)
		<params> = {from_handler}
	endif
	SetScreenElementProps {
		id = root_window
		event_handlers = [{pad_start <pad_start_script> params = <params>}]
		replace_handlers
	}
	LaunchEvent \{Type = focus
		target = root_window}
endscript
pause_enabled = 1

script disable_pause 
	kill_start_key_binding <...>
	Change \{pause_enabled = 0}
endscript

script enable_pause 
	restore_start_key_binding
	Change \{pause_enabled = 1}
endscript
in_pause_menu = 0
ds_home_menu_paused = FALSE

script home_menu_pause 
	if ($is_ds_paused = FALSE)
		ds_pause
		Change \{ds_home_menu_paused = true}
	endif
endscript

script home_menu_unpause 
	if ($ds_home_menu_paused = true)
		ds_resume
		Change \{ds_home_menu_paused = FALSE}
	endif
	hide_glitch \{num_frames = 5}
endscript
gh_pause_ui_called = 0

script gh_pause_ui \{for_practice = 0}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> begin gh_pause_ui >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printf \{'--------------'}
	printf \{' Pausing Game '}
	printf \{'--------------'}
	if ($gh_pause_ui_called = 1)
		printf \{'gh_pause_ui_called already set! abort pause attempt.'}
		return
	endif
	Change \{gh_pause_ui_called = 1}
	broadcastevent \{Type = event_pause_game}
	WaitOneGameFrame
	WaitOneGameFrame
	gamemode_gettype
	if (<Type> = freeplay)
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
	gh_pause_game
	if NOT (camanimfinished Name = cutscene)
		MovieMembFunc \{Name = cutscene
			func = Cut_GEL_Pause}
	endif
	if ($practice_enabled)
		for_practice = 1
	endif
	<use_tutorial_pause> = 0
	if ui_event_exists_in_stack \{Name = 'tutorial_menu'}
		if NOT ui_event_exists_in_stack \{Name = 'gameplay'}
			<use_tutorial_pause> = 1
		endif
	endif
	if GotParam \{pause_ui_state}
		ui_event_wait event = menu_change data = {state = <pause_ui_state> <pause_ui_state_params>}
	elseif (<use_tutorial_pause> = 1)
		ui_event_wait event = menu_change data = {state = uistate_tutorial_pausemenu for_practice = <for_practice>}
	elseif GotParam \{from_handler}
		if NOT InNetGame
			ui_event_wait event = menu_change data = {state = Uistate_pausemenu for_practice = <for_practice>}
		endif
	endif
	WaitOneGameFrame
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> end gh_pause_ui >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
endscript

script get_total_rewind_time 
	<rewind_time> = ($rewind_time + $rewind_scrollback_time + $rewind_hold_time)
	return rewind_time = <rewind_time>
endscript

script allow_rewind_pause 
	gamemode_gettype
	if (($g_in_tutorial = 1)
			|| ($practice_enabled = 1)
			|| ($calibrate_lag_enabled = 1)
			|| ($game_mode = freeplay)
			|| ($transition_playing = true)
			|| ($is_network_game)
			|| (<Type> = competitive))
		Change \{allowed_rewind_unpause = 0}
		return \{FALSE}
	else
		if NOT CD
			if GlobalExists \{Name = disable_unpause_countdown}
				if ($disable_unpause_countdown = 1)
					Change \{allowed_rewind_unpause = 0}
					return \{FALSE}
				endif
			endif
		endif
		GetGlobalTags \{user_options
			param = unpause_count}
		if (<unpause_count> = 0)
			Change \{allowed_rewind_unpause = 0}
			return \{FALSE}
		endif
		if (($pause_grace_period) > 0.0)
			return \{true}
		endif
		if sap_isloaded
			playlist_getcurrentsong
			GetSongTime
			songfilemanager func = get_song_end_time song_name = <current_song>
			if (((<songtime> * 1000) < $wii_safe_seek_time_ms) || ((<songtime> * 1000) >= <total_end_time>))
				Change \{allowed_rewind_unpause = 0}
				return \{FALSE}
			endif
		else
			Change \{allowed_rewind_unpause = 0}
			return \{FALSE}
		endif
	endif
	Change \{allowed_rewind_unpause = 1}
	return \{true}
endscript

script gh_pause_game \{repause = 0}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> begin gh_pause_game >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printf \{'[guitar_pause.q: gh_pause_game]'}
	if ($is_network_game && $playing_song)
		return
	endif
	Change \{in_pause_menu = 1}
	if (($pause_grace_period) > 0.0)
		repause = 1
	endif
	if allow_rewind_pause
		if (<repause> = 1)
			KillSpawnedScript \{Name = ui_song_unpause}
			KillSpawnedScript \{Name = wait_and_set_songtime}
			setsongtime songtime = ($last_pause_songtime)
		else
			GetSongTime
			Change last_pause_songtime = <songtime>
		endif
		get_total_rewind_time
		Change pause_grace_period = <rewind_time>
		incrementsongtimer delta_time = (-1.0 * $rewind_time)
		if is_current_song_a_jam_session
			jam_stop_all_samples
		endif
		pauseaudio <...>
		incrementsongtimer delta_time = (1.0 * $rewind_time)
		add_to_pause_history
	else
		Change \{pause_grace_period = -1.0}
		<do_not_pause_front_end_buss> = 1
		pauseaudio <...>
	endif
	PauseFullScreenMovie
	PauseGame
	ds_pause
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		PauseMovie \{textureSlot = 1}
	endif
	freeplay_prepare_for_pause \{hide_hud = FALSE}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> end gh_pause_game >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
endscript

script gh_unpause_ui 
	printf \{'----------------'}
	printf \{' Unpausing Game '}
	printf \{'----------------'}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> begin gh_unpause_ui >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	LoadPakAsync \{pak_name = 'pak/ui/force_seek.pak'
		Heap = BottomUpHeap
		async = 1}
	UnloadPakAsync \{pak_name = 'pak/ui/force_seek.pak'
		Heap = BottomUpHeap
		async = 1}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> in gh_unpause_ui 1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	Change \{toggleviewmode_enabled = true}
	Change \{paused_for_hardware = 0}
	Change \{gh_pause_ui_called = 0}
	Change \{unknown_drum_type = 0}
	WaitOneGameFrame
	WaitOneGameFrame
	ui_event_get_top
	if (<base_name> = 'gameplay')
		printf \{'  [top ui: gameplay] => gh_unpause_game => return'}
		gh_unpause_game
		Change \{pause_grace_period = -1.0}
		return
	endif
	gamemode_gettype
	if (<Type> = freeplay)
		i = 1
		begin
		getplayerinfo <i> freeplay_state
		if NOT (<freeplay_state> = dropped)
			break
		endif
		i = (<i> + 1)
		repeat 4
		if (<i> = 5)
			ungh_pause_uisounds <...>
			return
		endif
	endif
	if GotParam \{from_handler}
		printf \{'  [GotParam from_handler]'}
		if is_ui_event_running
			if ($is_network_game)
				gh_unpause_game
				Change \{pause_grace_period = -1.0}
			endif
			printf \{'  vaguely returning out'}
			return
		endif
		if ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'song_unpause'}
			if NOT ui_event_exists_in_stack \{above = 'song_unpause'
					Name = 'pausemenu'}
				ui_event \{event = menu_replace
					data = {
						state = Uistate_pausemenu
					}}
				return
			endif
		endif
		gamemode_gettype
		if (<Type> = tutorial)
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
			gh_unpause_game
			Change \{pause_grace_period = -1.0}
		elseif ui_event_exists_in_stack \{Name = 'gameplay'}
			ui_event \{event = menu_replace
				data = {
					state = uistate_song_unpause
				}}
		else
			gh_unpause_game
			Change \{pause_grace_period = -1.0}
		endif
	else
		printf \{'  [!GotParam from_handler]'}
		gh_unpause_game
		Change \{pause_grace_period = -1.0}
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
	clear_paused_controllers
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> end gh_unpause_ui >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
endscript

script gh_unpause_game \{unpause_audio = 1}
	printscriptinfo \{'gh_unpause_game'}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> begin gh_unpause_game >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	UnPauseFullScreenMovie
	printf \{'not recovering from disc error'}
	if (<unpause_audio> = 1)
		unpauseaudio <...>
	endif
	UnPauseGame
	ds_resume
	Change \{in_pause_menu = 0}
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		ResumeMovie \{textureSlot = 1}
	endif
	if (($cameracut_ingame_menu_on = 1))
		create_cameracut_ingame_menu
	endif
	Change \{paused_for_hardware = 0}
	freeplay_prepare_for_unpause
endscript
g_pause_is_busy = 0

script gh_start_pressed \{device_num = -1
		no_curtain = 0}
	printscriptinfo \{qs(0x1165709d)}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start gh_start_pressed >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	if ($pause_grace_period >= 0.0)
		if NOT GameIsPaused
			get_total_rewind_time
			<rewind_time> = (<rewind_time> - 0.5)
			if ($pause_grace_period > <rewind_time>)
				return
			endif
		endif
	endif
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
						gh_unpause_game
						Change \{pause_grace_period = -1.0}
					else
						ui_event_block \{event = menu_change
							data = {
								state = uistate_debug
							}}
						gh_pause_game
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
							gh_unpause_game
							Change \{pause_grace_period = -1.0}
						else
							ui_event_block \{event = menu_change
								data = {
									state = uistate_debug
								}}
							gh_pause_game
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
		if (<no_curtain> = 0)
			setup_pause_curtain
		endif
		Change last_start_pressed_device = <start_pressed_device>
	endif
	printstruct <...>
	SpawnScriptNow gh_start_pressed_spawned params = {<...>}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> end gh_start_pressed >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
endscript

script gh_start_pressed_spawned 
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> begin gh_start_pressed_spawned >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	if ($g_pause_is_busy = 1)
		return
	endif
	push_disable_wii_invites_menu
	OnExitRun \{pop_disable_wii_invites_menu}
	Change \{g_pause_is_busy = 1}
	printscriptinfo \{qs(0x87f35dcf)}
	if NOT ($view_mode = 0)
		if GameIsPaused
			unpauseaudio <...>
			UnPauseGame
		else
			pauseaudio <...>
			PauseGame
			unpausespawnedscript \{update_crowd_model_cam}
		endif
		Change \{g_pause_is_busy = 0}
		return
	endif
	if GameIsPaused
		SpawnScriptNow \{block_input_on_exit}
		gh_unpause_ui <...>
		if NOT GotParam \{no_sfx}
			ui_sfx \{menustate = Generic
				uitype = select}
		endif
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
		gh_pause_ui <...>
		Change \{viewer_buttons_enabled = 0}
		SpawnScriptNow \{block_input}
	endif
	Change \{g_pause_is_busy = 0}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> end gh_start_pressed_spawned >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
endscript
g_input_is_blocked = 0

script block_input 
	OnExitRun \{block_input_off}
	setscriptcannotpause
	if ($fade_overlay_count = 0)
		SetButtonEventMappings \{block_menu_input}
		Change \{g_input_is_blocked = 1}
		Wait \{0.25
			Seconds}
		SetButtonEventMappings \{unblock_menu_input}
		Change \{g_input_is_blocked = 0}
	endif
endscript

script block_input_off 
	SetButtonEventMappings \{unblock_menu_input}
	Change \{g_input_is_blocked = 0}
endscript

script block_input_on_exit 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ($fade_overlay_count = 0)
		SetButtonEventMappings \{block_menu_input}
		Change \{g_input_is_blocked = 1}
		Wait \{0.25
			Seconds}
		SetButtonEventMappings \{unblock_menu_input}
		Change \{g_input_is_blocked = 0}
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
	endif
endscript

script destroy_generic_backdrop 
	if ScreenElementExists \{id = generic_backdrop_container}
		DestroyScreenElement \{id = generic_backdrop_container}
	endif
endscript

script clear_input_block 
	if ($g_input_is_blocked = 1)
		SetButtonEventMappings \{unblock_menu_input}
		Change \{g_input_is_blocked = 0}
	endif
endscript
g_pause_event_time = 0

script handle_pause_event 
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> begin handle_pause_event >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	if is_ui_event_running
		GetLocalSystemTime
		Change g_pause_event_time = (<localsystemtime>.Second)
		return
	endif
	gamemode_gettype
	if (<Type> = quickplay && $in_sing_a_long = FALSE)
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
	if ($in_sing_a_long = true && $view_mode != 1)
		return
	endif
	printf \{qs(0xf173f764)}
	SpawnScriptNow gh_start_pressed params = {<...> from_handler}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> end handle_pause_event >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
endscript
g_pause_curtain_max_alpha = 0.9

script setup_pause_curtain 
	if (($g_disable_pause_curtin) = 1)
		return
	else
		KillSpawnedScript \{Name = kill_pause_curtain_spawned}
		if ScreenElementExists \{id = pause_curtain}
			DestroyScreenElement \{id = pause_curtain}
		endif
		alpha = 0.0
		if (($view_mode) = 0)
			alpha = ($g_pause_curtain_max_alpha)
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = root_window
			id = pause_curtain
			texture = white
			Pos = (0.0, 0.0)
			alpha = <alpha>
			rgba = [0 0 0 255]
			z_priority = 0
			dims = (1280.0, 720.0)
			just = [left , top]
		}
	endif
endscript

script kill_pause_curtain \{time = 0.1}
	SpawnScriptNow kill_pause_curtain_spawned params = {time = <time>}
endscript

script kill_pause_curtain_spawned \{time = 0.1}
	setscriptcannotpause
	OnExitRun \{kill_pause_curtain_died}
	if ScreenElementExists \{id = pause_curtain}
		pause_curtain :se_setprops alpha = 0.0 time = <time>
		if (<time> > 0.0)
			Wait <time> Seconds
		endif
	endif
endscript

script kill_pause_curtain_died 
	if ScreenElementExists \{id = pause_curtain}
		DestroyScreenElement \{id = pause_curtain}
	endif
endscript

script update_pause_curtain_alpha 
	alpha = 0.0
	play_back_time = ($rewind_time)
	grace_period = ($pause_grace_period)
	if (<grace_period> > 0.0)
		if (($view_mode) = 0)
			alpha = (($g_pause_curtain_max_alpha) * (<grace_period> / <play_back_time>))
		endif
		if ScreenElementExists \{id = pause_curtain}
			pause_curtain :se_setprops alpha = <alpha>
		endif
	endif
endscript
ds_disc_eject_paused = FALSE

script disc_eject_pause 
	if ObjectExists \{id = UI}
		if ui_event_exists_in_stack \{Name = 'ds_connection_handler'}
			if ds_connection_should_disc_eject_cause_disconnect
				wiidscommunication :disconnect
			endif
		endif
	endif
	if ($is_ds_paused = FALSE)
		ds_pause
		Change \{ds_disc_eject_paused = true}
	endif
endscript

script disc_eject_resume 
	if ds_connection_should_disc_eject_cause_disconnect
		generic_ds_communication_error_handler
	endif
	if ($ds_disc_eject_paused = true)
		ds_resume
		Change \{ds_disc_eject_paused = FALSE}
	endif
endscript
is_ds_paused = FALSE

script ds_pause 
	if ($is_ds_paused = FALSE)
		roadie_battle_pause_game
		audience_party_full_pause_game
		Change \{is_ds_paused = true}
	endif
endscript

script ds_resume 
	if ($is_ds_paused = true)
		roadie_battle_resume_game
		audience_party_full_resume_game
		Change \{is_ds_paused = FALSE}
	endif
endscript
