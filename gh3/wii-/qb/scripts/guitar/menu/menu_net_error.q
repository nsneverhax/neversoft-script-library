
script 0x7f8945c0 
	if (<dwc_error_code> > 0)
		formattext textname = error_msg '%d: %s' d = (<dwc_error_code>) s = (<dwc_error_text>)
	else
		formattext textname = error_msg '%s' s = (<dwc_error_text>)
	endif
	destroy_generic_popup
	0x876d9c1b = 0
	if german
		if (<0xb18fe2ac> = 1)
			<0x876d9c1b> = 1
		endif
	elseif spanish
		if (<0xb18fe2ac> = 1)
			<0x876d9c1b> = 1
		endif
	elseif italian
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
	change \{kickingtomain = 1}
	0x54c5997a
	0x7f8945c0 {
		dwc_error_code = <dwc_error_code>
		dwc_error_text = <dwc_error_text>
	}
endscript

script 0xe39ab4b7 
	clear_network_wait_variable
	destroy_generic_popup
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
		stoprendering
		shutdown_game_for_signin_change \{unloadcontent = 0}
		startrendering
	endif
	cancelenterwifimenu
	printf \{'shut_down_flow_manager'}
	enable_pause
	wait \{5
		gameframes}
	printf \{'start_flow_manager flow_state=main_menu_fs'}
	start_flow_manager \{flow_state = main_menu_fs}
	launchevent \{type = focus
		target = vmenu_main_menu}
	change \{kickingtomain = 0}
endscript

script 0x4758375f 
	printf \{'wii_shutdown_game_for_signin_change'}
	stopallsounds
	end_practice_song_slomo
	if screenelementexists \{id = loading_screen_container}
		destroy_loading_screen
	endif
	memcard_sequence_cleanup_generic
	destroy_leaving_lobby_dialog
	menu_store_go_back
	shut_down_character_hub
	tutorial_shutdown
	shut_down_flow_manager \{player = 1}
	shut_down_flow_manager \{player = 2}
	store_monitor_goal_guitar_finish
	deregisteratoms
	quit_network_game_early \{signin_change}
	kill_gem_scroller \{no_render = 1}
	progression_push_current \{force = 1}
	clean_up_user_control_helpers
	menu_music_off \{setflag = 1}
	unload_songqpak
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	destroy_band \{unload_paks}
	unpausegame
	printf \{'wii_shutdown_game_for_signin_change end'}
endscript

script 0x4a6dbc35 
	printf \{'--- failed_connect_to_internet'}
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
	printf '--- no_profiles_dialog nosave = %d' a = ($wii_nosave_onboot)
	if ($wii_nosave_onboot = 1)
		destroy_generic_popup
		create_generic_popup \{title = $wii_no_prof_title
			ok_menu
			message = $wii_no_prof
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
	endif
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
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
		]
		wait_variable = network_wait_var
		previous_menu = ebn_marker}
endscript

script destroy_name_dialog_early 
	killspawnedscript \{name = start_loading_process}
	destroy_generic_popup
endscript
0xe9e30ac7 = 0

script 0xfc09b2a9 
	if netsessionfunc \{obj = stats
			func = 0xac36e209}
		destroy_generic_popup
		clean_up_user_control_helpers
		ui_flow_manager_respond_to_action \{action = go_back}
		clear_network_wait_variable
	endif
endscript

script 0x20600fc8 
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
endscript

script 0x0a731c7a 
	destroy_generic_popup
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script 0x37b3e4d5 
	change \{0xe9e30ac7 = 0}
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
	change \{0xc127fbde = 1}
	destroy_generic_popup
endscript

script 0x0c408174 
	set_home_button_allowed
	change \{0xc127fbde = 1}
	0x595faeb6
endscript

script 0x5745e12c 
	destroy_generic_popup
	change \{0xc127fbde = 0}
	set_home_button_notallowed
	create_generic_popup \{title = $wii_login
		loading_window
		message = $wii_connecting
		wait_variable = 0xc127fbde
		previous_menu = current_menu}
endscript
