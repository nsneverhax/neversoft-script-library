
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
		id = leaderboards_instrument
		type = DescInterface
		desc = 'options_menu'
		title_text = qs(0xa1ae7e56)
		exclusive_device = ($primary_controller)
		helper_text_text = qs(0x03ac90f0)
	}
	if NOT leaderboards_instrument :Desc_ResolveAlias \{name = alias_options_vmenu
			param = options_vmenu}
		softassert \{qs(0xb547c6cd)}
		return
	endif
	AssignAlias id = <options_vmenu> alias = current_menu
	current_menu :SetTags \{smooth_morph_time = 0.1
		create_dummy_items = 1}
	current_menu :SE_SetProps \{event_handlers = [
			{
				pad_up
				ui_flash_scroll_arrow
				params = {
					desc_id = leaderboards_instrument
					up
				}
			}
			{
				pad_up
				SmoothMenuScroll
				params = {
					Dir = -1
					isVertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_down
				ui_flash_scroll_arrow
				params = {
					desc_id = leaderboards_instrument
					down
				}
			}
			{
				pad_down
				SmoothMenuScroll
				params = {
					Dir = 1
					isVertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_left
				ui_flash_scroll_arrow
				params = {
					desc_id = leaderboards_instrument
					up
				}
			}
			{
				pad_left
				SmoothMenuScroll
				params = {
					Dir = -1
					isVertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_right
				ui_flash_scroll_arrow
				params = {
					desc_id = leaderboards_instrument
					down
				}
			}
			{
				pad_right
				SmoothMenuScroll
				params = {
					Dir = 1
					isVertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_back
				generic_event_back
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
	LaunchEvent type = focus target = current_menu data = {child_index = <selected_index>}
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
	wait \{2
		gameframes}
	ui_leaderboard_get_error_text \{reason = content_restricted}
	generic_event_replace state = UIstate_generic_dialog_box data = {template = continue heading_text = qs(0xaa163738) body_text = <error_text>}
endscript

script ui_destroy_leaderboard_instrument 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = leaderboards_instrument}
		DestroyScreenElement \{id = leaderboards_instrument}
	endif
endscript

script ui_leaderboard_instrument_select 
	Change current_leaderboard_instrument = <instrument>
	if (<for_local> = 1)
		generic_event_choose \{state = UIstate_leaderboard_difficulty
			data = {
				mode = toprockers
			}}
	else
		set_primary_controller device_num = <device_num> state = uistate_songlist leaderboards = 1 data = {mode = leaderboard device_num = <device_num>}
	endif
endscript

script ui_leaderboard_select_local 
	generic_event_choose \{state = UIstate_leaderboard_instrument
		data = {
			for_local = 1
		}}
endscript

script ui_leaderboard_select_rock_record 
	ui_leaderboard_reinit
	GetNetID controller_index = (<device_num>)
	array = [0 0]
	SetArrayElement arrayName = array index = 0 newValue = <net_id_first>
	SetArrayElement arrayName = array index = 1 newValue = <net_id_second>
	LaunchEvent \{type = unfocus
		target = leaderboards_instrument}
	set_primary_controller device_num = <device_num> state = UIstate_rock_record leaderboards = 1 data = {device_num = <device_num> net_id = <array> parent = root_window pad_back_id = leaderboards_instrument viewmode = me}
endscript
