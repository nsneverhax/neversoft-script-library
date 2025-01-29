
script timer_callback_script 
	if ($input_mode = play)
		playback_timer
	endif
endscript

script script_callback_script 
	if NOT gameispaused
		if ($input_mode = play)
			0xccf79bcc
		endif
		0x42ed04ca
		if ($faceoff_enabled = 1)
			0x121ac694
			0x4e4153f2
		endif
		if (($boss_battle = 1) || ($new_net_logic))
			setinput controller = ($boss_controller) pattern = ($boss_pattern) strum = ($boss_strum)
			change boss_strum = 0
		endif
	endif
	if ($player1_status.bot_play = 1)
		setinput controller = ($player1_status.controller) pattern = ($player1_status.bot_pattern) strum = ($player1_status.bot_strum)
		change structurename = player1_status bot_strum = 0
	endif
	if ($player2_status.bot_play = 1)
		setinput controller = ($player2_status.controller) pattern = ($player2_status.bot_pattern) strum = ($player2_status.bot_strum)
		change structurename = player2_status bot_strum = 0
	endif
	if ($show_gpu_time = 1)
		if NOT screenelementexists id = 0x03e7da2e
			createscreenelement {
				type = textelement
				parent = root_window
				id = 0x03e7da2e
				font = debug
				pos = (240.0, 652.0)
				just = [left bottom]
				scale = 0.75
				rgba = [210 210 210 250]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1
			}
		endif
		if NOT screenelementexists id = 0x72c2acfd
			createscreenelement {
				type = textelement
				parent = root_window
				id = 0x72c2acfd
				font = debug
				pos = (240.0, 678.0)
				just = [left bottom]
				scale = 0.75
				rgba = [210 210 210 250]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1
			}
		endif
		if NOT screenelementexists id = 0x476dd991
			createscreenelement {
				type = textelement
				parent = root_window
				id = 0x476dd991
				font = debug
				pos = (240.0, 704.0)
				just = [left bottom]
				scale = 0.75
				rgba = [210 210 210 250]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1
			}
		endif
		if isps3
			getprofiledata cpu = 2 name = gpu
		else
			getprofiledata cpu = 6 name = gpu
		endif
		milliseconds = (<microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formattext textname = text "0%tms" t = <milliseconds>
		else
			formattext textname = text "%tms" t = <milliseconds>
		endif
		setscreenelementprops id = 0x03e7da2e text = <text>
		if (<milliseconds> > 13.0)
			setscreenelementprops id = 0x03e7da2e rgba = [210 0 0 250]
		else
			setscreenelementprops id = 0x03e7da2e rgba = [210 210 210 250]
		endif
		milliseconds = (<max_microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formattext textname = text "0%tms" t = <milliseconds>
		else
			formattext textname = text "%tms" t = <milliseconds>
		endif
		setscreenelementprops id = 0x72c2acfd text = <text>
		if (<milliseconds> > 13.0)
			setscreenelementprops id = 0x72c2acfd rgba = [210 0 0 250]
		else
			setscreenelementprops id = 0x72c2acfd rgba = [210 210 210 250]
		endif
		milliseconds = (<max_ever_microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formattext textname = text "0%tms" t = <milliseconds>
		else
			formattext textname = text "%tms" t = <milliseconds>
		endif
		setscreenelementprops id = 0x476dd991 text = <text>
		if (<milliseconds> > 13.0)
			setscreenelementprops id = 0x476dd991 rgba = [210 0 0 250]
		else
			setscreenelementprops id = 0x476dd991 rgba = [210 210 210 250]
		endif
		doscreenelementmorph id = 0x03e7da2e alpha = 1
		doscreenelementmorph id = 0x72c2acfd alpha = 1
		doscreenelementmorph id = 0x476dd991 alpha = 1
	else
		if screenelementexists id = 0x03e7da2e
			doscreenelementmorph id = 0x03e7da2e alpha = 0
		endif
		if screenelementexists id = 0x72c2acfd
			doscreenelementmorph id = 0x72c2acfd alpha = 0
		endif
		if screenelementexists id = 0x476dd991
			doscreenelementmorph id = 0x476dd991 alpha = 0
		endif
	endif
	if ($show_cpu_time = 1)
		if NOT screenelementexists id = 0x87add4d4
			createscreenelement {
				type = textelement
				parent = root_window
				id = 0x87add4d4
				font = debug
				pos = (920.0, 652.0)
				just = [left bottom]
				scale = 0.75
				rgba = [210 210 210 250]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1
			}
		endif
		if NOT screenelementexists id = 0xf688a207
			createscreenelement {
				type = textelement
				parent = root_window
				id = 0xf688a207
				font = debug
				pos = (920.0, 678.0)
				just = [left bottom]
				scale = 0.75
				rgba = [210 210 210 250]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1
			}
		endif
		if NOT screenelementexists id = 0xc327d76b
			createscreenelement {
				type = textelement
				parent = root_window
				id = 0xc327d76b
				font = debug
				pos = (920.0, 704.0)
				just = [left bottom]
				scale = 0.75
				rgba = [210 210 210 250]
				text = "16.66667ms"
				z_priority = 100.0
				alpha = 1
			}
		endif
		getprofiledata cpu = 0 name = main
		milliseconds = (<microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formattext textname = text "0%tms" t = <milliseconds>
		else
			formattext textname = text "%tms" t = <milliseconds>
		endif
		setscreenelementprops id = 0x87add4d4 text = <text>
		if (<milliseconds> > 16.0)
			setscreenelementprops id = 0x87add4d4 rgba = [210 0 0 250]
		else
			setscreenelementprops id = 0x87add4d4 rgba = [210 210 210 250]
		endif
		milliseconds = (<max_microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formattext textname = text "0%tms" t = <milliseconds>
		else
			formattext textname = text "%tms" t = <milliseconds>
		endif
		setscreenelementprops id = 0xf688a207 text = <text>
		if (<milliseconds> > 16.0)
			setscreenelementprops id = 0xf688a207 rgba = [210 0 0 250]
		else
			setscreenelementprops id = 0xf688a207 rgba = [210 210 210 250]
		endif
		milliseconds = (<max_ever_microseconds> / 1000.0)
		if (<milliseconds> < 10.0)
			formattext textname = text "0%tms" t = <milliseconds>
		else
			formattext textname = text "%tms" t = <milliseconds>
		endif
		setscreenelementprops id = 0xc327d76b text = <text>
		if (<milliseconds> > 16.0)
			setscreenelementprops id = 0xc327d76b rgba = [210 0 0 250]
		else
			setscreenelementprops id = 0xc327d76b rgba = [210 210 210 250]
		endif
		doscreenelementmorph id = 0x87add4d4 alpha = 1
		doscreenelementmorph id = 0xf688a207 alpha = 1
		doscreenelementmorph id = 0xc327d76b alpha = 1
	else
		if screenelementexists id = 0x87add4d4
			doscreenelementmorph id = 0x87add4d4 alpha = 0
		endif
		if screenelementexists id = 0xf688a207
			doscreenelementmorph id = 0xf688a207 alpha = 0
		endif
		if screenelementexists id = 0xc327d76b
			doscreenelementmorph id = 0xc327d76b alpha = 0
		endif
	endif
	guitar_tilt_debug_display
	updategemmovers
endscript

script script_postcallback_script 
	updateguitarfuncs
	if NOT gameispaused
		getdeltatime
		update2dparticlesystems delta_time = <delta_time>
		if ($output_gpu_log = 1)
			if isps3
				getprofiledata cpu = 2 name = gpu
			else
				getprofiledata cpu = 6 name = gpu
			endif
			milliseconds = (<microseconds> / 1000.0)
			getsongtime
			formattext textname = text "GPU Time; %s; %m" s = <songtime> m = <milliseconds> dontassertforchecksums
			textoutput text = <text>
		endif
	endif
endscript
