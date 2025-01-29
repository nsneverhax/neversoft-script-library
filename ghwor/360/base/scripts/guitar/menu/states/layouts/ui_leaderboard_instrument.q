
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

script ui_create_leaderboard_instrument 
	uistack_createboundscreenelement \{parent = root_window
		id = leaderboard_inst_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{
				pad_back
				generic_event_back
			}
		]
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0xe0c76c13)}
	mainmenu_setup_physics_elements \{screen_id = leaderboard_inst_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = leaderboard_inst_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = leaderboard_inst_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = leaderboard_inst_menu_id
		}}
	mainmenu_setup_option {
		choose_script = ui_leaderboard_instrument_select
		choose_params = {instrument = 'guitar' device_num = <device_num>}
		back_script = generic_event_back
		menu_item_text = qs(0x9504b94a)
		screen_id = leaderboard_inst_menu_id
		helper_text = qs(0x03ac90f0)
	}
	mainmenu_setup_option {
		choose_script = ui_leaderboard_instrument_select
		choose_params = {instrument = 'backup' device_num = <device_num>}
		back_script = generic_event_back
		menu_item_text = qs(0x7d4f9214)
		screen_id = leaderboard_inst_menu_id
		helper_text = qs(0x03ac90f0)
	}
	mainmenu_setup_option {
		choose_script = ui_leaderboard_instrument_select
		choose_params = {instrument = 'drums' device_num = <device_num>}
		back_script = generic_event_back
		menu_item_text = qs(0x388cd3db)
		screen_id = leaderboard_inst_menu_id
		helper_text = qs(0x03ac90f0)
	}
	mainmenu_setup_option {
		choose_script = ui_leaderboard_instrument_select
		choose_params = {instrument = 'mic' device_num = <device_num>}
		back_script = generic_event_back
		menu_item_text = qs(0x1b9f6f84)
		screen_id = leaderboard_inst_menu_id
		helper_text = qs(0x03ac90f0)
	}
	mainmenu_setup_option {
		choose_script = ui_leaderboard_instrument_select
		choose_params = {instrument = 'altband' device_num = <device_num>}
		back_script = generic_event_back
		menu_item_text = qs(0xdabf99c0)
		screen_id = leaderboard_inst_menu_id
		helper_text = qs(0x03ac90f0)
	}
	mainmenu_setup_option {
		choose_script = ui_leaderboard_instrument_select
		choose_params = {instrument = 'band' device_num = <device_num>}
		back_script = generic_event_back
		menu_item_text = qs(0xc617defb)
		screen_id = leaderboard_inst_menu_id
		helper_text = qs(0x03ac90f0)
	}
	mainmenu_setup_option \{choose_script = ui_leaderboard_select_rock_record
		back_script = generic_event_back
		menu_item_text = qs(0xbe4c0e5b)
		screen_id = leaderboard_inst_menu_id
		helper_text = qs(0x03ac90f0)}
	main_menu_finalize
	set_focus_color
	set_unfocus_color
	songlist_clear
	songlist_clear_filterspec
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_return_leaderboard_instrument 
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_leaderboard_not_old_enough 
	Wait \{2
		gameframes}
	ui_leaderboard_get_error_text \{reason = content_restricted}
	generic_event_replace state = uistate_generic_dialog_box data = {template = continue heading_text = qs(0xaa163738) body_text = <error_text>}
endscript

script ui_destroy_leaderboard_instrument 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = leaderboard_inst_menu_id}
		DestroyScreenElement \{id = leaderboard_inst_menu_id}
	endif
endscript

script ui_leaderboard_instrument_select 
	Change current_leaderboard_instrument = <instrument>
	set_primary_controller device_num = <device_num> state = uistate_songlist leaderboards = 1 data = {mode = leaderboard device_num = <device_num>}
endscript

script ui_leaderboard_select_rock_record 
	ui_leaderboard_reinit
	GetNetID controller_index = (<device_num>)
	array = [0 0]
	SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
	SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
	LaunchEvent \{Type = unfocus
		target = current_menu}
	set_primary_controller device_num = <device_num> state = uistate_rock_record leaderboards = 1 data = {device_num = <device_num> net_id = <array> parent = root_window pad_back_id = generic_barrel_vmenu}
endscript

script ui_leaderboard_inst_menu_anim_in 
	mainmenu_animate \{id = leaderboard_inst_menu_id}
endscript

script ui_leaderboard_inst_menu_anim_out 
	mainmenu_animate \{id = leaderboard_inst_menu_id}
endscript
