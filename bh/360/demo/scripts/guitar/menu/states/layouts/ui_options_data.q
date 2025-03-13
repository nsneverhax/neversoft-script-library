
script ui_create_options_data 
	createscreenelement \{parent = root_window
		id = 0x15c6aab3
		type = descinterface
		desc = 'options_menu'
		title_text = qs(0xd14975ca)
		0xf75cb82a = false
		arrows_alpha = 0}
	if NOT 0x15c6aab3 :desc_resolvealias \{name = 0xa39f6109
			param = 0xd27b45a1}
		softassert \{qs(0xb547c6cd)}
		return
	endif
	assignalias id = <0xd27b45a1> alias = current_menu
	current_menu :settags \{smooth_morph_time = 0.1}
	current_menu :se_setprops {
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_event_back}
		]
		exclusive_device = ($primary_controller)
	}
	add_generic_barrel_menu_text_item \{text = qs(0x5d22cc45)
		pad_choose_script = ui_options_data_save_game
		parent = current_menu}
	add_generic_barrel_menu_text_item \{text = qs(0x3da6185d)
		pad_choose_script = ui_options_data_load_game
		parent = current_menu}
	add_generic_barrel_menu_text_item \{choose_state = uistate_options_progression
		text = qs(0xeb003ba8)
		parent = current_menu}
	ui_options_set_settings
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_options_data 
	clean_up_user_control_helpers
	destroyscreenelement \{id = 0x15c6aab3}
endscript

script 0xeb09ca13 
	current_menu :obj_spawnscript
endscript

script 0x2ff5f6ec 
	current_menu :obj_spawnscript \{0x0c5f870a
		params = {
			desc_id = 0x15c6aab3
			down
		}}
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
