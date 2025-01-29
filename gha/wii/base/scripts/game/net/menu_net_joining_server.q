
script create_join_server_menu 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = joining_screen_container
		Pos = (0.0, 0.0)}
	KillSpawnedScript \{Name = destroy_loading_screen_spawned}
	create_menu_backdrop \{texture = Online_Background}
	displaySprite \{id = online_frame
		parent = joining_screen_container
		tex = Online_Frame_Large
		Pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaySprite \{id = Online_Frame_Crown
		parent = joining_screen_container
		tex = Online_Frame_Crown
		Pos = (640.0, 42.0)
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
	CreateScreenElement {
		Type = TextElement
		parent = joining_screen_container
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_dark_purple)
		text = <title_text>
		Pos = (640.0, 135.0)
		just = [center top]
		z_priority = 2.1
	}
	CreateScreenElement {
		Type = TextElement
		parent = joining_screen_container
		text = 'JOINING GAME'
		just = [center center]
		Pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		z_priority = 2.1
	}
	GetScreenElementDims id = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <id>
		id = dots_text
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = ''
		just = [left top]
		z_priority = 2.1
		Pos = (<width> * (1.0, 0.0) + (5.0, 15.0))
	}
	if ScreenElementExists \{id = dots_text}
		RunScriptOnScreenElement \{id = dots_text
			animate_dots
			params = {
				id = dots_text
			}}
	endif
	LaunchEvent \{Type = focus
		target = joining_screen_container}
	0x997d22d5
endscript

script destroy_join_server_menu 
	destroy_generic_popup
	if ScreenElementExists \{id = joining_screen_container}
		DestroyScreenElement \{id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript

script create_joining_screen 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = joining_screen_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = TextElement
		parent = joining_screen_container
		text = 'JOINING GAME'
		just = [
			center
			center
		]
		Pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_gh3
		Scale = 2.0
		rgba = [
			210
			210
			210
			250
		]
		Shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 2.0}
	CreateScreenElement \{Type = TextElement
		parent = joining_screen_container
		id = joining_dots_text
		font = text_a5
		Scale = 2.0
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
		Pos = (640.0, 450.0)
		Shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	if ScreenElementExists \{id = joining_dots_text}
		RunScriptOnScreenElement \{id = joining_dots_text
			animate_dots
			params = {
				id = joining_dots_text
			}}
	endif
endscript

script destroy_joining_screen 
	if ScreenElementExists \{id = joining_screen_container}
		DestroyScreenElement \{id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript
0xbefe4db6 = 0

script 0xb2284bbf 
	Change \{0xbefe4db6 = 1}
	destroy_generic_popup
endscript

script 0x8904059c 
	Change \{0xbefe4db6 = 1}
	ui_flow_manager_respond_to_action \{action = go_back}
	0xf643c6a5
endscript

script 0x997d22d5 
	Change \{0xbefe4db6 = 0}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
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
			{
				pad_back
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
	Change \{0xbefe4db6 = 1}
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
