loading_screen_tips = [
	qs(0x2bd8629d)
	qs(0xc2870c9f)
	qs(0xd56dca0d)
	qs(0x95c81309)
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
	printscriptinfo \{'create_loading_screen'}
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
	mark_unsafe_for_shutdown
	movie = 'loading_gh'
	movie_path = ('movies\\bik\\' + <movie> + '.bik.xen')
	desc = 'loading'
	buffer_slot = 0
	textureslot = 2
	loading_text = qs(0xfab8f6e7)
	if (gotparam play_song)
		if (($game_mode) = p4_pro_faceoff)
			movie = 'loading_online'
			movie_path = ('movies\\bik\\' + <movie> + '.bik.xen')
			desc = 'loading_online'
		endif
	endif
	if (($invite_controller > -1) || ($signin_change_happening = 1))
	else
		if gotparam \{play_song}
			if (($game_mode) = p1_career)
				progression_get_total_stars
				if (<total_stars> = 0)
					<part> = ($player1_status.part)
					switch <part>
						case guitar
						case bass
						movie = 'Instructions_LOADING_Guitar'
						desc = 'boot_usingguitar'
						case drum
						movie = 'Instructions_LOADING_Drums'
						desc = 'boot_usingdrum'
						case vocals
						movie = 'Instructions_LOADING_MicXenon'
						desc = 'boot_usingmic_360'
						if isps3
							movie = 'Instructions_LOADING_MicPs3'
							desc = 'boot_usingmic_ps3'
						endif
					endswitch
					movie_path = ('movies\\bik\\' + <movie> + '.bik.xen')
				endif
			elseif ((($game_mode) = p2_career) || (($game_mode) = p3_career) || (($game_mode) = p4_career))
				progression_get_total_stars
				if (<total_stars> = 0)
					movie = 'Instructions_LOADING_MicPs3'
					desc = 'boot_band'
					movie = 'Instructions_Band_Xenon'
					if isps3
						movie = 'Instructions_Band_PS3'
					endif
					movie_path = ('movies\\bik\\' + <movie> + '.bik.xen')
				endif
			endif
		endif
		if gotparam \{bx_useloadingscreenwithnotext}
			if (<bx_useloadingscreenwithnotext> = 1)
				movie = 'BG_Flip'
				movie_path = ('movies\\bik\\' + <movie> + '.bik.xen')
			endif
		endif
		green_text = qs(0x494b4d7f)
		red_text = qs(0x9d57d378)
		if isps3
			getenterbuttonassignment
			if (<assignment> = circle)
				green_text = qs(0x9d57d378)
				red_text = qs(0x494b4d7f)
			endif
		endif
	endif
	getrandomvalue \{name = global_or_not
		a = 0
		b = 2
		integer}
	if (<global_or_not> = 1)
		<tips_array> = ($loading_screen_tips)
	else
		if (<jam_mode> = 1)
			<tips_array> = ($loading_screen_tips_jam)
		elseif gotparam \{leaderboard}
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
	if gotparam \{leaderboard}
		loading_text = qs(0x10ce7efd)
	endif
	getarraysize <tips_array>
	getrandomvalue name = rand_num a = 0 b = (<array_size> - 1) integer
	rand_tip = (<tips_array> [<rand_num>])
	createscreenelement {
		type = descinterface
		parent = root_window
		desc = <desc>
		id = loading_screen_container
		z_priority = 100025
		tags = {
			movie = <movie>
			movie_path = <movie_path>
			buffer_slot = <buffer_slot>
			textureslot = <textureslot>
			loading_text = <loading_text>
			tip_text = <rand_tip>
		}
		loading_text = qs(0x03ac90f0)
		tip_text = qs(0x03ac90f0)
		green_text = <green_text>
		red_text = <red_text>
	}
	if gotparam \{destroy_state}
		change loading_screen_destroy_state = <destroy_state>
	else
		change \{loading_screen_destroy_state = 'none'}
	endif
	if gotparam \{spawn}
		loading_screen_container :obj_spawnscriptnow \{create_loading_screen_spawned}
	else
		create_loading_screen_spawned
	endif
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
