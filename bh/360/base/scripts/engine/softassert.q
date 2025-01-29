enable_soft_asserts = 1
soft_assert_queue = [
]
soft_assert_queue_max_size = 5

script __soft_assert 
	if CD
		return
	endif
	Dumpheaps
	printstruct <...>
	printf qs(0x6652607c) s = <reason>
	if IsTrue \{$enable_soft_asserts}
		if NOT soft_assert_should_show <...>
			return
		endif
		if NOT ScreenElementExists \{id = root_window}
			FormatText TextName = full_message qs(0x147840fb) r = <reason>
			ScriptAssert <full_message>
		endif
		StartRendering
		HideLoadingScreen
		printstruct <...> channel = softassert
		AddArrayElement array = ($soft_assert_queue) element = <...>
		Change soft_assert_queue = <array>
		if NOT ScreenElementExists \{id = soft_assert_anchor}
			soft_assert_handle_next
		endif
	endif
endscript

script soft_assert_is_active 
	GetArraySize \{$soft_assert_queue}
	if (<array_size> > 0)
		return \{true}
	endif
	return \{false}
endscript

script soft_assert_should_show 
	GetArraySize \{$soft_assert_queue}
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
		RemoveArrayElement array = ($soft_assert_queue) index = 0
		Change soft_assert_queue = <array>
	endif
	DestroyScreenElement \{id = soft_assert_anchor}
	soft_assert_handle_next
endscript

script soft_assert_handle_next 
	if ScreenElementExists \{id = soft_assert_anchor}
		return
	endif
	if NOT soft_assert_is_active
		return
	endif
	AddParams ($soft_assert_queue [0])
	GetDebugFont
	CreateScreenElement \{parent = root_window
		id = soft_assert_anchor
		type = DescInterface
		desc = 'soft_assert'}
	soft_assert_anchor :SE_GetProps
	if soft_assert_anchor :Desc_ResolveAlias \{name = alias_Menu}
		if GotParam \{file}
			FormatText TextName = file_text qs(0xbcb379fb) t = <file_text> f = <file>
		endif
		if GotParam \{build}
			FormatText TextName = build_text qs(0xd8dfbcff) t = <build_text> b = <build>
		endif
		if GotParam \{line}
			FormatText TextName = line_text qs(0x24a8899b) t = <line_text> l = <line>
		endif
		if GotParam \{reason}
			FormatText TextName = message_text qs(0x921daeae) t = <message_text> r = <reason>
		endif
		if GotParam \{callstack}
			GetArraySize <callstack>
			i = 0
			begin
			FormatText TextName = callstack_line qs(0x67f911fa) c = (<callstack> [<i>])
			CreateScreenElement {
				type = TextBlockElement
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
		soft_assert_anchor :SE_SetProps {
			file_text = <file_text>
			build_text = <build_text>
			line_text = <line_text>
			message_text = <message_text>
			text_font = <debug_font>
		}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			total_height = 0
			i = 0
			begin
			GetScreenElementDims id = (<children> [<i>])
			total_height = (<total_height> + <height>)
			i = (<i> + 1)
			repeat <array_size>
			if (<total_height> > 576)
				FormatText TextName = helper_text qs(0x27245274) t = <helper_text>
				soft_assert_anchor :SE_SetProps {
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
	LaunchEvent \{type = focus
		target = soft_assert_anchor}
endscript

script soft_assert_scroll 
	if soft_assert_anchor :Desc_ResolveAlias \{name = alias_Menu}
		GetScreenElementDims id = <resolved_id>
		GetScreenElementPosition id = <resolved_id>
		y = (<ScreenElementPos> [1])
		if GotParam \{down}
			if ((<y> * -1) < (<height> - 576))
				<resolved_id> :SetProps Pos = (<ScreenElementPos> - (0.0, 50.0))
			endif
		else
			if NOT (<y> = 0)
				<resolved_id> :SetProps Pos = (<ScreenElementPos> + (0.0, 50.0))
			endif
		endif
	endif
endscript

script soft_assert_input \{step = 0}
	SetScriptCannotPause
	if IsPS3
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
	if GotParam \{reset}
		begin
		LaunchEvent \{type = focus
			target = soft_assert_anchor}
		wait \{1
			gameframe}
		repeat 20
	endif
	GetArraySize <steps>
	if (<step> >= <array_size>)
		i = 0
		begin
		Debounce (<steps> [<i>].button_name)
		ControllerDebounce (<steps> [<i>].button_name)
		i = (<i> + 1)
		repeat <array_size>
		Goto \{soft_assert_confirm}
	endif
	next_params = {reset}
	i = 0
	begin
	if (<step> = <i>)
		event_handlers = [{(<steps> [<i>].event_name) soft_assert_input params = {step = (<step> + 1)}}]
	else
		event_handlers = [{(<steps> [<i>].event_name) nullscript}]
	endif
	soft_assert_anchor :SE_SetProps event_handlers = <event_handlers> replace_handlers
	i = (<i> + 1)
	if GotParam \{reset}
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
	LaunchEvent \{type = focus
		target = soft_assert_anchor}
	soft_assert_anchor :Obj_KillSpawnedScript \{name = soft_assert_input}
	soft_assert_anchor :Obj_SpawnScriptLater soft_assert_input params = <next_params>
endscript
