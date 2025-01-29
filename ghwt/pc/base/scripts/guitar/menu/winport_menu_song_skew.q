winport_song_skew = 0
winport_song_skew_default = 80
winport_calibrate_lag_menu_font = fontgrid_title_gh3
winport_calibrate_lag_menu_line_pos = (420.0, 360.0)
winport_calibrate_lag_menu_circle_dims = (96.0, 96.0)
winport_calibrate_lag_menu_circle_velocity = 300
winport_calibrate_lag_menu_circle_inital_pos = (420.0, -146.0)
winport_calibrate_lag_menu_circle_separation = 320
winport_calibrate_lag_menu_num_circles = 15
winport_calibrate_lag_hilite_pos0 = (463.0, 346.0)
winport_calibrate_lag_hilite_dims0 = (430.0, 50.0)
winport_calibrate_lag_hilite_pos1 = (463.0, 404.0)
winport_calibrate_lag_hilite_dims1 = (430.0, 50.0)
winport_calibrate_lag_hilite_pos2 = (463.0, 460.0)
winport_calibrate_lag_hilite_dims2 = (430.0, 50.0)
winport_calibrate_lag_hilite_unselected = [
	40
	100
	165
	255
]
winport_calibrate_lag_hilite_selected = [
	165
	95
	50
	255
]
winport_calibrate_lag_results = [
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
winport_calibrate_lag_circle_index = 0
winport_calibrate_lag_real_time_requirement = 0
winport_calibrate_lag_dirty = 0
winport_calibrate_lag_end_checks = 0
winport_calibrate_lag_started_finish = 0
winport_calibrate_lag_cap = 200
winport_calibrate_lag_early_window = -100
winport_calibrate_lag_late_window = 400
winport_cl_ready_for_input = 0
winport_calibrate_lag_most_recent_in_game_setting = 0

script winport_create_calibrate_lag_menu \{from_in_game = 1}
	winportgetsongskew
	change winport_song_skew = <value>
	change winport_calibrate_lag_most_recent_in_game_setting = <from_in_game>
	if iswinport
		if ($winport_calibrate_lag_most_recent_in_game_setting = 1)
			kill_start_key_binding
		endif
	else
		kill_start_key_binding
	endif
	menu_music_off
	if viewportexists \{id = bg_viewport}
		disable_bg_viewport
	endif
	change \{winport_calibrate_lag_end_checks = 0}
	change \{winport_calibrate_lag_started_finish = 0}
	set_focus_color \{rgba = [
			230
			230
			230
			255
		]}
	set_unfocus_color \{rgba = $winport_calibrate_lag_hilite_unselected}
	z = 100
	createscreenelement \{type = containerelement
		parent = root_window
		id = winport_cl_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = venue_bg}
	displaysprite {
		parent = winport_cl_container
		tex = venue_bg
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z = (<z> - 4)
	}
	createscreenelement {
		type = spriteelement
		parent = winport_cl_container
		id = as_light_overlay
		texture = venue_overlay
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z_priority = (<z> - 1)
	}
	displaysprite {
		parent = winport_cl_container
		tex = options_calibrate_paper
		pos = (385.0, -100.0)
		dims = (610.0, 892.0)
		z = (<z> -2)
	}
	<tape_offset> = (90.0, 325.0)
	displaysprite {
		parent = winport_cl_container
		tex = tape_v_01
		pos = ((755.0, 50.0) + <tape_offset>)
		dims = (96.0, 192.0)
		z = (<z> + 2)
		flip_v
		rot_angle = -6
	}
	displaysprite {
		parent = winport_cl_container
		tex = tape_v_01
		rgba = [0 0 0 128]
		pos = ((760.0, 48.0) + <tape_offset>)
		dims = (96.0, 192.0)
		z = (<z> + 2)
		flip_v
		rot_angle = -6
	}
	displaysprite {
		parent = winport_cl_container
		tex = tape_h_02
		pos = (440.0, 40.0)
		dims = (132.0, 64.0)
		z = (<z> + 2)
		rot_angle = 100
	}
	displaysprite {
		parent = winport_cl_container
		tex = tape_h_02
		rgba = [0 0 0 128]
		pos = (432.0, 46.0)
		dims = (132.0, 64.0)
		z = (<z> + 2)
		rot_angle = 100
	}
	upper_helper = qs(0x45946323)
	createscreenelement {
		type = textblockelement
		parent = winport_cl_container
		pos = (465.0, 60.0)
		text = <upper_helper>
		font = text_a6
		dims = (740.0, 0.0)
		allow_expansion
		rgba = [60 40 115 255]
		scale = 0.5
		just = [left top]
		internal_just = [left top]
		z_priority = <z>
	}
	getscreenelementdims id = <id>
	getscreenelementposition id = <id>
	winport_calibrate_lag_fill_options z = <z> from_in_game = <from_in_game>
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
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	add_user_control_helper \{text = qs(0x643800a7)
		button = strumbar
		z = 100}
endscript

script winport_calibrate_lag_fill_options \{z = 100}
	if (<from_in_game>)
		<controller> = ($last_start_pressed_device)
	else
		<controller> = ($primary_controller)
	endif
	displaysprite parent = winport_cl_container id = winport_calibrate_lag_hilite tex = options_calibrate_hilite pos = $winport_calibrate_lag_hilite_pos0 rgba = $winport_calibrate_lag_hilite_unselected z = <z>
	calib_eh = [
		{pad_back winport_menu_calibrate_go_back}
	]
	new_menu scrollid = winport_cl_scroll vmenuid = winport_cl_vmenu menu_pos = (485.0, 380.0) event_handlers = <calib_eh> exclusive_device = <controller> text_left default_colors = 0
	text_params = {parent = winport_cl_vmenu type = textelement font = ($winport_calibrate_lag_menu_font) rgba = ($menu_unfocus_color) scale = 0.9}
	createscreenelement {
		<text_params>
		id = calibrate_reset_option
		text = qs(0x38ee4773)
		event_handlers = [
			{focus winport_menu_calibrate_focus params = {index = 1}}
			{unfocus winport_menu_calibrate_unfocus params = {index = 1}}
			{pad_choose winport_menu_calibrate_lag_reset_lag params = {z = <z>}}
		]
		z_priority = (<z> + 1)
	}
	getscreenelementdims id = <id>
	fit_text_in_rectangle id = <id> dims = ((340.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1
	createscreenelement \{type = containerelement
		parent = winport_cl_vmenu
		id = calibrate_manual_option
		event_handlers = [
			{
				focus
				winport_menu_calibrate_focus
				params = {
					index = 2
				}
			}
			{
				unfocus
				winport_menu_calibrate_unfocus
				params = {
					index = 2
				}
			}
			{
				pad_choose
				winport_menu_calibrate_lag_manual_choose
			}
		]}
	<container_id> = <id>
	createscreenelement {
		<text_params>
		parent = <container_id>
		id = lag_offset_text
		text = qs(0x713755f7)
		just = [left top]
		z_priority = (<z> + 1)
		pos = (40.0, 0.0)
	}
	winport_calibrate_lag_update_text
	createscreenelement {
		type = spriteelement
		id = winport_cl_manual_adjust_up_arrow
		parent = <container_id>
		texture = online_arrow
		just = [center bottom]
		pos = (16.0, 16.0)
		rgba = ($winport_calibrate_lag_hilite_unselected)
		alpha = 1
		scale = 0.65000004
		z_priority = (<z> + 1)
		flip_h
	}
	createscreenelement {
		type = spriteelement
		id = winport_cl_manual_adjust_down_arrow
		parent = <container_id>
		texture = online_arrow
		just = [center top]
		pos = (16.0, 20.0)
		rgba = ($winport_calibrate_lag_hilite_unselected)
		alpha = 1
		scale = 0.65000004
		z_priority = (<z> + 1)
	}
	setscreenelementlock \{id = winport_cl_vmenu
		on}
	launchevent \{type = focus
		target = winport_cl_vmenu}
endscript

script winport_calibrate_lag_update_text 
	formattext textname = lag_value_text qs(0x21f440f1) d = ($winport_song_skew)
	lag_offset_text :setprops text = <lag_value_text>
endscript

script winport_destroy_calibrate_lag_menu 
	winportsetsongskew value = ($winport_song_skew)
	if iswinport
		if ($winport_calibrate_lag_most_recent_in_game_setting = 1)
			restore_start_key_binding
		endif
	else
		restore_start_key_binding
	endif
	spawnscriptnow \{menu_music_on}
	if viewportexists \{id = bg_viewport}
		enable_bg_viewport
	endif
	change \{winport_calibrate_lag_dirty = 0}
	destroy_menu_backdrop
	clean_up_user_control_helpers
	killspawnedscript \{name = winport_do_calibration_update}
	destroy_menu \{menu_id = winport_cl_scroll}
	destroy_menu \{menu_id = winport_cl_container}
	if screenelementexists \{idcl_manual_adjust_handler}
		destroyscreenelement \{id = winport_cl_manual_adjust_handler}
	endif
	launchevent \{type = focus
		target = root_window}
endscript

script winport_menu_calibrate_focus 
	generic_menu_up_or_down_sound
	wait \{1
		gameframes}
	if (<index> = 0)
		retail_menu_focus
		setscreenelementprops \{id = winport_calibrate_lag_hilite
			pos = $winport_calibrate_lag_hilite_pos0
			dims = $winport_calibrate_lag_hilite_dims0}
	elseif (<index> = 1)
		retail_menu_focus
		setscreenelementprops \{id = winport_calibrate_lag_hilite
			pos = $winport_calibrate_lag_hilite_pos1
			dims = $winport_calibrate_lag_hilite_dims1}
	else
		obj_getid
		retail_menu_focus id = {<objid> child = 0}
		setscreenelementprops \{id = winport_calibrate_lag_hilite
			pos = $winport_calibrate_lag_hilite_pos2
			dims = $winport_calibrate_lag_hilite_dims2}
		doscreenelementmorph \{id = winport_cl_manual_adjust_up_arrow
			rgba = $menu_focus_color}
		doscreenelementmorph \{id = winport_cl_manual_adjust_down_arrow
			rgba = $menu_focus_color}
	endif
endscript

script winport_menu_calibrate_unfocus 
	if (<index> = 0)
		retail_menu_unfocus
	elseif (<index> = 1)
		retail_menu_unfocus
	else
		obj_getid
		retail_menu_unfocus id = {<objid> child = 0}
		doscreenelementmorph id = winport_cl_manual_adjust_up_arrow rgba = ($winport_calibrate_lag_hilite_unselected)
		doscreenelementmorph id = winport_cl_manual_adjust_down_arrow rgba = ($winport_calibrate_lag_hilite_unselected)
	endif
endscript

script winport_menu_calibrate_lag_create_circles 
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	createscreenelement {
		parent = winport_cl_container type = textelement font = ($winport_calibrate_lag_menu_font) rgba = ($menu_unfocus_color)
		id = clm_dummy_event_handler
		text = qs(0x03ac90f0)
		z_priority = <z>
	}
	launchevent \{type = focus
		target = clm_dummy_event_handler}
	launchevent \{type = unfocus
		target = winport_cl_vmenu}
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
	add_user_control_helper \{text = qs(0x677830da)
		button = strumbar
		z = 100}
	destroy_menu \{menu_id = winport_cl_scroll}
	destroy_menu \{menu_id = winport_calibrate_lag_hilite}
	kill_debug_elements
	init_play_log
	generic_menu_pad_choose_sound
	displaysprite {
		id = winport_cl_countdown_circle
		parent = winport_cl_container
		tex = song_summary_circle_2p
		pos = ($winport_calibrate_lag_menu_line_pos + (13.0, 14.0))
		rgba = [220 220 220 208]
		dims = (72.0, 72.0)
		z = 199
	}
	createscreenelement {
		type = textelement
		id = winport_cl_countdown_text
		parent = winport_cl_container
		pos = ($winport_calibrate_lag_menu_line_pos + (47.0, 58.0))
		scale = (1.0, 1.0)
		text = qs(0x03ac90f0)
		font = ($winport_calibrate_lag_menu_font)
		rgba = [0 0 0 255]
		z_priority = 200
	}
	<sep> = ($winport_calibrate_lag_menu_circle_separation * 1.0)
	<vel> = ($winport_calibrate_lag_menu_circle_velocity * 1.0)
	<seconds_between_circles> = (<sep> / <vel>)
	<i> = 0
	begin
	spawnscriptnow \{winport_cl_do_ping
		params = {
			time = 0.6
		}}
	wait \{0.6
		seconds}
	formattext textname = tex qs(0x3c71eff6) t = (3 - <i>)
	setscreenelementprops id = winport_cl_countdown_text text = <tex>
	soundevent \{event = gh_sfx_hitnotesoundevent}
	wait (<seconds_between_circles> - 0.6) seconds
	<i> = (<i> + 1)
	repeat 3
	change \{winport_calibrate_lag_circle_index = 0}
	half_circle_width = 0
	circle_index = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	circle_pos = (($winport_calibrate_lag_menu_circle_inital_pos) - ((0.0, 1.0) * <circle_index> * ($winport_calibrate_lag_menu_circle_separation)))
	<one_frame> = ((1.0 / 60.0) * $winport_calibrate_lag_menu_circle_velocity)
	casttointeger \{one_frame}
	<y_off> = ($winport_calibrate_lag_menu_line_pos.(0.0, 1.0) - <circle_pos>.(0.0, 1.0))
	<steps> = (<y_off> / <one_frame>)
	casttointeger \{steps}
	<new_y_off> = ($winport_calibrate_lag_menu_line_pos.(0.0, 1.0) - (<steps> * <one_frame>))
	<circle_pos> = ((<circle_pos>.(1.0, 0.0) * (1.0, 0.0)) + (<new_y_off> * (0.0, 1.0)))
	createscreenelement {
		type = spriteelement
		parent = winport_cl_container
		texture = options_calibrate_note
		id = <circle_id>
		pos = <circle_pos>
		dims = ($winport_calibrate_lag_menu_circle_dims)
		just = [left top]
		rgba = [255 255 255 255]
		z_priority = (<z> + 51)
		alpha = 0.5
	}
	<circle_id> :settags existence = 0 hit = 0 check = 1
	<circle_id> :settags initial_position = <circle_pos>
	<circle_id> :settags time_requirement = (<steps> * (1.0 / 60.0))
	<circle_index> = (<circle_index> + 1)
	repeat ($winport_calibrate_lag_menu_num_circles)
	launchevent \{type = unfocus
		target = root_window}
	wait \{1
		gameframe}
	change \{winport_cl_ready_for_input = 0}
	spawnscriptnow \{winport_cl_do_ping
		params = {
			time = 0.6
		}}
	spawnscriptnow winport_do_calibration_update params = {device_num = <device_num>}
	wait \{0.6
		seconds}
	setscreenelementprops \{id = winport_cl_countdown_text
		text = qs(0x13883900)
		scale = 0.7}
	soundevent \{event = gh_sfx_hitnotesoundevent}
	winport_cl_ping_id :domorph \{alpha = 0}
	wait \{0.4
		seconds}
	setscreenelementprops \{id = winport_cl_countdown_circle
		alpha = 0}
	change \{winport_cl_ready_for_input = 1}
	doscreenelementmorph \{id = winport_calibrate_lag_target
		alpha = 1}
	wait \{1
		gameframe}
	setscreenelementprops \{id = winport_cl_countdown_text
		alpha = 0}
endscript

script winport_menu_calibrate_go_back 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script winport_menu_calibrate_lag_destroy_circles 
	circle_index = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	destroy_menu menu_id = <circle_id>
	<circle_index> = (<circle_index> + 1)
	repeat ($winport_calibrate_lag_menu_num_circles)
	destroy_menu \{menu_id = clm_dummy_event_handler}
endscript

script winport_do_calibration_update 
	<circle_index> = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	<circle_id> :settags sounded = 0 pinged = 0
	<circle_index> = (<circle_index> + 1)
	repeat ($winport_calibrate_lag_menu_num_circles)
	begin
	circle_index = 0
	num_circles_gone = 0
	delta_time = (1.0 / 60.0)
	begin
	formattext checksumname = circle_id 'circle%d' d = <circle_index>
	<circle_id> :gettags
	<existence> = (<existence> + <delta_time>)
	update_difference = (<delta_time>)
	position_change = (<update_difference> * ($winport_calibrate_lag_menu_circle_velocity))
	casttointeger \{position_change}
	getscreenelementposition id = <circle_id>
	<screenelementpos> = (<screenelementpos> + (0.0, 1.0) * <position_change>)
	<target_pos> = ($winport_calibrate_lag_menu_line_pos)
	diff = ((<screenelementpos>.(0.0, 1.0)) - (<target_pos>.(0.0, 1.0)))
	if (<diff> < 0)
		<diff> = (0 - <diff>)
	endif
	<winport_cl_tweak> = ($winport_calibrate_lag_tick_ms_offset / 1000.0)
	if ((($winport_calibrate_lag_menu_circle_velocity) * <winport_cl_tweak>) >= <diff>)
		if (<sounded> = 0)
			soundevent \{event = gh_sfx_hitnotesoundevent}
			<circle_id> :settags sounded = 1
		endif
	endif
	if (<diff> < <position_change>)
		setscreenelementprops id = <circle_id> rgba = [135 0 180 255] alpha = 1.0
	endif
	if ((<screenelementpos>.(0.0, 1.0)) > ($winport_calibrate_lag_menu_line_pos.(0.0, 1.0) + ($winport_calibrate_lag_menu_circle_dims.(0.0, 1.0))))
		if (<hit> = 0 && <check> = 1)
			change winport_calibrate_lag_circle_index = (($winport_calibrate_lag_circle_index) + 1)
			<circle_id> :settags check = 0
		endif
		<num_circles_gone> = (<num_circles_gone> + 1)
		<circle_id> :obj_spawnscriptnow winport_cl_fade_circle params = {id = <circle_id>}
	endif
	<circle_id> :setprops pos = (<screenelementpos>)
	<circle_id> :settags existence = <existence>
	<circle_index> = (<circle_index> + 1)
	repeat ($winport_calibrate_lag_menu_num_circles)
	if (<num_circles_gone> = $winport_calibrate_lag_menu_num_circles)
		spawnscriptlater \{winport_kill_off_and_finish_calibration}
	endif
	if (($winport_calibrate_lag_end_checks = 0) && $winport_cl_ready_for_input)
		if controllermake up <device_num>
			spawnscriptnow winport_menu_calibrate_lag_do_guitar_check_up_down params = {device_num = <device_num>}
		endif
		if controllermake down <device_num>
			spawnscriptnow winport_menu_calibrate_lag_do_guitar_check_up_down params = {device_num = <device_num>}
		endif
		if controllermake x <device_num>
			spawnscriptnow winport_menu_calibrate_lag_do_guitar_check_choose params = {device_num = <device_num>}
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script winport_cl_fade_circle 
	<id> :domorph rgba = [0 0 0 255] alpha = 0.5 time = 0.009
endscript

script winport_cl_do_ping \{time = 0.066}
	winport_cl_ping_id :domorph \{scale = 10
		alpha = 0}
	winport_cl_ping_id :domorph scale = 1 alpha = 1 motion = ease_in time = <time>
	winport_cl_ping_id :domorph \{alpha = 0
		motion = ease_in
		time = 0.1}
endscript

script winport_menu_calibrate_lag_do_guitar_check_choose 
	if ($winport_calibrate_lag_end_checks = 0)
		if NOT isguitarcontroller controller = <device_num>
			winport_menu_calibrate_lag_say_lines_are_even
		endif
	endif
endscript

script winport_menu_calibrate_lag_do_guitar_check_up_down 
	if ($winport_calibrate_lag_end_checks = 0)
		if isguitarcontroller controller = <device_num>
			winport_menu_calibrate_lag_say_lines_are_even
		endif
	endif
endscript

script winport_menu_calibrate_lag_say_lines_are_even 
	if ($winport_calibrate_lag_end_checks = 1)
		return
	endif
	formattext checksumname = circle_id 'circle%d' d = ($winport_calibrate_lag_circle_index)
	if NOT screenelementexists id = <circle_id>
		return
	endif
	if NOT screenelementexists \{id = winport_calibrate_lag_target}
		return
	endif
	<circle_id> :gettags
	getscreenelementposition id = <circle_id>
	getscreenelementdims id = <circle_id>
	input_difference = (<time_requirement> - <existence>)
	new_input_diff = (<input_difference> * 1000)
	<new_input_diff> = (0 - <new_input_diff>)
	if (<new_input_diff> < $winport_calibrate_lag_early_window)
		return
	endif
	if (<new_input_diff> > $winport_calibrate_lag_late_window)
		return
	endif
	setarrayelement arrayname = winport_calibrate_lag_results globalarray index = ($winport_calibrate_lag_circle_index) newvalue = <new_input_diff>
	output_log_text qs(0x929bffbd) o = <new_input_diff> color = white
	winport_get_closest_circle_above_line
	<circle_id> :settags hit = 1
	change winport_calibrate_lag_circle_index = (($winport_calibrate_lag_circle_index) + 1)
	<closest_id> :setprops hide
	winport_calibrate_lag_target :domorph \{scale = 1.5
		relative_scale
		time = 0.05}
	winport_calibrate_lag_target :domorph \{scale = 1.0
		relative_scale
		time = 0.05}
	if (($winport_calibrate_lag_circle_index) = ($winport_calibrate_lag_menu_num_circles))
		change \{winport_calibrate_lag_end_checks = 1}
		winport_kill_off_and_finish_calibration
	endif
endscript

script winport_kill_off_and_finish_calibration 
	launchevent \{type = unfocus
		target = clm_dummy_event_handler}
	killspawnedscript \{name = winport_do_calibration_update}
	winport_menu_calibrate_lag_finish_up_calibration
	winport_menu_calibrate_lag_destroy_circles
endscript

script winport_get_closest_circle_above_line 
	if ($winport_calibrate_lag_end_checks = 1)
		return
	endif
	i = 0
	begin
	formattext checksumname = circle_id 'circle%d' d = <i>
	getscreenelementposition id = <circle_id>
	if ((<screenelementpos>.(0.0, 1.0)) < ($winport_calibrate_lag_menu_line_pos.(0.0, 1.0) + ($winport_calibrate_lag_menu_circle_dims.(0.0, 1.25))))
		<circle_id> :gettags
		if NOT (<hit>)
			return closest_id = <circle_id> hit = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat $winport_calibrate_lag_menu_num_circles hit = 0
	return closest_id = <circle_id>
endscript

script winport_menu_calibrate_lag_finish_up_calibration 
	if ($winport_calibrate_lag_started_finish = 1)
		return
	endif
	change \{winport_calibrate_lag_started_finish = 1}
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
		val = ($winport_calibrate_lag_results [<index>])
		if (<val> < <min>)
			<min> = (<val>)
		endif
		if (<val> > <max>)
			<max> = (<val>)
		endif
		<total_val> = (<total_val> + <val>)
	endif
	<index> = (<index> + 1)
	repeat ($winport_calibrate_lag_menu_num_circles)
	if (<num_hit> > 2)
		<total_val> = (<total_val> - <min>)
		<total_val> = (<total_val> - <max>)
		avg = (<total_val> / (<num_hit> - 2))
		if (<avg> < 0)
			<avg> = 0
		elseif (<avg> > $winport_calibrate_lag_cap)
			<avg> = $winport_calibrate_lag_cap
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
	create_calibrate_lag_menu from_in_game = ($winport_calibrate_lag_most_recent_in_game_setting)
	if gotparam \{avg}
		if gotparam \{old_lag}
			casttointeger \{avg}
			if NOT (<old_lag> = <avg>)
				change \{winport_calibrate_lag_dirty = 1}
			endif
		endif
	endif
endscript

script winport_menu_calibrate_lag_reset_lag 
	generic_menu_up_or_down_sound
	if notismacport
		change winport_song_skew = ($winport_song_skew_default)
	else
		change \{winport_song_skew = 40}
	endif
	winport_calibrate_lag_update_text
endscript

script winport_menu_calibrate_lag_manual_choose 
	setscreenelementprops \{id = winport_calibrate_lag_hilite
		rgba = $winport_calibrate_lag_hilite_selected}
	setscreenelementprops \{id = winport_cl_vmenu
		block_events}
	createscreenelement \{type = containerelement
		parent = winport_cl_container
		id = winport_cl_manual_adjust_handler
		event_handlers = [
			{
				pad_up
				winport_menu_calibrate_lag_manual_up
			}
			{
				pad_down
				winport_menu_calibrate_lag_manual_down
			}
			{
				pad_choose
				winport_menu_calibrate_lag_manual_back
			}
			{
				pad_back
				winport_menu_calibrate_lag_manual_back
			}
		]}
	launchevent \{type = focus
		target = winport_cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script winport_menu_calibrate_lag_manual_back 
	setscreenelementprops \{id = winport_calibrate_lag_hilite
		rgba = $winport_calibrate_lag_hilite_unselected}
	setscreenelementprops \{id = winport_cl_vmenu
		unblock_events}
	destroyscreenelement \{id = winport_cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script winport_menu_calibrate_lag_manual_up 
	if winport_menu_calibrate_lag_adjust \{value = 1}
		doscreenelementmorph \{id = winport_cl_manual_adjust_up_arrow
			scale = 1.5
			relative_scale}
		doscreenelementmorph \{id = winport_cl_manual_adjust_up_arrow
			scale = 1.0
			relative_scale
			time = 0.15}
	endif
	generic_menu_up_or_down_sound
endscript

script winport_menu_calibrate_lag_manual_down 
	if winport_menu_calibrate_lag_adjust \{value = -1}
		doscreenelementmorph \{id = winport_cl_manual_adjust_down_arrow
			scale = 1.5
			relative_scale}
		doscreenelementmorph \{id = winport_cl_manual_adjust_down_arrow
			scale = 1.0
			relative_scale
			time = 0.15}
	endif
	generic_menu_up_or_down_sound
endscript

script winport_menu_calibrate_lag_adjust \{value = 1}
	getglobaltags \{user_options}
	new_song_skew = (($winport_song_skew) + <value>)
	if (<new_song_skew> > $winport_calibrate_lag_cap)
		return \{false}
	elseif (<new_song_skew> < 0)
		return \{false}
	endif
	change winport_song_skew = <new_song_skew>
	winport_calibrate_lag_update_text
	return \{true}
endscript

script winport_create_audio_calibrate_reminder 
	winportgetconfignumber \{name = 'AudioLagReminderShown'
		defaultvalue = 0}
	if (<value> = 1)
		ui_flow_manager_respond_to_action \{action = continue}
		return
	endif
	winportsetconfignumber \{name = 'AudioLagReminderShown'
		value = 1}
	z = 100
	createscreenelement \{type = containerelement
		parent = root_window
		id = winport_cl_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = venue_bg}
	displaysprite {
		parent = winport_cl_container
		tex = venue_bg
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z = (<z> - 4)
	}
	createscreenelement {
		type = spriteelement
		parent = winport_cl_container
		id = as_light_overlay
		texture = venue_overlay
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z_priority = (<z> - 1)
	}
	displaysprite {
		parent = winport_cl_container
		tex = audio_calib_reminder_amp
		pos = (540.0, 340.0)
		just = [center center]
		scale = 1.42
		z = (<z> -2)
	}
	textprops = {
		type = textblockelement
		parent = winport_cl_container
		font = text_a4
		rgba = [0 21 132 255]
		z_priority = <z>
		just = [center center]
		internal_just = [center center]
	}
	createscreenelement {
		<textprops>
		pos = (640.0, 270.0)
		dims = (500.0, 500.0)
		text = qs(0xd2453f69)
		scale = 0.8
	}
	createscreenelement {
		<textprops>
		pos = (640.0, 420.0)
		dims = (650.0, 500.0)
		text = qs(0xc9d5b46f)
		scale = 0.7
	}
	spawnscriptnow \{check_for_any_input
		params = {
			use_primary_controller
			button1 = start
			button2 = x
		}}
endscript

script winport_destroy_audio_calibrate_reminder 
	if screenelementexists \{id = winport_cl_container}
		destroyscreenelement \{id = winport_cl_container}
		destroy_menu_backdrop
	endif
endscript
