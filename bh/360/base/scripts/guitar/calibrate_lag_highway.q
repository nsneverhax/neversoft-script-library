calibrate_lag_enabled = 0
calibrate_lag_previous_mode = None
calibrate_lag_notes_passed = 0
calibrate_lag_min_threshold = 7
calibrate_highway_paused_time = 0
calibrate_highway_video_offset = 0
calibrate_highway_state = video_dialog
calibrate_highway_gameplay_state = video
current_calibrate_audio_lag = 0
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
	CalibrationInterface :Obj_SpawnScript \{calibrate_wait_and_focus}
	spawnscriptnow \{GameEvent_CalibrateBegin}
	spawnscriptlater \{calibrate_highway_setup_button_helpers
		params = {
			wait
		}}
endscript

script calibrate_wait_and_focus 
	wait \{1
		gameframes}
	LaunchEvent \{type = focus
		target = calibrate_highway_events_container}
endscript

script calibrate_highway_return 
	calibrate_highway_setup_button_helpers
	setup_pause \{pad_start_script = calibrate_hit_pause}
	if ($calibrate_highway_state = Menu)
		LaunchEvent \{type = focus
			target = generic_barrel_vmenu}
	else
		LaunchEvent \{type = focus
			target = calibrate_highway_events_container}
	endif
endscript

script calibrate_highway_setup_button_helpers \{z = 10000}
	if GotParam \{wait}
		wait \{5
			gameframes}
	endif
	if NOT ScreenElementExists \{id = CalibrationInterface}
		return
	endif
	if ScreenElementExists \{id = calibrate_highway_user_pills_container}
		DestroyScreenElement \{id = calibrate_highway_user_pills_container}
	endif
	clean_up_user_control_helpers
	CreateScreenElement {
		id = calibrate_highway_user_pills_container
		parent = CalibrationInterface
		type = MenuElement
		dims = (1024.0, 36.0)
		Pos = (0.0, -36.0)
		pos_anchor = [center bottom]
		just = [center bottom]
		internal_just = [center center]
		isVertical = false
		position_children = true
		fit_major = `fit	content	if	larger`
		fit_minor = `keep	dims`
		spacing_between = 10
		z_priority = <z>
	}
	parent = calibrate_highway_user_pills_container
	if ($calibrate_highway_state = Menu)
		add_user_control_helper override_parent = <parent> text = qs(0xc18d5e76) button = green
	elseif ($calibrate_highway_state = video_dialog)
		add_user_control_helper override_parent = <parent> text = qs(0x182f0173) button = green
	elseif ($calibrate_highway_state = video)
		GetPlayerInfo \{1
			controller}
		get_controller_type controller_index = <controller>
		if (<controller_type> = Drum)
			if IsPS3
				button = yellow
			else
				button = blue
			endif
			add_user_control_helper override_parent = <parent> text = qs(0xda9efcde) button = <button>
		elseif (<controller_type> = vocals || <controller_type> = controller)
			if IsPS3
				button = yellow
			else
				button = RB
			endif
			add_user_control_helper override_parent = <parent> text = qs(0xda9efcde) button = <button>
		else
			add_user_control_helper override_parent = <parent> text = qs(0xda9efcde) button = strumbar
		endif
		add_user_control_helper override_parent = <parent> text = qs(0xf6a0ac6e) button = start
	elseif ($calibrate_highway_state = audio)
		add_user_control_helper override_parent = <parent> text = qs(0x8e935177) button = strumbar
		add_user_control_helper override_parent = <parent> text = qs(0x182f0173) button = start
	elseif ($calibrate_highway_state = editing)
		add_user_control_helper override_parent = <parent> text = qs(0x8e935177) button = strumbar
		add_user_control_helper override_parent = <parent> text = qs(0x182f0173) button = start
	endif
endscript

script calibrate_highway_shutdown 
	CalibrationInterface :GetTags
	calibrate_highway_events_container :GetSingleTag \{device_num}
	Change check_time_late = <saved_late_hit_window>
	if ScreenElementExists \{id = CalibrationInterface}
		DestroyScreenElement \{id = CalibrationInterface}
	endif
	destroy_generic_barrel_menu
	killspawnedscript \{name = calibrate_hit_pause}
	calibrate_highway_kill_scripts
	Change game_mode = ($calibrate_lag_previous_mode)
	Change \{calibrate_lag_enabled = 0}
	Change \{disable_note_input = 0}
	setup_pause
	begin
	if is_shutdown_safe
		break
	endif
	wait \{1
		gameframe}
	repeat
	kill_gem_scroller
	idx = 0
	begin
	SetPlayerInfo (<idx> + 1) difficulty = ($calibrate_prev_parts [<idx>].difficulty)
	SetPlayerInfo (<idx> + 1) part = ($calibrate_prev_parts [<idx>].part)
	SetPlayerInfo (<idx> + 1) controller = ($calibrate_prev_parts [<idx>].controller)
	SetPlayerInfo (<idx> + 1) in_game = 0
	idx = (<idx> + 1)
	repeat 4
	get_savegame_from_controller controller = <device_num>
	GetGlobalTags user_options savegame = <savegame> param = volumes
	ui_options_audio_get_buss_volume_full_dynamics volume = (<volumes>.guitar.sfx.vol)
	SoundBussUnlock \{User_SFX}
	SetSoundBussParams {User_SFX = {vol = <vol>} time = 0}
	SoundBussLock \{User_SFX}
	SetSoundBussParams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 1}
	SetSoundBussParams {Crowd_One_Shots = {vol = ($default_BussSet.Crowd_One_Shots.vol)} time = 1}
	spawnscriptnow \{GameEvent_CalibrateEnd}
endscript

script calibrate_highway_setup_player 
	Change \{calibrate_prev_parts = [
		]}
	<lowest_diff> = null
	idx = 1
	begin
	GetPlayerInfo <idx> difficulty
	GetPlayerInfo <idx> part
	GetPlayerInfo <idx> controller
	GetPlayerInfo <idx> in_game
	element = {difficulty = <difficulty> part = <part> controller = <controller> in_game = <in_game>}
	AddArrayElement array = $calibrate_prev_parts element = <element>
	Change calibrate_prev_parts = <array>
	idx = (<idx> + 1)
	if (<lowest_diff> = null)
		<lowest_diff> = <difficulty>
	endif
	repeat 4
	SetPlayerInfo \{1
		in_game = 0}
	SetPlayerInfo \{2
		in_game = 0}
	SetPlayerInfo \{3
		in_game = 0}
	SetPlayerInfo \{4
		in_game = 0}
	if ($current_song_qpak = jamsession)
		SetPlayerInfo 1 difficulty = <lowest_diff>
	else
		SetPlayerInfo \{1
			difficulty = easy}
	endif
	SetPlayerInfo \{1
		in_game = 1}
	SetPlayerInfo 1 controller = <device_num>
	SetPlayerInfo 1 part = <old_part>
	get_progression_instrument_user_option part = <old_part> controller = <device_num> option = 'lefty_flip'
	if (<user_option> != -1)
		SetPlayerInfo 1 lefty_flip = <user_option>
	endif
endscript

script calibrate_highway_create_notes 
	time_spacing = 666
	initial_time = 2500
	green = 0
	red = 0
	yellow = 0
	blue = 0
	orange = 0
	white = 0
	num_gems = 10
	GetPlayerInfo \{1
		controller}
	get_controller_type controller_index = <controller>
	if (<controller_type> = Drum)
		blue = 1
		Color = 3
		strum_pattern = 16
	else
		yellow = 1
		strum_pattern = 256
	endif
	Change \{calibrate_lag_notes_passed = 0}
	GetFirstPlayer
	GetPlayerInfo <player> difficulty
	idx = 0
	begin
	note_time = (<initial_time> + (<idx> * <time_spacing>))
	if (<idx> < (<num_gems> - 1))
		next_time = (<initial_time> + ((<idx> + 1) * <time_spacing>))
	else
		next_time = 0
	endif
	FormatText checksumname = input_array 'input_arrayp%d' d = <player>
	InputArrayAddElement {
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
	}
	if ($calibrate_highway_gameplay_state = audio)
		CalibrationInterface :Obj_SpawnScriptNow calibrate_highway_sound_beep params = {play_time = <note_time>}
		CalibrationInterface :Obj_SpawnScriptNow calibrate_highway_fake_note_hit params = {play_time = <note_time> strum_pattern = <strum_pattern> entry = <idx>}
	endif
	idx = (<idx> + 1)
	repeat <num_gems>
	if ($calibrate_highway_state = video)
		begin
		if ($calibrate_lag_notes_passed >= <num_gems>)
			if calibrate_lag_calc_avg num_required = (<num_gems> / 2)
				Change \{disable_note_input = 1}
				SoundEvent \{event = ui_sfx_select}
				FormatText TextName = videolagtext qs(0x0f904228) d = ($calibrate_highway_video_offset * -1)
				CalibrationInterface :SE_SetProps videolag_text = <videolagtext>
				SetGlobalTags user_options params = {lag_video_calibration = ($calibrate_highway_video_offset)}
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
	GetSongTimeMs
	if (<time> > (<note_time> + <time_spacing>))
		spawnscriptnow \{mock_highway_restart}
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
	Change calibrate_highway_state = <state>
	calibrate_highway_setup_button_helpers
	safe_screenelement_fade id = calibrate_highway_user_pills_container alpha = 1 time = <fade_time>
endscript

script calibrate_highway_sound_beep 
	begin
	GetSongTimeMs
	if (<time> >= <play_time> - $current_calibrate_audio_lag)
		SoundEvent \{event = GH_SFX_BeatSoundEvent}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script calibrate_highway_fake_note_hit 
	get_lag_values
	begin
	GetSongTimeMs
	if (<time> >= <play_time> + <video_offset>)
		SimulateNoteHit player = 1 strum_pattern = <strum_pattern> entry = <entry>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script calibration_highway_hit_note 
	Change calibrate_lag_notes_passed = ($calibrate_lag_notes_passed + 1)
endscript

script calibrate_lag_calc_avg 
	GetArraySize \{$calibrate_history_times}
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
	if ScreenElementExists \{id = CalibrationInterface}
		DestroyScreenElement \{id = CalibrationInterface}
	endif
	CreateScreenElement {
		type = DescInterface
		parent = root_window
		id = CalibrationInterface
		desc = 'calibrate_lag'
		helper_text = qs(0x119257ec)
		tags = {saved_late_hit_window = ($check_time_late)}
	}
	Change \{check_time_late = 0.333}
	get_lag_values
	FormatText TextName = video_text qs(0x0f904228) d = (<video_offset> * -1)
	FormatText TextName = audio_text qs(0x6172b8bf) d = <audio_offset>
	Change current_calibrate_audio_lag = <audio_offset>
	CalibrationInterface :SE_SetProps {
		videolag_text = <video_text>
		audiolag_text = <audio_text>
		videolag_rgba = GH51_blue_md
		audiolag_rgba = GH51_blue_md
	}
	CreateScreenElement {
		type = ContainerElement
		parent = CalibrationInterface
		id = calibrate_highway_events_container
		event_handlers = [
			{focus ui_calibrate_adjust_lag_focus}
			{unfocus ui_calibrate_adjust_lag_unfocus}
			{pad_back calibrate_hit_back}
			{pad_choose calibrate_hit_choose}
			{pad_up calibrate_highway_change_lag params = {up}}
			{pad_down calibrate_highway_change_lag params = {down}}
		]
		exclusive_device = <device_num>
		tags = {current_changing = None device_num = <device_num>}
	}
	Change \{disable_note_input = 1}
	spawnscriptnow \{calibrate_wait_for_hud}
endscript

script calibrate_wait_for_hud 
	GetFirstPlayer
	GetPlayerInfo <player> hud_parent
	begin
	if ScreenElementExists id = <hud_parent>
		break
	endif
	wait \{1
		gameframe}
	repeat
	SetSoundBussParams \{Crowd = {
			vol = -100
			pitch = 0.0
		}
		time = 1}
	SetSoundBussParams \{Crowd_One_Shots = {
			vol = -100
			pitch = 0.0
		}
		time = 1}
	ui_options_audio_get_buss_volume_full_dynamics \{volume = 7}
	SoundBussUnlock \{User_SFX}
	SetSoundBussParams {User_SFX = {vol = <vol>} time = 0}
	SoundBussLock \{User_SFX}
endscript

script calibrate_create_menu 
	params = {
		pad_choose_script = ui_calibrate_option_choose
		menurow_internal_just = [center center]
		menurow_just = [center center]
		focus_script = ui_calibrate_option_focus
		unfocus_script = ui_calibrate_option_unfocus
	}
	make_generic_barrel_menu \{Pos = (960.0, 465.0)
		pad_back_script = nullscript
		menu_padding = 150
		use_original_barrel
		scale = (0.7, 0.7)
		spacing_between = 0}
	generic_barrel_vmenu :SetTags \{smooth_morph_time = 0.1
		create_dummy_items = 1}
	generic_barrel_vmenu :SE_SetProps \{event_handlers = [
			{
				pad_up
				SmoothMenuScroll
				params = {
					Dir = -1
					isVertical = true
					play_scroll_sound = 0
				}
			}
			{
				pad_down
				SmoothMenuScroll
				params = {
					Dir = 1
					isVertical = true
					play_scroll_sound = 0
				}
			}
			{
				pad_left
				SmoothMenuScroll
				params = {
					Dir = -1
					isVertical = true
					play_scroll_sound = 0
				}
			}
			{
				pad_right
				SmoothMenuScroll
				params = {
					Dir = 1
					isVertical = true
					play_scroll_sound = 0
				}
			}
		]}
	add_generic_barrel_menu_text_item pad_choose_params = {idx = 3} text = qs(0x0e56c83c) <params>
	add_generic_barrel_menu_text_item pad_choose_params = {idx = 0} text = qs(0x84b073bd) <params>
	add_generic_barrel_menu_text_item pad_choose_params = {idx = 1} text = qs(0x0f328516) <params>
	add_generic_barrel_menu_text_item pad_choose_params = {idx = 2} text = qs(0x38ee4773) <params>
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
	if (<show_save> = 1)
		add_generic_barrel_menu_text_item pad_choose_params = {idx = 5} text = qs(0xf62e7772) <params>
	else
		add_generic_barrel_menu_text_item pad_choose_params = {idx = 5 nosave = 1} text = qs(0xf62e7772) <params>
	endif
	add_generic_barrel_menu_text_item pad_choose_params = {idx = 6} text = qs(0xf7723015) <params>
endscript

script calibrate_hit_back 
	if ($calibrate_highway_state = Menu)
		LaunchEvent \{type = unfocus
			target = calibrate_highway_events_container}
		LaunchEvent \{type = focus
			target = generic_barrel_vmenu}
		Change \{disable_note_input = 0}
		generic_menu_pad_back_sound
	endif
endscript

script calibrate_hit_choose 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	if ($calibrate_highway_state = video_dialog)
		SoundEvent \{event = ui_sfx_select}
		LaunchEvent \{type = unfocus
			target = calibrate_highway_events_container}
		CalibrationInterface :SE_SetProps \{helper_alpha = 0
			time = 0.5}
		CalibrationInterface :SE_WaitProps
		calibrate_create_menu
		LaunchEvent \{type = focus
			target = generic_barrel_vmenu}
		Change \{calibrate_highway_state = Menu}
		calibrate_highway_setup_button_helpers
	elseif ($calibrate_highway_state = Menu)
		LaunchEvent \{type = unfocus
			target = calibrate_highway_events_container}
		LaunchEvent \{type = focus
			target = generic_barrel_vmenu}
		generic_menu_pad_back_sound
	endif
	CalibrationInterface :SE_SetProps \{videolag_rgba = GH51_blue_md
		audiolag_rgba = GH51_blue_md}
endscript

script calibrate_highway_change_lag 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	if ($calibrate_highway_state = Menu)
		ui_calibrate_lag_change <...>
		return
	elseif NOT ($calibrate_highway_state = editing || $calibrate_highway_state = audio)
		return
	endif
	get_lag_values
	if GotParam \{up}
		change_val = -1
	elseif GotParam \{down}
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
		FormatText TextName = lag_text qs(0x0f904228) d = (<video_offset> * -1)
		CalibrationInterface :SE_SetProps videolag_text = <lag_text>
	elseif ($calibrate_highway_gameplay_state = audio)
		FormatText TextName = lag_text qs(0x6172b8bf) d = ($current_calibrate_audio_lag)
		CalibrationInterface :SE_SetProps audiolag_text = <lag_text>
	endif
	generic_menu_up_or_down_sound
endscript

script calibrate_highway_kill_scripts 
	killspawnedscript \{name = calibrate_wait_for_hud}
	killspawnedscript \{name = mock_highway_restart}
	killspawnedscript \{name = calibrate_highway_create_notes}
	killspawnedscript \{name = calibrate_highway_sound_beep}
	killspawnedscript \{name = calibrate_highway_fake_note_hit}
endscript

script mock_highway_restart \{fade_helpers = 0
		restart_notes = 1}
	GetFirstPlayer
	FormatText checksumname = input_array 'input_arrayp%d' d = <player>
	InputArrayCreate name = <input_array>
	SetPlayerInfo <player> last_inactive_gem_time = 0
	ResetInputArrayEntry player = <player>
	fade_time = 0.66
	screenelement_highway_fade alpha = 0 rgba = [0 0 0 255] fade_time = <fade_time> player = <player> fade_helpers = <fade_helpers>
	wait <fade_time> seconds ignoreslomo
	GetPlayerInfo <player> difficulty
	Change \{calibrate_history_times = [
		]}
	if ($calibrate_highway_gameplay_state = audio)
		if IsPS3
			Change \{calibrating_helper_text = qs(0x3de52c6a)}
		else
			Change \{calibrating_helper_text = qs(0xcc266a9a)}
		endif
		CalibrationInterface :SE_SetProps \{helper_alpha = 1
			time = 0.5}
		calibrate_highway_events_container :SetTags \{current_changing = audio}
		LaunchEvent \{type = focus
			target = calibrate_highway_events_container}
	endif
	CalibrationInterface :SE_SetProps helper_text = ($calibrating_helper_text)
	CalibrationInterface :SE_SetProps \{helper_alpha = 1
		time = 0.5}
	practice_kill_gem_scroller player = <player>
	wait \{1
		gameframe}
	practice_restart_gem_scroller player = <player> difficulty = <difficulty>
	wait <fade_time> seconds ignoreslomo
	screenelement_highway_fade alpha = 1 rgba = [255 255 255 255] fade_time = <fade_time> player = <player> fade_helpers = <fade_helpers>
	if (<restart_notes> = 1)
		Change \{calibrate_highway_state = $calibrate_highway_gameplay_state}
	endif
	calibrate_highway_setup_button_helpers
	ResetSongTimer \{starttime = 0}
	Change \{songtime_paused = 0}
	if (<restart_notes> = 1)
		spawnscriptnow \{calibrate_highway_create_notes}
		setup_pause \{pad_start_script = calibrate_hit_pause}
	endif
endscript

script calibrate_hit_select 
	if NOT ($calibrate_highway_state = audio || $calibrate_highway_state = editing)
		return
	endif
	calibrate_highway_kill_scripts
	calibrate_fade_and_change_helpers \{state = video}
	CalibrationInterface :SE_SetProps \{helper_alpha = 0
		time = 0.5}
	Change \{disable_note_input = 0}
	spawnscriptnow \{mock_highway_restart}
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
		SoundEvent \{event = ui_sfx_select}
		ui_calibrate_skip \{state = audio}
	elseif ($calibrate_highway_state = audio)
		disable_pause
		SoundEvent \{event = ui_sfx_select}
		Change \{calibrate_highway_state = Menu}
		ui_calibrate_skip \{state = video
			restart_notes = 0
			fade_helpers = 0}
		CalibrationInterface :SE_SetProps \{helper_alpha = 0
			time = 0.5}
		CalibrationInterface :SE_WaitProps
		Change \{disable_note_input = 1}
		calibrate_create_menu
		LaunchEvent \{type = focus
			target = generic_barrel_vmenu}
		calibrate_highway_setup_button_helpers
	endif
endscript

script screenelement_highway_fade 
	FormatText checksumname = gem_notes_container_name 'gem_notes_containerp%p' p = <player>
	FormatText checksumname = fretbar_container_name 'fretbar_containerp%p' p = <player>
	FormatText checksumname = Highway_2D_container 'Highway_2Dp%p' p = <player>
	FormatText checksumname = right_ns_id 'sidebar_right_ns_meterp%p' p = <player>
	safe_screenelement_fade id = <right_ns_id> alpha = <alpha> time = <fade_time>
	safe_screenelement_fade id = <fretbar_container_name> alpha = <alpha> time = <fade_time>
	safe_screenelement_fade id = <gem_notes_container_name> alpha = <alpha> time = <fade_time>
	if (<fade_helpers> = 1)
		safe_screenelement_fade id = calibrate_highway_user_pills_container alpha = <alpha> time = <fade_time>
	endif
	safe_screenelement_fade id = <Highway_2D_container> rgba = <rgba> time = <fade_time>
endscript
