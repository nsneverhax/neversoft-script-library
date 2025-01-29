
script create_song_ended_menu \{Player = 1}
	gman_songtool_getcurrentsong
	if IsMoviePlaying \{textureSlot = 1}
		PauseMovie \{textureSlot = 1}
	endif
	disable_pause
	completion = 0
	if ($game_mode = practice)
		completion = ($practice_current_percentage)
	else
		songfilemanager func = get_song_end_time song_name = <current_song>
		GetSongTimeMs
		if (<time> < 0)
			time = 0
		elseif (<time> > <total_end_time>)
			time = <total_end_time>
		endif
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
	if is_roadie_battle_mode
		formatText TextName = completion_text qs(0x720688b0) d = <completion>
	else
		formatText TextName = completion_text qs(0x76b3fda7) d = <completion>
	endif
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
				text = qs(0xe561ef6f)
			}
		else
			if NOT (<current_song> = jamsession)
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
		text = qs(0x793e4d21)
	}
	AddArrayElement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	get_all_exclusive_devices
	if (is_roadie_battle_mode)
		<choose_sides_option> = {
			func = rb_choose_sides
			text = qs(0x410c6bd2)
		}
		AddArrayElement array = <popup_options> element = <choose_sides_option>
		<popup_options> = <array>
	endif
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
			allow_alternate_directional_events = FALSE
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
	GetArraySize <popup_options>
	if (<array_Size> < 3)
		<menu_id> :se_setprops Pos = {(0.0, 28.0) relative}
	endif
endscript

script destroy_song_ended_menu 
	GH3_SFX_fail_song_stop_sounds
	if IsMoviePlaying \{textureSlot = 1}
		ResumeMovie \{textureSlot = 1}
	endif
	destroy_dialog_box
endscript

script song_ended_menu_select_retry_song 
	ScriptAssert \{'song_ended_menu_select_retry_song: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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

script quickplay_select_edit_playlist 
	generic_event_back \{nosound
		state = uistate_songlist}
endscript

script song_ended_menu_select_new_song 
	Change \{current_speedfactor = 1.0}
	create_loading_screen \{force_predisplay = 1}
	Wait \{3
		gameframes}
	if ($practice_enabled = 1)
		reset_practice_mode
		generic_event_back state = uistate_songlist Player = <Player>
		return
	endif
	if is_current_song_a_jam_session
		songlist_clear_playlist
		if ui_event_exists_in_stack \{Name = 'jam'}
			generic_event_back state = uistate_jam_select_song Player = <Player> data = {show_popup = 0}
		elseif ui_event_exists_in_stack \{Name = 'songlist'}
			generic_event_back state = uistate_songlist Player = <Player>
		endif
	else
		songlist_clear_playlist
		gamemode_gettype
		if (<Type> = career)
			career_complete_challenge
		endif
		if ui_event_exists_in_stack \{Name = 'songlist'}
			generic_event_back state = uistate_songlist Player = <Player> data = {keep_current_level}
			return
		endif
		ScriptAssert \{'Singleplayer hub no longer exists'}
	endif
endscript

script song_ended_menu_select_quit 
	reset_song_loading_hack_global
	if ScreenElementExists \{id = intro_container}
		DestroyScreenElement \{id = intro_container}
	endif
	if ($game_mode = practice)
		reset_practice_mode
		Change game_mode = ($came_to_practice_from)
		gamemode_updatenumplayers \{num_players = 1}
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
	if ($is_network_game)
		if NetSessionFunc \{Obj = party
				func = is_host}
			NetSessionFunc \{Obj = party
				func = disband_party_session}
		else
			NetSessionFunc \{Obj = party
				func = leave_party}
		endif
	endif
	if ui_event_exists_in_stack \{Name = 'jam'}
		ui_memcard_autosave_replace \{state = uistate_jam}
	else
		ui_memcard_autosave_replace \{state = uistate_mainmenu
			data = {
				all_active_players = true
			}}
	endif
endscript

script song_ended_menu_select_back_to_game 
	Change \{practice_enabled = 0}
	Change game_mode = ($came_to_practice_from)
	shut_down_practice_mode
	end_practice_song_slomo
	return_to_quickplay_from_practice
endscript
