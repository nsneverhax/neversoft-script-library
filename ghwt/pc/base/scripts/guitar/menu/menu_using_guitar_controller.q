menu_using_guitar_controller_font = fontgrid_text_a8

script create_using_guitar_controller_menu 
	create_menu_backdrop \{texture = white}
	createscreenelement \{type = containerelement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		event_handlers = [
			{
				pad_start
				ui_event
				params = {
					event = menu_replace
					data = {
						state = uistate_boot_download_scan
					}
				}
			}
			{
				pad_choose
				ui_event
				params = {
					event = menu_replace
					data = {
						state = uistate_boot_download_scan
					}
				}
			}
		]}
	guitar_tex = boot_usingguitar_gtr_lespaul
	getplatform
	switch <platform>
		case ps3
		<guitar_tex> = boot_usingguitar_gtr_lespaul_ps3
	endswitch
	displaysprite parent = current_menu tex = <guitar_tex> pos = (660.0, 510.0) just = [center center] z = 1
	controller = boot_usingguitar
	if NOT isguitarcontroller
		controller = boot_usingdrums
		if NOT isdrumcontroller
			controller = boot_usingmic
		endif
	endif
	displaysprite parent = current_menu tex = <controller> pos = (640.0, 270.0) just = [center center] z = 1
	displaysprite \{parent = current_menu
		id = bg_helper
		tex = boot_usingguitar_bg
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
	displaytext \{parent = current_menu
		id = bg_helper_text
		font = fontgrid_text_a8
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
	runscriptonscreenelement \{id = current_menu
		go_through_using_guitar_text}
	launchevent \{type = focus
		id = current_menu}
	return \{play_sound = 0}
endscript

script destroy_using_guitar_controller_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = current_menu}
	destroy_menu_backdrop
endscript

script go_through_using_guitar_text 
	text = qs(0x5f99bb9f)
	if NOT isguitarcontroller
		text = qs(0xcb37c028)
		if NOT isdrumcontroller
			text = qs(0xc60068eb)
		endif
	endif
	max_width = 200
	begin
	if screenelementexists \{id = bg_helper}
		setscreenelementprops \{id = bg_helper
			pos = (406.0, 135.0)}
	endif
	if screenelementexists \{id = bg_helper_text}
		setscreenelementprops id = bg_helper_text pos = (407.0, 130.0) text = <text>
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
			text = qs(0x942b8c17)}
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
			text = qs(0xd70f387a)}
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
	text1 = qs(0xe4edd14e)
	text1_pos = (805.0, 585.0)
	text2 = qs(0x70b1f41a)
	text2_pos = (805.0, 618.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
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
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_back 
	text1 = qs(0xaf4d5dd2)
	text1_pos = (460.0, 582.0)
	text2 = qs(0x20551fd0)
	text2_pos = (460.0, 615.0)
	getenterbuttonassignment
	if (<assignment> = circle)
		text1 = qs(0x182f0173)
		text1_pos = (460.0, 582.0)
		text2 = qs(0x20551fd0)
		text2_pos = (460.0, 615.0)
	endif
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		scale = (0.7, 0.7)
	}
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = current_menu
		rgba = [165 70 70 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_continue 
	text1 = qs(0x182f0173)
	text1_pos = (390.0, 582.0)
	text2 = qs(0xb13e56eb)
	text2_pos = (390.0, 615.0)
	getenterbuttonassignment
	if (<assignment> = circle)
		text1 = qs(0xaf4d5dd2)
		text1_pos = (390.0, 582.0)
		text2 = qs(0xb13e56eb)
		text2_pos = (390.0, 615.0)
	endif
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
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
		parent = current_menu
		rgba = [80 145 105 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_up_down 
	text1 = qs(0x643800a7)
	text1_pos = (590.0, 390.0)
	text2 = qs(0x5b9f72d9)
	text2_pos = (590.0, 423.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
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
		parent = current_menu
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
	text1 = qs(0xa907f23f)
	text1_pos = (300.0, 390.0)
	text2 = qs(0x9a94665c)
	text2_pos = (300.0, 423.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
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
		parent = current_menu
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
		parent = current_menu
		texture = boot_usingguitar_arrow
		pos = (270.0, 460.0)
		just = [
			right
			center
		]}
endscript

script menu_using_guitar_controller_add_text_header 
	text1 = qs(0x4d63e383)
	text1_pos = (660.0, 55.0)
	if ($menu_using_guitar_controller_kb = 1)
		text2 = qs(0x115ead8d)
	else
		text2 = qs(0x3ffbc994)
	endif
	text2_pos = (660.0, 95.0)
	text2 = qs(0x3ffbc994)
	if NOT isguitarcontroller
		text2 = qs(0x58996e58)
		if NOT isdrumcontroller
			text2 = qs(0x0dbbbcb5)
		endif
	endif
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
		rgba = [100 110 145 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (1.4, 1.0)
	}
	createscreenelement {
		type = textelement
		text = <text2>
		pos = <text2_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (0.9, 0.7)
	}
endscript
