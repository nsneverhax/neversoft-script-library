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
	getinputhandlerbotindex player = <player>
	getplayerinfo <player> controller out = player_controller
	if NOT (<controller> = <player_controller>)
		setplayerinfo <player> bot_original_controller = <player_controller>
		setplayerinfo <player> controller = <controller>
	endif
endscript

script bot_star_power \{player = 1}
	setplayerinfo <player> bot_star_power = 1
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
	setplayerinfo <player> star_power_usable = 0
	<frames_under> = 0
	getplayerinfo <player> controller
	if isguitarcontroller controller = <controller>
		if (<guitar_used_select> = 0)
			begin
			wait \{1
				gameframe}
			if guitargetanalogueinfo controller = <controller>
				getplayerinfo <player> star_tilt_threshold
				if (<righty> > <star_tilt_threshold>)
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
	setplayerinfo <player> star_power_usable = 1
endscript

script star_power_activate_and_drain 
	set_combo_meter_sp_meter_blue_alpha player = <player> alpha = 1.0
	if ((gamemode_isbandscoring) && (($use_star_power_prototype) = 0))
		getplayerinfo <player> band
		getbandinfo <band> star_power_amount
		band_power = <star_power_amount>
		star_usage = (100.0 / 6.0)
		if ($is_network_game = 0)
			if (<band_power> < <star_usage>)
				return
			endif
			band_power = (<band_power> - <star_usage>)
			setbandinfo <band> star_power_amount = <band_power>
		endif
		star_power_activate <...>
		star_power_boost_other_band_members {player = <player> band = <band>}
		getplayerinfo <player> playline_song_measure_time
		initial_power_time = ((<playline_song_measure_time> * 50.0) / $star_power_drain_rate)
		power_time = <initial_power_time>
		begin
		wait \{1
			gameframe}
		getframelength
		power_time = (<power_time> - (1000.0 * <frame_length>))
		drain = (-1 * (((1000.0 * <frame_length>) / <initial_power_time>) * <star_usage>))
		addtobandinfo <band> star_power_display_amount = <drain>
		getbandinfo <band> star_power_display_amount
		if (<star_power_display_amount> <= 0)
			setbandinfo <band> star_power_display_amount = 0.0
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
			setplayerinfo <player> star_power_used = 1
			if ($game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
				getplayerinfo <player> playline_song_measure_time
				if (<playline_song_measure_time> = 0)
					drain = 0
				else
					drain = ($star_power_drain_rate_coop * 1000.0 * ($current_deltatime / <playline_song_measure_time>))
				endif
			else
				getplayerinfo <player> playline_song_measure_time
				if (<playline_song_measure_time> = 0)
					drain = 0
				else
					drain = ($star_power_drain_rate * 1000.0 * ($current_deltatime / <playline_song_measure_time>))
				endif
			endif
			getplayerinfo <player> star_power_amount
			<star_power_amount> = (<star_power_amount> - <drain>)
			setplayerinfo <player> star_power_amount = <star_power_amount>
			if (<star_power_amount> < 50.0)
				if (<star_power_amount> + <drain> >= 50.0)
					broadcastevent \{type = starpower_bulbs_hide}
				endif
			endif
			if (<star_power_amount> <= 0.0)
				setplayerinfo <player> star_power_amount = 0.0
				break
			endif
		else
			setplayerinfo <player> star_power_used = 0
		endif
		repeat
	endif
	if playerinfoequals <player> controller = ($primary_controller)
		change gstar_power_triggered = ($gstar_power_triggered + 1)
	endif
	star_power_deactivate <...>
	set_combo_meter_sp_meter_blue_alpha player = <player> alpha = 0.0
	<do_star> = 0
	return <...>
endscript

script star_power_activate 
	if NOT gotparam \{drumfill}
		setplayerinfo <player> star_power_used = 1
	endif
	getplayerinfo <player> score
	setplayerinfo <player> sp_points = <score>
	spawnscriptnow hud_activated_star_power params = {player = <player>}
	wait \{1
		gameframe}
	if NOT gotparam \{drumfill}
		launchgemevent event = star_power_on player = <player>
		getplayerinfo <player> part
		if (<part> != vocals)
			spawnscriptnow create_highway_star_power_effect params = {player = <player>}
		else
			gamemode_gettype
			if (<type> = freeplay)
				freeplay_vocals_activate_star_power player = <player>
			else
				vocals_activate_star_power player = <player>
			endif
		endif
		bandmanager_starpoweron player = <player>
	endif
	extendcrcplayer star_power_on <player> out = type
	broadcastevent type = <type> data = {player = <player>}
endscript

script star_power_deactivate 
	if NOT gotparam \{drumfill}
		setplayerinfo <player> star_power_used = 0
	endif
	gamemode_gettype
	if ((<type> = career) || (<type> = quickplay))
		ach_sp_points_test player = <player>
	endif
	if playerinfoequals <player> is_local_client = 0
		setupdateignorecount player = <player>
	endif
	updatenixie player = <player>
	wait \{1
		gameframe}
	if NOT gotparam \{drumfill}
		launchgemevent event = star_power_off player = <player>
		getplayerinfo <player> part
		if (<part> != vocals)
			spawnscriptnow kill_highway_star_power_effect params = {player = <player>}
		else
			gamemode_gettype
			if (<type> = freeplay)
				freeplay_vocals_deactivate_star_power player = <player>
			else
				vocals_deactivate_star_power player = <player>
			endif
		endif
	endif
	extendcrcplayer star_power_off <player> out = type
	broadcastevent type = <type> data = {player = <player>}
endscript

script star_power_kill_highway_fx_immedately \{player = -1}
	formattext checksumname = namer2 'sidebar_Right2_SPGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namer2>
	formattext checksumname = namel2 'sidebar_Left2_SPGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namel2>
	formattext checksumname = namec 'sidebar_Center_SPRushp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namec>
	formattext checksumname = namevb2 'Vocals_Top_SPGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevb2>
	formattext checksumname = namevt2 'Vocals_Top_SPGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevt2>
	guitarevent_starpoweroff player = <player> no_sound = true
endscript

script star_power_boost_other_band_members 
	booster_band = <band>
	getmaxlocalplayers
	p = 1
	begin
	if NOT (<p> = <player>)
		getplayerinfo <p> band
		if (<band> = <booster_band>)
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
	set_whammy_pitchshift control = 0.0 player = <player>
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
	getfirstplayer
	getplayerinfo <player> difficulty
	get_difficulty_text_nl difficulty = <difficulty>
	gman_songtool_getcurrentsong
	get_song_prefix song = <current_song>
	formattext textname = filename qs(0x87b34504) s = <song_prefix> d = <difficulty_text_nl>
	writedatabuffer name = replay filename = <filename>
	destroyscreenelement \{id = info_text}
	create_debugging_menu
endscript
resting_whammy_tolerance = 0.1

script is_whammy_resting 
	if gotparam \{controller}
		get_resting_whammy_position <...>
	else
		getplayerinfo <player> controller
		getplayerinfo <player> resting_whammy_position
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
	getglobaltags \{user_options}
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
	getglobaltags \{user_options}
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
