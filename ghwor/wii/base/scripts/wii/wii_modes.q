wii_mode_list = [
	None
	bootup
	core
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
		global_sfx_pak = 'pak/sounds/modes/sfx_mode_global.pak'
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
		global_sfx_pak = 'pak/sounds/modes/sfx_mode_global.pak'
	}
}
wii_sfx_mode_paks = {
	None = [
	]
	song = [
		{
			pak = 'pak/sounds/modes/sfx_mode_song.pak'
			Heap = quota_sfx
		}
	]
	song_roadiebattle = [
		{
			pak = 'pak/sounds/modes/sfx_mode_roadiebattle.pak'
			Heap = quota_sfx
		}
		{
			pak = 'pak/sounds/modes/sfx_mode_roadiebattle2.pak'
			Heap = quota_sfx
		}
	]
	song_freeplay = [
		{
			pak = 'pak/sounds/modes/sfx_mode_freeplay.pak'
			Heap = quota_sfx
		}
		{
			pak = 'pak/sounds/modes/sfx_mode_song.pak'
			Heap = quota_sfx
		}
	]
	song_career = [
		{
			pak = 'pak/sounds/modes/sfx_mode_career.pak'
			Heap = quota_sfx
		}
		{
			pak = 'pak/sounds/modes/sfx_mode_song.pak'
			Heap = quota_sfx
		}
	]
	song_quickplay = [
		{
			pak = 'pak/sounds/modes/sfx_mode_song.pak'
			Heap = quota_sfx
		}
		{
			pak = 'pak/sounds/modes/sfx_mode_quickplay.pak'
			Heap = quota_sfx
		}
	]
	song_competitive = [
		{
			pak = 'pak/sounds/modes/sfx_mode_song.pak'
			Heap = quota_sfx
		}
		{
			pak = 'pak/sounds/modes/sfx_mode_competitive.pak'
			Heap = quota_sfx
		}
	]
	FrontEnd = [
		{
			pak = 'pak/sounds/modes/sfx_mode_frontend.pak'
			Heap = quota_sfx
		}
	]
	musicstore = [
		{
			pak = 'pak/sounds/modes/sfx_mode_musicstore.pak'
			Heap = quota_sfx
		}
	]
	studio = [
		{
			pak = 'pak/sounds/modes/sfx_mode_studio.pak'
			Heap = quota_sfx
		}
	]
}

script wii_load_leaderboard_data \{Heap = quota_misc}
	push_block_home_button
	if NOT ispakloaded 'pak/leaderboard_data.pak' Heap = <Heap>
		LoadPak 'pak/leaderboard_data.pak' Heap = <Heap> no_vram
	endif
	loadleaderboarddata
	if ispakloaded 'pak/leaderboard_data.pak' Heap = <Heap>
		UnLoadPak 'pak/leaderboard_data.pak' Heap = <Heap>
	endif
	pop_block_home_button
endscript

script wii_mode_cas_init 
	Change \{cas_build_model_cancelled_for_mode_change = 0}
endscript

script wii_mode_cas_deinit 
	Change \{cas_build_model_cancelled_for_mode_change = 1}
	cascancelloading
endscript

script wii_load_mode_core 
	wii_mode_cas_init
	wii_load_leaderboard_data
	anim_paks_set_state \{state = ingame}
	wii_clear_band_config
	if NOT ispakloaded \{'pak/anims/perm_anims/drumdroid.pak'
			Heap = quota_animations}
		LoadPak \{'pak/anims/perm_anims/drumdroid.pak'
			Heap = quota_animations
			no_vram}
	endif
	switch ($wii_last_mode)
		case studio
		Change current_level = ($studio_on_enter_venue)
		wii_mode_restore
		case play_jam
		Change current_level = ($play_jam_on_enter_venue)
		wii_mode_restore
		case music_store
		Change current_level = ($music_store_on_enter_venue)
		wii_mode_restore
	endswitch
	sdcardmanagerfunc \{func = force_hold_ejects
		OFF}
endscript

script wii_mode_restore \{Block = 0}
	SetViewportProperties \{viewport = bg_viewport
		Active = FALSE}
	wait_for_deferred_rendering
	crowd_system_deinit
	wait_for_deferred_rendering
	venue_system_init block_scripts = <Block>
	wait_for_deferred_rendering
	crowd_system_init
	wait_for_deferred_rendering
	SetViewportProperties \{viewport = bg_viewport
		Active = true}
	set_game_system_status \{system = Crowd
		state = On}
	set_game_system_status \{system = venue
		state = On}
endscript

script wii_unload_mode_core 
	wii_mode_cas_deinit
	sdcardmanagerfunc \{func = force_hold_ejects}
	Change \{wii_dlc_last_unloaded_song_props = {
		}}
	unloadleaderboarddata
	dlccatalogmanagerfunc \{func = unload_catalogs}
	begin
	if NOT dlccatalogmanagerfunc \{func = is_busy}
		break
	endif
	WaitOneGameFrame
	repeat
	crowd_system_deinit
	unload_all_song_paks
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
	unload_gempaks
	animloadfreeassets \{group = loop_anims}
	animloadfreeassets \{group = win_lose_anims}
	unload_pak_and_wait \{pak = 'pak/anims/perm_anims/drumdroid.pak'}
	unload_pak_and_wait \{pak = 'pak/anims/frontend/frontend_anims.pak'}
	unload_pak_for_quest_chapter
	unload_pak_for_quickplay
	visualizer_unload
	begin
	if NOT ScriptIsRunning \{buildcasmodel}
		break
	endif
	printf \{'Waiting for BuildCASModel'}
	repeat
endscript
play_jam_on_enter_venue = load_z_cube

script wii_load_mode_play_jam 
	wii_mode_cas_init
	wii_load_leaderboard_data
	anim_paks_set_state \{state = play_jam}
	Change play_jam_on_enter_venue = ($current_level)
	if NOT ispakloaded \{'pak/anims/perm_anims/drumdroid.pak'
			Heap = quota_animations}
		LoadPak \{'pak/anims/perm_anims/drumdroid.pak'
			Heap = quota_animations
			no_vram}
	endif
endscript

script wii_unload_mode_play_jam 
	wii_mode_cas_deinit
	SpawnScriptNow \{kill_gem_scroller}
	begin
	if NOT ScriptIsRunning \{kill_gem_scroller}
		break
	endif
	Wait \{1
		Frame}
	repeat
	unload_all_song_paks
	destroy_band
	cas_queue_block
	unload_gempaks
	unload_pak_for_quickplay
	unload_pak_and_wait \{pak = 'pak/anims/perm_anims/drumdroid.pak'}
	unload_pak_and_wait \{pak = 'pak/anims/frontend/frontend_anims.pak'}
	visualizer_unload
	musicstudio_instrument_unloadall
	jamsession_unload \{song_prefix = 'editable'}
	jamsession_unload \{song_prefix = 'jamsession'}
	unloadleaderboarddata
endscript
musicstudio_virgin_load = FALSE
studio_on_enter_venue = load_z_punkstage

script wii_load_mode_studio 
	wii_mode_cas_init
	push_block_home_button
	wii_load_leaderboard_data
	anim_paks_set_state \{state = musicstudio}
	Change \{musicstudio_virgin_load = true}
	Change studio_on_enter_venue = ($current_level)
	enable_fullscreen_visualizer
	load_musicstudio_previews
	destroy_friend_feed
endscript

script wii_unload_mode_studio 
	wii_mode_cas_deinit
	unload_gempaks
	disable_fullscreen_visualizer
	musicstudio_instrument_unloadall
	jamsession_unload \{song_prefix = 'editable'}
	jamsession_unload \{song_prefix = 'jamsession'}
	unload_musicstudio_gameplay_sfx
	unload_musicstudio_previews
	unloadleaderboarddata
	begin
	if NOT ScriptIsRunning \{exit_music_studio_cleanup}
		break
	endif
	printf \{'Waiting for exit_music_studio_cleanup to be idle!'}
	WaitOneGameFrame
	repeat 500
endscript
music_store_on_enter_venue = load_z_punkstage

script wii_load_mode_music_store 
	push_block_home_button
	wii_mode_cas_init
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
	wii_mode_cas_deinit
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
	NetSessionFunc \{Obj = cdn
		func = cancel_requests}
	begin
	if NetSessionFunc \{Obj = cdn
			func = is_idle}
		break
	endif
	printf \{'Waiting for CDN to be idle!'}
	WaitOneGameFrame
	repeat 500
	previewassetcache \{func = shutdown}
	disable_fullscreen_visualizer
	pop_block_home_button
endscript

script wii_find_appropriate_mode 
	RequireParams \{[
			ui_state
		]
		all}
	mode = None
	switch (<ui_state>)
		case uistate_band_lobby
		case uistate_freeplay
		case uistate_mainmenu
		case uistate_mainmenu_create
		case uistate_options
		case uistate_character_selection
		case uistate_select_practice_mode
		case uistate_tutorial_menu
		case uistate_save_icon_warning
		case uistate_savegame_boot_scan
		<mode> = core
		case uistate_jam
		<mode> = studio
		case uistate_songlist
		if ($wii_entering_music_store = 1)
			<mode> = music_store
		else
			<mode> = core
		endif
		case uistate_play_song
		playlist_getcurrentsong
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
		case uistate_jam
		<sfx_mode> = studio
		case uistate_play_song
		if inroadiebattlemode
			<sfx_mode> = song_roadiebattle
		else
			switch ($game_mode)
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
		endif
		case uistate_songlist
		if ($game_mode = music_store)
			<sfx_mode> = musicstore
		else
			<sfx_mode> = FrontEnd
		endif
		case uistate_quest_map_giglist
		<sfx_mode> = FrontEnd
		case uistate_signin
		if ($wii_entering_music_store = 1)
			<sfx_mode> = musicstore
		endif
		case uistate_mainmenu
		case uistate_mainmenu_create
		<sfx_mode> = FrontEnd
		case uistate_band_lobby
		<sfx_mode> = FrontEnd
	endswitch
	if (<sfx_mode> != None)
		return true sfx_mode = <sfx_mode>
	endif
	return FALSE sfx_mode = <sfx_mode>
endscript
