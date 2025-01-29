
script rafoverlay 
	spawnscript \{rafoverlay2}
endscript

script rafoverlay2 
	NetSessionFunc \{Obj = raf
		func = setrafoverlaymode
		params = {
			On
		}}
	rafoverlay_create
endscript

script rafoverlay_create 
	rafoverlay_destroy
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		Pos = (50.0, 30.0)
		just = [
			left
			top
		]
		id = rafoverlay_root_id
		z_priority = 25000}
	CreateScreenElement \{Type = SpriteElement
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
		id = rafoverlay_background_id
		z_priority = 25001}
	CreateScreenElement \{Type = TextElement
		parent = rafoverlay_root_id
		font = fontgrid_text_a1
		text = qs(0x65e710ac)
		Scale = (0.5, 0.5)
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]
		id = rafoverlay_title_id
		z_priority = 25002}
	CreateScreenElement \{Type = TextElement
		parent = rafoverlay_root_id
		font = fontgrid_text_a1
		text = qs(0x00000000)
		Scale = (0.5, 0.5)
		just = [
			left
			top
		]
		Pos = (0.0, 50.0)
		dims = (1180.0, 660.0)
		rgba = [
			255
			255
			0
			255
		]
		id = rafoverlay_text_id
		single_line = FALSE
		z_priority = 25003}
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
	if ScreenElementExists \{id = rafoverlay_root_id}
		NetSessionFunc \{Obj = raf
			func = getrafoverlayinfo}
		if ScreenElementExists \{id = rafoverlay_text_id}
			if NOT GotParam \{text}
				<text> = qs(0x00000000)
			endif
			rafoverlay_text_id :se_setprops text = <text>
		endif
	else
		NetSessionFunc \{Obj = raf
			func = getrafoverlayinfo}
		if ScreenElementExists \{id = rafoverlay_text_id}
			if NOT GotParam \{text}
				<text> = qs(0x00000000)
			endif
			rafoverlay_text_id :se_setprops text = <text>
		endif
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script rafoverlay_task 
	rafoverlay_loop
	rafoverlay_destroy
endscript
