cs_highlighter_positions = [
	(620.0, 193.0)
	(621.0, 227.0)
	(622.0, 261.0)
	(623.0, 296.0)
]
cs_is_popup = 0
cs_menu_font = fontgrid_title_gh3

script create_controller_settings_menu \{popup = 0}
	kill_start_key_binding
	if NOT (<popup>)
		menu_pos = (638.0, 188.0)
	else
		menu_pos = (465.0, 310.0)
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = cs_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if (<popup>)
		z = 100
		change \{cs_is_popup = 1}
		new_menu scrollid = cs_scroll vmenuid = cs_vmenu menu_pos = <menu_pos> spacing = -10 exclusive_device = ($last_start_pressed_device)
		createscreenelement {
			type = textelement
			font = ($cs_menu_font)
			parent = cs_scroll
			pos = (180.0, -30.0)
			scale = 1.3
			text = "CONTROLLER SETTINGS"
			rgba = ($menu_unfocus_color)
			z_priority = <z>
		}
		create_pause_menu_frame x_scale = 1.3 z = (<z> - 10)
		text_params = {parent = cs_vmenu type = textelement font = ($cs_menu_font) rgba = ($menu_unfocus_color) z_priority = <z> scale = (0.9, 0.8)}
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		createscreenelement {
			type = spriteelement
			parent = cs_container
			texture = menu_pause_frame_banner
			pos = (640.0, 540.0)
			just = [center center]
			z_priority = (<z> + 100)
		}
		createscreenelement {
			type = textelement
			parent = <id>
			text = "PAUSED"
			font = text_a6
			pos = (125.0, 53.0)
			rgba = [170 90 30 255]
			scale = 0.8
		}
	else
		change \{cs_is_popup = 0}
		new_menu {
			scrollid = cs_scroll
			vmenuid = cs_vmenu
			menu_pos = <menu_pos>
			text_left
			focus_color = creamy_grey
			unfocus_color = chocolate
		}
		create_menu_backdrop \{texture = venue_bg}
		createscreenelement \{type = spriteelement
			parent = cs_container
			id = cs_light_overlay
			texture = venue_overlay
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 99}
		displaysprite \{parent = cs_container
			tex = options_controller_poster
			pos = (135.0, 30.0)
			dims = (640.0, 620.0)
			rot_angle = -1.5
			z = 5}
		displaysprite \{parent = cs_container
			tex = options_controller_poster2
			pos = (525.0, 130.0)
			dims = (552.0, 266.0)}
		displaysprite \{parent = cs_container
			tex = tape_h_03
			pos = (610.0, 0.0)
			dims = (120.0, 60.0)
			z = 6
			rot_angle = 60}
		displaysprite \{parent = cs_container
			tex = tape_h_03
			rgba = [
				0
				0
				0
				128
			]
			pos = (608.0, 5.0)
			dims = (120.0, 60.0)
			z = 6
			rot_angle = 60}
		displaysprite \{parent = cs_container
			tex = tape_h_04
			pos = (760.0, 106.0)
			dims = (140.0, 65.0)
			z = 4}
		displaysprite \{parent = cs_container
			tex = tape_h_04
			rgba = [
				0
				0
				0
				128
			]
			pos = (763.0, 111.0)
			dims = (140.0, 65.0)
			z = 4}
		displaysprite \{parent = cs_container
			tex = tape_v_01
			pos = (250.0, 360.0)
			dims = (80.0, 142.0)
			z = 6
			flip_v
			rot_angle = -10}
		displaysprite \{parent = cs_container
			tex = tape_v_01
			rgba = [
				0
				0
				0
				128
			]
			pos = (255.0, 363.0)
			dims = (80.0, 142.0)
			z = 6
			flip_v
			rot_angle = -10}
		displaysprite \{parent = cs_container
			tex = tape_h_02
			pos = (750.0, 380.0)
			dims = (112.0, 54.0)
			z = 4
			rot_angle = -40}
		displaysprite \{parent = cs_container
			tex = tape_h_02
			pos = (753.0, 383.0)
			dims = (112.0, 54.0)
			rgba = [
				0
				0
				0
				128
			]
			z = 3
			rot_angle = -40}
		createscreenelement {
			type = textelement
			id = cs_controller_text
			parent = cs_container
			pos = (465.0, 571.0)
			scale = (0.65000004, 0.8)
			text = "Controller"
			font = text_a6
			rgba = ($menu_unfocus_color)
			z_priority = 6
			rot_angle = -1.5
		}
		createscreenelement {
			type = textelement
			id = cs_options_text
			parent = cs_container
			pos = (460.0, 293.0)
			scale = (0.5, 0.4)
			text = "Options"
			font = text_a6
			rgba = ($menu_unfocus_color)
			z_priority = 6
			rot_angle = -16
		}
		displaysprite \{parent = cs_container
			tex = options_controller_checkbg
			pos = (945.0, 205.0)
			z = 4
			flip_h
			rot_angle = -5
			scale = 0.7}
		displaysprite \{parent = cs_container
			id = cs_check_1
			tex = options_controller_x
			pos = (975.0, 212.0)
			z = 6
			scale = 0.7}
		displaysprite \{parent = cs_container
			tex = options_controller_checkbg
			pos = (950.0, 251.0)
			z = 5
			rot_angle = -5
			scale = 0.7}
		displaysprite \{parent = cs_container
			id = cs_check_2
			tex = options_controller_x
			pos = (970.0, 245.0)
			z = 6
			scale = 0.7}
		displaysprite {
			parent = cs_container
			id = cs_highlighter
			tex = options_controller_highlight
			pos = ($cs_highlighter_positions [0])
			dims = (460.0, 58.0)
			z = 4
			rot_angle = 1
		}
		font = text_a6
		z = 5
		text_params = {parent = cs_vmenu type = textelement font = <font> scale = 0.7 rgba = ($menu_unfocus_color) z_priority = <z> rot_angle = 1.5}
		<exclusive_params> = {exclusive_device = ($primary_controller)}
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
	endif
	if (<popup>)
		<p1_l_flip_text> = "P1 Lefty Flip: OFF"
		<p2_l_flip_text> = "P2 Lefty Flip: OFF"
	else
		<p1_l_flip_text> = "P1 Lefty Flip:"
		<p2_l_flip_text> = "P2 Lefty Flip:"
	endif
	createscreenelement {
		<text_params>
		text = <p1_l_flip_text>
		event_handlers = [
			{pad_choose controller_settings_menu_choose_lefty_flip_p1 params = {popup = <popup>}}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter params = {index = 0}}
			{unfocus retail_menu_unfocus}
		]
		id = lefty_flip_p1_se
		<exclusive_params>
	}
	if NOT (<popup>)
		getscreenelementdims id = <id>
		if (<width> > 300)
			setscreenelementprops id = <id> scale = 1
			fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((300.0, 0.0) + <height> * (0.0, 1.0))
		endif
	endif
	createscreenelement {
		<text_params>
		text = <p2_l_flip_text>
		event_handlers = [
			{pad_choose controller_settings_menu_choose_lefty_flip_p2 params = {popup = <popup>}}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter params = {index = 1}}
			{unfocus retail_menu_unfocus}
		]
		id = lefty_flip_p2_se
		<exclusive_params>
	}
	if NOT (<popup>)
		getscreenelementdims id = <id>
		if (<width> > 300)
			setscreenelementprops id = <id> scale = 1
			fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((300.0, 0.0) + <height> * (0.0, 1.0))
		endif
	endif
	getglobaltags \{user_options}
	controller_settings_menu_update_lefty_flip_p1_value lefty_flip_p1 = <lefty_flip_p1>
	controller_settings_menu_update_lefty_flip_p2_value lefty_flip_p2 = <lefty_flip_p2>
	createscreenelement {
		id = cs_calibrate_whammy_menu_item
		<text_params>
		text = "Calibrate Whammy"
		event_handlers = [
			{pad_choose controller_settings_menu_choose_whammy_bar params = {popup = <popup>}}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter params = {index = 2}}
			{unfocus retail_menu_unfocus}
		]
		<exclusive_params>
	}
	if NOT (<popup>)
		getscreenelementdims id = <id>
		if (<width> > 300)
			setscreenelementprops id = <id> scale = 1
			fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((300.0, 0.0) + <height> * (0.0, 1.0))
		endif
	endif
	if NOT isguitarcontroller controller = ($primary_controller)
		setscreenelementprops \{id = cs_calibrate_whammy_menu_item
			rgba = [
				128
				128
				128
				255
			]
			not_focusable}
	endif
endscript

script controller_settings_menu_highlighter \{index = 0}
	if NOT ($cs_is_popup)
		setscreenelementprops id = cs_highlighter pos = ($cs_highlighter_positions [<index>])
	endif
endscript

script destroy_controller_settings_menu 
	destroy_pause_menu_frame
	destroy_menu \{menu_id = cs_container}
	destroy_menu \{menu_id = cs_scroll}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script controller_settings_menu_update_lefty_flip_p1_value \{lefty_flip_p1 = 0}
	if (<lefty_flip_p1>)
		if NOT ($cs_is_popup)
			setscreenelementprops \{id = cs_check_1
				texture = options_controller_check}
			change \{pad_event_up_inversion = true}
		else
			setscreenelementprops \{id = lefty_flip_p1_se
				text = "P1 Lefty Flip: ON"}
		endif
	else
		if NOT ($cs_is_popup)
			setscreenelementprops \{id = cs_check_1
				texture = options_controller_x}
			change \{pad_event_up_inversion = false}
		else
			setscreenelementprops \{id = lefty_flip_p1_se
				text = "P1 Lefty Flip: OFF"}
		endif
	endif
endscript

script controller_settings_menu_update_lefty_flip_p2_value \{lefty_flip_p2 = 0}
	if (<lefty_flip_p2>)
		if NOT ($cs_is_popup)
			setscreenelementprops \{id = cs_check_2
				texture = options_controller_check}
		else
			setscreenelementprops \{id = lefty_flip_p2_se
				text = "P2 Lefty Flip: ON"}
		endif
	else
		if NOT ($cs_is_popup)
			setscreenelementprops \{id = cs_check_2
				texture = options_controller_x}
		else
			setscreenelementprops \{id = lefty_flip_p2_se
				text = "P2 Lefty Flip: OFF"}
		endif
	endif
endscript

script controller_settings_menu_choose_lefty_flip_p1 
	if (<popup>)
		ui_flow_manager_respond_to_action \{action = select_lefty_flip
			create_params = {
				player = 1
			}}
	else
		getglobaltags \{user_options}
		if (<lefty_flip_p1> = 1)
			<lefty_flip_p1> = 0
			soundevent \{event = checkbox_sfx}
		else
			<lefty_flip_p1> = 1
			soundevent \{event = checkbox_check_sfx}
		endif
		setglobaltags user_options params = {lefty_flip_p1 = <lefty_flip_p1>}
		controller_settings_menu_update_lefty_flip_p1_value lefty_flip_p1 = <lefty_flip_p1>
	endif
endscript

script controller_settings_menu_choose_lefty_flip_p2 
	if (<popup>)
		ui_flow_manager_respond_to_action \{action = select_lefty_flip
			create_params = {
				player = 2
			}}
	else
		getglobaltags \{user_options}
		if (<lefty_flip_p2> = 1)
			<lefty_flip_p2> = 0
			soundevent \{event = checkbox_sfx}
		else
			<lefty_flip_p2> = 1
			soundevent \{event = checkbox_check_sfx}
		endif
		setglobaltags user_options params = {lefty_flip_p2 = <lefty_flip_p2>}
		controller_settings_menu_update_lefty_flip_p2_value lefty_flip_p2 = <lefty_flip_p2>
	endif
endscript

script controller_settings_menu_choose_star_power 
	ui_flow_manager_respond_to_action action = select_calibrate_star_power_trigger create_params = {controller = <device_num> popup = <popup>}
endscript

script controller_settings_menu_choose_whammy_bar 
	ui_flow_manager_respond_to_action action = select_calibrate_whammy_bar create_params = {controller = <device_num> popup = <popup>}
endscript
