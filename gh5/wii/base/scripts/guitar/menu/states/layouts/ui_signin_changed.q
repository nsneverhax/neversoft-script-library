
script ui_create_signin_changed \{no_options = 0}
	destroy_dialog_box
	if (<no_options> = 0)
		options = [
			{
				func = signing_change_confirm_reboot
				text = qs(0x182f0173)
			}
		]
	endif
	create_dialog_box {
		heading_text = qs(0x85335438)
		body_text = qs(0xebb660bd)
		options = <options>
		use_all_controllers
		no_focus
	}
	AssignAlias id = <menu_id> alias = current_menu
endscript

script ui_destroy_signin_changed 
	destroy_dialog_box
endscript
