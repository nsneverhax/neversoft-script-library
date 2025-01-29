menu_using_guitar_controller_font = text_a4
menu_using_guitar_controller_kb = 1

script create_using_guitar_controller_menu \{keyboard = 0}
	if ($current_difficulty != beginner && $current_difficulty2 != beginner && $current_difficulty != easy && $current_difficulty2 != easy)
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = continue
			}}
		return
	endif
	Change menu_using_guitar_controller_kb = <keyboard>
	create_menu_backdrop \{texture = boot_usingGuitar_BG}
	using_guitar_controller_event_handlers = [
		{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
	]
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = ugc_container
		Pos = (0.0, 0.0)
		event_handlers = <using_guitar_controller_event_handlers>
		exclusive_device = None
	}
	LaunchEvent \{Type = focus
		target = ugc_container}
	guitar_tex = boot_usingGuitar_gtr_LesPaul
	GetPlatform
	switch <Platform>
		case PS3
		<guitar_tex> = boot_usingGuitar_gtr_LesPaul_PS3
	endswitch
	if ($menu_using_guitar_controller_kb = 1)
		if NotIsMacPort
			guitar_tex = boot_usingKeyboard
			if German
				guitar_tex = boot_usingKeyboard_g
			elseif French
				guitar_tex = boot_usingKeyboard_f
			elseif Italian
				guitar_tex = boot_usingKeyboard_i
			elseif Spanish
				guitar_tex = boot_usingKeyboard_s
			elseif korean
				guitar_tex = boot_usingKeyboard_k
			endif
		else
			guitar_tex = boot_usingMacKeyboard
			if German
				guitar_tex = boot_usingMacKeyboard_g
			elseif French
				guitar_tex = boot_usingMacKeyboard_f
			elseif Italian
				guitar_tex = boot_usingMacKeyboard_i
			elseif Spanish
				guitar_tex = boot_usingMacKeyboard_s
			endif
		endif
	endif
	if ($menu_using_guitar_controller_kb = 1)
		displaySprite parent = ugc_container tex = <guitar_tex> Pos = (665.0, 510.0) just = [center center] z = 1 Scale = (1.2, 1.2)
		displaySprite \{parent = ugc_container
			tex = boot_usingKeyboard_illo
			Pos = (640.0, 240.0)
			just = [
				center
				center
			]
			z = 1}
	else
		displaySprite parent = ugc_container tex = <guitar_tex> Pos = (660.0, 530.0) just = [center center] z = 1
		displaySprite \{parent = ugc_container
			tex = boot_usingGuitar_illo
			Pos = (640.0, 270.0)
			just = [
				center
				center
			]
			z = 1}
	endif
	displaySprite \{parent = ugc_container
		id = bg_helper
		tex = white
		rgba = [
			83
			95
			147
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
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SKIP"
		button = green
		z = 100}
	if ($menu_using_guitar_controller_kb = 0)
		menu_using_guitar_controller_add_text_back
		menu_using_guitar_controller_add_text_continue
		menu_using_guitar_controller_add_text_up_down
		menu_using_guitar_controller_add_text_tilt_starpower
		menu_using_guitar_controller_add_text_beginner_p1
		menu_using_guitar_controller_add_text_beginner_p2
	endif
	menu_using_guitar_controller_add_text_header
	SpawnScriptNow \{go_through_using_guitar_text}
	spawnscript \{using_guitar_controller_watch_timer}
	return \{play_sound = 0}
endscript

script destroy_using_guitar_controller_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = ugc_container}
	destroy_menu_backdrop
	KillSpawnedScript \{Name = using_guitar_controller_watch_timer}
	KillSpawnedScript \{Name = go_through_using_guitar_text}
endscript

script go_through_using_guitar_text 
	max_width = 200
	begin
	if ScreenElementExists \{id = bg_helper}
		SetScreenElementProps \{id = bg_helper
			Pos = (406.0, 135.0)}
	endif
	if ScreenElementExists \{id = bg_helper_text}
		if ($menu_using_guitar_controller_kb = 1)
			SetScreenElementProps \{id = bg_helper_text
				Pos = (407.0, 130.0)
				text = "1) BOOT UP"}
		else
			SetScreenElementProps \{id = bg_helper_text
				Pos = (407.0, 130.0)
				text = "1) STRAP ON"}
		endif
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
			Pos = (640.0, 130.0)
			text = "2) BANG HEAD"}
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
			Pos = (873.0, 130.0)
			text = "3) LOSE CONTROL"}
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
	text1 = "START"
	text1_pos = (785.0, 594.0)
	text2 = "button"
	text2_pos = (785.0, 627.0)
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
		Scale = (0.5, 0.5)
	}
endscript

script menu_using_guitar_controller_add_text_back 
	text1 = "FRET BUTTONS"
	text1_pos = (459.0, 582.0)
	text2 = "Hold as notes pass"
	text2_pos = (459.0, 615.0)
	GetEnterButtonAssignment
	if (<assignment> = circle)
		text1 = "CONTINUE"
		text1_pos = (459.0, 592.0)
		text2 = "Red Button"
		text2_pos = (459.0, 625.0)
	endif
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
		rgba = [70 70 70 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		Scale = (0.5, 0.5)
	}
endscript

script menu_using_guitar_controller_add_text_continue 
	text1 = "CONTINUE"
	text1_pos = (397.0, 582.0)
	text2 = "Green Button"
	text2_pos = (397.0, 615.0)
	GetEnterButtonAssignment
	if (<assignment> = circle)
		text1 = "BACK"
		text1_pos = (397.0, 592.0)
		text2 = "Green Button"
		text2_pos = (397.0, 625.0)
	endif
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
	CreateScreenElement {
		Type = TextElement
		text = <text2>
		Pos = <text2_pos>
		parent = ugc_container
		rgba = [80 145 105 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		Scale = (0.5, 0.5)
	}
endscript

script menu_using_guitar_controller_add_text_up_down 
	text1 = "UP/DOWN"
	text1_pos = (580.0, 409.0)
	text2 = "Strum in time with notes"
	text2_pos = (580.0, 442.0)
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
	CreateScreenElement {
		Type = TextElement
		text = <text2>
		Pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		Scale = (0.5, 0.5)
	}
endscript

script menu_using_guitar_controller_add_text_tilt_starpower 
	text1 = "TILT UP"
	text1_pos = (350.0, 409.0)
	text2 = "for Star Power"
	text2_pos = (350.0, 442.0)
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
	CreateScreenElement {
		Type = TextElement
		text = <text2>
		Pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		Scale = (0.5, 0.5)
	}
	CreateScreenElement \{Type = SpriteElement
		parent = ugc_container
		texture = boot_usingGuitar_arrow
		Pos = (275.0, 480.0)
		just = [
			right
			center
		]}
endscript

script menu_using_guitar_controller_add_text_beginner_p1 
	if ($current_difficulty != beginner || $active_continue_player = 2)
		return
	endif
	CreateScreenElement \{Type = SpriteElement
		texture = menu_pause_frame_banner
		parent = ugc_container
		just = [
			center
			center
		]
		z_priority = 99.0
		Pos = (148.0, 45.0)
		Scale = (1.05, 0.9)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			center
			center
		]
		Scale = (0.45000002, 0.5)
		rgba = [
			210
			210
			210
			250
		]
		z_priority = 100.0
		text = "BEGINNER MODE"
		Pos = (148.0, 16.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			center
			center
		]
		Scale = (0.45000002, 0.5)
		rgba = [
			210
			210
			210
			250
		]
		z_priority = 100.0
		text = "DON'T FRET, STRUM"
		Pos = (148.0, 36.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			left
			center
		]
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			250
		]
		z_priority = 100.0
		text = "Ignore the fret buttons"
		Pos = (46.0, 96.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			left
			center
		]
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			250
		]
		z_priority = 100.0
		text = "for now, just press"
		Pos = (46.0, 116.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			left
			center
		]
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			250
		]
		z_priority = 100.0
		text = "the strum bar UP or"
		Pos = (46.0, 136.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			left
			center
		]
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			250
		]
		z_priority = 100.0
		text = "DOWN in time with the"
		Pos = (46.0, 156.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			left
			center
		]
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			250
		]
		z_priority = 100.0
		text = "notes falling on screen"
		Pos = (46.0, 176.0)}
endscript

script menu_using_guitar_controller_add_text_beginner_p2 
	if ($current_difficulty2 != beginner || $active_continue_player = 1)
		return
	endif
	CreateScreenElement \{Type = SpriteElement
		texture = menu_pause_frame_banner
		parent = ugc_container
		just = [
			center
			center
		]
		z_priority = 99.0
		Pos = (1132.0, 45.0)
		Scale = (1.05, 0.9)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			center
			center
		]
		Scale = (0.45000002, 0.5)
		rgba = [
			210
			210
			210
			250
		]
		z_priority = 100.0
		text = "BEGINNER MODE"
		Pos = (1132.0, 16.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			center
			center
		]
		Scale = (0.45000002, 0.5)
		rgba = [
			210
			210
			210
			250
		]
		z_priority = 100.0
		text = "DON'T FRET, STRUM"
		Pos = (1132.0, 36.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			left
			center
		]
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			250
		]
		z_priority = 100.0
		text = "Ignore the fret buttons"
		Pos = (1030.0, 96.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			left
			center
		]
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			250
		]
		z_priority = 100.0
		text = "for now, just press"
		Pos = (1030.0, 116.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			left
			center
		]
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			250
		]
		z_priority = 100.0
		text = "the strum bar UP or"
		Pos = (1030.0, 136.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			left
			center
		]
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			250
		]
		z_priority = 100.0
		text = "DOWN in time with the"
		Pos = (1030.0, 156.0)}
	CreateScreenElement \{Type = TextElement
		parent = ugc_container
		font = text_a4
		just = [
			left
			center
		]
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			250
		]
		z_priority = 100.0
		text = "notes falling on screen"
		Pos = (1030.0, 176.0)}
endscript

script menu_using_guitar_controller_add_text_header 
	text1 = "IN THE EVENT OF ROCK"
	text1_pos = (660.0, 55.0)
	if ($menu_using_guitar_controller_kb = 1)
		text2 = "USING THE KEYBOARD AND MOUSE"
	else
		text2 = "USING THE GUITAR CONTROLLER"
	endif
	text2_pos = (660.0, 95.0)
	CreateScreenElement {
		Type = TextElement
		text = <text1>
		Pos = <text1_pos>
		parent = ugc_container
		rgba = [100 110 145 255]
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

script using_guitar_controller_watch_timer \{Timer = 5
		warning = 0}
	SpawnScriptNow set_countdown_timer params = {timer_value = <Timer> warning_val = <warning>}
	hide_countdown_timer
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		break
	endif
	Wait \{1
		Second}
	repeat
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = continue
		}}
endscript
