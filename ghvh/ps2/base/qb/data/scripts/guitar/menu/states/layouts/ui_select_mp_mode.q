
script ui_create_select_mp_mode 
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_all_players = 1}
	Change \{respond_to_signin_changed_func = None}
	cas_reset_random_human_picking
	Change \{band_mode_menu_tags = None}
	create_frontend_bg
	make_menu_frontend \{title = qs(0x7d29b593)
		screen = drummer
		pad_back_script = 0xa3efa0ec
		use_all_controllers}
	add_menu_frontend_item \{text = qs(0x0952b48b)
		desc = 'menu_tape_01'
		pad_choose_script = mp_select_mode_menu_select_mode
		pad_choose_params = {
			mode = p2_faceoff
		}}
	add_menu_frontend_item \{text = qs(0x46577877)
		desc = 'menu_tape_02'
		pad_choose_script = mp_select_mode_menu_select_mode
		pad_choose_params = {
			mode = p2_pro_faceoff
			friendly
		}}
	if ($g_head_to_head_instrument_type != vocals && $g_head_to_head_instrument_type != drums)
		add_menu_frontend_item \{text = qs(0x33b59779)
			desc = 'menu_tape_03'
			pad_choose_script = mp_select_mode_menu_select_mode
			pad_choose_params = {
				mode = p2_battle
			}}
	endif
	clean_up_user_control_helpers
	cleanup_cas_menu_handlers
	ui_return_game_mode
	destroy_loading_screen
endscript

script ui_destroy_select_mp_mode 
	cleanup_frontend_bg
	generic_ui_destroy
endscript

script 0xa3efa0ec 
	create_loading_screen
	generic_event_back
endscript
