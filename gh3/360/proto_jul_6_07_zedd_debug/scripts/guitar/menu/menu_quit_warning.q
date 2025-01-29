
script create_quit_warning_menu player = 1 option1_text = "CANCEL" option2_text = "QUIT"
	disable_pause
	header_font = fontgrid_title_gh3
	menu_font = fontgrid_title_gh3
	warning_text_pos = (640.0, 177.0)
	quit_warning_text_dims = (650.0, 300.0)
	quit_warning_text_pos = (640.0, 290.0)
	if NOT gotparam menu_pos
		menu_pos = (560.0, 475.0)
	endif
	z = 100.0
	offwhite = [223 223 223 255]
	new_menu scrollid = 0xc0f1686a vmenuid = 0x73cbf293 use_backdrop = (0) menu_pos = <menu_pos> spacing = -20 exclusive_device = ($last_start_pressed_device)
	create_pause_menu_frame z = (<z> - 10)
	createscreenelement {
		type = containerelement
		parent = root_window
		id = 0x48b4c386
		pos = (0.0, 0.0)
	}
	displaysprite parent = 0x48b4c386 tex = dialog_title_bg flip_v pos = (416.0, 100.0) scale = (1.75, 1.75) z = <z>
	displaysprite parent = 0x48b4c386 tex = dialog_title_bg pos = (640.0, 100.0) scale = (1.75, 1.75) z = <z>
	createscreenelement {
		type = textelement
		parent = 0x48b4c386
		font = <header_font>
		text = "WARNING"
		rgba = [223 223 223 250]
		just = [center top]
		scale = 1.3499999
		pos = <warning_text_pos>
		z_priority = (<z> + 0.1)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textblockelement
		parent = 0x48b4c386
		font = <menu_font>
		text = "You will lose all unsaved progress if you quit. Are you sure you want to quit this song?"
		rgba = [210 210 210 250]
		just = [center top]
		scale = (0.7, 0.6)
		pos = <quit_warning_text_pos>
		dims = <quit_warning_text_dims>
		z_priority = (<z> + 0.1)
	}
	if NOT gotparam bg_dims
		bg_dims = (320.0, 80.0)
	endif
	displaysprite parent = 0x48b4c386 tex = dialog_bg pos = (640.0, 450.0) dims = <bg_dims> z = <z> just = [center top]
	pos = ((<bg_dims>.(0.0, 1.0) * (0.0, 1.0)) + (640.0, 450.0))
	displaysprite parent = 0x48b4c386 tex = dialog_bg flip_h pos = <pos> dims = <bg_dims> z = <z> just = [center top]
	displaysprite parent = 0x48b4c386 tex = white pos = (492.0, 517.0) scale = (75.0, 6.0) z = (<z> + 0.1) rgba = <offwhite>
	if NOT gotparam no_joiners
		displaysprite parent = 0x48b4c386 tex = dialog_frame_joiner pos = (480.0, 510.0) rot_angle = 5 scale = (1.575, 1.5) z = (<z> + 0.2)
		displaysprite parent = 0x48b4c386 tex = dialog_frame_joiner pos = (750.0, 514.0) flip_v rot_angle = -5 scale = (1.575, 1.5) z = (<z> + 0.2)
	endif
	displaysprite id = hi_right parent = 0x48b4c386 tex = dialog_highlight pos = (770.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	displaysprite id = hi_left parent = 0x48b4c386 tex = dialog_highlight flip_v pos = (500.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	set_focus_color rgba = [180 50 50 255]
	set_unfocus_color rgba = [0 0 0 255]
	text_scale = (1.2, 1.25)
	createscreenelement {
		type = textelement
		parent = 0x73cbf293
		id = 0x0dec9853
		font = <header_font>
		scale = <text_scale>
		rgba = [180 50 50 255]
		text = <option1_text>
		just = [left top]
		z_priority = (<z> + 0.1)
		event_handlers = [
			{focus 0x1e67f6d5 params = {text_id = 0x0dec9853}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = go_back}}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0x73cbf293
		id = 0x718dbd88
		font = <header_font>
		scale = <text_scale>
		rgba = [0 0 0 255]
		text = <option2_text>
		just = [left top]
		z_priority = (<z> + 0.1)
		event_handlers = [
			{focus 0x878590d4 params = {text_id = 0x718dbd88}}
			{unfocus retail_menu_unfocus}
			{pad_choose quit_warning_select_quit params = {player = <player>}}
		]
	}
	0x1e67f6d5 id = 0x0dec9853 text_id = 0x0dec9853
endscript

script destroy_quit_warning_menu 
	enable_pause
	destroy_menu \{menu_id = 0xc0f1686a}
	destroy_menu \{menu_id = 0x48b4c386}
	destroy_pause_menu_frame
endscript

script 0xad06246d 
	destroy_quit_warning_menu
	create_quit_warning_menu
endscript

script quit_warning_select_quit \{player = 1}
	ui_flow_manager_respond_to_action action = continue create_params = {player = <player>}
endscript

script 0xb3da904e 
	retail_menu_focus
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			setscreenelementprops \{id = hi_left
				pos = (485.0, 480.0)
				flip_v}
			setscreenelementprops \{id = hi_right
				pos = (740.0, 480.0)}
		endif
	endif
endscript

script 0x1e67f6d5 \{text_id = 0x9f8d54f0}
	retail_menu_focus <...>
	getscreenelementdims id = <text_id>
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			setscreenelementprops id = hi_left pos = ((635.0, 480.0) - (<width> * (0.5, 0.0))) flip_v just = [right top]
			setscreenelementprops id = hi_right pos = ((650.0, 480.0) + (<width> * (0.5, 0.0))) just = [left top]
		endif
	endif
endscript

script 0x878590d4 \{text_id = 0x9f8d54f0}
	retail_menu_focus <...>
	getscreenelementdims id = <text_id>
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			setscreenelementprops id = hi_left pos = ((635.0, 540.0) - (<width> * (0.5, 0.0))) flip_v just = [right top]
			setscreenelementprops id = hi_right pos = ((650.0, 540.0) + (<width> * (0.5, 0.0))) just = [left top]
		endif
	endif
endscript
