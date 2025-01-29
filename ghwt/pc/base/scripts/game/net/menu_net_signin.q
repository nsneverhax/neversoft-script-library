logintextcolor = [
	255
	200
	0
	255
]
gprivatematchid = 0

script create_winport_account_create_screen 
	create_winport_account_management_screen \{mode = createaccount
		title = qs(0x47f8b9ab)
		container = accountcreatecontainer}
endscript

script destroy_winport_account_create_screen 
	destroy_winport_account_management_screen \{container = accountcreatecontainer}
endscript

script 0x58e55ccb 
	printf \{qs(0x32860a8e)}
	ui_event_wait \{event = menu_replace
		data = {
			state = 0xe4d2b7e7
			mode = resetaccount
			title = qs(0xaebdb73e)
			container = accountresetcontainer
			yellowbuttontext = qs(0x34db5bf4)
			yellowbuttonaction = start_winport_account_delete_screen
		}}
endscript

script 0x327eda2e 
	destroy_winport_account_management_screen \{container = accountresetcontainer}
endscript

script start_winport_account_reset_screen 
	printf \{qs(0xcbe75dc0)}
	ui_event_wait \{event = menu_replace
		state = 0xd4b24034}
endscript

script 0xe374ed28 
	ui_event_wait \{event = menu_replace
		data = {
			state = 0xe4d2b7e7
			mode = deleteaccount
			title = qs(0x16fd5b13)
			container = accountdeletecontainer
		}}
endscript

script 0x337e6059 
	destroy_winport_account_management_screen \{container = accountdeletecontainer}
endscript

script start_winport_account_delete_screen 
	ui_event_wait \{event = menu_replace
		state = 0xcefa55b9}
endscript

script 0x307fc0a1 
	printf \{'--- ui_create_change_password_submenu'}
	create_change_password_submenu
endscript

script 0x579c18f9 
	destroy_change_password_submenu
endscript

script create_change_password_submenu 
	printf \{qs(0x7632f4d2)}
	printscriptinfo \{qs(0xafaba2ee)}
	ui_event_wait \{event = menu_replace
		data = {
			state = 0xe4d2b7e7
			mode = changeaccount
			title = qs(0x95ad3a57)
			container = accountchangecontainer
			yellowbuttontext = qs(0x1cb97731)
			yellowbuttonaction = 0x8d6911b3
			0x2d99b7cf
		}}
endscript

script destroy_change_password_submenu 
	destroy_winport_account_management_screen \{container = accountchangecontainer}
endscript

script 0x4c81dad6 
	printf \{'--- ui_create_account_delete_submenu'}
	create_account_delete_submenu
endscript

script 0x72134e4d 
	destroy_account_delete_submenu
endscript

script create_account_delete_submenu 
	ui_event_wait \{event = menu_replace
		data = {
			state = 0xe4d2b7e7
			mode = deleteaccount
			title = qs(0x16fd5b13)
			container = accountdeletesubmenucontainer
			yellowbuttonaction = winport_null_action
			0x2d99b7cf
		}}
endscript

script destroy_account_delete_submenu 
	destroy_winport_account_management_screen \{container = accountdeletesubmenucontainer}
endscript

script 0xe64e2445 
	printf \{'--- ui_create_account_reset_submenu'}
	0x8d6911b3
endscript

script 0x1aad64a2 
	0x4e1814be
endscript

script 0x8d6911b3 
	ui_event_wait \{event = menu_replace
		data = {
			state = 0xe4d2b7e7
			mode = resetaccount
			title = qs(0x63f382d1)
			container = 0xa9aeb3f5
			yellowbuttonaction = winport_null_action
			0x2d99b7cf
		}}
endscript

script 0x4e1814be 
	destroy_winport_account_management_screen \{container = 0xa9aeb3f5}
endscript

script winport_null_action 
endscript

script create_winport_account_create_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_create_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_change_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_change_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_reset_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_reset_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_delete_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_delete_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_account_change_submenu_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_account_change_submenu_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_account_delete_submenu_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_account_delete_submenu_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_join_private_menu 
	printf \{qs(0xba36d6a6)}
	z = 110
	create_menu_backdrop \{texture = online_background}
	createscreenelement \{type = containerelement
		parent = root_window
		id = private_menu_container
		pos = (0.0, 0.0)
		event_handlers = [
			{
				focus
				retail_menu_focus
			}
			{
				unfocus
				retail_menu_unfocus
			}
			{
				pad_choose
				executejoinattempt
			}
			{
				pad_back
				ui_flow_manager_respond_to_action
				params = {
					action = back
				}
			}
		]}
	netsessionfunc \{func = initializeloginfields
		params = {
			loginmode = matchusername
		}}
	displaysprite \{parent = private_menu_container
		tex = dialog_title_bg
		dims = (300.0, 250.0)
		z = 9
		pos = (640.0, 50.0)
		just = [
			right
			top
		]
		flip_v}
	displaysprite \{parent = private_menu_container
		tex = dialog_title_bg
		dims = (300.0, 250.0)
		z = 9
		pos = (640.0, 50.0)
		just = [
			left
			top
		]}
	createscreenelement \{type = textelement
		parent = private_menu_container
		font = fontgrid_title_a1
		scale = 1.0
		rgba = [
			223
			223
			223
			250
		]
		text = qs(0x1e444acc)
		just = [
			center
			top
		]
		z_priority = 10.0
		pos = (640.0, 145.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	fit_text_in_rectangle id = <id> dims = (400.0, 75.0) pos = (640.0, 145.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center
	createscreenelement \{type = textelement
		parent = private_menu_container
		font = 0x5f855b0b
		scale = 1.0
		rgba = [
			180
			180
			180
			255
		]
		text = qs(0x488b8986)
		just = [
			center
			top
		]
		z_priority = 10.0
		pos = (640.0, 590.0)
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	fit_text_in_rectangle id = <id> dims = (600.0, 25.0) pos = (640.0, 590.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center keep_ar = 1
	<pos> = (375.0, 320.0)
	create_winport_login_field container = private_menu_container pos = <pos> label = qs(0x3be57438) labelid = usernamelabelid prefixid = usernameprefixid cursorid = usernamecursorid suffixid = usernamesuffixid ang = -2.0
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	launchevent \{type = focus
		target = private_menu_container}
	begin
	update_winport_login_field \{field = matchusername
		labelid = usernamelabelid
		prefixid = usernameprefixid
		cursorid = usernamecursorid
		suffixid = usernamesuffixid}
	wait \{1
		frame}
	if NOT (screenelementexists id = private_menu_container)
		return
	endif
	netsessionfunc \{func = getloginentry}
	if ((<loginentry> = loginaccepted) || (<loginentry> = loginaborted))
		break
	endif
	repeat
	switch <loginentry>
		case loginaccepted
		executejoinattempt
		case loginaborted
		ui_flow_manager_respond_to_action \{action = back}
	endswitch
endscript

script executejoinattempt 
	netsessionfunc \{func = generateprivatematchid}
	change gprivatematchid = <privatematchid>
	ui_flow_manager_respond_to_action \{action = attempt_join}
endscript

script destroy_join_private_menu 
	netsessionfunc \{func = destroyloginfields}
	destroyscreenelement \{id = private_menu_container}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script 0xe613141d 
	printf \{'--- ui_create_logout_submenu'}
	create_logout_submenu params = <...>
endscript

script 0x5a50ea25 
	destroy_logout_submenu params = <...>
endscript

script create_logout_submenu 
	printf \{qs(0xfba89727)}
	create_popup_warning_menu \{textblock = {
			title = qs(0x5ee56993)
			text = qs(0xdad8f88c)
			dims = (800.0, 400.0)
			scale = 0.5
		}
		menu_pos = (640.0, 480.0)
		dialog_dims = (600.0, 80.0)
		options = [
			{
				func = executelogout
				text = qs(0x5ee56993)
			}
			{
				func = 0xb7080153
				text = qs(0x7979158a)
			}
		]}
endscript

script destroy_logout_submenu 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script executelogout 
	netsessionfunc \{func = resetnetwork}
	wait \{1.0
		second}
	destroy_logout_submenu
	ui_event_block \{event = menu_replace
		data = {
			state = uistate_mainmenu
			base_name = 'mainmenu'
			selected_index = 3
			clear_previous_stack
		}}
endscript

script create_account_submenu \{menu_title = qs(0xf66be5f9)
		menu_id = online_account_menu
		vmenu_id = online_account_vmenu}
	change \{online_main_menu_pos = (640.0, 110.0)}
	createscreenelement \{type = containerelement
		parent = root_window
		id = account_submenu_anchor
		pos = (0.0, 0.0)}
	createscreenelement {
		type = vscrollingmenu
		parent = account_submenu_anchor
		id = <menu_id>
		just = [center top]
		dims = (400.0, 480.0)
		pos = (($online_main_menu_pos) + (0.0, 75.0))
		z_priority = 1
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (47.5, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = back}}
			{pad_back generic_menu_pad_back}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	createscreenelement \{type = containerelement
		parent = account_submenu_anchor
		id = online_account_submenu_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = containerelement
		parent = online_account_submenu_container
		id = online_account_submenu_text_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = containerelement
		parent = account_submenu_anchor
		id = online_info_pane_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = online_background}
	displaysprite id = online_frame parent = online_account_submenu_container tex = online_frame_large pos = ($online_main_menu_pos) dims = (660.0, 480.0) just = [center top] z = 2
	displaysprite id = online_frame_crown parent = online_account_submenu_container tex = online_frame_crown pos = (($online_main_menu_pos) + (0.0, -62.0)) dims = (256.0, 105.0) just = [center top] z = 3
	createscreenelement {
		type = textelement
		parent = online_account_submenu_text_container
		id = online_title
		font = fontgrid_title_a1
		scale = 0.85
		rgba = ($online_dark_purple)
		pos = (($online_main_menu_pos) + (0.0, 35.0))
		text = <menu_title>
		just = [center top]
		z_priority = 4.0
	}
	getscreenelementdims id = <id>
	if (<width> > 420)
		setscreenelementprops {
			id = <id>
			scale = 1.0
		}
		scale_element_to_size {
			id = <id>
			target_width = 420
			target_height = <height>
		}
	endif
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = qs(0x3c3f3a27)
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_logout}
		line_spacing = 50
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = qs(0x95ad3a57)
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_change_password}
		line_spacing = 50
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = qs(0x16fd5b13)
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_delete_account}
		line_spacing = 50
	}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	create_online_main_menu_helper_buttons
	launchevent type = focus target = <vmenu_id>
endscript

script destroy_account_submenu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if screenelementexists \{id = account_submenu_anchor}
		destroyscreenelement \{id = account_submenu_anchor}
	endif
endscript
