
script ui_create_play_song \{Type = quickplay}

	menu_music_off
	Change \{unknown_drum_type = 0}
	i = 1
	begin
	usefourlanehighway {Player = <i> reset}
	i = (<i> + 1)
	repeat ($current_num_players)
	Change \{band_builder_current_gig_genre = None}
	band_anim_reset_loading
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

		if StructureContains structure = ($<tier_global>.<tiername>) genre
			Change band_builder_current_gig_genre = ($<tier_global>.<tiername>.genre)
		endif
		progression_cashmilestonesclear
		progression_cleardetailedstatsforgig
		progression_reset_new_unlocks
		ui_gig_cash_clear_gig_earnings
	else
		if GotParam \{selected_level}
			Change current_level = <selected_level>
		else
			if ($end_credits = 0)
				if ($current_song = jamsession)
					Change \{current_level = load_z_studio}
				else
					get_song_struct song = ($current_song)
					if StructureContains structure = <song_struct> Name = 0x59cb4f1c
						0x59cb4f1c = (<song_struct>.0x59cb4f1c)
						GetArraySize $<0x59cb4f1c>
						GetRandomValue a = 0 b = (<array_Size> -1) Name = random_venue_index integer
						Change current_level = (($<0x59cb4f1c>) [<random_venue_index>])
					else
						Change \{current_level = load_z_metalfest}
					endif
				endif
			endif
		endif
		progression_cashmilestonesclear
		ui_gig_cash_clear_gig_earnings
	endif
	SpawnScriptNow ui_create_play_song_spawned params = <...>
endscript

script ui_destroy_play_song 
	if ($is_network_game = 0)
		($default_loading_screen.Destroy)
	endif
endscript

script ui_create_play_song_spawned 
	StartRendering
	($default_loading_screen.create)
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
				<current_song> = ($temp_quickplay_song_list [($quickplay_song_list_current)])
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
