show_gpu_time = 0
output_gpu_log = 0
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
current_song = battery
current_difficulty_coop = easy
current_level = load_z_forum
current_highway = highway
current_time = 0.0
current_deltatime = 0.0167
current_starttime = 0
current_endtime = 0
current_looppoint = -1000000
current_speedfactor = 1.0
autolaunch_startnow = 0
autolaunch_showstorageselector = 1
current_song_qpak = none
current_song_qpak_mocap = none
current_song_qpak_performance = 0
last_song_failed = none
current_song_failed_num = 0
current_transition = none
debug_current_transition = none
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
startup_song = battery
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
cheat_performancemode = -1
cheat_hyperspeed = -1
cheat_autokick = 0
cheat_freedrum = -1
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
crowd_model_array = none
failed_song_time = 0.0
current_section_array = none
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
	null
	null
	null
	null
	null
	null
]

script reset_quickplay_song_list 
	change \{quickplay_song_list_current = -1}
	getarraysize \{$quickplay_song_list}
	i = 0
	begin
	setarrayelement arrayname = quickplay_song_list globalarray index = <i> newvalue = null
	<i> = (<i> + 1)
	repeat <array_size>
endscript
sysnotify_menus_position = topright
sysnotify_ingame_position = topright
cameracuts_enablevideovenuecams = 0
heap_song = heap_cas

script get_heap_sizes 
	getplatform
	switch <platform>
		case xenon
		<heap_size_globalpak> = (32 * 1024 * 1024)
		<heap_size_globalpak_vram> = 0
		<heap_size_audio> = (48 * 1024 * 1024)
		<heap_size_audio_vram> = 0
		<heap_size_drumkitaudio> = (2 * 1024 * 1024)
		<heap_size_drumkitaudio_vram> = 0
		<heap_size_lightshow> = (800 * 1024)
		<heap_size_musician> = (12700 * 1024)
		<heap_size_musician_vram> = (0 * 1024)
		<heap_size_ragskel> = (400 * 1024)
		<heap_size_musician_anim> = ((11 * 1024 * 1024) + (512 * 1024))
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
		case ps3
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
		<heap_size_musician_anim> = ((11 * 1024 * 1024) + (512 * 1024))
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
		scriptassert \{qs(0xfb3c58ff)}
	endswitch
	return <...>
endscript

script create_havok_heap 
	get_heap_sizes
	pushmemprofile \{'HavokHeap'}
	meminitheap name = 'heap_havok' size = <heap_size_havok>
	popmemprofile
endscript

script print_loading_time 
	getelapsedtime starttime = <starttime>
	finalprintf qs(0x1d312485) a = <elapsedtime> t = <text>
endscript

script guitar_startup 
	change \{assertonmissingscripts = 1}
	loading_screen = 1
	getterritory
	if gotparam \{territory}
		if (<territory> = territory_us)
			if french
				displayloadingscreen \{'boot_legal_frecan'
					spin_texture = 'load_wheel'
					spin_x = 355
					spin_y = 500}
				loading_screen = 0
			endif
		else
			if english
				displayloadingscreen \{'boot_legal_b'
					spin_texture = 'load_wheel'
					spin_x = 355
					spin_y = 500}
				loading_screen = 0
			endif
		endif
	endif
	if (<loading_screen> = 1)
		displayloadingscreen \{'boot_legal'
			spin_texture = 'load_wheel'
			spin_x = 355
			spin_y = 500
			localized}
	endif
	getstarttime
	overallstarttime = <starttime>
	gettruestarttime
	printf \{qs(0xd21eb1c0)}
	get_heap_sizes
	pushmemprofile \{'Global Pak Heap'}
	meminitheap name = 'heap_global_pak' size = <heap_size_globalpak> vram_size = <heap_size_globalpak_vram>
	popmemprofile
	getstarttime
	initializecasarchive
	print_loading_time starttime = <starttime> text = qs(0x6b785631)
	pushmemprofile \{'Characters'}
	meminitheap name = 'heap_musician1' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	meminitheap name = 'heap_musician2' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	meminitheap name = 'heap_musician3' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	meminitheap name = 'heap_musician4' size = <heap_size_musician> vram_size = <heap_size_musician_vram>
	meminitheap name = 'heap_musician_anim' size = <heap_size_musician_anim>
	meminitheap name = 'heap_ragskel' size = <heap_size_ragskel>
	popmemprofile
	pushmemprofile \{'Light Show Heap'}
	meminitheap name = 'heap_lightshow' size = <heap_size_lightshow>
	popmemprofile
	pushmemprofile \{'Downloads'}
	meminitheap name = 'heap_downloads' size = <heap_size_downloads> vram_size = <heap_size_downloads_vram>
	popmemprofile
	pushmemprofile \{'Audio'}
	if isfmodenabled
		meminitheap name = 'heap_audio' size = <heap_size_audio> vram_size = <heap_size_audio_vram>
	endif
	meminitheap name = 'heap_drumkitaudio' size = <heap_size_drumkitaudio> vram_size = <heap_size_drumkitaudio_vram>
	popmemprofile
	initsoundsystem
	if isxenon
		disabledolbydigital
	endif
	loaddrumkitall \{async = 0}
	pushmemprofile \{'Global CAS Heap'}
	meminitheap name = 'heap_global_cas' size = <heap_size_global_cas> vram_size = <heap_size_global_cas_vram>
	popmemprofile
	pushmemprofile \{'CAS Heap'}
	meminitheap name = 'heap_cas' size = <heap_size_cas> vram_size = <heap_size_cas_vram> topdownname = 'heap_cas_topdown'
	popmemprofile
	mempushcontext \{bottomupheap}
	pushmemprofile \{'GH Tunes Cache Heap'}
	meminitheap name = 'heap_ghtunes_cache' size = <heap_size_ghtunes_cache> vram_size = <heap_size_ghtunes_cache_vram>
	popmemprofile
	mempopcontext
	alloc_pak_cache = 0
	if isxenon
		if ((cd) || ($force_pak_caching = 1))
			if ($disable_pak_caching = 0)
				alloc_pak_cache = 1
			endif
		endif
	else
		alloc_pak_cache = 1
	endif
	if (<alloc_pak_cache> = 1)
		mempushcontext \{bottomupheap}
		pushmemprofile \{'Pak Cache Heap'}
		meminitheap name = 'heap_pak_cache' size = <heap_size_pak_cache> vram_size = <heap_size_pak_cache_vram>
		popmemprofile
		mempopcontext
	endif
	printf \{qs(0xac968502)}
	pushmemprofile \{'COIM'}
	initcoim \{size = $generic_coim_size
		blockalign = $generic_coim_blockalign
		coim_min_scratch_blocks
		$generic_coim_params}
	popmemprofile
	pushmemprofile \{'CompositeObjectManager_startup'}
	compositeobjectmanager_startup
	popmemprofile
	printf \{qs(0x14b44030)}
	pushmemprofile \{'MemCardSystem'}
	meminitheap name = 'heap_save_file' size = <heap_size_save_file> vram_size = <heap_size_save_file_vram>
	memcardsysteminitialize
	popmemprofile
	mc_setactiveplayer \{querydefault}
	if NOT isps3
		printf \{qs(0x83673364)}
		pushmemprofile \{'FileCache'}
		initfilecache \{max_files = 1024
			streambuff = 0
			size = 2048
			disable_on_start}
		popmemprofile
	endif
	printf \{qs(0x9fac0f68)}
	pushmemprofile \{'AnimCompressTable'}
	initanimcompresstable \{'anims\\standardkeyq.bin'
		q48}
	initanimcompresstable \{'anims\\standardkeyt.bin'
		t48}
	popmemprofile
	pushmemprofile \{'Animation Cache'}
	initanimsystem {
		animheapsize = 0
		cacheblockalign = 3072
		animnxbuffersize = (2 * 1024 * 1024)
		defcachetype = fullres
		maxanimstages = 2
		maxanimsubsets = 4
		maxdegenerateanims = 3
		animjqsize = (140 * 1024)
	}
	popmemprofile
	loadpak \{'pak/animq.pak'
		heap = topdownheap
		no_vram}
	registerallanimevents
	unloadpak \{'pak/animq.pak'}
	pushmemprofile \{'InitLightManager'}
	initlightmanager \{max_lights = 96
		max_model_lights = 1
		max_groups = 16}
	popmemprofile
	pushmemprofile \{'LightShow'}
	lightshow_addnodeflags
	lightshow_init \{notes = $lightshow_notemapping
		nodeflags = $lightshow_statenodeflags}
	lightshow_setprocessors \{shared = $lightshow_sharedprocessors}
	popmemprofile
	transition_randomizevointros
	pushmemprofile \{'create_node_flags'}
	create_node_flags
	popmemprofile
	pushmemprofile \{'global_model_tex'}
	getstarttime
	loadpak \{'pak/global_model_tex/global_model_tex.pak'
		heap = heap_global_pak}
	print_loading_time starttime = <starttime> text = qs(0x3a0347fb)
	popmemprofile
	pushmemprofile \{'Game Heaps'}
	mempushcontext \{heap_cas}
	getstarttime
	loadpak \{'pak/cas/cas_deform.pak'
		heap = heap_global_cas
		is_raw}
	print_loading_time starttime = <starttime> text = qs(0x7c888044)
	getstarttime
	loadpak \{'pak/cas/cas_acc_bones.pak'
		heap = heap_global_cas
		is_raw
		no_vram}
	print_loading_time starttime = <starttime> text = qs(0xacb83f0e)
	getstarttime
	loadpak \{'pak/cas/cas_globalpak.pak'
		heap = heap_global_cas
		is_raw}
	loadpak \{'pak/cas_captextures.pak'
		heap = heap_global_cas}
	casaddglobalrawpak \{name = `pak/cas/cas_globalpak.pak`}
	casaddglobalrawpak \{name = `pak/cas/cas_globalpak_vram.pak`}
	print_loading_time starttime = <starttime> text = qs(0x23e9449d)
	create_zone_maps
	set_bink_heap_state \{state = small}
	mempopcontext
	popmemprofile
	if NOT ($cas_heap_state = in_game)
		scriptassert \{'Invalid initial cas_heap_state'}
	endif
	if scriptexists \{init_globaltags}
		get_num_globaltag_sets
		init_packed_structs globaltag_sets = <num_globaltag_sets>
		init_globaltags globaltag_sets = <num_globaltag_sets>
	endif
	printf \{qs(0xa30ccd58)}
	if are_replays_enabled
		get_replay_heap
		mempushcontext <replay_heap>
		pushmemprofile \{'Replay buffer'}
		getplatform
		switch <platform>
			case xenon
			<replay_buffer_size> = (1024 * 4)
			case ps3
			<replay_buffer_size> = (1024 * 1)
			default
			scriptassert \{qs(0xe62cb6f3)}
		endswitch
		allocatedatabuffer name = replay kb = <replay_buffer_size>
		popmemprofile
		mempopcontext
	endif
	set_plat_jam_maximums
	engineconfig \{particlelod = 0}
	engineconfig \{shadowalgorithm = none}
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
	getstarttime
	loadpak \{'pak/global_ad_tex/global_ad_tex.pak'
		heap = heap_massive_ads}
	print_loading_time starttime = <starttime> text = qs(0xec5f94aa)
	getstarttime
	loadpak \{'pak/global_rag_skel/global_rag_skel.pak'
		heap = heap_global_pak
		is_raw}
	print_loading_time starttime = <starttime> text = qs(0x2c569805)
	if ($is_demo_mode = 1)
		change \{enable_button_cheats = 0}
	endif
	if cd
		change \{enable_button_cheats = 0}
	endif
	if ($enable_button_cheats = 1)
		launchviewer
		change \{select_shift = 1}
	endif
	if NOT cd
		change \{skip_boot_menu = 1}
	endif
	printf \{qs(0x36fa0eb9)}
	master_sfx_adding_sound_busses
	printf \{qs(0x6e45d61e)}
	pushmemprofile \{'net_load_preferences'}
	net_load_preferences
	popmemprofile
	printf \{qs(0x288a39f2)}
	if scriptexists \{startup}
		startup
	endif
	printf \{qs(0x049fa44b)}
	pushmemprofile \{'UI Pak Slot'}
	meminitheap name = 'heap_ui_pak_slot' size = <heap_size_ui_pak_slot> vram_size = <heap_size_ui_pak_slot_vram>
	popmemprofile
	pushmemprofile \{'UI_InitializeStateMachine'}
	ui_initializestatemachine
	popmemprofile
	printf \{qs(0xd27c51ef)}
	getstarttime
	loadpak \{'zones/global/global.pak'
		heap = heap_global_pak
		splitfile}
	print_loading_time starttime = <starttime> text = qs(0xf9d25732)
	parsenodearray \{queue
		zone_name = global
		array_name = global_nodearray}
	create_global_materials
	getstarttime
	loadpak \{'pak/anims/perm_anims/perm_anims.pak'
		heap = heap_musician_anim
		no_vram}
	loadpak \{'pak/ui_shared/ui_shared.pak'
		heap = heap_global_pak}
	print_loading_time starttime = <starttime> text = qs(0x3136c57e)
	if NOT isps3
		if gotextramemory
			mempushcontext \{debugheap}
		endif
	endif
	loadpak \{'fonts/debug.pak'}
	if NOT isps3
		if gotextramemory
			mempopcontext
		endif
	endif
	setfontproperties \{'debug'
		color_tab = $default_font_colors
		debug_font}
	setfontnonproportionalnumbers \{'debug'}
	if isxenon
		buttons_font = 'buttons_x360'
	else
		if isps3
			buttons_font = 'ButtonsPs3'
		endif
	endif
	setfontproperties <buttons_font> buttons_font
	setfontproperties \{'fontgrid_numeral_a7'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_numeral_a9'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a3'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a6'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a8'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a10'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a11'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a11_b'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a11_large'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_title_a1'
		color_tab = $default_font_colors}
	pushmemprofile \{'FMod Streams + SFX'}
	if isfmodenabled
		getstarttime
		loadfsb \{filename = 'streams/streamall'
			numstreams = 4
			nowait}
		change streamall_fsb_index = <fsb_index>
		print_loading_time starttime = <starttime> text = qs(0x82a57b3c)
		getstarttime
		enableremovesoundentry \{enable}
		loadpak \{'zones/global/global_sfx.pak'
			heap = heap_audio}
		print_loading_time starttime = <starttime> text = qs(0x6c6b87a9)
	endif
	popmemprofile
	setscenepermanent \{scene = 'zones/global/global_gfx.scn'
		permanent}
	pushmemprofile \{'setup_models'}
	setup_models
	popmemprofile
	printf \{qs(0x52f069b2)}
	printf \{qs(0x7ef8c198)
		s = $current_level}
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	addeditablelist \{ped_editable_list}
	if NOT cd
		startkeyboardhandler \{max_length = 128}
	endif
	printf \{qs(0xb698d219)}
	pushmemprofile \{'Atoms Progression Globaltags'}
	initatoms
	setprogressionmaxdifficulty \{difficulty = 4}
	printf \{qs(0xd6c8512c)}
	finalprofile_start \{'reset_globaltags_all'}
	getstarttime
	reset_globaltags_all
	print_loading_time starttime = <starttime> text = qs(0x6f02fec2)
	finalprofile_stop \{'reset_globaltags_all'}
	printf \{qs(0xacfe5420)}
	popmemprofile
	setup_sprites
	disable_pause
	setshadowrenderingflags \{enable = 'true'
		object = 'skin'}
	setshadowmapparams \{far = 16.0}
	pushmemprofile \{'BG Viewport'}
	setup_bg_viewport
	restore_dummy_bg_camera
	popmemprofile
	getmaxplayers
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	formattext textname = player_text 'p%i' i = <player> addtostringlookup
	spawnscriptlater create_guitar_events params = {<...>}
	player = (<player> + 1)
	repeat <max_players>
	setshadowprojectiontexture \{texture = white}
	fadetoblack \{on
		alpha = 1.0
		time = 0.0
		z_priority = 100
		no_wait}
	if ($autolaunch_startnow = 0)
		if globalexists \{name = autolaunch_state
				type = checksum}
			fadetoblack \{off
				no_wait}
			change \{primary_controller_assigned = 1}
			ui_event \{event = menu_change
				data = {
					state = $autolaunch_state
				}}
		elseif ($skip_boot_menu = 1)
			change \{primary_controller_assigned = 1}
			startrendering
			if (($autolaunch_cas = 1) || ($autolaunch_cas_artist) || ($autolaunch_jam = 1) || ($skip_signin = 1))
				change \{skip_signin = 0}
				change \{primary_controller_assigned = 1}
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
			startrendering
			ui_event \{event = menu_change
				data = {
					state = uistate_boot_legal
				}}
			addparams \{donthide}
		endif
	else
		startrendering
		fadetoblack \{off
			no_wait}
		spawnscriptlater \{autolaunch_spawned}
	endif
	guitar_create_character_maps
	buildcaslookuptables \{master_editable_list = master_editable_list}
	if NOT cd
		if casartist
			verify_cas_budgets \{profiles}
		endif
	endif
	pushmemprofile \{'CAS Asset Storage'}
	casallocatebudgetblock \{heap = heap_musician1
		name = heap_musician1
		budget = $cas_budget_groups}
	casallocatebudgetblock \{heap = heap_musician2
		name = heap_musician2
		budget = $cas_budget_groups}
	casallocatebudgetblock \{heap = heap_musician3
		name = heap_musician3
		budget = $cas_budget_groups}
	casallocatebudgetblock \{heap = heap_musician4
		name = heap_musician4
		budget = $cas_budget_groups}
	casallocatebudgetblock \{heap = heap_musician4
		name = band_logo_block
		budget = $cas_band_logo_budget}
	createassetstoragefrombudgetblock \{name = heap_musician1}
	createassetstoragefrombudgetblock \{name = heap_musician2}
	createassetstoragefrombudgetblock \{name = heap_musician3}
	createassetstoragefrombudgetblock \{name = heap_musician4}
	createassetstoragefrombudgetblock name = band_logo_block slopheap = bottomupheap assetcontext = ($cas_band_logo_details.assetcontext)
	popmemprofile
	castemporariessetheap \{heap = heap_cas}
	getstarttime
	check_for_dupe_profiles
	print_loading_time starttime = <starttime> text = qs(0xccbb6862)
	create_font_arrays
	pushmemprofile \{'band_logo'}
	ensure_band_logo_object_created
	popmemprofile
	registertexdictforui ($cas_band_logo_details.texdict)
	change \{tutorial_disable_hud = 0}
	createscreenelement \{type = containerelement
		id = dead_particle_container
		parent = root_window
		pos = (0.0, 0.0)}
	pushmemprofile \{'Init2DParticles'}
	init2dparticles \{parent = dead_particle_container}
	popmemprofile
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
		togglemetrics \{mode = 5}
		change \{current_cpu = 6}
	else
		if ($show_cpu_time = 1)
			change \{current_cpu = 0}
			togglemetrics \{mode = 5}
		else
			togglemetrics \{mode = 0}
		endif
	endif
	if ($show_build_version = 1)
		debug_toggle_changelist \{show}
	endif
	finalbuildmemreport
	if NOT gotparam \{donthide}
		hideloadingscreen
	endif
	print_loading_time starttime = <overallstarttime> text = qs(0xe79eced7)
endscript

script verify_cas_budgets 
	set_bink_heap_state \{state = big}
	verifycasbudgets editable_list = $master_editable_list budgets = $cas_budget_groups <...>
	if gotparam \{textures}
		verifycaptextures
	endif
	if gotparam \{profiles}
		verifycapprofile profile = ($default_custom_musician_profile_female) <...>
		verifycapprofile profile = ($default_custom_musician_profile_male) <...>
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
	set_bink_heap_state \{state = small}
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
bink_heap_state = off

script set_bink_heap_state 
	requireparams \{[
			state
		]
		all}
	if ($bink_heap_state = <state>)
		return
	endif
	mempushcontext \{heap_cas}
	unload_songqpak
	get_heap_sizes
	switch ($bink_heap_state)
		case off
		printf \{qs(0x26bef179)}
		case big
		case small
		memdeleteheap \{name = heap_bink}
		default
		scriptassert \{qs(0xc3919883)}
	endswitch
	change bink_heap_state = <state>
	switch (<state>)
		case small
		printf \{qs(0xa2f2f362)}
		meminitheap name = 'heap_bink' size = <heap_size_bink_small>
		case big
		printf \{qs(0x2d1545f5)}
		meminitheap name = 'heap_bink' size = <heap_size_bink>
		case off
		printf \{qs(0xd0f3773c)}
		default
		scriptassert \{qs(0x5271763f)}
	endswitch
	mempopcontext
endscript

script set_cas_heap_state 
	if NOT ($cas_heap_state = <state>)
		casblockforcomposite
		get_heap_sizes
		free_cas_cache_pak
		pushmemprofile \{'Game Heaps'}
		mempushcontext \{heap_cas}
		if should_put_zones_on_debug_heap
			vram_only_flag = {vram_only}
		endif
		if (<state> = in_game)
			set_bink_heap_state \{state = off}
			dumpfragments \{heap = heap_cas}
			pakmanresizemap map = zones size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024) <vram_only_flag>
			set_bink_heap_state \{state = small}
		else
			unload_songqpak
			set_bink_heap_state \{state = off}
			dumpfragments \{heap = heap_cas}
			pakmanresizemap map = zones size = (<size_zones_in_cas> / 1024) vram_size = (<size_zones_in_cas_vram> / 1024) <vram_only_flag>
			set_bink_heap_state \{state = small}
			create_cas_cache_pak size = <cas_cache_size_in_cas> vram_size = <cas_cache_size_vram_in_cas>
		endif
		mempopcontext
		popmemprofile
	endif
	change cas_heap_state = <state>
endscript

script should_put_zones_on_debug_heap 
	if isps3
		if NOT finalbuild
			if gotextramemory
				if globalexists \{name = zones_on_debugheap}
					if ($zones_on_debugheap = 1)
						return \{true}
					endif
				endif
			endif
		endif
	endif
	return \{false}
endscript

script create_zone_maps 
	get_heap_sizes
	slop_heap = bottomupheap
	main_mem_heap = heap_cas
	vram_heap = heap_cas
	if should_put_zones_on_debug_heap
		main_mem_heap = debugrsxheap
		slop_heap = debugheap
		size_zones = ((25 * 1024 * 1024) - 1024)
	endif
	printf \{qs(0xd8517ff0)}
	mempushcontext <slop_heap>
	if ($ps2_venues = 1)
		createpakmanmap map = zones links = ghzones folder = 'zones_ps2/' size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024) allocheap = <main_mem_heap> vramheap = <vram_heap>
	else
		createpakmanmap map = zones links = ghzones folder = 'zones/' size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024) allocheap = <main_mem_heap> vramheap = <vram_heap>
	endif
	mempopcontext
endscript

script autolaunch_spawned 
	if ($net_autolaunch_role = none)
		($default_loading_screen.create)
		mc_setactiveplayer \{querydefault}
		if ($autolaunch_showstorageselector = 1)
			showstorageselector
		endif
		if globalexists \{name = debug_unlockall}
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
			showstorageselector
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
	killcamanim \{name = dummy_cam_bg}
endscript

script restore_dummy_bg_camera 
	kill_dummy_bg_camera
	playigccam \{name = dummy_cam_bg
		viewport = bg_viewport
		pos = (-28.344543, 0.47631302, 7.1957684)
		quat = (-0.00071999995, -0.99706, -0.07604)
		fov = 72.0
		play_hold}
endscript

script get_levelzonearray_size 
	getarraysize \{$levelzonearray}
	size = (<array_size>)
	if globalexists \{name = download_levelzonearray
			type = array}
		getarraysize \{$download_levelzonearray}
		size = (<array_size> + <size>)
	endif
	return array_size = <size>
endscript

script get_levelzonearray_checksum 
	getarraysize \{$levelzonearray}
	if (<index> < <array_size>)
		return level_checksum = ($levelzonearray [<index>])
	else
		return level_checksum = ($download_levelzonearray [(<index> - <array_size>)])
	endif
endscript

script is_levelzone_downloaded \{level_checksum = load_z_artdeco}
	if arraycontains array = ($download_levelzonearray) contains = <level_checksum>
		formattext textname = filename '%s.pak' s = (($download_levelzones.<level_checksum>).name)
		getcontentfolderindexfromfile <filename>
		if (<device> = content)
			return \{download = 1
				true}
		else
			return \{download = 1
				false}
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

script getcurrentlevel 
	return level = ($current_level)
endscript

script get_level_prefix 
	if structurecontains \{structure = $levelzones
			$current_level}
		return prefix = ($levelzones.($current_level).name) prefix_crc = ($levelzones.($current_level).zone)
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
endscript

script infrontend 
	return \{false}
endscript
rendering_has_been_stopped_explicit = false
rendering_has_been_stopped_hide_glitch = false
rendering_has_been_stopped_menu_transition = false
rendering_has_been_stopped_invalid_viewports = false
rendering_has_been_stopped_loading_screen = false

script dumpstoprenderingreasons 
	printstruct {
		rendering_has_been_stopped_explicit = ($rendering_has_been_stopped_explicit)
		rendering_has_been_stopped_hide_glitch = ($rendering_has_been_stopped_hide_glitch)
		rendering_has_been_stopped_menu_transition = ($rendering_has_been_stopped_menu_transition)
		rendering_has_been_stopped_invalid_viewports = ($rendering_has_been_stopped_invalid_viewports)
		rendering_has_been_stopped_loading_screen = ($rendering_has_been_stopped_loading_screen)
	}
endscript

script startrendering \{reason = explicit}
	switch <reason>
		case explicit
		change \{ps3_fader_started_rendering = 0}
		change \{rendering_has_been_stopped_explicit = false}
		case hide_glitch
		change \{rendering_has_been_stopped_hide_glitch = false}
		case menu_transition
		change \{rendering_has_been_stopped_menu_transition = false}
		case invalid_viewports
		change \{rendering_has_been_stopped_invalid_viewports = false}
		case loading_screen
		change \{rendering_has_been_stopped_loading_screen = false}
		default
		scriptassert \{qs(0x49bf01ce)}
	endswitch
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
	startrendering_c
endscript

script stoprendering \{reason = explicit}
	switch <reason>
		case explicit
		change \{rendering_has_been_stopped_explicit = true}
		case hide_glitch
		change \{rendering_has_been_stopped_hide_glitch = true}
		case menu_transition
		change \{rendering_has_been_stopped_menu_transition = true}
		case invalid_viewports
		change \{rendering_has_been_stopped_invalid_viewports = true}
		case loading_screen
		change \{rendering_has_been_stopped_loading_screen = true}
		default
		scriptassert \{qs(0xe1901769)}
	endswitch
	stoprendering_c
endscript

script get_player_status_checksum 
	requireparams \{[
			player
		]
		all}
	getmaxplayers
	if ((<player> < 1) || (<player> > <max_players>))
		softassert 'player value %p should be in range 1-4' p = <player>
		<player> = 1
	endif
	formattext checksumname = player_status 'player%p_status' p = <player>
	return player_status = <player_status>
endscript

script get_replay_heap 
	if isps3
		return \{replay_heap = debugheap}
	endif
	return \{replay_heap = bottomupheap}
endscript

script are_replays_enabled 
	return \{false}
endscript

script runonqbr 
	if cd
		return
	endif
	if (<file> = 'reloads\\guitar_band_preset_profiles.qb.xen')
		stars
		printf \{qs(0xb2f78668)}
		stars
		if ($cas_heap_state = in_cas)
			if getcurrentcasobject
				getarraysize \{$preset_musician_profiles_modifiable}
				i = 0
				begin
				globaltag_set_preset_musician savegame = ($cas_current_savegame) index = <i> appearance = ($preset_musician_profiles_modifiable [<i>].appearance)
				i = (<i> + 1)
				repeat <array_size>
				if NOT is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
					refreshcasprofile
				endif
			endif
		endif
	endif
endscript

script hide_glitch \{num_frames = 1}
	spawnscriptnow hide_glitch_spawned params = {num_frames = <num_frames>}
endscript
hide_glitch_count = 0

script hide_glitch_spawned 
	onexitrun \{hide_glitch_spawned_exit}
	setscriptcannotpause
	change hide_glitch_count = ($hide_glitch_count + 1)
	stoprendering \{reason = hide_glitch}
	wait <num_frames> gameframes
endscript

script hide_glitch_spawned_exit 
	change hide_glitch_count = ($hide_glitch_count - 1)
	if ($hide_glitch_count = 0)
		startrendering \{reason = hide_glitch}
	endif
endscript
