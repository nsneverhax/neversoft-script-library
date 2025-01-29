respond_to_signin_changed = 0
bootup_sequence_fs = {
	create = start_bootup_sequence
	Destroy = end_bootup_sequence
	actions = [
		{
			action = skip_bootup_sequence
			flow_state_func = 0xc922a240
		}
	]
}

script 0xc922a240 
	if isngc
		wii_data_check_and_load \{boot = 1}
		return flow_state = <flow_state>
	else
		return \{flow_state = ps2_memcard_autosave_warning_boot_fs}
	endif
endscript
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
			flow_state = main_menu_fs
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
	WaitOneGameFrame
	repeat
endscript

script bootup_sequence 
	pre_movie_cleanup
	if NOT isngc
		wait_for_legal_timer
	endif
	StartRendering
	HideLoadingScreen
	PlayMovieAndWait \{movie = 'atvi'}
	if NOT 0xf6d4aff8
		PlayMovieAndWait \{movie = 'ro_logo'}
	endif
	if NOT 0xf6d4aff8
		PlayMovieAndWait \{movie = 'ns_logo'}
	endif
	if isngc
		if NOT 0xf6d4aff8
			PlayMovieAndWait \{movie = 'vvisions'}
		endif
	endif
	if NOT 0xf6d4aff8
		PlayMovieAndWait \{movie = 'budcat'}
	endif
	PlayMovieAndWait \{movie = 'intro'}
	0x11847aeb
	post_movie_reset 0xd4935026 = <0xd4935026>
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = skip_bootup_sequence
			play_sound = 0
		}}
endscript

script 0xa8efd42b 
	PlayMovieAndWait \{movie = 'singleplayer_01'}
	PlayMovieAndWait \{movie = 'singleplayer_02'}
	PlayMovieAndWait \{movie = 'singleplayer_03'}
	PlayMovieAndWait \{movie = 'singleplayer_04'}
	PlayMovieAndWait \{movie = 'singleplayer_05'}
	PlayMovieAndWait \{movie = 'singleplayer_06'}
	PlayMovieAndWait \{movie = 'singleplayer_07'}
	PlayMovieAndWait \{movie = 'singleplayer_08'}
	PlayMovieAndWait \{movie = 'singleplayer_end'}
	PlayMovieAndWait \{movie = 'coop_01'}
	PlayMovieAndWait \{movie = 'coop_02'}
	PlayMovieAndWait \{movie = 'coop_03'}
	PlayMovieAndWait \{movie = 'coop_04'}
	PlayMovieAndWait \{movie = 'coop_05'}
	PlayMovieAndWait \{movie = 'coop_06'}
	PlayMovieAndWait \{movie = 'sexpistols'}
	PlayMovieAndWait \{movie = 'brettmichaels'}
	PlayMovieAndWait \{movie = 'slash'}
	PlayMovieAndWait \{movie = 'tommorello'}
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
		ScriptAssert \{'check_signin_change_monitor_flag failed'}
	endif
endscript

script start_checking_for_signin_change 

	printscriptinfo \{'start_checking_for_signin_change'}

	KillSpawnedScript \{Name = sysnotify_handle_signin_change}

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
	return \{flow_state = main_menu_fs}
	if NOT CheckForSignIn local controller_index = <device_num>
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
			flow_state_func = choose_proper_using_guitar_screen
		}
		{
			action = select_choose_storage_device
			flow_state_func = bootup_check_for_sign_in
		}
		{
			action = select_continue_without_signing_in
			flow_state = bootup_signin_complete_message
		}
		{
			action = 0x2d829ff0
			flow_state = 0x16f53321
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
			flow_state_func = choose_proper_using_guitar_screen
		}
		{
			action = memcard_sequence_save_failed
			flow_state_func = choose_proper_using_guitar_screen
		}
		{
			action = memcard_sequence_load_success
			flow_state = choose_proper_using_guitar_screen
		}
		{
			action = memcard_sequence_load_failed
			flow_state_func = choose_proper_using_guitar_screen
		}
	]
}

script choose_proper_using_guitar_screen 
	if isngc
		return \{flow_state = 0x6308b911}
	else
		return \{flow_state = bootup_using_guitar_controller_fs}
	endif
endscript
0x6308b911 = {
	create = 0x7948a248
	Destroy = 0x4704b349
	actions = [
		{
			action = continue
			flow_state = bootup_press_any_button_fs
		}
	]
}
bootup_using_guitar_controller_fs = {
	create = create_using_guitar_controller_menu
	Destroy = destroy_using_guitar_controller_menu
	actions = [
		{
			action = continue
			flow_state = bootup_press_any_button_fs
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
	Change \{is_shutdown_safe = 0}
endscript

script mark_safe_for_shutdown 
	Change \{is_shutdown_safe = 1}
	unpausespawnedscript \{wait_for_safe_shutdown}
endscript

script wait_for_safe_shutdown 
	begin
	if ($is_shutdown_safe = 1)
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script handle_signin_changed 

	Change \{respond_to_signin_changed = 0}
	killallmovies
	wait_for_safe_shutdown

	disable_pause
	StopRendering
	shutdown_game_for_signin_change \{signin_change = 1}
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_signin_changed_menu
	StartRendering

endscript

script signing_change_confirm_reboot 

	destroy_signin_changed_menu
	enable_pause
	Wait \{5
		gameframes}
	start_flow_manager \{flow_state = bootup_press_any_button_fs}

endscript
shutdown_game_for_signin_change_flag = 0

script shutdown_game_for_signin_change \{unloadcontent = 1
		signin_change = 0}

	Change \{shutdown_game_for_signin_change_flag = 1}
	StopAllSounds
	KillSpawnedScript \{Name = online_menu_init}
	KillSpawnedScript \{Name = do_calibration_update}
	KillSpawnedScript \{Name = cl_do_ping}
	KillSpawnedScript \{Name = play_calibrate_click}
	KillSpawnedScript \{Name = kill_off_and_finish_calibration}
	KillSpawnedScript \{Name = menu_calibrate_lag_create_circles}
	KillSpawnedScript \{Name = host_handle_dropped_client}
	set_demonware_failed
	KillSpawnedScript \{Name = create_leaderboard_menu2}
	KillSpawnedScript \{Name = create_leaderboard_menu3}
	KillSpawnedScript \{Name = add_leaderboard_rows_to_menu}
	KillSpawnedScript \{Name = fall_controller}
	shutdown_options_video_monitor
	destroy_alert_popup \{Force = 1}
	end_practice_song_slomo
	if ScreenElementExists \{id = loading_screen_container}
		destroy_loading_screen
	endif
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
	KillSpawnedScript \{Name = start_loading_process}
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
	store_monitor_goal_guitar_finish
	DeRegisterAtoms
	kill_gem_scroller \{no_render = 1}
	progression_push_current \{Force = 1}
	clean_up_user_control_helpers
	menu_music_off \{setflag = 1}
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
	destroy_choose_practice_section_menu
	KillSpawnedScript \{Name = create_character_select_menu}
	destroy_character_select_menu \{Player = 1}
	UnPauseGame
	destroy_bg_viewport
	setup_bg_viewport
	Change \{shutdown_game_for_signin_change_flag = 0}

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
endscript

script 0xa6d72e79 
	KillSpawnedScript \{Name = attract_mode_spawner}
	if GotParam \{device_num}
		Change primary_controller = <device_num>
		Change \{primary_controller_assigned = 1}
		Change structurename = player1_status controller = ($primary_controller)
	endif
	0x03ee527d
	0x17665b93
	if ($0xc6f5b687 = 1)
		0xee85ff51
	elseif (<0x0e1f9cdb> > 0)
		0x324d937c
	elseif ($wii_nosave_onboot = 1 && $disable_wifi != 1)
		0x8330b46d
	else
		wii_leave_bootup_signin
	endif
endscript

script wii_leave_bootup_signin 
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = continue
		}}
endscript

script wii_bootup_skip_login 
	destroy_generic_popup
	wii_leave_bootup_signin
endscript

script wii_bootup_handle_connection_error 
	if ($ui_flow_manager_state [0] = bootup_press_any_button_fs)
		wii_leave_bootup_signin
	endif
endscript
