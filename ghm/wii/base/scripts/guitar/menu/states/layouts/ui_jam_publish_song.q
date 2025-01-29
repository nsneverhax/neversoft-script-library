
script ui_create_jam_publish_song 
	SpawnScriptNow create_jam_publish_song_menu params = {<...>}
	Change \{is_network_game = 1}
endscript

script ui_destroy_jam_publish_song 
	destroy_jam_publish_song_menu
	Change \{is_network_game = 0}
endscript

script ui_deinit_jam_publish_song 
	DestroyScreenElement \{id = jam_album_cover}
	Change \{cas_override_object = None}
	KillCamAnim \{Name = cas_view_cam}
	SpawnScriptNow \{jam_publish_reinit_band_logo}
endscript
