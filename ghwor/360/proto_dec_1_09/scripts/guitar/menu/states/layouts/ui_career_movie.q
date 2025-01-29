
script ui_create_career_movie \{device_num = !i1768515945
		new_state = !q1768515945
		new_data = 0x69696969
		movie = 0x69696969}
	setscriptcannotpause
	GetGlobalTags career_progression_tags params = career_first_time_setup controller = <device_num>
	StartRendering
	hide_glitch \{num_frames = 20}
	lightshow_notingameplay_setmood \{mood = menu}
	play_cameracut \{prefix = 'cameras_no_band'
		transition_time = 0}
	SpawnScriptNow {
		ui_career_movie_play_movie_spawned
		params = {
			movie = <movie>
			new_state = <new_state>
			new_data = <new_data>
		}
	}
endscript

script ui_destroy_career_movie 
endscript

script ui_init_career_movie 
	Change \{respond_to_signin_changed = 1}
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
endscript

script ui_deinit_career_movie 
	Change \{respond_to_signin_changed = 0}
endscript

script ui_career_movie_play_movie_spawned \{movie = 0x69696969
		new_state = !q1768515945
		new_data = 0x69696969}
	destroy_song_and_musicstudio_heaps \{do_unloads}
	setbinkheap \{heap_cas_cache}
	PlayMovieAndWait movie = <movie> noblack
	setbinkheap \{heap_bink}
	create_song_and_musicstudio_heaps
	ui_event_wait event = menu_replace data = {state = <new_state> <new_data>}
endscript
