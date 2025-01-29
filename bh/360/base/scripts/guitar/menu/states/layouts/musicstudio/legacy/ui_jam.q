
script ui_create_jam 
	musicstudio_set_default_camera
	Change \{respond_to_signin_changed = 1}
	spawnscriptnow do_jam_loading params = {on_enter = <on_enter>}
	spawnscriptnow create_jam_menu params = <...>
	ui_event_remove_params \{param = on_enter}
	Change \{game_mode = musicstudio}
endscript

script ui_destroy_jam 
	destroy_jam_menu
endscript

script musicstudio_create_sub_heaps 
	get_heap_sizes
	MemPushContext \{heap_song}
	MemInitHeap name = 'heap_musicstudio_notes' size = <heap_size_ms_notes> vram_size = <heap_size_ms_notes_vram>
	MemPopContext
endscript

script musicstudio_destroy_sub_heaps 
	if MemHeapExists \{name = heap_musicstudio_notes}
		MemDeleteHeap \{name = heap_musicstudio_notes}
	endif
endscript

script ui_init_jam 
	ui_event_add_params \{on_enter = 1}
	Change music_studio_on_enter_venue = ($current_level)
	printf \{qs(0x8e69e605)}
	unload_all_song_paks
	musicstudio_create_sub_heaps
	musicstudio_mainobj :MusicStudio_OnEnterMusicStudio
	DestroyMaterial \{name = OG_Mat_Flare}
	CreateMaterial \{name = OG_Mat_Flare
		template = ImmediateMode
		technique = _2D_Col_Tex_NoViewport
		BlendMode = add
		MaterialProps = [
			{
				name = m_samp0
				TextureProperty = `tex\models\LightHousings\JOW_Flare02.dds`
			}
		]}
	printf \{channel = musicstudio
		qs(0xb2cdf338)}
	NetSessionFunc \{func = RemoveAllControllers}
	<player> = 1
	<ii> = 1
	<controller> = 0
	begin
	if (<player> = <ii>)
		SetPlayerInfo <ii> controller = ($primary_controller)
	else
		if (<controller> = ($primary_controller))
			<controller> = (<controller> + 1)
		endif
		SetPlayerInfo <ii> controller = <controller>
		<controller> = (<controller> + 1)
	endif
	<ii> = (<ii> + 1)
	repeat 4
	add_music_studio_player_object player = <player> controller = $primary_controller spawn_id = null jam_room_player = false
endscript

script ui_deinit_jam 
	musicstudio_destroy_default_camera
	if ScreenElementExists \{id = song_preview_element}
		destroy_song_preview_menu
	endif
	musicstudio_mainobj :MusicStudio_DestroyVisualizer
	musicstudio_stop_menu_music
	DestroyMaterial \{name = OG_Mat_Flare}
	SmartUnloadPak \{async = 1
		tags = {
			highway_for = Jam
		}}
	musicstudio_mainobj :MusicStudio_OnExitMusicStudio
	persistent_band_stop_and_unload_anims
	destroy_bandname_viewport
	Skate8_SFX_Backgrounds_New_Area \{immediate = 1
		BG_SFX_Area = FrontEnd_Menu_Music}
	KillCamAnim \{name = jam_view_cam}
	Change \{jam_view_cam_created = 0}
	Change \{bass_kit_mode = 0}
	jamsession_unload \{song_prefix = 'editable'}
	jamsession_unload \{song_prefix = 'jamsession'}
	ClearCustomSong
	jam_clear_clipboards
	deinit_jam_audio
	Change \{cas_override_object = None}
	musicstudio_destroy_sub_heaps
	spawnscriptnow \{exit_music_studio_cleanup}
	if ($musicstudio_enable_visualizers = 1)
		destroy_visualizer_screen_element
	endif
	Change \{game_mode = career}
	Change \{load_venue_reapply_band_logo = 1}
endscript

script deinit_jam_audio 
	musicstudio_destroy_all_line6_effects
	StopSoundsByBuss \{Guitar_JamMode}
	StopSoundsByBuss \{Drums_JamMode}
	StopSoundsByBuss \{Bass_JamMode}
	StopSoundsByBuss \{JamMode_Vox}
	jam_deinit_reverb
	if NOT GotParam \{keep_drumkit}
	endif
	MusicStudio_Instrument_UnloadAll
	UnLoadBassKit
endscript

script musicstudio_set_default_camera 
	musicstudio_destroy_default_camera
	PlayIGCCam \{name = musicstudio_default_camera
		viewport = bg_viewport
		LockTo = World
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 1.0, 0.0)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
endscript

script musicstudio_destroy_default_camera 
	KillCamAnim \{name = musicstudio_default_camera}
endscript
