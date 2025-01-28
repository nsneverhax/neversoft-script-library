menu_using_guitar_controller_font = text_a4

script create_using_guitar_controller_menu 
	create_menu_backdrop \{texture = boot_usingGuitar_BG}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = ugc_container
		Pos = (0.0, 0.0)}
	guitar_tex = boot_usingGuitar_gtr_LesPaul
	GetPlatform
	switch <Platform>
		case PS3
		<guitar_tex> = boot_usingGuitar_gtr_LesPaul_PS3
	endswitch
	displaySprite PARENT = ugc_container tex = <guitar_tex> Pos = (660.0, 510.0) just = [Center Center] Z = 1
	displaySprite \{PARENT = ugc_container
		tex = boot_usingGuitar_illo
		Pos = (640.0, 270.0)
		just = [
			Center
			Center
		]
		Z = 1}
	displaySprite \{PARENT = ugc_container
		Id = bg_helper
		tex = White
		rgba = [
			83
			95
			147
			255
		]
		Dims = (221.0, 40.0)
		just = [
			Center
			Top
		]
		Z = 0.5}
	displayText \{PARENT = ugc_container
		Id = bg_helper_text
		font = text_a4
		rgba = [
			223
			223
			223
			255
		]
		Scale = 0.5
		just = [
			Center
			Top
		]
		Z = 0.6
		noshadow}
	menu_using_guitar_controller_add_text_start
	menu_using_guitar_controller_add_text_back
	menu_using_guitar_controller_add_text_continue
	menu_using_guitar_controller_add_text_up_down
	menu_using_guitar_controller_add_text_tilt_starpower
	menu_using_guitar_controller_add_text_header
	SpawnScriptNow \{go_through_using_guitar_text}
	SpawnScriptNow \{check_for_any_input
		Params = {
			use_primary_controller
			button1 = Start
			button2 = X
		}}
	return \{play_sound = 0}
endscript

script destroy_using_guitar_controller_menu 
	destroy_menu \{menu_id = ugc_container}
	destroy_menu_backdrop
	KillSpawnedScript \{Name = go_through_using_guitar_text}
	KillSpawnedScript \{Name = check_for_any_input}
endscript

script go_through_using_guitar_text 
	max_width = 200
	begin
	if ScreenElementExists \{Id = bg_helper}
		SetScreenElementProps \{Id = bg_helper
			Pos = (406.0, 135.0)}
	endif
	if ScreenElementExists \{Id = bg_helper_text}
		SetScreenElementProps \{Id = bg_helper_text
			Pos = (407.0, 130.0)
			Text = "1) STRAP ON"}
		GetScreenElementDims \{Id = bg_helper_text}
		SetScreenElementProps \{Id = bg_helper_text
			Scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle Id = bg_helper_text Dims = (<max_width> * (1.0, 0.0) + <Height> * (0.0, 1.0))
		else
			SetScreenElementProps \{Id = bg_helper_text
				Scale = 0.5}
		endif
	endif
	Wait \{2
		Seconds}
	if ScreenElementExists \{Id = bg_helper}
		SetScreenElementProps \{Id = bg_helper
			Pos = (639.0, 135.0)}
	endif
	if ScreenElementExists \{Id = bg_helper_text}
		SetScreenElementProps \{Id = bg_helper_text
			Pos = (640.0, 130.0)
			Text = "2) BANG HEAD"}
		GetScreenElementDims \{Id = bg_helper_text}
		SetScreenElementProps \{Id = bg_helper_text
			Scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle Id = bg_helper_text Dims = (<max_width> * (1.0, 0.0) + <Height> * (0.0, 1.0))
		else
			SetScreenElementProps \{Id = bg_helper_text
				Scale = 0.5}
		endif
	endif
	Wait \{2
		Seconds}
	if ScreenElementExists \{Id = bg_helper}
		SetScreenElementProps \{Id = bg_helper
			Pos = (872.0, 135.0)}
	endif
	if ScreenElementExists \{Id = bg_helper_text}
		SetScreenElementProps \{Id = bg_helper_text
			Pos = (873.0, 130.0)
			Text = "3) LOSE CONTROL"}
		GetScreenElementDims \{Id = bg_helper_text}
		SetScreenElementProps \{Id = bg_helper_text
			Scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle Id = bg_helper_text Dims = (<max_width> * (1.0, 0.0) + <Height> * (0.0, 1.0))
		else
			SetScreenElementProps \{Id = bg_helper_text
				Scale = 0.5}
		endif
	endif
	Wait \{2
		Seconds}
	repeat
endscript

script menu_using_guitar_controller_add_text_start 
	text1 = "START"
	text1_pos = (805.0, 585.0)
	text2 = "button"
	text2_pos = (805.0, 618.0)
	CreateScreenElement {
		Type = TextElement
		Text = <text1>
		Pos = <text1_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [RIGHT Top]
		Scale = (0.7, 0.7)
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 80)
		extra_space = (<width> - 80)
		GetScreenElementProps Id = <Id>
		SetScreenElementProps Id = <Id> Pos = (<Pos> - <extra_space> * (0.5, 0.0))
	endif
	CreateScreenElement {
		Type = TextElement
		Text = <text2>
		Pos = <text2_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [RIGHT Top]
		Scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_back 
	text1 = "BACK"
	text1_pos = (460.0, 582.0)
	text2 = "Red Button"
	text2_pos = (460.0, 615.0)
	GetEnterButtonAssignment
	if (<assignment> = CIRCLE)
		text1 = "CONTINUE"
		text1_pos = (460.0, 582.0)
		text2 = "Red Button"
		text2_pos = (460.0, 615.0)
	endif
	CreateScreenElement {
		Type = TextElement
		Text = <text1>
		Pos = <text1_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [LEFT Top]
		Scale = (0.7, 0.7)
	}
	CreateScreenElement {
		Type = TextElement
		Text = <text2>
		Pos = <text2_pos>
		PARENT = ugc_container
		rgba = [165 70 70 255]
		font = ($menu_using_guitar_controller_font)
		just = [LEFT Top]
		Scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_continue 
	text1 = "CONTINUE"
	text1_pos = (390.0, 582.0)
	text2 = "Green Button"
	text2_pos = (390.0, 615.0)
	GetEnterButtonAssignment
	if (<assignment> = CIRCLE)
		text1 = "BACK"
		text1_pos = (390.0, 582.0)
		text2 = "Green Button"
		text2_pos = (390.0, 615.0)
	endif
	CreateScreenElement {
		Type = TextElement
		Text = <text1>
		Pos = <text1_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [RIGHT Top]
		Scale = (0.7, 0.7)
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 125)
		extra_space = (<width> - 125)
		GetScreenElementProps Id = <Id>
		SetScreenElementProps Id = <Id> Pos = (<Pos> - <extra_space> * (0.5, 0.0))
	endif
	CreateScreenElement {
		Type = TextElement
		Text = <text2>
		Pos = <text2_pos>
		PARENT = ugc_container
		rgba = [80 145 105 255]
		font = ($menu_using_guitar_controller_font)
		just = [RIGHT Top]
		Scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_up_down 
	text1 = "UP/DOWN"
	text1_pos = (590.0, 390.0)
	text2 = "Strum Bar"
	text2_pos = (590.0, 423.0)
	CreateScreenElement {
		Type = TextElement
		Text = <text1>
		Pos = <text1_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Center Top]
		Scale = (0.7, 0.7)
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 180)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		Text = <text2>
		Pos = <text2_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Center Top]
		Scale = 0.6
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 180)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
endscript

script menu_using_guitar_controller_add_text_tilt_starpower 
	text1 = "TILT UP"
	text1_pos = (300.0, 390.0)
	text2 = "for Star Power"
	text2_pos = (300.0, 423.0)
	CreateScreenElement {
		Type = TextElement
		Text = <text1>
		Pos = <text1_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [LEFT Top]
		Scale = (0.7, 0.7)
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 180)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		Text = <text2>
		Pos = <text2_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [LEFT Top]
		Scale = 0.6
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 180)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	CreateScreenElement \{Type = SpriteElement
		PARENT = ugc_container
		texture = boot_usingGuitar_arrow
		Pos = (270.0, 460.0)
		just = [
			RIGHT
			Center
		]}
endscript

script menu_using_guitar_controller_add_text_header 
	text1 = "IN THE EVENT OF ROCK"
	text1_pos = (660.0, 55.0)
	text2 = "USING THE GUITAR CONTROLLER"
	text2_pos = (660.0, 95.0)
	CreateScreenElement {
		Type = TextElement
		Text = <text1>
		Pos = <text1_pos>
		PARENT = ugc_container
		rgba = [100 110 145 255]
		font = ($menu_using_guitar_controller_font)
		just = [Center Top]
		Scale = (1.4, 1.0)
	}
	CreateScreenElement {
		Type = TextElement
		Text = <text2>
		Pos = <text2_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Center Top]
		Scale = (0.9, 0.7)
	}
endscript
