
script updatedebuggermouseposition 
	if NOT screenelementexists \{id = mouse_cursor}
		setscreenelementlock \{id = root_window
			off}
		createscreenelement \{type = spriteelement
			parent = root_window
			id = mouse_cursor
			texture = mouse_cursor
			rgba = [
				128
				128
				128
				85
			]
			just = [
				left
				top
			]
			z_priority = 3000003
			tags = {
				hide_from_debugger
			}}
	endif
	doscreenelementmorph id = mouse_cursor pos = ((1.0, 0.0) * <x> + (0.0, 1.0) * <y>)
endscript

script destroymousecursor 
	if screenelementexists \{id = mouse_cursor}
		destroyscreenelement \{id = mouse_cursor}
	endif
	destroymousetext
	killspritehighlighteffect
endscript

script destroymousetext 
	if screenelementexists \{id = mouse_text}
		destroyscreenelement \{id = mouse_text}
	endif
endscript

script setmousetext 
	if NOT screenelementexists \{id = mouse_text}
		setscreenelementlock \{id = root_window
			off}
		createscreenelement \{id = mouse_text
			parent = root_window
			type = textelement
			just = [
				center
				top
			]
			pos = (0.0, 0.0)
			font = text_a1
			scale = 0.5
			text = ""
			rgba = [
				80
				128
				128
				128
			]
			z_priority = 3000002
			tags = {
				hide_from_debugger
			}}
	endif
	setscreenelementprops id = mouse_text text = <text>
	doscreenelementmorph id = mouse_text pos = ((1.0, 0.0) * <x> + (0.0, 1.0) * <y> + (8.0, 16.0))
endscript

script mouseclickeffect 
	domorph \{id = mouse_text
		scale = 1.1
		time = 0}
	wait \{2
		gameframes}
	domorph \{id = mouse_text
		scale = 1
		time = 0}
endscript

script domouseclickeffect 
	if screenelementexists \{id = mouse_text}
		runscriptonscreenelement \{id = mouse_text
			mouseclickeffect}
	endif
endscript
