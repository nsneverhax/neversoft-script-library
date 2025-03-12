
script ui_create_fail_song 
	spawn_player_drop_listeners \{drop_player_script = net_career_fail_menu_drop_player
		end_game_script = net_career_fail_menu_end_game}
	change \{playing_song = 0}
	create_fail_song_menu
endscript

script ui_destroy_fail_song 
	destroy_fail_song_menu
	destroy_player_drop_events
endscript

script net_career_fail_menu_drop_player 
	printf \{qs(0x00731d07)}
	if (<is_game_over> = 0)
		setplayerinfo <dropped_player_num> is_local_client = 0
		setplayerinfo <dropped_player_num> net_id_first = 0
		setplayerinfo <dropped_player_num> net_id_second = 0
		setplayerinfo <dropped_player_num> net_obj_id = -1
		setplayerinfo <dropped_player_num> team = 0
		setplayerinfo <dropped_player_num> party_id = -1
		change net_num_players = (($net_num_players) - 1)
		change current_num_players = (($current_num_players) - 1)
		change num_players_in_band = (($num_players_in_band) - 1)
		formattext checksumname = mode 'p%d_career' d = ($current_num_players)
		change game_mode = <mode>
		change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		switch <drop_reason>
			case net_message_player_quit
			formattext textname = drop_msg qs(0xafcc55cd) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formattext textname = drop_msg qs(0xc11e11da) s = <name_string>
			default
			drop_msg = qs(0x00000000)
		endswitch
		if screenelementexists \{id = fail_song_static_text_container}
			net_create_player_drop_message_box parent_element = fail_song_static_text_container drop_msg = <drop_msg>
		endif
	endif
endscript

script net_career_fail_menu_end_game 
	printf \{qs(0x80ac54a9)}
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		switch <drop_reason>
			case net_message_player_quit
			formattext textname = first_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formattext textname = first_msg qs(0xd4b272d7) s = <name_string>
			default
			first_msg = qs(0x00000000)
		endswitch
		formattext textname = msg qs(0x78bb855f) s = <first_msg>
		create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
		if screenelementexists \{id = popup_warning_container}
			popup_warning_container :se_setprops \{z_priority = 1500.2}
		endif
		wait \{3
			seconds}
		destroy_net_popup
		generic_event_back \{state = uistate_group_play}
	endif
endscript
