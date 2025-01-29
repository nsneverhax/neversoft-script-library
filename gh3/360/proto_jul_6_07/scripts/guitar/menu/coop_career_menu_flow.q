coop_career_select_controllers_fs = {
	create = create_select_controller_menu
	destroy = destroy_select_controller_menu
	actions = [
		{
			action = continue
			flow_state_func = coop_career_select_controller_flow_state_func
		}
		{
			action = go_back
			flow_state = main_menu_fs
		}
	]
}

script coop_career_select_controller_flow_state_func 
	main_menu_get_any_band_names_exist
	if (<name_exists> = 0)
		return \{flow_state = coop_career_enter_band_name_fs}
	else
		return \{flow_state = coop_career_choose_band_fs}
	endif
endscript
coop_career_choose_band_fs = {
	create = create_choose_band_menu
	destroy = destroy_choose_band_menu
	actions = [
		{
			action = select_existing_band
			flow_state = coop_career_select_difficulty_fs
		}
		{
			action = select_new_band
			flow_state = coop_career_enter_band_name_fs
		}
		{
			action = go_back
			flow_state = coop_career_select_controllers_fs
		}
	]
}
coop_career_enter_band_name_fs = {
	create = create_enter_band_name_menu
	destroy = destroy_enter_band_name_menu
	remove_focus = enter_band_name_remove_focus
	refocus = enter_band_name_refocus
	actions = [
		{
			action = enter_band_name
			flow_state = coop_career_select_difficulty_fs
		}
		{
			action = enter_no_band
			flow_state = coop_career_no_band_fs
		}
		{
			action = go_back
			flow_state_func = coop_career_enter_band_name_flow_state_func
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
	create = create_no_band_menu
	destroy = destroy_no_band_menu
	popup
	actions = [
		{
			action = continue
			flow_state = coop_career_enter_band_name_fs
		}
		{
			action = go_back
			flow_state = coop_career_enter_band_name_fs
		}
	]
}
coop_career_select_difficulty_fs = {
	create = create_select_difficulty_menu
	destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = continue
			flow_state_func = coop_career_select_difficulty_flow_state_func
		}
		{
			action = go_back
			flow_state = coop_career_choose_band_fs
		}
	]
}

script coop_career_select_difficulty_flow_state_func 
	progression_pop_current
	if ($game_mode = p2_career)
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
		return \{flow_state = coop_career_split_off_flow_for_character_select_fs}
	else
		return \{flow_state = coop_career_split_off_flow_for_character_hub_fs}
	endif
endscript
coop_career_split_off_flow_for_character_select_fs = {
	create = create_coop_split_off_flow_for_character_select
	actions = [
		{
			action = continue
			flow_state = coop_career_character_select_fs
		}
	]
}

script create_coop_split_off_flow_for_character_select 
	ui_flow_manager_respond_to_action \{action = continue
		create_params = {
			player = 1
		}}
	if ($current_num_players = 2)
		start_flow_manager \{flow_state = coop_career_character_select_fs
			player = 2
			create_params = {
				player = 2
			}}
	endif
endscript
coop_career_character_select_fs = {
	create = create_character_select_menu
	destroy = destroy_character_select_menu
	actions = [
		{
			action = continue
			flow_state = coop_career_character_hub_fs
		}
		{
			action = go_back
			func = progression_push_current
			flow_state = coop_career_select_difficulty_fs
		}
	]
}
coop_career_split_off_flow_for_character_hub_fs = {
	create = create_coop_split_off_flow_for_character_hub
	actions = [
		{
			action = continue
			flow_state = coop_career_character_hub_fs
		}
	]
}

script create_coop_split_off_flow_for_character_hub 
	ui_flow_manager_respond_to_action \{action = continue
		create_params = {
			player = 1
		}}
	if ($current_num_players = 2)
		start_flow_manager \{flow_state = coop_career_character_hub_fs
			player = 2
			create_params = {
				player = 2
			}}
	endif
endscript
coop_career_character_hub_fs = {
	create = create_character_hub_menu
	destroy = destroy_character_hub_menu
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
			action = select_the_store
			func = set_store_came_from_p2_career
			transition_screen = default_loading_screen
			flow_state = store_fs
		}
		{
			action = go_back
			flow_state_func = find_coop_career_character_hub_ancestor
		}
	]
}

script set_store_came_from_p2_career 
	change \{store_came_from = p2_career}
endscript

script find_coop_career_character_hub_ancestor 
	return \{flow_state = coop_career_character_select_fs}
endscript
coop_career_select_outfit_fs = {
	create = create_select_outfit_menu
	destroy = destroy_select_outfit_menu
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
	create = create_select_style_menu
	destroy = destroy_select_style_menu
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
	create = create_select_guitar_menu
	destroy = destroy_select_guitar_menu
	actions = [
		{
			action = select_character_hub
			flow_state = coop_career_character_hub_fs
		}
		{
			action = continue
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
	create = create_select_guitar_finish_menu
	destroy = destroy_select_guitar_finish_menu
	actions = [
		{
			action = continue
			flow_state = coop_career_select_guitar
		}
		{
			action = go_back
			flow_state = coop_career_select_guitar
		}
	]
}
coop_career_select_venue_fs = {
	create = create_select_venue_menu
	destroy = destroy_select_venue_menu
	actions = [
		{
			action = continue
			flow_state = coop_career_setlist_fs
		}
		{
			action = go_back
			flow_state = coop_career_split_off_flow_for_character_hub_fs
		}
	]
}
coop_career_setlist_fs = {
	create = create_setlist_menu
	destroy = destroy_setlist_menu
	actions = [
		{
			action = continue
			flow_state = coop_career_choose_part_fs
		}
		{
			action = go_back
			flow_state = coop_career_select_venue_fs
		}
	]
}
coop_career_choose_part_fs = {
	create = create_choose_part_menu
	destroy = destroy_choose_part_menu
	actions = [
		{
			action = continue
			func = start_song
			transition_screen = default_loading_screen
			flow_state = coop_career_play_song_fs
		}
		{
			action = go_back
			flow_state = coop_career_setlist_fs
		}
	]
}
coop_career_play_song_fs = {
	create = create_play_song_menu
	destroy = destroy_play_song_menu
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
	create = create_beat_game_menu
	destroy = destroy_beat_game_menu
	actions = [
		{
			action = continue
			flow_state = coop_career_newspaper_fs
		}
	]
}
coop_career_pause_fs = {
	create = create_pause_menu
	destroy = destroy_pause_menu
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
	create = create_pause_menu
	create_params = {
		for_options = 1
	}
	destroy = destroy_pause_menu
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
	create = create_restart_warning_menu
	destroy = destroy_restart_warning_menu
	actions = [
		{
			action = continue
			func = restart_song
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
	create = create_quit_warning_menu
	destroy = destroy_quit_warning_menu
	actions = [
		{
			action = continue
			flow_state = coop_career_song_ended_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
coop_career_controller_settings_fs = {
	create = create_controller_settings_menu
	create_params = {
		popup = 1
	}
	destroy = destroy_controller_settings_menu
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
	create = create_audio_settings_menu
	create_params = {
		popup = 1
	}
	destroy = destroy_audio_settings_menu
	actions = [
		{
			action = continue
			flow_state = coop_career_pause_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
coop_career_video_settings_fs = {
	create = create_video_settings_menu
	create_params = {
		popup = 1
	}
	destroy = destroy_video_settings_menu
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
	create = create_lefty_flip_warning_menu
	destroy = destroy_lefty_flip_warning_menu
	actions = [
		{
			action = continue
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
	create = create_lefty_flip_warning_menu
	destroy = destroy_lefty_flip_warning_menu
	actions = [
		{
			action = continue
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
	getglobaltags \{user_options}
	change structurename = player1_status lefthanded_gems = <lefty_flip_p1>
	change structurename = player1_status lefthanded_button_ups = <lefty_flip_p1>
	change structurename = player2_status lefthanded_gems = <lefty_flip_p2>
	change structurename = player2_status lefthanded_button_ups = <lefty_flip_p2>
	restart_song
endscript
coop_career_calibrate_lag_warning = {
	create = create_calibrate_lag_warning_menu
	destroy = destroy_calibrate_lag_warning_menu
	actions = [
		{
			action = continue
			flow_state = coop_career_calibrate_lag_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
coop_career_controller_settings_calibrate_lag_warning = {
	create = create_calibrate_lag_warning_menu
	destroy = destroy_calibrate_lag_warning_menu
	actions = [
		{
			action = continue
			flow_state = coop_career_calibrate_lag_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}
coop_career_calibrate_autosave_fs = {
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			func = restart_song
			flow_state = coop_career_play_song_fs
		}
		{
			action = memcard_sequence_save_failed
			func = restart_song
			flow_state = coop_career_play_song_fs
		}
	]
}
coop_career_calibrate_lag_fs = {
	create = create_calibrate_lag_menu
	destroy = destroy_calibrate_lag_menu
	actions = [
		{
			action = continue
			flow_state = coop_career_calibrate_autosave_fs
		}
		{
			action = go_back
			func = restart_song
			flow_state = coop_career_play_song_fs
		}
	]
}
coop_career_fail_song_fs = {
	create = create_fail_song_menu
	destroy = destroy_fail_song_menu
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
			func = kill_gem_scroller
			flow_state = coop_career_setlist_fs
		}
		{
			action = select_quit
			func = coop_career_fail_song_select_quit
			flow_state = main_menu_fs
		}
	]
}

script coop_career_fail_song_select_quit 
	progression_push_current
	kill_gem_scroller
endscript
coop_career_song_ended_fs = {
	create = create_song_ended_menu
	destroy = destroy_song_ended_menu
	actions = [
		{
			action = select_retry
			flow_state = coop_career_play_song_fs
		}
		{
			action = select_new_song
			func = kill_gem_scroller
			flow_state = coop_career_setlist_fs
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
	create = create_practice_warning_menu
	destroy = destroy_practice_warning_menu
	actions = [
		{
			action = continue
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
	change \{came_to_practice_from = coop_career}
	kill_gem_scroller
endscript
coop_career_newspaper_fs = {
	create = create_newspaper_menu
	destroy = destroy_newspaper_menu
	actions = [
		{
			action = continue
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
		}
		{
			action = quit
			func = progression_push_current
			flow_state = main_menu_fs
		}
	]
}

script coop_career_find_newspaper_successor 
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
		return flow_state = coop_career_unlock_1_fs
	elseif (<0x3b15d0a4>)
		change 0xdadf8510 = 0
		return flow_state = coop_career_unlock_1_fs
	elseif (<sponsored>)
		return flow_state = coop_career_sponsored_fs
	elseif (<got_cash>)
		return flow_state = coop_career_cash_reward_fs
	else
		getglobaltags user_options
		if (<autosave> = 1)
			return flow_state = coop_career_autosave_fs
		else
			return flow_state = coop_career_setlist_fs
		endif
	endif
endscript
coop_career_cash_reward_fs = {
	create = create_cash_reward_menu
	destroy = destroy_cash_reward_menu
	actions = [
		{
			action = continue
			flow_state_func = coop_career_autosave_or_setlist
		}
	]
}

script coop_career_autosave_or_setlist 
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
		return flow_state = coop_career_autosave_fs
	else
		if ($progression_unlock_tier_last_song = 1)
			return flow_state = coop_career_select_venue_fs
		else
			return flow_state = coop_career_setlist_fs
		endif
	endif
endscript
coop_career_autosave_fs = {
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
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
		return \{flow_state = coop_career_select_venue_fs}
	else
		return \{flow_state = coop_career_setlist_fs}
	endif
endscript
coop_career_detailed_stats_fs = {
	create = create_detailed_stats_menu
	destroy = destroy_detailed_stats_menu
	actions = [
		{
			action = go_back
			flow_state = coop_career_newspaper_fs
		}
		{
			action = continue
			flow_state = coop_career_newspaper_fs
		}
	]
}
coop_career_sponsored_fs = {
	create = create_sponsored_menu
	destroy = destroy_sponsored_menu
	actions = [
		{
			action = continue
			flow_state_func = coop_career_autosave_or_setlist
		}
	]
}
coop_career_unlock_1_fs = {
	create = create_unlock_menu
	destroy = destroy_unlock_menu
	actions = [
		{
			action = continue
			flow_state_func = find_coop_career_unlock_successor
		}
	]
}
coop_career_unlock_2_fs = {
	create = create_unlock_menu
	destroy = destroy_unlock_menu
	actions = [
		{
			action = continue
			flow_state_func = find_coop_career_unlock_successor
		}
	]
}

script find_coop_career_unlock_successor 
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
		return flow_state = coop_career_unlock_2_fs
	elseif (<sponsored> = 1)
		return flow_state = coop_career_sponsored_fs
	elseif (<got_cash>)
		return flow_state = coop_career_cash_reward_fs
	else
		getglobaltags user_options
		if (<autosave> = 1)
			return flow_state = coop_career_autosave_fs
		else
			return flow_state = coop_career_setlist_fs
		endif
	endif
endscript
coop_career_encore_confirmation_fs = {
	create = create_encore_confirmation_menu
	destroy = destroy_encore_confirmation_menu
	actions = [
		{
			action = continue
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
