
script ui_init_mainmenu 
	mainmenu_populate_menu_options_global
endscript

script ngc_init_rock_record_for_friend_feed 
	KillSpawnedScript \{Name = rock_record_read_friends}
	SpawnScriptNow \{rock_record_read_friends}
endscript
in_main_menu = 0

script ui_create_mainmenu \{do_not_add_friend_feed = 0}
	SpawnScriptNow \{audio_kill_crowds_during_stats_screen}
	ngc_init_rock_record_for_friend_feed
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	Change \{rich_presence_context = presence_menus}
	Change \{g_songlist_infinite_playlist = 0}
	Change \{g_songlist_random_playlist = 0}
	Change \{g_songlist_num_5star_songs = 0}
	if demobuild
		ScriptAssert \{'Demo doesnt allow use of the main menu'}
		begin
		printf \{''}
		repeat
	endif
	enable_crowd_models_cfunc \{Active = true}
	SpawnScriptNow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned \{do_not_add_friend_feed = !i1768515945}
	setplayerinfo \{1
		in_game = 0}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	reset_stances_for_frontend
	sd_unload_song
	NetSessionFunc \{func = friends_init}
	Change \{g_current_band = default_band}
	if ScriptIsRunning \{handle_signin_changed}
		popunsafeforshutdown \{context = gameplay
			Type = unchecked}
		return
	endif
	Change \{in_main_menu = 1}
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	SpawnScriptNow \{persistent_band_cancel_lobby}
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	SpawnScriptNow \{persistent_band_cancel_lobby}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'}
		Change \{game_mode = quickplay}
		NetSessionFunc \{func = removeallcontrollers}
		fadetoblack \{OFF
			alpha = 1.0
			time = 0.1
			z_priority = 100
			no_wait}
		clean_up_user_control_helpers
		if NOT ScreenElementExists \{id = current_menu}
			create_main_menu_elements do_not_add_friend_feed = <do_not_add_friend_feed>
		endif
		create_main_menu
		mainmenu_id :desc_applyscene \{Name = Default}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100
			all_buttons}
		add_user_control_helper \{text = qs(0x8a778398)
			button = yellow
			z = 100
			all_buttons}
		mainmenu_id :obj_spawnscript \{main_menu_add_friendfeed_button_pill_spawned}
		LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		playlist_clear
		UnPauseGame
	endif
	Change \{g_current_music_dsp_snapshot_setting = 'game'}
	cancel_ds_operation
	destroy_mainmenu_bg
endscript

script ui_destroy_mainmenu 
	Change \{in_main_menu = 0}
	SpawnScriptNow \{destroy_main_menu}
	KillSpawnedScript \{Name = run_motd}
	KillSpawnedScript \{Name = run_motd_demon}
	if ScreenElementExists \{id = motdinterface}
		motdinterface :Die
	endif
	if ScreenElementExists \{id = main_menu_select_xbox_party_warning}
		destroy_dialog_box
	endif
endscript

script main_menu_signin_changed 
	printf \{qs(0x283e65d1)}
	removecontentfiles playerid = <controller>
	reset_globaltags savegame = <controller>
	safe_update_band_characters
	SpawnScriptNow \{main_menu_signin_changed_restore_friends_feed}
endscript

script main_menu_signin_changed_restore_friends_feed 
	Wait \{4
		gameframes}
	if ScriptIsRunning \{main_menu_signin_changed}
		return
	endif
	if ScreenElementExists \{id = current_menu}
		if ScreenElementExists \{id = mainmenu_id}
			current_menu :Obj_SpawnScriptLater \{attempt_to_add_friend_feed
				params = {
					menu = main
					parent_id = mainmenu_id
					event_handler = current_menu
				}}
		endif
	endif
endscript

script main_menu_add_friendfeed_button_pill_spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if ScreenElementExists \{id = friends_feed_desc_id}
		break
	endif
	Wait \{10
		gameframes}
	repeat
	if news_feed_should_add_button_helper
		if NOT user_control_helper_exists \{button = blue}
			add_user_control_helper \{text = qs(0x226893e8)
				button = blue
				z = 100
				all_buttons}
		else
			user_control_helper_change_text \{button = blue
				text = qs(0x226893e8)}
		endif
	endif
endscript

script ui_mainmenu_anim_out 
	mainmenu_animate \{id = mainmenu_id}
endscript
main_menu_fs = {
	create = ui_mainmenu_temp
	Destroy = destroy_main_menu
	actions = [
		{
			action = select_xbox_live
			flow_state = online_signin_fs
		}
	]
}

script ui_mainmenu_temp 
	ui_event \{event = menu_refresh}
endscript
