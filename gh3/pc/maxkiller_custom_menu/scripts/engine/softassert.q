enable_soft_asserts = 1
soft_assert_active = 0

script soft_assert 
	dumpheaps
	printstruct <...>
	printf "SOFT ASSERT: %s" s = <reason>
	if istrue \{$enable_soft_asserts}
		if istrue \{$soft_assert_active}
			printf \{"Soft Assert already active, ignoring!"}
		else
			pause_game = 1
			if globalexists \{type = integer
					name = view_mode}
				if ($view_mode > 0)
					pause_game = 0
				endif
			endif
			if (<pause_game> = 1)
				if gameispaused
					formattext textname = full_message "SOFT ASSERT: %r (game was paused, so promoted to hard assert)" r = <reason>
					scriptassert <full_message>
				endif
				pausemusic \{1}
				pausestream \{1}
				pausegame
			endif
			change \{soft_assert_active = 1}
			startrendering
			hideloadingscreen
			screenshot \{filename = 'Assert'}
			soft_assert_message <...>
		endif
	endif
endscript

script soft_assert_keep_player_paused 
	manglechecksums \{a = 0
		b = 0}
	begin
	if compositeobjectexists name = <mangled_id>
		<mangled_id> :pause
	endif
	wait \{1
		gameframes}
	repeat
endscript

script soft_assert_confirm 
	unpause_game = 1
	if globalexists \{type = integer
			name = view_mode}
		if ($view_mode > 0)
			unpause_game = 0
		endif
	endif
	if (<unpause_game> = 1)
		unpausegame
		pausemusic \{0}
		pausestream \{0}
	endif
	change \{soft_assert_active = 0}
	destroyscreenelement \{id = soft_assert_anchor}
endscript

script soft_assert_message \{message = ""}
	if gotparam \{file}
		formattext textname = message "%m\\c2File:\\c0 %f\\n" m = <message> f = <file>
	endif
	if gotparam \{line}
		formattext textname = message "%m\\c2Line:\\c0 %l\\n" m = <message> l = <line>
	endif
	if gotparam \{sig}
		formattext textname = message "%m\\c2Signature:\\c0 %s\\n" m = <message> s = <sig>
	endif
	if gotparam \{reason}
		formattext textname = message "%m\\n\\c2Message:\\c0 %r\\n" m = <message> r = <reason>
	endif
	if screenelementexists \{id = soft_assert_anchor}
		destroyscreenelement \{id = soft_assert_anchor}
	endif
	setscreenelementlock \{id = root_window
		off}
	top = (0.0, 40.0)
	createscreenelement \{type = containerelement
		id = soft_assert_anchor
		parent = root_window
		z_priority = 10000}
	createscreenelement \{type = spriteelement
		parent = soft_assert_anchor
		rgba = [
			0
			0
			0
			70
		]
		dims = (1280.0, 720.0)
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	createscreenelement {
		type = textelement
		parent = soft_assert_anchor
		font = text_a1
		text = "\\c2ASSERTION:"
		rgba = [255 255 255 255]
		alpha = 1
		scale = 0.65000004
		pos = ((640.0, 0.0) + <top>)
		just = [center top]
		z_priority = 10002
	}
	if ($highdefviewer = 1)
		<this_text_scale> = 0.45000002
	else
		<this_text_scale> = 0.6
	endif
	createscreenelement {
		type = textblockelement
		parent = soft_assert_anchor
		font = text_a1
		text = <message>
		rgba = [255 255 255 255]
		alpha = 1
		scale = <this_text_scale>
		pos = ((100.0, 50.0) + <top>)
		dims = (880.0, 0.0)
		allow_expansion
		just = [left top]
		internal_just = [left top]
	}
	getscreenelementdims id = <id>
	if gotparam \{callstack}
		dim_h = (325 - <height>)
		if (<dim_h> < 100)
			dim_h = 100
		endif
		createscreenelement {
			type = vscrollingmenu
			parent = soft_assert_anchor
			id = soft_assert_callstack_v
			just = [left top]
			pos = ((120.0, 90.0) + (<height> * (0.0, 0.85)))
			dims = ((840.0, 0.0) + (<dim_h> * (0.0, 1.0)))
			z_priority = 10005
		}
		createscreenelement \{type = vmenu
			id = soft_assert_callstack
			parent = soft_assert_callstack_v
			internal_just = [
				left
				top
			]
			dont_allow_wrap}
		getarraysize <callstack>
		i = 0
		begin
		createscreenelement {
			type = textblockelement
			parent = soft_assert_callstack
			font = text_a1
			text = (<callstack> [<i>])
			rgba = [160 160 255 255]
			scale = <this_text_scale>
			just = [left top]
			dims = (880.0, 0.0)
			allow_expansion
			internal_just = [left top]
		}
		i = (<i> + 1)
		repeat <array_size>
		height = 330
		launchevent \{type = focus
			target = soft_assert_callstack}
	endif
	createscreenelement {
		type = spriteelement
		parent = soft_assert_anchor
		rgba = [0 0 0 70]
		dims = (1100.0, 720.0)
		pos = ((640.0, 0.0) + <top>)
		just = [center top]
	}
	create_helper_text \{helper_text_elements = [
			{
				text = "\\be - \\bf - \\be = Continue"
			}
		]
		parent = soft_assert_anchor
		z_priority = 10004}
	soft_assert_input
	launchevent \{type = focus
		target = soft_assert_anchor}
	runscriptonscreenelement \{id = soft_assert_anchor
		soft_assert_keep_player_paused}
endscript

script soft_assert_input \{step = 0}
	steps = [
		{event_name = pad_l1 button_name = l1}
		{event_name = pad_r1 button_name = r1}
		{event_name = pad_l1 button_name = l1}
	]
	if gotparam \{wait}
		wait <wait> seconds
	endif
	getarraysize <steps>
	if NOT (<step> < <array_size>)
		i = 0
		begin
		debounce (<steps> [<i>].button_name)
		controllerdebounce (<steps> [<i>].button_name)
		i = (<i> + 1)
		repeat <array_size>
		goto \{soft_assert_confirm}
	endif
	i = 0
	begin
	if (<step> = <i>)
		event_handlers = [{(<steps> [<i>].event_name) soft_assert_input params = {step = (<step> + 1)}}]
	else
		event_handlers = [{(<steps> [<i>].event_name) nullscript}]
	endif
	soft_assert_anchor :setprops event_handlers = <event_handlers> replace_handlers
	i = (<i> + 1)
	if gotparam \{reset}
		if NOT (<i> < <array_size>)
			goto \{soft_assert_input}
		endif
	else
		if (<i> > <step>)
			break
		endif
	endif
	repeat
	soft_assert_anchor :obj_killspawnedscript \{name = soft_assert_input}
	soft_assert_anchor :obj_spawnscriptlater \{soft_assert_input
		params = {
			wait = 0.3
			reset
		}}
endscript
