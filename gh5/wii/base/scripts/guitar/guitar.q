text = qs(0xe5b08ef0)
use_pcmcia = qs(0xb046dc7a)
viewer_ip = qs(0xdf8e055c)
viewer_subnet = qs(0xf4e5760a)
viewer_gateway = qs(0x14d2d6f9)
use_qbr = 0
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
rock_meter_debug = 0
disable_wii_controller_speaker_output = FALSE
ps2_venues = 0
old_song = None
quickplay_venue = None
current_level = load_z_cairo
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
current_song_qpak_performance = 0
current_band = 1
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
tutorial_disable_hud = 0
current_frame_toggle = 0
whammyon_lockp1 = 0
whammyon_lockp2 = 0
is_network_game = 0
net_ready_to_start = 0
rich_presence_context = presence_menus
game_mode = p1_quickplay
allow_controller_for_all_instruments = 0
skip_boot_menu = 0
autolaunch_cas = 0
autolaunch_cas_soak_test = 0
autolaunch_jam = 0
autolaunch_lobby = 0
skip_signin = 0
skip_autoload = 0
skip_career_forced_flow = 0
autolaunch_mainmenu = 0
show_movies = 1
is_demo_mode = 0
is_multiplayer_beta = 0
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
input_debug_display = 0
display_debug_input = 0
output_log_file = 0
practice_start_time = 0
practice_end_time = 0
practice_loop_section = 1
startup_song = demon
startup_difficulty = easy
time_audio_offset = 0.0
time_gem_offset = 0.0
time_input_offset = 0.0
time_drum_midi_offset = 0.0
wii_seek_lag = 0.0
time_gem_offset_with_lag = 0.0
time_drum_midi_offset_with_lag = 0.0
crowd_band_multiplier = 1.0
cheat_airinstruments = -1
cheat_invisiblecharacters = -1
Cheat_PerformanceMode = -1
cheat_invincible = -1
cheat_focusmode = -1
cheat_hudfreemode = -1
challenge_fretbar_width = 0.75
challenge_fretbar_z = 3.9
original_check_time_early = 0.0
original_check_time_late = 0.0
crowd_model_array = None
failed_song_time = 0.0
current_section_array = None
current_section_array_entry = 0
last_time_in_lead = 0.0
last_time_in_lead_player = -1
enable_saving = 1
enable_loading = 1
primary_controller = 0
primary_controller_assigned = 0
invite_controller = -1
num_career_bands = 3
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
cameracuts_enablevideovenuecams = 0

script get_heap_sizes 
	atoms_size = (65 * 1024)
	get_num_savegames
	GetPlatform
	switch <Platform>
		case ngc
		<heap_size_globalpak> = (1788 * 1024)
		<heap_size_globalpak_vram> = (0 * 1024)
		<heap_size_audio_vram> = (0 * 1024)
		<heap_size_audio> = (0 * 1024)
		<heap_size_musician> = (60 * 1024)
		<heap_size_musician_vram> = (0 * 1024)
		<heap_size_car_musician> = (580 * 1024)
		<heap_size_car_musician_vram> = (0 * 1024)
		<heap_size_instrument_musician> = (280 * 1024)
		<heap_size_instrument_musician_vram> = (0 * 1024)
		<heap_size_perm_anims> = (1450 * 1024)
		<heap_size_cas> = ((18 * 128 * 1024) + (150 * 1024))
		<heap_size_cas_vram> = (0 * 1024 * 1024)
		<heap_size_game> = (3 * 1024 * 1024)
		<heap_size_lightshow> = (448 * 1024)
		<heap_size_ui_pak_slot> = (2847 * 1024)
		<heap_size_ui_pak_slot_vram> = (0 * 1024 * 1024)
		<heap_size_downloads> = (75 * 1024)
		<heap_size_downloads_vram> = (0 * 1024)
		<heap_size_drumkit> = (200 * 1024)
		<heap_size_atoms> = (<atoms_size> * <num_savegames>)
		default
		ScriptAssert \{qs(0xfb3c58ff)}
	endswitch
	return <...>
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
	gman_addgoal \{goal_info = $core_goal_info}
	gman_initializegoalblocking \{goal = core_goal}
	if ($autolaunch_startnow = 1)
		printf \{qs(0x288a39f2)}
		if (ScriptExists startup)
			if (NOT runningsmoketest)
				startup
			endif
		endif
	endif
	Change \{AssertOnMissingScripts = 0}
	SetScreen \{widescreen = 1}
	predisplayloadingscreen \{on_startup = 1}
	SpawnScriptNow \{start_legal_timer}
	if ($autolaunch_startnow = 1)
		StopRendering
	endif
	printf \{qs(0xd21eb1c0)}
	get_heap_sizes
	PushMemProfile \{'Global Pak Heap'}
	MemInitHeap Name = 'heap_global_pak' size = <heap_size_globalpak> vram_size = <heap_size_globalpak_vram>
	PopMemProfile
	PushMemProfile \{'Characters'}
	MemInitHeap Name = 'heap_musician1' size = (<heap_size_musician>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_musician2' size = (<heap_size_musician>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_musician3' size = (<heap_size_musician>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_musician4' size = (<heap_size_musician>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_car_musician1' size = (<heap_size_car_musician>) vram_size = <heap_size_car_musician_vram> arena = 1
	MemInitHeap Name = 'heap_car_musician2' size = (<heap_size_car_musician>) vram_size = <heap_size_car_musician_vram> arena = 1
	MemInitHeap Name = 'heap_car_musician3' size = (<heap_size_car_musician>) vram_size = <heap_size_car_musician_vram> arena = 1
	MemInitHeap Name = 'heap_car_musician4' size = (<heap_size_car_musician>) vram_size = <heap_size_car_musician_vram> arena = 1
	MemInitHeap Name = 'heap_instrument_musician1' size = (<heap_size_instrument_musician>) vram_size = <heap_size_car_musician_vram> arena = 1
	MemInitHeap Name = 'heap_instrument_musician2' size = (<heap_size_instrument_musician>) vram_size = <heap_size_car_musician_vram> arena = 1
	MemInitHeap Name = 'heap_instrument_musician3' size = (<heap_size_instrument_musician>) vram_size = <heap_size_car_musician_vram> arena = 1
	MemInitHeap Name = 'heap_instrument_musician4' size = (<heap_size_instrument_musician>) vram_size = <heap_size_car_musician_vram> arena = 1
	MemInitHeap Name = 'heap_perm_anims' size = <heap_size_perm_anims>
	PopMemProfile
	PushMemProfile \{'Light Show Heap'}
	MemInitHeap Name = 'heap_lightshow' size = <heap_size_lightshow>
	PopMemProfile
	PushMemProfile \{'Downloads'}
	MemInitHeap Name = 'heap_downloads' size = <heap_size_downloads> vram_size = <heap_size_downloads_vram>
	PopMemProfile
	initmicsystem
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
	MemCardSystemInitialize
	PopMemProfile
	mc_setactiveplayer \{querydefault}
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
	LoadPak \{'pak/anims/animq.pak'
		Heap = TopDownHeap
		no_vram}
	registerallanimevents
	UnLoadPak \{'pak/anims/animq.pak'}
	registerscreenfx
	PushMemProfile \{'InitLightManager'}
	InitLightManager \{max_lights = 2
		max_model_lights = 8
		max_groups = 8
		max_render_verts_per_geom = 4096
		max_diffuse_lights = 4}
	PopMemProfile
	PushMemProfile \{'LightShow'}
	LightShow_AddNodeFlags
	LightShow_Init \{notes = $LightShow_NoteMapping
		nodeflags = $LightShow_StateNodeFlags
		ColorOverrideExclusions = $LightShow_ColorOverrideExcludeLights}
	LightShow_SetProcessors \{shared = $LightShow_SharedProcessors}
	PopMemProfile
	PushMemProfile \{'create_node_flags'}
	create_node_flags
	PopMemProfile
	if NOT ($cas_heap_state = in_game)
		ScriptAssert \{'Invalid initial cas_heap_state'}
	endif
	output_status \{prefix = 'mgame'
		text = 'Create MusicStudio Object'}
	PushMemProfile \{'MusicStudio'}
	CreateCompositeObject \{$musicstudio_mainobj_desc}
	PopMemProfile
	output_status \{prefix = 'mgame'
		text = 'Jam Session'}
	songfilemanager \{func = add_song_file
		song_name = jamsession}
	get_num_savegames
	init_packed_structs num_savegames = <num_savegames>
	init_savegames num_savegames = <num_savegames>
	register_initial_character_profiles \{async = 1}
	set_plat_jam_maximums
	engineconfig \{particlelod = 0}
	wii_check_mode_settings
	if ScriptExists \{enable_qbr}
		enable_qbr
	endif
	if ($use_qbr = 1)
		usenetworkpreferences
		network_driver_startup
	endif
	if ($is_demo_mode = 1)
		Change \{enable_button_cheats = 0}
	endif
	if ($enable_debug = 1)
		Change \{enable_button_cheats = 1}
	else
		Change \{enable_button_cheats = 0}
		Change \{fps_hidden = 1}
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
	NetSessionFunc \{func = initngcnetutility}
	wii_utils_user_requested_online
	if ($autolaunch_startnow = 0)
		printf \{qs(0x288a39f2)}
		if ScriptExists \{startup}
			if NOT runningsmoketest
				startup
			endif
		endif
	endif
	allocatedecompressedfontbuffers
	printf \{qs(0x049fa44b)}
	PushMemProfile \{'UI Pak Slot'}
	MemInitHeap Name = 'heap_ui_pak_slot' size = <heap_size_ui_pak_slot> vram_size = <heap_size_ui_pak_slot_vram>
	PopMemProfile
	PushMemProfile \{'UI_InitializeStateMachine'}
	ui_initializestatemachine
	PopMemProfile
	printf \{qs(0x49747766)}
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
	printf \{qs(0xd27c51ef)}
	if (<Platform> = ngc)
		LoadPak \{'zones/global/global.pak'
			Heap = heap_global_pak}
	else
		LoadPak \{'zones/global/global.pak'
			Heap = heap_global_pak
			splitfile}
	endif
	ParseNodeArray \{queue
		zone_name = Global
		array_name = global_NodeArray}
	load_perm_anims
	LoadPak \{'pak/ui/ui_shared.pak'
		Heap = heap_global_pak}
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
	PushMemProfile \{'FMod Streams + SFX'}
	if IsFmodEnabled
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
	endif
	PopMemProfile
	SetScenePermanent \{scene = 'zones/global/global_gfx.scn'
		permanent}
	PushMemProfile \{'setup_models'}
	setup_models
	PopMemProfile
	create_venue_effects_settings
	Change \{not_start_of_game = 0}
	init_sfx_wad_header
	AddEditableList \{ped_editable_list}
	printf \{qs(0xb698d219)}
	PushMemProfile \{'Atoms Progression Globaltags'}
	SetProgressionMaxDifficulty \{difficulty = 4}
	printf \{qs(0xd6c8512c)}
	finalprofile_start \{'reset_globaltags_all'}
	reset_globaltags_all
	finalprofile_stop \{'reset_globaltags_all'}
	printf \{qs(0xacfe5420)}
	PopMemProfile
	setup_sprites
	disable_pause
	SetShadowRenderingFlags \{enable = 'true'
		object = 'skin'}
	SetShadowMapParams \{far = 16.0}
	showstencilshadow
	PushMemProfile \{'BG Viewport'}
	setup_bg_viewport
	restore_dummy_bg_camera
	PopMemProfile
	getmaxlocalplayers
	Player = 1
	begin
	if ($autolaunch_startnow = 1)
		SpawnScriptNow create_guitar_events params = {<...>}
	else
		SpawnScriptLater create_guitar_events params = {<...>}
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	randomize
	SetShadowProjectionTexture \{texture = white}
	if isps3
		Change \{please_dont_turn_off_text = qs(0x7174fcf9)}
		Change \{please_dont_turn_off_text_1 = qs(0xf5011a39)}
		Change \{please_dont_turn_off_text_2 = qs(0xc664f254)}
	else
		Change \{please_dont_turn_off_text = qs(0x55bd9e8f)}
		Change \{please_dont_turn_off_text_1 = qs(0x8fdf9acc)}
		Change \{please_dont_turn_off_text_2 = qs(0xb5ebc165)}
	endif
	autolaunch_run
	wii_change_mode \{mode = bootup}
	if ($autolaunch_startnow = 0)
		if GlobalExists \{Name = autolaunch_state
				Type = checksum}
			fadetoblack \{OFF
				no_wait}
			Change \{primary_controller_assigned = 1}
			HideLoadingScreen
			guitar_launch_initial_state \{state = $autolaunch_state}
		elseif ($skip_boot_menu = 1)
			Change \{primary_controller_assigned = 1}
			HideLoadingScreen
			if (($autolaunch_cas = 1) || ($autolaunch_jam = 1))
				if ($autolaunch_jam = 1)
					Change \{skip_signin = 0}
				endif
				Change \{primary_controller_assigned = 1}
				SetPakManCurrentBlock \{map = zones
					pak = z_cairo
					block_scripts = 1}
				guitar_launch_initial_state \{state = uistate_mainmenu}
			elseif ($autolaunch_mainmenu = 1)
				Change \{autolaunch_mainmenu = 0}
				SetPakManCurrentBlock \{map = zones
					pak = z_cairo
					block_scripts = 1}
				guitar_launch_initial_state \{state = uistate_mainmenu}
			else
				guitar_launch_initial_state \{state = uistate_freeplay}
			endif
		else
			set_home_button_notallowed
			HideLoadingScreen
			guitar_launch_initial_state \{state = uistate_boot_freeplay}
			AddParams \{donthide}
		endif
	else
		fadetoblack \{OFF
			no_wait}
		gman_songfunc \{func = switch_to_next_song_in_play_list
			params = {
				populate_list = true
			}}
		getplayerinfo \{1
			controller}
		ui_event_wait event = menu_change data = {state = Uistate_gameplay device_num = <controller> uselaststarttime = 1}
	endif
	create_font_arrays
	Change \{tutorial_disable_hud = 0}
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
	endif
	SetGlobalTags \{user_options
		params = {
			ps2_widescreen = 1
		}}
	ps2_load_car_part_script
	if ($use_persistent_band = 0)
		get_savegame_from_controller \{controller = $primary_controller}
		globaltag_setup_traditional_band savegame = <savegame>
	else
		globaltag_setup_traditional_band savegame = <savegame>
		persistent_band_create_band \{startup = 1}
	endif
	CreateScreenElement \{Type = ContainerElement
		id = dead_particle_container
		parent = root_window
		Pos = (0.0, 0.0)}
	PushMemProfile \{'Init2DParticles'}
	Init2DParticles \{parent = dead_particle_container}
	PopMemProfile
	SpawnScriptNow \{song_preview_monitor}
	create_initial_temporary_random_cars \{async = 1}
	if ($autolaunch_startnow = 1)
		StopRendering
		SpawnScriptNow \{start_game}
	endif
endscript

script guitar_launch_initial_state 
	if ($skip_autoload = 1)
		ui_event event = menu_change data = {state = <state>}
	else
		ui_event event = menu_change data = {state = uistate_savegame_boot_scan finish_state = <state>}
	endif
endscript

script start_game 
	Load_Venue
	getplayerinfo \{1
		difficulty
		out = difficulty1}
	getplayerinfo \{2
		difficulty
		out = difficulty2}
	getplayerinfo \{3
		difficulty
		out = difficulty3}
	getplayerinfo \{4
		difficulty
		out = difficulty4}
	SpawnScriptLater start_gem_scroller params = {difficulty = <difficulty1> difficulty2 = <difficulty2> difficulty3 = <difficulty3> difficulty4 = <difficulty4>}
endscript

script verify_cas_budgets 
	verifycasbudgets editable_list = $master_editable_list budgets = $cas_budget_groups <...>
	if GotParam \{textures}
		verifycaptextures
	endif
	if GotParam \{profiles}
		verifycapprofile Profile = ($default_custom_musician_profile_female) <...>
		verifycapprofile Profile = ($default_custom_musician_profile_male) <...>
		verifycapprofile profiles = ($preset_musician_profiles_ghrockers) <...>
		verifycapprofile profiles = ($preset_musician_profiles_modifiable) <...>
		verifycapprofile profiles = ($preset_musician_profiles_locked) <...>
		verifycapprofile profiles = ($preset_musician_profiles_debug) <...>
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
endscript

script generate_worst_cas_appearances 
	ScriptAssert \{'generate_worst_cas_appearances: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script set_cas_heap_state 
	Change cas_heap_state = <state>
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
		Pos = (-28.344543, -5.476313, 7.1957684)
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
		getplayerinfo 1 difficulty out = difficulty
		getplayerinfo 2 difficulty out = difficulty2
		getplayerinfo 3 difficulty out = difficulty3
		getplayerinfo 4 difficulty out = difficulty4
		starttime = ($current_starttime)
		getplayerinfo 1 controller out = device_num
	}
endscript

script InFrontend 
	return \{FALSE}
endscript

script StartRendering \{lock = script_lock}
	StartRendering_C lock = <lock>
	Change \{pause_no_render = 0}
endscript

script StopRendering \{lock = script_lock}
	StopRendering_C lock = <lock>
	Change \{pause_no_render = 1}
endscript

script get_replay_heap 
	ScriptAssert \{'get_replay_heap: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script are_replays_enabled 
	ScriptAssert \{'are_replays_enabled: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script runonqbr 
	ScriptAssert \{'RunOnQBR: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script hide_glitch \{num_frames = 1}
	SpawnScriptNow hide_glitch_spawned params = {<...>}
endscript
hide_glitch_count = 0

script hide_glitch_spawned 
	OnExitRun hide_glitch_spawned_exit params = {<...>}
	setscriptcannotpause
	Change hide_glitch_count = ($hide_glitch_count + 1)
	StopRendering
	Wait <num_frames> gameframes
endscript

script hide_glitch_spawned_exit 
	Change hide_glitch_count = ($hide_glitch_count - 1)
	if ($hide_glitch_count = 0)
		StartRendering
	endif
	if GotParam \{run_ui_event_afterwards}
		ui_event event = <run_ui_event_afterwards>
	endif
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

script setanimatingtexturestate \{state = -1}
	ScriptAssert \{'SetAnimatingTextureState: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
g_movie_setup_count = 0

script pre_movie_cleanup 
	Change g_movie_setup_count = ($g_movie_setup_count + 1)
endscript

script post_movie_reset 
	ScriptAssert \{'post_movie_reset: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script reload_venue \{force_encore = 0}
	ScriptAssert \{'reload_venue: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script convoluted_because_of_wait_blocking_reload_venue 
	shut_down_flow_manager
	PauseGame
	kill_gem_scroller
	start_song force_venue_reload = 1 force_encore = <force_encore>
endscript

script load_perm_anims 
	if NOT ispakloaded \{'pak/anims/perm_anims/perm_anims.pak'
			Heap = heap_perm_anims}
		LoadPak \{'pak/anims/perm_anims/perm_anims.pak'
			Heap = heap_perm_anims
			no_vram}
	endif
endscript

script unload_perm_anims \{Wait = FALSE}
	if (<Wait> = true)
		unload_pak_and_wait \{pak = 'pak/anims/perm_anims/perm_anims.pak'}
	else
		UnLoadPak \{'pak/anims/perm_anims/perm_anims.pak'}
	endif
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
