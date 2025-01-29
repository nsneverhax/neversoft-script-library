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
rock_meter_debug = 0
save_heap_created_at_boot = 0
ps2_venues = 0
old_song = None
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
tutorial_disable_hud = 0
is_network_game = 0
net_ready_to_start = 0
rich_presence_context = presence_menus
game_mode = p1_quickplay
allow_controller_for_all_instruments = 0
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
time_gem_offset_with_lag = 0.0
time_drum_midi_offset_with_lag = 0.0
crowd_band_multiplier = 1.0
cheat_airinstruments = -1
cheat_invisiblecharacters = -1
Cheat_PerformanceMode = -1
cheat_invincible = -1
cheat_focusmode = -1
cheat_hudfreemode = -1
challenge_fretbar_width = 1.5
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
primary_controller = 0
primary_controller_assigned = 0
invite_controller = -1
streamall_fsb_index = -1
sixchannelfiles_fsb_index = -1
enable_button_cheats = 1
enable_debug_menus = 1
whammy_mania_achievement_invalidated = 0
vocalist_height = 1.6
winning_player_camera_percentage = 100
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
random_songs_on_disc_only = 0
boot_movie_done = 0
cameracuts_enablevideovenuecams = 0
use_worst_band = 0
part_priority = [
	vocals
	drum
	guitar
	bass
]

script get_heap_sizes_for_xenon 
	printf \{qs(0xc905d701)}
	<heap_size_globalpak> = (14288 * 1024)
	<heap_size_globalpak_vram> = 0
	<heap_size_ui_shared> = (12168 * 1024)
	<heap_size_ui_shared_vram> = 0
	<heap_size_in_game> = (12090 * 1024)
	<heap_size_in_game_vram> = 0
	<heap_size_crowd> = (80 * 1024)
	<heap_size_crowd_vram> = 0
	<heap_size_jam> = 0
	<heap_size_jam_vram> = 0
	<heap_size_audio> = ((13 * 1024 * 1024) + (256 * 1024))
	<heap_size_audio_vram> = 0
	<heap_size_global_sfx> = ((7 * 1024 * 1024) + (310 * 1024))
	<heap_size_global_sfx_vram> = 0
	<heap_size_musicstudio_guitar> = ((21 * 1024 * 1024) + (658 * 1024))
	<heap_size_musicstudio_guitar_vram> = 0
	<heap_size_musicstudio_bass> = ((4 * 1024 * 1024) + (618 * 1024))
	<heap_size_musicstudio_bass_vram> = 0
	<heap_size_musicstudio_keyboard> = ((2 * 1024 * 1024) + (512 * 1024))
	<heap_size_musicstudio_keyboard_vram> = 0
	<heap_size_drumkitaudio> = ((1 * 1024 * 1024) + (512 * 1024))
	<heap_size_drumkitaudio_vram> = 0
	<heap_size_drumkitaudio_percussion> = ((1 * 1024 * 1024) + (512 * 1024))
	<heap_size_drumkitaudio_percussion_vram> = 0
	<heap_size_ms_notes> = <ms_note_size>
	<heap_size_ms_notes_vram> = (0)
	<heap_size_lightshow> = ((1 * 1024 * 1024) + (100 * 1024))
	<heap_size_musician> = (12800 * 1024)
	<heap_size_musician_vram> = (0 * 1024)
	<heap_size_ragskel> = (400 * 1024)
	<heap_size_musician_anim> = (19156 * 1024)
	<heap_size_downloads> = (1 * 1024 * 1024)
	<heap_size_downloads_vram> = (0 * 1024)
	<heap_size_song> = ((9 * 1024 * 1024) + (10 * 1024))
	<heap_size_cas_build> = ((4 * 1024 * 1024) + (256 * 1024))
	<heap_size_cas_build_vram> = (0 * 1024 * 1024)
	<heap_size_cas_global> = ((17 * 1024 * 1024) + (128 * 1024))
	<heap_size_cas_global_vram> = (0 * 1024 * 1024)
	<heap_size_cas_cache> = (<heap_size_musicstudio_guitar> + <main_heap_overhead> +
		<heap_size_musicstudio_bass> + <main_heap_overhead> +
		<heap_size_musicstudio_keyboard> + <main_heap_overhead> +
		<heap_size_drumkitaudio> + <main_heap_overhead> +
		<heap_size_drumkitaudio_percussion> + <main_heap_overhead> +
		<heap_size_song> + <main_heap_overhead>)
	<heap_size_cas_cache_vram> = (0 * 1024)
	if ($cas_pieces_is_a_reference_archive = 1)
		<cas_building_cache_size> = (30 * 1024 * 1024)
		<cas_ui_precache_size> = (0 * 1024 * 1024)
	else
		<cas_building_cache_size> = (6 * 1024 * 1024)
		<cas_ui_precache_size> = ((34 * 1024 * 1024) + (512 * 1024))
	endif
	<heap_size_zones> = ((31 * 1024 * 1024) + (750 * 1024))
	<heap_size_zones_vram> = (0 * 1024 * 1024)
	<heap_size_drumkits> = (1 * 1024)
	<heap_size_ui_pak_slot> = ((10 * 1024 * 1024) + (740 * 1024))
	<heap_size_ghtunes_cache> = (1 * 1024 * 1024)
	<heap_size_ghtunes_cache_vram> = (0 * 1024)
	<heap_size_save_file> = ((2 * 1024 * 1024) + <heap_inner_overhead>)
	<heap_size_save_file_vram> = 0
	<heap_size_atoms> = (<atoms_size> * <num_savegames>)
	<heap_size_animnode> = (512 * 1024)
	<heap_size_bink> = ((<heap_size_save_file> + <main_heap_overhead>) +
		(<heap_size_ghtunes_cache> + <main_heap_overhead>) +
		(16 * 1024) +
		(4 * 1024 * 1024) + (256 * 1024)
	)
	<heap_size_bink_vram> = 0
	<heap_size_downloadpaks> = (400 * 1024)
	<heap_size_stash> = (630 * 1024)
	<heap_size_stash_vram> = (0 * 1024 * 1024)
	return <...>
endscript

script get_heap_sizes 
	heap_inner_overhead = (1 * 1024)
	if isps3
		main_heap_overhead = (384)
		vram_heap_overhead = ((40 * 1024) + <main_heap_overhead>)
	else
		main_heap_overhead = (384)
		vram_heap_overhead = (0)
	endif
	atoms_size = (85 * 1024)
	ms_note_size = (2 * 1024 * 1024)
	get_num_savegames
	GetPlatform
	switch <Platform>
		case Xenon
		get_heap_sizes_for_xenon <...>
		case windx
		get_heap_sizes_for_xenon <...>
		<heap_size_drumkitaudio> = ((3 * 1024 * 1024))
		<heap_size_drumkitaudio_percussion> = ((3 * 1024 * 1024))
		<heap_size_cas_cache> = (2 * <heap_size_cas_cache>)
		case PS3
		<heap_size_globalpak> = (4550 * 1024)
		<heap_size_globalpak_vram> = (6004 * 1024)
		<heap_size_ui_shared> = (1650 * 1024)
		<heap_size_ui_shared_vram> = (9700 * 1024)
		<heap_size_in_game> = (300 * 1024)
		<heap_size_in_game_vram> = (9057 * 1024)
		<heap_size_crowd> = (2 * 1024)
		<heap_size_crowd_vram> = ((18 * 1024 * 1024) + (128 * 1024))
		<heap_size_jam> = ((0 * 1024))
		<heap_size_jam_vram> = ((8 * 1024 * 1024))
		<heap_size_audio> = ((12 * 1024 * 1024) + (256 * 1024))
		<heap_size_audio_vram> = 0
		<heap_size_global_sfx> = (20 * 1024)
		<heap_size_global_sfx_vram> = ((4 * 1024 * 1024) + (0 * 1024))
		<heap_size_musicstudio_guitar> = (56 * 1024)
		<heap_size_musicstudio_guitar_vram> = ((17 * 1024 * 1024) + (0 * 1024))
		<heap_size_musicstudio_bass> = (16 * 1024)
		<heap_size_musicstudio_bass_vram> = ((5 * 1024 * 1024) + (0 * 1024))
		<heap_size_musicstudio_keyboard> = (32 * 1024)
		<heap_size_musicstudio_keyboard_vram> = ((2 * 1024 * 1024) + (320 * 1024))
		<heap_size_drumkitaudio> = (32 * 1024)
		<heap_size_drumkitaudio_vram> = ((2 * 1024 * 1024) + (256 * 1024))
		<heap_size_drumkitaudio_percussion> = (32 * 1024)
		<heap_size_drumkitaudio_percussion_vram> = ((1 * 1024 * 1024) + (512 * 1024))
		<heap_size_ms_notes> = <ms_note_size>
		<heap_size_ms_notes_vram> = 0
		<heap_size_lightshow> = ((1 * 1024 * 1024) + (100 * 1024))
		<heap_size_musician> = (1450 * 1024)
		<heap_size_musician_vram> = (10300 * 1024)
		<heap_size_ragskel> = (400 * 1024)
		<heap_size_musician_anim> = (19156 * 1024)
		<heap_size_downloads> = (1 * 1024 * 1024)
		<heap_size_downloads_vram> = (1 * 1024 * 1024)
		<heap_size_song> = ((9 * 1024 * 1024) + (10 * 1024))
		<heap_size_cas_build> = ((1 * 1024 * 1024) + (512 * 1024))
		<heap_size_cas_build_vram> = (4 * 1024 * 1024)
		<heap_size_cas_global> = (80 * 1024)
		<heap_size_cas_global_vram> = ((16 * 1024 * 1024) + (0 * 1024))
		<heap_size_cas_cache> = ((10 * 1024 * 1024) - (50 * 1024) - <heap_size_ragskel>)
		<intro_movie_vram_extra_space> = (3288 * 1024)
		<heap_size_cas_cache_vram> = (<heap_size_musicstudio_guitar_vram> +
			<heap_size_musicstudio_bass_vram> +
			<heap_size_musicstudio_keyboard_vram> +
			<heap_size_drumkitaudio_vram> +
			<heap_size_drumkitaudio_percussion_vram> +
			<intro_movie_vram_extra_space>)
		if ($cas_pieces_is_a_reference_archive = 1)
			<cas_building_cache_size> = (9 * 1024 * 1024)
			<cas_building_cache_size_vram> = (20 * 1024 * 1024)
			<cas_ui_precache_size> = (0 * 1024 * 1024)
			<cas_ui_precache_size_vram> = (0 * 1024 * 1024)
		else
			<cas_building_cache_size> = (1 * 1024 * 1024)
			<cas_building_cache_size_vram> = (6 * 1024 * 1024)
			<cas_ui_precache_size> = ((8 * 1024 * 1024) + (512 * 1024))
			<cas_ui_precache_size_vram> = ((22 * 1024 * 1024) + <intro_movie_vram_extra_space>)
		endif
		<heap_size_zones> = (2450 * 1024)
		<heap_size_zones_vram> = ((26 * 1024 * 1024) + (0 * 1024))
		<heap_size_ui_pak_slot> = (550 * 1024)
		<heap_size_ui_pak_slot_vram> = ((10740 * 1024))
		<heap_size_ghtunes_cache> = (1 * 1024)
		<heap_size_ghtunes_cache_vram> = (1 * 1024 * 1024)
		<heap_size_save_file> = ((2 * 1024 * 1024) + <heap_inner_overhead>)
		<heap_size_save_file_vram> = 0
		<heap_size_atoms> = (<atoms_size> * <num_savegames>)
		<heap_size_animnode> = (512 * 1024)
		<heap_size_bink> = (
			(<heap_size_save_file> + <main_heap_overhead>) +
			(<heap_size_ghtunes_cache> + <main_heap_overhead> + <vram_heap_overhead>) +
			(16 * 1024) +
			(1300 * 1024)
		)
		<heap_size_bink_vram> = (
			(<heap_size_ghtunes_cache_vram>) +
			((3 * 1024 * 1024) + (430 * 1024) + (2200 * 1024))
		)
		<heap_size_downloadpaks> = (400 * 1024)
		<heap_size_downloadpaks_vram> = (3 * 60 * 1024)
		<heap_size_stash> = ((2 * 1024 * 1024) + (248 * 1024))
		<heap_size_stash_vram> = ((1 * 1024 * 1024) + (1016 * 1024))
		default
		ScriptAssert \{qs(0xfb3c58ff)}
	endswitch
	return <...>
endscript

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
	if ScriptExists \{pre_startup}
		pre_startup
	endif
	GetTrueStartTime
	guitar_startup_initialize
	guitar_startup_memory
	guitar_startup_systems
	print_loading_time starttime = <starttime> text = qs(0xc0c883fd)
	SpawnScriptNow \{guitar_startup_spawned}
endscript

script debug_timing_test 
	ToggleMetrics \{mode = 2}
	Wait \{100
		gameframes}
	MoveProfileCursor cpu = ($current_cpu) freeze
endscript

script guitar_startup_spawned 
	create_song_heap
	guitar_startup_critical_loads
	SpawnScriptNow \{guitar_startup_async_init}
	output_status_begin \{prefix = 'movie'}
	output_status \{prefix = 'movie'
		text = 'Loading intro movie to memory.'}
	create_loading_screen \{is_bink
		bink = 'Intro_FINALanimatic_0209'
		Heap = heap_cas_cache
		heap_vram = heap_cas_cache_vram
		pause_script = guitar_startup_async_init}
	output_status \{prefix = 'movie'
		text = 'cleanup'}
	StartRendering
	HideLoadingScreen
	fadetoblack \{OFF
		no_wait}
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
		text = 'Loading debug font'}
	debugfontheap = BottomUpHeap
	if NOT isps3
		if GotExtraMemory
			debugfontheap = debugheap
		endif
	endif
	LoadPakAsync pak_name = 'fonts/debug.pak' Heap = <debugfontheap>
	SetFontProperties \{'debug'
		color_tab = $Default_Font_Colors
		debug_font}
	SetFontNonProportionalNumbers \{'debug'}
	output_status \{prefix = 'mload'
		text = 'Font setup'}
	if isxenonorwindx
		buttons_font = 'buttons_x360'
	elseif isps3
		buttons_font = 'ButtonsPs3'
	else
		ScriptAssert \{'Failed selecting buttons font: Unknown platform.'}
	endif
	SetFontProperties <buttons_font> buttons_font
	SetFontProperties \{'fontgrid_text_a1'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_text_a3'
		color_tab = $Default_Font_Colors}
	SetFontProperties \{'fontgrid_title_a1'
		color_tab = $Default_Font_Colors}
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
	create_zone_maps
	PopMemProfile
	output_status \{prefix = 'mload'
		text = 'Pak for replaceable ad textures'}
	LoadPakAsync \{pak_name = 'pak/global_ad_tex/global_ad_tex.pak'
		Heap = heap_massive_ads}
	output_status \{prefix = 'mload'
		text = 'Load up global ragdoll/skeleton pak. As a rawpak, we\'re instancing out assets from it'}
	LoadPakAsync \{pak_name = 'pak/global_rag_skel/global_rag_skel.pak'
		Heap = heap_global_pak
		is_raw = 1}
	output_status \{prefix = 'mload'
		text = 'Loading global.pak'}
	LoadPakAsync \{pak_name = 'zones/global/global.pak'
		Heap = heap_global_pak}
	output_status \{prefix = 'mload'
		text = 'Loading global.pak nodearray'}
	ParseNodeArray \{queue
		zone_name = Global
		array_name = global_NodeArray}
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
		LoadFSB \{FileName = 'streams/streamall'
			numstreams = 3}
		Change streamall_fsb_index = <fsb_index>
		LoadFSB \{FileName = 'streams/sixchannelfiles'
			numstreams = 1}
		Change sixchannelfiles_fsb_index = <fsb_index>
		EnableRemoveSoundEntry \{enable}
		LoadPakAsync \{pak_name = 'zones/global/global_sfx.pak'
			Heap = heap_global_sfx}
	endif
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
	create_venue_effects_settings
	Change \{not_start_of_game = 0}
	output_status \{prefix = 'mload'
		text = 'AddEditableList ped_editable_list'}
	AddEditableList \{ped_editable_list}
	output_status \{prefix = 'mload'
		text = 'StartKeyboardHandler'}
	StartKeyboardHandler \{max_length = 128}
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
	ensure_band_logo_object_created
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
	if ($autolaunch_startnow != 0)
		vocals_distribute_mics
	endif
	output_status \{prefix = 'mgame'
		text = 'Jam Session'}
	songfilemanager \{func = add_song_file
		song_name = jamsession}
	output_status \{prefix = 'mgame'
		text = 'ArchiveInvalidateSizes'}
	if NOT CD
		archiveinvalidatesizes
	endif
	interlock \{Wait
		prefix = 'mgame'
		lock_name = lock_savegame}
	output_status \{prefix = 'mgame'
		text = 'Load venue'}
	interlock \{Wait
		prefix = 'mgame'
		lock_name = lock_globaltags}
	quickplay_choose_random_venue
	Load_Venue
	output_status \{prefix = 'mgame'
		text = 'Load persistent band.'}
	persistent_band_create_band \{startup = 1
		async = 1}
	waitunloadgroup \{cas
		async = 1}
	output_status \{prefix = 'mgame'
		text = 'Load song'}
	gman_songfunc \{func = clear_play_list}
	freeplay_next_song \{initial_song_list = true}
	gman_songfunc \{func = get_current_song}
	load_songqpak song_name = <current_song> async = 1 resetzone = 1
	loaddrumkitall async = 1 percussion = 0 song = <current_song>
	anim_paks_set_state \{state = ingame}
	persistent_band_prepare_for_song \{async = 1}
	output_status \{prefix = 'mgame'
		text = 'Preload band_lobbyUI Pak'}
	SetPakManCurrent \{map = ui_paks
		pakname = 'band_lobby'}
	output_status \{prefix = 'mgame'
		text = 'Make sure all async scripts are done.'}
	interlock \{Wait
		prefix = 'mgame'}
	interlock \{Wait
		prefix = 'mgame'
		lock_name = lock_freeplay}
	destroy_save_heap_at_boot
	output_status_end \{prefix = 'mgame'}
	output_status_begin \{prefix = 'movie'}
	output_status \{prefix = 'movie'
		text = 'Waiting for movie to finish.'}
	destroy_loading_screen \{wait_for_unload
		wait_for_end}
	output_status_end \{prefix = 'movie'}
	Change \{boot_movie_done = 1}
	create_song_and_musicstudio_heaps
	autolaunch_run
	printf \{qs(0x160a1d8c)}
	guitar_initialize_profilers
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
			Change \{g_boot_sysnotify_wait = FALSE}
			ui_event \{event = menu_change
				data = {
					state = $autolaunch_state
				}}
		else
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_freeplay
					boot
				}}
			AddParams \{donthide}
			fadetoblack \{OFF
				no_wait}
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
		ui_event_wait_for_safe
		ui_event event = menu_change data = {state = Uistate_gameplay device_num = <controller> uselaststarttime = 1}
	endif
	if ($debug_unlockall_on_boot)
		if (($primary_controller_assigned = 0) || ($primary_controller = -1))
			Change \{primary_controller_assigned = 1}
			Change \{primary_controller = 0}
			unset_primary_controller = 1
		endif
		debug_unlockall
		if GotParam \{unset_primary_controller}
			Change \{primary_controller_assigned = 0}
		endif
	endif
	SpawnScriptNow \{song_preview_monitor}
	create_ui_visualizer
	if ($autolaunch_startnow = 1)
		StopRendering
		SpawnScriptNow \{start_game}
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

script start_game 
	if ($use_old_system_setup = 1)
		Load_Venue
	endif
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
	Transition_SelectTransition
	SpawnScriptLater start_gem_scroller params = {difficulty = <difficulty1> difficulty2 = <difficulty2> difficulty3 = <difficulty3> difficulty4 = <difficulty4>}
	unpausegh3
endscript

script check_cas 
	if CD
		return
	endif
	if GotParam \{textures}
		verifycaptextures
	endif
	if GotParam \{preset_profiles}
		verifycapprofile Profile = ($default_custom_musician_profile_female)
		verifycapprofile Profile = ($default_custom_musician_profile_male)
		verifycapprofile Profile = ($avatar_profile)
		verifycapprofile profiles = ($preset_musician_profiles_ghrockers)
		verifycapprofile profiles = ($preset_musician_profiles_modifiable)
		verifycapprofile profiles = ($preset_musician_profiles_locked) allowlocked
		verifycapprofile profiles = ($preset_musician_profiles_debug) allowlocked
		verifycapprofile appearances = ($cas_preset_guitars) must_have = cas_guitar_bridges
		verifycapprofile appearances = ($cas_preset_basses) must_have = cas_bass_bridges
		verifycapprofile appearances = ($cas_preset_drums) must_have = cas_drums
		verifycapprofile appearances = ($cas_preset_female_vocals) must_have = cas_mic
		verifycapprofile appearances = ($cas_preset_male_vocals) must_have = cas_mic
		verifycapprofile pieces = ($cas_preset_tattoo_female) part = cas_body desc_id = gh4_car_female
		verifycapprofile pieces = ($cas_preset_tattoo_male) part = cas_body desc_id = gh4_car_male
		verifycapprofile appearances = ($cas_preset_body_female) must_have = cas_body
		verifycapprofile appearances = ($cas_preset_body_male) must_have = cas_body
		verifycapprofile appearances = ($cas_preset_outfit_female) must_have = cas_female_torso
		verifycapprofile appearances = ($cas_preset_outfit_male) must_have = cas_male_torso
		verifycapprofile pieces = ($cas_preset_bandlogo) part = cas_band_logo desc_id = cas_band_logo_id
		verifycapprofile \{default_cap}
		verifycapprofile \{inclusion_lists}
	endif
	if GotParam \{savegames}
		get_num_savegames
		savegame = 0
		begin
		reset_savegame = 0
		characterprofilegetlist savegame = <savegame>
		GetArraySize <profile_list>
		if (<array_Size> > 0)
			i = 0
			begin
			if profile_can_be_modified id = (<profile_list> [<i>])
				characterprofilegetstruct savegame = <savegame> Name = (<profile_list> [<i>])
				if NOT verifycapprofile Profile = <profile_struct> no_assert allowlocked
					reset_savegame = 1
					printf \{'bad profile:'}
					printstruct <profile_struct>
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
		if (<reset_savegame> = 1)
			SoftAssert \{'Your savegame has out of date create-a-rocker data, resetting it'}
			reset_all_preset_characters savegame = <savegame>
			delete_all_car_characters savegame = <savegame>
		endif
		<savegame> = (<savegame> + 1)
		repeat <num_savegames>
	endif
endscript

script generate_worst_cas_appearances 
	get_worst_case_band_member_appearance \{required_parts = [
			cas_male_hat_hair
			cas_guitar_body
		]
		forced_choices = {
			cas_body = gh4_car_male
		}}
	male_appearance = <appearance>
	get_worst_case_band_member_appearance \{required_parts = [
			cas_male_hat_hair
			cas_bass_body
		]
		forced_choices = {
			cas_body = gh4_car_male
		}}
	male_appearance = {<male_appearance> <appearance>}
	get_worst_case_band_member_appearance \{required_parts = [
			cas_male_hat_hair
			cas_drums
		]
		forced_choices = {
			cas_body = gh4_car_male
		}}
	male_appearance = {<male_appearance> <appearance>}
	get_worst_case_band_member_appearance \{required_parts = [
			cas_male_hat_hair
			cas_mic
		]
		forced_choices = {
			cas_body = gh4_car_male
		}}
	male_appearance = {<male_appearance> <appearance>}
	get_worst_case_band_member_appearance \{required_parts = [
			cas_female_hat_hair
			cas_guitar_body
		]
		forced_choices = {
			cas_body = gh4_car_female
		}}
	female_appearance = <appearance>
	get_worst_case_band_member_appearance \{required_parts = [
			cas_female_hat_hair
			cas_bass_body
		]
		forced_choices = {
			cas_body = gh4_car_female
		}}
	female_appearance = {<female_appearance> <appearance>}
	get_worst_case_band_member_appearance \{required_parts = [
			cas_female_hat_hair
			cas_drums
		]
		forced_choices = {
			cas_body = gh4_car_female
		}}
	female_appearance = {<female_appearance> <appearance>}
	get_worst_case_band_member_appearance \{required_parts = [
			cas_female_hat_hair
			cas_mic
		]
		forced_choices = {
			cas_body = gh4_car_female
		}}
	female_appearance = {<female_appearance> <appearance>}
	casoutputworstcasefile {
		path = 'car_worst_appearances.q'
		structs = {
			worst_female_appearance = <female_appearance>
			worst_male_appearance = <male_appearance>
		}
	}
endscript

script get_worst_case_band_member_appearance 
	casgetworstskincombination budgets = $cas_budget_groups required_parts = <required_parts>
	appearance = {}
	GetArraySize \{worst_skins}
	i = 0
	begin
	part = (<worst_skins> [<i>])
	RemoveParameter \{forced_choice}
	if GotParam \{forced_choices}
		if StructureContains structure = <forced_choices> <part>
			forced_choice = (<forced_choices>.<part>)
		endif
	endif
	casgettopskins part = <part> Force = <forced_choice>
	appearance = {<appearance> <topskins>}
	i = (<i> + 1)
	repeat <array_Size>
	Change cas_current_appearance = <appearance>
	if StructureContains structure = <appearance> cas_guitar_body
		fix_cag_include_part part = cas_guitar_body desc_id = (<appearance>.cas_guitar_body.desc_id) node_parts_only
	endif
	if StructureContains structure = <appearance> cas_bass_body
		fix_cag_include_part part = cas_bass_body desc_id = (<appearance>.cas_bass_body.desc_id) node_parts_only
	endif
	if StructureContains structure = <appearance> cas_drums
		fix_cag_include_part part = cas_drums desc_id = (<appearance>.cas_drums.desc_id) node_parts_only
	endif
	return appearance = ($cas_current_appearance)
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
	slop_heap = heap_zones
	main_mem_heap = heap_zones
	vram_heap = heap_zones
	if should_put_zones_on_debug_heap
		main_mem_heap = debugrsxheap
		slop_heap = debugheap
	endif
	printf \{qs(0xd8517ff0)}
	MemPushContext <slop_heap>
	if ($ps2_venues = 1)
		CreatePakManMap map = zones links = ghzones folder = 'zones_ps2/' allocheap = <main_mem_heap> vramheap = <vram_heap>
	else
		CreatePakManMap map = zones links = ghzones folder = 'zones/' allocheap = <main_mem_heap> vramheap = <vram_heap>
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
	pausegh3
endscript

script postqbromid 
	getplayerinfo \{1
		difficulty
		out = difficulty}
	getplayerinfo \{2
		difficulty
		out = difficulty2}
	getplayerinfo \{3
		difficulty
		out = difficulty3}
	getplayerinfo \{4
		difficulty
		out = difficulty4}
	getplayerinfo \{1
		controller
		out = device_num}
	restart_gem_scroller {
		difficulty = <difficulty>
		difficulty2 = <difficulty2>
		difficulty3 = <difficulty3>
		difficulty4 = <difficulty4>
		starttime = ($current_starttime)
		device_num = <device_num>
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
	finalprintf qs(0xc08ceb6c) r = <reason>
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
		default
		ScriptAssert \{qs(0x49bf01ce)}
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
	StartRendering_C
endscript

script StopRendering \{reason = explicit}
	finalprintf qs(0x912111b8) r = <reason>
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
		default
		ScriptAssert \{qs(0xe1901769)}
	endswitch
	StopRendering_C
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
	if retailbuild
		return
	endif
	if isXenon
		profile_file_list = [
			'reloads\\guitar_band_preset_profiles.qb.xen'
			'reloads\\guitar_band_ghrocker_profiles.qb.xen'
			'reloads\\guitar_band_profile.qb.xen'
			'reloads\\0xd28141b5.qb.xen'
			'reloads\\0x6b342a9c.qb.xen'
			'reloads\\0xe5423ebd.qb.xen'
		]
	elseif iswindx
		profile_file_list = [
			'reloads\\guitar_band_preset_profiles.qb.xen'
			'reloads\\guitar_band_ghrocker_profiles.qb.xen'
			'reloads\\guitar_band_profile.qb.xen'
			'reloads\\0xd28141b5.qb.wdx'
			'reloads\\0x6b342a9c.qb.wdx'
			'reloads\\0xe5423ebd.qb.wdx'
		]
	else
		profile_file_list = [
			'reloads\\guitar_band_preset_profiles.qb.ps3'
			'reloads\\guitar_band_ghrocker_profiles.qb.ps3'
			'reloads\\guitar_band_profile.qb.ps3'
			'reloads\\0xd28141b5.qb.ps3'
			'reloads\\0x6b342a9c.qb.ps3'
			'reloads\\0xe5423ebd.qb.ps3'
		]
	endif
	if ArrayContains array = <profile_file_list> contains = <file>
		stars
		printf \{qs(0xb2f78668)}
		stars
		debug_reset_character_profiles
		get_num_savegames
		if (<num_savegames> > 0)
			savegame = 0
			begin
			reset_all_preset_characters savegame = <savegame>
			<savegame> = (<savegame> + 1)
			repeat <num_savegames>
		endif
		if ($is_in_cas = 1)
			if getcurrentcasobject
				if NOT is_completely_custom_musician id = ($cas_current_profile)
					refreshcasprofile
				endif
			endif
		endif
	endif
endscript

script hide_glitch \{num_frames = 2}
	SpawnScriptNow hide_glitch_spawned params = {num_frames = <num_frames>}
endscript
hide_glitch_count = 0

script hide_glitch_spawned 
	OnExitRun \{hide_glitch_spawned_exit}
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

script create_bink_sub_heaps 
	if NOT GotParam \{no_save_heap}
		destroy_save_heap_at_boot
	endif
	get_heap_sizes
	MemPushContext \{heap_bink}
	if NOT GotParam \{no_save_heap}
		if NOT memheapexists \{Name = heap_save_file}
			MemInitHeap Name = 'heap_save_file' size = <heap_size_save_file> vram_size = <heap_size_save_file_vram>
		endif
	endif
	if NOT memheapexists \{Name = heap_ghtunes_cache}
		MemInitHeap Name = 'heap_ghtunes_cache' size = <heap_size_ghtunes_cache> vram_size = <heap_size_ghtunes_cache_vram>
	endif
	MemPopContext
endscript

script destroy_bink_sub_heaps 
	Change \{save_heap_created_at_boot = 0}
	if memheapexists \{Name = heap_save_file}
		memdeleteheap \{Name = heap_save_file}
	endif
	if memheapexists \{Name = heap_ghtunes_cache}
		jamclearmemcache
		memdeleteheap \{Name = heap_ghtunes_cache}
	endif
	if isps3
		if memheapexists \{Name = heap_ghtunes_cache_vram}
			memdeleteheap \{Name = heap_ghtunes_cache_vram}
		endif
	endif
endscript

script create_save_heap_at_boot 
	get_heap_sizes
	Change \{save_heap_created_at_boot = 1}
	MemPushContext \{heap_frontend}
	if NOT memheapexists \{Name = heap_save_file}
		MemInitHeap Name = 'heap_save_file' size = <heap_size_save_file> vram_size = <heap_size_save_file_vram>
	endif
	MemPopContext
endscript

script destroy_save_heap_at_boot 
	if ($save_heap_created_at_boot = 1)
		Change \{save_heap_created_at_boot = 0}
		if memheapexists \{Name = heap_save_file}
			memdeleteheap \{Name = heap_save_file}
		endif
	endif
endscript

script create_song_heap 
	if NOT memheapexists \{Name = heap_song}
		get_heap_sizes
		MemPushContext \{heap_cas_cache}
		MemInitHeap Name = 'heap_song' size = <heap_size_song>
		MemPopContext
	endif
endscript

script create_song_and_musicstudio_heaps 
	create_song_heap
	musicstudio_instrument_createheaps
endscript

script destroy_song_and_musicstudio_heaps 
	if GotParam \{do_unloads}
		musicstudio_instrument_unloadall
		unloaddrumkitall
		unload_songqpak
	endif
	memdeleteheap \{Name = heap_song}
	musicstudio_instrument_deleteheaps
endscript
