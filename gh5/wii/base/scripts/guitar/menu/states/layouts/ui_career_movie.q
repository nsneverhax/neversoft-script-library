
script ui_create_career_movie 
	SpawnScriptNow ui_create_career_movie_spawned params = {<...>}
endscript

script ui_create_career_movie_spawned 
	hide_glitch \{num_frames = 20}
	lightshow_notingameplay_setmood \{mood = menu}
	play_cameracut \{prefix = 'cameras_no_band'
		transition_time = 0}
	PlayMovieAndWait movie = <movie> noblack
	ui_event_wait event = menu_replace data = {state = <new_state> <new_data>}
endscript

script ui_destroy_career_movie 
endscript

script ui_init_career_movie 
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
endscript
