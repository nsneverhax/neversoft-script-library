
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
		Wait \{6.0
			Seconds
			ignoreslomo}
	endif
	ui_event_wait \{event = menu_replace
		data = {
			state = 0xf2b08aaa
		}}
endscript

script 0x66386006 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'PS2_Logos'
			state = uistate_boot_iis
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
			state = uistate_boot_movie_underground
		}}
endscript

script 0x5dbf4ba8 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'tfb_logo'
			state = uistate_boot_iis
		}}
endscript

script ui_create_boot_movie_underground 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'ugd_logo'
			state = 0x824b2c81
		}}
endscript

script ui_create_boot_movie_intro 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'GHM_Movie_Intro'
			state = uistate_boot_iis
		}}
endscript
0x8b2d9143 = 0

script ui_boot_movie_wait 
	0x622f875f
	if ($0x8b2d9143)
		Change \{g_skip_remaining_movies = 1}
	else
		Change \{g_skip_remaining_movies = 0}
	endif
	if NOT ($0x8b2d9143)
		PlayMovieAndWait \{movie = 'PS2_Logos'
			noblack}
	endif
	popvideovenues
	fadetoblack \{On
		time = 0.0
		alpha = 1.0
		z_priority = 100011}
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_boot_iis
		}}
endscript
