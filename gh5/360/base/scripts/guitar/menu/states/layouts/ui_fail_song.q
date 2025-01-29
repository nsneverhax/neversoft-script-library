
script ui_create_fail_song 
	if ($is_network_game)
		SpawnScriptNow \{fail_song_crowd_logic}
	endif
	spawn_player_drop_listeners \{drop_player_script = net_career_fail_menu_drop_player
		end_game_script = net_career_fail_menu_end_game}
	Change \{playing_song = 0}
	create_fail_song_menu
endscript

script ui_destroy_fail_song 
	destroy_fail_song_menu
endscript

script net_career_fail_menu_drop_player 
	printf \{qs(0x00731d07)}
	if (<is_game_over> = 0)
		setplayerinfo <dropped_player_num> is_local_client = 0
		setplayerinfo <dropped_player_num> net_id_first = 0
		setplayerinfo <dropped_player_num> net_id_second = 0
		setplayerinfo <dropped_player_num> net_obj_id = -1
		setplayerinfo <dropped_player_num> Band = 1
		setplayerinfo <dropped_player_num> party_id = -1
		setplayerinfo <dropped_player_num> in_game = 0
		Change net_num_players = (($net_num_players) - 1)
		Change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		switch <drop_reason>
			case net_message_player_quit
			formatText TextName = drop_msg qs(0xafcc55cd) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formatText TextName = drop_msg qs(0xc11e11da) s = <name_string>
			default
			drop_msg = qs(0x00000000)
		endswitch
		if ScreenElementExists \{id = fail_song_static_text_container}
			net_create_player_drop_message_box parent_element = fail_song_static_text_container drop_msg = <drop_msg>
		endif
	endif
endscript

script net_career_fail_menu_end_game 
	printf \{qs(0x80ac54a9)}
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		switch <drop_reason>
			case net_message_player_quit
			formatText TextName = first_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formatText TextName = first_msg qs(0xd4b272d7) s = <name_string>
			default
			first_msg = qs(0x00000000)
		endswitch
		formatText TextName = msg qs(0x78bb855f) s = <first_msg>
		SpawnScriptNow career_fail_menu_end_game_spawned id = not_ui_player_drop_scripts params = {<...>}
	endif
endscript

script career_fail_menu_end_game_spawned 
	printf \{qs(0x035f08b3)}
	ui_event_wait_for_safe
	wait_for_safe_shutdown
	create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
	if ScreenElementExists \{id = dialog_box_container}
		dialog_box_container :se_setprops \{z_priority = 1500.2}
	endif
	Wait \{3
		Seconds}
	destroy_net_popup
	wait_for_safe_shutdown
	quit_network_game_early
	career_end_challenge
	band_lobby_restore_prematchmaking_settings
	ui_event_wait_for_safe
	generic_event_back \{state = uistate_band_lobby_setup}
	printf \{qs(0x07eebd39)}
endscript
