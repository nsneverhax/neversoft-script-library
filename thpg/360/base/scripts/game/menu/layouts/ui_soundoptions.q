
script ui_create_soundoptions 
	printf \{"ui_create_soundoptions"}
	kill_start_key_binding
	launch_sound_options_menu
endscript

script ui_destroy_soundoptions 
	printf \{"ui_destroy_soundoptions"}
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
endscript
