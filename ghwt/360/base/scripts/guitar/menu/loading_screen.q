loading_screen_tips = [
	qs(0xc9b742d3)
	qs(0xc9b742d3)
	qs(0x55128c42)
	qs(0x55128c42)
	qs(0x1b249d67)
	qs(0x1b249d67)
	qs(0x09a5513a)
	qs(0x50f3ec61)
	qs(0x1d11ae73)
	qs(0x9ad8451e)
	qs(0x2b5609ae)
	qs(0x3b41774c)
	qs(0x1b1be91b)
	qs(0xc2870c9f)
	qs(0xd56dca0d)
	qs(0xaba1c872)
	qs(0xbbd1accf)
	qs(0x3ae22a18)
	qs(0x4b04862b)
	qs(0x95c81309)
	qs(0x8a63941b)
]
loading_screen_tips_guitar = [
	qs(0x5b00d2a3)
	qs(0x3fbe71a3)
	qs(0x72a1a04b)
	qs(0x68314f9c)
	qs(0x2b35e0ea)
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
	qs(0xc91035c7)
	qs(0xaeb20c39)
	qs(0x10950ffe)
	qs(0xc39546e9)
	qs(0xae0cbb04)
]
loading_screen_tips_leaderboard = [
	qs(0xd65e620a)
	qs(0xe32a76ac)
	qs(0x91158596)
	qs(0x2bd8629d)
]
loading_screen_destroy_state = 'none'

script create_loading_screen \{mode = play_song
		jam_mode = 0}
	printscriptinfo \{'create_loading_screen'}
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	Change \{is_changing_levels = 1}
	if ($guitar_motion_enable_test = 1)
		return
	endif
	if ScreenElementExists \{id = loading_screen_container}
		return
	endif
	mark_unsafe_for_shutdown
	movie = 'loading_flipbook'
	movie_path = ('movies\\bik\\' + <movie> + '.bik.xen')
	desc = 'loading'
	buffer_slot = 0
	textureSlot = 2
	loading_text = qs(0xfab8f6e7)
	if (($game_mode) = p4_pro_faceoff)
		movie = 'loading_online'
		movie_path = ('movies\\bik\\' + <movie> + '.bik.xen')
		desc = 'loading_online'
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
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		desc = <desc>
		id = loading_screen_container
		z_priority = 500000
		tags = {
			movie = <movie>
			movie_path = <movie_path>
			buffer_slot = <buffer_slot>
			textureSlot = <textureSlot>
			loading_text = <loading_text>
			tip_text = <rand_tip>
		}
		loading_text = qs(0x03ac90f0)
		tip_text = qs(0x03ac90f0)
	}
	if GotParam \{destroy_state}
		Change loading_screen_destroy_state = <destroy_state>
	else
		Change \{loading_screen_destroy_state = 'none'}
	endif
	if GotParam \{spawn}
		loading_screen_container :obj_spawnscript \{create_loading_screen_spawned}
	else
		create_loading_screen_spawned
	endif
endscript

script create_loading_screen_spawned 
	loading_screen_container :GetTags
	killallmovies
	if NOT ismovieinbuffer movie = <movie>
		freemoviebuffer buffer_slot = <buffer_slot>
		MemPushContext \{loadingscreen}
		allocatemoviebuffer buffer_slot = <buffer_slot> movie = <movie_path>
		MemPopContext
		loadmovieintobuffer buffer_slot = <buffer_slot> movie = <movie>
	endif
	playmoviefrombuffer {
		buffer_slot = <buffer_slot>
		textureSlot = <textureSlot>
		TexturePri = 200000
		no_hold
		wait_until_rendered
	}
	begin
	if IsMoviePlaying textureSlot = <textureSlot>
		break
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :se_setprops {
			loading_text = <loading_text>
			tip_text = <tip_text>
		}
	endif
endscript

script create_loading_screen_empty \{mode = play_song
		jam_mode = 0}
	printscriptinfo \{'create_loading_screen'}
	mark_unsafe_for_shutdown
	StopRendering
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	Change \{is_changing_levels = 1}
	if ($guitar_motion_enable_test = 1)
		return
	endif
	if ScreenElementExists \{id = loading_screen_container}
		return
	endif
	if GotParam \{destroy_state}
		Change loading_screen_destroy_state = <destroy_state>
	else
		Change \{loading_screen_destroy_state = 'none'}
	endif
endscript

script destroy_loading_screen \{Force = 0}
	printscriptinfo \{'destroy_loading_screen'}
	if (<Force> = 0)
		if NOT ($loading_screen_destroy_state = 'none')
			ui_event_get_top
			if NOT ($loading_screen_destroy_state = <base_name>)
				return
			endif
		endif
	endif
	if ScreenElementExists \{id = loading_screen_container}
		printf \{qs(0x2f19aa97)
			channel = movie}
		if NOT ScriptIsRunning \{destroy_loading_screen_spawned}
			loading_screen_container :obj_spawnscript destroy_loading_screen_spawned params = <...>
		endif
	endif
	HideLoadingScreen
	if ($playing_song = 0 || $end_credits = 1)
		Change \{is_changing_levels = 0}
	endif
	mark_safe_for_shutdown
endscript

script destroy_loading_screen_spawned \{time = 0.1}
	GetTags
	StopRendering \{reason = loading_screen}
	se_setprops \{alpha = 0}
	if GotParam \{textureSlot}
		if IsMoviePlaying textureSlot = <textureSlot>
			KillMovie textureSlot = <textureSlot>
		endif
	endif
	StartRendering \{reason = loading_screen}
	Die
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

script show_page_flip_loading_screen 
	SpawnScriptNow show_page_flip_loading_screen_spawned params = <...>
endscript

script show_page_flip_loading_screen_spawned 
	killallmovies \{blocking}
	freemoviebuffer \{buffer_slot = 0}
	DisplayLoadingScreen \{'boot_copyright_BG_1'
		spin3d_texture = 'load_wheel'
		spin_x = 800
		spin_y = 554
		Scale = 0.055
		speed = -2}
endscript
