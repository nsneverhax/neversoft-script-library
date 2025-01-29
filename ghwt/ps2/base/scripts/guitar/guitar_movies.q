
script create_movie_viewport 
	return
	create_jumbotron
	create_bandname_viewport
endscript

script destroy_movie_viewport 
	return
	destroy_jumbotron
	destroy_bandname_viewport
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

script PlayMovieAndWait 
	Change \{g_skip_remaining_movies = 0}
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown
	0x33d46327 \{Only = 1}

	fadetoblack \{OFF}
	0x622f875f
	loadvenuevideo \{pn = 0x39e112cf}
	if GotParam \{destroy_loading_screen}
		destroy_loading_screen
	endif
	formatText checksumName = 0x754e8336 '%m' m = <movie>
	0xd518ab19 video = <0x754e8336>
	Wait \{2
		gameframes}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = movie_handler
		event_handlers = [
			{
				pad_start
				endmovie
				params = {
					skip_remaining_movies
				}
			}
			{
				pad_choose
				endmovie
			}
		]}
	LaunchEvent \{Type = focus
		target = movie_handler}
	begin
	if NOT 0x62b954d8
		break
	endif
	WaitOneGameFrame
	repeat
	SpawnScriptNow \{endmovie}
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	WaitOneGameFrame
	repeat
	fadetoblack \{On
		time = 0
		alpha = 1.0
		z_priority = -100}
	0x33d46327 \{Only = 0}
	popvideovenues
	mark_safe_for_shutdown
endscript

script endmovie 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if GotParam \{skip_remaining_movies}
		Change \{g_skip_remaining_movies = 1}
	endif
	if 0x62b954d8
		0x34fb97d7
	endif
	if ScreenElementExists \{id = movie_handler}
		movie_handler :Die
	endif
endscript
