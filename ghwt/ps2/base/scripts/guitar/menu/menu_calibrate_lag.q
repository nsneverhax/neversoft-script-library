calibrate_lag_miss_avg_threshold_ms = 200
calibrate_lag_miss_threshold_max_ms = 500
calibrate_lag_failed_num = 0
calibrate_lag_fail_threshold_num = 3
calibrate_lag_menu_line_pos = (420.0, 360.0)
calibrate_lag_menu_circle_dims = (96.0, 96.0)
calibrate_lag_menu_circle_velocity = 300
calibrate_lag_menu_circle_inital_pos = (420.0, -146.0)
calibrate_lag_menu_circle_separation = 320
calibrate_lag_menu_num_circles = 10
calibrate_lag_results = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
calibrate_lag_circle_index = 0
calibrate_lag_real_time_requirement = 0
calibrate_lag_dirty = 0
calibrate_lag_end_checks = 0
calibrate_lag_started_finish = 0
calibrate_lag_cap = 200
calibrate_lag_early_window = -100
calibrate_lag_late_window = 400
cl_ready_for_input = 0
calibrate_lag_most_recent_in_game_setting = 0
calibrate_lag_most_recent_controller = 0
calibrate_lag_section = audio
allow_console_pause_for_cal_lag = 0

script setup_calibrate_lag_audio_test 
	Change \{calibrate_lag_section = audio}
endscript

script setup_calibrate_lag_video_test 
	Change \{calibrate_lag_section = video}
endscript

script setup_calibration_lag_dialog_1 
	Change \{calibrate_lag_section = dialog_1}
endscript

script setup_calibration_lag_dialog_2 
	Change \{calibrate_lag_section = dialog_2}
endscript

script setup_calibration_lag_none 
	Change \{calibrate_lag_section = None}
endscript

script create_calibrate_lag_dialog_menu 
	menu_music_off
	if (<dialog> = 1)
		setup_calibration_lag_dialog_1
		<title> = qs(0xeccb9b18)
	elseif (<dialog> = 2)
		setup_calibration_lag_dialog_2
		<title> = qs(0xf5e62291)
	endif
	menu_calibrate_lag_create_background \{z = 80}
	memcard_cleanup_messages
	create_popup_warning_menu {
		no_background
		title = <title>
		textblock = {
			text = <body_text>
		}
		player_device = $calibrate_lag_most_recent_controller
		options = [
			{
				func = {ui_event}
				func_params = {event = menu_back data = {state = uistate_options_calibrate_lag}}
				text = qs(0x182f0173)
			}
		]
	}
endscript

script destroy_calibrate_lag_dialog_menu 
	destroy_menu \{menu_id = cl_container}
	memcard_cleanup_messages
	destroy_popup_warning_menu
endscript

script create_calibrate_lag_menu \{from_in_game = 1}
	Change calibrate_lag_most_recent_in_game_setting = <from_in_game>
	disable_pause
	menu_music_off
	if ViewportExists \{id = bg_viewport}
		disable_bg_viewport
	endif
	Change \{calibrate_lag_end_checks = 0}
	Change \{calibrate_lag_started_finish = 0}
	set_focus_color \{rgba = [
			224
			224
			224
			255
		]}
	set_unfocus_color \{rgba = [
			224
			224
			224
			255
		]}
	<z> = 700
	if (<from_in_game>)
		Change calibrate_lag_most_recent_controller = ($last_start_pressed_device)
	else
		Change calibrate_lag_most_recent_controller = ($primary_controller)
	endif
	menu_calibrate_lag_create_background <...>
	menu_calibrate_lag_setup_vmenu <...>
	menu_calibrate_lag_update_text
	CreateScreenElement {
		Type = SpriteElement
		parent = cl_container
		id = calibrate_lag_target
		texture = options_calibrate_lag_target
		Pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
		just = [center center]
		dims = (96.0, 96.0)
		z_priority = (<z> + 50)
		alpha = 0.75
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = cl_container
		id = cl_ping_ID
		texture = options_calibrate_lag_ping
		Pos = (468.0, 406.0)
		just = [center center]
		Scale = 5
		z_priority = (<z> + 80)
		alpha = 0
	}
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10000}
	add_user_control_helper \{text = qs(0x643800a7)
		button = strumbar
		z = 10000}

	if (($calibrate_lag_section = video) || ($calibrate_lag_section = audio))
		if ScreenElementExists \{id = cl_vmenu}
			Change \{allow_console_pause_for_cal_lag = 1}
			GetScreenElementChildren \{id = cl_vmenu}
			<id> = (<children> [0])
			RunScriptOnScreenElement id = <id> menu_calibrate_lag_create_circles params = {z = <z> device_num = $calibrate_lag_most_recent_controller}
		endif
	endif
endscript

script menu_calibrate_lag_create_background \{z = 700}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = cl_container
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		parent = cl_container
		id = calibratelag
		Type = descinterface
		desc = 'calibrate_lag'
		z_priority = <z>
	}
endscript

script menu_calibrate_lag_setup_vmenu 
	if GotParam \{go_back_script}
		calib_eh = [
			{pad_back menu_calibrate_go_back params = {go_back_script = <go_back_script>}}
		]
	else
		calib_eh = [
			{pad_back menu_calibrate_go_back}
		]
	endif
	if NOT calibratelag :desc_resolvealias \{Name = alias_calibrate_lag_vmenu}

	endif
	AssignAlias id = <resolved_id> alias = cl_vmenu
	cl_vmenu :se_setprops event_handlers = <calib_eh> exclusive_device = $calibrate_lag_most_recent_controller
	if NOT GetScreenElementChildren \{id = cl_vmenu}

	endif
	GetArraySize <children>
	if (<array_Size> != 4)

	endif
	if calibratelag :desc_resolvealias \{Name = alias_calibrate_lag_option_audio_text}
		AssignAlias id = <resolved_id> alias = cl_option_audio_text
	endif
	if calibratelag :desc_resolvealias \{Name = alias_calibrate_lag_option_audio_ms}
		AssignAlias id = <resolved_id> alias = cl_option_audio_ms
	endif
	if calibratelag :desc_resolvealias \{Name = alias_calibrate_lag_option_video_text}
		AssignAlias id = <resolved_id> alias = cl_option_video_text
	endif
	if calibratelag :desc_resolvealias \{Name = alias_calibrate_lag_option_video_ms}
		AssignAlias id = <resolved_id> alias = cl_option_video_ms
	endif
	if calibratelag :desc_resolvealias \{Name = alias_calibrate_lag_option_audio_arrow_top}
		AssignAlias id = <resolved_id> alias = cl_option_audio_arrow_top
	endif
	if calibratelag :desc_resolvealias \{Name = alias_calibrate_lag_option_audio_arrow_bottom}
		AssignAlias id = <resolved_id> alias = cl_option_audio_arrow_bottom
	endif
	if calibratelag :desc_resolvealias \{Name = alias_calibrate_lag_option_video_arrow_top}
		AssignAlias id = <resolved_id> alias = cl_option_video_arrow_top
	endif
	if calibratelag :desc_resolvealias \{Name = alias_calibrate_lag_option_video_arrow_bottom}
		AssignAlias id = <resolved_id> alias = cl_option_video_arrow_bottom
	endif
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 0}}
		{unfocus menu_calibrate_unfocus params = {index = 0}}
		{pad_choose menu_calibrate_lag_create_circles params = {z = <z> device_num = $calibrate_lag_most_recent_controller}}
	]
	(<children> [0]) :se_setprops event_handlers = <event_handlers> exclusive_device = ($calibrate_lag_most_recent_controller)
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 1}}
		{unfocus menu_calibrate_unfocus params = {index = 1}}
		{pad_choose menu_calibrate_lag_reset_lag params = {z = <z>}}
	]
	(<children> [1]) :se_setprops event_handlers = <event_handlers> exclusive_device = ($calibrate_lag_most_recent_controller)
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 2}}
		{unfocus menu_calibrate_unfocus params = {index = 2}}
		{pad_choose menu_calibrate_lag_manual_choose params = {audio}}
	]
	(<children> [2]) :se_setprops event_handlers = <event_handlers> exclusive_device = ($calibrate_lag_most_recent_controller)
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 3}}
		{unfocus menu_calibrate_unfocus params = {index = 3}}
		{pad_choose menu_calibrate_lag_manual_choose}
	]
	(<children> [3]) :se_setprops event_handlers = <event_handlers> exclusive_device = ($calibrate_lag_most_recent_controller)
	SetScreenElementLock \{id = cl_vmenu
		On}
	if ($calibrate_lag_section = None)
		LaunchEvent \{Type = focus
			target = cl_vmenu}
	endif
endscript

script destroy_calibrate_lag_menu 
	if ($playing_song = 0)
		SpawnScriptNow \{menu_music_on}
	endif
	if ($failed_song = 0)
		if ViewportExists \{id = bg_viewport}
			enable_bg_viewport
		endif
	endif
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = do_calibration_update}
	destroy_menu \{menu_id = cl_container}
	if ScreenElementExists \{id = cl_manual_adjust_handler}
		DestroyScreenElement \{id = cl_manual_adjust_handler}
	endif
	set_focus_color \{rgba = $default_focus_color}
	set_unfocus_color \{rgba = $default_unfocus_color}
	LaunchEvent \{Type = focus
		target = root_window}
endscript

script menu_calibrate_go_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Wait \{3
		gameframes}
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	if ScreenElementExists \{id = cl_vmenu}
		LaunchEvent \{Type = unfocus
			target = cl_vmenu}
	endif
	if ($calibrate_lag_dirty = 1)
		Change \{calibrate_lag_dirty = 0}
		SetGlobalTags \{user_options
			params = {
				has_calibrated = 1
			}}
		if ($playing_song = 1)
			if NOT ($game_mode = training)
				Change \{memcard_after_func = career_restart_song}
			else
				Change \{memcard_after_func = practice_restart_song}
			endif
			generic_menu_pad_back_sound
			ui_memcard_autosave \{state = Uistate_gameplay
				data = {
					0x05e47ace
				}}
		else
			generic_menu_pad_back_sound
			ui_memcard_autosave_replace
		endif
	else
		if GotParam \{go_back_script}
			<go_back_script>
		else
			if ($playing_song = 1)
				if NOT ($game_mode = training)
					Change \{gameplay_restart_song = 1}
				else
					practice_restart_song
				endif
				generic_event_back \{state = Uistate_gameplay}
			else
				generic_event_back
			endif
		endif
	endif
endscript

script menu_calibrate_focus 
	generic_menu_up_or_down_sound
	if (<index> = 0)
		retail_menu_focus
	elseif (<index> = 1)
		retail_menu_focus
	elseif (<index> = 2)
		retail_menu_focus \{id = cl_option_audio_text}
	else
		retail_menu_focus \{id = cl_option_video_text}
	endif
endscript

script menu_calibrate_unfocus 
	if (<index> = 0)
		retail_menu_unfocus
	elseif (<index> = 1)
		retail_menu_unfocus
	elseif (<index> = 2)
		retail_menu_unfocus \{id = cl_option_audio_text}
	else
		retail_menu_unfocus \{id = cl_option_video_text}
	endif
endscript

script menu_calibrate_lag_update_text 
	GetGlobalTags \{user_options}
	CastToInteger \{lag_calibration}
	if (<lag_calibration> = 0.0)
		<lag_calibration> = 1000
	endif
	audio_lag = ((<lag_calibration> / 1000) - 1)
	CastToInteger \{audio_lag}
	formatText TextName = lag_value_text qs(0x21f440f1) d = <audio_lag>
	cl_option_audio_ms :se_setprops text = <lag_value_text>
	Mod a = <lag_calibration> b = 1000
	formatText TextName = lag_value_text qs(0x21f440f1) d = <Mod>
	cl_option_video_ms :se_setprops text = <lag_value_text>
endscript

script menu_calibrate_lag_create_circles 
	GetTags
	Obj_GetID
	<id> = <objID>
	startpinknoiseloopforcaliratelagscreen
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	user_control_helper_get_buttonchar button = green controller = <device_num>
	if ($calibrate_lag_section = None)
		if IsGuitarController controller = <device_num>
			body_text = qs(0x0378b9cc)
		elseif isdrumcontroller controller = <device_num>
			body_text = qs(0xa1a662c1)
		else
			body_text = (qs(0x22040040) + <buttonchar> + qs(0x1f0e8440))
		endif
		generic_event_choose data = {
			state = uistate_options_calibrate_lag_warning
			body_text = <body_text>
			dialog = 1
			complete_script = setup_calibrate_lag_audio_test
		}
		return
	endif
	CreateScreenElement {
		Type = TextElement
		parent = cl_container
		id = clm_dummy_event_handler
		text = qs(0x03ac90f0)
		font = text_a4
		z_priority = <z>
	}
	LaunchEvent \{Type = focus
		target = clm_dummy_event_handler}
	LaunchEvent \{Type = unfocus
		target = cl_vmenu}
	clean_up_user_control_helpers
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	if ($calibrate_lag_section = video)
		if IsGuitarController controller = <device_num>
			calibratelag :se_setprops \{calibrate_lag_bottom_text_text = qs(0xd51e2c84)}
			add_user_control_helper \{text = qs(0x677830da)
				button = strumbar
				z = 10000}
		elseif isdrumcontroller controller = <device_num>
			calibratelag :se_setprops \{calibrate_lag_bottom_text_text = qs(0x3276c5eb)}
			add_user_control_helper \{text = qs(0x538fd9d1)
				button = drum_green
				z = 10000}
		else
			calibratelag :se_setprops calibrate_lag_bottom_text_text = (qs(0xb35ecc59) + <buttonchar> + qs(0xfdc6eb4b))
			add_user_control_helper \{text = qs(0xa5d9d07e)
				button = green
				z = 10000}
		endif
	elseif ($calibrate_lag_section = audio)
		if IsGuitarController controller = <device_num>
			calibratelag :se_setprops \{calibrate_lag_bottom_text_text = qs(0x3c9a2f8b)}
			add_user_control_helper \{text = qs(0x677830da)
				button = strumbar
				z = 10000}
		elseif isdrumcontroller controller = <device_num>
			calibratelag :se_setprops \{calibrate_lag_bottom_text_text = qs(0xb66975c3)}
			add_user_control_helper \{text = qs(0x538fd9d1)
				button = drum_green
				z = 10000}
		else
			calibratelag :se_setprops calibrate_lag_bottom_text_text = (qs(0xb35ecc59) + <buttonchar> + qs(0x2a059102))
			add_user_control_helper \{text = qs(0xa5d9d07e)
				button = green
				z = 10000}
		endif
	endif
	calibratelag :se_setprops \{calibrate_lag_vmenu_cont_alpha = 0.0}
	calibratelag :se_setprops \{calibrate_lag_bottom_text_alpha = 1.0
		time = 0.25}
	calibratelag :se_waitprops
	kill_debug_elements
	init_play_log
	CreateScreenElement {
		Type = SpriteElement
		parent = cl_container
		id = cl_countdown_circle
		texture = 2p_song_summary_circle
		Pos = ($calibrate_lag_menu_line_pos + (13.0, 14.0))
		rgba = [220 220 220 208]
		just = [left top]
		dims = (72.0, 72.0)
		z_priority = 199
	}
	CreateScreenElement {
		Type = TextElement
		id = cl_countdown_text
		parent = cl_container
		Pos = ($calibrate_lag_menu_line_pos + (47.0, 48.0))
		Scale = (1.0, 1.0)
		text = qs(0x03ac90f0)
		font = fontgrid_text_a8
		rgba = [0 0 0 255]
		z_priority = 200
	}
	<sep> = ($calibrate_lag_menu_circle_separation * 1.0)
	<vel> = ($calibrate_lag_menu_circle_velocity * 1.0)
	<seconds_between_circles> = (<sep> / <vel>)
	<i> = 0
	begin
	cl_container :Obj_SpawnScriptNow \{cl_do_ping
		params = {
			time = 0.6
		}}
	Wait \{0.6
		Seconds}
	formatText TextName = tex qs(0x3c71eff6) t = (3 - <i>)
	SetScreenElementProps id = cl_countdown_text text = <tex>
	beatsound
	Wait (<seconds_between_circles> - 0.6) Seconds
	<i> = (<i> + 1)
	repeat 3
	Change \{calibrate_lag_circle_index = 0}
	half_circle_width = 0
	getfps
	circle_index = 0
	begin
	formatText checksumName = circle_id 'circle%d' d = <circle_index>
	<circle_pos> = (($calibrate_lag_menu_circle_inital_pos) - ((0.0, 1.0) * <circle_index> * ($calibrate_lag_menu_circle_separation)))
	<one_frame> = ((1.0 / <fps>) * $calibrate_lag_menu_circle_velocity)
	CastToInteger \{one_frame}
	<y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - <circle_pos>.(0.0, 1.0))
	<steps> = (<y_off> / <one_frame>)
	CastToInteger \{steps}
	if ($calibrate_lag_section = audio)
		<steps> = (<steps> + 3)
	endif
	<new_y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - (<steps> * <one_frame>))
	<circle_pos> = ((<circle_pos>.(1.0, 0.0) * (1.0, 0.0)) + (<new_y_off> * (0.0, 1.0)))
	<circle_alpha> = 0.5
	if ($calibrate_lag_section = audio)
		<circle_alpha> = 0
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = cl_container
		texture = options_calibrate_lag_note
		id = <circle_id>
		Pos = <circle_pos>
		dims = ($calibrate_lag_menu_circle_dims)
		just = [left top]
		rgba = [255 255 255 255]
		z_priority = (<z> + 51)
		alpha = <circle_alpha>
	}
	<circle_id> :SetTags existence = 0 hit = 0 check = 1
	<circle_id> :SetTags initial_position = <circle_pos>
	<circle_id> :SetTags time_requirement = (<steps> * (1.0 / <fps>))
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	LaunchEvent \{Type = unfocus
		target = root_window}
	Change \{cl_ready_for_input = 0}
	cl_container :Obj_SpawnScriptNow \{cl_do_ping
		params = {
			time = 0.6
		}}
	cl_container :Obj_SpawnScriptNow do_calibration_update params = {device_num = <device_num>}
	Wait \{0.6
		Seconds}
	cl_countdown_text :se_setprops \{text = qs(0x13883900)
		Scale = 0.7}
	beatsound
	cl_ping_ID :se_setprops \{alpha = 0}
	Wait \{0.4
		Seconds}
	cl_countdown_circle :se_setprops \{alpha = 0}
	Change \{cl_ready_for_input = 1}
	calibrate_lag_target :se_setprops \{alpha = 1}
	Wait \{1
		gameframe}
	cl_countdown_text :se_setprops \{alpha = 0}
endscript

script menu_calibrate_lag_destroy_circles 
	circle_index = 0
	begin
	formatText checksumName = circle_id 'circle%d' d = <circle_index>
	destroy_menu menu_id = <circle_id>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	destroy_menu \{menu_id = clm_dummy_event_handler}
endscript

script do_calibration_update 
	<circle_index> = 0
	begin
	formatText checksumName = circle_id 'circle%d' d = <circle_index>
	<circle_id> :SetTags sounded = 0 pinged = 0
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	getfps
	begin
	circle_index = 0
	num_circles_gone = 0
	delta_time = (1.0 / <fps>)
	begin
	formatText checksumName = circle_id 'circle%d' d = <circle_index>
	<circle_id> :GetTags
	<existence> = (<existence> + <delta_time>)
	update_difference = (<delta_time>)
	position_change = (<update_difference> * ($calibrate_lag_menu_circle_velocity))
	CastToInteger \{position_change}
	GetScreenElementPosition id = <circle_id>
	<screenelementpos> = (<screenelementpos> + (0.0, 1.0) * <position_change>)
	<target_pos> = ($calibrate_lag_menu_line_pos)
	diff = ((<screenelementpos>.(0.0, 1.0)) - (<target_pos>.(0.0, 1.0)))
	if (<diff> < 0)
		<diff> = (0 - <diff>)
	endif
	<cl_tweak> = ($calibrate_lag_tick_ms_offset / 1000.0)
	if ((($calibrate_lag_menu_circle_velocity) * <cl_tweak>) >= <diff>)
		if (<sounded> = 0)
			if ($calibrate_lag_section = audio)
				beatsound
			endif
			<circle_id> :SetTags sounded = 1
		endif
	endif
	if (<diff> < <position_change>)
		<circle_alpha> = 1
		if ($calibrate_lag_section = audio)
			<circle_alpha> = 0
		endif
		<circle_id> :se_setprops rgba = [135 0 180 255] alpha = <circle_alpha>
	endif
	if ((<screenelementpos>.(0.0, 1.0)) > ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.0))))
		if (<hit> = 0 && <check> = 1)
			Change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
			<circle_id> :SetTags check = 0
		endif
		<num_circles_gone> = (<num_circles_gone> + 1)
		<circle_id> :Obj_SpawnScriptNow cl_fade_circle params = {id = <circle_id>}
	endif
	<circle_id> :se_setprops Pos = (<screenelementpos>)
	<circle_id> :SetTags existence = <existence>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_circles_gone> = $calibrate_lag_menu_num_circles)
		cl_container :Obj_SpawnScriptLater kill_off_and_finish_calibration params = {device_num = <device_num>}
	endif
	if (($calibrate_lag_end_checks = 0) && $cl_ready_for_input)
		<check_lines_are_even> = 0
		if IsGuitarController controller = <device_num>
			if ControllerMake up <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake down <device_num>
				<check_lines_are_even> = 1
			endif
		elseif isdrumcontroller controller = <device_num>
			if ControllerMake X <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake circle <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake Square <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake Triangle <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake R1 <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake L1 <device_num>
				<check_lines_are_even> = 1
			endif
		else
			if ControllerMake X <device_num>
				<check_lines_are_even> = 1
			endif
		endif
		if (<check_lines_are_even>)
			cl_container :Obj_SpawnScriptNow \{menu_calibrate_lag_say_lines_are_even}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script cl_fade_circle 
	if ($calibrate_lag_section = video)
		<id> :se_setprops rgba = [0 0 0 255] alpha = 0.5 time = 0.009
	endif
endscript

script cl_do_ping \{time = 0.066}
	cl_ping_ID :se_setprops \{Scale = 10
		alpha = 0}
	cl_ping_ID :se_setprops Scale = 1 alpha = 1 motion = ease_in time = <time>
	cl_ping_ID :se_waitprops
	cl_ping_ID :se_setprops \{alpha = 0
		motion = ease_in
		time = 0.1}
	cl_ping_ID :se_waitprops
endscript

script menu_calibrate_lag_say_lines_are_even 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	formatText checksumName = circle_id 'circle%d' d = ($calibrate_lag_circle_index)
	if NOT ScreenElementExists id = <circle_id>
		return
	endif
	if NOT ScreenElementExists \{id = calibrate_lag_target}
		return
	endif
	<circle_id> :GetTags
	GetScreenElementPosition id = <circle_id>
	GetScreenElementDims id = <circle_id>
	input_difference = (<time_requirement> - <existence>)
	new_input_diff = (<input_difference> * 1000)
	<new_input_diff> = (0 - <new_input_diff>)
	if (<new_input_diff> < $calibrate_lag_early_window)
		return
	endif
	if (<new_input_diff> > $calibrate_lag_late_window)
		return
	endif
	if isps3
		<new_input_diff> = (<new_input_diff> - 16)
	endif
	if isXenon
		if ($calibrate_lag_section = video)
			<new_input_diff> = (<new_input_diff> - 12)
		endif
	endif
	SetArrayElement ArrayName = calibrate_lag_results globalarray index = ($calibrate_lag_circle_index) NewValue = <new_input_diff>
	output_log_text qs(0x929bffbd) o = <new_input_diff> Color = white
	get_closest_circle_above_line
	<circle_id> :SetTags hit = 1
	Change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
	<closest_id> :se_setprops Hide
	calibratelag :se_setprops \{calibrate_lag_shock_alpha = 1.0}
	calibratelag :se_setprops \{calibrate_lag_shock_alpha = 0.0
		time = 0.5}
	calibrate_lag_target :se_setprops \{Scale = 1.5
		relative_scale
		time = 0.05}
	calibrate_lag_target :se_waitprops
	calibrate_lag_target :se_setprops \{Scale = 1.0
		relative_scale
		time = 0.05}
	calibrate_lag_target :se_waitprops
	if (($calibrate_lag_circle_index) = ($calibrate_lag_menu_num_circles))
		Change \{calibrate_lag_end_checks = 1}
		kill_off_and_finish_calibration
	endif
endscript

script cl_create_particles 
	Create2DParticleSystem {
		id = cl_particles
		Pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
		parent = cl_container
		z_priority = 10000
		material = ball_particle_01
		start_color = [255 66 0 255]
		end_color = [128 0 0 0]
		start_scale = (1.0, 1.0)
		end_scale = (0.25, 0.25)
		start_angle_spread = 0.0
		min_rotation = 0.0
		max_rotation = 0.0
		emit_start_radius = 20.0
		emit_radius = 20.0
		Emit_Rate = 0.001
		emit_dir = 0
		emit_spread = 360.0
		velocity = 16.0
		friction = (0.0, 20.0)
		time = 1.5
	}
	Wait \{1.5
		Seconds}
	Destroy2DParticleSystem \{id = cl_particles
		kill_when_empty}
endscript

script kill_off_and_finish_calibration device_num = ($calibrate_lag_most_recent_controller)
	LaunchEvent \{Type = unfocus
		target = clm_dummy_event_handler}
	KillSpawnedScript \{Name = do_calibration_update}
	menu_calibrate_lag_finish_up_calibration
	menu_calibrate_lag_destroy_circles
	user_control_helper_get_buttonchar button = green controller = <controller>
	if ($calibrate_lag_section = dialog_2)
		if IsGuitarController controller = <device_num>
			body_text = qs(0x367b99b2)
		elseif isdrumcontroller controller = <device_num>
			body_text = qs(0x28012478)
		else
			body_text = (qs(0x05829d9f) + <buttonchar> + qs(0xfdc6eb4b))
		endif
		generic_event_choose data = {
			state = uistate_options_calibrate_lag_warning
			body_text = <body_text>
			dialog = 2
			complete_script = setup_calibrate_lag_video_test
		}
	else
		Change \{allow_console_pause_for_cal_lag = 0}
		ui_event \{event = menu_refresh}
	endif
endscript

script get_closest_circle_above_line 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	i = 0
	begin
	formatText checksumName = circle_id 'circle%d' d = <i>
	GetScreenElementPosition id = <circle_id>
	if ((<screenelementpos>.(0.0, 1.0)) < ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.25))))
		<circle_id> :GetTags
		if NOT (<hit>)
			return closest_id = <circle_id> hit = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat $calibrate_lag_menu_num_circles hit = 0
	return closest_id = <circle_id>
endscript

script menu_calibrate_lag_finish_up_calibration 
	if ($calibrate_lag_started_finish = 1)
		return
	endif
	Change \{calibrate_lag_started_finish = 1}
	<min> = 50000.0
	<Max> = -50000.0
	index = 0
	num_hit = 0
	total_val = 0.0
	begin
	formatText checksumName = circle_id 'circle%d' d = <index>
	if NOT ScreenElementExists id = <circle_id>
		return
	endif
	<circle_id> :GetTags
	if (<hit>)
		<num_hit> = (<num_hit> + 1)
		val = ($calibrate_lag_results [<index>])
		if (<val> < <min>)
			<min> = (<val>)
		endif
		if (<val> > <Max>)
			<Max> = (<val>)
		endif
		<total_val> = (<total_val> + <val>)
	endif
	<index> = (<index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_hit> > 2)
		<total_val> = (<total_val> - <min>)
		<total_val> = (<total_val> - <Max>)
		avg = (<total_val> / (<num_hit> - 2))
		if (<avg> < 0)
			<avg> = 0
		elseif (<avg> > $calibrate_lag_cap)
			<avg> = $calibrate_lag_cap
		endif
		CastToInteger \{avg}
		GetGlobalTags \{user_options}
		if ($calibrate_lag_section = audio)
			old_lag = <lag_calibration>
			SetGlobalTags user_options params = {lag_calibration = ((<avg> * 1000) + 1000)}
		elseif ($calibrate_lag_section = video)
			stoppinknoiseloopforcaliratelagscreen
			old_lag = <lag_calibration>
			SetGlobalTags user_options params = {lag_calibration = (<old_lag> + <avg>)}
		endif
	endif
	if ($calibrate_lag_section = audio)
		Change \{calibrate_lag_section = dialog_2}
	elseif ($calibrate_lag_section = video)
		Change \{calibrate_lag_section = None}
	endif
	LaunchEvent \{Type = focus
		target = root_window}
	Wait \{30
		gameframes}
	stoppinknoiseloopforcaliratelagscreen
	if GotParam \{avg}
		if GotParam \{old_lag}
			CastToInteger \{avg}
			if NOT (<old_lag> = <avg>)
				Change \{calibrate_lag_dirty = 1}
			endif
		endif
	endif
endscript

script menu_calibrate_lag_reset_lag 
	GetGlobalTags \{user_options}
	if (<lag_calibration> = 1000)
		SoundEvent \{event = ui_sfx_negative_select}
		return
	endif
	SoundEvent \{event = quickplay_remove_all_songs}
	SetGlobalTags \{user_options
		params = {
			lag_calibration = 1000
		}}
	menu_calibrate_lag_update_text
	Change \{calibrate_lag_dirty = 1}
endscript

script menu_calibrate_lag_manual_choose 
	SetScreenElementProps \{id = cl_vmenu
		block_events}
	cl_arrow_color = [200 100 0 255]
	if GotParam \{audio}
		retail_menu_unfocus \{id = cl_option_audio_text}
		retail_menu_focus \{id = cl_option_audio_ms}
		cl_option_audio_arrow_top :se_setprops rgba = <cl_arrow_color>
		cl_option_audio_arrow_bottom :se_setprops rgba = <cl_arrow_color>
	else
		retail_menu_unfocus \{id = cl_option_video_text}
		retail_menu_focus \{id = cl_option_video_ms}
		cl_option_video_arrow_top :se_setprops rgba = <cl_arrow_color>
		cl_option_video_arrow_bottom :se_setprops rgba = <cl_arrow_color>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = cl_container
		id = cl_manual_adjust_handler
		event_handlers = [
			{pad_up menu_calibrate_lag_manual_up params = {<...>}}
			{pad_down menu_calibrate_lag_manual_down params = {<...>}}
			{pad_choose menu_calibrate_lag_manual_back params = {<...>}}
			{pad_back menu_calibrate_lag_manual_back params = {<...>}}
		]
	}
	LaunchEvent \{Type = focus
		target = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_back 
	SetScreenElementProps \{id = cl_vmenu
		unblock_events}
	DestroyScreenElement \{id = cl_manual_adjust_handler}
	if GotParam \{audio}
		retail_menu_unfocus \{id = cl_option_audio_ms}
		retail_menu_focus \{id = cl_option_audio_text}
		cl_option_audio_arrow_top :se_setprops \{rgba = [
				224
				224
				224
				255
			]}
		cl_option_audio_arrow_bottom :se_setprops \{rgba = [
				224
				224
				224
				255
			]}
	else
		retail_menu_unfocus \{id = cl_option_video_ms}
		retail_menu_focus \{id = cl_option_video_text}
		cl_option_video_arrow_top :se_setprops \{rgba = [
				224
				224
				224
				255
			]}
		cl_option_video_arrow_bottom :se_setprops \{rgba = [
				224
				224
				224
				255
			]}
	endif
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_up 
	<do_morph> = 0
	if GotParam \{audio}
		<arrow_id> = cl_option_audio_arrow_top
		if menu_calibrate_lag_adjust \{value = 1
				for_audio = 1}
			<do_morph> = 1
		endif
	else
		<arrow_id> = cl_option_video_arrow_top
		if menu_calibrate_lag_adjust \{value = 1}
			<do_morph> = 1
		endif
	endif
	if (<do_morph> = 1)
		<arrow_id> :se_setprops alpha = 0
		<arrow_id> :se_setprops alpha = 1 time = 0.15
		SoundEvent \{event = enter_band_name_scroll_up}
	endif
endscript

script menu_calibrate_lag_manual_down 
	<do_morph> = 0
	if GotParam \{audio}
		<arrow_id> = cl_option_audio_arrow_bottom
		if menu_calibrate_lag_adjust \{value = -1
				for_audio = 1}
			<do_morph> = 1
		endif
	else
		<arrow_id> = cl_option_video_arrow_bottom
		if menu_calibrate_lag_adjust \{value = -1}
			<do_morph> = 1
		endif
	endif
	if (<do_morph> = 1)
		<arrow_id> :se_setprops alpha = 0
		<arrow_id> :se_setprops alpha = 1 time = 0.15
		SoundEvent \{event = enter_band_name_scroll_down}
	endif
endscript

script menu_calibrate_lag_adjust \{value = 1
		for_audio = 0}
	GetGlobalTags \{user_options}
	if (<lag_calibration> = 0)
		<audio_calibration> = 0.0
	else
		<audio_calibration> = ((<lag_calibration> / 1000) - 1)
	endif
	CastToInteger \{audio_calibration}
	<video_calibration> = <lag_calibration>
	CastToInteger \{video_calibration}
	Mod a = <video_calibration> b = 1000
	<video_calibration> = <Mod>
	if (<for_audio> = 1)
		<audio_calibration> = (<audio_calibration> + <value>)
		if (<audio_calibration> > $calibrate_lag_cap)
			return \{FALSE}
		elseif (<audio_calibration> < 0)
			return \{FALSE}
		endif
	else
		<video_calibration> = (<video_calibration> + <value>)
		if (<video_calibration> > $calibrate_lag_cap)
			return \{FALSE}
		elseif (<video_calibration> < 0)
			return \{FALSE}
		endif
	endif
	<new_lag_calibration> = ((<audio_calibration> * 1000) + 1000)
	<new_lag_calibration> = (<new_lag_calibration> + <video_calibration>)
	Change \{calibrate_lag_dirty = 1}
	SetGlobalTags user_options params = {lag_calibration = <new_lag_calibration>}
	menu_calibrate_lag_update_text
	return \{true}
endscript

script beatsound 
	SoundEvent \{event = gh_sfx_calibration_beatsoundevent}
endscript
