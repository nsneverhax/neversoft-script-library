online_band_num_results = 0

script ui_create_net_career_join_popup 
	create_popup_warning_menu {
		title = qs(0x9b97c7b2)
		textblock = {
			text = qs(0xb8fc4cd1)
		}
		options = [
			{
				func = cancel_net_career_mode_search
				text = qs(0xf7723015)
			}
		]
		no_background
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		player_device = <device_num>
	}
	change \{online_band_num_results = 0}
	netoptions :pref_choose \{name = game_modes
		checksum = p4_career}
	netoptions :pref_choose \{name = ranked
		checksum = player}
	set_network_preferences
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	netsessionfunc \{obj = match
		func = set_search_params
		params = {
			difficulty = dont_care
			gamemode = p4_career
			num_songs = dont_care
			needed_guitars = 2
			needed_drums = 1
			needed_microphones = 1
			scoring_mode = career
		}}
	netsessionfunc \{obj = match
		func = set_server_list_mode
		params = {
			quickmatch
		}}
	netsessionfunc {
		obj = match
		func = start_server_list
		params = {
			callback = online_band_search_item_add
			callback_complete = online_band_search_stop
			controller = <device_num>
		}
	}
	spawnscript check_for_new_players params = {device_num = <device_num>}
endscript

script check_for_new_players 
	printf \{qs(0x4921c565)}
	begin
	if (netsessionfunc obj = match func = get_num_matchmaking_players)
		netsessionfunc \{obj = party
			func = get_party_members}
		getarraysize <connections>
		if (<array_size> < <num_matchmaking_players>)
			destroy_popup_warning_menu
			create_popup_warning_menu {
				title = qs(0xd121e6da)
				textblock = {
					text = qs(0x352fb8a5)
				}
				options = [
					{
						func = cancel_net_career_mode_search
						text = qs(0xf7723015)
					}
				]
				no_background
				popup_event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
					{pad_back cancel_net_career_mode_search}
				]
				player_device = <device_num>
			}
			break
		endif
	endif
	wait \{1
		frame}
	repeat
endscript

script ui_destroy_net_career_join_popup 
	if scriptexists \{check_for_new_players}
		killspawnedscript \{name = check_for_new_players}
	endif
	destroy_popup_warning_menu
endscript

script ui_deinit_net_career_join_popup 
	ui_destroy_net_career_join_popup
endscript

script cancel_net_career_mode_search 
	if netsessionfunc \{obj = match
			func = cancel_join_server}
		obj_getid
		<objid> :se_setprops block_events
		ui_destroy_net_career_join_popup
		change \{num_players_in_band = 0}
		change_controller_disconnect_scripts_on_all_menus \{change_type = add}
		ui_event_wait \{event = menu_refresh}
	endif
endscript

script online_band_search_item_add 
	printf \{qs(0x9276d7e4)}
	change online_career_num_results = (($online_career_num_results) + 1)
endscript

script online_band_search_stop 
	printf \{qs(0x161b5604)}
	netsessionfunc \{obj = match
		func = stop_server_list}
	if ($online_band_num_results = 0)
		ui_event_get_top
		destroy_popup_warning_menu
		ui_create_net_zero_search_results_popup device_num = <device_num>
	endif
endscript
