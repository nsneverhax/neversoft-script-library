
script create_mp_select_match_type_menu \{menu_title = qs(0x4d968017)
		menu_subtitle = qs(0xc23080be)
		menu_id = create_match_type_menu
		vmenu_id = create_match_type_vmenu}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = online_menu_ui_container
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = VScrollingMenu
		parent = online_menu_ui_container
		id = <menu_id>
		just = [center top]
		dims = (256.0, 350.0)
		Pos = (($online_general_menu_pos) + (0.0, 182.0))
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = ((128.0, 0.0) + (-8.0, 0.0))
		just = [center top]
		internal_just = [center center]
		dims = (256.0, 350.0)
		padding_scale = 1.5
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = xb_online_bg}
	CreateScreenElement {
		Type = TextElement
		parent = online_menu_ui_container
		font = fontgrid_text_a8
		Scale = (0.65000004, 0.75)
		rgba = ($online_medium_blue)
		text = <menu_title>
		just = [center top]
		Pos = (($online_general_menu_pos) + (-5.0, 32.0))
		z_priority = 3.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	CreateScreenElement {
		Type = TextElement
		parent = online_menu_ui_container
		font = fontgrid_title_a1
		Scale = (0.7, 0.75)
		rgba = ($online_dark_purple)
		text = <menu_subtitle>
		just = [center top]
		Pos = (($online_general_menu_pos) + (0.0, 115.0))
		z_priority = 4.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	selectable_menu_items = 0
	CreateScreenElement {
		Type = TextElement
		parent = <vmenu_id>
		font = fontgrid_title_a1
		Scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		text = qs(0x3489402d)
		just = [left top]
		z_priority = 4.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	<id> :SetTags menu_item = <selectable_menu_items>
	<id> :se_setprops event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_match_type params = {Type = Player}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	CreateScreenElement {
		Type = TextElement
		parent = <vmenu_id>
		font = fontgrid_title_a1
		Scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		text = qs(0xd6e06d82)
		just = [left top]
		z_priority = 4.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	<id> :SetTags menu_item = <selectable_menu_items>
	<id> :se_setprops event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_match_type params = {Type = Ranked}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	set_online_menu_highlight_pos menu_items = <selectable_menu_items>
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent Type = focus target = <vmenu_id>
endscript

script destroy_mp_select_match_type_menu 
	if ScreenElementExists \{id = online_menu_ui_container}
		DestroyScreenElement \{id = online_menu_ui_container}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script select_match_type 
	Change match_type = <Type>
	if (<Type> = Ranked)
		netoptions :pref_choose \{Name = Ranked
			checksum = Ranked}
	else
		netoptions :pref_choose \{Name = Ranked
			checksum = Player}
	endif
	ui_flow_manager_respond_to_action \{action = select_match_type}
endscript

script online_general_menu_focus 
	if ScreenElementExists id = <id>
		retail_menu_focus
		<id> :GetTags
		online_highlight :se_setprops Pos = ((($online_general_menu_hi_lite_ypos [<menu_item>]) * (0.0, 1.0)) + (632.0, 0.0))
		online_bookend1 :se_setprops Pos = ((($online_general_menu_hi_lite_ypos [<menu_item>]) * (0.0, 1.0)) + (485.0, 20.0))
		online_bookend2 :se_setprops Pos = ((($online_general_menu_hi_lite_ypos [<menu_item>]) * (0.0, 1.0)) + (789.0, 20.0))
	endif
endscript

script set_online_menu_highlight_pos \{menu_items = 2}
	switch <menu_items>
		case 2
		SetArrayElement \{ArrayName = online_general_menu_hi_lite_ypos
			globalarray
			index = 0
			NewValue = 368.875}
		SetArrayElement \{ArrayName = online_general_menu_hi_lite_ypos
			globalarray
			index = 1
			NewValue = 439.75}
		case 3
		SetArrayElement \{ArrayName = online_general_menu_hi_lite_ypos
			globalarray
			index = 0
			NewValue = 332.75}
		SetArrayElement \{ArrayName = online_general_menu_hi_lite_ypos
			globalarray
			index = 1
			NewValue = 403.625}
		SetArrayElement \{ArrayName = online_general_menu_hi_lite_ypos
			globalarray
			index = 2
			NewValue = 474.5}
		case 4
		SetArrayElement \{ArrayName = online_general_menu_hi_lite_ypos
			globalarray
			index = 0
			NewValue = 298.0}
		SetArrayElement \{ArrayName = online_general_menu_hi_lite_ypos
			globalarray
			index = 1
			NewValue = 368.875}
		SetArrayElement \{ArrayName = online_general_menu_hi_lite_ypos
			globalarray
			index = 2
			NewValue = 439.75}
		SetArrayElement \{ArrayName = online_general_menu_hi_lite_ypos
			globalarray
			index = 3
			NewValue = 510.625}
	endswitch
endscript
