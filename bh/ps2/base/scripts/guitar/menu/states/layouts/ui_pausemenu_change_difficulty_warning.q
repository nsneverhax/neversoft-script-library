
script ui_create_pausemenu_change_difficulty_warning 
	create_pausemenu_change_difficulty_warning <...>
endscript

script ui_destroy_pausemenu_change_difficulty_warning 
	destroy_dialog_box
endscript

script create_pausemenu_change_difficulty_warning \{0x3e8a7a4d = -1}
	disable_pause
	if (($0xc7e670d7 = 1) && (GotParam band_mode))
		body_text = qs(0x2e325b58)
		continue_text = qs(0x67d9c56d)
	else
		body_text = qs(0x5b07675d)
		continue_text = qs(0xb8790f2f)
	endif
	create_dialog_box {
		body_text = <body_text>
		player_device = <player_device>
		no_background
		options = [
			{
				func = {generic_event_back params = {0x3e8a7a4d = <0x3e8a7a4d>}}
				text = qs(0xf7723015)
			}
			{
				func = pausemenu_change_difficulty_warning_yes
				func_params = {double_kick = <double_kick> difficulty = <difficulty> 0x3e8a7a4d = <0x3e8a7a4d> band_mode = <band_mode>}
				text = <continue_text>
			}
		]
	}
endscript

script pausemenu_change_difficulty_warning_yes 
	kill_intro_celeb_ui
	if GotParam \{band_mode}
		generic_event_back \{state = uistate_band_difficulty}
	else
		generic_event_choose state = uistate_pausemenu_change_difficulty_confirm data = {<...> difficulty = <difficulty>}
	endif
endscript
