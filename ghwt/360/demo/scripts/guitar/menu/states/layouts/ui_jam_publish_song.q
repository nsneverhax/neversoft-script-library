
script ui_create_jam_publish_song 
	spawnscriptnow create_jam_publish_song_menu params = {<...>}
endscript

script ui_destroy_jam_publish_song 
	destroy_jam_publish_song_menu
endscript

script ui_deinit_jam_publish_song 
	change \{cas_override_object = none}
	killcamanim \{name = cas_view_cam}
	spawnscriptnow \{jam_publish_reinit_band_logo}
endscript
