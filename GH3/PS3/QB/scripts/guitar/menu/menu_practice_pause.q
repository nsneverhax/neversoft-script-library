
script create_practice_pause_menu 
	if ($view_mode)
		return
	endif
	safe_create_gh3_pause_menu
	new_menu scrollid = scrolling_pause vmenuid = vmenu_pause Menu_pos = (0.0, 245.0) Spacing = -12 use_backdrop = (0)
	SetScreenElementProps \{Id = vmenu_pause
		internal_just = [
			Center
			Top
		]
		Dims = (1280.0, 720.0)}
	Z = 100
	create_pause_menu_frame x_scale = 1.2 Z = (<Z> - 10)
	Scale = 1
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		Scale = <Scale>
		rgba = [210 130 0 250]
		Text = "RESUME"
		just = [LEFT Top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{Focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose gh3_start_pressed}
		]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		Scale = <Scale>
		rgba = [210 130 0 250]
		Text = "RESTART"
		just = [LEFT Top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{Focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_restart}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		Scale = <Scale>
		rgba = [210 130 0 250]
		Text = "CHANGE SPEED"
		just = [LEFT Top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{Focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_change_speed}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		Scale = <Scale>
		rgba = [210 130 0 250]
		Text = "CHANGE SECTION"
		just = [LEFT Top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{Focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_change_section}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		Scale = <Scale>
		rgba = [210 130 0 250]
		Text = "NEW SONG"
		just = [LEFT Top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{Focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_new_song}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		Scale = <Scale>
		rgba = [210 130 0 250]
		Id = quit_id
		Text = "QUIT"
		just = [LEFT Top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{Focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_quit}}
		]
	}
	switch ($came_to_practice_from)
		case Career
		quit_id :SetProps \{Text = "QUIT TO CAREER SETLIST"}
		case QUICKPLAY
		quit_id :SetProps \{Text = "QUIT TO QUICKPLAY SETLIST"}
	endswitch
endscript

script destroy_practice_pause_menu 
	destroy_menu \{menu_id = scrolling_pause}
	destroy_menu \{menu_id = pause_menu_frame_container}
endscript
