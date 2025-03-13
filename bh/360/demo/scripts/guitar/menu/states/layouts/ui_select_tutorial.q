in_tutorial_mode = 0

script ui_create_select_tutorial 
	check_tutorial_allowances
	create_tutorial_select_menu allowances = <allowances>
endscript

script ui_destroy_select_tutorial 
	destroy_tutorial_select_menu
endscript

script ui_init_select_tutorial \{from_career = 0}
	change \{in_tutorial_mode = 1}
endscript

script ui_deinit_select_tutorial \{from_career = 0}
	change \{in_tutorial_mode = 0}
endscript
