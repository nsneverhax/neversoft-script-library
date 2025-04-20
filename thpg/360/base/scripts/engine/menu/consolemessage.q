number_of_console_lines = 6

script create_console 
	if NOT objectexists \{id = console_message_vmenu}
		createscreenelement \{type = vmenu
			parent = root_window
			id = console_message_vmenu
			padding_scale = 1.1
			font = text_a1
			just = [
				left
				top
			]
			internal_just = [
				left
				center
			]
			z_priority = 0}
	endif
endscript

script create_console_message text = "Default console message" rgba = [226 242 255 255]
	if NOT getglobalflag flag = $no_display_chatwindow
		root_window :getsingletag menu_state
		if NOT objectexists id = console_message_vmenu
			create_console
		endif
		if NOT (<menu_state> = on)
			if skatercamanimfinished
				unhide_console_window
			endif
		endif
		if screenelementexists id = {console_message_vmenu child = ($number_of_console_lines - 1)}
			destroyscreenelement id = {console_message_vmenu child = 0}
		endif
		if infrontend
			dims = (750.0, 10.0)
			pos = (50.0, 280.0)
			change number_of_console_lines = 5
			max_chat_height = 150
		else
			dims = (750.0, 10.0)
			pos = (65.0, 480.0)
			change number_of_console_lines = 6
			max_chat_height = 200
		endif
		if gotparam join
			rgba = [0 160 0 255]
		else
			if gotparam left
				rgba = [160 0 0 255]
			endif
		endif
		setscreenelementprops id = console_message_vmenu pos = <pos>
		createscreenelement {
			type = textblockelement
			parent = console_message_vmenu
			font = text_a1
			text = <text>
			internal_just = [left top]
			rgba = <rgba>
			scale = 0.67
			not_focusable
			dims = <dims>
			allow_expansion
			z_priority = 5
			line_spacing = 0.7
			shadow
			shadow_offs = (1.0, 1.0)
		}
		begin
		total_height = 0
		index = $number_of_console_lines
		begin
		if screenelementexists id = {console_message_vmenu child = ($number_of_console_lines - <index>)}
			getscreenelementdims id = {console_message_vmenu child = ($number_of_console_lines - <index>)}
			<total_height> = (<total_height> + <height>)
			<index> = (<index> - 1)
		else
			break
		endif
		repeat
		if (<total_height> > <max_chat_height>)
			destroyscreenelement id = {console_message_vmenu child = 0}
		else
			break
		endif
		repeat
		if gotparam wait_and_die
			runscriptonscreenelement id = <id> console_message_wait_and_die params = {time = <time>}
			return
		endif
		if NOT infrontend
			if NOT gotparam dont_die
				runscriptonscreenelement id = <id> console_message_wait_and_die
			endif
		endif
	endif
endscript

script hide_console_window 
	if objectexists \{id = console_message_vmenu}
		doscreenelementmorph \{id = console_message_vmenu
			time = 0
			scale = 0}
	endif
endscript

script unhide_console_window 
	if objectexists \{id = console_message_vmenu}
		doscreenelementmorph \{id = console_message_vmenu
			time = 0
			scale = 1}
	endif
endscript

script console_hide 
	if objectexists \{id = console_message_vmenu}
		runscriptonscreenelement \{id = console_message_vmenu
			console_hide2}
	endif
endscript

script console_hide2 
	domorph \{scale = 0}
endscript

script console_unhide 
	if objectexists \{id = console_message_vmenu}
		runscriptonscreenelement \{id = console_message_vmenu
			console_unhide2}
	endif
endscript

script console_unhide2 
	domorph \{scale = 1}
endscript

script console_clear 
	if screenelementexists \{id = console_message_vmenu}
		destroyscreenelement \{id = console_message_vmenu
			preserve_parent}
	endif
endscript

script console_destroy 
	if objectexists \{id = console_message_vmenu}
		destroyscreenelement \{id = console_message_vmenu}
	endif
endscript

script console_message_wait_and_die \{time = 10}
	obj_getid
	doscreenelementmorph id = <objid> time = 1 alpha = 0.63 anim = ease_out
	wait <time> seconds
	domorph \{time = 0.5
		alpha = 0}
	die
endscript
