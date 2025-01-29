
script ui_create_song_extras_movie 
	SpawnScriptNow ui_create_song_extras_movie_spawned params = {<...>}
endscript

script ui_create_song_extras_movie_spawned 
	SpawnScriptNow \{BG_Crowd_Front_End_Silence
		params = {
			immediate = 1
		}}
	<movie> = ($permanent_songlist_props.<song>.Name)
	PlayMovieAndWait movie = <movie>
	hide_glitch
	SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = frontend_menu_music
		}}
	if (($signin_change_happening = 1) || ($invite_controller > -1))
		return
	endif
	generic_event_back
endscript

script ui_destroy_song_extras_movie 
endscript
