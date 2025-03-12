
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
	setscriptcannotpause
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_all_players = 0}
	change \{respond_to_signin_changed_func = none}
	change \{shutdown_game_for_signin_change_flag = 1}
	if scriptisrunning \{song_preview_monitor}
		killspawnedscript \{name = song_preview_monitor}
	endif
	if isxenon
		if gotparam \{is_primary_controller}
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
	0xc9083294
	wait_for_safe_shutdown
	launchevent \{type = unfocus
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
	destroy_loading_screen \{force = 1}
	killallmovies
	startrendering
	setbuttoneventmappings \{unblock_menu_input}
	reset_song_loading_hack_global
	spawnscriptnow \{song_preview_monitor}
	printf \{qs(0xdb049d9c)}
endscript

script signing_change_confirm_reboot 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf \{qs(0xedc39bfe)}
	if screenelementexists \{id = dialog_box_vmenu}
		launchevent \{type = unfocus
			target = dialog_box_vmenu}
	endif
	ui_event \{event = menu_change
		data = {
			state = uistate_freeplay
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
	if scriptexists \{counter_play_beep_spawn}
		killspawnedscript \{name = counter_play_beep_spawn}
	endif
	stopsoundevent \{gameplay_vote_countdown}
	killspawnedscript \{name = spawnedoneshotbeginrepeatloop}
	killspawnedscript \{name = oneshotsbetweensongs}
	killspawnedscript \{name = surgebetweensongs}
	spawnscriptnow \{kill_transition_preload_streams}
	change \{shutdown_game_for_signin_change_flag = 1}
	stopallsounds
	killmenumusic
	killspawnedscript \{name = ui_signin_check}
	killspawnedscript \{name = net_init}
	killspawnedscript \{name = do_calibration_update}
	killspawnedscript \{name = cl_do_ping}
	killspawnedscript \{name = kill_off_and_finish_calibration}
	killspawnedscript \{name = menu_calibrate_lag_create_circles}
	killspawnedscript \{name = gameplay_end_game}
	killspawnedscript \{name = net_party_lost_party_connection_kill_popup}
	netsessionfunc \{obj = match
		func = cancel_join_server}
	set_demonware_failed
	destroy_player_drop_events
	killspawnedscript \{id = not_ui_player_drop_scripts}
	end_practice_song_slomo
	memcard_sequence_cleanup_generic
	kill_intro_celeb_ui
	killspawnedscript \{name = smoothmenuscroll}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	cheat_turnoffalllocked
	destroy_credits_menu
	quit_network_game_early \{signin_change}
	killspawnedscript \{name = gameplay_end_game}
	killspawnedscript \{name = play_song_game_over_spawned}
	setup_sessionfuncs
	if netsessionfunc \{obj = session
			func = has_active_session}
		netsessionfunc \{obj = session
			func = stop_singleplayer_session}
	endif
	tutorialsystem_kill
	kill_gem_scroller \{no_render = 1
		restarting}
	killspawnedscript \{id = 0x74623032}
	killspawnedscript \{id = 0xea41e4af}
	destroy_movie_viewport
	clean_up_user_control_helpers
	menu_music_off
	unload_songqpak
	destroy_downloads_enumcontent
	if (<unloadcontent> = 1)
		downloads_unloadcontent
		removecontentfiles
		if NOT demobuild
			reset_globaltags_all
		endif
	endif
	reset_dlc_signin_state
	if screenelementexists \{id = ready_container_p2}
		destroyscreenelement \{id = ready_container_p2}
	endif
	set_default_misc_globals
	cleanup_songwon_event
	persistent_band_force_unique_musicians
	setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)}}
	unpausegame
	spawnscriptnow \{song_preview_monitor}
	change \{shutdown_game_for_signin_change_flag = 0}
	printf \{qs(0x6c8afce2)}
endscript

script cleanup_songwon_event 
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	killspawnedscript \{name = jiggle_text_array_elements}
	killspawnedscript \{name = you_rock_waiting_crowd_sfx}
	killspawnedscript \{name = guitarevent_songwon_spawned}
endscript

script set_default_misc_globals 
	change \{old_song = none}
	change \{end_credits = 0}
	change \{current_song_qpak_performance = 0}
	change \{respond_to_signin_changed_all_players = 0}
	change \{songtime_paused = 0}
	change \{songlist_song_preview_changing = 0}
	change \{game_mode = p1_quickplay}
	change \{generic_menu_block_input = 0}
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_all_players = 0}
	change \{g_marketplace_responding_to_error = 0}
	change \{respond_to_signin_changed_func = none}
	clear_exclusive_devices
endscript
