in_tutorial_mode = 0

script ui_create_select_tutorial 
	update_ingame_controllers controller = ($primary_controller)
	check_tutorial_allowances
	menu_music_on
	cheat_turnoffall
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
	change \{g_in_tutorial = 0}
	change \{practice_enabled = 0}
	reset_character_ids
endscript
