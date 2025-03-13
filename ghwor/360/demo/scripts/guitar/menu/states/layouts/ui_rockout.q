
script ui_create_rockout 
	create_menu_backdrop \{texture = rockout_bg}
	spawnscriptnow \{rockout_add_goal}
endscript

script ui_destroy_rockout 
	destroy_rockout_game
	spawnscriptnow \{rockout_remove_goal}
endscript
