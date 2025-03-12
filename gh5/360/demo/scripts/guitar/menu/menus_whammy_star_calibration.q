g_spc_check_pow_bool = 1
g_spc_whammy_is_popup = 0
g_spc_sp_is_popup = 0
should_we_play_whammy_sound = 1

script create_whammy_bar_calibration_menu \{controller = 0
		popup = 0}
	disable_pause
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
		controller = ($primary_controller)
		<z> = 2
	endif
	if NOT (<popup>)
		create_menu_backdrop \{texture = menu_venue_bg}
		createscreenelement \{type = spriteelement
			parent = wbc_container
			id = wbc_light_overlay
			texture = menu_venue_overlay
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
			tex = tape_01
			pos = (1010.0, 450.0)
			dims = (192.0, 92.0)
			z = (<z> + 1)
			flip_v
			rot_angle = 90
		}
		displaysprite {
			parent = wbc_container
			tex = tape_02
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
	<text_1> = qs(0x09382884)
	button_color = qs(0x21d9c24c)
	getenterbuttonassignment
	if (<assignment> = circle)
		button_color = qs(0x02125e32)
	endif
	formattext textname = text_2 qs(0xe69d5720) a = <button_color>
	<text_3> = qs(0x01da96f6)
	createscreenelement {
		type = textblockelement
		font = fontgrid_text_a3
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
		font = fontgrid_text_a3
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
		font = fontgrid_text_a3
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
		font = fontgrid_text_a1
		pos = (760.0, 315.0)
		parent = wbc_container
		text = qs(0x480dff4d)
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		just = [center top]
		scale = 1.6
		rot_angle = -4
	}
	createscreenelement {
		type = textelement
		font = fontgrid_text_a1
		pos = (800.0, 365.0)
		parent = wbc_container
		text = qs(0x91639f57)
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		just = [center top]
		scale = 1.6
		rot_angle = -4
	}
	createscreenelement {
		type = textblockelement
		font = fontgrid_text_a3
		rgba = [140 235 170 255]
		pos = (810.0, 408.0)
		text = qs(0x2b282c01)
		just = [center top]
		internal_just = [center center]
		dims = (400.0, 200.0)
		scale = 0.6
		line_spacing = 0.8
		parent = wbc_container
		z_priority = (<z> + 2)
		rot_angle = -4
		id = current_menu
		font_spacing = 50
		space_spacing = 20
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{pad_choose menu_whammy_bar_calibration_enter_sample}
			{pad_back generic_event_back}
		]
		exclusive_device = <controller>
	}
	spawnscriptnow menu_whammy_bar_update_current_menu params = {controller = <controller>}
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
	add_user_control_helper text = qs(0xc18d5e76) button = green z = (<z> + 100)
	add_user_control_helper text = qs(0xaf4d5dd2) button = red z = (<z> + 100)
endscript

script destroy_whammy_bar_calibration_menu 
	killspawnedscript \{name = menu_whammy_bar_update_current_menu}
	destroy_menu \{menu_id = wbc_container}
	clean_up_user_control_helpers
	if NOT ($g_spc_whammy_is_popup)
		destroy_menu_backdrop
	endif
endscript

script create_star_power_trigger_calibration_menu \{controller = 0
		popup = 0}
	disable_pause
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
	else
		controller = ($last_start_pressed_device)
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
	button_color = qs(0x21d9c24c)
	getenterbuttonassignment
	if (<assignment> = circle)
		button_color = qs(0x02125e32)
	endif
	formattext textname = element_text qs(0xe2b75621) a = <button_color>
	createscreenelement {
		type = textblockelement
		id = current_menu
		parent = spc_container
		font = fontgrid_text_a1
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
			{pad_back generic_event_back}
		]
		z_priority = (<z> + 6.1)
		rot_angle = -2
	}
	spawnscriptnow menu_star_power_trigger_pow_check params = {controller = <controller>}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 110}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 110}
endscript

script destroy_star_power_trigger_calibration_menu 
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
		if playerinfo 1 controller = <controller>
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
		getmaxlocalplayers
		get_star_power_position controller = <device_num>
		<player> = 1
		begin
		getplayerinfo <player> controller
		if (<device_num> = <controller>)
			setplayerinfo <player> star_tilt_threshold = <star_power_position>
			break
		endif
		<player> = (<player> + 1)
		repeat <max_players>
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
	font = fontgrid_text_a1
	text_params = {type = textelement parent = gd_container font = <font> just = [left top]}
	createscreenelement {
		<text_params>
		id = title_text
		text = qs(0x9f1a8f75)
		pos = (540.0, 100.0)
	}
	createscreenelement {
		<text_params>
		id = leftx
		text = qs(0x9d8b1678)
		pos = (580.0, 200.0)
	}
	createscreenelement {
		<text_params>
		id = rightx
		text = qs(0x54477174)
		pos = (580.0, 240.0)
	}
	createscreenelement {
		<text_params>
		id = lefty
		text = qs(0x2537711d)
		pos = (580.0, 280.0)
	}
	createscreenelement {
		<text_params>
		id = righty
		text = qs(0xecfb1611)
		pos = (580.0, 320.0)
	}
	createscreenelement {
		<text_params>
		id = leftlength
		text = qs(0x83712a88)
		pos = (580.0, 360.0)
	}
	createscreenelement {
		<text_params>
		id = rightlength
		text = qs(0xd5c3ae4b)
		pos = (580.0, 400.0)
	}
	createscreenelement {
		<text_params>
		id = lefttrigger
		text = qs(0x7018408b)
		pos = (580.0, 440.0)
	}
	createscreenelement {
		<text_params>
		id = righttrigger
		text = qs(0x7a1ad58d)
		pos = (580.0, 480.0)
	}
	createscreenelement {
		<text_params>
		id = verticaldist
		text = qs(0x141789d6)
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
		formattext textname = leftxtext qs(0xad0cd7a6) v = <leftx>
		formattext textname = rightxtext qs(0x5b126d2b) v = <rightx>
		formattext textname = leftytext qs(0x36a99bc9) v = <lefty>
		formattext textname = rightytext qs(0xad38a888) v = <righty>
		formattext textname = leftlengthtext qs(0x567d1f56) v = <leftlength>
		formattext textname = rightlengthtext qs(0x3e5c1976) v = <rightlength>
		formattext textname = lefttriggertext qs(0xd75b7f01) v = <lefttrigger>
		formattext textname = righttriggertext qs(0xabbc96b7) v = <righttrigger>
		formattext textname = verticaldisttext qs(0x29130595) v = <verticaldist>
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
