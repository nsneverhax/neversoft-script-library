respond_to_signin_changed = 0
enable_button_cheats = 0
bootup_sequence_fs = {
	create = start_bootup_sequence
	Destroy = end_bootup_sequence
	actions = [
		{
			action = skip_bootup_sequence
			flow_state = bootup_press_any_button_fs
		}
	]
}
bootup_press_any_button_fs = {
	create = create_press_any_button_menu
	Destroy = destroy_press_any_button_menu
	actions = [
		{
			action = enter_attract_mode
			flow_state = bootup_attract_mode_fs
		}
		{
			action = continue
			flow_state_func = bootup_check_for_sign_in
		}
	]
}
bootup_attract_mode_fs = {
	create = create_attract_mode
	Destroy = destroy_attract_mode
	actions = [
		{
			action = exit_attract_mode
			flow_state = bootup_press_any_button_fs
		}
	]
}
legal_timer = 0

script start_legal_timer 
	Change \{legal_timer = 0}
	Wait \{6
		Seconds}
	Change \{legal_timer = 1}
endscript

script wait_for_legal_timer 
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	begin
	if ($legal_timer = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script bootup_sequence 
	wait_for_legal_timer
	StartRendering
	EnableUserMusic \{disable}
	PlayMovieAndWait \{movie = 'atvi'}
	PlayMovieAndWait \{movie = 'ro_logo'}
	PlayMovieAndWait \{movie = 'ns_logo'}
	PlayMovieAndWait \{movie = 'intro'}
	EnableUserMusic
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = skip_bootup_sequence
			play_sound = 0
		}}
endscript

script start_bootup_sequence 
	if NotCD
		if ($show_movies = 0)
			StartRendering
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = skip_bootup_sequence
					play_sound = 0
				}}
			return
		endif
	endif
	SpawnScriptNow \{bootup_sequence}
endscript

script end_bootup_sequence 
endscript

script check_signin_change_monitor_flag 
	if ($respond_to_signin_changed = 0)
		ScriptAssert \{"check_signin_change_monitor_flag failed"}
	endif
endscript

script start_checking_for_signin_change 
	printf \{"start_checking_for_signin_change"}
	printscriptinfo \{"start_checking_for_signin_change"}
	printf \{"start_checking_for_signin_change - killing sysnotifys"}
	KillSpawnedScript \{Name = sysnotify_handle_signin_change}
	Change \{signin_change_happening = 0}
	printf \{"start_checking_for_signin_change - begin"}
	Change \{respond_to_signin_changed = 1}
	Change \{menu_select_difficulty_first_time_p1 = 1}
	Change \{menu_select_difficulty_first_time_p2 = 1}
endscript

script bootup_check_for_sign_in 
	KillSpawnedScript \{Name = attract_mode_spawner}
	Change \{enable_saving = 1}
	if GotParam \{device_num}
		Change primary_controller = <device_num>
		Change \{primary_controller_assigned = 1}
		Change structurename = player1_status controller = ($primary_controller)
	endif
	if NOT CheckForSignIn local controller_index = <device_num>
		setup_bg_viewport
		if isXenon
			NetSessionFunc \{func = showsigninui}
		else
			Change \{ps3_signin_complete = 0}
			xenon_singleplayer_session_init \{ps3_signin_callback = signin_complete_callback}
		endif
		wait_for_blade_complete
		if NOT CheckForSignIn \{local}
			return \{flow_state = bootup_signin_warning_fs}
		endif
	endif
	if CheckForSignIn
		NetSessionFunc \{func = stats_uninit}
		NetSessionFunc \{func = stats_init}
		NetSessionFunc \{func = motd_uninit}
		NetSessionFunc \{func = motd_init}
		NetSessionFunc \{func = get_demonware_splash
			Obj = motd
			params = {
				callback = splash_callback
			}}
		NetSessionFunc \{func = getbeatadevlist}
	endif
	if isXenon
		process_signin_complete
		return flow_state = <flow_state>
	else
		return \{flow_state = bootup_signin_complete_message}
	endif
endscript

script process_signin_complete 
	RefreshSigninStatus
	refreshxusersignininfo \{device_num = $primary_controller}
	if isXenon
		StartGameProfileSettingsRead
		begin
		if GameProfileSettingsFinished
			break
		endif
		repeat
	endif
	start_checking_for_signin_change
	return \{flow_state = bootup_do_memcard_sequence_fs}
endscript
ps3_signin_complete = 0

script wait_for_blade_complete 
	if isXenon
		wait_for_sysnotify_unpause
	else
		begin
		if (1 = $ps3_signin_complete)
			break
		endif
		Wait \{1
			Frame}
		repeat
	endif
endscript

script signin_complete_callback 
	Change \{ps3_signin_complete = 1}
endscript
bootup_signin_warning_fs = {
	create = create_signin_warning_menu
	Destroy = destroy_signin_warning_menu
	actions = [
		{
			action = select_continue_without_saving
			flow_state = bootup_using_guitar_controller_fs
		}
		{
			action = select_choose_storage_device
			flow_state_func = bootup_check_for_sign_in
		}
		{
			action = select_continue_without_signing_in
			flow_state = bootup_signin_complete_message
		}
	]
}
bootup_do_memcard_sequence_fs = {
	create = memcard_sequence_begin_bootup
	create_params = {
		StorageSelectorForce = 1
	}
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = bootup_using_guitar_controller_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = bootup_using_guitar_controller_fs
		}
		{
			action = memcard_sequence_load_success
			flow_state = bootup_download_scan_fs
		}
		{
			action = memcard_sequence_load_failed
			flow_state = bootup_using_guitar_controller_fs
		}
	]
}
bootup_using_guitar_controller_fs = {
	create = create_using_guitar_controller_menu
	Destroy = destroy_using_guitar_controller_menu
	actions = [
		{
			action = continue
			flow_state = bootup_download_scan_fs
		}
	]
}
bootup_download_scan_fs = {
	create = create_download_scan_menu
	Destroy = destroy_download_scan_menu
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
	]
}
bootup_signin_complete_message = {
	create = create_signin_complete_menu
	Destroy = destroy_signin_complete_menu
	actions = [
		{
			action = continue
			flow_state_func = process_signin_complete
		}
	]
}
is_shutdown_safe = 1

script mark_unsafe_for_shutdown 
	printf \{"mark_unsafe_for_shutdown"}
	Change \{is_shutdown_safe = 0}
endscript

script mark_safe_for_shutdown 
	printf \{"mark_safe_for_shutdown"}
	Change \{is_shutdown_safe = 1}
	unpausespawnedscript \{wait_for_safe_shutdown}
endscript

script wait_for_safe_shutdown 
	begin
	if ($is_shutdown_safe = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script handle_signin_changed 
	printf \{"handle_signin_changed"}
	Change \{respond_to_signin_changed = 0}
	killallmovies
	stop_subtitles
	if ScreenElementExists \{id = mbv_vmenu}
		replace_video_option_handlers
		mark_safe_for_shutdown
		SetScreen \{hardware_letterbox = 0}
	endif
	wait_for_safe_shutdown
	printf \{"handle_signin_changed started"}
	disable_pause
	if NOT ScreenElementExists \{id = menu_backdrop_container}
		clean_up_user_control_helpers
		create_menu_backdrop \{z_priority = 100000}
		Wait \{1
			gameframe}
	endif
	StopRendering
	shutdown_game_for_signin_change \{signin_change = 1}
	LaunchEvent \{Type = unfocus
		target = root_window}
	destroy_menu_backdrop
	create_signin_changed_menu
	StartRendering
	printf \{"handle_signin_changed end"}
endscript

script signing_change_confirm_reboot 
	printf \{"signing_change_confirm_reboot"}
	destroy_signin_changed_menu
	enable_pause
	Wait \{5
		gameframes}
	start_flow_manager \{flow_state = bootup_press_any_button_fs}
	printf \{"signing_change_confirm_reboot end"}
endscript
shutdown_game_for_signin_change_flag = 0

script shutdown_game_for_signin_change \{unloadcontent = 1
		signin_change = 0}
	printf \{"shutdown_game_for_signin_change"}
	Change \{shutdown_game_for_signin_change_flag = 1}
	StopAllSounds
	Change \{current_band = 1}
	Change \{options_for_manage_band = 0}
	Change \{store_view_cam_created = 0}
	Change \{store_camera_changing = 0}
	KillSpawnedScript \{Name = online_menu_init}
	KillSpawnedScript \{Name = do_calibration_update}
	KillSpawnedScript \{Name = cl_do_ping}
	KillSpawnedScript \{Name = play_calibrate_click}
	KillSpawnedScript \{Name = kill_off_and_finish_calibration}
	KillSpawnedScript \{Name = menu_calibrate_lag_create_circles}
	set_demonware_failed
	KillSpawnedScript \{Name = create_leaderboard_menu2}
	KillSpawnedScript \{Name = create_leaderboard_menu3}
	KillSpawnedScript \{Name = add_leaderboard_rows_to_menu}
	KillSpawnedScript \{Name = fall_controller}
	shutdown_options_video_monitor
	destroy_alert_popup \{Force = 1
		play_sound = 0}
	end_practice_song_slomo
	destroy_loading_screen
	memcard_sequence_cleanup_generic
	KillSpawnedScript \{Name = memcard_sequence_begin_bootup_logic}
	menu_store_go_back
	destroy_select_quickplay_mode
	Change \{create_band_member_lock = 0}
	Change \{create_band_member_lock_queue = 0}
	KillSpawnedScript \{Name = generic_select_monitor}
	Change \{generic_select_monitor_p1_changed = 0}
	Change \{generic_select_monitor_p2_changed = 0}
	KillSpawnedScript \{Name = cheats_do_guitar_morphs}
	KillSpawnedScript \{Name = cheats_watch_buttons}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	KillSpawnedScript \{Name = do_ui_frame_morph}
	destroy_menu \{menu_id = select_style_container}
	destroy_menu \{menu_id = select_style_container_p2}
	shut_down_character_hub
	destroy_select_outfit_menu
	destroy_setlist_songpreview_monitor
	quit_network_game_early \{signin_change}
	tutorial_shutdown
	shut_down_flow_manager \{Player = 1
		resetstate}
	shut_down_flow_manager \{Player = 2
		resetstate}
	destroy_credits_menu
	store_monitor_goal_guitar_finish
	DeRegisterAtoms
	kill_gem_scroller \{no_render = 1}
	progression_push_current \{Force = 1}
	clean_up_user_control_helpers
	menu_music_off
	unload_songqpak
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	destroy_band \{unload_paks}
	destroy_downloads_EnumContent
	if (<unloadcontent> = 1)
		Downloads_UnloadContent
		ClearGlobalTags
		setup_globaltags
	endif
	if (<signin_change> = 1)
		clear_cheats
	endif
	if ScreenElementExists \{id = ready_container_p2}
		DestroyScreenElement \{id = ready_container_p2}
	endif
	if ScreenElementExists \{id = search_results_container}
		DestroyScreenElement \{id = search_results_container}
	endif
	set_default_misc_globals
	cleanup_songwon_event
	destroy_menu_transition
	destroy_calibrate_lag_dialog_menu
	Change \{menu_choose_practice_destroy_previous_menu = 1}
	destroy_choose_practice_section_menu
	if NOT isps3
		ResumeControllerChecking
	endif
	UnPauseGame
	destroy_bg_viewport
	setup_bg_viewport
	Change \{shutdown_game_for_signin_change_flag = 0}
	printf \{"shutdown_game_for_signin_change end"}
endscript

script cleanup_songwon_event 
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	KillSpawnedScript \{Name = jiggle_text_array_elements}
	KillSpawnedScript \{Name = You_Rock_Waiting_Crowd_SFX}
	KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
endscript

script set_default_misc_globals 
	Change \{show_boss_helper_screen = 0}
	Change \{use_last_player_scores = 0}
	Change \{old_song = None}
	Change \{devil_finish = 0}
	Change \{end_credits = 0}
	Change \{battle_sudden_death = 0}
	Change \{menu_flow_locked = 0}
	Change \{coop_dlc_active = 0}
	Change \{character_pak_loadpak_lock = 0}
	Change \{progression_play_completion_movie = 0}
endscript
