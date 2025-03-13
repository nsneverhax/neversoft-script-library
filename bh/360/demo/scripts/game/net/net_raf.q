rafoverlay_container_pos = (50.0, 30.0)
rafoverlay_backgroundsize = (1180.0, 660.0)
rafoverlay_text_font = fontgrid_text_a1
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
	createscreenelement \{type = containerelement
		parent = root_window
		pos = $rafoverlay_container_pos
		just = $rafoverlay_just
		id = rafoverlay_root_id}
	createscreenelement \{type = spriteelement
		parent = rafoverlay_root_id
		texture = white
		dims = (1180.0, 660.0)
		rgba = [
			0
			0
			0
			64
		]
		pos = (590.0, 330.0)
		z_priority = 10000
		id = rafoverlay_background_id}
	createscreenelement \{type = textelement
		parent = rafoverlay_root_id
		font = $rafoverlay_text_font
		text = qs(0x65e710ac)
		scale = $rafoverlay_text_scale1
		just = $rafoverlay_just
		pos = (0.0, 0.0)
		z_priority = 10001
		rgba = $rafoverlay_text_color1
		id = rafoverlay_title_id}
	createscreenelement \{type = textelement
		parent = rafoverlay_root_id
		font = $rafoverlay_text_font
		text = qs(0x00000000)
		scale = $rafoverlay_text_scale2
		just = $rafoverlay_just
		pos = (0.0, 50.0)
		dims = (1180.0, 660.0)
		z_priority = 10001
		rgba = $rafoverlay_text_color2
		id = rafoverlay_text_id
		single_line = false}
	runscriptonscreenelement \{id = rafoverlay_root_id
		rafoverlay_task}
endscript

script rafoverlay_destroy 
	if screenelementexists \{id = rafoverlay_root_id}
		destroyscreenelement \{id = rafoverlay_root_id}
	endif
endscript

script rafoverlay_loop 
	begin
	if netsessionfunc \{obj = raf
			func = israfoverlaydone}
		break
	endif
	if screenelementexists \{id = rafoverlay_root_id}
		if netsessionfunc \{obj = raf
				func = israfoverlayoktodisplay}
			rafoverlay_root_id :se_setprops \{alpha = 1.0
				time = 0.5}
			netsessionfunc \{obj = raf
				func = getrafoverlayinfo}
			if screenelementexists \{id = rafoverlay_text_id}
				if NOT gotparam \{text}
					<text> = qs(0x00000000)
				endif
				rafoverlay_text_id :se_setprops text = <text>
			endif
		else
			rafoverlay_root_id :se_setprops \{alpha = 0.0
				time = 0.5}
		endif
	else
		netsessionfunc \{obj = raf
			func = getrafoverlayinfo}
		if screenelementexists \{id = rafoverlay_text_id}
			if NOT gotparam \{text}
				<text> = qs(0x00000000)
			endif
			rafoverlay_text_id :se_setprops text = <text>
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
