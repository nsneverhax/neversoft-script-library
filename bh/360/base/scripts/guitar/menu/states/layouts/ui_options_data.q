
script ui_create_options_data 
	CreateScreenElement \{parent = root_window
		id = options_data_menu
		type = DescInterface
		desc = 'options_menu'
		title_text = qs(0xd14975ca)
		options_vmenu_loop_view = false
		arrows_alpha = 0}
	if NOT options_data_menu :Desc_ResolveAlias \{name = alias_options_vmenu
			param = options_vmenu}
		softassert \{qs(0xb547c6cd)}
		return
	endif
	AssignAlias id = <options_vmenu> alias = current_menu
	current_menu :SetTags \{smooth_morph_time = 0.1}
	current_menu :SE_SetProps {
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
	add_generic_barrel_menu_text_item \{choose_state = UIstate_options_progression
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
	DestroyScreenElement \{id = options_data_menu}
endscript

script options_data_pad_up 
	current_menu :Obj_SpawnScript
endscript

script options_data_pad_down 
	current_menu :Obj_SpawnScript \{ui_flash_scroll_arrow
		params = {
			desc_id = options_data_menu
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
