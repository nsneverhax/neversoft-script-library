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
	formattext checksumname = player_status 'player%p_status' p = <player>
	getinputhandlerbotindex player = <player>
	if NOT (<controller> = ($<player_status>.controller))
		change structurename = <player_status> bot_original_controller = ($<player_status>.controller)
		change structurename = <player_status> controller = <controller>
	endif
endscript

script bot_star_power \{player_status = player1_status}
	change structurename = <player_status> bot_star_power = 1
endscript

script check_buttons_bot 
	checkbuttonsbot player = <player> array_entry = <array_entry> player_status = <player_status>
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
	buttoncheckerinit <...>
	begin
	buttoncheckerperframe
	if ($display_debug_input = 1)
		input_debug <...>
	endif
	wait \{1
		gameframe}
	repeat
	buttoncheckercleanup
endscript
currently_holding = [
	0
	0
	0
	0
	0
]

script check_note_hold 
	<index> = (<player> - 1)
	begin
	if ($currently_holding [<index>] = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	setarrayelement arrayname = currently_holding globalarray index = <index> newvalue = 1
	checknoteholdinit player = <player> player_status = <player_status> array_entry = <array_entry> time = <time> guitar_stream = <guitar_stream> song = <song> pattern = <pattern>
	begin
	if NOT checknoteholdwait player = <player>
		break
	endif
	wait \{1
		gameframe}
	repeat
	checknoteholdstart player = <player>
	begin
	if NOT checknoteholdperframe player = <player>
		break
	endif
	wait \{1
		gameframe}
	repeat
	checknoteholdend player = <player>
	setarrayelement arrayname = currently_holding globalarray index = <index> newvalue = 0
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
	return \{false}
endscript

script check_for_star_power 
	check_for_star_power_cfunc_setup
	begin
	if check_for_star_power_cfunc
		break
	else
		if gotparam \{scripttorun}
			<scripttorun> <scripttorun_params>
		else
			wait \{1
				gameframe}
		endif
	endif
	repeat
	check_for_star_power_cfunc_cleanup
endscript

script print_guitar_analogue_info 
	guitargetanalogueinfo controller = ($primary_controller)
	printstruct <...>
endscript

script wait_for_inactive 
	change structurename = <player_status> star_power_usable = 0
	<frames_under> = 0
	controller = ($<player_status>.controller)
	if isguitarcontroller controller = <controller>
		if (<guitar_used_select> = 0)
			begin
			wait \{1
				gameframe}
			if guitargetanalogueinfo controller = <controller>
				if (<righty> > $<player_status>.star_tilt_threshold)
					increment \{frames_under}
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
	change structurename = <player_status> star_power_usable = 1
endscript

script star_power_activate_and_drain 
	if (gamemode_isbandscoring)
		getbandindexbyplayer player = ($<player_status>.player)
		band_id = ($band_ids [<band_index>])
		band_power = ($<band_id>.star_power_amount)
		star_usage = (100.0 / 6.0)
		if ($is_network_game = 0)
			if (<band_power> < <star_usage>)
				return
			endif
			band_power = (<band_power> - <star_usage>)
			change structurename = <band_id> star_power_amount = <band_power>
		endif
		star_power_activate <...>
		star_power_boost_other_band_members {player = ($<player_status>.player) band_index = <band_index>}
		initial_power_time = (($<player_status>.playline_song_measure_time * 50.0) / $star_power_drain_rate)
		power_time = <initial_power_time>
		begin
		wait \{1
			gameframe}
		getframelength
		power_time = (<power_time> - (1000.0 * <frame_length>))
		drain = (((1000.0 * <frame_length>) / <initial_power_time>) * <star_usage>)
		change structurename = <band_id> star_power_display_amount = ($<band_id>.star_power_display_amount - <drain>)
		if ($<band_id>.star_power_display_amount <= 0)
			change structurename = <band_id> star_power_display_amount = 0
		endif
		if NOT gotparam \{infinite_drain}
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
			change structurename = <player_status> star_power_used = 1
			if ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
				drain = ($star_power_drain_rate_coop * 1000.0 * ($current_deltatime / $<player_status>.playline_song_measure_time))
			elseif ($game_mode = tutorial)
				drain = 0
			else
				drain = ($star_power_drain_rate * 1000.0 * ($current_deltatime / $<player_status>.playline_song_measure_time))
			endif
			change structurename = <player_status> star_power_amount = ($<player_status>.star_power_amount - <drain>)
			if ($<player_status>.star_power_amount < 50)
				if ($<player_status>.star_power_amount + <drain> >= 50)
					broadcastevent \{type = starpower_bulbs_hide}
				endif
			endif
			if ($<player_status>.star_power_amount <= 0)
				change structurename = <player_status> star_power_amount = 0
				break
			endif
		else
			change structurename = <player_status> star_power_used = 0
		endif
		repeat
	endif
	if ($<player_status>.controller = $primary_controller)
		change gstar_power_triggered = ($gstar_power_triggered + 1)
	endif
	star_power_deactivate <...>
	<do_star> = 0
	return <...>
endscript

script star_power_activate 
	if NOT gotparam \{drumfill}
		change structurename = <player_status> star_power_used = 1
	endif
	spawnscriptnow hud_activated_star_power params = {player = <player> player_text = <player_text>}
	wait \{1
		gameframe}
	if NOT gotparam \{drumfill}
		launchgemevent event = star_power_on player = <player>
		bandmanager_starpoweron player = <player>
	endif
	extendcrc star_power_on <player_text> out = type
	broadcastevent type = <type> data = {player_text = <player_text> player = <player> player_status = <player_status>}
	spawnscriptnow \{crowd_allplayanim
		params = {
			anim = starpower
		}}
endscript

script star_power_deactivate 
	if NOT gotparam \{drumfill}
		change structurename = <player_status> star_power_used = 0
	endif
	if ($<player_status>.is_local_client = 0)
		setupdateignorecount player_status = <player_status>
	endif
	updatenixie player = <player>
	wait \{1
		gameframe}
	if NOT gotparam \{drumfill}
		launchgemevent event = star_power_off player = <player>
	endif
	extendcrc star_power_off <player_text> out = type
	broadcastevent type = <type> data = {player_text = <player_text> player_status = <player_status>}
	spawnscriptnow \{crowd_allplayanim
		params = {
			anim = idle
		}}
endscript

script star_power_boost_other_band_members 
	booster_band_index = <band_index>
	getmaxplayers
	p = 1
	begin
	if NOT (<p> = <player>)
		getbandindexbyplayer player = <p>
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
	setallwhammyvalues value = 1.0 player = <player>
endscript

script record_input 
	if gameispaused
		return
	endif
	if NOT are_replays_enabled
		return
	endif
	getdeltatime
	databufferputfloat name = replay value = <delta_time>
	recordinput \{name = replay}
endscript

script playback_timer 
	if ($replay_suspend = 1)
		return
	endif
	if gameispaused
		return
	endif
	if NOT are_replays_enabled
		return
	endif
	if databuffergetfloat \{name = replay}
		setdeltatime delta_time = <float>
	endif
endscript

script save_replay 
	if NOT are_replays_enabled
		return
	endif
	destroy_debugging_menu
	createscreenelement \{type = textelement
		parent = root_window
		id = info_text
		font = debug
		pos = (640.0, 32.0)
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
	get_difficulty_text_nl difficulty = ($player1_status.difficulty)
	get_song_prefix song = ($current_song)
	formattext textname = filename qs(0x87b34504) s = <song_prefix> d = <difficulty_text_nl>
	writedatabuffer name = replay filename = <filename>
	destroyscreenelement \{id = info_text}
	create_debugging_menu
endscript

script autodetectleftys 
	if isguitarcontroller controller = ($<player_status>.controller)
		if guitargetanalogueinfo controller = ($<player_status>.controller)
			if (<righttrigger> < 0)
				change structurename = <player_status> lefthanded = 0
			else
				change structurename = <player_status> lefthanded = 1
			endif
		endif
	else
		change structurename = <player_status> lefthanded = 0
	endif
	change structurename = <player_status> lefthanded_gems = ($<player_status>.lefthanded)
	change structurename = <player_status> lefthanded_button_ups = ($<player_status>.lefthanded)
endscript
resting_whammy_tolerance = 0.1

script is_whammy_resting 
	if gotparam \{controller}
		get_resting_whammy_position <...>
	else
		controller = ($<player_status>.controller)
		resting_whammy_position = ($<player_status>.resting_whammy_position)
	endif
	if guitargetanalogueinfo controller = <controller>
		if (<rightx> < <resting_whammy_position>)
			return \{true}
		elseif ((<rightx> - <resting_whammy_position>) < ($resting_whammy_tolerance))
			return \{true}
		endif
	endif
	return \{false}
endscript

script get_resting_whammy_position 
	getglobaltags \{user_options
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
	getglobaltags \{user_options
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
	change \{dragonforce_hack = 1}
endscript

script dragonforce_hack_off 
	change \{dragonforce_hack = 0}
endscript

script tap_prototype_on 
	change \{tap_prototype = 1}
endscript

script tap_prototype_off 
	change \{tap_prototype = 0}
endscript

script enable_screen_saver 
	setscriptcannotpause
	if gotparam \{delay}
		wait <delay> gameframes
	endif
	enablescreensaver
endscript

script disable_screen_saver 
	setscriptcannotpause
	if gotparam \{delay}
		wait <delay> gameframes
	endif
	disablescreensaver
endscript
