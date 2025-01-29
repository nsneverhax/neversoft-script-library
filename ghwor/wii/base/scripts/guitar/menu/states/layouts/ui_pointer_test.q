
script ui_create_pointer_test 
	SpawnScriptNow \{menu_music_on}
	pointer_start_polling \{controller = 0}
	CreateScreenElement \{Type = ContainerElement
		id = pointer_test_container
		parent = root_window
		rgba = [
			255
			255
			255
			255
		]
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_back
				generic_event_back
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = pointer_test_container
		font = fontgrid_title_a1
		Scale = 0.75
		rgba = [
			255
			255
			255
			255
		]
		text = qs(0x689be793)
		just = [
			center
			top
		]
		z_priority = 1
		Pos = (640.0, 0.0)}
	CreateScreenElement \{Type = TextElement
		parent = pointer_test_container
		id = info_line
		font = fontgrid_text_a1
		Scale = 1.0
		rgba = [
			255
			255
			255
			255
		]
		text = qs(0x959102ed)
		just = [
			center
			top
		]
		z_priority = 1
		Pos = (640.0, 560.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = pointer_test_container
		id = blue_button
		texture = guitar_square_lg
		alpha = 1.0
		dims = (256.0, 256.0)
		just = [
			center
			center
		]
		Pos = (200.0, 360.0)
		z_priority = 1000
		rgba = [
			255
			255
			255
			255
		]
		event_handlers = [
			{
				pad_click
				pointer_test_blue_clicked
			}
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = pointer_test_container
		id = red_button
		texture = bass_square_lg
		alpha = 1.0
		dims = (256.0, 256.0)
		just = [
			center
			center
		]
		Pos = (1052.0, 360.0)
		z_priority = 1000
		rgba = [
			255
			255
			255
			255
		]
		event_handlers = [
			{
				pad_click
				pointer_test_red_clicked
			}
		]}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10
		pad_click_script = generic_event_back}
	LaunchEvent \{Type = focus
		target = pointer_test_container}
endscript

script pointer_test_blue_clicked 
	KillSpawnedScript \{Name = pointer_test_info_line_reset}
	if ScreenElementExists \{id = info_line}
		info_line :se_setprops \{text = qs(0x4f10948d)}
		SpawnScriptNow \{pointer_test_info_line_reset}
	endif
endscript

script pointer_test_red_clicked 
	KillSpawnedScript \{Name = pointer_test_info_line_reset}
	if ScreenElementExists \{id = info_line}
		info_line :se_setprops \{text = qs(0x890ec651)}
		SpawnScriptNow \{pointer_test_info_line_reset}
	endif
endscript

script pointer_test_info_line_reset 
	Wait \{5
		Seconds}
	if ScreenElementExists \{id = info_line}
		info_line :se_setprops \{text = qs(0x959102ed)}
	endif
endscript

script ui_destroy_pointer_test 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = pointer_test_container}
endscript
