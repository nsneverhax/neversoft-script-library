
script create_song_ended_menu \{player = 1}
	GMan_SongTool_GetCurrentSong
	StopSoundsByBuss \{Encore_Events}
	if IsMoviePlaying \{TextureSlot = 1}
		PauseMovie \{TextureSlot = 1}
	endif
	disable_pause
	completion = 0
	SongFileManager func = get_song_end_time song_name = <current_song>
	GetSongTimeMs
	if (<time> < 0)
		time = 0
	elseif (<time> > <total_end_time>)
		time = <total_end_time>
	endif
	if ($game_mode = practice)
		completion = ($practice_current_percentage)
	else
		if (<total_end_time> > 0)
			completion = (100 * <time> / <total_end_time>)
		endif
	endif
	CastToInteger \{completion}
	GetFirstPlayer
	GetPlayerInfo <player> difficulty
	get_difficulty_text_upper difficulty = <difficulty>
	get_song_title song = <current_song>
	GetUpperCaseString <song_title>
	FormatText TextName = completion_text qs(0x76b3fda7) d = <completion>
	<Title> = qs(0x1c640654)
	if ($game_mode = practice)
		<text> = qs(0x3ba0fbb3)
	else
		<text> = qs(0x647b5a84)
	endif
	if NOT InInternetMode
		popup_options = [
			{
				func = fail_song_menu_select_retry_song
				text = <text>
			}
		]
	else
		popup_options = []
	endif
	GameMode_GetType
	if ($game_mode = practice)
		if ($came_to_practice_from = main_menu)
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs(0x3e482764)
			}
			AddArrayElement array = <popup_options> element = <new_song_option>
			<popup_options> = <array>
		else
			if ($came_to_practice_from = p1_quickplay)
				<new_song_option> = {
					func = song_ended_menu_select_back_to_game
					text = qs(0x0a96ac96)
				}
				AddArrayElement array = <popup_options> element = <new_song_option>
				<popup_options> = <array>
			endif
		endif
	else
		if (<type> = career)
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs(0xe561ef6f)
			}
		else
			<new_song_option> = {
				func = quickplay_select_edit_playlist
				text = qs(0xa8f207af)
			}
			AddArrayElement array = <popup_options> element = <new_song_option>
			<popup_options> = <array>
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs(0x3e482764)
			}
		endif
		AddArrayElement array = <popup_options> element = <new_song_option>
		<popup_options> = <array>
	endif
	GameMode_GetType
	if (<type> = quickplay)
		if NOT ui_event_exists_in_stack \{name = 'jam'}
			GetArraySize \{$current_playlist}
			if (<array_size> > 1)
				<skip_song_option> = {
					func = quickplay_skip_song
					text = qs(0xef74f7d2)
				}
				AddArrayElement array = <popup_options> element = <skip_song_option>
				<popup_options> = <array>
			endif
		endif
	endif
	<quit_option> = {
		func = song_ended_menu_select_quit
		text = qs(0x793e4d21)
	}
	AddArrayElement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	get_all_exclusive_devices
	if ($game_mode = practice)
		create_dialog_box {
			template = fail_song
			heading_text = <Title>
			player_device = ($last_start_pressed_device)
			no_background
			options = <popup_options>
			fail_song_props_prac = {
				song_title = <UpperCaseString>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
			allow_alternate_directional_events = false
		}
	else
		create_dialog_box {
			template = fail_song
			heading_text = <Title>
			player_device = <exclusive_device>
			no_background
			options = <popup_options>
			fail_song_props = {
				song_title = <UpperCaseString>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
		}
	endif
	GetArraySize <popup_options>
	if (<array_size> < 3)
		<menu_id> :SE_SetProps Pos = {(0.0, 28.0) relative}
	endif
endscript

script destroy_song_ended_menu 
	GH3_SFX_fail_song_stop_sounds
	if IsMoviePlaying \{TextureSlot = 1}
		ResumeMovie \{TextureSlot = 1}
	endif
	destroy_dialog_box
endscript

script song_ended_menu_select_retry_song 
	generic_event_back \{state = uistate_gameplay}
	spawnscriptnow \{restart_song}
endscript

script quickplay_select_edit_playlist 
	generic_event_back \{nosound
		state = uistate_songlist}
endscript

script quickplay_select_new_playlist 
	songlist_clear_playlist
	generic_event_back \{state = uistate_songlist
		data = {
			mode = playlist
		}}
endscript

script quickplay_select_new_song 
	songlist_clear_playlist
	generic_event_back \{state = uistate_songlist
		data = {
			mode = play_song
		}}
endscript

script song_ended_menu_select_new_song 
	Change \{current_speedfactor = 1.0}
	if ($practice_enabled = 1)
		reset_practice_mode
		generic_event_back state = uistate_songlist player = <player>
		return
	endif
	if is_current_song_a_jam_session
		songlist_clear_playlist
		if ui_event_exists_in_stack \{name = 'jam'}
			generic_event_back state = UIstate_jam_select_song player = <player> data = {show_popup = 0}
		elseif ui_event_exists_in_stack \{name = 'songlist'}
			generic_event_back state = uistate_songlist player = <player>
		endif
	else
		songlist_clear_playlist
		GameMode_GetType
		if (<type> = career)
			career_complete_challenge
		endif
		if ui_event_exists_in_stack \{name = 'songlist'}
			generic_event_back state = uistate_songlist player = <player> data = {keep_current_level}
			return
		endif
		ScriptAssert \{'Singleplayer hub no longer exists'}
	endif
endscript

script song_ended_menu_select_quit 
	reset_song_loading_hack_global
	if ($game_mode = practice)
		reset_practice_mode
		Change game_mode = ($came_to_practice_from)
		GameMode_UpdateNumPlayers \{num_players = 1}
		persistent_band_stop_and_unload_anims
		generic_event_back \{state = uistate_mainmenu}
		return
	endif
	if ($is_network_game = 1)
		if NOT GotParam \{use_quit_early}
			quit_network_game
		else
			quit_network_game_early
		endif
	endif
	GameMode_GetType
	if (<type> = career)
		if ($calibrate_lag_enabled = 1)
			calibrate_highway_shutdown
			career_song_ended_select_quit \{no_render = 1}
		else
			career_song_ended_select_quit
		endif
		songlist_clear_playlist
		GameMode_GetType
		if (<type> = career)
			career_complete_challenge
			if GMan_GoalIsActive \{goal = career}
				GMan_DeactivateGoal \{goal = career}
			endif
		endif
	endif
	songlist_clear_playlist
	if ui_event_exists_in_stack \{name = 'jam'}
		ui_memcard_autosave_replace \{state = uistate_jam}
	else
		ui_memcard_autosave_all_players \{memcard_event = menu_replace
			state = uistate_mainmenu}
	endif
endscript

script song_ended_menu_select_back_to_game 
	Change \{practice_enabled = 0}
	Change game_mode = ($came_to_practice_from)
	shut_down_practice_mode
	end_practice_song_slomo
	return_to_quickplay_from_practice
endscript
