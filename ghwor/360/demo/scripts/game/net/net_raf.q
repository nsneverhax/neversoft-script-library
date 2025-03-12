
script rafoverlay 
	spawnscript \{rafoverlay2}
endscript

script rafoverlay2 
	netsessionfunc \{obj = raf
		func = setrafoverlaymode
		params = {
			on
		}}
	rafoverlay_create
endscript

script rafoverlay_create 
	rafoverlay_destroy
	createscreenelement \{type = containerelement
		parent = root_window
		pos = (50.0, 30.0)
		just = [
			left
			top
		]
		id = rafoverlay_root_id
		z_priority = 25000}
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
		id = rafoverlay_background_id
		z_priority = 25001}
	createscreenelement \{type = textelement
		parent = rafoverlay_root_id
		font = fontgrid_text_a1
		text = qs(0x65e710ac)
		scale = (0.5, 0.5)
		just = [
			left
			top
		]
		pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]
		id = rafoverlay_title_id
		z_priority = 25002}
	createscreenelement \{type = textelement
		parent = rafoverlay_root_id
		font = fontgrid_text_a1
		text = qs(0x00000000)
		scale = (0.5, 0.5)
		just = [
			left
			top
		]
		pos = (0.0, 50.0)
		dims = (1180.0, 660.0)
		rgba = [
			255
			255
			0
			255
		]
		id = rafoverlay_text_id
		single_line = false
		z_priority = 25003}
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
	if screenelementexists \{id = rafoverlay_root_id}
		netsessionfunc \{obj = raf
			func = getrafoverlayinfo}
		if screenelementexists \{id = rafoverlay_text_id}
			if NOT gotparam \{text}
				<text> = qs(0x00000000)
			endif
			rafoverlay_text_id :se_setprops text = <text>
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
