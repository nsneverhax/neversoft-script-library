
script 0x7948a248 
	if english
		0x58bc606d = 0x4389fc0d
	elseif french
		0x58bc606d = 0x7ca5f381
	elseif spanish
		0x58bc606d = 0xa51e74b9
	elseif german
		0x58bc606d = 0xcd4014c4
	elseif italian
		0x58bc606d = 0x125e4a7b
	endif
	create_menu_backdrop texture = <0x58bc606d>
	waited = 0.0
	0x6e346f68 = 10000.0
	i = 0
	0x680a0469 = 0
	begin
	<i> = 0
	begin
	if isguitarcontroller controller = <i>
		if (<0x6e346f68> = 10000.0)
			<0x6e346f68> = <waited>
		endif
		if ((<waited> - <0x6e346f68>) > 4.0)
			<0x680a0469> = 1
		endif
		if controllermake x <i>
			<0x680a0469> = 1
		endif
	else
		getheldpattern controller = <i> nobrokenstring
		<check_buttons> = 65792
		if (<hold_pattern> = <check_buttons>)
			<0x680a0469> = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat 2
	if (<0x680a0469> > 0)
		break
	endif
	getdeltatime
	<waited> = (<waited> + <delta_time>)
	wait \{1
		gameframes}
	repeat
	destroy_menu_backdrop
	if english
		<0x58bc606d> = 0x513c53e3
	elseif french
		<0x58bc606d> = 0x6e105c6f
	elseif spanish
		<0x58bc606d> = 0xb7abdb57
	elseif german
		<0x58bc606d> = 0xdff5bb2a
	elseif italian
		<0x58bc606d> = 0x00ebe595
	endif
	create_menu_backdrop texture = <0x58bc606d>
	0x48329491 = 1
	<waited> = 0.0
	begin
	getbuttonspressed
	if (<makes> = 0)
		<0x48329491> = 0
	endif
	if (<waited> > 12.0)
		break
	endif
	if (<0x48329491> = 0)
		if controllermake \{x}
			break
		endif
	endif
	getdeltatime
	<waited> = (<waited> + <delta_time>)
	wait \{1
		gameframe}
	repeat
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script 0x4704b349 
	destroy_menu_backdrop
endscript
menu_using_guitar_controller_font = text_a4

script create_using_guitar_controller_menu 
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
		case ps2
		<guitar_tex> = 0x0438e89f
	endswitch
	displaysprite parent = ugc_container tex = <guitar_tex> pos = (660.0, 510.0) just = [center center] z = 1 scale = 2
	displaysprite \{parent = ugc_container
		tex = boot_usingguitar_illo
		pos = (640.0, 270.0)
		just = [
			center
			center
		]
		z = 1
		scale = 2}
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
	menu_using_guitar_controller_add_text_start
	menu_using_guitar_controller_add_text_back
	menu_using_guitar_controller_add_text_continue
	menu_using_guitar_controller_add_text_up_down
	menu_using_guitar_controller_add_text_tilt_starpower
	menu_using_guitar_controller_add_text_header
	spawnscriptnow \{go_through_using_guitar_text}
	spawnscriptnow \{check_for_any_input
		params = {
			mode = startanda
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
		setscreenelementprops \{id = bg_helper_text
			pos = (407.0, 133.0)
			text = '1) STRAP ON'}
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
			pos = (640.0, 133.0)
			text = '2) BANG HEAD'}
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
			pos = (873.0, 133.0)
			text = '3) LOSE CONTROL'}
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
	text1 = 'START'
	text1_pos = (805.0, 593.0)
	text2 = 'button'
	text2_pos = (805.0, 626.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [200 200 200 255]
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
		rgba = [200 200 200 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_back 
	text1 = 'BACK'
	text1_pos = (460.0, 590.0)
	text2 = 'Red Button'
	text2_pos = (460.0, 623.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [200 200 200 255]
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
	text1 = 'CONTINUE'
	text1_pos = (390.0, 590.0)
	text2 = 'Green Button'
	text2_pos = (390.0, 623.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [200 200 200 255]
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
	text1 = 'UP/DOWN'
	text1_pos = (590.0, 398.0)
	text2 = 'Strum Bar'
	text2_pos = (590.0, 431.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [200 200 200 255]
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
		rgba = [200 200 200 255]
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
	text1 = 'TILT UP'
	text1_pos = (300.0, 398.0)
	text2 = 'for Star Power'
	text2_pos = (300.0, 431.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [200 200 200 255]
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
		rgba = [200 200 200 255]
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
		pos = (270.0, 460.0)
		just = [
			right
			center
		]}
endscript

script menu_using_guitar_controller_add_text_header 
	text1 = 'IN THE EVENT OF ROCK'
	text1_pos = (660.0, 55.0)
	text2 = 'USING THE GUITAR CONTROLLER'
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
		rgba = [200 200 200 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (0.9, 0.7)
	}
endscript
