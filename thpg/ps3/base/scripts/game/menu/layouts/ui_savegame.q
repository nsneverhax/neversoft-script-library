
script ui_create_savegame 
	printf \{"UI: ui_create_savegame"}
	spawnscriptnow \{launch_options_menu_save_game_sequence}
endscript

script ui_destroy_savegame 
	printf \{"UI: ui_destroy_savegame"}
	generic_ui_destroy
endscript
