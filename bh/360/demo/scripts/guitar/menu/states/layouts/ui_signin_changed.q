
script ui_create_signin_changed \{no_options = 0}
	destroy_dialog_box
	fadetoblack \{on
		time = 0.0
		alpha = 1
		no_wait}
	if (<no_options> = 0)
		options = [
			{
				func = signing_change_confirm_reboot
				text = qs(0x182f0173)
			}
		]
	endif
	safe_update_band_characters
	create_dialog_box {
		heading_text = qs(0x85335438)
		body_text = qs(0x36f71bcc)
		options = <options>
		use_all_controllers
		no_focus
		dlg_z_priority = 10000
	}
	assignalias id = <menu_id> alias = current_menu
endscript

script ui_destroy_signin_changed 
	create_loading_screen
	fadetoblack \{off
		time = 0
		no_wait}
	destroy_dialog_box
endscript
