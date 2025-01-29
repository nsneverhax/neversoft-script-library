quickplay_select_difficulty_fs = {
	create = create_select_difficulty_menu
	Destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = continue
			flow_state = quickplay_setlist_fs
			transition_right
		}
		{
			action = go_back
			flow_state = main_menu_fs
			transition_left
		}
	]
}
quickplay_setlist_fs = {
	create = create_setlist_menu
	Destroy = destroy_setlist_menu
	actions = [
		{
			action = continue
			func = quickplay_start_song
			transition_screen = default_loading_screen
			flow_state = quickplay_play_song_fs
		}
		{
			action = go_back
			flow_state = quickplay_select_difficulty_fs
			transition_left
		}
	]
}
quickplay_play_song_fs = {
	create = create_play_song_menu
	Destroy = destroy_play_song_menu
	actions = [
		{
			action = pause_game
			flow_state = quickplay_pause_fs
		}
		{
			action = win_song
			func = kill_gem_scroller
			flow_state = quickplay_win_song_fs
		}
		{
			action = fail_song
			flow_state = quickplay_fail_song_fs
		}
		{
			action = controller_disconnect
			flow_state = controller_disconnect_fs
		}
	]
}
quickplay_pause_fs = {
	create = create_pause_menu
	Destroy = destroy_pause_menu
	actions = [
		{
			action = select_resume
			flow_state = quickplay_play_song_fs
		}
		{
			action = select_restart
			flow_state = quickplay_restart_warning_fs
		}
		{
			action = select_practice
			flow_state = quickplay_practice_warning_fs
		}
		{
			action = select_options
			flow_state = quickplay_pause_options_fs
		}
		{
			action = select_quit
			flow_state = quickplay_quit_warning_fs
		}
		{
			action = select_debug_menu
			flow_state = debug_menu_fs
		}
	]
}
quickplay_pause_options_fs = {
	create = create_pause_menu
	create_params = {
		for_options = 1
	}
	Destroy = destroy_pause_menu
	actions = [
		{
			action = select_audio_settings
			flow_state = quickplay_audio_settings_fs
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
quickplay_restart_warning_fs = {
	create = create_restart_warning_menu
	Destroy = destroy_restart_warning_menu
	actions = [
		{
			action = continue
			func = career_restart_song
			transition_screen = default_loading_screen
			flow_state = quickplay_play_song_fs
		}
		{
			action = go_back
			flow_state = quickplay_pause_fs
		}
	]
}
quickplay_controller_settings_fs = {
	create = create_controller_settings_menu
	create_params = {
		popup = 1
	}
	Destroy = destroy_controller_settings_menu
	actions = [
		{
			action = select_lefty_flip
			flow_state = quickplay_lefty_flip_warning
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
			action = go_back
			flow_state = quickplay_pause_fs
		}
	]
}
quickplay_practice_warning_fs = {
	create = create_practice_warning_menu
	Destroy = destroy_practice_warning_menu
	actions = [
		{
			action = continue
			func = quickplay_go_to_practice_setup
			flow_state = practice_select_song_section_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}

script quickplay_go_to_practice_setup 
	Change \{came_to_practice_from = quickplay}
	Change came_to_practice_difficulty = ($current_difficulty)
	kill_gem_scroller
	Change \{game_mode = training}
endscript
quickplay_audio_settings_fs = {
	create = create_audio_settings_menu
	create_params = {
		popup = 1
	}
	Destroy = destroy_audio_settings_menu
	actions = [
		{
			action = continue
			flow_state = quickplay_pause_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
quickplay_video_settings_fs = {
	create = create_video_settings_menu
	create_params = {
		popup = 1
	}
	Destroy = destroy_video_settings_menu
	actions = [
		{
			action = select_calibrate_lag
			flow_state = quickplay_calibrate_lag_warning
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
quickplay_lefty_flip_warning = {
	create = create_lefty_flip_warning_menu
	Destroy = destroy_lefty_flip_warning_menu
	actions = [
		{
			action = continue
			func = lefty_flip_func
			flow_state = quickplay_play_song_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
quickplay_calibrate_lag_warning = {
	create = create_calibrate_lag_warning_menu
	Destroy = destroy_calibrate_lag_warning_menu
	actions = [
		{
			action = continue
			flow_state = quickplay_calibrate_lag_fs
			func = setup_calibration_lag_none
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
quickplay_calibrateautosave_fs = {
	create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			func = career_restart_song
			flow_state = quickplay_play_song_fs
		}
		{
			action = memcard_sequence_save_failed
			func = career_restart_song
			flow_state = quickplay_play_song_fs
		}
	]
}
quickplay_calibrate_lag_fs = {
	create = create_calibrate_lag_menu
	Destroy = destroy_calibrate_lag_menu
	actions = [
		{
			action = continue
			flow_state = quickplay_calibrateautosave_fs
		}
		{
			action = go_back
			func = career_restart_song
			flow_state = quickplay_play_song_fs
		}
		{
			action = show_dialog_1
			flow_state = options_calibrate_lag_dialog_1_fs
			func = setup_calibration_lag_dialog_1
		}
		{
			action = show_dialog_2
			flow_state = options_calibrate_lag_dialog_2_fs
			func = setup_calibration_lag_dialog_2
		}
	]
}
quickplay_fail_song_fs = {
	create = create_fail_song_menu
	Destroy = destroy_fail_song_menu
	actions = [
		{
			action = select_practice
			flow_state = quickplay_fail_song_fs
		}
		{
			action = select_retry
			flow_state = quickplay_play_song_fs
		}
		{
			action = select_new_song
			func = kill_gem_scroller
			flow_state = quickplay_setlist_fs
		}
		{
			action = select_quit
			func = quickplay_song_select_quit
			flow_state = main_menu_fs
		}
	]
}

script quickplay_song_select_quit 
	GH3_SFX_fail_song_stop_sounds
	kill_gem_scroller
endscript
quickplay_song_ended_fs = {
	create = create_song_ended_menu
	Destroy = destroy_song_ended_menu
	actions = [
		{
			action = select_retry
			flow_state = quickplay_play_song_fs
		}
		{
			action = select_new_song
			func = kill_gem_scroller
			flow_state = quickplay_setlist_fs
		}
		{
			action = select_quit
			func = kill_gem_scroller
			flow_state = main_menu_fs
		}
	]
}
quickplay_quit_warning_fs = {
	create = create_quit_warning_menu
	Destroy = destroy_quit_warning_menu
	actions = [
		{
			action = continue
			func = xenon_singleplayer_session_complete_uninit
			spawned_func
			flow_state = quickplay_song_ended_fs
		}
		{
			action = go_back
			flow_state = quickplay_pause_fs
		}
	]
}
quickplay_win_song_fs = {
	create = create_newspaper_menu
	Destroy = destroy_newspaper_menu
	actions = [
		{
			action = continue
			flow_state = quickplay_toprockers_fs
		}
		{
			action = try_again
			func = start_song
			transition_screen = default_loading_screen
			flow_state = quickplay_play_song_fs
		}
		{
			action = save_and_try_again
			flow_state = quickplay_tryagainautosave_fs
		}
		{
			action = select_detailed_stats
			func = set_quickplay_newspaper_not_first_time
			flow_state = quickplay_detailed_stats_fs
		}
		{
			action = quit
			flow_state = main_menu_fs
		}
	]
}

script set_quickplay_newspaper_not_first_time 
	Change \{g_quickplay_newspaper_first_time = 0}
endscript
quickplay_tryagainautosave_fs = {
	create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			func = start_song
			transition_screen = default_loading_screen
			flow_state = quickplay_play_song_fs
		}
		{
			action = memcard_sequence_save_failed
			func = start_song
			transition_screen = default_loading_screen
			flow_state = quickplay_play_song_fs
		}
	]
}
quickplay_detailed_stats_fs = {
	create = create_detailed_stats_menu
	Destroy = destroy_detailed_stats_menu
	actions = [
		{
			action = go_back
			flow_state = quickplay_win_song_fs
		}
		{
			action = continue
			flow_state = quickplay_toprockers_fs
		}
	]
}
quickplay_toprockers_fs = {
	create = create_top_rockers_menu
	Destroy = destroy_top_rockers_menu
	actions = [
		{
			action = continue
			flow_state = quickplay_autosave_fs
		}
	]
}
quickplay_autosave_fs = {
	create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = quickplay_setlist_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = quickplay_setlist_fs
		}
	]
}

script get_total_num_venues 

	array_entry = 0
	begin
	if NOT get_valid_venue_index venue_index = <array_entry>
		break
	endif
	get_LevelZoneArray_checksum index = <index>

	<array_entry> = (<array_entry> + 1)
	repeat
	return num_venues = <array_entry>
endscript

script get_valid_venue_index 
	get_LevelZoneArray_size
	index = 0
	begin
	get_LevelZoneArray_checksum index = <index>
	valid = 1
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
	GetGlobalTags <venue_checksum>
	if NOT (<unlocked> = 1)
		valid = 0
	endif
	if (<valid> = 1)
		if (<venue_index> = 0)
			return index = <index> true
		endif
		venue_index = (<venue_index> - 1)
	endif
	index = (<index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script quickplay_start_song \{device_num = 0}

	get_progression_globals game_mode = ($game_mode)
	SongList = <tier_global>
	get_random_available_character
	Change structurename = player1_status character_id = <character_id>
	get_random_aero_outfit character_id = <character_id> character_name = <character_name>
	Change structurename = player1_status outfit = <random_outfit>
	Change structurename = player1_status style = <random_style>
	get_random_available_guitar_id
	Change structurename = player1_status instrument_id = <instrument_id>
	get_total_num_venues
	GetRandomValue a = 0 b = (<num_venues> -1) Name = random_venue_index integer
	get_valid_venue_index venue_index = <random_venue_index>
	get_LevelZoneArray_checksum index = <index>
	Change current_level = <level_checksum>

	start_song device_num = <device_num>
endscript
