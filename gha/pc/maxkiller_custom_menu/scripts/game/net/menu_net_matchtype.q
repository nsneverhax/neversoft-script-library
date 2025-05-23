
script create_mp_select_match_type_menu \{menu_title = "CREATE MATCH"
		menu_subtitle = "MATCH TYPE"
		menu_id = create_match_type_menu
		vmenu_id = create_match_type_vmenu}
	createscreenelement \{type = containerelement
		parent = root_window
		id = online_menu_ui_container
		pos = (0.0, 0.0)}
	createscreenelement {
		type = vscrollingmenu
		parent = online_menu_ui_container
		id = <menu_id>
		just = [center top]
		dims = (256.0, 350.0)
		pos = (($online_general_menu_pos) + (0.0, 142.0))
		z_priority = 1
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = ((128.0, 0.0) + (0.0, 0.0))
		just = [center top]
		internal_just = [center center]
		dims = (256.0, 350.0)
		padding_scale = 1.0
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = online_background}
	frame_dims = (280.0, 600.0)
	center_pos = (($online_general_menu_pos) + (0.0, 300.0))
	create_ui_frame {
		parent = online_menu_ui_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($g_menu_colors).online_fill_rgba)
		z_priority = 2
	}
	createscreenelement {
		type = spriteelement
		id = online_frame_crown
		parent = online_menu_ui_container
		texture = online_frame_crown
		pos = (($online_general_menu_pos) + (2.0, -28.0))
		dims = (192.0, 96.0)
		just = [center top]
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		id = online_title_bar
		parent = online_menu_ui_container
		texture = char_select_frame_bg2
		rgba = ($online_light_blue)
		pos = (($online_general_menu_pos) + (0.0, 158.0))
		dims = (268.0, 128.0)
		just = [center center]
		z_priority = 3
	}
	displaysprite id = online_highlight parent = online_menu_ui_container tex = hilite_bar_01 rgba = ($online_light_blue) pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (632.0, 0.0)) dims = (288.0, 40.0) just = [center top] z = 3
	displaysprite id = online_bookend1 parent = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (470.0, 20.0)) dims = (40.0, 40.0) just = [center center] z = 3 flip_v
	displaysprite id = online_bookend2 parent = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (806.0, 20.0)) dims = (40.0, 40.0) just = [center center] z = 3
	createscreenelement {
		type = textelement
		parent = online_menu_ui_container
		font = text_a4
		scale = (0.65000004, 0.75)
		rgba = ($online_medium_blue)
		text = <menu_title>
		just = [center top]
		pos = (($online_general_menu_pos) + (0.0, 56.0))
		z_priority = 3.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	createscreenelement {
		type = textelement
		parent = online_menu_ui_container
		font = fontgrid_title_gh3
		scale = (0.65000004, 0.8)
		rgba = ($online_dark_purple)
		text = <menu_subtitle>
		just = [center top]
		pos = (($online_general_menu_pos) + (0.0, 140.0))
		z_priority = 4.0
	}
	fit_text_into_menu_item id = <id> max_width = 243
	selectable_menu_items = 0
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		text = "PLAYER MATCH"
		just = [left top]
		z_priority = 4.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	<id> :settags menu_item = <selectable_menu_items>
	<id> :setprops event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_match_type params = {type = player}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		text = "RANKED MATCH"
		just = [left top]
		z_priority = 4.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	<id> :settags menu_item = <selectable_menu_items>
	<id> :setprops event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_match_type params = {type = ranked}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	set_online_menu_highlight_pos menu_items = <selectable_menu_items>
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	if ($num_user_control_helpers > 0)
		clean_up_user_control_helpers
	endif
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	launchevent type = focus target = <vmenu_id>
endscript

script destroy_mp_select_match_type_menu 
	if screenelementexists \{id = online_menu_ui_container}
		destroyscreenelement \{id = online_menu_ui_container}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script select_match_type 
	change match_type = <type>
	if (<type> = ranked)
		setnetworkpreference \{field = 'ranked'
			string = "ranked"
			checksum = ranked
			num = 0}
		setnetworkpreference {field = 'private_slots' string = ($num_private_slots [0].name) checksum = ($num_private_slots [0].checksum) num = 0}
	else
		setnetworkpreference \{field = 'ranked'
			string = "player"
			checksum = player
			num = 1}
	endif
	ui_flow_manager_respond_to_action \{action = select_match_type}
endscript

script online_general_menu_focus 
	if screenelementexists id = <id>
		retail_menu_focus
		<id> :gettags
		online_highlight :setprops pos = ((($online_general_menu_hi_lite_ypos [<menu_item>]) * (0.0, 1.0)) + (640.0, 0.0))
		online_bookend1 :setprops pos = ((($online_general_menu_hi_lite_ypos [<menu_item>]) * (0.0, 1.0)) + (476.0, 20.0)) preserve_flip
		online_bookend2 :setprops pos = ((($online_general_menu_hi_lite_ypos [<menu_item>]) * (0.0, 1.0)) + (804.0, 20.0))
	endif
endscript

script set_online_menu_highlight_pos \{menu_items = 2}
	switch <menu_items>
		case 2
		setarrayelement \{arrayname = online_general_menu_hi_lite_ypos
			globalarray
			index = 0
			newvalue = 339.875}
		setarrayelement \{arrayname = online_general_menu_hi_lite_ypos
			globalarray
			index = 1
			newvalue = 386.75}
		case 3
		setarrayelement \{arrayname = online_general_menu_hi_lite_ypos
			globalarray
			index = 0
			newvalue = 316.75}
		setarrayelement \{arrayname = online_general_menu_hi_lite_ypos
			globalarray
			index = 1
			newvalue = 363.625}
		setarrayelement \{arrayname = online_general_menu_hi_lite_ypos
			globalarray
			index = 2
			newvalue = 410.5}
		case 4
		setarrayelement \{arrayname = online_general_menu_hi_lite_ypos
			globalarray
			index = 0
			newvalue = 333.0}
		setarrayelement \{arrayname = online_general_menu_hi_lite_ypos
			globalarray
			index = 1
			newvalue = 380.875}
		setarrayelement \{arrayname = online_general_menu_hi_lite_ypos
			globalarray
			index = 2
			newvalue = 427.75}
		setarrayelement \{arrayname = online_general_menu_hi_lite_ypos
			globalarray
			index = 3
			newvalue = 474.625}
	endswitch
endscript
