fake_net = 0
assertonmissingscripts = 0
assertonmissingassets = 1
alwaysdump = 0
next_level_script = nullscript
classicmodenavmeshloaded = 0
dont_call_zone_init_hack = 0
levels_initialize_goals = 1
first_boot_cas_building_suppress = first_boot

script cleanup_before_changing_level_unload_all_paks 
	printf "cleanup_before_changing_level_unload_all_paks"
	if infrontend
		unloadpak 'pak/CAS_common/CAS_common.pak' localized
		stopkeyboardhandler
	endif
	unloadpak 'zones/z_world/z_world.pak'
	unloadpak 'pak/global_rails/global_rails.pak'
	unloadpak 'pak/singleplayer/singleplayer.pak'
	unloadpak 'pak/multiplayer/multiplayer.pak'
	unloadpak 'zones/z_vehicles/z_vehicles.pak'
	unloadpak 'zones/z_peds/z_peds.pak'
	unloadpak 'pak/frontend_anims/frontend_anims.pak'
	unloadpak 'pak/videophone/videophone.pak'
	unloadpak 'pak/ui_accolades/ui_accolades.pak'
	unloadpak $crib_pieces_pak
	unloadlodpaks
	if NOT cd
		unloadpak 'zones/z_viewer/z_viewer_extra.pak'
	endif
	unload_all_cas_paks
	unload_net_area_pak
	GoalPakManager_WaitForPaks
	CleanupOrphanEntities
	waitunloadpak
	do_unload_unloadable
	printf "cleanup_before_changing_level_unload_all_paks done"
endscript

script cleanup_arbitrary_game_mode_settings 
	if screenelementexists \{id = level_menu}
		destroyscreenelement \{id = level_menu}
		unloadpak \{'pak/levelselect/levelselect.pak'}
	endif
	memcard_panic_cleanup
	destroy_onscreen_keyboard
	killspawnedscript \{name = check_card}
	killspawnedscript \{name = checkforcardremoval}
endscript

script cleanup_before_changing_level_unload_zones 
	KillAllPedLifeObjects
	AI_LevelUnloadCleanup
	cleanup_arbitrary_game_mode_settings
	setpakmancurrent map = sky pak = none
	change gCurrentSky = none
	if existspakmanmap map = zones
		setpakmancurrent map = zones pak = none
	endif
	if existspakmanmap map = crib_themes
		setpakmancurrent map = crib_themes pak = none
	endif
	if existspakmanmap map = scenes
		killspawnedscript name = AmbientScenes_ManagePak
		setpakmancurrent map = scenes pak = none
	endif
	blockpendingpakmanloads block_scripts = 1
	if existspakmanmap map = zones
		destroypakmanmap map = zones
	endif
	if existspakmanmap map = scenes
		destroypakmanmap map = scenes
	endif
	if existspakmanmap map = crib_themes
		destroypakmanmap map = crib_themes
	endif
endscript

script cleanup_before_changing_level 
	DisablePakManStreaming
	PauseObjects
	printf "cleanup_before_changing_level"
	change is_changing_levels = 1
	change block_pedspawn = 1
	if existspakmanmap map = extra_ve_zones
		setpakmancurrentblock map = extra_ve_zones pak = none block_scripts = 1
		destroypakmanmap map = extra_ve_zones
	endif
	ve_free_temporaries_level_unload
	crib_kill_bink_immediate
	crib_finish_music
	CleanupAllPlayers
	iplayer = 0
	begin
	manglechecksums a = bailboard b = <iplayer>
	if objectexists id = <mangled_id>
		printf 'deleted bailboard number %d' d = <iplayer>
		<mangled_id> :die
	endif
	iplayer = (<iplayer> + 1)
	repeat 16
	if iscreated skater
		if NOT isobserving
			skater :clearpanel_landed
		endif
	endif
	SFX_Music_Volume_Box_Kill_State
	if objectexists skater
		skater :vibrate off
	endif
	if insplitscreengame
		if objectexists id = skater2
			skater2 :vibrate off
		endif
	endif
	CompassManager_FlushOldBlips
	if NOT innetgame
		hide_everything
	endif
	kill_blur
	if insplitscreengame
		if infrontend
			do_not_wait = 1
		endif
	endif
	if gotparam from_movie
		do_not_wait = 1
	endif
	blockpendingpakmanloads map = zones
	if NOT skatercamanimfinished name = thaw_transition_cam
		printf "cleaning up transition camera"
		SetScreenEffectsNoiseParams {
			on = 0
			intensity = 0
		}
		stopstream Camera_Int_Perspective
	endif
	killskatercamanim all
	KillObjectAnim all
	if objectexists id = skater
		skater :Ragdoll_Bail_Flash_Kill
	endif
	ScreenElementSystemCleanup
	cap_delete_all_pieces
	cleanup_before_changing_level_unload_zones <...>
	cleanup_before_changing_level_unload_all_paks <...>
	setscreenmode one_camera
	killspawnedscript name = PedlifeSpawner
	printf "cleanup_before_changing_level done"
	UnpauseObjects
endscript

script cleanup_before_loading_level 
	printf \{"*********************** cleanup_before_loading_level"}
	cleanup <...>
	stopmusic
	pausemusic
endscript

script request_level 
	if gotparam \{level}
		RequestLevel <level>
	else
		script_assert \{"request_level needs a level param"}
	endif
endscript

script LoadLevel 
	mempushcontext \{0}
	ScreenElementSystemCleanup
	launchlevel <...>
	mempopcontext
endscript

script load_level COIM_size = 1331200
	change soft_assert_active = 0
	printf "load_level"
	leak_check = 1
	if (<load_script> = load_z_mainmenu)
		leak_check = 0
	elseif (<load_script> = load_z_bedroom)
		leak_check = 0
	endif
	SetLeakCheck <leak_check>
	change minimum_zone_load_time = 0
	if NOT Quadtree_ReloadDebugList filename = 'sectornoculllisttest.txt'
		if NOT Quadtree_ReloadDebugList filename = 'sectornoculllist.ini'
			printf "Failed to load any sector no cull list files. Objects in distance may cull un-expectedly.\\n"
		endif
	endif
	change_sky sky = s_default
	mempushcontext aiheap
	RegisterBehaviors
	mempopcontext
	if NOT gotparam stream_load
	endif
	if gotparam stream_load
		BlockPakSceneSetting on
	endif
	tod_manager_create_perm_lights
	tod_proxim_create_lightfx
	ProximDisable
	Zone_SetAppropriateMap <...>
	if innetgame
		if NOT isobserving
			exitsurveyormode
		endif
	endif
	if NOT innetgame
		do_load_permanent
	endif
	kill_start_key_binding
	printf "replace_handlers to take away start key in load_level"
	SetScoreAccumulation 0
	SetScoreDegradation 0
	printf "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	printf "@@@ LOADLEVEL"
	if EnteringNetGame
		SetSpawnIn
		if OnServer
			printf "@@@ AS SERVER"
		else
			printf "@@@ AS CLIENT"
		endif
	else
		printf "@@@ NON NET GAME"
	endif
	if compositeobjectexists name = main_menu_camera
		main_menu_camera :die
	endif
	restore_skater_camera
	unpause_game_and_destroy_pause_menu
	CareerStartLevel structure_name = <structure_name>
	ResetLevelFlags
	if gotparam level_name
		SetLevelName <level_name>
	else
		SetLevelName <level>
	endif
	InitNavNodeManager
	if NOT gotparam stream_load
		if NOT inmultiplayergame
			if NOT checksumequals a = <structure_name> b = Level_Z_Test_NN
				setupcoim size = $generic_coim_size
				if gamemodeequals is_career
					resv_size = ($generic_coim_size - $career_pedlife_coim_size)
				else
					resv_size = ($generic_coim_size - $noncareer_pedlife_coim_size)
				endif
				coim_preallocate size = <resv_size>
			endif
		endif
		pushmemprofile 'Z_World Pak File'
		loadpak 'zones/z_world/z_world.pak' no_vram
		popmemprofile
		parsenodearray {
			queue
			zone_name = z_world
			array_name = z_world_nodearray
		}
		parsenodearray {
			queue
			zone_name = z_world_sfx
			array_name = z_world_sfx_NodeArray
		}
		parsenodearray {
			queue
			zone_name = z_world_lfx
			array_name = z_world_lfx_nodearray
		}
		parsenodearray block
		tod_manager_apply_perm_light_settings
		loadpak 'pak/global_rails/global_rails.pak' heap = railnodeheap no_vram
		loadpak 'pak/singleplayer/singleplayer.pak'
		loadpak 'pak/multiplayer/multiplayer.pak'
		if NOT infrontend
			if NOT inmultiplayergame
				printf "Initializing PedParts Heap"
				if isxenon
					meminitheap name = 'PedParts' size = (35498 * 1024)
				else
					meminitheap name = 'PedParts' size = (8 * 1024 * 1024) vram_size = (24000 * 1024)
				endif
			endif
		else
			loadpak 'pak/CAS_common/CAS_common.pak' localized
		endif
		if NOT infrontend
			if NOT inmultiplayergame
				loadpak 'zones/z_peds/z_peds.pak' heap = pedparts
				loadpak 'zones/z_vehicles/z_vehicles.pak' heap = pedparts
			endif
			loadlodpaks name = <level> level_list = $LOD_Skate9_LevelList
		endif
		if NOT infrontend
			preallocsplats
		endif
		<want_net_pak> = 0
		if NOT innetgame
			if NOT infrontend
				if NOT checksumequals a = <structure_name> b = level_z_viewer
					if gamemodeequals is_classic
						if gotparam classic_mode_navmesh
							soft_assert 'classic_mode_navmesh deprecated'
						endif
					else
						if checksumequals a = <structure_name> b = level_z_crib
							printf "//\\\\//\\\\//\\\\ zcrib"
							ss_LoadRegion filename = 'z_crib'
							ss_EnableObstacleNavmeshBlock
						else
							printf "//\\\\//\\\\//\\\\ znavmesh"
							ss_LoadRegion filename = 'z_navmesh'
							ss_EnableObstacleNavmeshBlock
							parsenodearray {
								queue
								zone_name = z_peds
								array_name = Z_Peds_NodeArray
							}
							parsenodearray {
								queue
								zone_name = z_vehicles
								array_name = z_vehicles_NodeArray
							}
						endif
					endif
				endif
			endif
		endif
		if (<want_net_pak> = 1)
			setpakmancurrentblock map = zones block_scripts = 1 pakname = (<level> + '_net')
		else
			setpakmancurrentblock map = zones block_scripts = 1 pakname = <level>
		endif
	endif
	if insplitscreengame
		formattext checksumname = checksumlevel '%s' s = <level>
		switch (<checksumlevel>)
			case z_museums
			extra_zone = z_wp_bridge
			case z_bcity
			extra_zone = z_bw_bridge
			case z_love
			extra_zone = z_pb_bridge
			case z_crib
			printf 'No extra zone'
			default
			scriptassert 'Incorrect zone for splitscreen'
		endswitch
		if gotparam extra_zone
			printf 'Using extra zone %s' s = <extra_zone>
			mempushcontext bottomupheap
			createpakmanmap map = extra_ve_zones links = VideoEditorExtraZones folder = 'zones/'
			setpakmancurrentblock map = extra_ve_zones pak = <extra_zone> block_scripts = 1
			mempopcontext
		endif
	endif
	if NOT insplitscreengame
		if ($first_boot_cas_building_suppress = first_boot)
			if (<level> = 'z_mainmenu')
				change first_boot_cas_building_suppress = booted
			else
				change first_boot_cas_building_suppress = autolaunched
			endif
		else
			change first_boot_cas_building_suppress = booted
			cas_ensure_skater_loaded name = custom_story
		endif
	endif
	setterraindefault
	SetAllStats value = 0
	if gamemodeequals is_classic
		if gotparam default_stats_classic
			if ($level_stats = 1)
				SetAllStats value = <default_stats_classic>
			endif
		endif
	else
		if gotparam default_stats
			if ($level_stats = 1)
				SetAllStats value = <default_stats>
			endif
		endif
	endif
	if gotparam setup_script
		<setup_script>
	endif
	if gotparam uber_frig_height
		change uber_frig_current_height = <uber_frig_height>
	else
		change uber_frig_current_height = $uber_frig_default_height
	endif
	SFX_refresh_music_box_triggers
	pushmemprofile 'Permanent & semi-permanent anims'
	if NOT infrontend
		do_load_unloadable
	endif
	popmemprofile
	if objectexists id = ui
		ui :fsm_set state = uistate_gameplay replacement = this
		switch <level>
			case 'Z_Bedroom'
			change cas_color_scheme = bedroom_color_scheme
			case 'z_mainmenu'
			change cas_color_scheme = mainmenu_color_scheme
			default
			change cas_color_scheme = pause_color_scheme
		endswitch
	endif
	unpausegame
	if (<level> = 'z_viewer')
		gameflow standardgameflowtoggleview
		printf "****************************************** CHANGING ASSERT = 0"
		change assertonmissingscripts = 0
		change assertonmissingassets = 0
	else
		printf "****************************************** CHANGING ASSERT = 1"
		change assertonmissingscripts = 1
		change assertonmissingassets = 1
		gameflow standardgameflow
	endif
	if innetgame
		<pedlife_allowed> = 0
	endif
	load_net_area_pak <...>
	if NOT gotparam pedlife_allowed
		<pedlife_allowed> = 0
	endif
	killspawnedscript name = PedlifeSpawner
	if (<pedlife_allowed> = 1)
		change block_pedspawn = 0
		spawnscriptlater PedlifeSpawner params = {populate = true level = <level>}
	endif
	if ($view_mode)
		setanalogstickactiveformenus 0
	endif
	setshadowprojectiontexture texture = <shadow_texture>
	if NOT infrontend
		GetGameMode
		if ((<level> = 'Z_Viewer') || (<gamemode> = mocap))
			deinit_goal_manager
			grid_control_deinit_grid_control_manager
		else
			load_goals = 1
			if innetgame
				load_goals = 1
			endif
			if (<load_goals> = 1)
				if ($levels_initialize_goals = 1)
					init_goal_manager game_mode = <gamemode>
					if ($show_goal_states = 1)
						killspawnedscript name = goal_debug_show_states
						spawnscriptlater goal_debug_show_states
					endif
				endif
				if checksumequals a = <gamemode> b = career
					grid_control_init_grid_control_manager
				endif
			endif
		endif
	endif
	if infrontend
		goalmanager_hidepoints
	else
		if NOT gameispaused
			if NOT ($in_cinematic_sequence)
				goalmanager_showpoints
			endif
		endif
	endif
	if gotparam nodeflags
		getarraysize <nodeflags>
		index = 0
		begin
		changenodeflag (<nodeflags> [<index>]) 1
		index = (<index> + 1)
		repeat <array_size>
	endif
	getarraysize $lod_loadedpaks
	if NOT (<array_size> = 0)
		<index> = 0
		begin
		lod_name = ($lod_loadedpaks [<index>])
		ToggleLOD zone = <lod_name> 1
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	updatepakmanvisibility map = zones force_lods
	if ((<level> = 'z_mainmenu') || (<level> = 'Z_Bedroom'))
		change CycleWeather = 0
		Rain_Do_Rain_Transition i = 0 time = 0
		Rain_Do_Puddles_Transition i = 0 time = 0
		Rain_Do_Lighting_Transition i = 0 time = 0
	else
		change CycleWeather = 1
	endif
	if (<level> = 'z_mainmenu')
		setshadowrenderingflags enable = 'false' object = 'skin'
		setshadowrenderingflags enable = 'false' object = 'nonskin'
		setshadowrenderingflags enable = 'false' object = 'env'
		loadpak 'pak/frontend_anims/frontend_anims.pak'
	else
		setshadowrenderingflags enable = 'true' object = 'skin'
		setshadowrenderingflags enable = 'true' object = 'nonskin'
		setshadowrenderingflags enable = 'true' object = 'env'
	endif
	if (<level> = 'Z_Bedroom')
		load_cas_paks paks = [CAS_SOUNDS CAS_CAREER CAS_DECKS]
		loadpak 'pak/frontend_anims/frontend_anims.pak'
	endif
	if (<level> = 'Z_Crib')
		loadpak $crib_pieces_pak
		load_cas_paks paks = [CAS_PROS CAS_DECKS]
		if EnteringNetGame
			cap_set_piece_limit limit = ($cap_piece_limit_crib + 4)
			if OnServer
				printf "z_crib server load level flow!"
				crib_change_to_saved_crib block_scripts = 1
			else
				printf "z_crib client load level flow!"
				crib_set_default_settings
				cap_delete_all_pieces
				spawnscript net_load_cap_pieces
			endif
		else
			cap_set_piece_limit limit = $cap_piece_limit_crib
			crib_change_to_saved_crib block_scripts = 1
		endif
	else
		cap_set_piece_limit limit = $cap_piece_limit_career
		if gotparam career_game
			if (<career_game> = 1)
				printf 'restoring rigger career pieces...'
				if CAP_LoadRiggerSetup rigger_career
					cap_restore_pieces_from_array array = (<setup>.pieces)
				endif
			endif
		endif
		if EnteringNetGame
			cap_set_piece_limit limit = ($cap_piece_limit_career + 4)
			if OnServer
				printf "z_crib server load level flow!"
				getpreferencechecksum pref_type = network allow_cap_pieces
				if NOT checksumequals a = no_pieces b = <checksum>
					if CAP_LoadRiggerSetup rigger_career
						cap_restore_pieces_from_array array = (<setup>.pieces)
					endif
				endif
			else
				printf "z_crib client load level flow!"
				cap_delete_all_pieces
				spawnscript net_load_cap_pieces
			endif
		endif
	endif
	if innetgame
		cap_disable
	else
		cap_enable
	endif
	change minimum_zone_load_time = 2500
endscript

script reset_level 
	ResetLevelFlags
	GetLevelStructureName
	if structurecontains structure = (<level_structure_name>) setup_script
		(<level_structure_name>.setup_script)
	endif
	setup_classic_stat_nodes level = (<level_structure_name>.level)
endscript

script GetCurrentLevelName 
	GetLevelStructureName
	return level_name = (<level_structure_name>.name)
endscript

script level_cleanup_assets 
	<skaterNum> = 0
	begin
	if SkaterExists skater = <skaterNum>
		printf "Cleaning up level-specific assets for skater %d" d = <objid>
	endif
	<skaterNum> = (<skaterNum> + 1)
	repeat 8
endscript

script zone_init 
	printf "zone_init: %s" s = <zone_string_name>
	if (<zone_string_name> = 'z_viewer')
		printf "AssertOnMissingScripts = 0"
		change assertonmissingscripts = 0
	endif
	mempushcontext topdownheap
	formattext textname = zone_editable_text checksumname = zone_editable_list '%a%b' a = <zone_string_name> b = '_editable_list'
	if globalexists name = <zone_editable_list> type = array
		addeditablelist <zone_editable_list>
	endif
	mempopcontext
	mempushcontext bottomupheap
	parsenodearray {
		queue
		zone_name = <zone_name>
		array_name = <array_name>
	}
	if gotparam sfx_array_name
		parsenodearray {
			queue
			zone_name = <sfx_zone_name>
			array_name = <sfx_array_name>
		}
	endif
	if gotparam gfx_array_name
		parsenodearray {
			queue
			zone_name = <gfx_zone_name>
			array_name = <gfx_array_name>
		}
	endif
	if gotparam lfx_array_name
		parsenodearray {
			queue
			zone_name = <lfx_zone_name>
			array_name = <lfx_array_name>
		}
	endif
	if gotparam mfx_array_name
		parsenodearray {
			queue
			zone_name = <mfx_zone_name>
			array_name = <mfx_array_name>
		}
	endif
	if NOT ($disable_global_pedestrians = 1)
		if ($video_editor_in_video_editor = 0)
			if NOT innetgame
				if iscoiminited
					printf "Parsing Global Ped Node Array..."
					parseglobalpednodearray name = 'zones/z_peds/z_peds.qb' zone = <zone_name>
				endif
			endif
		endif
	endif
	mempopcontext
	if NOT infrontend
		formattext checksumname = zone_setup_script '%a_Setup' a = <zone_string_name>
		if scriptexists <zone_setup_script>
			spawnscriptnow zone_init_wait_run_setup params = {zone_setup_script = <zone_setup_script>}
		endif
	endif
endscript

script zone_init_wait_run_setup 
	begin
	if NOT nodearraybusy
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($video_editor_in_video_editor = 1)
		HideRigidBodies \{hide = 1}
		ve_cleanup_zone_objects
	endif
	if scriptexists <zone_setup_script>
		<zone_setup_script>
	endif
endscript

script goal_pak_init 
	printf "goal_pak_init: %s" s = <goal_pak_string_name>
	mempushcontext topdownheap
	formattext textname = goal_pak_editable_text checksumname = goal_pak_editable_list '%a%b' a = <goal_pak_string_name> b = '_editable_list'
	if globalexists name = <goal_pak_editable_list> type = array
		addeditablelist <goal_pak_editable_list>
	endif
	mempopcontext
	mempushcontext <heap_name>
	parsenodearray {
		queue
		zone_name = <goal_pak_name>
		array_name = <array_name>
		heap = <heap_name>
	}
	if gotparam sfx_array_name
		parsenodearray {
			queue
			zone_name = <sfx_goal_pak_name>
			array_name = <sfx_array_name>
			heap = <heap_name>
		}
	endif
	if gotparam gfx_array_name
		parsenodearray {
			queue
			zone_name = <gfx_goal_pak_name>
			array_name = <gfx_array_name>
			heap = <heap_name>
		}
	endif
	if gotparam lfx_array_name
		parsenodearray {
			queue
			zone_name = <lfx_goal_pak_name>
			array_name = <lfx_array_name>
			heap = <heap_name>
		}
	endif
	if gotparam mfx_array_name
		parsenodearray {
			queue
			zone_name = <mfx_goal_pak_name>
			array_name = <mfx_array_name>
			heap = <heap_name>
		}
	endif
	mempopcontext
endscript

script zone_deinit 
	printf "zone_deinit: %s" s = <zone_string_name>
	parsenodearray abort array_name = <array_name>
	if gotparam sfx_array_name
		parsenodearray abort array_name = <sfx_array_name>
	endif
	if gotparam gfx_array_name
		parsenodearray abort array_name = <gfx_array_name>
	endif
	if gotparam lfx_array_name
		parsenodearray abort array_name = <lfx_array_name>
	endif
	if gotparam mfx_array_name
		parsenodearray abort array_name = <mfx_array_name>
	endif
	formattext textname = zone_editable_text checksumname = zone_editable_list '%a%b' a = <zone_string_name> b = '_editable_list'
	if globalexists name = <zone_editable_list> type = array
		removeeditablelist <zone_editable_list>
	endif
endscript

script setupcoim 
	pushmemprofile \{'COIM'}
	initcoim {
		size = <size>
		blockalign = $generic_coim_blockalign
		coim_min_scratch_blocks
		$generic_coim_params
		updaterelevance_fadenonperm
	}
	popmemprofile
endscript

script lod_inlevellist 
	getarraysize <level_list>
	<index> = 0
	begin
	formattext checksumname = nameone '%s' s = <name>
	formattext checksumname = nametwo '%s' s = (<level_list> [<index>])
	if (<nameone> = <nametwo>)
		printf "Found %s in LOD list! So using lods..." s = <name>
		return true
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return false
endscript

script loadlodpaks 
	mempushcontext bottomupheap
	printf "LoadLODPaks - %s" s = <name>
	getuppercasestring <name>
	if lod_inlevellist name = <uppercasestring> level_list = <level_list>
		getarraysize <level_list>
		<index> = 0
		begin
		level = (<level_list> [<index>])
		formattext textname = lod_pak 'zones/%s_lod/%s_lod.pak' s = <level>
		printf "Loading - %s" s = <lod_pak>
		formattext checksumname = lod_name '%s_lod' s = <level>
		loadpak <lod_pak>
		parsenodearray
		<index> = (<index> + 1)
		repeat <array_size>
		change lod_loadedpaks = <level_list>
	endif
	mempopcontext
endscript

script unloadlodpaks 
	getarraysize \{$lod_loadedpaks}
	if NOT (<array_size> = 0)
		<index> = 0
		begin
		level = ($lod_loadedpaks [<index>])
		formattext textname = lod_pak 'zones/%s_lod/%s_lod.pak' s = <level>
		printf "Unloading - %s" s = <lod_pak>
		unloadpak <lod_pak>
		<index> = (<index> + 1)
		repeat <array_size>
		change \{lod_loadedpaks = [
			]}
	endif
endscript
z_mainmenu_playstation_dialog = {
	title = "Not signed into online"
	text = "In order to post scores to the leaderboards, or to play online you must be signed in with a PLAYSTATION®Network account."
	button = "Sign into PLAYSTATION®Network"
}
