cs_highlighter_positions = [
	(620.0, 193.0)
	(621.0, 227.0)
	(622.0, 261.0)
	(623.0, 296.0)
	(624.0, 330.0)
]
cs_is_popup = 0
cs_menu_font = fontgrid_title_a1

script create_controller_settings_menu \{popup = 0}
	disable_pause
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
		new_menu menu_parent = cs_container scrollid = cs_scroll vmenuid = current_menu menu_pos = <menu_pos> spacing = -10 exclusive_device = ($last_start_pressed_device)
		createscreenelement {
			type = textelement
			font = ($cs_menu_font)
			parent = cs_scroll
			pos = (180.0, -30.0)
			scale = 1.3
			text = qs(0x8b69cff8)
			rgba = ($menu_unfocus_color)
			z_priority = <z>
		}
		create_pause_menu_frame x_scale = 1.3 z = (<z> - 10)
		text_params = {parent = current_menu type = textelement font = ($cs_menu_font) rgba = ($menu_unfocus_color) z_priority = <z> scale = (0.9, 0.8)}
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
			text = qs(0x662aaaf7)
			font = fontgrid_text_a6
			pos = (125.0, 53.0)
			rgba = [170 90 30 255]
			scale = 0.8
		}
	else
		change \{cs_is_popup = 0}
		event_handlers = [
			{pad_back controller_settings_menu_back}
		]
		new_menu scrollid = cs_scroll vmenuid = current_menu menu_pos = <menu_pos> text_left event_handlers = <event_handlers> no_focus = 1
		set_focus_color \{rgba = [
				190
				185
				165
				255
			]}
		set_unfocus_color \{rgba = [
				60
				45
				30
				255
			]}
		create_menu_backdrop \{texture = menu_venue_bg}
		createscreenelement \{type = spriteelement
			parent = cs_container
			id = cs_light_overlay
			texture = menu_venue_overlay
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
			pos = (1090.0, 300.0)
			dims = (112.0, 54.0)
			z = 4
			rot_angle = -80}
		displaysprite \{parent = cs_container
			tex = tape_h_02
			rgba = [
				0
				0
				0
				128
			]
			pos = (1095.0, 305.0)
			dims = (112.0, 54.0)
			z = 4
			rot_angle = -80}
		createscreenelement {
			type = textelement
			id = cs_controller_text
			parent = cs_container
			pos = (465.0, 571.0)
			scale = (0.65000004, 0.8)
			text = qs(0x90d184e2)
			font = fontgrid_text_a6
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
			text = qs(0x0b6ccd33)
			font = fontgrid_text_a6
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
		font = fontgrid_text_a6
		z = 5
		text_params = {parent = current_menu type = textelement font = <font> scale = 0.7 rgba = ($menu_unfocus_color) z_priority = <z> rot_angle = 1.5}
		<exclusive_params> = {exclusive_device = ($primary_controller)}
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
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
	endif
	if (<popup>)
		<p1_l_flip_text> = qs(0x1332c72f)
		<p2_l_flip_text> = qs(0x7eb43475)
	else
		<p1_l_flip_text> = qs(0xd5a4e5b5)
		<p2_l_flip_text> = qs(0x27f3084d)
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
	getplayerinfo \{1
		lefty_flip}
	controller_settings_menu_update_lefty_flip_p1_value lefty_flip_p1 = <lefty_flip>
	controller_settings_menu_update_lefty_flip_p2_value lefty_flip_p2 = <lefty_flip_p2>
	if NOT (<popup>)
		getscreenelementdims id = <id>
		if (<width> > 300)
			setscreenelementprops id = <id> scale = 1
			fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((300.0, 0.0) + <height> * (0.0, 1.0))
		endif
	endif
	createscreenelement {
		id = cs_calibrate_sensors_menu_item
		<text_params>
		text = qs(0x232aa75f)
		event_handlers = [
			{pad_choose controller_settings_menu_choose_sensors params = {popup = <popup>}}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter params = {index = 3}}
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
		setscreenelementprops \{id = cs_calibrate_sensors_menu_item
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
endscript

script controller_settings_menu_update_lefty_flip_p1_value \{lefty_flip_p1 = 0}
	if (<lefty_flip_p1>)
		if NOT ($cs_is_popup)
			setscreenelementprops \{id = cs_check_1
				texture = options_controller_check}
			change \{pad_event_up_inversion = true}
		else
			setscreenelementprops \{id = lefty_flip_p1_se
				text = qs(0x49599c36)}
		endif
	else
		if NOT ($cs_is_popup)
			setscreenelementprops \{id = cs_check_1
				texture = options_controller_x}
			change \{pad_event_up_inversion = false}
		else
			setscreenelementprops \{id = lefty_flip_p1_se
				text = qs(0x1332c72f)}
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
				text = qs(0x80469489)}
		endif
	else
		if NOT ($cs_is_popup)
			setscreenelementprops \{id = cs_check_2
				texture = options_controller_x}
		else
			setscreenelementprops \{id = lefty_flip_p2_se
				text = qs(0x7eb43475)}
		endif
	endif
endscript

script controller_settings_menu_choose_lefty_flip_p1 
	if (<popup>)
		generic_event_choose \{state = uistate_pausemenu_lefty_flip_warning
			data = {
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
		change structurename = player1_status lefty_flip = <lefty_flip_p1>
		setglobaltags user_options params = {lefty_flip_save = <lefty_flip_p1>}
		controller_settings_menu_update_lefty_flip_p1_value lefty_flip_p1 = <lefty_flip_p1>
	endif
endscript

script controller_settings_menu_choose_lefty_flip_p2 
	if (<popup>)
		generic_event_choose \{state = uistate_pausemenu_lefty_flip_warning
			data = {
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
	generic_event_choose state = uistate_options_controller_star_power data = {controller = <device_num> popup = <popup>}
endscript

script controller_settings_menu_choose_whammy_bar 
	generic_event_choose \{state = uistate_options_controller_whammy}
endscript

script controller_settings_menu_back 
	generic_event_back
endscript

script controller_settings_menu_choose_sensors 
	generic_event_choose state = uistate_options_controller_sensors data = {controller = <device_num> popup = <popup>}
endscript
