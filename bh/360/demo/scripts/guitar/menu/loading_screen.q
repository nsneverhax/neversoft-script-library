loading_screen_destroy_state = 'none'
loading_screen_movie = 'none'

script create_venue_loading_screen 
	printscriptinfo \{'create_venue_loading_screen'}
	requireparams \{[
			movie_params
		]
		all}
	if NOT structurecontains structure = <movie_params> loading_movie
		scriptassert \{'loading_movie param missing'}
	endif
	if NOT structurecontains structure = <movie_params> loading_movie_loop_start
		scriptassert \{'loading_movie_loop_start param missing'}
	endif
	if NOT structurecontains structure = <movie_params> loading_movie_loop_end
		scriptassert \{'loading_movie_loop_end param missing'}
	endif
	create_loading_screen {
		is_bink
		bink = (<movie_params>.loading_movie)
		loop_start = (<movie_params>.loading_movie_loop_start)
		loop_end = (<movie_params>.loading_movie_loop_end)
	}
endscript

script create_loading_screen \{mode = play_song
		jam_mode = 0
		bink = 'loading_venue_nashv'
		heap = heap_bink
		heap_vram = heap_bink_vram
		pause_script = nothing}
	spawnscriptnow \{skate8_sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend
			fadeintime = 2.0
			fadeintype = linear
			fadeouttime = 2
			fadeouttype = linear
		}}
	change \{0xe3aed043 = 1}
	printscriptinfo \{'create_loading_screen'}
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	if objectexists \{id = musicstudio_mainobj}
		musicstudio_mainobj :musicstudio_pauseall \{stack_id = load_screen
			pause = true}
	endif
	change \{is_changing_levels = 1}
	if NOT gotparam \{is_bink}
		show_basic_loading_screen \{display_params = {
				'ingame_loading'
				spin_texture = 'load_wheel'
				spin_x = 1060
				spin_y = 555
				scale = 0.055
				speed = -2
				localized
			}}
		return
	endif
	if screenelementexists \{id = loading_screen_container}
		return
	endif
	mark_unsafe_for_shutdown
	movie = <bink>
	change loading_screen_movie = <movie>
	movie_path = <movie>
	desc = 'loading'
	buffer_slot = 0
	textureslot = 2
	loading_text = qs(0xfab8f6e7)
	if gotparam \{leaderboard}
		loading_text = qs(0x10ce7efd)
	endif
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
			tip_text = qs(0x03ac90f0)
			loop_start = <loop_start>
			loop_end = <loop_end>
		}
		loading_text = qs(0x03ac90f0)
		tip_text = qs(0x03ac90f0)
	}
	if gotparam \{destroy_state}
		change loading_screen_destroy_state = <destroy_state>
	else
		change \{loading_screen_destroy_state = 'none'}
	endif
	if gotparam \{spawn}
		loading_screen_container :obj_spawnscriptnow create_loading_screen_spawned params = {heap = <heap> heap_vram = <heap_vram> pause_script = <pause_script>}
	else
		create_loading_screen_spawned heap = <heap> heap_vram = <heap_vram> pause_script = <pause_script>
	endif
endscript

script create_loading_screen_spawned 
	setscriptcannotpause
	loading_screen_container :gettags
	stoprendering \{reason = loading_screen}
	killallmovies
	if NOT ismovieinbuffer movie = <movie>
		freemoviebuffer buffer_slot = <buffer_slot>
		if (<heap> != heap_cas_cache)
			destroy_bink_sub_heaps
		endif
		if isps3
			heap = <heap_vram>
		else
			heap = <heap>
		endif
		finalprintf 'create_loading_screen_spawned: Loading %a into %b' a = <movie_path> b = <buffer_slot>
		mempushcontext <heap>
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
	spawnscriptnow \{playaudiosequenceforloadingbink}
	wait \{4
		gameframes
		ignoreslomo}
	startrendering \{reason = loading_screen}
	if screenelementexists \{id = loading_screen_container}
		loading_screen_container :se_setprops {
			loading_text = <loading_text>
		}
	endif
endscript

script create_loading_screen_empty \{mode = play_song
		jam_mode = 0}
	printscriptinfo \{'create_loading_screen'}
	mark_unsafe_for_shutdown
	stoprendering
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	change \{is_changing_levels = 1}
	if screenelementexists \{id = loading_screen_container}
		return
	endif
	if gotparam \{destroy_state}
		change loading_screen_destroy_state = <destroy_state>
	else
		change \{loading_screen_destroy_state = 'none'}
	endif
endscript

script destroy_loading_screen \{force = 0}
	change \{0xe3aed043 = 0}
	printscriptinfo \{'destroy_loading_screen'}
	if (<force> = 0)
		if NOT ($loading_screen_destroy_state = 'none')
			ui_event_get_top
			if NOT ($loading_screen_destroy_state = <base_name>)
				return
			endif
		endif
	endif
	if objectexists \{id = musicstudio_mainobj}
		musicstudio_mainobj :musicstudio_pauseall \{stack_id = load_screen
			pause = false}
	endif
	if screenelementexists \{id = loading_screen_container}
		printf \{qs(0x2f19aa97)
			channel = movie}
		if NOT scriptisrunning \{destroy_loading_screen_spawned}
			loading_screen_container :obj_spawnscript destroy_loading_screen_spawned updateimmediately = 1 params = <...>
		endif
	endif
	hideloadingscreen
	if ($playing_song = 0 || $end_credits = 1)
		change \{is_changing_levels = 0}
	endif
	mark_safe_for_shutdown
	if gotparam \{wait_for_unload}
		begin
		if NOT screenelementexists \{id = loading_screen_container}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript
end_movie_early = 0

script destroy_loading_screen_spawned \{time = 0.1}
	finalprintf \{'destroy_loading_screen_spawned'}
	gettags
	change \{end_movie_early = 0}
	if gotparam \{textureslot}
		if ismovieplaying textureslot = <textureslot>
			if gotparam \{wait_for_end}
				if NOT isps3
					createscreenelement \{type = containerelement
						parent = root_window
						id = loading_movie_handler
						event_handlers = [
							{
								pad_start
								loadingendmovie
							}
							{
								pad_choose
								loadingendmovie
							}
						]}
					launchevent \{type = focus
						target = loading_movie_handler}
					add_user_control_helper \{text = qs(0x784c64ff)
						button = start
						another_button = green
						all_buttons
						z = 500001}
				endif
				begin
				if NOT ismovieplaying textureslot = <textureslot>
					break
				endif
				if ($end_movie_early = 1)
					break
				endif
				wait \{1
					gameframe}
				repeat
				destroyscreenelement \{id = loading_movie_handler}
				clean_up_user_control_helpers
			endif
			killspawnedscript \{name = playaudiosequenceforloadingbink}
			spawnscriptnow \{stopaudiosequenceforloadingbink}
			killmovie textureslot = <textureslot>
		endif
	endif
	stoprendering \{reason = loading_screen}
	se_setprops \{alpha = 0}
	dumpmoviebuffers
	finalprintf '$loading_screen_movie = %a' a = ($loading_screen_movie)
	if ($loading_screen_movie != 'none')
		begin
		if ismovieinbuffer \{movie = $loading_screen_movie}
			finalprintf 'Freeing movie buffer %s %d' s = ($loading_screen_movie) d = <buffer_slot>
			freemoviebuffer buffer_slot = <buffer_slot>
			freed_movie = 1
			break
		else
			finalprintf '%s not found in a buffer... waiting.' s = ($loading_screen_movie)
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
	create_bink_sub_heaps
	change \{loading_screen_movie = 'none'}
	startrendering \{reason = loading_screen}
	hide_glitch \{num_frames = 5}
	finalprintf \{'destroy_loading_screen_spawned - Done!'}
	die
endscript

script loadingendmovie 
	change \{end_movie_early = 1}
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

script show_basic_loading_screen 
	spawnscriptnow show_basic_loading_screen_spawned params = <...>
endscript

script show_basic_loading_screen_spawned 
	displayloadingscreen <display_params>
endscript

script debug_callback_is_loading_screen_shown 
	if scriptisrunning \{guitar_startup_spawned}
		return \{false}
	endif
	if istrue \{$is_changing_levels}
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
