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
0xfab0bfe9 = {
	id = movie1_viewport
	texture = viewport9
	textureasset = `tex/zones/video_shoot/video_test.dds`
	texdict = 0xab3426b8
	textureslot = 1
	movie = 'arcade_bg_for_GH3'
	start_frame = 0
	loop_start = 0
	loop_end = -1
	viewport_style = cutscene_movie_surface_fs
}

script create_movie_viewport 
	getpakmancurrentname map = zones
	formattext checksumname = movie_viewport '%s_movie_viewport' s = <pakname>
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
	setsearchallassetcontexts off
endscript

script destroy_movie_viewport 
	getpakmancurrentname \{map = zones}
	formattext checksumname = movie_viewport '%s_movie_viewport' s = <pakname>
	if NOT globalexists name = <movie_viewport>
		return
	endif
	killmovie textureslot = (<movie_viewport>.textureslot)
	if screenelementexists id = (<movie_viewport>.id)
		destroyscreenelement id = (<movie_viewport>.id)
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
	if notcd
		if ($show_movies = 0)
			return
		endif
	endif
	change is_shutdown_safe = 0
	fadetoblack on time = 0 alpha = 1.0 z_priority = -10
	getdisplaysettings
	if (<widescreen> = true)
		setscreen hardware_letterbox = 0
	else
		setscreen hardware_letterbox = 1
	endif
	printf "Playing Movie %s" s = <movie>
	playmovie {textureslot = 0
		texturepri = 1000
		no_looping
		no_hold
		<...>}
	notheld = 0
	begin
	if NOT ismovieplaying textureslot = 0
		break
	endif
	getbuttonspressed startanda
	if NOT (<makes> = 0)
		if (<notheld> = 1)
			killmovie textureslot = 0
			break
		endif
	else
		notheld = 1
	endif
	wait 1 gameframes
	repeat
	wait 2 gameframes
	printf "Finished Playing Movie %s" s = <movie>
	fadetoblack off time = 0
	setscreen hardware_letterbox = 0
	change is_shutdown_safe = 1
endscript
