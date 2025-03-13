
script ui_create_boot_legal 
	spawnscriptnow \{ui_boot_legal_wait}
endscript

script ui_destroy_boot_legal 
	fadetoblack \{on
		alpha = 1.0
		time = 0.0
		z_priority = 100
		no_wait}
	hideloadingscreen
endscript

script ui_boot_legal_wait 
	if cd
		wait \{6.0
			seconds
			ignoreslomo}
	endif
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_boot_movie_atvi
		}}
endscript

script ui_create_boot_movie_atvi 
	enableusermusic \{disable}
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'atvi'
			state = uistate_boot_movie_red_octane
		}}
endscript

script ui_create_boot_movie_red_octane 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'ro_logo'
			state = uistate_boot_movie_beenox
		}}
endscript

script ui_create_boot_movie_neversoft 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'ns_logo'
			state = uistate_boot_iis
		}}
endscript

script ui_create_boot_movie_beenox 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'bx_logo'
			state = uistate_boot_movie_neversoft
		}}
endscript

script ui_create_boot_movie_intro 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'band_intro'
			state = uistate_boot_iis
		}}
endscript

script ui_destroy_boot_movie_intro 
	enableusermusic
endscript

script ui_boot_movie_wait 
	change \{rich_presence_context = presence_menus}
	playmovieandwait movie = <movie> noblack
	ui_event_wait event = menu_replace data = {state = <state>}
endscript
