online_signin_fs = {
	create = create_online_signin_splash
	destroy = destroy_online_signin_splash
	actions = [
		{
			action = online_enabled
			flow_state = online_menu_fs
		}
		{
			action = go_back
			flow_state = main_menu_fs
		}
		{
			action = cancel
			flow_state = main_menu_fs
		}
	]
}
online_signin_warning_fs = {
	create = create_online_signin_warning_menu
	destroy = destroy_online_signin_warning_menu
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
	]
}
online_menu_fs = {
	create = create_online_main_menu
	destroy = destroy_online_main_menu
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
		{
			action = select_quickmatch_player
			func = setup_searching
			flow_state = quickmatch_player_options_fs
		}
		{
			action = select_quickmatch_ranked
			func = setup_searching
			flow_state = quickmatch_ranked_options_fs
		}
		{
			action = select_custom_match
			flow_state = custom_match_fs
		}
		{
			action = select_create_match
			flow_state_func = select_create_match_transition
		}
		{
			action = select_leaderboards
			func = set_leaderboards_presence
			flow_state = online_leaderboard_groups_fs
		}
		{
			action = select_downloadable_content
			flow_state = online_downloadable_fs
		}
		{
			action = go_back
			flow_state = main_menu_fs
		}
	]
}

script select_create_match_transition 
	if isxenon
		return \{flow_state = create_match_select_match_type_fs}
	else
		return \{flow_state = create_match_select_game_mode_fs}
	endif
endscript
online_downloadable_fs = {
	create = create_download_scan_menu
	destroy = destroy_download_scan_menu
	actions = [
		{
			action = continue
			flow_state = online_menu_fs
		}
	]
}
quickmatch_player_options_fs = {
	create = create_online_quickmatch_prefs
	destroy = destroy_online_quickmatch_prefs
	actions = [
		{
			action = save
			flow_state = online_option_autosave_fs
		}
		{
			action = start_quickmatch
			flow_state = quickmatch_search_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
quickmatch_ranked_options_fs = {
	create = create_online_quickmatch_prefs
	destroy = destroy_online_quickmatch_prefs
	actions = [
		{
			action = save
			flow_state = online_option_autosave_fs
		}
		{
			action = start_quickmatch
			flow_state = quickmatch_search_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
online_option_autosave_fs = {
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = quickmatch_search_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = quickmatch_search_fs
		}
	]
}
online_play_song_fs = {
	create = create_net_play_song_menu
	destroy = destroy_net_play_song_menu
	actions = [
		{
			action = pause_game
			flow_state = online_pause_fs
		}
		{
			action = win_song
			func = kill_gem_scroller
			flow_state = online_win_song_fs
		}
		{
			action = fail_song
			func = kill_gem_scroller
			flow_state = online_fail_song_fs
		}
		{
			action = sudden_death_begin
			flow_state = online_loading_fs
		}
		{
			action = controller_disconnect
			flow_state = controller_disconnect_fs
		}
	]
}
online_win_song_fs = {
	create = create_newspaper_menu
	destroy = destroy_newspaper_menu
	actions = [
		{
			action = continue_to_next_song
			flow_state = online_loading_fs
		}
		{
			action = choose_tie_breaker_song
			flow_state = online_setlist_fs
		}
		{
			action = continue_to_net_stats
			flow_state = online_match_stats_fs
		}
	]
}
online_fail_song_fs = {
	create = create_newspaper_menu
	destroy = destroy_newspaper_menu
	actions = [
		{
			action = continue_to_next_song
			flow_state = online_loading_fs
		}
		{
			action = choose_tie_breaker_song
			flow_state = online_setlist_fs
		}
		{
			action = continue_to_net_stats
			flow_state = online_match_stats_fs
		}
	]
}
online_match_stats_fs = {
	create = create_net_detailed_stats_menu
	destroy = destroy_detailed_stats_menu
	actions = [
		{
			action = continue
			func = quit_network_game
			flow_state_func = check_if_ranked_game
		}
	]
}

script check_if_ranked_game 
	if isxenon
		if ($match_type = ranked)
			return \{flow_state = online_end_ranked_game_save_fs}
		endif
	else
		return \{flow_state = online_end_ranked_game_save_fs}
	endif
	return \{flow_state = online_menu_fs}
endscript
online_end_ranked_game_save_fs = {
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = online_menu_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = online_menu_fs
		}
	]
}
online_pause_fs = {
	create = create_pause_menu
	destroy = destroy_pause_menu
	actions = [
		{
			action = select_resume
			flow_state = online_play_song_fs
		}
		{
			action = select_quit
			func = select_quit_network_game
			flow_state_func = check_if_ranked_game
		}
	]
}
online_pause_options_fs = {
	create = create_pause_menu
	create_params = {
		for_options = 1
	}
	destroy = destroy_pause_menu
	actions = [
		{
			action = select_audio_settings
			flow_state = online_menu_fs
		}
		{
			action = select_calibrate_lag
			flow_state = quickplay_calibrate_lag_warning
		}
		{
			action = select_calibrate_whammy_bar
			flow_state = calibrate_whammy_bar_fs
		}
		{
			action = select_calibrate_star_power_trigger
			flow_state = calibrate_star_power_trigger_fs
		}
		{
			action = select_lefty_flip
			flow_state = quickplay_lefty_flip_warning
		}
		{
			action = go_back
			flow_state = quickplay_pause_fs
		}
	]
}
online_leaderboard_groups_fs = {
	create = create_leaderboard_groups_menu
	destroy = destroy_leaderboard_groups_menu
	actions = [
		{
			action = select_leaderboard_group
			flow_state = online_leaderboard_list_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
online_leaderboard_list_fs = {
	create = create_leaderboard_group_listing_menu
	destroy = destroy_leaderboard_group_listing_menu
	actions = [
		{
			action = select_leaderboard
			flow_state = view_leaderboard_fs
		}
		{
			action = go_back
			flow_state = online_leaderboard_groups_fs
		}
	]
}
view_leaderboard_fs = {
	create = create_leaderboard_menu
	destroy = destroy_leaderboard_menu
	actions = [
		{
			action = select_leaderboard
			flow_state = view_leaderboard_fs
		}
		{
			action = next_leaderboard
			flow_state = view_leaderboard_fs
		}
		{
			action = prev_leaderboard
			flow_state = view_leaderboard_fs
		}
		{
			action = pull_up_filter_dialog
			flow_state = leaderboard_filter_fs
		}
		{
			action = go_back
			flow_state = online_leaderboard_list_fs
		}
	]
}
leaderboard_filter_fs = {
	create = create_leaderboard_filter_dialog
	destroy = destroy_leaderboard_filter_dialog
	popup
	actions = [
		{
			action = submit_query
			flow_state = view_leaderboard_fs
		}
		{
			action = go_back
			flow_state = view_leaderboard_fs
		}
	]
}
quickmatch_search_fs = {
	create = create_online_server_list
	destroy = destroy_online_server_list
	actions = [
		{
			action = select_server
			flow_state = quick_match_joining_game_fs
		}
		{
			action = response_create_selected
			flow_state_func = select_create_match_transition
		}
		{
			action = response_cancel_selected
			flow_state = online_menu_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
quick_match_joining_game_fs = {
	create = create_join_server_menu
	destroy = destroy_join_server_menu
	actions = [
		{
			action = connection_lost
			flow_state = online_menu_fs
		}
		{
			action = join_server
			flow_state = online_character_select_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
		{
			action = response_create_selected
			flow_state_func = select_create_match_transition
		}
		{
			action = response_cancel_selected
			flow_state = online_menu_fs
		}
	]
}
invite_joining_game_fs = {
	create = create_join_server_menu
	destroy = destroy_join_server_menu
	actions = [
		{
			action = connection_lost
			flow_state = online_menu_fs
		}
		{
			action = join_server
			flow_state = online_character_select_fs
		}
		{
			action = join_failed
			flow_state = online_menu_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
custom_match_fs = {
	create = create_custom_create_menu
	destroy = destroy_custom_create_menu
	actions = [
		{
			action = select_done
			flow_state = online_server_list_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
online_server_list_fs = {
	create = create_online_server_list
	destroy = destroy_online_server_list
	actions = [
		{
			action = select_server
			flow_state = custom_match_joining_game_fs
		}
		{
			action = response_create_selected
			flow_state_func = select_create_match_transition
		}
		{
			action = response_cancel_selected
			flow_state = custom_match_fs
		}
		{
			action = go_back
			flow_state = custom_match_fs
		}
	]
}
custom_match_joining_game_fs = {
	create = create_join_server_menu
	destroy = destroy_join_server_menu
	actions = [
		{
			action = join_server
			flow_state = online_character_select_fs
		}
		{
			action = go_back
			flow_state = custom_match_fs
		}
		{
			action = connection_lost
			flow_state = online_menu_fs
		}
		{
			action = timeout
			flow_state = custom_match_fs
		}
	]
}

script setup_and_post_game 
	killspawnedscript \{name = coop_fail_song}
	set_character_hub_dirty
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	change \{structurename = player2_status
		character_id = axel}
	change \{structurename = player2_status
		outfit = 1}
	change \{structurename = player2_status
		style = 1}
	change \{structurename = player2_status
		instrument_id = instrument_les_paul_black}
	change \{character_select_highlighted_character_p2_dirty = 1}
	change \{current_num_players = 2}
	<rand> = 0
	getrandomvalue \{name = rand
		integer
		a = 0
		b = 1}
	get_number_of_songs
	if ((<rand> = 0) || ($game_mode = p2_coop) || (<num_songs> = 1))
		change \{tie_breaker = host}
	else
		change \{tie_breaker = client}
	endif
	if ishost
		resethubstates
	endif
	post_network_game
endscript

script transition_from_select_match_type 
	if (($match_type) = ranked)
		return \{flow_state = create_match_select_game_mode_fs}
	endif
	return \{flow_state = create_match_select_private_match_fs}
endscript

script transition_from_select_num_songs_back 
	if ($match_type = ranked)
		return \{flow_state = create_match_select_diff_fs}
	endif
	return \{flow_state = create_match_select_game_mode_fs}
endscript

script transition_from_select_game_mode_forward 
	if ($match_type = ranked)
		return \{flow_state = create_match_select_diff_fs}
	endif
	return \{flow_state = create_match_select_num_songs_fs}
endscript

script transition_from_select_game_mode_back 
	if isxenon
		if (($match_type) = ranked)
			return \{flow_state = create_match_select_match_type_fs}
		endif
		return \{flow_state = create_match_select_private_match_fs}
	else
		return \{flow_state = online_menu_fs}
	endif
endscript
create_match_select_match_type_fs = {
	create = create_mp_select_match_type_menu
	destroy = destroy_mp_select_match_type_menu
	actions = [
		{
			action = select_match_type
			flow_state_func = transition_from_select_match_type
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
create_match_select_private_match_fs = {
	create = create_select_private_match_menu
	destroy = destroy_select_private_match_menu
	actions = [
		{
			action = continue
			flow_state = create_match_select_game_mode_fs
		}
		{
			action = go_back
			flow_state = create_match_select_match_type_fs
		}
	]
}
create_match_select_game_mode_fs = {
	create = create_mp_select_mode_menu
	destroy = destroy_mp_select_mode_menu
	actions = [
		{
			action = select_game_mode
			flow_state_func = transition_from_select_game_mode_forward
		}
		{
			action = go_back
			flow_state_func = transition_from_select_game_mode_back
		}
	]
}
create_match_select_diff_fs = {
	create = create_select_difficulty_menu
	destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = continue
			flow_state = create_match_select_num_songs_fs
		}
		{
			action = go_back
			flow_state = create_match_select_game_mode_fs
		}
	]
}
create_match_select_num_songs_fs = {
	create = create_select_num_songs_menu
	destroy = destroy_select_num_songs_menu
	actions = [
		{
			action = continue
			flow_state = create_match_select_venue_fs
		}
		{
			action = go_back
			flow_state_func = transition_from_select_num_songs_back
		}
	]
}
create_match_select_venue_fs = {
	create = create_select_venue_menu
	destroy = destroy_select_venue_menu
	actions = [
		{
			action = continue
			transition_screen = default_joining_screen
			func = setup_and_post_game
			flow_state = online_character_select_fs
		}
		{
			action = go_back
			flow_state = create_match_select_num_songs_fs
		}
	]
}
default_joining_screen = {
	create = create_joining_screen
	destroy = destroy_joining_screen
}

script transition_from_char_hub 
	destroy_gamertags
	if ($match_type = ranked)
		return \{flow_state = online_setlist_fs}
	endif
	return \{flow_state = online_select_diff_fs}
endscript

script transition_from_instrument_select 
	if ($game_mode = p2_coop)
		start_network_game
		return \{flow_state = online_loading_fs}
	endif
	if ($match_type = ranked)
		return \{flow_state = online_setlist_fs}
	endif
	return \{flow_state = online_select_diff_fs}
endscript

script transition_back_from_instrument_select 
	if ($game_mode = p2_coop)
		return \{flow_state = online_setlist_fs}
	else
		set_character_hub_dirty
		flow_state = online_character_select_fs
	endif
endscript

script transition_from_select_diff_back 
	set_character_hub_dirty
	return \{flow_state = online_character_select_fs}
endscript

script transition_from_setlist_back 
	if ($match_type = ranked)
		return \{flow_state = online_character_select_fs}
	endif
	return \{flow_state = online_select_diff_fs}
endscript
online_character_select_fs = {
	create = create_character_select_menu
	destroy = destroy_character_select_menu
	actions = [
		{
			action = connection_lost
			flow_state = character_lobby_cleanup_fs
		}
		{
			action = continue
			flow_state = online_character_hub_fs
		}
		{
			action = go_back
			func = quit_network_game
			flow_state = online_menu_fs
		}
	]
}
online_character_hub_fs = {
	create = create_character_hub_menu
	destroy = destroy_character_hub_menu
	actions = [
		{
			action = connection_lost
			flow_state = character_lobby_cleanup_fs
		}
		{
			action = select_ready
			flow_state_func = transition_from_char_hub
		}
		{
			action = select_change_outfit
			flow_state = online_select_outfit_fs
		}
		{
			action = select_change_guitar
			flow_state = online_select_guitar_fs
		}
		{
			action = select_change_bass
			flow_state = online_select_bass_fs
		}
		{
			action = go_back
			flow_state = online_character_select_fs
		}
		{
			action = handle_dropped_client
			flow_state = online_character_select_fs
		}
	]
}
online_select_outfit_fs = {
	create = create_select_outfit_menu
	destroy = destroy_select_outfit_menu
	actions = [
		{
			action = connection_lost
			flow_state = character_lobby_cleanup_fs
		}
		{
			action = select_character_hub
			flow_state = online_character_hub_fs
		}
		{
			action = select_select_style
			flow_state = online_select_style_fs
		}
		{
			action = go_back
			flow_state = online_character_hub_fs
		}
		{
			action = handle_dropped_client
			flow_state = online_character_select_fs
		}
	]
}
online_select_style_fs = {
	create = create_select_style_menu
	destroy = destroy_select_style_menu
	actions = [
		{
			action = connection_lost
			flow_state = character_lobby_cleanup_fs
		}
		{
			action = select_character_hub
			flow_state = online_character_hub_fs
		}
		{
			action = select_select_outfit
			flow_state = online_select_outfit_fs
		}
		{
			action = go_back
			flow_state = online_select_outfit_fs
		}
		{
			action = handle_dropped_client
			flow_state = online_character_select_fs
		}
	]
}
online_select_guitar_fs = {
	create = create_select_guitar_menu
	destroy = destroy_select_guitar_menu
	actions = [
		{
			action = connection_lost
			flow_state = character_lobby_cleanup_fs
		}
		{
			action = select_character_hub
			flow_state = online_character_hub_fs
		}
		{
			action = continue
			flow_state = online_character_hub_fs
		}
		{
			action = select_guitar_finish
			flow_state = online_select_guitar_finish_fs
		}
		{
			action = go_back
			flow_state = online_character_hub_fs
		}
		{
			action = handle_dropped_client
			flow_state = online_character_select_fs
		}
	]
}
online_select_guitar_finish_fs = {
	create = create_select_guitar_finish_menu
	destroy = destroy_select_guitar_finish_menu
	actions = [
		{
			action = connection_lost
			flow_state = character_lobby_cleanup_fs
		}
		{
			action = continue
			flow_state = online_select_guitar_fs
		}
		{
			action = select_character_hub
			flow_state = online_character_hub_fs
		}
		{
			action = go_back
			flow_state = online_select_guitar_fs
		}
		{
			action = handle_dropped_client
			flow_state = online_character_select_fs
		}
	]
}
online_select_bass_fs = {
	create = create_select_bass_menu
	destroy = destroy_select_guitar_menu
	actions = [
		{
			action = connection_lost
			flow_state = online_menu_fs
		}
		{
			action = select_character_hub
			flow_state = online_character_hub_fs
		}
		{
			action = continue
			flow_state = online_character_hub_fs
		}
		{
			action = select_guitar_finish
			flow_state = online_select_guitar_finish_fs
		}
		{
			action = go_back
			flow_state = online_character_hub_fs
		}
		{
			action = handle_dropped_client
			flow_state = online_character_select_fs
		}
	]
}
online_coop_choose_part_fs = {
	create = net_create_choose_part_menu
	destroy = destroy_choose_part_menu
	actions = [
		{
			action = connection_lost
			flow_state = online_menu_fs
		}
		{
			action = continue
			flow_state_func = transition_from_instrument_select
		}
		{
			action = go_back
			flow_state_func = transition_back_from_instrument_select
		}
		{
			action = handle_dropped_client
			func = set_character_hub_dirty
			flow_state = online_character_select_fs
		}
	]
}
online_select_diff_fs = {
	create = net_create_select_difficulty_menu
	destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = connection_lost
			flow_state = online_menu_fs
		}
		{
			action = continue
			flow_state = online_setlist_fs
		}
		{
			action = handle_dropped_client
			func = set_character_hub_dirty
			flow_state = online_character_select_fs
		}
		{
			action = go_back
			flow_state_func = transition_from_select_diff_back
		}
	]
}
online_setlist_fs = {
	create = create_setlist_menu
	destroy = destroy_setlist_menu
	actions = [
		{
			action = connection_lost
			flow_state = online_menu_fs
		}
		{
			action = continue
			flow_state_func = setlist_continue_func
		}
		{
			action = continue_to_final_song
			func = start_final_song
			flow_state = online_loading_fs
		}
		{
			action = go_back
			flow_state_func = transition_from_setlist_back
		}
		{
			action = handle_dropped_client
			flow_state_func = setlist_client_dropped
		}
	]
}

script setlist_continue_func 
	if ($game_mode = p2_coop)
		return \{flow_state = online_coop_choose_part_fs}
	else
		start_network_game
		return \{flow_state = online_loading_fs}
	endif
endscript

script setlist_client_dropped 
	if ($g_tie_breaker_song = 1)
		return \{flow_state = online_menu_fs}
	else
		return \{flow_state = online_character_select_fs
			func = set_character_hub_dirty}
	endif
endscript
online_loading_fs = {
	create = online_loading_special_script
	destroy = destroy_loading_screen
	actions = [
		{
			action = net_begin_song
			flow_state = online_play_song_fs
		}
		{
			action = connection_lost
			func = kill_gem_scroller
			flow_state = online_menu_fs
		}
	]
}
character_lobby_cleanup_fs = {
	create = cleanup_online_lobby_select
	destroy = empty_script
	actions = [
		{
			action = continue
			flow_state = online_menu_fs
		}
	]
}

script online_loading_special_script 
	if ($game_mode = p2_coop)
		swap_coop_instruments_if_necessary
	endif
	create_loading_screen
endscript

script swap_coop_instruments_if_necessary 
	get_song_rhythm_track song = ($current_song)
	if ($player1_status.part = rhythm)
		if find_profile_by_id id = ($player1_status.character_id)
			get_musician_profile_struct index = <index>
			formattext checksumname = characterguitartags_p1 'character_%c_player_1_guitar_tags' c = (<profile_struct>.name)
			if getglobaltags <characterguitartags_p1> noassert = 1
				<p1_guitar> = <current_selected_guitar>
				<p1_bass> = <current_selected_bass>
				change player1_selected_guitar = <p1_guitar>
				change player1_selected_bass = <p1_bass>
			endif
			if (<rhythm_track> = 1)
				setglobaltags <characterguitartags_p1> params = {current_instrument = guitar}
				change structurename = player1_status instrument_id = <p1_guitar>
			else
				setglobaltags <characterguitartags_p1> params = {current_instrument = bass}
				change structurename = player1_status instrument_id = <p1_bass>
			endif
		endif
	elseif ($player2_status.part = rhythm)
		if find_profile_by_id id = ($player2_status.character_id)
			get_musician_profile_struct index = <index>
			<p2_guitar> = ($player2_selected_guitar)
			<p2_bass> = ($player2_selected_bass)
			formattext checksumname = characterguitartags_p2 'character_%c_player_2_guitar_tags' c = (<profile_struct>.name)
			if (<rhythm_track> = 1)
				setglobaltags <characterguitartags_p2> params = {current_instrument = guitar}
				change structurename = player2_status instrument_id = <p2_guitar>
			else
				setglobaltags <characterguitartags_p2> params = {current_instrument = bass}
				change structurename = player2_status instrument_id = <p2_bass>
			endif
		endif
	endif
endscript
