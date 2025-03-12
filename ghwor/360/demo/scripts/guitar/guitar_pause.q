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
	change \{pause_abuse_detected = 0}
	change \{pause_history_num_pauses = 0}
	<array> = []
	<i> = 0
	begin
	addarrayelement array = <array> element = 0.0
	<i> = (<i> + 1)
	repeat ($pause_history_size)
	change pause_history = <array>
	printf \{channel = zdebug
		qs(0x13b71aac)}
	printstruct channel = zdebug ($pause_history)
endscript

script add_to_pause_history 
	getsongtimems
	pause_time = <time>
	if (($pause_history_num_pauses) < ($pause_history_size))
		setarrayelement {
			arrayname = pause_history
			globalarray
			index = ($pause_history_num_pauses)
			newvalue = <pause_time>
		}
	else
		<i> = 0
		begin
		setarrayelement {
			arrayname = pause_history
			globalarray
			index = <i>
			newvalue = (($pause_history) [(<i> + 1)])
		}
		<i> = (<i> + 1)
		repeat (($pause_history_size) - 1)
		setarrayelement {
			arrayname = pause_history
			globalarray
			index = <i>
			newvalue = <pause_time>
		}
	endif
	change pause_history_num_pauses = (($pause_history_num_pauses) + 1)
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
	getarraysize ($pause_history)
	if (($pause_history_num_pauses) >= ($pause_history_size))
		<first_element> = (($pause_history) [0])
		<last_element> = (($pause_history) [(($pause_history_size) - 1)])
		<time_difference> = (<last_element> - <first_element>)
		if (<time_difference> < ($spam_pause_time_threshold_ms))
			printf \{channel = zdebug
				qs(0xae693e7b)}
			change \{pause_abuse_detected = 1}
			disable_challenge_meters
		endif
	endif
endscript

script disable_challenge_meters 
	gamemode_gettype
	if (<type> = quickplay)
		if gman_goalisactive \{goal = quickplay}
			gman_getdata \{goal = quickplay
				name = targeted_challenge}
			if (<targeted_challenge> != null)
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
	setscreenelementprops {
		id = root_window
		event_handlers = [{pad_start <pad_start_script> params = <params>}]
		replace_handlers
	}
	launchevent \{type = focus
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
	broadcastevent \{type = event_pause_game}
	gh_pause_game
	if NOT (camanimfinished name = cutscene)
		moviemembfunc \{name = cutscene
			func = cut_gel_pause}
	endif
	if ($practice_enabled)
		for_practice = 1
	endif
	if gotparam \{pause_ui_state}
		ui_event_wait event = menu_change data = {state = <pause_ui_state> <pause_ui_state_params>}
	elseif gotparam \{from_handler}
		ui_event_wait event = menu_change data = {state = uistate_pausemenu for_practice = <for_practice>}
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
			|| (<type> = competitive))
		change \{allowed_rewind_unpause = 0}
		if (<repause> = 0)
			return \{false}
		endif
	else
		if NOT cd
			if globalexists \{name = disable_unpause_countdown}
				if ($disable_unpause_countdown = 1)
					change \{allowed_rewind_unpause = 0}
					return \{false}
				endif
			endif
		endif
		getglobaltags \{user_options
			param = unpause_count}
		if (<unpause_count> = 0)
			change \{allowed_rewind_unpause = 0}
			return \{false}
		endif
		if (($pause_grace_period) > 0.0)
			return \{true}
		endif
		playlist_getcurrentsong
		getsongtime
		songfilemanager func = get_song_end_time song_name = <current_song>
		if ((<songtime> < $rewind_time) || ((<songtime> * 1000) >= <total_end_time>))
			change \{allowed_rewind_unpause = 0}
			return \{false}
		endif
	endif
	change \{allowed_rewind_unpause = 1}
	return \{true}
endscript

script reseek_rewind 
	getsongtimems
	casttointeger \{time}
	if sap_seek time = <time> nowait callback = songaudio_seekdone
		change \{songaudio_waitingforseek = 1}
	else
		change \{songaudio_waitingforseek = 0}
	endif
endscript

script switch_rewind_active \{active = 1}
	if NOT gameispaused
		scriptassert \{qs(0xc662e9d6)}
	endif
	if ((<active> = 0) && ($allowed_rewind_unpause = 1))
		waitforaudioseek
		change \{pause_grace_period = -1.0}
		change \{allowed_rewind_unpause = 0}
		reseek_rewind
	else
		if ((<active> = 1) && ($allowed_rewind_unpause = 0))
			if allow_rewind_pause
				waitforaudioseek
				get_total_rewind_time
				change pause_grace_period = <rewind_time>
				change \{allowed_rewind_unpause = 1}
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
			killspawnedscript \{name = ui_song_unpause}
			killspawnedscript \{name = wait_and_set_songtime}
			setsongtime songtime = ($last_pause_songtime)
		else
			getsongtime
			change last_pause_songtime = <songtime>
		endif
		get_total_rewind_time
		change pause_grace_period = <rewind_time>
		incrementsongtimer delta_time = (-1.0 * $rewind_time)
		if is_current_song_a_jam_session
			jam_stop_all_samples
		endif
		pauseaudio <...>
		incrementsongtimer delta_time = (1.0 * $rewind_time)
		add_to_pause_history
	else
		change \{pause_grace_period = -1.0}
		<do_not_pause_front_end_buss> = 1
		pauseaudio <...>
	endif
	pausefullscreenmovie
	pausegame
	if ismovieplaying \{textureslot = 0}
		pausemovie \{textureslot = 0}
	endif
	if ismovieplaying \{textureslot = 1}
		pausemovie \{textureslot = 1}
	endif
	freeplay_prepare_for_pause \{hide_hud = false}
endscript

script gh_unpause_ui 
	printf \{qs(0xf6b8aa2b)}
	printf \{qs(0x293a99c4)}
	printf \{qs(0xf6b8aa2b)}
	wait \{1
		gameframe}
	if NOT (camanimfinished name = cutscene)
		moviemembfunc \{name = cutscene
			func = cut_gel_pause
			params = {
				off
			}}
	endif
	resumecontrollerchecking
	clear_paused_controllers
	change \{unknown_drum_type = 0}
	change \{toggleviewmode_enabled = true}
	change \{paused_for_hardware = 0}
	ui_event_get_top
	if (<base_name> = 'gameplay')
		gh_unpause_game
		change \{pause_grace_period = -1.0}
		return
	endif
	if gotparam \{from_handler}
		if is_ui_event_running
			return
		endif
		if ui_event_exists_in_stack \{above = 'gameplay'
				name = 'song_unpause'}
			if NOT ui_event_exists_in_stack \{above = 'song_unpause'
					name = 'pausemenu'}
				ui_event \{event = menu_replace
					data = {
						state = uistate_pausemenu
					}}
				return
			endif
		endif
		gamemode_gettype
		if (<type> = tutorial)
			if ui_event_exists_in_stack \{name = 'gameplay'}
				ui_event \{event = menu_back
					data = {
						state = uistate_gameplay
					}}
			else
				generic_event_back \{data = {
						return_from_pause = 1
					}}
			endif
			gh_unpause_game
			change \{pause_grace_period = -1.0}
		else
			get_savegame_from_controller controller = ($last_start_pressed_device)
			ui_event \{event = menu_replace
				data = {
					state = uistate_song_unpause
				}}
		endif
	else
		gh_unpause_game
		change \{pause_grace_period = -1.0}
	endif
endscript

script gh_unpause_game \{unpause_audio = 1}
	printscriptinfo \{'gh_unpause_game'}
	if (<unpause_audio> = 1)
		unpauseaudio <...>
	endif
	unpausefullscreenmovie
	unpausegame
	if ismovieplaying \{textureslot = 0}
		resumemovie \{textureslot = 0}
	endif
	if ismovieplaying \{textureslot = 1}
		resumemovie \{textureslot = 1}
	endif
	freeplay_prepare_for_unpause
endscript

script gh_start_pressed \{device_num = -1
		no_curtain = 0}
	printscriptinfo \{qs(0x033d3457)}
	if ($pause_grace_period >= 0.0)
		if NOT gameispaused
			get_total_rewind_time
			<rewind_time> = (<rewind_time> - 0.25)
			if ($pause_grace_period > <rewind_time>)
				return
			endif
		endif
	endif
	if NOT cd
		if playerinfoequals \{1
				bot_play = 1}
			if (<device_num> = ($primary_controller))
				device_num = -1
			else
				if gotparam \{from_handler}
					if globalexists \{name = debug_pause_control}
						ui_event_wait_for_safe
						if gameispaused
							ui_event_block \{event = menu_back
								data = {
									state = uistate_gameplay
								}}
							gh_unpause_game
							change \{pause_grace_period = -1.0}
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
			getplayerinfo <player> controller
			start_pressed_device = <controller>
		endif
	else
		found_device = 0
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <player> controller
			if (<device_num> = <controller>)
				<found_device> = 1
				start_pressed_device = <device_num>
				break
			endif
			getnextplayer player = <player>
			repeat <num_players>
		endif
		if (<found_device> = 0)
			if NOT cd
				if gotparam \{from_handler}
					if globalexists \{name = debug_pause_control}
						ui_event_wait_for_safe
						if gameispaused
							ui_event_block \{event = menu_back
								data = {
									state = uistate_gameplay
								}}
							gh_unpause_game
							change \{pause_grace_period = -1.0}
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
	if gameispaused
		if NOT (<device_num> = -1)
			if NOT (<start_pressed_device> = $last_start_pressed_device)
				return
			endif
			setinput controller = <device_num> pattern = 0 strum = 0
		endif
	else
		if (<no_curtain> = 0)
			setup_pause_curtain
		endif
		change last_start_pressed_device = <start_pressed_device>
	endif
	printstruct <...>
	spawnscriptnow gh_start_pressed_spawned params = {<...>}
endscript

script gh_start_pressed_spawned 
	printscriptinfo \{qs(0x814d24c9)}
	if NOT ($view_mode = 0)
		if gameispaused
			unpauseaudio <...>
			unpausegame
		else
			pauseaudio <...>
			pausegame
			unpausespawnedscript \{update_crowd_model_cam}
		endif
		return
	endif
	if gameispaused
		gh_unpause_ui <...>
		if NOT gotparam \{no_sfx}
			ui_sfx \{menustate = generic
				uitype = select}
		endif
		broadcastevent \{type = event_unpause_game}
	else
		if ($net_pause = 1)
			net_unpausegh
			return
		elseif ($is_network_game && $playing_song)
			net_pausegh
			return
		endif
		gh_pause_ui <...>
		spawnscriptnow \{block_input}
	endif
endscript
g_input_is_blocked = 0

script block_input 
	onexitrun \{block_input_off}
	setscriptcannotpause
	if NOT sys_fade_showing
		setbuttoneventmappings \{block_menu_input}
		change \{g_input_is_blocked = 1}
		wait \{0.25
			seconds}
		setbuttoneventmappings \{unblock_menu_input}
		change \{g_input_is_blocked = 0}
	endif
endscript

script block_input_off 
	setbuttoneventmappings \{unblock_menu_input}
	change \{g_input_is_blocked = 0}
endscript

script create_generic_backdrop 
	if NOT screenelementexists \{id = generic_backdrop_container}
		createscreenelement \{type = containerelement
			parent = root_window
			id = generic_backdrop_container
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
		createscreenelement \{type = spriteelement
			id = pause_backdrop
			parent = generic_backdrop_container
			texture = menu_venue_bg
			rgba = [
				255
				255
				255
				255
			]
			pos = (640.0, 360.0)
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
	if screenelementexists \{id = generic_backdrop_container}
		destroyscreenelement \{id = generic_backdrop_container}
	endif
endscript

script handle_pause_event 
	if is_ui_event_running
		return
	endif
	gamemode_gettype
	if NOT (<type> = freeplay && $in_sing_a_long = false)
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
	if gameispaused
		printf \{'KeepControllersAlive - unpause'}
		keepingamecontrollersalive
	endif
	if NOT scriptisrunning \{gh_start_pressed}
		if NOT scriptisrunning \{gh_start_pressed_spawned}
			spawnscriptnow gh_start_pressed params = {<...> from_handler}
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
		return \{false}
		case intro
		case fastintro
		case fastintrotutorial
		case practice
		case preencore
		case encore
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
		killspawnedscript \{name = kill_pause_curtain_spawned}
		if screenelementexists \{id = pause_curtain}
			destroyscreenelement \{id = pause_curtain}
		endif
		alpha = 0.0
		if (($view_mode) = 0)
			alpha = ($g_pause_curtain_max_alpha)
		endif
		createscreenelement {
			type = spriteelement
			parent = root_window
			id = pause_curtain
			texture = white
			pos = (0.0, 0.0)
			alpha = <alpha>
			rgba = [0 0 0 255]
			z_priority = 0
			dims = (1280.0, 720.0)
			just = [left , top]
		}
	endif
endscript

script kill_pause_curtain \{time = 0.1}
	spawnscriptnow kill_pause_curtain_spawned params = {time = <time>}
endscript

script kill_pause_curtain_spawned \{time = 0.1}
	setscriptcannotpause
	onexitrun \{kill_pause_curtain_died}
	if screenelementexists \{id = pause_curtain}
		pause_curtain :se_setprops alpha = 0.0 time = <time>
		if (<time> > 0.0)
			wait <time> seconds
		endif
	endif
endscript

script kill_pause_curtain_died 
	if screenelementexists \{id = pause_curtain}
		destroyscreenelement \{id = pause_curtain}
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
		if screenelementexists \{id = pause_curtain}
			pause_curtain :se_setprops alpha = <alpha>
		endif
	endif
endscript
