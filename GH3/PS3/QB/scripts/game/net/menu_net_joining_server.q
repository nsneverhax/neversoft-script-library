
script create_join_server_menu 
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = joining_screen_container
		Pos = (0.0, 0.0)}
	KillSpawnedScript \{Name = destroy_loading_screen_spawned}
	create_menu_backdrop \{texture = Online_Background}
	displaySprite \{Id = online_frame
		PARENT = joining_screen_container
		tex = Online_Frame_Large
		Pos = (640.0, 100.0)
		just = [
			Center
			Top
		]
		Z = 2}
	displaySprite \{Id = Online_Frame_Crown
		PARENT = joining_screen_container
		tex = Online_Frame_Crown
		Pos = (640.0, 42.0)
		just = [
			Center
			Top
		]
		Z = 2.1
		Dims = (256.0, 105.0)}
	if (($ui_flow_manager_state [0]) = quick_match_joining_game_fs)
		<Title_text> = "QUICKMATCH"
	elseif (($ui_flow_manager_state [0]) = invite_joining_game_fs)
		<Title_text> = "INVITATION"
	else
		<Title_text> = "CUSTOM MATCH"
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = joining_screen_container
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_dark_purple)
		Text = <Title_text>
		Pos = (640.0, 135.0)
		just = [Center Top]
		z_priority = 2.1
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = joining_screen_container
		Text = "JOINING GAME"
		just = [Center Center]
		Pos = (640.0, 340.0)
		Rot_Angle = 0
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		z_priority = 2.1
	}
	GetScreenElementDims Id = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <Id>
		Id = dots_text
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		Text = ""
		just = [LEFT Top]
		z_priority = 2.1
		Pos = (<width> * (1.0, 0.0) + (5.0, 15.0))
	}
	if ScreenElementExists \{Id = dots_text}
		RunScriptOnScreenElement \{Id = dots_text
			animate_dots
			Params = {
				Id = dots_text
			}}
	endif
endscript

script destroy_join_server_menu 
	if ScreenElementExists \{Id = joining_screen_container}
		DestroyScreenElement \{Id = joining_screen_container}
	endif
	destroy_popup_warning_menu
	destroy_menu_backdrop
endscript

script create_joining_screen 
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = joining_screen_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = TextElement
		PARENT = joining_screen_container
		Text = "JOINING GAME"
		just = [
			Center
			Center
		]
		Pos = (640.0, 340.0)
		Rot_Angle = 0
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
		PARENT = joining_screen_container
		Id = joining_dots_text
		font = text_a5
		Scale = 2.0
		rgba = [
			210
			210
			210
			250
		]
		Text = ""
		just = [
			LEFT
			Top
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
	if ScreenElementExists \{Id = joining_dots_text}
		RunScriptOnScreenElement \{Id = joining_dots_text
			animate_dots
			Params = {
				Id = joining_dots_text
			}}
	endif
endscript

script destroy_joining_screen 
	if ScreenElementExists \{Id = joining_screen_container}
		DestroyScreenElement \{Id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript
