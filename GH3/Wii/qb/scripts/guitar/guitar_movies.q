z_video_movie_viewport = {
	id = movie1_viewport
	texture = viewport9
	textureasset = `tex/zones/video_shoot/video_test.dds`
	texdict = `zones/z_video/z_video.tex`
	textureslot = 0
	movie = 'encore_video_shoot'
	start_frame = 0
	loop_start = 0
	loop_end = -1
	viewport_style = cutscene_movie_surface
}
z_video_movie_viewport_ps3 = {
	id = movie1_viewport
	texture = viewport9
	textureasset = `tex/zones/video_shoot/video_test.dds`
	texdict = `zones/z_video/z_video.tex`
	textureslot = 0
	movie = 'encore_video_shoot'
	start_frame = 0
	loop_start = 0
	loop_end = -1
	viewport_style = cutscene_movie_surface_ps3
}

script create_movie_viewport 
	return
	getpakmancurrentname \{map = zones}
	if isps3
		formattext checksumname = movie_viewport '%s_movie_viewport_ps3' s = <pakname>
	else
		formattext checksumname = movie_viewport '%s_movie_viewport' s = <pakname>
	endif
	if NOT globalexists name = <movie_viewport>
		return
	endif
	createscreenelement {
		parent = root_window
		just = [center center]
		type = viewportelement
		id = ($<movie_viewport>.id)
		texture = ($<movie_viewport>.texture)
		pos = (2000.0, 200.0)
		dims = (64.0, 64.0)
		alpha = 1
		style = ($<movie_viewport>.viewport_style)
	}
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = ($<movie_viewport>.id)
		viewportid = ($<movie_viewport>.id)
		texture = ($<movie_viewport>.textureasset)
		texdict = ($<movie_viewport>.texdict)
	}
	setsearchallassetcontexts \{off}
endscript

script destroy_movie_viewport 
	getpakmancurrentname \{map = zones}
	formattext checksumname = movie_viewport '%s_movie_viewport' s = <pakname>
	if NOT globalexists name = <movie_viewport>
		return
	endif
	killmovie textureslot = ($<movie_viewport>.textureslot)
	if screenelementexists id = ($<movie_viewport>.id)
		setsearchallassetcontexts
		destroyviewporttextureoverride id = ($<movie_viewport>.id)
		setsearchallassetcontexts \{off}
		destroyscreenelement id = ($<movie_viewport>.id)
	endif
	killspawnedscript \{id = movie_scripts}
endscript

script pausefullscreenmovie 
	if ismovieplaying \{textureslot = 0}
		pausemovie \{textureslot = 0}
	endif
endscript

script unpausefullscreenmovie 
	if ismovieplaying \{textureslot = 0}
		resumemovie \{textureslot = 0}
	endif
endscript

script playmovieandwait 
	if isngc
		hide_fps_wii
		fps_hidden = true
	endif
	if notcd
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown
	if NOT gotparam \{noblack}
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	if NOT gotparam \{noletterbox}
		getdisplaysettings
		if (<widescreen> = true)
			setscreen \{hardware_letterbox = 0}
		else
			setscreen \{hardware_letterbox = 1}
		endif
	endif
	if NOT (0x8b2d9143 = 1)
		pre_movie_cleanup

		playmovie {textureslot = 0
			texturepri = 1000
			no_looping
			no_hold
			<...>}
		post_movie_reset 0xd4935026 = <0xd4935026>
		wait \{2
			gameframes}
		if gotparam \{noblack}
			fadetoblack \{off
				time = 0}
		endif
	endif
	notheld = 0
	begin
	if NOT ismovieplaying \{textureslot = 0}
		break
	endif
	getbuttonspressed \{startanda}
	if NOT (<makes> = 0)
		if (<notheld> = 1)
			killmovie \{textureslot = 0}
			break
		endif
	else
		notheld = 1
	endif
	waitonegameframe
	repeat
	if NOT gotparam \{noblack}
		wait \{2
			gameframes}

		fadetoblack \{off
			time = 0}
	endif
	if NOT gotparam \{noletterbox}
		setscreen \{hardware_letterbox = 0}
	endif
	mark_safe_for_shutdown
	if isngc
		show_fps_wii
		fps_hidden = false
	endif
endscript
