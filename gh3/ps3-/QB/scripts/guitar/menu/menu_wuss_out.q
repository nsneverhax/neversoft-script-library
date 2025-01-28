
script create_wuss_out_menu 
	Change \{boss_wuss_out = 0}
	player_device = ($last_start_pressed_device)
	if ($current_song = bosstom)
		warning_text = "Wow, Tom Morello is really kicking your butt. Are you O.K.? Do you want to just skip past him? You'll always know that he got the better of you, but don't worry. You can always come back. He'll be waiting."
	elseif ($current_song = bossslash)
		warning_text = "Man, is Slash taking advantage of you? Do you need a hug? Maybe you should stick to playing bass. You wanna just pass him?  Maybe later you'll have what it takes to hang with a real guitar hero."
	endif
	kill_start_key_binding
	create_popup_warning_menu {
		Title = "WUSS OUT?"
		textblock = {
			Text = <warning_text>
			Dims = (880.0, 600.0)
			Pos = (640.0, 387.0)
			Scale = 0.55
		}
		player_device = <player_device>
		no_background
		Menu_pos = (640.0, 470.0)
		dialog_dims = (600.0, 80.0)
		options = [
			{
				func = wuss_out_menu_continue
				Text = "CONTINUE"
			}
			{
				func = wuss_out_menu_wuss_out
				Text = "WUSS OUT"
			}
		]
	}
endscript

script destroy_wuss_out_menu 
	restore_start_key_binding
	destroy_popup_warning_menu
endscript

script wuss_out_menu_continue 
	ui_flow_manager_respond_to_action \{action = Continue}
endscript

script wuss_out_menu_wuss_out 
	ui_flow_manager_respond_to_action \{action = WUSS_OUT}
endscript
