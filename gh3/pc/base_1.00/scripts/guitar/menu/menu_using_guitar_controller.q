menu_using_guitar_controller_font = text_a4
menu_using_guitar_controller_kb = 0

script create_using_guitar_controller_menu \{keyboard = 0}
	change menu_using_guitar_controller_kb = <keyboard>
	create_menu_backdrop \{texture = boot_usingguitar_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = ugc_container
		pos = (0.0, 0.0)}
	guitar_tex = boot_usingguitar_gtr_lespaul
	getplatform
	switch <platform>
		case ps3
		<guitar_tex> = boot_usingguitar_gtr_lespaul_ps3
	endswitch
	if ($menu_using_guitar_controller_kb = 1)
		guitar_tex = boot_usingkeyboard
		if german
			guitar_tex = boot_usingkeyboard_g
		elseif french
			guitar_tex = boot_usingkeyboard_f
		elseif italian
			guitar_tex = boot_usingkeyboard_i
		elseif spanish
			guitar_tex = boot_usingkeyboard_s
		endif
	endif
	if ($menu_using_guitar_controller_kb = 1)
		displaysprite parent = ugc_container tex = <guitar_tex> pos = (665.0, 510.0) just = [center center] z = 1 scale = (1.2, 1.2)
		displaysprite \{parent = ugc_container
			tex = boot_usingkeyboard_illo
			pos = (640.0, 240.0)
			just = [
				center
				center
			]
			z = 1}
	else
		displaysprite parent = ugc_container tex = <guitar_tex> pos = (660.0, 530.0) just = [center center] z = 1
		displaysprite \{parent = ugc_container
			tex = boot_usingguitar_illo
			pos = (640.0, 270.0)
			just = [
				center
				center
			]
			z = 1}
	endif
	displaysprite \{parent = ugc_container
		id = bg_helper
		tex = white
		rgba = [
			83
			95
			147
			255
		]
		dims = (221.0, 40.0)
		just = [
			center
			top
		]
		z = 0.5}
	displaytext \{parent = ugc_container
		id = bg_helper_text
		font = text_a4
		rgba = [
			223
			223
			223
			255
		]
		scale = 0.5
		just = [
			center
			top
		]
		z = 0.6
		noshadow}
	if ($menu_using_guitar_controller_kb = 0)
		menu_using_guitar_controller_add_text_start
		menu_using_guitar_controller_add_text_back
		menu_using_guitar_controller_add_text_continue
		menu_using_guitar_controller_add_text_up_down
		menu_using_guitar_controller_add_text_tilt_starpower
	endif
	menu_using_guitar_controller_add_text_header
	spawnscriptnow \{go_through_using_guitar_text}
	spawnscriptnow \{check_for_any_input
		params = {
			use_primary_controller
			button1 = start
			button2 = x
		}}
	return \{play_sound = 0}
endscript

script destroy_using_guitar_controller_menu 
	destroy_menu \{menu_id = ugc_container}
	destroy_menu_backdrop
	killspawnedscript \{name = go_through_using_guitar_text}
	killspawnedscript \{name = check_for_any_input}
endscript

script go_through_using_guitar_text 
	max_width = 200
	begin
	if screenelementexists \{id = bg_helper}
		setscreenelementprops \{id = bg_helper
			pos = (406.0, 135.0)}
	endif
	if screenelementexists \{id = bg_helper_text}
		if ($menu_using_guitar_controller_kb = 1)
			setscreenelementprops \{id = bg_helper_text
				pos = (407.0, 130.0)
				text = "1) BOOT UP"}
		else
			setscreenelementprops \{id = bg_helper_text
				pos = (407.0, 130.0)
				text = "1) STRAP ON"}
		endif
		getscreenelementdims \{id = bg_helper_text}
		setscreenelementprops \{id = bg_helper_text
			scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle id = bg_helper_text dims = (<max_width> * (1.0, 0.0) + <height> * (0.0, 1.0))
		else
			setscreenelementprops \{id = bg_helper_text
				scale = 0.5}
		endif
	endif
	wait \{2
		seconds}
	if screenelementexists \{id = bg_helper}
		setscreenelementprops \{id = bg_helper
			pos = (639.0, 135.0)}
	endif
	if screenelementexists \{id = bg_helper_text}
		setscreenelementprops \{id = bg_helper_text
			pos = (640.0, 130.0)
			text = "2) BANG HEAD"}
		getscreenelementdims \{id = bg_helper_text}
		setscreenelementprops \{id = bg_helper_text
			scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle id = bg_helper_text dims = (<max_width> * (1.0, 0.0) + <height> * (0.0, 1.0))
		else
			setscreenelementprops \{id = bg_helper_text
				scale = 0.5}
		endif
	endif
	wait \{2
		seconds}
	if screenelementexists \{id = bg_helper}
		setscreenelementprops \{id = bg_helper
			pos = (872.0, 135.0)}
	endif
	if screenelementexists \{id = bg_helper_text}
		setscreenelementprops \{id = bg_helper_text
			pos = (873.0, 130.0)
			text = "3) LOSE CONTROL"}
		getscreenelementdims \{id = bg_helper_text}
		setscreenelementprops \{id = bg_helper_text
			scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle id = bg_helper_text dims = (<max_width> * (1.0, 0.0) + <height> * (0.0, 1.0))
		else
			setscreenelementprops \{id = bg_helper_text
				scale = 0.5}
		endif
	endif
	wait \{2
		seconds}
	repeat
endscript

script menu_using_guitar_controller_add_text_start 
	text1 = "START"
	text1_pos = (785.0, 594.0)
	text2 = "button"
	text2_pos = (785.0, 627.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = (0.7, 0.7)
	}
	getscreenelementdims id = <id>
	if (<width> > 80)
		extra_space = (<width> - 80)
		getscreenelementprops id = <id>
		setscreenelementprops id = <id> pos = (<pos> - <extra_space> * (0.5, 0.0))
	endif
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_back 
	text1 = "BACK"
	text1_pos = (459.0, 592.0)
	text2 = "Red Button"
	text2_pos = (459.0, 625.0)
	getenterbuttonassignment
	if (<assignment> = circle)
		text1 = "CONTINUE"
		text1_pos = (459.0, 592.0)
		text2 = "Red Button"
		text2_pos = (459.0, 625.0)
	endif
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		scale = (0.7, 0.7)
	}
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [165 70 70 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_continue 
	text1 = "CONTINUE"
	text1_pos = (397.0, 592.0)
	text2 = "Green Button"
	text2_pos = (397.0, 625.0)
	getenterbuttonassignment
	if (<assignment> = circle)
		text1 = "BACK"
		text1_pos = (397.0, 592.0)
		text2 = "Green Button"
		text2_pos = (397.0, 625.0)
	endif
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = (0.7, 0.7)
	}
	getscreenelementdims id = <id>
	if (<width> > 125)
		extra_space = (<width> - 125)
		getscreenelementprops id = <id>
		setscreenelementprops id = <id> pos = (<pos> - <extra_space> * (0.5, 0.0))
	endif
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [80 145 105 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_up_down 
	text1 = "UP/DOWN"
	text1_pos = (565.0, 409.0)
	text2 = "Strum Bar"
	text2_pos = (565.0, 442.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (0.7, 0.7)
	}
	getscreenelementdims id = <id>
	if (<width> > 180)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <height> * (0.0, 1.0))
	endif
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = 0.6
	}
	getscreenelementdims id = <id>
	if (<width> > 180)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <height> * (0.0, 1.0))
	endif
endscript

script menu_using_guitar_controller_add_text_tilt_starpower 
	text1 = "TILT UP"
	text1_pos = (290.0, 390.0)
	text2 = "for Star Power"
	text2_pos = (290.0, 423.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		scale = (0.7, 0.7)
	}
	getscreenelementdims id = <id>
	if (<width> > 180)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <height> * (0.0, 1.0))
	endif
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		scale = 0.6
	}
	getscreenelementdims id = <id>
	if (<width> > 180)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <height> * (0.0, 1.0))
	endif
	createscreenelement \{type = spriteelement
		parent = ugc_container
		texture = boot_usingguitar_arrow
		pos = (275.0, 480.0)
		just = [
			right
			center
		]}
endscript

script menu_using_guitar_controller_add_text_header 
	text1 = "IN THE EVENT OF ROCK"
	text1_pos = (660.0, 55.0)
	if ($menu_using_guitar_controller_kb = 1)
		text2 = "USING THE KEYBOARD"
	else
		text2 = "USING THE GUITAR CONTROLLER"
	endif
	text2_pos = (660.0, 95.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [100 110 145 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (1.4, 1.0)
	}
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (0.9, 0.7)
	}
endscript
