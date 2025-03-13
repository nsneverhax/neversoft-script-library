
script ui_create_fail_song 
	if ($is_network_game)
		spawnscriptnow \{fail_song_crowd_logic}
	endif
	spawn_player_drop_listeners \{drop_player_script = net_career_fail_menu_drop_player
		end_game_script = net_career_fail_menu_end_game}
	change \{playing_song = 0}
	create_fail_song_menu
endscript

script ui_destroy_fail_song 
	destroy_fail_song_menu
endscript

script net_career_fail_menu_drop_player 
	printf \{qs(0x00731d07)}
	if screenelementexists \{id = fail_song_static_text_container}
		net_generic_drop_player parent = fail_song_static_text_container <...>
	else
		net_generic_drop_player <...>
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
		spawnscriptnow career_fail_menu_end_game_spawned id = not_ui_player_drop_scripts params = {<...>}
	endif
endscript

script career_fail_menu_end_game_spawned 
	printf \{qs(0x035f08b3)}
	ui_event_wait_for_safe
	wait_for_safe_shutdown
	create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
	if screenelementexists \{id = dialog_box_container}
		dialog_box_container :se_setprops \{z_priority = 1500.2}
	endif
	wait \{3
		seconds}
	destroy_net_popup
	wait_for_safe_shutdown
	quit_network_game_early
	career_end_challenge
	band_lobby_restore_prematchmaking_settings
	ui_event_wait_for_safe
	generic_event_back \{state = uistate_band_lobby_setup}
	printf \{qs(0x07eebd39)}
endscript
