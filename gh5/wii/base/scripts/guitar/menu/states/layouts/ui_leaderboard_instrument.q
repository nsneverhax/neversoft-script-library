
script ui_init_leaderboard_instrument 
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	Change \{g_net_leader_player_num = 1}
	Change \{g_leader_player_num = 1}
endscript

script ui_deinit_leaderboard_instrument 
	Change \{g_net_leader_player_num = -1}
	Change \{g_leader_player_num = -1}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
endscript

script ui_create_leaderboard_instrument \{for_local = 0}
	make_generic_barrel_menu \{texture = tv_clouds}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {instrument = 'guitar' device_num = <device_num> for_local = <for_local>}
		text = qs(0x9504b94a)
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {instrument = 'backup' device_num = <device_num> for_local = <for_local>}
		text = qs(0x7d4f9214)
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {instrument = 'drums' device_num = <device_num> for_local = <for_local>}
		text = qs(0x388cd3db)
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {instrument = 'mic' device_num = <device_num> for_local = <for_local>}
		text = qs(0x1b9f6f84)
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {instrument = 'altband' device_num = <device_num> for_local = <for_local>}
		text = qs(0xdabf99c0)
	}
	if (<for_local> = 0)
		add_generic_barrel_menu_text_item {
			pad_choose_script = ui_leaderboard_instrument_select
			pad_choose_params = {instrument = 'band' device_num = <device_num> for_local = <for_local>}
			text = qs(0x4e6db4af)
		}
		add_generic_barrel_menu_text_item \{pad_choose_script = ui_leaderboard_select_rock_record
			text = qs(0xbe4c0e5b)}
		add_generic_barrel_menu_text_item \{pad_choose_script = ui_leaderboard_select_local
			text = qs(0x88572463)}
	endif
	set_focus_color
	set_unfocus_color
	songlist_clear
	songlist_clear_filterspec
	generic_barrel_menu_finish
	if GotParam \{vmenu_id}
		AssignAlias id = <vmenu_id> alias = current_menu
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_return_leaderboard_instrument 
	generic_barrel_menu_finish
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_leaderboard_not_old_enough 
	Wait \{2
		gameframes}
	ui_leaderboard_get_error_text \{reason = content_restricted}
	generic_event_replace state = uistate_generic_dialog_box data = {template = continue heading_text = qs(0xaa163738) body_text = <error_text>}
endscript

script ui_destroy_leaderboard_instrument 
	clean_up_user_control_helpers
	destroy_generic_barrel_menu
endscript

script ui_leaderboard_instrument_select 
	Change current_leaderboard_instrument = <instrument>
	Change \{respond_to_signin_changed = 1}
	if (<for_local> = 1)
		generic_event_choose \{state = uistate_leaderboard_difficulty
			data = {
				mode = toprockers
			}}
	else
		getngcneterrors
		if ((<dwc_error_code> > 0) || (<demonware_error> < 0))
			show_last_connection_error
		else
			set_primary_controller device_num = <device_num> state = uistate_songlist leaderboards = 1 require_live = 1 data = {mode = leaderboard device_num = <device_num>}
		endif
	endif
endscript

script ui_leaderboard_select_local 
	generic_event_choose \{state = uistate_leaderboard_instrument
		data = {
			for_local = 1
		}}
endscript

script ui_leaderboard_select_rock_record 
	getngcneterrors
	if ((<dwc_error_code> > 0) || (<demonware_error> < 0))
		show_last_connection_error
		return
	endif
	ui_leaderboard_reinit
	GetNetID controller_index = (<device_num>)
	array = [0 0]
	SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
	SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
	LaunchEvent \{Type = unfocus
		target = generic_barrel_vmenu}
	Change \{respond_to_signin_changed = 1}
	set_primary_controller device_num = <device_num> state = uistate_rock_record leaderboards = 1 require_live = 1 data = {device_num = <device_num> net_id = <array> parent = root_window pad_back_id = generic_barrel_vmenu}
endscript
