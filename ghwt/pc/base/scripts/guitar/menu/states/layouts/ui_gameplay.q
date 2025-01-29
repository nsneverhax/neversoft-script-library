gameplay_restart_song = 0
gameplay_loading_transition = 0

script ui_create_gameplay 
	if ($gameplay_restart_song = 1)
		loading_transition = ($gameplay_loading_transition)
		change \{gameplay_loading_transition = 0}
		spawnscriptnow restart_song params = {loading_transition = <loading_transition>}
		change \{gameplay_restart_song = 0}
	endif
	vocals_mute_all_mics \{mute = false}
	spawnscriptnow \{ui_create_gameplay_spawned}
	if ($is_network_game = 1)
		gamemode_getnumplayers
		if (4 <= <num_players>)
			netsessionfunc \{obj = voice
				func = turnteamtalkon}
		endif
	endif
endscript

script ui_destroy_gameplay 
	destroy_player_drop_events
endscript

script ui_create_gameplay_spawned 
	setscriptcannotpause
	spawn_player_drop_listeners \{drop_player_script = gameplay_drop_player
		end_game_script = gameplay_end_game}
	ui_event_wait_for_safe
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
	if NOT screenelementexists \{id = handsofgod}
		enable_pause
	endif
	resumecontrollerchecking
	change \{sysnotify_paused_controllers = [
		]}
	change \{unknown_drum_type = 0}
	if ($songtime_paused = 1)
		softassert \{'Hacky fix for bass pedal lockup'}
		change \{songtime_paused = 0}
		startrendering
	endif
endscript

script ui_deinit_gameplay 
	printf \{'ui_deinit_gameplay'}
	killspawnedscript \{name = ui_create_gameplay_spawned}
	spawnscriptnow \{kill_gem_scroller}
	if screenelementexists \{id = handsofgod}
		killspawnedscript \{name = anim_handsofgod}
		destroyscreenelement \{id = handsofgod}
	endif
	unpausegame
	disable_pause
	if NOT ui_event_exists_in_stack \{name = 'jam'}
		if ($game_mode = p1_career || $game_mode = p2_career || $band_mode_mode = career)
			band_builder_clear_random_appearances \{cpu_only}
		else
			if ($game_mode = p1_quickplay)
				band_builder_clear_random_appearances \{cpu_only}
			endif
		endif
	endif
endscript

script animate_drop_player_msg 
	requireparams \{[
			drop_msg
		]
		all}
	obj_getid
	<objid> :se_setprops {gamertag_alpha = 1.0 gamertag_name_text = <drop_msg> gamertag_scale = (3.0, 1.1) time = 0.1 motion = ease_out}
	<objid> :se_waitprops
	<objid> :se_setprops {gamertag_scale = (1.3, 1.1) time = 0.1 motion = ease_out}
	<objid> :se_waitprops
endscript

script gameplay_drop_player 
	printf \{qs(0xbbbe3929)}
	gamemode_gettype
	if (<is_game_over> = 0)
		if (<type> = career)
			setplayerinfo <dropped_player_num> is_local_client = 0
			setplayerinfo <dropped_player_num> net_id_first = 0
			setplayerinfo <dropped_player_num> net_id_second = 0
			setplayerinfo <dropped_player_num> net_obj_id = -1
			setplayerinfo <dropped_player_num> team = 0
			setplayerinfo <dropped_player_num> party_id = -1
			change net_num_players = (($net_num_players) - 1)
			change current_num_players = (($current_num_players) - 1)
			change num_players_in_band = (($num_players_in_band) - 1)
			formattext checksumname = mode 'p%d_career' d = ($current_num_players)
			change game_mode = <mode>
			change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		else
			printf \{qs(0x0fdb1295)}
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
		if screenelementexists \{id = hud_root}
			getplayerinfo <dropped_player_num> hud_parent
			if hud_root :desc_resolvealias name = <hud_parent> param = parent_id
				if screenelementexists id = {<parent_id> child = gamertag}
					resolvescreenelementid id = [
						{id = <parent_id>}
						{local_id = gamertag}
					]
				endif
			endif
			if gotparam \{resolved_id}
				<resolved_id> :obj_spawnscriptnow animate_drop_player_msg params = {drop_msg = <drop_msg>}
			endif
		endif
	else
		if ((<type> = faceoff) || (<type> = pro_faceoff))
			if ($current_num_players = 2)
				printf \{qs(0x3efb5626)}
				change \{structurename = player2_status
					score = 0.0}
			endif
		endif
	endif
endscript

script gameplay_end_game 
	printf \{qs(0x743ca546)}
	printstruct <...>
	destroy_popup_warning_menu
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		net_disable_pause
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
		create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
		wait \{3
			seconds}
		ui_event_get_stack
		if (((<stack> [0].base_name) = 'connection_loss') || ((<stack> [0].base_name) = 'signin_changed'))
			return
		endif
		destroy_net_popup
		if scriptisrunning \{handle_signin_changed}
			return
		endif
		if ($playing_song = 1)
			change \{achievements_early_quit_flag = 1}
		endif
		gamemode_gettype
		if (<type> = career)
			if ($playing_song = 1)
				kill_gem_scroller
			endif
			ui_event_get_stack
			if (((<stack> [0].base_name) = 'connection_loss') || ((<stack> [0].base_name) = 'signin_changed'))
				return
			endif
			ui_memcard_autosave \{event = menu_back
				state = uistate_group_play
				data = {
					all_active_players = true
				}}
		elseif ($game_mode = p2_battle)
			if NOT (gameisover)
				change \{structurename = player1_status
					current_health = 1.0}
				change \{structurename = player2_status
					current_health = 0.0}
				guitarevent_songwon \{battle_win = 1}
			endif
		else
			if NOT (gameisover)
				extendcrc \{song_won
					'p1'
					out = type}
				broadcastevent type = <type>
			endif
		endif
	endif
endscript
