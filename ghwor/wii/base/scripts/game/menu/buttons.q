button_array = [
	qs(0x3bf547a6)
	qs(0x22ee76e7)
	qs(0x09c32524)
	qs(0x10d81465)
	qs(0x5f9982a2)
	qs(0x4682b3e3)
	qs(0x6dafe020)
	qs(0x74b4d161)
	qs(0xf32ccdae)
	qs(0xea37fcef)
	qs(0x98552bb3)
	qs(0xb3787870)
	qs(0xaa634931)
	qs(0xe522dff6)
	qs(0xfc39eeb7)
	qs(0xd714bd74)
	qs(0xce0f8c35)
	qs(0x499790fa)
	qs(0x508ca1bb)
	qs(0x7ba1f278)
	qs(0x62bac339)
	qs(0x2dfb55fe)
]
meta_array = [
	qs(0x3bf547a6)
	qs(0x22ee76e7)
	qs(0x09c32524)
	qs(0x10d81465)
	qs(0x5f9982a2)
	qs(0x4682b3e3)
	qs(0x6dafe020)
	qs(0x74b4d161)
	qs(0xf32ccdae)
	qs(0xea37fcef)
	qs(0x98552bb3)
	qs(0xb3787870)
	qs(0xaa634931)
	qs(0xe522dff6)
	qs(0xfc39eeb7)
	qs(0xd714bd74)
	qs(0xce0f8c35)
	qs(0x499790fa)
	qs(0x508ca1bb)
	qs(0x7ba1f278)
	qs(0x62bac339)
	qs(0x2dfb55fe)
	qs(0x34e064bf)
	qs(0x1fcd377c)
	qs(0x06d6063d)
	qs(0xcb8c08a3)
	qs(0xd29739e2)
	qs(0xf9ba6a21)
	qs(0xe0a15b60)
	qs(0xafe0cda7)
	qs(0xb6fbfce6)
	qs(0x9dd6af25)
]

script debug_show_buttons \{Scale = 0.8
		z_priority = 100
		padding_scale = 1.5}
	SetScreenElementLock \{OFF
		id = root_window}
	if ScreenElementExists \{id = button_container}
		DestroyScreenElement \{id = button_container}
		return
	endif
	getdebugfont
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = button_container
		Pos = (320.0, 240.0)
		dims = (640.0, 480.0)
		event_handlers = [
			{
				pad_back
				debug_kill_buttons
				params = {
				}
			}
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = button_container
		texture = white2
		rgba = [
			0
			0
			0
			100
		]
		Scale = (80.0, 30.0)
		Pos = (320.0, 210.0)}
	CreateScreenElement {
		Type = TextElement
		parent = button_container
		text = qs(0xb9c45090)
		font = <debug_font>
		Scale = 1
		Pos = (320.0, 120.0)
		z_priority = 101
	}
	CreateScreenElement {
		Type = HMenu
		parent = button_container
		id = debug_buttons
		Pos = (320.0, 160.0)
		just = [center bottom]
		internal_just = [left center]
		padding_scale = <padding_scale>
		spacing_between = <spacing_between>
		Scale = <Scale>
		z_priority = <z_priority>
	}
	GetArraySize \{$button_array}
	index = 0
	begin
	formatText TextName = text qs(0xc31d83ea) i = ($button_array [<index>])
	formatText TextName = button qs(0x5dbb0e09) i = ($button_array [<index>])
	create_debug_button_item text = <text> button = <button> parent = debug_buttons
	index = (<index> + 1)
	repeat <array_Size>
	CreateScreenElement {
		Type = TextElement
		parent = button_container
		text = qs(0x36ac0bef)
		font = <debug_font>
		Scale = 1
		Pos = (320.0, 200.0)
		z_priority = 101
	}
	CreateScreenElement {
		Type = HMenu
		parent = button_container
		id = debug_meta1
		Pos = (320.0, 240.0)
		just = [center bottom]
		internal_just = [left center]
		padding_scale = <padding_scale>
		spacing_between = <spacing_between>
		Scale = <Scale>
		z_priority = <z_priority>
	}
	GetArraySize \{$meta_array}
	index = 0
	begin
	formatText TextName = text qs(0xc31d83ea) i = ($meta_array [<index>])
	formatText TextName = button qs(0xacedbcdc) i = ($meta_array [<index>])
	create_debug_button_item text = <text> button = <button> parent = debug_meta1
	index = (<index> + 1)
	repeat 16
	CreateScreenElement {
		Type = HMenu
		parent = button_container
		id = debug_meta2
		Pos = (320.0, 280.0)
		just = [center bottom]
		internal_just = [left center]
		padding_scale = <padding_scale>
		spacing_between = <spacing_between>
		Scale = <Scale>
		z_priority = <z_priority>
	}
	begin
	formatText TextName = text qs(0xc31d83ea) i = ($meta_array [<index>])
	formatText TextName = button qs(0xacedbcdc) i = ($meta_array [<index>])
	create_debug_button_item text = <text> button = <button> parent = debug_meta2
	index = (<index> + 1)
	repeat (<array_Size> -16)
	LaunchEvent \{Type = focus
		target = button_container}
endscript

script create_debug_button_item 
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		Pos = (0.0, 0.0)
		dims = (20.0, 20.0)
		internal_just = [center center]
		just = [center center]
	}
	parent_id = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <parent_id>
		text = <text>
		font = <debug_font>
		Pos = (0.0, 0.0)
		just = [center center]
	}
	CreateScreenElement {
		Type = TextElement
		parent = <parent_id>
		text = <button>
		font = <debug_font>
		Pos = (0.0, 15.0)
		just = [center center]
	}
	GetScreenElementDims id = <id>
	if GotParam \{width}
		if (<width> > 30)
			SetScreenElementProps id = <parent_id> dims = (55.0, 20.0)
			SetScreenElementProps id = <id> Pos = (15.0, 15.0)
		endif
	endif
endscript

script debug_kill_buttons 
	if ScreenElementExists \{id = button_container}
		DestroyScreenElement \{id = button_container}
	endif
endscript
