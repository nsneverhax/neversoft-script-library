
script ui_create_boot_legal 
	SpawnScriptNow \{ui_boot_legal_wait}
endscript

script ui_destroy_boot_legal 
endscript

script ui_boot_legal_wait 
	if CD
	endif
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_boot_movie_intro
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
			state = uistate_boot_movie_vvisions
		}}
endscript

script ui_create_boot_movie_vvisions 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'vvisions'
			state = uistate_boot_movie_intro
		}}
endscript

script ui_create_boot_movie_intro 
	SpawnScriptNow \{ui_boot_movie_wait
		params = {
			movie = 'intro_finalanimatic_0209'
			state = uistate_freeplay
			show_loading_screen
		}}
endscript

script ui_boot_movie_wait 
	if CD
		PlayMovieAndWait movie = <movie> noblack
	endif
	if GotParam \{show_loading_screen}
		fadetoblack \{time = 0.0
			no_wait}
		destroy_bg_viewport
		create_loading_screen \{force_predisplay = 1}
		StopRendering
	endif
	ui_event_wait event = menu_replace data = {state = <state>}
endscript

script ui_create_boot_freeplay 
	fadetoblack \{time = 0.0
		no_wait}
	destroy_bg_viewport
	create_loading_screen \{force_predisplay = 1}
	StopRendering
	Change \{reuse_last_loading_screen = -1}
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_freeplay
		}}
endscript
