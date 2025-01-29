netdebugoverlay_container_pos = (50.0, 30.0)
netdebugoverlay_backgroundsize = (1180.0, 660.0)
netdebugoverlay_text_font = fontgrid_text_A1
netdebugoverlay_text_color1 = [
	255
	255
	255
	255
]
netdebugoverlay_text_color2 = [
	255
	255
	0
	255
]
netdebugoverlay_text_scale1 = (0.6, 0.6)
netdebugoverlay_text_scale2 = (0.4, 0.4)
netdebugoverlay_just = [
	left
	top
]

script netdebugoverlay 
	netdebugoverlay_create
endscript

script netdebugoverlay_create 
	netdebugoverlay_destroy
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		Pos = $netdebugoverlay_container_pos
		just = $netdebugoverlay_just
		id = netdebugoverlay_root_id}
	CreateScreenElement \{type = SpriteElement
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
	CreateScreenElement \{type = TextElement
		parent = netdebugoverlay_root_id
		font = $netdebugoverlay_text_font
		text = qs(0xcdb29fb7)
		scale = $netdebugoverlay_text_scale1
		just = $netdebugoverlay_just
		Pos = (0.0, 0.0)
		z_priority = 10001
		rgba = $netdebugoverlay_text_color1
		id = netdebugoverlay_title_id}
	CreateScreenElement \{type = TextElement
		parent = netdebugoverlay_root_id
		font = $netdebugoverlay_text_font
		text = qs(0x00000000)
		scale = $netdebugoverlay_text_scale2
		just = $netdebugoverlay_just
		Pos = (0.0, 50.0)
		dims = (1180.0, 660.0)
		z_priority = 10001
		rgba = $netdebugoverlay_text_color2
		id = netdebugoverlay_text_id
		single_line = false}
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
		netdebugoverlay_root_id :SE_SetProps \{alpha = 1.0
			time = 0.5}
		GetNetDebugOverlayInfo
		if ScreenElementExists \{id = netdebugoverlay_text_id}
			if NOT GotParam \{text}
				<text> = qs(0x00000000)
			endif
			netdebugoverlay_text_id :SE_SetProps text = <text>
		endif
	endif
	wait \{0.1
		seconds}
	repeat
endscript

script netdebugoverlay_task 
	netdebugoverlay_loop
	netdebugoverlay_destroy
endscript
