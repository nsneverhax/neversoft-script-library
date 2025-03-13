
script create_song_ended_menu \{player = 1}
	stopsoundsbybuss \{encore_events}
	if ismovieplaying \{textureslot = 1}
		pausemovie \{textureslot = 1}
	endif
	disable_pause
	completion = 0
	get_song_end_time song = ($current_song)
	getsongtimems
	if (<time> < 0)
		time = 0
	elseif (<time> > <total_end_time>)
		time = <total_end_time>
	endif
	if ($game_mode = training)
		get_player_num_from_controller controller_index = ($primary_controller)
		if NOT playerinfoequals <player_num> part = vocals
			getplayerinfo <player_num> total_notes
			getplayerinfo <player_num> notes_hit
			printstruct channel = mychannel <...>
			if (<total_notes> > 0)
				completion = (((<notes_hit> * 1.0) / <total_notes>) * 100.0)
			else
				completion = 0
			endif
		else
			getplayerinfo <player_num> vocal_phrase_quality
			getplayerinfo <player_num> vocal_phrase_max_qual
			if (<vocal_phrase_max_qual> > 0)
				completion = (((<vocal_phrase_quality>) / <vocal_phrase_max_qual>) * 100.0)
			else
				completion = 0
			endif
		endif
	else
		if (<total_end_time> > 0)
			completion = (100 * <time> / <total_end_time>)
		endif
	endif
	casttointeger \{completion}
	get_difficulty_text_upper difficulty = ($player1_status.difficulty)
	get_song_title song = ($current_song)
	getuppercasestring <song_title>
	formattext textname = completion_text qs(0x76b3fda7) d = <completion>
	<title> = qs(0x1c640654)
	if ($game_mode = training)
		<text> = qs(0x3ba0fbb3)
	else
		<text> = qs(0x647b5a84)
	endif
	popup_options = [
		{
			func = fail_song_menu_select_retry_song
			text = <text>
		}
	]
	gamemode_gettype
	if ($game_mode = training)
		if ($came_to_practice_from = main_menu)
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs(0x3e482764)
			}
			addarrayelement array = <popup_options> element = <new_song_option>
			<popup_options> = <array>
		else
			if ($came_to_practice_from = p1_career)
				<text> = qs(0xb435bc8c)
			else
				<text> = qs(0x0a96ac96)
			endif
			<new_song_option> = {
				func = song_ended_menu_select_back_to_game
				text = <text>
			}
			addarrayelement array = <popup_options> element = <new_song_option>
			<popup_options> = <array>
		endif
	else
		if (<type> = career)
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs(0xe561ef6f)
			}
		else
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
			if ($num_quickplay_song_list > 1)
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
	if ($game_mode = training)
		create_popup_warning_menu {
			title = <title>
			player_device = ($last_start_pressed_device)
			no_background
			options = <popup_options>
			fail_song_props_prac = {
				song_title = <uppercasestring>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
		}
	else
		create_popup_warning_menu {
			title = <title>
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
endscript

script destroy_song_ended_menu 
	gh3_sfx_fail_song_stop_sounds
	if ismovieplaying \{textureslot = 1}
		resumemovie \{textureslot = 1}
	endif
	destroy_popup_warning_menu
endscript

script song_ended_menu_select_retry_song 
	if ($special_event_stage != 0)
		reset_special_event \{num = $current_special_event_num}
	endif
	generic_event_back \{state = uistate_gameplay}
	spawnscriptnow \{restart_song}
endscript

script song_ended_menu_select_new_song 
	if ($practice_enabled = 1)
		if ($special_event_stage != 0)
			generic_event_back state = uistate_gig_posters player = <player>
			change game_mode = ($special_event_previous_game_mode)
		else
			generic_event_back state = uistate_setlist player = <player>
		endif
		return
	endif
	if ($current_song = jamsession)
		if ui_event_exists_in_stack \{name = 'jam'}
			if NOT ($jam_view_cam_created = 1)
				destroy_bg_viewport
				setup_bg_viewport
				playigccam \{name = jam_view_cam
					viewport = bg_viewport
					controlscript = jam_camera_script
					params = {
						start_camera = jam_song_select
					}
					play_hold = 1}
				change \{jam_view_cam_created = 1}
				change \{target_jam_camera_prop = failed_song_cam}
			endif
			generic_event_back state = uistate_jam_select_song player = <player> data = {show_popup = 0}
		elseif ui_event_exists_in_stack \{name = 'setlist'}
			generic_event_back state = uistate_setlist player = <player>
		endif
	else
		if ui_event_exists_in_stack \{name = 'setlist'}
			generic_event_back state = uistate_setlist player = <player>
			return
		endif
		ui_memcard_autosave \{state = uistate_gig_posters
			data = {
				all_active_players = true
			}}
	endif
endscript

script song_ended_menu_select_quit 
	change \{should_reset_gig_posters_selection = 1}
	if ($game_mode = training)
		change \{practice_enabled = 0}
		change game_mode = ($came_to_practice_from)
		change \{current_num_players = 1}
		gamemode_updatenumplayers \{num_players = 1}
		destroy_band
		generic_event_back \{state = uistate_mainmenu}
		return
	endif
	if ($is_network_game = 1)
		quit_network_game
	endif
	gamemode_gettype
	if (<type> = career)
		career_song_ended_select_quit
	endif
	ui_memcard_autosave_replace \{state = uistate_mainmenu
		data = {
			all_active_players = true
		}}
endscript

script song_ended_menu_select_back_to_game 
	change \{practice_enabled = 0}
	change game_mode = ($came_to_practice_from)
	change \{current_num_players = 1}
	gamemode_updatenumplayers \{num_players = 1}
	destroy_band
	if ($came_to_practice_from = p1_career)
		create_loading_screen \{destroy_state = 'gig_posters'}
		ui_event \{event = menu_back
			state = uistate_singleplayer_character_hub
			data = {
				pass_to_gigboard = true
			}}
	else
		ui_event_wait_for_safe
		end_practice_song
		spawnscriptnow \{return_to_quickplay_from_practice}
	endif
endscript
