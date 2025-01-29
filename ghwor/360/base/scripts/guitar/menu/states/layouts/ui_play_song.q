
script ui_create_play_song \{Type = quickplay
		reset_target_data = 1}
	printf \{'ui_create_play_song'}
	songlist_kill_cycle_song_previews
	audio_ui_menu_music_off
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
	gamemode_gettype
	if (<Type> = quickplay)
		if (<reset_target_data> = 1)
			quickplay_reset_target_data
		endif
	endif
	SpawnScriptNow ui_create_play_song_spawned params = <...>
endscript

script ui_destroy_play_song 
	if ($is_network_game = 0)
		if NOT GotParam \{do_not_destroy_loading_screen}
			($default_loading_screen.Destroy)
		endif
	endif
	destroy_player_drop_events
endscript

script get_jam_filename \{Type = current
		by_index = 0
		playlist_index = 1}
	if NOT musicstudio_mainobj :musicstudio_isinmusicstudio
		if (<by_index> = 0)
			if (<Type> = current)
				playlist_getcurrentsongprops
			else
				playlist_getnextsongprops
			endif
		else
			playlist_getsongpropsbyindex index = <playlist_index>
		endif
		example_song = 0
		AddParams <additional_props>
	else
		<jam_index> = ($musicstudio_in_studio_playback_jam_index)
		<example_song> = ($musicstudio_in_studio_playback_example_song)
	endif
	if (<example_song> = 1)
		GetArraySize ($jam_song_assets)
		if (<jam_index> >= <array_Size>)
			return \{FALSE}
		endif
		<FileName> = (($jam_song_assets) [<jam_index>].FileName)
		<jam_display_name> = (($jam_song_assets) [<jam_index>].display_name)
	else
		GetArraySize ($jam_curr_directory_listing)
		if (<jam_index> >= <array_Size>)
			return \{FALSE}
		endif
		<FileName> = ($jam_curr_directory_listing [<jam_index>].FileName)
		<jam_display_name> = <FileName>
	endif
	return true FileName = <FileName> example_song = <example_song> jam_display_name = <jam_display_name>
endscript

script ui_create_play_song_spawned \{loading_movie = None}
	transition_to_gameplay_state = 1
	StartRendering
	gamemode_gettype
	if (<Type> != tutorial)
		if (<loading_movie> = None)
			($default_loading_screen.create)
		else
			create_loading_screen {bink = <loading_movie> loading_screen_type = bink bink_heap = <bink_heap>}
		endif
	endif
	destroy_friend_feed
	playlist_getcurrentsong
	Change \{agora_failed_attempts = 0}
	if ($practice_enabled)
		updatebandsplayerlist
		practice_start_song <...>
	else
		gamemode_gettype
		if checksumequals a = <Type> b = competitive
			if NOT teammodeequals \{team_mode = two_teams}
				updatebandsplayerlist
			endif
		else
			updatebandsplayerlist
		endif
		setup_instrument_stored_part
		if ($is_network_game)
			if (<Type> = career)
				quest_progression_reset_career_progression_tags
				get_savegame_from_controller controller = ($primary_controller)
				quest_progression_set_chapter_tags savegame = <savegame> chapter_global = ($current_chapter) params = {has_been_played = 1}
			endif
			if IsHost
				resetclientsloading
			endif
			load_and_sync_timing
		else
			switch (<Type>)
				case quickplay
				case competitive
				case freeplay
				transition_to_gameplay_state = 0
				ui_event_add_params \{do_not_destroy_loading_screen}
				if (<current_song> = jamsession)
					get_jam_filename \{Type = current}
					if (<example_song> = 1)
					else
					endif
					play_song_start_song_from_quickplay {
						is_jam = 1
						loading_transition = 0
						FileName = <FileName>
						example_song = <example_song>
						jam_display_name = <jam_display_name>
					}
				else
					play_song_start_song_from_quickplay \{is_jam = 0
						loading_transition = 0}
				endif
				case tutorial
				tutorial_system_start_song <...>
				case career
				quest_progression_reset_career_progression_tags
				get_savegame_from_controller controller = ($primary_controller)
				quest_progression_set_chapter_tags savegame = <savegame> chapter_global = ($current_chapter) params = {has_been_played = 1}
				start_song <...>
				default
				start_song <...>
			endswitch
		endif
	endif
	if (<transition_to_gameplay_state> = 1)
		if ($is_network_game = 0)
			if (<current_song> != jamsession)
				($default_loading_screen.Destroy)
				ui_event_wait \{event = menu_replace
					data = {
						state = Uistate_gameplay
					}}
			else
				printf \{channel = bkutcher
					qs(0xf79ba617)}
			endif
		endif
	endif
	set_rich_presence_game_mode
endscript

script play_song_start_song_from_quickplay \{is_jam = !i1768515945
		loading_transition = 0
		show_mainmenu_bg = 1}
	<event> = menu_replace
	if (<loading_transition> = 1)
		<event> = menu_change
	endif
	if (<is_jam> = 1)
		RequireParams \{[
				FileName
				example_song
				jam_display_name
			]
			all}
		unload_songqpak
		clearcustomsong
		jam_recording_create_editable_arrays
		if (<example_song> = 1)
			musicstudio_update_selected_song_name FileName = <FileName> song_name = <jam_display_name>
			loadjam file_name = <FileName> song_name = <FileName>
			ui_event_wait event = <event> state = uistate_finish_song_loading data = {is_jam = 1 loading_transition = <loading_transition>}
		else
			Change memcard_jamsession_file_name = <FileName>
			new_data = {event = menu_replace state = uistate_finish_song_loading data = {is_jam = 1 loading_transition = <loading_transition> from_memcard = 1}}
			ui_event_wait event = <event> data = {state = uistate_memcard Type = load_jam event_params = <new_data> show_mainmenu_bg = <show_mainmenu_bg>}
		endif
	else
		ui_event_wait event = <event> state = uistate_finish_song_loading data = {is_jam = 0 loading_transition = <loading_transition>}
	endif
endscript

script play_song_drop_player 
	printf \{qs(0xea85de59)}
	SpawnScriptNow play_song_drop_player_spawned params = {<...>}
endscript

script play_song_drop_player_spawned 
	if (<is_game_over> = 0)
		getplayerinfo <dropped_player_num> Band
		removeplayerfromband Player = <dropped_player_num> Band = <Band>
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
	repeat 600
	wait_for_safe_shutdown
	gman_sendcallbacktoallgoals \{suffix = 'song_started'}
	gameplay_end_game <...>
endscript

script ui_init_play_song 
	printf \{'ui_init_play_song'}
endscript
