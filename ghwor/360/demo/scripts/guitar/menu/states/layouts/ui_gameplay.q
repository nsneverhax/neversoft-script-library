gameplay_restart_song = 0
gameplay_loading_transition = 0
g_main_menu_safe = 0
g_create_vocals_mask = 0

script ui_init_gameplay 
	if ($is_network_game)
		netsync_reset \{module = net_career_host_status_struct}
	endif
	killspawnedscript \{name = debug_write_user_leaderboard}
	killspawnedscript \{name = rock_record_read_friends}
endscript

script ui_create_gameplay \{repausing = false}
	if gotparam \{from_calibrate_lag}
		ui_event_remove_params \{param = from_calibrate_lag}
		stoprendering
	endif
	marketplacepersistencefunc \{func = pause}
	marketplacebgmonitorfunc \{func = set_background_download
		off}
	marketplacebgmonitorfunc \{func = stop_scan}
	destroy_friend_feed
	gamerpic_cancel_texture_downloads
	change \{g_main_menu_safe = 0}
	if ($gameplay_restart_song = 1)
		playlist_getcurrentsong
		loading_transition = ($gameplay_loading_transition)
		change \{gameplay_loading_transition = 0}
		spawnscriptnow restart_song params = {loading_transition = <loading_transition>}
		change \{gameplay_restart_song = 0}
	endif
	dynamic_ad_stop
	<mute> = false
	<current_song> = none
	playlist_getcurrentsong
	if arraycontains array = $g_transformation_dummy_songs contains = <current_song>
		<mute> = true
	endif
	vocals_mute_all_mics mute = <mute>
	spawnscriptnow ui_create_gameplay_spawned params = {freeplay_auto_join_device = <freeplay_auto_join_device> repausing = <repausing>}
	ui_event_remove_params \{param = freeplay_auto_join_device}
	if ($is_network_game = 1)
		if teammodeequals \{team_mode = two_teams}
			printf \{qs(0x05eaf16a)}
			netsessionfunc \{obj = voice
				func = turnteamtalkon}
		endif
	endif
	if ($game_mode = freeplay)
		destroyscreenelement \{id = attract_screen}
		createscreenelement \{type = descinterface
			parent = root_window
			id = attract_screen
			desc = 'attract_screen'
			hide}
	endif
	if ($calibrate_lag_enabled = 1)
		change \{calibrate_gameplay_ready = 1}
	endif
	if (($g_create_vocals_mask) = 0)
		create_vocals_spoken_word_mask_material
		change \{g_create_vocals_mask = 1}
	endif
	if ($g_memcard_ingame_is_paused = 1)
		printf \{'Unpausing because of memcard'}
		change \{g_memcard_ingame_is_paused = 0}
		unpausegame
	endif
	song_outro_anims_add_helper
endscript

script ui_destroy_gameplay 
	safe_destroy \{id = attract_screen}
	destroy_freeplay_jump_in_event_handler
	killspawnedscript \{name = career_wait_for_intro}
endscript

script ui_create_gameplay_spawned 
	setscriptcannotpause
	spawn_player_drop_listeners \{drop_player_script = gameplay_drop_player
		end_game_script = gameplay_end_game}
	ui_event_wait_for_safe
	launchevent \{type = focus
		target = root_window}
	disable_pause
	begin
	if NOT scriptisrunning \{restart_song}
		if NOT scriptisrunning \{restart_gem_scroller}
			if ($is_changing_levels = 0)
				break
			endif
		endif
	endif
	wait \{1
		gameframe}
	disable_pause \{nospam}
	repeat
	gamemode_gettype
	<pausing_enabled> = 0
	if NOT screenelementexists \{id = mushroomcloudhand}
		if (<type> != freeplay)
			if ($in_sing_a_long = false)
				<pausing_enabled> = 1
			endif
		endif
	endif
	if (<type> = career)
		quest_progression_get_transition_level_name
		playlist_getcurrentsong
		if (<current_song> = <transition_level_name>)
			<pausing_enabled> = 0
		endif
		if ($current_playing_transition = celebintro ||
				$current_playing_transition = finalbattleintro ||
				$current_playing_transition = rushintro ||
				$current_playing_transition = rushoutro)
			<pausing_enabled> = 0
			spawnscriptnow \{career_wait_for_intro}
		endif
	endif
	if (<pausing_enabled> = 1)
		if NOT song_outro_anims_showing
			enable_pause
		endif
	endif
	resumecontrollerchecking
	clear_paused_controllers
	change \{unknown_drum_type = 0}
	set_rich_presence_game_mode
	change \{g_boot_sysnotify_wait = false}
	if (<type> = freeplay)
		freeplay_refresh_ui_setup \{async = 0}
		if (<repausing> = false)
			freeplay_enable_menus freeplay_auto_join_device = <freeplay_auto_join_device>
		endif
		force_highways_to_actual_positions
		disable_pause
	endif
	if ($calibrate_lag_enabled = 1)
		setup_pause \{pad_start_script = calibrate_hit_pause}
	endif
	change \{g_main_menu_safe = 1}
endscript

script ui_deinit_gameplay 
	printf \{'ui_deinit_gameplay'}
	killspawnedscript \{name = ui_create_gameplay_spawned}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	lightshow_notingameplay_setmood \{mood = menu}
	if innetgame
		printf \{qs(0x363f8421)}
		netsessionfunc \{obj = voice
			func = turnteamtalkoff}
	endif
	gamemode_gettype
	if (<type> = freeplay)
		destroy_band = 0
	else
		destroy_band = 1
	endif
	if (<type> = quickplay)
		quickplay_unload_challenges
	endif
	if ($practice_enabled = 1)
		shut_down_practice_mode
	endif
	kill_gem_scroller destroy_band = <destroy_band>
	if ($calibrate_lag_enabled = 1)
		spawnscriptnow \{calibrate_highway_shutdown}
	endif
	change \{song_heap_required = 0}
	if screenelementexists \{id = mushroomcloudhand}
		destroyscreenelement \{id = mushroomcloudhand}
	endif
	if screenelementexists \{id = song_outro_anims_container}
		destroyscreenelement \{id = song_outro_anims_container}
	endif
	unpausegame
	disable_pause
	musicstudio_mainobj :musicstudio_setplayingsongingame \{playing = false}
	change \{g_band_use_alt_positions = 0}
	change \{songtime_paused = 0}
	change \{g_memcard_ingame_is_paused = 0}
	stopsongstarcalculation
endscript

script ui_return_gameplay 
	if ($calibrate_lag_enabled = 1)
		calibrate_highway_return
	endif
endscript

script animate_drop_player_msg 
	requireparams \{[
			drop_msg
		]
		all}
	if (<part> = vocals)
		<parent_id> :se_setprops meters_menu_alpha = 0.0 time = 0.2
	endif
	obj_getid
	<objid> :se_setprops {gamertag_alpha = 1.0 gamertag_name_text = <drop_msg> gamertag_scale = (2.0, 1.0) time = 0.1 motion = ease_out}
	<objid> :se_waitprops
	<objid> :se_setprops {gamertag_scale = (1.2, 1.0) time = 0.1 motion = ease_out}
	<objid> :se_waitprops
endscript

script animate_off_screen_drop_player_msg \{drop_msg = 0x69696969}
	obj_getid
	<objid> :se_setprops {gamertag_text = <drop_msg> scale = (2.0, 1.0) time = 0.1 motion = ease_out}
	<objid> :se_waitprops
	<objid> :se_setprops {scale = (1.0, 1.0) time = 0.1 motion = ease_out}
	<objid> :se_waitprops
endscript

script gameplay_drop_player 
	printf \{qs(0xbbbe3929)}
	gamemode_gettype
	if (<is_game_over> = 0)
		if (<type> = career)
			career_wait_for_intro
			getplayerinfo <dropped_player_num> band
			removeplayerfromband player = <dropped_player_num> band = <band>
			setplayerinfo <dropped_player_num> is_local_client = 0
			setplayerinfo <dropped_player_num> net_id_first = 0
			setplayerinfo <dropped_player_num> net_id_second = 0
			setplayerinfo <dropped_player_num> net_obj_id = -1
			setplayerinfo <dropped_player_num> band = 1
			setplayerinfo <dropped_player_num> party_id = -1
			setplayerinfo <dropped_player_num> in_game = 0
			change net_num_players = (($net_num_players) - 1)
			change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		else
			if playerinfoequals <dropped_player_num> is_onscreen = 1
				launchgemevent event = kill_objects_and_switch_player_non_interactive player = <dropped_player_num>
				whammyfxoffall player = <dropped_player_num>
			endif
			setplayerinfo <dropped_player_num> in_game = 0
			getplayerinfo <dropped_player_num> band
			removeplayerfromband player = <dropped_player_num> band = <band>
		endif
		switch <drop_reason>
			case net_message_player_quit
			formattext textname = drop_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formattext textname = drop_msg qs(0xd4b272d7) s = <name_string>
			default
			drop_msg = qs(0x00000000)
		endswitch
		getplayerinfo <dropped_player_num> part
		if playerinfoequals <dropped_player_num> is_onscreen = 1
			quest_progression_get_transition_level_name
			playlist_getcurrentsong
			if (<current_song> = <transition_level_name>)
				spawnscriptnow net_generic_drop_player params = {<...>}
			else
				if (<part> = vocals)
					getplayerinfo <dropped_player_num> combo_meter_id out = highway_hud_root
				else
					get_highway_hud_root_id player = <dropped_player_num>
				endif
				if screenelementexists id = <highway_hud_root>
					getplayerinfo <dropped_player_num> part
					if <highway_hud_root> :desc_resolvealias name = alias_hud_gamertag param = hud_gamertag
						<hud_gamertag> :obj_spawnscriptnow animate_drop_player_msg params = {drop_msg = <drop_msg> parent_id = <highway_hud_root> part = <part>}
					endif
				endif
			endif
		elseif screenelementexists \{id = hud_root}
			if hud_root :desc_resolvealias \{name = alias_scoreboard_menu
					param = scoreboard_menu}
				if getscreenelementchildren id = <scoreboard_menu>
					getarraysize \{children}
					if (<array_size> > 0)
						<i> = 0
						begin
						<child_id> = (<children> [<i>])
						if <child_id> :obj_getintegertag tag_name = player assert = 0
							if (<integer_value> = <dropped_player_num>)
								<child_id> :obj_spawnscriptnow animate_off_screen_drop_player_msg params = {drop_msg = <drop_msg>}
								break
							endif
						endif
						<i> = (<i> + 1)
						repeat <array_size>
					endif
				endif
			endif
		endif
	else
		if (<type> = competitive || (<type> = pro_faceoff))
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
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <player> controller
			getplayerinfo <player> bot_play
			if NOT (<bot_play> = 1)
				if NOT checkforsignin controller_index = <controller> dont_set_primary
					printf qs(0x6e784de6) d = <controller>
					return
				endif
			endif
			getnextplayer local player = <player>
			repeat <num_players>
		endif
		if gotparam \{no_unpause}
			net_disable_pause \{no_unpause}
		else
			net_disable_pause
		endif
		switch <drop_reason>
			case net_message_player_quit
			formattext textname = first_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formattext textname = first_msg qs(0xd4b272d7) s = <name_string>
			default
			first_msg = qs(0x00000000)
		endswitch
		formattext textname = msg qs(0x78bb855f) s = <first_msg>
		ui_event_get_stack
		if ((<stack> [0].base_name) = 'controller_disconnect')
			ui_event \{event = menu_back}
			ui_event_wait_for_safe
		endif
		create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
		if screenelementexists \{id = dialog_box_desc_id}
			dialog_box_desc_id :obj_spawnscriptnow gameplay_end_game_spawned id = not_ui_player_drop_scripts params = {<...>}
		endif
	endif
endscript

script gameplay_end_game_spawned \{instant = 0}
	setscriptcannotpause
	printf \{qs(0x2094a470)}
	if (<instant> = 0)
		wait \{3
			seconds}
	endif
	ui_event_get_stack
	if (((<stack> [0].base_name) = 'connection_loss') || ((<stack> [0].base_name) = 'signin_changed'))
		return
	endif
	destroy_net_popup
	if scriptisrunning \{handle_signin_changed}
		return
	endif
	gamemode_gettype
	if (<type> = career)
		if ($playing_song = 1)
			kill_gem_scroller
		endif
		quit_network_game_early
		band_lobby_restore_prematchmaking_settings
		ui_event_get_stack
		if (((<stack> [0].base_name) = 'connection_loss') || ((<stack> [0].base_name) = 'signin_changed'))
			return
		endif
		audio_kill_cutscene_audio
		if ui_event_is_top_popup
			ui_memcard_autosave_all_players \{memcard_event = menu_replace
				event = menu_back
				state = uistate_band_lobby}
		else
			ui_memcard_autosave_all_players \{event = menu_back
				state = uistate_band_lobby}
		endif
	else
		if NOT (gameisover)
			extendcrc \{song_won
				'p1'
				out = type}
			broadcastevent type = <type>
		endif
	endif
	printf \{qs(0x713cc07b)}
endscript
