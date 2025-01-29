lefty_flip_warning_menu_font = fontgrid_title_gh3

script create_lefty_flip_warning_menu 
	if NOT gotparam player
		scriptassert "Didn't get player param!"
	endif
	new_menu scrollid = 0x3c6d36a3 vmenuid = 0x22f4a67f menu_pos = (605.0, 470.0) spacing = -20 exclusive_device = ($last_start_pressed_device)
	set_focus_color rgba = [130 0 0 250]
	set_unfocus_color rgba = [0 0 0 255]
	createscreenelement {
		type = containerelement
		parent = root_window
		id = 0x78a76112
		pos = (0.0, 0.0)
		just = [left top]
	}
	offwhite = [223 223 223 255]
	z = 100
	displaysprite parent = 0x78a76112 tex = dialog_title_bg flip_v pos = (416.0, 60.0) scale = (1.75, 1.75) z = <z>
	displaysprite parent = 0x78a76112 tex = dialog_title_bg pos = (640.0, 60.0) scale = (1.75, 1.75) z = <z>
	displaysprite parent = 0x78a76112 tex = white pos = (525.0, 524.0) scale = (58.0, 6.0) z = (<z> + 0.1) rgba = <offwhite>
	displaysprite parent = 0x78a76112 tex = dialog_frame_joiner pos = (510.0, 510.0) rot_angle = 5 scale = (1.575, 1.5) z = (<z> + 0.2)
	displaysprite parent = 0x78a76112 tex = dialog_frame_joiner pos = (723.0, 514.0) flip_v rot_angle = -5 scale = (1.575, 1.5) z = (<z> + 0.2)
	displaysprite parent = 0x78a76112 tex = dialog_bg pos = (514.0, 467.0) scale = (1.0, 1.25) z = <z>
	displaysprite parent = 0x78a76112 tex = dialog_bg flip_h pos = (514.0, 537.0) scale = (1.0, 1.25) z = <z>
	displaysprite id = hi_right parent = 0x78a76112 tex = dialog_highlight pos = (770.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	displaysprite id = hi_left parent = 0x78a76112 tex = dialog_highlight flip_v pos = (500.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	create_pause_menu_frame x_scale = 1.2 z = (<z> - 10)
	0x59b5eb52 z = <z>
	0x0485df38 <...>
endscript

script destroy_lefty_flip_warning_menu 
	destroy_pause_menu_frame
	destroy_menu_backdrop
	destroy_menu \{menu_id = 0x3c6d36a3}
	destroy_menu \{menu_id = 0x78a76112}
endscript

script 0x59b5eb52 
	createscreenelement {
		type = textelement
		font = ($lefty_flip_warning_menu_font)
		text = "WARNING"
		just = [center center]
		pos = (640.0, 180.0)
		scale = 1.3
		parent = 0x78a76112
		rgba = [200 200 200 255]
		shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<z> + 6)
	}
	text = [
		"To change the lefty flip setting, this song must be restarted. "
		"You will lose all unsaved progress if you restart. "
		"Are you sure you want to continue?"
	]
	createscreenelement {
		type = textblockelement
		font = ($lefty_flip_warning_menu_font)
		text = <text>
		just = [center center]
		pos = (640.0, 365.0)
		dims = (700.0, 500.0)
		scale = (0.75, 0.65000004)
		parent = 0x78a76112
		rgba = [210 130 0 250]
		z_priority = (<z> + 6)
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
	}
endscript

script 0x0485df38 
	createscreenelement {
		type = textelement
		font = ($lefty_flip_warning_menu_font)
		parent = 0x22f4a67f
		text = "NO"
		scale = 1
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus 0x27be615d}
			{unfocus retail_menu_unfocus}
			{pad_choose 0x0c7deae6 params = {player = <player>}}
		]
		z_priority = (<z> + 5)
	}
	createscreenelement {
		type = textelement
		font = ($lefty_flip_warning_menu_font)
		parent = 0x22f4a67f
		text = "YES"
		scale = 1
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus 0x3f77eed1}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_lefty_flip_warning_select_yes params = {player = <player>}}
		]
		z_priority = (<z> + 5)
	}
endscript

script 0x27be615d 
	retail_menu_focus
	setscreenelementprops \{id = hi_left
		pos = (545.0, 502.0)
		flip_v}
	setscreenelementprops \{id = hi_right
		pos = (680.0, 502.0)}
endscript

script 0x3f77eed1 
	retail_menu_focus
	setscreenelementprops \{id = hi_left
		pos = (540.0, 548.0)
		flip_v}
	setscreenelementprops \{id = hi_right
		pos = (685.0, 548.0)}
endscript

script 0x0c7deae6 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script menu_lefty_flip_warning_select_yes 
	getglobaltags \{user_options}
	if (<player> = 1)
		if (<lefty_flip_p1> = 0)
			<lefty_flip_p1> = 1
		else
			<lefty_flip_p1> = 0
		endif
		setglobaltags user_options params = {lefty_flip_p1 = <lefty_flip_p1>}
	else
		if (<lefty_flip_p2> = 0)
			<lefty_flip_p2> = 1
		else
			<lefty_flip_p2> = 0
		endif
		setglobaltags user_options params = {lefty_flip_p2 = <lefty_flip_p2>}
	endif
	ui_flow_manager_respond_to_action \{action = continue}
endscript
