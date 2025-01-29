
script init_play_log 
	if ($show_play_log = 1)
		<Pos> = (256.0, 32.0)
		<Name> = log_line
		<line> = 0
		begin
		formatText checksumName = id 'log_line_%l' l = <line>
		CreateScreenElement {
			Type = TextElement
			parent = root_window
			id = <id>
			font = debug
			Pos = <Pos>
			just = [left top]
			Scale = (0.9, 0.7)
			rgba = [230 230 230 250]
			text = qs(0x5646a42d)
			z_priority = 1000.0
			alpha = 1
		}
		<Pos> = (<Pos> + (0.0, 26.0))
		<line> = (<line> + 1)
		repeat $play_log_lines
		<blank_text> = qs(0x713755f7)
		Change log_strings = ($log_strings + {log_line_0 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_1 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_2 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_3 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_4 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_5 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_6 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_7 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_8 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_9 = <blank_text>})
		<line> = 0
		begin
		formatText checksumName = id 'log_line_%l' l = <line>
		SetScreenElementProps id = <id> text = ($log_strings.<id>)
		<line> = (<line> + 1)
		repeat $play_log_lines
	endif
endscript

script kill_debug_elements 
	<line> = 0
	begin
	formatText checksumName = id 'log_line_%l' l = <line>
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
		formatText TextName = text_string <...>
		<line_1> = ($log_strings.log_line_1)
		<line_2> = ($log_strings.log_line_2)
		<line_3> = ($log_strings.log_line_3)
		<line_4> = ($log_strings.log_line_4)
		<line_5> = ($log_strings.log_line_5)
		<line_6> = ($log_strings.log_line_6)
		<line_7> = ($log_strings.log_line_7)
		<line_8> = ($log_strings.log_line_8)
		<line_9> = ($log_strings.log_line_9)
		Change log_strings = ($log_strings + {log_line_0 = <line_1>})
		Change log_strings = ($log_strings + {log_line_1 = <line_2>})
		Change log_strings = ($log_strings + {log_line_2 = <line_3>})
		Change log_strings = ($log_strings + {log_line_3 = <line_4>})
		Change log_strings = ($log_strings + {log_line_4 = <line_5>})
		Change log_strings = ($log_strings + {log_line_5 = <line_6>})
		Change log_strings = ($log_strings + {log_line_6 = <line_7>})
		Change log_strings = ($log_strings + {log_line_7 = <line_8>})
		Change log_strings = ($log_strings + {log_line_8 = <line_9>})
		<color_1> = ($log_strings.log_line_1_color)
		<color_2> = ($log_strings.log_line_2_color)
		<color_3> = ($log_strings.log_line_3_color)
		<color_4> = ($log_strings.log_line_4_color)
		<color_5> = ($log_strings.log_line_5_color)
		<color_6> = ($log_strings.log_line_6_color)
		<color_7> = ($log_strings.log_line_7_color)
		<color_8> = ($log_strings.log_line_8_color)
		<color_9> = ($log_strings.log_line_9_color)
		Change log_strings = ($log_strings + {log_line_0_color = <color_1>})
		Change log_strings = ($log_strings + {log_line_1_color = <color_2>})
		Change log_strings = ($log_strings + {log_line_2_color = <color_3>})
		Change log_strings = ($log_strings + {log_line_3_color = <color_4>})
		Change log_strings = ($log_strings + {log_line_4_color = <color_5>})
		Change log_strings = ($log_strings + {log_line_5_color = <color_6>})
		Change log_strings = ($log_strings + {log_line_6_color = <color_7>})
		Change log_strings = ($log_strings + {log_line_7_color = <color_8>})
		Change log_strings = ($log_strings + {log_line_8_color = <color_9>})
		switch ($play_log_lines)
			case 1
			Change log_strings = ($log_strings + {log_line_0 = <text_string>})
			Change log_strings = ($log_strings + {log_line_0_color = <Color>})
			case 2
			Change log_strings = ($log_strings + {log_line_1 = <text_string>})
			Change log_strings = ($log_strings + {log_line_1_color = <Color>})
			case 3
			Change log_strings = ($log_strings + {log_line_2 = <text_string>})
			Change log_strings = ($log_strings + {log_line_2_color = <Color>})
			case 4
			Change log_strings = ($log_strings + {log_line_3 = <text_string>})
			Change log_strings = ($log_strings + {log_line_3_color = <Color>})
			case 5
			Change log_strings = ($log_strings + {log_line_4 = <text_string>})
			Change log_strings = ($log_strings + {log_line_4_color = <Color>})
			case 6
			Change log_strings = ($log_strings + {log_line_5 = <text_string>})
			Change log_strings = ($log_strings + {log_line_5_color = <Color>})
			case 7
			Change log_strings = ($log_strings + {log_line_6 = <text_string>})
			Change log_strings = ($log_strings + {log_line_6_color = <Color>})
			case 8
			Change log_strings = ($log_strings + {log_line_7 = <text_string>})
			Change log_strings = ($log_strings + {log_line_7_color = <Color>})
			case 9
			Change log_strings = ($log_strings + {log_line_8 = <text_string>})
			Change log_strings = ($log_strings + {log_line_8_color = <Color>})
			case 10
			Change log_strings = ($log_strings + {log_line_9 = <text_string>})
			Change log_strings = ($log_strings + {log_line_9_color = <Color>})
		endswitch
		<line> = 0
		begin
		formatText checksumName = id 'log_line_%l' l = <line>
		SetScreenElementProps id = <id> text = ($log_strings.<id>)
		formatText checksumName = col 'log_line_%l_color' l = <line>
		switch ($log_strings.<col>)
			case green
			SetScreenElementProps id = <id> rgba = [48 250 48 250]
			case darkgreen
			SetScreenElementProps id = <id> rgba = [16 200 16 250]
			case red
			SetScreenElementProps id = <id> rgba = [210 48 48 250]
			case darkred
			SetScreenElementProps id = <id> rgba = [160 16 16 250]
			case orange
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
			CreateScreenElement \{Type = TextElement
				parent = root_window
				id = guitar_tilt_debug
				font = debug
				Pos = (640.0, 400.0)
				just = [
					center
					center
				]
				Scale = 2.0
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
		formatText \{TextName = text_string
			qs(0xc511dcd6)}
		controller = 0
		begin
		if IsGuitarController controller = <controller>
			GuitarGetAnalogueInfo controller = <controller>
			formatText TextName = text_string qs(0x3993100d) d = <righty>
		endif
		<controller> = (<controller> + 1)
		repeat 4
		SetScreenElementProps id = guitar_tilt_debug text = <text_string>
	endif
endscript

script guitar_sensor_debug 
	if ($show_sensor_debug)
		if NOT ScreenElementExists \{id = guitar_sensor_debug}
			CreateScreenElement \{Type = TextBlockElement
				parent = root_window
				id = guitar_sensor_debug
				font = debug
				Scale = 0.75
				Pos = (64.0, 64.0)
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
			formatText {
				TextName = text_string
				qs(0x1a8ba1e3)
				a = <r2raw>
				b = <l2raw>
				c = <righty>
				d = <rightx>
			}
			SetScreenElementProps id = guitar_sensor_debug text = <text_string>
		endif
	endif
endscript

script check_input_debug 
	GetHeldPattern controller = <controller> Player = ($<player_status>.Player) player_status = <player_status>
	pressed = 0
	switch hold_pattern
		case 65536
		if (<button> = X)
			<pressed> = 1
		endif
		case 4096
		if (<button> = circle)
			<pressed> = 1
		endif
		case 256
		if (<button> = Triangle)
			<pressed> = 1
		endif
		case 16
		if (<button> = Square)
			<pressed> = 1
		endif
		case 1
		if (<button> = L1)
			<pressed> = 1
		endif
	endswitch
	if (<pressed> = 1)
		formatText TextName = text qs(0xc1c48dbe) t = <text> c = <char>
	else
		formatText TextName = text qs(0x79548c8f) t = <text>
	endif
	return <...>
endscript

script get_input_debug_text 
	<text> = qs(0xbac567f0)
	check_input_debug <...> controller = ($<player_status>.controller) button = X char = qs(0x5b8ba897)
	check_input_debug <...> controller = ($<player_status>.controller) button = circle char = qs(0x6c3e4e83)
	check_input_debug <...> controller = ($<player_status>.controller) button = Triangle char = qs(0x8fca9748)
	check_input_debug <...> controller = ($<player_status>.controller) button = Square char = qs(0x26fc5cd2)
	check_input_debug <...> controller = ($<player_status>.controller) button = L1 char = qs(0x9352229f)
	if IsGuitarController controller = ($<player_status>.controller)
		formatText TextName = text qs(0xe76f0f8f) t = <text>
	else
		formatText TextName = text qs(0x0a31bf1d) t = <text>
	endif
	return input_text = <text>
endscript

script input_debug 
	get_input_debug_text <...>
	GuitarGetAnalogueInfo controller = ($<player_status>.controller)
	formatText TextName = input_text qs(0xf9ae1888) t = <input_text> l = <lefttrigger> r = <righttrigger> d = <verticaldist> X = <rightx> y = <righty>
	if ScreenElementExists \{id = input_textp1}
		SetScreenElementProps id = input_textp1 text = <input_text>
	endif
endscript

script debug_gem_text 
	if (<pattern> && 65536)
		formatText TextName = text qs(0x14db9cdc) t = <text> p = <prefix>
	else
		formatText TextName = text qs(0xa0e44c32) t = <text> p = <prefix>
	endif
	if (<pattern> && 4096)
		formatText TextName = text qs(0xfadeba75) t = <text>
	else
		formatText TextName = text qs(0x79548c8f) t = <text>
	endif
	if (<pattern> && 256)
		formatText TextName = text qs(0x192a63be) t = <text>
	else
		formatText TextName = text qs(0x79548c8f) t = <text>
	endif
	if (<pattern> && 16)
		formatText TextName = text qs(0xb01ca824) t = <text>
	else
		formatText TextName = text qs(0x79548c8f) t = <text>
	endif
	if (<pattern> && 1)
		formatText TextName = text qs(0x4e0b861f) t = <text>
	else
		formatText TextName = text qs(0xcd911679) t = <text>
	endif
	return <...>
endscript

script debug_output 
	if ($output_log_file = 1)
		<showtime> = (<time> - ($check_time_early * 1000.0))
		formatText TextName = text qs(0x6f973620) t = <showtime> c = ($<player_status>.controller)
		if (<ignore_time> >= 0)
			debug_gem_text text = <text> pattern = <ignore_strum> prefix = qs(0x10ec1370)
		else
			formatText TextName = text qs(0xbf0b68d5) t = <text>
		endif
		GetHeldPattern controller = ($<player_status>.controller) Player = ($<player_status>.Player) nobrokenstring
		debug_gem_text text = <text> pattern = <strummed_pattern> prefix = qs(0xc7e758af)
		debug_gem_text text = <text> pattern = <original_strum> prefix = qs(0x859889df)
		debug_gem_text text = <text> pattern = <hold_pattern> prefix = qs(0x918eb2e5)
		if (<hit_strum> = 1)
			if (<fake_strum> = 1)
				formatText TextName = text qs(0x5b352041) t = <text>
			else
				formatText TextName = text qs(0xdc2df0df) t = <text>
			endif
		else
			if (<fake_strum> = 1)
				formatText TextName = text qs(0xbbea5772) t = <text>
			else
				formatText TextName = text qs(0x4578889e) t = <text>
			endif
		endif
		if (<strummed_before_forming> >= 0.0)
			formatText TextName = text qs(0x41fac866) t = <text>
		else
			formatText TextName = text qs(0xa5a7ffad) t = <text>
		endif
		if (<tapping> = 1)
			action_tap = qs(0x18c99bac)
		else
			action_tap = qs(0x92e2c9d5)
		endif
		get_input_debug_text <...>
		formatText TextName = text qs(0x4793bf41) t = <text> h = <action_hit> m = <action_mis> u = <action_unn> l = <action_tol> i = <input_text> k = <action_tap>
		formatText TextName = text qs(0xd30b02ca) t = <text> o = ($<player_status>.hammer_on_tolerance) n = <notes_open>
		GetArraySize <strum_hits>
		if (<array_Size> > 0)
			formatText TextName = text qs(0x14f47ad7) t = <text>
			<index> = 0
			begin
			<strum> = (<strum_hits> [<index>])
			debug_gem_text text = <text> pattern = <strum> prefix = qs(0x03ac90f0)
			<index> = (<index> + 1)
			repeat <array_Size>
			formatText TextName = text qs(0x36151a48) t = <text>
		endif
		GetArraySize <hammer_hits>
		if (<array_Size> > 0)
			formatText TextName = text qs(0x93ecaa49) t = <text>
			<index> = 0
			begin
			<strum> = (<hammer_hits> [<index>])
			debug_gem_text text = <text> pattern = <strum> prefix = qs(0x03ac90f0)
			<index> = (<index> + 1)
			repeat <array_Size>
			formatText TextName = text qs(0x36151a48) t = <text>
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
			formatText TextName = text qs(0x7fe80a6d) t = <text> o = <off_note>
		endif
		ExtendCrc log ($<player_status>.text) out = log_channel

	endif
endscript

script start_sensor_debug_output 
	KillSpawnedScript \{Name = sensor_debug_output}
	if NOT GotParam \{controller}
		controller = $primary_controller
	endif
	SpawnScriptNow sensor_debug_output params = <...>
endscript

script stop_sensor_debug_output 
	KillSpawnedScript \{Name = sensor_debug_output}
endscript

script sensor_debug_output 
	last_righty = 0.0
	drighty = 0.0
	last_drighty = 0.0
	ddrighty = 0.0
	spike_threshold = 0.3
	begin
	GuitarGetAnalogueInfo controller = <controller>

	drighty = (<righty> - <last_righty>)
	ddrighty = (<drighty> - <last_drighty>)
	if (<drighty> > <spike_threshold> || <drighty> < -1.0 * <spike_threshold>)

	endif
	if (<ddrighty> > 2.0 * <spike_threshold> || <ddrighty> < -2.0 * <spike_threshold>)

	endif
	<last_righty> = (<righty>)
	<last_drighty> = (<drighty>)
	WaitOneGameFrame
	repeat
endscript

script FlexParticleWarning 
	SetScreenElementLock \{id = root_window
		OFF}
	if ObjectExists \{id = particle_warn_anchor}
		DestroyScreenElement \{id = particle_warn_anchor}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = particle_warn_anchor
		Pos = (25.0, 80.0)
		just = [
			center
			center
		]
		internal_just = [
			left
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = particle_warn_anchor
		id = particle_warn_text
		Pos = (0.0, 0.0)
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
	SetScreenElementLock \{id = root_window
		On}
	Wait \{2
		Seconds}
	if ObjectExists \{id = particle_warn_anchor}
		DestroyScreenElement \{id = particle_warn_anchor}
	endif
endscript
show_build_version = 0

script get_data_version 
	if GlobalExists \{Name = dataversionnumber
			Type = int}
		return \{build_version_string = $dataversionnumber}
	else
		return \{build_version_string = qs(0xa918ce06)}
	endif
endscript

script debug_toggle_changelist 
	if (($show_build_version = 0) || (GotParam show))
		Change \{show_build_version = 1}
		if ScreenElementExists \{id = debug_show_build_version_element}
			return
		endif
		get_data_version
		formatText TextName = build_version_text qs(0x621151da) v = <build_version_string>
		CreateScreenElement {
			Type = TextElement
			parent = root_window
			id = debug_show_build_version_element
			font = debug
			just = [left top]
			Pos = {(0.15, 0.05) proportional}
			text = <build_version_text>
			rgba = [200 200 200 255]
			Scale = 0.75
			Shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
			z_priority = 100000
		}
	else
		Change \{show_build_version = 0}
		if ScreenElementExists \{id = debug_show_build_version_element}
			DestroyScreenElement \{id = debug_show_build_version_element}
		endif
	endif
endscript

script charge_star_power \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	if (gamemode_isbandscoring)
		getbandindexbyplayer Player = ($<player_status>.Player)
		band_id = ($band_ids [<band_index>])
		Change structurename = <band_id> star_power_amount = 100
	else
		Change structurename = <player_status> star_power_amount = 100
	endif
endscript

script activate_star_power \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	<player_text> = ($0x57e22f28 [<Player>])
	star_power_activate_and_drain <...>
endscript

script debug_break 


	isplayer
endscript

script wait_until_ingame \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	begin
	if NOT (($<player_status>.playline_song_measure_time) = 0)
		break
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_infinite_star_power \{Player = 1}
	wait_until_ingame Player = <Player>
	charge_star_power Player = <Player>
	SpawnScriptNow activate_star_power params = {Player = <Player> infinite_drain}
	begin
	charge_star_power Player = <Player>
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_trigger_star_power \{Player = 1}
	wait_until_ingame Player = <Player>
	<player_status> = ($0x2994109a [<Player>])
	begin
	if (($<player_status>.star_power_amount) >= 50.0)
		activate_star_power Player = <Player>
	endif
	if (($band1_status.star_power_amount) >= 50.0)
		activate_star_power Player = <Player>
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_full_star_power \{Player = 1}
	wait_until_ingame Player = <Player>
	<player_status> = ($0x2994109a [<Player>])
	begin
	if (($<player_status>.star_power_used) = 0)
		charge_star_power Player = <Player>
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script init_star_power_debug \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	if (($<player_status>.star_power_debug_mode) = 1)
		SpawnScriptNow auto_infinite_star_power params = {Player = <Player>}
	else
		if (($<player_status>.star_power_debug_mode) = 2)
			SpawnScriptNow auto_trigger_star_power params = {Player = <Player>}
		else
			if (($<player_status>.star_power_debug_mode) = 3)
				SpawnScriptNow auto_full_star_power params = {Player = <Player>}
			endif
		endif
	endif
endscript

script deinit_star_power_debug 
	KillSpawnedScript \{Name = auto_infinite_star_power}
	KillSpawnedScript \{Name = auto_trigger_star_power}
	KillSpawnedScript \{Name = auto_full_star_power}
	KillSpawnedScript \{Name = activate_star_power}
endscript

script update_rock_meter_debug_text 
	begin
	if ScreenElementExists id = <id>
		if ($current_num_players > 1)
			<Player> = 1
			begin
			<player_status> = ($0x2994109a [<Player>])
			<part> = qs(0xbc6d5b69)
			if (($<player_status>.part) = bass)
				<part> = qs(0x26fc5cd2)
			endif
			if (($<player_status>.part) = guitar)
				<part> = qs(0x5b8ba897)
			endif
			if (($<player_status>.part) = drum)
				<part> = qs(0x70a6fb54)
			endif
			if (($<player_status>.part) = vocals)
				<part> = qs(0x08528b87)
			endif
			formatText checksumName = rmdt 'rock_meter_debug_text%i' i = <Player> AddToStringLookup
			formatText TextName = string qs(0x589fda4a) p = <part> v = ($<player_status>.current_health)
			SetScreenElementProps id = <rmdt> text = <string>
			<Player> = (<Player> + 1)
			repeat $current_num_players
		endif
		formatText \{TextName = text_string
			qs(0x0bc409e2)
			a = $current_crowd}
		SetScreenElementProps id = <id> text = <text_string>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script setlist_quit_song_menu_input 
	setscriptcannotpause
	<return_to_base_selection> = 0
	begin
	Block \{Type = setlist_created}
	Wait RandomFloat (1.0, 2.0) Seconds
	begin
	if ScreenElementExists \{id = setlist_menu}
		break
	endif
	Wait \{1
		gameframes}
	repeat

	if (<return_to_base_selection> > 0)
		begin
		LaunchEvent \{Type = pad_up
			target = setlist_menu}
		Wait RandomFloat (0.2, 0.6) Seconds
		repeat <return_to_base_selection>
	endif
	<count> = RandomInteger (1.0, 8.0)
	<return_to_base_selection> = <count>
	begin
	LaunchEvent \{Type = pad_down
		target = setlist_menu}
	Wait RandomFloat (0.2, 0.6) Seconds
	repeat <count>
	setlist_menu :menu_getselectedindex
	LaunchEvent Type = pad_choose target = {setlist_menu child = <selected_index>}
	Block \{Type = song_started}
	Wait RandomFloat (5.0, 60.0) Seconds

	LaunchEvent \{Type = pad_start
		target = root_window}
	Block \{Type = pause_menu_created}
	Wait RandomFloat (1.0, 2.0) Seconds
	begin
	if ScreenElementExists \{id = current_menu}
		break
	endif
	Wait \{1
		gameframes}
	repeat

	begin
	LaunchEvent \{Type = pad_down
		target = current_menu}
	Wait \{0.3
		Seconds}
	repeat 5
	current_menu :menu_getselectedindex
	LaunchEvent Type = pad_choose target = {current_menu child = <selected_index>}
	Block \{Type = popup_created}
	Wait RandomFloat (1.0, 2.0) Seconds
	begin
	if ScreenElementExists \{id = dialog_box_vmenu}
		break
	endif
	Wait \{1
		gameframes}
	repeat

	LaunchEvent \{Type = pad_down
		target = dialog_box_vmenu}
	Wait \{0.5
		Seconds}
	dialog_box_vmenu :menu_getselectedindex
	LaunchEvent Type = pad_choose target = {dialog_box_vmenu child = <selected_index>}
	Block \{Type = popup_created}
	Wait RandomFloat (1.0, 2.0) Seconds
	begin
	if ScreenElementExists \{id = dialog_box_vmenu}
		break
	endif
	Wait \{1
		gameframes}
	repeat

	LaunchEvent \{Type = pad_down
		target = dialog_box_vmenu}
	Wait \{0.5
		Seconds}
	dialog_box_vmenu :menu_getselectedindex
	LaunchEvent Type = pad_choose target = {dialog_box_vmenu child = <selected_index>}
	repeat
endscript
