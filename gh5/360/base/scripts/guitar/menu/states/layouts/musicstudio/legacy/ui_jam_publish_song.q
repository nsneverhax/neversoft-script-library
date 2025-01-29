
script ui_create_jam_publish_song 
	SpawnScriptNow create_jam_publish_song_menu params = {<...>}
endscript

script ui_destroy_jam_publish_song 
	destroy_jam_publish_song_menu
endscript

script ui_init_jam_publish_song 
	destroy_visualizer_screen_element
endscript

script ui_deinit_jam_publish_song 
	Change \{cas_current_savegame = -1}
	if NOT ScreenElementExists \{id = fullscreen_visualizer_viewport}
		create_visualizer_screen_element
	endif
	Change \{cas_override_object = None}
	KillCamAnim \{Name = cas_view_cam}
	KillCamAnim \{Name = jam_publish_song_igc_name}
	SpawnScriptNow \{jam_publish_reinit_band_logo}
endscript
