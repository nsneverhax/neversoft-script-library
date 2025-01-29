ps3libvoiceapioverlay_container_pos = (50.0, 50.0)
ps3libvoiceapioverlay_text_font = fontgrid_text_A1
ps3libvoiceapioverlay_text_color1 = [
	255
	255
	255
	255
]
ps3libvoiceapioverlay_text_color2 = [
	255
	255
	0
	255
]
ps3libvoiceapioverlay_text_scale1 = (1.0, 1.0)
ps3libvoiceapioverlay_text_scale2 = (0.7, 0.7)
ps3libvoiceapioverlay_just = [
	left
	top
]

script ps3libvoiceapioverlay 
	if NOT IsPS3
		return
	endif
	ps3libvoiceapioverlay_create
endscript

script ps3libvoiceapioverlay_create 
	ps3libvoiceapioverlay_destroy
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		Pos = $ps3libvoiceapioverlay_container_pos
		just = $ps3libvoiceapioverlay_just
		id = ps3libvoiceapioverlay_root_id
		Pos = (50.0, 20.0)}
	CreateScreenElement \{type = SpriteElement
		parent = ps3libvoiceapioverlay_root_id
		texture = white
		dims = (600.0, 540.0)
		rgba = [
			0
			0
			0
			192
		]
		Pos = (300.0, 270.0)
		z_priority = 10000
		id = ps3libvoiceapioverlay_background_id}
	CreateScreenElement \{type = TextElement
		parent = ps3libvoiceapioverlay_root_id
		font = $ps3libvoiceapioverlay_text_font
		text = qs(0x9ae477eb)
		scale = $ps3libvoiceapioverlay_text_scale1
		just = $ps3libvoiceapioverlay_just
		Pos = (0.0, 0.0)
		z_priority = 10001
		rgba = $ps3libvoiceapioverlay_text_color1
		id = ps3libvoiceapioverlay_title_id}
	CreateScreenElement \{type = TextElement
		parent = ps3libvoiceapioverlay_root_id
		font = $ps3libvoiceapioverlay_text_font
		text = qs(0x00000000)
		scale = $ps3libvoiceapioverlay_text_scale2
		just = $ps3libvoiceapioverlay_just
		Pos = (0.0, 50.0)
		z_priority = 10001
		rgba = $ps3libvoiceapioverlay_text_color2
		id = ps3libvoiceapioverlay_status_id}
	CreateScreenElement \{type = TextElement
		parent = ps3libvoiceapioverlay_root_id
		font = $ps3libvoiceapioverlay_text_font
		text = qs(0x00000000)
		scale = $ps3libvoiceapioverlay_text_scale2
		just = $ps3libvoiceapioverlay_just
		Pos = (0.0, 80.0)
		z_priority = 10001
		rgba = $ps3libvoiceapioverlay_text_color2
		id = ps3libvoiceapioverlay_flags_id}
	CreateScreenElement \{type = TextElement
		parent = ps3libvoiceapioverlay_root_id
		font = $ps3libvoiceapioverlay_text_font
		text = qs(0x00000000)
		scale = $ps3libvoiceapioverlay_text_scale2
		just = $ps3libvoiceapioverlay_just
		Pos = (0.0, 140.0)
		dims = (400.0, 125.0)
		z_priority = 10001
		rgba = $ps3libvoiceapioverlay_text_color2
		id = ps3libvoiceapioverlay_info_id
		single_line = false}
	RunScriptOnScreenElement \{id = ps3libvoiceapioverlay_root_id
		ps3libvoiceapioverlay_thread}
endscript

script ps3libvoiceapioverlay_destroy 
	if ScreenElementExists \{id = ps3libvoiceapioverlay_root_id}
		DestroyScreenElement \{id = ps3libvoiceapioverlay_root_id}
	endif
endscript

script ps3libvoiceapioverlay_loop 
	begin
	if NetSessionFunc \{Obj = voice
			func = is_ps3libvoiceapioverlay_done}
		break
	endif
	NetSessionFunc \{Obj = voice
		func = ps3libvoiceapioverlay_pump}
	if ScreenElementExists \{id = ps3libvoiceapioverlay_status_id}
		if NOT GotParam \{status}
			<status> = qs(0x00000000)
		endif
		SetScreenElementProps id = ps3libvoiceapioverlay_status_id text = <status>
	endif
	if ScreenElementExists \{id = ps3libvoiceapioverlay_flags_id}
		if NOT GotParam \{flags}
			<flags> = qs(0x00000000)
		endif
		SetScreenElementProps id = ps3libvoiceapioverlay_flags_id text = <flags>
	endif
	if ScreenElementExists \{id = ps3libvoiceapioverlay_info_id}
		if NOT GotParam \{info}
			<info> = qs(0x00000000)
		endif
		ps3libvoiceapioverlay_info_id :SE_SetProps text = <info>
	endif
	if ScreenElementExists \{id = ps3libvoiceapioverlay_root_id}
		if NetSessionFunc \{Obj = voice
				func = ps3libvoiceapioverlay_oktodisplay}
			ps3libvoiceapioverlay_root_id :SE_SetProps \{alpha = 1.0
				time = 0.1}
			ps3libvoiceapioverlay_root_id :SE_SetProps \{Pos = (50.0, 20.0)
				time = 0.5}
		else
			ps3libvoiceapioverlay_root_id :SE_SetProps \{alpha = 0.0
				time = 0.1}
			ps3libvoiceapioverlay_root_id :SE_SetProps \{Pos = (50.0, -440.0)
				time = 0.5}
		endif
	endif
	wait \{0.1
		seconds}
	repeat
endscript

script ps3libvoiceapioverlay_thread 
	ps3libvoiceapioverlay_loop
	ps3libvoiceapioverlay_destroy
endscript
