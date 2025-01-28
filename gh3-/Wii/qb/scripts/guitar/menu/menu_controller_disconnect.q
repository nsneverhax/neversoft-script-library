
script create_controller_disconnect_menu 
	kill_start_key_binding
	destroy_menu \{menu_id = cd_static_text_container}
	createscreenelement \{type = containerelement
		parent = root_window
		id = cd_static_text_container
		pos = (0.0, 0.0)}
	if ($playing_song = 1)
		menu_pos = (550.0, 500.0)
		menu_z = 1000
		if isngc
			rocking_out_text = $wii_controller_unplugged
		else
			rocking_out_text = 'YOU ARE ROCKING OUT A BIT TOO HARD'
		endif
		rocking_out_off = (640.0, 160.0)
		rocking_out_dims = (500.0, 200.0)
		z = 3.0
		please_reconnect_off = (640.0, 270.0)
		please_reconnect_dims = (550.0, 300.0)
		offwhite = [223 223 223 255]
		formattext \{textname = please_reconnect_text
			'Please ensure a controller is connected properly'}
		menu_font = fontgrid_title_gh3
		new_menu {
			scrollid = cd_scrolling_menu
			vmenuid = cd_vmenu
			use_backdrop = 0
			menu_pos = <menu_pos>
			exclusive_device = ($unplugged_controller)
			spacing = -20
		}
		create_pause_menu_frame x_scale = 1.2 y_scale = 1.2 z = (<menu_z> - 10)
		createscreenelement {
			type = textblockelement
			parent = cd_static_text_container
			font = <menu_font>
			text = <rocking_out_text>
			pos = <rocking_out_off>
			dims = <rocking_out_dims>
			just = [center top]
			scale = 1.333
			rgba = [150 0 0 250]
			z_priority = <menu_z>
		}
		createscreenelement {
			type = textblockelement
			parent = cd_static_text_container
			font = <menu_font>
			text = <please_reconnect_text>
			pos = <please_reconnect_off>
			dims = <please_reconnect_dims>
			just = [center top]
			scale = 1.1333001
			rgba = [210 210 210 250]
			z_priority = <menu_z>
		}
		displaysprite parent = cd_static_text_container tex = dialog_bg pos = (448.0, 470.0) scale = (1.5, 1.5) z = <menu_z>
		displaysprite parent = cd_static_text_container tex = dialog_bg flip_h pos = (448.0, 550.0) scale = (1.5, 1.5) z = <menu_z>
		displaysprite parent = cd_static_text_container tex = white pos = (462.0, 550.0) scale = (89.0, 7.5) z = (<menu_z> + 0.1) rgba = <offwhite>
		displaysprite parent = cd_static_text_container tex = dialog_frame_joiner pos = (448.0, 540.0) rot_angle = 5 scale = (1.89, 1.875) z = (<menu_z> + 0.2)
		displaysprite parent = cd_static_text_container tex = dialog_frame_joiner pos = (770.0, 547.0) flip_v rot_angle = -5 scale = (1.89, 1.875) z = (<menu_z> + 0.2)
		displaysprite id = hi_right parent = cd_static_text_container tex = dialog_highlight pos = (770.0, 553.0) scale = (1.25, 1.25) z = (<menu_z> + 0.3)
		displaysprite id = hi_left parent = cd_static_text_container tex = dialog_highlight flip_v pos = (500.0, 553.0) scale = (1.25, 1.25) z = (<menu_z> + 0.3)
		set_focus_color \{rgba = [
				180
				50
				50
				255
			]}
		set_unfocus_color \{rgba = [
				0
				0
				0
				255
			]}
		text_scale = (1.6, 1.6669999)
		createscreenelement {
			type = textelement
			parent = cd_vmenu
			font = <menu_font>
			scale = <text_scale>
			rgba = [180 50 50 255]
			text = 'RESUME'
			just = [left top]
			z_priority = (<menu_z> + 0.2)
			event_handlers = [
				{focus controller_disconnect_resume_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose controller_disconnect_menu_select_resume}
			]
		}
		createscreenelement {
			type = textelement
			parent = cd_vmenu
			font = <menu_font>
			scale = <text_scale>
			rgba = [0 0 0 255]
			text = 'QUIT'
			just = [left top]
			z_priority = (<menu_z> + 0.2)
			event_handlers = [
				{focus controller_disconnect_quit_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose controller_disconnect_menu_select_quit}
			]
		}
	else
		blinker_pos = (750.0, 80.0)
		displaysprite {
			parent = cd_static_text_container
			id = controller_disconnect_pill
			tex = control_pill_fill
			dims = (384.0, 80.0)
			just = [center center]
			pos = <blinker_pos>
			rgba = [50 50 50 212]
			z = 100
		}
		displaytext {
			parent = cd_static_text_container
			id = controller_disconnect_text
			text = 'PLEASE RECONNECT CONTROLLER'
			pos = (<blinker_pos> + (0.0, -5.0))
			just = [center center]
			z = 101
			font = text_a10
			scale = 0.7
			rgba = [223 223 223 255]
		}
		spawnscriptnow \{menu_controller_disconnect_wait_for_reconnect}
	endif
endscript

script menu_controller_disconnect_wait_for_reconnect 
	begin
	change \{check_for_unplugged_controllers = 1}
	if guitargetanalogueinfo \{controller = $unplugged_controller}
		break
	endif
	waitonegameframe
	repeat
	if screenelementexists \{id = controller_disconnect_pill}
		doscreenelementmorph \{id = controller_disconnect_pill
			scale = 0
			time = 0.25
			relative_scale}
	endif
	if screenelementexists \{id = controller_disconnect_text}
		doscreenelementmorph \{id = controller_disconnect_text
			scale = 0
			time = 0.25}
	endif
	wait \{0.25
		seconds}
	controller_disconnect_menu_select_resume
endscript

script controller_disconnect_resume_focus 
	retail_menu_focus
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			setscreenelementprops \{id = hi_left
				pos = (470.0, 505.0)
				flip_v}
			setscreenelementprops \{id = hi_right
				pos = (735.0, 505.0)}
		endif
	endif
endscript

script controller_disconnect_quit_focus 
	retail_menu_focus
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			setscreenelementprops \{id = hi_left
				pos = (510.0, 565.0)
				flip_v}
			setscreenelementprops \{id = hi_right
				pos = (690.0, 565.0)}
		endif
	endif
endscript

script destroy_controller_disconnect_menu 
	destroy_menu \{menu_id = cd_scrolling_menu}
	destroy_pause_menu_frame
	destroy_menu \{menu_id = cd_static_text_container}
endscript

script controller_disconnect_menu_select_resume 
	restore_start_key_binding
	change \{check_for_unplugged_controllers = 1}
	if ($playing_song = 1)
		gh3_start_pressed
		ui_flow_manager_respond_to_action \{action = select_resume}
	else
		destroy_controller_disconnect_menu
	endif
endscript

script controller_disconnect_menu_select_quit 
	restore_start_key_binding
	change \{check_for_unplugged_controllers = 1}
	ui_flow_manager_respond_to_action \{action = select_quit}
endscript
