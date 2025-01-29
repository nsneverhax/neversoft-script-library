
script wait_for_safe_shutdown 
	begin
	if is_shutdown_safe
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script handle_signin_changed 
	printf \{qs(0x3c1bf6a0)}
	SetScriptCannotPause
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = None}
	Change \{shutdown_game_for_signin_change_flag = 1}
	if ScriptIsRunning \{song_preview_monitor}
		killspawnedscript \{name = song_preview_monitor}
	endif
	if isXenon
		if GotParam \{is_primary_controller}
			printf \{'wait_for_safe_shutdown - checkout fix - is primary controller'}
			if MarketplaceFunc \{func = is_inited}
				printf \{'wait_for_safe_shutdown - checkout fix - marketplace is inited'}
				if MarketplaceFunc \{func = is_in_checkout}
					printf \{'wait_for_safe_shutdown - checkout fix - is in checkout'}
					if MarketplaceFunc \{func = cancel_checkout}
						printf \{'wait_for_safe_shutdown - checkout fix - cancel succeeded'}
					endif
				endif
			endif
		endif
	endif
	musicstudio_entry_unsafe_for_shutdown_pop
	wait_for_safe_shutdown
	LaunchEvent \{type = unfocus
		target = root_window}
	printf \{qs(0x7e5d73b7)}
	disable_pause
	create_loading_screen \{no_bink}
	ui_event_wait_for_safe
	ui_event_block \{event = menu_back
		data = {
			state = UIstate_null
		}}
	shutdown_game_for_signin_change \{signin_change = 1}
	ui_event_block \{event = menu_change
		data = {
			state = UIstate_signin_changed
			clear_previous_stack
		}}
	destroy_loading_screen \{Force = 1}
	KillAllMovies
	StartRendering
	SetButtonEventMappings \{unblock_menu_input}
	reset_song_loading_hack_global
	spawnscriptnow \{song_preview_monitor}
	printf \{qs(0xdb049d9c)}
endscript

script signing_change_confirm_reboot 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{qs(0xedc39bfe)}
	if ScreenElementExists \{id = dialog_box_vmenu}
		LaunchEvent \{type = unfocus
			target = dialog_box_vmenu}
	endif
	ui_event \{event = menu_change
		data = {
			state = UIstate_freeplay
			clear_previous_stack
		}}
	SpawnScript \{persistent_band_create_band
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
	if ScriptExists \{Counter_Play_Beep_Spawn}
		killspawnedscript \{name = Counter_Play_Beep_Spawn}
	endif
	StopSoundEvent \{Gameplay_Vote_Countdown}
	killspawnedscript \{name = SpawnedOneShotBeginRepeatLoop}
	killspawnedscript \{name = OneShotsBetweenSongs}
	killspawnedscript \{name = SurgeBetweenSongs}
	spawnscriptnow \{Kill_Transition_Preload_Streams}
	Change \{shutdown_game_for_signin_change_flag = 1}
	StopAllSounds
	KillMenuMusic
	killspawnedscript \{name = ui_signin_check}
	killspawnedscript \{name = net_init}
	killspawnedscript \{name = do_calibration_update}
	killspawnedscript \{name = cl_do_ping}
	killspawnedscript \{name = kill_off_and_finish_calibration}
	killspawnedscript \{name = menu_calibrate_lag_create_circles}
	killspawnedscript \{name = gameplay_end_game}
	killspawnedscript \{name = net_party_lost_party_connection_kill_popup}
	NetSessionFunc \{Obj = match
		func = cancel_join_server}
	set_demonware_failed
	destroy_player_drop_events
	killspawnedscript \{id = not_ui_player_drop_scripts}
	end_practice_song_slomo
	memcard_sequence_cleanup_generic
	kill_intro_celeb_ui
	killspawnedscript \{name = SmoothMenuScroll}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	cheat_turnoffalllocked
	destroy_credits_menu
	quit_network_game_early \{signin_change}
	killspawnedscript \{name = gameplay_end_game}
	killspawnedscript \{name = play_song_game_over_spawned}
	setup_sessionfuncs
	if NetSessionFunc \{Obj = session
			func = has_active_session}
		NetSessionFunc \{Obj = session
			func = stop_singleplayer_session}
	endif
	TutorialSystem_kill
	kill_gem_scroller \{no_render = 1
		restarting}
	killspawnedscript \{id = intro_highway_scripts}
	killspawnedscript \{id = intro_hud_scripts}
	destroy_movie_viewport
	clean_up_user_control_helpers
	Menu_Music_Off
	unload_songqpak
	destroy_downloads_EnumContent
	if (<unloadcontent> = 1)
		Downloads_UnloadContent
		RemoveContentFiles
		reset_globaltags_all
	endif
	reset_dlc_signin_state
	if ScreenElementExists \{id = ready_container_p2}
		DestroyScreenElement \{id = ready_container_p2}
	endif
	set_default_misc_globals
	cleanup_songwon_event
	persistent_band_force_unique_musicians
	SetSoundBussParams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)}}
	UnpauseGame
	spawnscriptnow \{song_preview_monitor}
	Change \{shutdown_game_for_signin_change_flag = 0}
	printf \{qs(0x6c8afce2)}
endscript

script cleanup_songwon_event 
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	killspawnedscript \{name = jiggle_text_array_elements}
	killspawnedscript \{name = You_Rock_Waiting_Crowd_SFX}
	killspawnedscript \{name = GuitarEvent_SongWon_Spawned}
endscript

script set_default_misc_globals 
	Change \{old_song = None}
	Change \{end_credits = 0}
	Change \{current_song_qpak_performance = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{songtime_paused = 0}
	Change \{songlist_song_preview_changing = 0}
	Change \{game_mode = p1_quickplay}
	Change \{generic_menu_block_input = 0}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{g_marketplace_responding_to_error = 0}
	Change \{respond_to_signin_changed_func = None}
	clear_exclusive_devices
endscript
