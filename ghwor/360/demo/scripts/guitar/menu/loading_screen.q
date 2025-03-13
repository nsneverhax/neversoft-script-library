g_loading_screen_movie = 'none'
g_in_loading_screen = 0
0x23c5bb16 = 0
g_loading_screen_is_for_invite = 0

script create_venue_loading_screen \{movie_params = 0x69696969}
	printscriptinfo \{'create_venue_loading_screen'}
	create_loading_screen \{loading_screen_type = static}
endscript

script create_empty_loading_screen \{use_ui_element = none}
	create_loading_screen {
		loading_screen_type = empty
		use_ui_element = <use_ui_element>
	}
endscript

script create_loading_screen \{mode = play_song
		bink = 'generic_load'
		bink_heap = heap_bink
		bink_heap_ps3 = heap_bink_vram
		pause_script = nothing
		use_ui_element = none
		loading_screen_type = static
		for_invite = 0}
	printscriptinfo \{'create_loading_screen'}
	disable_pause
	change g_loading_screen_is_for_invite = <for_invite>
	if ($is_changing_levels = 1)
		return
	endif
	if screenelementexists \{id = loading_screen_container}
		return
	endif
	if ($g_in_loading_screen = 1)
		return
	endif
	if objectexists \{id = musicstudio_mainobj}
		musicstudio_mainobj :musicstudio_pauseall \{stack_id = load_screen
			pause = true}
	endif
	change \{is_changing_levels = 1}
	change \{g_in_loading_screen = 1}
	pushunsafeforshutdown \{context = loading_screen}
	if (<loading_screen_type> = static)
		spawnscriptnow \{show_static_loading_screen_spawned
			params = {
				display_params = {
					'ingame_loading'
					spin3d_texture = 'load_wheel'
					spin_x = 1015
					spin_y = 192
					scale = 0.07
					speed = -2
					localized
				}
			}}
		return
	endif
	if (<loading_screen_type> = empty)
		if (<use_ui_element> != none)
			assignalias id = <use_ui_element> alias = loading_screen_container
		endif
		return
	endif
	if (<loading_screen_type> != bink)
		scriptassert 'loading_screen_type is invalid: %a' a = <loading_screen_type>
	endif
	movie = <bink>
	change g_loading_screen_movie = <movie>
	movie_path = <movie>
	desc = 'loading'
	buffer_slot = 0
	textureslot = 2
	loading_text = qs(0xfab8f6e7)
	if gotparam \{leaderboard}
		loading_text = qs(0x10ce7efd)
	endif
	if (<use_ui_element> = none)
		createscreenelement {
			type = descinterface
			parent = root_window
			desc = <desc>
			id = loading_screen_container
			loading_text = qs(0x03ac90f0)
			tip_text = qs(0x03ac90f0)
			z_priority = 500000
		}
	else
		assignalias id = <use_ui_element> alias = loading_screen_container
	endif
	loading_screen_container :settags {
		movie = <movie>
		movie_path = <movie_path>
		buffer_slot = <buffer_slot>
		textureslot = <textureslot>
		loading_text = <loading_text>
		tip_text = qs(0x03ac90f0)
		loop_start = <loop_start>
		loop_end = <loop_end>
	}
	if isps3
		bink_heap = <bink_heap_ps3>
	endif
	if gotparam \{spawn}
		loading_screen_container :obj_spawnscriptnow create_bink_loading_screen_spawned params = {
			bink_heap = <bink_heap>
			pause_script = <pause_script>
		}
	else
		create_bink_loading_screen_spawned {
			bink_heap = <bink_heap>
			pause_script = <pause_script>
		}
	endif
endscript

script create_bink_loading_screen_spawned \{bink_heap = !q1768515945
		pause_script = !q1768515945}
	setscriptcannotpause
	onexitrun \{loading_screen_premature_end_script}
	loading_screen_container :gettags
	pushdisablerendering \{context = loading_screen_create_bink}
	killallmovies
	if NOT ismovieinbuffer movie = <movie>
		freemoviebuffer buffer_slot = <buffer_slot>
		if (<bink_heap> != heap_cas_cache)
			destroy_bink_sub_heaps
		endif
		finalprintf 'create_loading_screen_spawned: Loading %a into %b' a = <movie_path> b = <buffer_slot>
		mempushcontext <bink_heap> debug_text = allocatemoviebuffer
		allocatemoviebuffer buffer_slot = <buffer_slot> movie = <movie_path>
		mempopcontext
		gettruestarttime
		loadmovieintobufferasync buffer_slot = <buffer_slot> movie = <movie>
		begin
		if ismovieinbuffer movie = <movie>
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	pausespawnedscript <pause_script>
	wait \{1
		gameframe}
	if gotparam \{loop_start}
		movie_flags = {
			loop_start = <loop_start>
			loop_end = <loop_end>
		}
	else
		movie_flags = {no_looping no_hold}
	endif
	playmovie {
		buffer_slot = <buffer_slot>
		textureslot = <textureslot>
		texturepri = 200000
		<movie_flags>
	}
	unpausespawnedscript <pause_script>
	begin
	if ismovieplaying textureslot = <textureslot>
		break
	endif
	wait \{1
		gameframe
		ignoreslomo}
	repeat
	wait \{4
		gameframes
		ignoreslomo}
	popdisablerendering \{context = loading_screen_create_bink}
	if screenelementexists \{id = loading_screen_container}
		loading_screen_container :se_setprops {
			loading_text = <loading_text>
		}
	endif
	onexitrun \{nullscript}
endscript

script destroy_loading_screen \{wait_for_end = 0}
	printscriptinfo \{'destroy_loading_screen'}
	if ($autolaunch_go != -1)
		<wait_for_end> = 0
	endif
	if objectexists \{id = musicstudio_mainobj}
		musicstudio_mainobj :musicstudio_pauseall \{stack_id = load_screen
			pause = false}
	endif
	if ($g_in_loading_screen = 1)
		if NOT scriptisrunning \{destroy_loading_screen_spawned}
			finalprintf \{'destroy_loading_screen - $g_in_loading_screen = 1 ... destroying'}
			spawnscriptnow destroy_loading_screen_spawned params = {wait_for_end = <wait_for_end>}
			hideloadingscreen
			if ($playing_song = 0 || $end_credits = 1)
				change \{is_changing_levels = 0}
			endif
		endif
	endif
	if gotparam \{wait_for_unload}
		blockforscript \{destroy_loading_screen_spawned}
	endif
endscript

script destroy_loading_screen_spawned \{time = 0.1
		wait_for_end = !i1768515945}
	finalprintf \{'destroy_loading_screen_spawned'}
	setscriptcannotpause
	if screenelementexists \{id = loading_screen_container}
		loading_screen_container :gettags
	endif
	onexitrun \{loading_screen_premature_end_script}
	change \{0x23c5bb16 = 0}
	if gotparam \{textureslot}
		if ismovieplaying textureslot = <textureslot>
			if (<wait_for_end> = 1)
				<allow_skip> = 1
				if isps3
					<allow_skip> = 0
				endif
				if NOT demobuild
					<allow_skip> = 0
				endif
				if (<allow_skip> = 1)
					begin
					if ($q_boot_scanning_finished = 1)
						break
					endif
					if NOT ismovieplaying textureslot = <textureslot>
						break
					endif
					wait \{1
						gameframe}
					repeat
					if ismovieplaying textureslot = <textureslot>
						createscreenelement \{type = containerelement
							parent = root_window
							id = loading_movie_handler
							event_handlers = [
								{
									pad_start
									0xd5f1a3a0
								}
								{
									pad_choose
									0xd5f1a3a0
								}
							]}
						launchevent \{type = focus
							target = loading_movie_handler}
					endif
				endif
				begin
				if NOT ismovieplaying textureslot = <textureslot>
					break
				endif
				if ($0x23c5bb16 = 1)
					break
				endif
				wait \{1
					gameframe}
				repeat
				destroyscreenelement \{id = loading_movie_handler}
				clean_up_user_control_helpers
			endif
			killmovie textureslot = <textureslot>
		endif
		pushdisablerendering \{context = loading_screen_destroy_bink}
		if screenelementexists \{id = loading_screen_container}
			loading_screen_container :se_setprops \{alpha = 0}
		endif
		dumpmoviebuffers
		finalprintf '$g_loading_screen_movie = %a' a = ($g_loading_screen_movie)
		if ($g_loading_screen_movie != 'none')
			begin
			if ismovieinbuffer \{movie = $g_loading_screen_movie}
				finalprintf 'Freeing movie buffer %s %d' s = ($g_loading_screen_movie) d = <buffer_slot>
				freemoviebuffer buffer_slot = <buffer_slot>
				freed_movie = 1
				break
			else
				finalprintf '%s not found in a buffer... waiting.' s = ($g_loading_screen_movie)
			endif
			wait \{1
				gameframe}
			repeat 300
			if NOT gotparam \{freed_movie}
				i = 0
				begin
				finalprintf 'Forcing free of buffer %a' a = <i>
				freemoviebuffer buffer_slot = <i>
				i = (<i> + 1)
				repeat 8
			endif
		endif
	endif
	create_bink_sub_heaps
	change \{g_loading_screen_movie = 'none'}
	if gotparam \{textureslot}
		popdisablerendering \{context = loading_screen_destroy_bink}
	endif
	popunsafeforshutdown \{context = loading_screen}
	hide_glitch \{num_frames = 5}
	onexitrun \{nullscript}
	change \{g_in_loading_screen = 0}
	change \{g_loading_screen_is_for_invite = 0}
	finalprintf \{'destroy_loading_screen_spawned - Done!'}
	if screenelementexists \{id = loading_screen_container}
		loading_screen_container :die
	endif
endscript

script 0xd5f1a3a0 
	change \{0x23c5bb16 = 1}
endscript

script show_static_loading_screen_spawned \{display_params = 0x69696969}
	setscriptcannotpause
	onexitrun \{loading_screen_premature_end_script}
	displayloadingscreen <display_params>
	onexitrun \{nullscript}
endscript

script loading_screen_premature_end_script 
	scriptassert \{'Loading screen ended too soon! Probably a killed off spawn script?'}
endscript

script debug_callback_is_loading_screen_shown 
	if scriptisrunning \{guitar_startup_spawned}
		return \{false}
	endif
	if istrue \{$g_in_loading_screen}
		return \{true}
	endif
	if isloadingscreenactive
		return \{true}
	endif
	return \{false}
endscript

script debug_handle_infinite_loading_screen 
	printf \{'--------------------------------------------------------------------------------'}
	printf \{''}
	printf \{'Possible infinite loading screen detected'}
	printf \{''}
	dumpspawnedscriptstatus
	printf \{''}
	printf \{''}
	ui_print_states
	printf \{''}
	printf \{'Possible infinite loading screen detected'}
	printf \{''}
	printf \{'--------------------------------------------------------------------------------'}
endscript
