
script ui_create_motd 
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		desc = 'motd_message'
		title_text = ($motd_header)
		msg_text = ($motd_subject)
		title_rgba = [206 , 197 , 161 , 255]
		msg_rgba = ($menu_unfocus_color)
		event_handlers = [
			{pad_back generic_event_back}
		]
	}
	AssignAlias id = <id> alias = current_menu
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
endscript

script ui_destroy_motd 
	DestroyScreenElement \{id = current_menu}
	generic_ui_destroy
endscript
