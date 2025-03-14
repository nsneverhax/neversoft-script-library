
script ui_create_achieve_main 
	printf \{"UI: ui_create_achieve_main"}
	make_cas_menu \{menu_id = achieve_main_anchor
		vmenu_id = achieve_main_vmenu
		title = "OPTIONS"
		back_state = uistate_pausemenu
		pausemenu}
	cas_menu_finish
endscript

script ui_destroy_achieve_main 
	printf \{"UI: ui_destroy_achieve_main"}
	generic_ui_destroy
endscript

script ui_bedroom_warning_dialog 
	create_dialog_box {
		title = "GO BACK TO CAS?"
		text = "Are you sure you want to quit to CAS?"
		pos = (320.0, 240.0)
		just = [center center]
		pad_back_script = ui_pausemenu_quit_dialog_cancel
		buttons = [
			{font = text_a1 text = "GO TO CAS" pad_choose_script = ui_bedroom_warning_dialog_accept}
			{font = text_a1 text = "CANCEL" pad_choose_script = ui_bedroom_warning_dialog_cancel}
		]
	}
endscript

script ui_bedroom_warning_dialog_accept 
	dialog_box_exit
	ui_bedroom_go
endscript

script ui_bedroom_warning_dialog_cancel 
	dialog_box_exit
	cas_menu_finish
endscript

script ui_bedroom_go 
	kill_start_key_binding
	generic_menu_pad_choose_sfx
	generic_ui_destroy
	pause_menu_fmv_kill
	killskatercamanim \{all}
	if gotparam \{tutorial}
		if ($bedroom_select_skater = came_from_new_life)
			change \{bedroom_select_skater = came_from_tutorial_newlife}
		endif
		if ($bedroom_select_skater = came_from_career_game)
			change \{bedroom_select_skater = came_from_tutorial_career_game}
		endif
	else
		change \{bedroom_select_skater = came_from_career_game}
	endif
	spawnscriptnow \{noqbid
		change_level
		params = {
			level = load_z_bedroom
		}}
endscript

script ui_your_space_warning_dialog 
	create_dialog_box {
		title = "GO BACK TO YOUR SKATE LOUNGE?"
		text = "Are you sure you want to quit to your skate lounge?"
		pos = (320.0, 240.0)
		just = [center center]
		pad_back_script = ui_pausemenu_quit_dialog_cancel
		buttons = [
			{font = text_a1 text = "GO TO YOUR SKATE LOUNGE" pad_choose_script = ui_your_space_warning_dialog_accept}
			{font = text_a1 text = "CANCEL" pad_choose_script = ui_your_space_warning_dialog_cancel}
		]
	}
endscript

script ui_your_space_warning_dialog_accept 
	dialog_box_exit
	ui_your_space_go
endscript

script ui_your_space_warning_dialog_cancel 
	dialog_box_exit
	cas_menu_finish
endscript

script ui_your_space_go 
	kill_start_key_binding
	generic_menu_pad_choose_sfx
	generic_ui_destroy
	pause_menu_fmv_kill
	killskatercamanim \{all}
	spawnscriptnow \{noqbid
		change_level
		params = {
			level = load_z_crib
		}}
endscript
