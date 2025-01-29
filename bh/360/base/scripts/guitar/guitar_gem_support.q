
script guitar_support_init_crowd 
	create_crowd_models
	Crowd_StageDiver_Hide
endscript

script guitar_support_load_anims 
	if ($use_old_system_setup = 1)
		anim_paks_set_state state = <state>
	endif
	Yield
endscript

script guitar_support_init_band \{async = 1}
	if ($use_old_system_setup = 1)
		create_all_camera_lock_targets
		if ((<loading_transition> = 0) || $game_mode = freeplay)
			Yield \{'create_all_camera_lock_targets'}
			if ($game_mode != tutorial && $calibrate_lag_enabled = 0 && $game_mode != practice)
				Yield
				prepare_for_pending_animpaks
				if ($game_mode = freeplay)
					persistent_band_prepare_for_song \{async = 1}
				else
					persistent_band_prepare_for_song async = <async>
				endif
				Yield \{'create_band2'}
			endif
			Yield
			Yield
			Yield
		endif
		Band_ClearAnimTempo
		Yield
	else
		cas_destroy_all_characters
		create_all_camera_lock_targets
		if ($game_mode != tutorial)
			persistent_band_prepare_for_song async = <async>
		endif
		Band_ClearAnimTempo
	endif
endscript
load_song_synchronous = true

script guitar_support_load_song 
	load_songqpak song_name = <song> async = 1
	if NOT (<song> = jamsession)
		if ($notetracker_quickplay_active = 0)
			drum_kit_index = 0
			get_song_drum_kit_index song = <song>
			Change jam_current_drum_kit = <drum_kit_index>
			LoadDrumKitAll percussion = 0 song = <song> async = 1
		endif
		InitSongAudioSystem
		if ($load_song_synchronous = true)
			preload_song song_name = <song> starttime = <song_start_time>
			Change \{load_song_synchronous = false}
		else
			spawnscriptnow preload_song params = {song_name = <song> starttime = <song_start_time>}
		endif
	else
		printf \{chanel = sfx
			qs(0xada742c0)}
		AppendSuffixToChecksum base = ($SFX_Background_current_Checksum) SuffixString = '_BK'
		backchecksumname = <appended_id>
		StopSound <backchecksumname> time = 0.5
		printf \{chanel = sfx
			qs(0x01013a15)}
		Change \{crowd_in_jam_mode_song_state = 1}
		printf \{chanel = sfx
			qs(0x359bd552)}
		One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot
			waittime = 5
			immediate = 1}
		if notetracker_is_using_stream
			preload_mp3_song
		endif
	endif
	Yield \{'preload_song'}
	cache_song_end_time
	Yield
	if ($notetracker_quickplay_active = 0)
		if (<song> = jamsession)
			GetSongInfo
			GetArraySize \{$drum_kits}
			if ((<drum_kit> >= <array_size>) || (<drum_kit> < 0))
				<drum_kit> = 0
			endif
			Change jam_current_drum_kit = <drum_kit>
			Change jam_current_percussion_kit = <percussion_kit>
			LoadDrumKitAll \{async = 1}
			if NOT notetracker_is_using_stream
				MusicStudio_Instrument_LoadAll {
					keyboard_index = <keyboard_sound>
					guitar_index = <guitar_sound>
					bass_index = <bass_sound>
				}
				if GotParam \{bass_kit}
					GetArraySize \{$pause_bass_kit_options}
					if ((<bass_kit> >= <array_size>) || (<bass_kit> < 0))
						<bass_kit> = 0
					endif
					Change bass_kit_mode = <bass_kit>
					LoadBassKit bass_kit = <bass_kit>
				else
					SetSongInfo \{bass_kit = 0}
					Change \{bass_kit_mode = 0}
				endif
			endif
		else
		endif
		Yield \{'LoadDrumKitAll'}
	endif
endscript

script guitar_support_load_hud 
	if (<loading_transition> = 0)
		setup_bg_viewport
		KillCamAnim \{all}
		if ($game_mode = freeplay)
			StopRendering
		endif
		create_cameracuts <...> in_game = 1
	else
	endif
	Yield \{'setup_bg_viewport2'}
	if ($debug_showmeasures = on)
		toggle_showmeasures \{for_autolaunch}
		toggle_showmeasures \{for_autolaunch}
		debug_measures_text :SE_SetProps \{unhide
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
		debug_songstars_text :SE_SetProps \{unhide
			text = qs(0xfbf320c8)}
	endif
	Yield
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
	Song_Quiet_Reset_SFX_Balance restarting = <restarting> loading_transition = <loading_transition>
	GH3_AdjustCrowdLoopBackToDefault restarting = <restarting>
	Yield
	GameEvent_VenueEnter
	GuitarEvent_VenueEnter
endscript

script guitar_support_init_venue 
	if (<loading_transition> = 0)
		if ($game_mode != tutorial)
			if NOT ($game_mode = practice)
				apply_band_logo_to_venue \{step = build}
			endif
		endif
		Yield \{'apply_band_logo_to_venue'}
	endif
	Change \{lightshow_allow_mood_changes = true}
	Change \{lightshow_last_mood_requested = None}
	Yield
endscript

script guitar_init_lefty_highway 
	GetPlayerInfo <player> lefty_flip
	SetPlayerInfo <player> lefthanded_gems = <lefty_flip>
	SetPlayerInfo <player> lefthanded_button_ups = <lefty_flip>
endscript

script guitar_support_init_players 
	SetPlayerInfo \{1
		bot_pattern = 0}
	SetPlayerInfo \{2
		bot_pattern = 0}
	SetPlayerInfo \{3
		bot_pattern = 0}
	SetPlayerInfo \{4
		bot_pattern = 0}
	SetPlayerInfo \{1
		bot_strum = 0}
	SetPlayerInfo \{2
		bot_strum = 0}
	SetPlayerInfo \{3
		bot_strum = 0}
	SetPlayerInfo \{4
		bot_strum = 0}
	GameMode_GetType
	if (<type> != freeplay)
		SetPlayerInfo \{1
			interactive = 1}
		SetPlayerInfo \{2
			interactive = 1}
		SetPlayerInfo \{3
			interactive = 1}
		SetPlayerInfo \{4
			interactive = 1}
		SetPlayerInfo \{1
			last_noninteractive_end_time = -1.0}
		SetPlayerInfo \{2
			last_noninteractive_end_time = -1.0}
		SetPlayerInfo \{3
			last_noninteractive_end_time = -1.0}
		SetPlayerInfo \{4
			last_noninteractive_end_time = -1.0}
		SetPlayerInfo \{1
			scoring = 1}
		SetPlayerInfo \{2
			scoring = 1}
		SetPlayerInfo \{3
			scoring = 1}
		SetPlayerInfo \{4
			scoring = 1}
	endif
	Yield
	tap_prototype_off
	init_play_log
	Yield
	Progression_SetProgressionNodeFlags
	Yield \{'Nodeflags'}
	get_current_songs_struct
	GetPlayerInfo \{2
		bot_play}
	GetPlayerInfo \{2
		is_local_client}
	if ((<bot_play> = 1) || (<is_local_client> = 0))
		GetPlayerInfo \{2
			controller}
		setup_bot_controller \{player = 2}
		printf \{channel = log
			qs(0xb7d6cb93)}
	endif
	if PlayerInfoEquals \{1
			bot_play = 1}
		setup_bot_controller \{player = 1}
		printf \{channel = log
			qs(0x9cfb9850)}
	endif
	GetPlayerInfo \{3
		bot_play}
	GetPlayerInfo \{3
		is_local_client}
	if ((<bot_play> = 1) || (<is_local_client> = 0))
		setup_bot_controller \{player = 3}
		printf \{channel = log
			qs(0xaecdfad2)}
	endif
	GetPlayerInfo \{4
		bot_play}
	GetPlayerInfo \{4
		is_local_client}
	if ((<bot_play> = 1) || (<is_local_client> = 0))
		setup_bot_controller \{player = 4}
		printf \{channel = log
			qs(0xe18c6c15)}
	endif
	Yield
	GetFirstPlayer
	GetPlayerInfo <player> difficulty
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	printf qs(0x5f297a5b) s = <song> d = <difficulty>
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	printf \{qs(0x1157f54a)}
	Yield
	Change \{structurename = musician1_info
		stance = stance_a}
	Change \{structurename = musician1_info
		next_stance = stance_a}
	Change \{structurename = musician1_info
		current_anim = Idle}
	Change \{structurename = musician1_info
		cycle_anim = true}
	Change \{structurename = musician1_info
		next_anim = None}
	Change \{structurename = musician1_info
		playing_missed_note = false}
	Yield
	Change \{structurename = musician2_info
		stance = stance_a}
	Change \{structurename = musician2_info
		next_stance = stance_a}
	Change \{structurename = musician2_info
		current_anim = Idle}
	Change \{structurename = musician2_info
		cycle_anim = true}
	Change \{structurename = musician2_info
		next_anim = None}
	Change \{structurename = musician2_info
		playing_missed_note = false}
	Yield
	Change \{structurename = musician3_info
		stance = stance_a}
	Change \{structurename = musician3_info
		next_stance = stance_a}
	Change \{structurename = musician3_info
		current_anim = Idle}
	Change \{structurename = musician3_info
		cycle_anim = true}
	Change \{structurename = musician3_info
		next_anim = None}
	Change \{structurename = musician3_info
		playing_missed_note = false}
	Yield
	Change \{structurename = musician4_info
		stance = stance_a}
	Change \{structurename = musician4_info
		next_stance = stance_a}
	Change \{structurename = musician4_info
		current_anim = Idle}
	Change \{structurename = musician4_info
		cycle_anim = true}
	Change \{structurename = musician4_info
		next_anim = None}
	Change \{structurename = musician4_info
		playing_missed_note = false}
	Yield
	reset_score \{player = 1}
	reset_score \{player = 2}
	reset_score \{player = 3}
	reset_score \{player = 4}
	ResetBandInfo
	Yield \{'reset_score'}
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> difficulty
		Yield
		GetPlayerInfo <player> is_onscreen out = player_on_screen
		SetPlayerInfo <player> guitar_volume = 100
		SetPlayerInfo <player> drum_volume1 = 100
		SetPlayerInfo <player> drum_volume2 = 100
		SetPlayerInfo <player> drum_volume3 = 100
		SetPlayerInfo <player> drum_volume4 = 100
		if (<player_on_screen> = 1)
			UpdateGuitarVolume
		endif
		Yield
		GetGlobalTags \{user_options}
		guitar_init_lefty_highway player = <player>
		Yield
		GetPlayerInfo <player> controller
		get_resting_whammy_position controller = <controller>
		if GotParam \{resting_whammy_position}
			SetPlayerInfo <player> resting_whammy_position = <resting_whammy_position>
		endif
		get_star_power_position controller = <controller>
		if GotParam \{star_power_position}
			SetPlayerInfo <player> star_tilt_threshold = <star_power_position>
		endif
		Yield
		if ($output_gpu_log = 1)
			TextOutputStart
		endif
		Yield
		if (($tutorial_disable_hud = 0) && ($end_credits = 0))
			crowd_reset <...>
		endif
		Yield \{'crowd_reset'}
		star_power_reset player = <player>
		Yield
		GetPlayerInfo <player> Cheat_HyperSpeed_Value
		SetPlayerInfo <player> hyperspeed = <Cheat_HyperSpeed_Value>
		Yield
		difficulty_setup player = <player> difficulty = <difficulty>
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript
g_system_name = [
	venue
	Band
	Crowd
	Camera
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
	GetArraySize \{$g_system_name}
	<ii> = 0
	begin
	if (<system> = (($g_system_name) [<ii>]))
		SetArrayElement arrayName = g_system_status GlobalArray index = <ii> newValue = <state>
	endif
	<ii> = (<ii> + 1)
	repeat <array_size>
endscript
use_old_system_setup = 1

script dump_system_status 
	GetArraySize \{$g_system_name}
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
	if GotParam \{systems}
		GetArraySize \{$g_system_name}
		system_array_size = <array_size>
		s = 0
		begin
		<name> = ($g_system_name [<s>])
		<required_status> = off
		GetArraySize <systems>
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
			SetArrayElement arrayName = g_system_status GlobalArray index = <s> newValue = <required_status>
			<status_changed> = 1
			if (<required_status> = on)
				ExtendCrc <name> '_system_init' out = init_script
				printf channel = system qs(0x16ec897a) a = <name>
				if ScriptExists <init_script>
					<init_script>
				endif
			else
				ExtendCrc <name> '_system_deinit' out = deinit_script
				printf channel = system qs(0x2506b6d9) a = <name>
				if ScriptExists <deinit_script>
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
	Destroy_Crowd_Models
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
	LightShow_InitEventMappings
	LightShow_DummyLoop
	spawnscriptnow \{reset_mainmenu_camera}
	prepare_band_for_main_menu
endscript

script stageshow_system_deinit 
	killspawnedscript \{name = menu_lightshow}
	LightShow_NotInGamePlay_SetMood \{mood = Band_Lobby}
endscript
