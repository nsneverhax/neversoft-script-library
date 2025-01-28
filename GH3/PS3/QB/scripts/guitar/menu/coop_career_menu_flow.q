coop_career_select_controllers_fs = {
	Create = create_select_controller_menu
	Destroy = destroy_select_controller_menu
	actions = [
		{
			action = Continue
			flow_state_func = coop_career_select_controller_flow_state_func
			transition_right
		}
		{
			action = go_back
			flow_state = main_menu_fs
			transition_left
		}
	]
}

script coop_career_autosave_or_setlist 
	kill_gem_scroller
	destroy_song_ended_menu
	destroy_fail_song_menu
	kill_start_key_binding
	destroy_sponsored_menu
	if ($progression_play_completion_movie = 1)
		get_progression_globals game_mode = ($game_mode)
		FormatText ChecksumName = tiername 'tier%i' I = ($progression_completion_tier)
		if StructureContains Structure = ($<tier_global>.<tiername>) completion_movie
			Menu_Music_Off
			PlayMovieAndWait movie = ($<tier_global>.<tiername>.completion_movie)
			get_movie_id_by_name movie = ($<tier_global>.<tiername>.completion_movie)
			SetGlobalTags <Id> Params = {unlocked = 1}
		endif
		Change \{progression_play_completion_movie = 0}
	endif
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		return \{flow_state = coop_career_autosave_fs}
	else
		if ($progression_unlock_tier_last_song = 1)
			Change \{progression_unlock_tier_last_song = 0}
			return \{flow_state = coop_career_select_venue_fs}
		else
			return \{flow_state = coop_career_setlist_fs}
		endif
	endif
endscript

script coop_career_select_controller_flow_state_func 
	main_menu_get_any_band_names_exist
	if (<name_exists> = 0)
		return \{flow_state = coop_career_enter_band_name_fs}
	else
		return \{flow_state = coop_career_choose_band_fs}
	endif
endscript
coop_career_choose_band_fs = {
	Create = create_choose_band_menu
	Destroy = destroy_choose_band_menu
	actions = [
		{
			action = select_existing_band
			flow_state = coop_career_select_difficulty_fs
			transition_right
		}
		{
			action = select_new_band
			flow_state = coop_career_enter_band_name_fs
			transition_right
		}
		{
			action = go_back
			flow_state = coop_career_select_controllers_fs
			transition_left
		}
	]
}
coop_career_enter_band_name_fs = {
	Create = create_enter_band_name_menu
	Destroy = destroy_enter_band_name_menu
	remove_focus = enter_band_name_remove_focus
	refocus = enter_band_name_refocus
	actions = [
		{
			action = enter_band_name
			flow_state = coop_career_select_difficulty_fs
			transition_right
		}
		{
			action = enter_no_band
			flow_state = coop_career_no_band_fs
			transition_right
		}
		{
			action = go_back
			flow_state_func = coop_career_enter_band_name_flow_state_func
			transition_left
		}
	]
}

script coop_career_enter_band_name_flow_state_func 
	get_current_first_play
	if (<first_play>)
		return \{flow_state = main_menu_fs}
	else
		return \{flow_state = coop_career_choose_band_fs}
	endif
endscript
coop_career_no_band_fs = {
	Create = create_no_band_menu
	Destroy = destroy_no_band_menu
	Popup
	actions = [
		{
			action = Continue
			flow_state = coop_career_enter_band_name_fs
			transition_left
		}
		{
			action = go_back
			flow_state = coop_career_enter_band_name_fs
			transition_left
		}
	]
}
coop_career_select_difficulty_fs = {
	Create = create_select_difficulty_menu
	Destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = Continue
			flow_state_func = coop_career_select_difficulty_flow_state_func
		}
		{
			action = go_back
			flow_state = coop_career_choose_band_fs
			transition_left
		}
	]
}

script coop_career_select_difficulty_flow_state_func 
	progression_pop_current
	if ($game_mode = p2_career)
		Index = ($difficulty_list_props.($current_difficulty).Index)
		SetProgressionDifficulty DIFFICULTY = <Index>
		DeRegisterAtoms
		get_progression_globals game_mode = ($game_mode)
		if NOT (<progression_global> = NONE)
			RegisterAtoms Name = Progression $<progression_global>
			RegisterAtoms \{Name = Achievement
				$Achievement_Atoms}
			UpdateAtoms \{Name = Progression}
		endif
	endif
	get_current_first_play
	if (<first_play>)
		set_character_hub_dirty
		return \{flow_state = coop_career_split_off_flow_for_character_select_fs}
	else
		set_character_hub_dirty
		return \{flow_state = coop_career_split_off_flow_for_character_hub_fs}
	endif
endscript
coop_career_split_off_flow_for_character_select_fs = {
	Create = create_coop_split_off_flow_for_character_select
	actions = [
		{
			action = Continue
			flow_state = coop_career_character_select_fs
		}
	]
}

script create_coop_split_off_flow_for_character_select 
	ui_flow_manager_respond_to_action \{action = Continue
		create_params = {
			Player = 1
		}}
	if ($current_num_players = 2)
		start_flow_manager \{flow_state = coop_career_character_select_fs
			Player = 2
			create_params = {
				Player = 2
			}}
	endif
endscript
coop_career_character_select_fs = {
	Create = create_character_select_menu
	Destroy = destroy_character_select_menu
	actions = [
		{
			action = Continue
			flow_state = coop_career_character_hub_fs
		}
		{
			action = go_back
			func = progression_push_current
			flow_state = coop_career_select_difficulty_fs
			transition_left
		}
	]
}
coop_career_split_off_flow_for_character_hub_fs = {
	Create = create_coop_split_off_flow_for_character_hub
	actions = [
		{
			action = Continue
			flow_state = coop_career_character_hub_fs
		}
	]
}

script create_coop_split_off_flow_for_character_hub 
	ui_flow_manager_respond_to_action \{action = Continue
		create_params = {
			Player = 1
		}}
	if ($current_num_players = 2)
		start_flow_manager \{flow_state = coop_career_character_hub_fs
			Player = 2
			create_params = {
				Player = 2
			}}
	endif
endscript
coop_career_character_hub_fs = {
	Create = create_character_hub_menu
	Destroy = destroy_character_hub_menu
	actions = [
		{
			action = select_play_show
			flow_state = coop_career_select_venue_fs
		}
		{
			action = select_change_outfit
			flow_state = coop_career_select_outfit_fs
		}
		{
			action = select_change_guitar
			flow_state = coop_career_select_guitar_fs
		}
		{
			action = select_change_bass
			flow_state = coop_career_select_bass_fs
		}
		{
			action = go_back
			flow_state_func = find_coop_career_character_hub_ancestor
		}
	]
}

script set_store_came_from_p2_career 
	progression_push_current
	Change \{store_came_from = p2_career}
endscript

script find_coop_career_character_hub_ancestor 
	return \{flow_state = coop_career_character_select_fs}
endscript
coop_career_select_outfit_fs = {
	Create = create_select_outfit_menu
	Destroy = destroy_select_outfit_menu
	actions = [
		{
			action = select_character_hub
			flow_state = coop_career_character_hub_fs
		}
		{
			action = select_select_style
			flow_state = coop_career_select_style_fs
		}
		{
			action = go_back
			flow_state = coop_career_character_hub_fs
		}
	]
}
coop_career_select_style_fs = {
	Create = create_select_style_menu
	Destroy = destroy_select_style_menu
	actions = [
		{
			action = select_character_hub
			flow_state = coop_career_character_hub_fs
		}
		{
			action = select_select_outfit
			flow_state = coop_career_select_outfit_fs
		}
		{
			action = go_back
			flow_state = coop_career_select_outfit_fs
		}
	]
}
coop_career_select_guitar_fs = {
	Create = create_select_guitar_menu
	Destroy = destroy_select_guitar_menu
	actions = [
		{
			action = select_character_hub
			flow_state = coop_career_character_hub_fs
		}
		{
			action = Continue
			flow_state = coop_career_character_hub_fs
		}
		{
			action = select_guitar_finish
			flow_state = coop_career_select_guitar_finish_fs
		}
		{
			action = go_back
			flow_state = coop_career_character_hub_fs
		}
	]
}
coop_career_select_bass_fs = {
	Create = create_select_bass_menu
	Destroy = destroy_select_guitar_menu
	actions = [
		{
			action = select_character_hub
			flow_state = coop_career_character_hub_fs
		}
		{
			action = Continue
			flow_state = coop_career_character_hub_fs
		}
		{
			action = select_guitar_finish
			flow_state = coop_career_select_guitar_finish_fs
		}
		{
			action = go_back
			flow_state = coop_career_character_hub_fs
		}
	]
}
coop_career_select_guitar_finish_fs = {
	Create = create_select_guitar_finish_menu
	Destroy = destroy_select_guitar_finish_menu
	actions = [
		{
			action = Continue
			flow_state = coop_career_select_guitar
		}
		{
			action = go_back
			flow_state = coop_career_select_guitar
		}
	]
}
coop_career_select_venue_fs = {
	Create = create_select_venue_menu
	Destroy = destroy_select_venue_menu
	actions = [
		{
			action = Continue
			flow_state = coop_career_setlist_fs
			transition_right
		}
		{
			action = go_back
			func = set_character_hub_dirty
			flow_state = coop_career_split_off_flow_for_character_hub_fs
		}
	]
}
coop_career_setlist_fs = {
	Create = create_setlist_menu
	Destroy = destroy_setlist_menu
	actions = [
		{
			action = Continue
			flow_state = coop_career_choose_part_fs
			transition_right
		}
		{
			action = go_back
			flow_state = coop_career_select_venue_fs
			transition_left
		}
	]
}
coop_career_choose_part_fs = {
	Create = create_choose_part_menu
	Destroy = destroy_choose_part_menu
	actions = [
		{
			action = Continue
			func = start_song
			transition_screen = default_loading_screen
			flow_state = coop_career_play_song_fs
		}
		{
			action = go_back
			flow_state = coop_career_setlist_fs
			transition_left
		}
	]
}
coop_career_play_song_fs = {
	Create = create_play_song_menu
	Destroy = destroy_play_song_menu
	actions = [
		{
			action = pause_game
			flow_state = coop_career_pause_fs
		}
		{
			action = preencore_win_song
			flow_state = coop_career_encore_confirmation_fs
		}
		{
			action = unlocktier_win_song
			flow_state = career_select_venue_fs
		}
		{
			action = win_song
			func = kill_gem_scroller
			flow_state_func = coop_career_check_for_beat_game
		}
		{
			action = fail_song
			flow_state = coop_career_fail_song_fs
		}
		{
			action = controller_disconnect
			flow_state = controller_disconnect_fs
		}
	]
}

script coop_career_check_for_beat_game 
	if ($progression_beat_game_last_song = 1)
		return \{flow_state = coop_career_beat_game_fs}
	else
		return \{flow_state = coop_career_newspaper_fs}
	endif
endscript
coop_career_beat_game_fs = {
	Create = create_beat_game_menu
	Destroy = destroy_beat_game_menu
	actions = [
		{
			action = Continue
			flow_state = coop_career_newspaper_fs
			transition_right
		}
	]
}
coop_career_pause_fs = {
	Create = create_pause_menu
	Destroy = destroy_pause_menu
	actions = [
		{
			action = select_resume
			flow_state = coop_career_play_song_fs
		}
		{
			action = select_restart
			flow_state = coop_career_restart_warning_fs
		}
		{
			action = select_practice
			flow_state = coop_career_practice_warning_fs
		}
		{
			action = select_options
			flow_state = coop_career_pause_options_fs
		}
		{
			action = select_quit
			flow_state = coop_career_quit_warning_fs
		}
		{
			action = select_debug_menu
			flow_state = debug_menu_fs
		}
	]
}
coop_career_pause_options_fs = {
	Create = create_pause_menu
	create_params = {
		for_options = 1
	}
	Destroy = destroy_pause_menu
	actions = [
		{
			action = select_audio_settings
			flow_state = coop_career_audio_settings_fs
		}
		{
			action = select_calibrate_lag
			flow_state = coop_career_calibrate_lag_warning
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
			flow_state = coop_career_lefty_flip_warning
		}
		{
			action = go_back
			flow_state = coop_career_pause_fs
		}
	]
}
coop_career_restart_warning_fs = {
	Create = create_restart_warning_menu
	Destroy = destroy_restart_warning_menu
	actions = [
		{
			action = Continue
			func = career_restart_song
			transition_screen = default_loading_screen
			flow_state = coop_career_play_song_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
coop_career_quit_warning_fs = {
	Create = create_quit_warning_menu
	Destroy = destroy_quit_warning_menu
	actions = [
		{
			action = Continue
			func = xenon_singleplayer_session_complete_uninit
			spawned_func
			flow_state = coop_career_song_ended_fs
		}
		{
			action = go_back
			flow_state = coop_career_pause_fs
		}
	]
}
coop_career_controller_settings_fs = {
	Create = create_controller_settings_menu
	create_params = {
		Popup = 1
	}
	Destroy = destroy_controller_settings_menu
	actions = [
		{
			action = select_lefty_flip
			flow_state = coop_career_controller_settings_lefty_flip_warning
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
			use_last_flow_state
		}
	]
}
coop_career_audio_settings_fs = {
	Create = create_audio_settings_menu
	create_params = {
		Popup = 1
	}
	Destroy = destroy_audio_settings_menu
	actions = [
		{
			action = Continue
			flow_state = coop_career_pause_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
coop_career_video_settings_fs = {
	Create = create_video_settings_menu
	create_params = {
		Popup = 1
	}
	Destroy = destroy_video_settings_menu
	actions = [
		{
			action = select_calibrate_lag
			flow_state = coop_career_calibrate_lag_warning
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
coop_career_lefty_flip_warning = {
	Create = create_lefty_flip_warning_menu
	Destroy = destroy_lefty_flip_warning_menu
	actions = [
		{
			action = Continue
			func = lefty_flip_func
			flow_state = coop_career_play_song_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
coop_career_controller_settings_lefty_flip_warning = {
	Create = create_lefty_flip_warning_menu
	Destroy = destroy_lefty_flip_warning_menu
	actions = [
		{
			action = Continue
			func = coop_career_lefty_flip_func
			flow_state = coop_career_play_song_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}

script coop_career_lefty_flip_func 
	GetGlobalTags \{user_options}
	Change StructureName = player1_status lefthanded_gems = <lefty_flip_p1>
	Change StructureName = player1_status lefthanded_button_ups = <lefty_flip_p1>
	Change StructureName = player2_status lefthanded_gems = <lefty_flip_p2>
	Change StructureName = player2_status lefthanded_button_ups = <lefty_flip_p2>
	career_restart_song
endscript
coop_career_calibrate_lag_warning = {
	Create = create_calibrate_lag_warning_menu
	Destroy = destroy_calibrate_lag_warning_menu
	actions = [
		{
			action = Continue
			flow_state = coop_career_calibrate_lag_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
coop_career_controller_settings_calibrate_lag_warning = {
	Create = create_calibrate_lag_warning_menu
	Destroy = destroy_calibrate_lag_warning_menu
	actions = [
		{
			action = Continue
			flow_state = coop_career_calibrate_lag_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
coop_career_calibrate_autosave_fs = {
	Create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			func = career_restart_song
			flow_state = coop_career_play_song_fs
		}
		{
			action = memcard_sequence_save_failed
			func = career_restart_song
			flow_state = coop_career_play_song_fs
		}
	]
}
coop_career_calibrate_lag_fs = {
	Create = create_calibrate_lag_menu
	Destroy = destroy_calibrate_lag_menu
	actions = [
		{
			action = Continue
			flow_state = coop_career_calibrate_autosave_fs
		}
		{
			action = go_back
			func = career_restart_song
			flow_state = coop_career_play_song_fs
		}
	]
}
coop_career_fail_song_fs = {
	Create = create_fail_song_menu
	Destroy = destroy_fail_song_menu
	actions = [
		{
			action = select_practice
			flow_state = coop_career_practice_warning_fs
		}
		{
			action = select_retry
			flow_state = coop_career_play_song_fs
		}
		{
			action = select_new_song
			flow_state_func = coop_career_autosave_or_setlist
		}
		{
			action = select_quit
			func = coop_career_fail_song_select_quit
			flow_state = main_menu_fs
		}
	]
}

script coop_career_fail_song_select_quit 
	Change \{StructureName = player1_status
		new_cash = 0}
	progression_push_current
	GH3_SFX_fail_song_stop_sounds
	kill_gem_scroller
endscript
coop_career_song_ended_fs = {
	Create = create_song_ended_menu
	Destroy = destroy_song_ended_menu
	actions = [
		{
			action = select_retry
			flow_state = coop_career_play_song_fs
		}
		{
			action = select_new_song
			flow_state_func = coop_career_autosave_or_setlist
		}
		{
			action = select_quit
			func = coop_career_song_ended_select_quit
			flow_state = main_menu_fs
		}
		{
			action = go_back
			flow_state = career_pause_fs
		}
	]
}

script coop_career_song_ended_select_quit 
	progression_push_current
	kill_gem_scroller
endscript
coop_career_practice_warning_fs = {
	Create = create_practice_warning_menu
	Destroy = destroy_practice_warning_menu
	actions = [
		{
			action = Continue
			func = coop_career_go_to_practice_setup
			flow_state = practice_select_song_section_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}

script coop_career_go_to_practice_setup 
	progression_push_current
	Change \{came_to_practice_from = coop_career}
	Change came_to_practice_difficulty = ($current_difficulty)
	Change came_to_practice_difficulty2 = ($current_difficulty2)
	kill_gem_scroller
	Change \{game_mode = training}
endscript
coop_career_newspaper_fs = {
	Create = create_newspaper_menu
	Destroy = destroy_newspaper_menu
	actions = [
		{
			action = Continue
			flow_state_func = coop_career_find_newspaper_successor
		}
		{
			action = try_again
			func = restart_song
			transition_screen = default_loading_screen
			flow_state = coop_career_play_song_fs
		}
		{
			action = select_detailed_stats
			flow_state = coop_career_detailed_stats_fs
			transition_right
		}
		{
			action = quit
			func = progression_push_current
			flow_state = main_menu_fs
		}
	]
}

script coop_career_find_newspaper_successor 
	unlock_guitar = ($progression_unlocked_guitar)
	sponsored = ($progression_got_sponsored_last_song)
	if ($player1_status.new_cash = 0)
		got_cash = 0
	else
		got_cash = 1
	endif
	if ($is_network_game)
		return \{flow_state = online_menu_fs}
	elseif NOT (<unlock_guitar> = -1)
		return \{flow_state = coop_career_unlock_1_fs}
	elseif (<sponsored>)
		return \{flow_state = coop_career_sponsored_fs}
	elseif (<got_cash>)
		return \{flow_state = coop_career_cash_reward_fs}
	else
		GetGlobalTags \{user_options}
		if (<autosave> = 1)
			return \{flow_state = coop_career_autosave_fs}
		else
			return \{flow_state = coop_career_setlist_fs}
		endif
	endif
endscript
coop_career_cash_reward_fs = {
	Create = create_cash_reward_menu
	Destroy = destroy_cash_reward_menu
	actions = [
		{
			action = Continue
			flow_state_func = coop_career_autosave_or_setlist
		}
	]
}
coop_career_autosave_fs = {
	Create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state_func = coop_career_autosave_venue_select
		}
		{
			action = memcard_sequence_save_failed
			flow_state_func = coop_career_autosave_venue_select
		}
	]
}

script coop_career_autosave_venue_select 
	if ($progression_unlock_tier_last_song = 1)
		Change \{progression_unlock_tier_last_song = 0}
		return \{flow_state = coop_career_select_venue_fs}
	else
		return \{flow_state = coop_career_setlist_fs}
	endif
endscript
coop_career_detailed_stats_fs = {
	Create = create_detailed_stats_menu
	Destroy = destroy_detailed_stats_menu
	actions = [
		{
			action = go_back
			flow_state = coop_career_newspaper_fs
			transition_left
		}
		{
			action = Continue
			flow_state_func = coop_career_find_newspaper_successor
		}
	]
}
coop_career_sponsored_fs = {
	Create = create_sponsored_menu
	Destroy = destroy_sponsored_menu
	actions = [
		{
			action = Continue
			flow_state_func = coop_career_autosave_or_setlist
		}
	]
}
coop_career_unlock_1_fs = {
	Create = create_unlock_menu
	Destroy = destroy_unlock_menu
	actions = [
		{
			action = Continue
			flow_state_func = find_coop_career_unlock_successor
			transition_right
		}
	]
}
coop_career_unlock_2_fs = {
	Create = create_unlock_menu
	Destroy = destroy_unlock_menu
	actions = [
		{
			action = Continue
			flow_state_func = find_coop_career_unlock_successor
			transition_right
		}
	]
}

script find_coop_career_unlock_successor 
	unlock_guitar = ($progression_unlocked_guitar)
	sponsored = ($progression_got_sponsored_last_song)
	if ($player1_status.new_cash = 0)
		got_cash = 0
	else
		got_cash = 1
	endif
	if NOT (<unlock_guitar> = -1)
		return \{flow_state = coop_career_unlock_2_fs}
	elseif (<sponsored> = 1)
		return \{flow_state = coop_career_sponsored_fs}
	elseif (<got_cash>)
		return \{flow_state = coop_career_cash_reward_fs}
	else
		GetGlobalTags \{user_options}
		if (<autosave> = 1)
			return \{flow_state = coop_career_autosave_fs}
		else
			return \{flow_state = coop_career_setlist_fs}
		endif
	endif
endscript
coop_career_encore_confirmation_fs = {
	Create = create_encore_confirmation_menu
	Destroy = destroy_encore_confirmation_menu
	actions = [
		{
			action = Continue
			func = start_encore
			flow_state = coop_career_play_song_fs
		}
		{
			action = quit
			func = kill_gem_scroller
			flow_state = coop_career_newspaper_fs
		}
	]
}
