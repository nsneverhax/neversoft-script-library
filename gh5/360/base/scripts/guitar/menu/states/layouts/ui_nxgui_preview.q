
script ui_create_nxgui_preview 
	CreateScreenElement \{id = nxgui_preview_container
		Type = ContainerElement
		parent = root_window
		Pos = (100.0, 80.0)
		just = [
			left
			top
		]
		z_priority = 10000
		event_handlers = [
			{
				pad_choose
				ui_nxgui_preview_exit
			}
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = nxgui_preview_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		texture = white
		dims = (1050.0, 600.0)
		rgba = [
			0
			0
			0
			255
		]
		alpha = 0.65000004
		z_priority = 10000}
	CreateScreenElement \{Type = TextBlockElement
		parent = nxgui_preview_container
		font = fontgrid_text_a1
		text = [
			qs(0x7f419412)
			qs(0x29ce8259)
		]
		internal_scale = 0.65000004
		dims = (1050.0, 600.0)
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)}
	LaunchEvent \{Type = focus
		target = nxgui_preview_container}
endscript

script ui_destroy_nxgui_preview 
	DestroyScreenElement \{id = nxgui_preview_container}
endscript

script ui_nxgui_preview_exit 
	ui_event \{event = menu_change
		data = {
			state = uistate_null
		}}
endscript
