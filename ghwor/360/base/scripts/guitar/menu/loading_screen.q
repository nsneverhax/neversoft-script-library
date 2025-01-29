g_loading_screen_movie = 'none'
g_in_loading_screen = 0
g_loading_screen_is_for_invite = 0

script create_venue_loading_screen \{movie_params = 0x69696969}
	printscriptinfo \{'create_venue_loading_screen'}
	create_loading_screen \{loading_screen_type = static}
endscript

script create_empty_loading_screen \{use_ui_element = None}
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
		use_ui_element = None
		loading_screen_type = static
		for_invite = 0}
	printscriptinfo \{'create_loading_screen'}
	disable_pause
	Change g_loading_screen_is_for_invite = <for_invite>
	if ($is_changing_levels = 1)
		return
	endif
	if ScreenElementExists \{id = loading_screen_container}
		return
	endif
	if ($g_in_loading_screen = 1)
		return
	endif
	if ObjectExists \{id = musicstudio_mainobj}
		musicstudio_mainobj :musicstudio_pauseall \{stack_id = load_screen
			Pause = true}
	endif
	Change \{is_changing_levels = 1}
	Change \{g_in_loading_screen = 1}
	pushunsafeforshutdown \{context = loading_screen}
	if (<loading_screen_type> = static)
		SpawnScriptNow \{show_static_loading_screen_spawned
			params = {
				display_params = {
					'ingame_loading'
					spin3d_texture = 'load_wheel'
					spin_x = 1015
					spin_y = 192
					Scale = 0.07
					speed = -2
					localized
				}
			}}
		return
	endif
	if (<loading_screen_type> = empty)
		if (<use_ui_element> != None)
			AssignAlias id = <use_ui_element> alias = loading_screen_container
		endif
		return
	endif
	if (<loading_screen_type> != bink)
		ScriptAssert 'loading_screen_type is invalid: %a' a = <loading_screen_type>
	endif
	movie = <bink>
	Change g_loading_screen_movie = <movie>
	movie_path = <movie>
	desc = 'loading'
	buffer_slot = 0
	textureSlot = 2
	loading_text = qs(0xfab8f6e7)
	if GotParam \{leaderboard}
		loading_text = qs(0x10ce7efd)
	endif
	if (<use_ui_element> = None)
		CreateScreenElement {
			Type = descinterface
			parent = root_window
			desc = <desc>
			id = loading_screen_container
			loading_text = qs(0x03ac90f0)
			tip_text = qs(0x03ac90f0)
			z_priority = 500000
		}
	else
		AssignAlias id = <use_ui_element> alias = loading_screen_container
	endif
	loading_screen_container :SetTags {
		movie = <movie>
		movie_path = <movie_path>
		buffer_slot = <buffer_slot>
		textureSlot = <textureSlot>
		loading_text = <loading_text>
		tip_text = qs(0x03ac90f0)
		loop_start = <loop_start>
		loop_end = <loop_end>
	}
	if isps3
		bink_heap = <bink_heap_ps3>
	endif
	if GotParam \{spawn}
		loading_screen_container :Obj_SpawnScriptNow create_bink_loading_screen_spawned params = {
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
	OnExitRun \{loading_screen_premature_end_script}
	loading_screen_container :GetTags
	pushdisablerendering \{context = loading_screen_create_bink}
	killallmovies
	if NOT ismovieinbuffer movie = <movie>
		freemoviebuffer buffer_slot = <buffer_slot>
		if (<bink_heap> != heap_cas_cache)
			destroy_bink_sub_heaps
		endif
		finalprintf 'create_loading_screen_spawned: Loading %a into %b' a = <movie_path> b = <buffer_slot>
		MemPushContext <bink_heap> debug_text = allocatemoviebuffer
		allocatemoviebuffer buffer_slot = <buffer_slot> movie = <movie_path>
		MemPopContext
		GetTrueStartTime
		loadmovieintobufferasync buffer_slot = <buffer_slot> movie = <movie>
		begin
		if ismovieinbuffer movie = <movie>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	pausespawnedscript <pause_script>
	Wait \{1
		gameframe}
	if GotParam \{loop_start}
		movie_flags = {
			loop_start = <loop_start>
			loop_end = <loop_end>
		}
	else
		movie_flags = {no_looping no_hold}
	endif
	PlayMovie {
		buffer_slot = <buffer_slot>
		textureSlot = <textureSlot>
		TexturePri = 200000
		<movie_flags>
	}
	unpausespawnedscript <pause_script>
	begin
	if IsMoviePlaying textureSlot = <textureSlot>
		break
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
	Wait \{4
		gameframes
		ignoreslomo}
	popdisablerendering \{context = loading_screen_create_bink}
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :se_setprops {
			loading_text = <loading_text>
		}
	endif
	OnExitRun \{nullscript}
endscript

script destroy_loading_screen \{wait_for_end = 0}
	printscriptinfo \{'destroy_loading_screen'}
	if ($autolaunch_go != -1)
		<wait_for_end> = 0
	endif
	if ObjectExists \{id = musicstudio_mainobj}
		musicstudio_mainobj :musicstudio_pauseall \{stack_id = load_screen
			Pause = FALSE}
	endif
	if ($g_in_loading_screen = 1)
		if NOT ScriptIsRunning \{destroy_loading_screen_spawned}
			finalprintf \{'destroy_loading_screen - $g_in_loading_screen = 1 ... destroying'}
			SpawnScriptNow destroy_loading_screen_spawned params = {wait_for_end = <wait_for_end>}
			HideLoadingScreen
			if ($playing_song = 0 || $end_credits = 1)
				Change \{is_changing_levels = 0}
			endif
		endif
	endif
	if GotParam \{wait_for_unload}
		blockforscript \{destroy_loading_screen_spawned}
	endif
endscript

script destroy_loading_screen_spawned \{time = 0.1
		wait_for_end = !i1768515945}
	finalprintf \{'destroy_loading_screen_spawned'}
	setscriptcannotpause
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :GetTags
	endif
	OnExitRun \{loading_screen_premature_end_script}
	if GotParam \{textureSlot}
		if IsMoviePlaying textureSlot = <textureSlot>
			if (<wait_for_end> = 1)
				begin
				if ($q_boot_scanning_finished = 1)
					break
				endif
				if NOT IsMoviePlaying textureSlot = <textureSlot>
					break
				endif
				Wait \{1
					gameframe}
				repeat
				begin
				if NOT IsMoviePlaying textureSlot = <textureSlot>
					break
				endif
				Wait \{1
					gameframe}
				repeat
				clean_up_user_control_helpers
			endif
			KillMovie textureSlot = <textureSlot>
		endif
		pushdisablerendering \{context = loading_screen_destroy_bink}
		if ScreenElementExists \{id = loading_screen_container}
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
			Wait \{1
				gameframe}
			repeat 300
			if NOT GotParam \{freed_movie}
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
	Change \{g_loading_screen_movie = 'none'}
	if GotParam \{textureSlot}
		popdisablerendering \{context = loading_screen_destroy_bink}
	endif
	popunsafeforshutdown \{context = loading_screen}
	hide_glitch \{num_frames = 5}
	OnExitRun \{nullscript}
	Change \{g_in_loading_screen = 0}
	Change \{g_loading_screen_is_for_invite = 0}
	finalprintf \{'destroy_loading_screen_spawned - Done!'}
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :Die
	endif
endscript

script show_static_loading_screen_spawned \{display_params = 0x69696969}
	setscriptcannotpause
	OnExitRun \{loading_screen_premature_end_script}
	DisplayLoadingScreen <display_params>
	OnExitRun \{nullscript}
endscript

script loading_screen_premature_end_script 
	ScriptAssert \{'Loading screen ended too soon! Probably a killed off spawn script?'}
endscript

script debug_callback_is_loading_screen_shown 
	if ScriptIsRunning \{guitar_startup_spawned}
		return \{FALSE}
	endif
	if IsTrue \{$g_in_loading_screen}
		return \{true}
	endif
	if isloadingscreenactive
		return \{true}
	endif
	return \{FALSE}
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
