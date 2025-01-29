
script ui_create_play_song \{type = quickplay}
	printf \{'ui_create_play_song'}
	songlist_kill_cycle_song_previews
	Menu_Music_Off
	Change \{unknown_drum_type = 0}
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		UseFourLaneHighway {player = <player> reset}
		GetNextPlayer player = <player>
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
	spawnscriptnow ui_create_play_song_spawned params = <...>
endscript

script ui_destroy_play_song 
	if ($is_network_game = 0)
		($default_loading_screen.Destroy)
	endif
	destroy_player_drop_events
endscript

script get_jam_filename 
	if (<type> = current)
		GMan_SongFunc \{func = get_current_song_jam_index}
		<jam_directory_index> = <current_song_jam_index>
	else
		GMan_SongFunc \{func = get_next_song_jam_index}
		<jam_directory_index> = <next_song_jam_index>
	endif
	<example_song> = 0
	if (<jam_directory_index> >= 1000)
		<jam_directory_index> = (<jam_directory_index> - 1000)
		<example_song> = 1
		<FileName> = (($jam_song_assets) [<jam_directory_index>].FileName)
		<jam_display_name> = (($jam_song_assets) [<jam_directory_index>].display_name)
	else
		<FileName> = ($jam_curr_directory_listing [<jam_directory_index>].FileName)
	endif
	return FileName = <FileName> example_song = <example_song> jam_display_name = <jam_display_name>
endscript

script ui_create_play_song_spawned 
	StartRendering
	GameMode_GetType
	if (<type> != tutorial)
		($default_loading_screen.create)
	endif
	GMan_SongTool_GetCurrentSong
	Change \{agora_failed_attempts = 0}
	if ($practice_enabled)
		practice_start_song <...>
	else
		GameMode_GetType
		if checksumequals a = <type> b = competitive
			if NOT GameMode_IsTeamGame
				UpdateBandsPlayerList
			endif
		else
			UpdateBandsPlayerList
		endif
		check_song_for_zero_difficulty song = <current_song>
		setup_guitar_bass_stored_part
		if ($is_network_game)
			if IsHost
				ResetClientsLoading
			endif
			load_and_sync_timing
		else
			switch (<type>)
				case quickplay
				case competitive
				case freeplay
				if (<current_song> = jamsession)
					get_jam_filename \{type = current}
					($default_loading_screen.Destroy)
					jam_start_song_from_quickplay <...>
				else
					quickplay_start_song <...>
				endif
				case tutorial
				tutorial_system_start_song <...>
				case career
				default
				start_song <...>
			endswitch
		endif
	endif
	if ($is_network_game = 0)
		if (<current_song> != jamsession)
			($default_loading_screen.Destroy)
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_gameplay
				}}
		else
			printf \{channel = bkutcher
				qs(0xf79ba617)}
		endif
	endif
	set_rich_presence_game_mode
endscript

script play_song_drop_player 
	printf \{qs(0xea85de59)}
	spawnscriptnow play_song_drop_player_spawned params = {<...>}
endscript

script play_song_drop_player_spawned 
	if (<is_game_over> = 0)
		GetPlayerInfo <dropped_player_num> Band
		RemovePlayerFromBand player = <dropped_player_num> Band = <Band>
		wait_for_safe_shutdown
		gameplay_drop_player <...>
	endif
endscript

script play_song_game_over 
	spawnscriptnow play_song_game_over_spawned params = {<...>}
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
	wait \{1
		gameframe}
	repeat 600
	wait_for_safe_shutdown
	gameplay_end_game <...>
endscript

script ui_init_play_song 
	printf \{'ui_init_play_song'}
endscript
