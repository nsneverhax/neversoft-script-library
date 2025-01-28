enable_soft_asserts = 1
soft_assert_active = 0

script soft_assert 
	DumpHeaps
	PrintStruct <...>
	Printf "SOFT ASSERT: %s" S = <reason>
	if IsTrue \{$enable_soft_asserts}
		if IsTrue \{$soft_assert_active}
			Printf \{"Soft Assert already active, ignoring!"}
		else
			pause_game = 1
			if GlobalExists \{Type = Integer
					Name = view_mode}
				if ($view_mode > 0)
					pause_game = 0
				endif
			endif
			if (<pause_game> = 1)
				if GameIsPaused
					FormatText TextName = full_message "SOFT ASSERT: %r (game was paused, so promoted to hard assert)" R = <reason>
					ScriptAssert <full_message>
				endif
				PauseMusic \{1}
				PauseStream \{1}
				PauseGame
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
	MangleChecksums \{A = 0
		B = 0}
	begin
	if CompositeObjectExists Name = <mangled_ID>
		<mangled_ID> :Pause
	endif
	Wait \{1
		GameFrames}
	repeat
endscript

script soft_assert_confirm 
	unpause_game = 1
	if GlobalExists \{Type = Integer
			Name = view_mode}
		if ($view_mode > 0)
			unpause_game = 0
		endif
	endif
	if (<unpause_game> = 1)
		UnPauseGame
		PauseMusic \{0}
		PauseStream \{0}
	endif
	Change \{soft_assert_active = 0}
	DestroyScreenElement \{Id = soft_assert_anchor}
endscript

script soft_assert_message \{message = ""}
	if GotParam \{file}
		FormatText TextName = message "%m\\c2File:\\c0 %f\\n" M = <message> F = <file>
	endif
	if GotParam \{Line}
		FormatText TextName = message "%m\\c2Line:\\c0 %l\\n" M = <message> L = <Line>
	endif
	if GotParam \{sig}
		FormatText TextName = message "%m\\c2Signature:\\c0 %s\\n" M = <message> S = <sig>
	endif
	if GotParam \{reason}
		FormatText TextName = message "%m\\n\\c2Message:\\c0 %r\\n" M = <message> R = <reason>
	endif
	if ScreenElementExists \{Id = soft_assert_anchor}
		DestroyScreenElement \{Id = soft_assert_anchor}
	endif
	SetScreenElementLock \{Id = root_window
		OFF}
	Top = (0.0, 40.0)
	CreateScreenElement \{Type = ContainerElement
		Id = soft_assert_anchor
		PARENT = root_window
		z_priority = 10000}
	CreateScreenElement \{Type = SpriteElement
		PARENT = soft_assert_anchor
		rgba = [
			0
			0
			0
			70
		]
		Dims = (1280.0, 720.0)
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	CreateScreenElement {
		Type = TextElement
		PARENT = soft_assert_anchor
		font = text_A1
		Text = "\\c2ASSERTION:"
		rgba = [255 255 255 255]
		Alpha = 1
		Scale = 0.65000004
		Pos = ((640.0, 0.0) + <Top>)
		just = [Center Top]
		z_priority = 10002
	}
	if ($highdefviewer = 1)
		<this_text_scale> = 0.45000002
	else
		<this_text_scale> = 0.6
	endif
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = soft_assert_anchor
		font = text_A1
		Text = <message>
		rgba = [255 255 255 255]
		Alpha = 1
		Scale = <this_text_scale>
		Pos = ((100.0, 50.0) + <Top>)
		Dims = (880.0, 0.0)
		allow_expansion
		just = [LEFT Top]
		internal_just = [LEFT Top]
	}
	GetScreenElementDims Id = <Id>
	if GotParam \{callstack}
		dim_h = (325 - <Height>)
		if (<dim_h> < 100)
			dim_h = 100
		endif
		CreateScreenElement {
			Type = VScrollingMenu
			PARENT = soft_assert_anchor
			Id = soft_assert_callstack_v
			just = [LEFT Top]
			Pos = ((120.0, 90.0) + (<Height> * (0.0, 0.85)))
			Dims = ((840.0, 0.0) + (<dim_h> * (0.0, 1.0)))
			z_priority = 10005
		}
		CreateScreenElement \{Type = VMenu
			Id = soft_assert_callstack
			PARENT = soft_assert_callstack_v
			internal_just = [
				LEFT
				Top
			]
			dont_allow_wrap}
		GetArraySize <callstack>
		I = 0
		begin
		CreateScreenElement {
			Type = TextBlockElement
			PARENT = soft_assert_callstack
			font = text_A1
			Text = (<callstack> [<I>])
			rgba = [160 160 255 255]
			Scale = <this_text_scale>
			just = [LEFT Top]
			Dims = (880.0, 0.0)
			allow_expansion
			internal_just = [LEFT Top]
		}
		I = (<I> + 1)
		repeat <array_Size>
		Height = 330
		LaunchEvent \{Type = Focus
			Target = soft_assert_callstack}
	endif
	CreateScreenElement {
		Type = SpriteElement
		PARENT = soft_assert_anchor
		rgba = [0 0 0 70]
		Dims = (1100.0, 720.0)
		Pos = ((640.0, 0.0) + <Top>)
		just = [Center Top]
	}
	create_helper_text \{helper_text_elements = [
			{
				Text = "\\be - \\bf - \\be = Continue"
			}
		]
		PARENT = soft_assert_anchor
		z_priority = 10004}
	soft_assert_input
	LaunchEvent \{Type = Focus
		Target = soft_assert_anchor}
	RunScriptOnScreenElement \{Id = soft_assert_anchor
		soft_assert_keep_player_paused}
endscript

script soft_assert_input \{step = 0}
	Steps = [
		{event_name = pad_L1 button_name = L1}
		{event_name = pad_R1 button_name = R1}
		{event_name = pad_L1 button_name = L1}
	]
	if GotParam \{Wait}
		Wait <Wait> Seconds
	endif
	GetArraySize <Steps>
	if NOT (<step> < <array_Size>)
		I = 0
		begin
		DeBounce (<Steps> [<I>].button_name)
		ControllerDebounce (<Steps> [<I>].button_name)
		I = (<I> + 1)
		repeat <array_Size>
		Goto \{soft_assert_confirm}
	endif
	I = 0
	begin
	if (<step> = <I>)
		event_handlers = [{(<Steps> [<I>].event_name) soft_assert_input Params = {step = (<step> + 1)}}]
	else
		event_handlers = [{(<Steps> [<I>].event_name) NullScript}]
	endif
	soft_assert_anchor :SetProps event_handlers = <event_handlers> Replace_Handlers
	I = (<I> + 1)
	if GotParam \{Reset}
		if NOT (<I> < <array_Size>)
			Goto \{soft_assert_input}
		endif
	else
		if (<I> > <step>)
			break
		endif
	endif
	repeat
	soft_assert_anchor :Obj_KillSpawnedScript \{Name = soft_assert_input}
	soft_assert_anchor :Obj_SpawnScriptLater \{soft_assert_input
		Params = {
			Wait = 0.3
			Reset
		}}
endscript
