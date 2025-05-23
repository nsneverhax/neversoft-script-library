loading_screen_tips = [
	qs(0xdda8fcc0)
	qs(0xf1cb5271)
	qs(0xf426c70a)
	qs(0x3b41774c)
	qs(0xf1c73585)
	qs(0xaa030697)
	qs(0x3c82b79b)
	qs(0x04d5d975)
	qs(0x4b04862b)
	qs(0xb632fcfc)
]
loading_screen_tips_guitar = [
	qs(0x5b00d2a3)
	qs(0x3fbe71a3)
	qs(0x4b384d00)
	qs(0x6c064a18)
	qs(0xd889eb59)
	qs(0xf1b5a49c)
	qs(0xeb4e673e)
	qs(0x07b7ee91)
	qs(0x53a84648)
]
loading_screen_tips_drum = [
	qs(0xbb46c108)
	qs(0x066bfa3d)
	qs(0x8671b6d5)
	qs(0x02ffd37d)
	qs(0xad313cae)
	qs(0x713f15be)
	qs(0xcccdd663)
]
loading_screen_tips_vocals = [
	qs(0xf074447f)
	qs(0x63dc2c6a)
	qs(0x0ebc3cdf)
	qs(0x0def58b4)
	qs(0x7490e0eb)
	qs(0x6f12a948)
	qs(0x2f945279)
	qs(0xa5618177)
	qs(0x14eddef2)
]
loading_screen_tips_bass = [
	qs(0xf87cba75)
	qs(0x5b00d2a3)
	qs(0x3fbe71a3)
	qs(0x502237bd)
	qs(0xeb4e673e)
	qs(0xfbaee218)
]
loading_screen_tips_band = [
	qs(0x118abab2)
	qs(0x25ed2967)
	qs(0x268feb71)
	qs(0x8dd90fa9)
]
loading_screen_tips_jam = [
	qs(0x1ed8e4a1)
	qs(0xf3dc207a)
	qs(0xbc5ffb3d)
	qs(0xc39546e9)
	qs(0x9f194d05)
]
loading_screen_tips_leaderboard = [
	qs(0x188bbe66)
	qs(0x8a5a0d36)
	qs(0x91158596)
	qs(0x2bd8629d)
]
loading_screen_destroy_state = 'none'

script create_loading_screen \{mode = play_song
		jam_mode = 0}
	if ($debug_ui_transitions = 1)
		printscriptinfo channel = ($debug_ui_transitions_channel) 'create_loading_screen #########################'
		printf channel = ($debug_ui_transitions_channel) qs(0xa759d1c0) d = ($is_changing_levels)
		printf channel = ($debug_ui_transitions_channel) qs(0xd0b8fdb3) d = ($playing_song)
	endif
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
	movie = 'loading_stripes'
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
		if (($game_mode) = p1_career)
			if NOT progression_check_intro_complete
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
				green_text = qs(0x182f0173)
				red_text = qs(0xaf4d5dd2)
				if isps3
					getenterbuttonassignment
					if (<assignment> = circle)
						green_text = qs(0xaf4d5dd2)
						red_text = qs(0x182f0173)
					endif
				endif
			endif
		elseif ((($game_mode) = p2_career) || (($game_mode) = p3_career) || (($game_mode) = p4_career))
			if NOT progression_check_intro_complete
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
		z_priority = 500000
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
	if ($debug_ui_transitions = 1)
		printscriptinfo channel = ($debug_ui_transitions_channel) 'create_loading_screen #########################'
		printf channel = ($debug_ui_transitions_channel) qs(0xa759d1c0) d = ($is_changing_levels)
		printf channel = ($debug_ui_transitions_channel) qs(0xd0b8fdb3) d = ($playing_song)
	endif
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
		texturepri = 200000
		no_hold
	}
	begin
	if ismovieplaying textureslot = <textureslot>
		hide_glitch
		startrendering \{reason = loading_screen}
		break
	endif
	printf \{channel = ui
		qs(0xc1206903)}
	wait \{1
		gameframe
		ignoreslomo}
	repeat
	if screenelementexists \{id = loading_screen_container}
		loading_screen_container :se_setprops {
			loading_text = <loading_text>
			tip_text = <tip_text>
		}
	endif
endscript

script create_loading_screen_empty \{mode = play_song
		jam_mode = 0}
	if ($debug_ui_transitions = 1)
		printscriptinfo channel = ($debug_ui_transitions_channel) 'create_loading_screen #########################'
		printf channel = ($debug_ui_transitions_channel) qs(0xa759d1c0) d = ($is_changing_levels)
		printf channel = ($debug_ui_transitions_channel) qs(0xd0b8fdb3) d = ($playing_song)
	endif
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
	if ($debug_ui_transitions = 1)
		printscriptinfo channel = ($debug_ui_transitions_channel) 'destroy_loading_screen ======================='
		printf channel = ($debug_ui_transitions_channel) qs(0xa759d1c0) d = ($is_changing_levels)
		printf channel = ($debug_ui_transitions_channel) qs(0xd0b8fdb3) d = ($playing_song)
	endif
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
	if gotparam \{movie}
		if ismovieinbuffer movie = <movie>
			if gotparam \{buffer_slot}
				freemoviebuffer buffer_slot = <buffer_slot>
			endif
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
