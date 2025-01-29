is_shutdown_safe = 1

script mark_unsafe_for_shutdown 
	printscriptinfo \{'mark_unsafe_for_shutdown'}
	Change \{is_shutdown_safe = 0}
endscript

script mark_safe_for_shutdown 
	printscriptinfo \{'mark_safe_for_shutdown'}
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
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = None}
	Change \{shutdown_game_for_signin_change_flag = 1}
	wait_for_safe_shutdown
	LaunchEvent \{Type = unfocus
		target = root_window}
	printf \{qs(0x7e5d73b7)}
	disable_pause
	if NOT ($bink_heap_state = small)
		killallmovies
		waitforallmoviestofinish
		set_bink_heap_state \{state = small}
	endif
	if ($cas_heap_state = in_cas)
		create_loading_screen_empty
	else
		create_loading_screen \{no_bink}
	endif
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
	destroy_loading_screen \{Force = 1}
	killallmovies
	StartRendering
	SetButtonEventMappings \{unblock_menu_input}
	printf \{qs(0xdb049d9c)}
endscript

script signing_change_confirm_reboot 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{qs(0xedc39bfe)}
	if ScreenElementExists \{id = pu_warning_vmenu}
		LaunchEvent \{Type = unfocus
			target = pu_warning_vmenu}
	endif
	ui_event \{event = menu_change
		data = {
			state = uistate_boot_iis
			clear_previous_stack
		}}
	printf \{qs(0x3b3199e6)}
endscript
shutdown_game_for_signin_change_flag = 0

script shutdown_game_for_signin_change \{unloadcontent = 1
		signin_change = 0}
	printf \{qs(0xc8952dcc)}
	KillSpawnedScript \{Name = SpawnedOneShotBeginRepeatLoop}
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
	SpawnScriptNow \{kill_transition_preload_streams}
	Change \{shutdown_game_for_signin_change_flag = 1}
	StopAllSounds
	killmenumusic
	KillSpawnedScript \{Name = net_init}
	KillSpawnedScript \{Name = do_calibration_update}
	KillSpawnedScript \{Name = cl_do_ping}
	KillSpawnedScript \{Name = kill_off_and_finish_calibration}
	KillSpawnedScript \{Name = menu_calibrate_lag_create_circles}
	KillSpawnedScript \{Name = gameplay_end_game}
	KillSpawnedScript \{Name = matchmaking_countdown_end_game_script_spawned}
	KillSpawnedScript \{Name = net_party_lost_party_connection_kill_popup}
	NetSessionFunc \{Obj = match
		func = cancel_join_server}
	set_demonware_failed
	destroy_player_drop_events
	destroy_alert_popup \{Force = 1
		no_sound = 1}
	end_practice_song_slomo
	memcard_sequence_cleanup_generic
	destroy_leaving_lobby_dialog
	kill_intro_celeb_ui
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	cheat_turnoffalllocked
	destroy_credits_menu
	quit_network_game_early \{signin_change}
	KillSpawnedScript \{Name = gameplay_end_game}
	KillSpawnedScript \{Name = play_song_game_over_spawned}
	setup_sessionfuncs
	if NetSessionFunc \{Obj = session
			func = has_active_session}
		NetSessionFunc \{Obj = session
			func = stop_singleplayer_session}
	endif
	tutorial_shutdown
	DeRegisterAtoms
	kill_gem_scroller \{no_render = 1
		restarting}
	destroy_movie_viewport
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
		removecontentfiles \{playerid = -1}
		reset_globaltags_all
	endif
	if ScreenElementExists \{id = ready_container_p2}
		DestroyScreenElement \{id = ready_container_p2}
	endif
	set_default_misc_globals
	cleanup_songwon_event
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
	Change \{show_boss_helper_screen = 0}
	Change \{use_last_player_scores = 0}
	Change \{old_song = None}
	Change \{devil_finish = 0}
	Change \{end_credits = 0}
	Change \{battle_do_or_die = 0}
	Change \{battle_do_or_die_speed_scale = 1.0}
	Change \{battle_do_or_die_attack_scale = 1.0}
	Change \{menu_flow_locked = 0}
	Change \{coop_dlc_active = 0}
	Change \{current_song_qpak_performance = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{songtime_paused = 0}
	Change \{setlist_songpreview_changing = 0}
	Change \{game_mode = p1_quickplay}
	Change \{menu_over_ride_exclusive_device = -1}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = None}
	Change \{gem_scroller_all_data_has_loaded = 0}
	clear_exclusive_devices
	achievements_resetglobals
endscript
