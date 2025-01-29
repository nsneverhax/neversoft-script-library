text = qs(0xe5b08ef0)
use_pcmcia = 'true'
viewer_ip = '10.2.1.1'
viewer_subnet = '255.252.0.0'
viewer_gateway = '10.2.0.1'
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
guitar_motion_enable_test = 0
pause_menu_no_bg = 0
vocal_debug_hud = 0
roland_drumkit = 1
rock_meter_debug = 0
disable_wii_controller_speaker_output = FALSE
ps2_venues = 0
quickplay_venue = None
current_song = beastandtheharlot
current_difficulty_coop = easy
current_level = load_z_amazon
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
current_band = 1
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
current_frame_toggle = 0
whammyon_lockp1 = 0
whammyon_lockp2 = 0
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
downloadcontent_enabled = 0
songtime_paused = 0
drum_solo_songtime_paused = 0
drum_solo_length = 0.0
drum_solo_no_gems = 0
ps2_progressivescan = 0
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
startup_song = beastandtheharlot
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
cheat_line6unlock = 1
cheat_alwaysslide = -1
cheat_superuser = -1
cheat_airinstruments = -1
cheat_invisiblecharacters = -1
cheat_snobcrowd = -1
Cheat_PerformanceMode = -1
Cheat_Hyperspeed = -1
cheat_autokick = -1
cheat_freedrum = -1
cheat_unlockquickplay = -1
cheat_unlockattballpark = -1
cheat_gemcolor = -1
cheat_flamecolor = -1
cheat_starcolor = -1
cheat_vocalfireball = -1
cheat_buckethat = -1
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
enable_loading = 1
primary_controller = 0
primary_controller_assigned = 0
invite_controller = -1
num_career_bands = 1
streamall_fsb_index = -1
enable_button_cheats = 0
enable_debug_menus = 0
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

script 0xd1249523 \{0x3631c4e9 = None}
	printf \{'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH'}
	printf 'IsLevelZoneVideoVenue: %a' a = <0x3631c4e9>
	if StructureContains structure = $ghzones <0x3631c4e9>
		printf \{'IsLevelZoneVideoVenue: true'}
		return \{true}
	endif
	printf \{'IsLevelZoneVideoVenue: false'}
	return \{FALSE}
endscript
0x57b923f3 = 0
0x95154ded = None

script 0x2e51d96c 
	return \{FALSE}
endscript

script 0x11a515a1 
	if ($0x57b923f3 = 0)
		GetPakManCurrent \{map = zones}
		Change 0x95154ded = <pak>
		SetPakManCurrentBlock \{map = zones
			pak = None
			block_scripts = 1}
		Change \{0x57b923f3 = 1}
	endif
endscript

script 0x29472091 
	if ($0x57b923f3 > 0)
		SetPakManCurrentBlock \{map = zones
			pak = $0x95154ded
			block_scripts = 1}
		Change \{0x95154ded = None}
		Change \{0x57b923f3 = 0}
	endif
endscript

script 0x622f875f 
	if ($0x57b923f3 < 10)
		if ($0x57b923f3 = 0)
			0x11a515a1
		else
			Change 0x57b923f3 = ($0x57b923f3 + 1)
		endif
	endif
endscript

script popvideovenues 
	if ($0x57b923f3 > 0)
		if ($0x57b923f3 = 1)
			0x29472091
		else
			Change 0x57b923f3 = ($0x57b923f3 - 1)
		endif
	endif
endscript

script get_heap_sizes 
	GetPlatform
	switch <Platform>
		case ngc
		<heap_size_globalpak> = (2226 * 1024)
		<heap_size_globalpak_vram> = (0)
		<heap_size_audio_vram> = (0)
		<heap_size_audio> = (0)
		<heap_size_musician> = (940 * 1024)
		<0x595ea109> = (73 * 1024)
		<heap_size_musician_vram> = (0)
		<heap_size_musician_anim> = (5800 * 1024)
		<heap_size_cas> = (4264 * 1024)
		<heap_size_cas_vram> = (0)
		<heap_size_song> = (3264 * 1024)
		<heap_size_zones> = (5888 * 1024)
		<heap_size_zones_vram> = (0)
		<heap_size_game> = (3072 * 1024)
		<heap_size_lightshow> = (512 * 1024)
		<heap_size_ui_pak_slot> = (3647 * 1024)
		<heap_size_ui_pak_slot_vram> = (0)
		<heap_size_downloads> = (112 * 1024)
		<heap_size_downloads_vram> = (0)
		<heap_size_drumkit> = (200 * 1024)
		default
		ScriptAssert \{qs(0xfb3c58ff)}
	endswitch
	return <...>
endscript

script print_loading_time 
	getelapsedtime starttime = <starttime>
	finalprintf qs(0x1d312485) a = <ElapsedTime> t = <text>
endscript

script guitar_startup 
	if 0x5273083b
		Change \{0x99f61b25 = 0}
	endif
	Change \{AssertOnMissingScripts = 0}
	SetScreen \{widescreen = 1}
	GetStartTime
	overallstarttime = <starttime>
	SpawnScriptNow \{start_legal_timer}
	printf \{qs(0xd21eb1c0)}
	get_heap_sizes
	PushMemProfile \{'Global Pak Heap'}
	MemInitHeap Name = 'heap_global_pak' size = <heap_size_globalpak> vram_size = <heap_size_globalpak_vram>
	PopMemProfile
	PushMemProfile \{'Characters'}
	MemInitHeap Name = 'heap_musician1' size = (<heap_size_musician> + <0x595ea109>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_musician2' size = (<heap_size_musician> + <0x595ea109>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_musician3' size = (<heap_size_musician> + <0x595ea109>) vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_musician4' size = <heap_size_musician> vram_size = <heap_size_musician_vram> arena = 1
	MemInitHeap Name = 'heap_musician_anim' size = <heap_size_musician_anim>
	PopMemProfile
	PushMemProfile \{'Light Show Heap'}
	MemInitHeap Name = 'heap_lightshow' size = <heap_size_lightshow> arena = 1
	PopMemProfile
	PushMemProfile \{'Downloads'}
	MemInitHeap Name = 'heap_downloads' size = <heap_size_downloads> vram_size = <heap_size_downloads_vram>
	PopMemProfile
	PushMemProfile \{'CAS Heap'}
	MemInitHeap Name = 'heap_cas' size = <heap_size_cas> vram_size = <heap_size_cas_vram> topdownname = 'heap_cas_topdown'
	PopMemProfile
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
		nodeflags = $LightShow_StateNodeFlags}
	LightShow_SetProcessors \{shared = $LightShow_SharedProcessors}
	0x8bfa392d
	PopMemProfile
	transition_randomizevointros
	PushMemProfile \{'create_node_flags'}
	create_node_flags
	PopMemProfile
	PushMemProfile \{'Game Heaps'}
	MemInitHeap Name = 'heap_zones' size = <heap_size_zones>
	MemPushContext \{heap_zones}
	CreatePakManMap \{map = zones
		links = ghzones
		folder = 'zones/'
		uselinkslots}
	MemPopContext
	MemInitHeap Name = 'heap_song' size = <heap_size_song>
	PopMemProfile
	if NOT ($cas_heap_state = in_game)
		ScriptAssert \{'Invalid initial cas_heap_state'}
	endif
	if ScriptExists \{init_globaltags}
		get_num_globaltag_sets
		init_packed_structs globaltag_sets = <num_globaltag_sets>
		init_globaltags globaltag_sets = <num_globaltag_sets>
	endif
	set_plat_jam_maximums
	engineconfig \{particlelod = 0}
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
	if CD
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
	if NOT CD
		Change \{skip_boot_menu = 1}
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
	allocatedecompressedfontbuffers
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
		Heap = heap_global_pak}
	print_loading_time starttime = <starttime> text = qs(0xf9d25732)
	ParseNodeArray \{queue
		zone_name = Global
		array_name = global_NodeArray}
	GetStartTime
	LoadPak \{'pak/anims/perm_anims/perm_anims.pak'
		Heap = heap_musician_anim
		no_vram}
	print_loading_time starttime = <starttime> text = qs(0x3136c57e)
	decompressfonts \{buttons}
	decompressfonts \{fontgrid_bordello}
	decompressfonts \{fontgrid_text_a3}
	decompressfonts \{fontgrid_denim_bold}
	decompressfonts \{fontgrid_denim_title}
	decompressfonts \{fontgrid_numeral_a9}
	decompressfonts \{fontgrid_numeral_a7}
	decompressfonts \{fontgrid_text_a10}
	buttons_font = 'Buttons'
	SetFontProperties <buttons_font> buttons_font
	SetFontProperties \{'fontgrid_numeral_a7'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_numeral_a9'
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
	SetFontProperties \{'fontgrid_bordello'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_denim_bold'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_denim_title'
		color_tab = $Default_Font_Colors}
	PushMemProfile \{'FMod Streams + SFX'}
	if IsFmodEnabled
		GetStartTime
		begin
		LoadFSB \{FileName = 'streams/streamall'
			numstreams = 4
			noWait
			disk_stream = true}
		if NOT (<fsb_index> = -1)
			Change streamall_fsb_index = <fsb_index>
			print_loading_time starttime = <starttime> text = qs(0x82a57b3c)
			break
		else
			Change \{streamall_fsb_index = -1}
		endif
		Wait \{1
			Seconds}
		repeat
		GetStartTime
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
	0xc1c4e84c \{mode = 0x64912155}
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
	getmaxplayers
	Player = 1
	begin
	<player_status> = ($0x2994109a [<Player>])
	<player_text> = ($0x57e22f28 [<Player>])
	SpawnScriptLater create_guitar_events params = {<...>}
	Player = (<Player> + 1)
	repeat <max_players>
	randomize
	SetShadowProjectionTexture \{texture = white}
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
			HideLoadingScreen
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
			HideLoadingScreen
			ui_event \{event = menu_change
				data = {
					state = uistate_boot_legal
				}}
			AddParams \{donthide}
		endif
	else
		SpawnScriptLater \{autolaunch_spawned}
	endif
	guitar_create_character_maps
	create_font_arrays
	load_frontend_anim_paks
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
	MemPushContext \{0xc39f2ba1}
	clearjamsession
	MemPopContext
	print_loading_time starttime = <overallstarttime> text = qs(0xe79eced7)
endscript

script verify_cas_budgets 
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

script set_cas_heap_state 
	Change cas_heap_state = <state>
endscript

script should_put_zones_on_debug_heap 
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
force_encore_autolaunch = 0

script autolaunch_spawned 
	($default_loading_screen.create)
	mc_setactiveplayer \{querydefault}
	if ($autolaunch_showstorageselector = 1)
		NewShowStorageSelector
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
	pausegh3
	ui_event event = menu_change data = {state = uistate_play_song device_num = ($player1_status.controller) uselaststarttime = 1 force_encore = $force_encore_autolaunch}
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

script get_levelcareerarray_checksum 
	GetArraySize \{$levelcareerarray}
	if (<index> < <array_Size>)
		return level_checksum = ($levelcareerarray [<index>])
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
endscript

script InFrontend 
	return \{FALSE}
endscript
rendering_has_been_stopped_explicit = FALSE
rendering_has_been_stopped_hide_glitch = FALSE
rendering_has_been_stopped_menu_transition = FALSE
rendering_has_been_stopped_invalid_viewports = FALSE
rendering_has_been_stopped_loading_screen = FALSE

script StartRendering \{reason = explicit}
	StartRendering_C
	Change \{pause_no_render = 0}
endscript

script StopRendering \{reason = explicit}
	StopRendering_C
	Change \{pause_no_render = 1}
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
	<player_status> = ($0x2994109a [<Player>])
	return player_status = <player_status>
endscript

script get_replay_heap 
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

script hide_glitch \{num_frames = 1}
	SpawnScriptNow hide_glitch_spawned params = {<...>}
endscript
hide_glitch_count = 0

script hide_glitch_spawned 
	OnExitRun hide_glitch_spawned_exit params = {<...>}
	setscriptcannotpause
	Change hide_glitch_count = ($hide_glitch_count + 1)
	StopRendering \{reason = hide_glitch}
	Wait <num_frames> gameframes
endscript

script hide_glitch_spawned_exit 
	Change hide_glitch_count = ($hide_glitch_count - 1)
	if ($hide_glitch_count = 0)
		StartRendering \{reason = hide_glitch}
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
	if NOT animatedtextureloop_cfunc_setup
		return
	endif
	begin
	if animatedtextureloop_cfunc
		break
	endif
	repeat
	animatedtextureloop_cfunc_cleanup
endscript

script setanimatingtexturestate \{state = -1}
	ExtendCrc <object> '_AnimTexture_State' out = 0xbae89da3
	if (<state> = -1)
		if GetNodeFlag (<0xbae89da3>)
			ChangeNodeFlag (<0xbae89da3>) 0
		else
			ChangeNodeFlag (<0xbae89da3>) 1
		endif
	else
		ChangeNodeFlag (<0xbae89da3>) (<state>)
	endif
endscript
g_movie_setup_count = 0

script pre_movie_cleanup 
	Change g_movie_setup_count = ($g_movie_setup_count + 1)
	printf \{qs(0x5dd632c3)
		d = $g_movie_setup_count}
	if ($g_movie_setup_count > 1)
		return
	endif
	if NOT (isps2)
		return
	endif
	printf \{qs(0xb5cd3cd1)}
	unload_songqpak
	0x41688f4f \{heap_song}
	heap_size_song = <size>
	memdeleteheap \{Name = 'heap_song'}
	printf \{qs(0xe542f460)}
	GetPakManCurrent \{map = zones}
	0x296bb6d1 = <pak>
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	DestroyPakManMap \{map = zones}
	printf \{qs(0x57b5af1c)}
	UnLoadPak \{'pak/oogame/oogame.pak'}
	return 0xd4935026 = {
		0x296bb6d1 = <0x296bb6d1>
		heap_size_song = <heap_size_song>
		heap_size_zones = <heap_size_zones>
		ui_flow_manager_state = ($ui_flow_manager_state [0])
	}
endscript

script post_movie_reset 
	get_heap_sizes
	Change g_movie_setup_count = ($g_movie_setup_count - 1)
	printf \{qs(0xf9c1a5e7)
		d = $g_movie_setup_count}
	if ($g_movie_setup_count > 0)
		return
	endif
	if NOT ((isps2) || (isngc))
		return
	endif
	printstruct <...>
	PushMemProfile \{'Characters'}
	MemPushContext \{heap_cas}
	if ($ps2_venues = 1)
		CreatePakManMap map = zones links = ghzones folder = 'zones_ps2/' uselinkslots size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024)
	else
		CreatePakManMap map = zones links = ghzones folder = 'zones/' uselinkslots size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024)
	endif
	MemPopContext
	ResetWaypoints
	SetPakManCurrentBlock map = zones pak = (<0xd4935026>.0x296bb6d1) block_scripts = 1
	printf \{qs(0x57553f72)}
	MemInitHeap Name = 'heap_song' size = (<0xd4935026>.heap_size_song) vram_size = <heap_size_song_vram>
	PopMemProfile
endscript

script reload_venue \{force_encore = 0}
	SpawnScriptNow convoluted_because_of_wait_blocking_reload_venue params = {force_encore = <force_encore>}
endscript

script convoluted_because_of_wait_blocking_reload_venue 
	shut_down_flow_manager
	PauseGame
	kill_gem_scroller
	start_song force_venue_reload = 1 force_encore = <force_encore>
endscript

script 0xbbafb1b3 
	begin
	if CompositeObjectExists Name = <0xf7107003>
		<0xf7107003> :Obj_GetBonePosition bone = BONE_PELVIS
		new_x = <X>
		0xcf6a6193 = <z>
		<object> :Obj_GetPosition
		0x086b4b3a = (<Pos>.(0.0, 1.0, 0.0))
		new_pos = ((<new_x> * (1.0, 0.0, 0.0)) + (<0x086b4b3a> * (0.0, 1.0, 0.0)) + (<0xcf6a6193> * (0.0, 0.0, 1.0)))
		<object> :Obj_SetPosition position = <new_pos>
	endif
	Wait \{3
		gameframes}
	repeat
endscript

script userselectright 
	stars
	0x8dbdaee4 \{qs(0xa378e9d2)}
	0xe6b61ea6 ($edit_graphic_layer_infos)
	temp_struct = {($edit_graphic_layer_infos)}
	0xa3e92003 file = 'CAL_design.txt' label = 'CAL_Design' structure = <temp_struct>
endscript
