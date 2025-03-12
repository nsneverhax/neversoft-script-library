
script init_play_log 
	if ($show_play_log = 1)
		<pos> = (256.0, 32.0)
		<name> = log_line
		<line> = 0
		begin
		formattext checksumname = id 'log_line_%l' l = <line> dontassertforchecksums
		createscreenelement {
			type = textelement
			parent = root_window
			id = <id>
			font = debug
			pos = <pos>
			just = [left top]
			scale = (0.7, 0.4)
			rgba = [210 210 210 250]
			text = "Some Text"
			z_priority = 1000.0
			alpha = 1
		}
		<pos> = (<pos> + (0.0, 16.0))
		<line> = (<line> + 1)
		repeat $play_log_lines
		<blank_text> = " "
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
		formattext checksumname = id 'log_line_%l' l = <line> dontassertforchecksums
		setscreenelementprops id = <id> text = ($log_strings.<id>)
		<line> = (<line> + 1)
		repeat $play_log_lines
	endif
endscript

script kill_debug_elements 
	<line> = 0
	begin
	formattext checksumname = id 'log_line_%l' l = <line> dontassertforchecksums
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
	log_line_0 = " "
	log_line_1 = " "
	log_line_2 = " "
	log_line_3 = " "
	log_line_4 = " "
	log_line_5 = " "
	log_line_6 = " "
	log_line_7 = " "
	log_line_8 = " "
	log_line_9 = " "
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
		formattext checksumname = id 'log_line_%l' l = <line> dontassertforchecksums
		setscreenelementprops id = <id> text = ($log_strings.<id>)
		formattext checksumname = col 'log_line_%l_color' l = <line> dontassertforchecksums
		switch ($log_strings.<col>)
			case green
			setscreenelementprops id = <id> rgba = [48 210 48 250]
			case darkgreen
			setscreenelementprops id = <id> rgba = [16 160 16 250]
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
				text = "Tilt!"
				z_priority = 10.0
				alpha = 1}
		endif
		formattext \{textname = text_string
			" ???"}
		controller = 0
		begin
		if isguitarcontroller controller = <controller>
			guitargetanalogueinfo controller = <controller>
			formattext textname = text_string "Tilt: %d" d = <righty>
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
				"Tilt: %a\\nLean: %b\\nNeck: %c\\nWhammy: %d"
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
	getheldpattern controller = <controller> player_status = <player_status>
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
		formattext textname = text "%t%c" t = <text> c = <char>
	else
		formattext textname = text "%t." t = <text>
	endif
	return <...>
endscript

script get_input_debug_text 
	<text> = "* "
	check_input_debug <...> controller = ($<player_status>.controller) button = x char = "G"
	check_input_debug <...> controller = ($<player_status>.controller) button = circle char = "R"
	check_input_debug <...> controller = ($<player_status>.controller) button = triangle char = "Y"
	check_input_debug <...> controller = ($<player_status>.controller) button = square char = "B"
	check_input_debug <...> controller = ($<player_status>.controller) button = l1 char = "O"
	if isguitarcontroller controller = ($<player_status>.controller)
		formattext textname = text "%t *+* " t = <text>
	else
		formattext textname = text "%t *-*" t = <text>
	endif
	return input_text = <text>
endscript

script input_debug 
	get_input_debug_text <...>
	guitargetanalogueinfo controller = ($<player_status>.controller)
	formattext textname = input_text "%t %l %r %d %x %y" t = <input_text> l = <lefttrigger> r = <righttrigger> d = <verticaldist> x = <rightx> y = <righty>
	if screenelementexists \{id = input_textp1}
		setscreenelementprops id = input_textp1 text = <input_text>
	endif
endscript

script debug_gem_text 
	if (<pattern> && 65536)
		formattext textname = text "%t%pG" t = <text> p = <prefix>
	else
		formattext textname = text "%t%p." t = <text> p = <prefix>
	endif
	if (<pattern> && 4096)
		formattext textname = text "%tR" t = <text>
	else
		formattext textname = text "%t." t = <text>
	endif
	if (<pattern> && 256)
		formattext textname = text "%tY" t = <text>
	else
		formattext textname = text "%t." t = <text>
	endif
	if (<pattern> && 16)
		formattext textname = text "%tB" t = <text>
	else
		formattext textname = text "%t." t = <text>
	endif
	if (<pattern> && 1)
		formattext textname = text "%tO " t = <text>
	else
		formattext textname = text "%t. " t = <text>
	endif
	return <...>
endscript

script debug_output 
	if ($output_log_file = 1)
		<showtime> = (<time> - ($check_time_early * 1000.0))
		formattext textname = text "%t: %d:(%c)" t = <showtime> d = ($<song> [<array_entry>] [6]) c = ($<player_status>.controller)
		if (<ignore_time> >= 0)
			debug_gem_text text = <text> pattern = <ignore_strum> prefix = "Ig: "
		else
			formattext textname = text "%tIg: ..... " t = <text>
		endif
		getheldpattern controller = ($<player_status>.controller) nobrokenstring
		debug_gem_text text = <text> pattern = <strummed_pattern> prefix = "LS: "
		debug_gem_text text = <text> pattern = <original_strum> prefix = "Or: "
		debug_gem_text text = <text> pattern = <hold_pattern> prefix = "He: "
		if (<hit_strum> = 1)
			if (<fake_strum> = 1)
				formattext textname = text "%t H " t = <text>
			else
				formattext textname = text "%t S " t = <text>
			endif
		else
			if (<fake_strum> = 1)
				formattext textname = text "%t F " t = <text>
			else
				formattext textname = text "%t . " t = <text>
			endif
		endif
		if (<strummed_before_forming> >= 0.0)
			formattext textname = text "%t T " t = <text>
		else
			formattext textname = text "%t   " t = <text>
		endif
		get_input_debug_text <...>
		formattext textname = text "%t%h%m%u%l%i" t = <text> h = <action_hit> m = <action_mis> u = <action_unn> l = <action_tol> i = <input_text>
		formattext textname = text "%t :%o:" t = <text> o = ($<player_status>.hammer_on_tolerance)
		<check_entry> = <array_entry>
		if (<time> >= $<song> [<check_entry>] [0])
			begin
			getstrumpattern song = <song> entry = <check_entry>
			<hammer> = ($<song> [<check_entry>] [6])
			if (<hammer> = 1)
				debug_gem_text text = <text> pattern = <strum> prefix = "h"
			else
				debug_gem_text text = <text> pattern = <strum> prefix = ">"
			endif
			if ((<check_entry> + 1) < <song_array_size>)
				<check_entry> = (<check_entry> + 1)
			else
				break
			endif
			if (<time> < ($<song> [<check_entry>] [0]))
				break
			endif
			repeat
		endif
		getarraysize <strum_hits>
		if (<array_size> > 0)
			formattext textname = text "%t S(" t = <text>
			<index> = 0
			begin
			<strum> = (<strum_hits> [<index>])
			debug_gem_text text = <text> pattern = <strum> prefix = ""
			<index> = (<index> + 1)
			repeat <array_size>
			formattext textname = text "%t)" t = <text>
		endif
		getarraysize <hammer_hits>
		if (<array_size> > 0)
			formattext textname = text "%t H(" t = <text>
			<index> = 0
			begin
			<strum> = (<hammer_hits> [<index>])
			debug_gem_text text = <text> pattern = <strum> prefix = ""
			<index> = (<index> + 1)
			repeat <array_size>
			formattext textname = text "%t)" t = <text>
		endif
		extendcrc log ($<player_status>.text) out = log_channel
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
	printf "Sensor Value %v" v = <righty>
	drighty = (<righty> - <last_righty>)
	ddrighty = (<drighty> - <last_drighty>)
	if (<drighty> > <spike_threshold> || <drighty> < -1.0 * <spike_threshold>)
		printf \{"Velocity Spike!!!"}
	endif
	if (<ddrighty> > 2.0 * <spike_threshold> || <ddrighty> < -2.0 * <spike_threshold>)
		printf \{"Acceleration Spike!!!"}
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
		text = "Particle failed: Too many at once"
		font = text_a1
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
		return \{build_version_string = "<unknown>"}
	endif
endscript

script debug_toggle_changelist 
	if (($show_build_version = 0) || (gotparam show))
		change \{show_build_version = 1}
		if screenelementexists \{id = debug_show_build_version_element}
			return
		endif
		get_data_version
		formattext textname = build_version_text "changelist %v" v = <build_version_string>
		createscreenelement {
			type = textelement
			parent = root_window
			id = debug_show_build_version_element
			font = text_a1
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
