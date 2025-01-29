
script timer_callback_script 
	if ($input_mode = Play)
		playback_timer
	endif
endscript

script script_callback_script 
	if NOT GameIsPaused
		if ($input_mode = Play)
			0xccf79bcc
		endif
		0x42ed04ca
		if ($faceoff_enabled = 1)
			0x121ac694
			0x4e4153f2
		endif
		if (($boss_battle = 1) || ($new_net_logic))
			SetInput controller = ($boss_controller) pattern = ($boss_pattern) strum = ($boss_strum)
			Change \{boss_strum = 0}
		endif
	endif
	if ($player1_status.bot_play = 1)
		SetInput controller = ($player1_status.controller) pattern = ($player1_status.bot_pattern) strum = ($player1_status.bot_strum)
		Change \{structurename = player1_status
			bot_strum = 0}
	endif
	if ($player2_status.bot_play = 1)
		SetInput controller = ($player2_status.controller) pattern = ($player2_status.bot_pattern) strum = ($player2_status.bot_strum)
		Change \{structurename = player2_status
			bot_strum = 0}
	endif
	monitorcontrollerstates
	if ($show_gpu_time = 1)
		if NOT ScreenElementExists \{id = 0x03e7da2e}
			CreateScreenElement \{Type = TextElement
				parent = root_window
				id = 0x03e7da2e
				font = debug
				Pos = (240.0, 652.0)
				just = [
					left
					bottom
				]
				Scale = 0.75
				rgba = [
					210
					210
					210
					250
				]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1}
		endif
		if NOT ScreenElementExists \{id = 0x72c2acfd}
			CreateScreenElement \{Type = TextElement
				parent = root_window
				id = 0x72c2acfd
				font = debug
				Pos = (240.0, 678.0)
				just = [
					left
					bottom
				]
				Scale = 0.75
				rgba = [
					210
					210
					210
					250
				]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1}
		endif
		if NOT ScreenElementExists \{id = 0x476dd991}
			CreateScreenElement \{Type = TextElement
				parent = root_window
				id = 0x476dd991
				font = debug
				Pos = (240.0, 704.0)
				just = [
					left
					bottom
				]
				Scale = 0.75
				rgba = [
					210
					210
					210
					250
				]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1}
		endif
		if isps3
			GetProfileData \{cpu = 2
				Name = gpu}
		else
			GetProfileData \{cpu = 6
				Name = gpu}
		endif
		milliseconds = (<microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formatText TextName = text "0%tms" t = <milliseconds>
		else
			formatText TextName = text "%tms" t = <milliseconds>
		endif
		SetScreenElementProps id = 0x03e7da2e text = <text>
		if (<milliseconds> > 13.0)
			SetScreenElementProps \{id = 0x03e7da2e
				rgba = [
					210
					0
					0
					250
				]}
		else
			SetScreenElementProps \{id = 0x03e7da2e
				rgba = [
					210
					210
					210
					250
				]}
		endif
		milliseconds = (<max_microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formatText TextName = text "0%tms" t = <milliseconds>
		else
			formatText TextName = text "%tms" t = <milliseconds>
		endif
		SetScreenElementProps id = 0x72c2acfd text = <text>
		if (<milliseconds> > 13.0)
			SetScreenElementProps \{id = 0x72c2acfd
				rgba = [
					210
					0
					0
					250
				]}
		else
			SetScreenElementProps \{id = 0x72c2acfd
				rgba = [
					210
					210
					210
					250
				]}
		endif
		milliseconds = (<max_ever_microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formatText TextName = text "0%tms" t = <milliseconds>
		else
			formatText TextName = text "%tms" t = <milliseconds>
		endif
		SetScreenElementProps id = 0x476dd991 text = <text>
		if (<milliseconds> > 13.0)
			SetScreenElementProps \{id = 0x476dd991
				rgba = [
					210
					0
					0
					250
				]}
		else
			SetScreenElementProps \{id = 0x476dd991
				rgba = [
					210
					210
					210
					250
				]}
		endif
		DoScreenElementMorph \{id = 0x03e7da2e
			alpha = 1}
		DoScreenElementMorph \{id = 0x72c2acfd
			alpha = 1}
		DoScreenElementMorph \{id = 0x476dd991
			alpha = 1}
	else
		if ScreenElementExists \{id = 0x03e7da2e}
			DoScreenElementMorph \{id = 0x03e7da2e
				alpha = 0}
		endif
		if ScreenElementExists \{id = 0x72c2acfd}
			DoScreenElementMorph \{id = 0x72c2acfd
				alpha = 0}
		endif
		if ScreenElementExists \{id = 0x476dd991}
			DoScreenElementMorph \{id = 0x476dd991
				alpha = 0}
		endif
	endif
	if ($show_cpu_time = 1)
		if NOT ScreenElementExists \{id = 0x87add4d4}
			CreateScreenElement \{Type = TextElement
				parent = root_window
				id = 0x87add4d4
				font = debug
				Pos = (920.0, 652.0)
				just = [
					left
					bottom
				]
				Scale = 0.75
				rgba = [
					210
					210
					210
					250
				]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1}
		endif
		if NOT ScreenElementExists \{id = 0xf688a207}
			CreateScreenElement \{Type = TextElement
				parent = root_window
				id = 0xf688a207
				font = debug
				Pos = (920.0, 678.0)
				just = [
					left
					bottom
				]
				Scale = 0.75
				rgba = [
					210
					210
					210
					250
				]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1}
		endif
		if NOT ScreenElementExists \{id = 0xc327d76b}
			CreateScreenElement \{Type = TextElement
				parent = root_window
				id = 0xc327d76b
				font = debug
				Pos = (920.0, 704.0)
				just = [
					left
					bottom
				]
				Scale = 0.75
				rgba = [
					210
					210
					210
					250
				]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1}
		endif
		GetProfileData \{cpu = 0
			Name = main}
		milliseconds = (<microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formatText TextName = text "0%tms" t = <milliseconds>
		else
			formatText TextName = text "%tms" t = <milliseconds>
		endif
		SetScreenElementProps id = 0x87add4d4 text = <text>
		if (<milliseconds> > 16.0)
			SetScreenElementProps \{id = 0x87add4d4
				rgba = [
					210
					0
					0
					250
				]}
		else
			SetScreenElementProps \{id = 0x87add4d4
				rgba = [
					210
					210
					210
					250
				]}
		endif
		milliseconds = (<max_microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formatText TextName = text "0%tms" t = <milliseconds>
		else
			formatText TextName = text "%tms" t = <milliseconds>
		endif
		SetScreenElementProps id = 0xf688a207 text = <text>
		if (<milliseconds> > 16.0)
			SetScreenElementProps \{id = 0xf688a207
				rgba = [
					210
					0
					0
					250
				]}
		else
			SetScreenElementProps \{id = 0xf688a207
				rgba = [
					210
					210
					210
					250
				]}
		endif
		milliseconds = (<max_ever_microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formatText TextName = text "0%tms" t = <milliseconds>
		else
			formatText TextName = text "%tms" t = <milliseconds>
		endif
		SetScreenElementProps id = 0xc327d76b text = <text>
		if (<milliseconds> > 16.0)
			SetScreenElementProps \{id = 0xc327d76b
				rgba = [
					210
					0
					0
					250
				]}
		else
			SetScreenElementProps \{id = 0xc327d76b
				rgba = [
					210
					210
					210
					250
				]}
		endif
		DoScreenElementMorph \{id = 0x87add4d4
			alpha = 1}
		DoScreenElementMorph \{id = 0xf688a207
			alpha = 1}
		DoScreenElementMorph \{id = 0xc327d76b
			alpha = 1}
	else
		if ScreenElementExists \{id = 0x87add4d4}
			DoScreenElementMorph \{id = 0x87add4d4
				alpha = 0}
		endif
		if ScreenElementExists \{id = 0xf688a207}
			DoScreenElementMorph \{id = 0xf688a207
				alpha = 0}
		endif
		if ScreenElementExists \{id = 0xc327d76b}
			DoScreenElementMorph \{id = 0xc327d76b
				alpha = 0}
		endif
	endif
	guitar_tilt_debug_display
	guitar_sensor_debug
	UpdateGemMovers
endscript

script script_postcallback_script 
	UpdateGuitarFuncs
	if NOT GameIsPaused
		GetDeltaTime
		Update2DParticleSystems delta_time = <delta_time>
		RunQueuedPulseEvents
		CheckBossCutoff
		if ($output_gpu_log = 1)
			if isps3
				GetProfileData \{cpu = 2
					Name = gpu}
			else
				GetProfileData \{cpu = 6
					Name = gpu}
			endif
			milliseconds = (<microseconds> / 1000.0)
			GetSongTime
			formatText TextName = text "GPU Time; %s; %m" s = <songtime> m = <milliseconds> DontAssertForChecksums
			TextOutput text = <text>
		endif
	endif
endscript

script screenelement_postcallback_script 
	update_highway_prepass
endscript
