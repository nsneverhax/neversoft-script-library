show_gpu_time = 0
output_gpu_log = 0
output_mem_dump = 0
show_cpu_time = 0
show_play_log = 0
play_log_lines = 10
show_guitar_tilt = 0
nxwatson_channels = 1
output_song_stats = 0
show_sensor_debug = 0
guitar_motion_enable_test = 0
pause_menu_no_bg = 0
vocal_debug_hud = 0
roland_drumkit = 1
rock_meter_debug = 0
ps2_venues = 0
current_song = hotforteacher
current_difficulty_coop = easy
current_level = load_z_s_stage
current_highway = highway
current_time = 0.0
current_deltatime = 0.0167
current_starttime = 0
current_endtime = 0
current_looppoint = -1000000
current_speedfactor = 1.0
autolaunch_startnow = 0
autolaunch_showstorageselector = 1
current_song_qpak = None
current_song_qpak_mocap = None
current_song_qpak_performance = 0
last_song_failed = None
current_song_failed_num = 0
current_transition = None
debug_current_transition = None
current_num_players = 1
in_join_band_screens = 0
num_players_finished = 0
guitar_fretbar_divisions = 2
drum_fretbar_divisions = 2
disable_band = 0
disable_crowd = 0
disable_note_input = 0
tutorial_disable_hud = 0
is_network_game = 0
net_ready_to_start = 0
rich_presence_context = presence_menus
game_mode = p1_quickplay
skip_boot_menu = 0
autolaunch_cas = 0
autolaunch_cas_soak_test = 0
autolaunch_cas_artist = 0
objviewer_light_test = 0
autolaunch_jam = 0
skip_signin = 0
show_movies = 1
is_demo_mode = 0
is_multiplayer_beta = 0
downloadcontent_enabled = 1
input_mode = record
replay_suspend = 1
songtime_paused = 0
drum_solo_songtime_paused = 0
drum_solo_length = 0.0
drum_solo_no_gems = 0
drum_rock_meter_weights = {
	easy_rhythm = [
		1.0
		1.0
	]
	easy = [
		1.0
		1.0
	]
	medium = [
		1.5
		1.5
	]
	hard = [
		2.0
		2.5
	]
	expert = [
		2.0
		2.5
	]
}
current_boss = $boss_ted_props
boss_battle = 0
boss_controller = 0
boss_oldcontroller = 0
boss_pattern = 0
boss_strum = 0
boss_lastwhammytime = 0
boss_lastbrokenstringtime = 0
faceoff_enabled = 0
input_debug_display = 0
display_debug_input = 0
output_log_file = 0
practice_start_time = 0
practice_end_time = 0
practice_loop_section = 0
startup_song = hotforteacher
startup_difficulty = easy
time_audio_offset = 0.0
time_gem_offset = 0.0
time_input_offset = 0.0
time_drum_midi_offset = 0.0
time_gem_offset_with_lag = 0.0
time_drum_midi_offset_with_lag = 0.0
crowd_band_multiplier = 1.0
max_num_powerups = 3
show_battle_text = 1
devil_finish = 0
battle_do_or_die = 0
battle_do_or_die_speed_scale = 1.0
battle_do_or_die_attack_scale = 1.0
cheat_line6unlock = -1
cheat_alwaysslide = -1
cheat_superuser = -1
cheat_airinstruments = -1
cheat_invisiblecharacters = -1
cheat_snobcrowd = -1
Cheat_PerformanceMode = -1
Cheat_Hyperspeed = -1
cheat_autokick = -1
cheat_freedrum = -1
cheat_alt_band = -1
cheat_unlockquickplay = -1
cheat_unlockattballpark = -1
cheat_gemcolor = -1
cheat_flamecolor = -1
cheat_starcolor = -1
cheat_vocalfireball = -1
cheat_buckethat = -1
cheat_altband = -1
cheat_zombband = -1
cheat_blackhighway = -1
original_check_time_early = 0.0
original_check_time_late = 0.0
boss_wuss_out = 0
crowd_model_array = None
failed_song_time = 0.0
current_section_array = None
current_section_array_entry = 0
last_time_in_lead = 0.0
last_time_in_lead_player = -1
enable_saving = 1
primary_controller = 0
primary_controller_assigned = 0
invite_controller = -1
streamall_fsb_index = -1
enable_button_cheats = 1
enable_debug_menus = 1
whammy_mania_achievement_invalidated = 0
vocalist_height = 1.6
winning_player_camera_percentage = 100
cas_heap_state = in_game
playerserver_frame_lag = 0
guest_character_names = {
}
guest_character_fullnames = {
}
num_quickplay_song_list = 0
quickplay_song_list_current = 0
quickplay_song_list = [
	NULL
	NULL
	NULL
	NULL
	NULL
	NULL
]

script reset_quickplay_song_list 
	Change \{quickplay_song_list_current = -1}
	GetArraySize \{$quickplay_song_list}
	i = 0
	begin
	SetArrayElement ArrayName = quickplay_song_list globalarray index = <i> NewValue = NULL
	<i> = (<i> + 1)
	repeat <array_Size>
endscript
sysnotify_menus_position = topright
sysnotify_ingame_position = topright
cameracuts_enablevideovenuecams = 0
heap_song = heap_cas

script get_heap_sizes 
	GetPlatform
	switch <Platform>
		case Xenon
		<heap_size_globalpak> = (33 * 1024 * 1024)
		<heap_size_globalpak_vram> = 0
		<heap_size_audio> = (48 * 1024 * 1024)
		<heap_size_audio_vram> = 0
		<heap_size_drumkitaudio> = (2 * 1024 * 1024)
		<heap_size_drumkitaudio_vram> = 0
		<heap_size_lightshow> = (800 * 1024)
		<heap_size_musician> = (12700 * 1024)
		<heap_size_musician_vram> = (0 * 1024)
		<heap_size_ragskel> = (400 * 1024)
		<heap_size_musician_anim> = ((12 * 1024 * 1024) + (480 * 1024))
		<heap_size_havok> = (3 * 1024 * 1024)
		<heap_size_downloads> = (128 * 1024)
		<heap_size_downloads_vram> = (0 * 1024)
		<heap_size_global_cas> = (26 * 1024 * 1024)
		<heap_size_global_cas_vram> = (0 * 1024 * 1024)
		<heap_size_cas> = (80 * 1024 * 1024)
		<heap_size_cas_vram> = (0 * 1024 * 1024)
		<size_zones> = (45 * 1024 * 1024)
		<size_zones_vram> = (0 * 1024)
		<heap_size_song> = (9600 * 1024)
		<heap_size_song_extra_mocap> = (25 * 1024 * 1024)
		<heap_size_bink> = (7 * 1024 * 1024)
		<size_zones_in_cas> = (19 * 1024 * 1024)
		<size_zones_in_cas_vram> = (0 * 1024)
		<heap_size_song_in_cas> = (0 * 1024)
		<heap_size_bink_small> = (3 * 1024 * 1024)
		<cas_cache_size_in_cas> = (6 * 1024 * 1024)
		<heap_size_drumkits> = (1 * 1024)
		<heap_size_ui_pak_slot> = (8 * 1024 * 1024)
		<heap_size_ghtunes_cache> = (1 * 1024 * 1024)
		<heap_size_ghtunes_cache_vram> = (0 * 1024)
		<heap_size_pak_cache> = ((20 * 1024 * 1024) + (810 * 1024))
		<heap_size_pak_cache_vram> = (0 * 1024 * 1024)
		<heap_size_save_file> = ((2 * 1024 * 1024) + (10 * 1024))
		<heap_size_save_file_vram> = 0
		case PS3
		<heap_size_globalpak> = (4000 * 1024)
		<heap_size_globalpak_vram> = ((23 * 1024 * 1024) + (100 * 1024))
		<heap_size_audio> = ((13 * 1024 * 1024) + (512 * 1024))
		<heap_size_audio_vram> = (37 * 1024 * 1024)
		<heap_size_drumkitaudio> = (32 * 1024)
		<heap_size_drumkitaudio_vram> = (2 * 1024 * 1024)
		<heap_size_lightshow> = (800 * 1024)
		<heap_size_musician> = (1850 * 1024)
		<heap_size_musician_vram> = (10200 * 1024)
		<heap_size_ragskel> = (400 * 1024)
		<heap_size_musician_anim> = ((12 * 1024 * 1024) + (480 * 1024))
		<heap_size_havok> = (3 * 1024 * 1024)
		<heap_size_downloads> = (128 * 1024)
		<heap_size_downloads_vram> = (0 * 1024)
		<heap_size_global_cas> = (8 * 1024 * 1024)
		<heap_size_global_cas_vram> = (18 * 1024 * 1024)
		<heap_size_cas> = ((32 * 1024 * 1024) + (512 * 1024))
		<heap_size_cas_vram> = ((51 * 1024 * 1024) + (512 * 1024))
		<size_zones> = (3500 * 1024)
		<size_zones_vram> = (39 * 1024 * 1024)
		<heap_size_song> = (9600 * 1024)
		<heap_size_song_extra_mocap> = (25 * 1024 * 1024)
		<heap_size_bink> = (7 * 1024 * 1024)
		<size_zones_in_cas> = (1000 * 1024)
		<size_zones_in_cas_vram> = (17 * 1024 * 1024)
		<heap_size_song_in_cas> = (0 * 1024)
		<heap_size_bink_small> = (3 * 1024 * 1024)
		<cas_cache_size_in_cas> = (700 * 1024)
		<cas_cache_size_vram_in_cas> = (6 * 1024 * 1024)
		<heap_size_ui_pak_slot> = (600 * 1024)
		<heap_size_ui_pak_slot_vram> = ((6 * 1024 * 1024) + (512 * 1024))
		<heap_size_ghtunes_cache> = (1 * 1024 * 1024)
		<heap_size_ghtunes_cache_vram> = (0 * 1024)
		<heap_size_pak_cache> = (430 * 1024)
		<heap_size_pak_cache_vram> = (20 * 1024 * 1024)
		<heap_size_save_file> = ((2 * 1024 * 1024) + (10 * 1024))
		<heap_size_save_file_vram> = 0
		default
		ScriptAssert \{qs(0xfb3c58ff)}
	endswitch
	return <...>
endscript

script create_havok_heap 
	get_heap_sizes
	PushMemProfile \{'HavokHeap'}
	MemInitHeap Name = 'heap_havok' size = <heap_size_havok>
	PopMemProfile
endscript

script print_loading_time 
	getelapsedtime starttime = <starttime>
	finalprintf qs(0x1d312485) a = <ElapsedTime> t = <text>
endscript

script guitar_startup 
	Change \{AssertOnMissingScripts = 1}
	loading_screen = 1
	getterritory
	if GotParam \{territory}
		if (<territory> = territory_us)
			if French
				DisplayLoadingScreen \{'boot_legal_frecan'
					spin_texture = 'load_wheel'
					spin_x = 771
					spin_y = 450}
				loading_screen = 0
			endif
		else
			if English
				DisplayLoadingScreen \{'boot_legal_b'
					spin_texture = 'load_wheel'
					spin_x = 771
					spin_y = 450}
				loading_screen = 0
			endif
		endif
	endif
	if (<loading_screen> = 1)
		DisplayLoadingScreen \{'boot_legal'
			spin_texture = 'load_wheel'
			spin_x = 771
			spin_y = 450
			localized}
	endif
	GetStartTime
	overallstarttime = <starttime>
	GetTrueStartTime
	printf \{qs(0xd21eb1c0)}
	get_heap_sizes
	PushMemProfile \{'Global Pak Heap'}
	MemInitHeap Name = 'heap_global_pak' size = <heap_size_globalpak> vram_size = <heap_size_globalpak_vram>
	PopMemProfile
	GetStartTime
	initializecasarchive
	print_loading_time starttime = <starttime> text = qs(0x6b785631)
	PushMemProfile \{'Characters'}
	MemInitHeap Name = 'heap_musician1' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	MemInitHeap Name = 'heap_musician2' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	MemInitHeap Name = 'heap_musician3' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	MemInitHeap Name = 'heap_musician4' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	MemInitHeap Name = 'heap_musician_anim' size = <heap_size_musician_anim>
	MemInitHeap Name = 'heap_ragskel' size = <heap_size_ragskel>
	PopMemProfile
	PushMemProfile \{'Light Show Heap'}
	MemInitHeap Name = 'heap_lightshow' size = <heap_size_lightshow>
	PopMemProfile
	PushMemProfile \{'Downloads'}
	MemInitHeap Name = 'heap_downloads' size = <heap_size_downloads> vram_size = <heap_size_downloads_vram>
	PopMemProfile
	PushMemProfile \{'Audio'}
	if IsFmodEnabled
		MemInitHeap Name = 'heap_audio' size = <heap_size_audio> vram_size = <heap_size_audio_vram>
	endif
	MemInitHeap Name = 'heap_drumkitaudio' size = <heap_size_drumkitaudio> vram_size = <heap_size_drumkitaudio_vram>
	PopMemProfile
	initsoundsystem
	loaddrumkitall \{async = 0}
	PushMemProfile \{'Global CAS Heap'}
	MemInitHeap Name = 'heap_global_cas' size = <heap_size_global_cas> vram_size = <heap_size_global_cas_vram>
	PopMemProfile
	PushMemProfile \{'CAS Heap'}
	MemInitHeap Name = 'heap_cas' size = <heap_size_cas> vram_size = <heap_size_cas_vram> topdownname = 'heap_cas_topdown'
	PopMemProfile
	MemPushContext \{BottomUpHeap}
	PushMemProfile \{'GH Tunes Cache Heap'}
	MemInitHeap Name = 'heap_ghtunes_cache' size = <heap_size_ghtunes_cache> vram_size = <heap_size_ghtunes_cache_vram>
	PopMemProfile
	MemPopContext
	alloc_pak_cache = 0
	if isXenon
		if ((CD) || ($force_pak_caching = 1))
			if ($disable_pak_caching = 0)
				alloc_pak_cache = 1
			endif
		endif
	else
		alloc_pak_cache = 1
	endif
	if (<alloc_pak_cache> = 1)
		MemPushContext \{BottomUpHeap}
		PushMemProfile \{'Pak Cache Heap'}
		MemInitHeap Name = 'heap_pak_cache' size = <heap_size_pak_cache> vram_size = <heap_size_pak_cache_vram>
		PopMemProfile
		MemPopContext
	endif
	printf \{qs(0xac968502)}
	PushMemProfile \{'COIM'}
	InitCOIM \{size = $Generic_COIM_Size
		BlockAlign = $Generic_COIM_BlockAlign
		COIM_Min_Scratch_Blocks
		$Generic_COIM_Params}
	PopMemProfile
	PushMemProfile \{'CompositeObjectManager_startup'}
	CompositeObjectManager_startup
	PopMemProfile
	printf \{qs(0x14b44030)}
	PushMemProfile \{'MemCardSystem'}
	MemInitHeap Name = 'heap_save_file' size = <heap_size_save_file> vram_size = <heap_size_save_file_vram>
	MemCardSystemInitialize
	PopMemProfile
	mc_setactiveplayer \{querydefault}
	printf \{qs(0x83673364)}
	PushMemProfile \{'FileCache'}
	InitFileCache \{max_files = 1024
		streambuff = 0
		size = 2048
		disable_on_start}
	PopMemProfile
	printf \{qs(0x9fac0f68)}
	PushMemProfile \{'AnimCompressTable'}
	InitAnimCompressTable \{'anims\\standardkeyq.bin'
		q48}
	InitAnimCompressTable \{'anims\\standardkeyt.bin'
		t48}
	PopMemProfile
	PushMemProfile \{'Animation Cache'}
	InitAnimSystem {
		AnimHeapSize = 0
		CacheBlockAlign = 3072
		AnimNxBufferSize = (2 * 1024 * 1024)
		DefCacheType = fullres
		MaxAnimStages = 2
		MaxAnimSubsets = 4
		MaxDegenerateAnims = 3
		animjqsize = (140 * 1024)
	}
	PopMemProfile
	LoadPak \{'pak/animq.pak'
		Heap = TopDownHeap
		no_vram}
	registerallanimevents
	UnLoadPak \{'pak/animq.pak'}
	PushMemProfile \{'InitLightManager'}
	InitLightManager \{max_lights = 96
		max_model_lights = 1
		max_groups = 16}
	PopMemProfile
	PushMemProfile \{'LightShow'}
	LightShow_AddNodeFlags
	LightShow_Init \{notes = $LightShow_NoteMapping
		nodeflags = $LightShow_StateNodeFlags}
	LightShow_SetProcessors \{shared = $LightShow_SharedProcessors}
	PopMemProfile
	transition_randomizevointros
	PushMemProfile \{'create_node_flags'}
	create_node_flags
	PopMemProfile
	PushMemProfile \{'global_model_tex'}
	GetStartTime
	LoadPak \{'pak/global_model_tex/global_model_tex.pak'
		Heap = heap_global_pak}
	print_loading_time starttime = <starttime> text = qs(0x3a0347fb)
	PopMemProfile
	PushMemProfile \{'Game Heaps'}
	MemPushContext \{heap_cas}
	GetStartTime
	LoadPak \{'pak/cas/cas_deform.pak'
		Heap = heap_global_cas
		is_raw}
	print_loading_time starttime = <starttime> text = qs(0x7c888044)
	GetStartTime
	LoadPak \{'pak/cas/cas_acc_bones.pak'
		Heap = heap_global_cas
		is_raw
		no_vram}
	print_loading_time starttime = <starttime> text = qs(0xacb83f0e)
	GetStartTime
	LoadPak \{'pak/cas/cas_globalpak.pak'
		Heap = heap_global_cas
		is_raw}
	LoadPak \{'pak/cas_captextures.pak'
		Heap = heap_global_cas}
	casaddglobalrawpak \{Name = `pak/cas/cas_globalpak.pak`}
	casaddglobalrawpak \{Name = `pak/cas/cas_globalpak_vram.pak`}
	print_loading_time starttime = <starttime> text = qs(0x23e9449d)
	create_zone_maps
	set_bink_heap_state \{state = big}
	MemPopContext
	PopMemProfile
	if NOT ($cas_heap_state = in_game)
		ScriptAssert \{'Invalid initial cas_heap_state'}
	endif
	if ScriptExists \{init_globaltags}
		get_num_globaltag_sets
		init_packed_structs globaltag_sets = <num_globaltag_sets>
		init_globaltags globaltag_sets = <num_globaltag_sets>
	endif
	printf \{qs(0xa30ccd58)}
	if are_replays_enabled
		get_replay_heap
		MemPushContext <replay_heap>
		PushMemProfile \{'Replay buffer'}
		GetPlatform
		switch <Platform>
			case Xenon
			<replay_buffer_size> = (1024 * 4)
			case PS3
			<replay_buffer_size> = (1024 * 1)
			default
			ScriptAssert \{qs(0xe62cb6f3)}
		endswitch
		AllocateDataBuffer Name = replay kb = <replay_buffer_size>
		PopMemProfile
		MemPopContext
	endif
	set_plat_jam_maximums
	engineconfig \{particlelod = 0}
	engineconfig \{shadowalgorithm = None}
	engineconfig \{deferredshadowblurradius = 6.0}
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
	GetStartTime
	LoadPak \{'pak/global_ad_tex/global_ad_tex.pak'
		Heap = heap_massive_ads}
	print_loading_time starttime = <starttime> text = qs(0xec5f94aa)
	GetStartTime
	LoadPak \{'pak/global_rag_skel/global_rag_skel.pak'
		Heap = heap_global_pak
		is_raw}
	print_loading_time starttime = <starttime> text = qs(0x2c569805)
	if ($is_demo_mode = 1)
		Change \{enable_button_cheats = 0}
	endif
	if CD
		Change \{enable_button_cheats = 0}
		Change \{enable_debug_menus = 0}
	endif
	if ($enable_button_cheats = 1)
		LaunchViewer
		Change \{select_shift = 1}
	endif
	printf \{qs(0x36fa0eb9)}
	Master_SFX_Adding_Sound_Busses
	printf \{qs(0x6e45d61e)}
	PushMemProfile \{'net_load_preferences'}
	net_load_preferences
	PopMemProfile
	printf \{qs(0x288a39f2)}
	if ScriptExists \{startup}
		startup
	endif
	printf \{qs(0x049fa44b)}
	PushMemProfile \{'UI Pak Slot'}
	MemInitHeap Name = 'heap_ui_pak_slot' size = <heap_size_ui_pak_slot> vram_size = <heap_size_ui_pak_slot_vram>
	PopMemProfile
	PushMemProfile \{'UI_InitializeStateMachine'}
	ui_initializestatemachine
	PopMemProfile
	printf \{qs(0xd27c51ef)}
	GetStartTime
	LoadPak \{'zones/global/global.pak'
		Heap = heap_global_pak
		splitfile}
	print_loading_time starttime = <starttime> text = qs(0xf9d25732)
	ParseNodeArray \{queue
		zone_name = Global
		array_name = global_NodeArray}
	create_global_materials
	GetStartTime
	LoadPak \{'pak/anims/perm_anims/perm_anims.pak'
		Heap = heap_musician_anim
		no_vram}
	LoadPak \{'pak/ui_shared/ui_shared.pak'
		Heap = heap_global_pak}
	print_loading_time starttime = <starttime> text = qs(0x3136c57e)
	if NOT isps3
		if GotExtraMemory
			MemPushContext \{debugheap}
		endif
	endif
	LoadPak \{'fonts/debug.pak'}
	if NOT isps3
		if GotExtraMemory
			MemPopContext
		endif
	endif
	SetFontProperties \{'debug'
		color_tab = $Default_Font_Colors
		debug_font}
	SetFontNonProportionalNumbers \{'debug'}
	if isXenon
		buttons_font = 'buttons_x360'
	else
		if isps3
			buttons_font = 'ButtonsPs3'
		endif
	endif
	SetFontProperties <buttons_font> buttons_font
	SetFontProperties \{'fontgrid_numeral_a7'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_numeral_a9'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a3'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_title_A1'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_3'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a10'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a11'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a11_b'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_title_a1'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'text_a1'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_3'
		color_tab = $Default_Font_Colors}
	PushMemProfile \{'FMod Streams + SFX'}
	if IsFmodEnabled
		GetStartTime
		LoadFSB \{FileName = 'streams/streamall'
			numstreams = 4
			noWait}
		Change streamall_fsb_index = <fsb_index>
		print_loading_time starttime = <starttime> text = qs(0x82a57b3c)
		GetStartTime
		EnableRemoveSoundEntry \{enable}
		LoadPak \{'zones/global/global_sfx.pak'
			Heap = heap_audio}
		print_loading_time starttime = <starttime> text = qs(0x6c6b87a9)
	endif
	PopMemProfile
	SetScenePermanent \{scene = 'zones/global/global_gfx.scn'
		permanent}
	PushMemProfile \{'setup_models'}
	setup_models
	PopMemProfile
	printf \{qs(0x52f069b2)}
	printf \{qs(0x7ef8c198)
		s = $current_level}
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	AddEditableList \{ped_editable_list}
	if NOT CD
		StartKeyboardHandler \{max_length = 128}
	endif
	printf \{qs(0xb698d219)}
	PushMemProfile \{'Atoms Progression Globaltags'}
	InitAtoms
	SetProgressionMaxDifficulty \{difficulty = 4}
	printf \{qs(0xd6c8512c)}
	finalprofile_start \{'reset_globaltags_all'}
	GetStartTime
	reset_globaltags_all
	print_loading_time starttime = <starttime> text = qs(0x6f02fec2)
	finalprofile_stop \{'reset_globaltags_all'}
	printf \{qs(0xacfe5420)}
	PopMemProfile
	setup_sprites
	disable_pause
	SetShadowRenderingFlags \{enable = 'true'
		object = 'skin'}
	SetShadowMapParams \{far = 16.0}
	PushMemProfile \{'BG Viewport'}
	setup_bg_viewport
	restore_dummy_bg_camera
	PopMemProfile
	getmaxplayers
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	formatText TextName = player_text 'p%i' i = <Player> AddToStringLookup
	SpawnScriptLater create_guitar_events params = {<...>}
	Player = (<Player> + 1)
	repeat <max_players>
	SetShadowProjectionTexture \{texture = white}
	fadetoblack \{On
		alpha = 1.0
		time = 0.0
		z_priority = 100
		no_wait}
	if ($autolaunch_startnow = 0)
		if GlobalExists \{Name = autolaunch_state
				Type = checksum}
			fadetoblack \{OFF
				no_wait}
			Change \{primary_controller_assigned = 1}
			ui_event \{event = menu_change
				data = {
					state = $autolaunch_state
				}}
		elseif ($skip_boot_menu = 1)
			Change \{primary_controller_assigned = 1}
			StartRendering
			if (($autolaunch_cas = 1) || ($autolaunch_cas_artist) || ($autolaunch_jam = 1) || ($skip_signin = 1))
				Change \{skip_signin = 0}
				Change \{primary_controller_assigned = 1}
				ui_event \{event = menu_change
					data = {
						state = uistate_mainmenu
					}}
			else
				ui_event \{event = menu_change
					data = {
						state = uistate_boot_iis
					}}
			endif
		else
			StartRendering
			ui_event \{event = menu_change
				data = {
					state = uistate_boot_legal
				}}
			AddParams \{donthide}
		endif
	else
		StartRendering
		fadetoblack \{OFF
			no_wait}
		SpawnScriptLater \{autolaunch_spawned}
	endif
	guitar_create_character_maps
	buildcaslookuptables \{master_editable_list = master_editable_list}
	if NOT CD
		if casartist
			verify_cas_budgets \{profiles}
		endif
	endif
	PushMemProfile \{'CAS Asset Storage'}
	casallocatebudgetblock \{Heap = heap_musician1
		Name = heap_musician1
		budget = $cas_budget_groups}
	casallocatebudgetblock \{Heap = heap_musician2
		Name = heap_musician2
		budget = $cas_budget_groups}
	casallocatebudgetblock \{Heap = heap_musician3
		Name = heap_musician3
		budget = $cas_budget_groups}
	casallocatebudgetblock \{Heap = heap_musician4
		Name = heap_musician4
		budget = $cas_budget_groups}
	casallocatebudgetblock \{Heap = heap_musician4
		Name = band_logo_block
		budget = $cas_band_logo_budget}
	createassetstoragefrombudgetblock \{Name = heap_musician1}
	createassetstoragefrombudgetblock \{Name = heap_musician2}
	createassetstoragefrombudgetblock \{Name = heap_musician3}
	createassetstoragefrombudgetblock \{Name = heap_musician4}
	createassetstoragefrombudgetblock Name = band_logo_block slopheap = BottomUpHeap AssetContext = ($cas_band_logo_details.AssetContext)
	PopMemProfile
	castemporariessetheap \{Heap = heap_cas}
	GetStartTime
	check_for_dupe_profiles
	print_loading_time starttime = <starttime> text = qs(0xccbb6862)
	create_font_arrays
	PushMemProfile \{'band_logo'}
	ensure_band_logo_object_created
	PopMemProfile
	registertexdictforui ($cas_band_logo_details.texdict)
	Change \{tutorial_disable_hud = 0}
	CreateScreenElement \{Type = ContainerElement
		id = dead_particle_container
		parent = root_window
		Pos = (0.0, 0.0)}
	PushMemProfile \{'Init2DParticles'}
	Init2DParticles \{parent = dead_particle_container}
	PopMemProfile
	vocals_start_mic
	if ($autolaunch_startnow != 0)
		vocals_distribute_mics
	endif
	<profile_gpu> = 0
	if ($show_gpu_time = 1)
		<profile_gpu> = 1
	endif
	if ($output_gpu_log = 1)
		<profile_gpu> = 1
	endif
	if (<profile_gpu> = 1)
		ToggleMetrics \{mode = 5}
		Change \{current_cpu = 6}
	else
		if ($show_cpu_time = 1)
			Change \{current_cpu = 0}
			ToggleMetrics \{mode = 5}
		else
			ToggleMetrics \{mode = 0}
		endif
	endif
	if ($show_build_version = 1)
		debug_toggle_changelist \{show}
	endif
	finalbuildmemreport
	if NOT GotParam \{donthide}
		HideLoadingScreen
	endif
	print_loading_time starttime = <overallstarttime> text = qs(0xe79eced7)
endscript

script verify_cas_budgets 
	old_bink_heap_state = ($bink_heap_state)
	set_bink_heap_state \{state = big}
	verifycasbudgets editable_list = $master_editable_list budgets = $cas_budget_groups <...>
	if GotParam \{textures}
		verifycaptextures
	endif
	if GotParam \{profiles}
		verifycapprofile Profile = ($default_custom_musician_profile_female) <...>
		verifycapprofile Profile = ($default_custom_musician_profile_male) <...>
		verifycapprofile profiles = ($preset_musician_profiles_modifiable) <...>
		verifycapprofile profiles = ($preset_musician_profiles_locked) <...>
		verifycapprofile appearances = ($cas_preset_guitars) <...>
		verifycapprofile appearances = ($cas_preset_basses) <...>
		verifycapprofile appearances = ($cas_preset_drums) <...>
		verifycapprofile appearances = ($cas_preset_female_vocals) <...>
		verifycapprofile appearances = ($cas_preset_male_vocals) <...>
		verifycapprofile appearances = ($cas_preset_tattoo_female) <...>
		verifycapprofile appearances = ($cas_preset_tattoo_male) <...>
		verifycapprofile appearances = ($cas_preset_face_skin_female) <...>
		verifycapprofile appearances = ($cas_preset_face_skin_male) <...>
		verifycapprofile appearances = ($cas_preset_body_female) <...>
		verifycapprofile appearances = ($cas_preset_body_male) <...>
	endif
	assertforcaserrors
	set_bink_heap_state state = <old_bink_heap_state>
endscript

script generate_worst_cas_appearances 
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_guitar_body
			cas_female_hat_hair
		]
		forcebody = gh4_car_female}
	guitar_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_bass_body
			cas_female_hat_hair
		]
		forcebody = gh4_car_female}
	bass_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_drums
			cas_female_hat_hair
		]
		forcebody = gh4_car_female}
	drum_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_mic
			cas_female_hat_hair
		]
		forcebody = gh4_car_female}
	vocals_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_guitar_body
			cas_male_hat_hair
		]
		forcebody = gh4_car_male}
	m_guitar_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_bass_body
			cas_male_hat_hair
		]
		forcebody = gh4_car_male}
	m_bass_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_drums
			cas_male_hat_hair
		]
		forcebody = gh4_car_male}
	m_drum_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_mic
			cas_male_hat_hair
		]
		forcebody = gh4_car_male}
	m_vocals_appearance = (<budget_report_geo>.worst_parts)
	outputworstcasecasfile {
		path = 'car_worst_appearances.q'
		structs = {
			worst_female_guitar_appearance = <guitar_appearance>
			worst_female_bass_appearance = <bass_appearance>
			worst_female_drum_appearance = <drum_appearance>
			worst_female_vocals_appearance = <vocals_appearance>
			worst_male_guitar_appearance = <m_guitar_appearance>
			worst_male_bass_appearance = <m_bass_appearance>
			worst_male_drum_appearance = <m_drum_appearance>
			worst_male_vocals_appearance = <m_vocals_appearance>
		}
	}
endscript
bink_heap_state = OFF

script set_bink_heap_state 
	RequireParams \{[
			state
		]
		all}
	if ($bink_heap_state = <state>)
		return
	endif
	MemPushContext \{heap_cas}
	unload_songqpak
	get_heap_sizes
	switch ($bink_heap_state)
		case OFF
		printf \{qs(0x26bef179)}
		case big
		case small
		memdeleteheap \{Name = heap_bink}
		default
		ScriptAssert \{qs(0xc3919883)}
	endswitch
	Change bink_heap_state = <state>
	switch (<state>)
		case small
		printf \{qs(0xa2f2f362)}
		MemInitHeap Name = 'heap_bink' size = <heap_size_bink_small>
		case big
		printf \{qs(0x2d1545f5)}
		MemInitHeap Name = 'heap_bink' size = <heap_size_bink>
		case OFF
		printf \{qs(0xd0f3773c)}
		default
		ScriptAssert \{qs(0x5271763f)}
	endswitch
	MemPopContext
endscript

script set_cas_heap_state 
	if NOT ($cas_heap_state = <state>)
		casblockforcomposite
		get_heap_sizes
		free_cas_cache_pak
		PushMemProfile \{'Game Heaps'}
		MemPushContext \{heap_cas}
		if should_put_zones_on_debug_heap
			vram_only_flag = {vram_only}
		endif
		if (<state> = in_game)
			set_bink_heap_state \{state = OFF}
			dumpfragments \{Heap = heap_cas}
			pakmanresizemap map = zones size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024) <vram_only_flag>
			set_bink_heap_state \{state = big}
		else
			unload_songqpak
			set_bink_heap_state \{state = OFF}
			dumpfragments \{Heap = heap_cas}
			pakmanresizemap map = zones size = (<size_zones_in_cas> / 1024) vram_size = (<size_zones_in_cas_vram> / 1024) <vram_only_flag>
			set_bink_heap_state \{state = small}
			create_cas_cache_pak size = <cas_cache_size_in_cas> vram_size = <cas_cache_size_vram_in_cas>
		endif
		MemPopContext
		PopMemProfile
	endif
	Change cas_heap_state = <state>
endscript

script should_put_zones_on_debug_heap 
	if isps3
		if NOT finalbuild
			if GotExtraMemory
				if GlobalExists \{Name = zones_on_debugheap}
					if ($zones_on_debugheap = 1)
						return \{true}
					endif
				endif
			endif
		endif
	endif
	return \{FALSE}
endscript

script create_zone_maps 
	get_heap_sizes
	slop_heap = BottomUpHeap
	main_mem_heap = heap_cas
	vram_heap = heap_cas
	if should_put_zones_on_debug_heap
		main_mem_heap = debugrsxheap
		slop_heap = debugheap
		size_zones = ((25 * 1024 * 1024) - 1024)
	endif
	printf \{qs(0xd8517ff0)}
	MemPushContext <slop_heap>
	if ($ps2_venues = 1)
		CreatePakManMap map = zones links = ghzones folder = 'zones_ps2/' size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024) allocheap = <main_mem_heap> vramheap = <vram_heap>
	else
		CreatePakManMap map = zones links = ghzones folder = 'zones/' size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024) allocheap = <main_mem_heap> vramheap = <vram_heap>
	endif
	MemPopContext
endscript

script autolaunch_spawned 
	if ($net_autolaunch_role = None)
		($default_loading_screen.create)
		mc_setactiveplayer \{querydefault}
		if ($autolaunch_showstorageselector = 1)
			ShowStorageSelector
		endif
		if GlobalExists \{Name = debug_unlockall}
			playday_unlockall
		endif
		ui_event_block \{event = menu_add
			state = uistate_mainmenu
			data = {
				base_name = 'mainmenu'
			}}
		ui_event_block \{event = menu_add
			state = uistate_select_difficulty
			data = {
				base_name = 'select_difficulty'
			}}
		ui_event_block \{event = menu_add
			state = uistate_setlist
			data = {
				base_name = 'setlist'
			}}
		ui_event event = menu_change data = {state = uistate_play_song device_num = ($player1_status.controller) uselaststarttime = 1}
	else
		printf \{qs(0xe17688e1)}
		mc_setactiveplayer \{querydefault}
		if ($autolaunch_showstorageselector = 1)
			ShowStorageSelector
		endif
		ui_event_block \{event = menu_add
			state = uistate_mainmenu
			data = {
				base_name = 'mainmenu'
			}}
		ui_event_block \{event = menu_add
			state = uistate_select_difficulty
			data = {
				base_name = 'select_difficulty'
			}}
		ui_event_block \{event = menu_add
			state = uistate_setlist
			data = {
				base_name = 'setlist'
			}}
		net_autolaunch_spawned
	endif
endscript

script kill_dummy_bg_camera 
	KillCamAnim \{Name = dummy_cam_bg}
endscript

script restore_dummy_bg_camera 
	kill_dummy_bg_camera
	PlayIGCCam \{Name = dummy_cam_bg
		viewport = bg_viewport
		Pos = (-28.344543, 0.47631302, 7.1957684)
		Quat = (-0.00071999995, -0.99706, -0.07604)
		FOV = 72.0
		play_hold}
endscript

script get_LevelZoneArray_size 
	GetArraySize \{$LevelZoneArray}
	size = (<array_Size>)
	if GlobalExists \{Name = download_LevelZoneArray
			Type = array}
		GetArraySize \{$download_LevelZoneArray}
		size = (<array_Size> + <size>)
	endif
	return array_Size = <size>
endscript

script get_LevelZoneArray_checksum 
	GetArraySize \{$LevelZoneArray}
	if (<index> < <array_Size>)
		return level_checksum = ($LevelZoneArray [<index>])
	else
		return level_checksum = ($download_LevelZoneArray [(<index> - <array_Size>)])
	endif
endscript

script Is_LevelZone_Downloaded \{level_checksum = load_z_artdeco}
	if ArrayContains array = ($download_LevelZoneArray) contains = <level_checksum>
		formatText TextName = FileName '%s.pak' s = (($download_LevelZones.<level_checksum>).Name)
		GetContentFolderIndexFromFile <FileName>
		if (<device> = content)
			return \{download = 1
				true}
		else
			return \{download = 1
				FALSE}
		endif
	else
		return \{download = 0
			true}
	endif
endscript
debug_cas_checksum_names = [
	largest_desc_id
	budget_report_main
	budget_report_vram
	budget_report_geo
	main
	vram
	underbudget
	overbudget
	totalsize
	slack
	heap_cas_vram
	assetsizes
	budgetsizes
	largestpieces
	worst_parts
	specific_parts
	custom_character_0
	custom_character_1
	custom_character_2
	custom_character_3
	custom_character_4
]

script GetCurrentLevel 
	return level = ($current_level)
endscript

script get_level_prefix 
	if StructureContains \{structure = $LevelZones
			$current_level}
		return prefix = ($LevelZones.($current_level).Name) prefix_crc = ($LevelZones.($current_level).zone)
	endif
	printf \{qs(0xfd035b9c)}
	printf \{qs(0xc919c9ff)}
	printf \{qs(0xc350451a)}
	printf \{qs(0xfd035b9c)}
	printf \{qs(0xfd035b9c)}
	return \{prefix = 'z_unknown'
		prefix_crc = z_unknown}
endscript

script preqbromid 
	pausegh3
endscript

script postqbromid 
	restart_gem_scroller {
		song_name = ($current_song)
		difficulty = ($player1_status.difficulty)
		difficulty2 = ($player2_status.difficulty)
		difficulty3 = ($player3_status.difficulty)
		difficulty4 = ($player4_status.difficulty)
		starttime = ($current_starttime)
		device_num = ($player1_status.controller)
	}
	enable_pause
	if GameIsPaused
		ui_event_block \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
		do_gh3_unpause
	endif
endscript

script InFrontend 
	return \{FALSE}
endscript
rendering_has_been_stopped_explicit = FALSE
rendering_has_been_stopped_hide_glitch = FALSE
rendering_has_been_stopped_menu_transition = FALSE
rendering_has_been_stopped_invalid_viewports = FALSE
rendering_has_been_stopped_loading_screen = FALSE
rendering_has_been_stopped_bg_movie = FALSE

script dumpstoprenderingreasons 
	printstruct {
		rendering_has_been_stopped_explicit = ($rendering_has_been_stopped_explicit)
		rendering_has_been_stopped_hide_glitch = ($rendering_has_been_stopped_hide_glitch)
		rendering_has_been_stopped_menu_transition = ($rendering_has_been_stopped_menu_transition)
		rendering_has_been_stopped_invalid_viewports = ($rendering_has_been_stopped_invalid_viewports)
		rendering_has_been_stopped_loading_screen = ($rendering_has_been_stopped_loading_screen)
		rendering_has_been_stopped_bg_movie = ($rendering_has_been_stopped_bg_movie)
	}
endscript

script StartRendering \{reason = explicit}
	switch <reason>
		case explicit
		Change \{ps3_fader_started_rendering = 0}
		Change \{rendering_has_been_stopped_explicit = FALSE}
		case hide_glitch
		Change \{rendering_has_been_stopped_hide_glitch = FALSE}
		case menu_transition
		Change \{rendering_has_been_stopped_menu_transition = FALSE}
		case invalid_viewports
		Change \{rendering_has_been_stopped_invalid_viewports = FALSE}
		case loading_screen
		Change \{rendering_has_been_stopped_loading_screen = FALSE}
		case bg_movie
		Change \{rendering_has_been_stopped_bg_movie = FALSE}
		default
		ScriptAssert \{qs(0x49bf01ce)}
	endswitch
	if ($rendering_has_been_stopped_bg_movie = true)
		return
	endif
	if ($rendering_has_been_stopped_explicit = true)
		return
	endif
	if ($rendering_has_been_stopped_hide_glitch = true)
		return
	endif
	if ($rendering_has_been_stopped_menu_transition = true)
		return
	endif
	if ($rendering_has_been_stopped_invalid_viewports = true)
		return
	endif
	if ($rendering_has_been_stopped_loading_screen = true)
		return
	endif
	if ($debug_ui_transitions = 1)
		printf channel = ($debug_ui_transitions_channel) qs(0x6a635b1c) r = <reason> donotresolve
	endif
	StartRendering_C
endscript

script StopRendering \{reason = explicit}
	switch <reason>
		case explicit
		Change \{rendering_has_been_stopped_explicit = true}
		case hide_glitch
		Change \{rendering_has_been_stopped_hide_glitch = true}
		case menu_transition
		Change \{rendering_has_been_stopped_menu_transition = true}
		case invalid_viewports
		Change \{rendering_has_been_stopped_invalid_viewports = true}
		case loading_screen
		Change \{rendering_has_been_stopped_loading_screen = true}
		case bg_movie
		Change \{rendering_has_been_stopped_bg_movie = true}
		default
		ScriptAssert \{qs(0xe1901769)}
	endswitch
	if ($debug_ui_transitions = 1)
		printf channel = ($debug_ui_transitions_channel) qs(0x7701e8be) r = <reason> donotresolve
	endif
	StopRendering_C
endscript

script spin_osd spin_rate = ($object_spin_rate)
	RequireParams \{[
			Name
		]
		all}
	setscriptcannotpause
	begin
	if NOT ScreenElementExists id = <Name>
		break
	endif
	<Name> :se_getprops rot_angle
	<Name> :se_setprops rot_angle = (<rot_angle> + <spin_rate>) time = 0.5
	Wait \{5
		gameframes
		ignoreslomo}
	repeat
endscript

script renderingwasstoppedosd 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	OnExitRun \{renderingwasstoppedosd_cleanup}
	CreateScreenElement \{id = renderingstoppedosdspinner
		parent = root_window
		Type = SpriteElement
		Pos = (60.0, 50.0)
		dims = (50.0, 50.0)
		texture = 45_highlight_spinner
		just = [
			center
			center
		]
		z_priority = 1000000}
	renderingstoppedosdspinner :Obj_SpawnScriptNow \{spin_osd
		params = {
			Name = renderingstoppedosdspinner
			spin_rate = 45
		}}
	setscriptcannotpause
	stopped = 0
	display_counter = -1
	total_stopped = 0
	total_frame_length = 0
	begin
	getframelength
	if (<frame_length> > 0.08)
		total_frame_length = (<total_frame_length> + (<frame_length> - 0.033))
	endif
	if RenderingEnabled
		if (<stopped> || (<frame_length> > 0.08))
			if ScreenElementExists \{id = renderingstoppedosd}
				DestroyScreenElement \{id = renderingstoppedosd}
			endif
			text_color = [255 255 255 255]
			if (<total_stopped>)
				text_color = [235 235 15 255]
			endif
			total_stopped = (<total_stopped> + <stopped>)
			formatText TextName = stopped_text qs(0x57fcfd63) d = <total_stopped> l = <total_frame_length>
			CreateScreenElement {
				id = renderingstoppedosd
				parent = root_window
				Type = TextBlockElement
				font = fontgrid_text_3
				Scale = 0.6
				fit_width = `scale	each	line	if	larger`
				text = <stopped_text>
				Pos = (80.0, 30.0)
				dims = (640.0, 100.0)
				just = [left top]
				rgba = <text_color>
				Shadow
				shadow_rgba = [0 0 0 255]
				shadow_offs = (2.0, 2.0)
				internal_just = [left top]
				z_priority = 1000000
			}
			<display_counter> = 60
			if (<stopped>)
				printf \{channel = UI
					qs(0x0ce6decd)}
				printf channel = UI qs(0x027591dc) d = <stopped>
				printf \{channel = UI
					qs(0x0ce6decd)}
			endif
			if (<frame_length> > 0.02)
				printf \{channel = UI
					qs(0x4431ef9f)}
				printf channel = UI qs(0xa3fecffb) d = (<frame_length> - 0.033)
				printf \{channel = UI
					qs(0x4431ef9f)}
			endif
			<stopped> = 0
		elseif (<display_counter> > 0)
			<display_counter> = (<display_counter> - 1)
			if (<display_counter> <= 0)
				total_stopped = 0
				total_frame_length = 0
				if ScreenElementExists \{id = renderingstoppedosd}
					DestroyScreenElement \{id = renderingstoppedosd}
				endif
			endif
		endif
	else
		<stopped> = (<stopped> + 1)
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script renderingwasstoppedosd_cleanup 
	if ScreenElementExists \{id = renderingstoppedosd}
		DestroyScreenElement \{id = renderingstoppedosd}
	endif
	if ScreenElementExists \{id = renderingstoppedosdspinner}
		DestroyScreenElement \{id = renderingstoppedosdspinner}
	endif
endscript

script get_player_status_checksum 
	RequireParams \{[
			Player
		]
		all}
	getmaxplayers
	if ((<Player> < 1) || (<Player> > <max_players>))
		SoftAssert 'player value %p should be in range 1-4' p = <Player>
		<Player> = 1
	endif
	formatText checksumName = player_status 'player%p_status' p = <Player>
	return player_status = <player_status>
endscript

script get_replay_heap 
	if isps3
		return \{replay_heap = debugheap}
	endif
	return \{replay_heap = BottomUpHeap}
endscript

script are_replays_enabled 
	return \{FALSE}
endscript

script runonqbr 
	if CD
		return
	endif
	if (<file> = 'reloads\\guitar_band_preset_profiles.qb.xen')
		stars
		printf \{qs(0xb2f78668)}
		stars
		if ($cas_heap_state = in_cas)
			if getcurrentcasobject
				GetArraySize \{$preset_musician_profiles_modifiable}
				i = 0
				begin
				globaltag_set_preset_musician savegame = ($cas_current_savegame) index = <i> appearance = ($preset_musician_profiles_modifiable [<i>].appearance)
				i = (<i> + 1)
				repeat <array_Size>
				if NOT is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
					refreshcasprofile
				endif
			endif
		endif
	endif
endscript

script hide_glitch \{num_frames = 2}
	SpawnScriptNow hide_glitch_spawned params = {num_frames = <num_frames>}
endscript
debug_ui_transitions = 0
debug_ui_transitions_channel = UI
hide_glitch_count = 0

script hide_glitch_spawned 
	OnExitRun \{hide_glitch_spawned_exit}
	setscriptcannotpause
	Change hide_glitch_count = ($hide_glitch_count + 1)
	if ($debug_ui_transitions = 1)
		printf channel = ($debug_ui_transitions_channel) qs(0x58d5897b) d = ($hide_glitch_count) f = <num_frames>
		if ($hide_glitch_count = 1)
			printscriptinfo channel = ($debug_ui_transitions_channel) 'hide_glitch_spawned'
		endif
	endif
	StopRendering \{reason = hide_glitch}
	Wait <num_frames> gameframes
endscript

script hide_glitch_spawned_exit 
	Change hide_glitch_count = ($hide_glitch_count - 1)
	if ($debug_ui_transitions = 1)
		printf channel = ($debug_ui_transitions_channel) qs(0x4943dab8) d = ($hide_glitch_count) f = <num_frames>
		if ($hide_glitch_count = 0)
			printscriptinfo channel = ($debug_ui_transitions_channel) 'hide_glitch_spawned_exit'
		endif
	endif
	if ($hide_glitch_count = 0)
		StartRendering \{reason = hide_glitch}
	endif
endscript
