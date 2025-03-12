is_shutdown_safe = 1

script mark_unsafe_for_shutdown 
	printscriptinfo \{'mark_unsafe_for_shutdown'}
	change \{is_shutdown_safe = 0}
endscript

script mark_safe_for_shutdown 
	printscriptinfo \{'mark_safe_for_shutdown'}
	change \{is_shutdown_safe = 1}
	unpausespawnedscript \{wait_for_safe_shutdown}
endscript

script wait_for_safe_shutdown 
	begin
	if ($is_shutdown_safe = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script handle_signin_changed 
endscript

script signing_change_confirm_reboot 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf \{qs(0xedc39bfe)}
	if screenelementexists \{id = pu_warning_vmenu}
		launchevent \{type = unfocus
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
	killspawnedscript \{name = spawnedoneshotbeginrepeatloop}
	killspawnedscript \{name = oneshotsbetweensongs}
	killspawnedscript \{name = surgebetweensongs}
	spawnscriptnow \{kill_transition_preload_streams}
	change \{shutdown_game_for_signin_change_flag = 1}
	stopallsounds
	killmenumusic
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
	destroy_alert_popup \{force = 1
		no_sound = 1}
	end_practice_song_slomo
	memcard_sequence_cleanup_generic
	destroy_leaving_lobby_dialog
	kill_intro_celeb_ui
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
	tutorial_shutdown
	deregisteratoms
	kill_gem_scroller \{no_render = 1
		restarting}
	destroy_movie_viewport
	clean_up_user_control_helpers
	menu_music_off
	unload_songqpak
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	destroy_band \{unload_paks}
	destroy_downloads_enumcontent
	if screenelementexists \{id = ready_container_p2}
		destroyscreenelement \{id = ready_container_p2}
	endif
	set_default_misc_globals
	cleanup_songwon_event
	clear_wait_for_net_match_available_items
	unpausegame
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
	change \{show_boss_helper_screen = 0}
	change \{use_last_player_scores = 0}
	change \{old_song = none}
	change \{devil_finish = 0}
	change \{end_credits = 0}
	change \{battle_do_or_die = 0}
	change \{battle_do_or_die_speed_scale = 1.0}
	change \{battle_do_or_die_attack_scale = 1.0}
	change \{menu_flow_locked = 0}
	change \{coop_dlc_active = 0}
	change \{current_song_qpak_performance = 0}
	change \{respond_to_signin_changed_all_players = 0}
	change \{songtime_paused = 0}
	change \{setlist_songpreview_changing = 0}
	change \{game_mode = p1_quickplay}
	change \{menu_over_ride_exclusive_device = -1}
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_all_players = 0}
	change \{respond_to_signin_changed_func = none}
	clear_exclusive_devices
	achievements_resetglobals
endscript
