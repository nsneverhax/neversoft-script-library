0x2c0a2ab0 = ''
0x7fd97fda = 0
0x92287416 = FALSE
loading_screen_tips = [
	qs(0x713ae349)
	qs(0x713ae349)
	qs(0xb2745572)
	qs(0xb2745572)
	qs(0x1b249d67)
	qs(0x1b249d67)
	qs(0xc2870c9f)
	qs(0x2d9b1a58)
	qs(0xbb1aab54)
	qs(0xbb1aab54)
	qs(0x4b04862b)
	qs(0x95c81309)
]
loading_screen_tips_guitar = [
	qs(0x5b00d2a3)
	qs(0x3fbe71a3)
	qs(0x72a1a04b)
	qs(0x68314f9c)
	qs(0xf1b5a49c)
	qs(0x61524e4f)
]
loading_screen_tips_drum = [
	qs(0xbb46c108)
	qs(0x066bfa3d)
	qs(0x2957d847)
	qs(0x02ffd37d)
	qs(0xad313cae)
	qs(0x713f15be)
	qs(0xcccdd663)
]
loading_screen_tips_vocals = [
	qs(0xf074447f)
	qs(0x63dc2c6a)
	qs(0xdb4cd2d0)
	qs(0x7490e0eb)
	qs(0x6f12a948)
	qs(0x2f945279)
]
loading_screen_tips_bass = [
	qs(0xf87cba75)
	qs(0x5b00d2a3)
	qs(0x3fbe71a3)
]
loading_screen_tips_band = [
	qs(0x118abab2)
	qs(0x25ed2967)
	qs(0x268feb71)
	qs(0x8dd90fa9)
]
loading_screen_tips_jam = [
	qs(0x1f43bc52)
	qs(0x6caf0ac3)
	qs(0x1d817b5a)
	qs(0x9e86db48)
]
loading_screen_tips_leaderboard = [
	qs(0xd65e620a)
	qs(0xe32a76ac)
	qs(0x91158596)
	qs(0x2bd8629d)
]

script create_loading_screen \{mode = play_song
		jam_mode = 0}
	if ScreenElementExists \{id = loading_screen_container}
		0x8dbdaee4 \{qs(0xc48ef589)}
		return
	endif
	if ($is_changing_levels = 1)
		0x8dbdaee4 \{qs(0xea5bf40e)}
		return
	endif
	Change \{is_changing_levels = 1}
	Change \{0x7fd97fda = 1}
	SetButtonEventMappings \{block_menu_input}
	if NOT GotParam \{0xdf3c5641}
		menu_music_off
	endif
	songstoppreview
	songstop
	disable_pause
	fadetoblack \{On
		time = 0.0
		alpha = 1.0
		z_priority = 100100}
	if ($0x92287416 = FALSE)
		Change \{0x92287416 = true}
		0x79db87d7
	endif
	mark_unsafe_for_shutdown
	desc = 'loading'
	Change \{0x2c0a2ab0 = 'pak/ui/loading_screen.pak'}
	loading_text = qs(0xfab8f6e7)
	if (($invite_controller > -1) || ($signin_change_happening = 1))
	else
		if (($game_mode) = p1_career)
			if NOT progression_check_intro_complete
				<part> = ($player1_status.part)
				switch <part>
					case guitar
					case bass
					desc = 'instruction_loading_guitar'
					Change \{0x2c0a2ab0 = 'pak/ui/instruction_loading_screen_guitar.pak'}
					case drum
					desc = 'instruction_loading_drums'
					Change \{0x2c0a2ab0 = 'pak/ui/instruction_loading_screen_drums.pak'}
					case vocals
					desc = 'instruction_loading_vocals'
					Change \{0x2c0a2ab0 = 'pak/ui/instruction_loading_screen_vocals.pak'}
				endswitch
				green_text = qs(0x494b4d7f)
				red_text = qs(0x9d57d378)
			endif
		elseif ((($game_mode) = p2_career) || (($game_mode) = p3_career) || (($game_mode) = p4_career))
			if NOT progression_check_intro_complete
				desc = 'instruction_loading_band'
				Change \{0x2c0a2ab0 = 'pak/ui/instruction_loading_screen_band.pak'}
			endif
		endif
	endif
	GetRandomValue \{Name = global_or_not
		a = 0
		b = 2
		integer}
	if (<global_or_not> = 1)
		<tips_array> = ($loading_screen_tips)
	else
		if (<jam_mode> = 1)
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
	if GotParam \{leaderboard}
		loading_text = qs(0x10ce7efd)
	endif
	GetArraySize <tips_array>
	GetRandomValue Name = rand_num a = 0 b = (<array_Size> - 1) integer
	rand_tip = (<tips_array> [<rand_num>])
	if ScreenElementExists \{id = loading_screen_container}
		DestroyScreenElement \{id = loading_screen_container}
	endif
	LoadPak \{$0x2c0a2ab0
		Heap = BottomUpHeap}
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		desc = <desc>
		id = loading_screen_container
		z_priority = 500000
		tip_text = <rand_tip>
	}
	if GotParam \{spawn}
		loading_screen_container :obj_spawnscript \{create_loading_screen_spawned
			params = {
			}}
	else
		create_loading_screen_spawned
	endif
	if GotParam \{Wait}
		begin
		if NOT ScriptIsRunning \{create_loading_screen_spawned}
			break
		endif
		WaitOneGameFrame
		repeat
	endif
endscript

script create_loading_screen_spawned 
	Wait \{4
		gameframes}
	if progression_check_intro_complete
		0xfa49b57f = true
	else
		0xfa49b57f = FALSE
	endif
	if ((($game_mode) = p1_career) && (<0xfa49b57f> = FALSE))
		DisplayLoadingScreen \{no_back
			animate
			0x91f64d92 = 6
			0x2374ff6a = [
				'LoadingScreens/loading_clock_00%d'
			]
			X = [
				[
					708
				]
			]
			y = [
				[
					595
				]
			]
			w = [
				[
					96
				]
			]
			h = [
				[
					97
				]
			]}
	elseif (((($game_mode) = p2_career) || (($game_mode) = p3_career) || (($game_mode) = p4_career)) && (<0xfa49b57f> = FALSE))
		DisplayLoadingScreen \{no_back
			animate
			0x91f64d92 = 6
			0x2374ff6a = [
				'LoadingScreens/loading_clock_00%d'
			]
			X = [
				[
					708
				]
			]
			y = [
				[
					595
				]
			]
			w = [
				[
					96
				]
			]
			h = [
				[
					97
				]
			]}
	else
		DisplayLoadingScreen \{no_back
			animate
			0x91f64d92 = 8
			0x2374ff6a = [
				'LoadingScreens/loading_animation%d'
			]
			X = [
				[
					728
				]
			]
			y = [
				[
					286
				]
			]
			w = [
				[
					316
				]
			]
			h = [
				[
					260
				]
			]}
	endif
endscript

script destroy_loading_screen \{Force = 0}
	if ScreenElementExists \{id = loading_screen_container}
		if NOT ScriptIsRunning \{destroy_loading_screen_spawned}
			loading_screen_container :obj_spawnscript destroy_loading_screen_spawned params = <...>
		endif
	endif
endscript

script destroy_loading_screen_spawned 
	UnLoadPak \{$0x2c0a2ab0}
	Change \{0x2c0a2ab0 = ''}
	if (<Force> = 0)
		Wait \{1
			Second}
	endif
	loading_screen_container :GetTags
	loading_screen_container :se_setprops \{alpha = 0}
	HideLoadingScreen
	Change \{is_changing_levels = 0}
	Change \{0x7fd97fda = 0}
	loading_screen_container :Die
	StartRendering \{reason = loading_screen}
	SetButtonEventMappings \{unblock_menu_input}
	if ($0x92287416 = true)
		Change \{0x92287416 = FALSE}
		0xf00f29a9
	endif
	mark_safe_for_shutdown
	fadetoblack \{OFF
		time = 0
		no_wait}
endscript

script refresh_screen 
	destroy_loading_screen
	begin
	if NOT ScreenElementExists \{id = loading_screen_container}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_loading_screen
endscript

script 0x8658e568 
	if ScreenElementExists \{id = loading_screen_container}
		return \{true}
	endif
	return \{FALSE}
endscript

script 0xcbca19f9 
	if ScreenElementExists \{id = loading_screen_container}
		return \{true}
	endif
	return \{FALSE}
endscript

script 0x18954ab6 
	if ScreenElementExists \{id = loading_screen_container}
		return \{true}
	endif
	return \{FALSE}
endscript
