gameplay_restart_song = 0
gameplay_loading_transition = 0

script ui_create_gameplay 
	show_highway
	if ($gameplay_restart_song = 1)
		loading_transition = ($gameplay_loading_transition)
		Change \{gameplay_loading_transition = 0}
		SpawnScriptNow restart_song params = {loading_transition = <loading_transition>}
		Change \{gameplay_restart_song = 0}
	endif
	vocals_mute_all_mics \{mute = FALSE}
	if GotParam \{from_pause}
		SpawnScriptNow \{ui_create_gameplay_spawned
			params = {
				from_pause = from_pause
			}}
		ui_event_remove_params \{param = from_pause}
	else
		SpawnScriptNow \{ui_create_gameplay_spawned}
	endif
endscript

script ui_destroy_gameplay 
	destroy_player_drop_events
endscript

script ui_create_gameplay_spawned 
	setscriptcannotpause
	spawn_player_drop_listeners \{drop_player_script = gameplay_drop_player
		end_game_script = gameplay_end_game}
	Wait \{5
		gameframes}
	disable_pause
	begin
	if NOT ScriptIsRunning \{restart_song}
		if NOT ScriptIsRunning \{restart_gem_scroller}
			if ($is_changing_levels = 0)
				break
			endif
		endif
	endif
	Wait \{1
		gameframe}
	disable_pause \{nospam}
	repeat
	if NOT ScriptIsRunning \{GuitarEvent_SongFailed}
		if NOT ScriptIsRunning \{GuitarEvent_SongWon}
			if NOT ScriptIsRunning \{GuitarEvent_SongFailed_Spawned}
				if NOT ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
					if NOT ScriptIsRunning \{finish_practice_song}
						if NOT ScreenElementExists \{id = You_Rock}
							if NOT GotParam \{from_pause}
								enable_pause
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	if GotParam \{from_pause}
		ui_event_remove_params \{param = from_pause}
	endif
	gamemode_gettype
	if (<Type> = career)
		if NOT progression_check_intro_complete
			if ($transition_playing = true)
				if ($current_playing_transition = careerintro)
					disable_pause
				endif
			endif
		endif
	endif
	ResumeControllerChecking
	Change \{sysnotify_paused_controllers = [
		]}
	Change \{unknown_drum_type = 0}
	if ($songtime_paused = 1)
		Change \{songtime_paused = 0}
		StartRendering
	endif
	if GameIsPaused
		do_gh3_unpause
	endif
endscript

script ui_deinit_gameplay 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	printf \{'ui_deinit_gameplay'}
	KillSpawnedScript \{Name = ui_create_gameplay_spawned}
	SpawnScriptNow \{kill_gem_scroller
		params = {
			no_render = 1
		}}
	hide_glitch \{num_frames = 10}
	if ScreenElementExists \{id = handsofgod}
		KillSpawnedScript \{Name = anim_handsofgod}
		DestroyScreenElement \{id = handsofgod}
	endif
	UnPauseGame
	if NOT ui_event_exists_in_stack \{Name = 'select_song_section'}
		sd_unload_song
	endif
	disable_pause
	if NOT ui_event_exists_in_stack \{Name = 'jam'}
		if ($game_mode = p1_career || $game_mode = p2_career || $band_mode_mode = career)
			band_builder_clear_random_appearances \{cpu_only}
		else
			if ($game_mode = p1_quickplay)
				band_builder_clear_random_appearances \{cpu_only}
			endif
		endif
	endif
	0x136c76bb
	if 0x2e51d96c
		0x29472091
	endif
	Change menu_flow_locked = ($menu_flow_locked - 1)
	KillSpawnedScript \{Name = sysnotify_handle_pause_controller}
	KillSpawnedScript \{Name = sysnotify_handle_pause_controller_spawned}
endscript

script animate_drop_player_msg 
	RequireParams \{[
			drop_msg
		]
		all}
	Obj_GetID
	<objID> :se_setprops {gamertag_alpha = 1.0 gamertag_name_text = <drop_msg> gamertag_scale = (3.0, 1.1) time = 0.1 motion = ease_out}
	<objID> :se_waitprops
	<objID> :se_setprops {gamertag_scale = (1.3, 1.1) time = 0.1 motion = ease_out}
	<objID> :se_waitprops
endscript

script gameplay_drop_player 
	printf \{qs(0xbbbe3929)}
	gamemode_gettype
	if (<is_game_over> = 0)
		if (<Type> = career)
			setplayerinfo <dropped_player_num> is_local_client = 0
			setplayerinfo <dropped_player_num> net_id_first = 0
			setplayerinfo <dropped_player_num> net_id_second = 0
			setplayerinfo <dropped_player_num> net_obj_id = -1
			setplayerinfo <dropped_player_num> team = 0
			setplayerinfo <dropped_player_num> party_id = -1
			Change net_num_players = (($net_num_players) - 1)
			Change current_num_players = (($current_num_players) - 1)
			Change num_players_in_band = (($num_players_in_band) - 1)
			Change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		else
			printf \{qs(0x0fdb1295)}
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
		if ScreenElementExists \{id = hud_root}
			getplayerinfo <dropped_player_num> hud_parent
			if hud_root :desc_resolvealias Name = <hud_parent> param = parent_id
				if ScreenElementExists id = {<parent_id> child = gamertag}
					ResolveScreenElementID id = [
						{id = <parent_id>}
						{local_id = gamertag}
					]
				endif
			endif
			if GotParam \{resolved_id}
				<resolved_id> :Obj_SpawnScriptNow animate_drop_player_msg params = {drop_msg = <drop_msg>}
			endif
		endif
	else
		if ((<Type> = faceoff) || (<Type> = pro_faceoff))
			if ($current_num_players = 2)
				printf \{qs(0x3efb5626)}
				Change \{structurename = player2_status
					score = 0.0}
			endif
		endif
	endif
endscript

script gameplay_end_game 
	printf \{qs(0x743ca546)}
	printstruct <...>
	begin
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		if NOT ScriptIsRunning \{ui_create_gameplay_spawned}
			break
		endif
	endif
	WaitOneGameFrame
	repeat
	wait_for_safe_shutdown
	ui_event_wait_for_safe
	destroy_popup_warning_menu
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		net_disable_pause
		printf \{qs(0x0c5a0998)}
		0x248b5892
		switch <drop_reason>
			case net_message_player_quit
			formatText \{TextName = first_msg
				qs(0x6c11dd96)}
			case net_message_player_dropped
			case net_message_player_timed_out
			formatText \{TextName = first_msg
				qs(0x059fc06d)}
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
		Wait \{3
			Seconds}
		destroy_net_popup
		quit_network_game
		gamemode_gettype
		if (<Type> = career)
			if ($playing_song = 1)
				kill_gem_scroller
			endif
			GetGlobalTags \{user_options}
			if (<autosave> = 1)
				if ui_event_exists_in_stack \{Name = 'group_play'}
					printf \{qs(0x26ffae70)}
					Change \{is_network_game = 0}
					ui_event_get_top
					if (<base_name> = 'controller_disconnect')
						ui_event_block \{event = menu_back
							data = {
								state = uistate_group_play
							}}
					else
						ui_memcard_autosave \{event = menu_back
							state = uistate_group_play
							data = {
								all_active_players = true
							}}
					endif
				else
					printf \{qs(0x7a510fef)}
					ui_event_get_top
					if (<base_name> = 'controller_disconnect')
						ui_event_block \{event = menu_back
							data = {
								state = uistate_online
							}}
					else
						ui_memcard_autosave \{event = menu_back
							state = uistate_online
							data = {
								all_active_players = true
							}}
					endif
				endif
			else
				if ui_event_exists_in_stack \{Name = 'group_play'}
					printf \{qs(0x26ffae70)}
					Change \{is_network_game = 0}
					ui_event_block \{event = menu_back
						state = uistate_group_play}
				else
					printf \{qs(0x7a510fef)}
					ui_event_block \{event = menu_back
						state = uistate_online}
				endif
			endif
		elseif ($game_mode = p2_battle)
			if NOT (GameIsOver)
				Change \{structurename = player1_status
					current_health = 1.0}
				Change \{structurename = player2_status
					current_health = 0.0}
				GuitarEvent_SongWon \{battle_win = 1}
			endif
		else
			if NOT (GameIsOver)
				ExtendCrc \{song_won
					'p1'
					out = Type}
				broadcastevent Type = <Type> data = {song_complete = 0}
			endif
		endif
	endif
endscript

script 0x248b5892 
	i = 1
	begin
	printf qs(0x4e31bfba) d = <i>
	getplayerinfo <i> is_local_client
	if NOT (<is_local_client>)
		setplayerinfo <i> score = 0
	endif
	i = (<i> + 1)
	repeat 8
endscript
