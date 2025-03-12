
script ui_create_career_movie 
	spawnscriptnow ui_create_career_movie_spawned params = {<...>}
endscript

script ui_create_career_movie_spawned 
	requireparams \{[
			device_num
			new_data
		]
		all}
	getglobaltags career_progression_tags params = career_first_time_setup controller = <device_num>
	if (<career_first_time_setup> = 0)
		startrendering
		hide_glitch \{num_frames = 20}
		lightshow_notingameplay_setmood \{mood = menu}
		play_cameracut \{prefix = 'cameras_no_band'
			transition_time = 0}
		destroy_song_and_musicstudio_heaps \{do_unloads}
		setbinkheap \{heap_cas_cache}
		playmovieandwait movie = <movie> noblack
		setbinkheap \{heap_bink}
		create_song_and_musicstudio_heaps
		ui_event_wait event = menu_replace data = {state = <new_state> <new_data>}
	else
		change \{g_lobby_enter_from_main_menu = 1}
		ui_event_wait event = menu_replace data = {state = uistate_band_lobby_setup <new_data>}
	endif
endscript

script ui_destroy_career_movie 
endscript

script ui_init_career_movie 
	change \{respond_to_signin_changed = 1}
	killspawnedscript \{name = persistent_band_cancel_lobby}
endscript

script ui_deinit_career_movie 
	change \{respond_to_signin_changed = 0}
endscript
