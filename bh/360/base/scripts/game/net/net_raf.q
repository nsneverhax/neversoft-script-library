rafoverlay_container_pos = (50.0, 30.0)
rafoverlay_backgroundsize = (1180.0, 660.0)
rafoverlay_text_font = fontgrid_text_A1
rafoverlay_text_color1 = [
	255
	255
	255
	255
]
rafoverlay_text_color2 = [
	255
	255
	0
	255
]
rafoverlay_text_scale1 = (0.7, 0.7)
rafoverlay_text_scale2 = (0.4, 0.4)
rafoverlay_just = [
	left
	top
]

script rafoverlay 
	rafoverlay_create
endscript

script rafoverlay_create 
	rafoverlay_destroy
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		Pos = $rafoverlay_container_pos
		just = $rafoverlay_just
		id = rafoverlay_root_id}
	CreateScreenElement \{type = SpriteElement
		parent = rafoverlay_root_id
		texture = white
		dims = (1180.0, 660.0)
		rgba = [
			0
			0
			0
			64
		]
		Pos = (590.0, 330.0)
		z_priority = 10000
		id = rafoverlay_background_id}
	CreateScreenElement \{type = TextElement
		parent = rafoverlay_root_id
		font = $rafoverlay_text_font
		text = qs(0x65e710ac)
		scale = $rafoverlay_text_scale1
		just = $rafoverlay_just
		Pos = (0.0, 0.0)
		z_priority = 10001
		rgba = $rafoverlay_text_color1
		id = rafoverlay_title_id}
	CreateScreenElement \{type = TextElement
		parent = rafoverlay_root_id
		font = $rafoverlay_text_font
		text = qs(0x00000000)
		scale = $rafoverlay_text_scale2
		just = $rafoverlay_just
		Pos = (0.0, 50.0)
		dims = (1180.0, 660.0)
		z_priority = 10001
		rgba = $rafoverlay_text_color2
		id = rafoverlay_text_id
		single_line = false}
	RunScriptOnScreenElement \{id = rafoverlay_root_id
		rafoverlay_task}
endscript

script rafoverlay_destroy 
	if ScreenElementExists \{id = rafoverlay_root_id}
		DestroyScreenElement \{id = rafoverlay_root_id}
	endif
endscript

script rafoverlay_loop 
	begin
	if NetSessionFunc \{Obj = raf
			func = israfoverlaydone}
		break
	endif
	if ScreenElementExists \{id = rafoverlay_root_id}
		if NetSessionFunc \{Obj = raf
				func = israfoverlayoktodisplay}
			rafoverlay_root_id :SE_SetProps \{alpha = 1.0
				time = 0.5}
			NetSessionFunc \{Obj = raf
				func = getrafoverlayinfo}
			if ScreenElementExists \{id = rafoverlay_text_id}
				if NOT GotParam \{text}
					<text> = qs(0x00000000)
				endif
				rafoverlay_text_id :SE_SetProps text = <text>
			endif
		else
			rafoverlay_root_id :SE_SetProps \{alpha = 0.0
				time = 0.5}
		endif
	else
		NetSessionFunc \{Obj = raf
			func = getrafoverlayinfo}
		if ScreenElementExists \{id = rafoverlay_text_id}
			if NOT GotParam \{text}
				<text> = qs(0x00000000)
			endif
			rafoverlay_text_id :SE_SetProps text = <text>
		endif
	endif
	wait \{0.1
		seconds}
	repeat
endscript

script rafoverlay_task 
	rafoverlay_loop
	rafoverlay_destroy
endscript
