
script guitar_support_init_crowd 
	create_crowd_models
	crowd_stagediver_hide
endscript

script guitar_support_load_anims 
	if ($use_old_system_setup = 1)
		anim_paks_set_state state = <state>
	endif
	yield
endscript

script guitar_support_init_band \{async = 1}
	if ($use_old_system_setup = 1)
		create_all_camera_lock_targets
		if ((<loading_transition> = 0) || $game_mode = freeplay)
			yield \{'create_all_camera_lock_targets'}
			if ($game_mode != tutorial && $calibrate_lag_enabled = 0 && $game_mode != practice)
				yield
				prepare_for_pending_animpaks
				if ($game_mode = freeplay)
					persistent_band_prepare_for_song \{async = 1}
				else
					persistent_band_prepare_for_song async = <async>
				endif
				yield \{'create_band2'}
			endif
			yield
			yield
			yield
		endif
		band_clearanimtempo
		yield
	else
		cas_destroy_all_characters
		create_all_camera_lock_targets
		if ($game_mode != tutorial)
			persistent_band_prepare_for_song async = <async>
		endif
		band_clearanimtempo
	endif
endscript
load_song_synchronous = true

script guitar_support_load_song 
	load_songqpak song_name = <song> async = 1
	if NOT (<song> = jamsession)
		if ($notetracker_quickplay_active = 0)
			drum_kit_index = 0
			get_song_drum_kit_index song = <song>
			change jam_current_drum_kit = <drum_kit_index>
			loaddrumkitall percussion = 0 song = <song> async = 1
		endif
		initsongaudiosystem
		if ($load_song_synchronous = true)
			preload_song song_name = <song> starttime = <song_start_time>
			change \{load_song_synchronous = false}
		else
			spawnscriptnow preload_song params = {song_name = <song> starttime = <song_start_time>}
		endif
	else
		printf \{chanel = sfx
			qs(0xada742c0)}
		appendsuffixtochecksum base = ($sfx_background_current_checksum) suffixstring = '_BK'
		backchecksumname = <appended_id>
		stopsound <backchecksumname> time = 0.5
		printf \{chanel = sfx
			qs(0x01013a15)}
		change \{crowd_in_jam_mode_song_state = 1}
		printf \{chanel = sfx
			qs(0x359bd552)}
		one_shot_soundevent \{soundevent = donothing_oneshot
			waittime = 5
			immediate = 1}
		if notetracker_is_using_stream
			preload_mp3_song
		endif
	endif
	yield \{'preload_song'}
	cache_song_end_time
	yield
	if ($notetracker_quickplay_active = 0)
		if (<song> = jamsession)
			getsonginfo
			getarraysize \{$drum_kits}
			if ((<drum_kit> >= <array_size>) || (<drum_kit> < 0))
				<drum_kit> = 0
			endif
			change jam_current_drum_kit = <drum_kit>
			change jam_current_percussion_kit = <percussion_kit>
			loaddrumkitall \{async = 1}
			if NOT notetracker_is_using_stream
				musicstudio_instrument_loadall {
					keyboard_index = <keyboard_sound>
					guitar_index = <guitar_sound>
					bass_index = <bass_sound>
				}
				if gotparam \{bass_kit}
					getarraysize \{$pause_bass_kit_options}
					if ((<bass_kit> >= <array_size>) || (<bass_kit> < 0))
						<bass_kit> = 0
					endif
					change bass_kit_mode = <bass_kit>
					loadbasskit bass_kit = <bass_kit>
				else
					setsonginfo \{bass_kit = 0}
					change \{bass_kit_mode = 0}
				endif
			endif
		else
		endif
		yield \{'LoadDrumKitAll'}
	endif
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
	if ($debug_showmeasures = on)
		toggle_showmeasures \{for_autolaunch}
		toggle_showmeasures \{for_autolaunch}
		debug_measures_text :se_setprops \{unhide
			text = qs(0x9f7db74f)}
	endif
	if ($debug_showsongtime = on)
		toggle_showsongtime \{for_autolaunch}
		toggle_showsongtime \{for_autolaunch}
	endif
	if ($debug_showsongname = on)
		toggle_showsongname \{for_autolaunch}
		toggle_showsongname \{for_autolaunch}
	endif
	if ($debug_showsongstars = on)
		toggle_showsongstars \{for_autolaunch}
		toggle_showsongstars \{for_autolaunch}
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
	endif
endscript

script guitar_support_init_audio 
	song_quiet_reset_sfx_balance restarting = <restarting> loading_transition = <loading_transition>
	gh3_adjustcrowdloopbacktodefault restarting = <restarting>
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
	change \{lightshow_allow_mood_changes = true}
	change \{lightshow_last_mood_requested = none}
	yield
endscript

script guitar_init_lefty_highway 
	getplayerinfo <player> lefty_flip
	setplayerinfo <player> lefthanded_gems = <lefty_flip>
	setplayerinfo <player> lefthanded_button_ups = <lefty_flip>
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
	getplayerinfo \{2
		bot_play}
	getplayerinfo \{2
		is_local_client}
	if ((<bot_play> = 1) || (<is_local_client> = 0))
		getplayerinfo \{2
			controller}
		setup_bot_controller \{player = 2}
		printf \{channel = log
			qs(0xb7d6cb93)}
	endif
	if playerinfoequals \{1
			bot_play = 1}
		setup_bot_controller \{player = 1}
		printf \{channel = log
			qs(0x9cfb9850)}
	endif
	getplayerinfo \{3
		bot_play}
	getplayerinfo \{3
		is_local_client}
	if ((<bot_play> = 1) || (<is_local_client> = 0))
		setup_bot_controller \{player = 3}
		printf \{channel = log
			qs(0xaecdfad2)}
	endif
	getplayerinfo \{4
		bot_play}
	getplayerinfo \{4
		is_local_client}
	if ((<bot_play> = 1) || (<is_local_client> = 0))
		setup_bot_controller \{player = 4}
		printf \{channel = log
			qs(0xe18c6c15)}
	endif
	yield
	getfirstplayer
	getplayerinfo <player> difficulty
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	printf qs(0x5f297a5b) s = <song> d = <difficulty>
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
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
	reset_score \{player = 1}
	reset_score \{player = 2}
	reset_score \{player = 3}
	reset_score \{player = 4}
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
			textoutputstart
		endif
		yield
		if (($tutorial_disable_hud = 0) && ($end_credits = 0))
			crowd_reset <...>
		endif
		yield \{'crowd_reset'}
		star_power_reset player = <player>
		yield
		getplayerinfo <player> cheat_hyperspeed_value
		setplayerinfo <player> hyperspeed = <cheat_hyperspeed_value>
		yield
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
use_old_system_setup = 1

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
	if ($use_old_system_setup = 0)
		guitar_support_init_band \{async = 0}
	endif
endscript

script band_system_deinit 
endscript

script venue_system_init 
	load_venue \{block_scripts = 1}
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
