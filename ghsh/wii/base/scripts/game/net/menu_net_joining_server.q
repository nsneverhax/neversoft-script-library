
script create_join_server_menu 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = joining_screen_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = xb_online_bg}
	displaySprite \{id = online_frame
		parent = joining_screen_container
		tex = xb_online_frame_large
		Pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaySprite \{id = xb_online_frame_crown
		parent = joining_screen_container
		tex = xb_online_frame_crown
		Pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 2.1
		dims = (256.0, 105.0)}
	if (($ui_flow_manager_state [0]) = quick_match_joining_game_fs)
		<title_text> = qs(0x42d2d391)
	elseif (($ui_flow_manager_state [0]) = invite_joining_game_fs)
		<title_text> = qs(0xf05a63dd)
	else
		<title_text> = qs(0x0956be4d)
	endif
	CreateScreenElement {
		Type = TextElement
		parent = joining_screen_container
		font = fontgrid_title_a1
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
		text = qs(0x78490530)
		just = [center center]
		Pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_a1
		Scale = 1.0
		rgba = ($online_light_blue)
		z_priority = 2.1
	}
	GetScreenElementDims id = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <id>
		id = dots_text
		font = fontgrid_title_a1
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x03ac90f0)
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
	destroy_popup_warning_menu
	destroy_menu_backdrop
endscript

script create_joining_screen 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = joining_screen_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = menu_venue_bg}
	CreateScreenElement \{Type = TextElement
		parent = joining_screen_container
		text = qs(0x78490530)
		just = [
			center
			center
		]
		Pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_a1
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
		font = fontgrid_text_a6
		Scale = 2.0
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

script 0x8904059c \{go_back = 1}
	Change \{0xbefe4db6 = 1}
	Change \{is_network_game = 0}
	if (<go_back> = 1)
		generic_event_back
	endif
	0xf643c6a5
endscript

script 0x80ee4d07 
	Change \{0xbefe4db6 = 1}
	destroy_generic_popup
	if (<go_back> = 1)
		generic_event_back
	endif
	Change \{num_players_in_band = 0}
	ui_band_mode_change_menu_focus_all \{focus_type = focus}
	0xf643c6a5
endscript

script 0x997d22d5 \{go_back = 1
		cancel_script = 0x8904059c}
	Change \{0xbefe4db6 = 0}
	SpawnScriptNow create_generic_popup params = {
		title = qs(0xddccf0c3)
		loading_window
		can_cancel
		message = qs(0xddccf0c3)
		wait_variable = 0xbefe4db6
		cancel_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose <cancel_script> params = {go_back = <go_back>}}
		]
	}
endscript

script 0x47d189ca 
	destroy_generic_popup
	ui_event_get_top
	if (<base_name> = 'online')
		cancel_start_matchmaking
	endif
endscript

script 0x9282b5c7 
	Change \{0xbefe4db6 = 1}
	destroy_generic_popup
	create_generic_popup \{ok_menu
		title = qs(0x1a4b0d3a)
		message = qs(0x1876e423)
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
