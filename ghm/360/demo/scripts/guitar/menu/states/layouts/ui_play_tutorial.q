
script ui_create_play_tutorial 
	run_training_script
endscript

script ui_destroy_play_tutorial 
	startrendering
	destroyscreenelement \{id = training_container}
endscript

script ui_play_tutorial_anim_out 
	tutorial_shutdown
endscript

script ui_return_play_tutorial 
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = focus
			target = menu_tutorial}
	else
		create_training_pause_handler
	endif
endscript
