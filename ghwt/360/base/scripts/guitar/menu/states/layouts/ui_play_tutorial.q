
script ui_create_play_tutorial 
	run_training_script
endscript

script ui_destroy_play_tutorial 
	StartRendering
endscript

script ui_play_tutorial_anim_out 
	tutorial_shutdown
endscript

script ui_return_play_tutorial 
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = focus
			target = menu_tutorial}
	else
		create_training_pause_handler
	endif
endscript
