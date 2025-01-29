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

script setup_bot_controller 
	formatText checksumName = player_status 'player%p_status' p = <Player>
	GetInputHandlerBotIndex Player = <Player>
	if NOT (<controller> = ($<player_status>.controller))
		Change structurename = <player_status> bot_original_controller = ($<player_status>.controller)
		Change structurename = <player_status> controller = <controller>
	endif
endscript

script bot_star_power \{player_status = player1_status}
	Change structurename = <player_status> bot_star_power = 1
endscript

script check_buttons_bot 
	checkbuttonsbot Player = <Player> array_entry = <array_entry> player_status = <player_status>
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

script check_note_hold 
	<index> = (<Player> - 1)
	begin
	if ($currently_holding [<index>] = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	SetArrayElement ArrayName = currently_holding globalarray index = <index> NewValue = 1
	CheckNoteHoldInit Player = <Player> player_status = <player_status> array_entry = <array_entry> time = <time> guitar_stream = <guitar_stream> song = <song> pattern = <pattern>
	begin
	if NOT CheckNoteHoldWait Player = <Player>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	CheckNoteHoldStart Player = <Player>
	begin
	if NOT CheckNoteHoldPerFrame Player = <Player>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	CheckNoteHoldEnd Player = <Player>
	SetArrayElement ArrayName = currently_holding globalarray index = <index> NewValue = 0
endscript

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
	Change structurename = <player_status> star_power_usable = 0
	<frames_under> = 0
	controller = ($<player_status>.controller)
	if IsGuitarController controller = <controller>
		if (<guitar_used_select> = 0)
			begin
			Wait \{1
				gameframe}
			if GuitarGetAnalogueInfo controller = <controller>
				if (<righty> > $<player_status>.star_tilt_threshold)
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
	Change structurename = <player_status> star_power_usable = 1
endscript

script star_power_activate_and_drain 
	if (gamemode_isbandscoring)
		getbandindexbyplayer Player = ($<player_status>.Player)
		band_id = ($band_ids [<band_index>])
		band_power = ($<band_id>.star_power_amount)
		star_usage = (100.0 / 6.0)
		if ($is_network_game = 0)
			if (<band_power> < <star_usage>)
				return
			endif
			band_power = (<band_power> - <star_usage>)
			Change structurename = <band_id> star_power_amount = <band_power>
		endif
		star_power_activate <...>
		star_power_boost_other_band_members {Player = ($<player_status>.Player) band_index = <band_index>}
		initial_power_time = (($<player_status>.playline_song_measure_time * 50.0) / $star_power_drain_rate)
		power_time = <initial_power_time>
		begin
		Wait \{1
			gameframe}
		getframelength
		power_time = (<power_time> - (1000.0 * <frame_length>))
		drain = (((1000.0 * <frame_length>) / <initial_power_time>) * <star_usage>)
		Change structurename = <band_id> star_power_display_amount = ($<band_id>.star_power_display_amount - <drain>)
		if ($<band_id>.star_power_display_amount <= 0)
			Change structurename = <band_id> star_power_display_amount = 0
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
			Change structurename = <player_status> star_power_used = 1
			if ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
				drain = ($star_power_drain_rate_coop * 1000.0 * ($current_deltatime / $<player_status>.playline_song_measure_time))
			elseif ($game_mode = tutorial)
				drain = 0
			else
				drain = ($star_power_drain_rate * 1000.0 * ($current_deltatime / $<player_status>.playline_song_measure_time))
			endif
			Change structurename = <player_status> star_power_amount = ($<player_status>.star_power_amount - <drain>)
			if ($<player_status>.star_power_amount < 50)
				if ($<player_status>.star_power_amount + <drain> >= 50)
					broadcastevent \{Type = starpower_bulbs_hide}
				endif
			endif
			if ($<player_status>.star_power_amount <= 0)
				Change structurename = <player_status> star_power_amount = 0
				break
			endif
		else
			Change structurename = <player_status> star_power_used = 0
		endif
		repeat
	endif
	if ($<player_status>.controller = $primary_controller)
		Change gStar_Power_Triggered = ($gStar_Power_Triggered + 1)
	endif
	star_power_deactivate <...>
	<do_star> = 0
	return <...>
endscript

script star_power_activate 
	if NOT GotParam \{drumfill}
		Change structurename = <player_status> star_power_used = 1
	endif
	SpawnScriptNow hud_activated_star_power params = {Player = <Player> player_text = <player_text>}
	Wait \{1
		gameframe}
	if NOT GotParam \{drumfill}
		LaunchGemEvent event = star_power_on Player = <Player>
		bandmanager_starpoweron Player = <Player>
	endif
	ExtendCrc star_power_on <player_text> out = Type
	broadcastevent Type = <Type> data = {player_text = <player_text> Player = <Player> player_status = <player_status>}
	SpawnScriptNow \{Crowd_AllPlayAnim
		params = {
			anim = starpower
		}}
endscript

script star_power_deactivate 
	if NOT GotParam \{drumfill}
		Change structurename = <player_status> star_power_used = 0
	endif
	if ($<player_status>.is_local_client = 0)
		setupdateignorecount player_status = <player_status>
	endif
	UpdateNixie Player = <Player>
	Wait \{1
		gameframe}
	if NOT GotParam \{drumfill}
		LaunchGemEvent event = star_power_off Player = <Player>
	endif
	ExtendCrc star_power_off <player_text> out = Type
	broadcastevent Type = <Type> data = {player_text = <player_text> player_status = <player_status>}
	SpawnScriptNow \{Crowd_AllPlayAnim
		params = {
			anim = Idle
		}}
endscript

script star_power_boost_other_band_members 
	booster_band_index = <band_index>
	getmaxplayers
	p = 1
	begin
	if NOT (<p> = <Player>)
		getbandindexbyplayer Player = <p>
		if (<band_index> = <booster_band_index>)
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
	set_whammy_pitchshift control = 0.0 player_status = <player_status>
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
	get_difficulty_text_nl difficulty = ($player1_status.difficulty)
	get_song_prefix song = ($current_song)
	formatText TextName = FileName qs(0x87b34504) s = <song_prefix> d = <difficulty_text_nl>
	WriteDataBuffer Name = replay FileName = <FileName>
	DestroyScreenElement \{id = info_text}
	create_debugging_menu
endscript

script autodetectleftys 
	if IsGuitarController controller = ($<player_status>.controller)
		if GuitarGetAnalogueInfo controller = ($<player_status>.controller)
			if (<righttrigger> < 0)
				Change structurename = <player_status> lefthanded = 0
			else
				Change structurename = <player_status> lefthanded = 1
			endif
		endif
	else
		Change structurename = <player_status> lefthanded = 0
	endif
	Change structurename = <player_status> lefthanded_gems = ($<player_status>.lefthanded)
	Change structurename = <player_status> lefthanded_button_ups = ($<player_status>.lefthanded)
endscript
resting_whammy_tolerance = 0.1

script is_whammy_resting 
	if GotParam \{controller}
		get_resting_whammy_position <...>
	else
		controller = ($<player_status>.controller)
		resting_whammy_position = ($<player_status>.resting_whammy_position)
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
	GetGlobalTags \{user_options
		attract_mode_fix = 1}
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
	GetGlobalTags \{user_options
		attract_mode_fix = 1}
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

script dragonforce_hack_on 
	Change \{dragonforce_hack = 1}
endscript

script dragonforce_hack_off 
	Change \{dragonforce_hack = 0}
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
