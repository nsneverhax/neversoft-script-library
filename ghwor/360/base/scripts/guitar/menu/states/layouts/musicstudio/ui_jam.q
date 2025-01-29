
script ui_create_jam 
	musicstudio_set_default_camera
	Change \{respond_to_signin_changed = 1}
	SpawnScriptNow do_jam_loading params = {on_enter = <on_enter>}
	SpawnScriptNow create_jam_menu params = <...>
	ui_event_remove_params \{param = on_enter}
	Change \{game_mode = musicstudio}
endscript

script ui_destroy_jam 
	destroy_jam_menu
endscript

script musicstudio_create_sub_heaps 
	memory_get_heap_sizes
	MemPushContext \{heap_song}
	MemInitHeap Name = 'heap_musicstudio_notes' size = <heap_size_ms_notes> vram_size = <heap_size_ms_notes_vram>
	MemPopContext
endscript

script musicstudio_destroy_sub_heaps 
	if memheapexists \{Name = heap_musicstudio_notes}
		memdeleteheap \{Name = heap_musicstudio_notes}
	endif
endscript

script ui_init_jam 
	pushunsafeforshutdown \{context = enter_music_central
		Type = unchecked}
	ui_event_add_params \{on_enter = 1}
	Change music_studio_on_enter_venue = ($current_level)
	printf \{qs(0x8e69e605)}
	unload_all_song_paks
	musicstudio_create_sub_heaps
	musicstudio_mainobj :musicstudio_onentermusicstudio
	destroymaterial \{Name = og_mat_flare}
	creatematerial \{Name = og_mat_flare
		template = immediatemode
		technique = _2d_col_tex_noviewport
		BlendMode = add
		MaterialProps = [
			{
				Name = m_samp0
				textureproperty = `tex\models\lighthousings\jow_flare02.dds`
			}
		]}
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
	destroymaterial \{Name = og_mat_flare}
	musicstudio_mainobj :musicstudio_onexitmusicstudio
	persistent_band_stop_and_unload_anims
	destroy_bandname_viewport
	sfx_backgrounds_new_area \{immediate = 1
		BG_SFX_Area = frontend_menu_music}
	KillCamAnim \{Name = jam_view_cam}
	Change \{jam_view_cam_created = 0}
	Change \{bass_kit_mode = 0}
	jamsession_unload \{song_prefix = 'editable'}
	jamsession_unload \{song_prefix = 'jamsession'}
	clearcustomsong
	jam_clear_clipboards
	deinit_jam_audio
	Change \{cas_override_object = None}
	musicstudio_destroy_sub_heaps
	SpawnScriptNow \{exit_music_studio_cleanup}
	destroy_visualizer_screen_element
	Change \{game_mode = career}
	Change \{load_venue_reapply_band_logo = 1}
endscript

script deinit_jam_audio 
	musicstudio_destroy_all_line6_effects
	musicstudio_eq_settings_flat
	StopSoundsByBuss \{guitar_jammode}
	StopSoundsByBuss \{drums_jammode}
	StopSoundsByBuss \{bass_jammode}
	StopSoundsByBuss \{jammode_vox}
	jam_deinit_reverb
	if NOT GotParam \{keep_drumkit}
	endif
	musicstudio_instrument_unloadall
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
