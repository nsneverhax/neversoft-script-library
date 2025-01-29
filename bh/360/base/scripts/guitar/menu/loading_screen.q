loading_screen_destroy_state = 'none'
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
		heap = heap_bink
		heap_vram = heap_bink_vram
		pause_script = nothing}
	spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = FrontEnd
			fadeintime = 2.0
			fadeintype = linear
			fadeouttime = 2
			fadeouttype = linear
		}}
	Change \{IN_LOADING_SCREEN = 1}
	printscriptinfo \{'create_loading_screen'}
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	if ObjectExists \{id = musicstudio_mainobj}
		musicstudio_mainobj :MusicStudio_PauseAll \{stack_id = load_screen
			Pause = true}
	endif
	Change \{is_changing_levels = 1}
	if NOT GotParam \{is_bink}
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
	if ScreenElementExists \{id = loading_screen_container}
		return
	endif
	mark_unsafe_for_shutdown
	movie = <bink>
	Change loading_screen_movie = <movie>
	movie_path = <movie>
	desc = 'loading'
	buffer_slot = 0
	TextureSlot = 2
	loading_text = qs(0xfab8f6e7)
	if GotParam \{leaderboard}
		loading_text = qs(0x10ce7efd)
	endif
	CreateScreenElement {
		type = DescInterface
		parent = root_window
		desc = <desc>
		id = loading_screen_container
		z_priority = 500000
		tags = {
			movie = <movie>
			movie_path = <movie_path>
			buffer_slot = <buffer_slot>
			TextureSlot = <TextureSlot>
			loading_text = <loading_text>
			tip_text = qs(0x03ac90f0)
			loop_start = <loop_start>
			loop_end = <loop_end>
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
		loading_screen_container :Obj_SpawnScriptNow create_loading_screen_spawned params = {heap = <heap> heap_vram = <heap_vram> pause_script = <pause_script>}
	else
		create_loading_screen_spawned heap = <heap> heap_vram = <heap_vram> pause_script = <pause_script>
	endif
endscript

script create_loading_screen_spawned 
	SetScriptCannotPause
	loading_screen_container :GetTags
	StopRendering \{reason = loading_screen}
	KillAllMovies
	if NOT IsMovieInBuffer movie = <movie>
		FreeMovieBuffer buffer_slot = <buffer_slot>
		if (<heap> != heap_cas_cache)
			destroy_bink_sub_heaps
		endif
		if IsPS3
			heap = <heap_vram>
		else
			heap = <heap>
		endif
		FinalPrintf 'create_loading_screen_spawned: Loading %a into %b' a = <movie_path> b = <buffer_slot>
		MemPushContext <heap>
		AllocateMovieBuffer buffer_slot = <buffer_slot> movie = <movie_path>
		MemPopContext
		GetTrueStartTime
		LoadMovieIntoBufferAsync buffer_slot = <buffer_slot> movie = <movie>
		begin
		if IsMovieInBuffer movie = <movie>
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	PauseSpawnedScript <pause_script>
	wait \{1
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
		TextureSlot = <TextureSlot>
		TexturePri = 200000
		<movie_flags>
	}
	unpausespawnedscript <pause_script>
	begin
	if IsMoviePlaying TextureSlot = <TextureSlot>
		break
	endif
	wait \{1
		gameframe
		ignoreslomo}
	repeat
	spawnscriptnow \{PlayAudioSequenceForLoadingBink}
	wait \{4
		gameframes
		ignoreslomo}
	StartRendering \{reason = loading_screen}
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :SE_SetProps {
			loading_text = <loading_text>
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
	Change \{IN_LOADING_SCREEN = 0}
	printscriptinfo \{'destroy_loading_screen'}
	if (<Force> = 0)
		if NOT ($loading_screen_destroy_state = 'none')
			ui_event_get_top
			if NOT ($loading_screen_destroy_state = <base_name>)
				return
			endif
		endif
	endif
	if ObjectExists \{id = musicstudio_mainobj}
		musicstudio_mainobj :MusicStudio_PauseAll \{stack_id = load_screen
			Pause = false}
	endif
	if ScreenElementExists \{id = loading_screen_container}
		printf \{qs(0x2f19aa97)
			channel = movie}
		if NOT ScriptIsRunning \{destroy_loading_screen_spawned}
			loading_screen_container :Obj_SpawnScript destroy_loading_screen_spawned UpdateImmediately = 1 params = <...>
		endif
	endif
	HideLoadingScreen
	if ($playing_song = 0 || $end_credits = 1)
		Change \{is_changing_levels = 0}
	endif
	mark_safe_for_shutdown
	if GotParam \{wait_for_unload}
		begin
		if NOT ScreenElementExists \{id = loading_screen_container}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript
end_movie_early = 0

script destroy_loading_screen_spawned \{time = 0.1}
	FinalPrintf \{'destroy_loading_screen_spawned'}
	GetTags
	Change \{end_movie_early = 0}
	if GotParam \{TextureSlot}
		if IsMoviePlaying TextureSlot = <TextureSlot>
			if GotParam \{wait_for_end}
				if NOT IsPS3
					CreateScreenElement \{type = ContainerElement
						parent = root_window
						id = loading_movie_handler
						event_handlers = [
							{
								pad_start
								LoadingEndMovie
							}
							{
								pad_choose
								LoadingEndMovie
							}
						]}
					LaunchEvent \{type = focus
						target = loading_movie_handler}
					add_user_control_helper \{text = qs(0x784c64ff)
						button = start
						another_button = green
						all_buttons
						z = 500001}
				endif
				begin
				if NOT IsMoviePlaying TextureSlot = <TextureSlot>
					break
				endif
				if ($end_movie_early = 1)
					break
				endif
				wait \{1
					gameframe}
				repeat
				DestroyScreenElement \{id = loading_movie_handler}
				clean_up_user_control_helpers
			endif
			killspawnedscript \{name = PlayAudioSequenceForLoadingBink}
			spawnscriptnow \{StopAudioSequenceForLoadingBink}
			KillMovie TextureSlot = <TextureSlot>
		endif
	endif
	StopRendering \{reason = loading_screen}
	SE_SetProps \{alpha = 0}
	DumpMovieBuffers
	FinalPrintf '$loading_screen_movie = %a' a = ($loading_screen_movie)
	if ($loading_screen_movie != 'none')
		begin
		if IsMovieInBuffer \{movie = $loading_screen_movie}
			FinalPrintf 'Freeing movie buffer %s %d' s = ($loading_screen_movie) d = <buffer_slot>
			FreeMovieBuffer buffer_slot = <buffer_slot>
			freed_movie = 1
			break
		else
			FinalPrintf '%s not found in a buffer... waiting.' s = ($loading_screen_movie)
		endif
		wait \{1
			gameframe}
		repeat 300
		if NOT GotParam \{freed_movie}
			i = 0
			begin
			FinalPrintf 'Forcing free of buffer %a' a = <i>
			FreeMovieBuffer buffer_slot = <i>
			i = (<i> + 1)
			repeat 8
		endif
	endif
	create_bink_sub_heaps
	Change \{loading_screen_movie = 'none'}
	StartRendering \{reason = loading_screen}
	hide_glitch \{num_frames = 5}
	FinalPrintf \{'destroy_loading_screen_spawned - Done!'}
	Die
endscript

script LoadingEndMovie 
	Change \{end_movie_early = 1}
endscript

script refresh_screen 
	destroy_loading_screen
	begin
	if NOT ScreenElementExists \{id = loading_screen_container}
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
	DisplayLoadingScreen <display_params>
endscript

script debug_callback_is_loading_screen_shown 
	if ScriptIsRunning \{guitar_startup_spawned}
		return \{false}
	endif
	if IsTrue \{$is_changing_levels}
		return \{true}
	endif
	if IsLoadingScreenActive
		return \{true}
	endif
	return \{false}
endscript

script debug_handle_infinite_loading_screen 
	printf \{'--------------------------------------------------------------------------------'}
	printf \{''}
	printf \{'Possible infinite loading screen detected'}
	printf \{''}
	DumpSpawnedScriptStatus
	printf \{''}
	printf \{''}
	ui_print_states
	printf \{''}
	printf \{'Possible infinite loading screen detected'}
	printf \{''}
	printf \{'--------------------------------------------------------------------------------'}
endscript
