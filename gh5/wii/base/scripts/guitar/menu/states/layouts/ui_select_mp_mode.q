
script ui_create_select_mp_mode 
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_all_players = 1}
	Change \{respond_to_signin_changed_func = None}
	Change \{band_mode_menu_tags = None}
	make_generic_menu \{title = $wii_choose_mp_mode
		use_all_controllers}
	add_generic_menu_text_item \{text = qs(0x46577877)
		pad_choose_script = mp_select_mode_menu_select_mode
		pad_choose_params = {
			mode = p2_pro_faceoff
			friendly
		}}
	if ($g_head_to_head_instrument_type != vocals && $g_head_to_head_instrument_type != drums)
		add_generic_menu_text_item \{text = qs(0x24395e9d)
			pad_choose_script = mp_select_mode_menu_select_mode
			pad_choose_params = {
				mode = p2_roadie_battle
			}}
	endif
	clean_up_user_control_helpers
	cleanup_cas_menu_handlers
	menu_finish
endscript

script ui_destroy_select_mp_mode 
	generic_ui_destroy
endscript
