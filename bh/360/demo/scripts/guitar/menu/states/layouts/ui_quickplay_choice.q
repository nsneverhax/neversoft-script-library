
script ui_create_quickplay_choice 
	destroy_loading_screen
	change \{rich_presence_context = presence_menus}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	createscreenelement \{parent = root_window
		id = quickplaychoicemenu_id
		type = descinterface
		desc = 'mainmenu'
		mainmenu_helper_text_text = qs(0x03ac90f0)}
	mainmenu_setup_physics_elements \{screen_id = quickplaychoicemenu_id}
	classic_helper_text = qs(0x6f735f7c)
	party_play_helper_text = qs(0x84f3f6bd)
	mainmenu_setup_option {
		choose_script = quickplay_choice_choose_quickplay
		back_state = uistate_mainmenu
		menu_item_text = qs(0x90cc45b5)
		screen_id = quickplaychoicemenu_id
		helper_text = <classic_helper_text>
	}
	mainmenu_setup_option {
		choose_script = quickplay_choice_choose_freeplay
		back_state = uistate_mainmenu
		menu_item_text = qs(0x8a778398)
		screen_id = quickplaychoicemenu_id
		helper_text = <party_play_helper_text>
	}
	set_focus_color
	set_unfocus_color
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_quickplay_choice 
	clean_up_user_control_helpers
	destroyscreenelement \{id = quickplaychoicemenu_id}
endscript

script quickplay_choice_choose_quickplay 
	main_menu_select_band_lobby lobby_mode = quickplay <...>
endscript

script quickplay_choice_choose_freeplay 
	main_menu_select_freeplay
endscript
