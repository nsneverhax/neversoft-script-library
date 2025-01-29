
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
	if GotParam \{destroy_loading_screen}
		destroy_loading_screen
	endif
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
		movie_handler :Die
		if (<0x6d221ff1> = true)
			create_loading_screen
		endif
	endif
endscript
