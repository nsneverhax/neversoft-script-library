
script create_gamma_brightness_menu popup = 0
	header_font = text_a5
	menu_font = fontgrid_title_gh3
	menu_pos = (0.0, 340.0)
	z = 100.0
	createscreenelement {
		type = containerelement
		parent = root_window
		id = gamma_warning_container
		pos = (0.0, 0.0)
	}
	event_handlers = [
		{pad_up gamma_brightness_menu_change params = {up}}
		{pad_down gamma_brightness_menu_change params = {down}}
		{pad_back menu_flow_go_back}
	]
	new_menu scrollid = scrolling_gamma_warning vmenuid = vmenu_gamma_warning menu_pos = <menu_pos> event_handlers = <event_handlers>
	if (<popup> = 1)
		create_pause_menu_frame z = (<z> - 10)
	else
		createscreenelement {
			type = spriteelement
			parent = gamma_warning_container
			pos = (640.0, 360.0)
			just = [center center]
			rgba = [50 50 50 255]
			dims = (1280.0, 720.0)
		}
		add_user_control_helper text = "BACK" button = red z = 100
		add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
	endif
	setscreenelementprops {
		id = vmenu_gamma_warning
		dims = (1280.0, 720.0)
		internal_just = [center top]
	}
	createscreenelement {
		type = textelement
		parent = gamma_warning_container
		text = "BRIGHTNESS"
		font = <header_font>
		scale = 1.5
		pos = (640.0, 280.0)
		just = [center center]
		rgba = ($menu_unfocus_color)
		z_priority = <z>
	}
	formattext textname = brightness_text "Brightness: %d" d = ($se_brightness)
	createscreenelement {
		type = textelement
		parent = vmenu_gamma_warning
		text = <brightness_text>
		id = gamma_brightness_text
		font = <menu_font>
		scale = (1.25)
		z_priority = <z>
		rgba = [223 223 223 255]
		event_handlers = [
			{focus retail_menu_focus}
		]
	}
endscript

script destroy_gamma_brightness_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_gamma_warning}
	destroy_menu \{menu_id = gamma_warning_container}
	destroy_pause_menu_frame
endscript

script gamma_brightness_menu_change 
	printf "gamma_brightness_menu_change"
	if gotparam up
		change se_brightness = ($se_brightness + 1)
		if ($se_brightness > 10)
			change se_brightness = 10
		endif
	elseif gotparam down
		change se_brightness = ($se_brightness - 1)
		if ($se_brightness < 0)
			change se_brightness = 0
		endif
	endif
	setglobaltags user_options params = {gamma_brightness = $se_brightness}
	if viewportexists id = bg_viewport
		tod_proxim_update_global_brightness viewport = bg_viewport
	endif
	if screenelementexists id = gamma_brightness_text
		formattext textname = brightness_text "Brightness: %d" d = ($se_brightness)
		printf <brightness_text>
		setscreenelementprops id = gamma_brightness_text text = <brightness_text>
	endif
endscript
