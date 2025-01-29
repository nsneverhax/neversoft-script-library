loading_screen_movie = 'none'

script create_venue_loading_screen 
	printscriptinfo \{'create_venue_loading_screen'}
	RequireParams \{[
			movie_params
		]
		all}
	if NOT StructureContains structure = <movie_params> loading_movie
		ScriptAssert \{'loading_movie param missing'}
	endif
	if NOT StructureContains structure = <movie_params> loading_movie_loop_start
		ScriptAssert \{'loading_movie_loop_start param missing'}
	endif
	if NOT StructureContains structure = <movie_params> loading_movie_loop_end
		ScriptAssert \{'loading_movie_loop_end param missing'}
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
		Heap = heap_bink
		heap_vram = heap_bink_vram
		pause_script = nothing}
	printscriptinfo \{'create_loading_screen'}
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	if ObjectExists \{id = musicstudio_mainobj}
		musicstudio_mainobj :musicstudio_pauseall \{stack_id = load_screen
			Pause = true}
	endif
	Change \{is_changing_levels = 1}
	if NOT GotParam \{is_bink}
		show_basic_loading_screen \{display_params = {
				'ingame_loading'
				spin3d_texture = 'load_wheel'
				spin_x = 1055
				spin_y = 540
				Scale = 0.07
				speed = -2
				localized
			}}
		return
	endif
	if ScreenElementExists \{id = loading_screen_container}
		return
	endif
	pushunsafeforshutdown \{context = loading_screen
		Type = unchecked}
	movie = <bink>
	Change loading_screen_movie = <movie>
	movie_path = <movie>
	desc = 'loading'
	buffer_slot = 0
	textureSlot = 2
	loading_text = qs(0xfab8f6e7)
	if GotParam \{leaderboard}
		loading_text = qs(0x10ce7efd)
	endif
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
			tip_text = qs(0x03ac90f0)
			loop_start = <loop_start>
			loop_end = <loop_end>
		}
		loading_text = qs(0x03ac90f0)
		tip_text = qs(0x03ac90f0)
	}
	if GotParam \{spawn}
		loading_screen_container :Obj_SpawnScriptNow create_loading_screen_spawned params = {Heap = <Heap> heap_vram = <heap_vram> pause_script = <pause_script>}
	else
		create_loading_screen_spawned Heap = <Heap> heap_vram = <heap_vram> pause_script = <pause_script>
	endif
endscript

script create_loading_screen_spawned 
	setscriptcannotpause
	loading_screen_container :GetTags
	pushdisablerendering \{context = loading_screen
		Type = unchecked}
	killallmovies
	if NOT ismovieinbuffer movie = <movie>
		freemoviebuffer buffer_slot = <buffer_slot>
		if (<Heap> != heap_cas_cache)
			destroy_bink_sub_heaps
		endif
		if isps3
			Heap = <heap_vram>
		else
			Heap = <Heap>
		endif
		finalprintf 'create_loading_screen_spawned: Loading %a into %b' a = <movie_path> b = <buffer_slot>
		MemPushContext <Heap>
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
	popdisablerendering \{context = loading_screen
		Type = unchecked}
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :se_setprops {
			loading_text = <loading_text>
		}
	endif
endscript

script destroy_loading_screen \{Force = 0}
	printscriptinfo \{'destroy_loading_screen'}
	if ObjectExists \{id = musicstudio_mainobj}
		musicstudio_mainobj :musicstudio_pauseall \{stack_id = load_screen
			Pause = FALSE}
	endif
	if ScreenElementExists \{id = loading_screen_container}
		printf \{qs(0x2f19aa97)
			channel = movie}
		if NOT ScriptIsRunning \{destroy_loading_screen_spawned}
			loading_screen_container :obj_spawnscript destroy_loading_screen_spawned updateimmediately = 1 params = <...>
		endif
	endif
	HideLoadingScreen
	if ($playing_song = 0 || $end_credits = 1)
		Change \{is_changing_levels = 0}
	endif
	popunsafeforshutdown \{context = loading_screen
		Type = unchecked}
	if GotParam \{wait_for_unload}
		begin
		if NOT ScreenElementExists \{id = loading_screen_container}
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript
end_movie_early = 0

script destroy_loading_screen_spawned \{time = 0.1}
	finalprintf \{'destroy_loading_screen_spawned'}
	GetTags
	Change \{end_movie_early = 0}
	if GotParam \{textureSlot}
		if IsMoviePlaying textureSlot = <textureSlot>
			if GotParam \{wait_for_end}
				if NOT isps3
					CreateScreenElement \{Type = ContainerElement
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
					LaunchEvent \{Type = focus
						target = loading_movie_handler}
					add_user_control_helper \{text = qs(0x784c64ff)
						button = start
						another_button = green
						all_buttons
						z = 500001}
				endif
				begin
				if NOT IsMoviePlaying textureSlot = <textureSlot>
					break
				endif
				if ($end_movie_early = 1)
					break
				endif
				Wait \{1
					gameframe}
				repeat
				DestroyScreenElement \{id = loading_movie_handler}
				clean_up_user_control_helpers
			endif
			KillMovie textureSlot = <textureSlot>
		endif
	endif
	pushdisablerendering \{context = loading_screen
		Type = unchecked}
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
	create_bink_sub_heaps
	Change \{loading_screen_movie = 'none'}
	popdisablerendering \{context = loading_screen
		Type = unchecked}
	hide_glitch \{num_frames = 5}
	finalprintf \{'destroy_loading_screen_spawned - Done!'}
	Die
endscript

script loadingendmovie 
	Change \{end_movie_early = 1}
endscript

script show_basic_loading_screen 
	SpawnScriptNow show_basic_loading_screen_spawned params = <...>
endscript

script show_basic_loading_screen_spawned 
	DisplayLoadingScreen <display_params>
endscript

script debug_callback_is_loading_screen_shown 
	if ScriptIsRunning \{guitar_startup_spawned}
		return \{FALSE}
	endif
	if IsTrue \{$is_changing_levels}
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
