
script create_song_ended_menu \{player = 1}
	gman_songtool_getcurrentsong
	stopsoundsbybuss \{encore_events}
	if ismovieplaying \{textureslot = 1}
		pausemovie \{textureslot = 1}
	endif
	disable_pause
	completion = 0
	songfilemanager func = get_song_end_time song_name = <current_song>
	getsongtimems
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
	casttointeger \{completion}
	getfirstplayer
	getplayerinfo <player> difficulty
	get_difficulty_text_upper difficulty = <difficulty>
	get_song_title song = <current_song>
	getuppercasestring <song_title>
	formattext textname = completion_text qs(0x76b3fda7) d = <completion>
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
			addarrayelement array = <popup_options> element = <new_song_option>
			<popup_options> = <array>
		else
			if ($came_to_practice_from = p1_quickplay)
				<new_song_option> = {
					func = song_ended_menu_select_back_to_game
					text = qs(0x0a96ac96)
				}
				addarrayelement array = <popup_options> element = <new_song_option>
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
			if NOT demobuild
				<new_song_option> = {
					func = quickplay_select_edit_playlist
					text = qs(0xa8f207af)
				}
				addarrayelement array = <popup_options> element = <new_song_option>
				<popup_options> = <array>
			endif
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs(0x3e482764)
			}
		endif
		addarrayelement array = <popup_options> element = <new_song_option>
		<popup_options> = <array>
	endif
	gamemode_gettype
	if (<type> = quickplay)
		if NOT ui_event_exists_in_stack \{name = 'jam'}
			getarraysize \{$current_playlist}
			if (<array_size> > 1)
				<skip_song_option> = {
					func = quickplay_skip_song
					text = qs(0xef74f7d2)
				}
				addarrayelement array = <popup_options> element = <skip_song_option>
				<popup_options> = <array>
			endif
		endif
	endif
	<quit_option> = {
		func = song_ended_menu_select_quit
		text = qs(0x793e4d21)
	}
	addarrayelement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	get_all_exclusive_devices
	if ($game_mode = practice)
		create_dialog_box {
			template = fail_song
			heading_text = <title>
			player_device = ($last_start_pressed_device)
			no_background
			options = <popup_options>
			fail_song_props_prac = {
				song_title = <uppercasestring>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
			allow_alternate_directional_events = false
		}
	else
		create_dialog_box {
			template = fail_song
			heading_text = <title>
			player_device = <exclusive_device>
			no_background
			options = <popup_options>
			fail_song_props = {
				song_title = <uppercasestring>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
		}
	endif
	getarraysize <popup_options>
	if (<array_size> < 3)
		<menu_id> :se_setprops pos = {(0.0, 28.0) relative}
	endif
endscript

script destroy_song_ended_menu 
	gh3_sfx_fail_song_stop_sounds
	if ismovieplaying \{textureslot = 1}
		resumemovie \{textureslot = 1}
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
	change \{current_speedfactor = 1.0}
	if ($practice_enabled = 1)
		reset_practice_mode
		generic_event_back state = uistate_songlist player = <player>
		return
	endif
	if is_current_song_a_jam_session
		songlist_clear_playlist
		if ui_event_exists_in_stack \{name = 'jam'}
			generic_event_back state = uistate_jam_select_song player = <player> data = {show_popup = 0}
		elseif ui_event_exists_in_stack \{name = 'songlist'}
			generic_event_back state = uistate_songlist player = <player>
		endif
	else
		songlist_clear_playlist
		gamemode_gettype
		if (<type> = career)
			career_complete_challenge
		endif
		if ui_event_exists_in_stack \{name = 'songlist'}
			generic_event_back state = uistate_songlist player = <player> data = {keep_current_level}
			return
		endif
		scriptassert \{'Singleplayer hub no longer exists'}
	endif
endscript

script song_ended_menu_select_quit 
	reset_song_loading_hack_global
	if ($game_mode = practice)
		reset_practice_mode
		change game_mode = ($came_to_practice_from)
		gamemode_updatenumplayers \{num_players = 1}
		persistent_band_stop_and_unload_anims
		generic_event_back \{state = uistate_mainmenu}
		return
	endif
	if ($is_network_game = 1)
		if NOT gotparam \{use_quit_early}
			quit_network_game
		else
			quit_network_game_early
		endif
	endif
	gamemode_gettype
	if (<type> = career)
		if ($calibrate_lag_enabled = 1)
			calibrate_highway_shutdown
			career_song_ended_select_quit \{no_render = 1}
		else
			career_song_ended_select_quit
		endif
		songlist_clear_playlist
		gamemode_gettype
		if (<type> = career)
			career_complete_challenge
			if gman_goalisactive \{goal = career}
				gman_deactivategoal \{goal = career}
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
	change \{practice_enabled = 0}
	change game_mode = ($came_to_practice_from)
	shut_down_practice_mode
	end_practice_song_slomo
	return_to_quickplay_from_practice
endscript
