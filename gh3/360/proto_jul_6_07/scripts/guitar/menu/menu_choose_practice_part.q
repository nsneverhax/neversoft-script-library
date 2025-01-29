menu_choose_practice_part_font = fontgrid_title_gh3

script create_choose_practice_part_menu 
	printf "create_choose_practice_part_menu"
	spawnscriptnow menu_music_on
	kill_start_key_binding
	set_focus_color rgba = ($default_menu_focus_color)
	set_unfocus_color rgba = ($default_menu_unfocus_color)
	menu_pos = (780.0, 255.0)
	createscreenelement {
		type = containerelement
		id = cpp_container
		parent = root_window
		just = [left top]
		pos = (0.0, 0.0)
	}
	new_menu scrollid = cpp_scroll vmenuid = cpp_vmenu menu_pos = <menu_pos> spacing = -20
	create_menu_backdrop texture = venue_bg
	createscreenelement {
		type = spriteelement
		parent = cpp_container
		texture = venue_overlay
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z_priority = 99
	}
	displaysprite {
		parent = cpp_container
		tex = practice_poster_3
		pos = (186.0, 15.0)
		dims = (672.0, 672.0)
		rot_angle = -2
		z = 1
	}
	displaysprite {
		parent = cpp_container
		tex = toprockers_tape_2
		pos = (500.0, 650.0)
		z = 3
		rot_angle = -12
		flip_v
	}
	displaysprite {
		parent = cpp_container
		tex = toprockers_tape_1
		pos = (565.0, -95.0)
		z = 3
		rot_angle = 80
	}
	displaysprite {
		parent = cpp_container
		tex = toprockers_tape_2
		pos = (500.0, -85.0)
		z = 3
		rot_angle = 80
	}
	displaysprite {
		parent = cpp_container
		tex = toprockers_tape_2
		pos = (435.0, -75.0)
		z = 3
		rot_angle = 78
	}
	createscreenelement {
		type = textblockelement
		parent = cpp_container
		id = header
		text = "PRACTICE PART"
		pos = (375.0, 70.0)
		dims = (100.0, 300.0)
		scale = 1.5
		just = [left top]
		internal_just = [left top]
		line_spacing = 0.62
		rgba = [35 100 130 255]
		font = ($menu_choose_practice_part_font)
		z = 2
		rot_angle = -2
	}
	displaysprite {
		parent = cpp_container
		tex = dialog_bg
		pos = (680.0, 256.0)
		dims = (332.0, 70.0)
		z = 2
	}
	displaysprite {
		parent = cpp_container
		tex = dialog_bg
		flip_h
		pos = (680.0, 326.0)
		dims = (332.0, 70.0)
		z = 2
	}
	displaysprite {
		id = cpp_hi_left
		parent = cpp_container
		tex = dialog_highlight
		flip_v
		pos = (720.0, 325.0)
		z = 5
	}
	displaysprite {
		id = cpp_hi_right
		parent = cpp_container
		tex = dialog_highlight
		pos = (910.0, 325.0)
		z = 5
	}
	set_focus_color rgba = [130 0 0 250]
	set_unfocus_color rgba = [0 0 0 255]
	createscreenelement {
		type = textelement
		font = ($menu_choose_practice_part_font)
		parent = cpp_vmenu
		text = "GUITAR"
		scale = (1.0, 0.0, 1.0)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{focus menu_choose_practice_part_highlighter params = {guitar}}
			{unfocus retail_menu_unfocus}
			{pad_choose practicemenu_select_part params = {part = guitar}}
			{pad_back practicemenu_go_back}
		]
		font_spacing = 0
		z_priority = 5
	}
	createscreenelement {
		type = textelement
		font = ($menu_choose_practice_part_font)
		parent = cpp_vmenu
		text = "BASS"
		scale = (1.0, 0.0, 1.0)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{focus menu_choose_practice_part_highlighter params = {bass}}
			{unfocus retail_menu_unfocus}
			{pad_choose practicemenu_select_part params = {part = rhythm}}
			{pad_back practicemenu_go_back}
		]
		font_spacing = 0
		z_priority = 5
	}
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
endscript

script menu_choose_practice_part_highlighter 
	<0xf9074c56> = (705.0, 290.0)
	<0xcee6abc5> = (925.0, 290.0)
	<0x600e1dec> = (720.0, 332.0)
	<0x57effa7f> = (910.0, 332.0)
	if gotparam \{guitar}
		setscreenelementprops id = cpp_hi_left pos = <0xf9074c56> preserve_flip
		setscreenelementprops id = cpp_hi_right pos = <0xcee6abc5>
	elseif gotparam \{bass}
		setscreenelementprops id = cpp_hi_left pos = <0x600e1dec> preserve_flip
		setscreenelementprops id = cpp_hi_right pos = <0x57effa7f>
	endif
endscript

script destroy_choose_practice_part_menu 
	destroy_pause_menu_frame
	restore_start_key_binding
	destroy_menu_backdrop
	destroy_menu \{menu_id = cpp_scroll}
	destroy_menu \{menu_id = cpp_container}
	clean_up_user_control_helpers
	set_focus_color rgba = ($default_menu_focus_color)
	set_unfocus_color rgba = ($default_menu_unfocus_color)
endscript

script practicemenu_select_part 
	change structurename = player1_status part = <part>
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script practicemenu_go_back 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript
