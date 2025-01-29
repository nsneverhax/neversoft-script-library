
script ui_create_quickplay_get_and_start_song 
	gman_songtool_getcurrentsong
	if (<current_song> = jamsession)
		Change \{current_level = load_z_cube}
		SpawnScriptNow \{jam_quickplay_get_and_start_song}
	else
		SpawnScriptNow \{quickplay_next_song}
	endif
endscript

script ui_destroy_quickplay_get_and_start_song 
endscript

script quickplay_next_song 
	quickplay_start_song
	event = menu_replace
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		event = menu_back
	endif
	ui_event_wait event = <event> data = {state = Uistate_gameplay}
endscript
