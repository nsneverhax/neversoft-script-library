
script ui_create_signin_changed \{no_options = 0}
	destroy_dialog_box
	fadetoblack \{On
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
	sanity_check_fix_deleted_characters
	if ($join_invite_fail_reason = non_matching_users)
		header_text = qs(0x5ce7042a)
		dialog_text = qs(0xd5c7d8b1)
	else
		header_text = qs(0x85335438)
		dialog_text = qs(0x36f71bcc)
	endif
	Change \{join_invite_fail_reason = None}
	create_dialog_box {
		heading_text = <header_text>
		body_text = <dialog_text>
		options = <options>
		use_all_controllers
		no_focus
		dlg_z_priority = 10000
		update_net_controllers = 0
	}
	ui_sfx \{menustate = Generic
		uitype = warningmessage}
	AssignAlias id = <menu_id> alias = current_menu
endscript

script ui_destroy_signin_changed 
	if NOT is_accepting_invite
		create_loading_screen
	endif
	fadetoblack \{OFF
		time = 0
		no_wait}
	destroy_dialog_box
endscript
