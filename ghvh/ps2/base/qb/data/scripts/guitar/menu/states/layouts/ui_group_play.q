
script ui_create_group_play 
	Change \{band_mode_menu_tags = None}
	SpawnScriptNow ui_create_group_play_spawned params = <...>
endscript

script ui_create_group_play_spawned 
	Change \{rich_presence_context = presence_menus}
	cas_reset_random_human_picking
	frontend_load_soundcheck \{loadingscreen}
	cas_destroy_all_characters
	make_menu_frontend \{title = qs(0xdabf99c0)
		use_all_controllers}
	if has_enough_controllers_for_band
		add_menu_frontend_item \{text = qs(0x34dc8180)
			pad_choose_script = ui_group_play_select_local}
		<window_id> :obj_spawnscript ui_group_play_poll_for_band_mode params = {local_mode_allowed = 1}
	else
		add_menu_frontend_item \{text = qs(0x34dc8180)
			pad_choose_script = ui_group_play_select_local
			rgba = [
				50
				44
				35
				255
			]}
		<window_id> :obj_spawnscript ui_group_play_poll_for_band_mode params = {local_mode_allowed = 0}
	endif
	<window_id> :SetTags local_mode_id = <item_id>
	ui_return_game_mode
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_group_play 
	generic_ui_destroy
endscript

script ui_return_group_play 
	ui_return_game_mode
endscript

script ui_group_play_select_local 
	if is_regular_controller_not_enough_mics controller = <device_num>
		if isXenon
			ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0xec4dbd17) player_device = <device_num>}
		else
			ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0xe2f3f704) player_device = <device_num>}
		endif
	elseif are_multiple_controllers_connected
		create_loading_screen
		ui_event \{event = menu_change
			data = {
				state = uistate_band_mode
			}}
	else
		ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0x2dda730c) player_device = <device_num>}
	endif
endscript

script ui_group_play_select_online_career 
	hide_glitch \{num_frames = 20}
	if NOT is_regular_controller_not_enough_mics controller = <device_num>
		check_net_privaleges action = <action> device_num = <device_num>
	else
		if isXenon
			ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0xec4dbd17) player_device = <device_num>}
		else
			ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0xe2f3f704) player_device = <device_num>}
		endif
	endif
endscript

script ui_group_play_select_host 
	ui_group_play_select_join action = <action>
endscript

script check_net_privaleges 


	if isXenon
		Change \{game_mode = p4_career}
		netoptions :pref_choose \{Name = game_modes
			checksum = p4_career}
	endif
	ui_event event = menu_change data = {state = uistate_signin
		device_num = <device_num>
		allow_back = 1
		new_state = uistate_net_setup
		new_data = {action = <action> controller = <device_num> going_to_career}
		require_live = 1}
endscript

script are_multiple_controllers_connected 
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	endif
	GetActiveControllers
	GetArraySize <active_controllers>
	total_active = 0
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		<total_active> = (<total_active> + 1)
		if ismicrophonepluggedin
			if IsGuitarController controller = <controller_index>
				return \{true}
			endif
			if isdrumcontroller controller = <controller_index>
				return \{true}
			endif
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_Size>
	if (<total_active> > 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_group_play_poll_for_band_mode 
	begin
	if NOT has_enough_controllers_for_band
		if (<local_mode_allowed> = 1)
			ui_event \{event = menu_replace
				data = {
					state = uistate_group_play
				}}
			Block
		endif
	else
		if (<local_mode_allowed> = 0)
			ui_event \{event = menu_replace
				data = {
					state = uistate_group_play
				}}
			Block
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script has_only_regular_controller_no_mic 
	if ($allow_controller_for_all_instruments = 1)
		return \{FALSE}
	endif
	get_num_mics_plugged_in
	if (<num_mics_plugged_in> > 0)
		return \{FALSE}
	endif
	GetActiveControllers
	GetArraySize <active_controllers>
	total_active = 0
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		<total_active> = (<total_active> + 1)
		if NOT is_regular_controller controller = <controller_index>
			return \{FALSE}
		elseif controller_has_headset controller = <controller_index>
			return \{FALSE}
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_Size>
	return \{true}
endscript

script is_regular_controller_not_enough_mics 

	if is_regular_controller controller = <controller>
		if ($allow_controller_for_all_instruments = 1)
			return \{FALSE}
		endif
		get_num_mics_plugged_in
		if (<num_mics_plugged_in> > 0)
			return \{FALSE}
		endif
		if controller_has_headset controller = <controller>
			return \{FALSE}
		endif
		return \{true}
	endif
	return \{FALSE}
endscript

script has_enough_controllers_for_band 
	if are_multiple_controllers_connected
		if NOT has_only_regular_controller_no_mic
			return \{true}
		endif
	endif
	return \{FALSE}
endscript
