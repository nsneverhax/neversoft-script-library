
script init_play_log 
	if ($show_play_log = 1)
		<pos> = (256.0, 32.0)
		<name> = log_line
		<line> = 0
		begin
		FormatText checksumname = id 'log_line_%l' l = <line>
		CreateScreenElement {
			type = TextElement
			parent = root_window
			id = <id>
			font = debug
			pos = <pos>
			just = [left top]
			scale = (0.9, 0.7)
			rgba = [230 230 230 250]
			text = qs("\LSome Text")
			z_priority = 1000.0
			alpha = 1
		}
		<pos> = (<pos> + (0.0, 26.0))
		<line> = (<line> + 1)
		repeat $play_log_lines
		<blank_text> = qs("\L ")
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
		FormatText checksumname = id 'log_line_%l' l = <line>
		SetScreenElementProps id = <id> text = ($log_strings.<id>)
		<line> = (<line> + 1)
		repeat $play_log_lines
	endif
endscript

script kill_debug_elements 
	<line> = 0
	begin
	FormatText checksumname = id 'log_line_%l' l = <line>
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
	<line> = (<line> + 1)
	repeat $play_log_lines
	if ScreenElementExists \{id = guitar_tilt_debug}
		DestroyScreenElement \{id = guitar_tilt_debug}
	endif
endscript
log_strings = {
	log_line_0 = qs("\L ")
	log_line_1 = qs("\L ")
	log_line_2 = qs("\L ")
	log_line_3 = qs("\L ")
	log_line_4 = qs("\L ")
	log_line_5 = qs("\L ")
	log_line_6 = qs("\L ")
	log_line_7 = qs("\L ")
	log_line_8 = qs("\L ")
	log_line_9 = qs("\L ")
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
		FormatText TextName = text_string <...>
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
		FormatText checksumname = id 'log_line_%l' l = <line>
		SetScreenElementProps id = <id> text = ($log_strings.<id>)
		FormatText checksumname = col 'log_line_%l_color' l = <line>
		switch ($log_strings.<col>)
			case green
			SetScreenElementProps id = <id> rgba = [48 250 48 250]
			case darkgreen
			SetScreenElementProps id = <id> rgba = [16 200 16 250]
			case red
			SetScreenElementProps id = <id> rgba = [210 48 48 250]
			case darkred
			SetScreenElementProps id = <id> rgba = [160 16 16 250]
			case Orange
			SetScreenElementProps id = <id> rgba = [210 128 16 250]
			default
			SetScreenElementProps id = <id> rgba = [210 210 210 250]
		endswitch
		<line> = (<line> + 1)
		repeat $play_log_lines
	endif
endscript

script guitar_tilt_debug_display 
	if ($show_guitar_tilt = 1)
		if NOT ScreenElementExists \{id = guitar_tilt_debug}
			CreateScreenElement \{type = TextElement
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
				text = qs("\LTilt!")
				z_priority = 10.0
				alpha = 1}
		endif
		FormatText \{TextName = text_string
			qs("\L ???")}
		controller = 0
		begin
		if IsGuitarController controller = <controller>
			GuitarGetAnalogueInfo controller = <controller>
			FormatText TextName = text_string qs("\LTilt: %d") d = <RightY>
		endif
		<controller> = (<controller> + 1)
		repeat 4
		SetScreenElementProps id = guitar_tilt_debug text = <text_string>
	endif
endscript

script guitar_sensor_debug 
	if ($show_sensor_debug)
		if NOT ScreenElementExists \{id = guitar_sensor_debug}
			CreateScreenElement \{type = TextBlockElement
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
		if IsGuitarController \{controller = 0}
			<control> = 0
		else
			if IsGuitarController \{controller = 1}
				<control> = 1
			endif
		endif
		if (<control> >= 0)
			GuitarGetAnalogueInfo controller = <control>
			FormatText {
				TextName = text_string
				qs("Tilt: %a\nLean: %b\nNeck: %c\nWhammy: %d")
				a = <r2raw>
				b = <l2raw>
				c = <RightY>
				d = <rightx>
			}
			SetScreenElementProps id = guitar_sensor_debug text = <text_string>
		endif
	endif
endscript

script check_input_debug 
	GetHeldPattern controller = <controller> player = ($<player_status>.player) player_status = <player_status>
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
		if (<button> = L1)
			<pressed> = 1
		endif
	endswitch
	if (<pressed> = 1)
		FormatText TextName = text qs("\L%t%c") t = <text> c = <char>
	else
		FormatText TextName = text qs("\L%t.") t = <text>
	endif
	return <...>
endscript

script get_input_debug_text 
	<text> = qs("\L* ")
	check_input_debug <...> controller = ($<player_status>.controller) button = x char = qs("\LG")
	check_input_debug <...> controller = ($<player_status>.controller) button = circle char = qs("\LR")
	check_input_debug <...> controller = ($<player_status>.controller) button = triangle char = qs("\LY")
	check_input_debug <...> controller = ($<player_status>.controller) button = square char = qs("\LB")
	check_input_debug <...> controller = ($<player_status>.controller) button = L1 char = qs("\LO")
	if IsGuitarController controller = ($<player_status>.controller)
		FormatText TextName = text qs("\L%t *+* ") t = <text>
	else
		FormatText TextName = text qs("\L%t *-*") t = <text>
	endif
	return input_text = <text>
endscript

script input_debug 
	get_input_debug_text <...>
	GuitarGetAnalogueInfo controller = ($<player_status>.controller)
	FormatText TextName = input_text qs("\L%t %l %r %d %x %y") t = <input_text> l = <lefttrigger> r = <righttrigger> d = <VerticalDist> x = <rightx> y = <RightY>
	if ScreenElementExists \{id = input_textp1}
		SetScreenElementProps id = input_textp1 text = <input_text>
	endif
endscript

script debug_gem_text 
	if (<pattern> && 65536)
		FormatText TextName = text qs("\L%t%pG") t = <text> p = <prefix>
	else
		FormatText TextName = text qs("\L%t%p.") t = <text> p = <prefix>
	endif
	if (<pattern> && 4096)
		FormatText TextName = text qs("\L%tR") t = <text>
	else
		FormatText TextName = text qs("\L%t.") t = <text>
	endif
	if (<pattern> && 256)
		FormatText TextName = text qs("\L%tY") t = <text>
	else
		FormatText TextName = text qs("\L%t.") t = <text>
	endif
	if (<pattern> && 16)
		FormatText TextName = text qs("\L%tB") t = <text>
	else
		FormatText TextName = text qs("\L%t.") t = <text>
	endif
	if (<pattern> && 1)
		FormatText TextName = text qs("\L%tO ") t = <text>
	else
		FormatText TextName = text qs("\L%t. ") t = <text>
	endif
	return <...>
endscript

script debug_output 
	if ($output_log_file = 1)
		<showtime> = (<time> - ($check_time_early * 1000.0))
		FormatText TextName = text qs("\L%t: (%c)") t = <showtime> c = ($<player_status>.controller)
		if (<ignore_time> >= 0)
			debug_gem_text text = <text> pattern = <ignore_strum> prefix = qs("\LIg: ")
		else
			FormatText TextName = text qs("\L%tIg: ..... ") t = <text>
		endif
		GetHeldPattern controller = ($<player_status>.controller) player = ($<player_status>.player) nobrokenstring
		debug_gem_text text = <text> pattern = <strummed_pattern> prefix = qs("\LLS: ")
		debug_gem_text text = <text> pattern = <original_strum> prefix = qs("\LOr: ")
		debug_gem_text text = <text> pattern = <hold_pattern> prefix = qs("\LHe: ")
		if (<hit_strum> = 1)
			if (<fake_strum> = 1)
				FormatText TextName = text qs("\L%t H ") t = <text>
			else
				FormatText TextName = text qs("\L%t S ") t = <text>
			endif
		else
			if (<fake_strum> = 1)
				FormatText TextName = text qs("\L%t F ") t = <text>
			else
				FormatText TextName = text qs("\L%t . ") t = <text>
			endif
		endif
		if (<strummed_before_forming> >= 0.0)
			FormatText TextName = text qs("\L%t T ") t = <text>
		else
			FormatText TextName = text qs("\L%t   ") t = <text>
		endif
		if (<tapping> = 1)
			action_tap = qs(" TAP ")
		else
			action_tap = qs("     ")
		endif
		get_input_debug_text <...>
		FormatText TextName = text qs("\L%t%h%m%u%l%k%i") t = <text> h = <action_hit> m = <action_mis> u = <action_unn> l = <action_tol> i = <input_text> k = <action_tap>
		FormatText TextName = text qs("\L%t :%o: %n") t = <text> o = ($<player_status>.hammer_on_tolerance) n = <notes_open>
		GetArraySize <strum_hits>
		if (<array_size> > 0)
			FormatText TextName = text qs("\L%t S(") t = <text>
			<index> = 0
			begin
			<strum> = (<strum_hits> [<index>])
			debug_gem_text text = <text> pattern = <strum> prefix = qs("\L")
			<index> = (<index> + 1)
			repeat <array_size>
			FormatText TextName = text qs("\L%t)") t = <text>
		endif
		GetArraySize <hammer_hits>
		if (<array_size> > 0)
			FormatText TextName = text qs("\L%t H(") t = <text>
			<index> = 0
			begin
			<strum> = (<hammer_hits> [<index>])
			debug_gem_text text = <text> pattern = <strum> prefix = qs("\L")
			<index> = (<index> + 1)
			repeat <array_size>
			FormatText TextName = text qs("\L%t)") t = <text>
		endif
		if GotParam \{off_note}
			GetGlobalTags \{user_options}
			if GotParam \{lag_calibration}
				CastToInteger \{lag_calibration}
				Mod a = <lag_calibration> b = 1000
				<video_offset> = <Mod>
				<audio_offset> = ((<lag_calibration> / 1000) - 1)
				<off_note> = (0 - (<off_note> - ($time_input_offset + <audio_offset> + <video_offset>)))
				CastToInteger \{off_note}
			endif
			FormatText TextName = text qs("\L%t (%oms)") t = <text> o = <off_note>
		endif
		ExtendCRC log ($<player_status>.text) out = log_channel
		printf channel = <log_channel> <text>
	endif
endscript

script start_sensor_debug_output 
	KillSpawnedScript \{name = sensor_debug_output}
	if NOT GotParam \{controller}
		controller = $primary_controller
	endif
	spawnscriptnow sensor_debug_output params = <...>
endscript

script stop_sensor_debug_output 
	KillSpawnedScript \{name = sensor_debug_output}
endscript

script sensor_debug_output 
	last_righty = 0.0
	drighty = 0.0
	last_drighty = 0.0
	ddrighty = 0.0
	spike_threshold = 0.3
	begin
	GuitarGetAnalogueInfo controller = <controller>
	printf qs("\LSensor Value %v") v = <RightY>
	drighty = (<RightY> - <last_righty>)
	ddrighty = (<drighty> - <last_drighty>)
	if (<drighty> > <spike_threshold> || <drighty> < -1.0 * <spike_threshold>)
		printf \{qs("\LVelocity Spike!!!")}
	endif
	if (<ddrighty> > 2.0 * <spike_threshold> || <ddrighty> < -2.0 * <spike_threshold>)
		printf \{qs("\LAcceleration Spike!!!")}
	endif
	<last_righty> = (<RightY>)
	<last_drighty> = (<drighty>)
	Wait \{1
		gameframe}
	repeat
endscript

script FlexParticleWarning 
	SetScreenElementLock \{id = root_window
		off}
	if ObjectExists \{id = particle_warn_anchor}
		DestroyScreenElement \{id = particle_warn_anchor}
	endif
	CreateScreenElement \{type = ContainerElement
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
	CreateScreenElement \{type = TextElement
		parent = particle_warn_anchor
		id = particle_warn_text
		pos = (0.0, 0.0)
		text = qs("\LParticle failed: Too many at once")
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
	SetScreenElementLock \{id = root_window
		on}
	Wait \{2
		seconds}
	if ObjectExists \{id = particle_warn_anchor}
		DestroyScreenElement \{id = particle_warn_anchor}
	endif
endscript
show_build_version = 0

script get_data_version 
	if GlobalExists \{name = DataVersionNumber
			type = int}
		return \{build_version_string = $DataVersionNumber}
	else
		return \{build_version_string = qs("\L<unknown>")}
	endif
endscript

script debug_toggle_changelist 
	if (($show_build_version = 0) || (GotParam show))
		change \{show_build_version = 1}
		if ScreenElementExists \{id = debug_show_build_version_element}
			return
		endif
		get_data_version
		FormatText TextName = build_version_text qs("\Lchangelist %v") v = <build_version_string>
		CreateScreenElement {
			type = TextElement
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
		if ScreenElementExists \{id = debug_show_build_version_element}
			DestroyScreenElement \{id = debug_show_build_version_element}
		endif
	endif
endscript

script charge_star_power \{player = 1}
	FormatText checksumname = player_status 'player%p_status' p = <player>
	if (GameMode_IsBandScoring)
		GetBandIndexByPlayer player = ($<player_status>.player)
		band_id = ($band_ids [<band_index>])
		change structurename = <band_id> star_power_amount = 100
	else
		change structurename = <player_status> star_power_amount = 100
	endif
endscript

script activate_star_power \{player = 1}
	FormatText checksumname = player_status 'player%p_status' p = <player>
	FormatText TextName = player_text 'p%p' p = <player>
	star_power_activate_and_drain <...>
endscript

script debug_break 
	dump
	printscriptinfo
	isplayer
endscript

script wait_until_ingame \{player = 1}
	FormatText checksumname = player_status 'player%p_status' p = <player>
	begin
	if NOT (($<player_status>.playline_song_measure_time) = 0)
		break
	endif
	Wait \{1
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
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_trigger_star_power \{player = 1}
	wait_until_ingame player = <player>
	FormatText checksumname = player_status 'player%p_status' p = <player>
	begin
	if (($<player_status>.star_power_amount) >= 50.0)
		activate_star_power player = <player>
	endif
	if (($band1_status.star_power_amount) >= 50.0)
		activate_star_power player = <player>
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_full_star_power \{player = 1}
	wait_until_ingame player = <player>
	FormatText checksumname = player_status 'player%p_status' p = <player>
	begin
	if (($<player_status>.star_power_used) = 0)
		charge_star_power player = <player>
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script init_star_power_debug \{player = 1}
	FormatText checksumname = player_status 'player%p_status' p = <player>
	if (($<player_status>.star_power_debug_mode) = 1)
		spawnscriptnow auto_infinite_star_power params = {player = <player>}
	else
		if (($<player_status>.star_power_debug_mode) = 2)
			spawnscriptnow auto_trigger_star_power params = {player = <player>}
		else
			if (($<player_status>.star_power_debug_mode) = 3)
				spawnscriptnow auto_full_star_power params = {player = <player>}
			endif
		endif
	endif
endscript

script deinit_star_power_debug 
	KillSpawnedScript \{name = auto_infinite_star_power}
	KillSpawnedScript \{name = auto_trigger_star_power}
	KillSpawnedScript \{name = auto_full_star_power}
	KillSpawnedScript \{name = activate_star_power}
endscript

script update_rock_meter_debug_text 
	begin
	if ScreenElementExists id = <id>
		if ($current_num_players > 1)
			<player> = 1
			begin
			FormatText checksumname = player_status 'player%i_status' i = <player> AddToStringLookup
			<part> = qs("?")
			if (($<player_status>.part) = Bass)
				<part> = qs("B")
			endif
			if (($<player_status>.part) = guitar)
				<part> = qs("G")
			endif
			if (($<player_status>.part) = drum)
				<part> = qs("D")
			endif
			if (($<player_status>.part) = Vocals)
				<part> = qs("V")
			endif
			FormatText checksumname = rmdt 'rock_meter_debug_text%i' i = <player> AddToStringLookup
			FormatText TextName = string qs("%p:%v") p = <part> v = ($<player_status>.current_health)
			SetScreenElementProps id = <rmdt> text = <string>
			<player> = (<player> + 1)
			repeat $current_num_players
		endif
		FormatText \{TextName = text_string
			qs("%a")
			a = $current_crowd}
		SetScreenElementProps id = <id> text = <text_string>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script setlist_quit_song_menu_input 
	SetScriptCannotPause
	<return_to_base_selection> = 0
	begin
	Block \{type = setlist_created}
	Wait RandomFloat (1.0, 2.0) seconds
	begin
	if ScreenElementExists \{id = setlist_menu}
		break
	endif
	Wait \{1
		gameframes}
	repeat
	printf \{qs("\Lmenu_input_sim- selecting song")}
	if (<return_to_base_selection> > 0)
		begin
		LaunchEvent \{type = pad_up
			target = setlist_menu}
		Wait RandomFloat (0.2, 0.6) seconds
		repeat <return_to_base_selection>
	endif
	<count> = RandomInteger (1.0, 8.0)
	<return_to_base_selection> = <count>
	begin
	LaunchEvent \{type = pad_down
		target = setlist_menu}
	Wait RandomFloat (0.2, 0.6) seconds
	repeat <count>
	setlist_menu :Menu_GetSelectedIndex
	LaunchEvent type = pad_choose target = {setlist_menu child = <selected_index>}
	Block \{type = song_started}
	Wait RandomFloat (5.0, 60.0) seconds
	printf \{qs("\Lmenu_input_sim- pausing")}
	LaunchEvent \{type = pad_start
		target = root_window}
	Block \{type = pause_menu_created}
	Wait RandomFloat (1.0, 2.0) seconds
	begin
	if ScreenElementExists \{id = current_menu}
		break
	endif
	Wait \{1
		gameframes}
	repeat
	printf \{qs("\Lmenu_input_sim- selecting quit")}
	begin
	LaunchEvent \{type = pad_down
		target = current_menu}
	Wait \{0.3
		seconds}
	repeat 5
	current_menu :Menu_GetSelectedIndex
	LaunchEvent type = pad_choose target = {current_menu child = <selected_index>}
	Block \{type = popup_created}
	Wait RandomFloat (1.0, 2.0) seconds
	begin
	if ScreenElementExists \{id = pu_warning_vmenu}
		break
	endif
	Wait \{1
		gameframes}
	repeat
	printf \{qs("\Lmenu_input_sim- confirming quit")}
	LaunchEvent \{type = pad_down
		target = pu_warning_vmenu}
	Wait \{0.5
		seconds}
	pu_warning_vmenu :Menu_GetSelectedIndex
	LaunchEvent type = pad_choose target = {pu_warning_vmenu child = <selected_index>}
	Block \{type = popup_created}
	Wait RandomFloat (1.0, 2.0) seconds
	begin
	if ScreenElementExists \{id = pu_warning_vmenu}
		break
	endif
	Wait \{1
		gameframes}
	repeat
	printf \{qs("\Lmenu_input_sim- selecting new song")}
	LaunchEvent \{type = pad_down
		target = pu_warning_vmenu}
	Wait \{0.5
		seconds}
	pu_warning_vmenu :Menu_GetSelectedIndex
	LaunchEvent type = pad_choose target = {pu_warning_vmenu child = <selected_index>}
	repeat
endscript
