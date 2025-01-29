came_to_practice_from = main_menu
practice_select_mode_fs = {
	create = create_select_practice_mode_menu
	destroy = destroy_select_practice_mode_menu
	actions = [
		{
			action = select_practice
			flow_state = practice_setlist_fs
		}
		{
			action = select_tutorial
			flow_state = practice_tutorial_select_fs
		}
		{
			action = go_back
			flow_state = main_menu_fs
		}
	]
}
practice_setlist_fs = {
	create = create_setlist_menu
	destroy = destroy_setlist_menu
	actions = [
		{
			action = continue
			flow_state_func = practice_check_song_for_parts
		}
		{
			action = go_back
			flow_state = practice_select_mode_fs
		}
	]
}

script practice_check_song_for_parts 
	load_songqpak song_name = ($current_song) async = 0
	get_song_prefix song = ($current_song)
	formattext checksumname = song_rhythm_array_id '%s_song_rhythm_easy' s = <song_prefix>
	if globalexists name = <song_rhythm_array_id> type = array
		getarraysize $<song_rhythm_array_id>
		if (<array_size> > 0)
			return \{flow_state = practice_select_part_fs}
		endif
	endif
	return \{flow_state = practice_select_difficulty_fs}
endscript

script practice_check_song_for_parts_back 
	load_songqpak song_name = ($current_song) async = 0
	get_song_prefix song = ($current_song)
	formattext checksumname = song_rhythm_array_id '%s_song_rhythm_easy' s = <song_prefix>
	if globalexists name = <song_rhythm_array_id> type = array
		getarraysize $<song_rhythm_array_id>
		if (<array_size> > 0)
			return \{flow_state = practice_select_part_fs}
		endif
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
		}
		{
			action = go_back
			flow_state = practice_setlist_fs
		}
	]
}
practice_select_difficulty_fs = {
	create = create_select_difficulty_menu
	destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = continue
			flow_state = practice_select_song_section_fs
		}
		{
			action = go_back
			flow_state_func = practice_check_song_for_parts_back
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
			flow_state = practice_select_difficulty_fs
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
			flow_state = practice_select_song_section_fs
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
	wait \{1
		gameframes}
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
	if ((<time> > ($practice_start_time)) && (<time> < ($practice_end_time)))
		if ($practice_audio_muted = 1)
			getglobaltags user_options
			menu_audio_settings_update_guitar_volume vol = <guitar_volume>
			change practice_audio_muted = 0
		endif
	else
		if ($practice_audio_muted = 0)
			printf "Setting audio supposedly"
			menu_audio_settings_update_guitar_volume vol = 0
			change practice_audio_muted = 1
		endif
	endif
endscript

script shut_down_practice_mode 
	killspawnedscript \{name = practice_update}
	getglobaltags \{user_options}
	menu_audio_settings_update_guitar_volume vol = <guitar_volume>
	menu_audio_settings_update_band_volume vol = <band_volume>
	menu_audio_settings_update_sfx_volume vol = <sfx_volume>
	setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)}}
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
			use_last_flow_state
		}
	]
}
practice_change_speed_quit_warning_fs = {
	create = create_quit_warning_menu
	create_params = {
		option2_text = "CHANGE SPEED"
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
		option2_text = "CHANGE SECTION"
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
		option2_text = "NEW SONG"
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

script end_practice_song 
	printf \{"end_practice_song"}
	change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	change \{structurename = pitchshiftslow1
		pitch = 1.0}
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
			action = exit
			func = end_practice_song
			flow_state_func = where_do_we_go_from_practice
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
		return \{flow_state = main_menu_fs}
		case career
		change \{game_mode = p1_career}
		return \{flow_state = career_setlist_fs}
		case coop_career
		change \{game_mode = p2_career}
		return \{flow_state = coop_career_setlist_fs}
		case quickplay
		change \{game_mode = p1_quickplay}
		return \{flow_state = quickplay_setlist_fs}
	endswitch
endscript
practice_tutorial_select_fs = {
	create = create_tutorial_select_menu
	destroy = destroy_tutorial_select_menu
	actions = [
		{
			action = continue
			transition_screen = default_loading_screen
			func = run_training_script
			flow_state = practice_play_tutorial_fs
		}
		{
			action = go_back
			flow_state = practice_select_mode_fs
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
