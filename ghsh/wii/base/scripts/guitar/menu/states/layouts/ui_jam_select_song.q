
script ui_init_jam_select_song 
endscript

script ui_create_jam_select_song 
	create_loading_screen
	SpawnScriptNow create_jam_song_select_menu params = <...>
endscript

script ui_destroy_jam_select_song 
	destroy_jam_song_select_menu
endscript

script ui_deinit_jam_select_song 
endscript
