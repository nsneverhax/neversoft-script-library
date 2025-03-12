
script ui_create_select_mp_mode 
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_all_players = 1}
	change \{respond_to_signin_changed_func = none}
	cas_reset_random_human_picking
	change \{band_mode_menu_tags = none}
	make_menu_frontend \{title = qs(0x7c0cd641)
		screen = drummer
		use_all_controllers}
	add_menu_frontend_item \{text = qs(0x0952b48b)
		pad_choose_script = mp_select_mode_menu_select_mode
		pad_choose_params = {
			mode = p2_faceoff
		}}
	add_menu_frontend_item \{text = qs(0x46577877)
		pad_choose_script = mp_select_mode_menu_select_mode
		pad_choose_params = {
			mode = p2_pro_faceoff
			friendly
		}}
	if ($g_head_to_head_instrument_type != vocals && $g_head_to_head_instrument_type != drums)
		add_menu_frontend_item \{text = qs(0x33b59779)
			pad_choose_script = mp_select_mode_menu_select_mode
			pad_choose_params = {
				mode = p2_battle
			}}
	endif
	clean_up_user_control_helpers
	cleanup_cas_menu_handlers
	ui_return_game_mode
endscript

script ui_destroy_select_mp_mode 
	generic_ui_destroy
endscript
