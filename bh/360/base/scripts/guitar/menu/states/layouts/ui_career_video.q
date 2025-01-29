
script ui_create_career_video 
	RequireParams \{[
			venue_checksum
			progression_movie
			venue_index
		]
		all}
	CreateScreenElement \{type = ContainerElement
		id = current_menu
		parent = root_window}
	current_menu :Obj_SpawnScript ui_create_career_video_spawned params = {venue_checksum = <venue_checksum> progression_movie = <progression_movie> venue_index = <venue_index>}
endscript

script ui_destroy_career_video 
	DestroyScreenElement \{id = current_menu}
	fadetoblack \{off
		time = 0
		no_wait}
endscript

script ui_create_career_video_spawned 
	RequireParams \{[
			venue_checksum
			progression_movie
			venue_index
		]
		all}
	fadetoblack \{on
		alpha = 1.0
		time = 0
		z_priority = 200}
	StartRendering
	hide_glitch \{num_frames = 2}
	LightShow_NotInGamePlay_SetMood \{mood = Menu}
	play_cameracut \{prefix = 'cameras_no_band'
		transition_time = 0}
	destroy_song_and_musicstudio_heaps \{do_unloads}
	SetBinkHeap \{heap_cas_cache}
	PlayMovieAndWait movie = <progression_movie> noblack
	SetBinkHeap \{heap_bink}
	create_song_and_musicstudio_heaps
	ui_event_wait_for_safe
	get_savegame_from_controller controller = ($primary_controller)
	SetGlobalTags <venue_checksum> params = {movie_played = 1} savegame = <savegame> packtype = venuetags Progression = true
	FormatText checksumname = video_checksum '%s' s = <progression_movie>
	if GlobalTagExists <video_checksum> noassert = 1
		SetGlobalTags savegame = <savegame> <video_checksum> params = {unlocked = 1}
	endif
	ui_memcard_autosave_replace event = menu_replace state = UIstate_career_gig_select data = {venue_index = <venue_index>}
endscript
