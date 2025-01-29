
script guitar_startup_initialize 
	output_status_begin \{prefix = 'iinit'}
	output_status \{prefix = 'iinit'
		text = 'Setup traditional band parts.'}
	globaltag_setup_traditional_band savegame = <savegame>
	output_status \{prefix = 'iinit'
		text = 'setup core goal'}
	gman_addgoal \{goal_info = $core_goal_info}
	gman_initializegoalblocking \{goal = core_goal}
	output_status \{prefix = 'iinit'
		text = 'Calling user startup script'}
	if ScriptExists \{startup}
		startup
	endif
	output_status \{prefix = 'iinit'
		text = 'AssertOnMissingScripts = 1'}
	Change \{AssertOnMissingScripts = 1}
	if isXenon
		if debugbuild
			Change \{crowd_config_xenon = crowd_config_nojiggle_768}
		endif
	endif
	output_status \{prefix = 'iinit'
		text = 'disable particle LOD'}
	engineconfig \{particlelod = 0}
	engineconfig \{skinmaterialoverwrite = 1}
	output_status \{prefix = 'iinit'
		text = 'Shadow params'}
	engineconfig \{shadowalgorithm = None}
	engineconfig \{deferredshadowblurradius = 6.0}
	output_status \{prefix = 'iinit'
		text = 'light housing projector shadow softness'}
	engineconfig \{lightprojectorshadowblurradius = 3.0}
	engineconfig \{fillburstblendmode_pass0 = blend}
	engineconfig \{fillburstclearcolor_pass0 = [
			0.3
			0.3
			0.3
			0.0
		]}
	engineconfig \{fillburstblendmode_pass1 = addrgba}
	engineconfig \{fillburstclearcolor_pass1 = [
			0
			0
			0
			0
		]}
	output_status \{prefix = 'iinit'
		text = 'setup shadow params'}
	SetShadowRenderingFlags \{enable = 'true'
		object = 'all'}
	SetShadowMapParams \{far = 16.0}
	output_status \{prefix = 'iinit'
		text = 'SetShadowProjectionTexture'}
	SetShadowProjectionTexture \{texture = white}
	output_status \{prefix = 'iinit'
		text = 'Set SkinLookupTexture'}
	engineconfig \{skinlookuptexture = `tex/sfx/skinlookup256_dnc.dds`}
	output_status \{prefix = 'iinit'
		text = 'Set platform maximums for jam mode'}
	set_plat_jam_maximums
	output_status \{prefix = 'iinit'
		text = 'Setting button cheats'}
	if ($is_demo_mode = 1)
		Change \{enable_button_cheats = 0}
	endif
	if retailbuild
		Change \{enable_button_cheats = 0}
	endif
	output_status \{prefix = 'iinit'
		text = 'Default to skipping the boot up flow if on a debug build.'}
	output_status \{prefix = 'iinit'
		text = 'Loading net preferences'}
	PushMemProfile \{'net_load_preferences'}
	net_load_preferences
	PopMemProfile
	output_status \{prefix = 'iinit'
		text = 'Tutorial settings'}
	Change \{tutorial_disable_hud = 0}
	output_status_end \{prefix = 'iinit'}
endscript

script guitar_startup_memory 
	output_status_begin \{prefix = 'heaps'}
	output_status \{prefix = 'heaps'
		text = 'get_heap_sizes'}
	get_heap_sizes
	output_status \{prefix = 'heaps'
		text = 'Initialize bink stuff first since loading screens will need it.'}
	PushMemProfile \{'Bink Heap'}
	MemInitHeap Name = 'heap_bink' size = <heap_size_bink> vram_size = <heap_size_bink_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'CAS build heap'}
	PushMemProfile \{'CAS build'}
	MemInitHeap Name = 'heap_cas_build' size = <heap_size_cas_build> vram_size = <heap_size_cas_build_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Create boot-time save heap'}
	create_save_heap_at_boot
	output_status \{prefix = 'heaps'
		text = 'Bink sub heaps'}
	create_bink_sub_heaps \{no_save_heap}
	output_status \{prefix = 'heaps'
		text = 'Audio heaps'}
	PushMemProfile \{'Audio'}
	if IsFmodEnabled
		MemInitHeap Name = 'heap_global_sfx' size = <heap_size_global_sfx> vram_size = <heap_size_global_sfx_vram>
		MemInitHeap Name = 'heap_audio' size = <heap_size_audio> vram_size = <heap_size_audio_vram>
	endif
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Global Pak Heap'}
	PushMemProfile \{'Global Pak Heap'}
	MemInitHeap Name = 'heap_global_pak' size = <heap_size_globalpak> vram_size = <heap_size_globalpak_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'UI Shared Heap'}
	PushMemProfile \{'UI Shared Heap'}
	MemInitHeap Name = 'heap_ui_shared' size = <heap_size_ui_shared> vram_size = <heap_size_ui_shared_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'In Game Heap'}
	PushMemProfile \{'In Game Heap'}
	MemInitHeap Name = 'heap_in_game' size = <heap_size_in_game> vram_size = <heap_size_in_game_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Crowd Heap'}
	PushMemProfile \{'Crowd Heap'}
	MemInitHeap Name = 'heap_crowd' size = <heap_size_crowd> vram_size = <heap_size_crowd_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Crowd Jam'}
	PushMemProfile \{'Jam Heap'}
	MemInitHeap Name = 'heap_jam' size = <heap_size_jam> vram_size = <heap_size_jam_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Character heaps'}
	PushMemProfile \{'Characters'}
	MemInitHeap Name = 'heap_musician1' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	MemInitHeap Name = 'heap_musician2' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	MemInitHeap Name = 'heap_musician3' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	MemInitHeap Name = 'heap_musician4' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	MemInitHeap Name = 'heap_musician_anim' size = <heap_size_musician_anim>
	MemInitHeap Name = 'heap_animnode' size = <heap_size_animnode>
	MemInitHeap Name = 'heap_ragskel' size = <heap_size_ragskel> vm
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'CAS Heaps'}
	PushMemProfile \{'CAS Heaps'}
	MemInitHeap Name = 'heap_cas_global' size = <heap_size_cas_global> vram_size = <heap_size_cas_global_vram>
	MemInitHeap Name = 'heap_cas_cache' size = <heap_size_cas_cache> vram_size = <heap_size_cas_cache_vram> vm
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Initializing COIM'}
	PushMemProfile \{'COIM'}
	InitCOIM \{size = $Generic_COIM_Size
		BlockAlign = $Generic_COIM_BlockAlign
		COIM_Min_Scratch_Blocks
		$Generic_COIM_Params}
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'InitLightManager'}
	PushMemProfile \{'InitLightManager'}
	InitLightManager \{max_lights = 110
		max_model_lights = 1
		max_groups = 16}
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Set up the animation cache'}
	PushMemProfile \{'Animation Cache'}
	InitAnimSystem {
		AnimHeapSize = 0
		CacheBlockAlign = 3072
		AnimNxBufferSize = (2 * 1024 * 1024)
		DefCacheType = fullres
		MaxAnimStages = 2
		MaxAnimSubsets = 4
		MaxDegenerateAnims = 3
		animjqsize = (1618 * 1024)
	}
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Light Show Heap'}
	PushMemProfile \{'Light Show Heap'}
	MemInitHeap Name = 'heap_lightshow' size = <heap_size_lightshow>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Creating download heap'}
	PushMemProfile \{'Downloads'}
	MemInitHeap Name = 'heap_downloads' size = <heap_size_downloads> vram_size = <heap_size_downloads_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Creating Download paks heap'}
	PushMemProfile \{'Download paks'}
	MemInitHeap Name = 'heap_downloadpaks' size = <heap_size_downloadpaks> vram_size = <heap_size_downloadpaks_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Creating drumpak heaps'}
	musicstudio_instrument_createdrumheaps
	output_status \{prefix = 'heaps'
		text = 'Shhhh - creating stash heap'}
	if NOT retailbuild
		if usingpureheap
			PushMemProfile \{'Stash'}
			MemInitHeap Name = 'heap_stash' size = <heap_size_stash> vram_size = <heap_size_stash_vram>
			PopMemProfile
		endif
	endif
	output_status \{prefix = 'heaps'
		text = 'Creating zone heap'}
	MemPushContext \{BottomUpHeap}
	MemInitHeap Name = 'heap_zones' size = <heap_size_zones> vram_size = <heap_size_zones_vram>
	MemPopContext
	output_status \{prefix = 'heaps'
		text = 'Creating atoms heap'}
	MemPushContext \{BottomUpHeap}
	MemInitHeap Name = 'heap_atoms' size = <heap_size_atoms>
	MemPopContext
	output_status \{prefix = 'heaps'
		text = 'InitArchiveFileSys'}
	MemPushContext \{BottomUpHeap}
	PushMemProfile \{'Archive File System'}
	initarchivefilesys \{max_archives = 4
		max_files = 7500}
	PopMemProfile
	MemPopContext
	output_status \{prefix = 'heaps'
		text = 'Initializing Replay buffer'}
	if are_replays_enabled
		get_replay_heap
		MemPushContext <replay_heap>
		PushMemProfile \{'Replay buffer'}
		<replay_buffer_size> = (1024 * 4)
		AllocateDataBuffer Name = replay kb = <replay_buffer_size>
		PopMemProfile
		MemPopContext
	endif
	output_status \{prefix = 'heaps'
		text = 'Creating UI Pak Slot heap'}
	PushMemProfile \{'UI Pak Slot'}
	MemInitHeap Name = 'heap_ui_pak_slot' size = <heap_size_ui_pak_slot> vram_size = <heap_size_ui_pak_slot_vram>
	PopMemProfile
	output_status_end \{prefix = 'heaps'}
endscript

script guitar_startup_systems 
	output_status_begin \{prefix = 'systm'}
	output_status \{prefix = 'systm'
		text = 'InitSoundSystem'}
	initsoundsystem
	output_status \{prefix = 'systm'
		text = 'InitMovieSystem'}
	initmoviesystem
	output_status \{prefix = 'systm'
		text = 'InitMicSystem'}
	initmicsystem
	output_status \{prefix = 'systm'
		text = 'ScreenElementSystemInit'}
	ScreenElementSystemInit
	output_status \{prefix = 'systm'
		text = 'CompositeObjectManager_startup'}
	PushMemProfile \{'CompositeObjectManager_startup'}
	CompositeObjectManager_startup
	PopMemProfile
	output_status \{prefix = 'systm'
		text = 'Register all supported screen fx types'}
	registerscreenfx
	output_status \{prefix = 'systm'
		text = 'Init2DParticles'}
	CreateScreenElement \{Type = ContainerElement
		id = dead_particle_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		id = alive_root_particle_container
		parent = root_window
		Pos = (0.0, 0.0)}
	PushMemProfile \{'Init2DParticles'}
	Init2DParticles \{parent = dead_particle_container}
	PopMemProfile
	output_status \{prefix = 'systm'
		text = 'setup the bg viewport with a dummy camera'}
	PushMemProfile \{'BG Viewport'}
	setup_bg_viewport_boot
	restore_dummy_bg_camera
	PopMemProfile
	output_status \{prefix = 'systm'
		text = 'SmartPak_Init'}
	PushMemProfile \{'SmartPak'}
	smartpak_init
	PopMemProfile
	output_status \{prefix = 'systm'
		text = 'DisableDolbyDigital'}
	output_status \{prefix = 'systm'
		text = 'Initializing memory card system'}
	PushMemProfile \{'MemCardSystem'}
	MemCardSystemInitialize
	PopMemProfile
	mc_setactiveplayer \{querydefault}
	output_status \{prefix = 'systm'
		text = 'Lightshow setup'}
	PushMemProfile \{'LightShow'}
	LightShow_AddNodeFlags
	LightShow_Init \{notes = $LightShow_NoteMapping
		nodeflags = $LightShow_StateNodeFlags}
	LightShow_SetProcessors \{shared = $LightShow_SharedProcessors}
	PopMemProfile
	output_status \{prefix = 'systm'
		text = 'create_node_flags'}
	PushMemProfile \{'create_node_flags'}
	create_node_flags
	PopMemProfile
	output_status \{prefix = 'systm'
		text = 'Turning on viewer'}
	if ($enable_button_cheats = 1)
		LaunchViewer
		Change \{select_shift = 1}
	endif
	output_status \{prefix = 'systm'
		text = 'Creating sound busses'}
	Master_SFX_Adding_Sound_Busses
	output_status \{prefix = 'systm'
		text = 'setup_sprites'}
	setup_sprites
	disable_pause
	output_status \{prefix = 'systm'
		text = 'create the font arrays to be used by the create a logo tech.'}
	create_font_arrays
	output_status_end \{prefix = 'systm'}
endscript

script guitar_startup_critical_loads 
	output_status_begin \{prefix = 'cload'}
	output_status \{prefix = 'cload'
		text = 'Load CAS Archives'}
	initarchiveloader \{max_entries = 1800}
	PushMemProfile \{'cas_globalarchive caching'}
	if isps3
		strategy = all_to_vram
	else
		strategy = as_appropriate
	endif
	loadarchive 'pak\\archive\\cas_globalarchive.pak' cache = cas_globalarchive Heap = heap_cas_global async = <async> strategy = <strategy>
	PopMemProfile
	if loadarchive \{'pak\\archive\\cas_pieces.pak'}
		if GotParam \{reference_archive}
			Change \{cas_pieces_is_a_reference_archive = 1}
		endif
	endif
	output_status \{prefix = 'cload'
		text = 'Initializing file cache'}
	PushMemProfile \{'FileCache'}
	InitFileCache \{max_files = 1024
		streambuff = 0
		size = 2048
		disable_on_start}
	PopMemProfile
	output_status \{prefix = 'cload'
		text = 'Loading global_rag_skel_boot.pak'}
	LoadPakAsync \{pak_name = 'pak/global_rag_skel/global_rag_skel_boot.pak'
		Heap = heap_global_pak}
	output_status \{prefix = 'cload'
		text = 'Initializing AnimCompressTable'}
	PushMemProfile \{'AnimCompressTable'}
	InitAnimCompressTable \{'anims\\standardkeyq.bin'
		q48}
	InitAnimCompressTable \{'anims\\standardkeyt.bin'
		t48}
	PopMemProfile
	output_status_end \{prefix = 'cload'}
endscript

script guitar_startup_async_init 
	output_status_begin \{prefix = 'ainit'}
	output_status \{prefix = 'ainit'
		text = 'Initializing packed structs'}
	get_num_savegames
	init_packed_structs num_savegames = <num_savegames>
	init_savegames num_savegames = <num_savegames>
	output_status \{prefix = 'ainit'
		text = 'BuildCasLookupTables'}
	buildcaslookuptables \{master_editable_list = master_editable_list}
	output_status \{prefix = 'ainit'
		text = 'check_cas preset_profiles'}
	if NOT CD
		check_cas \{preset_profiles}
		validate_locked_playlists
	endif
	output_status \{prefix = 'ainit'
		text = 'CAS Setup'}
	PushMemProfile \{'CAS Asset Storage'}
	casallocatebudgetblock \{Heap = heap_musician1
		avatarindex = 1
		Name = heap_musician1
		budget = $cas_budget_groups}
	casallocatebudgetblock \{Heap = heap_musician2
		avatarindex = 2
		Name = heap_musician2
		budget = $cas_budget_groups}
	casallocatebudgetblock \{Heap = heap_musician3
		avatarindex = 3
		Name = heap_musician3
		budget = $cas_budget_groups}
	casallocatebudgetblock \{Heap = heap_musician4
		avatarindex = 4
		Name = heap_musician4
		budget = $cas_budget_groups}
	createassetstoragefrombudgetblock \{Name = heap_musician1}
	createassetstoragefrombudgetblock \{Name = heap_musician2}
	createassetstoragefrombudgetblock \{Name = heap_musician3}
	createassetstoragefrombudgetblock \{Name = heap_musician4}
	PopMemProfile
	castemporariessetheap \{Heap = heap_cas_build
		max_files = 48}
	output_status \{prefix = 'ainit'
		text = 'Band logo budget setup'}
	PushMemProfile \{'CAS Logo'}
	MemPushContext \{BottomUpHeap}
	casallocatebudgetblock \{Heap = BottomUpHeap
		Name = band_logo_block
		budget = $cas_band_logo_budget}
	createassetstoragefrombudgetblock Name = band_logo_block slopheap = BottomUpHeap AssetContext = ($cas_band_logo_details.AssetContext)
	MemPopContext
	PopMemProfile
	output_status \{prefix = 'ainit'
		text = 'register_initial_character_profiles'}
	register_initial_character_profiles \{async = 1}
	output_status \{prefix = 'ainit'
		text = 'reset_globaltags_all'}
	lockglobaltags \{boot
		allow_this_script}
	PushMemProfile \{'Atoms Progression Globaltags'}
	SetProgressionMaxDifficulty \{difficulty = 4}
	printf \{'Setting GlobalTags'}
	finalprofile_start \{'reset_globaltags_all'}
	reset_globaltags_all \{boot
		async = 1}
	finalprofile_stop \{'reset_globaltags_all'}
	printf \{'Setting GlobalTags End'}
	PopMemProfile
	lockglobaltags \{boot
		OFF}
	create_initial_temporary_random_cars \{async = 1}
	interlock \{prefix = 'ainit'
		lock_name = lock_globaltags}
	output_status \{prefix = 'ainit'
		text = 'UI_InitializeStateMachine'}
	PushMemProfile \{'UI_InitializeStateMachine'}
	initstatemachinesystem
	ui_initializestatemachine
	PopMemProfile
	output_status \{prefix = 'ainit'
		text = 'savegame scanning'}
	output_status_begin \{prefix = 'boots'}
	output_status \{prefix = 'boots'
		text = 'Memcard scan'}
	create_save_heap_at_boot
	Change \{game_mode = freeplay}
	interlock \{Wait
		prefix = 'ainit'
		lock_name = lock_uishared}
	if isXenon
		ui_event \{event = menu_change
			data = {
				state = uistate_savegame_boot_scan
			}}
	else
		begin
		gettrophyinitstate
		if (<state> != initializing)
			break
		endif
		Wait \{10
			gameframes}
		repeat
		if (<state> = not_enough_space)
			ui_event event = menu_replace data = {state = uistate_trophy_warning device_num = <device_num>}
		elseif (<state> = ok)
			ui_event \{event = menu_change
				data = {
					state = uistate_savegame_boot_scan
				}}
		else
			ScriptAssert qs(0xfd48a693) s = <state>
		endif
	endif
	output_status \{prefix = 'ainit'
		text = 'create_global_materials'}
	interlock \{Wait
		prefix = 'ainit'
		lock_name = lock_materials}
	create_global_materials \{async = 1}
	create_zone_specific_visualizer_materials
	output_status \{prefix = 'ainit'
		text = 'Create in-game materials'}
	PushMemProfile \{'z_in_game'}
	create_in_game_materials \{savegame = 0
		async = 1}
	PopMemProfile
	output_status \{prefix = 'ainit'
		text = 'Create multipass materials'}
	PushMemProfile \{'z_in_game'}
	create_multipass_materials \{async = 1}
	PopMemProfile
	output_status_end \{prefix = 'ainit'}
	interlock \{Wait
		prefix = 'ainit'}
endscript
g_iinit_overall_start_time = 0
g_iinit_start_time = 0
g_heaps_overall_start_time = 0
g_heaps_start_time = 0
g_systm_overall_start_time = 0
g_systm_start_time = 0
g_cload_overall_start_time = 0
g_cload_start_time = 0
g_ainit_overall_start_time = 0
g_ainit_start_time = 0
g_aload_overall_start_time = 0
g_aload_start_time = 0
g_mload_overall_start_time = 0
g_mload_start_time = 0
g_mgame_overall_start_time = 0
g_mgame_start_time = 0
g_boots_overall_start_time = 0
g_boots_start_time = 0
g_movie_overall_start_time = 0
g_movie_start_time = 0
g_deflt_overall_start_time = 0
g_deflt_start_time = 0
g_overall_time = -1

script get_overall_time 
	if ($g_overall_time = -1)
		GetTrueStartTime
		Change g_overall_time = <starttime>
	endif
	getelapsedtime \{starttime = $g_overall_time}
	return overalltime = <ElapsedTime>
endscript

script output_status_text \{prefix = 'default'}
	finalprintf <...>
	printf channel = guitar_startup <...>
	formatText checksumName = channel 'guitar_startup_%a' a = <prefix>
	printf <...>
endscript

script get_output_var_names \{prefix = 'default'}
	formatText checksumName = overall_start_time 'g_%a_overall_start_time' a = <prefix>
	formatText checksumName = start_time 'g_%a_start_time' a = <prefix>
	get_overall_time
	return overall_start_time = <overall_start_time> start_time = <start_time> overalltime = <overalltime>
endscript

script output_time_taken \{prefix = 'default'}
	get_output_var_names prefix = <prefix>
	if NOT ($<start_time> = 0)
		ElapsedTime = (<starttime> - $<start_time>)
		output_status_text prefix = <prefix> '(%o)---guitar_startup_%s---> Time taken: %ams' s = <prefix> a = <ElapsedTime> o = <overalltime>
	endif
	Change GlobalName = <start_time> NewValue = <starttime>
endscript

script output_status_begin \{prefix = 'default'}
	get_output_var_names prefix = <prefix>
	GetTrueStartTime
	Change GlobalName = <overall_start_time> NewValue = <starttime>
	Change GlobalName = <start_time> NewValue = 0
endscript

script output_status \{prefix = 'default'
		text = '???????????????'}
	get_output_var_names prefix = <prefix>
	GetTrueStartTime
	output_time_taken prefix = <prefix> starttime = <starttime> overalltime = <overalltime>
	output_status_text prefix = <prefix> '(%o)---guitar_startup_%s---> %t' s = <prefix> t = <text> o = <overalltime>
endscript

script output_status_end \{prefix = 'default'}
	get_output_var_names prefix = <prefix>
	GetTrueStartTime
	output_time_taken prefix = <prefix> starttime = <starttime> overalltime = <overalltime>
	ElapsedTime = (<starttime> - $<overall_start_time>)
	output_status_text prefix = <prefix> '(%o)---guitar_startup_%s---> Overall time taken: %ams' s = <prefix> a = <ElapsedTime> o = <overalltime>
endscript
lock_default = 0
lock_freeplay = 0
lock_materials = 0
lock_savegame = 0
lock_globaltags = 0
lock_uishared = 0

script interlock \{lock_name = lock_default
		prefix = 'default'}
	if GotParam \{Wait}
		GetTrueStartTime
	endif
	Change GlobalName = <lock_name> NewValue = (1 - $<lock_name>)
	if GotParam \{Wait}
		begin
		if ($<lock_name> = 0)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		getelapsedtime starttime = <starttime>
		output_status_text prefix = <prefix> '---guitar_startup_%s---> Interlock %l took %ams' s = <prefix> l = <lock_name> a = <ElapsedTime>
	endif
endscript
