calibrate_lag_menu_font = fontgrid_title_gh3
calibrate_lag_menu_line_pos = (420.0, 360.0)
calibrate_lag_menu_circle_dims = (96.0, 96.0)
calibrate_lag_menu_circle_velocity = 300
calibrate_lag_menu_circle_inital_pos = (420.0, -146.0)
calibrate_lag_menu_circle_separation = 320
calibrate_lag_menu_num_circles = 10
calibrate_lag_hilite_pos0 = (615.0, 443.0)
calibrate_lag_hilite_dims0 = (490.0, 50.0)
calibrate_lag_hilite_pos1 = (615.0, 495.0)
calibrate_lag_hilite_dims1 = (490.0, 50.0)
calibrate_lag_hilite_pos2 = (615.0, 548.0)
calibrate_lag_hilite_dims2 = (490.0, 50.0)
calibrate_lag_hilite_pos3 = (625.0, 595.0)
calibrate_lag_hilite_dims3 = (480.0, 50.0)
calibrate_lag_hilite_unselected = [
	110
	100
	120
	255
]
calibrate_lag_hilite_selected = [
	130
	100
	150
	255
]
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
calibrate_lag_early_window = -150
calibrate_lag_late_window = 400
cl_ready_for_input = 0
calibrate_lag_most_recent_in_game_setting = 0
calibrate_lag_section = none

script create_calibrate_lag_dialog_menu 
	if gotparam \{dialog_1}
		setup_calibration_lag_dialog_1
	elseif gotparam \{dialog_2}
		setup_calibration_lag_dialog_2
	endif
	if ($calibrate_lag_most_recent_in_game_setting = 1)
		<controller> = ($last_start_pressed_device)
	else
		<controller> = ($primary_controller)
	endif
	create_calibrate_background \{z = 80}
	memcard_cleanup_messages
	create_popup_warning_menu {
		player_device = <controller>
		no_background
		title = <title_text>
		textblock = {
			text = <body_text>
			dims = (800.0, 400.0)
			scale = 0.5
		}
		menu_pos = (640.0, 490.0)
		dialog_dims = (288.0, 64.0)
		helper_pills = [select]
		options = [
			{
				func = {ui_flow_manager_respond_to_action params = {action = continue}}
				text = "CONTINUE"
				scale = (1.0, 1.0)
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
	change \{disable_menu_sounds = 1}
	change calibrate_lag_most_recent_in_game_setting = <from_in_game>
	if iswinport
		if ($calibrate_lag_most_recent_in_game_setting = 1)
			kill_start_key_binding
		endif
	else
		kill_start_key_binding
	endif
	menu_music_off
	if viewportexists \{id = bg_viewport}
		disable_bg_viewport
	endif
	change \{calibrate_lag_end_checks = 0}
	change \{calibrate_lag_started_finish = 0}
	set_focus_color \{color = white230}
	set_unfocus_color \{rgba = $calibrate_lag_hilite_unselected}
	z = 100
	create_calibrate_background <...>
	calibrate_lag_fill_options z = <z> from_in_game = <from_in_game>
	if NOT screenelementexists \{id = cl_container}
		return
	endif
	displaysprite {
		parent = cl_container
		id = calibrate_lag_target
		tex = options_calibrate_target
		pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
		just = [center center]
		dims = (96.0, 96.0)
		z = (<z> + 50)
		alpha = 0.75
	}
	displaysprite \{parent = cl_container
		id = cl_ping_id
		tex = options_audio_ping
		alpha = 0
		scale = 5
		z = 180
		just = [
			center
			center
		]
		pos = (468.0, 406.0)}
	cl_ping_id :domorph \{alpha = 0}
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	if ($calibrate_lag_section = none)
		launchevent \{type = focus
			target = cl_vmenu}
	endif
	if ($calibrate_lag_section = video)
		launchevent \{type = pad_choose
			target = calibrate_calibrate_option}
	elseif ($calibrate_lag_section = audio)
		launchevent \{type = pad_choose
			target = calibrate_calibrate_option}
	endif
	change \{disable_menu_sounds = 0}
endscript

script create_calibrate_background 
	createscreenelement \{type = containerelement
		parent = root_window
		id = cl_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = venue_bg}
	displaysprite {
		parent = cl_container
		tex = venue_bg
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z = (<z> - 4)
	}
	createscreenelement {
		type = spriteelement
		parent = cl_container
		id = as_light_overlay
		texture = venue_overlay
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z_priority = (<z> - 1)
	}
	displaysprite {
		parent = cl_container
		tex = options_calibrate_poster
		pos = (250.0, 0.0)
		dims = (432.0, 954.0)
		z = <z>
	}
	displaysprite {
		parent = cl_container
		tex = options_calibrate_paper
		pos = (600.0, -100.0)
		dims = (610.0, 892.0)
		z = (<z> - 2)
	}
	displaysprite {
		parent = cl_container
		tex = options_calibrate_paper
		just = [left bottom]
		pos = (610.0, 970.0)
		dims = (605.0, 590.0)
		z = (<z> - 1.5)
		flip_h
	}
	displaysprite {
		parent = cl_container
		tex = toprockers_tape_2
		pos = (720.0, -100.0)
		dims = (180.0, 80.0)
		z = (<z> + 2)
		rot_angle = 93
	}
	displaysprite {
		parent = cl_container
		tex = toprockers_tape_2
		rgba = [0 0 0 128]
		pos = (725.0, -102.0)
		dims = (180.0, 80.0)
		z = (<z> + 2)
		rot_angle = 93
	}
	<tape_offset> = (90.0, 325.0)
	displaysprite {
		parent = cl_container
		tex = tape_v_01
		pos = ((970.0, 106.0) + <tape_offset>)
		dims = (96.0, 192.0)
		z = (<z> + 2)
		flip_v
		rot_angle = -6
	}
	displaysprite {
		parent = cl_container
		tex = tape_v_01
		rgba = [0 0 0 128]
		pos = ((975.0, 104.0) + <tape_offset>)
		dims = (96.0, 192.0)
		z = (<z> + 2)
		flip_v
		rot_angle = -6
	}
	displaysprite {
		parent = cl_container
		tex = tape_h_02
		pos = (220.0, 566.0)
		dims = (132.0, 64.0)
		z = (<z> + 2)
		rot_angle = 8
	}
	displaysprite {
		parent = cl_container
		tex = tape_h_02
		rgba = [0 0 0 128]
		pos = (212.0, 572.0)
		dims = (132.0, 64.0)
		z = (<z> + 2)
		rot_angle = 8
	}
	displaytext \{parent = cl_container
		text = "HDTV LAG"
		pos = (770.0, 80.0)
		font = fontgrid_title_gh3
		rgba = [
			0
			0
			0
			255
		]
		noshadow}
	upper_helper = "Some HDTVs have an audio/video delay that makes playing difficult. If you're ready to blame your TV, try calibrating."
	createscreenelement {
		type = textblockelement
		parent = cl_container
		pos = (700.0, 80.0)
		text = <upper_helper>
		font = text_a6
		dims = (575.0, 0.0)
		allow_expansion
		rgba = [60 40 115 255]
		scale = 0.56
		just = [left top]
		internal_just = [left top]
		z_priority = <z>
	}
	getscreenelementdims id = <id>
	getscreenelementposition id = <id>
endscript

script calibrate_lag_fill_options \{z = 100}
	if (<from_in_game>)
		<controller> = ($last_start_pressed_device)
	else
		<controller> = ($primary_controller)
	endif
	createscreenelement {
		type = spriteelement
		parent = cl_container
		id = calibrate_lag_hilite
		texture = options_calibrate_hilite
		just = [left top]
		pos = $calibrate_lag_hilite_pos0
		rgba = $calibrate_lag_hilite_unselected
		z_priority = <z>
	}
	calib_eh = [
		{pad_back menu_calibrate_go_back}
	]
	new_menu {
		scrollid = cl_scroll
		vmenuid = cl_vmenu
		menu_pos = (700.0, 435.0)
		event_handlers = <calib_eh>
		exclusive_device = <controller>
		text_left
		default_colors = 0
		spacing = -5
		no_focus = 1
	}
	wait \{2
		gameframes}
	text_params = {parent = cl_vmenu type = textelement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color) scale = 0.9}
	if NOT screenelementexists \{id = cl_vmenu}
		return
	endif
	createscreenelement {
		<text_params>
		id = calibrate_calibrate_option
		text = "CALIBRATE"
		event_handlers = [
			{focus menu_calibrate_focus params = {index = 0}}
			{unfocus menu_calibrate_unfocus params = {index = 0}}
			{pad_choose menu_calibrate_lag_create_circles params = {z = <z> device_num = <controller>}}
		]
		z_priority = (<z> + 1)
		pos = (0.0, 14.0)
	}
	getscreenelementdims id = <id>
	fit_text_in_rectangle id = <id> dims = ((340.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1
	createscreenelement {
		<text_params>
		id = calibrate_reset_option
		text = "RESET"
		event_handlers = [
			{focus menu_calibrate_focus params = {index = 1}}
			{unfocus menu_calibrate_unfocus params = {index = 1}}
			{pad_choose menu_calibrate_lag_reset_lag params = {z = <z>}}
		]
		z_priority = (<z> + 1)
	}
	getscreenelementdims id = <id>
	fit_text_in_rectangle id = <id> dims = ((340.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1
	createscreenelement \{type = containerelement
		parent = cl_vmenu
		id = calibrate_manual_option_audio
		event_handlers = [
			{
				focus
				menu_calibrate_focus
				params = {
					index = 2
				}
			}
			{
				unfocus
				menu_calibrate_unfocus
				params = {
					index = 2
				}
			}
			{
				pad_choose
				menu_calibrate_lag_manual_choose
				params = {
					audio
				}
			}
		]}
	<container_id> = <id>
	createscreenelement {
		<text_params>
		parent = <container_id>
		id = lag_offset_text_audio
		text = " "
		just = [left top]
		z_priority = (<z> + 1)
		pos = (40.0, 0.0)
	}
	createscreenelement {
		type = spriteelement
		id = cl_manual_adjust_up_arrow_audio
		parent = <container_id>
		texture = online_arrow
		just = [center bottom]
		pos = (16.0, 16.0)
		rgba = ($calibrate_lag_hilite_unselected)
		alpha = 1
		scale = 0.65000004
		z_priority = (<z> + 1)
		flip_h
	}
	createscreenelement {
		type = spriteelement
		id = cl_manual_adjust_down_arrow_audio
		parent = <container_id>
		texture = online_arrow
		just = [center top]
		pos = (16.0, 20.0)
		rgba = ($calibrate_lag_hilite_unselected)
		alpha = 1
		scale = 0.65000004
		z_priority = (<z> + 1)
	}
	createscreenelement \{type = containerelement
		parent = cl_vmenu
		id = calibrate_manual_option
		event_handlers = [
			{
				focus
				menu_calibrate_focus
				params = {
					index = 3
				}
			}
			{
				unfocus
				menu_calibrate_unfocus
				params = {
					index = 3
				}
			}
			{
				pad_choose
				menu_calibrate_lag_manual_choose
			}
		]}
	<container_id> = <id>
	createscreenelement {
		<text_params>
		parent = <container_id>
		id = lag_offset_text
		text = " "
		just = [left top]
		z_priority = (<z> + 1)
		pos = (40.0, 52.0)
	}
	calibrate_lag_update_text
	createscreenelement {
		type = spriteelement
		id = cl_manual_adjust_up_arrow
		parent = <container_id>
		texture = online_arrow
		just = [center bottom]
		pos = (16.0, 68.0)
		rgba = ($calibrate_lag_hilite_unselected)
		alpha = 1
		scale = 0.65000004
		z_priority = (<z> + 1)
		flip_h
	}
	createscreenelement {
		type = spriteelement
		id = cl_manual_adjust_down_arrow
		parent = <container_id>
		texture = online_arrow
		just = [center top]
		pos = (16.0, 72.0)
		rgba = ($calibrate_lag_hilite_unselected)
		alpha = 1
		scale = 0.65000004
		z_priority = (<z> + 1)
	}
	setscreenelementlock \{id = cl_vmenu
		on}
endscript

script calibrate_lag_update_text 
	if iswinport
		winportgetaudiovideolag
		<lag_calibration> = <value>
	else
		getglobaltags \{user_options}
	endif
	casttointeger \{lag_calibration}
	if (<lag_calibration> < 1000)
		<lag_calibration> = (<lag_calibration> + 1000)
	endif
	audio_lag = ((<lag_calibration> / 1000) - 1)
	casttointeger \{audio_lag}
	formattext textname = lag_value_text "Audio: %d ms" d = <audio_lag>
	lag_offset_text_audio :setprops text = <lag_value_text>
	mod a = <lag_calibration> b = 1000
	formattext textname = lag_value_text "Video: %d ms" d = <mod>
	lag_offset_text :setprops text = <lag_value_text>
endscript

script destroy_calibrate_lag_menu 
	spawnscriptnow \{menu_music_on}
	if viewportexists \{id = bg_viewport}
		enable_bg_viewport
	endif
	change \{calibrate_lag_dirty = 0}
	destroy_menu_backdrop
	clean_up_user_control_helpers
	killspawnedscript \{name = do_calibration_update}
	destroy_menu \{menu_id = cl_scroll}
	destroy_menu \{menu_id = cl_container}
	if screenelementexists \{idcl_manual_adjust_handler}
		destroyscreenelement \{id = cl_manual_adjust_handler}
	endif
	launchevent \{type = focus
		target = root_window}
endscript

script menu_calibrate_focus 
	generic_menu_up_or_down_sound
	wait \{1
		gameframes}
	if (<index> = 0)
		retail_menu_focus
		setscreenelementprops \{id = calibrate_lag_hilite
			pos = $calibrate_lag_hilite_pos0
			dims = $calibrate_lag_hilite_dims0}
	elseif (<index> = 1)
		retail_menu_focus
		setscreenelementprops \{id = calibrate_lag_hilite
			pos = $calibrate_lag_hilite_pos1
			dims = $calibrate_lag_hilite_dims1}
	elseif (<index> = 2)
		obj_getid
		retail_menu_focus id = {<objid> child = 0}
		setscreenelementprops \{id = calibrate_lag_hilite
			pos = $calibrate_lag_hilite_pos2
			dims = $calibrate_lag_hilite_dims2}
		doscreenelementmorph \{id = cl_manual_adjust_up_arrow_audio
			rgba = $menu_focus_color}
		doscreenelementmorph \{id = cl_manual_adjust_down_arrow_audio
			rgba = $menu_focus_color}
	else
		obj_getid
		retail_menu_focus id = {<objid> child = 0}
		setscreenelementprops \{id = calibrate_lag_hilite
			pos = $calibrate_lag_hilite_pos3
			dims = $calibrate_lag_hilite_dims3}
		doscreenelementmorph \{id = cl_manual_adjust_up_arrow
			rgba = $menu_focus_color}
		doscreenelementmorph \{id = cl_manual_adjust_down_arrow
			rgba = $menu_focus_color}
	endif
endscript

script menu_calibrate_unfocus 
	if (<index> = 0)
		retail_menu_unfocus
	elseif (<index> = 1)
		retail_menu_unfocus
	elseif (<index> = 2)
		obj_getid
		retail_menu_unfocus id = {<objid> child = 0}
		doscreenelementmorph id = cl_manual_adjust_up_arrow_audio rgba = ($calibrate_lag_hilite_unselected)
		doscreenelementmorph id = cl_manual_adjust_down_arrow_audio rgba = ($calibrate_lag_hilite_unselected)
	else
		obj_getid
		retail_menu_unfocus id = {<objid> child = 0}
		doscreenelementmorph id = cl_manual_adjust_up_arrow rgba = ($calibrate_lag_hilite_unselected)
		doscreenelementmorph id = cl_manual_adjust_down_arrow rgba = ($calibrate_lag_hilite_unselected)
	endif
endscript

script play_calibrate_click 
	wait \{0.583
		seconds}
	formattext textname = tex "%t" t = (3 - <i>)
	setscreenelementprops id = cl_countdown_text text = <tex>
	if ($calibrate_lag_section = audio)
		soundevent \{event = gh_sfx_hitnotesoundevent}
	endif
endscript

script menu_calibrate_lag_create_circles 
	playsound \{heavy_crowd_loop_good_01
		buss = `default`
		vol = 1
		num_loops = -1}
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if ($calibrate_lag_section = none)
		ui_flow_manager_respond_to_action \{action = show_dialog_1}
		return
	endif
	createscreenelement {
		parent = cl_container type = textelement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color)
		id = clm_dummy_event_handler
		text = ""
		z_priority = <z>
	}
	launchevent \{type = focus
		target = clm_dummy_event_handler}
	launchevent \{type = unfocus
		target = cl_vmenu}
	clean_up_user_control_helpers
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "STRUM"
		button = strumbar
		z = 100}
	destroy_menu \{menu_id = cl_scroll}
	destroy_menu \{menu_id = calibrate_lag_hilite}
	kill_debug_elements
	init_play_log
	generic_menu_pad_choose_sound
	displaysprite {
		id = cl_countdown_circle
		parent = cl_container
		tex = song_summary_circle_2p
		pos = ($calibrate_lag_menu_line_pos + (13.0, 14.0))
		rgba = [220 220 220 208]
		dims = (72.0, 72.0)
		z = 199
	}
	createscreenelement {
		type = textelement
		id = cl_countdown_text
		parent = cl_container
		pos = ($calibrate_lag_menu_line_pos + (47.0, 58.0))
		scale = (1.0, 1.0)
		text = ""
		font = ($calibrate_lag_menu_font)
		rgba = [0 0 0 255]
		z_priority = 200
	}
	<sep> = ($calibrate_lag_menu_circle_separation * 1.0)
	<vel> = ($calibrate_lag_menu_circle_velocity * 1.0)
	<seconds_between_circles> = (<sep> / <vel>)
	<i> = 0
	begin
	spawnscriptnow \{cl_do_ping
		params = {
			time = 0.6
		}}
	spawnscriptnow play_calibrate_click params = {<...>}
	wait (<seconds_between_circles> + 0.01) seconds
	<i> = (<i> + 1)
	repeat 3
	change \{calibrate_lag_circle_index = 0}
	half_circle_width = 0
	circle_index = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	circle_pos = (($calibrate_lag_menu_circle_inital_pos) - ((0.0, 1.0) * <circle_index> * ($calibrate_lag_menu_circle_separation)))
	<one_frame> = ((1.0 / 60.0) * $calibrate_lag_menu_circle_velocity)
	casttointeger \{one_frame}
	<y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - <circle_pos>.(0.0, 1.0))
	<steps> = (<y_off> / <one_frame>)
	casttointeger \{steps}
	<new_y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - (<steps> * <one_frame>))
	<circle_pos> = ((<circle_pos>.(1.0, 0.0) * (1.0, 0.0)) + (<new_y_off> * (0.0, 1.0)))
	circle_alpha = 0.5
	if ($calibrate_lag_section = audio)
		<circle_alpha> = 0
	endif
	createscreenelement {
		type = spriteelement
		parent = cl_container
		texture = options_calibrate_note
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
	<circle_id> :settags time_requirement = (<steps> * (1.0 / 60.0))
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	launchevent \{type = unfocus
		target = root_window}
	wait \{1
		gameframe}
	change \{cl_ready_for_input = 0}
	spawnscriptnow \{cl_do_ping
		params = {
			time = 0.6
		}}
	spawnscriptnow do_calibration_update params = {device_num = <device_num>}
	wait \{0.563
		seconds}
	setscreenelementprops \{id = cl_countdown_text
		text = "GO!"
		scale = 0.7}
	if ($calibrate_lag_section = audio)
		soundevent \{event = gh_sfx_hitnotesoundevent}
	endif
	cl_ping_id :domorph \{alpha = 0}
	wait \{0.4
		seconds}
	setscreenelementprops \{id = cl_countdown_circle
		alpha = 0}
	change \{cl_ready_for_input = 1}
	doscreenelementmorph \{id = calibrate_lag_target
		alpha = 1}
	wait \{1
		gameframe}
	setscreenelementprops \{id = cl_countdown_text
		alpha = 0}
endscript

script menu_calibrate_go_back 
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if screenelementexists \{id = cl_scroll}
		launchevent \{type = unfocus
			target = cl_scroll}
	endif
	if screenelementexists \{id = cl_vmenu}
		launchevent \{type = unfocus
			target = cl_vmenu}
	endif
	if ($calibrate_lag_dirty = 1)
		ui_flow_manager_respond_to_action \{action = continue}
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
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
	begin
	circle_index = 0
	num_circles_gone = 0
	delta_time = (1.0 / 60.0)
	if (($calibrate_lag_end_checks = 0) && $cl_ready_for_input)
		if controllermake up <device_num>
			spawnscriptnow menu_calibrate_lag_do_guitar_check_up_down params = {device_num = <device_num>}
		endif
		if controllermake down <device_num>
			spawnscriptnow menu_calibrate_lag_do_guitar_check_up_down params = {device_num = <device_num>}
		endif
		if controllermake x <device_num>
			spawnscriptnow menu_calibrate_lag_do_guitar_check_choose params = {device_num = <device_num>}
		endif
	endif
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
	if isxenon
		<cl_tweak> = ($calibrate_lag_tick_ms_offset_xenon / 1000.0)
	else
		<cl_tweak> = ($calibrate_lag_tick_ms_offset_ps3 / 1000.0)
	endif
	if ((($calibrate_lag_menu_circle_velocity) * <cl_tweak>) >= <diff>)
		if (<sounded> = 0)
			if ($calibrate_lag_section = audio)
				soundevent \{event = gh_sfx_hitnotesoundevent}
			endif
			<circle_id> :settags sounded = 1
		endif
	endif
	if (<diff> < <position_change>)
		circle_alpha = 1
		if ($calibrate_lag_section = audio)
			<circle_alpha> = 0
		endif
		setscreenelementprops id = <circle_id> rgba = [135 0 180 255] alpha = <circle_alpha>
	endif
	if ((<screenelementpos>.(0.0, 1.0)) > ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.0))))
		if (<hit> = 0 && <check> = 1)
			change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
			<circle_id> :settags check = 0
		endif
		<num_circles_gone> = (<num_circles_gone> + 1)
		<circle_id> :obj_spawnscriptnow cl_fade_circle params = {id = <circle_id>}
	endif
	<circle_id> :setprops pos = (<screenelementpos>)
	<circle_id> :settags existence = <existence>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_circles_gone> = $calibrate_lag_menu_num_circles)
		spawnscriptlater \{kill_off_and_finish_calibration}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script cl_fade_circle 
	if ($calibrate_lag_section = video)
		<id> :domorph rgba = [0 0 0 255] alpha = 0.5 time = 0.009
	endif
endscript

script cl_do_ping \{time = 0.066}
	cl_ping_id :domorph \{scale = 10
		alpha = 0}
	cl_ping_id :domorph scale = 1 alpha = 1 motion = ease_in time = <time>
	cl_ping_id :domorph \{alpha = 0
		motion = ease_in
		time = 0.1}
endscript

script menu_calibrate_lag_do_guitar_check_choose 
	if ($calibrate_lag_end_checks = 0)
		if NOT isguitarcontroller controller = <device_num>
			menu_calibrate_lag_say_lines_are_even
		endif
	endif
endscript

script menu_calibrate_lag_do_guitar_check_up_down 
	if ($calibrate_lag_end_checks = 0)
		if isguitarcontroller controller = <device_num>
			menu_calibrate_lag_say_lines_are_even
		endif
	endif
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
	setarrayelement arrayname = calibrate_lag_results globalarray index = ($calibrate_lag_circle_index) newvalue = <new_input_diff>
	output_log_text "Calibrate: %o" o = <new_input_diff> color = white
	get_closest_circle_above_line
	<circle_id> :settags hit = 1
	change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
	<closest_id> :setprops hide
	calibrate_lag_target :domorph \{scale = 1.5
		relative_scale
		time = 0.05}
	calibrate_lag_target :domorph \{scale = 1.0
		relative_scale
		time = 0.05}
	if (($calibrate_lag_circle_index) = ($calibrate_lag_menu_num_circles))
		change \{calibrate_lag_end_checks = 1}
		kill_off_and_finish_calibration
	endif
endscript

script kill_off_and_finish_calibration 
	if screenelementexists \{id = clm_dummy_event_handler}
		launchevent \{type = unfocus
			target = clm_dummy_event_handler}
	endif
	killspawnedscript \{name = do_calibration_update}
	menu_calibrate_lag_finish_up_calibration
	menu_calibrate_lag_destroy_circles
	if ($calibrate_lag_section = dialog_2)
		ui_flow_manager_respond_to_action \{action = show_dialog_2}
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
	min = 50000.0
	max = -50000.0
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
		if iswinport
			winportgetaudiovideolag
			<lag_calibration> = <value>
		else
			getglobaltags \{user_options}
		endif
		if ($calibrate_lag_section = audio)
			old_lag = <lag_calibration>
			if iswinport
				winportsetaudiovideolag value = ((<avg> * 1000) + 1000)
				setglobaltags user_options params = {lag_calibration = ((<avg> * 1000) + 1000)}
			else
				setglobaltags user_options params = {lag_calibration = ((<avg> * 1000) + 1000)}
			endif
		elseif ($calibrate_lag_section = video)
			stopsound \{heavy_crowd_loop_good_01}
			old_lag = <lag_calibration>
			<old_lag> = ((<old_lag> / 1000) - 1)
			casttointeger \{old_lag}
			<old_lag> = ((<old_lag> * 1000) + 1000)
			if iswinport
				winportsetaudiovideolag value = (<old_lag> + <avg>)
				setglobaltags user_options params = {lag_calibration = (<old_lag> + <avg>)}
			else
				setglobaltags user_options params = {lag_calibration = (<old_lag> + <avg>)}
			endif
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
	if ($calibrate_lag_section = none)
		destroy_calibrate_lag_menu
		create_calibrate_lag_menu from_in_game = ($calibrate_lag_most_recent_in_game_setting)
	endif
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
	generic_menu_up_or_down_sound
	if iswinport
		winportgetdefaultaudiovideolag
		<winport_default_audio_video_lag> = <value>
		winportgetaudiovideolag
		if (<winport_default_audio_video_lag> = <value>)
			return
		endif
		winportsetaudiovideolag value = <winport_default_audio_video_lag>
		setglobaltags user_options params = {lag_calibration = <winport_default_audio_video_lag>}
	else
		getglobaltags \{user_options}
		if (<lag_calibration> = 1000)
			return
		endif
		setglobaltags \{user_options
			params = {
				lag_calibration = 1000
			}}
	endif
	calibrate_lag_update_text
	change \{calibrate_lag_dirty = 1}
endscript

script menu_calibrate_lag_manual_choose 
	setscreenelementprops \{id = calibrate_lag_hilite
		rgba = $calibrate_lag_hilite_selected}
	runscriptonscreenelement \{id = calibrate_lag_hilite
		pulse_lag_hilite}
	setscreenelementprops \{id = cl_vmenu
		block_events}
	createscreenelement {
		type = containerelement
		parent = cl_container
		id = cl_manual_adjust_handler
		event_handlers = [
			{pad_up menu_calibrate_lag_manual_up params = {<...>}}
			{pad_down menu_calibrate_lag_manual_down params = {<...>}}
			{pad_choose menu_calibrate_lag_manual_back}
			{pad_back menu_calibrate_lag_manual_back}
		]
	}
	launchevent \{type = focus
		target = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script pulse_lag_hilite 
	begin
	getscreenelementprops \{id = calibrate_lag_hilite}
	match_rgba rgba1 = <rgba> rgba2 = $calibrate_lag_hilite_selected
	if (<rgba_match> = 1)
		domorph \{id = calibrate_lag_hilite
			alpha = 0.6
			time = 0.4
			motion = ease_out}
		domorph \{id = calibrate_lag_hilite
			alpha = 1
			time = 0.6
			motion = ease_in}
	else
		domorph \{id = calibrate_lag_hilite
			alpha = 1
			time = 0.2
			motion = ease_out}
		break
	endif
	repeat
endscript

script menu_calibrate_lag_manual_back 
	setscreenelementprops \{id = calibrate_lag_hilite
		rgba = $calibrate_lag_hilite_unselected}
	setscreenelementprops \{id = cl_vmenu
		unblock_events}
	destroyscreenelement \{id = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_up 
	do_morph = 0
	if gotparam \{audio}
		arrow_id = cl_manual_adjust_up_arrow_audio
		if menu_calibrate_lag_adjust \{value = 1
				for_audio = 1}
			do_morph = 1
		endif
	else
		arrow_id = cl_manual_adjust_up_arrow
		if menu_calibrate_lag_adjust \{value = 1}
			do_morph = 1
		endif
	endif
	if (<do_morph> = 1)
		doscreenelementmorph id = <arrow_id> scale = 1.5 relative_scale
		doscreenelementmorph id = <arrow_id> scale = 1.0 relative_scale time = 0.15
	endif
	generic_menu_up_or_down_sound
endscript

script menu_calibrate_lag_manual_down 
	do_morph = 0
	if gotparam \{audio}
		arrow_id = cl_manual_adjust_down_arrow_audio
		if menu_calibrate_lag_adjust \{value = -1
				for_audio = 1}
			do_morph = 1
		endif
	else
		arrow_id = cl_manual_adjust_down_arrow
		if menu_calibrate_lag_adjust \{value = -1}
			do_morph = 1
		endif
	endif
	if (<do_morph> = 1)
		doscreenelementmorph id = <arrow_id> scale = 1.5 relative_scale
		doscreenelementmorph id = <arrow_id> scale = 1.0 relative_scale time = 0.15
	endif
	generic_menu_up_or_down_sound
endscript

script menu_calibrate_lag_adjust \{value = 1
		for_audio = 0}
	if iswinport
		<temp_value> = <value>
		winportgetaudiovideolag
		<lag_calibration> = <value>
		<value> = <temp_value>
	else
		getglobaltags \{user_options}
	endif
	<audio_calibration> = ((<lag_calibration> / 1000) - 1)
	casttointeger \{audio_calibration}
	<video_calibration> = <lag_calibration>
	casttointeger \{video_calibration}
	mod a = <video_calibration> b = 1000
	<video_calibration> = <mod>
	if (<for_audio> = 1)
		<audio_calibration> = (<audio_calibration> + <value>)
		if (<audio_calibration> > $calibrate_lag_cap)
			<audio_calibration> = 0
		elseif (<audio_calibration> < 0)
			<audio_calibration> = $calibrate_lag_cap
		endif
	else
		<video_calibration> = (<video_calibration> + <value>)
		if (<video_calibration> > $calibrate_lag_cap)
			<video_calibration> = 0
		elseif (<video_calibration> < 0)
			<video_calibration> = $calibrate_lag_cap
		endif
	endif
	<new_lag_calibration> = ((<audio_calibration> * 1000) + 1000)
	<new_lag_calibration> = (<new_lag_calibration> + <video_calibration>)
	change \{calibrate_lag_dirty = 1}
	if iswinport
		winportsetaudiovideolag value = <new_lag_calibration>
		setglobaltags user_options params = {lag_calibration = <new_lag_calibration>}
	else
		setglobaltags user_options params = {lag_calibration = <new_lag_calibration>}
	endif
	calibrate_lag_update_text
	return \{true}
endscript
