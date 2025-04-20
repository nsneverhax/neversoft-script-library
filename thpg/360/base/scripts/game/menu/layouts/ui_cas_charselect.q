
script ui_create_cas_charselect 
	printf "UI: ui_create_cas_charselect"
	make_cas_menu {
		title = "CHARACTER"
		back_state = uistate_cas
		pausemenu
	}
	add_cas_menu_item {
		text = "CAREER"
		pad_choose_script = ui_cas_select_character
		pad_choose_params = {character_type = CAS_CAREER}
	}
	add_cas_menu_item {
		text = "BACK"
		choose_state = uistate_cas
	}
	cas_menu_finish
endscript

script ui_destroy_cas_charselect 
	printf \{"UI: ui_destroy_cas_charselect"}
	generic_ui_destroy
endscript

script ui_cas_select_character 
	change_gamemode_classic
	change \{is_changing_levels = 1}
	load_level_handle_movie_loading_screen
	cas_ensure_skater_loaded \{name = custom_story}
	generic_ui_destroy
	pause_menu_fmv_kill
	ui_create_background
	change \{bedroom_select_skater = came_from_cas}
	wait \{1
		second}
	change_level \{level = load_z_bedroom}
endscript
