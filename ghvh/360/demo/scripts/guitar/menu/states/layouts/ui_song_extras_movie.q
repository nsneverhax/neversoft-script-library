
script ui_create_song_extras_movie 
	spawnscriptnow ui_create_song_extras_movie_spawned params = {<...>}
endscript

script ui_create_song_extras_movie_spawned 
	<movie> = ($permanent_songlist_props.<song>.name)
	playmovieandwait movie = <movie>
	if (($signin_change_happening = 1) || ($invite_controller > -1))
		return
	endif
	generic_event_back
endscript

script ui_destroy_song_extras_movie 
endscript
