
script ui_create_signin_changed \{no_options = 0}
	pushunsafeforshutdown \{context = ui_create_signin_changed}
	destroy_dialog_box
	fadetoblack \{on
		time = 0.0
		alpha = 1
		no_wait}
	wait \{4
		gameframes}
	setpakmancurrentblock \{map = ui_paks
		pakname = 'band_lobby'
		block_scripts = 1}
	if (<no_options> = 0)
		options = [
			{
				func = signing_change_confirm_reboot
				text = qs(0x182f0173)
			}
		]
	endif
	sanity_check_fix_deleted_characters
	if ($join_invite_fail_reason = non_matching_users)
		header_text = qs(0x5ce7042a)
		dialog_text = qs(0xd5c7d8b1)
	else
		header_text = qs(0x85335438)
		dialog_text = qs(0x36f71bcc)
	endif
	change \{join_invite_fail_reason = none}
	create_dialog_box {
		heading_text = <header_text>
		body_text = <dialog_text>
		options = <options>
		use_all_controllers
		no_focus
		dlg_z_priority = 10000
		update_net_controllers = 0
	}
	ui_sfx \{menustate = generic
		uitype = warningmessage}
	assignalias id = <menu_id> alias = current_menu
	popunsafeforshutdown \{context = ui_create_signin_changed}
endscript

script ui_destroy_signin_changed 
	if NOT is_accepting_invite
		create_loading_screen
	endif
	fadetoblack \{off
		time = 0
		no_wait}
	destroy_dialog_box
endscript
