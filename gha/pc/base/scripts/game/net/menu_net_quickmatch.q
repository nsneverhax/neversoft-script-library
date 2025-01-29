
script create_quickmatch_searching_dialog {
		menu_id = quickmatch_searching_dialog_menu
		vmenu_id = quickmatch_searching_dialog_vmenu
		pos = (($menu_pos) + (-400.0, 100.0))
	}
	if screenelementexists \{id = quickmatch_options_menu}
		destroy_menu \{menu_id = quickmatch_options_menu}
	endif
	if screenelementexists \{id = online_main_menu}
		destroy_menu \{menu_id = online_main_menu}
	endif
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (1) menu_pos = <pos>
	if isxenon
		createscreenelement {
			type = textelement
			parent = <vmenu_id>
			font = text_a1
			scale = 0.5
			rgba = [210 210 210 250]
			text = "Online"
			just = [left top]
			z_priority = 100.0
			block_events
		}
	else
		createscreenelement {
			type = textelement
			parent = <vmenu_id>
			font = text_a1
			scale = 0.5
			rgba = [210 210 210 250]
			text = "PLAYSTATION®Network"
			just = [left top]
			z_priority = 100.0
			block_events
		}
	endif
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = text_a1
		scale = 0.5
		rgba = [210 210 210 250]
		text = "Finding sessions..."
		just = [left top]
		z_priority = 100.0
		block_events
	}
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = text_a1
		scale = 0.5
		rgba = [210 210 210 250]
		text = "CANCEL"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose quickmatch_searching_dialog_select_cancel}
		]
	}
	launchevent type = focus target = <vmenu_id>
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	netsessionfunc \{obj = match
		func = set_server_list_mode
		params = {
			quickmatch
		}}
	netsessionfunc \{obj = match
		func = start_server_list}
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
		pos = (($menu_pos) + (-400.0, 100.0))
	}
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (1) menu_pos = <pos>
	if isxenon
		createscreenelement {
			type = textelement
			parent = <vmenu_id>
			font = text_a1
			scale = 0.5
			rgba = [210 210 210 250]
			text = "Online"
			just = [left top]
			z_priority = 100.0
			block_events
		}
	else
		createscreenelement {
			type = textelement
			parent = <vmenu_id>
			font = text_a1
			scale = 0.5
			rgba = [210 210 210 250]
			text = "PLAYSTATION®Network"
			just = [left top]
			z_priority = 100.0
			block_events
		}
	endif
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = text_a1
		scale = 0.5
		rgba = [210 210 210 250]
		text = "No sessions are available. Would you like to Create a Match?"
		just = [left top]
		z_priority = 100.0
		block_events
	}
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = text_a1
		scale = 0.5
		rgba = [210 210 210 250]
		text = "CREATE MATCH"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose quickmatch_dialog_select_create}
		]
	}
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = text_a1
		scale = 0.5
		rgba = [210 210 210 250]
		text = "CANCEL"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose quickmatch_dialog_select_cancel}
		]
	}
	if ($num_user_control_helpers = 0)
		add_user_control_helper \{text = "SELECT"
			button = green
			z = 100}
		add_user_control_helper \{text = "BACK"
			button = red
			z = 100}
		add_user_control_helper \{text = "REFRESH"
			button = blue
			z = 100}
		add_user_control_helper \{text = "UP/DOWN"
			button = strumbar
			z = 100}
	endif
	launchevent type = focus target = <vmenu_id>
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
