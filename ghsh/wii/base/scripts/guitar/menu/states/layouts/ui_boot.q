
script ui_create_boot_legal 
	SpawnScriptNow \{ui_boot_legal_wait}
endscript

script ui_destroy_boot_legal 
	fadetoblack \{On
		alpha = 1.0
		time = 0.0
		z_priority = 100
		no_wait}
	HideLoadingScreen
endscript

script ui_boot_legal_wait 
	if CD
	endif
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_boot_movie_atvi
		}}
endscript

script ui_create_boot_movie_atvi 
	EnableUserMusic \{disable}
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'atvi'
			state = uistate_boot_movie_red_octane
		}}
endscript

script ui_create_boot_movie_red_octane 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'ro_logo'
			state = uistate_boot_movie_beenox
		}}
endscript

script ui_create_boot_movie_neversoft 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'ns_logo'
			state = uistate_boot_iis
		}}
endscript

script ui_create_boot_movie_beenox 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'bx_logo'
			state = uistate_boot_movie_neversoft
		}}
endscript

script ui_create_boot_movie_intro 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'band_intro'
			state = uistate_boot_iis
		}}
endscript
0x8b2d9143 = 0

script ui_destroy_boot_movie_intro 
	EnableUserMusic
endscript

script ui_boot_movie_wait 
	0x622f875f
	CreateScreenElement \{Type = SpriteElement
		id = black_overlay
		parent = root_window
		texture = black
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 150
		alpha = 1.2}
	PlayMovieAndWait \{movie = 'atvi'
		noblack}
	PlayMovieAndWait \{movie = 'ro_logo'
		noblack}
	PlayMovieAndWait \{movie = 'bx_logo'
		noblack}
	PlayMovieAndWait \{movie = 'budcat'
		noblack}
	PlayMovieAndWait \{movie = 'ns_logo'
		noblack}
	popvideovenues
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_boot_iis
		}}
endscript
