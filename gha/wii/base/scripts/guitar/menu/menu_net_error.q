
script 0x7f8945c0 
	if (<dwc_error_code> > 0)
		formatText TextName = error_msg '%d: %s' d = (<dwc_error_code>) s = (<dwc_error_text>)
	else
		formatText TextName = error_msg '%s' s = (<dwc_error_text>)
	endif
	destroy_generic_popup
	if isngc
		wii_bootup_handle_connection_error
	endif
	0x876d9c1b = 0
	if German
		if (<0xb18fe2ac> = 1)
			<0x876d9c1b> = 1
		endif
	elseif Spanish
		if (<0xb18fe2ac> = 1)
			<0x876d9c1b> = 1
		endif
	elseif Italian
		if (<0xb18fe2ac> = 1)
			<0x876d9c1b> = 1
		endif
	elseif French
		if (<0xb18fe2ac> = 1)
			<0x876d9c1b> = 1
		endif
	endif
	if (<0x876d9c1b> = 1)
		create_generic_popup {
			previous_menu = current_menu
			title = $wii_error
			long_text
			ok_menu
			message = <error_msg>
			ok_eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose 0x48ca1518}
			]
		}
	else
		create_generic_popup {
			previous_menu = current_menu
			title = $wii_error
			ok_menu
			message = <error_msg>
			ok_eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose 0x48ca1518}
			]
		}
	endif
endscript

script 0x48ca1518 
	set_home_button_allowed
	destroy_generic_popup
endscript
kickingtomain = 0

script 0x17be78a8 
	clear_network_wait_variable
	destroy_generic_popup
	Change \{kickingtomain = 1}
	0x54c5997a
	0x7f8945c0 {
		dwc_error_code = <dwc_error_code>
		dwc_error_text = <dwc_error_text>
	}
endscript

script 0xe39ab4b7 
	clear_network_wait_variable
	destroy_generic_popup
	if isngc
		wii_bootup_handle_connection_error
	endif
	ok_after_reject
	0x7f8945c0 {
		dwc_error_code = <dwc_error_code>
		dwc_error_text = <dwc_error_text>
	}
endscript

script 0x7903377f 
	destroy_generic_popup
	set_home_button_allowed
	if (<0xd2607695> = 1)
		0x54c5997a
	endif
endscript

script 0x54c5997a 
	sysnotify_wait_until_safe
	cleanup_sessionfuncs
	if ($is_network_game)
		StopRendering
		0x89593f8b
		shutdown_game_for_signin_change \{unloadcontent = 0}
		StartRendering
	endif
	cancelenterwifimenu
	enable_pause
	Wait \{5
		gameframes}

	start_flow_manager \{flow_state = main_menu_fs}
	LaunchEvent \{Type = focus
		target = vmenu_main_menu}
	Change \{kickingtomain = 0}
endscript

script 0x4a6dbc35 

	destroy_generic_popup
	create_generic_popup \{title = $wii_error
		ok_menu
		message = $wii_failed_connect
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				0x48ca1518
			}
		]
		previous_menu = vmenu_main_menu}
endscript

script 0x8330b46d 
	create_generic_popup \{title = $wii_no_prof_title
		ok_menu
		message = $wii_no_prof
		default_blackout
		add_user_control_helpers
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				wii_bootup_skip_login
			}
		]}
endscript
0xc6f5b687 = 0

script 0xee85ff51 
	create_generic_popup \{title = $wii_rvldwc_message_1000_title
		ok_menu
		message = $wii_rvldwc_message_1000
		default_blackout
		add_user_control_helpers
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				wii_bootup_skip_login
			}
		]}
endscript

script 0x57655ac7 
	destroy_generic_popup
	create_generic_popup \{title = $wii_login
		ok_menu
		message = $wii_connected
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				destroy_generic_popup
			}
		]
		previous_menu = vmenu_main_menu}
endscript

script 0x96107b12 
endscript

script 0x18666843 
	logout
endscript

script 0x1d35c8cb 
	enable_network_wait_variable
	destroy_generic_popup
	create_generic_popup \{title = $wii_approving_title
		loading_window
		message = $wii_approving1
		wait_variable = network_wait_var
		default_blackout}
endscript

script destroy_name_dialog_early 
	KillSpawnedScript \{Name = start_loading_process}
	destroy_generic_popup
endscript
0xe9e30ac7 = 0
0x432a975d = 0

script 0xc317957c 
	return \{out = $0x432a975d}
endscript

script 0xfc09b2a9 
	if NetSessionFunc \{Obj = stats
			func = 0xac36e209}
		destroy_generic_popup
		clean_up_user_control_helpers
		ui_flow_manager_respond_to_action \{action = go_back}
		clear_network_wait_variable
	endif
endscript

script 0x20600fc8 
	if ($0x432a975d = 1)
		destroy_generic_popup
		clear_network_wait_variable
		clean_up_user_control_helpers
		create_generic_popup \{title = $wii_error
			ok_menu
			message = $wii_server_timeout
			ok_eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					0x0a731c7a
				}
			]}
	endif
endscript

script 0x0a731c7a 
	destroy_generic_popup
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script 0x37b3e4d5 
	Change \{0xe9e30ac7 = 0}
	destroy_generic_popup
	create_generic_popup \{title = $wii_lb_title
		loading_window
		can_cancel
		message = $wii_lb_waiting
		wait_variable = 0xe9e30ac7
		cancel_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				0xfc09b2a9
			}
		]
		previous_menu = 0xc7d30aef}
endscript

script 0x3f995777 
	destroy_name_dialog_early
	create_generic_popup \{title = $wii_approval_timeout_title
		ok_menu
		message = $wii_server_unavailable
		previous_menu = ebn_marker
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				0x48ca1518
			}
		]}
endscript
0xc127fbde = 0

script 0x041a5e31 
	Change \{0xc127fbde = 1}
	destroy_generic_popup
endscript

script 0x0c408174 
	set_home_button_allowed
	Change \{0xc127fbde = 1}
	0x595faeb6
endscript

script 0x5745e12c 
	destroy_generic_popup
	clean_up_user_control_helpers
	Change \{0xc127fbde = 0}
	set_home_button_notallowed
	create_generic_popup \{title = $wii_login
		loading_window
		message = $wii_connecting
		wait_variable = 0xc127fbde
		default_blackout}
endscript
