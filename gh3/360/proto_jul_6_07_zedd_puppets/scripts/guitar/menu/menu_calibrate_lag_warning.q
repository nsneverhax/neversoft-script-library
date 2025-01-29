calibrate_lag_warning_menu_font = fontgrid_title_gh3

script create_calibrate_lag_warning_menu 
	new_menu scrollid = 0x2e3c1973 vmenuid = 0xc4322626 menu_pos = (605.0, 473.0) spacing = -20 exclusive_device = ($last_start_pressed_device)
	set_focus_color rgba = [130 0 0 250]
	set_unfocus_color rgba = [0 0 0 255]
	createscreenelement {
		type = containerelement
		parent = root_window
		id = cl_container
		pos = (0.0, 0.0)
		just = [left top]
	}
	offwhite = [223 223 223 255]
	z = 100
	displaysprite parent = cl_container tex = dialog_title_bg flip_v pos = (416.0, 60.0) scale = (1.75, 1.75) z = <z>
	displaysprite parent = cl_container tex = dialog_title_bg pos = (640.0, 60.0) scale = (1.75, 1.75) z = <z>
	displaysprite parent = cl_container tex = white pos = (525.0, 524.0) scale = (58.0, 6.0) z = (<z> + 0.1) rgba = <offwhite>
	displaysprite parent = cl_container tex = dialog_frame_joiner pos = (510.0, 510.0) rot_angle = 5 scale = (1.575, 1.5) z = (<z> + 0.2)
	displaysprite parent = cl_container tex = dialog_frame_joiner pos = (723.0, 514.0) flip_v rot_angle = -5 scale = (1.575, 1.5) z = (<z> + 0.2)
	displaysprite parent = cl_container tex = dialog_bg pos = (514.0, 467.0) scale = (1.0, 1.25) z = <z>
	displaysprite parent = cl_container tex = dialog_bg flip_h pos = (514.0, 537.0) scale = (1.0, 1.25) z = <z>
	displaysprite id = hi_right parent = cl_container tex = dialog_highlight pos = (770.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	displaysprite id = hi_left parent = cl_container tex = dialog_highlight flip_v pos = (500.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	create_pause_menu_frame x_scale = 1.2 z = (<z> - 10)
	0x6c1752c9 z = <z>
	0xfe97faff z = <z>
endscript

script destroy_calibrate_lag_warning_menu 
	destroy_pause_menu_frame
	destroy_menu_backdrop
	destroy_menu \{menu_id = 0x2e3c1973}
	destroy_menu \{menu_id = cl_container}
endscript

script 0x6c1752c9 
	createscreenelement {
		type = textelement
		font = ($calibrate_lag_warning_menu_font)
		text = "WARNING"
		just = [center center]
		pos = (640.0, 180.0)
		scale = 1.3
		parent = cl_container
		rgba = [200 200 200 255]
		shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<z> + 6)
	}
	text = [
		"To calibrate lag, this song must be restarted. "
		"You will lose all unsaved progress if you restart. "
		"Are you sure you want to continue?"
	]
	createscreenelement {
		type = textblockelement
		font = ($calibrate_lag_warning_menu_font)
		text = <text>
		just = [center center]
		pos = (640.0, 360.0)
		dims = (700.0, 500.0)
		scale = 0.75
		parent = cl_container
		rgba = [210 130 0 250]
		z_priority = (<z> + 6)
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
	}
endscript

script 0xfe97faff 
	createscreenelement {
		type = textelement
		font = ($calibrate_lag_warning_menu_font)
		parent = 0xc4322626
		text = "NO"
		scale = 1
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus 0xd21cddc9}
			{unfocus retail_menu_unfocus}
			{pad_choose 0x9defee35}
		]
		z_priority = (<z> + 5)
	}
	createscreenelement {
		type = textelement
		font = ($calibrate_lag_warning_menu_font)
		parent = 0xc4322626
		text = "YES"
		scale = 1
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus 0xc8e01b30}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_calibrate_lag_warning_select_yes}
		]
		z_priority = (<z> + 5)
	}
endscript

script 0xd21cddc9 
	retail_menu_focus
	setscreenelementprops \{id = hi_left
		pos = (545.0, 502.0)
		flip_v}
	setscreenelementprops \{id = hi_right
		pos = (680.0, 502.0)}
endscript

script 0xc8e01b30 
	retail_menu_focus
	setscreenelementprops \{id = hi_left
		pos = (540.0, 548.0)
		flip_v}
	setscreenelementprops \{id = hi_right
		pos = (685.0, 548.0)}
endscript

script 0x9defee35 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script menu_calibrate_lag_warning_select_yes 
	ui_flow_manager_respond_to_action \{action = continue}
endscript
