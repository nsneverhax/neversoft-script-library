
script create_signin_changed_menu 
	destroy_popup_warning_menu
	create_popup_warning_menu \{Title = "SIGN-IN CHANGED"
		title_props = {
			Scale = 1.0
		}
		textblock = {
			Text = "A user sign-in change has caused the game to lose ownership of saves and achievements. As a result, the game has restarted."
			Pos = (640.0, 380.0)
		}
		Menu_pos = (640.0, 510.0)
		options = [
			{
				func = signing_change_confirm_reboot
				Text = "CONTINUE"
				Scale = (1.0, 1.0)
			}
		]}
endscript

script destroy_signin_changed_menu 
	destroy_popup_warning_menu
endscript

script recreate_signin_changed_menu 
	destroy_signin_changed_menu
	create_signin_changed_menu
endscript
