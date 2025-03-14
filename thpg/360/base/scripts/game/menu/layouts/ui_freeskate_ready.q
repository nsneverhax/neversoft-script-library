
script ui_create_freeskate_ready 
	printf "UI: ui_create_freeskate_ready"
	pause_menu_fmv_play
	if screenelementexists id = main_menu_bg
		doscreenelementmorph id = main_menu_bg alpha = 1
	endif
	make_cas_menu {
		title = "FREE SKATE"
		back_state = UIstate_freeskate
		pausemenu
	}
	add_cas_menu_item {
		text = "READY"
		pad_choose_script = ui_enter_freeskate
	}
	add_cas_menu_item {
		text = "REMAP TRICKS"
		choose_state = UIstate_remaptricks
	}
	cas_menu_finish
endscript

script ui_destroy_freeskate_ready 
	printf \{"UI: ui_destroy_freeskate_ready"}
	generic_ui_destroy
endscript

script ui_enter_freeskate 
	if NOT getglobalflag \{flag = $career_started}
		printf \{channel = goal
			"Resetting career because CAREER_STARTED is false"}
		reset_career_progress
		wait \{1
			gameframe}
	endif
	level_select_change_level level = ($default_first_zone) not_from_levelselect_menu
endscript
