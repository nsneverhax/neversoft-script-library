
script 0x7f8945c0 
	Wait \{1
		gameframe}
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
	ScriptAssert \{'close_dwc_error_dialog: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
					break
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
	Change \{0x9342f0d5 = 1}
	generic_event_back_block \{state = uistate_mainmenu}
	Change \{kickingtomain = 0}
	SetButtonEventMappings \{unblock_menu_input}
	($default_loading_screen.Destroy)
endscript

script 0x4a6dbc35 
	printf \{qs(0x29c3e160)}
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
	ScriptAssert \{'no_profiles_dialog: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
0xc6f5b687 = 0

script 0xee85ff51 
	ScriptAssert \{'parental_block_dialog: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script 0x57655ac7 
	ScriptAssert \{'login_successful: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script 0x96107b12 
	ScriptAssert \{'login_failed: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script 0x18666843 
	logout
endscript

script 0x1d35c8cb 
	ScriptAssert \{'approve_name_dialog: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	ScriptAssert \{'leaderboard_failed: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script 0x0a731c7a 
	destroy_generic_popup
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script 0x37b3e4d5 
	ScriptAssert \{'leaderboard_request_dialog: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	set_home_button_allowed
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
endscript

script 0x0c408174 
	ScriptAssert \{'cancel_wifi_connect: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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

script 0xcad43d1d 
	destroy_generic_popup
	create_new_generic_popup \{popup_type = error_menu
		Priority = 12
		error_func = destroy_generic_popup
		text = $wii_error_no_agora}
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
		dims = (128.0, 128.0)
		rgba = [255 255 255 255]
		Pos = <0x2356f8e2>
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
