enable_soft_asserts = 1
soft_assert_queue = [
]
soft_assert_queue_max_size = 5

script __soft_assert 
	if cd
		return
	endif
	dumpheaps
	printstruct <...>
	printf qs(0x6652607c) s = <reason>
	if istrue \{$enable_soft_asserts}
		if NOT soft_assert_should_show <...>
			return
		endif
		if NOT screenelementexists \{id = root_window}
			formattext textname = full_message qs(0x147840fb) r = <reason>
			scriptassert <full_message>
		endif
		startrendering
		hideloadingscreen
		printstruct <...> channel = softassert
		addarrayelement array = ($soft_assert_queue) element = <...>
		change soft_assert_queue = <array>
		if NOT screenelementexists \{id = soft_assert_anchor}
			soft_assert_handle_next
		endif
	endif
endscript

script soft_assert_is_active 
	getarraysize \{$soft_assert_queue}
	if (<array_size> > 0)
		return \{true}
	endif
	return \{false}
endscript

script soft_assert_should_show 
	getarraysize \{$soft_assert_queue}
	if (<array_size> >= ($soft_assert_queue_max_size))
		return \{false}
	endif
	if (<array_size> > 0)
		i = 0
		begin
		if (((($soft_assert_queue) [<i>]).reason) = <reason>)
			return \{false}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{true}
endscript

script soft_assert_confirm 
	if soft_assert_is_active
		removearrayelement array = ($soft_assert_queue) index = 0
		change soft_assert_queue = <array>
	endif
	destroyscreenelement \{id = soft_assert_anchor}
	soft_assert_handle_next
endscript

script soft_assert_handle_next 
	if screenelementexists \{id = soft_assert_anchor}
		return
	endif
	if NOT soft_assert_is_active
		return
	endif
	addparams ($soft_assert_queue [0])
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
	setscriptcannotpause
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
	if gotparam \{reset}
		begin
		launchevent \{type = focus
			target = soft_assert_anchor}
		wait \{1
			gameframe}
		repeat 20
	endif
	getarraysize <steps>
	if (<step> >= <array_size>)
		i = 0
		begin
		debounce (<steps> [<i>].button_name)
		controllerdebounce (<steps> [<i>].button_name)
		i = (<i> + 1)
		repeat <array_size>
		goto \{soft_assert_confirm}
	endif
	next_params = {reset}
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
		if (<i> >= <array_size>)
			next_params = {step = 0}
			break
		endif
	else
		if (<i> > <step>)
			break
		endif
	endif
	repeat
	launchevent \{type = focus
		target = soft_assert_anchor}
	soft_assert_anchor :obj_killspawnedscript \{name = soft_assert_input}
	soft_assert_anchor :obj_spawnscriptlater soft_assert_input params = <next_params>
endscript
