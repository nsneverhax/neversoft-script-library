
script ui_create_options_data 
	uistack_createboundscreenelement {
		parent = root_window
		id = options_data_menu_id
		type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{pad_back ui_options_check_settings}
		]
		exclusive_device = ($primary_controller)
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0xc20b11fb)
	}
	attempt_to_add_friend_feed \{parent_id = options_data_menu_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = options_data_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = options_data_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = options_data_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = options_data_menu_id
		}}
	if options_data_menu_id :desc_resolvealias \{name = alias_mainmenu_up_arrow}
		<resolved_id> :se_setprops {
			hide
		}
	endif
	if options_data_menu_id :desc_resolvealias \{name = alias_mainmenu_down_arrow}
		<resolved_id> :se_setprops {
			hide
		}
	endif
	mainmenu_setup_option \{choose_script = ui_options_data_save_game
		back_script = ui_options_check_settings
		menu_item_text = qs(0x5d22cc45)
		screen_id = options_data_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_script = ui_options_data_load_game
		back_script = ui_options_check_settings
		menu_item_text = qs(0x3da6185d)
		screen_id = options_data_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_state = uistate_options_progression
		back_script = ui_options_check_settings
		menu_item_text = qs(0x46df8385)
		screen_id = options_data_menu_id
		helper_text = qs(0x03ac90f0)}
	main_menu_finalize
	ui_options_set_settings
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
endscript

script ui_destroy_options_data 
	clean_up_user_control_helpers
	if screenelementexists \{id = options_data_menu_id}
		destroyscreenelement \{id = options_data_menu_id}
	endif
endscript

script ui_options_data_save_game 
	ui_memcard_save \{event = menu_back
		show_mainmenu_bg = 1}
endscript

script ui_options_data_load_game 
	ui_memcard_load \{event = menu_back
		show_confirm_dialog = 1
		show_mainmenu_bg = 1}
endscript

script ui_options_data_anim_in 
	mainmenu_animate \{id = options_data_menu_id}
endscript

script ui_options_data_anim_out 
	mainmenu_animate \{id = options_data_menu_id}
endscript
