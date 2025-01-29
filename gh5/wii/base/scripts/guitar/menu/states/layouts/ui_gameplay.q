gameplay_restart_song = 0
gameplay_loading_transition = 0
g_main_menu_safe = 0

script ui_create_gameplay 
	Change \{g_main_menu_safe = 0}
	if ($gameplay_restart_song = 1)
		loading_transition = ($gameplay_loading_transition)
		Change \{gameplay_loading_transition = 0}
		SpawnScriptNow restart_song params = {loading_transition = <loading_transition>}
		Change \{gameplay_restart_song = 0}
	endif
	if NOT ($game_mode = freeplay)
		vocals_mute_all_mics \{mute = FALSE}
	endif
	if GotParam \{from_pause}
		SpawnScriptNow \{ui_create_gameplay_spawned
			params = {
				from_pause = from_pause
			}}
		ui_event_remove_params \{param = from_pause}
	else
		SpawnScriptNow ui_create_gameplay_spawned params = {freeplay_auto_join_device = <freeplay_auto_join_device>}
		ui_event_remove_params \{param = freeplay_auto_join_device}
	endif
	if ($game_mode = freeplay)
		safe_destroy \{id = attract_screen}
		CreateScreenElement \{Type = descinterface
			parent = root_window
			id = attract_screen
			desc = 'attract_screen'
			Hide}
	endif
endscript

script ui_destroy_gameplay 
	safe_destroy \{id = attract_screen}
	destroy_freeplay_jump_in_event_handler
endscript
hack_global_to_allow_jam_songs_to_patch_a_single_frame_that_restart_gem_scroller_is_not_running = 0

script ui_create_gameplay_spawned 
	setscriptcannotpause
	spawn_player_drop_listeners \{drop_player_script = gameplay_drop_player
		end_game_script = gameplay_end_game}
	ui_event_wait_for_safe
	Wait \{5
		gameframes}
	disable_pause
	Change \{hack_global_to_allow_jam_songs_to_patch_a_single_frame_that_restart_gem_scroller_is_not_running = 0}
	begin
	if NOT ScriptIsRunning \{restart_song}
		if NOT ScriptIsRunning \{restart_gem_scroller}
			if ($is_changing_levels = 0)
				if ($hack_global_to_allow_jam_songs_to_patch_a_single_frame_that_restart_gem_scroller_is_not_running = 0)
					break
				endif
			endif
		endif
	endif
	Wait \{1
		gameframe}
	disable_pause \{nospam}
	repeat
	if NOT ScreenElementExists \{id = mushroomcloudhand}
		if NOT ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
			if NOT GotParam \{from_pause}
				enable_pause
			endif
		endif
	endif
	if GotParam \{from_pause}
		ui_event_remove_params \{param = from_pause}
	endif
	ResumeControllerChecking
	Change \{sysnotify_paused_controllers = [
		]}
	wii_timer_report
	wii_timer_clear
	gamemode_gettype
	if (<Type> = freeplay)
		freeplay_refresh_ui_setup
		freeplay_enable_menus freeplay_auto_join_device = <freeplay_auto_join_device>
		force_highways_to_actual_positions
		disable_pause
	endif
	if ($calibrate_lag_enabled = 1)
		setup_pause \{pad_start_script = calibrate_hit_pause}
	endif
	if ($freestyle_just_exited = true)
		Wait \{5
			frames}
		ui_freeplay_handle_start \{device_num = $primary_controller}
	endif
endscript
is_gameplay_on_ui_stack = 0

script ui_init_gameplay 
	Change \{is_gameplay_on_ui_stack = 1}
	hack_toggleforceflarerendering
	sdcardmanagerfunc \{func = push_lock_card}
	roadie_battle_init_gameplay
endscript

script ui_deinit_gameplay 
	Change \{is_gameplay_on_ui_stack = 0}
	hack_toggleforceflarerendering
	sdcardmanagerfunc \{func = pop_lock_card}
	printf \{'ui_deinit_gameplay'}
	roadie_battle_deinit_gameplay
	KillSpawnedScript \{Name = ui_create_gameplay_spawned}
	setstageshowstyle \{style = high_energy}
	freeplay_music_crowd_transitions \{transition = 'Pause_To_Game'}
	SpawnScriptNow \{kill_gem_scroller
		params = {
			no_render = 1
		}}
	if ($calibrate_lag_enabled = 1)
		SpawnScriptNow \{calibrate_highway_shutdown}
	endif
	Change \{song_heap_required = 0}
	hide_glitch \{num_frames = 10}
	if ScreenElementExists \{id = mushroomcloudhand}
		DestroyScreenElement \{id = mushroomcloudhand}
	endif
	UnPauseGame
	if NOT ui_event_exists_in_stack \{Name = 'select_song_section'}
		sd_unload_song
	endif
	disable_pause
	popvideovenues
	if musicstudio_mainobj :musicstudio_isplayingsongingame
		stop_custom_song
		if musicstudio_mainobj :musicstudio_isinmusicstudio
			Heap = quota_samples
			unload_gempaks Heap = <Heap>
			if ispakloaded 'pak/oogame/oogame.pak' Heap = <Heap>
				UnLoadPak 'pak/oogame/oogame.pak' Heap = <Heap>
			endif
			unload_musicstudio_gameplay_sfx
			load_musicstudio_previews
		else
			musicstudio_instrument_unloadall
		endif
		musicstudio_mainobj :musicstudio_setplayingsongingame \{playing = FALSE}
	endif
	Change \{songtime_paused = 0}
endscript

script ui_return_gameplay 
	if ($calibrate_lag_enabled = 1)
		calibrate_highway_return
	endif
endscript

script animate_drop_player_msg 
	RequireParams \{[
			drop_msg
		]
		all}
	if (<part> = vocals)
		<parent_id> :se_setprops meters_menu_alpha = 0.0 time = 0.2
	endif
	Obj_GetID
	<objID> :se_setprops {gamertag_alpha = 1.0 gamertag_name_text = <drop_msg> gamertag_scale = (2.0, 1.0) time = 0.1 motion = ease_out}
	<objID> :se_waitprops
	<objID> :se_setprops {gamertag_scale = (1.2, 1.0) time = 0.1 motion = ease_out}
	<objID> :se_waitprops
endscript

script gameplay_drop_player 
	printf \{qs(0xbbbe3929)}
	gamemode_gettype
	if (<is_game_over> = 0)
		if (<Type> = career)
			getplayerinfo <dropped_player_num> Band
			removeplayerfromband Player = <dropped_player_num> Band = <Band>
			setplayerinfo <dropped_player_num> is_local_client = 0
			setplayerinfo <dropped_player_num> net_id_first = 0
			setplayerinfo <dropped_player_num> net_id_second = 0
			setplayerinfo <dropped_player_num> net_obj_id = -1
			setplayerinfo <dropped_player_num> team = 0
			setplayerinfo <dropped_player_num> Band = 1
			setplayerinfo <dropped_player_num> party_id = -1
			setplayerinfo <dropped_player_num> in_game = 0
			Change net_num_players = (($net_num_players) - 1)
			Change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		else
			if playerinfoequals <dropped_player_num> is_onscreen = 1
				LaunchGemEvent event = kill_objects_and_switch_player_non_interactive Player = <dropped_player_num>
			endif
			setplayerinfo <dropped_player_num> in_game = 0
			getplayerinfo <dropped_player_num> Band
			removeplayerfromband Player = <dropped_player_num> Band = <Band>
		endif
		switch <drop_reason>
			case net_message_player_quit
			formatText TextName = drop_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formatText TextName = drop_msg qs(0xd4b272d7) s = <name_string>
			default
			drop_msg = qs(0x00000000)
		endswitch
		getplayerinfo <dropped_player_num> part
		if playerinfoequals <dropped_player_num> is_onscreen = 1
			if (<part> = vocals)
				getplayerinfo <dropped_player_num> combo_meter_id out = highway_hud_root
			else
				get_highway_hud_root_id Player = <dropped_player_num>
			endif
			if ScreenElementExists id = <highway_hud_root>
				getplayerinfo <dropped_player_num> part
				if <highway_hud_root> :desc_resolvealias Name = alias_hud_gamertag param = hud_gamertag
					<hud_gamertag> :Obj_SpawnScriptNow animate_drop_player_msg params = {drop_msg = <drop_msg> parent_id = <highway_hud_root> part = <part>}
				endif
			endif
		endif
	else
		if (<Type> = competitive || (<Type> = pro_faceoff))
			if (<dropped_player_num> > 0)
				printf \{qs(0x3efb5626)}
				setplayerinfo <dropped_player_num> score = 0.0
			endif
		endif
	endif
endscript

script gameplay_end_game 
	printf \{qs(0x743ca546)}
	printstruct <...>
	destroy_dialog_box
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		if GotParam \{no_unpause}
			net_disable_pause \{no_unpause}
		else
			net_disable_pause
		endif
		switch <drop_reason>
			case net_message_player_quit
			formatText TextName = first_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formatText TextName = first_msg qs(0xd4b272d7) s = <name_string>
			default
			first_msg = qs(0x00000000)
		endswitch
		formatText TextName = msg qs(0x78bb855f) s = <first_msg>
		ui_event_get_stack
		if ((<stack> [0].base_name) = 'controller_disconnect')
			ui_event \{event = menu_back}
			ui_event_wait_for_safe
		endif
		create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
		if ScreenElementExists \{id = dialog_box_desc_id}
			dialog_box_desc_id :Obj_SpawnScriptNow gameplay_end_game_spawned id = not_ui_player_drop_scripts params = {<...>}
		endif
	endif
endscript

script gameplay_end_game_spawned 
	setscriptcannotpause
	printf \{qs(0x2094a470)}
	Wait \{3
		Seconds}
	ui_event_get_stack
	if (((<stack> [0].base_name) = 'connection_loss') || ((<stack> [0].base_name) = 'signin_changed'))
		return
	endif
	destroy_net_popup
	if ScriptIsRunning \{handle_signin_changed}
		return
	endif
	gamemode_gettype
	if (<Type> = career)
		if ($playing_song = 1)
			kill_gem_scroller
		endif
		quit_network_game_early
		band_lobby_restore_prematchmaking_settings
		ui_event_get_stack
		if (((<stack> [0].base_name) = 'connection_loss') || ((<stack> [0].base_name) = 'signin_changed'))
			return
		endif
		GetGlobalTags \{user_options}
		if (<autosave> = 1)
			if ui_event_is_top_popup
				ui_memcard_autosave_replace \{event = menu_back
					state = uistate_band_lobby_setup
					data = {
						all_active_players = true
					}}
			else
				ui_memcard_autosave \{event = menu_back
					state = uistate_band_lobby_setup
					data = {
						all_active_players = true
					}}
			endif
		else
			ui_event_block \{event = menu_back
				state = uistate_band_lobby_setup}
		endif
	else
		if NOT (GameIsOver)
			ExtendCrc \{song_won
				'p1'
				out = Type}
			broadcastevent Type = <Type>
		endif
	endif
	printf \{qs(0x713cc07b)}
endscript
