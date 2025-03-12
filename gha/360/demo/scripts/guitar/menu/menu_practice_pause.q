
script create_practice_pause_menu 
	if ($view_mode)
		return
	endif
	safe_create_gh3_pause_menu
	new_menu scrollid = scrolling_pause vmenuid = vmenu_pause menu_pos = (0.0, 245.0) spacing = -12 use_backdrop = (0)
	setscreenelementprops \{id = vmenu_pause
		internal_just = [
			center
			top
		]
		dims = (1280.0, 720.0)}
	z = 100
	create_pause_menu_frame x_scale = 1.2 z = (<z> - 10)
	scale = 1
	createscreenelement {
		type = textelement
		parent = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		text = "RESUME"
		just = [left top]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose gh3_start_pressed}
		]
	}
	createscreenelement {
		type = textelement
		parent = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		text = "RESTART"
		just = [left top]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_restart}}
		]
	}
	createscreenelement {
		type = textelement
		parent = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		text = "CHANGE SPEED"
		just = [left top]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_change_speed}}
		]
	}
	createscreenelement {
		type = textelement
		parent = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		text = "CHANGE SECTION"
		just = [left top]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_change_section}}
		]
	}
	createscreenelement {
		type = textelement
		parent = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		text = "NEW SONG"
		just = [left top]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_new_song}}
		]
	}
	createscreenelement {
		type = textelement
		parent = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		id = quit_id
		text = "QUIT"
		just = [left top]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_quit}}
		]
	}
	switch ($came_to_practice_from)
		case career
		quit_id :setprops \{text = "QUIT TO CAREER SETLIST"}
		case quickplay
		quit_id :setprops \{text = "QUIT TO QUICKPLAY SETLIST"}
		case coop_quickplay
		quit_id :setprops \{text = "QUIT TO QUICKPLAY SETLIST"}
	endswitch
endscript

script destroy_practice_pause_menu 
	destroy_menu \{menu_id = scrolling_pause}
	destroy_menu \{menu_id = pause_menu_frame_container}
endscript
