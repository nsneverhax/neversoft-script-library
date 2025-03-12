calibrate_lag_song = bloodlines
calibrate_last_song_saved = null
calibrate_lag_miss_avg_threshold_ms = 200
calibrate_lag_miss_threshold_max_ms = 500
calibrate_lag_failed_num = 0
calibrate_lag_fail_threshold_num = 3
calibrate_saved_video_offset = 0
calibrate_saved_audio_offset = 0

script ui_options_calibrate_restore_songlist 
	playlist_removefirstsong
	if ($calibrate_last_song_saved != null)
		begin
		playlist_getcurrentsong
		if (<current_song> = $calibrate_last_song_saved)
			break
		endif
		if playlist_isfinished
			break
		endif
		playlist_switchtonextsong
		repeat
	endif
	change \{calibrate_last_song_saved = null}
endscript

script ui_options_calibrate_cancel 
	setglobaltags user_options params = {lag_video_calibration = ($calibrate_saved_video_offset) lag_audio_calibration = ($calibrate_saved_audio_offset)}
	hide_glitch \{num_frames = 20}
	ui_options_calibrate_restore_songlist
	ui_calibrate_pausemenu_choose_quit
	idx = 0
	begin
	setplayerinfo (<idx> + 1) in_game = ($calibrate_prev_parts [<idx>].in_game)
	idx = (<idx> + 1)
	repeat 4
endscript

script ui_calibrate_option_choose 
	requireparams \{[
			menu_choice
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = generic
		uitype = select}
	change \{calibrate_test_from_menu = 0}
	switch (<menu_choice>)
		case adjust_video_lag
		calibrate_highway_events_container :settags \{current_changing = video}
		wait \{1
			gameframe}
		launchevent \{type = unfocus
			target = generic_barrel_vmenu}
		launchevent \{type = focus
			target = calibrate_highway_events_container}
		case adjust_audio_lag
		calibrate_highway_events_container :settags \{current_changing = audio}
		launchevent \{type = unfocus
			target = generic_barrel_vmenu}
		launchevent \{type = focus
			target = calibrate_highway_events_container}
		case reset_lags
		ui_calibrate_reset_change
		case note_calibrate
		change \{calibrating_helper_text = qs(0x0eb9e981)}
		jump_in_calibrate
		case settingstest
		jump_in_calibrate \{for_testing}
		case save_and_exit
		launchevent \{type = unfocus
			target = generic_barrel_vmenu}
		get_lag_values
		setglobaltags user_options params = {lag_video_calibration = <video_offset> lag_audio_calibration = ($current_calibrate_audio_lag)}
		calibrate_highway_shutdown \{load_band_lobby_pak = 1}
		hide_glitch \{num_frames = 8}
		ui_options_calibrate_restore_songlist
		ui_calibrate_reset_practice_data
		if (<practice_enabled> = 1)
			if gotparam \{nosave}
				spawnscriptlater \{practice_restart_song}
			else
				change \{memcard_after_func = practice_restart_song}
			endif
			state = uistate_gameplay
		else
			if ui_event_exists_in_stack \{name = 'jam'}
				change \{gameplay_restart_song = 1}
				state = uistate_gameplay
			elseif ui_event_exists_in_stack \{name = 'band_lobby'}
				change \{gameplay_restart_song = 1}
				state = uistate_gameplay
			elseif ui_event_exists_in_stack \{name = 'select_training'}
				change \{gameplay_restart_song = 1}
				state = uistate_gameplay
			elseif ui_event_exists_in_stack \{name = 'options'}
				state = uistate_options
			else
				state = uistate_mainmenu
			endif
		endif
		idx = 0
		begin
		setplayerinfo (<idx> + 1) in_game = ($calibrate_prev_parts [<idx>].in_game)
		idx = (<idx> + 1)
		repeat 4
		if gotparam \{nosave}
			ui_sfx \{menustate = generic
				uitype = select}
			generic_event_back state = <state> data = {from_calibrate_lag = 1}
		else
			ui_memcard_autosave event = menu_back state = <state> data = {from_calibrate_lag = 1} show_mainmenu_bg = 1
		endif
		case cancel
		ui_options_calibrate_cancel
	endswitch
endscript

script ui_calibrate_option_back 
	ui_sfx \{menustate = generic
		uitype = back}
	launchevent \{type = unfocus
		target = calibrate_highway_events_container}
	launchevent \{type = unfocus
		target = generic_barrel_vmenu}
endscript

script jump_in_calibrate 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if gotparam \{for_testing}
		change \{calibrate_highway_gameplay_state = settingstest}
		change \{calibrate_test_from_menu = 1}
	else
		ui_calibrate_reset_change
	endif
	launchevent \{type = unfocus
		target = generic_barrel_vmenu}
	generic_barrel_vmenu :se_setprops \{alpha = 0
		time = 0.5}
	generic_barrel_menu :se_setprops \{highlight_btn_alpha = 0
		time = 0.5}
	if generic_barrel_menu :desc_resolvealias \{name = alias_generic_barrel_menu_up_arrow}
		<resolved_id> :se_setprops alpha = 0 time = 0.5
	endif
	if generic_barrel_menu :desc_resolvealias \{name = alias_generic_barrel_menu_down_arrow}
		<resolved_id> :se_setprops alpha = 0 time = 0.5
	endif
	generic_barrel_menu :se_waitprops
	generic_barrel_vmenu :se_waitprops
	spawnscriptnow \{mock_highway_restart
		params = {
			fade_helpers = 1
			enable_input = 1
		}}
endscript

script ui_calibrate_reset_change 
	formattext \{textname = video_text
		qs(0x0f904228)
		d = 0}
	formattext \{textname = audio_text
		qs(0x6172b8bf)
		d = 0}
	change \{calibrate_highway_video_offset = 0}
	change \{current_calibrate_audio_lag = 0}
	setglobaltags \{user_options
		params = {
			lag_video_calibration = 0
			lag_audio_calibration = 0
		}}
	calibrationinterface :se_setprops videolag_text = <video_text> audiolag_text = <audio_text>
	calibrate_highway_events_container :settags \{temp_video_offset = 0
		temp_audio_offset = 0}
endscript

script ui_calibrate_lag_change 
	calibrate_highway_events_container :gettags
	<video_offset> = <temp_video_offset>
	<audio_offset> = <temp_audio_offset>
	if gotparam \{up}
		change_val = -1
	elseif gotparam \{down}
		change_val = 1
	endif
	should_return = 0
	if (<current_changing> = video)
		video_offset = (<video_offset> + <change_val>)
		if (<video_offset> > 0)
			should_return = 1
		endif
		if (<video_offset> < -200)
			should_return = 1
		endif
	elseif (<current_changing> = audio)
		change_val = (<change_val> * -1)
		audio_offset = (<audio_offset> + <change_val>)
		if (<audio_offset> < 0)
			should_return = 1
		endif
		if (<audio_offset> > 200)
			should_return = 1
		endif
	endif
	if (<should_return> = 1)
		return
	endif
	ui_sfx \{menustate = generic
		uitype = scrollup}
	formattext textname = video_text qs(0x0f904228) d = (<video_offset> * -1)
	formattext textname = audio_text qs(0x6172b8bf) d = <audio_offset>
	calibrate_highway_events_container :settags {
		temp_video_offset = <video_offset>
		temp_audio_offset = <audio_offset>
	}
	calibrationinterface :se_setprops videolag_text = <video_text> audiolag_text = <audio_text>
endscript

script ui_calibrate_option_focus 
	gettags
	if gotparam \{current_changing}
		if (<current_changing> = video)
			calibrationinterface :se_setprops \{videolag_rgba = [
					166
					30
					45
					255
				]
				calibrate_lag_video_alpha = 1.0}
		elseif (<current_changing> = audio)
			calibrationinterface :se_setprops \{audiolag_rgba = [
					166
					30
					45
					255
				]
				calibrate_lag_audio_alpha = 1.0}
		endif
	endif
	calibrate_highway_setup_button_helpers \{add_back_pill = 1}
endscript

script ui_calibrate_option_unfocus 
	gettags
	if gotparam \{current_changing}
		if (<current_changing> = video)
			calibrationinterface :se_setprops \{videolag_rgba = [
					30
					30
					30
					255
				]
				calibrate_lag_video_alpha = 0.7}
		elseif (<current_changing> = audio)
			calibrationinterface :se_setprops \{audiolag_rgba = [
					30
					30
					30
					255
				]
				calibrate_lag_audio_alpha = 0.7}
		endif
	else
		obj_getid
		<objid> :se_setprops rgba = [70 70 70 255]
	endif
endscript
calibrate_saved_practice_info = [
	0
	0
	0
	0
]
calibrate_pushed_unsafe = 0

script choose_calibrate_lag 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	pushunsafeforshutdown \{context = calibrate
		type = unchecked}
	change \{calibrate_pushed_unsafe = 1}
	playlist_getcurrentsong
	if (<current_song> = jamsession)
		unload_songqpak
	endif
	change calibrate_last_song_saved = <current_song>
	playlist_addsong song = ($calibrate_lag_song) insert_at = front
	quickplay_unload_challenges
	get_lag_values
	change calibrate_saved_video_offset = <video_offset>
	change calibrate_saved_audio_offset = <audio_offset>
	net_counter_increment \{counter_name = globalcounter_calibrate_lag}
	practice_enabled = 0
	if ($game_mode = practice)
		practice_enabled = 1
	endif
	setarrayelement arrayname = calibrate_saved_practice_info globalarray index = 0 newvalue = <practice_enabled>
	setarrayelement arrayname = calibrate_saved_practice_info globalarray index = 1 newvalue = ($practice_start_time)
	setarrayelement arrayname = calibrate_saved_practice_info globalarray index = 2 newvalue = ($practice_end_time)
	setarrayelement arrayname = calibrate_saved_practice_info globalarray index = 3 newvalue = ($current_starttime)
	reset_practice_mode
	shut_down_practice_mode
	kill_gem_scroller \{no_render = 1}
	change \{calibrate_lag_enabled = 1}
	change calibrate_lag_previous_mode = ($game_mode)
	change \{game_mode = quickplay}
	get_controller_type controller_index = ($primary_controller)
	if NOT (<controller_type> = controller)
		part = <controller_type>
	else
		part = guitar
	endif
	if (<part> = vocals)
		part = guitar
	endif
	resetyieldinfo \{yield = false}
	if ui_event_exists_in_stack \{name = 'gameplay'}
		change \{gameplay_restart_song = 1}
		generic_event_back \{nosound
			state = uistate_gameplay}
	else
		generic_event_choose \{no_sound
			state = uistate_play_song}
	endif
	spawnscriptnow calibrate_highway_start_song params = {device_num = ($primary_controller) part = <part>}
endscript

script ui_calibrate_pausemenu 
	show_option = 0
	num_options = 0
	new_option = {
		text = qs(0xb8790f2f)
		func = ui_calibrate_pausemenu_choose_skip
		func_params = {state = video}
	}
	if screenelementexists \{id = calibrate_highway_container}
		if ($calibrate_highway_state = video)
			show_option = 1
		endif
	endif
	addarrayelement array = <options> element = <new_option>
	<options> = <array>
	if (<show_option> = 1)
		new_option = {
			text = qs(0xf6a0ac6e)
			func = ui_calibrate_pausemenu_choose_skip
			func_params = {state = audio reset_pause_script}
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
		num_options = (<num_options> + 1)
	endif
	if NOT ui_event_exists_in_stack \{name = 'options'}
		back_to_text = qs(0x84aa9787)
		new_option = {
			text = <back_to_text>
			func = ui_calibrate_pausemenu_back_to_game
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
		num_options = (<num_options> + 1)
	endif
	new_option = {
		text = qs(0x67d9c56d)
		func = ui_calibrate_pausemenu_choose_quit
	}
	addarrayelement array = <options> element = <new_option>
	<options> = <array>
	num_options = (<num_options> + 1)
	if (<num_options> > 0)
		return options = <options>
	endif
endscript

script ui_calibrate_pausemenu_choose_skip 
	ui_sfx \{menustate = generic
		uitype = select}
	setup_pause \{pad_start_script = calibrate_hit_pause}
	ui_calibrate_skip state = <state>
	generic_event_back
	unpausegame
endscript

script ui_calibrate_skip \{fade_helpers = 1}
	change calibrate_highway_gameplay_state = <state>
	calibrate_highway_kill_scripts
	launchevent \{type = unfocus
		target = calibrate_highway_events_container}
	calibrate_highway_events_container :settags \{current_changing = none}
	calibrationinterface :se_setprops \{helper_alpha = 0
		time = 0.25}
	calibrationinterface :se_waitprops
	spawnscriptnow mock_highway_restart params = {<...>}
endscript

script ui_calibrate_reset_practice_data 
	practice_enabled = ($calibrate_saved_practice_info [0])
	change practice_start_time = ($calibrate_saved_practice_info [1])
	change practice_end_time = ($calibrate_saved_practice_info [2])
	change current_starttime = ($calibrate_saved_practice_info [3])
	return practice_enabled = <practice_enabled>
endscript

script ui_calibrate_pausemenu_back_to_game 
	if NOT gotparam \{no_shutdown}
		calibrate_highway_shutdown
	endif
	ui_calibrate_reset_practice_data
	if (<practice_enabled> = 1)
		practice_restart_song
	else
		change \{gameplay_restart_song = 1}
		generic_event_back \{state = uistate_gameplay
			nosound
			data = {
				from_calibrate_lag = 1
			}}
	endif
endscript

script ui_calibrate_pausemenu_choose_quit 
	hide_glitch \{num_frames = 8}
	calibrate_highway_shutdown
	if ui_event_exists_in_stack \{name = 'band_lobby'}
		ui_calibrate_pausemenu_back_to_game \{no_shutdown}
		return
	elseif ui_event_exists_in_stack \{name = 'select_training'}
		ui_calibrate_pausemenu_back_to_game \{no_shutdown}
		return
	elseif ui_event_exists_in_stack \{name = 'options'}
		quit_to_state = uistate_options
	elseif ui_event_exists_in_stack \{name = 'jam'}
		quit_to_state = uistate_jam
	else
		quit_to_state = uistate_mainmenu
	endif
	generic_event_back state = <quit_to_state> nosound
endscript

script get_lag_values 
	getglobaltags \{user_options
		param = lag_audio_calibration}
	getglobaltags \{user_options
		param = lag_video_calibration}
	if gotparam \{lag_audio_calibration}
		if gotparam \{lag_video_calibration}
			casttointeger \{lag_audio_calibration}
			casttointeger \{lag_video_calibration}
			audio_offset = <lag_audio_calibration>
			video_offset = <lag_video_calibration>
		endif
	endif
	return audio_offset = <audio_offset> video_offset = <video_offset>
endscript

script use_alternate_if_in_calibrate 
	if ($calibrate_lag_enabled = 1)
		return \{true}
	else
		return \{false}
	endif
endscript
