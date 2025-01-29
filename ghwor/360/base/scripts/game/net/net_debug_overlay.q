
script netdebugoverlay 
	spawnscript \{netdebugoverlay_create}
endscript

script netdebugoverlay_create 
	netdebugoverlay_destroy
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		Pos = (50.0, 30.0)
		just = [
			left
			top
		]
		id = netdebugoverlay_root_id}
	CreateScreenElement \{Type = SpriteElement
		parent = netdebugoverlay_root_id
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
		id = netdebugoverlay_background_id}
	CreateScreenElement \{Type = TextElement
		parent = netdebugoverlay_root_id
		font = fontgrid_text_a1
		text = qs(0xcdb29fb7)
		Scale = (0.6, 0.6)
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		z_priority = 10001
		rgba = [
			255
			255
			255
			255
		]
		id = netdebugoverlay_title_id}
	CreateScreenElement \{Type = TextElement
		parent = netdebugoverlay_root_id
		font = fontgrid_text_a1
		text = qs(0x00000000)
		Scale = (0.4, 0.4)
		just = [
			left
			top
		]
		Pos = (0.0, 50.0)
		dims = (1180.0, 660.0)
		z_priority = 10001
		rgba = [
			255
			255
			0
			255
		]
		id = netdebugoverlay_text_id
		single_line = FALSE}
	RunScriptOnScreenElement \{id = netdebugoverlay_root_id
		netdebugoverlay_task}
endscript

script netdebugoverlay_destroy 
	if ScreenElementExists \{id = netdebugoverlay_root_id}
		DestroyScreenElement \{id = netdebugoverlay_root_id}
	endif
endscript

script netdebugoverlay_loop 
	begin
	if ScreenElementExists \{id = netdebugoverlay_root_id}
		netdebugoverlay_root_id :se_setprops \{alpha = 1.0
			time = 0.5}
		getnetdebugoverlayinfo
		if ScreenElementExists \{id = netdebugoverlay_text_id}
			if NOT GotParam \{text}
				<text> = qs(0x00000000)
			endif
			netdebugoverlay_text_id :se_setprops text = <text>
		endif
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script netdebugoverlay_task 
	netdebugoverlay_loop
	netdebugoverlay_destroy
endscript
