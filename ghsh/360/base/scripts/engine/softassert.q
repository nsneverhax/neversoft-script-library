enable_soft_asserts = 1
soft_assert_active = 0

script __soft_assert 
	if CD
		return
	endif
	Dumpheaps
	printstruct <...>
	printf qs(0x6652607c) s = <reason>
	if IsTrue \{$enable_soft_asserts}
		if IsTrue \{$soft_assert_active}
			printf \{qs(0x9f76024c)}
		else
			if NOT ScreenElementExists \{id = root_window}
				formatText TextName = full_message qs(0x147840fb) r = <reason>
				ScriptAssert <full_message>
			endif
			Change \{soft_assert_active = 1}
			StartRendering
			HideLoadingScreen
			ScreenShot \{FileName = 'Assert'}
			soft_assert_message <...>
		endif
	endif
endscript

script soft_assert_keep_player_paused 
	MangleChecksums \{a = 0
		b = 0}
	begin
	if CompositeObjectExists Name = <mangled_ID>
		<mangled_ID> :Pause
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script soft_assert_confirm 
	unpause_game = 1
	if GlobalExists \{Type = integer
			Name = view_mode}
		if ($view_mode > 0)
			unpause_game = 0
		endif
	endif
	if (<unpause_game> = 1)
		UnPauseGame
	endif
	Change \{soft_assert_active = 0}
	DestroyScreenElement \{id = soft_assert_anchor}
endscript

script soft_assert_message 
	printstruct <...> channel = SoftAssert
	if ScreenElementExists \{id = soft_assert_anchor}
		return
	endif
	getdebugfont
	CreateScreenElement \{parent = root_window
		id = soft_assert_anchor
		Type = descinterface
		desc = 'soft_assert'}
	soft_assert_anchor :se_getprops
	if soft_assert_anchor :desc_resolvealias \{Name = alias_menu}
		if GotParam \{file}
			formatText TextName = file_text qs(0xbcb379fb) t = <file_text> f = <file>
		endif
		if GotParam \{build}
			formatText TextName = build_text qs(0xd8dfbcff) t = <build_text> b = <build>
		endif
		if GotParam \{line}
			formatText TextName = line_text qs(0x24a8899b) t = <line_text> l = <line>
		endif
		if GotParam \{reason}
			formatText TextName = message_text qs(0x921daeae) t = <message_text> r = <reason>
		endif
		if GotParam \{callstack}
			GetArraySize <callstack>
			i = 0
			begin
			formatText TextName = callstack_line qs(0x67f911fa) c = (<callstack> [<i>])
			CreateScreenElement {
				Type = TextBlockElement
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
			repeat <array_Size>
		endif
		soft_assert_anchor :se_setprops {
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
			repeat <array_Size>
			if (<total_height> > 576)
				formatText TextName = helper_text qs(0x27245274) t = <helper_text>
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
	LaunchEvent \{Type = focus
		target = soft_assert_anchor}
	RunScriptOnScreenElement \{id = soft_assert_anchor
		soft_assert_keep_player_paused}
endscript

script soft_assert_scroll 
	if soft_assert_anchor :desc_resolvealias \{Name = alias_menu}
		GetScreenElementDims id = <resolved_id>
		GetScreenElementPosition id = <resolved_id>
		y = (<screenelementpos> [1])
		if GotParam \{down}
			if ((<y> * -1) < (<height> - 576))
				<resolved_id> :SetProps Pos = (<screenelementpos> - (0.0, 50.0))
			endif
		else
			if NOT (<y> = 0)
				<resolved_id> :SetProps Pos = (<screenelementpos> + (0.0, 50.0))
			endif
		endif
	endif
endscript

script soft_assert_input \{step = 0}
	if isps3
		steps = [
			{event_name = pad_square button_name = Triangle}
			{event_name = pad_option2 button_name = Square}
			{event_name = pad_square button_name = Triangle}
		]
	else
		steps = [
			{event_name = pad_square button_name = Square}
			{event_name = pad_option2 button_name = Triangle}
			{event_name = pad_square button_name = Square}
		]
	endif
	if GotParam \{Wait}
		Wait <Wait> Seconds
	endif
	GetArraySize <steps>
	if NOT (<step> < <array_Size>)
		i = 0
		begin
		Debounce (<steps> [<i>].button_name)
		ControllerDebounce (<steps> [<i>].button_name)
		i = (<i> + 1)
		repeat <array_Size>
		Goto \{soft_assert_confirm}
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
	if GotParam \{reset}
		if NOT (<i> < <array_Size>)
			Goto \{soft_assert_input}
		endif
	else
		if (<i> > <step>)
			break
		endif
	endif
	repeat
	soft_assert_anchor :Obj_KillSpawnedScript \{Name = soft_assert_input}
	soft_assert_anchor :Obj_SpawnScriptLater \{soft_assert_input
		params = {
			Wait = 0.3
			reset
		}}
endscript
