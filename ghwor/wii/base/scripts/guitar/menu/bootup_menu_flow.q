
script wait_for_safe_shutdown 
	begin
	if isshutdownsafe
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
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = None}
	Change \{shutdown_game_for_signin_change_flag = 1}
	shutdown_preview_monitor
	if isXenon
		if GotParam \{is_primary_controller}
			printf \{'wait_for_safe_shutdown - checkout fix - is primary controller'}
			if marketplacefunc \{func = is_inited}
				printf \{'wait_for_safe_shutdown - checkout fix - marketplace is inited'}
				if marketplacefunc \{func = is_in_checkout}
					printf \{'wait_for_safe_shutdown - checkout fix - is in checkout'}
					if marketplacefunc \{func = cancel_checkout}
						printf \{'wait_for_safe_shutdown - checkout fix - cancel succeeded'}
					endif
				endif
			endif
		endif
	endif
	popunsafeforshutdown \{context = enter_music_central
		Type = unchecked}
	wait_for_safe_shutdown
	LaunchEvent \{Type = unfocus
		target = root_window}
	printf \{qs(0x7e5d73b7)}
	disable_pause
	Change \{disable_note_input = 0}
	create_loading_screen \{loading_screen_type = static}
	ui_event_wait_for_safe
	ui_event_block \{event = menu_back
		data = {
			state = uistate_null
			initing
		}}
	shutdown_game_for_signin_change \{signin_change = 1}
	ui_event_block \{event = menu_change
		data = {
			state = uistate_signin_changed
		}}
	destroy_loading_screen \{wait_for_unload}
	killallmovies
	if GotParam \{savegame}
		destroy_friend_feed
	endif
	StartRendering
	SetButtonEventMappings \{unblock_menu_input}
	SpawnScriptNow \{song_preview_monitor}
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
	ui_event \{event = menu_replace
		data = {
			state = uistate_freeplay
			clear_previous_stack
		}}
	printf \{qs(0x3b3199e6)}
endscript
shutdown_game_for_signin_change_flag = 0

script shutdown_game_for_signin_change \{unloadcontent = 1
		signin_change = 0}
	printf \{qs(0xc8952dcc)}
	if ScriptExists \{audio_gameplay_counter_play_beep_spawn}
		KillSpawnedScript \{Name = audio_gameplay_counter_play_beep_spawn}
	endif
	StopSoundEvent \{gameplay_vote_countdown}
	KillSpawnedScript \{Name = SpawnedOneShotBeginRepeatLoop}
	KillSpawnedScript \{Name = audio_crowd_play_one_shots_between_songs}
	KillSpawnedScript \{Name = audio_crowd_play_surge_between_songs}
	SpawnScriptNow \{kill_transition_preload_streams}
	Change \{shutdown_game_for_signin_change_flag = 1}
	StopAllSounds
	audio_ui_kill_menu_music
	Change \{net_pause = 0}
	KillSpawnedScript \{Name = ui_signin_check}
	KillSpawnedScript \{Name = net_init}
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
	kill_intro_celeb_ui
	KillSpawnedScript \{Name = smoothmenuscroll}
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
	tutorialsystem_kill
	kill_gem_scroller \{no_render = 1
		restarting}
	KillSpawnedScript \{id = intro_scripts}
	clean_up_user_control_helpers
	audio_ui_menu_music_off \{setflag = 1}
	unload_songqpak
	Change \{load_songqpak_lock = 0}
	if (<unloadcontent> = 1)
		Downloads_UnloadContent
		contentfoldermanager \{func = CLEAR}
		if NOT demobuild
			reset_globaltags_all
		endif
	endif
	set_default_misc_globals
	cleanup_songwon_event
	persistent_band_force_unique_musicians
	wait_for_calibrate_shutdown
	Change \{g_memcard_ingame_is_paused = 0}
	Change \{g_enable_pause_for_drum_type_missmatch = 0}
	destroy_mainmenu_bg
	setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)}}
	UnPauseGame
	SpawnScriptNow \{song_preview_monitor}
	Change \{shutdown_game_for_signin_change_flag = 0}
	printf \{qs(0x6c8afce2)}
endscript

script cleanup_songwon_event 
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	KillSpawnedScript \{Name = audio_gameplay_you_rock_crowd_waiting}
	KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
endscript

script set_default_misc_globals 
	Change \{end_credits = 0}
	Change \{menu_flow_locked = 0}
	Change \{current_song_qpak_performance = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{songtime_paused = 0}
	Change \{songlist_song_preview_changing = 0}
	Change \{game_mode = quickplay}
	Change \{generic_menu_block_input = 0}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = None}
endscript
