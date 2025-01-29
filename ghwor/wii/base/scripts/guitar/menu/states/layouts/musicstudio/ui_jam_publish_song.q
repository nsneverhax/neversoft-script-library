
script ui_create_jam_publish_song 
	SpawnScriptNow create_jam_publish_song_menu params = {<...>}
	musicstudio_mainobj :musicstudio_togglealbumartbackingcard \{On = true}
endscript

script ui_destroy_jam_publish_song 
	destroy_jam_publish_song_menu
endscript

script ui_init_jam_publish_song 
	push_block_home_button
endscript

script ui_deinit_jam_publish_song 
	pop_block_home_button
	Change \{cas_current_savegame = -1}
	Change \{cas_override_object = None}
	KillCamAnim \{Name = cas_view_cam}
	KillCamAnim \{Name = jam_publish_song_igc_name}
	musicstudio_mainobj :musicstudio_togglealbumartbackingcard \{On = FALSE}
	SpawnScriptNow \{jam_publish_reinit_band_logo}
endscript
