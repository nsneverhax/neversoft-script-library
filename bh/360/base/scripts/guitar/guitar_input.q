button_values = [
	65536
	4096
	256
	16
	1
	0
]
hammer_on_measure_scale = 0
p1_star_ready = 0
p2_star_ready = 0
p3_star_ready = 0
p4_star_ready = 0
g_revert_p1_bot_to_off = 0
g_revert_p2_bot_to_off = 0
g_revert_p3_bot_to_off = 0
g_revert_p4_bot_to_off = 0
botresponse_hitpercentp1 = 1.0
botresponse_hitpercentp2 = 1.0
botresponse_hitpercentp3 = 1.0
botresponse_hitpercentp4 = 1.0

script setup_bot_controller 
	GetInputHandlerBotIndex player = <player>
	GetPlayerInfo <player> controller out = player_controller
	if NOT (<controller> = <player_controller>)
		SetPlayerInfo <player> bot_original_controller = <player_controller>
		SetPlayerInfo <player> controller = <controller>
	endif
endscript

script bot_star_power \{player = 1}
	SetPlayerInfo <player> bot_star_power = 1
endscript

script strip_single_note_strum 
	stripped_strum = <pattern>
	if (<required_pattern> && 4096)
		<stripped_strum> = (<pattern> && 4369)
	endif
	if (<required_pattern> && 256)
		<stripped_strum> = (<pattern> && 273)
	endif
	if (<required_pattern> && 16)
		<stripped_strum> = (<pattern> && 17)
	endif
	if (<required_pattern> && 1)
		<stripped_strum> = (<pattern> && 1)
	endif
	return stripped_strum = <stripped_strum>
endscript
button_up_pixel_arrayp1 = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
button_up_pixel_arrayp2 = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
button_up_pixel_arrayp3 = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
button_up_pixel_arrayp4 = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]

script button_checker 
	ButtonCheckerInit <...>
	begin
	ButtonCheckerPerFrame
	if ($display_debug_input = 1)
		input_debug <...>
	endif
	wait \{1
		gameframe}
	repeat
	ButtonCheckerCleanup
endscript
currently_holding = [
	0
	0
	0
	0
	0
]

script single_note 
	if (<pattern> = 65536)
		return \{true}
	endif
	if (<pattern> = 4096)
		return \{true}
	endif
	if (<pattern> = 256)
		return \{true}
	endif
	if (<pattern> = 16)
		return \{true}
	endif
	if (<pattern> = 1)
		return \{true}
	endif
	return \{false}
endscript

script check_for_star_power 
	check_for_star_power_cfunc_setup
	begin
	if check_for_star_power_cfunc
		break
	else
		if GotParam \{ScriptToRun}
			<ScriptToRun> <ScriptToRun_Params>
		else
			wait \{1
				gameframe}
		endif
	endif
	repeat
	check_for_star_power_cfunc_cleanup
endscript

script print_guitar_analogue_info 
	GuitarGetAnalogueInfo controller = ($primary_controller)
	printstruct <...>
endscript

script wait_for_inactive 
	SetPlayerInfo <player> star_power_usable = 0
	<frames_under> = 0
	GetPlayerInfo <player> controller
	if isguitarcontroller controller = <controller>
		if (<guitar_used_select> = 0)
			begin
			wait \{1
				gameframe}
			if GuitarGetAnalogueInfo controller = <controller>
				GetPlayerInfo <player> star_tilt_threshold
				if (<RightY> > <star_tilt_threshold>)
					Increment \{frames_under}
					if (<frames_under> >= 30)
						break
					endif
				endif
			endif
			repeat 60
		else
			<guitar_used_select> = 0
		endif
	endif
	SetPlayerInfo <player> star_power_usable = 1
endscript

script star_power_activate_and_drain 
	set_combo_meter_sp_meter_blue_alpha player = <player> alpha = 1.0
	if ((GameMode_IsBandScoring) && (($use_star_power_prototype) = 0))
		GetPlayerInfo <player> Band
		GetBandInfo <Band> star_power_amount
		band_power = <star_power_amount>
		star_usage = (100.0 / 6.0)
		if ($is_network_game = 0)
			if (<band_power> < <star_usage>)
				return
			endif
			band_power = (<band_power> - <star_usage>)
			SetBandInfo <Band> star_power_amount = <band_power>
		endif
		star_power_activate <...>
		star_power_boost_other_band_members {player = <player> Band = <Band>}
		GetPlayerInfo <player> playline_song_measure_time
		initial_power_time = ((<playline_song_measure_time> * 50.0) / $star_power_drain_rate)
		power_time = <initial_power_time>
		begin
		wait \{1
			gameframe}
		GetFrameLength
		power_time = (<power_time> - (1000.0 * <frame_length>))
		drain = (-1 * (((1000.0 * <frame_length>) / <initial_power_time>) * <star_usage>))
		AddToBandInfo <Band> star_power_display_amount = <drain>
		GetBandInfo <Band> star_power_display_amount
		if (<star_power_display_amount> <= 0)
			SetBandInfo <Band> star_power_display_amount = 0.0
		endif
		if NOT GotParam \{infinite_drain}
			if (<power_time> <= 0)
				break
			endif
		endif
		repeat
	else
		star_power_activate <...>
		begin
		wait \{1
			gameframe}
		if ($drum_solo_songtime_paused = 0)
			SetPlayerInfo <player> star_power_used = 1
			if ($game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
				GetPlayerInfo <player> playline_song_measure_time
				if (<playline_song_measure_time> = 0)
					drain = 0
				else
					drain = ($star_power_drain_rate_coop * 1000.0 * ($current_deltatime / <playline_song_measure_time>))
				endif
			else
				GetPlayerInfo <player> playline_song_measure_time
				if (<playline_song_measure_time> = 0)
					drain = 0
				else
					drain = ($star_power_drain_rate * 1000.0 * ($current_deltatime / <playline_song_measure_time>))
				endif
			endif
			GetPlayerInfo <player> star_power_amount
			<star_power_amount> = (<star_power_amount> - <drain>)
			SetPlayerInfo <player> star_power_amount = <star_power_amount>
			if (<star_power_amount> < 50.0)
				if (<star_power_amount> + <drain> >= 50.0)
					broadcastevent \{type = starpower_bulbs_hide}
				endif
			endif
			if (<star_power_amount> <= 0.0)
				SetPlayerInfo <player> star_power_amount = 0.0
				break
			endif
		else
			SetPlayerInfo <player> star_power_used = 0
		endif
		repeat
	endif
	if PlayerInfoEquals <player> controller = ($primary_controller)
		Change gStar_Power_Triggered = ($gStar_Power_Triggered + 1)
	endif
	star_power_deactivate <...>
	set_combo_meter_sp_meter_blue_alpha player = <player> alpha = 0.0
	<do_star> = 0
	return <...>
endscript

script star_power_activate 
	if NOT GotParam \{drumfill}
		SetPlayerInfo <player> star_power_used = 1
	endif
	GetPlayerInfo <player> score
	SetPlayerInfo <player> sp_points = <score>
	spawnscriptnow hud_activated_star_power params = {player = <player>}
	wait \{1
		gameframe}
	if NOT GotParam \{drumfill}
		LaunchGemEvent event = star_power_on player = <player>
		GetPlayerInfo <player> part
		if (<part> != vocals)
			spawnscriptnow Create_Highway_Star_Power_Effect params = {player = <player>}
		else
			GameMode_GetType
			if (<type> = freeplay)
				freeplay_vocals_activate_star_power player = <player>
			else
				vocals_activate_star_power player = <player>
			endif
		endif
		BandManager_StarPowerOn player = <player>
	endif
	ExtendCrcPlayer star_power_on <player> out = type
	broadcastevent type = <type> data = {player = <player>}
endscript

script star_power_deactivate 
	if NOT GotParam \{drumfill}
		SetPlayerInfo <player> star_power_used = 0
	endif
	GameMode_GetType
	if ((<type> = career) || (<type> = quickplay))
		ach_sp_points_test player = <player>
	endif
	if PlayerInfoEquals <player> is_local_client = 0
		SetUpdateIgnoreCount player = <player>
	endif
	UpdateNixie player = <player>
	wait \{1
		gameframe}
	if NOT GotParam \{drumfill}
		LaunchGemEvent event = star_power_off player = <player>
		GetPlayerInfo <player> part
		if (<part> != vocals)
			spawnscriptnow Kill_Highway_Star_Power_Effect params = {player = <player>}
		else
			GameMode_GetType
			if (<type> = freeplay)
				freeplay_vocals_deactivate_star_power player = <player>
			else
				vocals_deactivate_star_power player = <player>
			endif
		endif
	endif
	ExtendCrcPlayer star_power_off <player> out = type
	broadcastevent type = <type> data = {player = <player>}
endscript

script star_power_kill_highway_fx_immedately \{player = -1}
	FormatText checksumname = namer2 'sidebar_Right2_SPGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namer2>
	FormatText checksumname = namel2 'sidebar_Left2_SPGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namel2>
	FormatText checksumname = namec 'sidebar_Center_SPRushp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namec>
	FormatText checksumname = NameVb2 'Vocals_Top_SPGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <NameVb2>
	FormatText checksumname = NameVt2 'Vocals_Top_SPGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <NameVt2>
	GuitarEvent_StarPowerOff player = <player> no_sound = true
endscript

script star_power_boost_other_band_members 
	booster_band = <Band>
	GetMaxLocalPlayers
	p = 1
	begin
	if NOT (<p> = <player>)
		GetPlayerInfo <p> Band
		if (<Band> = <booster_band>)
			GetPlayerInfo <p> current_health
			if (<current_health> < 1.0)
				mult = (1.0 - <current_health>)
				current_health = (<current_health> + ($band_max_star_power_health_boost * <mult>))
				SetPlayerInfo <p> current_health = <current_health>
			endif
		endif
	endif
	p = (<p> + 1)
	repeat <max_players>
endscript

script reset_whammy_pitchshift 
	set_whammy_pitchshift control = 0.0 player = <player>
	SetAllWhammyValues value = 1.0 player = <player>
endscript

script record_input 
	if GameIsPaused
		return
	endif
	if NOT are_replays_enabled
		return
	endif
	GetDeltaTime
	DataBufferPutFloat name = replay value = <delta_time>
	RecordInput \{name = replay}
endscript

script playback_timer 
	if ($replay_suspend = 1)
		return
	endif
	if GameIsPaused
		return
	endif
	if NOT are_replays_enabled
		return
	endif
	if DataBufferGetFloat \{name = replay}
		SetDeltaTime delta_time = <float>
	endif
endscript

script save_replay 
	if NOT are_replays_enabled
		return
	endif
	destroy_debugging_menu
	CreateScreenElement \{type = TextElement
		parent = root_window
		id = info_text
		font = debug
		Pos = (640.0, 32.0)
		just = [
			center
			top
		]
		scale = 1.0
		rgba = [
			210
			210
			210
			250
		]
		text = qs(0x153fc55f)
		z_priority = 1.0}
	wait \{2
		gameframes}
	GetFirstPlayer
	GetPlayerInfo <player> difficulty
	get_difficulty_text_nl difficulty = <difficulty>
	GMan_SongTool_GetCurrentSong
	get_song_prefix song = <current_song>
	FormatText TextName = FileName qs(0x87b34504) s = <song_prefix> d = <difficulty_text_nl>
	WriteDataBuffer name = replay FileName = <FileName>
	DestroyScreenElement \{id = info_text}
	create_debugging_menu
endscript
resting_whammy_tolerance = 0.1

script is_whammy_resting 
	if GotParam \{controller}
		get_resting_whammy_position <...>
	else
		GetPlayerInfo <player> controller
		GetPlayerInfo <player> resting_whammy_position
	endif
	if GuitarGetAnalogueInfo controller = <controller>
		if (<rightx> < <resting_whammy_position>)
			return \{true}
		elseif ((<rightx> - <resting_whammy_position>) < ($resting_whammy_tolerance))
			return \{true}
		endif
	endif
	return \{false}
endscript

script get_resting_whammy_position 
	GetGlobalTags \{user_options}
	switch (<controller>)
		case 0
		return resting_whammy_position = <resting_whammy_position_device_0>
		case 1
		return resting_whammy_position = <resting_whammy_position_device_1>
		case 2
		return resting_whammy_position = <resting_whammy_position_device_2>
		case 3
		return resting_whammy_position = <resting_whammy_position_device_3>
		case 4
		return resting_whammy_position = <resting_whammy_position_device_4>
		case 5
		return resting_whammy_position = <resting_whammy_position_device_5>
		case 6
		return resting_whammy_position = <resting_whammy_position_device_6>
	endswitch
endscript

script get_star_power_position 
	GetGlobalTags \{user_options}
	switch (<controller>)
		case 0
		return star_power_position = <star_power_position_device_0>
		case 1
		return star_power_position = <star_power_position_device_1>
		case 2
		return star_power_position = <star_power_position_device_2>
		case 3
		return star_power_position = <star_power_position_device_3>
		case 4
		return star_power_position = <star_power_position_device_4>
		case 5
		return star_power_position = <star_power_position_device_5>
		case 6
		return star_power_position = <star_power_position_device_6>
	endswitch
endscript

script tap_prototype_on 
	Change \{tap_prototype = 1}
endscript

script tap_prototype_off 
	Change \{tap_prototype = 0}
endscript

script enable_screen_saver 
	SetScriptCannotPause
	if GotParam \{delay}
		wait <delay> gameframes
	endif
	EnableScreenSaver
endscript

script disable_screen_saver 
	SetScriptCannotPause
	if GotParam \{delay}
		wait <delay> gameframes
	endif
	DisableScreenSaver
endscript
