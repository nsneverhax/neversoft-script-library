
script ui_create_game_mode \{mode = career}
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	Change \{in_join_band_screens = 0}
	Change \{first_character_hub_enter = 1}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	clear_exclusive_devices
	Change \{band_mode_menu_tags = None}
	Change \{band_mode_mode = None}
	if (<mode> = career)
		choose_script = game_mode_select_career
		text = qs(0xde7ec8b3)
	else
		choose_script = game_mode_select_quickplay
		text = qs(0xfabdce2b)
	endif
	make_menu_frontend {
		pad_back_script = ui_game_mode_back
		title = <text>
		use_all_controllers
		Pos = (15.0, 40.0)
	}
	add_menu_frontend_item text = qs(0xdfe62bc8) pad_choose_script = <choose_script>
	if (<mode> = quickplay || <mode> = career)
		if are_multiple_controllers_connected
			add_menu_frontend_item text = qs(0xdabf99c0) pad_choose_script = <choose_script> pad_choose_params = {Band}
			<window_id> :obj_spawnscript ui_game_mode_poll_for_band_mode params = {band_mode_allowed = 1 mode = <mode>}
		else
			add_menu_frontend_item text = qs(0xdabf99c0) pad_choose_script = <choose_script> pad_choose_params = {Band} rgba = [50 44 35 255]
			<window_id> :obj_spawnscript ui_game_mode_poll_for_band_mode params = {band_mode_allowed = 0 mode = <mode>}
		endif
	else
		add_menu_frontend_item text = qs(0xdabf99c0) pad_choose_script = <choose_script> pad_choose_params = {Band}
	endif
	add_menu_frontend_item \{text = qs(0xd093953b)
		pad_choose_script = set_primary_controller
		pad_choose_params = {
			state = uistate_select_practice_mode
		}}
	ui_return_game_mode
endscript

script ui_destroy_game_mode 
	generic_ui_destroy
endscript

script ui_return_game_mode 
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
endscript

script game_mode_select_career 
	if NOT IsGuitarController controller = <device_num>
		if NOT isdrumcontroller controller = <device_num>
			if NOT ismicrophonepluggedin
				if ($allow_controller_for_all_instruments = 0)
					ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = ($0x8f75a8b6) player_device = <device_num>}
					return
				endif
			endif
		endif
	endif
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT GotParam \{Band}
		Change \{game_mode = p1_career}
		Change \{current_num_players = 1}
		Change \{structurename = player1_status
			part = guitar}
		Change structurename = player1_status controller = ($primary_controller)
		Change GlobalName = player1_device NewValue = ($primary_controller)
		Change \{structurename = player2_status
			part = guitar}
		Change \{band_mode_mode = None}
	else
		Change \{game_mode = p2_career}
		Change \{current_num_players = 2}
		Change \{band_mode_mode = career}
		Change \{in_join_band_screens = 1}
		ui_group_play_select_local device_num = <device_num>
		return
	endif
	if ($band_mode_mode = None)
		Change \{respond_to_signin_changed = 1}
		Change \{respond_to_signin_changed_func = None}
		set_primary_controller device_num = <device_num> state = uistate_select_instrument
	elseif ($band_mode_mode = career)
		set_primary_controller device_num = <device_num> state = uistate_band_mode
	endif
endscript

script game_mode_select_quickplay 
	if NOT GotParam \{Band}
		if NOT IsGuitarController controller = <device_num>
			if NOT isdrumcontroller controller = <device_num>
				if NOT ismicrophonepluggedin
					if ($allow_controller_for_all_instruments = 0)
						ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = ($0x8f75a8b6) player_device = <device_num>}
						return
					endif
				endif
			endif
		endif
		Change \{game_mode = p1_quickplay}
		Change \{current_num_players = 1}
		Change structurename = player1_status controller = ($primary_controller)
		Change GlobalName = player1_device NewValue = ($primary_controller)
		Change \{respond_to_signin_changed = 1}
		Change \{respond_to_signin_changed_func = None}
		set_primary_controller device_num = <device_num> state = uistate_select_instrument
	else
		if NOT are_multiple_controllers_connected
			ui_event \{event = menu_change
				data = {
					is_popup
					state = uistate_generic_alert_popup
					title = qs(0x361603ec)
					text = qs(0x2dda730c)
				}}
			return
		else
			Change \{band_mode_mode = quickplay}
			Change \{game_mode = p2_quickplay}
			Change \{current_num_players = 2}
			Change \{in_join_band_screens = 1}
			set_primary_controller device_num = <device_num> state = uistate_band_mode
		endif
	endif
endscript

script ui_game_mode_back 
	generic_event_back
endscript

script ui_game_mode_poll_for_band_mode 
	begin
	if NOT are_multiple_controllers_connected
		if (<band_mode_allowed> = 1)
			ui_event event = menu_replace data = {state = uistate_game_mode mode = <mode>}
			Block
		endif
	else
		if (<band_mode_allowed> = 0)
			ui_event event = menu_replace data = {state = uistate_game_mode mode = <mode>}
			Block
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript
