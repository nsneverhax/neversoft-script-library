
script create_quickmatch_searching_dialog {
		menu_id = quickmatch_searching_dialog_menu
		vmenu_id = quickmatch_searching_dialog_vmenu
		Pos = (($menu_pos) + (-400.0, 100.0))
	}
	if ScreenElementExists \{id = quickmatch_options_menu}
		destroy_menu \{menu_id = quickmatch_options_menu}
	endif
	if ScreenElementExists \{id = online_main_menu}
		destroy_menu \{menu_id = online_main_menu}
	endif
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (1) menu_pos = <Pos>
	if isXenon
		CreateScreenElement {
			Type = TextElement
			parent = <vmenu_id>
			font = fontgrid_text_a3
			Scale = 0.5
			rgba = [210 210 210 250]
			text = qs(0x2725b21f)
			just = [left top]
			z_priority = 100.0
			block_events
		}
	else
		CreateScreenElement {
			Type = TextElement
			parent = <vmenu_id>
			font = fontgrid_text_a3
			Scale = 0.5
			rgba = [210 210 210 250]
			text = qs(0xad8568cd)
			just = [left top]
			z_priority = 100.0
			block_events
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <vmenu_id>
		font = fontgrid_text_a3
		Scale = 0.5
		rgba = [210 210 210 250]
		text = qs(0x6c6b4e5b)
		just = [left top]
		z_priority = 100.0
		block_events
	}
	CreateScreenElement {
		Type = TextElement
		parent = <vmenu_id>
		font = fontgrid_text_a3
		Scale = 0.5
		rgba = [210 210 210 250]
		text = qs(0xf7723015)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose quickmatch_searching_dialog_select_cancel}
		]
	}
	LaunchEvent Type = focus target = <vmenu_id>
	NetSessionFunc \{Obj = match
		func = stop_server_list}
	NetSessionFunc \{Obj = match
		func = free_server_list}
	NetSessionFunc \{Obj = match
		func = set_server_list_mode
		params = {
			quickmatch
		}}
	NetSessionFunc \{Obj = match
		func = start_server_list
		params = {
			callback = xboxlive_menu_optimatch_results_item_add
			callback_complete = xboxlive_menu_optimatch_results_stop
		}}
endscript

script destroy_quickmatch_searching_dialog 
	destroy_menu \{menu_id = quickmatch_searching_dialog_menu}
	destroy_menu_backdrop
endscript

script quickmatch_searching_dialog_select_cancel 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script create_quickmatch_create_match_dialog {
		menu_id = quickmatch_create_match_dialog_menu
		vmenu_id = quickmatch_create_match_dialog_vmenu
		Pos = (($menu_pos) + (-400.0, 100.0))
	}
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (1) menu_pos = <Pos>
	if isXenon
		CreateScreenElement {
			Type = TextElement
			parent = <vmenu_id>
			font = fontgrid_text_a3
			Scale = 0.5
			rgba = [210 210 210 250]
			text = qs(0x2725b21f)
			just = [left top]
			z_priority = 100.0
			block_events
		}
	else
		CreateScreenElement {
			Type = TextElement
			parent = <vmenu_id>
			font = fontgrid_text_a3
			Scale = 0.5
			rgba = [210 210 210 250]
			text = qs(0xad8568cd)
			just = [left top]
			z_priority = 100.0
			block_events
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <vmenu_id>
		font = fontgrid_text_a3
		Scale = 0.5
		rgba = [210 210 210 250]
		text = qs(0x271d2665)
		just = [left top]
		z_priority = 100.0
		block_events
	}
	CreateScreenElement {
		Type = TextElement
		parent = <vmenu_id>
		font = fontgrid_text_a3
		Scale = 0.5
		rgba = [210 210 210 250]
		text = qs(0x4d968017)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose quickmatch_dialog_select_create}
		]
	}
	CreateScreenElement {
		Type = TextElement
		parent = <vmenu_id>
		font = fontgrid_text_a3
		Scale = 0.5
		rgba = [210 210 210 250]
		text = qs(0xf7723015)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose quickmatch_dialog_select_cancel}
		]
	}
	LaunchEvent Type = focus target = <vmenu_id>
endscript

script destroy_quickmatch_create_match_dialog 
	destroy_online_server_list
	destroy_menu \{menu_id = server_list_create_match_dialog_menu}
	destroy_menu_backdrop
endscript

script quickmatch_dialog_select_create 
	ui_flow_manager_respond_to_action \{action = response_create_selected
		create_params = {
			menu_type = create_match
		}}
endscript

script quickmatch_dialog_select_cancel 
	ui_flow_manager_respond_to_action \{action = response_cancel_selected}
endscript
