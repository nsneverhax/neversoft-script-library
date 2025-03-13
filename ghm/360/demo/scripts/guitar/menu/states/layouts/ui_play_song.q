
script ui_create_play_song \{type = quickplay}
	printf \{'ui_create_play_song'}
	menu_music_off
	change \{unknown_drum_type = 0}
	i = 1
	begin
	usefourlanehighway {player = <i> reset}
	i = (<i> + 1)
	repeat ($current_num_players)
	change \{band_builder_current_gig_genre = none}
	band_anim_reset_loading
	if ($is_network_game = 1)
		change \{net_ready_to_start = 0}
		spawn_player_drop_listeners \{drop_player_script = play_song_drop_player
			end_game_script = play_song_game_over}
	endif
	if gotparam \{progression_flag}
		change current_progression_flag = <progression_flag>
		change current_gig_number = <gig_num>
		get_progression_globals <progression_flag>
		formattext checksumname = tiername 'tier%d' d = <gig_num>
		if gotparam \{song_checksum}
			setglobaltags progression params = {current_tier = <gig_num> current_song_count = <song_index>}
			change current_song = <song_checksum>
		else
			setglobaltags progression params = {current_tier = <gig_num> current_song_count = 0}
			change current_song = ($<tier_global>.<tiername>.songs [0])
		endif
		if gotparam \{selected_level}
			change current_level = <selected_level>
		else
			change current_level = ($<tier_global>.<tiername>.level)
		endif
		printstruct ($<tier_global>.<tiername>)
		if structurecontains structure = ($<tier_global>.<tiername>) genre
			change band_builder_current_gig_genre = ($<tier_global>.<tiername>.genre)
		endif
		progression_cashmilestonesclear
		progression_cleardetailedstatsforgig
		progression_reset_new_unlocks
		ui_gig_cash_clear_gig_earnings
		progression_clearnewcash
	else
		if gotparam \{selected_level}
			change current_level = <selected_level>
		endif
		progression_cashmilestonesclear
		ui_gig_cash_clear_gig_earnings
		progression_clearnewcash
		gamemode_gettype
		if ((<type> = battle) || (<type> = faceoff) || (<type> = pro_faceoff))
			refresh_career_earnings
		endif
	endif
	if gotparam \{metallifacts}
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_metallifacts
			}}
		return
	endif
	spawnscriptnow ui_create_play_song_spawned params = <...>
endscript

script ui_destroy_play_song 
	if ($is_network_game = 0)
		($default_loading_screen.destroy)
	endif
	destroy_player_drop_events
endscript

script ui_create_play_song_spawned 
	startrendering
	($default_loading_screen.create) play_song
	change \{agora_failed_attempts = 0}
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
				quickplay_start_song <...>
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
		($default_loading_screen.destroy)
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_gameplay
			}}
	endif
	if ($is_network_game = 1)
		set_rich_presence_game_mode \{online = 1}
	endif
endscript

script play_song_drop_player 
	printf \{qs(0xea85de59)}
	spawnscriptnow play_song_drop_player_spawned params = {<...>}
endscript

script play_song_drop_player_spawned 
	if (<is_game_over> = 0)
		wait_for_safe_shutdown
		gameplay_drop_player <...>
	endif
endscript

script play_song_game_over 
	spawnscriptnow play_song_game_over_spawned params = {<...>}
endscript

script play_song_game_over_spawned 
	printf \{qs(0x849a0785)}
	change \{net_ready_to_start = 1}
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
	if isxenon
		gamemode_getnumplayers
		player_idx = 1
		begin
		getplayerinfo <player_idx> is_local_client
		if (<is_local_client> = 1)
			getplayerinfo <player_idx> controller
			if ((<controller> >= 0) && (<controller> < 4))
				getsavegamefromcontroller controller = <controller>
				get_current_band_info
				getglobaltags <band_info> savegame = <savegame> param = career_earnings
				setplayerinfo <player_idx> career_earnings = <career_earnings>
			endif
		endif
		player_idx = (<player_idx> + 1)
		repeat <num_players>
	endif
endscript
