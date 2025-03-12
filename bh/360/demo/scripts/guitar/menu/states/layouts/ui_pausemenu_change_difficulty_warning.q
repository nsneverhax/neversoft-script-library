
script ui_create_pausemenu_change_difficulty_warning 
	create_pausemenu_change_difficulty_warning <...>
endscript

script ui_destroy_pausemenu_change_difficulty_warning 
	destroy_dialog_box
endscript

script create_pausemenu_change_difficulty_warning 
	disable_pause
	player_device = ($last_start_pressed_device)
	create_dialog_box {
		body_text = qs(0x5b07675d)
		player_device = <player_device>
		no_background
		options = [
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0xf7723015)
			}
			{
				func = pausemenu_change_difficulty_confirm_ok
				func_params = {difficulty = <difficulty> <...>}
				text = qs(0xb8790f2f)
			}
		]
	}
endscript

script pausemenu_change_difficulty_warning_yes 
	kill_intro_celeb_ui
	removeparameter \{base_name}
	generic_event_choose no_sound state = uistate_pausemenu_change_difficulty_confirm data = {<...> difficulty = <difficulty>}
endscript
