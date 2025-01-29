
script ui_init_jam_publish_song 
	set_home_button_notallowed
endscript

script ui_create_jam_publish_song 
	SpawnScriptNow create_jam_publish_song_menu params = {<...>}
endscript

script ui_destroy_jam_publish_song 
	destroy_jam_publish_song_menu
endscript

script ui_deinit_jam_publish_song 
	set_home_button_allowed
	Change \{cas_override_object = None}
	KillCamAnim \{Name = cas_view_cam}
	SpawnScriptNow \{jam_publish_reinit_band_logo}
endscript
