menu_using_guitar_controller_font = text_a4

script create_using_guitar_controller_menu 
	create_menu_backdrop \{texture = boot_usingGuitar_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = ugc_container
		Pos = (0.0, 0.0)}
	guitar_tex = boot_usingGuitar_gtr_LesPaul
	GetPlatform
	switch <Platform>
		case PS3
		<guitar_tex> = boot_usingGuitar_gtr_LesPaul_PS3
		case PS2
		<guitar_tex> = 0x0438e89f
	endswitch
	displaySprite parent = ugc_container tex = <guitar_tex> Pos = (640.0, 515.0) just = [center center] z = 1 Scale = 1.9
	displaySprite \{parent = ugc_container
		tex = boot_usingGuitar_illo
		Pos = (640.0, 270.0)
		just = [
			center
			center
		]
		z = 1
		Scale = 2}
	displaySprite \{parent = ugc_container
		id = bg_helper
		tex = white
		rgba = [
			0
			0
			0
			255
		]
		dims = (221.0, 40.0)
		just = [
			center
			top
		]
		z = 0.5}
	displayText \{parent = ugc_container
		id = bg_helper_text
		font = text_a4
		rgba = [
			223
			223
			223
			255
		]
		Scale = 0.5
		just = [
			center
			top
		]
		z = 0.6
		noshadow}
	menu_using_guitar_controller_add_text_start
	menu_using_guitar_controller_add_text_back
	menu_using_guitar_controller_add_text_continue
	menu_using_guitar_controller_add_text_up_down
	menu_using_guitar_controller_add_text_tilt_starpower
	menu_using_guitar_controller_add_text_header
	SpawnScriptNow \{go_through_using_guitar_text}
	SpawnScriptNow \{check_for_any_input
		params = {
			mode = StartAndA
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
	if ScreenElementExists \{id = bg_helper}
		SetScreenElementProps \{id = bg_helper
			Pos = (406.0, 135.0)}
	endif
	if ScreenElementExists \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			Pos = (407.0, 133.0)
			text = '1) STRAP'}
		GetScreenElementDims \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			Scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle id = bg_helper_text dims = (<max_width> * (1.0, 0.0) + <height> * (0.0, 1.0))
		else
			SetScreenElementProps \{id = bg_helper_text
				Scale = 0.5}
		endif
	endif
	Wait \{2
		Seconds}
	if ScreenElementExists \{id = bg_helper}
		SetScreenElementProps \{id = bg_helper
			Pos = (639.0, 135.0)}
	endif
	if ScreenElementExists \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			Pos = (640.0, 133.0)
			text = '2) LOCK'}
		GetScreenElementDims \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			Scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle id = bg_helper_text dims = (<max_width> * (1.0, 0.0) + <height> * (0.0, 1.0))
		else
			SetScreenElementProps \{id = bg_helper_text
				Scale = 0.5}
		endif
	endif
	Wait \{2
		Seconds}
	if ScreenElementExists \{id = bg_helper}
		SetScreenElementProps \{id = bg_helper
			Pos = (872.0, 135.0)}
	endif
	if ScreenElementExists \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			Pos = (873.0, 133.0)
			text = '3) ROCK'}
		GetScreenElementDims \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			Scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle id = bg_helper_text dims = (<max_width> * (1.0, 0.0) + <height> * (0.0, 1.0))
		else
			SetScreenElementProps \{id = bg_helper_text
				Scale = 0.5}
		endif
	endif
	Wait \{2
		Seconds}
	repeat
endscript

script menu_using_guitar_controller_add_text_start 
	text1 = 'START'
	text1_pos = (0.0, 0.0)
	if Italian
		text1_pos = (866.0, 605.0)
	else
		text1_pos = (830.0, 605.0)
	endif
	text2 = 'button'
	text2_pos = (830.0, 638.0)
	0x578498ac = (0.0, 0.0)
	if Italian
		0x578498ac = (0.6, 0.7)
	else
		0x578498ac = (0.7, 0.7)
	endif
	CreateScreenElement {
		Type = TextElement
		text = <text1>
		Pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		Scale = <0x578498ac>
	}
	GetScreenElementDims id = <id>
	if (<width> > 80)
		extra_space = (<width> - 80)
		GetScreenElementProps id = <id>
		SetScreenElementProps id = <id> Pos = (<Pos> - <extra_space> * (0.5, 0.0))
	endif
	CreateScreenElement {
		Type = TextElement
		text = <text2>
		Pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		Scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_back 
	text1 = 'BACK'
	text1_pos = (455.0, 600.0)
	text2 = 'Red Button'
	text2_pos = (455.0, 633.0)
	CreateScreenElement {
		Type = TextElement
		text = <text1>
		Pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		Scale = (0.7, 0.7)
	}
	CreateScreenElement {
		Type = TextElement
		text = <text2>
		Pos = <text2_pos>
		parent = ugc_container
		rgba = [165 70 70 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		Scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_continue 
	text1 = 'CONTINUE'
	text1_pos = (385.0, 600.0)
	text2 = 'Green Button'
	text2_pos = (385.0, 633.0)
	CreateScreenElement {
		Type = TextElement
		text = <text1>
		Pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		Scale = (0.7, 0.7)
	}
	GetScreenElementDims id = <id>
	if (<width> > 125)
		extra_space = (<width> - 125)
		GetScreenElementProps id = <id>
		SetScreenElementProps id = <id> Pos = (<Pos> - <extra_space> * (0.5, 0.0))
	endif
	CreateScreenElement {
		Type = TextElement
		text = <text2>
		Pos = <text2_pos>
		parent = ugc_container
		rgba = [80 145 105 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		Scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_up_down 
	text1 = 'UP/DOWN'
	text1_pos = (590.0, 398.0)
	text2 = 'Strum Bar'
	text2_pos = (590.0, 431.0)
	CreateScreenElement {
		Type = TextElement
		text = <text1>
		Pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		Scale = (0.7, 0.7)
	}
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		text = <text2>
		Pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		Scale = 0.6
	}
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <height> * (0.0, 1.0))
	endif
endscript

script menu_using_guitar_controller_add_text_tilt_starpower 
	text1 = 'TILT UP'
	text1_pos = (300.0, 398.0)
	text2 = 'for Star Power'
	text2_pos = (300.0, 431.0)
	CreateScreenElement {
		Type = TextElement
		text = <text1>
		Pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		Scale = (0.7, 0.7)
	}
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		text = <text2>
		Pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		Scale = 0.6
	}
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement \{Type = SpriteElement
		parent = ugc_container
		texture = boot_usingGuitar_arrow
		Pos = (270.0, 460.0)
		just = [
			right
			center
		]}
endscript

script menu_using_guitar_controller_add_text_header 
	text1 = 'ROCK THIS WAY'
	text1_pos = (660.0, 55.0)
	text2 = 'USING THE GUITAR CONTROLLER'
	text2_pos = (660.0, 95.0)
	CreateScreenElement {
		Type = TextElement
		text = <text1>
		Pos = <text1_pos>
		parent = ugc_container
		rgba = [185 95 100 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		Scale = (1.4, 1.0)
	}
	CreateScreenElement {
		Type = TextElement
		text = <text2>
		Pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		Scale = (0.9, 0.7)
	}
endscript
