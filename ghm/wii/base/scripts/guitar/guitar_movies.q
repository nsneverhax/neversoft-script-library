
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
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown
	if NOT GotParam \{noblack}
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	redisable_rendering = FALSE
	if (RenderingEnabled)
		redisable_rendering = FALSE
	else
		StartRendering
		redisable_rendering = true
	endif
	printf qs(0x23871deb) s = <movie>
	if NOT GotParam \{highpriority}
		PlayMovie {textureSlot = 0
			TexturePri = 1000
			no_looping
			no_hold
			highpriority = true
			<...>}
	else
		PlayMovie {textureSlot = 0
			TexturePri = 1000
			no_looping
			no_hold
			<...>}
	endif
	Wait \{2
		gameframes}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = movie_handler
		event_handlers = [
			{pad_start endmovie params = {skip_remaining_movies 0x6d221ff1 = <0x6d221ff1>}}
			{pad_choose endmovie params = {skip_remaining_movies 0x6d221ff1 = <0x6d221ff1>}}
		]
	}
	LaunchEvent \{Type = focus
		target = movie_handler}
	begin
	if NOT IsMoviePlaying \{textureSlot = 0}
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
	if NOT GotParam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{OFF
			time = 0}
	endif
	if NOT GotParam \{0x9d6770d8}
		SetPakManCurrentBlock \{map = zones
			pak = None
			block_scripts = 1}
		SetPakManCurrentBlock \{map = zones
			pak = z_soundcheck
			block_scripts = 1}
	endif
	0x33d46327 \{Only = 0}
	WaitOneGameFrame
	fadetoblack \{OFF
		time = 0}
	mark_safe_for_shutdown
	if (<redisable_rendering> = true)
		StopRendering
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
	if IsMoviePlaying \{textureSlot = 0}
		KillMovie \{textureSlot = 0}
	endif
	if ScreenElementExists \{id = movie_handler}
		if (<0x6d221ff1> = true)
			create_loading_screen
		endif
		movie_handler :Die
	endif
endscript
