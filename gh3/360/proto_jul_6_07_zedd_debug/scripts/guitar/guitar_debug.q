
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
		if NOT screenelementexists id = guitar_tilt_debug
			createscreenelement {
				type = textelement
				parent = root_window
				id = guitar_tilt_debug
				font = debug
				pos = (640.0, 400.0)
				just = [center center]
				scale = 2.0
				rgba = [210 210 210 250]
				text = "Tilt!"
				z_priority = 10.0
				alpha = 1
			}
		endif
		if isguitarcontroller controller = 0
			guitargetanalogueinfo controller = 0
			formattext textname = text_string "Tilt: %d" d = <verticaldist>
		else
			if isguitarcontroller controller = 1
				guitargetanalogueinfo controller = 1
				formattext textname = text_string "Tilt: %d" d = <verticaldist>
			else
				formattext textname = text_string " "
			endif
		endif
		setscreenelementprops id = guitar_tilt_debug text = <text_string>
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
