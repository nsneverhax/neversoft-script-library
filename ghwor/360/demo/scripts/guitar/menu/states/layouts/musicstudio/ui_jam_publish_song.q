
script ui_create_jam_publish_song 
	spawnscriptnow create_jam_publish_song_menu params = {<...>}
	musicstudio_mainobj :musicstudio_togglealbumartbackingcard \{on = true}
endscript

script ui_destroy_jam_publish_song 
	destroy_jam_publish_song_menu
endscript

script ui_init_jam_publish_song 
	destroy_visualizer_screen_element
endscript

script ui_deinit_jam_publish_song 
	change \{cas_current_savegame = -1}
	if NOT screenelementexists \{id = fullscreen_visualizer_viewport}
		create_visualizer_screen_element
	endif
	change \{cas_override_object = none}
	killcamanim \{name = cas_view_cam}
	killcamanim \{name = jam_publish_song_igc_name}
	musicstudio_mainobj :musicstudio_togglealbumartbackingcard \{on = false}
	spawnscriptnow \{jam_publish_reinit_band_logo}
endscript
