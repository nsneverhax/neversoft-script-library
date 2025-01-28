wii_trc_menu_font = text_a4

script create_wii_saveload_screen \{header = ''
		message = ''}
	create_menu_backdrop \{texture = 0xbda79d97}

	createscreenelement \{type = containerelement
		parent = root_window
		id = wii_trc_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	z = 4
	displaysprite parent = wii_trc_container tex = dialog_title_bg flip_v pos = (340.0, 0.0) dims = (300.0, 224.0) z = <z>
	displaysprite parent = wii_trc_container tex = dialog_title_bg pos = (640.0, 0.0) dims = (300.0, 224.0) z = <z>
	get_string_wii message = <message>
	text_params = {
		header = <header>
		message = <localized_string>
	}
	create_wii_trc_text <text_params>
endscript

script destroy_wii_saveload_screen 
	destroy_wii_trc_menu
endscript

script create_wii_trc_menu \{header = ''
		message = ''
		option1_text = ''
		option2_text = ''
		option1_script = empty_script
		option2_script = empty_script
		option1_params = {
		}
		option2_params = {
		}}
	wait \{1
		gameframes}
	if ($ismenumusicon = 1)
		menu_music_off \{setflag = 1}
		change \{restartmenumusic = 1}
	endif
	createscreenelement \{type = vscrollingmenu
		parent = root_window
		id = sd_warning_scroll
		just = [
			center
			top
		]
		dims = (1280.0, 200.0)
		pos = (1280.0, 535.0)
		z_priority = 1}
	createscreenelement \{type = vmenu
		parent = sd_warning_scroll
		id = sd_warning_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		internal_just = [
			center
			top
		]
		event_handlers = $default_event_handlers}
	create_wii_saveload_screen <...>
	set_focus_color \{rgba = [
			130
			0
			0
			250
		]}
	set_unfocus_color \{rgba = [
			0
			0
			0
			255
		]}
	offwhite = [223 223 223 255]
	z = 4
	displaysprite id = trc_dialog_top parent = wii_trc_container tex = dialog_bg pos = (430.0, 500.0) dims = (440.0, 75.0) z = <z>
	displaysprite id = trc_dialog_bottom parent = wii_trc_container tex = dialog_bg flip_h pos = (430.0, 565.0) dims = (440.0, 75.0) z = <z>
	displaysprite id = hi_right parent = wii_trc_container tex = dialog_highlight pos = (770.0, 573.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	displaysprite id = hi_left parent = wii_trc_container tex = dialog_highlight flip_v pos = (500.0, 573.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	option_params = {
		option1_text = <option1_text>
		option2_text = <option2_text>
		option1_script = <option1_script>
		option2_script = <option2_script>
		option1_params = <option1_params>
		option2_params = <option2_params>
	}
	create_wii_trc_menu_options <option_params>
	wait \{1
		gameframes}
	ps2_trc_refit_dialog_box
	wait \{1
		gameframes}
	if screenelementexists \{id = trc_option_yes}
		menu_ps2_trc_highlight_yes
	endif
	launchevent \{type = focus
		target = sd_warning_vmenu}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
endscript

script destroy_wii_trc_menu 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu_backdrop
	destroy_menu \{menu_id = sd_warning_scroll}
	destroy_menu \{menu_id = wii_trc_container}
endscript

script refresh_wii_trc_menu 
	destroy_wii_trc_menu
	create_wii_trc_menu <...>
endscript

script create_wii_trc_text 
	createscreenelement {
		type = textelement
		font = ($wii_trc_menu_font)
		text = <header>
		just = [center center]
		pos = (640.0, 100.0)
		scale = 1.1
		parent = wii_trc_container
		rgba = [200 200 200 255]
		shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 6
	}
	createscreenelement {
		type = textelement
		font = ($wii_trc_menu_font)
		text = <header>
		just = [center center]
		pos = (640.0, 105.0)
		scale = 1.1
		parent = wii_trc_container
		rgba = [0 0 0 0]
		shadow
		shadow_offs = (-4.0, -1.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 6
	}
	createscreenelement {
		type = textblockelement
		font = ($wii_trc_menu_font)
		text = <message>
		just = [center center]
		pos = (640.0, 340.0)
		dims = (800.0, 600.0)
		scale = 0.75
		parent = wii_trc_container
		rgba = [200 200 200 250]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 6
	}
endscript

script create_wii_trc_menu_options 
	createscreenelement {
		type = textelement
		font = ($wii_trc_menu_font)
		parent = sd_warning_vmenu
		text = <option1_text>
		just = [center top]
		scale = (0.75, 0.85)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus menu_wii_trc_highlight_yes}
			{unfocus retail_menu_unfocus}
			{pad_choose <option1_script> params = <option1_params>}
		]
		z_priority = 5
		id = trc_option_yes
	}
	createscreenelement {
		type = textelement
		font = ($wii_trc_menu_font)
		parent = sd_warning_vmenu
		text = <option2_text>
		just = [center top]
		scale = (0.75, 0.85)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus menu_wii_trc_highlight_no}
			{unfocus retail_menu_unfocus}
			{pad_choose <option2_script> params = <option2_params>}
		]
		z_priority = 5
		id = trc_option_no
	}
endscript

script menu_wii_trc_highlight_yes 
	retail_menu_focus \{id = trc_option_yes}
	get_trc_hilite_positions_wii \{id = trc_option_yes}
	setscreenelementprops id = hi_left pos = <left_hilite_pos> flip_v
	setscreenelementprops id = hi_right pos = <right_hilite_pos>
endscript

script menu_wii_trc_highlight_no 
	retail_menu_focus \{id = trc_option_no}
	get_trc_hilite_positions_wii \{id = trc_option_no}
	setscreenelementprops id = hi_left pos = <left_hilite_pos> flip_v
	setscreenelementprops id = hi_right pos = <right_hilite_pos>
endscript

script get_trc_hilite_positions_wii \{id = trc_option_yes}
	wii_trc_get_option_bounds id = <id>
	getscreenelementdims \{id = hi_left}
	hilite_width = <width>
	left_hilite_pos = ((<option_left_x> - (<hilite_width> + 15)) * (1.0, 0.0) + <option_y> * (0.0, 1.0))
	right_hilite_pos = ((<option_right_x> + 15) * (1.0, 0.0) + <option_y> * (0.0, 1.0))
	return left_hilite_pos = <left_hilite_pos> right_hilite_pos = <right_hilite_pos>
endscript

script wii_trc_get_option_bounds \{id = trc_option_yes}
	getscreenelementposition id = <id> absolute
	getscreenelementdims id = <id>
	option_left_x = (<screenelementpos>.(1.0, 0.0))
	option_right_x = (<option_left_x> + <width>)
	option_y = (<screenelementpos>.(0.0, 1.0))
	return <...>
endscript

script wii_trc_refit_dialog_box 
	if screenelementexists \{id = trc_option_yes}
		wii_trc_get_option_bounds \{id = trc_option_yes}
		left_x = <option_left_x>
		right_x = <option_right_x>
	endif
	if screenelementexists \{id = trc_option_no}
		wii_trc_get_option_bounds \{id = trc_option_no}
		if gotparam \{left_x}
			if (<option_left_x> < <left_x>)
				<left_x> = <option_left_x>
			endif
			if (<option_right_x> > <right_x>)
				<right_x> = <option_right_x>
			endif
		endif
	endif
	if gotparam \{left_x}
		0xf21596b2 = ((<right_x> - <left_x>) * 0.5)
		setscreenelementprops id = sd_warning_vmenu pos = ((-1.0, 0.0) * <0xf21596b2> + (0.0, 1.0))
		left_x = (<left_x> - 68)
		right_x = (<right_x> + 68)
		0x56edb000 = (<left_x> - 30 - <0xf21596b2>)
		0xd7d9e9a5 = (<right_x> + 30 - <0xf21596b2>)
		0xb8ab4b07 = (<0xd7d9e9a5> - <0x56edb000>)
		getscreenelementposition \{id = trc_dialog_top}
		getscreenelementdims \{id = trc_dialog_top}
		0x792eb1dc = (<screenelementpos>.(0.0, 1.0))
		setscreenelementprops id = trc_dialog_top pos = (<0x56edb000> * (1.0, 0.0) + <0x792eb1dc> * (0.0, 1.0)) dims = (<0xb8ab4b07> * (1.0, 0.0) + <height> * (0.0, 1.0)) just = [left top]
		getscreenelementposition \{id = trc_dialog_bottom}
		0x1348e287 = (<screenelementpos>.(0.0, 1.0))
		setscreenelementprops id = trc_dialog_bottom pos = (<0x56edb000> * (1.0, 0.0) + <0x1348e287> * (0.0, 1.0)) dims = (<0xb8ab4b07> * (1.0, 0.0) + <height> * (0.0, 1.0)) just = [left top] flip_h
	endif
endscript
