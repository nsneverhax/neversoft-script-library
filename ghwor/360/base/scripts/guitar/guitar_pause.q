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

script disable_pause 
	kill_start_key_binding <...>
endscript

script enable_pause 
	restore_start_key_binding
endscript

script gh_pause_ui \{for_practice = 0}
	printf \{qs(0xa96cae1c)}
	printf \{qs(0xf385348a)}
	printf \{qs(0xa96cae1c)}
	broadcastevent \{Type = event_pause_game}
	gh_pause_game
	if NOT (camanimfinished Name = cutscene)
		MovieMembFunc \{Name = cutscene
			func = Cut_GEL_Pause}
	endif
	if ($practice_enabled)
		for_practice = 1
	endif
	if GotParam \{pause_ui_state}
		ui_event_wait event = menu_change data = {state = <pause_ui_state> <pause_ui_state_params>}
	elseif GotParam \{from_handler}
		ui_event_wait event = menu_change data = {state = Uistate_pausemenu for_practice = <for_practice>}
	endif
endscript

script get_total_rewind_time 
	<rewind_time> = ($rewind_time + $rewind_scrollback_time + $rewind_hold_time)
	return rewind_time = <rewind_time>
endscript

script allow_rewind_pause \{from_sys = 0
		repause = 0}
	gamemode_gettype
	if (($g_in_tutorial = 1)
			|| ($practice_enabled = 1)
			|| ($calibrate_lag_enabled = 1)
			|| ($game_mode = freeplay)
			|| ($transition_playing = true)
			|| ($is_network_game)
			|| (<from_sys> = 1)
			|| (<Type> = competitive))
		Change \{allowed_rewind_unpause = 0}
		if (<repause> = 0)
			return \{FALSE}
		endif
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
		playlist_getcurrentsong
		GetSongTime
		songfilemanager func = get_song_end_time song_name = <current_song>
		if ((<songtime> < $rewind_time) || ((<songtime> * 1000) >= <total_end_time>))
			Change \{allowed_rewind_unpause = 0}
			return \{FALSE}
		endif
	endif
	Change \{allowed_rewind_unpause = 1}
	return \{true}
endscript

script reseek_rewind 
	GetSongTimeMs
	CastToInteger \{time}
	if sap_seek time = <time> noWait callback = songaudio_seekdone
		Change \{songaudio_waitingforseek = 1}
	else
		Change \{songaudio_waitingforseek = 0}
	endif
endscript

script switch_rewind_active \{Active = 1}
	if NOT GameIsPaused
		ScriptAssert \{qs(0xc662e9d6)}
	endif
	if ((<Active> = 0) && ($allowed_rewind_unpause = 1))
		waitforaudioseek
		Change \{pause_grace_period = -1.0}
		Change \{allowed_rewind_unpause = 0}
		reseek_rewind
	else
		if ((<Active> = 1) && ($allowed_rewind_unpause = 0))
			if allow_rewind_pause
				waitforaudioseek
				get_total_rewind_time
				Change pause_grace_period = <rewind_time>
				Change \{allowed_rewind_unpause = 1}
				incrementsongtimer delta_time = (-1.0 * $rewind_time)
				reseek_rewind
				incrementsongtimer delta_time = (1.0 * $rewind_time)
			endif
		endif
	endif
endscript

script gh_pause_game \{repause = 0
		from_sys = 0}
	if ($is_network_game && $playing_song)
		return
	endif
	if (($pause_grace_period) > 0.0)
		repause = 1
	endif
	if allow_rewind_pause from_sys = <from_sys> repause = <repause>
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
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		PauseMovie \{textureSlot = 1}
	endif
	freeplay_prepare_for_pause \{hide_hud = FALSE}
endscript

script gh_unpause_ui 
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
	clear_paused_controllers
	Change \{unknown_drum_type = 0}
	Change \{toggleviewmode_enabled = true}
	Change \{paused_for_hardware = 0}
	ui_event_get_top
	if (<base_name> = 'gameplay')
		gh_unpause_game
		Change \{pause_grace_period = -1.0}
		return
	endif
	if GotParam \{from_handler}
		if is_ui_event_running
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
		else
			get_savegame_from_controller controller = ($last_start_pressed_device)
			ui_event \{event = menu_replace
				data = {
					state = uistate_song_unpause
				}}
		endif
	else
		gh_unpause_game
		Change \{pause_grace_period = -1.0}
	endif
endscript

script gh_unpause_game \{unpause_audio = 1}
	printscriptinfo \{'gh_unpause_game'}
	if (<unpause_audio> = 1)
		unpauseaudio <...>
	endif
	UnPauseFullScreenMovie
	UnPauseGame
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		ResumeMovie \{textureSlot = 1}
	endif
	freeplay_prepare_for_unpause
endscript

script gh_start_pressed \{device_num = -1
		no_curtain = 0}
	printscriptinfo \{qs(0x033d3457)}
	if ($pause_grace_period >= 0.0)
		if NOT GameIsPaused
			get_total_rewind_time
			<rewind_time> = (<rewind_time> - 0.25)
			if ($pause_grace_period > <rewind_time>)
				return
			endif
		endif
	endif
	if NOT CD
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
endscript

script gh_start_pressed_spawned 
	printscriptinfo \{qs(0x814d24c9)}
	if NOT ($view_mode = 0)
		if GameIsPaused
			unpauseaudio <...>
			UnPauseGame
		else
			pauseaudio <...>
			PauseGame
			unpausespawnedscript \{update_crowd_model_cam}
		endif
		return
	endif
	if GameIsPaused
		gh_unpause_ui <...>
		if NOT GotParam \{no_sfx}
			ui_sfx \{menustate = Generic
				uitype = select}
		endif
		broadcastevent \{Type = event_unpause_game}
	else
		if ($net_pause = 1)
			net_unpausegh
			return
		elseif ($is_network_game && $playing_song)
			net_pausegh
			return
		endif
		gh_pause_ui <...>
		SpawnScriptNow \{block_input}
	endif
endscript
g_input_is_blocked = 0

script block_input 
	OnExitRun \{block_input_off}
	setscriptcannotpause
	if NOT sys_fade_showing
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

script handle_pause_event 
	if is_ui_event_running
		return
	endif
	gamemode_gettype
	if NOT (<Type> = freeplay && $in_sing_a_long = FALSE)
		if ($transition_playing = true)
			if NOT is_pausable_transition \{transition = $current_playing_transition}
				return
			endif
		endif
	endif
	if ($in_sing_a_long = true && $view_mode != 1)
		return
	endif
	printf \{qs(0xf173f764)}
	if GameIsPaused
		printf \{'KeepControllersAlive - unpause'}
		keepingamecontrollersalive
	endif
	if NOT ScriptIsRunning \{gh_start_pressed}
		if NOT ScriptIsRunning \{gh_start_pressed_spawned}
			SpawnScriptNow gh_start_pressed params = {<...> from_handler}
		endif
	endif
endscript

script is_pausable_transition 
	switch <transition>
		case songwon
		case songwonfreeplay
		case songdoneattract
		case songoutro
		case songlost
		return \{FALSE}
		case Intro
		case fastintro
		case fastintrotutorial
		case practice
		case preencore
		case ENCORE
		case restartencore
		case loading
		case onlineloading
		case loadingintro
		case finalbandintro
		case finalbandoutro
		case celebintro
		default
		return \{true}
	endswitch
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
