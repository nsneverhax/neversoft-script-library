
script ui_create_options_settings_lefty_warning 
	requireparams \{[
			part
		]
		all}
	create_options_lefty_flip_warning_menu part = <part>
endscript

script ui_destroy_options_settings_lefty_warning 
	destroy_options_lefty_flip_warning_menu
endscript

script create_options_lefty_flip_warning_menu 
	requireparams \{[
			part
		]
		all}
	<player> = <player_selected>
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
	requireparams \{[
			part
		]
		all}
	ui_options_controller_choose_lefty_flip part = <part>
	ui_memcard_autosave \{event = menu_back
		state = uistate_options}
endscript

script destroy_options_lefty_flip_warning_menu 
	destroy_dialog_box
endscript
