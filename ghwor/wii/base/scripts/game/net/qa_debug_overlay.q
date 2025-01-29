qa_debug_overlay_container_pos = (50.0, 30.0)
qa_debug_overlay_backgroundsize = (1180.0, 660.0)
qa_debug_overlay_text_font = fontgrid_text_a1
qa_debug_overlay_text_color1 = [
	255
	255
	255
	255
]
qa_debug_overlay_text_color2 = [
	255
	255
	0
	255
]
qa_debug_overlay_text_scale1 = (0.6, 0.6)
qa_debug_overlay_text_scale2 = (0.4, 0.4)
qa_debug_overlay_just = [
	left
	top
]

script qa_debug_overlay 
	qa_debug_overlay_create
endscript

script qa_debug_overlay_create 
	qa_debug_overlay_destroy
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		Pos = ($qa_debug_overlay_container_pos)
		just = ($qa_debug_overlay_just)
		id = qa_debug_overlay_root_id
	}
	CreateScreenElement \{Type = SpriteElement
		parent = qa_debug_overlay_root_id
		texture = white
		dims = (0.0, 0.0)
		rgba = [
			0
			0
			0
			64
		]
		Pos = (0.0, 0.0)
		z_priority = 10000
		id = qa_debug_overlay_background_id}
	CreateScreenElement {
		Type = TextElement
		parent = qa_debug_overlay_root_id
		font = ($qa_debug_overlay_text_font)
		Scale = ($qa_debug_overlay_text_scale1)
		just = ($qa_debug_overlay_just)
		Pos = (0.0, 0.0)
		z_priority = 10001
		rgba = ($qa_debug_overlay_text_color1)
		id = qa_debug_overlay_title_id
	}
	CreateScreenElement {
		Type = TextElement
		parent = qa_debug_overlay_root_id
		font = ($qa_debug_overlay_text_font)
		text = qs(0x00000000)
		Scale = ($qa_debug_overlay_text_scale2)
		just = ($qa_debug_overlay_just)
		Pos = (0.0, 0.0)
		dims = (1180.0, 660.0)
		z_priority = 10001
		rgba = ($qa_debug_overlay_text_color2)
		id = qa_debug_overlay_text_id
		single_line = FALSE
	}
	RunScriptOnScreenElement \{id = qa_debug_overlay_root_id
		qa_debug_overlay_task}
endscript

script qa_debug_overlay_destroy 
	if ScreenElementExists \{id = qa_debug_overlay_root_id}
		DestroyScreenElement \{id = qa_debug_overlay_root_id}
	endif
endscript

script qa_debug_overlay_loop 
	begin
	if ScreenElementExists \{id = qa_debug_overlay_root_id}
		qa_debug_overlay_root_id :se_setprops \{alpha = 1.0
			time = 0.5}
		getqadebugoverlayinfo
		if ScreenElementExists \{id = qa_debug_overlay_text_id}
			if NOT GotParam \{text}
				<text> = qs(0x00000000)
			endif
			qa_debug_overlay_text_id :se_setprops text = <text>
		endif
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script qa_debug_overlay_task 
	qa_debug_overlay_loop
	qa_debug_overlay_destroy
endscript
