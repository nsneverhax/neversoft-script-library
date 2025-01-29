0x562e2f96 = {
	0x7897df41 = 0
	0xd777153f = 0
	0x41e00715 = 0
	fade_in_time = 0.15
	fade_out_time = 0.15
	0xbf23998d = 0.5
	Pos = (640.0, 360.0)
	just = [
		center
		center
	]
	internal_just = [
		center
		center
	]
	z_priority = 200000
	background = {
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		fade_in_time = 0.0
	}
	text = {
		Pos = (-400.0, 200.0)
		just = [
			left
			center
		]
		delay = 1.5
		fade_in_time = 0.15
		0x6b8904f0 = qs(0x37f4c584)
	}
	watch_timer = {
		Pos = (0.0, -600.0)
		delay = 2.5
		fade_in_time = 0.15
	}
	message = {
		Pos = (-300.0, -100.0)
		just = [
			center
			center
		]
		delay = 3.5
		fade_in_time = 0.15
	}
}

script 0x16cc1b60 
	if ($0x562e2f96.0x7897df41 > 0)
		return true 0x7897df41 = ($0x562e2f96.0x7897df41)
	endif
	return FALSE 0x7897df41 = ($0x562e2f96.0x7897df41)
endscript

script 0x99ad1fc1 
	if ($0x562e2f96.0x7897df41 = 0)
		Change \{structurename = 0x562e2f96
			0x7897df41 = 1}
		Change \{structurename = 0x562e2f96
			0xd777153f = 1}
		SpawnScriptNow \{0xc147cd4b}
	endif
	if GotParam \{Wait}
		begin
		if NOT ScriptIsRunning \{0xc147cd4b}
			break
		endif
		WaitOneGameFrame
		repeat
		begin
		if NOT ScreenElementExists \{id = 0x4629d70f}
			break
		endif
		0x4629d70f :se_getprops \{alpha}
		if (<alpha> > 0.95)
			break
		endif
		WaitOneGameFrame
		repeat
	endif
endscript

script 0xd8bd876f 
	if ($0x562e2f96.0x7897df41 > 0)
		Change \{structurename = 0x562e2f96
			0x7897df41 = 0}
		Change \{structurename = 0x562e2f96
			0x41e00715 = 1}
		SpawnScriptNow \{0xc4e273cc}
	endif
endscript

script 0x10b35a47 
	if ($0x562e2f96.0x7897df41 < 100)
		if ($0x562e2f96.0x7897df41 = 0)
			0x99ad1fc1 <...>
		else
			Change structurename = 0x562e2f96 0x7897df41 = ($0x562e2f96.0x7897df41 + 1)
		endif
	else

	endif
endscript

script 0xdf9f604d 
	if ($0x562e2f96.0x7897df41 > 0)
		if ($0x562e2f96.0x7897df41 = 1)
			0xd8bd876f
		else
			Change structurename = 0x562e2f96 0x7897df41 = ($0x562e2f96.0x7897df41 - 1)
		endif
	else

	endif
endscript

script 0xabacc337 
	if ($0x562e2f96.0xd777153f > 0)
		return \{true}
	endif
	if ($0x562e2f96.0x41e00715 > 0)
		return \{true}
	endif
	return \{FALSE}
endscript

script 0x628ef00f 
	begin
	if NOT 0xabacc337
		break
	endif
	WaitOneGameFrame

	repeat
endscript

script 0xc147cd4b 
	0x79db87d7
	0x6f5e5f74
	0x3c57ed08
	0x4ddc5c0f
	Change \{structurename = 0x562e2f96
		0xd777153f = 0}
endscript

script 0xc4e273cc 
	0xdb4b4e25
	0x20ba4529
	0xe68af10a
	0xf00f29a9
	Change \{structurename = 0x562e2f96
		0x41e00715 = 0}
endscript

script 0x3c57ed08 
	if NOT ScreenElementExists \{id = 0x6e4db611}
		CreateScreenElement {
			Type = ContainerElement
			parent = root_window
			id = 0x6e4db611
			Pos = ($0x562e2f96.Pos)
			z_priority = ($0x562e2f96.z_priority)
			just = ($0x562e2f96.just)
			internal_just = ($0x562e2f96.internal_just)
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = 0x6e4db611
			id = 0xb2884368
			texture = black
			z_priority = ($0x562e2f96.z_priority + 1)
			no_zwrite
			Pos = ($0x562e2f96.background.Pos)
			dims = ($0x562e2f96.background.dims)
			just = ($0x562e2f96.background.just)
			rgba = [0 0 0 255]
			alpha = 0.0
		}
		CreateScreenElement {
			Type = TextElement
			parent = 0x6e4db611
			id = 0x4629d70f
			Pos = ($0x562e2f96.text.Pos)
			z_priority = ($0x562e2f96.z_priority + 2)
			just = ($0x562e2f96.text.just)
			rgba = [127 127 127 255]
			alpha = 0.0
			Scale = 1.0
			font = fontgrid_title_a1
			text = qs(0x00000000)
		}
		CreateScreenElement {
			Type = descinterface
			parent = 0x6e4db611
			id = 0x62ed8a10
			Pos = ($0x562e2f96.watch_timer.Pos)
			z_priority = ($0x562e2f96.z_priority + 2)
			alpha = 0.0
			desc = 'watch_timer'
		}
		0x968edca4
		CreateScreenElement {
			Type = TextBlockElement
			parent = 0x6e4db611
			id = 0xc1a795da
			Pos = ($0x562e2f96.message.Pos)
			z_priority = ($0x562e2f96.z_priority + 2)
			dims = (800.0, 400.0)
			rot_angle = -5
			just = ($0x562e2f96.message.just)
			internal_just = [center center]
			rgba = [128 64 64 250]
			alpha = 0.0
			Scale = 0.55
			font = fontgrid_text_a6
			text = <message>
			single_line = FALSE
			fit_width = wrap
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
		}
	endif
endscript

script 0x20ba4529 
	if ScreenElementExists \{id = 0x6e4db611}
		DestroyScreenElement \{id = 0x6e4db611}
	endif
endscript

script 0x4ddc5c0f 
	if ScreenElementExists \{id = 0x6e4db611}
		0xb2884368 :Obj_SpawnScriptNow \{0xd1b27ca2}
		0x4629d70f :Obj_SpawnScriptNow \{0x36d6b169}
		0x62ed8a10 :Obj_SpawnScriptNow \{0x90f5699a}
		0xc1a795da :Obj_SpawnScriptNow \{0x967039b8}
		Change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f + 1)
		Wait ($0x562e2f96.0xbf23998d) Seconds
		Change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f - 1)
	endif
endscript

script 0xdb4b4e25 
	if ScreenElementExists \{id = 0x6e4db611}
		0xb2884368 :obj_killallspawnedscripts
		0x4629d70f :obj_killallspawnedscripts
		0x62ed8a10 :obj_killallspawnedscripts
		0xc1a795da :obj_killallspawnedscripts
		0x6e4db611 :se_setprops alpha = 0.0 time = ($0x562e2f96.fade_out_time)
		0x6e4db611 :se_waitprops
	endif
endscript

script 0xd1b27ca2 
	se_setprops alpha = 1.0 time = ($0x562e2f96.background.fade_in_time)
	se_waitprops
	Change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f + 1)
	Wait ($0x562e2f96.0xbf23998d) Seconds
	Change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f - 1)
endscript

script 0x36d6b169 
	se_setprops \{alpha = 0.0
		time = 0.0}
	Wait ($0x562e2f96.text.delay) Seconds
	se_setprops text = ($0x562e2f96.text.0x6b8904f0)
	se_setprops alpha = 1.0 time = ($0x562e2f96.text.fade_in_time)
	se_waitprops
	Obj_SpawnScriptNow \{0xfe27cc13}
	Change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f + 1)
	Wait ($0x562e2f96.0xbf23998d) Seconds
	Change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f - 1)
endscript

script 0xfe27cc13 
	begin
	se_setprops text = ($0x562e2f96.text.0x6b8904f0)
	Wait \{0.5
		Seconds}
	formatText TextName = text '%s.' s = ($0x562e2f96.text.0x6b8904f0)
	se_setprops text = <text>
	Wait \{0.5
		Seconds}
	formatText TextName = text '%s..' s = ($0x562e2f96.text.0x6b8904f0)
	se_setprops text = <text>
	Wait \{0.5
		Seconds}
	formatText TextName = text '%s...' s = ($0x562e2f96.text.0x6b8904f0)
	se_setprops text = <text>
	Wait \{0.5
		Seconds}
	repeat
endscript

script 0x90f5699a 
	se_setprops \{alpha = 0.0
		time = 0.0}
	Wait ($0x562e2f96.watch_timer.delay) Seconds
	animate_watch_timer
	se_setprops alpha = 1.0 time = ($0x562e2f96.watch_timer.fade_in_time)
	se_waitprops
	Change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f + 1)
	Wait ($0x562e2f96.0xbf23998d) Seconds
	Change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f - 1)
endscript

script 0x967039b8 
	se_setprops \{alpha = 0.0
		time = 0.0}
	Wait ($0x562e2f96.message.delay) Seconds
	se_setprops alpha = 1.0 time = ($0x562e2f96.message.fade_in_time)
	se_waitprops
	Change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f + 1)
	Wait ($0x562e2f96.0xbf23998d) Seconds
	Change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f - 1)
endscript

script 0x968edca4 
	GetRandomValue \{Name = global_or_not
		a = 0
		b = 2
		integer}
	if (<global_or_not> = 1)
		<tips_array> = ($loading_screen_tips)
	else
		if ($current_song = jamsession)
			<tips_array> = ($loading_screen_tips_jam)
		elseif GotParam \{leaderboard}
			<tips_array> = ($loading_screen_tips_leaderboard)
		elseif ($current_num_players = 1)
			<part> = ($player1_status.part)
			switch <part>
				case guitar
				<tips_array> = ($loading_screen_tips_guitar)
				case drum
				<tips_array> = ($loading_screen_tips_drum)
				case vocals
				<tips_array> = ($loading_screen_tips_vocals)
				case bass
				<tips_array> = ($loading_screen_tips_bass)
				default
				<tips_array> = ($loading_screen_tips_guitar)
			endswitch
		else
			if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
				<tips_array> = ($loading_screen_tips)
			else
				<tips_array> = ($loading_screen_tips_band)
			endif
		endif
	endif
	GetArraySize <tips_array>
	GetRandomValue Name = rand_num a = 0 b = (<array_Size> - 1) integer
	message = (<tips_array> [<rand_num>])
	return message = <message>
endscript

script 0x04285d75 \{time = 1.0}

	0x10b35a47

	0x628ef00f

	Wait <time> Seconds

	0xdf9f604d

	0x628ef00f

endscript
