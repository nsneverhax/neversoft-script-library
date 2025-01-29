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
	getdeltatime
	buttoncheckerperframe player_status = <player_status> delta_time = <delta_time>
	if ($display_debug_input = 1)
		input_debug <...>
	endif
	wait \{1
		gameframe}
	repeat
endscript

script check_note_hold 
	change structurename = <player_status> whammy_on = 1
	getarraysize $gem_colors
	begin
	<gem_count> = 0
	<exists> = 1
	begin
	if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
		formattext checksumname = whammy_id '%c_%i_gem_p%p' c = ($gem_colors_text [<gem_count>]) i = <array_entry> p = ($<player_status>.player) addtostringlookup = true
		if NOT screenelementexists id = <whammy_id>
			<exists> = 0
			break
		endif
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	if (<exists> = 0)
		break
	endif
	wait 1 gameframe
	repeat
	extendcrc whammy_on <player_text> out = id
	broadcastevent type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> player = <player> player_status = <player_status> player_text = <player_text>}
	gem_count = 0
	begin
	if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
		formattext checksumname = whammy_id '%c_%i_whammybar_p%p' c = ($gem_colors_text [<gem_count>]) i = <array_entry> p = ($<player_status>.player) addtostringlookup = true
		bar_name = (<whammy_id> + 1)
		if screenelementexists id = <bar_name>
			setscreenelementprops id = <bar_name> materialprops = [{name = m_glowenabled property = 1}]
			<bar_name> :settags holding = 1
		endif
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	extendcrc button_up_pixel_array ($<player_status>.text) out = pixel_array
	<0x60be7272> = <time>
	begin
	getheldpattern controller = ($<player_status>.controller) player_status = <player_status>
	if single_note pattern = <pattern>
		strip_single_note_strum required_pattern = <pattern> pattern = <hold_pattern>
		<hold_pattern> = <stripped_strum>
	endif
	check_button = 65536
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	if (<hold_pattern> && <check_button>)
		setarrayelement arrayname = <pixel_array> globalarray index = <array_count> newvalue = $button_up_pixels
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat <array_size>
	<0x71d1210f> = 1
	if NOT (<hold_pattern> = <pattern>)
		<0x71d1210f> = 0
	endif
	if (((<player_status>.guitar_volume) = 0) && ($new_net_logic = 0))
		<0x71d1210f> = 0
	endif
	if (<0x71d1210f> = 0)
		<0x298e43dd> = ((<time> / <0x60be7272>) * 100.0)
		if (<0x60be7272> < $whammy_min_hold_mute_ms)
			<min> = $whammy_min_hold_pct_short
		else
			<min> = $whammy_min_hold_pct
		endif
		if (<0x298e43dd> > <min>)
			change structurename = <player_status> guitar_volume = 0
			0x1c07e771
		else
			crowdincrease player_status = <player_status>
		endif
		extendcrc whammy_off <player_text> out = id
		broadcastevent type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> player = <player> player_status = <player_status> player_text = <player_text> finished = 0}
		break
	endif
	control_whammy_pitchshift song = <song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> player = <player> time = <time>
	0x7c4f6c35 pattern = <pattern> player_status = <player_status>
	<time> = (<time> - ($current_deltatime * 1000))
	if (<time> <= 0)
		extendcrc whammy_off <player_text> out = id
		broadcastevent type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> player = <player> player_status = <player_status> player_text = <player_text> finished = 1}
		crowdincrease player_status = <player_status>
		break
	endif
	wait 1 gameframe
	repeat
	change structurename = <player_status> button_checker_up_time = 0.0
	reset_whammy_pitchshift player = <player>
	getarraysize $gem_colors
	gem_count = 0
	begin
	if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
		formattext checksumname = whammy_id '%c_%i_whammybar_p%p' c = ($gem_colors_text [<gem_count>]) i = <array_entry> p = ($<player_status>.player) addtostringlookup = true
		if screenelementexists id = <whammy_id>
			bar_name = (<whammy_id> + 1)
			0x967f354d name = <bar_name> player = ($<player_status>.player)
			<bar_name> :settags holding = 0
		endif
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	change structurename = <player_status> whammy_on = 0
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
	if NOT ($game_mode = p2_career || $game_mode = p2_coop)
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
	checkforstarpowerperframe <...>
	repeat
endscript

script check_for_star_power 
	change p1_star_ready = 0
	change p2_star_ready = 0
	do_star = 0
	wait_time = $star_power_coop_trigger_ms
	getstarttime
	last_time = <starttime>
	change structurename = <player_status> star_power_usable = 1
	<guitar_used_select> = 0
	begin
	if NOT ($game_mode = p2_career || $game_mode = p2_coop)
		begin
		if ($<player_status>.star_power_usable = 1)
			break
		endif
		wait 1 gameframe
		repeat
	endif
	wait 1 gameframe
	if (($p1_star_ready = 1) || ($p2_star_ready = 1))
		<last_time> = <starttime>
	endif
	getstarttime
	if ((<starttime> - <last_time>) > <wait_time>)
		change p1_star_ready = 0
		change p2_star_ready = 0
	endif
	if ($<player_status>.star_power_amount >= 50.0 ||
			$game_mode = p2_battle ||
			$boss_battle = 1)
		formattext checksumname = 0x87381641 'p%d_star_ready' d = ($<player_status>.player)
		if isguitarcontroller controller = ($<player_status>.controller)
			if ($showing_raise_axe = 0)
				change globalname = <0x87381641> newvalue = 0
			endif
			guitargetanalogueinfo controller = ($<player_status>.controller)
			trigger = false
			if ($0xaa63a5a5 = true)
				if (<0x64bcaf2b> > ($0xe270b24c))
					<trigger> = true
				endif
			else
				if (<verticaldist> < ($<player_status>.star_tilt_threshold))
					<trigger> = true
				endif
			endif
			if (($<player_status>.bot_star_power) = 1)
				<trigger> = true
				change structurename = <player_status> bot_star_power = 0
			endif
			if (<trigger> = true)
				<do_star> = 1
				<guitar_used_select> = 0
				change globalname = <0x87381641> newvalue = 1
				if ($game_mode = p2_career || $game_mode = p2_coop)
					if (($<player_status>.player) = 1)
						spawnscriptnow show_coop_raise_axe_for_starpower params = {player_status = player2_status}
						if ($is_network_game)
							spawnscriptnow coop_attempt_star_power
						endif
					else
						spawnscriptnow show_coop_raise_axe_for_starpower params = {player_status = player1_status}
					endif
				endif
			endif
			if ($<player_status>.controller = 0 || $<player_status>.controller = 1)
				if guitarcontrollermake select ($<player_status>.controller)
					<do_star> = 1
					<guitar_used_select> = 1
					change globalname = <0x87381641> newvalue = 1
					if ($game_mode = p2_career || $game_mode = p2_coop)
						if (($<player_status>.player) = 1)
							spawnscriptnow show_coop_raise_axe_for_starpower params = {player_status = player2_status}
							if ($is_network_game)
								spawnscriptnow coop_attempt_star_power
							endif
						else
							spawnscriptnow show_coop_raise_axe_for_starpower params = {player_status = player1_status}
						endif
					endif
				endif
			endif
		else
			if ($showing_raise_axe = 0)
				change globalname = <0x87381641> newvalue = 0
			endif
			0x3c9b5354 = 0
			if controllermake up ($<player_status>.controller)
				<0x3c9b5354> = 1
			endif
			if controllermake down ($<player_status>.controller)
				<0x3c9b5354> = 1
			endif
			if controllermake left ($<player_status>.controller)
				<0x3c9b5354> = 1
			endif
			if controllermake right ($<player_status>.controller)
				<0x3c9b5354> = 1
			endif
			if controllermake select ($<player_status>.controller)
				<0x3c9b5354> = 1
				<guitar_used_select> = 1
			endif
			if (<0x3c9b5354> = 1)
				<do_star> = 1
				change globalname = <0x87381641> newvalue = 1
				if ($game_mode = p2_career || $game_mode = p2_coop)
					if (($<player_status>.player) = 1)
						spawnscriptnow show_coop_raise_axe_for_starpower params = {player_status = player2_status}
						if ($is_network_game)
							spawnscriptnow coop_attempt_star_power
						endif
					else
						spawnscriptnow show_coop_raise_axe_for_starpower params = {player_status = player1_status}
					endif
				endif
			endif
		endif
		if (<do_star> = 1)
			if NOT ($game_mode = p2_career || $game_mode = p2_coop)
				spawnscriptnow wait_for_inactive params = {<...>}
			endif
		endif
		if ($boss_battle = 1)
			if ($<player_status>.player = 2)
				0x2042fe56 player_status = <player_status>
			endif
		endif
		if (<do_star> = 1)
			if ($game_mode = p2_battle ||
					$boss_battle = 1)
				if ($game_mode = p2_battle)
					battle_trigger_on <...>
				else
					bossbattle_trigger_on <...>
				endif
				do_star = 0
			else
				if ($game_mode = p2_career)
					if (($p1_star_ready = 1) && ($p2_star_ready = 1) && ($showing_raise_axe = 1))
						star_power_activate_and_drain <...>
					endif
				elseif ($game_mode = p2_coop)
				else
					star_power_activate_and_drain <...>
				endif
			endif
		endif
	endif
	repeat
endscript

script wait_for_inactive 
	change structurename = <player_status> star_power_usable = 0
	<frames_under> = 0
	if isguitarcontroller controller = ($<player_status>.controller)
		if (<guitar_used_select> = 0)
			begin
			wait 1 gameframe
			guitargetanalogueinfo controller = ($<player_status>.controller)
			if ($0xaa63a5a5 = true)
				if (<0x64bcaf2b> < ($0xe270b24c))
					<frames_under> = (<frames_under> + 1)
					if (<frames_under> >= 30)
						break
					endif
				endif
			else
				if (<verticaldist> > ($<player_status>.star_tilt_threshold))
					<frames_under> = (<frames_under> + 1)
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
	wait 1 gameframe
	launchgemevent event = star_power_on player = <player>
	extendcrc star_power_on <player_text> out = type
	broadcastevent type = <type> data = {player_text = <player_text> player = <player> player_status = <player_status>}
	begin
	wait 1 gameframe
	if ($game_mode = p2_career || $game_mode = p2_coop)
		drain = ($star_power_drain_rate_coop * 1000.0 * ($current_deltatime / $<player_status>.playline_song_measure_time))
	else
		drain = ($star_power_drain_rate * 1000.0 * ($current_deltatime / $<player_status>.playline_song_measure_time))
	endif
	change structurename = <player_status> star_power_amount = ($<player_status>.star_power_amount - <drain>)
	if ($<player_status>.star_power_amount <= 0)
		change structurename = <player_status> star_power_amount = 0
		break
	endif
	repeat
	change structurename = <player_status> star_power_used = 0
	0xb9fcfeb7 player_text = <player_text> current_run = ($<player_status>.current_run) star_power = ($<player_status>.star_power_used)
	wait 1 gameframe
	launchgemevent event = star_power_off player = <player>
	extendcrc star_power_off <player_text> out = type
	broadcastevent type = <type> data = {player_text = <player_text> player_status = <player_status>}
	<do_star> = 0
	return <...>
endscript

script control_whammy_pitchshift 
	<set_pitch> = 0
	if gotparam net_whammy_length
		<len> = <net_whammy_length>
		<set_pitch> = 1
	else
		if guitargetanalogueinfo controller = ($<player_status>.controller)
			<set_pitch> = 1
			if ($<player_status>.bot_play = 1)
				<len> = 0.0
			elseif isguitarcontroller controller = ($<player_status>.controller)
				<len> = ((<rightx> + 1.0) / 2.0)
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
		set_whammy_pitchshift control = <len>
		<whammy_scale> = (((<len> * 0.5) + 0.5) * 2.0)
		setnewwhammyvalue value = <whammy_scale> time_remaining = <time> player_status = <player_status> player = (<player_status>.player)
	endif
	return whammy_value
endscript

script reset_whammy_pitchshift 
	set_whammy_pitchshift \{control = 0.0}
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
	0x1c07e771
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

script 0xccf79bcc 
	if ($replay_suspend = 1)
		return
	endif
	0x6df9c2a6 \{name = replay}
endscript

script save_replay 
	destroy_debugging_menu
	createscreenelement {
		type = textelement
		parent = root_window
		id = info_text
		font = text_a1
		pos = (640.0, 32.0)
		just = [center top]
		scale = 1.0
		rgba = [210 210 210 250]
		text = "Saving replay"
		z_priority = 1.0
	}
	wait 2 gameframes
	get_difficulty_text_nl difficulty = ($current_difficulty)
	get_song_prefix song = ($current_song)
	formattext textname = filename "replay_%s_%d" s = <song_prefix> d = <difficulty_text_nl>
	writedatabuffer name = replay filename = <filename>
	destroyscreenelement id = info_text
	create_debugging_menu
endscript

script autodetectleftys 
	if isguitarcontroller controller = ($<player_status>.controller)
		guitargetanalogueinfo controller = ($<player_status>.controller)
		if (<righttrigger> < 0)
			change structurename = <player_status> lefthanded = 0
		else
			change structurename = <player_status> lefthanded = 1
		endif
	else
		change structurename = <player_status> lefthanded = 0
	endif
	change structurename = <player_status> lefthanded_gems = ($<player_status>.lefthanded)
	change structurename = <player_status> lefthanded_button_ups = ($<player_status>.lefthanded)
endscript
resting_whammy_tolerance = 0.1

script is_whammy_resting 
	if gotparam controller
		getglobaltags user_options
		switch (<controller>)
			case 0
			resting_whammy_position = <resting_whammy_position_device_0>
			case 1
			resting_whammy_position = <resting_whammy_position_device_1>
			case 2
			resting_whammy_position = <resting_whammy_position_device_2>
			case 3
			resting_whammy_position = <resting_whammy_position_device_3>
		endswitch
	else
		controller = ($<player_status>.controller)
		resting_whammy_position = ($<player_status>.resting_whammy_position)
	endif
	guitargetanalogueinfo controller = <controller>
	if (<rightx> < <resting_whammy_position>)
		return true
	elseif ((<rightx> - <resting_whammy_position>) < ($resting_whammy_tolerance))
		return true
	endif
	return false
endscript

script dragonforce_hack_on 
	change \{dragonforce_hack = 1}
endscript

script dragonforce_hack_off 
	change \{dragonforce_hack = 0}
endscript
