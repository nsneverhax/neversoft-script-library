gameplay_restart_song = 0
gameplay_loading_transition = 0

script ui_create_gameplay 
	if GotParam \{from_pause}
		ui_event_remove_params \{param = from_pause}
		if NOT ($gameplay_restart_song = 1)
			vocals_mute_all_mics \{mute = FALSE}
			return
		endif
	endif
	show_highway
	if ($gameplay_restart_song = 1)
		loading_transition = ($gameplay_loading_transition)
		Change \{gameplay_loading_transition = 0}
		if NOT ScriptIsRunning \{restart_song}
			SpawnScriptNow restart_song params = {loading_transition = <loading_transition>}
		endif
		Change \{gameplay_restart_song = 0}
	endif
	SpawnScriptNow \{ui_create_gameplay_spawned}
endscript

script ui_destroy_gameplay 
	if ScreenElementExists \{id = intro_container}
		DestroyScreenElement \{id = intro_container}
	endif
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
	vocals_mute_all_mics \{mute = FALSE}
endscript

script ui_deinit_gameplay 
	0xe9384b7a \{full}
	Change menu_flow_locked = ($menu_flow_locked + 1)

	KillSpawnedScript \{Name = ui_create_gameplay_spawned}
	SpawnScriptNow \{kill_gem_scroller}
	if ScreenElementExists \{id = You_Rock}
		DestroyScreenElement \{id = You_Rock}
	endif
	UnPauseGame
	disable_pause
	if NOT ui_event_exists_in_stack \{Name = 'jam'}
		if ($game_mode = gh4_p1_career || $game_mode = gh4_p2_career || $band_mode_mode = career)
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
