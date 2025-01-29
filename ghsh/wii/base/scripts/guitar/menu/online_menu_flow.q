net_matchmaking_fs = {
	create = create_net_matchmaking_menu
	Destroy = destroy_net_matchmaking_menu
	actions = [
		{
			action = start_match_makings
			flow_state = net_matchmaking_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
			transition_left
		}
	]
}
net_achievement_tracker_fs = {
	create = create_achievement_tracker_ui
	Destroy = destroy_achievement_tracker_ui
	actions = [
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
online_signin_fs = {
	create = create_online_signin_splash
	Destroy = destroy_online_signin_splash
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
	Destroy = destroy_online_signin_warning_menu
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
	]
}
online_menu_fs = {
	create = create_online_main_menu
	Destroy = destroy_online_main_menu
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
		{
			action = select_quickmatch_player
			flow_state = quickmatch_search_fs
		}
		{
			action = select_quickmatch_ranked
			flow_state = quickmatch_search_fs
		}
		{
			action = select_custom_match
			func = set_rich_presence_searching
			flow_state = custom_match_fs
		}
		{
			action = select_create_match
			flow_state = create_match_select_private_match_fs
		}
		{
			action = select_online_options
			flow_state = online_options_fs
		}
		{
			action = select_leaderboards
			flow_state = online_leaderboard_groups_fs
		}
		{
			action = select_downloadable_content
			flow_state = online_downloadable_fs
		}
		{
			action = select_matchmaking
			flow_state = net_matchmaking_fs
			transition_right
		}
		{
			action = select_at
			flow_state = net_achievement_tracker_fs
		}
		{
			action = go_back
			flow_state = main_menu_fs
		}
		{
			action = 0x81029e0b
			flow_state = quick_match_joining_game_fs
		}
		{
			action = friend_list
			flow_state = 0xb27d2ca9
		}
		{
			action = 0x29f0bbbd
			func = 0x18666843
			flow_state = main_menu_fs
		}
	]
}

script select_create_match_transition 
	if isXenon
		return \{flow_state = create_match_select_match_type_fs}
	else
		return \{flow_state = create_match_select_game_mode_fs}
	endif
endscript
online_options_fs = {
	create = create_online_options_menu
	Destroy = destroy_online_options_menu
	actions = [
		{
			action = select_quickmatch_pref
			func = save_intial_option_values
			flow_state = online_options_quickmatch_fs
		}
		{
			action = select_player_pref
			func = save_intial_option_values
			flow_state = online_options_player_prefs_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
online_option_changed_dialog_fs = {
	create = create_online_options_changed_dialog
	Destroy = destroy_online_options_changed_dialog
	popup
	actions = [
		{
			action = dialog_response_selected_save
			flow_state = online_option_autosave_fs
		}
		{
			action = dialog_response_selected_dont_save
			flow_state = online_options_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
online_option_autosave_fs = {
	create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = online_options_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = online_options_fs
		}
	]
}
online_options_quickmatch_fs = {
	create = create_online_quickmatch_prefs
	Destroy = destroy_online_quickmatch_prefs
	actions = [
		{
			action = save_dialog
			flow_state = online_option_changed_dialog_fs
		}
		{
			action = dialog_response_selected_save
			flow_state = online_option_autosave_fs
		}
		{
			action = dialog_response_selected_dont_save
			flow_state = online_menu_fs
		}
		{
			action = go_back
			flow_state = online_options_fs
		}
	]
}
online_options_player_prefs_fs = {
	create = create_online_player_prefs
	Destroy = destroy_online_player_prefs
	actions = [
		{
			action = save_dialog
			flow_state = online_option_changed_dialog_fs
		}
		{
			action = go_back
			flow_state = online_options_fs
		}
	]
}
online_play_song_fs = {
	create = create_net_play_song_menu
	Destroy = destroy_net_play_song_menu
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
			action = do_or_die_begin
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
	Destroy = destroy_newspaper_menu
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
	Destroy = destroy_newspaper_menu
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
	Destroy = destroy_detailed_stats_menu
	actions = [
		{
			action = continue
			func = quit_network_game
			flow_state_func = check_if_ranked_game
		}
	]
}

script check_if_ranked_game 
	if isXenon
		if ($match_type = Ranked)
			return \{flow_state = online_end_ranked_game_save_fs}
		endif
	else
		return \{flow_state = online_end_ranked_game_save_fs}
	endif
	return \{flow_state = online_menu_fs}
endscript
online_end_ranked_game_save_fs = {
	create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
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
	Destroy = destroy_pause_menu
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
	Destroy = destroy_pause_menu
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
	Destroy = destroy_leaderboard_groups_menu
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
	Destroy = destroy_leaderboard_group_listing_menu
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
	Destroy = destroy_leaderboard_menu
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
	Destroy = destroy_leaderboard_filter_dialog
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
	Destroy = destroy_online_server_list
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
	Destroy = destroy_join_server_menu
	actions = [
		{
			action = connection_lost
			flow_state = online_menu_fs
			func = 0xf643c6a5
		}
		{
			action = join_server
			flow_state = net_debug_lobby_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
			func = 0xf643c6a5
		}
	]
}
invite_joining_game_fs = {
	create = create_join_server_menu
	Destroy = destroy_join_server_menu
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
	Destroy = destroy_custom_create_menu
	actions = [
		{
			action = select_done
			flow_state = quick_match_joining_game_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
online_server_list_fs = {
	create = create_online_server_list
	Destroy = destroy_online_server_list
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
	Destroy = destroy_join_server_menu
	actions = [
		{
			action = join_server
			flow_state = net_debug_lobby_fs
		}
		{
			action = go_back
			flow_state = custom_match_fs
			func = 0xf643c6a5
		}
		{
			action = connection_lost
			flow_state = online_menu_fs
			func = 0xf643c6a5
		}
		{
			action = timeout
			flow_state = custom_match_fs
			func = 0xf643c6a5
		}
	]
}
0x4f4c6715 = {
	create = create_custom_create_menu
	Destroy = destroy_custom_create_menu
	actions = [
		{
			action = select_done
			flow_state_func = 0x0e3f6f80
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}

script transition_from_select_match_type 
	if (($match_type) = Ranked)
		return \{flow_state = create_match_select_game_mode_fs}
	endif
	return \{flow_state = create_match_select_private_match_fs}
endscript

script transition_from_select_num_songs_back 
	return \{flow_state = create_match_select_game_mode_fs}
endscript

script transition_from_select_game_mode_forward 
	return \{flow_state = create_match_select_num_songs_fs}
endscript

script transition_from_select_game_mode_back 
	if isXenon
		if (($match_type) = Ranked)
			return \{flow_state = create_match_select_match_type_fs}
		endif
		return \{flow_state = create_match_select_private_match_fs}
	else
		return \{flow_state = online_menu_fs}
	endif
endscript

script 0x0e3f6f80 
	setup_and_post_game
	return \{flow_state = online_character_select_fs}
endscript
create_match_select_match_type_fs = {
	create = create_mp_select_match_type_menu
	Destroy = destroy_mp_select_match_type_menu
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
	Destroy = destroy_select_private_match_menu
	actions = [
		{
			action = continue
			flow_state = create_match_select_game_mode_fs
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
	]
}
create_match_select_game_mode_fs = {
	create = create_mp_select_mode_menu
	Destroy = destroy_mp_select_mode_menu
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
	Destroy = destroy_select_difficulty_menu
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
	Destroy = destroy_select_num_songs_menu
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
	Destroy = destroy_select_venue_menu
	actions = [
		{
			action = 0x8704110d
			transition_screen = default_joining_screen
			func = setup_and_post_game
			flow_state = net_debug_lobby_fs
		}
		{
			action = continue
			flow_state_func = 0xdc7903f0
		}
		{
			action = go_back
			flow_state = create_match_select_num_songs_fs
		}
	]
}
net_debug_lobby_fs = {
	create = debug_new_ui_start
	Destroy = empty_script
	actions = [
	]
}

script debug_new_ui_start 
	Change \{current_level = load_z_amazon}
	if IsHost
		mode = HOST
	else
		mode = CLIENT
	endif
	ui_event event = menu_replace data = {state = uistate_net_debug_lobby mode = <mode>}
endscript

script temp_join_server 
	ui_flow_manager_respond_to_action \{action = join_server}
endscript
default_joining_screen = {
	create = create_joining_screen
	Destroy = destroy_joining_screen
}

script 0x13942363 
	Change \{0x2a11eea8 = 1}
endscript

script 0xdc7903f0 
	if ($0x41d5263e = friends)
		0x13942363
		return \{flow_state = 0xb27d2ca9}
	else
		setup_and_post_game
		return \{flow_state = online_character_select_fs}
	endif
endscript

script transition_from_char_hub 
	destroy_gamertags
	if (($game_mode) = p2_coop)
		return \{flow_state = online_coop_choose_part_fs}
	endif
	return \{flow_state = online_setlist_fs}
endscript

script transition_from_select_diff_back 
	if (($game_mode) = p2_coop)
		return \{flow_state = online_coop_choose_part_fs}
	endif
	return \{flow_state = online_character_select_fs}
endscript

script transition_from_setlist_back 
	return \{flow_state = online_select_diff_fs}
endscript
online_character_select_fs = {
	create = create_character_select_menu
	Destroy = destroy_character_select_menu
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
		{
			action = handle_dropped_client
			flow_state_func = 0xd27e3dd5
		}
	]
}
online_character_hub_fs = {
	create = create_character_hub_menu
	Destroy = destroy_character_hub_menu
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
			flow_state_func = 0xd27e3dd5
		}
	]
}
online_select_outfit_fs = {
	create = create_select_outfit_menu
	Destroy = destroy_select_outfit_menu
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
			func = set_character_hub_dirty
			flow_state_func = 0xd27e3dd5
		}
	]
}
online_select_style_fs = {
	create = create_select_style_menu
	Destroy = destroy_select_style_menu
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
			func = set_character_hub_dirty
			flow_state_func = 0xd27e3dd5
		}
	]
}
online_select_guitar_fs = {
	create = create_select_guitar_menu
	Destroy = destroy_select_guitar_menu
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
			func = set_character_hub_dirty
			flow_state_func = 0xd27e3dd5
		}
	]
}
online_select_guitar_finish_fs = {
	create = create_select_guitar_finish_menu
	Destroy = destroy_select_guitar_finish_menu
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
			func = set_character_hub_dirty
			flow_state_func = 0xd27e3dd5
		}
	]
}
online_select_bass_fs = {
	create = create_select_bass_menu
	Destroy = destroy_select_guitar_menu
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
			func = set_character_hub_dirty
			flow_state_func = 0xd27e3dd5
		}
	]
}
online_coop_choose_part_fs = {
	create = net_create_choose_part_menu
	Destroy = destroy_choose_part_menu
	actions = [
		{
			action = connection_lost
			flow_state = online_menu_fs
		}
		{
			action = continue
			flow_state = online_select_diff_fs
		}
		{
			action = go_back
			flow_state = online_character_select_fs
		}
		{
			action = handle_dropped_client
			flow_state_func = 0xd27e3dd5
		}
	]
}
online_select_diff_fs = {
	create = net_create_select_difficulty_menu
	Destroy = destroy_select_difficulty_menu
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
			flow_state_func = 0xd27e3dd5
		}
		{
			action = go_back
			flow_state_func = transition_from_select_diff_back
		}
	]
}
online_setlist_fs = {
	create = create_setlist_menu
	Destroy = destroy_setlist_menu
	actions = [
		{
			action = connection_lost
			flow_state = online_menu_fs
		}
		{
			action = continue
			func = start_network_game
			flow_state = online_loading_fs
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
0x68d05d65 = 0

script 0xa80ed8c0 
	return \{0xad7ce6b0 = $0x68d05d65}
endscript

script setlist_continue_func 
	if ($game_mode = p2_coop)
		return \{flow_state = online_coop_choose_part_fs}
	else
		start_network_game
		return \{flow_state = online_loading_fs}
	endif
endscript

script setlist_client_dropped 
	if ($0x41d5263e = friends)
		quit_network_game
		return \{flow_state = online_menu_fs}
	elseif NOT ($0x68d05d65 = 1)
		quit_network_game
		return \{flow_state = online_menu_fs}
	else
		return \{flow_state = online_character_select_fs}
	endif
endscript
online_loading_fs = {
	create = create_loading_screen
	Destroy = destroy_loading_screen
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
	Destroy = empty_script
	actions = [
		{
			action = continue
			flow_state = online_menu_fs
		}
	]
}

script 0xd27e3dd5 
	if ($0x41d5263e = friends)
		quit_network_game
		return \{flow_state = online_menu_fs}
	else
		set_character_hub_dirty
		character_hub_net_ready_back
		return \{flow_state = online_character_select_fs}
	endif
endscript
