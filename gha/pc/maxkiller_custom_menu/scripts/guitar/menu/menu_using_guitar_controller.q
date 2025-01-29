menu_using_guitar_controller_font = text_a4
menu_using_guitar_controller_kb = 0

script create_using_guitar_controller_menu \{keyboard = 0}
	create_menu_backdrop \{texture = boot_usingguitar_bg
		z_priority = 1000}
	if iswinport
		change menu_using_guitar_controller_kb = <keyboard>
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = ugc_container
		pos = (0.0, 0.0)
		z_priority = 1000}
	guitar_tex = boot_usingguitar_gtr_lespaul
	getplatform
	switch <platform>
		case ps3
		<guitar_tex> = boot_usingguitar_gtr_lespaul_ps3
	endswitch
	if iswinport
		guitar_scale = (1.0, 1.0)
		guitar_pos = (660.0, 510.0)
		if ($menu_using_guitar_controller_kb = 1)
			guitar_scale = (1.2, 1.2)
			guitar_pos = (670.0, 510.0)
			if notismacport
				guitar_tex = boot_usingkeyboard
				if german
					guitar_tex = boot_usingkeyboard_g
				elseif french
					guitar_tex = boot_usingkeyboard_f
				elseif italian
					guitar_tex = boot_usingkeyboard_i
				elseif spanish
					guitar_tex = boot_usingkeyboard_s
				elseif korean
					guitar_tex = boot_usingkeyboard_k
				endif
			else
				guitar_tex = boot_usingmackeyboard
				if german
					guitar_tex = boot_usingmackeyboard_g
				elseif french
					guitar_tex = boot_usingmackeyboard_f
				elseif italian
					guitar_tex = boot_usingmackeyboard_i
				elseif spanish
					guitar_tex = boot_usingmackeyboard_s
				endif
			endif
		endif
	endif
	if iswinport
		using_tex = boot_usingguitar_illo
		using_pos = (640.0, 270.0)
		helper_bg_dims = (223.25, 40.0)
		if ($menu_using_guitar_controller_kb = 1)
			using_tex = boot_usingkeyboard_illo
			using_pos = (641.0, 242.0)
			helper_bg_dims = (221.0, 40.0)
		endif
	endif
	createscreenelement {
		type = spriteelement
		parent = ugc_container
		id = bg_helper
		texture = white
		rgba = [0 0 0 255]
		dims = <helper_bg_dims>
		just = [center top]
		pos = (-200.0, 0.0)
		z_priority = 1001
	}
	createscreenelement \{type = textelement
		parent = ugc_container
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
		noshadow
		z_priority = 1002}
	createscreenelement {
		type = spriteelement
		parent = ugc_container
		texture = <guitar_tex>
		pos = <guitar_pos>
		scale = <guitar_scale>
		just = [center center]
		z_priority = 1003
	}
	createscreenelement {
		type = spriteelement
		parent = ugc_container
		texture = <using_tex>
		pos = <using_pos>
		just = [center center]
		z_priority = 1004
	}
	if ($menu_using_guitar_controller_kb = 0)
		menu_using_guitar_controller_add_text_start
		menu_using_guitar_controller_add_text_back
		menu_using_guitar_controller_add_text_continue
		menu_using_guitar_controller_add_text_up_down
		menu_using_guitar_controller_add_text_tilt_starpower
	endif
	menu_using_guitar_controller_add_text_header
	spawnscriptnow \{go_through_using_guitar_text}
	getenterbuttonassignment
	if (<assignment> = circle)
		spawnscriptnow \{check_for_any_input
			params = {
				use_primary_controller
				button1 = start
				button2 = circle
			}}
	else
		spawnscriptnow \{check_for_any_input
			params = {
				use_primary_controller
				button1 = start
				button2 = x
			}}
	endif
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
		bg_helper :domorph \{alpha = 0
			time = 0.2}
		setscreenelementprops \{id = bg_helper
			pos = (407.0, 135.0)}
		bg_helper :domorph \{alpha = 1
			time = 0.2}
	endif
	if screenelementexists \{id = bg_helper_text}
		if ($menu_using_guitar_controller_kb = 1)
			setscreenelementprops \{id = bg_helper_text
				pos = (407.0, 130.0)
				text = "1) BOOT UP"}
		else
			setscreenelementprops \{id = bg_helper_text
				pos = (407.0, 130.0)
				text = "1) STRAP"}
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
		bg_helper :domorph \{alpha = 0
			time = 0.2}
		setscreenelementprops \{id = bg_helper
			pos = (640.0, 135.0)}
		bg_helper :domorph \{alpha = 1
			time = 0.2}
	endif
	if screenelementexists \{id = bg_helper_text}
		if ($menu_using_guitar_controller_kb = 1)
			setscreenelementprops \{id = bg_helper_text
				pos = (640.0, 130.0)
				text = "2) BANG HEAD"}
		else
			setscreenelementprops \{id = bg_helper_text
				pos = (640.0, 130.0)
				text = "2) LOCK"}
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
		bg_helper :domorph \{alpha = 0
			time = 0.2}
		setscreenelementprops \{id = bg_helper
			pos = (873.0, 135.0)}
		bg_helper :domorph \{alpha = 1
			time = 0.2}
	endif
	if screenelementexists \{id = bg_helper_text}
		if ($menu_using_guitar_controller_kb = 1)
			setscreenelementprops \{id = bg_helper_text
				pos = (873.0, 130.0)
				text = "3) LOSE CONTROL"}
		else
			setscreenelementprops \{id = bg_helper_text
				pos = (873.0, 130.0)
				text = "3) ROCK"}
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
	repeat
endscript

script menu_using_guitar_controller_add_text_start 
	text1 = "START"
	text1_pos = (755.0, 585.0)
	text2 = "button"
	text2_pos = (753.0, 618.0)
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
	text1_pos = (460.0, 582.0)
	text2 = "Red Button"
	text2_pos = (460.0, 615.0)
	getenterbuttonassignment
	if (<assignment> = circle)
		text1 = "CONTINUE"
		text1_pos = (460.0, 582.0)
		text2 = "Red Button"
		text2_pos = (460.0, 615.0)
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
	text1_pos = (390.0, 582.0)
	text2 = "Green Button"
	text2_pos = (390.0, 615.0)
	getenterbuttonassignment
	if (<assignment> = circle)
		text1 = "BACK"
		text1_pos = (390.0, 582.0)
		text2 = "Green Button"
		text2_pos = (390.0, 615.0)
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
	text1_pos = (570.0, 390.0)
	text2 = "Strum Bar"
	text2_pos = (570.0, 423.0)
	if ((iswinport) && (spanish))
		text1_pos = (555.0, 390.0)
	endif
	if ((iswinport) && (german))
		text1_pos = (548.0, 390.0)
	endif
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
	text1_pos = (280.0, 380.0)
	text2 = "for Star Power"
	text2_pos = (280.0, 413.0)
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
		pos = (270.0, 460.0)
		just = [
			right
			center
		]}
endscript

script menu_using_guitar_controller_add_text_header 
	text1 = "ROCK THIS WAY"
	text1_pos = (660.0, 55.0)
	if ($menu_using_guitar_controller_kb = 1)
		text2 = "USING THE KEYBOARD AND MOUSE"
	else
		text2 = "USING THE GUITAR CONTROLLER"
	endif
	text2_pos = (660.0, 95.0)
	createscreenelement {
		type = textelement
		text = <text1>
		pos = <text1_pos>
		parent = ugc_container
		rgba = [185 95 100 255]
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
		scale = (0.8, 0.7)
	}
endscript
