enable_soft_asserts = 1
soft_assert_active = 0

script __soft_assert 
	if CD
		return
	endif
	DumpHeaps
	printstruct <...>
	printf qs("\LSOFT ASSERT: %s") s = <reason>
	if IsTrue \{$enable_soft_asserts}
		if IsTrue \{$soft_assert_active}
			printf \{qs("\LSoft Assert already active, ignoring!")}
		else
			if NOT ScreenElementExists \{id = root_window}
				FormatText TextName = full_message qs("\LSOFT ASSERT: %r (no root_window, so promoted to hard assert)") r = <reason>
				ScriptAssert <full_message>
			endif
			change \{soft_assert_active = 1}
			startrendering
			Hideloadingscreen
			ScreenShot \{filename = 'Assert'}
			soft_assert_message <...>
		endif
	endif
endscript

script soft_assert_keep_player_paused 
	MangleChecksums \{a = 0
		b = 0}
	begin
	if CompositeObjectExists name = <mangled_ID>
		<mangled_ID> :Pause
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script soft_assert_confirm 
	unpause_game = 1
	if GlobalExists \{type = Integer
			name = view_mode}
		if ($view_mode > 0)
			unpause_game = 0
		endif
	endif
	if (<unpause_game> = 1)
		UnPauseGame
	endif
	change \{soft_assert_active = 0}
	DestroyScreenElement \{id = soft_assert_anchor}
endscript

script soft_assert_message 
	printstruct <...> channel = SoftAssert
	if ScreenElementExists \{id = soft_assert_anchor}
		return
	endif
	GetDebugFont
	CreateScreenElement \{parent = root_window
		id = soft_assert_anchor
		type = DescInterface
		desc = 'soft_assert'}
	soft_assert_anchor :SE_GetProps
	if soft_assert_anchor :Desc_ResolveAlias \{name = alias_menu}
		if GotParam \{file}
			FormatText TextName = file_text qs("\L%t%f") t = <file_text> f = <file>
		endif
		if GotParam \{build}
			FormatText TextName = build_text qs("\L%t%b") t = <build_text> b = <build>
		endif
		if GotParam \{line}
			FormatText TextName = line_text qs("\L%t%l ") t = <line_text> l = <line>
		endif
		if GotParam \{reason}
			FormatText TextName = message_text qs("\L%t%r") t = <message_text> r = <reason>
		endif
		if GotParam \{callstack}
			GetArraySize <callstack>
			i = 0
			begin
			FormatText TextName = callstack_line qs("\L    %c") c = (<callstack> [<i>])
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
			total_height = (<total_height> + <Height>)
			i = (<i> + 1)
			repeat <array_size>
			if (<total_height> > 576)
				FormatText TextName = helper_text qs("\L\c2scroll for additional output \c0- \c4%t") t = <helper_text>
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
	RunScriptOnScreenElement \{id = soft_assert_anchor
		soft_assert_keep_player_paused}
endscript

script soft_assert_scroll 
	if soft_assert_anchor :Desc_ResolveAlias \{name = alias_menu}
		GetScreenElementDims id = <resolved_id>
		GetScreenElementPosition id = <resolved_id>
		y = (<screenelementpos> [1])
		if GotParam \{down}
			if ((<y> * -1) < (<Height> - 576))
				<resolved_id> :SetProps pos = (<screenelementpos> - (0.0, 50.0))
			endif
		else
			if NOT (<y> = 0)
				<resolved_id> :SetProps pos = (<screenelementpos> + (0.0, 50.0))
			endif
		endif
	endif
endscript

script soft_assert_input \{step = 0}
	if IsPs3
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
	if GotParam \{Wait}
		Wait <Wait> seconds
	endif
	GetArraySize <steps>
	if NOT (<step> < <array_size>)
		i = 0
		begin
		Debounce (<steps> [<i>].button_name)
		ControllerDebounce (<steps> [<i>].button_name)
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
	soft_assert_anchor :SE_SetProps event_handlers = <event_handlers> replace_handlers
	i = (<i> + 1)
	if GotParam \{reset}
		if NOT (<i> < <array_size>)
			goto \{soft_assert_input}
		endif
	else
		if (<i> > <step>)
			break
		endif
	endif
	repeat
	soft_assert_anchor :Obj_KillSpawnedScript \{name = soft_assert_input}
	soft_assert_anchor :Obj_SpawnScriptLater \{soft_assert_input
		params = {
			Wait = 0.3
			reset
		}}
endscript
