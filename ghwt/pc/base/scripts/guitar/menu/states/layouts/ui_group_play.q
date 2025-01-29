
script ui_create_group_play 
	change \{band_mode_menu_tags = none}
	spawnscriptnow ui_create_group_play_spawned params = <...>
endscript

script ui_create_group_play_spawned 
	change \{rich_presence_context = presence_menus}
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
	<window_id> :settags local_mode_id = <item_id>
	if iswinport
		0x59b28e8a = 0xf3076f72
	endif
	if ((isps3) || (iswinport))
		if has_only_regular_controller_no_mic
			add_menu_frontend_item {
				text = qs(0xae32ab89)
				pad_choose_script = <0x59b28e8a>
				pad_choose_params = {
					action = join
				}
				rgba = [50 44 35 255]
			}
		else
			add_menu_frontend_item {
				text = qs(0xae32ab89)
				pad_choose_script = <0x59b28e8a>
				pad_choose_params = {
					action = join
				}
			}
		endif
	else
		if isxenon
			if has_only_regular_controller_no_mic
				add_menu_frontend_item \{text = qs(0xbc7c80d3)
					pad_choose_script = ui_group_play_select_online_career
					pad_choose_params = {
						action = join
					}
					rgba = [
						50
						44
						35
						255
					]}
			else
				add_menu_frontend_item \{text = qs(0xbc7c80d3)
					pad_choose_script = ui_group_play_select_online_career
					pad_choose_params = {
						action = join
					}}
			endif
		endif
	endif
	<window_id> :settags join_id = <item_id>
	if ((isps3) || (iswinport))
		if has_only_regular_controller_no_mic
			add_menu_frontend_item {
				text = qs(0x695d5835)
				pad_choose_script = <0x59b28e8a>
				pad_choose_params = {
					action = host
				}
				rgba = [50 44 35 255]
			}
		else
			add_menu_frontend_item {
				text = qs(0x695d5835)
				pad_choose_script = <0x59b28e8a>
				pad_choose_params = {
					action = host
				}
			}
		endif
	else
		if isxenon
			if has_only_regular_controller_no_mic
				add_menu_frontend_item \{text = qs(0x29451ec0)
					pad_choose_script = ui_group_play_select_online_career
					pad_choose_params = {
						action = host
					}
					rgba = [
						50
						44
						35
						255
					]}
			else
				add_menu_frontend_item \{text = qs(0x29451ec0)
					pad_choose_script = ui_group_play_select_online_career
					pad_choose_params = {
						action = host
					}}
			endif
		endif
	endif
	ui_return_game_mode
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_group_play 
	generic_ui_destroy
endscript

script ui_return_group_play 
	ui_return_game_mode
endscript

script ui_group_play_select_local 
	if iswinport
		if are_multiple_controllers_connected
			ui_event \{event = menu_change
				data = {
					state = uistate_band_mode
				}}
		else
			ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0x2dda730c) player_device = <device_num>}
		endif
	else
		if is_regular_controller_not_enough_mics controller = <device_num>
			if isxenon
				ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0xec4dbd17) player_device = <device_num>}
			else
				ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0xe2f3f704) player_device = <device_num>}
			endif
		elseif are_multiple_controllers_connected
			ui_event \{event = menu_change
				data = {
					state = uistate_band_mode
				}}
		else
			ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0x2dda730c) player_device = <device_num>}
		endif
	endif
endscript

script ui_group_play_select_online_career 
	hide_glitch \{num_frames = 20}
	if iswinport
		printf qs(0x711ebb89) a = <action> b = <0x1816549a>
		change \{gprivatematchid = 0}
		if (<action> = join)
			if (<0x1816549a> = 0)
				setnetworkpreference \{field = 'private_slots'
					num = 0
					string = qs(0xaec7c1fb)}
			else
				setnetworkpreference \{field = 'private_slots'
					num = 0
					string = qs(0xaec7c1fb)}
				netsessionfunc func = 0xe2e0930f params = {0x61afa310 = <0x63a3e122>}
				change gprivatematchid = <privatematchid>
			endif
		else
			if (<0x1816549a> = 0)
				setnetworkpreference \{field = 'private_slots'
					num = 0
					string = qs(0xaec7c1fb)}
			else
				setnetworkpreference \{field = 'private_slots'
					num = 1
					string = qs(0xaec7c1fb)}
			endif
		endif
		check_net_privaleges action = <action> device_num = <device_num>
	else
		if NOT is_regular_controller_not_enough_mics controller = <device_num>
			check_net_privaleges action = <action> device_num = <device_num>
		else
			if isxenon
				ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0xec4dbd17) player_device = <device_num>}
			else
				ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0xe2f3f704) player_device = <device_num>}
			endif
		endif
	endif
endscript

script ui_group_play_select_host 
	ui_group_play_select_join action = <action>
endscript

script check_net_privaleges 
	printf \{qs(0x6dfb75ef)}
	requireparams \{[
			device_num
			action
		]
		all}
	if isxenon
		change \{game_mode = p4_career}
		netoptions :pref_choose \{name = game_modes
			checksum = p4_career}
	endif
	if iswinport
		if NOT (netsessionfunc func = isloggedin)
			printf \{qs(0x4ad0132e)}
			change \{0x8bcedbb2 = 1}
			ui_event event = menu_replace data = {state = uistate_signin device_num = <device_num> online_menu}
			return
		endif
		ui_event event = menu_change data = {state = uistate_signin
			device_num = <device_num>
			allow_back = 1
			new_state = uistate_net_setup
			new_data = {action = <action> controller = <device_num> going_to_career}
			require_live = 1}
	else
		ui_event event = menu_change data = {state = uistate_signin
			device_num = <device_num>
			allow_back = 1
			new_state = uistate_net_setup
			new_data = {action = <action> controller = <device_num> going_to_career}
			require_live = 1}
	endif
endscript

script are_multiple_controllers_connected 
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	endif
	getactivecontrollers
	getarraysize <active_controllers>
	total_active = 0
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		<total_active> = (<total_active> + 1)
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_size>
	if (<total_active> > 1)
		return \{true}
	endif
	return \{false}
endscript

script ui_group_play_poll_for_band_mode 
	begin
	if NOT has_enough_controllers_for_band
		if (<local_mode_allowed> = 1)
			ui_event \{event = menu_replace
				data = {
					state = uistate_group_play
				}}
			block
		endif
	else
		if (<local_mode_allowed> = 0)
			ui_event \{event = menu_replace
				data = {
					state = uistate_group_play
				}}
			block
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script has_only_regular_controller_no_mic 
	if ($allow_controller_for_all_instruments = 1)
		return \{false}
	endif
	get_num_mics_plugged_in
	if (<num_mics_plugged_in> > 0)
		return \{false}
	endif
	getactivecontrollers
	getarraysize <active_controllers>
	total_active = 0
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		<total_active> = (<total_active> + 1)
		if NOT is_regular_controller controller = <controller_index>
			return \{false}
		elseif controller_has_headset controller = <controller_index>
			return \{false}
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_size>
	return \{true}
endscript

script is_regular_controller_not_enough_mics 
	requireparams \{[
			controller
		]
		all}
	if is_regular_controller controller = <controller>
		if ($allow_controller_for_all_instruments = 1)
			return \{false}
		endif
		get_num_mics_plugged_in
		if (<num_mics_plugged_in> > 0)
			return \{false}
		endif
		if controller_has_headset controller = <controller>
			return \{false}
		endif
		return \{true}
	endif
	return \{false}
endscript

script has_enough_controllers_for_band 
	if are_multiple_controllers_connected
		if NOT has_only_regular_controller_no_mic
			return \{true}
		endif
	endif
	return \{false}
endscript

script 0xf3076f72 
	printf \{qs(0x14cee058)}
	requireparams \{[
			device_num
			action
		]
		all}
	spawnscriptnow 0x7a8e751b params = {<...>}
endscript

script 0x7a8e751b 
	printf \{qs(0xf89fb39c)}
	change \{0x026fef04 = 0}
	0xecf4238f = ui_group_play_select_online_career
	0x498fda94 = ui_group_play_select_online_career
	if (<action> = join)
		menu_title = qs(0xae32ab89)
		0x498fda94 = 0x71e0df42
	else
		menu_title = qs(0x695d5835)
	endif
	make_menu_frontend {
		pad_back_script = ui_game_mode_back
		title = <menu_title>
		use_all_controllers
	}
	add_menu_frontend_item {
		text = qs(0x5bf31553)
		pad_choose_script = <0xecf4238f>
		pad_choose_params = {
			<...>
			0x1816549a = 0
		}
	}
	add_menu_frontend_item {
		text = qs(0x063894c5)
		pad_choose_script = <0x498fda94>
		pad_choose_params = {
			<...>
			0x1816549a = 1
		}
	}
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script 0xdbdb3318 
	printf \{qs(0x7ca23ef2)}
	generic_ui_destroy
endscript
0x0c3ff873 = 0
0xc241bc97 = join
0x6906a7a0 = 0

script 0x71e0df42 
	printf qs(0xb3bb45da) a = <action> b = <0x1816549a>
	change 0x0c3ff873 = <device_num>
	change 0xc241bc97 = <action>
	change 0x6906a7a0 = <0x1816549a>
	netsessionfunc \{func = friends_init}
	netsessionfunc obj = friends func = begin_retrieve_friends_list params = {
		callback = 0xbfb24839
		device_num = <device_num>
		callback_params = {none}
	}
	make_generic_menu \{title = qs(0x9506c199)
		pad_back_script = 0x87913621
		pad_option2_script = 0x78c02c45
		pad_option_script = 0x161837f8
		menu_id = 0x9a48c3a4
		vmenu_id = 0x86a90086
		dims = (600.0, 400.0)
		use_all_controllers}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	add_user_control_helper \{text = qs(0xc29d3992)
		button = yellow
		z = 100}
	add_user_control_helper \{text = qs(0x73fa75be)
		button = blue
		z = 100}
	launchevent \{type = focus
		target = 0x86a90086}
endscript

script 0xbfb24839 
	printf \{qs(0x76b4ee34)}
	if screenelementexists \{id = current_menu}
		if gotparam \{friendlist}
			current_menu :settags friendlist = <friendlist>
			getarraysize <friendlist>
			if (<array_size> > 0)
				i = 0
				begin
				add_generic_menu_text_item {
					text = (<friendlist> [<i>].name)
					pad_choose_script = 0x7941a919
					pad_choose_params = {name = (<friendlist> [<i>].name) index = <i>}
				}
				<i> = (<i> + 1)
				repeat <array_size>
			else
				add_generic_menu_text_item \{text = qs(0x3e8a16b2)}
			endif
		endif
	endif
endscript

script 0x7941a919 
	printf \{qs(0x3b8f7574)}
	printf qs(0xaac75fdc) i = <index> n = <name>
	spawnscriptnow ui_group_play_select_online_career params = {
		device_num = $0x0c3ff873
		action = $0xc241bc97
		0x1816549a = $0x6906a7a0
		0x63a3e122 = <name>
	}
endscript

script 0x87913621 
	printf \{qs(0x255e2796)}
	generic_event_back
endscript

script 0x78c02c45 
	printf \{qs(0x65b3499e)}
	0x70ada6f7 \{0x007e14f4 = 0x3e4a16f3}
endscript

script 0x161837f8 
	printf \{qs(0x17233780)}
	if screenelementexists \{id = current_menu}
		current_menu :gettags
		getarraysize <friendlist>
		menu_getselectedindex
		if ((<array_size> > 0) && (<selected_index> < <array_size>))
			netsessionfunc func = 0x9d862ba3 params = {name = (<friendlist> [<selected_index>].name)}
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_mainmenu
					base_name = 'mainmenu'
					selected_index = 0
					clear_previous_stack
				}}
		endif
	endif
endscript
