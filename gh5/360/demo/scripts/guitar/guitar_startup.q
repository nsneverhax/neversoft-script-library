
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
	if scriptexists \{startup}
		startup
	endif
	output_status \{prefix = 'iinit'
		text = 'AssertOnMissingScripts = 1'}
	change \{assertonmissingscripts = 1}
	if isxenon
		if debugbuild
			change \{crowd_config_xenon = crowd_config_nojiggle_768}
		endif
	endif
	output_status \{prefix = 'iinit'
		text = 'disable particle LOD'}
	engineconfig \{particlelod = 0}
	engineconfig \{skinmaterialoverwrite = 1}
	output_status \{prefix = 'iinit'
		text = 'Shadow params'}
	engineconfig \{shadowalgorithm = none}
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
	setshadowrenderingflags \{enable = 'true'
		object = 'all'}
	setshadowmapparams \{far = 16.0}
	output_status \{prefix = 'iinit'
		text = 'SetShadowProjectionTexture'}
	setshadowprojectiontexture \{texture = white}
	output_status \{prefix = 'iinit'
		text = 'Set SkinLookupTexture'}
	engineconfig \{skinlookuptexture = `tex/sfx/skinlookup256_dnc.dds`}
	output_status \{prefix = 'iinit'
		text = 'Set platform maximums for jam mode'}
	set_plat_jam_maximums
	output_status \{prefix = 'iinit'
		text = 'Setting button cheats'}
	if ($is_demo_mode = 1)
		change \{enable_button_cheats = 0}
	endif
	if retailbuild
		change \{enable_button_cheats = 0}
	endif
	output_status \{prefix = 'iinit'
		text = 'Default to skipping the boot up flow if on a debug build.'}
	output_status \{prefix = 'iinit'
		text = 'Loading net preferences'}
	pushmemprofile \{'net_load_preferences'}
	net_load_preferences
	popmemprofile
	output_status \{prefix = 'iinit'
		text = 'Tutorial settings'}
	change \{tutorial_disable_hud = 0}
	output_status_end \{prefix = 'iinit'}
endscript

script guitar_startup_memory 
	output_status_begin \{prefix = 'heaps'}
	output_status \{prefix = 'heaps'
		text = 'get_heap_sizes'}
	get_heap_sizes
	output_status \{prefix = 'heaps'
		text = 'Initialize bink stuff first since loading screens will need it.'}
	pushmemprofile \{'Bink Heap'}
	meminitheap name = 'heap_bink' size = <heap_size_bink> vram_size = <heap_size_bink_vram>
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'CAS build heap'}
	pushmemprofile \{'CAS build'}
	meminitheap name = 'heap_cas_build' size = <heap_size_cas_build> vram_size = <heap_size_cas_build_vram>
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Create boot-time save heap'}
	create_save_heap_at_boot
	output_status \{prefix = 'heaps'
		text = 'Bink sub heaps'}
	create_bink_sub_heaps \{no_save_heap}
	output_status \{prefix = 'heaps'
		text = 'Audio heaps'}
	pushmemprofile \{'Audio'}
	if isfmodenabled
		meminitheap name = 'heap_global_sfx' size = <heap_size_global_sfx> vram_size = <heap_size_global_sfx_vram>
		meminitheap name = 'heap_audio' size = <heap_size_audio> vram_size = <heap_size_audio_vram>
	endif
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Global Pak Heap'}
	pushmemprofile \{'Global Pak Heap'}
	meminitheap name = 'heap_global_pak' size = <heap_size_globalpak> vram_size = <heap_size_globalpak_vram>
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'UI Shared Heap'}
	pushmemprofile \{'UI Shared Heap'}
	meminitheap name = 'heap_ui_shared' size = <heap_size_ui_shared> vram_size = <heap_size_ui_shared_vram>
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'In Game Heap'}
	pushmemprofile \{'In Game Heap'}
	meminitheap name = 'heap_in_game' size = <heap_size_in_game> vram_size = <heap_size_in_game_vram>
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Crowd Heap'}
	pushmemprofile \{'Crowd Heap'}
	meminitheap name = 'heap_crowd' size = <heap_size_crowd> vram_size = <heap_size_crowd_vram>
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Crowd Jam'}
	pushmemprofile \{'Jam Heap'}
	meminitheap name = 'heap_jam' size = <heap_size_jam> vram_size = <heap_size_jam_vram>
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Character heaps'}
	pushmemprofile \{'Characters'}
	meminitheap name = 'heap_musician1' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	meminitheap name = 'heap_musician2' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	meminitheap name = 'heap_musician3' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	meminitheap name = 'heap_musician4' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	meminitheap name = 'heap_musician_anim' size = <heap_size_musician_anim>
	meminitheap name = 'heap_animnode' size = <heap_size_animnode>
	meminitheap name = 'heap_ragskel' size = <heap_size_ragskel> vm
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'CAS Heaps'}
	pushmemprofile \{'CAS Heaps'}
	meminitheap name = 'heap_cas_global' size = <heap_size_cas_global> vram_size = <heap_size_cas_global_vram>
	meminitheap name = 'heap_cas_cache' size = <heap_size_cas_cache> vram_size = <heap_size_cas_cache_vram> vm
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Initializing COIM'}
	pushmemprofile \{'COIM'}
	initcoim \{size = $generic_coim_size
		blockalign = $generic_coim_blockalign
		coim_min_scratch_blocks
		$generic_coim_params}
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'InitLightManager'}
	pushmemprofile \{'InitLightManager'}
	initlightmanager \{max_lights = 110
		max_model_lights = 1
		max_groups = 16}
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Set up the animation cache'}
	pushmemprofile \{'Animation Cache'}
	initanimsystem {
		animheapsize = 0
		cacheblockalign = 3072
		animnxbuffersize = (2 * 1024 * 1024)
		defcachetype = fullres
		maxanimstages = 2
		maxanimsubsets = 4
		maxdegenerateanims = 3
		animjqsize = (1618 * 1024)
	}
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Light Show Heap'}
	pushmemprofile \{'Light Show Heap'}
	meminitheap name = 'heap_lightshow' size = <heap_size_lightshow>
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Creating download heap'}
	pushmemprofile \{'Downloads'}
	meminitheap name = 'heap_downloads' size = <heap_size_downloads> vram_size = <heap_size_downloads_vram>
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Creating Download paks heap'}
	pushmemprofile \{'Download paks'}
	meminitheap name = 'heap_downloadpaks' size = <heap_size_downloadpaks> vram_size = <heap_size_downloadpaks_vram>
	popmemprofile
	output_status \{prefix = 'heaps'
		text = 'Creating drumpak heaps'}
	musicstudio_instrument_createdrumheaps
	output_status \{prefix = 'heaps'
		text = 'Shhhh - creating stash heap'}
	if NOT retailbuild
		if usingpureheap
			pushmemprofile \{'Stash'}
			meminitheap name = 'heap_stash' size = <heap_size_stash> vram_size = <heap_size_stash_vram>
			popmemprofile
		endif
	endif
	output_status \{prefix = 'heaps'
		text = 'Creating zone heap'}
	mempushcontext \{bottomupheap}
	meminitheap name = 'heap_zones' size = <heap_size_zones> vram_size = <heap_size_zones_vram>
	mempopcontext
	output_status \{prefix = 'heaps'
		text = 'Creating atoms heap'}
	mempushcontext \{bottomupheap}
	meminitheap name = 'heap_atoms' size = <heap_size_atoms>
	mempopcontext
	output_status \{prefix = 'heaps'
		text = 'InitArchiveFileSys'}
	mempushcontext \{bottomupheap}
	pushmemprofile \{'Archive File System'}
	initarchivefilesys \{max_archives = 4
		max_files = 7500}
	popmemprofile
	mempopcontext
	output_status \{prefix = 'heaps'
		text = 'Initializing Replay buffer'}
	if are_replays_enabled
		get_replay_heap
		mempushcontext <replay_heap>
		pushmemprofile \{'Replay buffer'}
		<replay_buffer_size> = (1024 * 4)
		allocatedatabuffer name = replay kb = <replay_buffer_size>
		popmemprofile
		mempopcontext
	endif
	output_status \{prefix = 'heaps'
		text = 'Creating UI Pak Slot heap'}
	pushmemprofile \{'UI Pak Slot'}
	meminitheap name = 'heap_ui_pak_slot' size = <heap_size_ui_pak_slot> vram_size = <heap_size_ui_pak_slot_vram>
	popmemprofile
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
	screenelementsysteminit
	output_status \{prefix = 'systm'
		text = 'CompositeObjectManager_startup'}
	pushmemprofile \{'CompositeObjectManager_startup'}
	compositeobjectmanager_startup
	popmemprofile
	output_status \{prefix = 'systm'
		text = 'Register all supported screen fx types'}
	registerscreenfx
	output_status \{prefix = 'systm'
		text = 'Init2DParticles'}
	createscreenelement \{type = containerelement
		id = dead_particle_container
		parent = root_window
		pos = (0.0, 0.0)}
	createscreenelement \{type = containerelement
		id = alive_root_particle_container
		parent = root_window
		pos = (0.0, 0.0)}
	pushmemprofile \{'Init2DParticles'}
	init2dparticles \{parent = dead_particle_container}
	popmemprofile
	output_status \{prefix = 'systm'
		text = 'setup the bg viewport with a dummy camera'}
	pushmemprofile \{'BG Viewport'}
	setup_bg_viewport_boot
	restore_dummy_bg_camera
	popmemprofile
	output_status \{prefix = 'systm'
		text = 'SmartPak_Init'}
	pushmemprofile \{'SmartPak'}
	smartpak_init
	popmemprofile
	output_status \{prefix = 'systm'
		text = 'DisableDolbyDigital'}
	if isxenon
		if demobuild
			if ($kiosk_demo = 1)
				disabledolbydigital
			endif
		endif
	endif
	output_status \{prefix = 'systm'
		text = 'Initializing memory card system'}
	pushmemprofile \{'MemCardSystem'}
	memcardsysteminitialize
	popmemprofile
	mc_setactiveplayer \{querydefault}
	output_status \{prefix = 'systm'
		text = 'Lightshow setup'}
	pushmemprofile \{'LightShow'}
	lightshow_addnodeflags
	lightshow_init \{notes = $lightshow_notemapping
		nodeflags = $lightshow_statenodeflags}
	lightshow_setprocessors \{shared = $lightshow_sharedprocessors}
	popmemprofile
	output_status \{prefix = 'systm'
		text = 'create_node_flags'}
	pushmemprofile \{'create_node_flags'}
	create_node_flags
	popmemprofile
	output_status \{prefix = 'systm'
		text = 'Turning on viewer'}
	if ($enable_button_cheats = 1)
		launchviewer
		change \{select_shift = 1}
	endif
	output_status \{prefix = 'systm'
		text = 'Creating sound busses'}
	master_sfx_adding_sound_busses
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
	pushmemprofile \{'cas_globalarchive caching'}
	if isps3
		strategy = all_to_vram
	else
		strategy = as_appropriate
	endif
	loadarchive 'pak\\archive\\cas_globalarchive.pak' cache = cas_globalarchive heap = heap_cas_global async = <async> strategy = <strategy>
	popmemprofile
	if loadarchive \{'pak\\archive\\cas_pieces.pak'}
		if gotparam \{reference_archive}
			change \{cas_pieces_is_a_reference_archive = 1}
		endif
	endif
	output_status \{prefix = 'cload'
		text = 'Initializing file cache'}
	if NOT demobuild
		pushmemprofile \{'FileCache'}
		initfilecache \{max_files = 1024
			streambuff = 0
			size = 2048
			disable_on_start}
		popmemprofile
	endif
	output_status \{prefix = 'cload'
		text = 'Loading global_rag_skel_boot.pak'}
	loadpakasync \{pak_name = 'pak/global_rag_skel/global_rag_skel_boot.pak'
		heap = heap_global_pak}
	output_status \{prefix = 'cload'
		text = 'Initializing AnimCompressTable'}
	pushmemprofile \{'AnimCompressTable'}
	initanimcompresstable \{'anims\\standardkeyq.bin'
		q48}
	initanimcompresstable \{'anims\\standardkeyt.bin'
		t48}
	popmemprofile
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
	if NOT cd
		check_cas \{preset_profiles}
		validate_locked_playlists
	endif
	output_status \{prefix = 'ainit'
		text = 'CAS Setup'}
	pushmemprofile \{'CAS Asset Storage'}
	casallocatebudgetblock \{heap = heap_musician1
		avatarindex = 1
		name = heap_musician1
		budget = $cas_budget_groups}
	casallocatebudgetblock \{heap = heap_musician2
		avatarindex = 2
		name = heap_musician2
		budget = $cas_budget_groups}
	casallocatebudgetblock \{heap = heap_musician3
		avatarindex = 3
		name = heap_musician3
		budget = $cas_budget_groups}
	casallocatebudgetblock \{heap = heap_musician4
		avatarindex = 4
		name = heap_musician4
		budget = $cas_budget_groups}
	createassetstoragefrombudgetblock \{name = heap_musician1}
	createassetstoragefrombudgetblock \{name = heap_musician2}
	createassetstoragefrombudgetblock \{name = heap_musician3}
	createassetstoragefrombudgetblock \{name = heap_musician4}
	popmemprofile
	castemporariessetheap \{heap = heap_cas_build
		max_files = 48}
	output_status \{prefix = 'ainit'
		text = 'Band logo budget setup'}
	pushmemprofile \{'CAS Logo'}
	mempushcontext \{bottomupheap}
	casallocatebudgetblock \{heap = bottomupheap
		name = band_logo_block
		budget = $cas_band_logo_budget}
	createassetstoragefrombudgetblock name = band_logo_block slopheap = bottomupheap assetcontext = ($cas_band_logo_details.assetcontext)
	mempopcontext
	popmemprofile
	output_status \{prefix = 'ainit'
		text = 'register_initial_character_profiles'}
	register_initial_character_profiles \{async = 1}
	output_status \{prefix = 'ainit'
		text = 'reset_globaltags_all'}
	lockglobaltags \{boot
		allow_this_script}
	pushmemprofile \{'Atoms Progression Globaltags'}
	setprogressionmaxdifficulty \{difficulty = 4}
	printf \{'Setting GlobalTags'}
	finalprofile_start \{'reset_globaltags_all'}
	reset_globaltags_all \{boot
		async = 1}
	finalprofile_stop \{'reset_globaltags_all'}
	printf \{'Setting GlobalTags End'}
	popmemprofile
	lockglobaltags \{boot
		off}
	create_initial_temporary_random_cars \{async = 1}
	interlock \{prefix = 'ainit'
		lock_name = lock_globaltags}
	output_status \{prefix = 'ainit'
		text = 'UI_InitializeStateMachine'}
	pushmemprofile \{'UI_InitializeStateMachine'}
	initstatemachinesystem
	ui_initializestatemachine
	popmemprofile
	output_status \{prefix = 'ainit'
		text = 'savegame scanning'}
	output_status_begin \{prefix = 'boots'}
	output_status \{prefix = 'boots'
		text = 'Memcard scan'}
	create_save_heap_at_boot
	change \{game_mode = freeplay}
	interlock \{wait
		prefix = 'ainit'
		lock_name = lock_uishared}
	if isxenon
		ui_event \{event = menu_change
			data = {
				state = uistate_savegame_boot_scan
			}}
	else
		if demobuild
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
			wait \{10
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
				scriptassert qs(0xfd48a693) s = <state>
			endif
		endif
	endif
	output_status \{prefix = 'ainit'
		text = 'create_global_materials'}
	interlock \{wait
		prefix = 'ainit'
		lock_name = lock_materials}
	create_global_materials \{async = 1}
	create_zone_specific_visualizer_materials
	output_status \{prefix = 'ainit'
		text = 'Create in-game materials'}
	pushmemprofile \{'z_in_game'}
	create_in_game_materials \{savegame = 0
		async = 1}
	popmemprofile
	output_status \{prefix = 'ainit'
		text = 'Create multipass materials'}
	pushmemprofile \{'z_in_game'}
	create_multipass_materials \{async = 1}
	popmemprofile
	output_status_end \{prefix = 'ainit'}
	interlock \{wait
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
		gettruestarttime
		change g_overall_time = <starttime>
	endif
	getelapsedtime \{starttime = $g_overall_time}
	return overalltime = <elapsedtime>
endscript

script output_status_text \{prefix = 'default'}
	finalprintf <...>
	printf channel = guitar_startup <...>
	formattext checksumname = channel 'guitar_startup_%a' a = <prefix>
	printf <...>
endscript

script get_output_var_names \{prefix = 'default'}
	formattext checksumname = overall_start_time 'g_%a_overall_start_time' a = <prefix>
	formattext checksumname = start_time 'g_%a_start_time' a = <prefix>
	get_overall_time
	return overall_start_time = <overall_start_time> start_time = <start_time> overalltime = <overalltime>
endscript

script output_time_taken \{prefix = 'default'}
	get_output_var_names prefix = <prefix>
	if NOT ($<start_time> = 0)
		elapsedtime = (<starttime> - $<start_time>)
		output_status_text prefix = <prefix> '(%o)---guitar_startup_%s---> Time taken: %ams' s = <prefix> a = <elapsedtime> o = <overalltime>
	endif
	change globalname = <start_time> newvalue = <starttime>
endscript

script output_status_begin \{prefix = 'default'}
	get_output_var_names prefix = <prefix>
	gettruestarttime
	change globalname = <overall_start_time> newvalue = <starttime>
	change globalname = <start_time> newvalue = 0
endscript

script output_status \{prefix = 'default'
		text = '???????????????'}
	get_output_var_names prefix = <prefix>
	gettruestarttime
	output_time_taken prefix = <prefix> starttime = <starttime> overalltime = <overalltime>
	output_status_text prefix = <prefix> '(%o)---guitar_startup_%s---> %t' s = <prefix> t = <text> o = <overalltime>
endscript

script output_status_end \{prefix = 'default'}
	get_output_var_names prefix = <prefix>
	gettruestarttime
	output_time_taken prefix = <prefix> starttime = <starttime> overalltime = <overalltime>
	elapsedtime = (<starttime> - $<overall_start_time>)
	output_status_text prefix = <prefix> '(%o)---guitar_startup_%s---> Overall time taken: %ams' s = <prefix> a = <elapsedtime> o = <overalltime>
endscript
lock_default = 0
lock_freeplay = 0
lock_materials = 0
lock_savegame = 0
lock_globaltags = 0
lock_uishared = 0

script interlock \{lock_name = lock_default
		prefix = 'default'}
	if gotparam \{wait}
		gettruestarttime
	endif
	change globalname = <lock_name> newvalue = (1 - $<lock_name>)
	if gotparam \{wait}
		begin
		if ($<lock_name> = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		getelapsedtime starttime = <starttime>
		output_status_text prefix = <prefix> '---guitar_startup_%s---> Interlock %l took %ams' s = <prefix> l = <lock_name> a = <elapsedtime>
	endif
endscript
