
script ui_create_pauseoptions 
	printf "ui_create_pauseoptions"
	restore_start_key_binding
	if infrontend
		back_state = UIstate_mainoptions
	else
		back_state = uistate_pausemenu
	endif
	title = "OPTIONS"
	if infrontend
		title = "GAME SETTINGS"
	endif
	make_cas_menu {
		menu_id = pause_options_anchor
		vmenu_id = pause_options_vmenu
		pausemenu
		title = <title>
		back_state = <back_state>
	}
	if istrue $ui_show_debug_menus
		if NOT infrontend
			add_cas_menu_item {
				text = "DEBUG OPTIONS"
				choose_state = UIstate_debugoptions
			}
		endif
	endif
	if NOT infrontend
		if gamemodeequals is_career
			if NOT gman_hasactivegoals
				ui_pausemenu_add_save_menu_item
			endif
		endif
	endif
	add_cas_menu_item {
		text = "SOUND OPTIONS"
		choose_state = UIstate_SoundOptions
	}
	add_cas_menu_item {
		text = "DISPLAY OPTIONS"
		choose_state = UIstate_DisplayOptions
	}
	if NOT insplitscreengame
		add_cas_menu_item {
			text = "CONTROL SETUP"
			choose_state = UIstate_ControlSetup
		}
	endif
	if NOT infrontend
		if NOT innetgame
			if NOT insplitscreengame
				add_cas_menu_item {
					text = "CHEATS"
					choose_state = UIstate_pausecheats
				}
			endif
		endif
	endif
	cas_menu_finish
endscript

script ui_destroy_pauseoptions 
	printf \{"ui_destroy_pauseoptions"}
	generic_ui_destroy
endscript
