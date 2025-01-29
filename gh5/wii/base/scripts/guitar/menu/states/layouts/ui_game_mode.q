
script ui_create_game_mode \{mode = career}
	printf qs(0x9a289fb1) d = <device_num>
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
	SpawnScriptNow game_mode_make_menu params = {<...>}
endscript

script ui_return_game_mode 
endscript

script ui_destroy_game_mode 
	generic_ui_destroy
endscript

script game_mode_make_menu 
	printf qs(0x9a289fb1) d = <device_num>
	make_generic_menu {
		title = <text>
		pad_back_script = ui_game_mode_back
		use_all_controllers
	}
	add_generic_menu_text_item {
		text = qs(0xdfe62bc8)
		pad_choose_script = <choose_script>
		pad_choose_params = {device_num = <device_num>}
	}
	if (<mode> = quickplay)
		if are_multiple_controllers_connected
			add_generic_menu_text_item {
				text = qs(0xdabf99c0)
				pad_choose_script = <choose_script>
				pad_choose_params = {Band device_num = <device_num>}
			}
			<desc_id> :obj_spawnscript ui_game_mode_poll_for_band_mode params = {band_mode_allowed = 1 mode = <mode>}
		else
			add_generic_menu_text_item {
				text = qs(0xdabf99c0)
				pad_choose_script = <choose_script>
				pad_choose_params = {Band device_num = <device_num>}
				rgba = [50 44 35 255]
			}
			<desc_id> :obj_spawnscript ui_game_mode_poll_for_band_mode params = {band_mode_allowed = 0 mode = <mode>}
		endif
	else
		<desc_id> :obj_spawnscript ui_game_mode_poll_for_band_mode params = {band_mode_allowed = 0 mode = <mode>}
	endif
	menu_finish
endscript

script game_mode_select_career 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT GotParam \{Band}
		Change \{game_mode = career}
		setplayerinfo \{1
			part = guitar}
		setplayerinfo \{1
			in_game = 1}
		setplayerinfo 1 controller = <device_num>
		setplayerinfo 1 device = ($primary_controller)
		Change primary_controller = <device_num>
		setplayerinfo \{2
			part = guitar}
		Change \{band_mode_mode = None}
		quick_start_goal \{goal_struct = career_info
			goal_name = career}
	else
		Change \{game_mode = gh4_p2_career}
		Change \{band_mode_mode = career}
		Change \{in_join_band_screens = 1}
		generic_event_choose \{state = uistate_group_play}
		return
	endif
	if ($band_mode_mode = None)
		Change \{respond_to_signin_changed = 1}
		Change \{respond_to_signin_changed_func = None}
		set_primary_controller device_num = <device_num> state = uistate_select_instrument
	elseif ($band_mode_mode = career)
		ui_memcard_secondary_siginin_load \{state = uistate_band_mode}
	endif
endscript

script game_mode_select_quickplay 
	if NOT GotParam \{Band}
		Change \{game_mode = p1_quickplay}
		setplayerinfo 1 controller = <device_num>
		setplayerinfo 1 device = ($primary_controller)
		Change primary_controller = <device_num>
		setplayerinfo \{1
			in_game = 1}
		Change \{respond_to_signin_changed = 1}
		Change \{respond_to_signin_changed_func = None}
		set_primary_controller device_num = <device_num> state = uistate_select_instrument
	else
		if NOT are_multiple_controllers_connected
			ui_event \{event = menu_change
				data = {
					is_popup
					state = uistate_generic_dialog_box
					template = continue
					heading_text = qs(0x361603ec)
					body_text = qs(0x2dda730c)
				}}
			return
		else
			Change \{band_mode_mode = quickplay}
			Change \{game_mode = p2_quickplay}
			Change \{in_join_band_screens = 1}
			ui_memcard_secondary_siginin_load \{state = uistate_band_mode}
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
