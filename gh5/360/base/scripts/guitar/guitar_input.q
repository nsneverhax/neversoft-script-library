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
	GetInputHandlerBotIndex Player = <Player>
	getplayerinfo <Player> controller out = player_controller
	if NOT (<controller> = <player_controller>)
		setplayerinfo <Player> bot_original_controller = <player_controller>
		setplayerinfo <Player> controller = <controller>
	endif
endscript

script bot_star_power \{Player = 1}
	setplayerinfo <Player> bot_star_power = 1
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
	Wait \{1
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
	return \{FALSE}
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
			Wait \{1
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
	setplayerinfo <Player> star_power_usable = 0
	<frames_under> = 0
	getplayerinfo <Player> controller
	if IsGuitarController controller = <controller>
		if (<guitar_used_select> = 0)
			begin
			Wait \{1
				gameframe}
			if GuitarGetAnalogueInfo controller = <controller>
				getplayerinfo <Player> star_tilt_threshold
				if (<righty> > <star_tilt_threshold>)
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
	setplayerinfo <Player> star_power_usable = 1
endscript

script star_power_activate_and_drain 
	set_combo_meter_sp_meter_blue_alpha Player = <Player> alpha = 1.0
	if ((gamemode_isbandscoring) && (($use_star_power_prototype) = 0))
		getplayerinfo <Player> Band
		getbandinfo <Band> star_power_amount
		band_power = <star_power_amount>
		star_usage = (100.0 / 6.0)
		if ($is_network_game = 0)
			if (<band_power> < <star_usage>)
				return
			endif
			band_power = (<band_power> - <star_usage>)
			setbandinfo <Band> star_power_amount = <band_power>
		endif
		star_power_activate <...>
		star_power_boost_other_band_members {Player = <Player> Band = <Band>}
		getplayerinfo <Player> playline_song_measure_time
		initial_power_time = ((<playline_song_measure_time> * 50.0) / $star_power_drain_rate)
		power_time = <initial_power_time>
		begin
		Wait \{1
			gameframe}
		getframelength
		power_time = (<power_time> - (1000.0 * <frame_length>))
		drain = (-1 * (((1000.0 * <frame_length>) / <initial_power_time>) * <star_usage>))
		addtobandinfo <Band> star_power_display_amount = <drain>
		getbandinfo <Band> star_power_display_amount
		if (<star_power_display_amount> <= 0)
			setbandinfo <Band> star_power_display_amount = 0.0
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
		Wait \{1
			gameframe}
		if ($drum_solo_songtime_paused = 0)
			setplayerinfo <Player> star_power_used = 1
			if ($game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
				getplayerinfo <Player> playline_song_measure_time
				if (<playline_song_measure_time> = 0)
					drain = 0
				else
					drain = ($star_power_drain_rate_coop * 1000.0 * ($current_deltatime / <playline_song_measure_time>))
				endif
			else
				getplayerinfo <Player> playline_song_measure_time
				if (<playline_song_measure_time> = 0)
					drain = 0
				else
					drain = ($star_power_drain_rate * 1000.0 * ($current_deltatime / <playline_song_measure_time>))
				endif
			endif
			getplayerinfo <Player> star_power_amount
			<star_power_amount> = (<star_power_amount> - <drain>)
			setplayerinfo <Player> star_power_amount = <star_power_amount>
			if (<star_power_amount> < 50.0)
				if (<star_power_amount> + <drain> >= 50.0)
					broadcastevent \{Type = starpower_bulbs_hide}
				endif
			endif
			if (<star_power_amount> <= 0.0)
				setplayerinfo <Player> star_power_amount = 0.0
				break
			endif
		else
			setplayerinfo <Player> star_power_used = 0
		endif
		repeat
	endif
	if playerinfoequals <Player> controller = ($primary_controller)
		Change gStar_Power_Triggered = ($gStar_Power_Triggered + 1)
	endif
	star_power_deactivate <...>
	set_combo_meter_sp_meter_blue_alpha Player = <Player> alpha = 0.0
	<do_star> = 0
	return <...>
endscript

script star_power_activate 
	if NOT GotParam \{drumfill}
		setplayerinfo <Player> star_power_used = 1
	endif
	getplayerinfo <Player> score
	setplayerinfo <Player> sp_points = <score>
	SpawnScriptNow hud_activated_star_power params = {Player = <Player>}
	Wait \{1
		gameframe}
	if NOT GotParam \{drumfill}
		LaunchGemEvent event = star_power_on Player = <Player>
		getplayerinfo <Player> part
		if (<part> != vocals)
			SpawnScriptNow create_highway_star_power_effect params = {Player = <Player>}
		else
			gamemode_gettype
			if (<Type> = freeplay)
				freeplay_vocals_activate_star_power Player = <Player>
			else
				vocals_activate_star_power Player = <Player>
			endif
		endif
		bandmanager_starpoweron Player = <Player>
	endif
	extendcrcplayer star_power_on <Player> out = Type
	broadcastevent Type = <Type> data = {Player = <Player>}
endscript

script star_power_deactivate 
	if NOT GotParam \{drumfill}
		setplayerinfo <Player> star_power_used = 0
	endif
	gamemode_gettype
	if ((<Type> = career) || (<Type> = quickplay))
		ach_sp_points_test Player = <Player>
	endif
	if playerinfoequals <Player> is_local_client = 0
		setupdateignorecount Player = <Player>
	endif
	UpdateNixie Player = <Player>
	Wait \{1
		gameframe}
	if NOT GotParam \{drumfill}
		LaunchGemEvent event = star_power_off Player = <Player>
		getplayerinfo <Player> part
		if (<part> != vocals)
			SpawnScriptNow kill_highway_star_power_effect params = {Player = <Player>}
		else
			gamemode_gettype
			if (<Type> = freeplay)
				freeplay_vocals_deactivate_star_power Player = <Player>
			else
				vocals_deactivate_star_power Player = <Player>
			endif
		endif
	endif
	extendcrcplayer star_power_off <Player> out = Type
	broadcastevent Type = <Type> data = {Player = <Player>}
endscript

script star_power_kill_highway_fx_immedately \{Player = -1}
	formatText checksumName = namer2 'sidebar_Right2_SPGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namer2>
	formatText checksumName = namel2 'sidebar_Left2_SPGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namel2>
	formatText checksumName = namec 'sidebar_Center_SPRushp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namec>
	formatText checksumName = namevb2 'Vocals_Top_SPGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevb2>
	formatText checksumName = namevt2 'Vocals_Top_SPGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevt2>
	GuitarEvent_StarPowerOff Player = <Player> no_sound = true
endscript

script star_power_boost_other_band_members 
	booster_band = <Band>
	getmaxlocalplayers
	p = 1
	begin
	if NOT (<p> = <Player>)
		getplayerinfo <p> Band
		if (<Band> = <booster_band>)
			getplayerinfo <p> current_health
			if (<current_health> < 1.0)
				mult = (1.0 - <current_health>)
				current_health = (<current_health> + ($band_max_star_power_health_boost * <mult>))
				setplayerinfo <p> current_health = <current_health>
			endif
		endif
	endif
	p = (<p> + 1)
	repeat <max_players>
endscript

script reset_whammy_pitchshift 
	set_whammy_pitchshift control = 0.0 Player = <Player>
	SetAllWhammyValues value = 1.0 Player = <Player>
endscript

script record_input 
	if GameIsPaused
		return
	endif
	if NOT are_replays_enabled
		return
	endif
	GetDeltaTime
	DataBufferPutFloat Name = replay value = <delta_time>
	RecordInput \{Name = replay}
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
	if DataBufferGetFloat \{Name = replay}
		SetDeltaTime delta_time = <float>
	endif
endscript

script save_replay 
	if NOT are_replays_enabled
		return
	endif
	destroy_debugging_menu
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = info_text
		font = debug
		Pos = (640.0, 32.0)
		just = [
			center
			top
		]
		Scale = 1.0
		rgba = [
			210
			210
			210
			250
		]
		text = qs(0x153fc55f)
		z_priority = 1.0}
	Wait \{2
		gameframes}
	getfirstplayer
	getplayerinfo <Player> difficulty
	get_difficulty_text_nl difficulty = <difficulty>
	gman_songtool_getcurrentsong
	get_song_prefix song = <current_song>
	formatText TextName = FileName qs(0x87b34504) s = <song_prefix> d = <difficulty_text_nl>
	WriteDataBuffer Name = replay FileName = <FileName>
	DestroyScreenElement \{id = info_text}
	create_debugging_menu
endscript
resting_whammy_tolerance = 0.1

script is_whammy_resting 
	if GotParam \{controller}
		get_resting_whammy_position <...>
	else
		getplayerinfo <Player> controller
		getplayerinfo <Player> resting_whammy_position
	endif
	if GuitarGetAnalogueInfo controller = <controller>
		if (<rightx> < <resting_whammy_position>)
			return \{true}
		elseif ((<rightx> - <resting_whammy_position>) < ($resting_whammy_tolerance))
			return \{true}
		endif
	endif
	return \{FALSE}
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
	setscriptcannotpause
	if GotParam \{delay}
		Wait <delay> gameframes
	endif
	enablescreensaver
endscript

script disable_screen_saver 
	setscriptcannotpause
	if GotParam \{delay}
		Wait <delay> gameframes
	endif
	disablescreensaver
endscript
