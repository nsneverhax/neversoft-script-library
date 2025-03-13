
script ui_create_play_tutorial 
	tutorialsystem_run
endscript

script ui_destroy_play_tutorial 
	startrendering
endscript

script ui_play_tutorial_anim_out 
	tutorial_shutdown
endscript

script ui_return_play_tutorial 
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = focus
			target = menu_tutorial}
	else
		tutorial_create_pause_handler
	endif
endscript
