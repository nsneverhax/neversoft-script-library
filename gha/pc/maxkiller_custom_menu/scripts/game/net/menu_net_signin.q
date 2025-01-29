logintextcolor = [
	255
	200
	0
	255
]
gprivatematchid = 0

script create_winport_connection_status_screen 
	printf \{"--- create_winport_connection_status_screen"}
	create_menu_backdrop \{texture = online_background}
	z = 110
	createscreenelement \{type = containerelement
		parent = root_window
		id = connectionstatuscontainer
		pos = (0.0, 0.0)}
	createscreenelement \{type = vscrollingmenu
		parent = connectionstatuscontainer
		just = [
			center
			top
		]
		dims = (500.0, 150.0)
		pos = (640.0, 465.0)
		z_priority = 1}
	menu_id = <id>
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		pos = (298.0, 0.0)
		just = [center top]
		internal_just = [center top]
		dims = (500.0, 150.0)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back cancel_winport_connection_status_screen}
		]
	}
	vmenu_id = <id>
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
	create_pause_menu_frame \{parent = connectionstatuscontainer
		z = 5}
	displaysprite \{parent = connectionstatuscontainer
		tex = dialog_title_bg
		dims = (224.0, 224.0)
		z = 9
		pos = (640.0, 100.0)
		just = [
			right
			top
		]
		flip_v}
	displaysprite \{parent = connectionstatuscontainer
		tex = dialog_title_bg
		dims = (224.0, 224.0)
		z = 9
		pos = (640.0, 100.0)
		just = [
			left
			top
		]}
	createscreenelement \{type = textelement
		parent = connectionstatuscontainer
		font = fontgrid_title_gh3
		scale = 1.2
		rgba = [
			223
			223
			223
			250
		]
		text = "Online"
		just = [
			center
			top
		]
		z_priority = 10.0
		pos = (640.0, 182.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	createscreenelement {
		type = textblockelement
		parent = connectionstatuscontainer
		id = statusmessage
		font = text_a4
		scale = 0.8
		rgba = [210 210 210 250]
		just = [center top]
		internal_just = [center top]
		internal_scale = <scale>
		z_priority = <z>
		pos = (640.0, 310.0)
		dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	if NOT (netsessionfunc func = isconnected)
		add_user_control_helper \{text = "CANCEL"
			button = red
			z = 100}
		launchevent type = focus target = <vmenu_id>
		netsessionfunc \{func = onlinesignin}
		begin
		netsessionfunc \{func = getnetworkstatus}
		switch (<currentnetworktask>)
			case "START_NETWORK"
			switch (<currentnetworkstatus>)
				case "PENDING"
				statustext = "Initializing Online Services"
				case "DONE"
				statustext = "Online Services Ready"
				case "FAILED"
				statustext = "Unable to Initialize Online Services"
				success = false
				default
				statustext = "Internal Error: Unexpected Network State!"
				success = false
			endswitch
			case "CHECK_DNS"
			switch (<currentnetworkstatus>)
				case "PENDING"
				statustext = "Locating Game Servers"
				case "DONE"
				statustext = "Game Servers Located"
				success = true
				case "FAILED"
				statustext = "Unable to locate Game Servers"
				success = false
				default
				statustext = "Internal Error: Unexpected Network State!"
				success = false
			endswitch
			default
			statustext = "Internal Error: Unexpected Network State!"
			success = false
		endswitch
		setscreenelementprops id = statusmessage text = <statustext>
		fit_text_into_menu_item \{id = statusmessage
			max_width = 480}
		if gotparam \{success}
			clean_up_user_control_helpers
			if (<success> = false)
				add_user_control_helper \{text = "BACK"
					button = red
					z = 100}
				return
			endif
			break
		endif
		wait \{1
			frame}
		if NOT (screenelementexists id = connectionstatuscontainer)
			return
		endif
		repeat
	endif
	if NOT (netsessionfunc func = hasexistinglogin)
		destroyscreenelement \{id = connectionstatuscontainer}
		clean_up_user_control_helpers
		create_popup_warning_menu \{textblock = {
				text = "Existing Login Not Found.\\nDo you want to Create a New Account or Use an Existing Account?"
				dims = (700.0, 320.0)
				scale = 0.6
			}
			no_background
			menu_pos = (640.0, 465.0)
			dialog_dims = (600.0, 80.0)
			helper_pills = [
				back
				select
				updown
			]
			pad_back_script = cancel_winport_connection_status_screen
			options = [
				{
					func = start_winport_account_create_screen
					text = "NEW ACCOUNT"
					scale = 0.9
				}
				{
					func = start_winport_account_login_screen
					text = "EXISTING ACCOUNT"
					scale = 0.9
				}
			]}
		return
	endif
	if NOT (netsessionfunc func = isloggedin)
		ui_flow_manager_respond_to_action \{action = account_login}
	endif
	ui_flow_manager_respond_to_action \{action = goto_online_menu}
endscript

script destroy_winport_connection_status_screen 
	destroy_popup_warning_menu
	if screenelementexists \{id = connectionstatuscontainer}
		destroyscreenelement \{id = connectionstatuscontainer}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script cancel_winport_connection_status_screen 
	netsessionfunc \{func = resetnetwork}
	ui_flow_manager_respond_to_action \{action = back}
endscript

script create_winport_account_create_screen 
	create_winport_account_management_screen \{mode = createaccount
		title = "Account Creation"
		container = accountcreatecontainer}
endscript

script destroy_winport_account_create_screen 
	destroy_winport_account_management_screen \{container = accountcreatecontainer}
endscript

script start_winport_account_create_screen 
	ui_flow_manager_respond_to_action \{action = account_create}
endscript

script create_winport_account_login_screen 
	netsessionfunc \{func = getautologinsetting}
	if (<autologinsetting> = autologinon && netsessionfunc func = hasexistinglogin)
		netsessionfunc \{func = initializeloginfields
			params = {
				loginmode = loginaccount
			}}
		ui_flow_manager_respond_to_action \{action = executelogin}
	else
		create_winport_account_management_screen \{mode = loginaccount
			title = "Account Login"
			container = accountlogincontainer
			yellowbuttontext = "CHANGE PASSWORD"
			yellowbuttonaction = start_winport_account_change_screen
			bluebuttontext = "NEW ACCOUNT"
			bluebuttonaction = start_winport_account_create_screen}
	endif
endscript

script destroy_winport_account_login_screen 
	destroy_winport_account_management_screen \{container = accountlogincontainer}
endscript

script start_winport_account_login_screen 
	ui_flow_manager_respond_to_action \{action = account_login}
endscript

script create_winport_account_change_screen 
	create_winport_account_management_screen \{mode = changeaccount
		title = "Change Password"
		container = accountchangecontainer
		yellowbuttontext = "RESET PASSWORD"
		yellowbuttonaction = start_winport_account_reset_screen}
endscript

script destroy_winport_account_change_screen 
	destroy_winport_account_management_screen \{container = accountchangecontainer}
endscript

script start_winport_account_change_screen 
	ui_flow_manager_respond_to_action \{action = account_change}
endscript

script create_winport_account_reset_screen 
	create_winport_account_management_screen \{mode = resetaccount
		title = "Reset Password"
		container = accountresetcontainer
		yellowbuttontext = "DELETE ACCOUNT"
		yellowbuttonaction = start_winport_account_delete_screen}
endscript

script destroy_winport_account_reset_screen 
	destroy_winport_account_management_screen \{container = accountresetcontainer}
endscript

script start_winport_account_reset_screen 
	ui_flow_manager_respond_to_action \{action = account_reset}
endscript

script create_winport_account_delete_screen 
	create_winport_account_management_screen \{mode = deleteaccount
		title = "Delete Account"
		container = accountdeletecontainer}
endscript

script destroy_winport_account_delete_screen 
	destroy_winport_account_management_screen \{container = accountdeletecontainer}
endscript

script start_winport_account_delete_screen 
	ui_flow_manager_respond_to_action \{action = account_delete}
endscript

script create_change_password_submenu 
	create_winport_account_management_screen \{mode = changeaccount
		title = "Change Password"
		container = accountchangecontainer
		yellowbuttonaction = winport_null_action}
endscript

script destroy_change_password_submenu 
	destroy_winport_account_management_screen \{container = accountchangecontainer}
endscript

script create_account_delete_submenu 
	create_winport_account_management_screen \{mode = deleteaccount
		title = "Delete Account"
		container = accountdeletesubmenucontainer
		yellowbuttonaction = winport_null_action}
endscript

script destroy_account_delete_submenu 
	destroy_winport_account_management_screen \{container = accountdeletesubmenucontainer}
endscript

script winport_null_action 
endscript

script create_winport_account_management_screen 
	printf \{"--- create_winport_account_management_screen"}
	z = 110
	create_menu_backdrop \{texture = online_background}
	if ((gotparam yellowbuttonaction) && (gotparam bluebuttonaction))
		handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = executelogin}}
			{pad_option2 <yellowbuttonaction>}
			{pad_option <bluebuttonaction>}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	elseif (gotparam yellowbuttonaction)
		handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = executelogin}}
			{pad_option2 <yellowbuttonaction>}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	elseif (gotparam bluebuttonaction)
		handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = executelogin}}
			{pad_option <bluebuttonaction>}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	else
		handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = executelogin}}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = <container>
		pos = (0.0, 0.0)
		event_handlers = <handlers>
	}
	netsessionfunc func = initializeloginfields params = {loginmode = <mode>}
	displaysprite parent = <container> tex = dialog_title_bg dims = (300.0, 230.0) z = 9 pos = (640.0, 40.0) just = [right top] flip_v
	displaysprite parent = <container> tex = dialog_title_bg dims = (300.0, 230.0) z = 9 pos = (640.0, 40.0) just = [left top]
	createscreenelement {
		type = textelement
		parent = <container>
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = [223 223 223 250]
		text = <title>
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 125.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_in_rectangle id = <id> dims = (400.0, 75.0) pos = (640.0, 125.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center
	createscreenelement {
		type = textelement
		parent = <container>
		id = capslockfield
		font = text_a4
		scale = 0.6
		rgba = [255 0 0 255]
		text = "(Caps Lock Is On)"
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 530.0)
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textelement
		parent = <container>
		font = text_a4
		scale = 0.6
		rgba = [180 180 180 255]
		text = "Game Experience May Change During Online Play"
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 560.0)
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textelement
		parent = <container>
		font = text_a4
		scale = 1.0
		rgba = [180 180 180 255]
		text = "*Please use the keyboard to enter all account information*"
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 595.0)
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_in_rectangle id = <id> dims = (600.0, 25.0) pos = (640.0, 595.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center keep_ar = 1
	<pos> = (375.0, 290.0)
	create_winport_login_field container = <container> pos = <pos> label = "Username: " labelid = usernamelabelid prefixid = usernameprefixid cursorid = usernamecursorid suffixid = usernamesuffixid ang = -2.0
	getscreenelementdims \{id = usernamelabelid}
	lineheight = (<height> + 8)
	if (<mode> = loginaccount || <mode> = deleteaccount || <mode> = changeaccount)
		pos = (<pos> + ((0.0, 1.0) * <lineheight>))
		create_winport_login_field container = <container> pos = <pos> label = "Password: " labelid = passwordlabelid prefixid = passwordprefixid cursorid = passwordcursorid suffixid = passwordsuffixid ang = 0.2
	endif
	if (<mode> = createaccount || <mode> = changeaccount || <mode> = resetaccount)
		pos = (<pos> + ((0.0, 1.0) * <lineheight>))
		create_winport_login_field container = <container> pos = <pos> label = "New Password: " labelid = newpassword1labelid prefixid = newpassword1prefixid cursorid = newpassword1cursorid suffixid = newpassword1suffixid ang = -0.6
		pos = (<pos> + ((0.0, 1.0) * <lineheight>))
		create_winport_login_field container = <container> pos = <pos> label = "Repeat New Password: " labelid = newpassword2labelid prefixid = newpassword2prefixid cursorid = newpassword2cursorid suffixid = newpassword2suffixid ang = 0.5
	endif
	if (<mode> = createaccount || <mode> = resetaccount)
		pos = (<pos> + ((0.0, 1.0) * <lineheight>))
		create_winport_login_field container = <container> pos = <pos> label = "License: " labelid = licenselabelid prefixid = licenseprefixid cursorid = licensecursorid suffixid = licensesuffixid ang = 1.5
	endif
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
	add_user_control_helper \{text = "ACCEPT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	if gotparam \{yellowbuttontext}
		add_user_control_helper text = <yellowbuttontext> button = yellow z = 100
	endif
	if gotparam \{bluebuttontext}
		add_user_control_helper text = <bluebuttontext> button = blue z = 100
	endif
	launchevent type = focus target = <container>
	begin
	if (iscapslockon)
		setscreenelementprops \{id = capslockfield
			alpha = 1.0}
	else
		setscreenelementprops \{id = capslockfield
			alpha = 0.0}
	endif
	update_winport_login_field \{field = username
		labelid = usernamelabelid
		prefixid = usernameprefixid
		cursorid = usernamecursorid
		suffixid = usernamesuffixid}
	update_winport_login_field \{field = password
		labelid = passwordlabelid
		prefixid = passwordprefixid
		cursorid = passwordcursorid
		suffixid = passwordsuffixid}
	update_winport_login_field \{field = newpassword1
		labelid = newpassword1labelid
		prefixid = newpassword1prefixid
		cursorid = newpassword1cursorid
		suffixid = newpassword1suffixid}
	update_winport_login_field \{field = newpassword2
		labelid = newpassword2labelid
		prefixid = newpassword2prefixid
		cursorid = newpassword2cursorid
		suffixid = newpassword2suffixid}
	update_winport_login_field \{field = license
		labelid = licenselabelid
		prefixid = licenseprefixid
		cursorid = licensecursorid
		suffixid = licensesuffixid}
	wait \{1
		frame}
	if NOT (screenelementexists id = <container>)
		return
	endif
	netsessionfunc \{func = getloginentry}
	if (<loginentry> = loginaccepted)
		break
	endif
	if (<loginentry> = loginaborted)
		break
	endif
	if ((gotparam yellowbuttonaction) && (<loginentry> = loginoption1))
		printf \{"Got yellowButtonAction button"}
		break
	endif
	if ((gotparam bluebuttonaction) && (<loginentry> = loginoption2))
		printf \{"Got blueButtonAction button"}
		break
	endif
	repeat
	switch <loginentry>
		case loginaccepted
		ui_flow_manager_respond_to_action \{action = executelogin}
		case loginoption1
		printf \{"Executing option 1"}
		ui_flow_manager_respond_to_action \{action = executeoption1}
		case loginoption2
		printf \{"Executing option 2"}
		ui_flow_manager_respond_to_action \{action = executeoption2}
		case loginaborted
		cancel_winport_account_management_screen mode = <mode>
	endswitch
endscript

script destroy_winport_account_management_screen 
	netsessionfunc \{func = destroyloginfields}
	if (screenelementexists id = <container>)
		destroyscreenelement id = <container>
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script cancel_winport_account_management_screen 
	if (<mode> = loginaccount)
		if (netsessionfunc func = hasexistinglogin)
			ui_flow_manager_respond_to_action \{action = back_to_main}
		else
			ui_flow_manager_respond_to_action \{action = back_to_connection_status}
		endif
	else
		ui_flow_manager_respond_to_action \{action = back}
	endif
endscript

script create_winport_login_field 
	createscreenelement {
		type = containerelement
		parent = <container>
		rot_angle = <ang>
	}
	rotcontainer = <id>
	createscreenelement {
		type = textelement
		parent = <rotcontainer>
		id = <labelid>
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = $logintextcolor
		text = <label>
		just = [left top]
		z_priority = 10.0
		pos = <pos>
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textelement
		parent = <rotcontainer>
		id = <prefixid>
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = $logintextcolor
		text = ""
		just = [left top]
		z_priority = 10.0
		pos = (300.0, 300.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textelement
		parent = <rotcontainer>
		id = <cursorid>
		font = fontgrid_title_gh3
		scale = (0.5, 0.8)
		rgba = $logintextcolor
		text = "I"
		just = [left top]
		z_priority = 10.0
		pos = (400.0, 300.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textelement
		parent = <rotcontainer>
		id = <suffixid>
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = $logintextcolor
		text = ""
		just = [left top]
		z_priority = 10.0
		pos = (500.0, 300.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	runscriptonscreenelement id = <cursorid> winport_cursor_blinker params = {blinkid = <cursorid>}
endscript

script update_winport_login_field 
	if NOT (screenelementexists id = <labelid>)
		return
	endif
	netsessionfunc func = getloginfield params = {field = <field>}
	if (<active> = 1)
		setscreenelementprops id = <prefixid> text = <prefix>
		setscreenelementprops id = <cursorid> text = "I"
		setscreenelementprops id = <suffixid> text = <suffix>
	else
		setscreenelementprops id = <prefixid> text = <prefix>
		setscreenelementprops id = <cursorid> text = ""
		setscreenelementprops id = <suffixid> text = ""
	endif
	getscreenelementdims id = <labelid>
	getscreenelementposition id = <labelid>
	pos = (<screenelementpos> + ((1.0, 0.0) * <width>))
	setscreenelementprops id = <prefixid> pos = <pos>
	getscreenelementposition id = <prefixid>
	getscreenelementdims id = <prefixid>
	pos = (<screenelementpos> + ((1.0, 0.0) * <width>))
	setscreenelementprops id = <cursorid> pos = <pos>
	getscreenelementposition id = <cursorid>
	getscreenelementdims id = <cursorid>
	pos = (<screenelementpos> + ((1.0, 0.0) * <width>))
	setscreenelementprops id = <suffixid> pos = <pos>
endscript

script winport_cursor_blinker 
	begin
	if NOT (screenelementexists id = <blinkid>)
		return
	endif
	doscreenelementmorph id = <blinkid> alpha = 0 time = 0.5
	wait \{0.5
		seconds}
	if NOT (screenelementexists id = <blinkid>)
		return
	endif
	doscreenelementmorph id = <blinkid> alpha = 1.0 time = 0.5
	wait \{0.5
		seconds}
	repeat
endscript

script create_winport_account_create_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_create_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_login_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_login_status_screen 
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

script create_winport_account_management_status_screen 
	printf \{"--- create_winport_account_management_status_screen"}
	create_menu_backdrop \{texture = online_background}
	z = 110
	createscreenelement \{type = containerelement
		parent = root_window
		id = accountstatuscontainer
		pos = (0.0, 0.0)}
	createscreenelement \{type = vscrollingmenu
		parent = accountstatuscontainer
		just = [
			center
			top
		]
		dims = (500.0, 150.0)
		pos = (640.0, 465.0)
		z_priority = 1}
	menu_id = <id>
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (298.0, 0.0)
		just = [center top]
		internal_just = [center top]
		dims = (500.0, 150.0)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	vmenu_id = <id>
	change \{menu_focus_color = [
			180
			50
			50
			255
		]}
	change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	create_pause_menu_frame \{parent = accountstatuscontainer
		z = 5}
	displaysprite \{parent = accountstatuscontainer
		tex = dialog_title_bg
		dims = (224.0, 224.0)
		z = 9
		pos = (640.0, 100.0)
		just = [
			right
			top
		]
		flip_v}
	displaysprite \{parent = accountstatuscontainer
		tex = dialog_title_bg
		dims = (224.0, 224.0)
		z = 9
		pos = (640.0, 100.0)
		just = [
			left
			top
		]}
	createscreenelement \{type = textelement
		parent = accountstatuscontainer
		font = fontgrid_title_gh3
		scale = 1.2
		rgba = [
			223
			223
			223
			250
		]
		text = "Online"
		just = [
			center
			top
		]
		z_priority = 10.0
		pos = (640.0, 182.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	createscreenelement {
		type = textblockelement
		parent = accountstatuscontainer
		id = statusmessage
		font = text_a4
		scale = 0.8
		rgba = [210 210 210 250]
		just = [center top]
		internal_just = [center top]
		internal_scale = <scale>
		z_priority = <z>
		pos = (640.0, 310.0)
		dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	launchevent type = focus target = <vmenu_id>
	netsessionfunc \{func = executelogintask}
	begin
	netsessionfunc \{func = getnetworkstatus}
	switch (<currentnetworktask>)
		case "CREATE_ACCOUNT"
		switch (<currentnetworkstatus>)
			case "PENDING"
			statustext = "Requesting Account Creation"
			case "DONE"
			statustext = "Account Created"
			success = true
			case "FAILED"
			statustext = "Unable to Create Account"
			success = false
			default
			statustext = "Internal Error: Unexpected Network State!"
			success = false
		endswitch
		case "LOGIN_ACCOUNT"
		switch (<currentnetworkstatus>)
			case "PENDING"
			statustext = "Authorizing Account"
			case "DONE"
			statustext = "Account Authorized"
			success = true
			case "FAILED"
			statustext = "Unable to Authorize Account"
			success = false
			default
			statustext = "Internal Error: Unexpected Network State!"
			success = false
		endswitch
		case "CHANGE_ACCOUNT"
		switch (<currentnetworkstatus>)
			case "PENDING"
			statustext = "Requesting Password Change"
			case "DONE"
			statustext = "Password Changed"
			success = true
			case "FAILED"
			statustext = "Unable to Change Password"
			success = false
			default
			statustext = "Internal Error: Unexpected Network State!"
			success = false
		endswitch
		case "RESET_ACCOUNT"
		switch (<currentnetworkstatus>)
			case "PENDING"
			statustext = "Requesting Account Reset"
			case "DONE"
			statustext = "Account Password Reset"
			success = true
			case "FAILED"
			statustext = "Unable to Reset Account"
			success = false
			default
			statustext = "Internal Error: Unexpected Network State!"
			success = false
		endswitch
		case "DELETE_ACCOUNT"
		switch (<currentnetworkstatus>)
			case "PENDING"
			statustext = "Requesting Account Deletion"
			case "DONE"
			statustext = "Account Deleted"
			success = true
			case "FAILED"
			statustext = "Unable to Delete Account"
			success = false
			default
			statustext = "Internal Error: Unexpected Network State!"
			success = false
		endswitch
		default
		printf "Unexpected state = %s" s = <currentnetworktask>
		statustext = "Internal Error: Unexpected Network State!"
		success = false
	endswitch
	setscreenelementprops id = statusmessage text = <statustext>
	fit_text_into_menu_item \{id = statusmessage
		max_width = 480}
	if gotparam \{success}
		break
	endif
	wait \{1
		frame}
	if NOT (screenelementexists id = accountstatuscontainer)
		return
	endif
	repeat
	if (<success> = false)
		netsessionfunc \{func = getautologinsetting}
		if (<autologinsetting> = autologinon && netsessionfunc func = hasexistinglogin)
			netsessionfunc \{func = setautologinsetting
				params = {
					autologinsetting = autologinprompt
				}}
		endif
		netsessionfunc \{func = getfailurecode}
		switch <failurecode>
			case 666
			statustext = "New password fields do not match"
			case 667
			statustext = "Authorization Service failed"
			case 668
			statustext = "Usernames must be between 6 and 16 characters long"
			case 669
			statustext = "Passwords must be between 6 and 16 characters long"
			case 700
			statustext = "Task Succeeded"
			case 701
			statustext = "Bad Authorization Request"
			case 702
			statustext = "Server Configuration Error"
			case 703
			statustext = "Invalid Game Title Id"
			case 704
			statustext = "Invalid Account Information"
			case 705
			statustext = "Illegal Authorization Request"
			case 706
			statustext = "Invalid License Code"
			case 707
			statustext = "Username Already Exists"
			case 708
			statustext = "Invalid Username Format"
			case 709
			statustext = "Username Declined"
			case 710
			statustext = "Too Many Accounts for License Code"
			case 711
			statustext = "Account Migration not Supported"
			case 712
			statustext = "Title has been disabled"
			case 713
			statustext = "Account has Expired"
			case 714
			statustext = "Account is Locked"
			case 715
			statustext = "Authentication Error: Online functions will not be available until Guitar Hero: Aerosmith is quit and relaunched."
			case 716
			statustext = "Incorrect Password"
		endswitch
		setscreenelementprops id = statusmessage text = <statustext>
		fit_text_into_menu_item \{id = statusmessage
			max_width = 480}
		displaysprite \{parent = accountstatuscontainer
			id = options_bg_1
			tex = dialog_bg
			pos = (640.0, 500.0)
			dims = (320.0, 64.0)
			z = 9
			just = [
				center
				botom
			]}
		displaysprite \{parent = accountstatuscontainer
			id = options_bg_2
			tex = dialog_bg
			pos = (640.0, 530.0)
			dims = (320.0, 64.0)
			z = 9
			just = [
				center
				top
			]
			flip_h}
		createscreenelement {
			type = containerelement
			parent = <vmenu_id>
			dims = (100.0, 50.0)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = erroraction}}
				{pad_back ui_flow_manager_respond_to_action params = {action = erroraction}}
			]
		}
		container_id = <id>
		createscreenelement {
			type = textelement
			parent = <container_id>
			local_id = text
			font = fontgrid_title_gh3
			scale = 0.85
			rgba = ($menu_unfocus_color)
			text = "TRY AGAIN"
			just = [center top]
			z_priority = (<z> + 0.1)
		}
		fit_text_into_menu_item id = <id> max_width = 480
		getscreenelementdims id = <id>
		createscreenelement {
			type = spriteelement
			parent = <container_id>
			local_id = bookend_left
			texture = dialog_highlight
			alpha = 0.0
			just = [right center]
			pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
			z_priority = (<z> + 0.1)
			scale = (1.0, 1.0)
			flip_v
		}
		createscreenelement {
			type = spriteelement
			parent = <container_id>
			local_id = bookend_right
			texture = dialog_highlight
			alpha = 0.0
			just = [left center]
			pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
			z_priority = (<z> + 0.1)
			scale = (1.0, 1.0)
		}
		clean_up_user_control_helpers
		add_user_control_helper \{text = "SELECT"
			button = green
			z = 100}
		add_user_control_helper \{text = "BACK"
			button = red
			z = 100}
		launchevent type = focus target = <vmenu_id>
		return
	endif
	wait \{3
		seconds}
	ui_flow_manager_respond_to_action \{action = successaction}
	netsessionfunc \{func = stats_init}
endscript

script destroy_winport_account_management_status_screen 
	if (screenelementexists id = accountstatuscontainer)
		destroyscreenelement \{id = accountstatuscontainer}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_join_private_menu 
	printf \{"--- create_join_private_menu"}
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
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = [
			223
			223
			223
			250
		]
		text = "Join Private Match"
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
		font = text_a4
		scale = 1.0
		rgba = [
			180
			180
			180
			255
		]
		text = "*Please use the keyboard to enter the Username of the match to join*"
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
	create_winport_login_field container = private_menu_container pos = <pos> label = "Match Username: " labelid = usernamelabelid prefixid = usernameprefixid cursorid = usernamecursorid suffixid = usernamesuffixid ang = -2.0
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
	add_user_control_helper \{text = "ACCEPT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
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

script create_logout_submenu 
	printf \{"--- create_logout_submenu"}
	create_popup_warning_menu \{textblock = {
			title = "LOG OUT"
			text = "Selecting Logout will end your current Online session.  Your scores will not be tracked in the leaderboard until you login again."
			dims = (800.0, 400.0)
			scale = 0.5
		}
		menu_pos = (640.0, 480.0)
		dialog_dims = (600.0, 80.0)
		options = [
			{
				func = executelogout
				text = "LOG OUT"
			}
			{
				func = {
					ui_flow_manager_respond_to_action
					params = {
						action = back
					}
				}
				text = "STAY ONLINE"
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
	start_flow_manager \{flow_state = main_menu_fs}
endscript

script create_account_submenu \{menu_title = "ACCOUNT MANAGEMENT"
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
		font = fontgrid_title_gh3
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
		text = "Log Out"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_logout}
		line_spacing = 50
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "Change Password"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_change_password}
		line_spacing = 50
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "Delete Account"
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
