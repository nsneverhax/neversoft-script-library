options_select_option_fs = {
	create = create_options_menu
	destroy = destroy_options_menu
	actions = [
		{
			action = select_audio_settings
			flow_state = options_audio_settings_fs
			transition_right
		}
		{
			action = select_calibrate_lag
			flow_state = options_calibrate_lag_fs
			func = setup_calibration_lag_none
			transition_right
		}
		{
			action = select_controller_settings
			flow_state = options_controller_settings_fs
			transition_right
		}
		{
			action = select_manage_band
			flow_state = options_choose_band_fs
			transition_right
		}
		{
			action = select_data_settings
			flow_state = options_data_settings_fs
			transition_right
		}
		{
			action = select_bonus_videos
			flow_state = options_bonus_videos_fs
			transition_right
		}
		{
			action = select_credits
			flow_state = options_credits_fs
			transition_right
		}
		{
			action = select_store
			flow_state = options_choose_band_for_store_fs
			transition_right
		}
		{
			action = select_top_rockers
			flow_state = options_top_rockers_select_mode_fs
			transition_right
		}
		{
			action = select_cheats
			flow_state = options_cheats_fs
			transition_right
		}
		{
			action = go_back
			flow_state = main_menu_fs
			transition_left
		}
	]
}
options_audio_settings_fs = {
	create = create_audio_settings_menu
	destroy = destroy_audio_settings_menu
	actions = [
		{
			action = go_back
			flow_state = options_select_option_fs
			transition_left
		}
	]
}
options_controller_settings_fs = {
	create = create_controller_settings_menu
	destroy = destroy_controller_settings_menu
	actions = [
		{
			action = select_calibrate_whammy_bar
			flow_state = calibrate_whammy_bar_from_main_options_fs
			transition_right
		}
		{
			action = select_calibrate_star_power_trigger
			flow_state = calibrate_star_power_trigger_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_select_option_fs
			transition_left
		}
	]
}
calibrate_whammy_bar_fs = {
	create = create_whammy_bar_calibration_menu
	destroy = destroy_whammy_bar_calibration_menu
	actions = [
		{
			action = go_back
			use_last_flow_state
		}
	]
}
calibrate_whammy_bar_from_main_options_fs = {
	create = create_whammy_bar_calibration_menu
	destroy = destroy_whammy_bar_calibration_menu
	actions = [
		{
			action = go_back
			use_last_flow_state
			transition_left
		}
	]
}
calibrate_star_power_trigger_fs = {
	create = create_star_power_trigger_calibration_menu
	destroy = destroy_star_power_trigger_calibration_menu
	actions = [
		{
			action = go_back
			use_last_flow_state
			transition_left
		}
	]
}
options_autosave_fs = {
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state_func = check_autosave_for_sign_out
		}
		{
			action = memcard_sequence_save_failed
			flow_state = options_select_option_fs
			transition_left
		}
	]
}

script check_autosave_for_sign_out 
	if scriptisrunning \{sysnotify_handle_signin_change}
		return \{flow_state = null_flow_state}
	else
		return \{flow_state = options_select_option_fs}
	endif
endscript

script setup_calibrate_lag_audio_test 
	change \{calibrate_lag_section = audio}
endscript

script setup_calibrate_lag_video_test 
	change \{calibrate_lag_section = video}
endscript

script setup_calibration_lag_dialog_1 
	change \{calibrate_lag_section = dialog_1}
endscript

script setup_calibration_lag_dialog_2 
	change \{calibrate_lag_section = dialog_2}
endscript

script setup_calibration_lag_none 
	change \{calibrate_lag_section = none}
endscript

script calibrate_lag_dialog_where_to_go 
	fs = none
	if ($calibrate_lag_most_recent_in_game_setting = 0)
		<fs> = options_calibrate_lag_fs
	else
		switch ($game_mode)
			case p1_career
			<fs> = career_calibrate_lag_fs
			case p2_career
			if ($coop_dlc_active = 1)
				<fs> = mp_faceoff_calibrate_lag_fs
			else
				<fs> = coop_career_calibrate_lag_fs
			endif
			case p1_quickplay
			<fs> = quickplay_calibrate_lag_fs
			case p2_quickplay
			<fs> = coop_quickplay_calibrate_lag_fs
			case p2_faceoff
			case p2_pro_faceoff
			case p2_battle
			<fs> = mp_faceoff_calibrate_lag_fs
			case training
			<fs> = practice_calibrate_lag_fs
		endswitch
	endif
	return flow_state = <fs>
endscript
options_calibrate_lag_dialog_1_fs = {
	create = create_calibrate_lag_dialog_menu
	create_params = {
		title_text = "AUDIO TEST"
		body_text = "First, we will do an audio only calibration. Just strum to the beat of the clicks. Try to make your strum bar click at exactly the same time as the audio click."
		dialog_1
	}
	destroy = destroy_calibrate_lag_dialog_menu
	actions = [
		{
			action = continue
			flow_state_func = calibrate_lag_dialog_where_to_go
			func = setup_calibrate_lag_audio_test
		}
	]
}
options_calibrate_lag_dialog_2_fs = {
	create = create_calibrate_lag_dialog_menu
	create_params = {
		title_text = "VIDEO TEST"
		body_text = "Next, we will do a video only calibration test. Try to strum when the circles line up perfectly with the target."
		dialog_2
	}
	destroy = destroy_calibrate_lag_dialog_menu
	actions = [
		{
			action = continue
			flow_state_func = calibrate_lag_dialog_where_to_go
			func = setup_calibrate_lag_video_test
		}
	]
}
options_calibrate_lag_fs = {
	create = create_calibrate_lag_menu
	create_params = {
		from_in_game = 0
	}
	destroy = destroy_calibrate_lag_menu
	actions = [
		{
			action = continue
			flow_state = options_autosave_fs
		}
		{
			action = go_back
			flow_state = options_select_option_fs
			transition_left
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
options_choose_band_fs = {
	create = create_choose_band_menu
	destroy = destroy_choose_band_menu
	actions = [
		{
			action = select_new_band
			flow_state = options_enter_band_name_fs
			transition_right
		}
		{
			action = select_existing_band
			flow_state = options_manage_band_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_select_option_fs
			transition_left
		}
	]
}
options_manage_band_fs = {
	create = create_manage_band_menu
	destroy = destroy_manage_band_menu
	actions = [
		{
			action = select_rename_band
			flow_state = options_enter_band_name_for_manage_band_fs
			transition_right
		}
		{
			action = select_delete_band
			flow_state = options_confirm_band_delete_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_choose_band_fs
			transition_left
		}
	]
}
options_enter_band_name_for_manage_band_fs = {
	create = create_enter_band_name_menu
	destroy = destroy_enter_band_name_menu
	actions = [
		{
			action = enter_band_name
			flow_state = options_manage_band_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_manage_band_fs
			transition_left
		}
		{
			action = enter_band_name_for_manage_band
			flow_state = options_manage_band_fs
			transition_right
		}
	]
}
options_confirm_band_delete_fs = {
	create = create_confirm_band_delete_menu
	destroy = destroy_confirm_band_delete_menu
	popup
	actions = [
		{
			action = continue
			flow_state_func = options_confirm_band_delete_where_to_go
		}
		{
			action = go_back
			flow_state = options_manage_band_fs
			transition_left
		}
	]
}

script options_confirm_band_delete_where_to_go 
	getglobaltags \{user_options}
	if (<autosave> = 1)
		return \{flow_state = options_delete_band_autosave_fs}
	else
		return \{flow_state = options_choose_band_fs}
	endif
endscript
options_delete_band_autosave_fs = {
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = options_choose_band_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = options_choose_band_fs
		}
	]
}
options_data_settings_fs = {
	create = create_data_settings_menu
	destroy = destroy_data_settings_menu
	actions = [
		{
			action = select_save_game
			flow_state = options_save_fs
		}
		{
			action = select_load_game
			flow_state = options_load_fs
		}
		{
			action = go_back
			flow_state = options_select_option_fs
			transition_left
		}
	]
}
options_save_fs = {
	create = memcard_sequence_begin_save
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = options_data_settings_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = options_data_settings_fs
		}
	]
}
options_load_fs = {
	create = memcard_sequence_begin_load
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_load_success
			flow_state = options_data_settings_fs
		}
		{
			action = memcard_sequence_load_failed
			flow_state = options_data_settings_fs
		}
	]
}
options_bonus_videos_fs = {
	create = create_bonus_videos_menu
	destroy = destroy_bonus_videos_menu
	actions = [
		{
			action = continue
			flow_state = options_video_play_state_fs
			transition_right
		}
		{
			action = select_credits
			flow_state = options_credits_fs
		}
		{
			action = go_back
			flow_state = options_select_option_fs
			transition_left
		}
	]
}
options_video_play_state_fs = {
	create = on_options_video_play
	destroy = end_options_video_play
	actions = [
		{
			action = continue
			flow_state = options_bonus_videos_fs
		}
		{
			action = go_back
			flow_state = options_bonus_videos_fs
		}
	]
}
options_credits_fs = {
	create = create_credits_menu
	destroy = destroy_credits_menu
	actions = [
		{
			action = continue
			flow_state = options_bonus_videos_fs
		}
		{
			action = go_back
			flow_state = options_bonus_videos_fs
		}
	]
}
top_rockers_which_mode = p1_quickplay

script setup_top_rockers_single 
	change \{top_rockers_which_mode = p1_quickplay}
	change \{game_mode = p1_quickplay}
	change \{current_num_players = 1}
endscript

script setup_top_rockers_coop 
	change \{top_rockers_which_mode = p2_quickplay}
	change \{game_mode = p1_quickplay}
	change \{current_num_players = 1}
endscript
options_top_rockers_select_mode_fs = {
	create = create_select_quickplay_mode
	actions = [
		{
			action = select_p1_quickplay
			flow_state = options_top_rockers_difficulty_select_fs
			func = setup_top_rockers_single
		}
		{
			action = select_p2_quickplay
			flow_state = options_top_rockers_difficulty_select_fs
			func = setup_top_rockers_coop
		}
		{
			action = go_back
			func = destroy_select_quickplay_mode
			flow_state = options_select_option_fs
			transition_left
		}
	]
}

script setup_top_rockers_for_mode 
	change game_mode = ($top_rockers_which_mode)
	change current_difficulty_coop = ($current_difficulty)
	if ($game_mode = p1_quickplay)
		change \{current_num_players = 1}
	elseif ($game_mode = p2_quickplay)
		change \{current_num_players = 2}
		change \{g_top_rockers_setlist = 1}
	endif
	destroy_select_quickplay_mode
endscript
options_top_rockers_difficulty_select_fs = {
	create = mqsm_focus_difficulty_menu
	destroy = mqsm_unfocus_difficulty_menu
	actions = [
		{
			action = continue
			flow_state = options_toprockers_setlist_fs
			func = setup_top_rockers_for_mode
			transition_right
		}
		{
			action = go_back
			flow_state = options_top_rockers_select_mode_fs
		}
	]
}

script reset_top_rockers_mode 
	change \{game_mode = p1_quickplay}
	change \{current_num_players = 1}
	change \{g_keep_song_preview = 0}
	change \{g_top_rockers_setlist = 0}
	destroy_setlist_songpreview_monitor
endscript
g_keep_song_preview = 0

script keep_song_preview_for_top_rockers 
	change \{g_keep_song_preview = 1}
	return \{flow_state = options_toprockers_fs}
endscript
options_toprockers_setlist_fs = {
	create = create_setlist_menu
	destroy = destroy_setlist_menu
	actions = [
		{
			action = continue
			flow_state_func = keep_song_preview_for_top_rockers
			transition_right
		}
		{
			action = go_back
			flow_state = options_top_rockers_select_mode_fs
			func = reset_top_rockers_mode
			transition_left
		}
	]
}
options_toprockers_fs = {
	create = create_top_rockers_menu
	create_params = {
		for_options = 1
	}
	destroy = destroy_top_rockers_menu
	actions = [
		{
			action = continue
			flow_state = options_toprockers_setlist_fs
			transition_left
		}
	]
}
options_cheats_fs = {
	create = create_cheats_menu
	destroy = destroy_cheats_menu
	actions = [
		{
			action = continue
			flow_state = options_select_option_fs
			transition_right
		}
		{
			action = enter_new_cheat
			flow_state = options_enter_new_cheat_fs
		}
		{
			action = go_back
			flow_state_func = go_back_from_cheats
			transition_left
		}
	]
}

script go_back_from_cheats 
	destroy_menu_backdrop
	return \{flow_state = options_select_option_fs}
endscript
options_enter_new_cheat_fs = {
	create = cheats_zoomin_guitar
	destroy = cheats_zoomout_guitar
	actions = [
		{
			action = new_cheat_finished
			flow_state = options_cheats_fs
		}
	]
}
options_choose_band_for_store_fs = {
	create = create_choose_band_menu
	destroy = destroy_choose_band_menu
	actions = [
		{
			action = select_new_band
			flow_state = options_enter_band_name_fs
			transition_right
		}
		{
			action = select_existing_band
			func = set_store_came_from_options
			flow_state = store_fs
		}
		{
			action = go_back
			flow_state = options_select_option_fs
			transition_left
		}
	]
}
options_for_manage_band = 0

script set_for_manage_band 
	change \{options_for_manage_band = 1}
endscript
options_enter_band_name_fs = {
	create = create_enter_band_name_menu
	destroy = destroy_enter_band_name_menu
	remove_focus = enter_band_name_remove_focus
	refocus = enter_band_name_refocus
	actions = [
		{
			action = enter_band_name_for_manage_band
			flow_state = options_choose_band_fs
			transition_right
		}
		{
			action = enter_band_name
			func = set_store_came_from_options
			flow_state = store_fs
		}
		{
			action = enter_no_band
			flow_state = options_no_band_fs
			transition_right
		}
		{
			action = go_back
			use_last_flow_state
			transition_left
		}
	]
}
options_no_band_fs = {
	create = create_no_band_menu
	destroy = destroy_no_band_menu
	popup
	actions = [
		{
			action = continue
			flow_state = options_enter_band_name_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_enter_band_name_fs
			transition_left
		}
	]
}

script set_store_came_from_options 
	change \{game_mode = p1_career}
	progression_pop_current
	change \{store_came_from = options}
endscript
store_fs = {
	create = create_store_menu
	destroy = destroy_store_menu
	actions = [
		{
			action = select_guitars
			flow_state = store_guitars_fs
		}
		{
			action = select_finishes
			flow_state = store_finishes_fs
		}
		{
			action = select_songs
			flow_state = store_songs_fs
		}
		{
			action = select_characters
			flow_state = store_characters_fs
		}
		{
			action = select_outfits
			flow_state = store_outfits_fs
		}
		{
			action = select_styles
			flow_state = store_styles_fs
		}
		{
			action = select_videos
			flow_state = store_videos_fs
		}
		{
			action = select_downloads
			func = store_select_downloads
			flow_state = store_downloads_fs
		}
		{
			action = go_back
			flow_state_func = store_maybe_autosave
		}
	]
}
store_autosave_required = 0

script store_maybe_autosave 
	if ($store_autosave_required = 1)
		change \{store_autosave_required = 0}
		return \{flow_state = store_autosave_fs}
	else
		go_back_to_where_you_came_from
		return flow_state = <flow_state>
	endif
endscript
store_autosave_fs = {
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state_func = go_back_to_where_you_came_from
		}
		{
			action = memcard_sequence_save_failed
			flow_state_func = go_back_to_where_you_came_from
		}
	]
}
store_came_from = options

script go_back_to_where_you_came_from 
	switch ($store_came_from)
		case options
		progression_push_current
		return \{flow_state = options_choose_band_for_store_fs}
		case p1_career
		if ($is_network_game = 0 && $signin_change_happening = 1)
			return \{flow_state = null_flow_state}
		else
			return \{flow_state = career_character_hub_fs}
		endif
		case p2_faceoff
		return \{flow_state = mp_faceoff_split_off_flow_for_character_hub_fs}
	endswitch
endscript
store_songs_fs = {
	create = create_store_songs_menu
	destroy = destroy_store_songs_menu
	actions = [
		{
			action = go_back
			flow_state = store_fs
		}
	]
}
store_guitars_fs = {
	create = create_store_guitars_menu
	destroy = destroy_store_guitars_menu
	actions = [
		{
			action = go_back
			flow_state = store_fs
		}
	]
}
store_finishes_fs = {
	create = create_store_guitar_finishes_menu
	destroy = destroy_store_guitar_finishes_menu
	actions = [
		{
			action = go_back
			flow_state = store_fs
		}
	]
}
store_characters_fs = {
	create = create_store_characters_menu
	destroy = destroy_store_characters_menu
	actions = [
		{
			action = go_back
			flow_state = store_fs
		}
	]
}
store_outfits_fs = {
	create = create_store_outfits_menu
	destroy = destroy_store_outfits_menu
	actions = [
		{
			action = go_back
			flow_state = store_fs
		}
	]
}
store_styles_fs = {
	create = create_store_styles_menu
	destroy = destroy_store_styles_menu
	actions = [
		{
			action = go_back
			flow_state = store_fs
		}
	]
}
store_videos_fs = {
	create = create_store_videos_menu
	destroy = destroy_store_videos_menu
	actions = [
		{
			action = go_back
			flow_state = store_fs
		}
	]
}
store_downloads_fs = {
	create = create_download_scan_menu
	destroy = destroy_download_scan_menu
	actions = [
		{
			action = continue
			flow_state = store_fs
		}
	]
}
