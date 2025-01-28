quickplay_select_difficulty_fs = {
	Create = create_select_difficulty_menu
	Destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = Continue
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
	Create = create_setlist_menu
	Destroy = destroy_setlist_menu
	actions = [
		{
			action = Continue
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
	Create = create_play_song_menu
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
	Create = create_pause_menu
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
	Create = create_pause_menu
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
	Create = create_restart_warning_menu
	Destroy = destroy_restart_warning_menu
	actions = [
		{
			action = Continue
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
	Create = create_controller_settings_menu
	create_params = {
		Popup = 1
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
	Create = create_practice_warning_menu
	Destroy = destroy_practice_warning_menu
	actions = [
		{
			action = Continue
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
	Change \{came_to_practice_from = QUICKPLAY}
	Change came_to_practice_difficulty = ($current_difficulty)
	kill_gem_scroller
	Change \{game_mode = training}
endscript
quickplay_audio_settings_fs = {
	Create = create_audio_settings_menu
	create_params = {
		Popup = 1
	}
	Destroy = destroy_audio_settings_menu
	actions = [
		{
			action = Continue
			flow_state = quickplay_pause_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
quickplay_video_settings_fs = {
	Create = create_video_settings_menu
	create_params = {
		Popup = 1
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
	Create = create_lefty_flip_warning_menu
	Destroy = destroy_lefty_flip_warning_menu
	actions = [
		{
			action = Continue
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
	Create = create_calibrate_lag_warning_menu
	Destroy = destroy_calibrate_lag_warning_menu
	actions = [
		{
			action = Continue
			flow_state = quickplay_calibrate_lag_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
quickplay_calibrateautosave_fs = {
	Create = memcard_sequence_begin_autosave
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
	Create = create_calibrate_lag_menu
	Destroy = destroy_calibrate_lag_menu
	actions = [
		{
			action = Continue
			flow_state = quickplay_calibrateautosave_fs
		}
		{
			action = go_back
			func = career_restart_song
			flow_state = quickplay_play_song_fs
		}
	]
}
quickplay_fail_song_fs = {
	Create = create_fail_song_menu
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
	Create = create_song_ended_menu
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
	Create = create_quit_warning_menu
	Destroy = destroy_quit_warning_menu
	actions = [
		{
			action = Continue
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
	Create = create_newspaper_menu
	Destroy = destroy_newspaper_menu
	actions = [
		{
			action = Continue
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
			flow_state = quickplay_detailed_stats_fs
		}
		{
			action = quit
			flow_state = main_menu_fs
		}
	]
}
quickplay_tryagainautosave_fs = {
	Create = memcard_sequence_begin_autosave
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
	Create = create_detailed_stats_menu
	Destroy = destroy_detailed_stats_menu
	actions = [
		{
			action = go_back
			flow_state = quickplay_win_song_fs
		}
		{
			action = Continue
			flow_state = quickplay_toprockers_fs
		}
	]
}
quickplay_toprockers_fs = {
	Create = create_top_rockers_menu
	Destroy = destroy_top_rockers_menu
	actions = [
		{
			action = Continue
			flow_state = quickplay_autosave_fs
		}
	]
}
quickplay_autosave_fs = {
	Create = memcard_sequence_begin_autosave
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
	Printf \{"get_total_num_venues"}
	array_entry = 0
	begin
	if NOT get_valid_venue_index venue_index = <array_entry>
		break
	endif
	get_LevelZoneArray_checksum Index = <Index>
	Printf ($LevelZones.<level_checksum>.Name)
	<array_entry> = (<array_entry> + 1)
	repeat
	return num_venues = <array_entry>
endscript

script get_valid_venue_index 
	get_LevelZoneArray_size
	Index = 0
	begin
	get_LevelZoneArray_checksum Index = <Index>
	valid = 1
	FormatText ChecksumName = venue_checksum 'venue_%s' S = ($LevelZones.<level_checksum>.Name)
	GetGlobalTags <venue_checksum>
	if NOT (<unlocked> = 1)
		valid = 0
	endif
	if (<valid> = 1)
		if (<venue_index> = 0)
			return Index = <Index> TRUE
		endif
		venue_index = (<venue_index> - 1)
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script quickplay_start_song \{device_num = 0}
	Printf \{"quickplay_start_song"}
	get_progression_globals game_mode = ($game_mode)
	SongList = <tier_global>
	cs_get_total_guitarists
	GetRandomValue A = 0 B = (<num_guitarists> -1) Name = random_guitarist_index Integer
	get_valid_character_index char_index = <random_guitarist_index> Player = 1
	get_musician_profile_struct Index = <Index>
	FormatText ChecksumName = character_id '%s' S = (<profile_struct>.Name)
	Change StructureName = player1_status character_id = <character_id>
	Change \{StructureName = player1_status
		style = 1}
	Change \{StructureName = player1_status
		outfit = 1}
	guitar_array = ($Bonus_Guitars)
	GetArraySize ($Secret_Guitars)
	Index = 0
	begin
	guitar_id = ($Secret_Guitars [<Index>].Id)
	GetGlobalTags <guitar_id>
	if (<unlocked_for_purchase> = 1)
		AddArrayElement Array = (<guitar_array>) Element = ($Secret_Guitars [<Index>])
		<guitar_array> = (<Array>)
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	GetArraySize <guitar_array>
	GetRandomValue A = 0 B = (<array_Size> -1) Name = random_guitar_index Integer
	get_musician_instrument_struct Index = <random_guitar_index>
	Change StructureName = player1_status instrument_id = (<info_struct>.desc_id)
	get_total_num_venues
	GetRandomValue A = 0 B = (<num_venues> -1) Name = random_venue_index Integer
	get_valid_venue_index venue_index = <random_venue_index>
	get_LevelZoneArray_checksum Index = <Index>
	Change current_level = <level_checksum>
	PrintStruct X = <...>
	Printf "Random Guitarist index is %g. Random venue index is %v" G = <random_guitarist_index> V = <random_tier_index>
	start_song device_num = <device_num>
endscript
