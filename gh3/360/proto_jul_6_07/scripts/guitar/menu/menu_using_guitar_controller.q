menu_using_guitar_controller_font = text_a3

script create_using_guitar_controller_menu 
	printf \{"create_using_guitar_controller_menu"}
	create_menu_backdrop \{texture = 0xd7553d50}
	createscreenelement \{type = containerelement
		parent = root_window
		id = ugc_container
		pos = (0.0, 0.0)}
	menu_using_guitar_controller_add_text_start
	menu_using_guitar_controller_add_text_back
	menu_using_guitar_controller_add_text_continue
	menu_using_guitar_controller_add_text_up_down
	0xa95fa2e7
	0xe069917b
	0xd7ddce81
	menu_using_guitar_controller_add_text_header
	spawnscriptnow \{check_for_any_input}
endscript

script destroy_using_guitar_controller_menu 
	destroy_menu \{menu_id = ugc_container}
	destroy_menu_backdrop
	killspawnedscript \{name = check_for_any_input}
endscript

script 0xfb5084b1 
	destroy_using_guitar_controller_menu
	create_using_guitar_controller_menu
endscript

script menu_using_guitar_controller_add_text_start 
	text1 = "START"
	text1_pos = (294.0, 602.0)
	text2 = "Button"
	text2_pos = (294.0, 635.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (1.2, 1.0)
	}
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = 0.7
	}
endscript

script menu_using_guitar_controller_add_text_back 
	text1 = "BACK"
	text1_pos = (774.0, 602.0)
	text2 = "Red Button"
	text2_pos = (774.0, 635.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (1.2, 1.0)
	}
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [180 40 40 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = 0.7
	}
endscript

script menu_using_guitar_controller_add_text_continue 
	text1 = "CONTINUE"
	text1_pos = (994.0, 602.0)
	text2 = "Green Button"
	text2_pos = (994.0, 635.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (1.2, 1.0)
	}
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [0 110 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = 0.7
	}
endscript

script menu_using_guitar_controller_add_text_up_down 
	text1 = "UP/DOWN"
	text1_pos = (765.0, 420.0)
	text2 = "Strum Bar"
	text2_pos = (765.0, 453.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (1.2, 1.0)
	}
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = 0.7
	}
endscript

script 0xa95fa2e7 
	text1 = "Plug in"
	text1_pos = (345.0, 217.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center bottom]
		scale = (0.7, 0.65000004)
	}
endscript

script 0xe069917b 
	text1 = "Attach Strap"
	text1_pos = (610.0, 217.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center bottom]
		scale = (0.7, 0.65000004)
	}
endscript

script 0xd7ddce81 
	text1 = "Bang"
	text1_pos = (770.0, 217.0)
	text2 = "Head"
	text2_pos = (770.0, 247.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left bottom]
		scale = (0.7, 0.65000004)
	}
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left bottom]
		scale = (0.7, 0.65000004)
	}
endscript

script menu_using_guitar_controller_add_text_header 
	createscreenelement {
		type = spriteelement
		parent = ugc_container
		pos = (0.0, 60.0)
		dims = (1280.0, 50.0)
		rgba = [0 0 100 255]
		just = [left top]
		z_priority = 0.1
	}
	text1 = "IN THE EVENT OF ROCK"
	text1_pos = (640.0, 57.0)
	text2 = "USING THE GUITAR CONTROLLER"
	text2_pos = (640.0, 115.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [220 220 220 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (1.4, 1.3)
	}
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (0.9, 0.8)
	}
endscript
