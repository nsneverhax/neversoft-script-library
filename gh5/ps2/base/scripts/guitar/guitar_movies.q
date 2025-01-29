
script create_movie_viewport 
endscript

script destroy_movie_viewport 
endscript

script PauseFullScreenMovie 
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
endscript

script UnPauseFullScreenMovie 
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
endscript
g_skip_remaining_movies = 0

script PlayMovieAndWait \{0x6d221ff1 = FALSE}
	if is_ui_event_running
		0x8dbdaee4 \{'Warning: Directly calling PlayMovieAndWait while a UI event is occurring.'}
	elseif 0x8658e568
		0x8dbdaee4 \{'Warning: Calling PlayMovieAndWait while a loading screen is up.'}
	endif
	Change \{g_skip_remaining_movies = 0}
	ScreenFX_ClearFXInstances \{viewport = bg_viewport}
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown

	0x33d46327 \{Only = 1}
	0x622f875f
	loadvenuevideo \{pn = 0x39e112cf}
	fadetoblack \{OFF
		time = 0}
	formatText checksumName = 0x754e8336 '%m' m = <movie>
	0xd518ab19 video = <0x754e8336>
	Wait \{2
		gameframes}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = movie_handler
		event_handlers = [
			{pad_start endmovie params = {skip_remaining_movies 0x6d221ff1 = <0x6d221ff1>}}
			{pad_choose endmovie params = {0x6d221ff1 = <0x6d221ff1>}}
		]
	}
	if GotParam \{focus}
		ui_event_block \{event = menu_unfocus}
	endif
	LaunchEvent \{Type = focus
		target = movie_handler}
	begin
	if NOT 0x62b954d8
		break
	endif
	WaitOneGameFrame
	repeat
	SpawnScriptNow endmovie params = {0x6d221ff1 = <0x6d221ff1>}
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	WaitOneGameFrame
	repeat
	popvideovenues
	0x33d46327 \{Only = 0}
	WaitOneGameFrame
	fadetoblack \{OFF
		time = 0}
	mark_safe_for_shutdown
	if GotParam \{focus}
		ui_event_block \{event = menu_focus}
	endif
endscript

script endmovie \{0x6d221ff1 = FALSE}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	fadetoblack \{On
		time = 0
		alpha = 1.0
		z_priority = -100}
	if GotParam \{skip_remaining_movies}
		Change \{g_skip_remaining_movies = 1}
	endif
	if 0x62b954d8
		0x34fb97d7
	endif
	if ScreenElementExists \{id = movie_handler}
		LaunchEvent \{Type = unfocus
			target = movie_handler}
		movie_handler :Die
		if (<0x6d221ff1> = true)
			create_loading_screen
		endif
	endif
endscript
