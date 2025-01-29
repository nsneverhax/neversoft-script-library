
script guitar_startup_initialize 
	output_status_begin \{prefix = 'iinit'}
	output_status \{prefix = 'iinit'
		text = 'Setup traditional band parts.'}
	globaltag_setup_traditional_band savegame = <savegame>
	output_status \{prefix = 'iinit'
		text = 'Calling user startup script'}
	if ScriptExists \{startup}
		if NOT runningsmoketest
			startup
		endif
	endif
	output_status \{prefix = 'iinit'
		text = 'AssertOnMissingScripts = 1'}
	Change \{AssertOnMissingScripts = 1}
	output_status \{prefix = 'iinit'
		text = 'disable particle LOD'}
	engineconfig \{particlelod = 0}
	output_status \{prefix = 'iinit'
		text = 'SetShadowProjectionTexture'}
	SetShadowProjectionTexture \{texture = white}
	output_status \{prefix = 'iinit'
		text = 'Set platform maximums for jam mode'}
	set_plat_jam_maximums
	output_status \{prefix = 'iinit'
		text = 'Setting button cheats'}
	Change \{enable_button_cheats = 0}
	Change \{fps_hidden = 1}
	output_status \{prefix = 'iinit'
		text = 'Default to skipping the boot up flow if on a debug build.'}
	output_status \{prefix = 'iinit'
		text = 'Loading net preferences'}
	PushMemProfile \{'net_load_preferences'}
	net_load_preferences
	PopMemProfile
	NetSessionFunc \{func = initngcnetutility}
	wii_utils_user_requested_online
	fastgetarraysize \{array = $gh6_achievement_data}
	Change g_total_num_achievements = <array_Size>
	output_status \{prefix = 'iinit'
		text = 'Tutorial settings'}
	output_status_end \{prefix = 'iinit'}
endscript

script guitar_startup_memory 
	output_status_begin \{prefix = 'heaps'}
	output_status \{prefix = 'heaps'
		text = 'memory_get_heap_sizes'}
	memory_get_heap_sizes
	output_status \{prefix = 'heaps'
		text = 'Character heaps'}
	PushMemProfile \{'Characters'}
	MemInitHeap Name = 'heap_musician1' size = (<heap_size_musician>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_musician2' size = (<heap_size_musician>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_musician3' size = (<heap_size_musician>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_musician4' size = (<heap_size_musician>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_animnode' size = <heap_size_animnode> arena = 1
	MemInitHeap Name = 'heap_perm_anims' size = <heap_size_perm_anims>
	PopMemProfile
	PushMemProfile \{'Light Show Heap'}
	MemInitHeap Name = 'heap_lightshow' size = <heap_size_lightshow>
	PopMemProfile
	PushMemProfile \{'Downloads'}
	MemInitHeap Name = 'heap_downloads' size = <heap_size_downloads> vram_size = <heap_size_downloads_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Anim pools'}
	MemPushContext \{heap_animnode}
	PushMemProfile \{'Anim pools'}
	allocateanimpools \{$g_anim_pool_params}
	PopMemProfile
	MemPopContext
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
	InitLightManager \{max_lights = 2
		max_model_lights = 8
		max_groups = 8
		max_render_verts_per_geom = 4096
		max_diffuse_lights = 4}
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
		animjqsize = (1828 * 1024)
	}
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'Creating atoms heap'}
	output_status \{prefix = 'heaps'
		text = 'Creating UI Pak Slot heap'}
	PushMemProfile \{'UI Pak Slot'}
	MemInitHeap Name = 'heap_ui_pak_slot' size = <heap_size_ui_pak_slot> vram_size = <heap_size_ui_pak_slot_vram>
	PopMemProfile
	output_status \{prefix = 'heaps'
		text = 'InitArchiveFileSys'}
	MemPushContext \{BottomUpHeap}
	PushMemProfile \{'Archive File System'}
	initarchivefilesys \{max_archives = 4
		max_files = 13000}
	PopMemProfile
	MemPopContext
	wii_check_mode_settings
	wii_change_mode \{mode = bootup}
	output_status_end \{prefix = 'heaps'}
endscript

script guitar_startup_systems 
	output_status_begin \{prefix = 'systm'}
	output_status \{prefix = 'systm'
		text = 'InitMicSystem'}
	initmicsystem
	output_status \{prefix = 'systm'
		text = 'ScreenElementSystemInit'}
	setup_sprites
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
		nodeflags = $LightShow_StateNodeFlags
		ColorOverrideExclusions = $LightShow_ColorOverrideExcludeLights}
	LightShow_SetProcessors \{shared = $LightShow_SharedProcessors}
	PopMemProfile
	output_status \{prefix = 'systm'
		text = 'create_node_flags'}
	PushMemProfile \{'create_node_flags'}
	create_node_flags
	PopMemProfile
	output_status \{prefix = 'systm'
		text = 'GamerPics'}
	PushMemProfile \{'GamerPics'}
	gamerpic_sys_init
	PopMemProfile
	output_status \{prefix = 'systm'
		text = 'Turning on viewer'}
	if ($enable_button_cheats = 1)
		LaunchViewer
		Change \{select_shift = 1}
	endif
	output_status \{prefix = 'systm'
		text = 'Creating sound busses'}
	audio_master_sfx_adding_sound_busses
	output_status \{prefix = 'systm'
		text = 'Setup Pause'}
	disable_pause
	output_status \{prefix = 'systm'
		text = 'setup the netfeed module.'}
	net_get_title_id
	netfeed func = settitleid titleid = <title_id>
	if isps3
		netfeed \{func = setplatform
			Platform = PS3}
	elseif isXenon
		netfeed \{func = setplatform
			Platform = xbox360}
	elseif iswindx
		netfeed \{func = setplatform
			Platform = pc}
	elseif isngc
		netfeed \{func = setplatform
			Platform = ngc}
	else
	endif
	netfeed \{func = setinboxheaderlimitsize
		limit = 100}
	netfeed \{func = setinboxheaderlimitstrategy
		strategy = keepnewer}
	output_status_end \{prefix = 'systm'}
endscript

script guitar_startup_critical_loads 
	output_status_begin \{prefix = 'cload'}
	output_status \{prefix = 'cload'
		text = 'Load CAS Archives'}
	initarchiveloader \{max_entries = 1800}
	PushMemProfile \{'cas_pieces'}
	if loadarchive \{'pak\\cas\\cas_pieces.pak'
			Heap = heap_system}
		if GotParam \{reference_archive}
			Change \{cas_pieces_is_a_reference_archive = 1}
		endif
	endif
	PopMemProfile
	LoadPak \{'pak\\car_parts_data\\car_parts_data.pak'
		Heap = heap_system}
	output_status \{prefix = 'cload'
		text = 'Load Anim Archive'}
	PushMemProfile \{'anim_loops'}
	loadarchive \{'pak\\anims\\anim_loops.pak'
		verify_filenames_match_descs = 0}
	PopMemProfile
	if isstandarddef
		finalprintf \{'Standard Def TV Output!'}
	else
		finalprintf \{'High Def TV Output!'}
	endif
	output_status \{prefix = 'cload'
		text = 'Initializing AnimCompressTable'}
	PushMemProfile \{'AnimCompressTable'}
	InitAnimCompressTable \{'anims\\standardkeyq.bin'
		q48}
	InitAnimCompressTable \{'anims\\standardkeyt.bin'
		t48}
	PopMemProfile
	output_status_end \{prefix = 'cload'}
	output_status \{prefix = 'systm'
		text = 'create the font arrays to be used by the create a logo tech.'}
	create_font_arrays
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
	output_status \{prefix = 'ainit'
		text = 'CAS Setup'}
	PushMemProfile \{'CAS Asset Storage'}
	createassetstoragefrombudgetblock \{Name = heap_musician1
		slopheap = heap_musician1}
	createassetstoragefrombudgetblock \{Name = heap_musician2
		slopheap = heap_musician2}
	createassetstoragefrombudgetblock \{Name = heap_musician3
		slopheap = heap_musician3}
	createassetstoragefrombudgetblock \{Name = heap_musician4
		slopheap = heap_musician4}
	PopMemProfile
	cassetpartsallocator
	output_status \{prefix = 'ainit'
		text = 'ArchiveInvalidateSizes'}
	if NOT CD
		archiveinvalidatesizes
	endif
	output_status \{prefix = 'ainit'
		text = 'Band logo budget setup'}
	output_status \{prefix = 'ainit'
		text = 'register_initial_character_profiles'}
	register_initial_character_profiles \{async = 1}
	output_status \{prefix = 'ainit'
		text = 'reset_globaltags_all'}
	Change \{game_mode = freeplay}
	lockglobaltags \{boot
		allow_this_script
		freeplay_check_off}
	PushMemProfile \{'Atoms Progression Globaltags'}
	SetProgressionMaxDifficulty \{difficulty = 4}
	printf \{'Setting GlobalTags'}
	finalprofile_start \{'reset_globaltags_all'}
	reset_globaltags_all \{boot
		async = 0}
	finalprofile_stop \{'reset_globaltags_all'}
	printf \{'Setting GlobalTags End'}
	PopMemProfile
	lockglobaltags \{boot
		OFF
		freeplay_check_on}
	create_initial_temporary_random_cars \{async = 0}
	richpresence_setactive \{Active = 1}
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
	interlock \{Wait
		prefix = 'ainit'
		lock_name = lock_uishared}
	begin
	printf \{channel = clayton
		'Waiting for boot movie to finish'}
	if ($boot_movie_done = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	ui_event \{event = menu_change
		data = {
			state = uistate_savegame_boot_scan
		}}
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
		printf channel = clayton 'Waiting on %s' s = <lock_name>
		Wait \{1
			gameframe}
		repeat
		getelapsedtime starttime = <starttime>
		output_status_text prefix = <prefix> '---guitar_startup_%s---> Interlock %l took %ams' s = <prefix> l = <lock_name> a = <ElapsedTime>
	endif
endscript
