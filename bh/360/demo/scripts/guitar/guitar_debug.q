
script init_play_log 
	if ($show_play_log = 1)
		<pos> = (256.0, 32.0)
		<name> = log_line
		<line> = 0
		begin
		formattext checksumname = id 'log_line_%l' l = <line>
		createscreenelement {
			type = textelement
			parent = root_window
			id = <id>
			font = debug
			pos = <pos>
			just = [left top]
			scale = (0.9, 0.7)
			rgba = [230 230 230 250]
			text = qs(0x5646a42d)
			z_priority = 1000.0
			alpha = 1
		}
		<pos> = (<pos> + (0.0, 26.0))
		<line> = (<line> + 1)
		repeat $play_log_lines
		<blank_text> = qs(0x713755f7)
		change log_strings = ($log_strings + {log_line_0 = <blank_text>})
		change log_strings = ($log_strings + {log_line_1 = <blank_text>})
		change log_strings = ($log_strings + {log_line_2 = <blank_text>})
		change log_strings = ($log_strings + {log_line_3 = <blank_text>})
		change log_strings = ($log_strings + {log_line_4 = <blank_text>})
		change log_strings = ($log_strings + {log_line_5 = <blank_text>})
		change log_strings = ($log_strings + {log_line_6 = <blank_text>})
		change log_strings = ($log_strings + {log_line_7 = <blank_text>})
		change log_strings = ($log_strings + {log_line_8 = <blank_text>})
		change log_strings = ($log_strings + {log_line_9 = <blank_text>})
		<line> = 0
		begin
		formattext checksumname = id 'log_line_%l' l = <line>
		setscreenelementprops id = <id> text = ($log_strings.<id>)
		<line> = (<line> + 1)
		repeat $play_log_lines
	endif
endscript

script kill_debug_elements 
	<line> = 0
	begin
	formattext checksumname = id 'log_line_%l' l = <line>
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
	<line> = (<line> + 1)
	repeat $play_log_lines
	if screenelementexists \{id = guitar_tilt_debug}
		destroyscreenelement \{id = guitar_tilt_debug}
	endif
endscript
log_strings = {
	log_line_0 = qs(0x713755f7)
	log_line_1 = qs(0x713755f7)
	log_line_2 = qs(0x713755f7)
	log_line_3 = qs(0x713755f7)
	log_line_4 = qs(0x713755f7)
	log_line_5 = qs(0x713755f7)
	log_line_6 = qs(0x713755f7)
	log_line_7 = qs(0x713755f7)
	log_line_8 = qs(0x713755f7)
	log_line_9 = qs(0x713755f7)
	log_line_0_color = green
	log_line_1_color = green
	log_line_2_color = green
	log_line_3_color = green
	log_line_4_color = green
	log_line_5_color = green
	log_line_6_color = green
	log_line_7_color = green
	log_line_8_color = green
	log_line_9_color = green
}

script output_log_text 
	if ($show_play_log = 1)
		formattext textname = text_string <...>
		<line_1> = ($log_strings.log_line_1)
		<line_2> = ($log_strings.log_line_2)
		<line_3> = ($log_strings.log_line_3)
		<line_4> = ($log_strings.log_line_4)
		<line_5> = ($log_strings.log_line_5)
		<line_6> = ($log_strings.log_line_6)
		<line_7> = ($log_strings.log_line_7)
		<line_8> = ($log_strings.log_line_8)
		<line_9> = ($log_strings.log_line_9)
		change log_strings = ($log_strings + {log_line_0 = <line_1>})
		change log_strings = ($log_strings + {log_line_1 = <line_2>})
		change log_strings = ($log_strings + {log_line_2 = <line_3>})
		change log_strings = ($log_strings + {log_line_3 = <line_4>})
		change log_strings = ($log_strings + {log_line_4 = <line_5>})
		change log_strings = ($log_strings + {log_line_5 = <line_6>})
		change log_strings = ($log_strings + {log_line_6 = <line_7>})
		change log_strings = ($log_strings + {log_line_7 = <line_8>})
		change log_strings = ($log_strings + {log_line_8 = <line_9>})
		<color_1> = ($log_strings.log_line_1_color)
		<color_2> = ($log_strings.log_line_2_color)
		<color_3> = ($log_strings.log_line_3_color)
		<color_4> = ($log_strings.log_line_4_color)
		<color_5> = ($log_strings.log_line_5_color)
		<color_6> = ($log_strings.log_line_6_color)
		<color_7> = ($log_strings.log_line_7_color)
		<color_8> = ($log_strings.log_line_8_color)
		<color_9> = ($log_strings.log_line_9_color)
		change log_strings = ($log_strings + {log_line_0_color = <color_1>})
		change log_strings = ($log_strings + {log_line_1_color = <color_2>})
		change log_strings = ($log_strings + {log_line_2_color = <color_3>})
		change log_strings = ($log_strings + {log_line_3_color = <color_4>})
		change log_strings = ($log_strings + {log_line_4_color = <color_5>})
		change log_strings = ($log_strings + {log_line_5_color = <color_6>})
		change log_strings = ($log_strings + {log_line_6_color = <color_7>})
		change log_strings = ($log_strings + {log_line_7_color = <color_8>})
		change log_strings = ($log_strings + {log_line_8_color = <color_9>})
		switch ($play_log_lines)
			case 1
			change log_strings = ($log_strings + {log_line_0 = <text_string>})
			change log_strings = ($log_strings + {log_line_0_color = <color>})
			case 2
			change log_strings = ($log_strings + {log_line_1 = <text_string>})
			change log_strings = ($log_strings + {log_line_1_color = <color>})
			case 3
			change log_strings = ($log_strings + {log_line_2 = <text_string>})
			change log_strings = ($log_strings + {log_line_2_color = <color>})
			case 4
			change log_strings = ($log_strings + {log_line_3 = <text_string>})
			change log_strings = ($log_strings + {log_line_3_color = <color>})
			case 5
			change log_strings = ($log_strings + {log_line_4 = <text_string>})
			change log_strings = ($log_strings + {log_line_4_color = <color>})
			case 6
			change log_strings = ($log_strings + {log_line_5 = <text_string>})
			change log_strings = ($log_strings + {log_line_5_color = <color>})
			case 7
			change log_strings = ($log_strings + {log_line_6 = <text_string>})
			change log_strings = ($log_strings + {log_line_6_color = <color>})
			case 8
			change log_strings = ($log_strings + {log_line_7 = <text_string>})
			change log_strings = ($log_strings + {log_line_7_color = <color>})
			case 9
			change log_strings = ($log_strings + {log_line_8 = <text_string>})
			change log_strings = ($log_strings + {log_line_8_color = <color>})
			case 10
			change log_strings = ($log_strings + {log_line_9 = <text_string>})
			change log_strings = ($log_strings + {log_line_9_color = <color>})
		endswitch
		<line> = 0
		begin
		formattext checksumname = id 'log_line_%l' l = <line>
		setscreenelementprops id = <id> text = ($log_strings.<id>)
		formattext checksumname = col 'log_line_%l_color' l = <line>
		switch ($log_strings.<col>)
			case green
			setscreenelementprops id = <id> rgba = [48 250 48 250]
			case darkgreen
			setscreenelementprops id = <id> rgba = [16 200 16 250]
			case red
			setscreenelementprops id = <id> rgba = [210 48 48 250]
			case darkred
			setscreenelementprops id = <id> rgba = [160 16 16 250]
			case orange
			setscreenelementprops id = <id> rgba = [210 128 16 250]
			default
			setscreenelementprops id = <id> rgba = [210 210 210 250]
		endswitch
		<line> = (<line> + 1)
		repeat $play_log_lines
	endif
endscript

script guitar_tilt_debug_display 
	if ($show_guitar_tilt = 1)
		if NOT screenelementexists \{id = guitar_tilt_debug}
			createscreenelement \{type = textelement
				parent = root_window
				id = guitar_tilt_debug
				font = debug
				pos = (640.0, 400.0)
				just = [
					center
					center
				]
				scale = 2.0
				rgba = [
					210
					210
					210
					250
				]
				text = qs(0x7e7c5652)
				z_priority = 10.0
				alpha = 1}
		endif
		formattext \{textname = text_string
			qs(0xc511dcd6)}
		controller = 0
		begin
		if isguitarcontroller controller = <controller>
			guitargetanalogueinfo controller = <controller>
			formattext textname = text_string qs(0x3993100d) d = <righty>
		endif
		<controller> = (<controller> + 1)
		repeat 4
		setscreenelementprops id = guitar_tilt_debug text = <text_string>
	endif
endscript

script guitar_sensor_debug 
	if ($show_sensor_debug)
		if NOT screenelementexists \{id = guitar_sensor_debug}
			createscreenelement \{type = textblockelement
				parent = root_window
				id = guitar_sensor_debug
				font = debug
				scale = 0.75
				pos = (64.0, 64.0)
				dims = (256.0, 256.0)
				just = [
					left
					top
				]
				rgba = [
					210
					210
					210
					255
				]
				z_priority = 10.0
				alpha = 0.8}
		endif
		control = -1
		if isguitarcontroller \{controller = 0}
			<control> = 0
		else
			if isguitarcontroller \{controller = 1}
				<control> = 1
			endif
		endif
		if (<control> >= 0)
			guitargetanalogueinfo controller = <control>
			formattext {
				textname = text_string
				qs(0x1a8ba1e3)
				a = <r2raw>
				b = <l2raw>
				c = <righty>
				d = <rightx>
			}
			setscreenelementprops id = guitar_sensor_debug text = <text_string>
		endif
	endif
endscript

script check_input_debug 
	getheldpattern controller = <controller> player = <player>
	pressed = 0
	switch hold_pattern
		case 65536
		if (<button> = x)
			<pressed> = 1
		endif
		case 4096
		if (<button> = circle)
			<pressed> = 1
		endif
		case 256
		if (<button> = triangle)
			<pressed> = 1
		endif
		case 16
		if (<button> = square)
			<pressed> = 1
		endif
		case 1
		if (<button> = l1)
			<pressed> = 1
		endif
	endswitch
	if (<pressed> = 1)
		formattext textname = text qs(0xc1c48dbe) t = <text> c = <char>
	else
		formattext textname = text qs(0x79548c8f) t = <text>
	endif
	return <...>
endscript

script get_input_debug_text 
	<text> = qs(0xbac567f0)
	getplayerinfo <player> controller
	check_input_debug <...> controller = <controller> button = x char = qs(0x5b8ba897)
	check_input_debug <...> controller = <controller> button = circle char = qs(0x6c3e4e83)
	check_input_debug <...> controller = <controller> button = triangle char = qs(0x8fca9748)
	check_input_debug <...> controller = <controller> button = square char = qs(0x26fc5cd2)
	check_input_debug <...> controller = <controller> button = l1 char = qs(0x9352229f)
	if isguitarcontroller controller = <controller>
		formattext textname = text qs(0xe76f0f8f) t = <text>
	else
		formattext textname = text qs(0x0a31bf1d) t = <text>
	endif
	return input_text = <text>
endscript

script input_debug 
	get_input_debug_text <...>
	getplayerinfo <player> controller
	guitargetanalogueinfo controller = <controller>
	formattext textname = input_text qs(0xf9ae1888) t = <input_text> l = <lefttrigger> r = <righttrigger> d = <verticaldist> x = <rightx> y = <righty>
	if screenelementexists \{id = input_textp1}
		setscreenelementprops id = input_textp1 text = <input_text>
	endif
endscript

script debug_gem_text 
	if (<pattern> && 65536)
		formattext textname = text qs(0x14db9cdc) t = <text> p = <prefix>
	else
		formattext textname = text qs(0xa0e44c32) t = <text> p = <prefix>
	endif
	if (<pattern> && 4096)
		formattext textname = text qs(0xfadeba75) t = <text>
	else
		formattext textname = text qs(0x79548c8f) t = <text>
	endif
	if (<pattern> && 256)
		formattext textname = text qs(0x192a63be) t = <text>
	else
		formattext textname = text qs(0x79548c8f) t = <text>
	endif
	if (<pattern> && 16)
		formattext textname = text qs(0xb01ca824) t = <text>
	else
		formattext textname = text qs(0x79548c8f) t = <text>
	endif
	if (<pattern> && 1)
		formattext textname = text qs(0x4e0b861f) t = <text>
	else
		formattext textname = text qs(0xcd911679) t = <text>
	endif
	return <...>
endscript

script debug_output 
	if ($output_log_file = 1)
		<showtime> = (<time> - ($check_time_early * 1000.0))
		getplayerinfo <player> controller
		formattext textname = text qs(0x6f973620) t = <showtime> c = <controller>
		if (<ignore_time> >= 0)
			debug_gem_text text = <text> pattern = <ignore_strum> prefix = qs(0x10ec1370)
		else
			formattext textname = text qs(0xbf0b68d5) t = <text>
		endif
		getheldpattern controller = <controller> player = <player>
		debug_gem_text text = <text> pattern = <strummed_pattern> prefix = qs(0xc7e758af)
		debug_gem_text text = <text> pattern = <original_strum> prefix = qs(0x859889df)
		debug_gem_text text = <text> pattern = <hold_pattern> prefix = qs(0x918eb2e5)
		if (<hit_strum> = 1)
			if (<fake_strum> = 1)
				formattext textname = text qs(0x5b352041) t = <text>
			else
				formattext textname = text qs(0xdc2df0df) t = <text>
			endif
		else
			if (<fake_strum> = 1)
				formattext textname = text qs(0xbbea5772) t = <text>
			else
				formattext textname = text qs(0x4578889e) t = <text>
			endif
		endif
		if (<strummed_before_forming> >= 0.0)
			formattext textname = text qs(0x41fac866) t = <text>
		else
			formattext textname = text qs(0xa5a7ffad) t = <text>
		endif
		if (<tapping> = 1)
			action_tap = qs(0x18c99bac)
		else
			action_tap = qs(0x984478a5)
		endif
		get_input_debug_text <...>
		formattext textname = text qs(0x4793bf41) t = <text> h = <action_hit> m = <action_mis> u = <action_unn> l = <action_tol> i = <input_text> k = <action_tap>
		getplayerinfo <player> hammer_on_tolerance
		formattext textname = text qs(0xd30b02ca) t = <text> o = <hammer_on_tolerance> n = <notes_open>
		getarraysize <strum_hits>
		if (<array_size> > 0)
			formattext textname = text qs(0x14f47ad7) t = <text>
			<index> = 0
			begin
			<strum> = (<strum_hits> [<index>])
			debug_gem_text text = <text> pattern = <strum> prefix = qs(0x03ac90f0)
			<index> = (<index> + 1)
			repeat <array_size>
			formattext textname = text qs(0x36151a48) t = <text>
		endif
		getarraysize <hammer_hits>
		if (<array_size> > 0)
			formattext textname = text qs(0x93ecaa49) t = <text>
			<index> = 0
			begin
			<strum> = (<hammer_hits> [<index>])
			debug_gem_text text = <text> pattern = <strum> prefix = qs(0x03ac90f0)
			<index> = (<index> + 1)
			repeat <array_size>
			formattext textname = text qs(0x36151a48) t = <text>
		endif
		if gotparam \{off_note}
			get_lag_values
			<off_note> = (0 - (<off_note> - ($time_input_offset + <audio_offset> + <video_offset>)))
			casttointeger \{off_note}
			formattext textname = text qs(0x7fe80a6d) t = <text> o = <off_note>
		endif
		extendcrcplayer log <player> out = log_channel
		printf channel = <log_channel> <text>
	endif
endscript

script start_sensor_debug_output 
	killspawnedscript \{name = sensor_debug_output}
	if NOT gotparam \{controller}
		controller = $primary_controller
	endif
	spawnscriptnow sensor_debug_output params = <...>
endscript

script stop_sensor_debug_output 
	killspawnedscript \{name = sensor_debug_output}
endscript

script sensor_debug_output 
	last_righty = 0.0
	drighty = 0.0
	last_drighty = 0.0
	ddrighty = 0.0
	spike_threshold = 0.3
	begin
	guitargetanalogueinfo controller = <controller>
	printf qs(0x29d5f349) v = <righty>
	drighty = (<righty> - <last_righty>)
	ddrighty = (<drighty> - <last_drighty>)
	if (<drighty> > <spike_threshold> || <drighty> < -1.0 * <spike_threshold>)
		printf \{qs(0x8369fa26)}
	endif
	if (<ddrighty> > 2.0 * <spike_threshold> || <ddrighty> < -2.0 * <spike_threshold>)
		printf \{qs(0xe616a58a)}
	endif
	<last_righty> = (<righty>)
	<last_drighty> = (<drighty>)
	wait \{1
		gameframe}
	repeat
endscript

script flexparticlewarning 
	setscreenelementlock \{id = root_window
		off}
	if objectexists \{id = particle_warn_anchor}
		destroyscreenelement \{id = particle_warn_anchor}
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = particle_warn_anchor
		pos = (25.0, 80.0)
		just = [
			center
			center
		]
		internal_just = [
			left
			center
		]}
	createscreenelement \{type = textelement
		parent = particle_warn_anchor
		id = particle_warn_text
		pos = (0.0, 0.0)
		text = qs(0x475886ae)
		font = debug
		rgba = [
			255
			0
			0
			255
		]
		just = [
			left
			top
		]}
	setscreenelementlock \{id = root_window
		on}
	wait \{2
		seconds}
	if objectexists \{id = particle_warn_anchor}
		destroyscreenelement \{id = particle_warn_anchor}
	endif
endscript
show_build_version = 0

script get_data_version 
	if globalexists \{name = dataversionnumber
			type = int}
		return \{build_version_string = $dataversionnumber}
	else
		return \{build_version_string = qs(0xa918ce06)}
	endif
endscript

script debug_toggle_changelist 
	if (($show_build_version = 0) || (gotparam show))
		change \{show_build_version = 1}
		if screenelementexists \{id = debug_show_build_version_element}
			return
		endif
		get_data_version
		formattext textname = build_version_text qs(0x621151da) v = <build_version_string>
		createscreenelement {
			type = textelement
			parent = root_window
			id = debug_show_build_version_element
			font = debug
			just = [left top]
			pos = {(0.15, 0.05) proportional}
			text = <build_version_text>
			rgba = [200 200 200 255]
			scale = 0.75
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
			z_priority = 100000
		}
	else
		change \{show_build_version = 0}
		if screenelementexists \{id = debug_show_build_version_element}
			destroyscreenelement \{id = debug_show_build_version_element}
		endif
	endif
endscript

script charge_star_power \{player = 1}
	if ((gamemode_isbandscoring) && (($use_star_power_prototype) = 0))
		getplayerinfo <player> band
		setbandinfo <band> star_power_amount = 100.0
	else
		setplayerinfo <player> star_power_amount = 100.0
	endif
endscript

script activate_star_power \{player = 1}
	star_power_activate_and_drain <...>
endscript

script debug_break 
	printstruct channel = bkutcher <...>
	printscriptinfo \{channel = bkutcher}
	isplayer
endscript

script wait_until_ingame \{player = 1}
	begin
	if NOT playerinfoequals <player> playline_song_measure_time = 0
		break
	endif
	wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_infinite_star_power \{player = 1}
	wait_until_ingame player = <player>
	charge_star_power player = <player>
	spawnscriptnow activate_star_power params = {player = <player> infinite_drain}
	begin
	charge_star_power player = <player>
	wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_trigger_star_power \{player = 1}
	wait_until_ingame player = <player>
	begin
	getplayerinfo <player> star_power_amount
	if (<star_power_amount> >= 50.0)
		activate_star_power player = <player>
	endif
	getbandinfo \{1
		star_power_amount}
	if (<star_power_amount> >= 50.0)
		activate_star_power player = <player>
	endif
	wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_full_star_power \{player = 1}
	wait_until_ingame player = <player>
	begin
	if playerinfoequals <player> star_power_used = 0
		charge_star_power player = <player>
	endif
	wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script init_star_power_debug \{player = 1}
	if playerinfoequals <player> star_power_debug_mode = 1
		spawnscriptnow auto_infinite_star_power params = {player = <player>}
	else
		if playerinfoequals <player> star_power_debug_mode = 2
			spawnscriptnow auto_trigger_star_power params = {player = <player>}
		else
			if playerinfoequals <player> star_power_debug_mode = 3
				spawnscriptnow auto_full_star_power params = {player = <player>}
			endif
		endif
	endif
endscript

script deinit_star_power_debug 
	killspawnedscript \{name = auto_infinite_star_power}
	killspawnedscript \{name = auto_trigger_star_power}
	killspawnedscript \{name = auto_full_star_power}
	killspawnedscript \{name = activate_star_power}
endscript

script update_rock_meter_debug_text 
	begin
	if screenelementexists id = <id>
		getnumplayersingame
		if (<num_players> > 1)
			getfirstplayer
			begin
			<part> = qs(0xbc6d5b69)
			if playerinfoequals <player> part = bass
				<part> = qs(0x26fc5cd2)
			endif
			if playerinfoequals <player> part = guitar
				<part> = qs(0x5b8ba897)
			endif
			if playerinfoequals <player> part = drum
				<part> = qs(0x70a6fb54)
			endif
			if playerinfoequals <player> part = vocals
				<part> = qs(0x08528b87)
			endif
			formattext checksumname = rmdt 'rock_meter_debug_text%i' i = <player> addtostringlookup = true
			getplayerinfo <player> current_health
			formattext textname = string qs(0x589fda4a) p = <part> v = <current_health>
			setscreenelementprops id = <rmdt> text = <string>
			getnextplayer player = <player>
			repeat $<num_players>
		endif
		formattext \{textname = text_string
			qs(0x0bc409e2)
			a = $current_crowd}
		setscreenelementprops id = <id> text = <text_string>
	endif
	wait \{1
		gameframe}
	repeat
endscript
