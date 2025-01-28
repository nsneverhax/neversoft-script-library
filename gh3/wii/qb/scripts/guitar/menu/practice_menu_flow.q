came_to_practice_from = main_menu
came_to_practice_difficulty = easy
came_to_practice_difficulty2 = easy
practice_select_mode_fs = {
	create = create_select_practice_mode_menu
	destroy = destroy_select_practice_mode_menu
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
	create = create_setlist_menu
	destroy = destroy_setlist_menu_practice
	actions = [
		{
			action = continue
			flow_state_func = practice_check_song_for_parts
			transition_right
		}
		{
			action = go_back
			func = destroy_setlist_songpreview_monitor
			flow_state = practice_select_mode_fs
			transition_left
		}
	]
}

script practice_check_song_for_parts 
	destroy_setlist_songpreview_monitor
	load_songqpak song_name = ($current_song) async = 0
	get_song_struct song = ($current_song)
	if structurecontains structure = <song_struct> no_rhythm_track
		change \{structurename = player1_status
			part = guitar}
		return \{flow_state = practice_select_difficulty_fs}
	endif
	get_song_prefix song = ($current_song)
	formattext checksumname = song_rhythm_array_id '%s_song_rhythm_easy' s = <song_prefix>
	if globalexists name = <song_rhythm_array_id> type = array
		getarraysize $<song_rhythm_array_id>
		if (<array_size> > 0)
			return \{flow_state = practice_select_part_fs}
		endif
	endif
	if structurecontains structure = <song_struct> use_coop_notetracks
		return \{flow_state = practice_select_part_fs}
	endif
	change \{structurename = player1_status
		part = guitar}
	return \{flow_state = practice_select_difficulty_fs}
endscript

script practice_check_song_for_parts_back 
	load_songqpak song_name = ($current_song) async = 0
	get_song_struct song = ($current_song)
	if structurecontains structure = <song_struct> no_rhythm_track
		return \{flow_state = practice_setlist_fs}
	endif
	get_song_prefix song = ($current_song)
	formattext checksumname = song_rhythm_array_id '%s_song_rhythm_easy' s = <song_prefix>
	if globalexists name = <song_rhythm_array_id> type = array
		getarraysize $<song_rhythm_array_id>
		if (<array_size> > 0)
			return \{flow_state = practice_select_part_fs}
		endif
	endif
	if structurecontains structure = <song_struct> use_coop_notetracks
		return \{flow_state = practice_select_part_fs}
	endif
	return \{flow_state = practice_setlist_fs}
endscript
practice_select_part_fs = {
	create = create_choose_practice_part_menu
	destroy = destroy_choose_practice_part_menu
	actions = [
		{
			action = continue
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
	create = create_select_difficulty_menu_for_practice
	destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = continue
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
	create = create_choose_practice_section_menu
	destroy = destroy_choose_practice_section_menu
	actions = [
		{
			action = continue
			flow_state = practice_select_speed_fs
		}
		{
			action = go_back
			func = end_practice_song_slomo
			flow_state_func = where_do_we_go_from_practice
			flow_state_func_params = {
				from_choose_practice_section
			}
			transition_left
		}
	]
}
practice_select_speed_fs = {
	create = create_choose_practice_speed_menu
	destroy = destroy_choose_practice_speed_menu
	actions = [
		{
			action = continue
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
	change \{game_mode = training}
	change \{current_transition = practice}
	change \{current_level = load_z_soundcheck}
	start_song starttime = ($practice_start_time) device_num = <device_num> practice_intro = 1 endtime = ($practice_end_time)
	change \{practice_audio_muted = 0}
	if ($current_speedfactor = 1.0)
		menu_audio_settings_update_band_volume \{vol = 7}
	else
		menu_audio_settings_update_band_volume \{vol = 0}
	endif
	setsoundbussparams \{crowd = {
			vol = -100.0
		}}
	spawnscriptnow \{practice_update}
endscript

script practice_restart_song 
	if ((isps2) || (isngc))

		end_song \{0xdeb80c0b = 1}
	endif
	change \{game_mode = training}
	change \{current_transition = practice}
	restart_song practice_intro = 1 starttime = ($practice_start_time) endtime = ($practice_end_time)
	change \{practice_audio_muted = 0}
	if ($current_speedfactor = 1.0)
		menu_audio_settings_update_band_volume \{vol = 7}
	else
		menu_audio_settings_update_band_volume \{vol = 0}
	endif
	setsoundbussparams \{crowd = {
			vol = -100.0
		}}
	spawnscriptnow \{practice_update}
endscript

script practice_update 
	begin
	practice_audio_filter
	getsongtimems
	if (<time> > (($practice_end_time) + ($song_win_delay * 1000 - 100)))
		spawnscriptnow \{finish_practice_song}
	endif
	waitonegameframe
	repeat
endscript

script finish_practice_song 
	killspawnedscript \{name = practice_update}
	ui_flow_manager_respond_to_action \{action = end_song}
	gh3_start_pressed
endscript
practice_audio_muted = 0

script practice_audio_filter 
	getsongtimems
	if (<time> < ($practice_end_time))
		if ($practice_audio_muted = 1)
			getglobaltags \{user_options}
			menu_audio_settings_update_guitar_volume vol = <guitar_volume>
			change \{practice_audio_muted = 0}
		endif
	else
		if ($practice_audio_muted = 0)

			setsoundparams \{unique_id = $guitar_player1_unique_id
				voll = 0
				volr = 0}
			change \{practice_audio_muted = 1}
		endif
	endif
endscript

script shut_down_practice_mode 
	killspawnedscript \{name = practice_update}
	getglobaltags \{user_options
		param = guitar_volume}
	getglobaltags \{user_options
		param = band_volume}
	getglobaltags \{user_options
		param = sfx_volume}
	if (isngc)
		menu_audio_settings_update_guitar_volume vol = <guitar_volume>
		menu_audio_settings_update_band_volume vol = <band_volume>
		menu_audio_settings_update_sfx_volume vol = <sfx_volume>
		setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)}}
	endif
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
	create = create_pause_menu
	create_params = {
		for_practice = 1
	}
	destroy = destroy_pause_menu
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
	create = create_pause_menu
	create_params = {
		for_options = 1
	}
	destroy = destroy_pause_menu
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
	create = create_audio_settings_menu
	create_params = {
		popup = 1
	}
	destroy = destroy_audio_settings_menu
	actions = [
		{
			action = continue
			flow_state = practice_pause_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
practice_lefty_flip_warning = {
	create = create_lefty_flip_warning_menu
	destroy = destroy_lefty_flip_warning_menu
	actions = [
		{
			action = continue
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
	create = create_calibrate_lag_warning_menu
	destroy = destroy_calibrate_lag_warning_menu
	actions = [
		{
			action = continue
			flow_state = practice_calibrate_lag_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
practice_calibrate_lag_fs = {
	create = create_calibrate_lag_menu
	destroy = destroy_calibrate_lag_menu
	actions = [
		{
			action = continue
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
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
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
	create = create_restart_warning_menu
	destroy = destroy_restart_warning_menu
	actions = [
		{
			action = continue
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
	create = create_quit_warning_menu
	destroy = destroy_quit_warning_menu
	actions = [
		{
			action = continue
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
	create = create_quit_warning_menu
	create_params = {
		option2_text = 'CHANGE SPEED'
		menu_pos = (470.0, 475.0)
		bg_dims = (400.0, 80.0)
		no_joiners
	}
	destroy = destroy_quit_warning_menu
	actions = [
		{
			action = continue
			flow_state = practice_change_speed_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
practice_change_section_quit_warning_fs = {
	create = create_quit_warning_menu
	create_params = {
		option2_text = 'CHANGE SECTION'
		menu_pos = (445.0, 475.0)
		bg_dims = (500.0, 80.0)
		no_joiners
	}
	destroy = destroy_quit_warning_menu
	actions = [
		{
			action = continue
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
	create = create_quit_warning_menu
	create_params = {
		option2_text = 'NEW SONG'
		menu_pos = (520.0, 475.0)
		bg_dims = (350.0, 80.0)
		no_joiners
	}
	destroy = destroy_quit_warning_menu
	actions = [
		{
			action = continue
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
	change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	change \{structurename = pitchshiftslow1
		pitch = 1.0}
	if (isngc)
		change \{structurename = 0x39ae1d8e
			pitch = 1.0}
	endif
endscript

script end_practice_song 

	end_practice_song_slomo
	spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
	if (isngc)
		change \{structurename = 0x39ae1d8e
			pitch = 1.0}
	endif
	change \{current_starttime = 0}
	kill_gem_scroller
endscript
practice_change_speed_fs = {
	create = create_choose_practice_speed_menu
	destroy = destroy_choose_practice_speed_menu
	actions = [
		{
			action = continue
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
	create = create_newspaper_menu
	create_params = {
		for_practice = 1
	}
	destroy = destroy_newspaper_menu
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
	create = create_practice_end_menu
	destroy = destroy_practice_end_menu
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
		if gotparam \{from_choose_practice_section}
			return \{flow_state = practice_select_difficulty_fs}
		elseif gotparam \{from_practice_tutorial_select}
			return \{flow_state = practice_select_mode_fs}
		else
			return \{flow_state = main_menu_fs}
		endif
		case career
		change \{game_mode = p1_career}
		change current_difficulty = ($came_to_practice_difficulty)
		progression_pop_current
		return \{flow_state = career_setlist_fs}
		case coop_career
		change \{game_mode = p2_career}
		change current_difficulty = ($came_to_practice_difficulty)
		change current_difficulty2 = ($came_to_practice_difficulty2)
		progression_pop_current
		return \{flow_state = coop_career_setlist_fs}
		case quickplay
		change \{game_mode = p1_quickplay}
		change current_difficulty = ($came_to_practice_difficulty)
		return \{flow_state = quickplay_setlist_fs}
	endswitch
endscript
practice_tutorial_select_fs = {
	create = create_tutorial_select_menu
	destroy = destroy_tutorial_select_menu
	actions = [
		{
			action = continue
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
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
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
