
script guitar_support_init_crowd 
	create_crowd_models
	Crowd_StageDiver_Hide
endscript

script guitar_support_load_anims 
	if ($use_old_system_setup = 1)
		anim_paks_set_state state = <state>
	endif
	yield
endscript

script guitar_support_init_band \{async = 1}
	if ($use_old_system_setup = 1)
		if (<loading_transition> = 0)
			create_all_camera_lock_targets
			yield \{'create_all_camera_lock_targets'}
			if ($game_mode != tutorial && $calibrate_lag_enabled = 0 && $game_mode != practice)
				yield
				wii_timer_start \{label = 'band'}
				if ($game_mode = freeplay)
					persistent_band_prepare_for_song \{async = 1}
				else
					persistent_band_prepare_for_song async = <async>
				endif
				wii_timer_stop \{label = 'band'}
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
	ps2_unload_car_part_script
	wii_timer_start \{label = 'song_anims'}
	load_song_anims song_name = <song> async = 1
	wii_timer_stop \{label = 'song_anims'}
endscript

script guitar_support_load_song 
	wii_timer_start \{label = 'song_qpak1'}
	if NOT load_songqpak song_name = <song> async = 0 noanims
		return FALSE error_text = <error_text>
	endif
	wii_timer_stop \{label = 'song_qpak1'}
	if NOT (<song> = jamsession)
		initsongaudiosystem
		wii_timer_start \{label = 'song_audio'}
		preload_song song_name = <song> starttime = <starttime>
		printf \{qs(0x1157f54a)}
		printf \{qs(0x713755f7)}
		printf qs(0xb2584708) a = <starttime> b = <adjustedtime>
		printf \{qs(0x713755f7)}
		printf \{qs(0x1157f54a)}
		starttime = <adjustedtime>
		Change current_starttime = <starttime>
		wii_timer_stop \{label = 'song_audio'}
	else
		printf \{chanel = sfx
			qs(0xada742c0)}
		AppendSuffixToChecksum Base = ($SFX_Background_Current_Checksum) SuffixString = '_BK'
		backchecksumname = <appended_id>
		stopsound <backchecksumname> time = 0.5
		printf \{chanel = sfx
			qs(0x01013a15)}
		Change \{crowd_in_jam_mode_song_state = 1}
		printf \{chanel = sfx
			qs(0x359bd552)}
		One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot
			waitTime = 5
			immediate = 1}
		if notetracker_is_using_stream
			preload_mp3_song
		endif
	endif
	yield \{'preload_song'}
	get_song_section_array Player = <Player>
	Change current_section_array = <song_section_array>
	Change \{current_section_array_entry = 0}
	cache_song_end_time
	yield
	if ($notetracker_quickplay_active = 0)
		if (<song> = jamsession)
			getsonginfo
			GetArraySize \{$drum_kits}
			if ((<drum_kit> >= <array_Size>) || (<drum_kit> < 0))
				<drum_kit> = 0
			endif
			Change jam_current_drum_kit = <drum_kit>
			loaddrumkitall \{async = 0
				heap_drums = quota_drums
				heap_percussion = quota_percussion}
			if NOT notetracker_is_using_stream
				musicstudio_instrument_loadall
				if GotParam \{bass_kit}
					GetArraySize \{$pause_bass_kit_options}
					if ((<bass_kit> >= <array_Size>) || (<bass_kit> < 0))
						<bass_kit> = 0
					endif
					Change bass_kit_mode = <bass_kit>
					loadbasskit bass_kit = <bass_kit>
				else
					setsonginfo \{bass_kit = 0}
					Change \{bass_kit_mode = 0}
				endif
			endif
		else
			wii_timer_start \{label = 'sfx_drumkit2'}
			drum_kit_index = 0
			get_song_drum_kit_index song = <song>
			Change jam_current_drum_kit = <drum_kit_index>
			loaddrumkitall percussion = 0 song = <song> async = 0
			wii_timer_stop \{label = 'sfx_drumkit2'}
		endif
		yield \{'LoadDrumKitAll'}
	endif
	wii_timer_stop \{label = 'sfx'}
	yield \{'LoadDrumKitAll'}
	return \{true}
endscript

script guitar_support_load_hud 
	if (<loading_transition> = 0)
		setup_bg_viewport
		KillCamAnim \{all}
		create_cameracuts <...> in_game = 1
	endif
	yield \{'setup_bg_viewport2'}
	if ($debug_showmeasures = On)
		toggle_showmeasures \{for_autolaunch}
		toggle_showmeasures \{for_autolaunch}
		debug_measures_text :se_setprops \{text = qs(0x9f7db74f)}
	endif
	if ($debug_showsongtime = On)
		toggle_showsongtime \{for_autolaunch}
		toggle_showsongtime \{for_autolaunch}
	endif
	if ($debug_showsongstars = On)
		toggle_showsongstars \{for_autolaunch}
		toggle_showsongstars \{for_autolaunch}
		debug_songstars_text :se_setprops \{unhide
			text = qs(0xfbf320c8)}
	endif
	yield
	if (<loading_transition> = 0)
		if ($game_mode = tutorial || $game_mode = practice)
			if ($current_bandname_viewport = None)
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
	wii_timer_start \{label = 'sfx'}
	wii_load_crowd_sfx
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
	Change \{lightshow_allow_mood_changes = true}
	Change \{lightshow_last_mood_requested = None}
	yield
	Change \{Default_TOD_Manager = $default_tod_manager_bloomblur}
endscript

script guitar_init_lefty_highway 
	getplayerinfo <Player> lefty_flip
	setplayerinfo <Player> lefthanded_gems = <lefty_flip>
	setplayerinfo <Player> lefthanded_button_ups = <lefty_flip>
	setplayerinfo <Player> lefthanded_gems_flip_save = <lefty_flip>
	setplayerinfo <Player> lefthanded_button_ups_flip_save = <lefty_flip>
	if (<lefty_flip> = 0)
		setplayerinfo <Player> lefty_attack_name = 0
	else
		setplayerinfo <Player> lefty_attack_name = 1
	endif
endscript

script guitar_support_init_players \{Heap = quota_sprites}
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
	if (<Type> != freeplay)
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
	Progression_SetProgressionNodeFlags
	yield \{'Nodeflags'}
	getplayerinfo \{2
		bot_play}
	getplayerinfo \{2
		is_local_client}
	if ((<bot_play> = 1) || (<is_local_client> = 0))
		getplayerinfo \{2
			controller}
		setup_bot_controller \{Player = 2}
		printf \{channel = log
			qs(0xb7d6cb93)}
	endif
	if playerinfoequals \{1
			bot_play = 1}
		setup_bot_controller \{Player = 1}
		printf \{channel = log
			qs(0x9cfb9850)}
	endif
	getplayerinfo \{3
		bot_play}
	getplayerinfo \{3
		is_local_client}
	if ((<bot_play> = 1) || (<is_local_client> = 0))
		setup_bot_controller \{Player = 3}
		printf \{channel = log
			qs(0xaecdfad2)}
	endif
	getplayerinfo \{4
		bot_play}
	getplayerinfo \{4
		is_local_client}
	if ((<bot_play> = 1) || (<is_local_client> = 0))
		setup_bot_controller \{Player = 4}
		printf \{channel = log
			qs(0xe18c6c15)}
	endif
	wii_timer_start \{label = 'oogame'}
	if ($game_mode = p2_pro_faceoff || $game_mode = p4_pro_faceoff || $game_mode = p8_pro_faceoff || $game_mode = p2_roadie_battle ||
			$game_mode = compmega || $game_mode = compmega_team || $game_mode = fest_mode || $game_mode = fest_mode_team)
		if ispakloaded 'pak/oogame/oogame.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogame.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamebattle.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamebattle.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogameband.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogameband.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamerb.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamerb.pak' Heap = <Heap>
		endif
		LoadPak 'pak/oogame/oogamevs.pak' Heap = <Heap>
	elseif musicstudio_mainobj :musicstudio_isplayingsongingame
		if ispakloaded 'pak/oogame/oogamebattle.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamebattle.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamevs.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamevs.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogameband.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogameband.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamerb.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamerb.pak' Heap = <Heap>
		endif
		if NOT ispakloaded 'pak/oogame/oogame.pak' Heap = <Heap>
			LoadPak 'pak/oogame/oogame.pak' Heap = <Heap>
		endif
	elseif ($game_mode = p2_quickplay || $game_mode = p3_quickplay || $game_mode = p4_quickplay ||
			$game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career ||
			$game_mode = p4_pro_faceoff || $game_mode = p8_pro_faceoff || $game_mode = career)
		if ispakloaded 'pak/oogame/oogame.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogame.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamebattle.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamebattle.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamevs.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamevs.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamerb.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamerb.pak' Heap = <Heap>
		endif
		LoadPak 'pak/oogame/oogameband.pak' Heap = <Heap>
	elseif is_roadie_battle_mode
		if ispakloaded 'pak/oogame/oogame.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogame.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamebattle.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamebattle.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamevs.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamevs.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogameband.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogameband.pak' Heap = <Heap>
		endif
		LoadPak 'pak/oogame/oogamerb.pak' Heap = <Heap>
	else
		if ispakloaded 'pak/oogame/oogamebattle.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamebattle.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogameband.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogameband.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamevs.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamevs.pak' Heap = <Heap>
		elseif ispakloaded 'pak/oogame/oogamerb.pak' Heap = <Heap>
			UnLoadPak 'pak/oogame/oogamerb.pak' Heap = <Heap>
		endif
		if NOT ispakloaded 'pak/oogame/oogame.pak' Heap = <Heap>
			LoadPak 'pak/oogame/oogame.pak' Heap = <Heap>
		endif
	endif
	wii_timer_stop \{label = 'oogame'}
	getfirstplayer
	getplayerinfo <Player> difficulty
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	printf qs(0x5f297a5b) s = <song> d = <difficulty>
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	yield
	Change \{structurename = musician1_info
		stance = Stance_A}
	Change \{structurename = musician1_info
		next_stance = Stance_A}
	Change \{structurename = musician1_info
		current_anim = Idle}
	Change \{structurename = musician1_info
		cycle_anim = true}
	Change \{structurename = musician1_info
		next_anim = None}
	Change \{structurename = musician1_info
		playing_missed_note = FALSE}
	yield
	Change \{structurename = musician2_info
		stance = Stance_A}
	Change \{structurename = musician2_info
		next_stance = Stance_A}
	Change \{structurename = musician2_info
		current_anim = Idle}
	Change \{structurename = musician2_info
		cycle_anim = true}
	Change \{structurename = musician2_info
		next_anim = None}
	Change \{structurename = musician2_info
		playing_missed_note = FALSE}
	yield
	Change \{structurename = musician3_info
		stance = Stance_A}
	Change \{structurename = musician3_info
		next_stance = Stance_A}
	Change \{structurename = musician3_info
		current_anim = Idle}
	Change \{structurename = musician3_info
		cycle_anim = true}
	Change \{structurename = musician3_info
		next_anim = None}
	Change \{structurename = musician3_info
		playing_missed_note = FALSE}
	yield
	Change \{structurename = musician4_info
		stance = Stance_A}
	Change \{structurename = musician4_info
		next_stance = Stance_A}
	Change \{structurename = musician4_info
		current_anim = Idle}
	Change \{structurename = musician4_info
		cycle_anim = true}
	Change \{structurename = musician4_info
		next_anim = None}
	Change \{structurename = musician4_info
		playing_missed_note = FALSE}
	yield
	if ($game_mode = freeplay)
		bandmanager_allchangestance \{stance = Stance_A
			no_wait}
	endif
	reset_score \{Player = 1}
	reset_score \{Player = 2}
	reset_score \{Player = 3}
	reset_score \{Player = 4}
	resetbandinfo
	yield \{'reset_score'}
	loaded_gems = 0
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> difficulty
		yield
		getplayerinfo <Player> is_onscreen out = player_on_screen
		setplayerinfo <Player> guitar_volume = 100
		setplayerinfo <Player> drum_volume1 = 100
		setplayerinfo <Player> drum_volume2 = 100
		setplayerinfo <Player> drum_volume3 = 100
		setplayerinfo <Player> drum_volume4 = 100
		if (<player_on_screen> = 1)
			UpdateGuitarVolume
		endif
		yield
		GetGlobalTags \{user_options}
		guitar_init_lefty_highway Player = <Player>
		yield
		getplayerinfo <Player> controller
		get_resting_whammy_position controller = <controller>
		if GotParam \{resting_whammy_position}
			setplayerinfo <Player> resting_whammy_position = <resting_whammy_position>
		endif
		get_star_power_position controller = <controller>
		if GotParam \{star_power_position}
			setplayerinfo <Player> star_tilt_threshold = <star_power_position>
		endif
		yield
		if ($output_gpu_log = 1)
			TextOutputStart
		endif
		yield
		if (($tutorial_disable_hud = 0))
			crowd_reset <...>
		endif
		yield \{'crowd_reset'}
		star_power_reset <...>
		yield
		getplayerinfo <Player> cheat_hyperspeed_value
		setplayerinfo <Player> Hyperspeed = <cheat_hyperspeed_value>
		wii_timer_start \{label = 'gems'}
		if ((<loaded_gems> = 0) && ((<restarting> = 0) || ($is_network_game = 1)))
			<loaded_gems> = 1
			load_gempaks Heap = <Heap>
		endif
		wii_timer_stop \{label = 'gems'}
		yield
		difficulty_setup Player = <Player> difficulty = <difficulty>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript
g_system_name = [
	venue
	Band
	Crowd
	Camera
]
g_system_status = [
	OFF
	OFF
	OFF
	OFF
]
use_old_system_setup = 1

script dump_system_status 
	GetArraySize \{$g_system_name}
	system_array_size = <array_Size>
	printf \{channel = system
		qs(0xaa9ecf0f)}
	printf channel = system qs(0x928e7026) a = <system_array_size>
	printf \{channel = system
		qs(0xaa9ecf0f)}
	s = 0
	begin
	<Name> = ($g_system_name [<s>])
	<status> = ($g_system_status [<s>])
	printf channel = system qs(0xf5416043) a = <Name> b = <status>
	<s> = (<s> + 1)
	repeat <system_array_size>
	printf \{channel = system
		qs(0xaa9ecf0f)}
endscript

script update_gameplay_systems 
	printstruct <...>
	switch (<base_name>)
		case 'options_cheats_warning'
		case 'signin'
		case 'signin_warning'
		case 'signin_complete'
		case 'signin_changed'
		case 'connection_loss'
		case 'mainmenu'
		case 'options'
		case 'options_cheats'
		case 'options_cheats_new'
		case 'top_rockers_mode'
		case 'leaderboard'
		case 'leaderboard_instrument'
		case 'leaderboard_difficulty'
		if ($stageshow_system_enabled = FALSE)
			stageshow_system_init
		endif
		default
		if ($stageshow_system_enabled = true)
			stageshow_system_deinit
		endif
	endswitch
endscript

script band_system_init 
	if ($use_old_system_setup = 0)
		guitar_support_init_band \{async = 0}
	endif
endscript

script band_system_deinit 
endscript

script venue_system_init 
	Load_Venue \{block_scripts = 1}
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
stageshow_system_enabled = FALSE

script stageshow_system_init 
	Change \{stageshow_system_enabled = true}
	KillSpawnedScript \{Name = menu_lightshow}
	SpawnScriptNow \{menu_lightshow}
	LightShow_InitEventMappings
	lightshow_dummyloop
	SpawnScriptNow \{reset_mainmenu_camera}
	prepare_band_for_main_menu
endscript

script stageshow_system_deinit 
	Change \{stageshow_system_enabled = FALSE}
	KillSpawnedScript \{Name = menu_lightshow}
	lightshow_notingameplay_setmood \{mood = band_lobby}
endscript
