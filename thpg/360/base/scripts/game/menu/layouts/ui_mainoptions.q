
script ui_create_mainoptions 
	printf "UI: ui_create_mainoptions"
	make_cas_menu {
		title = "OPTIONS"
		back_state = uistate_mainmenu
		pausemenu
	}
	<should_allow_save> = 0
	<should_allow_load> = 0
	if isps3
		<should_allow_save> = 1
		<should_allow_load> = 1
	endif
	if isxenon
		if checkforsignin local
			<should_allow_save> = 1
			<should_allow_load> = 1
		endif
	endif
	if NOT getglobalflag flag = $career_started
		<should_allow_save> = 0
	endif
	if (<should_allow_load> = 1)
		add_cas_menu_item {
			text = "LOAD GAME"
			choose_state = UIstate_LoadGame
		}
	else
		add_cas_menu_item {
			text = "LOAD GAME"
			not_focusable
		}
	endif
	add_cas_menu_item {
		text = "GAME SETTINGS"
		choose_state = UIstate_pauseoptions
	}
	add_cas_menu_item {
		text = "CHEAT CODES"
		pad_choose_script = ui_mainoptions_goto_cheats
	}
	add_cas_menu_item {
		text = "GAME MOVIES"
		choose_state = UIstate_mainmovies
	}
	if NOT isps3
		add_cas_menu_item {
			text = "GUITAR HERO 3 DEMO"
			pad_choose_script = ui_run_gh3_demo
		}
	endif
	add_cas_menu_item {
		text = "DONE"
		choose_state = uistate_mainmenu
	}
	cas_menu_finish
endscript

script ui_run_gh3_demo 
	printf \{"Making sure memcard done..."}
	mc_waitasyncopsfinished
	printf \{"RUNNING GH3DEMO..."}
	LaunchGH3Demo
endscript

script ui_destroy_mainoptions 
	printf \{"UI: ui_destroy_mainoptions"}
	generic_ui_destroy
endscript

script ui_mainoptions_goto_cheats 
	generic_ui_destroy
	create_onscreen_keyboard \{text = ""
		keyboard_title = "CHEAT CODES"
		min_length = 1
		max_length = 15
		keyboard_done_script = check_cheat_from_keyboard
		keyboard_cancel_script = check_cheat_from_keyboard
		keyboard_cancel_params = {
			cancel
		}
		allow_cancel}
endscript
