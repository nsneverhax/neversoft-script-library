calibrate_lag_menu_font = fontgrid_title_gh3
calibrate_lag_menu_line_pos = (420.0, 360.0)
calibrate_lag_menu_circle_dims = (96.0, 96.0)
calibrate_lag_menu_circle_velocity = 300
calibrate_lag_menu_circle_inital_pos = (420.0, 0.0)
calibrate_lag_menu_circle_separation = 270
calibrate_lag_menu_num_circles = 15
calibrate_lag_hilite_pos0 = (678.0, 510.0)
calibrate_lag_hilite_dims0 = (540.0, 50.0)
calibrate_lag_hilite_pos1 = (678.0, 566.0)
calibrate_lag_hilite_dims1 = (540.0, 50.0)
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

script create_calibrate_lag_menu 
	kill_start_key_binding
	if viewportexists id = bg_viewport
		disable_bg_viewport
	endif
	calib_eh = [
		{pad_back menu_calibrate_go_back}
	]
	new_menu scrollid = cl_scroll vmenuid = cl_vmenu menu_pos = (700.0, 500.0) event_handlers = <calib_eh> text_left
	change calibrate_lag_end_checks = 0
	change calibrate_lag_started_finish = 0
	set_focus_color rgba = [230 230 230 255]
	set_unfocus_color rgba = [240 200 5 255]
	z = 100
	createscreenelement {
		type = containerelement
		parent = root_window
		id = cl_container
		pos = (0.0, 0.0)
	}
	create_menu_backdrop texture = venue_bg
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
		pos = (660.0, 20.0)
		dims = (432.0, 492.0)
		z = <z>
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
	displaysprite {
		parent = cl_container
		tex = tape_v_01
		pos = (970.0, 106.0)
		dims = (96.0, 192.0)
		z = (<z> + 2)
		flip_v
		rot_angle = -6
	}
	displaysprite {
		parent = cl_container
		tex = tape_v_01
		rgba = [0 0 0 128]
		pos = (975.0, 104.0)
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
	displaytext parent = cl_container text = "HDTV LAG" pos = (770.0, 80.0) font = fontgrid_title_gh3 rgba = [0 0 0 255] noshadow
	upper_helper = "Some HDTVs have an audio/video delay that makes playing difficult. If you're ready to blame your TV, try calibrating."
	lower_helper = "Strum your guitar to the beat of the notes crossing the target."
	createscreenelement {
		type = textblockelement
		parent = cl_container
		pos = (700.0, 80.0)
		text = <upper_helper>
		font = text_a6
		dims = (520.0, 500.0)
		rgba = [60 40 115 255]
		scale = 0.59
		just = [left top]
		internal_just = [left top]
		z_priority = <z>
	}
	createscreenelement {
		type = textblockelement
		parent = cl_container
		pos = (700.0, 270.0)
		text = <lower_helper>
		font = text_a6
		dims = (550.0, 200.0)
		rgba = [60 40 115 255]
		scale = 0.59
		just = [left top]
		internal_just = [left top]
		z_priority = <z>
	}
	getglobaltags user_options
	casttointeger lag_calibration
	formattext textname = lag_value_text "CURRENT LAG OFFSET: %d ms" d = <lag_calibration>
	createscreenelement {
		type = textelement
		id = lag_offset_text
		parent = cl_container
		pos = (700.0, 400.0)
		scale = (0.55, 0.7)
		just = [left top]
		text = <lag_value_text>
		font = ($calibrate_lag_menu_font)
		rgba = [150 30 10 255]
		z_priority = 200
	}
	getscreenelementdims id = <id>
	if (<width> > 320)
		fit_text_in_rectangle id = <id> dims = ((164.0, 0.0) + (<height> * 0.7 * (0.0, 1.0))) pos = (700.0, 400.0)
	endif
	displaysprite parent = cl_container id = calibrate_lag_hilite tex = options_calibrate_hilite pos = $calibrate_lag_hilite_pos0 rgba = [240 60 35 255] z = <z>
	text_params = {parent = cl_vmenu type = textelement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color) scale = 0.9}
	createscreenelement {
		<text_params>
		id = calibrate_calibrate_option
		text = "CALIBRATE"
		shadow
		shadow_offs = (3.0, 5.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_calibrate_focus params = {index = 0}}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_calibrate_lag_create_circles params = {z = <z>}}
		]
		z_priority = (<z> + 1)
		pos = (0.0, 14.0)
	}
	createscreenelement {
		<text_params>
		id = calibrate_reset_option
		text = "RESET to 0 ms"
		shadow
		shadow_offs = (3.0, 5.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_calibrate_focus params = {index = 1}}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_calibrate_lag_reset_lag params = {z = <z>}}
		]
		z_priority = (<z> + 1)
	}
	wait 2 gameframes
	getscreenelementdims id = calibrate_reset_option
	getscreenelementposition id = calibrate_reset_option absolute
	0x86bd3fba = (<screenelementpos> + (1.0, 0.0) * <width> * 0.5 + (0.0, 1.0) * <height>)
	<0x86bd3fba> = (<0x86bd3fba> + (0.0, 20.0))
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
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
endscript

script destroy_calibrate_lag_menu 
	restore_start_key_binding
	if viewportexists \{id = bg_viewport}
		enable_bg_viewport
	endif
	change \{calibrate_lag_dirty = 0}
	destroy_menu_backdrop
	clean_up_user_control_helpers
	killspawnedscript \{name = do_calibration_update}
	destroy_menu \{menu_id = cl_scroll}
	destroy_menu \{menu_id = cl_container}
	launchevent \{type = focus
		target = root_window}
endscript

script menu_calibrate_focus 
	generic_menu_up_or_down_sound
	wait \{2
		gameframes}
	retail_menu_focus
	if (<index> = 0)
		setscreenelementprops \{id = calibrate_lag_hilite
			pos = $calibrate_lag_hilite_pos0
			dims = $calibrate_lag_hilite_dims0}
	else
		setscreenelementprops \{id = calibrate_lag_hilite
			pos = $calibrate_lag_hilite_pos1
			dims = $calibrate_lag_hilite_dims1}
	endif
endscript

script menu_calibrate_lag_create_circles 
	kill_debug_elements
	init_play_log
	generic_menu_pad_choose_sound
	doscreenelementmorph id = calibrate_lag_target alpha = 1
	wait 1 gameframe
	createscreenelement {
		parent = cl_container type = textelement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color)
		id = clm_dummy_event_handler
		text = ""
		event_handlers = [
			{pad_back kill_off_and_finish_calibration}
		]
		z_priority = <z>
	}
	change calibrate_lag_circle_index = 0
	half_circle_width = 0
	circle_index = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	circle_pos = (($calibrate_lag_menu_circle_inital_pos) - ((0.0, 1.0) * <circle_index> * ($calibrate_lag_menu_circle_separation)))
	<one_frame> = ((1.0 / 60.0) * $calibrate_lag_menu_circle_velocity)
	casttointeger one_frame
	<y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - <circle_pos>.(0.0, 1.0))
	<steps> = (<y_off> / <one_frame>)
	casttointeger steps
	<new_y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - (<steps> * <one_frame>))
	<circle_pos> = ((<circle_pos>.(1.0, 0.0) * (1.0, 0.0)) + (<new_y_off> * (0.0, 1.0)))
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
		alpha = 0.5
	}
	<circle_id> :settags existence = 0 hit = 0 check = 1
	<circle_id> :settags initial_position = <circle_pos>
	<circle_id> :settags time_requirement = (<steps> * (1.0 / 60.0))
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	launchevent type = unfocus target = root_window
	wait 1 gameframe
	launchevent type = focus target = clm_dummy_event_handler
	spawnscriptnow do_calibration_update params = {device_num = <device_num>}
endscript

script menu_calibrate_go_back 
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
	begin
	circle_index = 0
	num_circles_gone = 0
	getdeltatime
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	<circle_id> :gettags
	<existence> = (<existence> + <delta_time>)
	update_difference = (<delta_time>)
	position_change = (<update_difference> * ($calibrate_lag_menu_circle_velocity))
	casttointeger position_change
	getscreenelementposition id = <circle_id>
	<screenelementpos> = (<screenelementpos> + (0.0, 1.0) * <position_change>)
	<target_pos> = ($calibrate_lag_menu_line_pos)
	diff = ((<screenelementpos>.(0.0, 1.0)) - (<target_pos>.(0.0, 1.0)))
	if (<diff> < 0)
		<diff> = (0 - <diff>)
	endif
	if (<diff> < <position_change>)
		setscreenelementprops id = <circle_id> rgba = [0 255 0 255] alpha = 1.0
	else
		setscreenelementprops id = <circle_id> rgba = [255 255 255 255] 0xbf31ac04 = 0.5
	endif
	if ((<screenelementpos>.(0.0, 1.0)) > 720)
		<num_circles_gone> = (<num_circles_gone> + 1)
	endif
	if ((<screenelementpos>.(0.0, 1.0)) > ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.0))))
		if (<hit> = 0 && <check> = 1)
			change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
			<circle_id> :settags check = 0
		endif
	endif
	<circle_id> :setprops pos = (<screenelementpos>)
	<circle_id> :settags existence = <existence>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_circles_gone> = $calibrate_lag_menu_num_circles)
		spawnscriptlater kill_off_and_finish_calibration
	endif
	if ($calibrate_lag_end_checks = 0)
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
	wait 1 gameframe
	repeat
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
	if NOT screenelementexists id = calibrate_lag_target
		return
	endif
	<circle_id> :gettags
	getdeltatime
	<existence> = (<existence> + <delta_time>)
	getscreenelementposition id = <circle_id>
	getscreenelementdims id = <circle_id>
	input_difference = (<time_requirement> - <existence>)
	new_input_diff = (<input_difference> * 1000)
	<new_input_diff> = (0 - <new_input_diff>)
	setarrayelement arrayname = calibrate_lag_results globalarray index = ($calibrate_lag_circle_index) newvalue = <new_input_diff>
	output_log_text "Calibrate: %o" o = <new_input_diff> color = white
	get_closest_circle_above_line
	if (<hit> = 1)
		menu_video_settings_calibrate_strum_sound
		<circle_id> :settags hit = 1
		change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
	endif
	<closest_id> :domorph alpha = 0
	calibrate_lag_target :domorph scale = 1.2 relative_scale time = 0.05
	calibrate_lag_target :domorph scale = 1.0 relative_scale time = 0.05
	if (($calibrate_lag_circle_index) = ($calibrate_lag_menu_num_circles))
		change calibrate_lag_end_checks = 1
		kill_off_and_finish_calibration
	endif
endscript

script kill_off_and_finish_calibration 
	killspawnedscript \{name = do_calibration_update}
	menu_calibrate_lag_finish_up_calibration
	menu_calibrate_lag_destroy_circles
endscript

script get_closest_circle_above_line 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	i = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <i>
	getscreenelementposition id = <circle_id>
	if ((<screenelementpos>.(0.0, 1.0)) < ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.0))))
		if ((<screenelementpos>.(0.0, 1.0)) > ($calibrate_lag_menu_line_pos.(0.0, 1.0) - ($calibrate_lag_menu_circle_dims.(0.0, 1.0) * 1.25)))
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
	change calibrate_lag_started_finish = 1
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
	<total_val> = (<total_val> - <min>)
	<total_val> = (<total_val> - <max>)
	if (<num_hit> < 3)
		<num_hit> = 3
	endif
	avg = (<total_val> / (<num_hit> - 2))
	getglobaltags user_options
	old_lag = <lag_calibration>
	setglobaltags user_options params = {lag_calibration = <avg>}
	casttointeger avg
	formattext textname = lag_value_text "CURRENT LAG OFFSET: %d ms" d = <avg>
	lag_offset_text :setprops text = <lag_value_text>
	launchevent type = focus target = root_window
	wait 30 gameframes
	destroy_calibrate_lag_menu
	create_calibrate_lag_menu
	if NOT (<old_lag> = <avg>)
		change calibrate_lag_dirty = 1
	endif
endscript

script menu_calibrate_lag_reset_lag 
	generic_menu_up_or_down_sound
	getglobaltags \{user_options}
	if (<lag_calibration> = 0.0)
		return
	endif
	setglobaltags \{user_options
		params = {
			lag_calibration = 0.0
		}}
	formattext \{textname = lag_value_text
		"CURRENT LAG OFFSET: %d ms"
		d = 0}
	lag_offset_text :setprops text = <lag_value_text>
	change \{calibrate_lag_dirty = 1}
endscript
