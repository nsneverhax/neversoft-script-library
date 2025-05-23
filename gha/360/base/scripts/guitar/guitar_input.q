button_values = [
	65536
	4096
	256
	16
	1
	0
]
hammer_on_measure_scale = 0

script check_buttons_fast 
	get_song_prefix song = <song_name>
	formatText checksumName = guitar_stream '%s_guitar' s = <song_prefix> AddToStringLookup
	GuitarInputLogicInit player_status = <player_status> guitar_stream = <guitar_stream> time_offset = <time_offset>
	begin
	if ($ui_flow_manager_state [(<Player> -1)] = online_pause_fs)
		SetInput controller = ($<player_status>.controller) pattern = 0 strum = 0
	endif
	if NOT GuitarInputLogicPerFrame Player = <Player>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
p1_star_ready = 0
p2_star_ready = 0

script bot_star_power \{player_status = player1_status}
	Change structurename = <player_status> bot_star_power = 1
endscript

script check_buttons_bot 
	formatText checksumName = input_array 'input_array%p' p = <player_text>
	song = <input_array>
	GetStrumPattern song = <song> entry = <array_entry>
	do_hammer = ($<song> [<array_entry>] [6])
	Change structurename = <player_status> bot_pattern = <strum>
	if (<do_hammer> = 1)
		Change structurename = <player_status> bot_strum = 0
	else
		Change structurename = <player_status> bot_strum = 1
	endif
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
]
button_up_pixel_arrayp2 = [
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

script check_for_star_power_fast 
	Change \{p1_star_ready = 0}
	Change \{p2_star_ready = 0}
	Change structurename = <player_status> star_power_usable = 1
	CheckForStarPowerInit <...>
	begin
	if NOT ($game_mode = p2_coop || $game_mode = p2_quickplay)
		begin
		if ($<player_status>.star_power_usable = 1)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	Wait \{1
		gameframe}
	if NOT ($ui_flow_manager_state [(<Player> -1)] = online_pause_fs)
		CheckForStarPowerPerFrame <...>
	endif
	repeat
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
			repeat
		else
			<guitar_used_select> = 0
		endif
	endif
	Change structurename = <player_status> star_power_usable = 1
endscript

script star_power_activate_and_drain 
	Change structurename = <player_status> star_power_used = 1
	SpawnScriptNow hud_activated_star_power params = {Player = <Player>}
	Wait \{1
		gameframe}
	LaunchGemEvent event = star_power_on Player = <Player>
	ExtendCrc star_power_on <player_text> out = Type
	broadcastevent Type = <Type> data = {player_text = <player_text> Player = <Player> player_status = <player_status>}
	if ($<player_status>.controller = $primary_controller)
		Change gStar_Power_Triggered = ($gStar_Power_Triggered + 1)
	endif
	SpawnScriptNow \{Crowd_AllPlayAnim
		params = {
			anim = starpower
		}}
	begin
	Wait \{1
		gameframe}
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		drain = ($star_power_drain_rate_coop * 1000.0 * ($current_deltatime / $<player_status>.playline_song_measure_time))
	elseif ($game_mode = tutorial)
		drain = 0
	else
		drain = ($star_power_drain_rate * 1000.0 * ($current_deltatime / $<player_status>.playline_song_measure_time))
	endif
	Change structurename = <player_status> star_power_amount = ($<player_status>.star_power_amount - <drain>)
	if ($<player_status>.star_power_amount <= 0)
		Change structurename = <player_status> star_power_amount = 0
		break
	endif
	repeat
	SpawnScriptNow \{Crowd_AllPlayAnim
		params = {
			anim = Idle
		}}
	Change structurename = <player_status> star_power_used = 0
	UpdateNixie Player = <Player>
	Wait \{1
		gameframe}
	LaunchGemEvent event = star_power_off Player = <Player>
	ExtendCrc star_power_off <player_text> out = Type
	broadcastevent Type = <Type> data = {player_text = <player_text> player_status = <player_status>}
	<do_star> = 0
	return <...>
endscript

script control_whammy_pitchshift 
	if ($boss_battle = 1)
		if (($<player_status>.Player) = 2)
			return
		endif
	endif
	<set_pitch> = 0
	if GotParam \{net_whammy_length}
		<len> = <net_whammy_length>
		<set_pitch> = 1
	else
		if GuitarGetAnalogueInfo controller = ($<player_status>.controller)
			<set_pitch> = 1
			if ($<player_status>.bot_play = 1)
				<len> = 0.0
			elseif IsGuitarController controller = ($<player_status>.controller)
				<len> = ((<rightx> - $<player_status>.resting_whammy_position) / (1.0 - $<player_status>.resting_whammy_position))
				if (<len> < 0.0)
					<len> = 0.0
				endif
			else
				if (<leftlength> > 0)
					<len> = <leftlength>
				else
					if (<rightlength> > 0)
						<len> = <rightlength>
					else
						<len> = 0
					endif
				endif
			endif
			if (($is_network_game) && ($<player_status>.Player = 1))
				Change structurename = <player_status> net_whammy = <len>
			endif
		endif
	endif
	if (<set_pitch> = 1)
		set_whammy_pitchshift control = <len> player_status = <player_status>
		<whammy_scale> = (((<len> * 0.5) + 0.5) * 2.0)
		SetNewWhammyValue value = <whammy_scale> time_remaining = <time> player_status = <player_status> Player = (<player_status>.Player)
	endif
endscript

script reset_whammy_pitchshift 
	set_whammy_pitchshift control = 0.0 player_status = <player_status>
	SetAllWhammyValues value = 1.0 Player = <Player>
endscript

script boss_play_on 
	Change \{boss_play = 1}
	vol = 0
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	Change structurename = <player_status> guitar_volume = 100
	Player = (<Player> + 1)
	repeat $current_num_players
	UpdateGuitarVolume
endscript

script boss_play_off 
	Change \{boss_play = 0}
endscript

script record_input 
	if GameIsPaused
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
	if DataBufferGetFloat \{Name = replay}
		SetDeltaTime delta_time = <float>
	endif
endscript

script save_replay 
	destroy_debugging_menu
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = info_text
		font = text_a1
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
		text = "Saving replay"
		z_priority = 1.0}
	Wait \{2
		gameframes}
	get_difficulty_text_nl difficulty = ($current_difficulty)
	get_song_prefix song = ($current_song)
	formatText TextName = FileName "replay_%s_%d" s = <song_prefix> d = <difficulty_text_nl>
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

script dragonforce_hack_on 
	Change \{dragonforce_hack = 1}
endscript

script dragonforce_hack_off 
	Change \{dragonforce_hack = 0}
endscript
