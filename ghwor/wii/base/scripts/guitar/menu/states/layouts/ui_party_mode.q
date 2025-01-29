
script ui_create_party_mode 
	clear_exclusive_devices
	make_generic_menu \{title = qs(0x3af478a3)
		use_all_controllers}
	add_generic_menu_text_item \{text = qs(0x2406ab68)
		pad_choose_script = party_mode_select_free_play}
	add_generic_menu_text_item \{text = qs(0xbebecb80)
		pad_choose_script = party_mode_select_shredfest}
	menu_finish
endscript

script ui_destroy_party_mode 
	generic_ui_destroy
endscript

script party_mode_select_shredfest 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{game_mode = shreddfest}
	quick_start_goal \{goal_struct = shreddfest_info
		goal_name = shreddfest}
endscript

script party_mode_select_free_play 
	ui_event \{event = menu_replace
		data = {
			state = uistate_freeplay
			clear_previous_stack
		}}
endscript
