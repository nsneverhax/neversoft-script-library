
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
		<title_text> = qs(0x17e61634)
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
endscript

script destroy_join_server_menu 
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
