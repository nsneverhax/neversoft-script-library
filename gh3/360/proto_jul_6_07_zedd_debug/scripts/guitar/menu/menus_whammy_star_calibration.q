g_spc_check_pow_bool = 1
g_spc_whammy_is_popup = 0
g_spc_sp_is_popup = 0

script create_whammy_bar_calibration_menu controller = 0 popup = 0
	kill_start_key_binding
	createscreenelement {
		type = containerelement
		parent = root_window
		id = wbc_container
		pos = (0.0, 0.0)
		just = [left top]
	}
	if (<popup>)
		change g_spc_whammy_is_popup = 1
		<z> = 100
	else
		change g_spc_whammy_is_popup = 0
		<z> = 2
	endif
	if NOT (<popup>)
		create_menu_backdrop texture = venue_bg
		createscreenelement {
			type = spriteelement
			parent = wbc_container
			id = wbc_light_overlay
			texture = venue_overlay
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [center center]
			z_priority = 99
		}
	endif
	displaysprite {
		id = wbc_poster_1
		parent = wbc_container
		tex = options_whammy_poster_1
		pos = (286.0, 15.0)
		dims = (896.0, 896.0)
		rot_angle = -2
		z = <z>
	}
	displaysprite {
		id = wbc_poster_2
		parent = wbc_container
		tex = options_whammy_poster_2
		pos = (286.0, 15.0)
		dims = (896.0, 896.0)
		rot_angle = -2
		z = (<z> - 1)
	}
	if NOT (<popup>)
		displaysprite {
			parent = wbc_container
			tex = toprockers_tape_1
			pos = (1010.0, 450.0)
			dims = (192.0, 92.0)
			z = (<z> + 1)
			flip_v
			rot_angle = 90
		}
		displaysprite {
			parent = wbc_container
			tex = toprockers_tape_2
			pos = (350.0, 200.0)
			z = (<z> + 1)
			rot_angle = 90
			dims = (192.0, 92.0)
			flip_v
			flip_h
		}
	endif
	text_block_scale = 0.65000004
	text_block_1_pos = (600.0, 70.0)
	text_block_1_dims = (695.0, 500.0)
	text_block_2_pos = (715.0, 142.0)
	text_block_2_dims = (650.0, 500.0)
	text_block_3_pos = (760.0, 205.0)
	text_block_3_dims = (530.0, 500.0)
	<text_1> = "Press  the  whammy  bar  completely  down, and  gently  allow  it  to  return  to  its  resting  position."
	<text_2> = "Press  the  Green  Button  to  calibrate  using  this  position."
	<text_3> = "Repeat  the  process  until  you  see  the  \\c1''Resting  position  calibrated'' \\c0message  every  time  you  return  the  whammy  bar  to  its  resting  position."
	createscreenelement {
		type = textblockelement
		font = text_a3
		pos = <text_block_1_pos>
		parent = wbc_container
		text = <text_1>
		rgba = [0 0 0 255]
		z_priority = (<z> + 1)
		dims = <text_block_1_dims>
		just = [center top]
		internal_just = [left top]
		scale = <text_block_scale>
		rot_angle = -1
		line_spacing = 0.8
	}
	createscreenelement {
		type = textblockelement
		font = text_a3
		pos = <text_block_2_pos>
		parent = wbc_container
		text = <text_2>
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		dims = <text_block_2_dims>
		just = [center top]
		internal_just = [left top]
		scale = <text_block_scale>
		rot_angle = -3
		line_spacing = 0.8
	}
	createscreenelement {
		type = textblockelement
		font = text_a3
		pos = <text_block_3_pos>
		parent = wbc_container
		text = <text_3>
		rgba = [0 0 0 255]
		z_priority = (<z> + 1)
		dims = <text_block_3_dims>
		just = [center top]
		internal_just = [left top]
		scale = <text_block_scale>
		rot_angle = -2
		line_spacing = 0.8
	}
	createscreenelement {
		type = textelement
		font = text_a5
		pos = (760.0, 335.0)
		parent = wbc_container
		text = "Calibrate"
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		just = [center top]
		scale = 1.6
		rot_angle = -4
	}
	createscreenelement {
		type = textelement
		font = text_a5
		pos = (800.0, 385.0)
		parent = wbc_container
		text = "Whammy"
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		just = [center top]
		scale = 1.6
		rot_angle = -4
	}
	createscreenelement {
		type = textblockelement
		font = text_a3
		rgba = [140 235 170 255]
		pos = (810.0, 408.0)
		text = "RESTING  POSITION  CALIBRATED"
		just = [center top]
		internal_just = [center center]
		dims = (300.0, 200.0)
		scale = 0.7
		line_spacing = 0.8
		parent = wbc_container
		z_priority = (<z> + 2)
		rot_angle = -4
		id = resting_message
		shadow
		shadow_offs = (3.0, 5.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{pad_choose menu_whammy_bar_calibration_enter_sample params = {controller = <controller>}}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
	}
	launchevent type = focus target = resting_message
	spawnscriptnow menu_whammy_bar_update_resting_message params = {controller = <controller>}
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "SELECT" button = green z = (<z> + 100)
	add_user_control_helper text = "BACK" button = red z = (<z> + 100)
endscript

script destroy_whammy_bar_calibration_menu 
	restore_start_key_binding
	killspawnedscript \{name = menu_whammy_bar_update_resting_message}
	destroy_menu \{menu_id = wbc_container}
	clean_up_user_control_helpers
	if NOT ($g_spc_whammy_is_popup)
		destroy_menu_backdrop
	endif
endscript

script menu_whammy_bar_calibration_enter_sample 
	guitargetanalogueinfo controller = <controller>
	if (<rightx> < 0)
		switch (<controller>)
			case 0
			setglobaltags user_options params = {resting_whammy_position_device_0 = <rightx>}
			case 1
			setglobaltags user_options params = {resting_whammy_position_device_1 = <rightx>}
			case 2
			setglobaltags user_options params = {resting_whammy_position_device_2 = <rightx>}
			case 3
			setglobaltags user_options params = {resting_whammy_position_device_3 = <rightx>}
		endswitch
	endif
endscript

script menu_whammy_bar_update_resting_message 
	begin
	if is_whammy_resting controller = <controller>
		setscreenelementprops \{id = resting_message
			unhide}
		setscreenelementprops \{id = wbc_poster_1
			alpha = 1}
	else
		setscreenelementprops \{id = resting_message
			hide}
		menu_whammy_bar_do_poster_morph controller = <controller>
	endif
	wait \{1
		gameframe}
	repeat
endscript

script menu_whammy_bar_do_poster_morph 
	guitargetanalogueinfo controller = <controller>
	if (<rightx> >= 0)
		setscreenelementprops id = wbc_poster_1 alpha = ((1 - <rightx>) * 0.5)
	else
		setscreenelementprops id = wbc_poster_1 alpha = ((0.5 * (<rightx> * -1)) + 0.5)
	endif
endscript

script create_star_power_trigger_calibration_menu controller = 0 popup = 0
	kill_start_key_binding
	createscreenelement {
		id = spc_container
		type = containerelement
		parent = root_window
		pos = (0.0, 0.0)
		just = [left top]
	}
	if (<popup>)
		<z> = 100
	else
		<z> = -4
	endif
	if NOT (<popup>)
		create_menu_backdrop texture = options_calibrate_starpower_posterwall
	else
		displaysprite {
			parent = spc_container
			tex = options_calibrate_starpower_posterwall
			pos = (0.0, 0.0)
			dims = (1280.0, 720.0)
			z = 107
		}
	endif
	displaysprite {
		parent = spc_container
		tex = options_calibrate_starpower_bg
		pos = (326.0, 0.0)
		dims = (512.0, 512.0)
		rot_angle = -2
		z = <z>
	}
	displaysprite {
		id = spc_rotating_bg_lines
		parent = spc_container
		tex = options_calibrate_starpower_bg2
		pos = (578.0, 156.0)
		dims = (640.0, 640.0)
		just = [center center]
		rot_angle = 25
		z = (<z> + 1)
	}
	displaysprite {
		id = spc_rotating_bg_planes
		parent = spc_container
		tex = options_calibrate_starpower_bg3
		pos = (568.0, 114.0)
		dims = (512.0, 384.0)
		just = [center center]
		rot_angle = 20
		z = (<z> + 2)
	}
	displaysprite {
		id = spc_pow
		parent = spc_container
		tex = options_calibrate_starpower_pow
		pos = (0.0, 0.0)
		scale = 1.0
		relative_scale
		z = (<z> + 3)
	}
	setscreenelementprops id = <id> hide
	createscreenelement {
		type = textblockelement
		id = star_calibration_text
		parent = spc_container
		font = text_a6
		pos = (608.0, 520.0)
		just = [center top]
		internal_just = [left top]
		line_spacing = 0.85
		dims = (940.0, 300.0)
		scale = (0.5, 0.65000004)
		rgba = [225 200 120 255]
		text = "Raise the Guitar up to the point at which you would like Star Power to be triggered and press the Green Button to set this value."
		event_handlers = [
			{pad_choose menu_star_power_trigger_enter_position params = {controller = <controller>}}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
		z_priority = (<z> + 6.1)
		rot_angle = -2
	}
	launchevent type = focus target = star_calibration_text
	spawnscriptnow menu_star_power_trigger_pow_check params = {controller = <controller>}
	add_user_control_helper text = "SELECT" button = green z = 110
	add_user_control_helper text = "BACK" button = red z = 110
endscript

script destroy_star_power_trigger_calibration_menu 
	restore_start_key_binding
	destroy_menu \{menu_id = spc_container}
	clean_up_user_control_helpers
	killspawnedscript \{name = menu_star_power_trigger_pow_check}
	destroy_menu_backdrop
endscript

script menu_star_power_trigger_pow_check 
	begin
	guitargetanalogueinfo controller = <controller>
	<spc_v_dist> = <verticaldist>
	if (<spc_v_dist> < 0)
		<spc_v_dist> = (<spc_v_dist> * -1)
	endif
	if (<spc_v_dist> > 35)
		if (<spc_v_dist> > 50)
			<line_rot> = 25
		else
			<line_rot> = (40.0 - (<spc_v_dist> - 35))
		endif
	elseif (<spc_v_dist> < 35)
		if (<spc_v_dist> < 20)
			<line_rot> = 55
		else
			<line_rot> = (40.0 + (35 - <spc_v_dist>))
		endif
	else
		<line_rot> = 40
	endif
	setscreenelementprops id = spc_rotating_bg_lines rot_angle = <line_rot>
	setscreenelementprops id = spc_rotating_bg_planes rot_angle = (<line_rot> - 5.0)
	getglobaltags user_options
	switch (<controller>)
		case 0
		<spc_pos_dev> = <star_power_position_device_0>
		case 1
		<spc_pos_dev> = <star_power_position_device_1>
		case 2
		<spc_pos_dev> = <star_power_position_device_2>
		case 3
		<spc_pos_dev> = <star_power_position_device_3>
	endswitch
	wait 0.05 seconds
	if (<spc_v_dist> <= <spc_pos_dev>)
		if ($g_spc_check_pow_bool = 1)
			<spc_pow_rand_x> = 0
			<spc_pow_rand_y> = 0
			<spc_pow_rand_scale> = 0
			<spc_pow_rand_rot> = 0
			getrandomvalue name = spc_pow_rand_x integer a = 380 b = 470
			getrandomvalue name = spc_pow_rand_y integer a = 50 b = 80
			getrandomvalue name = spc_pow_rand_scale a = 0.6 b = 1.0
			getrandomvalue name = spc_pow_rand_rot a = -3.0 b = 3.0
			setscreenelementprops {
				id = spc_pow
				unhide
				pos = (((1.0, 0.0) * <spc_pow_rand_x>) + ((0.0, 1.0) * <spc_pow_rand_y>))
				rot_angle = <spc_pow_rand_rot>
				scale = <spc_pow_rand_scale>
				relative_scale
			}
			change g_spc_check_pow_bool = 0
		endif
	else
		setscreenelementprops id = spc_pow hide
		change g_spc_check_pow_bool = 1
	endif
	repeat
endscript

script menu_star_power_trigger_enter_position 
	guitargetanalogueinfo controller = <controller>
	switch (<controller>)
		case 0
		setglobaltags user_options params = {star_power_position_device_0 = <verticaldist>}
		case 1
		setglobaltags user_options params = {star_power_position_device_1 = <verticaldist>}
		case 2
		setglobaltags user_options params = {star_power_position_device_2 = <verticaldist>}
		case 3
		setglobaltags user_options params = {star_power_position_device_3 = <verticaldist>}
	endswitch
endscript

script create_guitar_diagnostic_menu 
	createscreenelement {
		type = containerelement
		parent = root_window
		id = gd_container
		pos = (0.0, 0.0)
		just = [left top]
	}
	createscreenelement {
		type = spriteelement
		parent = gd_container
		pos = (0.0, 0.0)
		just = [left top]
		dims = (1280.0, 1024.0)
		rgba = [80 80 80 255]
		z_priority = -1
	}
	font = text_a4
	text_params = {type = textelement parent = gd_container font = <font> just = [left top]}
	createscreenelement {
		<text_params>
		id = title_text
		text = "Guitar info"
		pos = (540.0, 100.0)
	}
	createscreenelement {
		<text_params>
		id = leftx
		text = "Left X "
		pos = (580.0, 200.0)
	}
	createscreenelement {
		<text_params>
		id = rightx
		text = "Right X "
		pos = (580.0, 240.0)
	}
	createscreenelement {
		<text_params>
		id = lefty
		text = "Left Y "
		pos = (580.0, 280.0)
	}
	createscreenelement {
		<text_params>
		id = righty
		text = "Right Y "
		pos = (580.0, 320.0)
	}
	createscreenelement {
		<text_params>
		id = leftlength
		text = "Left Length "
		pos = (580.0, 360.0)
	}
	createscreenelement {
		<text_params>
		id = rightlength
		text = "Right Length "
		pos = (580.0, 400.0)
	}
	createscreenelement {
		<text_params>
		id = lefttrigger
		text = "Left Trigger "
		pos = (580.0, 440.0)
	}
	createscreenelement {
		<text_params>
		id = righttrigger
		text = "Right Trigger "
		pos = (580.0, 480.0)
	}
	createscreenelement {
		<text_params>
		id = verticaldist
		text = "Vertical Dist "
		pos = (580.0, 520.0)
	}
	spawnscriptnow update_guitar_diagnostic_menu
endscript

script destroy_guitar_diagnostic_menu 
	killspawnedscript \{name = update_guitar_diagnostic_menu}
	destroy_menu \{menu_id = gd_container}
endscript

script update_guitar_diagnostic_menu 
	begin
	guitargetanalogueinfo controller = 0
	formattext textname = leftxtext "Left X - %v" v = <leftx>
	formattext textname = rightxtext "Whammy position - %v" v = <rightx>
	formattext textname = leftytext "Left Y - %v" v = <lefty>
	formattext textname = rightytext "Right Y - %v" v = <righty>
	formattext textname = leftlengthtext "Left Length - %v" v = <leftlength>
	formattext textname = rightlengthtext "Right Length - %v" v = <rightlength>
	formattext textname = lefttriggertext "Left Trigger - %v" v = <lefttrigger>
	formattext textname = righttriggertext "Right Trigger - %v" v = <righttrigger>
	formattext textname = verticaldisttext "Vertical orientation - %v" v = <verticaldist>
	setscreenelementprops id = leftx text = <leftxtext>
	setscreenelementprops id = rightx text = <rightxtext>
	setscreenelementprops id = lefty text = <leftytext>
	setscreenelementprops id = righty text = <rightytext>
	setscreenelementprops id = leftlength text = <leftlengthtext>
	setscreenelementprops id = rightlength text = <rightlengthtext>
	setscreenelementprops id = lefttrigger text = <lefttriggertext>
	setscreenelementprops id = righttrigger text = <righttriggertext>
	setscreenelementprops id = verticaldist text = <verticaldisttext>
	wait 1 gameframe
	repeat
endscript
