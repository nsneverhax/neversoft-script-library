
script ui_create_freeskate 
	printf \{"UI: ui_create_freeskate"}
	change_gamemode_singlesession
	cas_ensure_skater_loaded \{name = custom_story
		load_paks
		loading_screen}
	launch_select_skater_menu
endscript

script ui_destroy_freeskate 
	printf \{"UI: ui_destroy_freeskate"}
	generic_ui_destroy
endscript
