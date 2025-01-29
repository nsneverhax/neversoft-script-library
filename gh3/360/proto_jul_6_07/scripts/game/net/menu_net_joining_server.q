
script create_join_server_menu 
	createscreenelement {
		type = containerelement
		parent = root_window
		id = joining_screen_container
		pos = (0.0, 0.0)
	}
	create_menu_backdrop
	createscreenelement {
		type = textelement
		parent = joining_screen_container
		text = "JOINING GAME"
		just = [center center]
		pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_gh3
		scale = 3.0
		rgba = [210 210 210 250]
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 2
	}
endscript

script destroy_join_server_menu 
	if screenelementexists \{id = joining_screen_container}
		destroyscreenelement \{id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript

script create_joining_screen 
	createscreenelement {
		type = containerelement
		parent = root_window
		id = joining_screen_container
		pos = (0.0, 0.0)
	}
	create_menu_backdrop texture = venue_bg
	createscreenelement {
		type = textelement
		parent = joining_screen_container
		text = "JOINING GAME"
		just = [center center]
		pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_gh3
		scale = 2.0
		rgba = [210 210 210 250]
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 2.0
	}
	createscreenelement {
		type = textelement
		parent = joining_screen_container
		id = joining_dots_text
		font = text_a5
		scale = 2.0
		rgba = [210 210 210 250]
		text = ""
		just = [left top]
		z_priority = 2.0
		pos = (640.0, 450.0)
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
	}
	if screenelementexists id = joining_dots_text
		runscriptonscreenelement id = joining_dots_text animate_dots params = {id = joining_dots_text}
	endif
endscript

script destroy_joining_screen 
	if screenelementexists \{id = joining_screen_container}
		destroyscreenelement \{id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript
