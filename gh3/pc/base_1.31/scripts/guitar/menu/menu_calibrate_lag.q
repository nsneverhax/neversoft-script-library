calibrate_lag_menu_font = fontgrid_title_gh3
calibrate_lag_menu_line_pos = (420.0, 360.0)
calibrate_lag_menu_circle_dims = (96.0, 96.0)
calibrate_lag_menu_circle_velocity = 300
calibrate_lag_menu_circle_inital_pos = (420.0, -146.0)
calibrate_lag_menu_circle_separation = 320
calibrate_lag_menu_num_circles = 15
calibrate_lag_hilite_pos0 = (678.0, 445.0)
calibrate_lag_hilite_dims0 = (430.0, 50.0)
calibrate_lag_hilite_pos1 = (678.0, 503.0)
calibrate_lag_hilite_dims1 = (430.0, 50.0)
calibrate_lag_hilite_pos2 = (678.0, 559.0)
calibrate_lag_hilite_dims2 = (430.0, 50.0)
calibrate_lag_hilite_unselected = [
	40
	100
	165
	255
]
calibrate_lag_hilite_selected = [
	165
	95
	50
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

script create_calibrate_lag_menu \{from_in_game = 1}
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
	set_focus_color \{rgba = [
			230
			230
			230
			255
		]}
	set_unfocus_color \{rgba = $calibrate_lag_hilite_unselected}
	z = 100
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
		z = (<z> -2)
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
	lower_helper = "Strum your guitar to the beat of the notes crossing the target."
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
	createscreenelement {
		type = textblockelement
		parent = cl_container
		pos = (<screenelementpos> + (<height> * (0.0, 1.0)) + (0.0, 24.0))
		text = <lower_helper>
		font = text_a6
		dims = (575.0, 0.0)
		allow_expansion
		rgba = [60 40 115 255]
		scale = 0.56
		just = [left top]
		internal_just = [left top]
		z_priority = <z>
	}
	calibrate_lag_fill_options z = <z> from_in_game = <from_in_game>
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
endscript

script calibrate_lag_fill_options \{z = 100}
	if (<from_in_game>)
		<controller> = ($last_start_pressed_device)
	else
		<controller> = ($primary_controller)
	endif
	displaysprite parent = cl_container id = calibrate_lag_hilite tex = options_calibrate_hilite pos = $calibrate_lag_hilite_pos0 rgba = $calibrate_lag_hilite_unselected z = <z>
	calib_eh = [
		{pad_back menu_calibrate_go_back}
	]
	new_menu scrollid = cl_scroll vmenuid = cl_vmenu menu_pos = (700.0, 435.0) event_handlers = <calib_eh> exclusive_device = <controller> text_left default_colors = 0
	text_params = {parent = cl_vmenu type = textelement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color) scale = 0.9}
	createscreenelement {
		<text_params>
		id = calibrate_calibrate_option
		text = "CALIBRATE"
		event_handlers = [
			{focus menu_calibrate_focus params = {index = 0}}
			{unfocus menu_calibrate_unfocus params = {index = 0}}
			{pad_choose menu_calibrate_lag_create_circles params = {z = <z>}}
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
		id = calibrate_manual_option
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
		pos = (40.0, 0.0)
	}
	calibrate_lag_update_text
	createscreenelement {
		type = spriteelement
		id = cl_manual_adjust_up_arrow
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
		id = cl_manual_adjust_down_arrow
		parent = <container_id>
		texture = online_arrow
		just = [center top]
		pos = (16.0, 20.0)
		rgba = ($calibrate_lag_hilite_unselected)
		alpha = 1
		scale = 0.65000004
		z_priority = (<z> + 1)
	}
	setscreenelementlock \{id = cl_vmenu
		on}
	launchevent \{type = focus
		target = cl_vmenu}
endscript

script calibrate_lag_update_text 
	getglobaltags \{user_options}
	casttointeger \{lag_calibration}
	formattext textname = lag_value_text "%d ms" d = <lag_calibration>
	lag_offset_text :setprops text = <lag_value_text>
endscript

script destroy_calibrate_lag_menu 
	if iswinport
		if ($calibrate_lag_most_recent_in_game_setting = 1)
			restore_start_key_binding
		endif
	else
		restore_start_key_binding
	endif
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
	else
		obj_getid
		retail_menu_focus id = {<objid> child = 0}
		setscreenelementprops \{id = calibrate_lag_hilite
			pos = $calibrate_lag_hilite_pos2
			dims = $calibrate_lag_hilite_dims2}
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
	else
		obj_getid
		retail_menu_unfocus id = {<objid> child = 0}
		doscreenelementmorph id = cl_manual_adjust_up_arrow rgba = ($calibrate_lag_hilite_unselected)
		doscreenelementmorph id = cl_manual_adjust_down_arrow rgba = ($calibrate_lag_hilite_unselected)
	endif
endscript

script menu_calibrate_lag_create_circles 
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
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
	wait \{0.6
		seconds}
	formattext textname = tex "%t" t = (3 - <i>)
	setscreenelementprops id = cl_countdown_text text = <tex>
	soundevent \{event = gh_sfx_hitnotesoundevent}
	wait (<seconds_between_circles> - 0.6) seconds
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
	wait \{0.6
		seconds}
	setscreenelementprops \{id = cl_countdown_text
		text = "GO!"
		scale = 0.7}
	soundevent \{event = gh_sfx_hitnotesoundevent}
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
			soundevent \{event = gh_sfx_hitnotesoundevent}
			<circle_id> :settags sounded = 1
		endif
	endif
	if (<diff> < <position_change>)
		setscreenelementprops id = <circle_id> rgba = [135 0 180 255] alpha = 1.0
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
	wait \{1
		gameframe}
	repeat
endscript

script cl_fade_circle 
	<id> :domorph rgba = [0 0 0 255] alpha = 0.5 time = 0.009
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
	launchevent \{type = unfocus
		target = clm_dummy_event_handler}
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
		getglobaltags \{user_options}
		old_lag = <lag_calibration>
		setglobaltags user_options params = {lag_calibration = <avg>}
	endif
	launchevent \{type = focus
		target = root_window}
	wait \{30
		gameframes}
	destroy_calibrate_lag_menu
	create_calibrate_lag_menu from_in_game = ($calibrate_lag_most_recent_in_game_setting)
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
	getglobaltags \{user_options}
	if (<lag_calibration> = 0.0)
		return
	endif
	setglobaltags \{user_options
		params = {
			lag_calibration = 0.0
		}}
	calibrate_lag_update_text
	change \{calibrate_lag_dirty = 1}
endscript

script menu_calibrate_lag_manual_choose 
	setscreenelementprops \{id = calibrate_lag_hilite
		rgba = $calibrate_lag_hilite_selected}
	setscreenelementprops \{id = cl_vmenu
		block_events}
	createscreenelement \{type = containerelement
		parent = cl_container
		id = cl_manual_adjust_handler
		event_handlers = [
			{
				pad_up
				menu_calibrate_lag_manual_up
			}
			{
				pad_down
				menu_calibrate_lag_manual_down
			}
			{
				pad_choose
				menu_calibrate_lag_manual_back
			}
			{
				pad_back
				menu_calibrate_lag_manual_back
			}
		]}
	launchevent \{type = focus
		target = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
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
	if menu_calibrate_lag_adjust \{value = 1}
		doscreenelementmorph \{id = cl_manual_adjust_up_arrow
			scale = 1.5
			relative_scale}
		doscreenelementmorph \{id = cl_manual_adjust_up_arrow
			scale = 1.0
			relative_scale
			time = 0.15}
	endif
	generic_menu_up_or_down_sound
endscript

script menu_calibrate_lag_manual_down 
	if menu_calibrate_lag_adjust \{value = -1}
		doscreenelementmorph \{id = cl_manual_adjust_down_arrow
			scale = 1.5
			relative_scale}
		doscreenelementmorph \{id = cl_manual_adjust_down_arrow
			scale = 1.0
			relative_scale
			time = 0.15}
	endif
	generic_menu_up_or_down_sound
endscript

script menu_calibrate_lag_adjust \{value = 1}
	getglobaltags \{user_options}
	<new_lag_calibration> = (<lag_calibration> + <value>)
	if (<new_lag_calibration> > $calibrate_lag_cap)
		return \{false}
	elseif (<new_lag_calibration> < 0)
		return \{false}
	endif
	change \{calibrate_lag_dirty = 1}
	setglobaltags user_options params = {lag_calibration = <new_lag_calibration>}
	calibrate_lag_update_text
	return \{true}
endscript
