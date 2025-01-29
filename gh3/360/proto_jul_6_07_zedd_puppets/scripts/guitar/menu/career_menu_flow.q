career_choose_band_fs = {
	create = create_choose_band_menu
	destroy = destroy_choose_band_menu
	actions = [
		{
			action = select_existing_band
			flow_state = career_select_difficulty_fs
		}
		{
			action = select_new_band
			flow_state = career_enter_band_name_fs
		}
		{
			action = go_back
			flow_state = main_menu_fs
		}
	]
}
career_enter_band_name_fs = {
	create = create_enter_band_name_menu
	destroy = destroy_enter_band_name_menu
	remove_focus = enter_band_name_remove_focus
	refocus = enter_band_name_refocus
	actions = [
		{
			action = enter_band_name
			flow_state = career_select_difficulty_fs
		}
		{
			action = enter_no_band
			flow_state = career_no_band_fs
		}
		{
			action = go_back
			flow_state_func = career_enter_band_name_flow_state_func
		}
	]
}

script career_enter_band_name_flow_state_func 
	get_current_first_play
	if (<first_play>)
		return \{flow_state = main_menu_fs}
	else
		return \{flow_state = career_choose_band_fs}
	endif
endscript

script get_current_first_play 
	get_band_game_mode_name
	formattext checksumname = bandname_id 'band%i_info_%g' i = ($current_band) g = <game_mode_name>
	getglobaltags <bandname_id>
	return first_play = <first_play>
endscript
career_no_band_fs = {
	create = create_no_band_menu
	destroy = destroy_no_band_menu
	popup
	actions = [
		{
			action = continue
			flow_state = career_enter_band_name_fs
		}
		{
			action = go_back
			flow_state = career_enter_band_name_fs
		}
	]
}
career_select_difficulty_fs = {
	create = create_select_difficulty_menu
	destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = continue
			flow_state_func = career_select_difficulty_flow_state_func
		}
		{
			action = go_back
			flow_state = career_choose_band_fs
		}
	]
}

script career_select_difficulty_flow_state_func 
	progression_pop_current
	if ($game_mode = p1_career)
		index = ($difficulty_list_props.($current_difficulty).index)
		setprogressiondifficulty difficulty = <index>
		deregisteratoms
		get_progression_globals game_mode = ($game_mode)
		if NOT (<progression_global> = none)
			registeratoms $<progression_global>
			updateatoms
		endif
	endif
	get_current_first_play
	if (<first_play>)
		return \{flow_state = career_select_character_fs}
	else
		return \{flow_state = career_character_hub_fs}
	endif
endscript
career_select_character_fs = {
	create = create_character_select_menu
	destroy = destroy_character_select_menu
	actions = [
		{
			action = continue
			flow_state = career_character_hub_fs
		}
		{
			action = go_back
			func = progression_push_current
			flow_state = career_select_difficulty_fs
		}
	]
}
career_character_hub_fs = {
	create = create_character_hub_menu
	destroy = destroy_character_hub_menu
	actions = [
		{
			action = select_play_show
			flow_state = career_select_venue_fs
		}
		{
			action = select_the_store
			func = set_store_came_from_p1_career
			flow_state = store_fs
		}
		{
			action = select_change_outfit
			flow_state = career_select_outfit_fs
		}
		{
			action = select_change_guitar
			flow_state = career_select_guitar_fs
		}
		{
			action = go_back
			flow_state = career_select_character_fs
		}
	]
}

script set_store_came_from_p1_career 
	change \{store_came_from = p1_career}
endscript
career_select_outfit_fs = {
	create = create_select_outfit_menu
	destroy = destroy_select_outfit_menu
	actions = [
		{
			action = select_character_hub
			flow_state = career_character_hub_fs
		}
		{
			action = select_select_style
			flow_state = career_select_style_fs
		}
		{
			action = go_back
			flow_state = career_character_hub_fs
		}
	]
}
career_select_style_fs = {
	create = create_select_style_menu
	destroy = destroy_select_style_menu
	actions = [
		{
			action = select_character_hub
			flow_state = career_character_hub_fs
		}
		{
			action = select_select_outfit
			flow_state = career_select_outfit_fs
		}
		{
			action = go_back
			flow_state = career_select_outfit_fs
		}
	]
}
career_select_guitar_fs = {
	create = create_select_guitar_menu
	destroy = destroy_select_guitar_menu
	actions = [
		{
			action = select_character_hub
			flow_state = career_character_hub_fs
		}
		{
			action = select_guitar_finish
			flow_state = career_select_guitar_finish_fs
		}
		{
			action = go_back
			flow_state = career_character_hub_fs
		}
	]
}
career_select_guitar_finish_fs = {
	create = create_select_guitar_finish_menu
	destroy = destroy_select_guitar_finish_menu
	actions = [
		{
			action = select_character_hub
			flow_state = career_character_hub_fs
		}
		{
			action = select_select_guitar
			flow_state = career_select_guitar_fs
		}
		{
			action = go_back
			flow_state = career_select_guitar_fs
		}
	]
}
career_select_venue_fs = {
	create = create_select_venue_menu
	destroy = destroy_select_venue_menu
	actions = [
		{
			action = continue
			flow_state = career_setlist_fs
		}
		{
		}
		{
			action = go_back
			flow_state = career_character_hub_fs
		}
	]
}
career_play_song_fs = {
	create = create_play_song_menu
	destroy = destroy_play_song_menu
	actions = [
		{
			action = pause_game
			flow_state = career_pause_fs
		}
		{
			action = preboss_win_song
			flow_state = career_battle_help_boss_confirmation_fs
		}
		{
			action = preencore_win_song
			flow_state = career_encore_confirmation_fs
		}
		{
			action = unlocktier_win_song
			flow_state = career_select_venue_fs
		}
		{
			action = win_song
			func = kill_gem_scroller
			flow_state_func = career_check_for_beat_game
		}
		{
			action = fail_song
			flow_state = career_fail_song_fs
		}
		{
			action = controller_disconnect
			flow_state = controller_disconnect_fs
		}
	]
}

script career_check_for_beat_game 
	if ($progression_beat_game_last_song = 1)
		return \{flow_state = career_beat_game_fs}
	else
		return \{flow_state = career_newspaper_fs}
	endif
endscript
career_beat_game_fs = {
	create = create_beat_game_menu
	destroy = destroy_beat_game_menu
	actions = [
		{
			action = continue
			flow_state = career_newspaper_fs
		}
	]
}
career_pause_fs = {
	create = create_pause_menu
	destroy = destroy_pause_menu
	actions = [
		{
			action = select_resume
			flow_state = career_play_song_fs
		}
		{
			action = select_restart
			flow_state = career_restart_warning_fs
		}
		{
			action = select_practice
			flow_state = career_practice_warning_fs
		}
		{
			action = select_options
			flow_state = career_pause_options_fs
		}
		{
			action = select_quit
			flow_state_func = end_credits_quit_fs_decider
		}
		{
			action = select_debug_menu
			flow_state = debug_menu_fs
		}
	]
}
career_pause_options_fs = {
	create = create_pause_menu
	create_params = {
		for_options = 1
	}
	destroy = destroy_pause_menu
	actions = [
		{
			action = select_audio_settings
			flow_state = career_audio_settings_fs
		}
		{
			action = select_calibrate_lag
			flow_state = career_calibrate_lag_warning
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
			flow_state = career_lefty_flip_warning
		}
		{
			action = go_back
			flow_state = career_pause_fs
		}
	]
}

script end_credits_quit_fs_decider 
	if ($end_credits = 1)
		change \{end_credits = 0}
		progression_endcredits_done
		career_song_ended_select_quit
		return \{flow_state = main_menu_fs}
	endif
	return \{flow_state = career_quit_warning_fs}
endscript
career_controller_settings_fs = {
	create = create_controller_settings_menu
	create_params = {
		popup = 1
	}
	destroy = destroy_controller_settings_menu
	actions = [
		{
			action = select_lefty_flip
			flow_state = career_lefty_flip_warning
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
			flow_state = career_pause_fs
		}
	]
}
career_audio_settings_fs = {
	create = create_audio_settings_menu
	create_params = {
		popup = 1
	}
	destroy = destroy_audio_settings_menu
	actions = [
		{
			action = continue
			flow_state = career_pause_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
career_video_settings_fs = {
	create = create_video_settings_menu
	create_params = {
		popup = 1
	}
	destroy = destroy_video_settings_menu
	actions = [
		{
			action = select_calibrate_lag
			flow_state = career_calibrate_lag_warning
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
career_lefty_flip_warning = {
	create = create_lefty_flip_warning_menu
	destroy = destroy_lefty_flip_warning_menu
	actions = [
		{
			action = continue
			func = lefty_flip_func
			flow_state = career_play_song_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}

script lefty_flip_func 
	getglobaltags \{user_options}
	change structurename = player1_status lefthanded_gems = <lefty_flip_p1>
	change structurename = player1_status lefthanded_button_ups = <lefty_flip_p1>
	if (<lefty_flip_p1>)
		change \{pad_event_up_inversion = true}
	else
		change \{pad_event_up_inversion = false}
	endif
	change structurename = player2_status lefthanded_gems = <lefty_flip_p2>
	change structurename = player2_status lefthanded_button_ups = <lefty_flip_p2>
	restart_song
endscript
career_calibrate_lag_warning = {
	create = create_calibrate_lag_warning_menu
	destroy = destroy_calibrate_lag_warning_menu
	actions = [
		{
			action = continue
			flow_state = career_calibrate_lag_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
career_controller_settings_calibrate_lag_warning = {
	create = create_calibrate_lag_warning_menu
	destroy = destroy_calibrate_lag_warning_menu
	actions = [
		{
			action = continue
			flow_state = career_calibrate_lag_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
career_calibrate_autosave_fs = {
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			func = restart_song
			flow_state = career_play_song_fs
		}
		{
			action = memcard_sequence_save_failed
			func = restart_song
			flow_state = career_play_song_fs
		}
	]
}
career_calibrate_lag_fs = {
	create = create_calibrate_lag_menu
	destroy = destroy_calibrate_lag_menu
	actions = [
		{
			action = continue
			flow_state = career_calibrate_autosave_fs
		}
		{
			action = go_back
			func = restart_song
			flow_state = career_play_song_fs
		}
	]
}
career_fail_song_fs = {
	create = create_fail_song_menu
	destroy = destroy_fail_song_menu
	actions = [
		{
			action = select_practice
			flow_state = career_practice_warning_fs
		}
		{
			action = select_retry
			flow_state = career_play_song_fs
		}
		{
			action = select_new_song
			func = kill_gem_scroller
			flow_state = career_setlist_fs
		}
		{
			action = select_quit
			func = career_fail_song_select_quit
			flow_state = main_menu_fs
		}
	]
}

script career_fail_song_select_quit 
	change \{structurename = player1_status
		new_cash = 0}
	progression_push_current
	kill_gem_scroller
endscript
career_song_ended_fs = {
	create = create_song_ended_menu
	destroy = destroy_song_ended_menu
	actions = [
		{
			action = select_retry
			flow_state = career_play_song_fs
		}
		{
			action = select_new_song
			func = kill_gem_scroller
			flow_state = career_setlist_fs
		}
		{
			action = select_quit
			func = career_song_ended_select_quit
			flow_state = main_menu_fs
		}
	]
}

script career_end_credits_quit 
	if ($end_credits = 1)
		progression_push_current
		kill_gem_scroller
	endif
endscript

script career_song_ended_select_quit 
	progression_push_current
	kill_gem_scroller
endscript
career_restart_warning_fs = {
	create = create_restart_warning_menu
	destroy = destroy_restart_warning_menu
	actions = [
		{
			action = continue
			func = restart_song
			transition_screen = default_loading_screen
			flow_state = career_play_song_fs
		}
		{
			action = go_back
			flow_state = career_pause_fs
		}
	]
}
career_quit_warning_fs = {
	create = create_quit_warning_menu
	destroy = destroy_quit_warning_menu
	actions = [
		{
			action = continue
			flow_state = career_song_ended_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
career_practice_warning_fs = {
	create = create_practice_warning_menu
	destroy = destroy_practice_warning_menu
	actions = [
		{
			action = continue
			func = career_go_to_practice_setup
			flow_state = practice_select_song_section_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}

script career_go_to_practice_setup 
	change \{came_to_practice_from = career}
	kill_gem_scroller
endscript
career_newspaper_fs = {
	create = create_newspaper_menu
	destroy = destroy_newspaper_menu
	actions = [
		{
			action = continue
			flow_state_func = career_find_newspaper_successor
		}
		{
			action = try_again
			func = restart_song
			transition_screen = default_loading_screen
			flow_state = career_play_song_fs
		}
		{
			action = select_detailed_stats
			flow_state = career_detailed_stats_fs
		}
		{
			action = quit
			func = progression_push_current
			flow_state = main_menu_fs
		}
	]
}

script career_find_newspaper_successor 
	0xd9336f5a = ($0x9e3cac10)
	0x3b15d0a4 = ($0xdadf8510)
	sponsored = ($progression_got_sponsored_last_song)
	if ($player1_status.new_cash = 0)
		got_cash = 0
	else
		got_cash = 1
	endif
	if ($is_network_game)
		return flow_state = online_menu_fs
	elseif (<0xd9336f5a>)
		return flow_state = career_unlock_1_fs
	elseif (<0x3b15d0a4>)
		change 0xdadf8510 = 0
		return flow_state = career_unlock_1_fs
	elseif (<sponsored>)
		return flow_state = career_sponsored_fs
	elseif (<got_cash>)
		return flow_state = career_cash_reward_fs
	else
		getglobaltags user_options
		if (<autosave> = 1)
			return flow_state = career_autosave_fs
		else
			return flow_state = career_setlist_fs
		endif
	endif
endscript
career_cash_reward_fs = {
	create = create_cash_reward_menu
	destroy = destroy_cash_reward_menu
	actions = [
		{
			action = continue
			flow_state_func = career_autosave_or_setlist
		}
	]
}

script career_autosave_or_setlist 
	if ($progression_play_completion_movie = 1)
		get_progression_globals game_mode = ($game_mode)
		formattext checksumname = tiername 'tier%i' i = ($progression_completion_tier)
		if structurecontains structure = ($<tier_global>.<tiername>) completion_movie
			menu_music_off
			playmovieandwait movie = ($<tier_global>.<tiername>.completion_movie)
		endif
		change progression_play_completion_movie = 0
	endif
	getglobaltags user_options
	if (<autosave> = 1)
		return flow_state = career_autosave_fs
	else
		if ($progression_unlock_tier_last_song = 1)
			return flow_state = career_select_venue_fs
		else
			return flow_state = career_setlist_fs
		endif
	endif
endscript
career_autosave_fs = {
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state_func = career_autosave_venue_select
		}
		{
			action = memcard_sequence_save_failed
			flow_state_func = career_autosave_venue_select
		}
	]
}

script career_autosave_venue_select 
	if ($progression_unlock_tier_last_song = 1)
		return \{flow_state = career_select_venue_fs}
	else
		return \{flow_state = career_setlist_fs}
	endif
endscript
career_detailed_stats_fs = {
	create = create_detailed_stats_menu
	destroy = destroy_detailed_stats_menu
	actions = [
		{
			action = go_back
			flow_state = career_newspaper_fs
		}
		{
			action = continue
			flow_state = career_newspaper_fs
		}
	]
}
career_sponsored_fs = {
	create = create_sponsored_menu
	destroy = destroy_sponsored_menu
	actions = [
		{
			action = continue
			flow_state_func = career_autosave_or_setlist
		}
	]
}
career_unlock_1_fs = {
	create = create_unlock_menu
	destroy = destroy_unlock_menu
	actions = [
		{
			action = continue
			flow_state_func = find_career_unlock_successor
		}
	]
}
career_unlock_2_fs = {
	create = create_unlock_menu
	destroy = destroy_unlock_menu
	actions = [
		{
			action = continue
			flow_state_func = find_career_unlock_successor
		}
	]
}

script find_career_unlock_successor 
	0xd5f55aab = ($0xdadf8510)
	sponsored = ($progression_got_sponsored_last_song)
	if ($player1_status.new_cash = 0)
		got_cash = 0
	else
		got_cash = 1
	endif
	if (<0xd5f55aab>)
		change 0xdadf8510 = 0
		change progression_unlocked_guitar = ($progression_unlocked_guitar2)
		return flow_state = career_unlock_2_fs
	elseif (<sponsored> = 1)
		return flow_state = career_sponsored_fs
	elseif (<got_cash>)
		return flow_state = career_cash_reward_fs
	else
		getglobaltags user_options
		if (<autosave> = 1)
			return flow_state = career_autosave_fs
		else
			return flow_state = career_setlist_fs
		endif
	endif
endscript
career_encore_confirmation_fs = {
	create = create_encore_confirmation_menu
	destroy = destroy_encore_confirmation_menu
	actions = [
		{
			action = continue
			func = start_encore
			flow_state = career_play_song_fs
		}
		{
			action = quit
			func = kill_gem_scroller
			flow_state = career_newspaper_fs
		}
	]
}
career_setlist_fs = {
	create = create_setlist_menu
	destroy = destroy_setlist_menu
	actions = [
		{
			action = continue
			transition_screen = default_loading_screen
			func = start_song
			flow_state = career_play_song_fs
		}
		{
			action = show_help
			flow_state = career_battle_help_fs
		}
		{
			action = go_back
			flow_state = career_select_venue_fs
		}
	]
}
career_battle_help_fs = {
	create = create_battle_helper_menu
	destroy = destroy_battle_helper_menu
	actions = [
		{
			action = continue
			func = start_song
			transition_screen = default_loading_screen
			flow_state = career_play_song_fs
		}
		{
			action = go_back
			flow_state = career_setlist_fs
		}
	]
}

script start_encore 
	kill_start_key_binding
	create_loading_screen \{mode = play_encore}
	change \{current_transition = encore}
	getglobaltags \{progression
		params = encore_song}
	setglobaltags progression params = {current_tier = <next_tier>}
	setglobaltags progression params = {current_song_count = <next_song_count>}
	restart_gem_scroller song_name = <encore_song> difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($current_starttime) device_num = ($player1_status.controller)
endscript
default_loading_screen = {
	create = create_loading_screen
	destroy = destroy_loading_screen
}
career_battle_help_boss_confirmation_fs = {
	create = create_battle_helper_menu
	create_params = {
		popup = 1
	}
	destroy = destroy_battle_helper_menu
	actions = [
		{
			action = continue
			func = start_boss
			flow_state = career_play_song_fs
		}
		{
			action = go_back
			func = kill_gem_scroller
			flow_state = career_newspaper_fs
		}
	]
}

script start_boss 
	kill_start_key_binding
	create_loading_screen mode = play_boss
	if ($is_demo_mode = 1)
		change current_transition = fastintro
	else
		change current_transition = boss
	endif
	getglobaltags progression params = boss_song
	setglobaltags progression params = {current_tier = <next_tier>}
	setglobaltags progression params = {current_song_count = <next_song_count>}
	change boss_battle = 1
	change current_num_players = 2
	restart_gem_scroller song_name = <boss_song> difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($current_starttime) device_num = ($player1_status.controller)
endscript

script get_current_battle_first_play 
	get_band_game_mode_name
	formattext checksumname = bandname_id 'band%i_info_%g' i = ($current_band) g = <game_mode_name>
	getglobaltags <bandname_id>
	return first_battle_play = <first_battle_play>
endscript

script set_current_battle_first_play \{first_play = 0}
	get_band_game_mode_name
	formattext checksumname = bandname_id 'band%i_info_%g' i = ($current_band) g = <game_mode_name>
	setglobaltags <bandname_id> params = {first_battle_play = <first_play>}
	getglobaltags <bandname_id>
endscript
