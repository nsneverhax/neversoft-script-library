calibrate_lag_enabled = 0
calibrate_lag_previous_mode = none
calibrate_lag_notes_passed = 0
calibrate_lag_min_threshold = 7
calibrate_highway_paused_time = 0
calibrate_highway_video_offset = 0
calibrate_highway_state = video_dialog
calibrate_highway_gameplay_state = video
current_calibrate_audio_lag = 0
calibrate_test_from_menu = 0
calibrate_history_times = [
]
calibreate_history_index = 0
calibrating_helper_text = qs(0x03ac90f0)
calibrate_prev_parts = [
]
calibrate_gameplay_ready = 0

script calibrate_highway_start_song 
	change \{calibrate_highway_state = video_dialog}
	change \{calibrate_highway_gameplay_state = video}
	calibrate_highway_setup_player device_num = <device_num> old_part = <part>
	begin
	wait \{1
		gameframe}
	if ($calibrate_gameplay_ready = 1)
		change \{calibrate_gameplay_ready = 0}
		break
	endif
	repeat
	calibrate_highway_setup <...>
endscript

script calibrate_highway_setup 
	change \{calibreate_history_index = 0}
	change \{calibrate_history_times = [
		]}
	setup_pause \{pad_start_script = calibrate_hit_pause}
	calibrate_highway_init_ui <...>
	spawnscriptnow \{gameevent_calibratebegin}
	if ($calibrate_pushed_unsafe = 1)
		popunsafeforshutdown \{context = calibrate
			type = unchecked}
		change \{calibrate_pushed_unsafe = 0}
	endif
endscript

script calibrate_highway_return 
	calibrate_highway_setup_button_helpers
	setup_pause \{pad_start_script = calibrate_hit_pause}
	if ($calibrate_highway_state = menu)
		if NOT screenelementexists \{id = generic_barrel_vmenu}
			calibrate_create_menu
			clean_up_user_control_helpers
		endif
		launchevent \{type = focus
			target = generic_barrel_vmenu}
	else
		launchevent \{type = focus
			target = calibrate_highway_events_container}
	endif
endscript

script calibrate_highway_setup_button_helpers \{add_back_pill = 0}
	if NOT screenelementexists \{id = calibrationinterface}
		return
	endif
	if screenelementexists \{id = calibrate_highway_user_pills_container}
		destroyscreenelement \{id = calibrate_highway_user_pills_container}
	endif
	clean_up_user_control_helpers
	createscreenelement {
		id = calibrate_highway_user_pills_container
		parent = calibrationinterface
		type = menuelement
		scale = (0.75, 0.75)
		dims = (1024.0, 36.0)
		pos = (260.0, -42.0)
		pos_anchor = [center bottom]
		just = [center bottom]
		internal_just = [center center]
		isvertical = false
		position_children = true
		fit_major = `fit content if larger`
		fit_minor = `keep dims`
		spacing_between = 10
		z_priority = <z>
	}
	parent = calibrate_highway_user_pills_container
	getplayerinfo \{1
		controller}
	if ($calibrate_highway_state = menu)
		add_user_control_helper override_parent = <parent> text = qs(0xc18d5e76) button = green
		if (<add_back_pill> = 1)
			add_user_control_helper override_parent = <parent> text = qs(0xaf4d5dd2) button = red
		endif
	elseif ($calibrate_highway_state = video_dialog)
		add_user_control_helper override_parent = <parent> text = qs(0x182f0173) button = green
	elseif ($calibrate_highway_state = video)
		get_controller_type controller_index = <controller>
		if (<controller_type> = drum)
			if isps3
				button = yellow
			else
				button = blue
			endif
			add_user_control_helper override_parent = <parent> text = qs(0xda9efcde) button = <button>
		elseif (<controller_type> = vocals || <controller_type> = controller)
			if isps3
				button = yellow
			else
				button = rb
			endif
			add_user_control_helper override_parent = <parent> text = qs(0xda9efcde) button = <button>
		else
			add_user_control_helper override_parent = <parent> text = qs(0xda9efcde) button = strumbar
		endif
		add_user_control_helper override_parent = <parent> text = qs(0xf6a0ac6e) button = start
	elseif ($calibrate_highway_state = testchoice)
		add_user_control_helper override_parent = <parent> text = qs(0x58e0a1fb) button = green
		add_user_control_helper override_parent = <parent> text = qs(0xd2915c27) button = red
	elseif ($calibrate_highway_state = settingstest)
		get_controller_type controller_index = <controller>
		if (<controller_type> = vocals || <controller_type> = controller)
			if isps3
				button = yellow
			else
				button = rb
			endif
			add_user_control_helper override_parent = <parent> text = qs(0xda9efcde) button = <button>
		endif
		add_user_control_helper override_parent = <parent> text = qs(0x784c64ff) button = start
	elseif ($calibrate_highway_state = testcomplete)
		add_user_control_helper override_parent = <parent> text = qs(0x3fc1c076) button = start
	elseif ($calibrate_highway_state = audio)
		add_user_control_helper override_parent = <parent> text = qs(0x8e935177) button = strumbar
		add_user_control_helper override_parent = <parent> text = qs(0x182f0173) button = start
	elseif ($calibrate_highway_state = editing)
		add_user_control_helper override_parent = <parent> text = qs(0x8e935177) button = strumbar
		add_user_control_helper override_parent = <parent> text = qs(0x182f0173) button = start
	endif
endscript

script calibrate_restore_player_info 
	idx = 0
	begin
	if gotparam \{controllers_only}
		setplayerinfo (<idx> + 1) controller = ($calibrate_prev_parts [<idx>].controller)
	else
		setplayerinfo (<idx> + 1) difficulty = ($calibrate_prev_parts [<idx>].difficulty)
		setplayerinfo (<idx> + 1) part = ($calibrate_prev_parts [<idx>].part)
		setplayerinfo (<idx> + 1) controller = ($calibrate_prev_parts [<idx>].controller)
		setplayerinfo (<idx> + 1) double_kick_drum = ($calibrate_prev_parts [<idx>].double_kick_drum)
		setplayerinfo (<idx> + 1) in_game = 0
	endif
	idx = (<idx> + 1)
	repeat 4
endscript

script calibrate_highway_shutdown \{load_band_lobby_pak = 0}
	setscriptcannotpause
	pushunsafeforshutdown \{context = calibrate_highway_shutdown}
	if screenelementexists \{id = calibrationinterface}
		calibrationinterface :gettags
	endif
	if screenelementexists \{id = calibrate_highway_events_container}
		calibrate_highway_events_container :getsingletag \{device_num}
	endif
	if gotparam \{saved_late_hit_window}
		change check_time_late = <saved_late_hit_window>
	endif
	if screenelementexists \{id = calibrationinterface}
		destroyscreenelement \{id = calibrationinterface}
	endif
	destroy_generic_barrel_menu
	if (<load_band_lobby_pak> = 1)
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = 0
			id = lag_glitch_hider}
		setpakmancurrentblock \{map = ui_paks
			pakname = 'band_lobby'}
		hide_glitch \{num_frames = 12}
		fadetoblack \{off
			time = 0
			alpha = 1.0
			z_priority = 0
			id = lag_glitch_hider}
	endif
	killspawnedscript \{name = calibrate_hit_pause}
	calibrate_highway_kill_scripts
	change game_mode = ($calibrate_lag_previous_mode)
	change \{disable_note_input = 0}
	setup_pause
	calibrate_restore_player_info \{controllers_only}
	if NOT scriptisrunning \{kill_gem_scroller}
		kill_gem_scroller
	endif
	calibrate_restore_player_info
	if gotparam \{device_num}
		get_savegame_from_controller controller = <device_num>
		getglobaltags user_options savegame = <savegame> param = volumes
		ui_options_audio_get_buss_volume_full_dynamics volume = (<volumes>.guitar.sfx.vol)
		soundbussunlock \{user_sfx}
		setsoundbussparams {user_sfx = {vol = <vol>} time = 0}
		soundbusslock \{user_sfx}
	endif
	setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)} time = 1}
	setsoundbussparams {crowd_one_shots = {vol = ($default_bussset.crowd_one_shots.vol)} time = 1}
	spawnscriptnow \{gameevent_calibrateend}
	popunsafeforshutdown \{context = calibrate_highway_shutdown}
	change \{calibrate_lag_enabled = 0}
endscript

script calibrate_highway_setup_player 
	change \{calibrate_prev_parts = [
		]}
	<lowest_diff> = null
	idx = 1
	begin
	getplayerinfo <idx> difficulty
	getplayerinfo <idx> part
	getplayerinfo <idx> controller
	getplayerinfo <idx> in_game
	getplayerinfo <idx> double_kick_drum
	element = {difficulty = <difficulty> part = <part> controller = <controller> in_game = <in_game> double_kick_drum = <double_kick_drum>}
	addarrayelement array = $calibrate_prev_parts element = <element>
	change calibrate_prev_parts = <array>
	idx = (<idx> + 1)
	if (<lowest_diff> = null)
		<lowest_diff> = <difficulty>
	endif
	repeat 4
	calibrate_highway_setup_difficulty
	setplayerinfo \{1
		in_game = 0}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	setplayerinfo \{1
		double_kick_drum = 0}
	setplayerinfo \{2
		double_kick_drum = 0}
	setplayerinfo \{3
		double_kick_drum = 0}
	setplayerinfo \{4
		double_kick_drum = 0}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo 1 controller = <device_num>
	setplayerinfo 1 part = <old_part>
	usefourlanehighway \{player = 1
		reset}
	get_progression_instrument_user_option part = <old_part> controller = <device_num> option = 'lefty_flip'
	if (<user_option> != -1)
		setplayerinfo 1 lefty_flip = <user_option>
	endif
endscript

script calibrate_highway_setup_difficulty 
	setplayerinfo \{1
		difficulty = easy}
endscript

script calibrate_highway_create_notes 
	<time_spacing> = 666
	<initial_time> = 2500
	<num_gems> = 10
	if ($calibrate_highway_gameplay_state != settingstest)
		<green> = 0
		<red> = 0
		<yellow> = 0
		<blue> = 0
		<orange> = 0
		<white> = 0
		getplayerinfo \{1
			controller}
		get_controller_type controller_index = <controller>
		if (<controller_type> = drum)
			blue = 1
			color = 3
			strum_pattern = 16
		else
			yellow = 1
			strum_pattern = 256
		endif
		change \{calibrate_lag_notes_passed = 0}
		getfirstplayer
		getplayerinfo <player> difficulty
		idx = 0
		begin
		note_time = (<initial_time> + (<idx> * <time_spacing>))
		if (<idx> < (<num_gems> - 1))
			next_time = (<initial_time> + ((<idx> + 1) * <time_spacing>))
		else
			next_time = 0
		endif
		formattext checksumname = input_array 'input_arrayp%d' d = <player>
		inputarrayaddelement {
			name = <input_array>
			time = <note_time>
			green = <green>
			red = <red>
			yellow = <yellow>
			blue = <blue>
			orange = <orange>
			white = <white>
			hammer = 0
			next_time = <next_time>
			difficulty_idx = ($difficulty_list_props.<difficulty>.index)
			expert_plus_data = 0
		}
		if (($calibrate_highway_gameplay_state = audio) || ($calibrate_highway_gameplay_state = settingstest))
			calibrationinterface :obj_spawnscriptnow calibrate_highway_sound_beep params = {play_time = <note_time>}
		endif
		if ($calibrate_highway_gameplay_state = audio)
			calibrationinterface :obj_spawnscriptnow calibrate_highway_fake_note_hit params = {play_time = <note_time> strum_pattern = <strum_pattern> entry = <idx>}
		endif
		idx = (<idx> + 1)
		repeat <num_gems>
	endif
	if ($calibrate_highway_state = video || $calibrate_highway_state = audio)
		if ($calibrate_highway_state = video)
			begin
			if ($calibrate_lag_notes_passed >= <num_gems>)
				if calibrate_lag_calc_avg num_required = (<num_gems> / 2)
					change \{disable_note_input = 1}
					ui_sfx \{menustate = generic
						uitype = select}
					formattext textname = videolagtext qs(0x0f904228) d = ($calibrate_highway_video_offset * -1)
					calibrationinterface :se_setprops videolag_text = <videolagtext>
					setglobaltags user_options params = {lag_video_calibration = ($calibrate_highway_video_offset)}
					calibrate_highway_events_container :settags {
						temp_video_offset = ($calibrate_highway_video_offset)
					}
					wait \{1
						gameframe}
					spawnscriptnow \{ui_calibrate_skip
						params = {
							state = audio
						}}
					return
				endif
				break
			endif
			wait \{1
				gameframe}
			repeat
		endif
		begin
		getsongtimems
		if (<time> > (<note_time> + <time_spacing>))
			spawnscriptnow \{mock_highway_restart}
			break
		endif
		wait \{1
			gameframe}
		repeat
	elseif ($calibrate_highway_state = settingstest)
		spawnscriptnow \{calibrate_highway_win_song}
	endif
endscript

script calibrate_highway_win_song 
	songfilemanager func = get_song_end_time song_name = ($calibrate_lag_song)
	timemarkerreached_setparams time_offset = 0 time = <total_end_time>
	begin
	if timemarkerreached
		calibrate_highway_events_container :getsingletag \{device_num}
		spawnscriptnow calibrate_hit_pause params = {device_num = <device_num>}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script calibrate_fade_and_change_helpers \{state = editing}
	fade_time = 0.33
	safe_screenelement_fade id = calibrate_highway_user_pills_container alpha = 0 time = <fade_time>
	wait <fade_time> seconds
	change calibrate_highway_state = <state>
	calibrate_highway_setup_button_helpers
	safe_screenelement_fade id = calibrate_highway_user_pills_container alpha = 1 time = <fade_time>
endscript

script calibrate_highway_sound_beep 
	begin
	getsongtimems
	if (<time> >= <play_time> - $current_calibrate_audio_lag)
		soundevent \{event = audio_calibrate_beat_sfx}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script calibrate_highway_fake_note_hit 
	get_lag_values
	begin
	getsongtimems
	if (<time> >= <play_time> + <video_offset>)
		simulatenotehit player = 1 strum_pattern = <strum_pattern> entry = <entry>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script calibration_highway_hit_note 
	change calibrate_lag_notes_passed = ($calibrate_lag_notes_passed + 1)
endscript

script calibrate_lag_calc_avg 
	getarraysize \{$calibrate_history_times}
	if (<array_size> < <num_required>)
		return \{false}
	endif
	idx = 0
	avg = 0
	begin
	avg = (<avg> + $calibrate_history_times [<idx>])
	avgs = (<avg> / ((<idx> + 1) * 1.0))
	idx = (<idx> + 1)
	repeat <array_size>
	avg = (<avg> / (<array_size> * 1.0))
	casttointeger \{avg}
	if (<avg> < $calibrate_lag_min_threshold)
		avg = 0
	endif
	if (<avg> > 200)
		avg = 200
	endif
	avg = (<avg> * -1)
	change calibrate_highway_video_offset = <avg>
	return \{true}
endscript

script calibration_highway_miss_note 
	change calibrate_lag_notes_passed = ($calibrate_lag_notes_passed + 1)
endscript

script calibrate_highway_init_ui 
	if screenelementexists \{id = calibrationinterface}
		destroyscreenelement \{id = calibrationinterface}
	endif
	createscreenelement {
		type = descinterface
		parent = root_window
		id = calibrationinterface
		desc = 'calibrate_lag'
		helper_text = qs(0x119257ec)
		tags = {saved_late_hit_window = ($check_time_late)}
	}
	if calibrationinterface :desc_resolvealias \{name = alias_calibrate_menu_cont}
		assignalias id = <resolved_id> alias = calibrate_menu_cont
	else
		scriptassert \{qs(0x39249d35)}
	endif
	change \{check_time_late = 0.333}
	get_lag_values
	formattext textname = video_text qs(0x0f904228) d = (<video_offset> * -1)
	formattext textname = audio_text qs(0x6172b8bf) d = <audio_offset>
	change current_calibrate_audio_lag = <audio_offset>
	calibrationinterface :se_setprops videolag_text = <video_text> audiolag_text = <audio_text>
	createscreenelement {
		type = containerelement
		parent = calibrationinterface
		id = calibrate_highway_events_container
		event_handlers = [
			{focus ui_calibrate_option_focus}
			{unfocus ui_calibrate_option_unfocus}
			{pad_back calibrate_hit_back}
			{pad_choose calibrate_hit_choose}
			{pad_up calibrate_highway_change_lag params = {up}}
			{pad_down calibrate_highway_change_lag params = {down}}
		]
		exclusive_device = <device_num>
		tags = {current_changing = none device_num = <device_num> temp_video_offset = <video_offset> temp_audio_offset = <audio_offset>}
	}
	change \{disable_note_input = 1}
	spawnscriptnow \{calibrate_wait_for_hud}
endscript

script calibrate_wait_for_hud 
	begin
	getfirstplayer
	getplayerinfo <player> hud_parent
	if screenelementexists id = <hud_parent>
		break
	endif
	wait \{1
		gameframe}
	repeat
	launchevent \{type = focus
		target = calibrate_highway_events_container}
	calibrate_highway_setup_button_helpers
	setsoundbussparams \{crowd = {
			vol = -100
			pitch = 0.0
		}
		time = 1}
	setsoundbussparams \{crowd_one_shots = {
			vol = -100
			pitch = 0.0
		}
		time = 1}
	ui_options_audio_get_buss_volume_full_dynamics \{volume = 7}
	soundbussunlock \{user_sfx}
	setsoundbussparams {user_sfx = {vol = <vol>} time = 0}
	soundbusslock \{user_sfx}
endscript

script calibrate_create_menu 
	make_generic_barrel_menu \{parent = calibrate_menu_cont
		scale = 0.65000004
		pad_back_script = nullscript}
	add_generic_barrel_menu_text_item \{pad_choose_script = ui_calibrate_option_choose
		pad_choose_params = {
			menu_choice = adjust_video_lag
		}
		text = qs(0x84b073bd)}
	add_generic_barrel_menu_text_item \{pad_choose_script = ui_calibrate_option_choose
		pad_choose_params = {
			menu_choice = adjust_audio_lag
		}
		text = qs(0x0f328516)}
	add_generic_barrel_menu_text_item \{pad_choose_script = ui_calibrate_option_choose
		pad_choose_params = {
			menu_choice = reset_lags
		}
		text = qs(0x38ee4773)}
	add_generic_barrel_menu_text_item \{pad_choose_script = ui_calibrate_option_choose
		pad_choose_params = {
			menu_choice = note_calibrate
		}
		text = qs(0x0e56c83c)}
	add_generic_barrel_menu_text_item \{pad_choose_script = ui_calibrate_option_choose
		pad_choose_params = {
			menu_choice = settingstest
		}
		text = qs(0x7978089b)}
	calibrate_highway_events_container :getsingletag \{device_num}
	get_savegame_from_controller controller = <device_num>
	getglobaltags savegame = <savegame> user_options param = autosave
	show_save = 1
	if (<autosave> = 0)
		show_save = 0
	endif
	if NOT checkforsignin local controller_index = <device_num>
		show_save = 0
	endif
	confirm_text = qs(0x78e7dd5d)
	if demobuild
		show_save = 0
		confirm_text = qs(0xee938713)
	endif
	if (<show_save> = 1)
		add_generic_barrel_menu_text_item pad_choose_script = ui_calibrate_option_choose pad_choose_params = {menu_choice = save_and_exit} text = <confirm_text>
	else
		add_generic_barrel_menu_text_item \{pad_choose_script = ui_calibrate_option_choose
			pad_choose_params = {
				menu_choice = save_and_exit
				nosave = 1
			}
			text = qs(0x78e7dd5d)}
	endif
	add_generic_barrel_menu_text_item \{pad_choose_script = ui_calibrate_option_choose
		pad_choose_params = {
			menu_choice = cancel
		}
		text = qs(0xf7723015)}
	generic_barrel_menu_finish \{index = 3}
endscript

script calibrate_hit_back 
	if ($calibrate_highway_state = menu)
		get_lag_values
		calibrate_highway_events_container :settags {
			temp_video_offset = <video_offset>
			temp_audio_offset = <audio_offset>
		}
		formattext textname = video_text qs(0x0f904228) d = (<video_offset> * -1)
		formattext textname = audio_text qs(0x6172b8bf) d = <audio_offset>
		calibrationinterface :se_setprops videolag_text = <video_text> audiolag_text = <audio_text>
		calibrate_highway_setup_button_helpers
		launchevent \{type = unfocus
			target = calibrate_highway_events_container}
		launchevent \{type = focus
			target = generic_barrel_vmenu}
		ui_sfx \{menustate = generic
			uitype = back}
	elseif ($calibrate_highway_state = testchoice)
		change \{calibrating_helper_text = qs(0x03ac90f0)}
		calibrate_proceed_to_menu
	endif
endscript

script calibrate_hit_choose 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gettags
	if ($calibrate_highway_state = video_dialog)
		ui_sfx \{menustate = generic
			uitype = select}
		launchevent \{type = unfocus
			target = calibrate_highway_events_container}
		calibrationinterface :se_setprops \{helper_alpha = 0
			time = 0.5}
		calibrationinterface :se_waitprops
		calibrate_create_menu
		launchevent \{type = focus
			target = generic_barrel_vmenu}
		change \{calibrate_highway_state = menu}
		calibrate_highway_setup_button_helpers
	elseif ($calibrate_highway_state = menu)
		calibrate_highway_events_container :gettags
		change current_calibrate_audio_lag = <temp_audio_offset>
		setglobaltags user_options params = {lag_video_calibration = <temp_video_offset> lag_audio_calibration = ($current_calibrate_audio_lag)}
		launchevent \{type = unfocus
			target = calibrate_highway_events_container}
		launchevent \{type = focus
			target = generic_barrel_vmenu}
		ui_sfx \{menustate = generic
			uitype = back}
		calibrate_highway_setup_button_helpers
	elseif ($calibrate_highway_state = testchoice)
		disable_pause
		ui_sfx \{menustate = generic
			uitype = select}
		ui_calibrate_skip \{state = settingstest}
	endif
endscript

script calibrate_highway_change_lag 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gettags
	if ($calibrate_highway_state = menu)
		ui_calibrate_lag_change <...>
		return
	elseif NOT ($calibrate_highway_state = editing || $calibrate_highway_state = audio)
		return
	endif
	get_lag_values
	if gotparam \{up}
		change_val = -1
	elseif gotparam \{down}
		change_val = 1
	else
		change_val = 0
	endif
	if ($calibrate_highway_gameplay_state = video)
		video_offset = ($calibrate_highway_video_offset + <change_val>)
		if (<video_offset> < -200 || <video_offset> > 0)
			return
		endif
		change calibrate_highway_video_offset = <video_offset>
		setglobaltags user_options params = {lag_video_calibration = ($calibrate_highway_video_offset)}
		calibrate_highway_events_container :settags {
			temp_video_offset = <video_offset>
		}
	elseif ($calibrate_highway_gameplay_state = audio)
		change_val = (<change_val> * -1)
		audio_offset = ($current_calibrate_audio_lag + <change_val>)
		if (<audio_offset> < 0 || <audio_offset> > 200)
			return
		endif
		change current_calibrate_audio_lag = <audio_offset>
		setglobaltags user_options params = {lag_audio_calibration = <audio_offset>}
		calibrate_highway_events_container :settags {
			temp_audio_offset = <audio_offset>
		}
	endif
	if ($calibrate_highway_gameplay_state = video)
		formattext textname = lag_text qs(0x0f904228) d = (<video_offset> * -1)
		calibrationinterface :se_setprops videolag_text = <lag_text>
	elseif ($calibrate_highway_gameplay_state = audio)
		formattext textname = lag_text qs(0x6172b8bf) d = ($current_calibrate_audio_lag)
		calibrationinterface :se_setprops audiolag_text = <lag_text>
	endif
	if gotparam \{up}
		ui_sfx \{menustate = calibrate
			uitype = scrollup}
	elseif gotparam \{down}
		ui_sfx \{menustate = calibrate
			uitype = scrolldown}
	endif
endscript

script calibrate_highway_kill_scripts 
	killspawnedscript \{name = calibrate_wait_for_hud}
	killspawnedscript \{name = mock_highway_restart}
	killspawnedscript \{name = calibrate_highway_create_notes}
	killspawnedscript \{name = calibrate_highway_sound_beep}
	killspawnedscript \{name = calibrate_highway_fake_note_hit}
	killspawnedscript \{name = calibrate_highway_win_song}
endscript

script mock_highway_restart \{fade_helpers = 0
		restart_notes = 1
		enable_input = 0}
	getfirstplayer
	setplayerinfo <player> current_run = 0
	resetplayernotestreak player = <player>
	updaterunchange player = <player>
	fade_time = 0.66
	screenelement_highway_fade alpha = 0 rgba = [0 0 0 255] fade_time = <fade_time> player = <player> fade_helpers = <fade_helpers>
	wait <fade_time> seconds ignoreslomo
	if ($calibrate_highway_gameplay_state = settingstest)
		getplayerinfo <player> controller
		get_controller_type controller_index = <controller>
		if (<controller_type> = vocals || <controller_type> = controller)
			setplayerinfo <player> difficulty = beginner
		endif
	else
		calibrate_highway_setup_difficulty
	endif
	if ($calibrate_highway_gameplay_state = settingstest)
		change \{disable_note_input = 0}
		calibrationinterface :gettags
		change check_time_late = <saved_late_hit_window>
	else
		change \{check_time_late = 0.333}
	endif
	getplayerinfo <player> difficulty
	change \{calibrate_history_times = [
		]}
	if ($calibrate_highway_gameplay_state = audio)
		if isps3
			change \{calibrating_helper_text = qs(0x68709069)}
		else
			change \{calibrating_helper_text = qs(0x80cd97b9)}
		endif
		calibrationinterface :se_setprops \{helper_alpha = 1
			time = 0.5}
		calibrate_highway_events_container :settags \{current_changing = audio}
		launchevent \{type = focus
			target = calibrate_highway_events_container}
	elseif ($calibrate_highway_gameplay_state = testchoice)
		change \{calibrating_helper_text = qs(0x51599bfb)}
		setup_pause \{pad_start_script = calibrate_hit_pause}
		calibrate_highway_events_container :settags \{current_changing = none}
		launchevent \{type = focus
			target = calibrate_highway_events_container}
	elseif ($calibrate_highway_gameplay_state = settingstest)
		if isps3
			change \{calibrating_helper_text = qs(0xa2654044)}
		else
			change \{calibrating_helper_text = qs(0x5e531a89)}
		endif
	elseif ($calibrate_highway_gameplay_state = testcomplete)
		change \{calibrating_helper_text = qs(0x9a3cf444)}
		setup_pause \{pad_start_script = calibrate_hit_pause}
		calibrate_highway_events_container :settags \{current_changing = none}
		launchevent \{type = focus
			target = calibrate_highway_events_container}
	endif
	calibrationinterface :se_setprops helper_text = ($calibrating_helper_text)
	calibrationinterface :se_setprops \{helper_alpha = 1
		time = 0.5}
	practice_kill_gem_scroller player = <player>
	wait \{1
		gameframe}
	reset_song_time \{starttime = -3000}
	songaudiodeinit
	if ($calibrate_highway_gameplay_state = settingstest)
		guitar_support_load_song {
			song = ($calibrate_lag_song)
			song_start_time = 0
		}
		spawnscriptnow \{begin_song_after_intro
			params = {
				starttimeafterintro = 0
			}}
	endif
	practice_restart_gem_scroller player = <player> difficulty = <difficulty>
	wait <fade_time> seconds ignoreslomo
	screenelement_highway_fade alpha = 1 rgba = [255 255 255 255] fade_time = <fade_time> player = <player> fade_helpers = <fade_helpers>
	if (<restart_notes> = 1)
		change \{calibrate_highway_state = $calibrate_highway_gameplay_state}
	endif
	calibrate_highway_setup_button_helpers
	if NOT ($calibrate_highway_gameplay_state = settingstest)
		formattext checksumname = input_array 'input_arrayp%d' d = <player>
		inputarraycreate name = <input_array>
		setplayerinfo <player> last_inactive_gem_time = 0
		resetsongtimer \{starttime = 0}
	endif
	change \{songtime_paused = 0}
	if (<restart_notes> = 1)
		spawnscriptnow \{calibrate_highway_create_notes}
		setup_pause \{pad_start_script = calibrate_hit_pause}
	endif
	if (<enable_input> = 1)
		change \{disable_note_input = 0}
	endif
endscript

script calibrate_hit_select 
	if NOT ($calibrate_highway_state = audio || $calibrate_highway_state = editing)
		return
	endif
	calibrate_highway_kill_scripts
	calibrate_fade_and_change_helpers \{state = video}
	calibrationinterface :se_setprops \{helper_alpha = 0
		time = 0.5}
	change \{disable_note_input = 0}
	spawnscriptnow \{mock_highway_restart}
endscript

script calibrate_hit_pause 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if scriptisrunning \{mock_highway_restart}
		return
	endif
	controller = <device_num>
	if screenelementexists \{id = calibrate_highway_events_container}
		calibrate_highway_events_container :getsingletag \{device_num}
		if (<controller> != <device_num>)
			return
		endif
	endif
	change \{calibrating_helper_text = qs(0x03ac90f0)}
	if ($calibrate_highway_state = video || $calibrate_highway_state = editing)
		disable_pause
		ui_sfx \{menustate = generic
			uitype = select}
		change \{disable_note_input = 1}
		ui_calibrate_skip \{state = audio}
	elseif ($calibrate_highway_state = audio)
		disable_pause
		ui_sfx \{menustate = generic
			uitype = select}
		change \{disable_note_input = 1}
		change \{calibrate_highway_state = testchoice}
		ui_calibrate_skip \{state = testchoice
			restart_notes = 0}
	elseif ($calibrate_highway_state = settingstest)
		songaudiostop
		killspawnedscript \{name = calibrate_highway_win_song}
		if ($calibrate_test_from_menu = 1)
			calibrate_proceed_to_menu
		else
			disable_pause
			ui_sfx \{menustate = generic
				uitype = select}
			change \{disable_note_input = 1}
			change \{calibrate_highway_state = testcomplete}
			ui_calibrate_skip \{state = testcomplete
				restart_notes = 0}
		endif
		getfirstplayer
		practice_kill_gem_scroller player = <player>
	elseif ($calibrate_highway_state = testcomplete)
		calibrate_proceed_to_menu
	endif
endscript

script calibrate_proceed_to_menu 
	disable_pause
	ui_sfx \{menustate = generic
		uitype = select}
	change \{calibrate_highway_state = menu}
	change \{disable_note_input = 1}
	ui_calibrate_skip \{state = video
		restart_notes = 0
		fade_helpers = 0}
	calibrationinterface :se_setprops \{helper_alpha = 0
		time = 0.5}
	calibrationinterface :se_waitprops
	calibrate_create_menu
	launchevent \{type = focus
		target = generic_barrel_vmenu}
	calibrate_highway_setup_button_helpers
endscript

script screenelement_highway_fade 
	formattext checksumname = gem_notes_container_name 'gem_notes_containerp%p' p = <player>
	formattext checksumname = fretbar_container_name 'fretbar_containerp%p' p = <player>
	formattext checksumname = highway_2d_container 'Highway_2Dp%p' p = <player>
	formattext checksumname = right_ns_id 'sidebar_right_ns_meterp%p' p = <player>
	safe_screenelement_fade id = <right_ns_id> alpha = <alpha> time = <fade_time>
	safe_screenelement_fade id = <fretbar_container_name> alpha = <alpha> time = <fade_time>
	safe_screenelement_fade id = <gem_notes_container_name> alpha = <alpha> time = <fade_time>
	if (<fade_helpers> = 1)
		safe_screenelement_fade id = calibrate_highway_user_pills_container alpha = <alpha> time = <fade_time>
	endif
	safe_screenelement_fade id = <highway_2d_container> alpha = <alpha> time = <fade_time>
endscript

script wait_for_calibrate_shutdown 
	if scriptisrunning \{calibrate_highway_shutdown}
		begin
		printf \{'waiting for calibrate_highway_shutdown to finish...'}
		wait \{1
			gameframe}
		if NOT scriptisrunning \{calibrate_highway_shutdown}
			break
		endif
		repeat
	endif
endscript
