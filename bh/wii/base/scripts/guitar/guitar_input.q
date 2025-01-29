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
	ScriptAssert \{'strip_single_note_strum: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	WaitOneGameFrame
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
	ScriptAssert \{'print_guitar_analogue_info: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	getplayerinfo <Player> part
	if ((<part> = bass) || (<part> = guitar))
		getplayerinfo <Player> controller
		activatestarpowerpulse Player = <controller> num = 1 length = 40 Strength = 8 Priority = 100
	endif
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
			setbandinfo <Band> star_power_display_amount = 0
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
				drain = ($star_power_drain_rate_coop * 1000.0 * ($current_deltatime / <playline_song_measure_time>))
			elseif ($game_mode = tutorial)
				drain = 0
			else
				getplayerinfo <Player> playline_song_measure_time
				drain = ($star_power_drain_rate * 1000.0 * ($current_deltatime / <playline_song_measure_time>))
			endif
			getplayerinfo <Player> star_power_amount
			<old_amount> = <star_power_amount>
			<star_power_amount> = (<star_power_amount> - <drain>)
			setplayerinfo <Player> star_power_amount = <star_power_amount>
			if (<star_power_amount> < 50.0)
				if (<old_amount> >= 50)
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
		if ($playing_song_for_real = 1)
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
	endif
	extendcrcplayer star_power_off <Player> out = Type
	broadcastevent Type = <Type> data = {Player = <Player>}
	SpawnScriptNow \{Crowd_AllPlayAnim
		params = {
			anim = Idle
		}}
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
	ScriptAssert \{'tap_prototype_on: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script tap_prototype_off 
	Change \{tap_prototype = 0}
endscript
