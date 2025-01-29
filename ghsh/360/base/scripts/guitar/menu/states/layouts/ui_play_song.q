
script ui_create_play_song \{Type = quickplay}
	printf \{'ui_create_play_song'}
	menu_music_off
	Change \{unknown_drum_type = 0}
	i = 1
	begin
	usefourlanehighway {Player = <i> reset}
	i = (<i> + 1)
	repeat ($current_num_players)
	Change \{band_builder_current_gig_genre = None}
	band_anim_reset_loading
	if ($is_network_game = 1)
		Change \{net_ready_to_start = 0}
		spawn_player_drop_listeners \{drop_player_script = play_song_drop_player
			end_game_script = play_song_game_over}
	endif
	if GotParam \{progression_flag}
		Change current_progression_flag = <progression_flag>
		Change current_gig_number = <gig_num>
		get_progression_globals <progression_flag>
		formatText checksumName = tiername 'tier%d' d = <gig_num>
		if GotParam \{song_checksum}
			SetGlobalTags Progression params = {current_tier = <gig_num> current_song_count = <song_index>}
			Change current_song = <song_checksum>
		else
			SetGlobalTags Progression params = {current_tier = <gig_num> current_song_count = 0}
			Change current_song = ($<tier_global>.<tiername>.songs [0])
		endif
		if GotParam \{selected_level}
			Change current_level = <selected_level>
		else
			Change current_level = ($<tier_global>.<tiername>.level)
		endif
		printstruct ($<tier_global>.<tiername>)
		if StructureContains structure = ($<tier_global>.<tiername>) genre
			Change band_builder_current_gig_genre = ($<tier_global>.<tiername>.genre)
		endif
		progression_cashmilestonesclear
		progression_cleardetailedstatsforgig
		progression_reset_new_unlocks
		ui_gig_cash_clear_gig_earnings
		progression_clearnewcash
	else
		if GotParam \{selected_level}
			Change current_level = <selected_level>
		endif
		progression_cashmilestonesclear
		ui_gig_cash_clear_gig_earnings
		progression_clearnewcash
		gamemode_gettype
		if ((<Type> = battle) || (<Type> = faceoff) || (<Type> = pro_faceoff))
			refresh_career_earnings
		endif
	endif
	if GotParam \{metallifacts}
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_metallifacts
			}}
		return
	endif
	SpawnScriptNow ui_create_play_song_spawned params = <...>
endscript

script ui_destroy_play_song 
	if ($is_network_game = 0)
		($default_loading_screen.Destroy)
	endif
	destroy_player_drop_events
endscript

script ui_create_play_song_spawned 
	StartRendering
	($default_loading_screen.create) play_song
	Change \{agora_failed_attempts = 0}
	if ($practice_enabled)
		practice_start_song <...>
	else
		if ($is_network_game)
			load_and_sync_timing
		else
			switch ($game_mode)
				case p1_quickplay
				case p2_quickplay
				case p3_quickplay
				case p4_quickplay
				<current_song> = ($quickplay_song_list [($quickplay_song_list_current)])
				if (<current_song> = jamsession)
					<jam_directory_index> = ($temp_jamsession_song_list [($quickplay_song_list_current)])
					<example_song> = 0
					if (<jam_directory_index> >= 1000)
						<jam_directory_index> = (<jam_directory_index> - 1000)
						<example_song> = 1
						<FileName> = (($jam_song_assets) [<jam_directory_index>].FileName)
					else
						<FileName> = ($jam_curr_directory_listing [<jam_directory_index>].FileName)
					endif
					quickplay_choose_random_venue <...>
					($default_loading_screen.Destroy)
					jam_start_song_from_quickplay <...>
					return
				else
					quickplay_start_song <...>
				endif
				case p2_faceoff
				case p2_pro_faceoff
				case p2_battle
				quickplay_choose_random_venue <...>
				start_song <...>
				case p1_career
				default
				start_song <...>
			endswitch
		endif
	endif
	if ($is_network_game = 0)
		($default_loading_screen.Destroy)
		ui_event_wait \{event = menu_replace
			data = {
				state = Uistate_gameplay
			}}
	endif
	if ($is_network_game = 1)
		set_rich_presence_game_mode \{online = 1}
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
	wait_for_safe_shutdown
	gameplay_end_game <...>
endscript

script ui_init_play_song 
	printf \{'ui_init_play_song'}
	if NOT ($current_level = $final_credits_zone)
		if NOT ($game_mode = training)
			if NOT ($battle_do_or_die = 1)
				guitar_force_unload_anim_paks \{not_wli}
			endif
		endif
	endif
endscript

script refresh_career_earnings 
	if isXenon
		gamemode_getnumplayers
		player_idx = 1
		begin
		getplayerinfo <player_idx> is_local_client
		if (<is_local_client> = 1)
			getplayerinfo <player_idx> controller
			if ((<controller> >= 0) && (<controller> < 4))
				getsavegamefromcontroller controller = <controller>
				get_current_band_info
				GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
				setplayerinfo <player_idx> career_earnings = <career_earnings>
			endif
		endif
		player_idx = (<player_idx> + 1)
		repeat <num_players>
	endif
endscript
