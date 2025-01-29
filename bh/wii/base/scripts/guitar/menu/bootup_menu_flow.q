is_shutdown_safe = 1

script mark_unsafe_for_shutdown 
	printf \{'mark_unsafe_for_shutdown'}
	Change \{is_shutdown_safe = 0}
endscript

script mark_safe_for_shutdown 
	printf \{'mark_safe_for_shutdown'}
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
	printf \{qs(0x3c1bf6a0)}
	setscriptcannotpause
	Change \{respond_to_signin_changed = 0}
	Change \{shutdown_game_for_signin_change_flag = 1}
	0xc9083294
	wait_for_safe_shutdown
	LaunchEvent \{Type = unfocus
		target = root_window}
	printf \{qs(0x7e5d73b7)}
	disable_pause
	create_loading_screen \{no_bink}
	ui_event_wait_for_safe
	ui_event_block \{event = menu_back
		data = {
			state = uistate_null
		}}
	shutdown_game_for_signin_change \{signin_change = 1}
	ui_event_block \{event = menu_change
		data = {
			state = uistate_signin_changed
			clear_previous_stack
		}}
	destroy_loading_screen
	StartRendering
	SetButtonEventMappings \{unblock_menu_input}
	reset_song_loading_hack_global
	printf \{qs(0xdb049d9c)}
endscript

script signing_change_confirm_reboot 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{qs(0xedc39bfe)}
	if ScreenElementExists \{id = dialog_box_vmenu}
		LaunchEvent \{Type = unfocus
			target = dialog_box_vmenu}
	endif
	ui_event \{event = menu_change
		data = {
			state = uistate_boot_iis
			clear_previous_stack
		}}
	spawnscript \{persistent_band_create_band
		params = {
			startup = 1
			refresh = 1
		}}
	printf \{qs(0x3b3199e6)}
endscript
shutdown_game_for_signin_change_flag = 0

script shutdown_game_for_signin_change \{unloadcontent = 1
		signin_change = 0}
	printf \{qs(0xc8952dcc)}
	if ScriptExists \{counter_play_beep_spawn}
		KillSpawnedScript \{Name = counter_play_beep_spawn}
	endif
	StopSoundEvent \{gameplay_vote_countdown}
	KillSpawnedScript \{Name = SpawnedOneShotBeginRepeatLoop}
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
	SpawnScriptNow \{kill_transition_preload_streams}
	Change \{shutdown_game_for_signin_change_flag = 1}
	StopAllSounds
	killmenumusic
	Change \{net_pause = 0}
	KillSpawnedScript \{Name = ui_signin_check}
	KillSpawnedScript \{Name = net_init}
	KillSpawnedScript \{Name = do_calibration_update}
	KillSpawnedScript \{Name = cl_do_ping}
	KillSpawnedScript \{Name = kill_off_and_finish_calibration}
	KillSpawnedScript \{Name = menu_calibrate_lag_create_circles}
	KillSpawnedScript \{Name = gameplay_end_game}
	KillSpawnedScript \{Name = accept_invite}
	KillSpawnedScript \{Name = net_party_lost_party_connection_kill_popup}
	NetSessionFunc \{Obj = match
		func = cancel_join_server}
	set_demonware_failed
	destroy_player_drop_events
	KillSpawnedScript \{id = not_ui_player_drop_scripts}
	end_practice_song_slomo
	memcard_sequence_cleanup_generic
	destroy_leaving_lobby_dialog
	kill_intro_celeb_ui
	KillSpawnedScript \{Name = smoothmenuscroll}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	quit_network_game_early \{signin_change}
	KillSpawnedScript \{Name = gameplay_end_game}
	KillSpawnedScript \{Name = play_song_game_over_spawned}
	setup_sessionfuncs
	if NetSessionFunc \{Obj = session
			func = has_active_session}
		NetSessionFunc \{Obj = session
			func = stop_singleplayer_session}
	endif
	if ($in_tutorial_mode = 1)
		tutorial_shutdown
	endif
	kill_gem_scroller \{no_render = 1
		restarting}
	KillSpawnedScript \{id = intro_scripts}
	clean_up_user_control_helpers
	menu_music_off \{setflag = 1}
	unload_songqpak
	destroy_downloads_EnumContent
	if (<unloadcontent> = 1)
		Downloads_UnloadContent
		removecontentfiles \{playerid = -1}
		reset_globaltags_all
	endif
	if ScreenElementExists \{id = ready_container_p2}
		DestroyScreenElement \{id = ready_container_p2}
	endif
	set_default_misc_globals
	cleanup_songwon_event
	persistent_band_force_unique_musicians
	setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)}}
	clear_wait_for_net_match_available_items
	UnPauseGame
	Change \{shutdown_game_for_signin_change_flag = 0}
	printf \{qs(0x6c8afce2)}
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
	Change \{use_last_player_scores = 0}
	Change \{old_song = None}
	Change \{end_credits = 0}
	Change \{menu_flow_locked = 0}
	Change \{coop_dlc_active = 0}
	Change \{songlist_song_preview_changing = 0}
	Change \{current_song_qpak_performance = 0}
	Change \{songtime_paused = 0}
	Change \{generic_menu_block_input = 0}
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
