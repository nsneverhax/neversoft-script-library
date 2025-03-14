use_defined_zone_sizes = 0
load_zone_address = 1
render_lock_framerate = 2
game_lock_framerate = 2
display_framerate_box = 1
framerate_value = 0.0
show_filenames = 0
output_tracking_lines = 0
rail_arrows = 0
show_all_trick_objects = 0
entered_from_autolaunch = 0
dontspoofadaptor = 1
num_rigidbody_destructors_per_frame = 20
num_rigidbody_destructors_per_frame_us = 0
has_accepted_dnas = 0
memoryleak_havok_warning = 65536
memoryleak_havok_assert = 131072
mem_frag_checks = [
	{
		heap = topdownheap
		warning = 0
		assert = 0
	}
	{
		heap = bottomupheap
		warning = 32
		assert = 32
	}
	{
		heap = scratch
		warning = 0
		assert = 65536
	}
	{
		heap = pedparts
		warning = 0
		assert = 0
	}
	{
		heap = animexportcapture
		warning = 0
		assert = 0
	}
	{
		heap = animexportdata
		warning = 0
		assert = 0
	}
	{
		heap = mission
		warning = 0
		assert = 0
	}
	{
		heap = intromission
		warning = 0
		assert = 0
	}
]
threaded_animation = 1
viewer_buttons_enabled = 1
enable_view_goals_select_shortcut = 0
wireframe_skins = 0
demo_build = 0
gameinformerbuild = 0
auto_change_chapter_and_stage = 0
showpolys_onquickview = 1
particle_heap_size = 1572864
particle_options_debug = {
	show_particle_heap = 0
	particle_warning_script = flexparticlewarning
}
assertonmissinganims = 1
railnode_assets_enabled = 1
railnode_assets_veh_enabled = 1
clear_abilities = 0
collectors_edition_fake_debug = collectors
navmeshpolys = 2000
navmeshradius = 4000
navmeshalpha = 64
profile_font_scale = 0.5
profile_time_font_scale = 0.4
profile_time_offset = -35
use_custom_proxim_code = 1
enable_playlist = 1
streamall_fsb_index = -1
localized_vo_fsb_index = -1
music_fsb_index = -1
lightcachepool = 9500

script load_permanent_assets 
	ve_heap_multiplier = 2
	if isxenon
		if cd
			ve_heap_multiplier = 2
		endif
	elseif isps3
		ve_heap_multiplier = 2
		change max_profile_photos = 50
		change ve_max_profile_clips = 40
	endif
	ve_adjust_for_buffer_sizes multiplier = <ve_heap_multiplier>
	extra_ve_scratch_space = ((562 * 1024) * (<ve_heap_multiplier> - 1))
	ve_buffer_sizes = ((2858 * 1024) * <ve_heap_multiplier>)
	getplatform
	switch <platform>
		case xenon
		<ve_buffer_sizes> = (<ve_buffer_sizes> + 204800)
		<heap_size_unloadableanim> = 24117248
		<heap_size_intromission> = ((4 * 1024 * 1024) - 196608)
		<heap_size_intromission_vram> = 0
		<heap_size_mission> = ((6 * 1024 * 1024) - 262144)
		<heap_size_mission_vram> = 0
		<heap_size_scratch> = ((13 * 1024 * 1024) + <extra_ve_scratch_space>)
		<heap_size_scratch_vram> = 0
		<heap_size_globalpak> = (16 * 1024 * 1024)
		<heap_size_globalpak_vram> = 0
		<heap_size_audio> = (11 * 1024 * 1024)
		<heap_size_audio_vram> = 0
		<heap_size_rail_node> = (16 * 1024)
		<heap_size_animexport_capture> = <ve_buffer_sizes>
		<heap_size_animexport_capture_vram> = 0
		<heap_size_animexport_data> = <ve_buffer_sizes>
		<heap_size_animexport_data_vram> = 0
		<heap_size_env_tex> = (5 * 1024 * 1024)
		<heap_size_env_tex_vram> = 0
		<heap_size_ped_tex> = (1024 * 1024)
		<heap_size_ped_tex_vram> = 0
		case ps3
		<heap_size_unloadableanim> = 23472128
		<heap_size_intromission> = (256 * 1024)
		<heap_size_intromission_vram> = (1024 * 1024)
		<heap_size_mission> = (768 * 1024)
		<heap_size_mission_vram> = (4 * 1024 * 1024)
		<heap_size_scratch> = ((5 * 1024 * 1024 + 256 * 1024) + <extra_ve_scratch_space>)
		<heap_size_scratch_vram> = (6 * 1024 * 1024)
		<heap_size_globalpak> = (1400 * 1024)
		<heap_size_globalpak_vram> = (7500 * 1024)
		<heap_size_audio> = (128 * 1024)
		<heap_size_audio_vram> = (10 * 1024 * 1024)
		<heap_size_rail_node> = (16 * 1024)
		<heap_size_animexport_capture> = <ve_buffer_sizes>
		<heap_size_animexport_capture_vram> = 0
		<heap_size_animexport_data> = <ve_buffer_sizes>
		<heap_size_animexport_data_vram> = 0
		<heap_size_env_tex> = (100 * 1024)
		<heap_size_env_tex_vram> = (3100 * 1024)
		<heap_size_ped_tex> = (100 * 1024)
		<heap_size_ped_tex_vram> = (500 * 1024)
		default
		scriptassert "Unrecognized platform for heap setup"
	endswitch
	pushmemprofile 'Audio Stream header'
	LoadStreamHeader 'streams\\streams'
	popmemprofile
	if (<platform> = ps3)
		mempushcontext topdownheap
	endif
	meminitheap name = 'UnloadableAnim' size = <heap_size_unloadableanim>
	if (<platform> = ps3)
		mempopcontext
	endif
	pushmemprofile 'Items'
	setup_items
	popmemprofile
	create_node_flags
	setshadowrenderingflags enable = 'true' object = 'skin'
	setshadowrenderingflags enable = 'true' object = 'nonskin'
	ss_ClearRegions
	ss_LoadRegion filename = 'z_navmesh'
	meminitheap name = 'RailNodeHeap' size = <heap_size_rail_node>
	pushmemprofile 'Environ Tex Pak Heap'
	meminitheap name = 'heap_env_tex' size = <heap_size_env_tex> vram_size = <heap_size_env_tex_vram>
	popmemprofile
	loadpak 'pak/global_env_tex/global_env_tex.pak' heap = heap_env_tex
	loadpak 'pak/global_ad_tex/global_ad_tex.pak' heap = heap_massive_ads
	pushmemprofile 'Ped Tex Pak Heap'
	meminitheap name = 'heap_ped_tex' size = <heap_size_ped_tex> vram_size = <heap_size_ped_tex_vram>
	popmemprofile
	loadpak 'pak/global_ped_tex/global_ped_tex.pak' heap = heap_ped_tex
	pushmemprofile 'Global Pak Heap'
	meminitheap name = 'heap_global_pak' size = <heap_size_globalpak> vram_size = <heap_size_globalpak_vram>
	popmemprofile
	loadpak 'zones/global/global.pak' heap = heap_global_pak splitfile
	loadpak 'pak/ui/ui.pak' heap = heap_global_pak splitfile
	loadpak 'fonts/text_a1.pak'
	if isfmodenabled
		loadfsb filename = 'streams/streamall' numstreams = 2 nowait
		change streamall_fsb_index = <fsb_index>
		loadfsb filename = 'music/music' numstreams = 2 nowait
		change music_fsb_index = <fsb_index>
		if french
			loadfsb filename = 'streams/vo_French' numstreams = 2 nowait
			change localized_vo_fsb_index = <fsb_index>
		elseif german
			loadfsb filename = 'streams/vo_German' numstreams = 2 nowait
			change localized_vo_fsb_index = <fsb_index>
		elseif spanish
			loadfsb filename = 'streams/vo_Spanish' numstreams = 2 nowait
			change localized_vo_fsb_index = <fsb_index>
		else
			loadfsb filename = 'streams/vo_English' numstreams = 2 nowait
			change localized_vo_fsb_index = <fsb_index>
		endif
		pushmemprofile 'Audio Heap'
		meminitheap name = 'heap_audio' size = <heap_size_audio> vram_size = <heap_size_audio_vram>
		popmemprofile
		enableremovesoundentry enable
		loadpak 'zones/global/global_sfx.pak' heap = heap_audio
	endif
	setscenepermanent scene = 'zones/global/global_gfx.scn' permanent
	engineconfig particlelod = 0
	GetPlatformExt
	loadpak ('pak/cas/cas.pak') no_vram localized
	loadpak 'pak/cutscene_infos/cutscene_infos.pak' no_vram
	loadpak 'pak/career_gaps/career_gaps.pak' no_vram
	initanimcompresstable 'anims\\standardkeyq.bin' q48
	initanimcompresstable 'anims\\standardkeyt.bin' t48
	pushmemprofile 'Animation Cache'
	if isps3
		anim_heap_size = 3145728
	else
		anim_heap_size = 4193280
	endif
	initanimsystem {
		animheapsize = <anim_heap_size>
		cacheblockalign = 3072
		animnxbuffersize = (1024 * 1024)
		defcachetype = fullres
		maxanimstages = 2
		maxanimsubsets = 4
		maxdegenerateanims = 3
	}
	popmemprofile
	getplatform
	mempushcontext heap_sky
	createpakmanmap map = sky links = skylinks folder = 'skies/'
	mempopcontext
	pushmemprofile 'Collision Heap'
	meminitheap name = 'Collision' size = 20480
	popmemprofile
	pushmemprofile 'Intro Mission Heap'
	meminitheap name = 'IntroMission' size = <heap_size_intromission> vram_size = <heap_size_intromission_vram>
	popmemprofile
	pushmemprofile 'Mission Heap'
	meminitheap name = 'Mission' size = <heap_size_mission> vram_size = <heap_size_mission_vram>
	popmemprofile
	pushmemprofile 'Scratch Heap'
	meminitheap name = 'Scratch' size = <heap_size_scratch> vram_size = <heap_size_scratch_vram>
	popmemprofile
	loadpak 'pak/vehicles/vehicles.pak' heap = scratch
	loadpak 'pak/rigger_pieces/rigger_pieces.pak' heap = scratch
	pushmemprofile 'AnimExport Heaps'
	meminitheap name = 'AnimExportCapture' size = <heap_size_animexport_capture> vram_size = <heap_size_animexport_capture_vram>
	meminitheap name = 'AnimExportData' size = <heap_size_animexport_data> vram_size = <heap_size_animexport_data_vram>
	popmemprofile
	startkeyboardhandler max_length = 128
	GoalPakManager_Setup small_intro_count = 12 large_intro_count = 3
	font_colors = default_font_colors
	setfontproperties 'text_A1' color_tab = $<font_colors> debug_font
	if isxenon
		buttons_font = 'ButtonsXenon'
	else
		if isps3
			buttons_font = 'ButtonsPs3'
		endif
	endif
	setfontproperties <buttons_font> buttons_font
	cas_concat_character_part_arrays
	CAP_Fill_Bling_Object_Structs
	Verify_Area_Data
endscript

script init_light_manager 
	initlightmanager \{max_lights = 128
		max_model_lights = 350
		max_groups = 8
		max_render_verts_per_geom = 4096}
	LightManager_SetVertexColorStorageHeap \{heap = frontendheap}
	LightManager_EnableVertexColorStorage \{on}
endscript

script uninit_light_manager 
	UninitLightManager
endscript

script init_environment 
	InitSun {
		theta = (3.1415896 / 4.0)
		phi = (3.1415896 / 6.0)
		radius = 18000.0
		size = 7332.0
		corona_size = 7332.0
		texture = sun
		corona_texture = apm_sun_C_01
		lens_flare_data = lens_flare_data
	}
endscript

script init_loading_bar 
	SetLoadingBarPos \{x = 258
		y = 400}
	SetLoadingBarSize \{width = 140
		height = 8}
	SetLoadingBarStartColor \{r = 0
		g = 76
		b = 129}
	SetLoadingBarEndColor \{r = 176
		g = 211
		b = 115}
	SetLoadingBarBorder \{width = 5
		height = 5}
	SetLoadingBarBorderColor \{r = 40
		g = 40
		b = 40}
endscript
all_levels_unlocked = 0
useleveloverridestats = 0

script network_driver_startup 
	printf "*** about to write DNAS binary ***"
	netsessionfunc func = write_dnas_binary
	printf "*********************************************"
	printf "Loading net drivers..."
	if loadnetworkdrivers
		printf "**** SUCCESS!"
	else
		printf "**** FAILURE!"
	endif
	printf "*********************************************"
endscript

script screen_element_startup 
	enable_new_ui_system
	screenelementsysteminit
	setup_main_button_event_mappings
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = off
		}}
	launchevent \{type = focus
		target = root_window}
	create_panel_stuff
	ui :fsm_set \{state = uistate_gameplay
		replacement = this}
endscript

script default_system_startup 
	setup_gs_idle_proc_params
	allowassetloading off
	addeditablelist ped_editable_list
	AddRandomPartList $ped_editable_list
	change select_shift = 0
	pushmemprofile 'Pre-game initialization'
	if scriptexists compositeobjectmanager_startup
		compositeobjectmanager_startup
	endif
	SetupSkaterCareer
	InitCutsceneInfo {
		cutscene_list = $skate_cutscene_info
		cutscene_modes = $skate_cutscene_modes
	}
	SetStartingLevelFlags
	memcardsysteminitialize heap = scratch
	master_sfx_adding_sound_busses
	setglobalflag flag = $SOUNDS_SONGORDER_RANDOM
	netsessionfunc func = initialize
	vibrationon
	if cd
		change all_levels_unlocked = 0
		change clear_abilities = 0
		change applyviewerobjmodeltoplayer = 1
		change enable_file_cache = 1
		change ve_debug_score = 0
		change ui_show_debug_menus = 0
	else
		change dontspoofadaptor = 0
		change clear_abilities = 0
		change ui_show_debug_menus = 1
	endif
	screen_element_startup
	setscreenelementprops id = root_window event_handlers = [{pad_start nullscript}] replace_handlers
	printf "replace_handlers to take away start key in load_level"
	setservermode on
	setjoinmode $join_mode_play
	pushmemprofile 'Start & Join Server'
	startserver
	joinserver <...>
	popmemprofile
	PreprocessStreamSets
	mempushcontext aiheap
	Agent_Startup
	mempopcontext
	popmemprofile
	if ((cd) || (istrue $enable_playlist))
		randomize
		LoadMusicTracks trackarray = playlist_tracks
		CreateMasterPlaylist weightedgenres randomplay
		PlaylistPlay
		SetPlaylistGenreWeights master metal = 1 punk = 1 rock = 1 hiphop = 1
	endif
	set_outline_shader_to_default
	setglobalflag flag = $BLOOD_OFF
	if english
		setglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
	else
		unsetglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
	endif
	if cd
		EnableScriptPrintf 0
		change has_accepted_dnas = 0
		change dontspoofadaptor = 1
		change Enter_CAP_Trigger = $Enter_CAP_CD
		if istrue $demo_build
			autolaunch level = load_z_mainmenu game = career
		else
			autolaunch level = load_z_mainmenu game = career
		endif
	else
		cheat_select_shift
		change Enter_CAP_Trigger = $Enter_CAP_Debug
		if NOT istrue $dontspoofadaptor
			auto_launch_viewer
		endif
		if NOT istrue $dontspoofadaptor
			LaunchScriptDebugger
		endif
	endif
	setcurrentskaterprofile 0
	selectcurrentskater name = custom_story
endscript

script set_outline_shader_to_default 
	setoutlineshaderparams min = 0.002 max = 0.004 rate = 1.2 zscale = 0.004 filldist = 200 blendmode = 0
	setoutlineshadercolor index = 0 red = 180 green = 180 blue = 0 alpha = 255
	setoutlineshadercolor index = 1 red = 0 green = 120 blue = 20 alpha = 255
	setoutlineshadercolor index = 2 red = 140 green = 50 blue = 0 alpha = 255
	setoutlineshadercolor index = 3 red = 75 green = 0 blue = 160 alpha = 255
endscript

script call_personal_startup_script 
	if scriptexists startup
		startup
	else
		if NOT cd
			printf bg_color = cyan ""
			printf bg_color = cyan "WOOT! You are missing a startup script!"
			printf bg_color = cyan "Does it exist in your user.q?"
			printf bg_color = cyan "Do you even HAVE a user.q? (it should be yourname.q)"
			printf bg_color = cyan "The script needs to look something like this:"
			printf bg_color = cyan ""
			printf bg_color = green "script startup"
			printf bg_color = green "	autolaunch level=load_z_slums game=career"
			printf bg_color = green "endscript"
			printf bg_color = cyan ""
			scriptassert "No startup script found! See above for details"
		endif
		printf "WARNING: Missing the startup script"
		hideloadingscreen
		createscreenelement {
			parent = root_window
			type = textelement
			id = ns_rules
			text = "Neversoft and Activision 2002"
			font = Newtrickfont
			pos = (320.0, 420.0)
			rgba = [140 128 128 55]
			scale = 0.6
			just = [center center]
			not_focusable
		}
		runscriptonscreenelement id = ns_rules missing_startup
	endif
endscript

script missing_startup 
	begin
	setprops text = "Missing Script Startup"
	domorph time = 0 alpha = 0
	domorph time = 0.5 alpha = 1 scale = 3
	domorph time = 0.5 alpha = 1 scale = 1
	wait 5 seconds
	domorph time = 0.5 alpha = 0 scale = 0.5
	domorph time = 0.5 alpha = 0
	repeat
endscript

script startup_camera_playback 
	killskatercamanim \{all}
	unpausegame
	pauseskaters
endscript

script continue_career 
	restore_start_key_binding
	if objectexists \{id = ns_rules}
		destroyscreenelement \{id = ns_rules}
	endif
	killskatercamanim \{all}
	goalmanager_showpoints
	unpauseskaters
	SkipTrack
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = off
		}}
endscript

script fadein_fadeout \{text = ""}
	setprops text = <text>
	domorph \{time = 0
		alpha = 0}
	domorph \{time = 2
		alpha = 1}
	wait \{5
		seconds}
	domorph \{time = 2
		alpha = 0}
	domorph \{time = 2
		alpha = 0}
endscript
