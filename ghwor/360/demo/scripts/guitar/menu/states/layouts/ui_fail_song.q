
script ui_create_fail_song 
	if ($is_network_game)
		spawnscriptnow \{audio_crowd_fail_song_logic}
	else
		if NOT issingleplayergame
			spawnscriptnow \{audio_crowd_fail_song_logic}
		endif
	endif
	spawn_player_drop_listeners \{drop_player_script = net_career_fail_menu_drop_player
		end_game_script = net_career_fail_menu_end_game}
	change \{playing_song = 0}
	create_fail_song_menu
endscript

script ui_destroy_fail_song 
	destroy_fail_song_menu
endscript

script ui_deinit_fail_song 
	fadetoblack \{off
		id = finalbattle_fade}
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
	band_lobby_restore_prematchmaking_settings
	ui_event_wait_for_safe
	generic_event_back \{state = uistate_band_lobby}
	printf \{qs(0x07eebd39)}
endscript

script finalbattle_fail_audio 
	<first> = ($quest_chapter_finale.songs [0])
	<second> = ($quest_chapter_finale.songs [1])
	<third> = ($quest_chapter_finale.songs [2])
	playlist_getcurrentsong
	printf \{channel = sfx
		qs(0x37c265ec)}
	if ($failed_song_at_end_of_finalbattle = 1)
		switch <current_song>
			case <first>
			case <second>
			spawnscriptnow \{audio_fail_endofsong_vo_line_selection}
			case <third>
			spawnscriptnow \{audio_fail_demigod_endofsong_vo_line_selection}
		endswitch
	else
		switch <current_song>
			case <first>
			case <second>
			spawnscriptnow \{audio_fail_vo_line_selection}
			case <third>
			spawnscriptnow \{audio_fail_demigod_vo_line_selection}
		endswitch
	endif
endscript
