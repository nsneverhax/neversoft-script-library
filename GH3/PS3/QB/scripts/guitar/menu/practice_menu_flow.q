came_to_practice_from = main_menu
came_to_practice_difficulty = EASY
came_to_practice_difficulty2 = EASY
practice_select_mode_fs = {
	Create = create_select_practice_mode_menu
	Destroy = destroy_select_practice_mode_menu
	actions = [
		{
			action = select_practice
			flow_state = practice_setlist_fs
			transition_right
		}
		{
			action = select_tutorial
			flow_state = practice_tutorial_select_fs
			transition_right
		}
		{
			action = go_back
			flow_state = main_menu_fs
			transition_left
		}
	]
}
practice_setlist_fs = {
	Create = create_setlist_menu
	Destroy = destroy_setlist_menu
	actions = [
		{
			action = Continue
			flow_state_func = practice_check_song_for_parts
			transition_right
		}
		{
			action = go_back
			flow_state = practice_select_mode_fs
			transition_left
		}
	]
}

script practice_check_song_for_parts 
	load_songqpak song_name = ($current_song) async = 0
	get_song_struct Song = ($current_song)
	if StructureContains Structure = <song_struct> no_rhythm_track
		Change \{StructureName = player1_status
			part = GUITAR}
		return \{flow_state = practice_select_difficulty_fs}
	endif
	get_song_prefix Song = ($current_song)
	FormatText ChecksumName = song_rhythm_array_id '%s_song_rhythm_easy' S = <song_prefix>
	if GlobalExists Name = <song_rhythm_array_id> Type = Array
		GetArraySize $<song_rhythm_array_id>
		if (<array_Size> > 0)
			return \{flow_state = practice_select_part_fs}
		endif
	endif
	if StructureContains Structure = <song_struct> use_coop_notetracks
		return \{flow_state = practice_select_part_fs}
	endif
	Change \{StructureName = player1_status
		part = GUITAR}
	return \{flow_state = practice_select_difficulty_fs}
endscript

script practice_check_song_for_parts_back 
	load_songqpak song_name = ($current_song) async = 0
	get_song_struct Song = ($current_song)
	if StructureContains Structure = <song_struct> no_rhythm_track
		return \{flow_state = practice_setlist_fs}
	endif
	get_song_prefix Song = ($current_song)
	FormatText ChecksumName = song_rhythm_array_id '%s_song_rhythm_easy' S = <song_prefix>
	if GlobalExists Name = <song_rhythm_array_id> Type = Array
		GetArraySize $<song_rhythm_array_id>
		if (<array_Size> > 0)
			return \{flow_state = practice_select_part_fs}
		endif
	endif
	if StructureContains Structure = <song_struct> use_coop_notetracks
		return \{flow_state = practice_select_part_fs}
	endif
	return \{flow_state = practice_setlist_fs}
endscript
practice_select_part_fs = {
	Create = create_choose_practice_part_menu
	Destroy = destroy_choose_practice_part_menu
	actions = [
		{
			action = Continue
			flow_state = practice_select_difficulty_fs
			transition_right
		}
		{
			action = go_back
			flow_state = practice_setlist_fs
			transition_left
		}
	]
}
practice_select_difficulty_fs = {
	Create = create_select_difficulty_menu
	Destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = Continue
			flow_state = practice_select_song_section_fs
			transition_right
		}
		{
			action = go_back
			flow_state_func = practice_check_song_for_parts_back
			transition_left
		}
	]
}
practice_select_song_section_fs = {
	Create = create_choose_practice_section_menu
	Destroy = destroy_choose_practice_section_menu
	actions = [
		{
			action = Continue
			flow_state = practice_select_speed_fs
		}
		{
			action = go_back
			func = end_practice_song
			flow_state_func = where_do_we_go_from_practice
			flow_state_func_params = {
				from_choose_practice_section
			}
			transition_left
		}
	]
}
practice_select_speed_fs = {
	Create = create_choose_practice_speed_menu
	Destroy = destroy_choose_practice_speed_menu
	actions = [
		{
			action = Continue
			func = practice_start_song
			transition_screen = default_loading_screen
			flow_state = practice_play_song_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}

script practice_start_song \{device_num = 0}
	Change \{game_mode = training}
	Change \{current_transition = PRACTICE}
	Change \{current_level = load_z_soundcheck}
	start_song StartTime = ($practice_start_time) device_num = <device_num> practice_intro = 1 endtime = ($practice_end_time)
	Change \{practice_audio_muted = 0}
	if ($current_speedfactor = 1.0)
		menu_audio_settings_update_band_volume \{vol = 7}
	else
		menu_audio_settings_update_band_volume \{vol = 0}
	endif
	SetSoundBussParams \{Crowd = {
			vol = -100.0
		}}
	SpawnScriptNow \{practice_update}
endscript

script practice_restart_song 
	Change \{game_mode = training}
	Change \{current_transition = PRACTICE}
	restart_song practice_intro = 1 StartTime = ($practice_start_time) endtime = ($practice_end_time)
	Change \{practice_audio_muted = 0}
	if ($current_speedfactor = 1.0)
		menu_audio_settings_update_band_volume \{vol = 7}
	else
		menu_audio_settings_update_band_volume \{vol = 0}
	endif
	SetSoundBussParams \{Crowd = {
			vol = -100.0
		}}
	SpawnScriptNow \{practice_update}
endscript

script practice_update 
	begin
	practice_audio_filter
	GetSongTimeMS
	if (<Time> > (($practice_end_time) + ($Song_Win_Delay * 1000 - 100)))
		SpawnScriptNow \{finish_practice_song}
	endif
	Wait \{1
		GameFrames}
	repeat
endscript

script finish_practice_song 
	KillSpawnedScript \{Name = practice_update}
	ui_flow_manager_respond_to_action \{action = end_song}
	gh3_start_pressed
endscript
practice_audio_muted = 0

script practice_audio_filter 
	GetSongTimeMS
	if ((<Time> > ($practice_start_time)) && (<Time> < ($practice_end_time)))
		if ($practice_audio_muted = 1)
			GetGlobalTags \{user_options}
			menu_audio_settings_update_guitar_volume vol = <guitar_volume>
			Change \{practice_audio_muted = 0}
		endif
	else
		if ($practice_audio_muted = 0)
			Printf \{"Setting audio supposedly"}
			menu_audio_settings_update_guitar_volume \{vol = 0}
			Change \{practice_audio_muted = 1}
		endif
	endif
endscript

script shut_down_practice_mode 
	KillSpawnedScript \{Name = practice_update}
	GetGlobalTags \{user_options}
	menu_audio_settings_update_guitar_volume vol = <guitar_volume>
	menu_audio_settings_update_band_volume vol = <band_volume>
	menu_audio_settings_update_sfx_volume vol = <sfx_volume>
	SetSoundBussParams {Crowd = {vol = ($Default_BussSet.Crowd.vol)}}
endscript
practice_play_song_fs = {
	actions = [
		{
			action = pause_game
			flow_state = practice_pause_fs
		}
		{
			action = end_song
			flow_state = practice_newspaper_fs
		}
	]
}
practice_pause_fs = {
	Create = create_pause_menu
	create_params = {
		for_practice = 1
	}
	Destroy = destroy_pause_menu
	actions = [
		{
			action = select_resume
			flow_state = practice_play_song_fs
		}
		{
			action = select_restart
			flow_state = practice_restart_warning_fs
		}
		{
			action = select_change_speed
			flow_state = practice_change_speed_fs
		}
		{
			action = select_options
			flow_state = practice_options_fs
		}
		{
			action = select_change_section
			flow_state = practice_change_section_quit_warning_fs
		}
		{
			action = select_new_song
			flow_state = practice_new_song_quit_warning_fs
		}
		{
			action = select_quit
			flow_state = practice_quit_warning_fs
		}
	]
}
practice_options_fs = {
	Create = create_pause_menu
	create_params = {
		for_options = 1
	}
	Destroy = destroy_pause_menu
	actions = [
		{
			action = select_audio_settings
			flow_state = practice_audio_settings_fs
		}
		{
			action = select_calibrate_lag
			flow_state = practice_calibrate_lag_warning
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
			flow_state = practice_lefty_flip_warning
		}
		{
			action = go_back
			flow_state = practice_pause_fs
		}
	]
}
practice_audio_settings_fs = {
	Create = create_audio_settings_menu
	create_params = {
		Popup = 1
	}
	Destroy = destroy_audio_settings_menu
	actions = [
		{
			action = Continue
			flow_state = practice_pause_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
practice_lefty_flip_warning = {
	Create = create_lefty_flip_warning_menu
	Destroy = destroy_lefty_flip_warning_menu
	actions = [
		{
			action = Continue
			func = lefty_flip_func
			flow_state = practice_play_song_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
practice_calibrate_lag_warning = {
	Create = create_calibrate_lag_warning_menu
	Destroy = destroy_calibrate_lag_warning_menu
	actions = [
		{
			action = Continue
			flow_state = practice_calibrate_lag_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
practice_calibrate_lag_fs = {
	Create = create_calibrate_lag_menu
	Destroy = destroy_calibrate_lag_menu
	actions = [
		{
			action = Continue
			flow_state = practice_calibrate_autosave_fs
		}
		{
			action = go_back
			func = practice_restart_song
			transition_screen = default_loading_screen
			flow_state = practice_play_song_fs
		}
	]
}
practice_calibrate_autosave_fs = {
	Create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			func = practice_restart_song
			transition_screen = default_loading_screen
			flow_state = practice_play_song_fs
		}
		{
			action = memcard_sequence_save_failed
			func = practice_restart_song
			transition_screen = default_loading_screen
			flow_state = practice_play_song_fs
		}
	]
}
practice_restart_warning_fs = {
	Create = create_restart_warning_menu
	Destroy = destroy_restart_warning_menu
	actions = [
		{
			action = Continue
			func = practice_restart_song
			transition_screen = default_loading_screen
			flow_state = practice_play_song_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
practice_quit_warning_fs = {
	Create = create_quit_warning_menu
	Destroy = destroy_quit_warning_menu
	actions = [
		{
			action = Continue
			func = end_practice_song
			flow_state_func = where_do_we_go_from_practice
		}
		{
			action = go_back
			flow_state = practice_pause_fs
		}
	]
}
practice_change_speed_quit_warning_fs = {
	Create = create_quit_warning_menu
	create_params = {
		option2_text = "CHANGE SPEED"
		Menu_pos = (470.0, 475.0)
		bg_dims = (400.0, 80.0)
		no_joiners
	}
	Destroy = destroy_quit_warning_menu
	actions = [
		{
			action = Continue
			flow_state = practice_change_speed_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
practice_change_section_quit_warning_fs = {
	Create = create_quit_warning_menu
	create_params = {
		option2_text = "CHANGE SECTION"
		Menu_pos = (445.0, 475.0)
		bg_dims = (500.0, 80.0)
		no_joiners
	}
	Destroy = destroy_quit_warning_menu
	actions = [
		{
			action = Continue
			func = end_practice_song
			flow_state = practice_select_song_section_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
practice_new_song_quit_warning_fs = {
	Create = create_quit_warning_menu
	create_params = {
		option2_text = "NEW SONG"
		Menu_pos = (520.0, 475.0)
		bg_dims = (350.0, 80.0)
		no_joiners
	}
	Destroy = destroy_quit_warning_menu
	actions = [
		{
			action = Continue
			func = end_practice_song
			flow_state = practice_setlist_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}

script end_practice_song_slomo 
	Change \{current_speedfactor = 1.0}
	SetSlomo \{$current_speedfactor}
	Change \{StructureName = PitchShiftSlow1
		Pitch = 1.0}
endscript

script end_practice_song 
	Printf \{"end_practice_song"}
	end_practice_song_slomo
	SpawnScriptNow \{xenon_singleplayer_session_complete_uninit}
	kill_gem_scroller
endscript
practice_change_speed_fs = {
	Create = create_choose_practice_speed_menu
	Destroy = destroy_choose_practice_speed_menu
	actions = [
		{
			action = Continue
			func = practice_restart_song
			flow_state = practice_play_song_fs
		}
		{
			action = go_back
			flow_state = practice_pause_fs
		}
	]
}
practice_newspaper_fs = {
	Create = create_newspaper_menu
	create_params = {
		for_practice = 1
	}
	Destroy = destroy_newspaper_menu
	actions = [
		{
			action = restart
			func = practice_restart_song
			transition_screen = default_loading_screen
			flow_state = practice_play_song_fs
		}
		{
			action = change_speed
			func = kill_gem_scroller
			flow_state = practice_select_speed_fs
		}
		{
			action = change_section
			func = end_practice_song
			flow_state = practice_select_song_section_fs
		}
		{
			action = new_song
			func = end_practice_song
			flow_state = practice_setlist_fs
		}
		{
			action = back_2_setlist
			func = end_practice_song
			flow_state_func = where_do_we_go_from_practice
		}
		{
			action = exit
			func = end_practice_song
			flow_state = main_menu_fs
		}
	]
}
practice_end_fs = {
	Create = create_practice_end_menu
	Destroy = destroy_practice_end_menu
	actions = [
		{
			action = restart
			func = practice_restart_song
			transition_screen = default_loading_screen
			flow_state = practice_play_song_fs
		}
		{
			action = change_speed
			func = kill_gem_scroller
			flow_state = practice_select_speed_fs
		}
		{
			action = change_section
			func = end_practice_song
			flow_state = practice_select_song_section_fs
		}
		{
			action = new_song
			func = end_practice_song
			flow_state = practice_setlist_fs
		}
		{
			action = exit
			func = end_practice_song
			flow_state_func = where_do_we_go_from_practice
		}
	]
}

script where_do_we_go_from_practice 
	switch ($came_to_practice_from)
		case main_menu
		if GotParam \{from_choose_practice_section}
			return \{flow_state = practice_select_difficulty_fs}
		elseif GotParam \{from_practice_tutorial_select}
			return \{flow_state = practice_select_mode_fs}
		else
			return \{flow_state = main_menu_fs}
		endif
		case Career
		Change \{game_mode = p1_career}
		Change current_difficulty = ($came_to_practice_difficulty)
		progression_pop_current
		return \{flow_state = career_setlist_fs}
		case coop_career
		Change \{game_mode = p2_career}
		Change current_difficulty = ($came_to_practice_difficulty)
		Change current_difficulty2 = ($came_to_practice_difficulty2)
		progression_pop_current
		return \{flow_state = coop_career_setlist_fs}
		case QUICKPLAY
		Change \{game_mode = p1_quickplay}
		Change current_difficulty = ($came_to_practice_difficulty)
		return \{flow_state = quickplay_setlist_fs}
	endswitch
endscript
practice_tutorial_select_fs = {
	Create = create_tutorial_select_menu
	Destroy = destroy_tutorial_select_menu
	actions = [
		{
			action = Continue
			func = run_training_script
			flow_state = practice_play_tutorial_fs
			transition_right
		}
		{
			action = go_back
			flow_state_func = where_do_we_go_from_practice
			flow_state_func_params = {
				from_practice_tutorial_select
			}
			transition_left
		}
	]
}
practice_play_tutorial_fs = {
	actions = [
		{
			action = complete_tutorial
			flow_state = practice_tutorial_autosave_fs
		}
		{
			action = quit_tutorial
			flow_state = practice_tutorial_select_fs
			transition_left
		}
	]
}
practice_tutorial_autosave_fs = {
	Create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = practice_tutorial_select_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = practice_tutorial_select_fs
		}
	]
}
