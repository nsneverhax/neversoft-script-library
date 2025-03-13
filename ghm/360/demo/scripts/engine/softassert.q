enable_soft_asserts = 1
soft_assert_active = 0

script __soft_assert 
	if cd
		return
	endif
	dumpheaps
	printstruct <...>
	printf qs(0x6652607c) s = <reason>
	if istrue \{$enable_soft_asserts}
		if istrue \{$soft_assert_active}
			printf \{qs(0x9f76024c)}
		else
			if NOT screenelementexists \{id = root_window}
				formattext textname = full_message qs(0x147840fb) r = <reason>
				scriptassert <full_message>
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
	endif
	change \{soft_assert_active = 0}
	destroyscreenelement \{id = soft_assert_anchor}
endscript

script soft_assert_message 
	printstruct <...> channel = softassert
	if screenelementexists \{id = soft_assert_anchor}
		return
	endif
	getdebugfont
	createscreenelement \{parent = root_window
		id = soft_assert_anchor
		type = descinterface
		desc = 'soft_assert'}
	soft_assert_anchor :se_getprops
	if soft_assert_anchor :desc_resolvealias \{name = alias_menu}
		if gotparam \{file}
			formattext textname = file_text qs(0xbcb379fb) t = <file_text> f = <file>
		endif
		if gotparam \{build}
			formattext textname = build_text qs(0xd8dfbcff) t = <build_text> b = <build>
		endif
		if gotparam \{line}
			formattext textname = line_text qs(0x24a8899b) t = <line_text> l = <line>
		endif
		if gotparam \{reason}
			formattext textname = message_text qs(0x921daeae) t = <message_text> r = <reason>
		endif
		if gotparam \{callstack}
			getarraysize <callstack>
			i = 0
			begin
			formattext textname = callstack_line qs(0x67f911fa) c = (<callstack> [<i>])
			createscreenelement {
				type = textblockelement
				parent = <resolved_id>
				font = <debug_font>
				text = <callstack_line>
				fit_width = wrap
				fit_height = expand_dims
				dims = (768.0, 36.75)
				allow_expansion
				internal_scale = (0.75, 0.75)
				rgba = [200 200 200 255]
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
		soft_assert_anchor :se_setprops {
			file_text = <file_text>
			build_text = <build_text>
			line_text = <line_text>
			message_text = <message_text>
			text_font = <debug_font>
		}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			total_height = 0
			i = 0
			begin
			getscreenelementdims id = (<children> [<i>])
			total_height = (<total_height> + <height>)
			i = (<i> + 1)
			repeat <array_size>
			if (<total_height> > 576)
				formattext textname = helper_text qs(0x27245274) t = <helper_text>
				soft_assert_anchor :se_setprops {
					helper_text = <helper_text>
					event_handlers = [
						{pad_up soft_assert_scroll}
						{pad_down soft_assert_scroll params = {down}}
					]
				}
			endif
		endif
	endif
	soft_assert_input
	launchevent \{type = focus
		target = soft_assert_anchor}
	runscriptonscreenelement \{id = soft_assert_anchor
		soft_assert_keep_player_paused}
endscript

script soft_assert_scroll 
	if soft_assert_anchor :desc_resolvealias \{name = alias_menu}
		getscreenelementdims id = <resolved_id>
		getscreenelementposition id = <resolved_id>
		y = (<screenelementpos> [1])
		if gotparam \{down}
			if ((<y> * -1) < (<height> - 576))
				<resolved_id> :setprops pos = (<screenelementpos> - (0.0, 50.0))
			endif
		else
			if NOT (<y> = 0)
				<resolved_id> :setprops pos = (<screenelementpos> + (0.0, 50.0))
			endif
		endif
	endif
endscript

script soft_assert_input \{step = 0}
	if isps3
		steps = [
			{event_name = pad_square button_name = triangle}
			{event_name = pad_option2 button_name = square}
			{event_name = pad_square button_name = triangle}
		]
	else
		steps = [
			{event_name = pad_square button_name = square}
			{event_name = pad_option2 button_name = triangle}
			{event_name = pad_square button_name = square}
		]
	endif
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
	soft_assert_anchor :se_setprops event_handlers = <event_handlers> replace_handlers
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
