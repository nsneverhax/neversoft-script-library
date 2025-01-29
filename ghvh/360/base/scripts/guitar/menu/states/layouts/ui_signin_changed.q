
script ui_create_signin_changed \{no_options = 0}
	destroy_popup_warning_menu
	menu_music_on
	if (<no_options> = 0)
		options = [
			{
				func = signing_change_confirm_reboot
				text = qs(0x182f0173)
				Scale = (1.0, 1.0)
			}
		]
	endif
	if isps3
		create_popup_warning_menu {
			title = qs(0x77f985f8)
			title_props = {Scale = 1.0}
			textblock = {
				text = qs(0x6a50b1e3)
				Pos = (640.0, 380.0)
			}
			menu_pos = (640.0, 510.0)
			options = <options>
			use_all_controllers
			z_priority = 1100
			no_focus
		}
	else
		create_popup_warning_menu {
			title = qs(0x77f985f8)
			title_props = {Scale = 1.0}
			textblock = {
				text = qs(0x6e9bce68)
				Pos = (640.0, 380.0)
			}
			menu_pos = (640.0, 510.0)
			options = <options>
			use_all_controllers
			z_priority = 1100
			no_focus
		}
	endif
	AssignAlias id = <menu_id> alias = current_menu
	SetButtonEventMappings \{unblock_menu_input}
endscript

script ui_destroy_signin_changed 
	destroy_popup_warning_menu
endscript
