freestyle_song = tenseconddebug
freestyle_song_pak = 'songs/tenseconddebug.pak'
freestyle_in_flow = 0
freestyle_active = 0
freestyle_rocking_out_too_hard = 0
freestyle_home_menu_paused = 0
freestyle_home_menu_already_paused = 0
freestyle_beats_per_minute = 0
freestyle_beats_per_measure = 0
freestyle_game_mode = standard
freestyle_game_from_postgame = 0
freestyle_random_seed = 0
freestyle_is_song_saveable = FALSE
freestyle_optimization_counter = 0
freestyle_fsfx_saved = 0
freestyle_loading_screen_type = None
freestyle_restarting = FALSE
freestyle_ds_has_disconnected = FALSE

script freestyle_set_start_key_binding 
	printf \{qs(0xb526b91a)}
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				freestyle_start_pressed
			}
		]
		replace_handlers}
endscript

script freestyle_start_pressed 
	if NOT (($freestyle_game_mode) = tutorial)
		freestyle_spawn_pause_menu device_num = <device_num>
	else
		controller = ($freestyle_player_data [0].controller)
		if (<controller> = <device_num>)
			freestyle_spawn_pause_menu device_num = <device_num>
		endif
	endif
endscript

script freestyle_game_load 
	Change \{freestyle_active = 1}
	Change \{game_mode = freestyle}
	Change \{freestyle_is_song_saveable = FALSE}
	randomize ($freestyle_random_seed)
	Change \{disable_note_input = 1}
	Change \{freestyle_ignore_ds_messages = true}
	unload_gempaks
	UnLoadPak \{'pak/oogame/oogamerb.pak'}
	UnLoadPak \{'pak/oogame/oogamevs.pak'}
	UnLoadPak \{'pak/oogame/oogamebattle.pak'}
	UnLoadPak \{'pak/oogame/oogameband.pak'}
	UnLoadPak \{'pak/oogame/oogame.pak'}
	printf \{qs(0x9ca06ec3)}
	Dumpheaps
	dumppaks
	printf \{qs(0x1ead0442)}
	LoadPak \{'pak/freestyle/freestyle_highway.pak'
		Heap = quota_sprites}
	printf 'Loading music style animation pak: %a' a = ($freestyle_current_style_settings.anim_style_pak)
	LoadPak \{'Pak\\anims\\freestyle\\freestyle_band_anims.pak'
		Heap = heap_perm_anims}
	LoadPak ($freestyle_current_style_settings.anim_style_pak) Heap = heap_perm_anims
	printf \{qs(0xaa381694)}
	freestyle_clear_used_miis
	freestyle_choose_player_miis
	freestyle_create_characters
	freestyle_create_crowd
	LoadPak \{$freestyle_song_pak
		Heap = quota_song}
	songfilemanager func = add_song_file song_name = ($freestyle_song)
	gman_songtool_setcurrentsong song = ($freestyle_song)
	freestyle_calculate_player_count
	freestyle_load_sample_bank_paks
	freestyle_load_countdown_sfx_pak
	printf \{qs(0x9a19361c)}
	freetyle_init_hud
	printf \{qs(0xb792ec77)}
	freestylegameload
	printf \{qs(0x1876ab20)}
	freestyle_set_mix_levels
	freestyle_setup_reverb
	freestyle_create_synth_effects
	printf \{qs(0xf3f90b11)}
	freestyle_create_highways
	freestyle_init_tiltmeter
	freestyle_drum_assist_hud_init
	freestyle_init_highway_cover
	freestyle_game_init_recording_meter
	freestyle_init_air_drum_hud
	freestyle_game_audio_effects_hud_init_all
	printf \{qs(0xa9105de1)}
	freestyle_init_mii_scripts
	freestyle_init_transitions
	freestyle_init_guitar
	if ($freestyle_game_mode != watch)
		freestyle_load_song
		freestyle_init_card_system
		freestyle_init_event_system
		freestyle_init_song_progression
		freestyle_init_auto_play
		freestyle_init_hint_system
	endif
	printf \{qs(0xbbe272da)}
	freestyle_init_lights
	freestyle_init_cameras
	freestyle_update_handedness_all_players
	band_movealltostartnodes
	printf \{qs(0xf024bb7f)}
endscript

script freestyle_game_start 
	Change \{freestyle_optimization_counter = 0}
	if ($freestyle_game_mode != tutorial)
		StopSoundEvent \{freestyle_ambient_crowd}
	endif
	if ($freestyle_game_mode != watch)
		freestyle_reset_stats
	endif
	SpawnScriptLater \{freestyle_stats_loop}
	freestylegamestart
	freestyle_reset_metronome
	startmetronome metronome_type = fixed beats_per_minute = ($freestyle_beats_per_minute)
	if ($freestyle_game_mode != watch)
		freestyle_start_card_system
		freestyle_start_song_progression
		freestyle_start_event_system
		freestyle_start_beat_pulse
		freestyle_start_metronome_tick
		freestyle_start_metronome_rumble
	endif
	freestyle_start_recording
	auto_show = true
	if freestyleisplayback \{track = stage_show}
		<auto_show> = FALSE
	elseif ($freestyle_game_mode = tutorial)
		<auto_show> = FALSE
	endif
	if (<auto_show> = true)
		freestyle_enable_auto_stage_show
	else
		freestyle_disable_auto_stage_show
	endif
	if ($freestyle_game_mode = tutorial)
		freestyle_start_tutorial_stage_show
	endif
	if freestyle_allow_ds_control
		wiidscommunication :sendmessage \{start_mode}
		Change \{freestyle_ignore_ds_messages = FALSE}
	endif
	freestyle_start_anim_loops
	freestyle_start_transitions
	if (($freestyle_game_mode) = tutorial)
		freestyle_tutorial_init
	endif
	printf \{qs(0x35265046)}
	freestyle_set_start_key_binding
	Change \{freestyle_manual_tilt_update = true}
	Change \{freestyle_manual_cover_update = true}
	if NOT ($freestyle_game_mode = watch)
		SpawnScriptLater \{freestyle_controller_manager}
	endif
endscript

script freestyle_game_unload 
	Change \{freestyle_active = 0}
	Change \{freestyle_ignore_ds_messages = true}
	if freestyle_allow_ds_control
		wiidscommunication :sendmessage \{set_holding_mode}
	endif
	KillSpawnedScript \{Name = freestyle_single_note_releaser}
	KillSpawnedScript \{Name = freestyle_stats_loop}
	KillSpawnedScript \{Name = freestyle_controller_manager}
	KillSpawnedScript \{id = audio_hud_anim_script_0}
	KillSpawnedScript \{id = audio_hud_anim_script_1}
	KillSpawnedScript \{id = audio_hud_anim_script_2}
	kill_start_key_binding
	freestylegameunload
	stopmetronome
	freestyle_unload_sample_bank_paks
	freestyle_unload_countdown_sfx_pak
	if ($freestyle_game_mode != watch)
		freestyle_unload_song
		freestyle_deinit_card_system
		freestyle_deinit_event_system
		freestyle_deinit_auto_play
		freestyle_deinit_hint_system
	endif
	freestyle_deinit_song_progression
	freestyle_deinit_mii_scripts
	freestyle_deinit_hud
	freestyle_cleanup_highway
	freestyle_deinit_lights
	freestyle_deinit_cameras
	freestyle_kill_anim_scripts
	freestyle_ds_kill_spawned_scripts
	freestyle_deinit_transitions
	freestyle_kill_spawned_anim_scripts
	freestyle_shutdown_guitar
	freestyle_deinit_tiltmeter
	freestyle_deinit_highway_cover
	freestyle_clean_up_solo_indicators
	if (($freestyle_game_mode) = tutorial)
		freestyle_tutorial_deinit
	endif
	freestyle_game_deinit_recording_meter
	ngc_clean_up_exploding_text
	destroy_screen_blackout
	freestyle_destroy_crowd
	UnLoadPak \{'pak/freestyle/freestyle_highway.pak'}
	UnLoadPak \{$freestyle_song_pak}
	songfilemanager func = remove_song_file song_name = ($freestyle_song)
	unload_pak_and_wait \{pak = 'Pak\\anims\\freestyle\\freestyle_band_anims.pak'}
	unload_pak_and_wait pak = ($freestyle_current_style_settings.anim_style_pak)
	Change \{disable_note_input = 0}
	setpostprocessmode \{mode = 0}
	disableglobalreverb
endscript

script freestyle_game_update 
	freestyle_update_metronome
	freestyle_update_guitars
	if ($freestyle_game_mode != watch)
		freestyle_update_card_system
		freestyle_update_event_system
		freestyle_update_auto_play
	endif
	freestyle_update_transitions
	freestyle_tutorial_event_catch
	if NOT metronomebeatthisframe
		freestyle_update_tiltmeter
		freestyle_update_highway_cover
		freestyle_update_air_drum_hud
		Mod a = ($freestyle_optimization_counter) b = 2
		if (<Mod> = 0)
			freestyle_update_hint_system
		else
			freestyle_update_mii_scripts
		endif
		switch ($freestyle_optimization_counter)
			case 0
			freestyle_update_camera
			Change \{freestyle_optimization_counter = 1}
			case 1
			freestyle_update_auto_lights
			Change \{freestyle_optimization_counter = 2}
			case 2
			freestyle_game_update_recording_meter
			Change \{freestyle_optimization_counter = 3}
			case 3
			Change \{freestyle_optimization_counter = 0}
		endswitch
	endif
	LightShow_Update
endscript

script freestyle_game_update_paused 
endscript

script freestyle_pause 
	freestylegamepause
	PauseGame
	pauseallsounds \{Pause = 1}
	if freestyle_allow_ds_control
		wiidscommunication :sendmessage \{pause_mode
			send_immediately = true}
	endif
endscript

script freestyle_unpause 
	freestylegameunpause
	UnPauseGame
	pauseallsounds \{Pause = 0}
	if freestyle_allow_ds_control
		wiidscommunication :sendmessage \{resume_mode}
	endif
endscript

script freestyle_home_menu_pause 
	if (($freestyle_in_flow = 1) && ($freestyle_home_menu_paused = 0))
		if freestylegameisstarted
			if freestylegameispaused
				Change \{freestyle_home_menu_already_paused = 1}
			else
				Change \{freestyle_home_menu_already_paused = 0}
				freestyle_pause
			endif
		else
			freestylesetpausesound \{Pause = true}
		endif
		Change \{freestyle_home_menu_paused = 1}
	endif
endscript

script freestyle_home_menu_unpause 
	if (($freestyle_in_flow = 1) && ($freestyle_home_menu_paused = 1))
		if freestylegameisstarted
			if ($freestyle_home_menu_already_paused = 0)
				freestyle_unpause
			endif
		else
			freestylesetpausesound \{Pause = FALSE}
		endif
		Change \{freestyle_home_menu_paused = 0}
	endif
endscript

script freestyle_enter_flow 
	if ($freestyle_in_flow = 0)
		printf \{qs(0x4360a3c5)}
		freestylegameenter
		freestyle_init_performance_data
		freestyle_set_default_player_data
		destroy_cameracuts
		Change \{freestyle_in_flow = 1}
	endif
endscript

script freestyle_leave_flow 
	if ($freestyle_in_flow = 1)
		printf \{qs(0xedb413e5)}
		freestyle_leave_menus
		freestylegameexit
		freestyle_clear_performance_data
		if is_ds_connected
			wiidscommunication :disconnect
		endif
		Change \{freestyle_in_flow = 0}
	endif
endscript

script freestyle_end_game \{from_menu = FALSE}
	fadetoblack \{On
		time = 0
		alpha = 1.0
		z_priority = 9999999
		no_wait}
	if ((<from_menu> = true) && ($freestyle_transition_state = gameplay) && ($freestyle_recording_mode = record))
		freestylerecordendofsongevent \{forced = 1}
		freestyle_save_song_time
	endif
	freestyle_stats_song_end
	if (($freestyle_recording_mode = record) || ($freestyle_recording_mode = overdub))
		freestylefinalizerecordingevents
		freestyle_save_performance_data
	endif
	if ($freestyle_game_mode != tutorial)
		if (($freestyle_game_mode) = watch)
			if (($freestyle_game_from_postgame) = 1)
				generic_event_replace \{state = uistate_freestyle_postgame}
			else
				generic_event_replace \{state = uistate_freestyle_replay}
			endif
		else
			if ($freestyle_is_song_saveable = true)
				freestyle_stats_setup_for_menu
				freestyle_carve_stats_into_stone
				generic_event_replace \{state = uistate_freestyle_postgame}
			else
				Change \{freestyle_styleselect_after_song = 1}
				generic_event_replace \{state = uistate_band_lobby}
			endif
		endif
	else
		generic_event_replace \{state = uistate_freestyle_tutorial_setup}
	endif
endscript
