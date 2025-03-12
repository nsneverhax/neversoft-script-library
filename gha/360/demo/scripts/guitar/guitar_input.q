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
	formattext checksumname = guitar_stream '%s_guitar' s = <song_prefix> addtostringlookup
	guitarinputlogicinit player_status = <player_status> guitar_stream = <guitar_stream> time_offset = <time_offset>
	begin
	if ($ui_flow_manager_state [(<player> -1)] = online_pause_fs)
		setinput controller = ($<player_status>.controller) pattern = 0 strum = 0
	endif
	if NOT guitarinputlogicperframe player = <player>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript
p1_star_ready = 0
p2_star_ready = 0

script bot_star_power \{player_status = player1_status}
	change structurename = <player_status> bot_star_power = 1
endscript

script check_buttons_bot 
	formattext checksumname = input_array 'input_array%p' p = <player_text>
	song = <input_array>
	getstrumpattern song = <song> entry = <array_entry>
	do_hammer = ($<song> [<array_entry>] [6])
	change structurename = <player_status> bot_pattern = <strum>
	if (<do_hammer> = 1)
		change structurename = <player_status> bot_strum = 0
	else
		change structurename = <player_status> bot_strum = 1
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

script check_for_star_power_fast 
	change \{p1_star_ready = 0}
	change \{p2_star_ready = 0}
	change structurename = <player_status> star_power_usable = 1
	checkforstarpowerinit <...>
	begin
	if NOT ($game_mode = p2_coop || $game_mode = p2_quickplay)
		begin
		if ($<player_status>.star_power_usable = 1)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	wait \{1
		gameframe}
	if NOT ($ui_flow_manager_state [(<player> -1)] = online_pause_fs)
		checkforstarpowerperframe <...>
	endif
	repeat
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
			repeat
		else
			<guitar_used_select> = 0
		endif
	endif
	change structurename = <player_status> star_power_usable = 1
endscript

script star_power_activate_and_drain 
	change structurename = <player_status> star_power_used = 1
	spawnscriptnow hud_activated_star_power params = {player = <player>}
	wait \{1
		gameframe}
	launchgemevent event = star_power_on player = <player>
	extendcrc star_power_on <player_text> out = type
	broadcastevent type = <type> data = {player_text = <player_text> player = <player> player_status = <player_status>}
	if ($<player_status>.controller = $primary_controller)
		change gstar_power_triggered = ($gstar_power_triggered + 1)
	endif
	spawnscriptnow \{crowd_allplayanim
		params = {
			anim = starpower
		}}
	begin
	wait \{1
		gameframe}
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		drain = ($star_power_drain_rate_coop * 1000.0 * ($current_deltatime / $<player_status>.playline_song_measure_time))
	elseif ($game_mode = tutorial)
		drain = 0
	else
		drain = ($star_power_drain_rate * 1000.0 * ($current_deltatime / $<player_status>.playline_song_measure_time))
	endif
	change structurename = <player_status> star_power_amount = ($<player_status>.star_power_amount - <drain>)
	if ($<player_status>.star_power_amount <= 0)
		change structurename = <player_status> star_power_amount = 0
		break
	endif
	repeat
	spawnscriptnow \{crowd_allplayanim
		params = {
			anim = idle
		}}
	change structurename = <player_status> star_power_used = 0
	updatenixie player = <player>
	wait \{1
		gameframe}
	launchgemevent event = star_power_off player = <player>
	extendcrc star_power_off <player_text> out = type
	broadcastevent type = <type> data = {player_text = <player_text> player_status = <player_status>}
	<do_star> = 0
	return <...>
endscript

script control_whammy_pitchshift 
	if ($boss_battle = 1)
		if (($<player_status>.player) = 2)
			return
		endif
	endif
	<set_pitch> = 0
	if gotparam \{net_whammy_length}
		<len> = <net_whammy_length>
		<set_pitch> = 1
	else
		if guitargetanalogueinfo controller = ($<player_status>.controller)
			<set_pitch> = 1
			if ($<player_status>.bot_play = 1)
				<len> = 0.0
			elseif isguitarcontroller controller = ($<player_status>.controller)
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
			if (($is_network_game) && ($<player_status>.player = 1))
				change structurename = <player_status> net_whammy = <len>
			endif
		endif
	endif
	if (<set_pitch> = 1)
		set_whammy_pitchshift control = <len> player_status = <player_status>
		<whammy_scale> = (((<len> * 0.5) + 0.5) * 2.0)
		setnewwhammyvalue value = <whammy_scale> time_remaining = <time> player_status = <player_status> player = (<player_status>.player)
	endif
endscript

script reset_whammy_pitchshift 
	set_whammy_pitchshift control = 0.0 player_status = <player_status>
	setallwhammyvalues value = 1.0 player = <player>
endscript

script boss_play_on 
	change \{boss_play = 1}
	vol = 0
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	change structurename = <player_status> guitar_volume = 100
	player = (<player> + 1)
	repeat $current_num_players
	updateguitarvolume
endscript

script boss_play_off 
	change \{boss_play = 0}
endscript

script record_input 
	if gameispaused
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
	if databuffergetfloat \{name = replay}
		setdeltatime delta_time = <float>
	endif
endscript

script save_replay 
	destroy_debugging_menu
	createscreenelement \{type = textelement
		parent = root_window
		id = info_text
		font = text_a1
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
		text = "Saving replay"
		z_priority = 1.0}
	wait \{2
		gameframes}
	get_difficulty_text_nl difficulty = ($current_difficulty)
	get_song_prefix song = ($current_song)
	formattext textname = filename "replay_%s_%d" s = <song_prefix> d = <difficulty_text_nl>
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

script dragonforce_hack_on 
	change \{dragonforce_hack = 1}
endscript

script dragonforce_hack_off 
	change \{dragonforce_hack = 0}
endscript
