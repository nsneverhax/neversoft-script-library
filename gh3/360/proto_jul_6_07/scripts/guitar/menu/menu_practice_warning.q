
script create_practice_warning_menu 
	menu_font = fontgrid_title_gh3
	header_font = fontgrid_title_gh3
	0x26216813 = (640.0, 190.0)
	0x41a714ec = (645.0, 177.0)
	0x8fff55be = (640.0, 310.0)
	0xeaedc2fd = (580.0, 200.0)
	menu_pos = (540.0, 474.0)
	z = 100.0
	offwhite = [223 223 223 255]
	new_menu scrollid = 0xbc3248a1 vmenuid = 0x83d70c52 use_backdrop = 0 menu_pos = <menu_pos> spacing = -20
	create_pause_menu_frame z = (<z> - 10)
	createscreenelement {
		type = containerelement
		parent = root_window
		id = 0x3bc99fea
		pos = (0.0, 0.0)
	}
	displaysprite parent = 0x3bc99fea tex = dialog_title_bg flip_v pos = (416.0, 100.0) scale = (1.75, 1.75) z = <z>
	displaysprite parent = 0x3bc99fea tex = dialog_title_bg pos = (640.0, 100.0) scale = (1.75, 1.75) z = <z>
	createscreenelement {
		type = textelement
		parent = 0x3bc99fea
		font = <header_font>
		text = "WARNING"
		rgba = [223 223 223 250]
		just = [center top]
		scale = 1.3499999
		pos = {<0x41a714ec> relative}
		z_priority = (<z> + 1)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textblockelement
		parent = 0x3bc99fea
		font = <menu_font>
		text = "Your progress in this song will be lost if you exit to Practice now. Exit?"
		rgba = [210 210 210 250]
		just = [center top]
		scale = (0.7, 0.6)
		z_priority = (<z> + 1)
		pos = <0x8fff55be>
		dims = <0xeaedc2fd>
	}
	change menu_focus_color = [180 50 50 255]
	change menu_unfocus_color = [0 0 0 255]
	text_scale = (1.1, 1.25)
	displaysprite parent = 0x3bc99fea tex = white pos = (492.0, 517.0) scale = (75.0, 6.0) z = (<z> + 0.1) rgba = <offwhite>
	displaysprite parent = 0x3bc99fea tex = dialog_frame_joiner pos = (480.0, 510.0) rot_angle = 5 scale = (1.575, 1.5) z = (<z> + 0.2)
	displaysprite parent = 0x3bc99fea tex = dialog_frame_joiner pos = (750.0, 514.0) flip_v rot_angle = -5 scale = (1.575, 1.5) z = (<z> + 0.2)
	displaysprite id = hi_right parent = 0x3bc99fea tex = dialog_highlight pos = (770.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	displaysprite id = hi_left parent = 0x3bc99fea tex = dialog_highlight flip_v pos = (500.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	displaysprite parent = 0x3bc99fea tex = dialog_bg pos = (480.0, 450.0) scale = (1.25, 1.25) z = <z>
	displaysprite parent = 0x3bc99fea tex = dialog_bg flip_h pos = (480.0, 530.0) scale = (1.25, 1.25) z = <z>
	if NOT gotparam exclusive_device
		exclusive_device = ($primary_controller)
	endif
	createscreenelement {
		type = textelement
		parent = 0x83d70c52
		font = <menu_font>
		text = "CANCEL"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
		z_priority = (<z> + 0.1)
		event_handlers = [
			{focus 0x6cd822a7}
			{unfocus retail_menu_unfocus}
			{pad_choose practice_warning_menu_select_cancel}
		]
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	createscreenelement {
		type = textelement
		parent = 0x83d70c52
		font = <menu_font>
		text = "PRACTICE"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
		z_priority = (<z> + 0.1)
		event_handlers = [
			{focus 0x38319b9f}
			{unfocus retail_menu_unfocus}
			{pad_choose practice_warning_menu_select_practice}
		]
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	kill_start_key_binding
endscript

script destroy_practice_warning_menu 
	restore_start_key_binding
	destroy_menu \{menu_id = 0xbc3248a1}
	destroy_pause_menu_frame
	destroy_menu \{menu_id = 0x3bc99fea}
endscript

script practice_warning_menu_select_cancel 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script practice_warning_menu_select_practice 
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script 0x6cd822a7 
	retail_menu_focus
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			setscreenelementprops \{id = hi_left
				pos = (495.0, 480.0)
				flip_v}
			setscreenelementprops \{id = hi_right
				pos = (720.0, 480.0)}
		endif
	endif
endscript

script 0x38319b9f 
	retail_menu_focus
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			setscreenelementprops \{id = hi_left
				pos = (470.0, 540.0)
				flip_v}
			setscreenelementprops \{id = hi_right
				pos = (745.0, 540.0)}
		endif
	endif
endscript
