
script ui_create_jam 
	musicstudio_set_default_camera
	Change \{respond_to_signin_changed = 1}
	SpawnScriptNow do_jam_loading params = {on_enter = <on_enter>}
	SpawnScriptNow create_jam_menu params = <...>
	ui_event_remove_params \{param = on_enter}
	Change \{game_mode = musicstudio}
	if ($musicstudio_virgin_load = true)
		pop_block_home_button
		Change \{musicstudio_virgin_load = FALSE}
	endif
endscript

script ui_destroy_jam 
	destroy_jam_menu
endscript

script ui_init_jam 
	musicstudio_entry_unsafe_for_shutdown_push
	ui_event_add_params \{on_enter = 1}
	Change music_studio_on_enter_venue = ($current_level)
	printf \{qs(0x8e69e605)}
	unload_all_song_paks
	musicstudio_mainobj :musicstudio_onentermusicstudio
	printf \{channel = musicstudio
		qs(0xb2cdf338)}
	NetSessionFunc \{func = removeallcontrollers}
	<Player> = 1
	<ii> = 1
	<controller> = 0
	begin
	if (<Player> = <ii>)
		setplayerinfo <ii> controller = ($primary_controller)
	else
		if (<controller> = ($primary_controller))
			<controller> = (<controller> + 1)
		endif
		setplayerinfo <ii> controller = <controller>
		<controller> = (<controller> + 1)
	endif
	<ii> = (<ii> + 1)
	repeat 4
	add_music_studio_player_object Player = <Player> controller = $primary_controller spawn_id = NULL jam_room_player = FALSE
endscript

script ui_deinit_jam 
	musicstudio_destroy_default_camera
	if ScreenElementExists \{id = song_preview_element}
		destroy_song_preview_menu
	endif
	musicstudio_mainobj :musicstudio_destroyvisualizer
	musicstudio_stop_menu_music
	musicstudio_mainobj :musicstudio_onexitmusicstudio
	persistent_band_stop_and_unload_anims
	destroy_bandname_viewport
	KillCamAnim \{Name = jam_view_cam}
	Change \{jam_view_cam_created = 0}
	Change \{bass_kit_mode = 0}
	jamsession_unload \{song_prefix = 'editable'}
	jamsession_unload \{song_prefix = 'jamsession'}
	clearcustomsong
	jam_clear_clipboards
	deinit_jam_audio
	Change \{cas_override_object = None}
	SpawnScriptNow \{exit_music_studio_cleanup}
	Change \{game_mode = career}
	Change \{load_venue_reapply_band_logo = 1}
endscript

script deinit_jam_audio 
	musicstudio_destroy_all_line6_effects
	StopSoundsByBuss \{guitar_jammode}
	StopSoundsByBuss \{drums_jammode}
	StopSoundsByBuss \{bass_jammode}
	StopSoundsByBuss \{jammode_vox}
	jam_deinit_reverb
	if NOT GotParam \{keep_drumkit}
	endif
	unloadbasskit
endscript

script musicstudio_set_default_camera 
	musicstudio_destroy_default_camera
	PlayIGCCam \{Name = musicstudio_default_camera
		viewport = bg_viewport
		LockTo = World
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 1.0, 0.0)
		FOV = 72.0
		play_hold = 1
		interrupt_current}
endscript

script musicstudio_destroy_default_camera 
	KillCamAnim \{Name = musicstudio_default_camera}
endscript
