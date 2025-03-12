
script create_join_server_menu 
	createscreenelement \{type = containerelement
		parent = root_window
		id = joining_screen_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = xb_online_bg}
	displaysprite \{id = online_frame
		parent = joining_screen_container
		tex = xb_online_frame_large
		pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaysprite \{id = xb_online_frame_crown
		parent = joining_screen_container
		tex = xb_online_frame_crown
		pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 2.1
		dims = (256.0, 105.0)}
	if (($ui_flow_manager_state [0]) = quick_match_joining_game_fs)
		<title_text> = qs(0x17e61634)
	elseif (($ui_flow_manager_state [0]) = invite_joining_game_fs)
		<title_text> = qs(0xf05a63dd)
	else
		<title_text> = qs(0x0956be4d)
	endif
	createscreenelement {
		type = textelement
		parent = joining_screen_container
		font = fontgrid_title_a1
		scale = 0.85
		rgba = ($online_dark_purple)
		text = <title_text>
		pos = (640.0, 135.0)
		just = [center top]
		z_priority = 2.1
	}
	createscreenelement {
		type = textelement
		parent = joining_screen_container
		text = qs(0x78490530)
		just = [center center]
		pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		z_priority = 2.1
	}
	getscreenelementdims id = <id>
	createscreenelement {
		type = textelement
		parent = <id>
		id = dots_text
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x03ac90f0)
		just = [left top]
		z_priority = 2.1
		pos = (<width> * (1.0, 0.0) + (5.0, 15.0))
	}
	if screenelementexists \{id = dots_text}
		runscriptonscreenelement \{id = dots_text
			animate_dots
			params = {
				id = dots_text
			}}
	endif
endscript

script destroy_join_server_menu 
	if screenelementexists \{id = joining_screen_container}
		destroyscreenelement \{id = joining_screen_container}
	endif
	destroy_popup_warning_menu
	destroy_menu_backdrop
endscript

script create_joining_screen 
	createscreenelement \{type = containerelement
		parent = root_window
		id = joining_screen_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = menu_venue_bg}
	createscreenelement \{type = textelement
		parent = joining_screen_container
		text = qs(0x78490530)
		just = [
			center
			center
		]
		pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_a1
		scale = 2.0
		rgba = [
			210
			210
			210
			250
		]
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 2.0}
	createscreenelement \{type = textelement
		parent = joining_screen_container
		id = joining_dots_text
		font = fontgrid_text_a6
		scale = 2.0
		rgba = [
			210
			210
			210
			250
		]
		text = qs(0x03ac90f0)
		just = [
			left
			top
		]
		z_priority = 2.0
		pos = (640.0, 450.0)
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	if screenelementexists \{id = joining_dots_text}
		runscriptonscreenelement \{id = joining_dots_text
			animate_dots
			params = {
				id = joining_dots_text
			}}
	endif
endscript

script destroy_joining_screen 
	if screenelementexists \{id = joining_screen_container}
		destroyscreenelement \{id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript
