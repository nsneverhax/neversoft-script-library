
script ui_create_career_movie 
	spawnscriptnow ui_create_career_movie_spawned params = {<...>}
endscript

script ui_create_career_movie_spawned 
	RequireParams \{[
			device_num
			new_data
		]
		all}
	GetGlobalTags career_progression_tags params = career_first_time_setup controller = <device_num>
	if (<career_first_time_setup> = 0)
		StartRendering
		hide_glitch \{num_frames = 20}
		LightShow_NotInGamePlay_SetMood \{mood = Menu}
		play_cameracut \{prefix = 'cameras_no_band'
			transition_time = 0}
		destroy_song_and_musicstudio_heaps \{do_unloads}
		SetBinkHeap \{heap_cas_cache}
		PlayMovieAndWait movie = <movie> noblack
		SetBinkHeap \{heap_bink}
		create_song_and_musicstudio_heaps
		ui_event_wait event = menu_replace data = {state = <new_state> <new_data>}
	else
		Change \{g_lobby_enter_from_main_menu = 1}
		ui_event_wait event = menu_replace data = {state = UIstate_band_lobby_setup <new_data>}
	endif
endscript

script ui_destroy_career_movie 
endscript

script ui_init_career_movie 
	Change \{respond_to_signin_changed = 1}
	killspawnedscript \{name = persistent_band_cancel_lobby}
endscript

script ui_deinit_career_movie 
	Change \{respond_to_signin_changed = 0}
endscript
