
script updatedebuggermouseposition 
	if NOT screenelementexists \{id = mouse_cursor}
		createscreenelement \{type = spriteelement
			parent = root_window
			id = mouse_cursor
			texture = white
			rgba = [
				255
				255
				255
				255
			]
			just = [
				left
				top
			]
			z_priority = 3000003
			dims = (24.0, 24.0)
			tags = {
				hide_from_debugger
			}}
	endif
	setscreenelementprops id = mouse_cursor pos = ((1.0, 0.0) * <x> + (0.0, 1.0) * <y>)
endscript

script destroymousecursor 
	if screenelementexists \{id = mouse_cursor}
		destroyscreenelement \{id = mouse_cursor}
	endif
	destroymousetext
endscript

script destroymousetext 
	if screenelementexists \{id = mouse_text}
		destroyscreenelement \{id = mouse_text}
	endif
endscript

script setmousetext 
	if NOT screenelementexists \{id = mouse_text}
		getdebugfont
		createscreenelement {
			id = mouse_text
			parent = root_window
			type = textelement
			just = [center top]
			pos = (0.0, 0.0)
			font = <debug_font>
			scale = 0.5
			text = qs(0x03ac90f0)
			rgba = [80 128 128 128]
			z_priority = 3000002
			tags = {hide_from_debugger}
		}
	endif
	setscreenelementprops id = mouse_text text = <text>
	setscreenelementprops id = mouse_text pos = ((1.0, 0.0) * <x> + (0.0, 1.0) * <y> + (8.0, 16.0))
endscript

script mouseclickeffect 
	se_setprops \{scale = 1.1
		time = 0}
	wait \{2
		gameframes}
	se_setprops \{scale = 1
		time = 0}
endscript

script domouseclickeffect 
	if screenelementexists \{id = mouse_text}
		runscriptonscreenelement \{id = mouse_text
			mouseclickeffect}
	endif
endscript
