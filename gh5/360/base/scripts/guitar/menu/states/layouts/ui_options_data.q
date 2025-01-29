
script ui_create_options_data 
	make_generic_barrel_menu \{pad_back_script = ui_options_check_settings
		texture = tv_clouds
		max_expansion = 3}
	add_generic_barrel_menu_text_item \{text = qs(0x5d22cc45)
		pad_choose_script = ui_options_data_save_game}
	add_generic_barrel_menu_text_item \{text = qs(0x3da6185d)
		pad_choose_script = ui_options_data_load_game}
	add_generic_barrel_menu_text_item \{choose_state = uistate_options_progression
		text = qs(0xeb003ba8)}
	generic_barrel_menu_finish index = <selected_index>
	ui_options_set_settings
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_options_data 
	destroy_generic_barrel_menu
endscript

script ui_options_data_save_game 
	destroy_generic_barrel_menu
	ui_memcard_save \{event = menu_back}
endscript

script ui_options_data_load_game 
	destroy_generic_barrel_menu
	ui_memcard_load \{event = menu_back
		show_confirm_dialog = 1}
endscript
