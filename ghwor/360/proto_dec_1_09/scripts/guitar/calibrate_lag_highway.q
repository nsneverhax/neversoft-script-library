calibrate_lag_song = demon
calibrate_lag_enabled = 0
calibrate_lag_previous_mode = None
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

script calibrate_highway_start_song 
	Change \{calibrate_highway_state = video_dialog}
	Change \{calibrate_highway_gameplay_state = video}
	calibrate_highway_setup_player device_num = <device_num> old_part = <part>
	calibrate_highway_setup <...>
endscript

script calibrate_highway_setup 
	Change \{calibreate_history_index = 0}
	Change \{calibrate_history_times = [
		]}
	setup_pause \{pad_start_script = calibrate_hit_pause}
	calibrate_highway_init_ui <...>
	calibrationinterface :obj_spawnscript \{calibrate_wait_and_focus}
	SpawnScriptNow \{gameevent_calibratebegin}
	SpawnScriptLater \{calibrate_highway_setup_button_helpers
		params = {
			Wait
		}}
endscript

script calibrate_wait_and_focus 
	Wait \{1
		gameframes}
	LaunchEvent \{Type = focus
		target = calibrate_highway_events_container}
endscript

script calibrate_highway_return 
	calibrate_highway_setup_button_helpers
	setup_pause \{pad_start_script = calibrate_hit_pause}
	if ($calibrate_highway_state = menu)
		LaunchEvent \{Type = focus
			target = generic_barrel_vmenu}
	else
		LaunchEvent \{Type = focus
			target = calibrate_highway_events_container}
	endif
endscript

script calibrate_highway_setup_button_helpers 
	if GotParam \{Wait}
		Wait \{5
			gameframes}
	endif
	if NOT ScreenElementExists \{id = calibrationinterface}
		return
	endif
	if ScreenElementExists \{id = calibrate_highway_user_pills_container}
		DestroyScreenElement \{id = calibrate_highway_user_pills_container}
	endif
	clean_up_user_control_helpers
	CreateScreenElement {
		id = calibrate_highway_user_pills_container
		parent = calibrationinterface
		Type = menuelement
		dims = (1024.0, 36.0)
		Pos = (0.0, -36.0)
		pos_anchor = [center bottom]
		just = [center bottom]
		internal_just = [center center]
		isvertical = FALSE
		position_children = true
		fit_major = `fit	content	if	larger`
		fit_minor = `keep	dims`
		spacing_between = 10
		z_priority = <z>
	}
	parent = calibrate_highway_user_pills_container
	if ($calibrate_highway_state = menu)
		add_user_control_helper override_parent = <parent> text = qs(0xc18d5e76) button = green
	elseif ($calibrate_highway_state = video_dialog)
		add_user_control_helper override_parent = <parent> text = qs(0x182f0173) button = green
	elseif ($calibrate_highway_state = video)
		getplayerinfo \{1
			controller}
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
		add_user_control_helper override_parent = <parent> text = qs(0x58e0a1fb) button = start
		add_user_control_helper override_parent = <parent> text = qs(0xd2915c27) button = red
	elseif ($calibrate_highway_state = settingstest)
		getplayerinfo \{1
			controller}
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
	if GotParam \{controllers_only}
		setplayerinfo (<idx> + 1) controller = ($calibrate_prev_parts [<idx>].controller)
	else
		setplayerinfo (<idx> + 1) difficulty = ($calibrate_prev_parts [<idx>].difficulty)
		setplayerinfo (<idx> + 1) part = ($calibrate_prev_parts [<idx>].part)
		setplayerinfo (<idx> + 1) controller = ($calibrate_prev_parts [<idx>].controller)
		setplayerinfo (<idx> + 1) in_game = 0
	endif
	idx = (<idx> + 1)
	repeat 4
endscript

script calibrate_highway_shutdown 
	calibrationinterface :GetTags
	calibrate_highway_events_container :GetSingleTag \{device_num}
	Change check_time_late = <saved_late_hit_window>
	if ScreenElementExists \{id = calibrationinterface}
		DestroyScreenElement \{id = calibrationinterface}
	endif
	destroy_generic_barrel_menu
	KillSpawnedScript \{Name = calibrate_hit_pause}
	calibrate_highway_kill_scripts
	Change game_mode = ($calibrate_lag_previous_mode)
	Change \{calibrate_lag_enabled = 0}
	Change \{disable_note_input = 0}
	setup_pause
	begin
	if isshutdownsafe
		break
	endif
	Wait \{1
		gameframe}
	repeat
	calibrate_restore_player_info \{controllers_only}
	kill_gem_scroller
	calibrate_restore_player_info
	get_savegame_from_controller controller = <device_num>
	GetGlobalTags user_options savegame = <savegame> param = volumes
	ui_options_audio_get_buss_volume_full_dynamics Volume = (<volumes>.guitar.sfx.vol)
	SoundBussUnlock \{User_SFX}
	setsoundbussparams {User_SFX = {vol = <vol>} time = 0}
	SoundBussLock \{User_SFX}
	setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 1}
	setsoundbussparams {Crowd_One_Shots = {vol = ($default_BussSet.Crowd_One_Shots.vol)} time = 1}
	SpawnScriptNow \{gameevent_calibrateend}
endscript

script calibrate_highway_setup_player 
	Change \{calibrate_prev_parts = [
		]}
	<lowest_diff> = NULL
	idx = 1
	begin
	getplayerinfo <idx> difficulty
	getplayerinfo <idx> part
	getplayerinfo <idx> controller
	getplayerinfo <idx> in_game
	element = {difficulty = <difficulty> part = <part> controller = <controller> in_game = <in_game>}
	AddArrayElement array = $calibrate_prev_parts element = <element>
	Change calibrate_prev_parts = <array>
	idx = (<idx> + 1)
	if (<lowest_diff> = NULL)
		<lowest_diff> = <difficulty>
	endif
	repeat 4
	setplayerinfo \{1
		in_game = 0}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	if ($current_song_qpak = jamsession)
		setplayerinfo 1 difficulty = <lowest_diff>
	else
		setplayerinfo \{1
			difficulty = easy}
	endif
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo 1 controller = <device_num>
	setplayerinfo 1 part = <old_part>
	usefourlanehighway \{Player = 1
		reset}
	get_progression_instrument_user_option part = <old_part> controller = <device_num> option = 'lefty_flip'
	if (<user_option> != -1)
		setplayerinfo 1 lefty_flip = <user_option>
	endif
endscript

script calibrate_highway_create_notes 
	if ($calibrate_highway_gameplay_state != settingstest)
		time_spacing = 666
		initial_time = 2500
		green = 0
		red = 0
		yellow = 0
		blue = 0
		orange = 0
		white = 0
		num_gems = 10
		getplayerinfo \{1
			controller}
		get_controller_type controller_index = <controller>
		if (<controller_type> = drum)
			blue = 1
			Color = 3
			strum_pattern = 16
		else
			yellow = 1
			strum_pattern = 256
		endif
		Change \{calibrate_lag_notes_passed = 0}
		getfirstplayer
		getplayerinfo <Player> difficulty
		idx = 0
		begin
		note_time = (<initial_time> + (<idx> * <time_spacing>))
		if (<idx> < (<num_gems> - 1))
			next_time = (<initial_time> + ((<idx> + 1) * <time_spacing>))
		else
			next_time = 0
		endif
		formatText checksumName = input_array 'input_arrayp%d' d = <Player>
		inputarrayaddelement {
			Name = <input_array>
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
			calibrationinterface :Obj_SpawnScriptNow calibrate_highway_sound_beep params = {play_time = <note_time>}
		endif
		if ($calibrate_highway_gameplay_state = audio)
			calibrationinterface :Obj_SpawnScriptNow calibrate_highway_fake_note_hit params = {play_time = <note_time> strum_pattern = <strum_pattern> entry = <idx>}
		endif
		idx = (<idx> + 1)
		repeat <num_gems>
	endif
	if ($calibrate_highway_state = video)
		begin
		if ($calibrate_lag_notes_passed >= <num_gems>)
			if calibrate_lag_calc_avg num_required = (<num_gems> / 2)
				Change \{disable_note_input = 1}
				ui_sfx \{menustate = Generic
					uitype = select}
				formatText TextName = videolagtext qs(0x0f904228) d = ($calibrate_highway_video_offset * -1)
				calibrationinterface :se_setprops videolag_text = <videolagtext>
				SetGlobalTags user_options params = {lag_video_calibration = ($calibrate_highway_video_offset)}
				Wait \{1
					gameframe}
				SpawnScriptNow \{ui_calibrate_skip
					params = {
						state = audio
					}}
				return
			endif
			break
		endif
		Wait \{1
			gameframe}
		repeat
	elseif ($calibrate_highway_state = audio)
		begin
		GetSongTimeMs
		if (<time> > (<note_time> + <time_spacing>))
			SpawnScriptNow \{mock_highway_restart}
			break
		endif
		Wait \{1
			gameframe}
		repeat
	elseif ($calibrate_highway_state = settingstest)
		SpawnScriptNow \{calibrate_highway_win_song}
	endif
endscript

script calibrate_highway_win_song 
	songfilemanager func = get_song_end_time song_name = ($calibrate_lag_song)
	TimeMarkerReached_SetParams time_offset = 0 time = <total_end_time>
	begin
	if TimeMarkerReached
		calibrate_highway_events_container :GetSingleTag \{device_num}
		SpawnScriptNow calibrate_hit_pause params = {device_num = <device_num>}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script calibrate_fade_and_change_helpers \{state = editing}
	fade_time = 0.33
	safe_screenelement_fade id = calibrate_highway_user_pills_container alpha = 0 time = <fade_time>
	Wait <fade_time> Seconds
	Change calibrate_highway_state = <state>
	calibrate_highway_setup_button_helpers
	safe_screenelement_fade id = calibrate_highway_user_pills_container alpha = 1 time = <fade_time>
endscript

script calibrate_highway_sound_beep 
	begin
	GetSongTimeMs
	if (<time> >= <play_time> - $current_calibrate_audio_lag)
		SoundEvent \{event = audio_calibrate_beat_sfx}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script calibrate_highway_fake_note_hit 
	get_lag_values
	begin
	GetSongTimeMs
	if (<time> >= <play_time> + <video_offset>)
		simulatenotehit Player = 1 strum_pattern = <strum_pattern> entry = <entry>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script calibration_highway_hit_note 
	Change calibrate_lag_notes_passed = ($calibrate_lag_notes_passed + 1)
endscript

script calibrate_lag_calc_avg 
	GetArraySize \{$calibrate_history_times}
	if (<array_Size> < <num_required>)
		return \{FALSE}
	endif
	idx = 0
	avg = 0
	begin
	avg = (<avg> + $calibrate_history_times [<idx>])
	avgs = (<avg> / ((<idx> + 1) * 1.0))
	idx = (<idx> + 1)
	repeat <array_Size>
	avg = (<avg> / (<array_Size> * 1.0))
	CastToInteger \{avg}
	if (<avg> < $calibrate_lag_min_threshold)
		avg = 0
	endif
	if (<avg> > 200)
		avg = 200
	endif
	avg = (<avg> * -1)
	Change calibrate_highway_video_offset = <avg>
	return \{true}
endscript

script calibration_highway_miss_note 
	Change calibrate_lag_notes_passed = ($calibrate_lag_notes_passed + 1)
endscript

script calibrate_highway_init_ui 
	if ScreenElementExists \{id = calibrationinterface}
		DestroyScreenElement \{id = calibrationinterface}
	endif
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		id = calibrationinterface
		desc = 'calibrate_lag'
		helper_text = qs(0x119257ec)
		tags = {saved_late_hit_window = ($check_time_late)}
	}
	if calibrationinterface :desc_resolvealias \{Name = alias_calibrate_menu_cont}
		AssignAlias id = <resolved_id> alias = calibrate_menu_cont
	else
		ScriptAssert \{qs(0x39249d35)}
	endif
	Change \{check_time_late = 0.333}
	get_lag_values
	formatText TextName = video_text qs(0x0f904228) d = (<video_offset> * -1)
	formatText TextName = audio_text qs(0x6172b8bf) d = <audio_offset>
	Change current_calibrate_audio_lag = <audio_offset>
	calibrationinterface :se_setprops videolag_text = <video_text> audiolag_text = <audio_text>
	CreateScreenElement {
		Type = ContainerElement
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
		tags = {current_changing = None device_num = <device_num>}
	}
	Change \{disable_note_input = 1}
	SpawnScriptNow \{calibrate_wait_for_hud}
endscript

script calibrate_wait_for_hud 
	getfirstplayer
	getplayerinfo <Player> hud_parent
	begin
	if ScreenElementExists id = <hud_parent>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	setsoundbussparams \{Crowd = {
			vol = -100
			pitch = 0.0
		}
		time = 1}
	setsoundbussparams \{Crowd_One_Shots = {
			vol = -100
			pitch = 0.0
		}
		time = 1}
	ui_options_audio_get_buss_volume_full_dynamics \{Volume = 7}
	SoundBussUnlock \{User_SFX}
	setsoundbussparams {User_SFX = {vol = <vol>} time = 0}
	SoundBussLock \{User_SFX}
endscript

script calibrate_create_menu 
	make_generic_barrel_menu \{parent = calibrate_menu_cont
		Scale = 0.8
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
	calibrate_highway_events_container :GetSingleTag \{device_num}
	get_savegame_from_controller controller = <device_num>
	GetGlobalTags savegame = <savegame> user_options param = autosave
	show_save = 1
	if (<autosave> = 0)
		show_save = 0
	endif
	if NOT CheckForSignIn local controller_index = <device_num>
		show_save = 0
	endif
	confirm_text = qs(0xf62e7772)
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
			text = qs(0xbca32344)}
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
		LaunchEvent \{Type = unfocus
			target = calibrate_highway_events_container}
		LaunchEvent \{Type = focus
			target = generic_barrel_vmenu}
		Change \{disable_note_input = 0}
		ui_sfx \{menustate = Generic
			uitype = back}
	elseif ($calibrate_highway_state = testchoice)
		Change \{calibrating_helper_text = qs(0x03ac90f0)}
		calibrate_proceed_to_menu
	endif
endscript

script calibrate_hit_choose 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	if ($calibrate_highway_state = video_dialog)
		ui_sfx \{menustate = Generic
			uitype = select}
		LaunchEvent \{Type = unfocus
			target = calibrate_highway_events_container}
		calibrationinterface :se_setprops \{helper_alpha = 0
			time = 0.5}
		calibrationinterface :se_waitprops
		calibrate_create_menu
		LaunchEvent \{Type = focus
			target = generic_barrel_vmenu}
		Change \{calibrate_highway_state = menu}
		calibrate_highway_setup_button_helpers
	elseif ($calibrate_highway_state = menu)
		LaunchEvent \{Type = unfocus
			target = calibrate_highway_events_container}
		LaunchEvent \{Type = focus
			target = generic_barrel_vmenu}
		ui_sfx \{menustate = Generic
			uitype = back}
	endif
endscript

script calibrate_highway_change_lag 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	if ($calibrate_highway_state = menu)
		ui_calibrate_lag_change <...>
		return
	elseif NOT ($calibrate_highway_state = editing || $calibrate_highway_state = audio)
		return
	endif
	get_lag_values
	if GotParam \{up}
		ui_sfx \{menustate = Generic
			uitype = scrollup}
		change_val = -1
	elseif GotParam \{down}
		ui_sfx \{menustate = Generic
			uitype = scrolldown}
		change_val = 1
	else
		change_val = 0
	endif
	if ($calibrate_highway_gameplay_state = video)
		video_offset = ($calibrate_highway_video_offset + <change_val>)
		if (<video_offset> < -200 || <video_offset> > 0)
			return
		endif
		Change calibrate_highway_video_offset = <video_offset>
		SetGlobalTags user_options params = {lag_video_calibration = ($calibrate_highway_video_offset)}
	elseif ($calibrate_highway_gameplay_state = audio)
		change_val = (<change_val> * -1)
		audio_offset = ($current_calibrate_audio_lag + <change_val>)
		if (<audio_offset> < 0 || <audio_offset> > 200)
			return
		endif
		Change current_calibrate_audio_lag = <audio_offset>
	endif
	if ($calibrate_highway_gameplay_state = video)
		formatText TextName = lag_text qs(0x0f904228) d = (<video_offset> * -1)
		calibrationinterface :se_setprops videolag_text = <lag_text>
	elseif ($calibrate_highway_gameplay_state = audio)
		formatText TextName = lag_text qs(0x6172b8bf) d = ($current_calibrate_audio_lag)
		calibrationinterface :se_setprops audiolag_text = <lag_text>
	endif
endscript

script calibrate_highway_kill_scripts 
	KillSpawnedScript \{Name = calibrate_wait_for_hud}
	KillSpawnedScript \{Name = mock_highway_restart}
	KillSpawnedScript \{Name = calibrate_highway_create_notes}
	KillSpawnedScript \{Name = calibrate_highway_sound_beep}
	KillSpawnedScript \{Name = calibrate_highway_fake_note_hit}
	KillSpawnedScript \{Name = calibrate_highway_win_song}
endscript

script mock_highway_restart \{fade_helpers = 0
		restart_notes = 1}
	getfirstplayer
	if ($calibrate_highway_gameplay_state = settingstest)
		playlist_clear
		playlist_addsong song = ($calibrate_lag_song)
	else
		formatText checksumName = input_array 'input_arrayp%d' d = <Player>
		InputArrayCreate Name = <input_array>
		setplayerinfo <Player> last_inactive_gem_time = 0
	endif
	fade_time = 0.66
	screenelement_highway_fade alpha = 0 rgba = [0 0 0 255] fade_time = <fade_time> Player = <Player> fade_helpers = <fade_helpers>
	Wait <fade_time> Seconds ignoreslomo
	getplayerinfo <Player> difficulty
	Change \{calibrate_history_times = [
		]}
	if ($calibrate_highway_gameplay_state = audio)
		if isps3
			Change \{calibrating_helper_text = qs(0x3de52c6a)}
		else
			Change \{calibrating_helper_text = qs(0xcc266a9a)}
		endif
		calibrationinterface :se_setprops \{helper_alpha = 1
			time = 0.5}
		calibrate_highway_events_container :SetTags \{current_changing = audio}
		LaunchEvent \{Type = focus
			target = calibrate_highway_events_container}
	elseif ($calibrate_highway_gameplay_state = testchoice)
		Change \{calibrating_helper_text = qs(0x51599bfb)}
		setup_pause \{pad_start_script = calibrate_hit_pause}
		calibrate_highway_events_container :SetTags \{current_changing = None}
		LaunchEvent \{Type = focus
			target = calibrate_highway_events_container}
	elseif ($calibrate_highway_gameplay_state = settingstest)
		Change \{calibrating_helper_text = qs(0x307f2b87)}
	elseif ($calibrate_highway_gameplay_state = testcomplete)
		Change \{calibrating_helper_text = qs(0xf2e129fe)}
		setup_pause \{pad_start_script = calibrate_hit_pause}
		calibrate_highway_events_container :SetTags \{current_changing = None}
		LaunchEvent \{Type = focus
			target = calibrate_highway_events_container}
	endif
	calibrationinterface :se_setprops helper_text = ($calibrating_helper_text)
	calibrationinterface :se_setprops \{helper_alpha = 1
		time = 0.5}
	practice_kill_gem_scroller Player = <Player>
	Wait \{1
		gameframe}
	practice_restart_gem_scroller Player = <Player> difficulty = <difficulty>
	Wait <fade_time> Seconds ignoreslomo
	screenelement_highway_fade alpha = 1 rgba = [255 255 255 255] fade_time = <fade_time> Player = <Player> fade_helpers = <fade_helpers>
	if (<restart_notes> = 1)
		Change \{calibrate_highway_state = $calibrate_highway_gameplay_state}
	endif
	calibrate_highway_setup_button_helpers
	ResetSongTimer \{starttime = 0}
	Change \{songtime_paused = 0}
	if (<restart_notes> = 1)
		SpawnScriptNow \{calibrate_highway_create_notes}
		setup_pause \{pad_start_script = calibrate_hit_pause}
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
	Change \{disable_note_input = 0}
	SpawnScriptNow \{mock_highway_restart}
endscript

script calibrate_hit_pause 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScriptIsRunning \{mock_highway_restart}
		return
	endif
	controller = <device_num>
	if ScreenElementExists \{id = calibrate_highway_events_container}
		calibrate_highway_events_container :GetSingleTag \{device_num}
		if (<controller> != <device_num>)
			return
		endif
	endif
	Change \{calibrating_helper_text = qs(0x03ac90f0)}
	if ($calibrate_highway_state = video || $calibrate_highway_state = editing)
		disable_pause
		ui_sfx \{menustate = Generic
			uitype = select}
		Change \{disable_note_input = 1}
		ui_calibrate_skip \{state = audio}
	elseif ($calibrate_highway_state = audio)
		disable_pause
		ui_sfx \{menustate = Generic
			uitype = select}
		Change \{disable_note_input = 1}
		Change \{calibrate_highway_state = testchoice}
		ui_calibrate_skip \{state = testchoice
			restart_notes = 0}
	elseif ($calibrate_highway_state = testchoice)
		disable_pause
		ui_sfx \{menustate = Generic
			uitype = select}
		Change \{disable_note_input = 0}
		ui_calibrate_skip \{state = settingstest}
	elseif ($calibrate_highway_state = settingstest)
		KillSpawnedScript \{Name = calibrate_highway_win_song}
		if ($calibrate_test_from_menu = 1)
			calibrate_proceed_to_menu
		else
			disable_pause
			ui_sfx \{menustate = Generic
				uitype = select}
			Change \{disable_note_input = 1}
			Change \{calibrate_highway_state = testcomplete}
			ui_calibrate_skip \{state = testcomplete
				restart_notes = 0}
		endif
	elseif ($calibrate_highway_state = testcomplete)
		calibrate_proceed_to_menu
	endif
endscript

script calibrate_proceed_to_menu 
	disable_pause
	ui_sfx \{menustate = Generic
		uitype = select}
	Change \{calibrate_highway_state = menu}
	Change \{disable_note_input = 1}
	ui_calibrate_skip \{state = video
		restart_notes = 0
		fade_helpers = 0}
	calibrationinterface :se_setprops \{helper_alpha = 0
		time = 0.5}
	calibrationinterface :se_waitprops
	calibrate_create_menu
	LaunchEvent \{Type = focus
		target = generic_barrel_vmenu}
	calibrate_highway_setup_button_helpers
endscript

script screenelement_highway_fade 
	formatText checksumName = gem_notes_container_name 'gem_notes_containerp%p' p = <Player>
	formatText checksumName = fretbar_container_name 'fretbar_containerp%p' p = <Player>
	formatText checksumName = highway_2d_container 'Highway_2Dp%p' p = <Player>
	formatText checksumName = right_ns_id 'sidebar_right_ns_meterp%p' p = <Player>
	safe_screenelement_fade id = <right_ns_id> alpha = <alpha> time = <fade_time>
	safe_screenelement_fade id = <fretbar_container_name> alpha = <alpha> time = <fade_time>
	safe_screenelement_fade id = <gem_notes_container_name> alpha = <alpha> time = <fade_time>
	if (<fade_helpers> = 1)
		safe_screenelement_fade id = calibrate_highway_user_pills_container alpha = <alpha> time = <fade_time>
	endif
	safe_screenelement_fade id = <highway_2d_container> rgba = <rgba> time = <fade_time>
endscript
