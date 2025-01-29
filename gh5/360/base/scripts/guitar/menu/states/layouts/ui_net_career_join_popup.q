online_band_num_results = 0

script ui_create_net_career_join_popup 
	create_dialog_box {
		heading_text = qs(0xddccf0c3)
		body_text = qs(0xb8fc4cd1)
		options = [
			{
				func = cancel_net_career_mode_search
				text = qs(0xf7723015)
			}
		]
		no_background
		player_device = <device_num>
	}
	Change \{online_band_num_results = 0}
	netoptions :pref_choose \{Name = game_modes
		checksum = gh4_p4_career}
	netoptions :pref_choose \{Name = Ranked
		checksum = Player}
	set_network_preferences
	NetSessionFunc \{Obj = match
		func = stop_server_list}
	NetSessionFunc \{Obj = match
		func = free_server_list}
	NetSessionFunc \{Obj = match
		func = set_search_params
		params = {
			difficulty = dont_care
			gamemode = gh4_p4_career
			num_songs = dont_care
			needed_guitars = 2
			needed_drums = 1
			needed_microphones = 1
			scoring_mode = career
		}}
	NetSessionFunc \{Obj = match
		func = set_server_list_mode
		params = {
			quickmatch
		}}
	NetSessionFunc {
		Obj = match
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
	if (NetSessionFunc Obj = match func = get_num_matchmaking_players)
		NetSessionFunc \{Obj = party
			func = get_party_members}
		GetArraySize <connections>
		if (<array_Size> < <num_matchmaking_players>)
			destroy_dialog_box
			create_dialog_box {
				heading_text = qs(0x4d21d20e)
				body_text = qs(0x352fb8a5)
				options = [
					{
						func = cancel_net_career_mode_search
						text = qs(0xf7723015)
					}
				]
				no_background
				back_button_script = cancel_net_career_mode_search
				player_device = <device_num>
			}
			break
		endif
	endif
	Wait \{1
		Frame}
	repeat
endscript

script ui_destroy_net_career_join_popup 
	if ScriptExists \{check_for_new_players}
		KillSpawnedScript \{Name = check_for_new_players}
	endif
	destroy_dialog_box
endscript

script ui_deinit_net_career_join_popup 
	ui_destroy_net_career_join_popup
endscript

script cancel_net_career_mode_search 
	if NetSessionFunc \{Obj = match
			func = cancel_join_server}
		Obj_GetID
		<objID> :se_setprops block_events
		ui_destroy_net_career_join_popup
		ui_event_wait \{event = menu_refresh}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script online_band_search_item_add 
	printf \{qs(0x9276d7e4)}
	Change online_career_num_results = (($online_career_num_results) + 1)
endscript

script online_band_search_stop 
	printf \{qs(0x161b5604)}
	NetSessionFunc \{Obj = match
		func = stop_server_list}
	if ($online_band_num_results = 0)
		ui_event_get_top
		destroy_dialog_box
		ui_create_net_zero_search_results_popup device_num = <device_num>
	endif
endscript
