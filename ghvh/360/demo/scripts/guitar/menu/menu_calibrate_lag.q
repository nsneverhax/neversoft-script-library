calibrate_lag_miss_avg_threshold_ms = 200
calibrate_lag_miss_threshold_max_ms = 500
calibrate_lag_failed_num = 0
calibrate_lag_fail_threshold_num = 3
calibrate_lag_menu_line_pos = (345.0, 360.0)
calibrate_lag_menu_circle_dims = (96.0, 96.0)
calibrate_lag_menu_circle_velocity = 300
calibrate_lag_menu_circle_inital_pos = (345.0, -146.0)
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
	change \{calibrate_lag_section = audio}
endscript

script setup_calibrate_lag_video_test 
	change \{calibrate_lag_section = video}
endscript

script setup_calibration_lag_dialog_1 
	change \{calibrate_lag_section = dialog_1}
endscript

script setup_calibration_lag_dialog_2 
	change \{calibrate_lag_section = dialog_2}
endscript

script setup_calibration_lag_none 
	change \{calibrate_lag_section = none}
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
	change calibrate_lag_most_recent_in_game_setting = <from_in_game>
	change \{check_for_unplugged_controllers = 0}
	disable_pause
	menu_music_off
	if viewportexists \{id = bg_viewport}
		disable_bg_viewport
	endif
	change \{calibrate_lag_end_checks = 0}
	change \{calibrate_lag_started_finish = 0}
	set_focus_color
	set_unfocus_color
	<z> = 700
	if (<from_in_game>)
		change calibrate_lag_most_recent_controller = ($last_start_pressed_device)
	else
		change calibrate_lag_most_recent_controller = ($primary_controller)
	endif
	menu_calibrate_lag_create_background <...>
	menu_calibrate_lag_setup_vmenu <...>
	menu_calibrate_lag_update_text
	createscreenelement {
		type = spriteelement
		parent = cl_container
		id = calibrate_lag_target
		texture = options_calibrate_lag_target
		pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
		just = [center center]
		dims = (96.0, 96.0)
		z_priority = (<z> + 50)
		alpha = 0.75
	}
	createscreenelement {
		type = spriteelement
		parent = cl_container
		id = cl_ping_id
		texture = options_calibrate_lag_ping
		pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
		just = [center center]
		scale = 5
		z_priority = (<z> + 80)
		alpha = 0
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10000}
	printf \{qs(0x95f18616)
		a = $calibrate_lag_section}
	if (($calibrate_lag_section = video) || ($calibrate_lag_section = audio))
		if screenelementexists \{id = cl_vmenu}
			change \{allow_console_pause_for_cal_lag = 1}
			getscreenelementchildren \{id = cl_vmenu}
			<id> = (<children> [0])
			runscriptonscreenelement id = <id> menu_calibrate_lag_create_circles params = {z = <z> device_num = $calibrate_lag_most_recent_controller}
		endif
	endif
endscript

script menu_calibrate_lag_create_background \{z = 700}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = cl_container
		pos = (0.0, 0.0)
		exclusive_device = ($calibrate_lag_most_recent_controller)
	}
	createscreenelement {
		parent = cl_container
		id = current_menu_anchor
		type = descinterface
		desc = 'calibrate_lag'
		z_priority = <z>
	}
	current_menu_anchor :obj_spawnscript \{highlight_motion}
endscript

script menu_calibrate_lag_setup_vmenu 
	if gotparam \{go_back_script}
		calib_eh = [
			{pad_back menu_calibrate_go_back params = {go_back_script = <go_back_script>}}
		]
	else
		calib_eh = [
			{pad_back menu_calibrate_go_back}
		]
	endif
	if NOT current_menu_anchor :desc_resolvealias \{name = alias_calibrate_lag_vmenu}
		scriptassert \{qs(0x08b00ff6)}
	endif
	assignalias id = <resolved_id> alias = cl_vmenu
	cl_vmenu :se_setprops event_handlers = <calib_eh> exclusive_device = ($calibrate_lag_most_recent_controller)
	if NOT getscreenelementchildren \{id = cl_vmenu}
		scriptassert \{qs(0xe0a74752)}
	endif
	getarraysize <children>
	if (<array_size> != 4)
		scriptassert \{qs(0x4faf68c8)}
	endif
	if current_menu_anchor :desc_resolvealias \{name = alias_calibrate_lag_option_audio_text}
		assignalias id = <resolved_id> alias = cl_option_audio_text
	endif
	if current_menu_anchor :desc_resolvealias \{name = alias_calibrate_lag_option_audio_ms}
		assignalias id = <resolved_id> alias = cl_option_audio_ms
	endif
	if current_menu_anchor :desc_resolvealias \{name = alias_calibrate_lag_option_video_text}
		assignalias id = <resolved_id> alias = cl_option_video_text
	endif
	if current_menu_anchor :desc_resolvealias \{name = alias_calibrate_lag_option_video_ms}
		assignalias id = <resolved_id> alias = cl_option_video_ms
	endif
	if current_menu_anchor :desc_resolvealias \{name = alias_calibrate_lag_option_audio_arrow_top}
		assignalias id = <resolved_id> alias = cl_option_audio_arrow_top
	endif
	if current_menu_anchor :desc_resolvealias \{name = alias_calibrate_lag_option_audio_arrow_bottom}
		assignalias id = <resolved_id> alias = cl_option_audio_arrow_bottom
	endif
	if current_menu_anchor :desc_resolvealias \{name = alias_calibrate_lag_option_video_arrow_top}
		assignalias id = <resolved_id> alias = cl_option_video_arrow_top
	endif
	if current_menu_anchor :desc_resolvealias \{name = alias_calibrate_lag_option_video_arrow_bottom}
		assignalias id = <resolved_id> alias = cl_option_video_arrow_bottom
	endif
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 0}}
		{unfocus menu_calibrate_unfocus params = {index = 0}}
		{pad_choose menu_calibrate_lag_create_circles params = {z = <z> device_num = $calibrate_lag_most_recent_controller}}
	]
	(<children> [0]) :se_setprops event_handlers = <event_handlers>
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 1}}
		{unfocus menu_calibrate_unfocus params = {index = 1}}
		{pad_choose menu_calibrate_lag_reset_lag params = {z = <z>}}
	]
	(<children> [1]) :se_setprops event_handlers = <event_handlers>
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 2}}
		{unfocus menu_calibrate_unfocus params = {index = 2}}
		{pad_choose menu_calibrate_lag_manual_choose params = {audio}}
	]
	(<children> [2]) :se_setprops event_handlers = <event_handlers>
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 3}}
		{unfocus menu_calibrate_unfocus params = {index = 3}}
		{pad_choose menu_calibrate_lag_manual_choose}
	]
	(<children> [3]) :se_setprops event_handlers = <event_handlers>
	setscreenelementlock \{id = cl_vmenu
		on}
	if ($calibrate_lag_section = none)
		launchevent \{type = focus
			target = cl_vmenu}
	endif
endscript

script destroy_calibrate_lag_menu 
	if ($playing_song = 0)
		spawnscriptnow \{menu_music_on}
	else
		change \{check_for_unplugged_controllers = 1}
	endif
	if ($failed_song = 0)
		if viewportexists \{id = bg_viewport}
			enable_bg_viewport
		endif
	endif
	clean_up_user_control_helpers
	killspawnedscript \{name = do_calibration_update}
	destroy_menu \{menu_id = cl_container}
	if screenelementexists \{id = cl_manual_adjust_handler}
		destroyscreenelement \{id = cl_manual_adjust_handler}
	endif
	set_focus_color \{rgba = $default_menu_focus_color}
	set_unfocus_color \{rgba = $default_menu_unfocus_color}
	launchevent \{type = focus
		target = root_window}
endscript

script menu_calibrate_go_back 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	wait \{3
		gameframes}
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if screenelementexists \{id = cl_vmenu}
		launchevent \{type = unfocus
			target = cl_vmenu}
	endif
	if gotparam \{go_back_script}
		<go_back_script>
	else
		if ($playing_song = 1)
			if NOT ($game_mode = training)
				change \{gameplay_restart_song = 1}
			else
				practice_restart_song
			endif
			generic_event_back \{state = uistate_gameplay}
		else
			generic_event_back
		endif
	endif
endscript

script menu_calibrate_focus 
	generic_menu_up_or_down_sound
	mainmenu_focus
	if (<index> = 2)
		cl_option_audio_text :se_setprops rgba = ($menu_focus_color)
	elseif (<index> = 3)
		cl_option_video_text :se_setprops rgba = ($menu_focus_color)
	endif
endscript

script menu_calibrate_unfocus 
	mainmenu_unfocus
	if (<index> = 2)
		cl_option_audio_text :se_setprops rgba = ($menu_unfocus_color)
	elseif (<index> = 3)
		cl_option_video_text :se_setprops rgba = ($menu_unfocus_color)
	endif
endscript

script menu_calibrate_lag_update_text 
	getglobaltags \{user_options}
	casttointeger \{lag_calibration}
	if (<lag_calibration> = 0.0)
		<lag_calibration> = 1000
	endif
	audio_lag = ((<lag_calibration> / 1000) - 1)
	casttointeger \{audio_lag}
	formattext textname = lag_value_text qs(0x21f440f1) d = <audio_lag>
	cl_option_audio_ms :se_setprops text = <lag_value_text>
	mod a = <lag_calibration> b = 1000
	formattext textname = lag_value_text qs(0x21f440f1) d = <mod>
	cl_option_video_ms :se_setprops text = <lag_value_text>
endscript

script menu_calibrate_lag_create_circles 
	gettags
	obj_getid
	<id> = <objid>
	startpinknoiseloopforcaliratelagscreen
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	user_control_helper_get_buttonchar button = green controller = <device_num>
	if ($calibrate_lag_section = none)
		if isguitarcontroller controller = <device_num>
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
	createscreenelement {
		type = textelement
		parent = cl_container
		id = clm_dummy_event_handler
		text = qs(0x03ac90f0)
		z_priority = <z>
	}
	launchevent \{type = focus
		target = clm_dummy_event_handler}
	launchevent \{type = unfocus
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
		if isguitarcontroller controller = <device_num>
			current_menu_anchor :se_setprops \{calibrate_lag_bottom_text_text = qs(0xd51e2c84)}
			add_user_control_helper \{text = qs(0x677830da)
				button = strumbar
				z = 10000}
		elseif isdrumcontroller controller = <device_num>
			current_menu_anchor :se_setprops \{calibrate_lag_bottom_text_text = qs(0x3276c5eb)}
			add_user_control_helper \{text = qs(0x538fd9d1)
				button = drum_green
				z = 10000}
		else
			current_menu_anchor :se_setprops calibrate_lag_bottom_text_text = (qs(0xb35ecc59) + <buttonchar> + qs(0xfdc6eb4b))
			add_user_control_helper \{text = qs(0xa5d9d07e)
				button = green
				z = 10000}
		endif
	elseif ($calibrate_lag_section = audio)
		if isguitarcontroller controller = <device_num>
			current_menu_anchor :se_setprops \{calibrate_lag_bottom_text_text = qs(0x3c9a2f8b)}
			add_user_control_helper \{text = qs(0x677830da)
				button = strumbar
				z = 10000}
		elseif isdrumcontroller controller = <device_num>
			current_menu_anchor :se_setprops \{calibrate_lag_bottom_text_text = qs(0xb66975c3)}
			add_user_control_helper \{text = qs(0x538fd9d1)
				button = drum_green
				z = 10000}
		else
			current_menu_anchor :se_setprops calibrate_lag_bottom_text_text = (qs(0xb35ecc59) + <buttonchar> + qs(0x2a059102))
			add_user_control_helper \{text = qs(0xa5d9d07e)
				button = green
				z = 10000}
		endif
	endif
	current_menu_anchor :se_setprops \{calibrate_lag_vmenu_cont_alpha = 0.0}
	current_menu_anchor :se_setprops \{calibrate_lag_bottom_text_alpha = 1.0
		time = 0.25}
	current_menu_anchor :se_waitprops
	kill_debug_elements
	init_play_log
	createscreenelement {
		type = spriteelement
		parent = cl_container
		id = cl_countdown_circle
		texture = 2p_song_summary_circle
		pos = ($calibrate_lag_menu_line_pos + (13.0, 14.0))
		rgba = [220 220 220 208]
		just = [left top]
		dims = (72.0, 72.0)
		z_priority = 199
	}
	createscreenelement {
		type = textelement
		id = cl_countdown_text
		parent = cl_container
		pos = ($calibrate_lag_menu_line_pos + (47.0, 48.0))
		scale = (1.0, 1.0)
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
	cl_container :obj_spawnscriptnow \{cl_do_ping
		params = {
			time = 0.6
		}}
	wait \{0.6
		seconds}
	formattext textname = tex qs(0x3c71eff6) t = (3 - <i>)
	setscreenelementprops id = cl_countdown_text text = <tex>
	beatsound
	wait (<seconds_between_circles> - 0.6) seconds
	<i> = (<i> + 1)
	repeat 3
	change \{calibrate_lag_circle_index = 0}
	half_circle_width = 0
	getfps
	circle_index = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	<circle_pos> = (($calibrate_lag_menu_circle_inital_pos) - ((0.0, 1.0) * <circle_index> * ($calibrate_lag_menu_circle_separation)))
	<one_frame> = ((1.0 / <fps>) * $calibrate_lag_menu_circle_velocity)
	casttointeger \{one_frame}
	<y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - <circle_pos>.(0.0, 1.0))
	<steps> = (<y_off> / <one_frame>)
	casttointeger \{steps}
	if ($calibrate_lag_section = audio)
		<steps> = (<steps> + 3)
	endif
	<new_y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - (<steps> * <one_frame>))
	<circle_pos> = ((<circle_pos>.(1.0, 0.0) * (1.0, 0.0)) + (<new_y_off> * (0.0, 1.0)))
	<circle_alpha> = 0.5
	if ($calibrate_lag_section = audio)
		<circle_alpha> = 0
	endif
	createscreenelement {
		type = spriteelement
		parent = cl_container
		texture = options_calibrate_lag_note
		id = <circle_id>
		pos = <circle_pos>
		dims = ($calibrate_lag_menu_circle_dims)
		just = [left top]
		rgba = [255 255 255 255]
		z_priority = (<z> + 51)
		alpha = <circle_alpha>
	}
	<circle_id> :settags existence = 0 hit = 0 check = 1
	<circle_id> :settags initial_position = <circle_pos>
	<circle_id> :settags time_requirement = (<steps> * (1.0 / <fps>))
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	launchevent \{type = unfocus
		target = root_window}
	change \{cl_ready_for_input = 0}
	cl_container :obj_spawnscriptnow \{cl_do_ping
		params = {
			time = 0.6
		}}
	cl_container :obj_spawnscriptnow do_calibration_update params = {device_num = <device_num>}
	wait \{0.6
		seconds}
	cl_countdown_text :se_setprops \{text = qs(0x13883900)
		scale = 0.7}
	beatsound
	cl_ping_id :se_setprops \{alpha = 0}
	wait \{0.4
		seconds}
	cl_countdown_circle :se_setprops \{alpha = 0}
	change \{cl_ready_for_input = 1}
	calibrate_lag_target :se_setprops \{alpha = 1}
	wait \{1
		gameframe}
	cl_countdown_text :se_setprops \{alpha = 0}
endscript

script menu_calibrate_lag_destroy_circles 
	circle_index = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	destroy_menu menu_id = <circle_id>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	destroy_menu \{menu_id = clm_dummy_event_handler}
endscript

script do_calibration_update 
	<circle_index> = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	<circle_id> :settags sounded = 0 pinged = 0
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	getfps
	begin
	circle_index = 0
	num_circles_gone = 0
	delta_time = (1.0 / <fps>)
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	<circle_id> :gettags
	<existence> = (<existence> + <delta_time>)
	update_difference = (<delta_time>)
	position_change = (<update_difference> * ($calibrate_lag_menu_circle_velocity))
	casttointeger \{position_change}
	getscreenelementposition id = <circle_id>
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
			<circle_id> :settags sounded = 1
		endif
	endif
	if (<diff> < <position_change>)
		<circle_alpha> = 1
		if ($calibrate_lag_section = audio)
			<circle_alpha> = 0
		endif
	endif
	if ((<screenelementpos>.(0.0, 1.0)) > ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.0))))
		if (<hit> = 0 && <check> = 1)
			change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
			<circle_id> :settags check = 0
		endif
		<num_circles_gone> = (<num_circles_gone> + 1)
		<circle_id> :obj_spawnscriptnow cl_fade_circle params = {id = <circle_id>}
	endif
	<circle_id> :se_setprops pos = (<screenelementpos>)
	<circle_id> :settags existence = <existence>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_circles_gone> = $calibrate_lag_menu_num_circles)
		cl_container :obj_spawnscriptlater kill_off_and_finish_calibration params = {device_num = <device_num>}
	endif
	if (($calibrate_lag_end_checks = 0) && $cl_ready_for_input)
		<check_lines_are_even> = 0
		if isguitarcontroller controller = <device_num>
			if controllermake up <device_num>
				<check_lines_are_even> = 1
			endif
			if controllermake down <device_num>
				<check_lines_are_even> = 1
			endif
		elseif isdrumcontroller controller = <device_num>
			if controllermake x <device_num>
				<check_lines_are_even> = 1
			endif
			if controllermake circle <device_num>
				<check_lines_are_even> = 1
			endif
			if controllermake square <device_num>
				<check_lines_are_even> = 1
			endif
			if controllermake triangle <device_num>
				<check_lines_are_even> = 1
			endif
			if controllermake r1 <device_num>
				<check_lines_are_even> = 1
			endif
			if controllermake l1 <device_num>
				<check_lines_are_even> = 1
			endif
		else
			getenterbuttonassignment
			if controllermake <assignment> <device_num>
				<check_lines_are_even> = 1
			endif
		endif
		if (<check_lines_are_even>)
			cl_container :obj_spawnscriptnow \{menu_calibrate_lag_say_lines_are_even}
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script cl_fade_circle 
	if ($calibrate_lag_section = video)
		<id> :se_setprops rgba = [0 0 0 255] alpha = 0.5 time = 0.009
	endif
endscript

script cl_do_ping \{time = 0.066}
	cl_ping_id :se_setprops \{scale = 10
		alpha = 0}
	cl_ping_id :se_setprops scale = 1 alpha = 1 motion = ease_in time = <time>
	cl_ping_id :se_waitprops
	cl_ping_id :se_setprops \{alpha = 0
		motion = ease_in
		time = 0.1}
	cl_ping_id :se_waitprops
endscript

script menu_calibrate_lag_say_lines_are_even 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	formattext checksumname = circle_id 'circle%d' d = ($calibrate_lag_circle_index)
	if NOT screenelementexists id = <circle_id>
		return
	endif
	if NOT screenelementexists \{id = calibrate_lag_target}
		return
	endif
	<circle_id> :gettags
	getscreenelementposition id = <circle_id>
	getscreenelementdims id = <circle_id>
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
	if isxenon
		if ($calibrate_lag_section = video)
			<new_input_diff> = (<new_input_diff> - 12)
		endif
	endif
	setarrayelement arrayname = calibrate_lag_results globalarray index = ($calibrate_lag_circle_index) newvalue = <new_input_diff>
	output_log_text qs(0x929bffbd) o = <new_input_diff> color = white
	get_closest_circle_above_line
	<circle_id> :settags hit = 1
	change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
	<closest_id> :se_setprops hide
	current_menu_anchor :se_setprops \{calibrate_lag_shock_alpha = 1.0}
	current_menu_anchor :se_setprops \{calibrate_lag_shock_alpha = 0.0
		time = 0.25}
	calibrate_lag_target :se_setprops \{scale = 1.5
		relative_scale
		time = 0.05}
	calibrate_lag_target :se_waitprops
	calibrate_lag_target :se_setprops \{scale = 1.0
		relative_scale
		time = 0.05}
	calibrate_lag_target :se_waitprops
	if (($calibrate_lag_circle_index) = ($calibrate_lag_menu_num_circles))
		change \{calibrate_lag_end_checks = 1}
		kill_off_and_finish_calibration
	endif
endscript

script cl_create_particles 
	create2dparticlesystem {
		id = cl_particles
		pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
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
		emit_rate = 0.001
		emit_dir = 0
		emit_spread = 360.0
		velocity = 16.0
		friction = (0.0, 20.0)
		time = 1.5
	}
	wait \{1.5
		seconds}
	destroy2dparticlesystem \{id = cl_particles
		kill_when_empty}
endscript

script kill_off_and_finish_calibration device_num = ($calibrate_lag_most_recent_controller)
	launchevent \{type = unfocus
		target = clm_dummy_event_handler}
	killspawnedscript \{name = do_calibration_update}
	menu_calibrate_lag_finish_up_calibration
	menu_calibrate_lag_destroy_circles
	user_control_helper_get_buttonchar button = green controller = <controller>
	if ($calibrate_lag_section = dialog_2)
		if isguitarcontroller controller = <device_num>
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
		change \{allow_console_pause_for_cal_lag = 0}
		ui_event \{event = menu_refresh}
	endif
endscript

script get_closest_circle_above_line 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	i = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <i>
	getscreenelementposition id = <circle_id>
	if ((<screenelementpos>.(0.0, 1.0)) < ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.25))))
		<circle_id> :gettags
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
	change \{calibrate_lag_started_finish = 1}
	<min> = 50000.0
	<max> = -50000.0
	index = 0
	num_hit = 0
	total_val = 0.0
	begin
	formattext checksumname = circle_id 'circle%d' d = <index>
	if NOT screenelementexists id = <circle_id>
		return
	endif
	<circle_id> :gettags
	if (<hit>)
		<num_hit> = (<num_hit> + 1)
		val = ($calibrate_lag_results [<index>])
		if (<val> < <min>)
			<min> = (<val>)
		endif
		if (<val> > <max>)
			<max> = (<val>)
		endif
		<total_val> = (<total_val> + <val>)
	endif
	<index> = (<index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_hit> > 2)
		<total_val> = (<total_val> - <min>)
		<total_val> = (<total_val> - <max>)
		avg = (<total_val> / (<num_hit> - 2))
		if (<avg> < 0)
			<avg> = 0
		elseif (<avg> > $calibrate_lag_cap)
			<avg> = $calibrate_lag_cap
		endif
		casttointeger \{avg}
		getglobaltags \{user_options}
		if ($calibrate_lag_section = audio)
			old_lag = <lag_calibration>
			setglobaltags user_options params = {lag_calibration = ((<avg> * 1000) + 1000)}
		elseif ($calibrate_lag_section = video)
			stoppinknoiseloopforcaliratelagscreen
			old_lag = <lag_calibration>
			setglobaltags user_options params = {lag_calibration = (<old_lag> + <avg>)}
		endif
	endif
	if ($calibrate_lag_section = audio)
		change \{calibrate_lag_section = dialog_2}
	elseif ($calibrate_lag_section = video)
		change \{calibrate_lag_section = none}
	endif
	launchevent \{type = focus
		target = root_window}
	wait \{30
		gameframes}
	stoppinknoiseloopforcaliratelagscreen
	if gotparam \{avg}
		if gotparam \{old_lag}
			casttointeger \{avg}
			if NOT (<old_lag> = <avg>)
				change \{calibrate_lag_dirty = 1}
			endif
		endif
	endif
endscript

script menu_calibrate_lag_reset_lag 
	getglobaltags \{user_options}
	if (<lag_calibration> = 1000)
		soundevent \{event = ui_sfx_negative_select}
		return
	endif
	soundevent \{event = quickplay_remove_all_songs}
	setglobaltags \{user_options
		params = {
			lag_calibration = 1000
		}}
	menu_calibrate_lag_update_text
	change \{calibrate_lag_dirty = 1}
endscript

script menu_calibrate_lag_manual_choose 
	setscreenelementprops \{id = cl_vmenu
		block_events}
	cl_arrow_color = [220 220 220 255]
	if gotparam \{audio}
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
	createscreenelement {
		type = containerelement
		parent = cl_container
		id = cl_manual_adjust_handler
		event_handlers = [
			{pad_up menu_calibrate_lag_manual_up params = {<...>}}
			{pad_down menu_calibrate_lag_manual_down params = {<...>}}
			{pad_choose menu_calibrate_lag_manual_back params = {<...>}}
			{pad_back menu_calibrate_lag_manual_back params = {<...>}}
		]
	}
	launchevent \{type = focus
		target = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_back 
	setscreenelementprops \{id = cl_vmenu
		unblock_events}
	destroyscreenelement \{id = cl_manual_adjust_handler}
	if gotparam \{audio}
		retail_menu_unfocus \{id = cl_option_audio_ms}
		retail_menu_focus \{id = cl_option_audio_text}
		cl_option_audio_arrow_top :se_setprops \{rgba = [
				0
				0
				0
				255
			]}
		cl_option_audio_arrow_bottom :se_setprops \{rgba = [
				0
				0
				0
				255
			]}
	else
		retail_menu_unfocus \{id = cl_option_video_ms}
		retail_menu_focus \{id = cl_option_video_text}
		cl_option_video_arrow_top :se_setprops \{rgba = [
				0
				0
				0
				255
			]}
		cl_option_video_arrow_bottom :se_setprops \{rgba = [
				0
				0
				0
				255
			]}
	endif
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_up 
	<do_morph> = 0
	if gotparam \{audio}
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
		soundevent \{event = enter_band_name_scroll_up}
	endif
endscript

script menu_calibrate_lag_manual_down 
	<do_morph> = 0
	if gotparam \{audio}
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
		soundevent \{event = enter_band_name_scroll_down}
	endif
endscript

script menu_calibrate_lag_adjust \{value = 1
		for_audio = 0}
	getglobaltags \{user_options}
	if (<lag_calibration> = 0)
		<audio_calibration> = 0.0
	else
		<audio_calibration> = ((<lag_calibration> / 1000) - 1)
	endif
	casttointeger \{audio_calibration}
	<video_calibration> = <lag_calibration>
	casttointeger \{video_calibration}
	mod a = <video_calibration> b = 1000
	<video_calibration> = <mod>
	if (<for_audio> = 1)
		<audio_calibration> = (<audio_calibration> + <value>)
		if (<audio_calibration> > $calibrate_lag_cap)
			return \{false}
		elseif (<audio_calibration> < 0)
			return \{false}
		endif
	else
		<video_calibration> = (<video_calibration> + <value>)
		if (<video_calibration> > $calibrate_lag_cap)
			return \{false}
		elseif (<video_calibration> < 0)
			return \{false}
		endif
	endif
	<new_lag_calibration> = ((<audio_calibration> * 1000) + 1000)
	<new_lag_calibration> = (<new_lag_calibration> + <video_calibration>)
	change \{calibrate_lag_dirty = 1}
	setglobaltags user_options params = {lag_calibration = <new_lag_calibration>}
	menu_calibrate_lag_update_text
	return \{true}
endscript

script beatsound 
	soundevent \{event = gh_sfx_calibration_beatsoundevent}
endscript
