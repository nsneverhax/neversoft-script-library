
script CutsceneFull_Setup 
	if NOT cd
		if gotparam from_menu
			cutscene_debug_goal_logic <...>
		endif
	endif
	skater :disableplayerinput
	skater :disablecameracontrol
	if gotparam UseFadeToBlack
		if NOT gotparam SkipInitialFade
			if NOT gotparam goalretry
				if NOT gotparam from_menu
					startdelaysystemui
					skater :pausephysics
					fadetoblack on time = $cutscene_fadetoblack_time alpha = 0.0 id = screenfader show_loading
					screenfader :domorph alpha = 1.0 time = $cutscene_fadetoblack_time
					wait 1 gameframes
					stopdelaysystemui
				endif
			endif
		endif
	endif
	killspawnedscript id = igc_render_toggle
	stoprendering
	fadetoblack off
	if gotparam disableusermusic
		allowusermusic = false
	else
		allowusermusic = true
	endif
	printf "------------------------------------------------ eatme"
	printstruct <...>
	PreCutscene allowusermusic = <allowusermusic>
	if gotparam UseFadeToBlack
		cut_gel_enablescreenfader true
	endif
	HideAllPeds
	skater :hide
	cutscene_process_audio_params_start <audio_params>
	skater :spawnterrainsound action = stopsounds
	cutscene_remove_rigger_pieces
	cutscene_kill_vehicles
	cut_gs_initheaps
	cut_gel_initobjectlist
	cut_gel_processrefobjects
	PauseObjects
	pausespawnedscripts
	cutscene_handle_special_case_objects start
	cut_gel_loaddata
	cut_gel_waitloadfinished
	cutscene_process_audio_params_process_pause <audio_params> audio_wait_start_time = <audio_wait_start_time>
	cut_gel_preloadaudiostream
	cutscene_preload_bink <...>
	cut_gel_createinstances
	cut_gel_blendin time = 0.0
	cut_gel_setoverridescamera true
	PauseObjects
	cutscene_handle_special_case_objects start
	change cutscene_old_game_framerate = $game_lock_framerate
	change game_lock_framerate = 2
	cut_gel_waitpreloadaudiostreamfinished
	cutscene_wait_bink <...>
	cutscenestartvideo
	cutscene_start_bink <...>
	startrendering
endscript

script CutsceneFull_Cleanup 
	change game_lock_framerate = $cutscene_old_game_framerate
	stoprendering
	cut_gel_blendout time = 0
	flushcutscenedestroylist
	cut_gel_destroyinstances
	cutscene_kill_bink <...>
	cutscenekillobjects
	cut_gel_unloaddata
	cut_gel_waitunloadfinished
	cut_gel_destroydata
	tod_proxim_create_lightfx
	tod_proxim_reapply_lightfx
	cut_gs_destroyheaps
	cutscene_restore_vehicles
	cutscene_restore_rigger_pieces
	cutscene_process_audio_params_end <audio_params>
	cutscene_process_transition_params_end <transition_params>
	if gotparam from_menu
		fadetoblack off time = 0
	else
		if gotparam UseHiResData
			if NOT cd
				CutsceneFull_UnloadDelay
			endif
		endif
	endif
	skater :enableplayerinput
	skater :enablecameracontrol
	postcutscene
	cutscene_bounding_sphere_mondo_last_minute_Hack
	if NOT gotparam from_menu
		igc_temporarily_disable_rendering 6 gameframes
	endif
endscript
