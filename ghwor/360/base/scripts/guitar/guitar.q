show_gpu_time = 0
output_gpu_log = 0
gpu_log_start_logging = 0
show_cpu_time = 0
show_play_log = 0
play_log_lines = 10
show_guitar_tilt = 0
nxwatson_channels = 1
output_song_stats = 0
show_sensor_debug = 0
vocal_debug_hud = 0
roland_drumkit = 1
save_heap_created_at_boot = 0
g_skip_intro_movie = 0
g_suppress_menu_stack_loop_check = 0
q_boot_scanning_finished = 0
g_long_dlc_scan_at_boot = 0
g_long_dlc_scan_at_boot_start_time = 0
ps2_venues = 0
current_level = $default_venue
current_time = 0.0
current_deltatime = 0.0167
current_starttime = 0
current_endtime = 0
current_looppoint = -1000000
current_speedfactor = 1.0
autolaunch_startnow = 0
autolaunch_showstorageselector = 1
current_song_qpak = None
current_song_qpak_performance = 0
freeplay_mem_dump_done = 0
last_song_failed = None
current_song_failed_num = 0
current_transition = None
debug_current_transition = None
in_band_lobby = 0
num_players_finished = 0
guitar_fretbar_divisions = 2
drum_fretbar_divisions = 2
always_corrupt_savegames = 0
disable_band = 0
disable_crowd = 0
disable_note_input = 0
is_network_game = 0
net_ready_to_start = 0
rich_presence_context = presence_menus
game_mode = quickplay
allow_controller_for_all_instruments = 0
autolaunch_cas = 0
autolaunch_jam = 0
autolaunch_lobby = 0
autolaunch_mainmenu = 0
g_skip_social_networks = 0
skip_signin = 0
skip_career_forced_flow = 0
show_movies = 1
downloadcontent_enabled = 1
input_mode = record
replay_suspend = 1
songtime_paused = 0
drum_solo_songtime_paused = 0
drum_solo_length = 0.0
drum_solo_no_gems = 0
drum_rock_meter_weights = {
	beginner = [
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
net_pattern = 0
net_strum = 0
display_debug_input = 0
output_log_file = 0
practice_start_time = 0
practice_end_time = 0
practice_loop_section = 1
startup_song = bloodlines
time_audio_offset = 0.0
time_gem_offset = 0.0
time_input_offset = 0.0
time_drum_midi_offset = 0.0
time_gem_offset_with_lag = 0.0
time_drum_midi_offset_with_lag = 0.0
cheat_airinstruments = -1
cheat_invisiblecharacters = -1
Cheat_PerformanceMode = -1
cheat_invincible = 0
cheat_focusmode = -1
cheat_hudfreemode = -1
cheat_soundcheckmode = -1
challenge_fretbar_width = 1.5
challenge_fretbar_z = 3.9
crowd_model_array = None
crowd_3d_model_array = None
failed_song_time = 0.0
current_section_array = None
current_section_array_entry = 0
primary_controller = 0
primary_controller_assigned = 0
invite_controller = -1
allow_missing_song_fsbs = 0
streamall_fsb_index = -1
sixchannelfiles_fsb_index = -1
enable_button_cheats = 1
enable_debug_menus = 1
winning_player_camera_percentage = 100
playerserver_frame_lag = 0
sysnotify_menus_position = topright
sysnotify_ingame_position = topright
instrument_checksums = [
	guitar
	bass
	vocals
	drum
]
instrument_text = [
	qs(0x09048d9e)
	qs(0xb6237ee8)
	qs(0x879f5b50)
	qs(0x04246759)
]
part_priority = [
	vocals
	drum
	guitar
	bass
]
random_songs_on_disc_only = 0
boot_movie_done = 0
cameracuts_enablevideovenuecams = 0
use_worst_band = 0
g_skinning_lod_dist = 6

script print_loading_time 
	GetTrueElapsedTime starttime = <starttime>
	finalprintf qs(0xc84bff60) a = <ElapsedTime> t = <text>
	GetTrueStartTime
	return starttime = <starttime>
endscript

script guitar_startup 
	if GlobalExists \{Name = scriptstocompile}
		GetArraySize \{$scriptstocompile}
		if (<array_Size> > 0)
			index = 0
			begin
			enablecompiledscript scriptname = ($scriptstocompile [<index>].scriptname)
			index = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	if ScriptExists \{pre_startup}
		pre_startup
	endif
	if demobuild
		if ($kiosk_demo = 1)
			Change gh6_songlist = ($gh6_demo_kiosk_songlist)
		else
			Change gh6_songlist = ($gh6_demo_xbla_songlist)
		endif
	endif
	GetTrueStartTime
	guitar_startup_initialize
	guitar_startup_memory
	guitar_startup_systems
	print_loading_time starttime = <starttime> text = qs(0xc0c883fd)
	if ScriptExists \{console_debug_create_personal}
		console_debug_create_personal
	else
		console_debug_create
	endif
	SpawnScriptNow \{guitar_startup_spawned}
endscript

script debug_timing_test 
	ToggleMetrics \{mode = 2}
	MoveProfileCursor cpu = ($current_cpu) freeze
endscript

script guitar_startup_spawned 
	audio_ui_menu_music_off
	memory_create_song_heap
	guitar_startup_critical_loads
	SpawnScriptNow \{guitar_startup_async_init}
	output_status_begin \{prefix = 'movie'}
	output_status \{prefix = 'movie'
		text = 'Loading intro movie to memory.'}
	output_status \{prefix = 'movie'
		text = 'cleanup'}
	StartRendering
	HideLoadingScreen
	fadetoblack \{OFF
		no_wait}
	create_loading_screen \{loading_screen_type = bink
		bink = 'logo_intro'
		bink_heap = heap_cas_cache
		bink_heap_ps3 = heap_cas_cache_vram
		pause_script = guitar_startup_async_init}
	output_status_end \{prefix = 'movie'}
	output_status_begin \{prefix = 'mload'}
	output_status \{prefix = 'mload'
		text = 'pak/anims/perm_anims/perm_anims.pak & pak/ui_shared/ui_shared.pak'}
	LoadPakAsync \{pak_name = 'pak/anims/perm_anims/perm_anims.pak'
		Heap = heap_musician_anim
		no_vram}
	LoadPakAsync \{pak_name = 'pak/ui_shared/ui_shared.pak'
		Heap = heap_ui_shared}
	output_status \{prefix = 'mload'
		text = 'Font setup'}
	interlock \{lock_name = lock_uishared}
	output_status \{prefix = 'mgame'
		text = 'Load in-game textures'}
	PushMemProfile \{'z_in_game'}
	LoadPakAsync \{pak_name = 'zones/z_ingame/z_in_game.pak'
		Heap = heap_in_game}
	PopMemProfile
	output_status \{prefix = 'mload'
		text = 'Initializing Anim Cache'}
	LoadPakAsync \{pak_name = 'pak/animq.pak'
		Heap = TopDownHeap
		no_vram}
	registerallanimevents
	UnLoadPak \{'pak/animq.pak'}
	output_status \{prefix = 'mload'
		text = 'Loading global_model_tex'}
	PushMemProfile \{'global_model_tex'}
	LoadPakAsync \{pak_name = 'pak/global_model_tex/global_model_tex.pak'
		Heap = heap_global_pak}
	PopMemProfile
	output_status \{prefix = 'mload'
		text = 'Loading cas_captextures'}
	PushMemProfile \{'Game Heaps'}
	LoadPakAsync \{pak_name = 'pak/cas_captextures.pak'
		Heap = heap_cas_global}
	memory_create_zone_maps
	PopMemProfile
	output_status \{prefix = 'mload'
		text = 'Pak for global venue ad textures'}
	LoadPakAsync \{pak_name = 'pak/global_ad_tex/global_ad_tex.pak'
		Heap = heap_massive_ads}
	registertexdictforui \{`pak/global_ad_tex/global_ad_tex.tex`}
	output_status \{prefix = 'mload'
		text = 'Pak for menu ad textures'}
	dynamicadmanagercommand \{func = loadingpak}
	LoadPakAsync \{pak_name = 'pak/menu_ad_tex/menu_ad_tex.pak'
		Heap = heap_massive_ads}
	registertexdictforui \{`pak/menu_ad_tex/menu_ad_tex.tex`}
	output_status \{prefix = 'mload'
		text = 'Load up global ragdoll/skeleton pak. As a rawpak, we\'re instancing out assets from it'}
	LoadPakAsync \{pak_name = 'pak/global_skeletons/global_skeletons.pak'
		Heap = heap_global_pak
		is_raw = 1}
	output_status \{prefix = 'mload'
		text = 'Load up song stats'}
	LoadPakAsync \{pak_name = 'pak/songstat.pak'
		Heap = heap_songstat_pak
		no_vram}
	LoadPakAsync \{pak_name = 'pak/songstat_fcc.pak'
		Heap = heap_songstat_pak
		no_vram}
	output_status \{prefix = 'mload'
		text = 'Loading global.pak'}
	LoadPakAsync \{pak_name = 'zones/global/global.pak'
		Heap = heap_global_pak}
	output_status \{prefix = 'mload'
		text = 'Loading global.pak nodearray'}
	ParseNodeArray \{queue
		zone_name = Global
		array_name = global_NodeArray
		Heap = heap_global_pak}
	output_status \{prefix = 'mload'
		text = 'AvatarBoneRemapTable'}
	PushMemProfile \{'InitializeAvatarBoneRemapTable'}
	initializeavatarboneremaptable
	PopMemProfile
	interlock \{lock_name = lock_materials}
	output_status \{prefix = 'mload'
		text = 'Changelist display settings'}
	if ($show_build_version = 1)
		debug_toggle_changelist \{show}
	endif
	output_status \{prefix = 'mload'
		text = 'FMod Streams + SFX'}
	pausespawnedscript \{guitar_startup_async_init}
	PushMemProfile \{'FMod Streams + SFX'}
	if IsFmodEnabled
		conditional_async_wait \{async = 1}
		LoadFSB \{FileName = 'streams/streamall'
			numstreams = 3}
		Change streamall_fsb_index = <fsb_index>
		conditional_async_wait \{async = 1}
		LoadFSB \{FileName = 'streams/sixchannelfiles'
			numstreams = 1}
		Change sixchannelfiles_fsb_index = <fsb_index>
		conditional_async_wait \{async = 1}
		sfxenginedeferaddsounds \{func = enable}
		LoadPakAsync \{pak_name = 'zones/global/global_sfx.pak'
			Heap = heap_global_sfx}
		sfxenginedeferaddsounds \{func = disable}
		conditional_async_wait \{async = 1}
		begin
		if sfxenginedeferaddsounds \{func = Process
				count = 50}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		conditional_async_wait \{async = 1}
	endif
	PopMemProfile
	unpausespawnedscript \{guitar_startup_async_init}
	output_status \{prefix = 'mload'
		text = 'global_gfx setup'}
	SetScenePermanent \{scene = 'zones/global/global_gfx.scn'
		permanent}
	output_status \{prefix = 'iinit'
		text = 'Set SkinLookupTexture'}
	engineconfig \{skinlookuptexture = `tex/sfx/skinlookup64x64_dnc.dds`}
	output_status \{prefix = 'mload'
		text = 'setup_models'}
	PushMemProfile \{'setup_models'}
	setup_models
	PopMemProfile
	output_status \{prefix = 'mload'
		text = 'Loading Zone'}
	printf \{qs(0x7ef8c198)
		s = $current_level}
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	output_status \{prefix = 'mload'
		text = 'Creating Reverb'}
	audio_effects_create_settings_by_venue
	audio_jam_effects_create_jam_mode_effects
	Change \{g_not_start_of_game = 0}
	output_status \{prefix = 'mload'
		text = 'AddEditableList ped_editable_list'}
	AddEditableList \{ped_editable_list}
	output_status \{prefix = 'mload'
		text = 'StartKeyboardHandler'}
	StartKeyboardHandler \{callBack_Script = handle_keyboard_input}
	output_status_end \{prefix = 'mload'}
	printf \{qs(0xb698d219)}
	output_status_begin \{prefix = 'mgame'}
	output_status \{prefix = 'mgame'
		text = 'Load in-game anims'}
	PushMemProfile \{'z_in_game'}
	PopMemProfile
	output_status \{prefix = 'mgame'
		text = 'Band logo'}
	PushMemProfile \{'band_logo'}
	conditional_async_wait \{async = 1}
	cas_band_logo_create_object
	conditional_async_wait \{async = 1}
	PopMemProfile
	registertexdictforui ($cas_band_logo_details.texdict)
	output_status \{prefix = 'mgame'
		text = 'Create MusicStudio Object'}
	PushMemProfile \{'MusicStudio'}
	CreateCompositeObject \{$musicstudio_mainobj_desc}
	PopMemProfile
	output_status \{prefix = 'mgame'
		text = 'Vocals setup'}
	vocals_start_mic
	webpresence_init
	if ($autolaunch_startnow != 0)
		vocals_distribute_mics
	endif
	output_status \{prefix = 'mgame'
		text = 'Jam Session'}
	songfilemanager \{func = add_song_file
		song_name = jamsession}
	interlock \{Wait
		prefix = 'mgame'
		lock_name = lock_savegame}
	Wait \{1
		gameframe}
	output_status \{prefix = 'mgame'
		text = 'Load venue'}
	interlock \{Wait
		prefix = 'mgame'
		lock_name = lock_globaltags}
	if ($autolaunch_go = -1)
		quickplay_choose_random_venue
		Load_Venue
		Wait \{1
			gameframe}
	endif
	output_status \{prefix = 'mgame'
		text = 'Load song'}
	playlist_clear
	Wait \{1
		gameframe}
	freeplay_next_song \{initial_song_list = true}
	Wait \{1
		gameframe}
	output_status \{prefix = 'mgame'
		text = 'Load persistent band.'}
	Wait \{1
		gameframe}
	persistent_band_create_band \{startup = 1
		async = 1}
	Wait \{1
		gameframe}
	waitunloadgroup \{cas
		async = 1}
	anim_paks_set_state \{state = FrontEnd}
	output_status \{prefix = 'mgame'
		text = 'Preload band_lobbyUI Pak'}
	SetPakManCurrent \{map = ui_paks
		pakname = 'band_lobby'}
	output_status \{prefix = 'mgame'
		text = 'Make sure all async scripts are done.'}
	interlock \{Wait
		prefix = 'mgame'}
	output_status_end \{prefix = 'mgame'}
	output_status_begin \{prefix = 'movie'}
	output_status \{prefix = 'movie'
		text = 'Waiting for movie to finish.'}
	destroy_loading_screen \{wait_for_unload
		wait_for_end = 1}
	output_status_end \{prefix = 'movie'}
	if ($g_skip_intro_movie = 0)
		if isps3
			setbinkheap \{heap_audio
				alloc_type = binkalloc}
			setbinkheap \{heap_bink
				alloc_type = binktexture}
		else
			setbinkheap \{heap_cas_cache}
		endif
		PlayMovieAndWait \{movie = 'initial_boot_movie'
			noblack}
		setbinkheap \{heap_bink}
	endif
	Change \{boot_movie_done = 1}
	interlock \{Wait
		prefix = 'mgame'
		lock_name = lock_freeplay}
	memory_destroy_save_heap_at_boot
	destroy_bink_sub_heaps
	create_bink_sub_heaps
	create_song_and_musicstudio_heaps
	autolaunch_run
	printf \{qs(0x160a1d8c)}
	guitar_initialize_profilers
	getmaxlocalplayers
	Player = 1
	begin
	generate_pos_table Player = <Player> jam_room_highway = 0
	if ($autolaunch_startnow = 1)
		SpawnScriptNow create_guitar_events params = {<...>}
	else
		SpawnScriptLater create_guitar_events params = {<...>}
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	SpawnScriptLater \{create_news_feed_events}
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
			threadsafesetglobalinteger \{global_name = primary_controller_assigned
				new_value = 1}
			Change \{g_boot_sysnotify_wait = FALSE}
			ui_event \{event = menu_change
				data = {
					state = $autolaunch_state
				}}
		else
			if ($skip_signin = 1)
				ui_event \{event = menu_replace
					data = {
						state = uistate_mainmenu
						clear_previous_stack
					}}
			else
				ui_event {
					event = menu_replace
					data = {
						state = uistate_save_icon_warning
						device_num = ($primary_controller)
						clear_previous_stack
					}
				}
			endif
			globaltag_setup_traditional_band \{savegame = 0}
			fadetoblack \{OFF
				no_wait}
		endif
	else
		fadetoblack \{OFF
			no_wait}
		getplayerinfo \{1
			controller}
		ui_event_wait_for_safe
		ui_event event = menu_change data = {state = Uistate_gameplay device_num = <controller> uselaststarttime = 1}
	endif
	if ($debug_unlockall_on_boot)
		if (($primary_controller_assigned = 0) || ($primary_controller = -1))
			threadsafesetglobalinteger \{global_name = primary_controller_assigned
				new_value = 1}
			threadsafesetglobalinteger \{global_name = primary_controller
				new_value = 0}
			unset_primary_controller = 1
		endif
		debug_menu_unlockall
		if GotParam \{unset_primary_controller}
			threadsafesetglobalinteger \{global_name = primary_controller_assigned
				new_value = 0}
		endif
	endif
	SpawnScriptNow \{song_preview_monitor}
	create_ui_visualizer
	if isps3
		sys_mem_limit = ((226 * 1024) + (1040 * 1024))
	else
		sys_mem_limit = 0
	endif
	setsystemmemorylimit limit = <sys_mem_limit>
	SpawnScriptLater \{news_feed_friend_update_request_loop}
	if ($autolaunch_startnow = 1)
		StopRendering
		SpawnScriptNow autolaunch_start_game params = {starttime = ($current_starttime)}
	endif
endscript

script guitar_initialize_profilers 
	<profile_gpu> = 0
	if ($show_gpu_time = 1)
		<profile_gpu> = 1
	endif
	if ($output_gpu_log = 1)
		<profile_gpu> = 1
		if isXenon
			enableprofileinmanager \{processor = 0
				Enabled = 0}
			enableprofileinmanager \{processor = 1
				Enabled = 1}
			enableprofileinmanager \{processor = 2
				Enabled = 0}
			enableprofileinmanager \{processor = 3
				Enabled = 0}
			enableprofileinmanager \{processor = 4
				Enabled = 0}
			enableprofileinmanager \{processor = 5
				Enabled = 0}
			enableprofileinmanager \{processor = 6
				Enabled = 0}
		else
			enableprofileinmanager \{processor = 0
				Enabled = 0}
			enableprofileinmanager \{processor = 1
				Enabled = 1}
			enableprofileinmanager \{processor = 2
				Enabled = 0}
		endif
	endif
	if (<profile_gpu> = 1)
		ToggleMetrics \{mode = 5}
		Change \{current_cpu = 6}
	else
		if ($show_cpu_time = 1)
			Change \{current_cpu = 0}
			ToggleMetrics \{mode = 5}
		endif
	endif
endscript

script autolaunch_start_game \{starttime = 0}
	Transition_SelectTransition
	SpawnScriptLater start_gem_scroller params = {starttime = <starttime> autolaunched_game = 1}
	gh_unpause_ui
endscript

script autolaunch_spawned 
	if ($net_autolaunch_role = None)
		($default_loading_screen.create)
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
			state = uistate_songlist
			data = {
				base_name = 'songlist'
			}}
		getplayerinfo \{1
			controller}
		ui_event event = menu_change data = {state = uistate_play_song device_num = <controller> uselaststarttime = 1}
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
		assign_new_primary_controller \{device_num = 0}
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
		Pos = (-2800000.2, 100000.48, 700000.2)
		Quat = (-0.00071999995, -0.99706, -0.07604)
		FOV = 72.0
		play_hold}
endscript

script get_LevelZoneArray_size 
	GetArraySize \{$LevelZoneArray}
	size = (<array_Size>)
	return array_Size = <size>
endscript

script get_LevelZoneArray_checksum 
	GetArraySize \{$LevelZoneArray}
	if (<index> < <array_Size>)
		return level_checksum = ($LevelZoneArray [<index>])
	endif
endscript
debug_checksum_names = [
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
	size_kb
	custom_character_0
	custom_character_1
	custom_character_2
	custom_character_3
	custom_character_4
	`script	cache	small`
	`script	cache	big`
	script
	playerinfoheap
	heap_global_scripts
	heap_script_pools
	heap_hashitem_pool
	heap_network
	asyncrenderer
	heap_frontend
	heap_render_data
	heap_lightortho
	loadingscreen
	heap_massive_ads
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
	printf \{qs(0xfd035b9c)}
	printf \{qs(0xc350451a)}
	printf \{qs(0xfd035b9c)}
	printf \{qs(0xfd035b9c)}
	return \{prefix = 'z_unknown'
		prefix_crc = z_unknown}
endscript

script preqbromid 
	gh_pause_ui
endscript

script postqbromid 
	getplayerinfo \{1
		controller
		out = device_num}
	restart_gem_scroller {
		starttime = ($current_starttime)
		device_num = <device_num>
	}
endscript

script are_replays_enabled 
	return \{FALSE}
endscript

script StartRendering \{delay = 4}
	popdisablerendering context = legacy_stop_rendering_script Type = unchecked delay = <delay>
endscript

script StopRendering 
	pushdisablerendering \{context = legacy_stop_rendering_script
		Type = unchecked}
endscript

script hide_glitch \{num_frames = !i1768515945}
	SpawnScriptNow hide_glitch_spawned params = {num_frames = <num_frames>}
endscript

script hide_glitch_spawned \{num_frames = !i1768515945}
	OnExitRun \{hide_glitch_spawned_exit}
	setscriptcannotpause
	pushdisablerendering \{context = hide_glitch
		Type = stack}
	Wait <num_frames> gameframes
endscript

script hide_glitch_spawned_exit 
	popdisablerendering \{context = hide_glitch
		Type = stack}
endscript

script spawnscriptdelayed 
	getunnamedchecksum
	SpawnScriptLater spawnscriptdelayedworker params = {scriptname = <checksum> params = <params> frames = <frames> Seconds = <Seconds>}
endscript

script spawnscriptdelayedworker 
	if GotParam \{frames}
		Wait <frames> gameframes
	endif
	if GotParam \{Seconds}
		Wait <Seconds> Seconds
	endif
	SpawnScriptNow <scriptname> params = <params>
endscript

script console_debug_create 
	debugconsole_display_params = {
		m_back_color = [190 , 190 , 190 , 100]
		m_text_color = [10 , 255 , 10 , 255]
		m_scroll_btn_color = [250 , 250 , 250 , 255]
		m_corner = [100.0 , 100.0]
		m_width = 800.0
		m_height = 310.0
		m_text_scale = 0.5
		m_num_rows = 12
		m_char_per_row = 80
		m_animate = 1
	}
	memory_get_heap_sizes
	dbg_console_heap = heap_debug
	if (<heap_size_stash> > 10240)
		if memheapexists \{Name = heap_stash}
			dbg_console_heap = heap_stash
		endif
	endif
	debugconsole_create_params = {
		m_num_command_history = 5
		m_history = 100
		m_toggle_char = '`'
		m_enable = 0
		m_display = 0
		m_heap = <dbg_console_heap>
		m_use_thread_safe = 1
		m_name = debug
	}
	debugconsolecreate display_params = <debugconsole_display_params> create_params = <debugconsole_create_params>
endscript

script console_debug_destroy 
	debugconsoledestroy \{Name = debug}
endscript

script stop_venue_effects 
	if ScriptExists \{z_riothouse_lightning}
		z_riothouse_lightning_kill
		KillSpawnedScript \{Name = z_riothouse_lightning}
	endif
	if ScriptExists \{z_mansionstudio_ambient_lightning}
		z_mansionstudio_celebintro_lightning_setdark
		KillSpawnedScript \{Name = z_mansionstudio_ambient_lightning}
		KillSpawnedScript \{Name = z_mansionstudio_celebintro_lightning}
		KillSpawnedScript \{Name = z_mansionstudio_celebintro_lightning_four_flashes}
	endif
endscript

script start_venue_effects 
	if ScriptExists \{z_riothouse_lightning}
		KillSpawnedScript \{Name = z_riothouse_lightning}
		spawnscript \{z_riothouse_lightning}
	endif
	if ScriptExists \{z_mansionstudio_ambient_lightning}
		KillSpawnedScript \{Name = z_mansionstudio_ambient_lightning}
		spawnscript \{z_mansionstudio_ambient_lightning}
	endif
endscript

script ensure_current_venue_is_loaded 
	GetPakManCurrent \{map = zones}
	if GotParam \{pak}
		if NOT StructureContains \{structure = $LevelZones
				$current_level}
			ScriptAssert \{'No level named %s, check LevelZones in venuelist.q for available levels'
				s = $current_level}
		endif
		if NOT (<pak> = (($LevelZones.$current_level).zone))
			pushdisablerendering \{context = ensure_current_venue_is_loaded}
			pushunsafeforshutdown \{context = ensure_current_venue_is_loaded}
			create_loading_screen
			crowd_system_deinit
			wait_for_deferred_rendering
			venue_system_init \{block_scripts = 0}
			wait_for_deferred_rendering
			crowd_system_init
			wait_for_deferred_rendering
			destroy_loading_screen
			popunsafeforshutdown \{context = ensure_current_venue_is_loaded}
			popdisablerendering \{context = ensure_current_venue_is_loaded}
		endif
	endif
endscript
