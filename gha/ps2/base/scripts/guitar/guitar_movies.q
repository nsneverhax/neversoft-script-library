Z_Video_movie_viewport = {
	id = movie1_viewport
	texture = viewport9
	textureasset = `tex/zones/Video_shoot/Video_test.dds`
	texdict = `zones/z_video/z_video.tex`
	textureSlot = 0
	movie = 'encore_video_shoot'
	start_frame = 0
	loop_start = 0
	loop_end = -1
	viewport_style = cutscene_movie_surface
}
Z_Video_movie_viewport_ps3 = {
	id = movie1_viewport
	texture = viewport9
	textureasset = `tex/zones/Video_shoot/Video_test.dds`
	texdict = `zones/z_video/z_video.tex`
	textureSlot = 0
	movie = 'encore_video_shoot'
	start_frame = 0
	loop_start = 0
	loop_end = -1
	viewport_style = cutscene_movie_surface_ps3
}

script create_movie_viewport 
	return
	GetPakManCurrentName \{map = zones}
	if isps3
		formatText checksumName = movie_viewport '%s_movie_viewport_ps3' s = <pakname>
	else
		formatText checksumName = movie_viewport '%s_movie_viewport' s = <pakname>
	endif
	if NOT GlobalExists Name = <movie_viewport>
		return
	endif
	CreateScreenElement {
		parent = root_window
		just = [center center]
		Type = ViewportElement
		id = ($<movie_viewport>.id)
		texture = ($<movie_viewport>.texture)
		Pos = (2000.0, 200.0)
		dims = (64.0, 64.0)
		alpha = 1
		style = ($<movie_viewport>.viewport_style)
	}
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = ($<movie_viewport>.id)
		viewportid = ($<movie_viewport>.id)
		texture = ($<movie_viewport>.textureasset)
		texdict = ($<movie_viewport>.texdict)
	}
	SetSearchAllAssetContexts \{OFF}
endscript

script destroy_movie_viewport 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = movie_viewport '%s_movie_viewport' s = <pakname>
	if NOT GlobalExists Name = <movie_viewport>
		return
	endif
	KillMovie textureSlot = ($<movie_viewport>.textureSlot)
	if ScreenElementExists id = ($<movie_viewport>.id)
		SetSearchAllAssetContexts
		DestroyViewportTextureOverride id = ($<movie_viewport>.id)
		SetSearchAllAssetContexts \{OFF}
		DestroyScreenElement id = ($<movie_viewport>.id)
	endif
	KillSpawnedScript \{id = movie_scripts}
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

script PlayMovieAndWait 
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
	if NOT GotParam \{noletterbox}
		GetDisplaySettings
		if (<widescreen> = true)
			SetScreen \{hardware_letterbox = 0}
		else
			SetScreen \{hardware_letterbox = 1}
		endif
	endif
	if NOT (0x8b2d9143 = 1)
		pre_movie_cleanup

		PlayMovie {textureSlot = 0
			TexturePri = 1000
			no_looping
			no_hold
			<...>}
		start_subtitles movie = <movie>
		post_movie_reset 0xd4935026 = <0xd4935026>
		Wait \{2
			gameframes}
		if GotParam \{noblack}
			fadetoblack \{OFF
				time = 0}
		endif
	endif
	NotHeld = 0
	begin
	if NOT IsMoviePlaying \{textureSlot = 0}
		stop_subtitles
		break
	endif
	GetButtonsPressed \{StartAndA}
	if NOT (<makes> = 0)
		if (<NotHeld> = 1)
			KillMovie \{textureSlot = 0}
			stop_subtitles
			break
		endif
	else
		NotHeld = 1
	endif
	WaitOneGameFrame
	repeat
	if NOT GotParam \{noblack}
		Wait \{2
			gameframes}

		fadetoblack \{OFF
			time = 0}
	endif
	if NOT GotParam \{noletterbox}
		SetScreen \{hardware_letterbox = 0}
	endif
	mark_safe_for_shutdown
endscript
