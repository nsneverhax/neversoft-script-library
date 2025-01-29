
script guitar_support_init_crowd 
	create_crowd_models
	Crowd_StageDiver_Hide
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
			wii_timer_start \{label = 'band'}
			prepare_for_pending_animpaks
			if ($game_mode = freeplay)
				persistent_band_prepare_for_song \{async = 1}
			else
				persistent_band_prepare_for_song async = <async>
			endif
			wii_timer_stop \{label = 'band'}
			yield \{'create_band2'}
		endif
		yield
	endif
	band_clearanimtempo
	yield
endscript
load_song_synchronous = true

script guitar_support_load_song 
	audience_party_update_dlc
	wii_timer_start \{label = 'song_qpak1'}
	if NOT load_songqpak song_name = <song> async = 1 noanims
		return FALSE error_text = <error_text>
	endif
	wii_timer_stop \{label = 'song_qpak1'}
	yield \{'SongAudioLoad'}
	if NOT (<song> = jamsession)
		wii_timer_start \{label = 'sfx_drumkit2'}
		drum_kit_index = 0
		get_song_drum_kit_index song = <song>
		Change jam_current_drum_kit = <drum_kit_index>
		yield \{'LoadDrumKitAll'}
		loaddrumkitall percussion = 0 song = <song> async = 1
		wii_timer_stop \{label = 'sfx_drumkit2'}
		yield \{'SongAudioInit'}
		songaudioinit
		yield \{'SongAudioInit2'}
		wii_timer_start \{label = 'song_audio'}
		if ($load_song_synchronous = true)
			songaudioload song_name = <song> starttime = <song_start_time>
			Change \{load_song_synchronous = FALSE}
		else
			SpawnScriptNow songaudioload params = {song_name = <song> starttime = <song_start_time>}
		endif
		wii_timer_stop \{label = 'song_audio'}
	else
		printf \{chanel = sfx
			qs(0xada742c0)}
		AppendSuffixToChecksum Base = ($SFX_Background_Current_Checksum) SuffixString = '_BK'
		backchecksumname = <appended_id>
		stopsound <backchecksumname> time = 0.5
		printf \{chanel = sfx
			qs(0x801b851e)}
		Change \{g_crowd_in_jam_mode_song_state = 1}
		printf \{chanel = sfx
			qs(0x359bd552)}
		One_Shot_SoundEvent \{SoundEvent = audio_crowd_oneshots_do_nothing
			waitTime = 5
			immediate = 1}
	endif
	yield \{'SongAudioLoad final'}
	cache_song_end_time
	yield
	if (<song> = jamsession)
		getsonginfo
		GetArraySize \{$drum_kits}
		if ((<drum_kit> >= <array_Size>) || (<drum_kit> < 0))
			<drum_kit> = 0
		endif
		Change jam_current_drum_kit = <drum_kit>
		Change jam_current_percussion_kit = <percussion_kit>
		loaddrumkitall \{async = 0}
		musicstudio_instrument_loadall
	else
	endif
	yield \{'LoadDrumKitAll'}
	wii_timer_stop \{label = 'sfx'}
	yield \{'LoadDrumKitAll'}
	return \{true}
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
	yield \{'setup_bg_viewport2'}
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
	yield
endscript

script guitar_support_init_audio 
	audio_effects_song_quiet_reset_sfx_balance restarting = <restarting> loading_transition = <loading_transition>
	audio_crowd_adjust_loop_to_default restarting = <restarting>
	yield
	wii_timer_start \{label = 'sfx'}
	wii_load_crowd_sfx
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
endscript

script guitar_init_lefty_highway 
	getplayerinfo <Player> lefty_flip
	setplayerinfo <Player> lefthanded_gems = <lefty_flip>
	setplayerinfo <Player> lefthanded_button_ups = <lefty_flip>
	setplayerinfo <Player> lefthanded_gems_flip_save = <lefty_flip>
	setplayerinfo <Player> lefthanded_button_ups_flip_save = <lefty_flip>
endscript

script reset_all_player_scores 
	reset_score \{Player = 1}
	reset_score \{Player = 2}
	reset_score \{Player = 3}
	reset_score \{Player = 4}
	<Player> = 5
	begin
	formatText checksumName = detailstats_array 'p%s_last_song_detailed_stats' s = <Player>
	setplayerinfo <Player> current_detailedstats_array_entry = 0
	setplayerinfo <Player> current_detailedstats_array = <detailstats_array>
	formatText checksumName = detailstats_array_max 'p%s_last_song_detailed_stats_max' s = <Player>
	setplayerinfo <Player> current_detailedstats_max_array = <detailstats_array_max>
	SetArrayElement ArrayName = <detailstats_array> globalarray all NewValue = 0
	SetArrayElement ArrayName = <detailstats_array_max> globalarray all NewValue = 0
	<Player> = (<Player> + 1)
	repeat 4
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
	Progression_SetProgressionNodeFlags
	yield \{'Nodeflags'}
	get_current_songs_struct
	if playerinfoequals \{1
			bot_play = 1}
		setupbotcontroller \{Player = 1}
	endif
	getplayerinfo \{2
		bot_play}
	getplayerinfo \{2
		is_local_client}
	if ((1 = <bot_play>) || (0 = <is_local_client>))
		setupbotcontroller \{Player = 2}
	endif
	getplayerinfo \{3
		bot_play}
	getplayerinfo \{3
		is_local_client}
	if ((1 = <bot_play>) || (0 = <is_local_client>))
		setupbotcontroller \{Player = 3}
	endif
	getplayerinfo \{4
		bot_play}
	getplayerinfo \{4
		is_local_client}
	if ((1 = <bot_play>) || (0 = <is_local_client>))
		setupbotcontroller \{Player = 4}
	endif
	yield
	load_game_pak Heap = <Heap>
	getfirstplayer
	getplayerinfo <Player> difficulty
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
	reset_all_player_scores
	apply_scoring_attributes_for_players
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
		if ($end_credits = 0)
			crowd_reset <...>
		endif
		yield \{'crowd_reset'}
		star_power_reset Player = <Player>
		yield
		getplayerinfo <Player> cheat_hyperspeed_value
		printf qs(0x1445965d) p = <Player> h = <cheat_hyperspeed_value>
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
	stageshow
	musicmonitor
]
g_system_status = [
	OFF
	OFF
	OFF
	OFF
	OFF
	OFF
]

script set_game_system_status 
	GetArraySize \{$g_system_name}
	<ii> = 0
	begin
	if (<system> = (($g_system_name) [<ii>]))
		SetArrayElement ArrayName = g_system_status globalarray index = <ii> NewValue = <state>
	endif
	<ii> = (<ii> + 1)
	repeat <array_Size>
endscript

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
	printf \{channel = system
		qs(0xaa9ecf0f)}
	printf channel = system qs(0xcba463f0) a = <base_name>
	<status_changed> = 0
	if GotParam \{systems}
		GetArraySize \{$g_system_name}
		system_array_size = <array_Size>
		s = 0
		begin
		<Name> = ($g_system_name [<s>])
		<required_status> = OFF
		GetArraySize <systems>
		i = 0
		begin
		active_name = (<systems> [<i>])
		if (<active_name> = <Name>)
			<required_status> = On
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		<actual_status> = ($g_system_status [<s>])
		if NOT (<actual_status> = <required_status>)
			SetArrayElement ArrayName = g_system_status globalarray index = <s> NewValue = <required_status>
			<status_changed> = 1
			if (<required_status> = On)
				ExtendCrc <Name> '_system_init' out = init_script
				printf channel = system qs(0x16ec897a) a = <Name>
				if ScriptExists <init_script>
					<init_script>
				endif
			else
				ExtendCrc <Name> '_system_deinit' out = deinit_script
				printf channel = system qs(0x2506b6d9) a = <Name>
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
endscript

script band_system_deinit 
endscript

script venue_system_init \{block_scripts = 1}
	pushunsafeforshutdown \{context = venue_system_init}
	Load_Venue block_scripts = <block_scripts>
	popunsafeforshutdown \{context = venue_system_init}
endscript

script venue_system_deinit 
endscript

script crowd_system_init 
	if ($game_mode != practice && $game_mode != tutorial)
		guitar_support_init_crowd
	endif
endscript

script crowd_system_deinit 
	destroy_crowd_models
endscript

script musicmonitor_system_init 
endscript

script musicmonitor_system_deinit 
endscript

script stageshow_system_init 
	KillSpawnedScript \{Name = menu_lightshow}
	SpawnScriptNow \{menu_lightshow}
	LightShow_InitEventMappings
	lightshow_dummyloop
	SpawnScriptNow \{reset_mainmenu_camera}
	prepare_band_for_main_menu
endscript

script stageshow_system_deinit 
	KillSpawnedScript \{Name = menu_lightshow}
	lightshow_notingameplay_setmood \{mood = band_lobby}
endscript
