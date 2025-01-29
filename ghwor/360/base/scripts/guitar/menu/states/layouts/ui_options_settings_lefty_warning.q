
script ui_create_options_settings_lefty_warning 
	RequireParams \{[
			part
		]
		all}
	create_mainmenu_bg
	destroy_friend_feed
	create_options_lefty_flip_warning_menu part = <part>
endscript

script ui_destroy_options_settings_lefty_warning 
	destroy_mainmenu_bg
	destroy_options_lefty_flip_warning_menu
endscript

script create_options_lefty_flip_warning_menu 
	RequireParams \{[
			part
		]
		all}
	<Player> = <player_selected>
	create_dialog_box {
		body_text = qs(0x07696366)
		player_device = ($primary_controller)
		no_background
		options = [
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0xf7723015)
			}
			{
				func = options_lefty_flip_warning_menu_continue
				func_params = {
					part = <part>
				}
				text = qs(0x182f0173)
			}
		]
	}
endscript

script options_lefty_flip_warning_menu_continue 
	RequireParams \{[
			part
		]
		all}
	ui_options_controller_choose_lefty_flip part = <part>
	ui_memcard_autosave \{event = menu_back
		state = uistate_options_gameplay
		show_mainmenu_bg = 1}
endscript

script destroy_options_lefty_flip_warning_menu 
	destroy_dialog_box
endscript
