
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
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_boot_movie_atvi
		}}
endscript

script ui_create_boot_movie_atvi 
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
			state = uistate_boot_movie_neversoft
		}}
endscript

script ui_create_boot_movie_neversoft 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'ns_logo'
			state = uistate_boot_movie_intro
		}}
endscript

script ui_create_boot_movie_intro 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'GHM_Movie_Intro'
			state = uistate_boot_iis
		}}
endscript

script ui_boot_movie_wait 
	0x622f875f
	PlayMovieAndWait \{movie = 'GH5_1_Logo_Movie'
		noblack}
	popvideovenues
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_boot_iis
		}}
endscript
