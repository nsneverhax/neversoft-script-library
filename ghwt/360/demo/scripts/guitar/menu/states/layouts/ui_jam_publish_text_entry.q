
script ui_create_jam_publish_text_entry 
	change \{num_name_size = 17}
	make_generic_menu \{vmenu_id = text_entry_vmenu
		title = qs(0xeecb2665)}
	add_generic_menu_text_item \{text = qs(0xb60636a4)
		heading}
	text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = <choose_script>
		pad_choose_params = <choose_params>
		pad_back_script = generic_event_back
		text = <text>
		validity_message = qs(0x686e1115)
	}
	menu_finish \{no_helper_text}
	ui_cas_text_entry_helper_text
	launchevent \{type = focus
		target = text_entry_vmenu
		data = {
			child_index = 1
		}}
	launchevent \{type = pad_choose}
	startrendering
endscript

script ui_return_jam_publish_text_entry 
	clean_up_user_control_helpers
	ui_cas_text_entry_helper_text
endscript

script ui_destroy_jam_publish_text_entry 
	change \{num_name_size = 17}
	stoprendering
	destroy_generic_menu
endscript
