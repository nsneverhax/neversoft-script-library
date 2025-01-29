g_spc_check_pow_bool = 1
g_spc_whammy_is_popup = 0
g_spc_sp_is_popup = 0
should_we_play_whammy_sound = 1

script create_whammy_bar_calibration_menu \{controller = 0
		popup = 0}
	if iswinport
		if (<popup> = 1)
			kill_start_key_binding
		endif
	else
		kill_start_key_binding
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = wbc_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if (<popup>)
		change \{g_spc_whammy_is_popup = 1}
		controller = ($last_start_pressed_device)
		<z> = 100
	else
		change \{g_spc_whammy_is_popup = 0}
		<z> = 2
	endif
	if NOT (<popup>)
		create_menu_backdrop \{texture = venue_bg}
		createscreenelement \{type = spriteelement
			parent = wbc_container
			id = wbc_light_overlay
			texture = venue_overlay
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 99}
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
	text_block_type_scale = 0.8
	text_block_1_pos = (630.0, 70.0)
	text_block_1_dims = (910.0, 200.0)
	text_block_2_pos = (650.0, 140.0)
	text_block_2_dims = (840.0, 100.0)
	text_block_3_pos = (750.0, 195.0)
	text_block_3_dims = (525.0, 300.0)
	<text_1> = "Press  the  whammy  bar  completely  down, and  gently  allow  it  to  return  to  its  resting  position."
	button_color = "Green"
	getenterbuttonassignment
	if (<assignment> = circle)
		button_color = "Red"
	endif
	formattext textname = text_2 "Press  the  %a  Button  to  calibrate  using  this  position." a = <button_color>
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
		internal_scale = <text_block_type_scale>
		rot_angle = -2
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
		internal_scale = <text_block_type_scale>
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
		internal_scale = <text_block_type_scale>
		rot_angle = -2
		line_spacing = 0.8
	}
	createscreenelement {
		type = textelement
		font = text_a5
		pos = (760.0, 315.0)
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
		pos = (800.0, 365.0)
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
		text = "RESTING POSITION CALIBRATED"
		just = [center top]
		internal_just = [center center]
		dims = (400.0, 200.0)
		scale = 0.6
		line_spacing = 0.8
		parent = wbc_container
		z_priority = (<z> + 2)
		rot_angle = -4
		id = resting_message
		font_spacing = 50
		space_spacing = 20
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{pad_choose menu_whammy_bar_calibration_enter_sample}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
		exclusive_device = <controller>
	}
	launchevent \{type = focus
		target = resting_message}
	spawnscriptnow menu_whammy_bar_update_resting_message params = {controller = <controller>}
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
	add_user_control_helper text = "SELECT" button = green z = (<z> + 100)
	add_user_control_helper text = "BACK" button = red z = (<z> + 100)
endscript

script destroy_whammy_bar_calibration_menu 
	if iswinport
		if ($g_spc_whammy_is_popup = 1)
			restore_start_key_binding
		endif
	else
		restore_start_key_binding
	endif
	killspawnedscript \{name = menu_whammy_bar_update_resting_message}
	destroy_menu \{menu_id = wbc_container}
	clean_up_user_control_helpers
	if NOT ($g_spc_whammy_is_popup)
		destroy_menu_backdrop
	endif
endscript

script menu_whammy_bar_calibration_enter_sample 
	if guitargetanalogueinfo controller = <device_num>
		if (<rightx> = 0)
			<rightx> = 0.0001
		elseif (<rightx> = 1)
			<rightx> = 0.9998999
		endif
		switch (<device_num>)
			case 0
			setglobaltags user_options params = {resting_whammy_position_device_0 = <rightx>}
			case 1
			setglobaltags user_options params = {resting_whammy_position_device_1 = <rightx>}
			case 2
			setglobaltags user_options params = {resting_whammy_position_device_2 = <rightx>}
			case 3
			setglobaltags user_options params = {resting_whammy_position_device_3 = <rightx>}
			case 4
			setglobaltags user_options params = {resting_whammy_position_device_4 = <rightx>}
			case 5
			setglobaltags user_options params = {resting_whammy_position_device_5 = <rightx>}
			case 6
			setglobaltags user_options params = {resting_whammy_position_device_6 = <rightx>}
		endswitch
		if (<device_num> = $player1_status.controller)
			get_resting_whammy_position controller = <device_num>
			change structurename = player1_status resting_whammy_position = <resting_whammy_position>
		else
			if (<device_num> = $player2_status.controller)
				get_resting_whammy_position controller = <device_num>
				change structurename = player2_status resting_whammy_position = <resting_whammy_position>
			endif
		endif
	endif
endscript

script menu_whammy_bar_update_resting_message 
	begin
	if is_whammy_resting controller = <controller>
		if ($should_we_play_whammy_sound = 0)
			soundevent \{event = whammy_test_sfx}
			change \{should_we_play_whammy_sound = 1}
		endif
		setscreenelementprops \{id = resting_message
			unhide}
		setscreenelementprops \{id = wbc_poster_1
			alpha = 1}
	else
		change \{should_we_play_whammy_sound = 0}
		setscreenelementprops \{id = resting_message
			hide}
		menu_whammy_bar_do_poster_morph controller = <controller>
	endif
	wait \{1
		gameframe}
	repeat
endscript

script menu_whammy_bar_do_poster_morph 
	if guitargetanalogueinfo controller = <controller>
		if (<rightx> >= 0)
			setscreenelementprops id = wbc_poster_1 alpha = ((1 - <rightx>) * 0.5)
		else
			setscreenelementprops id = wbc_poster_1 alpha = ((0.5 * (<rightx> * -1)) + 0.5)
		endif
	endif
endscript

script create_star_power_trigger_calibration_menu \{controller = 0
		popup = 0}
	kill_start_key_binding
	createscreenelement \{id = spc_container
		type = containerelement
		parent = root_window
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if (<popup>)
		<z> = 100
		controller = ($last_start_pressed_device)
	else
		<z> = -4
	endif
	if NOT (<popup>)
		create_menu_backdrop \{texture = options_calibrate_starpower_posterwall}
	else
		displaysprite \{parent = spc_container
			tex = options_calibrate_starpower_posterwall
			pos = (0.0, 0.0)
			dims = (1280.0, 720.0)
			z = 107}
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
	if english
		starpower_pow_tex = options_calibrate_starpower_pow
	elseif french
		starpower_pow_tex = options_calibrate_starpower_pow_fr
	elseif spanish
		starpower_pow_tex = options_calibrate_starpower_pow_sp
	elseif german
		starpower_pow_tex = options_calibrate_starpower_pow_de
	elseif italian
		starpower_pow_tex = options_calibrate_starpower_pow_fr
	endif
	displaysprite {
		id = spc_pow
		parent = spc_container
		tex = <starpower_pow_tex>
		pos = (0.0, 0.0)
		scale = 1.0
		relative_scale
		z = (<z> + 3)
	}
	setscreenelementprops id = <id> hide
	button_color = "Green"
	getenterbuttonassignment
	if (<assignment> = circle)
		button_color = "Red"
	endif
	formattext textname = element_text "Raise the Guitar up to the point at which you would like Star Power to be triggered and press the %a Button to set this value." a = <button_color>
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
		text = <element_text>
		event_handlers = [
			{pad_choose menu_star_power_trigger_enter_position params = {controller = <controller>}}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
		z_priority = (<z> + 6.1)
		rot_angle = -2
	}
	launchevent \{type = focus
		target = star_calibration_text}
	spawnscriptnow menu_star_power_trigger_pow_check params = {controller = <controller>}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 110}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 110}
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
	if guitargetanalogueinfo controller = <controller>
		<spc_v_dist> = <righty>
		if (<spc_v_dist> > 0)
			<spc_v_dist> = 0
		endif
		getglobaltags \{user_options}
		if (<controller> = $player1_status.controller)
			if (<lefty_flip_p1> = 1)
				<line_rot> = (25.0 -30.0 * ((<spc_v_dist>) * -1))
			else
				<line_rot> = (25.0 -30.0 * <spc_v_dist>)
			endif
		else
			if (<lefty_flip_p2> = 1)
				<line_rot> = (25.0 -30.0 * ((<spc_v_dist>) * -1))
			else
				<line_rot> = (25.0 -30.0 * <spc_v_dist>)
			endif
		endif
		setscreenelementprops id = spc_rotating_bg_lines rot_angle = <line_rot>
		setscreenelementprops id = spc_rotating_bg_planes rot_angle = (<line_rot> - 5.0)
		get_star_power_position controller = <controller>
		<spc_pos_dev> = <star_power_position>
		wait \{0.05
			seconds}
		if (<spc_v_dist> <= <spc_pos_dev>)
			if ($g_spc_check_pow_bool = 1)
				soundevent \{event = pow_sfx}
				<spc_pow_rand_x> = 0
				<spc_pow_rand_y> = 0
				<spc_pow_rand_scale> = 0
				<spc_pow_rand_rot> = 0
				getrandomvalue \{name = spc_pow_rand_x
					integer
					a = 380
					b = 470}
				getrandomvalue \{name = spc_pow_rand_y
					integer
					a = 50
					b = 80}
				getrandomvalue \{name = spc_pow_rand_scale
					a = 0.6
					b = 1.0}
				getrandomvalue \{name = spc_pow_rand_rot
					a = -3.0
					b = 3.0}
				setscreenelementprops {
					id = spc_pow
					unhide
					pos = (((1.0, 0.0) * <spc_pow_rand_x>) + ((0.0, 1.0) * <spc_pow_rand_y>))
					rot_angle = <spc_pow_rand_rot>
					scale = <spc_pow_rand_scale>
					relative_scale
				}
				change \{g_spc_check_pow_bool = 0}
			endif
		else
			setscreenelementprops \{id = spc_pow
				hide}
			change \{g_spc_check_pow_bool = 1}
		endif
	else
		wait \{0.05
			seconds}
	endif
	repeat
endscript

script menu_star_power_trigger_enter_position 
	if guitargetanalogueinfo controller = <device_num>
		if (<righty> > 0)
			<righty> = 0
		endif
		switch (<device_num>)
			case 0
			setglobaltags user_options params = {star_power_position_device_0 = <righty>}
			soundevent \{event = pow_sfx}
			case 1
			setglobaltags user_options params = {star_power_position_device_1 = <righty>}
			soundevent \{event = pow_sfx}
			case 2
			setglobaltags user_options params = {star_power_position_device_2 = <righty>}
			soundevent \{event = pow_sfx}
			case 3
			setglobaltags user_options params = {star_power_position_device_3 = <righty>}
			soundevent \{event = pow_sfx}
		endswitch
		if (<device_num> = $player1_status.controller)
			get_star_power_position controller = <device_num>
			change structurename = player1_status star_tilt_threshold = <star_power_position>
		else
			if (<device_num> = $player2_status.controller)
				get_star_power_position controller = <device_num>
				change structurename = player2_status star_tilt_threshold = <star_power_position>
			endif
		endif
	endif
endscript

script create_guitar_diagnostic_menu 
	createscreenelement \{type = containerelement
		parent = root_window
		id = gd_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	createscreenelement \{type = spriteelement
		parent = gd_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		dims = (1280.0, 1024.0)
		rgba = [
			80
			80
			80
			255
		]
		z_priority = -1}
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
	spawnscriptnow \{update_guitar_diagnostic_menu}
endscript

script destroy_guitar_diagnostic_menu 
	killspawnedscript \{name = update_guitar_diagnostic_menu}
	destroy_menu \{menu_id = gd_container}
endscript

script update_guitar_diagnostic_menu 
	begin
	if guitargetanalogueinfo \{controller = 0}
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
	endif
	wait \{1
		gameframe}
	repeat
endscript
