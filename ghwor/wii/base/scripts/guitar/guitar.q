autotest_on = 0
show_gpu_time = 0
output_gpu_log = 0
show_cpu_time = 0
show_play_log = 0
play_log_lines = 10
show_guitar_tilt = 0
nxwatson_channels = 1
output_song_stats = 0
show_sensor_debug = 0
vocal_debug_hud = 0
roland_drumkit = 0
g_skip_intro_movie = 0
g_suppress_menu_stack_loop_check = 0
disable_wii_controller_speaker_output = FALSE
ps2_venues = 0
quickplay_venue = None
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
current_band_profile = 1
last_song_failed = None
current_song_failed_num = 0
current_transition = None
debug_current_transition = None
in_band_lobby = 0
num_players_finished = 0
guitar_fretbar_divisions = 2
drum_fretbar_divisions = 2
disable_band = 0
disable_crowd = 0
disable_note_input = 0
current_frame_toggle = 0
is_network_game = 0
net_ready_to_start = 0
rich_presence_context = presence_menus
game_mode = quickplay
allow_controller_for_all_instruments = 0
autolaunch_cas = 0
autolaunch_cas_soak_test = 0
autolaunch_jam = 0
autolaunch_lobby = 0
g_skip_social_networks = 0
skip_signin = 0
skip_autoload = 0
skip_career_forced_flow = 0
show_movies = 1
downloadcontent_enabled = 1
songtime_paused = 0
drum_solo_songtime_paused = 0
drum_solo_length = 0.0
drum_solo_no_gems = 0
ps2_progressivescan = 0
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
wii_seek_lag = 0.0
time_gem_offset_with_lag = 0.0
time_drum_midi_offset_with_lag = 0.0
cheat_airinstruments = -1
cheat_invisiblecharacters = -1
Cheat_PerformanceMode = -1
cheat_invincible = -1
cheat_focusmode = -1
cheat_hudfreemode = -1
cheat_soundcheckmode = -1
challenge_fretbar_width = 0.75
challenge_fretbar_z = 3.9
crowd_model_array = None
crowd_3d_model_array = None
failed_song_time = 0.0
current_section_array = None
current_section_array_entry = 0
enable_saving = 1
enable_loading = 1
primary_controller = 0
primary_controller_assigned = 0
invite_controller = -1
num_career_bands = 3
streamall_fsb_index = -1
enable_button_cheats = 0
enable_debug_menus = 0
winning_player_camera_percentage = 100
cas_heap_state = in_game
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
random_songs_on_disc_only = 1
boot_movie_done = 0
cameracuts_enablevideovenuecams = 0
fsfx_enabled = 1
debug_dof = 0

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
			enablecompiledscript scriptname = ($scriptstocompile [<index>].scriptname) checksum = ($scriptstocompile [<index>].checksum)
			index = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	GetTrueStartTime
	guitar_startup_initialize
	guitar_startup_memory
	guitar_startup_systems
	print_loading_time starttime = <starttime> text = qs(0xc0c883fd)
	if isngc
		Change current_level = ($default_venue)
	endif
	SpawnScriptNow \{guitar_startup_spawned}
endscript

script debug_timing_test 
	Wait \{100
		gameframes}
	ToggleMetrics \{mode = 2}
	Wait \{100
		gameframes}
	MoveProfileCursor cpu = ($current_cpu) freeze
endscript

script guitar_startup_spawned 
	guitar_startup_critical_loads
	wii_notify_state_change \{ui_state = uistate_freeplay}
	SpawnScriptNow \{guitar_startup_async_init}
	output_status \{prefix = 'movie'
		text = 'cleanup'}
	output_status_end \{prefix = 'movie'}
	output_status_begin \{prefix = 'mload'}
	output_status \{prefix = 'mload'
		text = 'pak/anims/perm_anims/perm_anims.pak & pak/ui_shared/ui_shared.pak'}
	load_perm_anims
	LoadPak \{'pak/ui/ui_shared.pak'
		Heap = heap_global_pak}
	output_status \{prefix = 'mload'
		text = 'Font setup'}
	interlock \{lock_name = lock_uishared}
	output_status \{prefix = 'mload'
		text = 'Initializing Anim Cache'}
	LoadPak \{'pak/anims/animq.pak'
		Heap = TopDownHeap
		no_vram}
	registerallanimevents
	UnLoadPak \{'pak/anims/animq.pak'}
	output_status \{prefix = 'mload'
		text = 'Load up song stats'}
	LoadPak \{'pak/songstat.pak'
		Heap = BottomUpHeap}
	LoadPak \{'pak/songstat_fcc.pak'
		Heap = BottomUpHeap}
	LoadPak \{'pak\\car_parts_data\\car_eye_color_images.pak'
		Heap = BottomUpHeap}
	output_status \{prefix = 'mload'
		text = 'Loading global.pak'}
	LoadPak \{'zones/global/global.pak'
		Heap = heap_global_pak}
	output_status \{prefix = 'mload'
		text = 'Loading global.pak nodearray'}
	ParseNodeArray \{queue
		zone_name = Global
		array_name = global_NodeArray}
	output_status \{prefix = 'mload'
		text = 'Font setup'}
	setup_fonts
	output_status \{prefix = 'mload'
		text = 'FMod Streams + SFX'}
	pausespawnedscript \{guitar_startup_async_init}
	PushMemProfile \{'FMod Streams + SFX'}
	begin
	LoadFSB \{FileName = 'streams/streamall'
		numstreams = 4
		noWait
		disk_stream = true}
	if NOT (<fsb_index> = -1)
		Change streamall_fsb_index = <fsb_index>
		break
	else
		Change \{streamall_fsb_index = -1}
	endif
	Wait \{1
		Seconds}
	repeat
	PopMemProfile
	unpausespawnedscript \{guitar_startup_async_init}
	output_status \{prefix = 'mload'
		text = 'global_gfx setup'}
	SetScenePermanent \{scene = 'zones/global/global_gfx.scn'
		permanent}
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
	Change \{g_not_start_of_game = 0}
	output_status \{prefix = 'mload'
		text = 'AddEditableList ped_editable_list'}
	AddEditableList \{ped_editable_list}
	output_status_end \{prefix = 'mload'}
	printf \{qs(0xb698d219)}
	output_status_begin \{prefix = 'mgame'}
	output_status \{prefix = 'mgame'
		text = 'Create MusicStudio Object'}
	PushMemProfile \{'MusicStudio'}
	CreateCompositeObject \{$musicstudio_mainobj_desc}
	PopMemProfile
	output_status \{prefix = 'mgame'
		text = 'Create WiiDSCommunication Object.'}
	CreateCompositeObject \{params = {
			Name = wiidscommunication
			permanent
		}
		components = [
			{
				component = dscommunication
			}
		]
		Heap = FrontEnd
		can_pause = FALSE}
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
	PushMemProfile \{'Visualizer'}
	visualizermanager_init
	PopMemProfile
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
	anim_paks_set_state \{state = FrontEnd}
	output_status \{prefix = 'mgame'
		text = 'Preload band_lobbyUI Pak'}
	output_status_end \{prefix = 'mgame'}
	StartRendering
	HideLoadingScreen
	fadetoblack \{OFF
		no_wait}
	if ($g_skip_intro_movie = 0)
		if isps3
			setbinkheap \{heap_audio
				alloc_type = binkalloc}
			setbinkheap \{heap_bink
				alloc_type = binktexture}
		else
			setbinkheap \{heap_cas_cache}
		endif
		PlayMovieAndWait \{movie = 'logo_intro'
			noblack}
		PlayMovieAndWait \{movie = 'initial_boot_movie'
			noblack}
		setbinkheap \{heap_bink}
	endif
	Change \{boot_movie_done = 1}
	interlock \{Wait
		prefix = 'mgame'
		lock_name = lock_savegame}
	output_status \{prefix = 'mgame'
		text = 'Make sure all async scripts are done.'}
	interlock \{Wait
		prefix = 'mgame'}
	interlock \{Wait
		prefix = 'mgame'
		lock_name = lock_freeplay}
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
	if ($autolaunch_startnow = 0)
		if GlobalExists \{Name = autolaunch_state
				Type = checksum}
			fadetoblack \{OFF
				no_wait}
			Change \{primary_controller_assigned = 1}
			Change \{g_boot_sysnotify_wait = FALSE}
			ui_event \{event = menu_change
				data = {
					state = $autolaunch_state
				}}
		else
			set_home_button_notallowed
			ui_event_wait_for_safe
			ui_event {
				event = menu_replace
				data = {
					state = uistate_save_icon_warning
					device_num = ($primary_controller)
					clear_previous_stack
				}
			}
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
			Change \{primary_controller_assigned = 1}
			Change \{primary_controller = 0}
			unset_primary_controller = 1
		endif
		debug_menu_unlockall
		if GotParam \{unset_primary_controller}
			Change \{primary_controller_assigned = 0}
		endif
	endif
	SpawnScriptNow \{song_preview_monitor}
	SpawnScriptLater \{news_feed_friend_update_request_loop}
	if ($autolaunch_startnow = 1)
		StopRendering
		SpawnScriptNow autolaunch_start_game params = {starttime = ($current_starttime)}
	endif
	setglobalparticlespeedmultiplier \{speed = 2.0}
endscript

script guitar_initialize_profilers 
	<profile_gpu> = 0
	if ($show_gpu_time = 1)
		<profile_gpu> = 1
	endif
	if ($output_gpu_log = 1)
		<profile_gpu> = 1
	endif
	if (<profile_gpu> = 1)
		ToggleMetrics \{mode = 5}
	endif
endscript

script autolaunch_start_game \{starttime = 0}
	Transition_SelectTransition
	SpawnScriptLater start_gem_scroller params = {starttime = <starttime> autolaunched_game = 1}
	gh_unpause_ui
endscript
force_encore_autolaunch = 0

script autolaunch_spawned 
	($default_loading_screen.create)
	mc_setactiveplayer \{querydefault}
	if ($autolaunch_showstorageselector = 1)
		NewShowStorageSelector
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
		state = uistate_songlist
		data = {
			base_name = 'songlist'
		}}
	pausegh3
	getplayerinfo \{1
		controller}
	ui_event event = menu_change data = {state = uistate_play_song device_num = <controller> uselaststarttime = 1 force_encore = $force_encore_autolaunch selected_level = ($current_level)}
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

script StartRendering 
	popdisablerendering \{context = legacy_stop_rendering_script
		Type = unchecked}
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

script menu_transition_stoprender 
	if GotParam \{die_if_ui_event_running}
		if is_ui_event_running
			return
		endif
	endif
	clean_up_user_control_helpers
	pushblockbuttoneventmappings
	Wait \{2
		gameframes}
	popblockbuttoneventmappings
	StopRendering \{lock = menu_transition}
endscript

script load_perm_anims 
	if NOT ispakloaded \{'pak/anims/perm_anims/perm_anims.pak'
			Heap = heap_perm_anims}
		LoadPak \{'pak/anims/perm_anims/perm_anims.pak'
			Heap = heap_perm_anims
			no_vram}
	endif
endscript

script setup_fonts 
	allocatedecompressedfontbuffers
	decompressfonts \{buttonsps2}
	decompressfonts \{fontgrid_numeral_a1}
	decompressfonts \{fontgrid_numeral_a1_b}
	decompressfonts \{fontgrid_numeral_a2}
	decompressfonts \{fontgrid_text_a1}
	decompressfonts \{fontgrid_text_a3}
	decompressfonts \{fontgrid_title_a1}
	buttons_font = 'ButtonsPS2'
	SetFontProperties <buttons_font> buttons_font
	SetFontProperties \{'fontgrid_numeral_a7'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_numeral_a9'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_numeral_a1'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_numeral_a1_b'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_numeral_a2'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a3'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a5'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a6'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a8'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a10'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a11'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a11_b'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a11_large'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_title_a1'
		color_tab = $Default_Font_Colors}
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

script blockforscript 
	getunnamedchecksum
	begin
	if NOT ScriptIsRunning <checksum>
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script playanimatedtexture 
	SpawnScriptNow animatedtextureloop params = {<...>}
endscript

script animatedtextureloop \{u = -1
		v = -1
		framerate = 10
		grid_size_x = 8
		grid_size_y = 8
		count = -1
		showstats = 0
		start_x = 0
		start_y = 0}
	animatedtextureloop_cfunc_setup
	begin
	if animatedtextureloop_cfunc
		break
	endif
	repeat
	animatedtextureloop_cfunc_cleanup
endscript

script stop_venue_effects 
	if ScriptExists \{z_riothouse_lightning}
		z_riothouse_lightning_kill
		KillSpawnedScript \{Name = z_riothouse_lightning}
	endif
endscript

script start_venue_effects 
	if ScriptExists \{z_riothouse_lightning}
		KillSpawnedScript \{Name = z_riothouse_lightning}
		spawnscript \{z_riothouse_lightning}
	endif
endscript
