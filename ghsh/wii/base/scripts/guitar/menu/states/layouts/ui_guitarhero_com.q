
script ui_init_guitarhero_com 
	NetSessionFunc \{func = stats_uninit}
	NetSessionFunc \{func = stats_init}
endscript

script ui_create_guitarhero_com 
	NetSessionFunc \{func = get_agora_token}
	formatText TextName = passcode_text qs(0x3c71eff6) t = <Token>
	CreateScreenElement {
		parent = root_window
		id = current_menu
		Type = descinterface
		desc = 'community'
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back 0x69ea820e}
		]
		passcode_text = <passcode_text>
	}
	current_menu :Obj_SpawnScriptNow \{bg_swap}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	destroy_loading_screen
endscript

script ui_destroy_guitarhero_com 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = current_menu}
endscript

script 0x69ea820e 
	create_loading_screen
	generic_event_back
endscript
