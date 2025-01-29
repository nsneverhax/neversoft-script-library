wii_dwc_error_noconnect_wifi_text = qs(0xa7e69f2b)
wii_dwc_error_noconnect_gamespy_text = qs(0x6067b485)
wii_dwc_error_noconnect_inet_text = qs(0x04007359)
wii_dwc_error_noconnect_friend_text = qs(0x9a12440a)
wii_dwc_error_noservice_traffic_text = qs(0x58cb447f)
wii_dwc_error_noservice_discontinued_text = qs(0x8d97c6f6)
wii_dwc_error_nomemory_text = qs(0xf3462a5c)
wii_dwc_error_nomemory_damaged_text = qs(0x9726a3c3)
wii_dwc_error_disconnect_text = qs(0x36eae7ad)
wii_dwc_error_nodisc_text = qs(0xc4026333)

script 0x7f8945c0 
	Wait \{1
		gameframe}
	if (<dwc_error_code> > 0)
		formatText TextName = error_msg qs(0x5ceb0ec8) d = (<dwc_error_code>) s = (<dwc_error_text>)
	else
		formatText TextName = error_msg qs(0x4d4555da) s = (<dwc_error_text>)
	endif
	destroy_generic_popup
	if isngc
		wii_bootup_handle_connection_error
	endif
	0x876d9c1b = 0
	if (<0x876d9c1b> = 1)
		create_generic_popup {
			previous_menu = current_menu
			title = qs(0x79597197)
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
			title = qs(0x79597197)
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
	OnExitRun \{0xf00f29a9}
	0x79db87d7
	clear_network_wait_variable
	Wait \{0.5
		Seconds}
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
	($default_loading_screen.create)
	if ($is_network_game)
		shutdown_game_for_signin_change \{unloadcontent = 0}
	endif
	setscriptcannotpause
	begin
	if NOT is_ui_event_running
		if NOT ScriptIsRunning \{ui_create_play_song_spawned}
			if NOT ScriptIsRunning \{ui_create_band_mode_spawned}
				if NOT ScriptIsRunning \{ui_create_net_setup_spawned}
					if NOT ScriptIsRunning \{0x32c78903}
						break
					endif
				endif
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if ($is_network_game)
		shutdown_game_for_signin_change \{unloadcontent = 0}
	endif
	cancelenterwifimenu
	enable_pause
	Wait \{5
		gameframes}
	generic_event_back_block \{state = uistate_mainmenu}
	Change \{kickingtomain = 0}
	SetButtonEventMappings \{unblock_menu_input}
	($default_loading_screen.Destroy)
endscript

script 0x4a6dbc35 
	printf \{qs(0x29c3e160)}
	destroy_generic_popup
	create_generic_popup \{title = qs(0x79597197)
		ok_menu
		message = qs(0xbf161611)
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
	create_generic_popup \{title = qs(0xee705424)
		ok_menu
		message = qs(0x8863e35f)
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
	create_generic_popup \{title = qs(0x2771eaef)
		ok_menu
		message = qs(0x28b7915d)
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
	create_generic_popup \{title = qs(0xf2f5ef0e)
		ok_menu
		message = qs(0x094c8449)
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
	create_generic_popup \{title = qs(0xe2753a5d)
		loading_window
		message = qs(0x4498310f)
		wait_variable = network_wait_var
		default_blackout}
endscript

script destroy_name_dialog_early 
	KillSpawnedScript \{Name = start_loading_process}
	destroy_generic_popup
endscript
0xe9e30ac7 = 0

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
		create_generic_popup \{title = qs(0x79597197)
			ok_menu
			message = qs(0x8cf70496)
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
	create_generic_popup \{title = qs(0x86c4c555)
		loading_window
		can_cancel
		message = qs(0xef150e6b)
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
	create_generic_popup \{title = qs(0x6b1ad03f)
		ok_menu
		message = qs(0xb531e891)
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
	set_home_button_allowed
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
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
	create_generic_popup \{title = qs(0xf2f5ef0e)
		loading_window
		message = qs(0x0e316379)
		wait_variable = 0xc127fbde
		default_blackout}
endscript

script 0xcad43d1d 
	if 0x8658e568
		destroy_loading_screen
	endif
	Wait \{2
		Seconds}
	ui_event_wait_for_safe
	destroy_generic_popup
	create_new_generic_popup \{popup_type = error_menu
		Priority = 12
		error_func = destroy_generic_popup
		text = qs(0x2cff077f)}
endscript

script 0x2bbb732f 
	if ScreenElementExists \{id = 0x575efd14}
		return
	endif
	0x61406d12
	CreateScreenElement {
		Type = SpriteElement
		id = 0x575efd14
		parent = root_window
		texture = 0xc74a5296
		dims = <0x889c768f>
		rgba = [255 255 255 255]
		Pos = (<0x2356f8e2> + (100.0, 0.0))
		just = [center center]
		Scale = 1.0
		z_priority = 10000.0
		alpha = 0
		no_squishy = true
	}
	if ScreenElementExists \{id = online_load_wheel_bg}
		legacydoscreenelementmorph \{id = online_load_wheel_bg
			alpha = 0
			time = 0.25}
	endif
	legacydoscreenelementmorph \{id = 0x575efd14
		alpha = 1
		time = 0.25}
	Wait \{2
		Seconds}
	if ScreenElementExists \{id = online_load_wheel_bg}
		legacydoscreenelementmorph \{id = online_load_wheel_bg
			alpha = 1
			time = 0.25}
	endif
	legacydoscreenelementmorph \{id = 0x575efd14
		alpha = 0
		time = 0.25}
	Wait \{0.5
		Seconds}
	if ScreenElementExists \{id = 0x575efd14}
		DestroyScreenElement \{id = 0x575efd14}
	endif
endscript
