
script create_join_server_menu 
	createscreenelement \{type = containerelement
		parent = root_window
		id = joining_screen_container
		pos = (0.0, 0.0)}
	killspawnedscript \{name = destroy_loading_screen_spawned}
	create_menu_backdrop \{texture = online_background}
	displaysprite \{id = online_frame
		parent = joining_screen_container
		tex = online_frame_large
		pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaysprite \{id = online_frame_crown
		parent = joining_screen_container
		tex = online_frame_crown
		pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 2.1
		dims = (256.0, 105.0)}
	if (($ui_flow_manager_state [0]) = quick_match_joining_game_fs)
		<title_text> = 'CONNECTING'
	elseif (($ui_flow_manager_state [0]) = invite_joining_game_fs)
		<title_text> = 'INVITATION'
	else
		<title_text> = 'CUSTOM MATCH'
	endif
	createscreenelement {
		type = textelement
		parent = joining_screen_container
		font = fontgrid_title_gh3
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
		text = 'JOINING GAME'
		just = [center center]
		pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = ($online_light_blue)
		z_priority = 2.1
	}
	getscreenelementdims id = <id>
	createscreenelement {
		type = textelement
		parent = <id>
		id = dots_text
		font = fontgrid_title_gh3
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = ''
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
	launchevent \{type = focus
		target = joining_screen_container}
	0x997d22d5
endscript

script destroy_join_server_menu 
	destroy_generic_popup
	if screenelementexists \{id = joining_screen_container}
		destroyscreenelement \{id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript

script create_joining_screen 
	createscreenelement \{type = containerelement
		parent = root_window
		id = joining_screen_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = venue_bg}
	createscreenelement \{type = textelement
		parent = joining_screen_container
		text = 'JOINING GAME'
		just = [
			center
			center
		]
		pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_gh3
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
		font = text_a5
		scale = 2.0
		rgba = [
			210
			210
			210
			250
		]
		text = ''
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
0xbefe4db6 = 0

script 0xb2284bbf 
	change \{0xbefe4db6 = 1}
	destroy_generic_popup
endscript

script 0x8904059c 
	change \{0xbefe4db6 = 1}
	ui_flow_manager_respond_to_action \{action = go_back}
	0xf643c6a5
endscript

script 0x997d22d5 
	change \{0xbefe4db6 = 0}
	create_generic_popup \{loading_window
		can_cancel
		message = $wii_searching
		wait_variable = 0xbefe4db6
		cancel_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				0x8904059c
			}
		]
		previous_menu = joining_screen_container}
endscript

script 0x47d189ca 
	destroy_generic_popup
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script 0x9282b5c7 
	change \{0xbefe4db6 = 1}
	destroy_generic_popup
	create_generic_popup \{ok_menu
		title = $wii_join_failed_text
		message = $wii_no_games_found_text
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				0x47d189ca
			}
		]}
endscript
