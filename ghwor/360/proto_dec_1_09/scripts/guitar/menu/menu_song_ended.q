
script create_song_ended_menu \{Player = 1}
	playlist_getcurrentsong
	StopSoundsByBuss \{Encore_Events}
	if IsMoviePlaying \{textureSlot = 1}
		PauseMovie \{textureSlot = 1}
	endif
	disable_pause
	completion = 0
	songfilemanager func = get_song_end_time song_name = <current_song>
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
	getfirstplayer
	getplayerinfo <Player> difficulty
	get_difficulty_text_upper difficulty = <difficulty>
	get_song_title song = <current_song>
	GetUpperCaseString <song_title>
	formatText TextName = completion_text qs(0x76b3fda7) d = <completion>
	<title> = qs(0x1c640654)
	if ($game_mode = practice)
		<text> = qs(0x3ba0fbb3)
	else
		<text> = qs(0x647b5a84)
	endif
	if NOT ininternetmode
		popup_options = [
			{
				func = fail_song_menu_select_retry_song
				text = <text>
			}
		]
	else
		popup_options = []
	endif
	gamemode_gettype
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
		if (<Type> = career)
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs(0x64e825e2)
			}
		else
			if NOT demobuild
				<new_song_option> = {
					func = quickplay_select_edit_playlist
					text = qs(0xa8f207af)
				}
				AddArrayElement array = <popup_options> element = <new_song_option>
				<popup_options> = <array>
			endif
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs(0x3e482764)
			}
		endif
		AddArrayElement array = <popup_options> element = <new_song_option>
		<popup_options> = <array>
	endif
	gamemode_gettype
	if (<Type> = quickplay)
		if NOT ui_event_exists_in_stack \{Name = 'jam'}
			GetArraySize \{$current_playlist}
			if (<array_Size> > 1)
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
		text = qs(0x67d9c56d)
	}
	AddArrayElement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	if ($game_mode = practice)
		create_dialog_box {
			template = fail_song
			heading_text = <title>
			player_device = ($last_start_pressed_device)
			no_background
			options = <popup_options>
			fail_song_props_prac = {
				song_title = <UppercaseString>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
		}
	else
		create_dialog_box {
			template = fail_song
			heading_text = <title>
			player_device = <exclusive_device>
			no_background
			options = <popup_options>
			fail_song_props = {
				song_title = <UppercaseString>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
		}
	endif
endscript

script destroy_song_ended_menu 
	audio_gameplay_fail_song_stop_sounds
	if IsMoviePlaying \{textureSlot = 1}
		ResumeMovie \{textureSlot = 1}
	endif
	destroy_dialog_box
endscript

script song_ended_menu_select_retry_song 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_back \{state = Uistate_gameplay}
	SpawnScriptNow \{restart_song}
endscript

script quickplay_select_edit_playlist 
	songlist_remove_first_song_in_playlist
	generic_event_choose \{nosound
		state = 0x0604ee76
		data = {
			0x28f2d5b2 = menu_back
		}}
endscript

script quickplay_select_new_playlist 
	ui_sfx \{menustate = Generic
		uitype = select}
	songlist_clear_playlist
	generic_event_choose \{state = 0x0604ee76
		data = {
			0x28f2d5b2 = menu_back
			0x3002594a = {
				mode = playlist
			}
		}}
endscript

script quickplay_select_new_song 
	ui_sfx \{menustate = Generic
		uitype = select}
	songlist_clear_playlist
	generic_event_choose \{state = 0x0604ee76
		data = {
			0x28f2d5b2 = menu_back
			0x3002594a = {
				mode = play_song
			}
		}}
endscript

script song_ended_menu_select_new_song 
	end_practice_song_slomo
	if ($practice_enabled = 1)
		reset_practice_mode
		ui_sfx \{menustate = Generic
			uitype = select}
		ui_event event = menu_change state = 0x0604ee76 Player = <Player> data = {0x28f2d5b2 = menu_back}
		return
	endif
	if is_current_song_a_jam_session
		songlist_clear_playlist
		if ui_event_exists_in_stack \{Name = 'jam'}
			if musicstudio_mainobj :musicstudio_isusingstream
				ui_sfx \{menustate = Generic
					uitype = select}
				generic_event_back state = 0x2af1c666 Player = <Player> data = {show_popup = 0}
			else
				ui_sfx \{menustate = Generic
					uitype = select}
				generic_event_back state = uistate_jam_select_song Player = <Player> data = {show_popup = 0}
			endif
		elseif ui_event_exists_in_stack \{Name = 'songlist'}
			ui_sfx \{menustate = Generic
				uitype = select}
			generic_event_choose state = 0x0604ee76 Player = <Player> data = {0x28f2d5b2 = menu_back}
		endif
	else
		songlist_clear_playlist
		gamemode_gettype
		if (<Type> = career)
			career_complete_challenge
		elseif (<Type> = quickplay)
			quickplay_unload_challenges
		endif
		if ui_event_exists_in_stack \{Name = 'songlist'}
			ui_sfx \{menustate = Generic
				uitype = select}
			generic_event_choose state = 0x0604ee76 Player = <Player> data = {0x28f2d5b2 = menu_back 0x3002594a = {keep_current_level}}
			return
		endif
		ScriptAssert \{'Singleplayer hub no longer exists'}
	endif
endscript

script song_ended_menu_select_quit 
	reset_song_loading_hack_global
	if ($game_mode = practice)
		reset_practice_mode
		shut_down_practice_mode
		if ($came_to_practice_from != main_menu)
			Change game_mode = ($came_to_practice_from)
		endif
		ui_sfx \{menustate = Generic
			uitype = select}
		persistent_band_stop_and_unload_anims
		songlist_clear_playlist
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
	gamemode_gettype
	if (<Type> = career)
		if ($calibrate_lag_enabled = 1)
			calibrate_highway_shutdown
			career_song_ended_select_quit \{no_render = 1}
		else
			career_song_ended_select_quit
		endif
		songlist_clear_playlist
		gamemode_gettype
		if (<Type> = career)
			career_complete_challenge
			if GMan_GoalIsActive \{goal = career}
				gman_deactivategoal \{goal = career}
			endif
		endif
	endif
	songlist_clear_playlist
	if ui_event_exists_in_stack \{Name = 'jam'}
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
	gman_startgamemodegoal
	end_practice_song_slomo
	return_to_quickplay_from_practice
endscript
