
script ui_init_leaderboard_instrument 
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	Change \{g_net_leader_player_num = 1}
	Change \{g_leader_player_num = 1}
	Change \{game_mode = p1_quickplay}
endscript

script ui_deinit_leaderboard_instrument 
	Change \{g_net_leader_player_num = -1}
	Change \{g_leader_player_num = -1}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
endscript

script ui_create_leaderboard_instrument \{for_local = 0}
	CreateScreenElement {
		parent = root_window
		id = 0xce367dce
		Type = descinterface
		desc = 'options_menu'
		title_text = qs(0xa1ae7e56)
		exclusive_device = ($primary_controller)
		helper_text_text = qs(0x03ac90f0)
	}
	0x61906aac
	if NOT 0xce367dce :desc_resolvealias \{Name = 0xa39f6109
			param = 0xd27b45a1}
		SoftAssert \{qs(0xb547c6cd)}
		return
	endif
	AssignAlias id = <0xd27b45a1> alias = current_menu
	current_menu :SetTags \{smooth_morph_time = 0.1}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_up
				0x0c5f870a
				params = {
					desc_id = 0xce367dce
					up
				}
			}
			{
				pad_up
				smoothmenuscroll
				params = {
					Dir = -1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_down
				0x0c5f870a
				params = {
					desc_id = 0xce367dce
					down
				}
			}
			{
				pad_down
				smoothmenuscroll
				params = {
					Dir = 1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_left
				0x0c5f870a
				params = {
					desc_id = 0xce367dce
					up
				}
			}
			{
				pad_left
				smoothmenuscroll
				params = {
					Dir = -1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_right
				0x0c5f870a
				params = {
					desc_id = 0xce367dce
					down
				}
			}
			{
				pad_right
				smoothmenuscroll
				params = {
					Dir = 1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_back
				0x5b641906
			}
		]}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {instrument = 'guitar' device_num = <device_num> for_local = <for_local>}
		text = qs(0x9504b94a)
		parent = current_menu
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {instrument = 'backup' device_num = <device_num> for_local = <for_local>}
		text = qs(0x7d4f9214)
		parent = current_menu
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {instrument = 'drums' device_num = <device_num> for_local = <for_local>}
		text = qs(0x388cd3db)
		parent = current_menu
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {instrument = 'mic' device_num = <device_num> for_local = <for_local>}
		text = qs(0x1b9f6f84)
		parent = current_menu
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {instrument = 'altband' device_num = <device_num> for_local = <for_local>}
		text = qs(0xdabf99c0)
		parent = current_menu
	}
	if (<for_local> = 0)
		add_generic_barrel_menu_text_item {
			pad_choose_script = ui_leaderboard_instrument_select
			pad_choose_params = {instrument = 'band' device_num = <device_num> for_local = <for_local>}
			text = qs(0x4e6db4af)
			parent = current_menu
		}
		add_generic_barrel_menu_text_item \{pad_choose_script = ui_leaderboard_select_rock_record
			text = qs(0xbe4c0e5b)
			parent = current_menu}
		add_generic_barrel_menu_text_item \{pad_choose_script = ui_leaderboard_select_local
			text = qs(0x88572463)
			parent = current_menu}
	endif
	songlist_clear
	songlist_clear_filterspec
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

script 0x5b641906 
	menu_transition_stoprender
	generic_event_back
endscript

script ui_destroy_leaderboard_instrument 
	if ScreenElementExists \{id = 0xce367dce}
		DestroyScreenElement \{id = 0xce367dce}
	endif
endscript

script ui_leaderboard_instrument_select 
	Change current_leaderboard_instrument = <instrument>
	Change \{respond_to_signin_changed = 1}
	if (<for_local> = 1)
		menu_transition_stoprender
		generic_event_choose \{state = uistate_leaderboard_difficulty
			data = {
				mode = toprockers
			}}
	else
		getngcneterrors
		if ((<dwc_error_code> > 0) || (<demonware_error> < 0))
			if (<dwc_error_code> > 0)
				formatText TextName = error_text qs(0xcfb2fe82) d = (<dwc_error_code>) s = (<dwc_error_text>)
			else
				formatText TextName = error_text qs(0x73307931) s = (<dwc_error_text>)
			endif
			generic_event_choose state = uistate_generic_dialog_box data = {
				template = continue
				heading_text = qs(0xb764670b)
				body_text = <error_text>
			}
		else
			menu_transition_stoprender
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
		if (<dwc_error_code> > 0)
			formatText TextName = error_text qs(0xcfb2fe82) d = (<dwc_error_code>) s = (<dwc_error_text>)
		else
			formatText TextName = error_text qs(0x73307931) s = (<dwc_error_text>)
		endif
		generic_event_choose state = uistate_generic_dialog_box data = {
			template = continue
			heading_text = qs(0xb764670b)
			body_text = <error_text>
		}
		return
	endif
	ui_leaderboard_reinit
	GetNetID controller_index = (<device_num>)
	array = [0 0]
	SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
	SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
	Change \{respond_to_signin_changed = 1}
	LaunchEvent \{Type = unfocus
		target = 0xce367dce}
	menu_transition_stoprender
	set_primary_controller device_num = <device_num> state = uistate_rock_record leaderboards = 1 data = {device_num = <device_num> net_id = <array> parent = root_window pad_back_id = 0xce367dce}
endscript
