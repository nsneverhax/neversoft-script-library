gameplay_restart_song = 0
gameplay_loading_transition = 0

script ui_create_gameplay 
	if ($gameplay_restart_song = 1)
		loading_transition = ($gameplay_loading_transition)
		Change \{gameplay_loading_transition = 0}
		SpawnScriptNow restart_song params = {loading_transition = <loading_transition>}
		Change \{gameplay_restart_song = 0}
	endif
	vocals_mute_all_mics \{mute = FALSE}
	SpawnScriptNow \{ui_create_gameplay_spawned}
	if ($is_network_game = 1)
		gamemode_getnumplayers
		if (4 <= <num_players>)
			NetSessionFunc \{Obj = voice
				func = turnteamtalkon}
		endif
	endif
	StopSoundEvent \{ecstacyofgold}
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
						if NOT ScriptIsRunning \{practice_update}
							if NOT ScriptIsRunning \{gameplay_end_game_spawned}
								if NOT ScreenElementExists \{id = yourock}
									enable_pause
								endif
							endif
						endif
					endif
				endif
			endif
		endif
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
endscript

script ui_deinit_gameplay 
	printf \{'ui_deinit_gameplay'}
	KillSpawnedScript \{Name = ui_create_gameplay_spawned}
	SpawnScriptNow \{kill_gem_scroller}
	Transition_KillAll
	destroy_intro
	if ScreenElementExists \{id = yourock}
		DestroyScreenElement \{id = yourock}
	endif
	UnPauseGame
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
		setplayerinfo <dropped_player_num> guitar_volume = 100
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
	destroy_popup_warning_menu
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		net_disable_pause
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
		if ScreenElementExists \{id = popupelement}
			popupelement :Obj_SpawnScriptNow \{gameplay_end_game_spawned
				id = not_ui_player_drop_scripts}
		endif
	endif
endscript

script gameplay_end_game_spawned 
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
endscript
