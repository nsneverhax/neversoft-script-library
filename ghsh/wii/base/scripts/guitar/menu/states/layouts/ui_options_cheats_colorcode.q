
script ui_create_options_cheats_colorcode 
	printf \{channel = ggl
		qs(0x1d77f88e)}
	CreateScreenElement \{parent = root_window
		id = ntsc_colorscreen
		Type = ContainerElement
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		event_handlers = [
			{
				pad_choose
				generic_event_back
				state = uistate_options_cheats
			}
			{
				pad_back
				generic_event_back
				state = uistate_options_cheats
			}
			{
				pad_option
				generic_event_back
				state = uistate_options_cheats
			}
			{
				pad_option2
				generic_event_back
				state = uistate_options_cheats
			}
		]}
	CreateScreenElement \{parent = ntsc_colorscreen
		id = ntsc_colorscreen_img
		Type = SpriteElement
		texture = ntsc_colorscreen
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)}
	LaunchEvent \{Type = focus
		target = ntsc_colorscreen}
	clean_up_user_control_helpers
endscript

script qwertyuiopf 
	printf \{channel = ggl
		qs(0x61506006)}
endscript

script ui_destroy_options_cheats_colorcode 
	DestroyScreenElement \{id = ntsc_colorscreen}
	printf \{channel = ggl
		qs(0x52d97309)}
endscript

script ui_options_cheats_colorcode_back 
	printf \{channel = ggl
		qs(0xc721588b)}
endscript
