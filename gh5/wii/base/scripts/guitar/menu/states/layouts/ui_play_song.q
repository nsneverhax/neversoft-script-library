
script ui_create_play_song \{Type = quickplay}
	printf \{'ui_create_play_song'}
	menu_music_off
	Change \{unknown_drum_type = 0}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		usefourlanehighway {Player = <Player> reset}
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	band_anim_reset_loading
	if ($is_network_game = 1)
		Change \{net_ready_to_start = 0}
		spawn_player_drop_listeners \{drop_player_script = play_song_drop_player
			end_game_script = play_song_game_over}
	endif
	if GotParam \{selected_level}
		Change current_level = <selected_level>
	endif
	SpawnScriptNow ui_create_play_song_spawned params = <...>
endscript

script ui_destroy_play_song 
	if ($is_network_game = 0)
		if ($kickingtomain = 0)
			($default_loading_screen.Destroy)
		endif
	endif
	destroy_player_drop_events
endscript

script get_jam_filename 
	if (<Type> = current)
		gman_songfunc \{func = get_current_song_jam_index}
		<jam_directory_index> = <current_song_jam_index>
	else
		gman_songfunc \{func = get_next_song_jam_index}
		<jam_directory_index> = <next_song_jam_index>
	endif
	<example_song> = 0
	if (<jam_directory_index> >= 1000)
		<jam_directory_index> = (<jam_directory_index> - 1000)
		<example_song> = 1
		<FileName> = (($jam_song_assets) [<jam_directory_index>].FileName)
		<jam_display_name> = (($jam_song_assets) [<jam_directory_index>].display_name)
		<actual_filename> = <FileName>
	else
		<FileName> = ($jam_curr_directory_listing [<jam_directory_index>].FileName)
		<jam_display_name> = <FileName>
		<actual_filename> = ($jam_curr_directory_listing [<jam_directory_index>].actual_file_name)
	endif
	return FileName = <FileName> actual_filename = <actual_filename> example_song = <example_song> jam_display_name = <jam_display_name>
endscript

script ui_create_play_song_spawned 
	($default_loading_screen.create)
	gman_songtool_getcurrentsong
	gman_songtool_getcurrentsong
	Change \{agora_failed_attempts = 0}
	if ($practice_enabled)
		practice_start_song <...>
	else
		updatebandsplayerlist
		check_song_for_zero_difficulty song = <current_song>
		setup_guitar_bass_stored_part
		if ($is_network_game)
			if IsHost
				resetclientsloading
			endif
			load_and_sync_timing
		else
			gamemode_gettype
			switch (<Type>)
				case quickplay
				case competitive
				case freeplay
				if (<current_song> = jamsession)
					get_jam_filename \{Type = current}
					Change \{current_level = load_z_cube}
					($default_loading_screen.Destroy)
					jam_start_song_from_quickplay <...>
				else
					quickplay_start_song <...>
				endif
				case career
				default
				start_song <...>
			endswitch
		endif
	endif
	if ($is_network_game = 0)
		if (<current_song> != jamsession)
			if ($kickingtomain = 0)
				($default_loading_screen.Destroy)
			endif
			ui_event_wait \{event = menu_replace
				data = {
					state = Uistate_gameplay
				}}
		endif
	endif
endscript

script play_song_drop_player 
	printf \{qs(0xea85de59)}
	SpawnScriptNow play_song_drop_player_spawned params = {<...>}
endscript

script play_song_drop_player_spawned 
	if (<is_game_over> = 0)
		wait_for_safe_shutdown
		gameplay_drop_player <...>
	endif
endscript

script play_song_game_over 
	SpawnScriptNow play_song_game_over_spawned params = {<...>}
endscript

script play_song_game_over_spawned 
	printf \{qs(0x849a0785)}
	Change \{net_ready_to_start = 1}
	begin
	if ($start_gem_scroller_running = 0)
		break
	elseif ($songtime_paused = 1)
		Change \{songtime_paused = 0}
	endif
	Wait \{1
		gameframe}
	repeat 1200
	wait_for_safe_shutdown
	gman_sendcallbacktoallgoals \{suffix = 'song_started'}
	gameplay_end_game <...>
endscript

script ui_init_play_song 
	printf \{'ui_init_play_song'}
	sdcardmanagerfunc \{func = push_lock_card}
endscript

script ui_deinit_play_song 
	printf \{'ui_deinit_play_song'}
	sdcardmanagerfunc \{func = pop_lock_card}
endscript
