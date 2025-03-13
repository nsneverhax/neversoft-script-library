
script ui_create_jam 
	musicstudio_set_default_camera
	change \{respond_to_signin_changed = 1}
	spawnscriptnow do_jam_loading params = {on_enter = <on_enter>}
	spawnscriptnow create_jam_menu params = <...>
	ui_event_remove_params \{param = on_enter}
	change \{game_mode = musicstudio}
endscript

script ui_destroy_jam 
	destroy_jam_menu
endscript

script musicstudio_create_sub_heaps 
	memory_get_heap_sizes
	mempushcontext \{heap_song}
	meminitheap name = 'heap_musicstudio_notes' size = <heap_size_ms_notes> vram_size = <heap_size_ms_notes_vram>
	mempopcontext
endscript

script musicstudio_destroy_sub_heaps 
	if memheapexists \{name = heap_musicstudio_notes}
		memdeleteheap \{name = heap_musicstudio_notes}
	endif
endscript

script ui_init_jam 
	pushunsafeforshutdown \{context = enter_music_central
		type = unchecked}
	hide_glitch \{num_frames = 10}
	destroy_crowd_models
	wait_for_deferred_rendering
	ui_event_add_params \{on_enter = 1}
	change music_studio_on_enter_venue = ($current_level)
	printf \{qs(0x8e69e605)}
	unload_all_song_paks
	musicstudio_create_sub_heaps
	musicstudio_mainobj :musicstudio_onentermusicstudio
	destroymaterial \{name = og_mat_flare}
	creatematerial \{name = og_mat_flare
		template = immediatemode
		technique = _2d_col_tex_noviewport
		blendmode = add
		materialprops = [
			{
				name = m_samp0
				textureproperty = `tex\models\lighthousings\jow_flare02.dds`
			}
		]}
	printf \{channel = musicstudio
		qs(0xb2cdf338)}
	netsessionfunc \{func = removeallcontrollers}
	<player> = 1
	<ii> = 1
	<controller> = 0
	begin
	if (<player> = <ii>)
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
	add_music_studio_player_object player = <player> controller = $primary_controller spawn_id = null jam_room_player = false
endscript

script ui_deinit_jam 
	musicstudio_destroy_default_camera
	if screenelementexists \{id = song_preview_element}
		destroy_song_preview_menu
	endif
	musicstudio_mainobj :musicstudio_destroyvisualizer
	musicstudio_stop_menu_music
	destroymaterial \{name = og_mat_flare}
	musicstudio_mainobj :musicstudio_onexitmusicstudio
	persistent_band_stop_and_unload_anims
	destroy_bandname_viewport
	sfx_backgrounds_new_area \{immediate = 1
		bg_sfx_area = frontend_menu_music}
	killcamanim \{name = jam_view_cam}
	change \{jam_view_cam_created = 0}
	change \{bass_kit_mode = 0}
	jamsession_unload \{song_prefix = 'editable'}
	jamsession_unload \{song_prefix = 'jamsession'}
	clearcustomsong
	jam_clear_clipboards
	deinit_jam_audio
	change \{cas_override_object = none}
	musicstudio_destroy_sub_heaps
	spawnscriptnow \{exit_music_studio_cleanup}
	destroy_visualizer_screen_element
	change \{game_mode = career}
	change \{load_venue_reapply_band_logo = 1}
endscript

script deinit_jam_audio 
	musicstudio_destroy_all_line6_effects
	musicstudio_eq_settings_flat
	stopsoundsbybuss \{guitar_jammode}
	stopsoundsbybuss \{drums_jammode}
	stopsoundsbybuss \{bass_jammode}
	stopsoundsbybuss \{jammode_vox}
	jam_deinit_reverb
	if NOT gotparam \{keep_drumkit}
	endif
	musicstudio_instrument_unloadall
	unloadbasskit
endscript

script musicstudio_set_default_camera 
	musicstudio_destroy_default_camera
	playigccam \{name = musicstudio_default_camera
		viewport = bg_viewport
		lockto = world
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 1.0, 0.0)
		fov = 72.0
		play_hold = 1
		interrupt_current}
endscript

script musicstudio_destroy_default_camera 
	killcamanim \{name = musicstudio_default_camera}
endscript
