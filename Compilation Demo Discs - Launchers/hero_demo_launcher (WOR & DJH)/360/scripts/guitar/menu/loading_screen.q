loading_screen_tips = [
	qs(0x77af5d27)
	qs(0x77af5d27)
	qs(0xb2745572)
	qs(0xb2745572)
	qs(0xf426c70a)
	qs(0xf426c70a)
	qs(0x2bd8629d)
	qs(0x2b5609ae)
	qs(0x4c0c98d2)
	qs(0xd174d14f)
	qs(0xc2870c9f)
	qs(0xd56dca0d)
	qs(0x1b9926de)
	qs(0x2c206f73)
	qs(0x0172c973)
	qs(0x7f5357ce)
	qs(0x95c81309)
	qs(0x125302c0)
]
loading_screen_tips_guitar = [
	qs(0x13ab031d)
	qs(0x5e9a9d78)
	qs(0xb6c99b04)
	qs(0xa77f9cce)
	qs(0x2fa662bd)
	qs(0x9b610367)
	qs(0x857ed25c)
]
loading_screen_tips_drum = [
	qs(0xbb46c108)
	qs(0x066bfa3d)
	qs(0x16d807d3)
	qs(0x02ffd37d)
	qs(0x8004c308)
	qs(0x713f15be)
	qs(0x335dacbc)
]
loading_screen_tips_vocals = [
	qs(0xf4fbec9b)
	qs(0x63dc2c6a)
	qs(0xdb4cd2d0)
	qs(0xbd3a4bb8)
	qs(0x6f12a948)
	qs(0x2db53122)
]
loading_screen_tips_bass = [
	qs(0xcbbfb327)
	qs(0x13ab031d)
	qs(0x5e9a9d78)
]
loading_screen_tips_band = [
	qs(0x97f33c79)
	qs(0x25ed2967)
	qs(0x268feb71)
	qs(0x697a4956)
]
loading_screen_tips_jam = [
	qs(0x0018f7c0)
	qs(0x4390717e)
	qs(0x9c9d5fd9)
	qs(0x8e9eec01)
	qs(0x5bf9e79a)
]
loading_screen_tips_leaderboard = [
	qs(0xbcd6a2dd)
	qs(0xe32a76ac)
	qs(0x91158596)
	qs(0x2bd8629d)
]
loading_screen_destroy_state = 'none'

script create_loading_screen \{mode = play_song
		jam_mode = 0}
endscript

script create_loading_screen_spawned 
	setscriptcannotpause
	stoprendering \{reason = loading_screen}
	loading_screen_container :gettags
	killallmovies
	if NOT ismovieinbuffer movie = <movie>
		freemoviebuffer buffer_slot = <buffer_slot>
		mempushcontext \{loadingscreen}
		allocatemoviebuffer buffer_slot = <buffer_slot> movie = <movie_path>
		mempopcontext
		loadmovieintobuffer buffer_slot = <buffer_slot> movie = <movie>
	endif
	playmoviefrombuffer {
		buffer_slot = <buffer_slot>
		textureslot = <textureslot>
		texturepri = 100020
		no_hold
	}
	begin
	if ismovieplaying textureslot = <textureslot>
		hide_glitch
		startrendering \{reason = loading_screen}
		break
	endif
	printf \{qs(0xc1206903)}
	wait \{1
		gameframe
		ignoreslomo}
	repeat
	if screenelementexists \{id = loading_screen_container}
		loading_screen_container :se_setprops {
			loading_text = <loading_text>
			tip_text = <tip_text>
			loading_bg_alpha = 0.0
		}
	endif
	if screenelementexists \{id = bx_hideglitch_bg}
		destroyscreenelement \{id = bx_hideglitch_bg}
	endif
endscript

script create_loading_screen_empty \{mode = play_song
		jam_mode = 0}
	printscriptinfo \{'create_loading_screen_empty'}
	mark_unsafe_for_shutdown
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	change \{is_changing_levels = 1}
	if ($guitar_motion_enable_test = 1)
		return
	endif
	if screenelementexists \{id = loading_screen_container}
		return
	endif
	stoprendering \{reason = loading_screen}
	if gotparam \{destroy_state}
		change loading_screen_destroy_state = <destroy_state>
	else
		change \{loading_screen_destroy_state = 'none'}
	endif
endscript

script destroy_loading_screen \{force = 0}
	printscriptinfo \{'destroy_loading_screen'}
	if (<force> = 0)
		if NOT ($loading_screen_destroy_state = 'none')
			ui_event_get_top
			if NOT ($loading_screen_destroy_state = <base_name>)
				return
			endif
		endif
	endif
	if screenelementexists \{id = loading_screen_container}
		printf \{qs(0x2f19aa97)
			channel = movie}
		if NOT scriptisrunning \{destroy_loading_screen_spawned}
			loading_screen_container :obj_spawnscript destroy_loading_screen_spawned params = <...>
		endif
	else
		startrendering \{reason = loading_screen}
	endif
	hideloadingscreen
	if ($playing_song = 0 || $end_credits = 1)
		change \{is_changing_levels = 0}
	endif
	mark_safe_for_shutdown
endscript

script destroy_loading_screen_spawned \{time = 0.1}
	gettags
	stoprendering \{reason = loading_screen}
	se_setprops \{alpha = 0}
	if gotparam \{textureslot}
		if ismovieplaying textureslot = <textureslot>
			killmovie textureslot = <textureslot>
		endif
	endif
	startrendering \{reason = loading_screen}
	die
endscript

script refresh_screen 
	destroy_loading_screen
	begin
	if NOT screenelementexists \{id = loading_screen_container}
		break
	endif
	wait \{1
		gameframe}
	repeat
	create_loading_screen
endscript

script show_page_flip_loading_screen 
	spawnscriptnow show_page_flip_loading_screen_spawned params = <...>
endscript

script show_page_flip_loading_screen_spawned 
	killallmovies \{blocking}
	freemoviebuffer \{buffer_slot = 0}
	displayloadingscreen \{'boot_copyright_BG_1'
		spin3d_texture = 'load_wheel'
		spin_x = 800
		spin_y = 554
		scale = 0.055
		speed = -2}
endscript
