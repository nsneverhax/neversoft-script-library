
script 0x37f69c40 
	Change \{num_name_size = 14}
	if Spanish
		make_generic_menu \{vmenu_id = text_entry_vmenu
			title = qs(0xeecb2665)
			title_dims = (350.0, 50.0)
			shift = (-50.0, 0.0)}
	else
		make_generic_menu \{vmenu_id = text_entry_vmenu
			title = qs(0xeecb2665)}
	endif
	add_generic_menu_text_item \{text = qs(0xb60636a4)
		heading}
	text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = <choose_script>
		pad_choose_params = <choose_params>
		text = <text>
		validity_message = qs(0x686e1115)
	}
	menu_finish \{no_helper_text}
	ui_cas_text_entry_helper_text
	LaunchEvent \{Type = focus
		target = text_entry_vmenu
		data = {
			child_index = 1
		}}
	LaunchEvent \{Type = pad_choose}
endscript

script 0x0c33d37a 
	clean_up_user_control_helpers
	ui_cas_text_entry_helper_text
endscript

script 0x50154418 
	Change \{num_name_size = 19}
	destroy_generic_menu
endscript
