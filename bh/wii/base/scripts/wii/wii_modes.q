wii_mode_list = [
	None
	bootup
	core
	freestyle
	studio
	music_store
	play_jam
]
wii_mode_settings = {
	None = {
		quotas = None
	}
	bootup = {
		quotas = wii_quotas_bootup
	}
	core = {
		quotas = wii_quotas_core_flow
		zone_links = zonelinks_playsong
		load_func = wii_load_mode_core
		unload_func = wii_unload_mode_core
	}
	freestyle = {
		quotas = wii_quotas_freestyle
		zone_links = zonelinks_freestyle
		load_func = wii_load_mode_freestyle
		unload_func = wii_unload_mode_freestyle
	}
	studio = {
		quotas = wii_quotas_music_studio
		zone_links = zonelinks_musicstudio
		load_func = wii_load_mode_studio
		unload_func = wii_unload_mode_studio
	}
	music_store = {
		quotas = wii_quotas_music_store
		zone_links = zonelinks_musicstore
		load_func = wii_load_mode_music_store
		unload_func = wii_unload_mode_music_store
	}
	play_jam = {
		quotas = wii_quotas_play_jam
		zone_links = zonelinks_playjam
		load_func = wii_load_mode_play_jam
		unload_func = wii_unload_mode_play_jam
	}
}
wii_sfx_mode_paks = {
	None = [
	]
	song = [
		'pak/sounds/modes/sfx_mode_song.pak'
	]
	song_roadiebattle = [
		'pak/sounds/modes/sfx_mode_song.pak'
	]
	song_freeplay = [
		'pak/sounds/modes/sfx_mode_freeplay.pak'
		'pak/sounds/modes/sfx_mode_song.pak'
	]
	song_career = [
		'pak/sounds/modes/sfx_mode_career.pak'
		'pak/sounds/modes/sfx_mode_song.pak'
	]
	song_quickplay = [
		'pak/sounds/modes/sfx_mode_song.pak'
		'pak/sounds/modes/sfx_mode_quickplay.pak'
	]
	song_competitive = [
		'pak/sounds/modes/sfx_mode_song.pak'
		'pak/sounds/modes/sfx_mode_competitive.pak'
	]
	FrontEnd = [
		'pak/sounds/modes/sfx_mode_frontend.pak'
	]
	musicstore = [
		'pak/sounds/modes/sfx_mode_musicstore.pak'
	]
	freestyle = [
		'pak/sounds/modes/sfx_mode_freestyle.pak'
	]
	studio = [
		'pak/sounds/modes/sfx_mode_studio.pak'
	]
	tutorials = [
		'pak/sounds/modes/sfx_mode_tutorials.pak'
	]
}

script wii_load_mode_core 
	anim_paks_set_state \{state = ingame}
	wii_clear_band_config
	if NOT ispakloaded \{'pak/anims/perm_anims/drumdroid.pak'
			Heap = quota_animations}
		LoadPak \{'pak/anims/perm_anims/drumdroid.pak'
			Heap = quota_animations
			no_vram}
	endif
	if ($play_jam_exit_load_venue = 1)
		0x51d3447f
		Change \{play_jam_exit_load_venue = 0}
	endif
	if NOT GotParam \{for_play_jam}
		sdcardmanagerfunc \{func = force_hold_ejects
			OFF}
	endif
endscript

script wii_unload_mode_core 
	if NOT GotParam \{for_play_jam}
		sdcardmanagerfunc \{func = force_hold_ejects}
		Change \{wii_dlc_last_unloaded_song_props = {
			}}
	endif
	dlccatalogmanagerfunc \{func = unload_catalogs}
	begin
	if NOT dlccatalogmanagerfunc \{func = is_busy}
		break
	endif
	WaitOneGameFrame
	repeat
	crowd_system_deinit
	unload_all_song_paks
	band_unload_anim_paks
	SpawnScriptNow \{kill_gem_scroller}
	begin
	if NOT ScriptIsRunning \{kill_gem_scroller}
		break
	endif
	Wait \{1
		Frame}
	repeat
	destroy_band
	cas_queue_block
	0xcb0276c2 \{load = FALSE
		0xc28bbbd1 = FALSE}
	unload_gempaks
	guitar_force_unload_anim_paks
	mpm_free_all_maps
	unload_pak_and_wait \{pak = 'pak/anims/perm_anims/drumdroid.pak'}
	unload_pak_and_wait \{pak = 'pak/anims/frontend/frontend_anims.pak'}
	unload_pak_and_wait \{pak = 'pak/oogame/oogamerb_roadie_anims.pak'}
	0x91300b61
endscript
play_jam_on_enter_venue = load_z_cube

script wii_load_mode_play_jam 
	anim_paks_set_state \{state = play_jam}
	Change play_jam_on_enter_venue = ($current_level)
	wii_clear_band_config
	if NOT ispakloaded \{'pak/anims/perm_anims/drumdroid.pak'
			Heap = quota_animations}
		LoadPak \{'pak/anims/perm_anims/drumdroid.pak'
			Heap = quota_animations
			no_vram}
	endif
endscript
play_jam_exit_load_venue = 0

script wii_unload_mode_play_jam 
	crowd_system_deinit
	unload_all_song_paks
	band_unload_anim_paks
	SpawnScriptNow \{kill_gem_scroller}
	begin
	if NOT ScriptIsRunning \{kill_gem_scroller}
		break
	endif
	Wait \{1
		Frame}
	repeat
	destroy_band
	cas_queue_block
	0xcb0276c2 \{load = FALSE
		0xc28bbbd1 = FALSE}
	guitar_force_unload_anim_paks
	unload_gempaks
	mpm_free_all_maps
	unload_pak_and_wait \{pak = 'pak/anims/perm_anims/drumdroid.pak'}
	unload_pak_and_wait \{pak = 'pak/anims/frontend/frontend_anims.pak'}
	musicstudio_instrument_unloadall
	jamsession_unload \{song_prefix = 'jamsession'}
	0x91300b61
	Change \{play_jam_exit_load_venue = 1}
endscript

script 0x51d3447f 
	persistent_band_create_band \{refresh = 1}
	load_perm_anims
	Load_Venue \{block_scripts = 0}
	create_crowd_models
	Crowd_AllPlayAnim \{anim = Idle}
endscript
musicstudio_virgin_load = FALSE

script wii_load_mode_studio 
	push_block_home_button
	anim_paks_set_state \{state = musicstudio}
	load_musicstudio_previews
	Change \{musicstudio_virgin_load = true}
endscript

script wii_unload_mode_studio 
	unload_gempaks
	musicstudio_instrument_unloadall
	jamsession_unload \{song_prefix = 'jamsession'}
	unload_musicstudio_previews
	unload_musicstudio_gameplay_sfx
	cas_queue_block
	0xcb0276c2 \{load = FALSE
		0xc28bbbd1 = FALSE}
	mpm_free_all_maps
	0x91300b61
endscript
music_store_on_enter_venue = None

script wii_load_mode_music_store 
	push_block_home_button
	anim_paks_set_state \{state = music_store}
	preview_asset_image_size = ($default_preview_asset_image_size_wii)
	preview_asset_sound_size = ($default_preview_asset_sound_size_wii)
	preview_asset_image_cache_size = ($default_preview_asset_image_cache_size_wii)
	preview_asset_sound_cache_size = ($default_preview_asset_sound_cache_size_wii)
	previewassetcache {
		func = init
		preview_asset_image_cache_size = <preview_asset_image_cache_size>
		preview_asset_sound_cache_size = <preview_asset_sound_cache_size>
		preview_asset_max_file_requests = ($default_preview_asset_max_file_requests)
		preview_asset_image_size = <preview_asset_image_size>
		preview_asset_sound_size = <preview_asset_sound_size>
		preview_asset_image_vram_size = ($default_preview_asset_image_vram_size)
		preview_asset_sound_vram_size = ($default_preview_asset_sound_vram_size)
		preview_asset_on_disc_assets = ($default_preview_asset_on_disc_assets)
	}
	sdcardmanagerfunc \{func = force_hold_ejects
		OFF}
endscript

script wii_unload_mode_music_store 
	sdcardmanagerfunc \{func = force_hold_ejects}
	begin
	if NOT dlccatalogmanagerfunc \{func = is_busy}
		break
	endif
	WaitOneGameFrame
	repeat
	previewassetcache \{func = cancel_all_requests}
	previewassetcache \{func = unload_all}
	previewassetcache \{func = cancel_active_request}
	begin
	if NetSessionFunc \{Obj = cdn
			func = is_idle}
		break
	endif
	printf \{'Waiting for CDN to be idle!'}
	WaitOneGameFrame
	repeat 500
	previewassetcache \{func = shutdown}
	mpm_free_all_maps
	pop_block_home_button
endscript

script wii_load_mode_freestyle 
	mpm_new_map \{Heap = heap_musician1
		links = highway_pakman_links
		folder = 'pak/models/highway/'}
	unload_perm_anims \{Wait = true}
	freestyle_enter_flow
endscript

script wii_unload_mode_freestyle 
	freestyle_leave_flow
	mpm_free_all_maps
	0xcb0276c2 \{load = FALSE
		0xc28bbbd1 = FALSE
		Heap = quota_samples}
	load_perm_anims
endscript

script wii_find_appropriate_mode 
	RequireParams \{[
			ui_state
		]
		all}
	mode = None
	switch (<ui_state>)
		case uistate_fan_requests
		case uistate_band_lobby_setup
		case uistate_freeplay
		case uistate_mainmenu
		case uistate_options
		case uistate_character_selection
		case uistate_select_practice_mode
		case uistate_tutorial_menu
		case uistate_test_medley_mode
		case uistate_boot_download_scan
		<mode> = core
		case uistate_freestyle_load
		case uistate_freestyle_advanced_setup
		case uistate_freestyle_save_song
		<mode> = freestyle
		case uistate_jam
		<mode> = studio
		case uistate_songlist
		if ($wii_entering_music_store = 1)
			<mode> = music_store
		else
			<mode> = core
		endif
		case uistate_play_song
		case uistate_quickplay_get_and_start_song
		gman_songtool_getcurrentsong
		if (<current_song> = jamsession)
			<mode> = play_jam
		else
			<mode> = core
		endif
	endswitch
	if (<mode> != None)
		return true mode = <mode>
	endif
	return FALSE mode = <mode>
endscript

script wii_find_appropriate_sfx_mode 
	RequireParams \{[
			ui_state
		]
		all}
	sfx_mode = None
	switch (<ui_state>)
		case uistate_freeplay
		case uistate_freeplay_pause
		<sfx_mode> = song_freeplay
		case uistate_freestyle_load
		case uistate_freestyle_advanced_setup
		case uistate_freestyle_save_song
		<sfx_mode> = freestyle
		case uistate_jam
		<sfx_mode> = studio
		case uistate_quickplay_get_and_start_song
		switch ($game_mode)
			case p1_quickplay
			case p2_quickplay
			case p3_quickplay
			case p4_quickplay
			<sfx_mode> = song_quickplay
		endswitch
		case uistate_play_song
		switch ($game_mode)
			case roadie_battle
			case p2_roadie_battle
			<sfx_mode> = song_roadiebattle
			case p1_quickplay
			case p2_quickplay
			case p3_quickplay
			case p4_quickplay
			<sfx_mode> = song_quickplay
			case compmega
			case compmega_team
			case fest_mode
			case fest_mode_team
			case p2_pro_faceoff
			case p4_pro_faceoff
			case p8_pro_faceoff
			case p6_pro_faceoff_no_mics
			case p2_coop
			<sfx_mode> = song_competitive
			case career
			<sfx_mode> = song_career
			default
			<sfx_mode> = song
		endswitch
		case uistate_voting
		<sfx_mode> = FrontEnd
		case uistate_songlist
		if ($game_mode = music_studio)
			<sfx_mode> = musicstore
		elseif ($wii_sfx_current_mode != freestyle)
			<sfx_mode> = FrontEnd
		endif
		case uistate_signin
		if ($wii_entering_music_store = 1)
			<sfx_mode> = musicstore
		endif
		case uistate_mainmenu
		<sfx_mode> = FrontEnd
		case uistate_band_lobby
		if ($wii_sfx_current_mode != freestyle)
			<sfx_mode> = FrontEnd
		endif
		case uistate_tutorial_menu
		<sfx_mode> = tutorials
	endswitch
	if (<sfx_mode> != None)
		return true sfx_mode = <sfx_mode>
	endif
	return FALSE sfx_mode = <sfx_mode>
endscript
