
script guitar_support_init_crowd 
	create_crowd_models
	crowd_stagediver_hide
endscript

script guitar_support_load_anims 
	anim_paks_set_state state = <state>
	yield
endscript

script guitar_support_init_band \{async = 1}
	if ((<loading_transition> = 0) || $game_mode = freeplay)
		create_all_camera_lock_targets
		yield \{'create_all_camera_lock_targets'}
		if ($game_mode != tutorial && $calibrate_lag_enabled = 0 && $game_mode != practice)
			if (<async> = 1)
				yield \{'async'}
			else
				yield \{'non-async'}
			endif
			prepare_for_pending_animpaks
			if ($game_mode = freeplay)
				persistent_band_prepare_for_song \{async = 1}
			else
				persistent_band_prepare_for_song async = <async>
			endif
			yield \{'create_band2'}
		endif
		yield
	endif
	band_clearanimtempo
	yield
endscript
load_song_synchronous = true

script guitar_support_load_song 
	load_songqpak song_name = <song> async = 1
	yield \{'SongAudioLoad'}
	if NOT (<song> = jamsession)
		drum_kit_index = 0
		get_song_drum_kit_index song = <song>
		change jam_current_drum_kit = <drum_kit_index>
		yield \{'LoadDrumKitAll'}
		loaddrumkitall percussion = 0 song = <song> async = 1
		yield \{'SongAudioInit'}
		songaudioinit
		yield \{'SongAudioInit2'}
		if ($load_song_synchronous = true)
			songaudioload song_name = <song> starttime = <song_start_time>
			change \{load_song_synchronous = false}
		else
			spawnscriptnow songaudioload params = {song_name = <song> starttime = <song_start_time>}
		endif
	else
		printf \{chanel = sfx
			qs(0xada742c0)}
		appendsuffixtochecksum base = ($sfx_background_current_checksum) suffixstring = '_BK'
		backchecksumname = <appended_id>
		stopsound <backchecksumname> time = 0.5
		printf \{chanel = sfx
			qs(0xd3622445)}
		change \{g_crowd_in_jam_mode_song_state = 1}
		printf \{chanel = sfx
			qs(0x359bd552)}
		one_shot_soundevent \{soundevent = audio_crowd_oneshots_do_nothing
			waittime = 5
			immediate = 1}
	endif
	yield \{'SongAudioLoad final'}
	cache_song_end_time
	yield
	if (<song> = jamsession)
		getsonginfo
		getarraysize \{$drum_kits}
		if ((<drum_kit> >= <array_size>) || (<drum_kit> < 0))
			<drum_kit> = 0
		endif
		change jam_current_drum_kit = <drum_kit>
		change jam_current_percussion_kit = <percussion_kit>
		loaddrumkitall \{async = 1}
		musicstudio_instrument_loadall {
			keyboard_index = <keyboard_sound>
			guitar_index = <guitar_sound>
			bass_index = <bass_sound>
		}
	else
	endif
	yield \{'LoadDrumKitAll'}
endscript

script guitar_support_load_hud 
	if (<loading_transition> = 0)
		setup_bg_viewport
		killcamanim \{all}
		if ($game_mode = freeplay)
			stoprendering
		endif
		create_cameracuts <...> in_game = 1
	else
	endif
	yield \{'setup_bg_viewport2'}
	if ($debug_show_measures = 1)
		debug_menu_toggle_show_measures
		debug_menu_toggle_show_measures
		debug_measures_text :se_setprops \{unhide
			text = qs(0x9f7db74f)}
	endif
	if ($debug_show_song_time = 1)
		debug_menu_toggle_show_song_time
		debug_menu_toggle_show_song_time
	endif
	if ($debug_show_song_name = 1)
		debug_menu_toggle_show_song_name
		debug_menu_toggle_show_song_name
	endif
	if ($debug_show_song_stars = 1)
		debug_menu_toggle_show_song_stars
		debug_menu_toggle_show_song_stars
		debug_songstars_text :se_setprops \{unhide
			text = qs(0xfbf320c8)}
	endif
	yield
	if (<loading_transition> = 0)
		if ($game_mode = tutorial || $game_mode = practice)
			if ($current_bandname_viewport = none)
				create_movie_viewport
			endif
		else
			create_movie_viewport
		endif
	else
		if ($game_mode = freeplay)
			create_movie_viewport
		endif
	endif
	yield
endscript

script guitar_support_init_audio 
	audio_effects_song_quiet_reset_sfx_balance restarting = <restarting> loading_transition = <loading_transition>
	audio_crowd_adjust_loop_to_default restarting = <restarting>
	yield
	gameevent_venueenter
	guitarevent_venueenter
endscript

script guitar_support_init_venue 
	if (<loading_transition> = 0)
		if ($game_mode != tutorial)
			if NOT ($game_mode = practice)
				apply_band_logo_to_venue \{step = build}
			endif
		endif
		yield \{'apply_band_logo_to_venue'}
	endif
	lightshow_clear_mood_override_reasons
	yield
endscript

script guitar_init_lefty_highway 
	getplayerinfo <player> lefty_flip
	setplayerinfo <player> lefthanded_gems = <lefty_flip>
	setplayerinfo <player> lefthanded_button_ups = <lefty_flip>
endscript

script reset_all_player_scores 
	reset_score \{player = 1}
	reset_score \{player = 2}
	reset_score \{player = 3}
	reset_score \{player = 4}
	<player> = 5
	begin
	formattext checksumname = detailstats_array 'p%s_last_song_detailed_stats' s = <player>
	setplayerinfo <player> current_detailedstats_array_entry = 0
	setplayerinfo <player> current_detailedstats_array = <detailstats_array>
	formattext checksumname = detailstats_array_max 'p%s_last_song_detailed_stats_max' s = <player>
	setplayerinfo <player> current_detailedstats_max_array = <detailstats_array_max>
	setarrayelement arrayname = <detailstats_array> globalarray all newvalue = 0
	setarrayelement arrayname = <detailstats_array_max> globalarray all newvalue = 0
	<player> = (<player> + 1)
	repeat 4
endscript

script guitar_support_init_players 
	setplayerinfo \{1
		bot_pattern = 0}
	setplayerinfo \{2
		bot_pattern = 0}
	setplayerinfo \{3
		bot_pattern = 0}
	setplayerinfo \{4
		bot_pattern = 0}
	setplayerinfo \{1
		bot_strum = 0}
	setplayerinfo \{2
		bot_strum = 0}
	setplayerinfo \{3
		bot_strum = 0}
	setplayerinfo \{4
		bot_strum = 0}
	gamemode_gettype
	if (<type> != freeplay)
		setplayerinfo \{1
			interactive = 1}
		setplayerinfo \{2
			interactive = 1}
		setplayerinfo \{3
			interactive = 1}
		setplayerinfo \{4
			interactive = 1}
		setplayerinfo \{1
			last_noninteractive_end_time = -1.0}
		setplayerinfo \{2
			last_noninteractive_end_time = -1.0}
		setplayerinfo \{3
			last_noninteractive_end_time = -1.0}
		setplayerinfo \{4
			last_noninteractive_end_time = -1.0}
		setplayerinfo \{1
			scoring = 1}
		setplayerinfo \{2
			scoring = 1}
		setplayerinfo \{3
			scoring = 1}
		setplayerinfo \{4
			scoring = 1}
	endif
	yield
	tap_prototype_off
	init_play_log
	yield
	progression_setprogressionnodeflags
	yield \{'Nodeflags'}
	get_current_songs_struct
	if playerinfoequals \{1
			bot_play = 1}
		setupbotcontroller \{player = 1}
	endif
	getplayerinfo \{2
		bot_play}
	getplayerinfo \{2
		is_local_client}
	if ((1 = <bot_play>) || (0 = <is_local_client>))
		setupbotcontroller \{player = 2}
	endif
	getplayerinfo \{3
		bot_play}
	getplayerinfo \{3
		is_local_client}
	if ((1 = <bot_play>) || (0 = <is_local_client>))
		setupbotcontroller \{player = 3}
	endif
	getplayerinfo \{4
		bot_play}
	getplayerinfo \{4
		is_local_client}
	if ((1 = <bot_play>) || (0 = <is_local_client>))
		setupbotcontroller \{player = 4}
	endif
	yield
	getfirstplayer
	getplayerinfo <player> difficulty
	yield
	change \{structurename = musician1_info
		stance = stance_a}
	change \{structurename = musician1_info
		next_stance = stance_a}
	change \{structurename = musician1_info
		current_anim = idle}
	change \{structurename = musician1_info
		cycle_anim = true}
	change \{structurename = musician1_info
		next_anim = none}
	change \{structurename = musician1_info
		playing_missed_note = false}
	yield
	change \{structurename = musician2_info
		stance = stance_a}
	change \{structurename = musician2_info
		next_stance = stance_a}
	change \{structurename = musician2_info
		current_anim = idle}
	change \{structurename = musician2_info
		cycle_anim = true}
	change \{structurename = musician2_info
		next_anim = none}
	change \{structurename = musician2_info
		playing_missed_note = false}
	yield
	change \{structurename = musician3_info
		stance = stance_a}
	change \{structurename = musician3_info
		next_stance = stance_a}
	change \{structurename = musician3_info
		current_anim = idle}
	change \{structurename = musician3_info
		cycle_anim = true}
	change \{structurename = musician3_info
		next_anim = none}
	change \{structurename = musician3_info
		playing_missed_note = false}
	yield
	change \{structurename = musician4_info
		stance = stance_a}
	change \{structurename = musician4_info
		next_stance = stance_a}
	change \{structurename = musician4_info
		current_anim = idle}
	change \{structurename = musician4_info
		cycle_anim = true}
	change \{structurename = musician4_info
		next_anim = none}
	change \{structurename = musician4_info
		playing_missed_note = false}
	yield
	reset_all_player_scores
	apply_scoring_attributes_for_players
	resetbandinfo
	yield \{'reset_score'}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> difficulty
		yield
		getplayerinfo <player> is_onscreen out = player_on_screen
		setplayerinfo <player> guitar_volume = 100
		setplayerinfo <player> drum_volume1 = 100
		setplayerinfo <player> drum_volume2 = 100
		setplayerinfo <player> drum_volume3 = 100
		setplayerinfo <player> drum_volume4 = 100
		if (<player_on_screen> = 1)
			updateguitarvolume
		endif
		yield
		getglobaltags \{user_options}
		guitar_init_lefty_highway player = <player>
		yield
		getplayerinfo <player> controller
		get_resting_whammy_position controller = <controller>
		if gotparam \{resting_whammy_position}
			setplayerinfo <player> resting_whammy_position = <resting_whammy_position>
		endif
		get_star_power_position controller = <controller>
		if gotparam \{star_power_position}
			setplayerinfo <player> star_tilt_threshold = <star_power_position>
		endif
		yield
		if ($output_gpu_log = 1)
			if NOT stringequals \{a = $gpulog_outputfilename
					b = 'none'}
				<filename> = $gpulog_outputfilename
			endif
			textoutputstart filename = <filename>
		endif
		yield
		if ($end_credits = 0)
			crowd_reset <...>
		endif
		yield \{'crowd_reset'}
		star_power_reset player = <player>
		yield
		getplayerinfo <player> cheat_hyperspeed_value
		printf qs(0x1445965d) p = <player> h = <cheat_hyperspeed_value>
		setplayerinfo <player> hyperspeed = <cheat_hyperspeed_value>
		yield
		if demobuild
			if ($g_kiosk_demo = 1)
				setplayerinfo <player> cheat_autokick = 1
			endif
		endif
		difficulty_setup player = <player> difficulty = <difficulty>
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript
g_system_name = [
	venue
	band
	crowd
	camera
	stageshow
	musicmonitor
]
g_system_status = [
	off
	off
	off
	off
	off
	off
]

script set_game_system_status 
	getarraysize \{$g_system_name}
	<ii> = 0
	begin
	if (<system> = (($g_system_name) [<ii>]))
		setarrayelement arrayname = g_system_status globalarray index = <ii> newvalue = <state>
	endif
	<ii> = (<ii> + 1)
	repeat <array_size>
endscript

script dump_system_status 
	getarraysize \{$g_system_name}
	system_array_size = <array_size>
	printf \{channel = system
		qs(0xaa9ecf0f)}
	printf channel = system qs(0x928e7026) a = <system_array_size>
	printf \{channel = system
		qs(0xaa9ecf0f)}
	s = 0
	begin
	<name> = ($g_system_name [<s>])
	<status> = ($g_system_status [<s>])
	printf channel = system qs(0xf5416043) a = <name> b = <status>
	<s> = (<s> + 1)
	repeat <system_array_size>
	printf \{channel = system
		qs(0xaa9ecf0f)}
endscript

script update_gameplay_systems 
	printf \{channel = system
		qs(0xaa9ecf0f)}
	printf channel = system qs(0xcba463f0) a = <base_name>
	<status_changed> = 0
	if gotparam \{systems}
		getarraysize \{$g_system_name}
		system_array_size = <array_size>
		s = 0
		begin
		<name> = ($g_system_name [<s>])
		<required_status> = off
		getarraysize <systems>
		i = 0
		begin
		active_name = (<systems> [<i>])
		if (<active_name> = <name>)
			<required_status> = on
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		<actual_status> = ($g_system_status [<s>])
		if NOT (<actual_status> = <required_status>)
			setarrayelement arrayname = g_system_status globalarray index = <s> newvalue = <required_status>
			<status_changed> = 1
			if (<required_status> = on)
				extendcrc <name> '_system_init' out = init_script
				printf channel = system qs(0x16ec897a) a = <name>
				if scriptexists <init_script>
					<init_script>
				endif
			else
				extendcrc <name> '_system_deinit' out = deinit_script
				printf channel = system qs(0x2506b6d9) a = <name>
				if scriptexists <deinit_script>
					<deinit_script>
				endif
			endif
		endif
		<s> = (<s> + 1)
		repeat <system_array_size>
	endif
	if (<status_changed> = 1)
		dump_system_status
	else
		printf \{channel = system
			qs(0x7bbae32e)}
		printf \{channel = system
			qs(0xaa9ecf0f)}
	endif
endscript

script band_system_init 
endscript

script band_system_deinit 
endscript

script venue_system_init \{block_scripts = 1}
	pushunsafeforshutdown \{context = venue_system_init}
	load_venue block_scripts = <block_scripts>
	popunsafeforshutdown \{context = venue_system_init}
endscript

script venue_system_deinit 
endscript

script crowd_system_init 
	if ($calibrate_lag_enabled = 0 && $game_mode != practice && $game_mode != tutorial)
		guitar_support_init_crowd
	endif
endscript

script crowd_system_deinit 
	destroy_crowd_models
endscript

script musicmonitor_system_init 
	spawnscriptnow \{menu_song_monitor}
endscript

script musicmonitor_system_deinit 
	spawnscriptnow \{stop_menu_song_monitor}
endscript

script stageshow_system_init 
	killspawnedscript \{name = menu_lightshow}
	spawnscriptnow \{menu_lightshow}
	lightshow_initeventmappings
	lightshow_dummyloop
	spawnscriptnow \{reset_mainmenu_camera}
	prepare_band_for_main_menu
endscript

script stageshow_system_deinit 
	killspawnedscript \{name = menu_lightshow}
	lightshow_notingameplay_setmood \{mood = band_lobby}
endscript
