0xe1d01ead = 0
0x8bcedbb2 = 0
0xd88c332b = 1
0x8c754d49 = 0

script 0x2b4e0bb2 
	printf \{'---- ui_create_boot_winlogin'}
	spawnscriptnow \{create_winport_connection_status_screen}
endscript

script 0xcae121e1 
endscript

script 0x568055fb 
	printstruct <...>
	if gotparam \{boot}
		printf \{'Got boot!'}
		0x455c0726 = [
			{
				func = startup_go_online
				text = qs(0x5f9d3025)
			}
			{
				func = 0x9bef89a6
				text = qs(0xe15047d5)
			}
		]
	else
		printf \{'No boot!'}
		0x455c0726 = [
			{
				func = startup_go_online
				text = qs(0x5f9d3025)
			}
			{
				func = startup_stay_offline
				text = qs(0xe15047d5)
			}
		]
	endif
	create_popup_warning_menu {
		textblock = {
			text = qs(0x80eed3be)
			dims = (800.0, 400.0)
			scale = 0.5
		}
		textelement = {
			text = qs(0xec98ed19)
			pos = (640.0, 465.0)
			scale = 0.6
		}
		menu_pos = (640.0, 480.0)
		dialog_dims = (600.0, 80.0)
		options = <0x455c0726>
	}
endscript

script 0x642f9613 
	printf \{'test spawn...'}
	wait \{120
		frame}
	0x32d51770 params = <...>
endscript

script 0x9bc41505 
	printf \{'--- ui_destroy_network_prompt_menu'}
	destroy_popup_warning_menu
endscript

script startup_go_online 
	ui_event_wait \{event = menu_replace
		state = 0xf0870437}
endscript

script 0x9bef89a6 
	printf \{'--- startup_stay_offline_boot'}
	0x32d51770 params = <...>
endscript

script startup_stay_offline 
	printf \{'--- startup_stay_offline'}
	change \{0xe1d01ead = 0}
	change \{0x8bcedbb2 = 0}
	0xd2607695
endscript

script 0xd2607695 
	ui_event_block \{event = menu_replace
		data = {
			state = uistate_mainmenu
			base_name = 'mainmenu'
			selected_index = 3
			clear_previous_stack
		}}
endscript

script 0x0736ab95 
	ui_event_block \{event = menu_replace
		data = {
			state = uistate_options
		}}
endscript

script 0xe6c19b1a 
	printf \{qs(0xc2b9aa40)}
	ui_event_block \{event = menu_replace
		data = {
			state = uistate_mainmenu
			base_name = 'mainmenu'
			selected_index = 3
			clear_previous_stack
		}}
endscript

script 0x2a4a5c4a 
	printf \{'--- ui_create_winport_connection_status_screen'}
	create_menu_backdrop \{texture = xb_online_bg}
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
	createscreenelement \{type = spriteelement
		parent = connectionstatuscontainer
		texture = online_dialog_bg
		dims = (640.0, 500.0)
		pos = (640.0, 80.0)
		just = [
			center
			top
		]
		z_priority = 9
		alpha = 1.0}
	createscreenelement \{type = textelement
		parent = connectionstatuscontainer
		font = fontgrid_text_a6
		scale = 0.8
		rgba = [
			223
			223
			223
			250
		]
		text = qs(0x623fd166)
		just = [
			center
			top
		]
		z_priority = 10.0
		pos = (640.0, 132.0)
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
		font = fontgrid_text_a3
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
	createscreenelement \{type = spriteelement
		parent = connectionstatuscontainer
		texture = online_load_wheel_bg
		pos = (930.0, 500.0)
		dims = (140.0, 140.0)
		just = [
			center
			center
		]
		z_priority = 520}
	createscreenelement \{type = spriteelement
		parent = connectionstatuscontainer
		texture = online_load_wheel
		pos = (930.0, 500.0)
		dims = (140.0, 140.0)
		just = [
			center
			center
		]
		z_priority = 521}
	spawnscriptlater 0x731c0392 params = {id = <id>}
	spawnscriptlater 0xbf6b67e8 params = <...>
endscript

script 0xbf6b67e8 
	if NOT (netsessionfunc func = isconnected)
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100}
		launchevent type = focus target = <vmenu_id>
		netsessionfunc \{func = onlinesignin}
		begin
		netsessionfunc \{func = getnetworkstatus}
		switch (<currentnetworktask>)
			case 'START_NETWORK'
			switch (<currentnetworkstatus>)
				case 'PENDING'
				statustext = qs(0xbaa8e5d2)
				case 'DONE'
				statustext = qs(0xa657fa11)
				case 'FAILED'
				statustext = qs(0x5bd88430)
				success = false
				default
				statustext = qs(0xc8d1230a)
				success = false
			endswitch
			case 'CHECK_DNS'
			switch (<currentnetworkstatus>)
				case 'PENDING'
				statustext = qs(0x17a86116)
				case 'DONE'
				statustext = qs(0x88acd6d0)
				success = true
				case 'FAILED'
				statustext = qs(0x8692c11a)
				success = false
				default
				statustext = qs(0xc8d1230a)
				success = false
			endswitch
			default
			statustext = qs(0x0f7197e3)
			0x5cfd1740 = true
		endswitch
		setscreenelementprops id = statusmessage text = <statustext>
		fit_text_into_menu_item \{id = statusmessage
			max_width = 480}
		if gotparam \{success}
			killspawnedscript \{name = 0x731c0392}
			clean_up_user_control_helpers
			if (<success> = false)
				add_user_control_helper \{text = qs(0xaf4d5dd2)
					button = red
					z = 100}
				return
			endif
			break
		elseif gotparam \{0x5cfd1740}
			killspawnedscript \{name = 0x731c0392}
			cancel_winport_connection_status_screen
			return
		endif
		wait \{1
			frame}
		if NOT (screenelementexists id = connectionstatuscontainer)
			return
		endif
		repeat
	endif
	if NOT (netsessionfunc func = hasexistinglogin)
		killspawnedscript \{name = 0x731c0392}
		destroyscreenelement \{id = connectionstatuscontainer}
		clean_up_user_control_helpers
		create_popup_warning_menu \{textblock = {
				text = qs(0x4910e9ae)
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
			options = [
				{
					func = start_winport_account_create_screen
					text = qs(0xcd430d4f)
					scale = 0.9
				}
				{
					func = start_winport_account_login_screen
					text = qs(0x6d0df88d)
					scale = 0.9
				}
				{
					func = cancel_winport_connection_status_screen
					text = qs(0xf7723015)
					scale = 0.9
				}
			]}
		return
	endif
	if NOT (netsessionfunc func = isloggedin)
		printf \{'Not logged in...'}
		ui_event_wait \{event = menu_replace
			data = {
				state = 0xf63ed937
			}}
		return
	endif
	add_user_control_helper \{text = qs(0x494b4d7f)
		button = green
		z = 100}
	new_event_handlers = [
		{pad_choose 0x32d51770 params = <...>}
	]
	setscreenelementprops \{id = connectionstatuscontainer
		event_handlers = new_event_handlers}
endscript

script 0x731c0392 
	rot_angle = -360
	begin
	<id> :se_setprops rot_angle = <rot_angle> time = 2.0
	<id> :se_waitprops
	<rot_angle> = (<rot_angle> - 360)
	repeat
endscript

script 0x118151e5 
	printf \{'--- ui_destroy_winport_connection_status_screen'}
	killspawnedscript \{name = 0x731c0392}
	killspawnedscript \{name = 0xbf6b67e8}
	destroy_popup_warning_menu
	if screenelementexists \{id = connectionstatuscontainer}
		destroyscreenelement \{id = connectionstatuscontainer}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script cancel_winport_connection_status_screen 
	printf \{'--- cancel_winport_connection_status_screen'}
	netsessionfunc \{func = resetnetwork}
	if (($0xe1d01ead = 1) || ($0x8bcedbb2 = 1))
		change \{0xe1d01ead = 0}
		change \{0x8bcedbb2 = 0}
		0xd2607695
	else
		if ($0xd88c332b = 1)
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_signin
				}}
		else
			ui_flow_manager_respond_to_action \{action = go_back}
		endif
	endif
endscript

script 0x7a69c5c8 
	printf \{'--- ui_create_winport_account_login_screen'}
	netsessionfunc \{func = getautologinsetting}
	create_menu_backdrop \{texture = xb_online_bg}
	if (<autologinsetting> = autologinon && netsessionfunc func = hasexistinglogin)
		netsessionfunc \{func = initializeloginfields
			params = {
				loginmode = loginaccount
			}}
		ui_event_wait \{event = menu_replace
			data = {
				state = 0x927cea8e
			}}
	else
		ui_event_wait \{event = menu_replace
			data = {
				state = 0xe4d2b7e7
				mode = loginaccount
				title = qs(0x21bd4cb8)
				container = accountlogincontainer
				yellowbuttontext = qs(0x111659f8)
				yellowbuttonaction = start_winport_account_change_screen
				bluebuttontext = qs(0xcd430d4f)
				bluebuttonaction = start_winport_account_create_screen
			}}
	endif
endscript

script 0x10f2432d 
	destroy_winport_account_management_screen \{container = accountlogincontainer}
endscript

script destroy_winport_account_management_screen 
	netsessionfunc \{func = destroyloginfields}
	if (screenelementexists id = <container>)
		destroyscreenelement id = <container>
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script start_winport_account_change_screen 
	printf \{qs(0xe90b5fab)}
	ui_event_wait \{event = menu_replace
		state = 0x8b1f9a4b}
endscript

script start_winport_account_create_screen 
	ui_event_wait \{event = menu_replace
		state = 0xb9afc96d}
endscript

script start_winport_account_login_screen 
	printf \{qs(0x17d501b9)}
	ui_event_wait \{event = menu_replace
		state = 0xf63ed937}
endscript

script 0xdab68da7 
	printf \{'--- ui_create_winport_account_create_status_screen'}
	0x55297b28
endscript

script 0x5e63f006 
	0xea4d8828
endscript

script 0x59e27806 
	printf \{'--- ui_create_winport_account_login_status_screen'}
	0x55297b28 param = <...>
endscript

script 0x32de0715 
	0xea4d8828 param = <...>
endscript

script 0xa69122da 
	printf \{'--- ui_create_winport_account_change_screen'}
	ui_event_wait \{event = menu_replace
		data = {
			state = 0xe4d2b7e7
			mode = changeaccount
			title = qs(0x95ad3a57)
			container = accountchangecontainer
			yellowbuttontext = qs(0x1cb97731)
			yellowbuttonaction = start_winport_account_reset_screen
		}}
endscript

script 0x769bafab 
	destroy_winport_account_management_screen \{container = accountchangecontainer}
endscript

script 0x942171fc 
	printf \{'--- ui_create_winport_account_create_screen'}
	ui_event_wait \{event = menu_replace
		data = {
			state = 0xe4d2b7e7
			mode = createaccount
			title = qs(0x47f8b9ab)
			container = accountcreatecontainer
		}}
endscript

script 0x442bfc8d 
	destroy_winport_account_management_screen \{container = accountcreatecontainer}
endscript

script 0xcabc773e 
	printf \{'--- create_winport_account_management_screen'}
	z = 110
	if gotparam (0x2d99b7cf)
		printf \{'Called from account managemnt screen!'}
		change \{0x8c754d49 = 1}
	endif
	create_menu_backdrop \{texture = xb_online_bg}
	if ((gotparam yellowbuttonaction) && (gotparam bluebuttonaction))
		handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose 0xa49371dc params = <...>}
			{pad_option2 <yellowbuttonaction>}
			{pad_option <bluebuttonaction>}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	elseif (gotparam yellowbuttonaction)
		handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose 0xa49371dc params = <...>}
			{pad_option2 <yellowbuttonaction>}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	elseif (gotparam bluebuttonaction)
		handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose 0xa49371dc params = <...>}
			{pad_option <bluebuttonaction>}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	elseif (<mode> = addfriend)
		handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose 0xa5a30f72 params = <...>}
			{pad_back 0x51cf0da7 params = {mode = <mode>}}
		]
	else
		handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose 0xa49371dc params = <...>}
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
	createscreenelement {
		type = spriteelement
		parent = <container>
		texture = online_dialog_bg
		dims = (840.0, 500.0)
		pos = (640.0, 80.0)
		just = [center top]
		z_priority = 9
		alpha = 1.0
	}
	createscreenelement {
		type = textelement
		parent = <container>
		font = fontgrid_title_a1
		scale = 1.0
		rgba = [223 223 223 250]
		text = <title>
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 129.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_in_rectangle id = <id> dims = (350.0, 75.0) pos = (640.0, 129.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center
	createscreenelement {
		type = textelement
		parent = <container>
		id = capslockfield
		font = fontgrid_text_a3
		scale = 0.6
		rgba = [255 0 0 255]
		text = qs(0x0ed750ea)
		just = [left top]
		z_priority = 10.0
		pos = (36.0, 330.0)
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textelement
		parent = <container>
		font = fontgrid_text_a3
		scale = 0.6
		rgba = [180 180 180 255]
		text = qs(0x99f7e4a5)
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
		font = fontgrid_text_a3
		scale = 1.0
		rgba = [180 180 180 255]
		text = qs(0xc74bcbc2)
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 595.0)
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_in_rectangle id = <id> dims = (600.0, 25.0) pos = (640.0, 595.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center keep_ar = 1
	<pos> = (348.0, 280.0)
	if (<mode> = addfriend)
		create_winport_login_field container = <container> pos = <pos> label = qs(0x83ea16b1) labelid = usernamelabelid prefixid = usernameprefixid cursorid = usernamecursorid suffixid = usernamesuffixid ang = -2.0 scale = 0.55
	else
		create_winport_login_field container = <container> pos = <pos> label = qs(0x83ea16b1) labelid = usernamelabelid prefixid = usernameprefixid cursorid = usernamecursorid suffixid = usernamesuffixid ang = -2.0 scale = 0.55
	endif
	getscreenelementdims \{id = usernamelabelid}
	lineheight = (<height> + 8)
	if (<mode> = loginaccount || <mode> = deleteaccount || <mode> = changeaccount)
		pos = (<pos> + ((0.0, 1.0) * <lineheight>))
		create_winport_login_field container = <container> pos = <pos> label = qs(0x4a1150c5) labelid = passwordlabelid prefixid = passwordprefixid cursorid = passwordcursorid suffixid = passwordsuffixid ang = 0.2
	endif
	if (<mode> = createaccount || <mode> = changeaccount || <mode> = resetaccount)
		pos = (<pos> + ((0.0, 1.0) * <lineheight>))
		create_winport_login_field container = <container> pos = <pos> label = qs(0x38b824da) labelid = newpassword1labelid prefixid = newpassword1prefixid cursorid = newpassword1cursorid suffixid = newpassword1suffixid ang = -0.6
		pos = (<pos> + ((0.0, 1.0) * <lineheight>))
		create_winport_login_field container = <container> pos = <pos> label = qs(0xb06e1a19) labelid = newpassword2labelid prefixid = newpassword2prefixid cursorid = newpassword2cursorid suffixid = newpassword2suffixid ang = 0.5 scale = 0.55
	endif
	if (<mode> = createaccount || <mode> = resetaccount)
		pos = (<pos> + ((0.0, 1.0) * <lineheight>))
		create_winport_login_field container = <container> pos = <pos> label = qs(0x253d0b55) labelid = licenselabelid prefixid = licenseprefixid cursorid = licensecursorid suffixid = licensesuffixid ang = 1.5 scale = 0.4
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
	if (<mode> = addfriend)
		add_user_control_helper \{text = qs(0xb73cb78f)
			button = green
			z = 100
			0xa6a6d2b9 = 1}
	else
		add_user_control_helper \{text = qs(0xb73cb78f)
			button = green
			z = 100}
	endif
	if (<mode> = loginaccount)
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100}
	elseif (<mode> = addfriend)
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100
			0xa6a6d2b9 = 1}
	else
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
	endif
	if gotparam \{yellowbuttontext}
		add_user_control_helper text = <yellowbuttontext> 0xba6511ff button = yellow z = 100
	endif
	if gotparam \{bluebuttontext}
		add_user_control_helper text = <bluebuttontext> 0xba6511ff button = blue z = 100
	endif
	launchevent type = focus target = <container>
	printstruct <...>
	spawnscriptlater 0xf6d65683 params = <...>
endscript

script 0xa49371dc 
	if (<mode> = loginaccount)
		ui_event_wait \{event = menu_replace
			data = {
				state = 0x927cea8e
				action = executelogin
			}}
	else
		ui_event_wait \{event = menu_replace
			data = {
				state = 0x391e1827
				action = executelogin
			}}
	endif
endscript

script 0xf6d65683 
	printf \{qs(0xc2669949)}
	begin
	if (iscapslockon)
		setscreenelementprops \{id = capslockfield
			alpha = 1.0}
	else
		setscreenelementprops \{id = capslockfield
			alpha = 0.0}
	endif
	if (<mode> = addfriend)
		update_winport_login_field \{field = 0x4756dafe
			labelid = usernamelabelid
			prefixid = usernameprefixid
			cursorid = usernamecursorid
			suffixid = usernamesuffixid}
	else
		update_winport_login_field \{field = username
			labelid = usernamelabelid
			prefixid = usernameprefixid
			cursorid = usernamecursorid
			suffixid = usernamesuffixid}
	endif
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
		printf \{'no screen element'}
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
		break
	endif
	if ((gotparam bluebuttonaction) && (<loginentry> = loginoption2))
		break
	endif
	repeat
	if (<mode> = addfriend)
		if (<loginentry> = loginaccepted)
			printf \{qs(0xfcca39a6)}
			netsessionfunc \{func = getloginfield
				params = {
					field = 0x4756dafe
				}}
			netsessionfunc func = addfriend params = {name = <prefix>}
			if (<0x007e14f4> = 0x3e4a16f3)
				ui_event_wait \{event = menu_replace
					data = {
						state = uistate_mainmenu
						base_name = 'mainmenu'
						selected_index = 0
						clear_previous_stack
					}}
			else
				ui_event_wait \{event = menu_replace
					state = uistate_online}
			endif
		elseif (<loginentry> = loginaborted)
			printf \{qs(0xf0040f9d)}
			if (<0x007e14f4> = 0x3e4a16f3)
				ui_event_wait \{event = menu_replace
					data = {
						state = uistate_mainmenu
						base_name = 'mainmenu'
						selected_index = 0
						clear_previous_stack
					}}
			else
				ui_event_wait \{event = menu_replace
					state = uistate_online}
			endif
		endif
		return
	endif
	switch <loginentry>
		case loginaccepted
		ui_event_wait \{event = menu_replace
			state = 0x927cea8e}
		case loginoption1
		if (<mode> = changeaccount)
			ui_event_wait \{event = menu_replace
				state = 0xd4b24034}
		elseif (<mode> = resetaccount)
			ui_event_wait \{event = menu_replace
				state = 0xcefa55b9}
		else
			ui_event_wait \{event = menu_replace
				state = 0x8b1f9a4b}
		endif
		case loginoption2
		ui_event_wait \{event = menu_replace
			state = 0xb9afc96d}
		case loginaborted
		cancel_winport_account_management_screen mode = <mode>
	endswitch
endscript

script 0x8cee024a 
	printf \{'ui_destroy_winport_account_management_screen'}
	netsessionfunc \{func = destroyloginfields}
	if (screenelementexists id = <container>)
		destroyscreenelement id = <container>
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script cancel_winport_account_management_screen 
	printf \{'--- cancel_winport_account_management_screen'}
	if ($0x8c754d49 = 1)
		change \{0x8c754d49 = 0}
		ui_event_wait \{event = menu_replace
			data = {
				state = 0xc5b89784
			}}
		return
	else
		cancel_winport_connection_status_screen
		return
	endif
	if (<mode> = loginaccount)
		if NOT (netsessionfunc func = isloggedin)
			0x32d51770 params = <...>
		endif
	else
		ui_event_wait \{event = menu_replace
			state = 0xf0870437}
	endif
endscript

script create_winport_login_field \{scale = 0.6}
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
		font = fontgrid_title_a1
		scale = <scale>
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
		font = fontgrid_title_a1
		scale = <scale>
		rgba = $logintextcolor
		text = qs(0x00000000)
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
		font = fontgrid_title_a1
		scale = ((-0.1, 0.2) + ((1.0, 1.0) * <scale>))
		rgba = $logintextcolor
		text = qs(0xc5088519)
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
		font = fontgrid_title_a1
		scale = <scale>
		rgba = $logintextcolor
		text = qs(0x00000000)
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
		setscreenelementprops id = <cursorid> text = qs(0xc5088519)
		setscreenelementprops id = <suffixid> text = <suffix>
	else
		setscreenelementprops id = <prefixid> text = <prefix>
		setscreenelementprops id = <cursorid> text = qs(0x00000000)
		setscreenelementprops id = <suffixid> text = qs(0x00000000)
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
	legacydoscreenelementmorph id = <blinkid> alpha = 0 time = 0.5
	wait \{0.5
		seconds}
	if NOT (screenelementexists id = <blinkid>)
		return
	endif
	legacydoscreenelementmorph id = <blinkid> alpha = 1.0 time = 0.5
	wait \{0.5
		seconds}
	repeat
endscript

script 0x55297b28 
	printf \{qs(0xa5ac41c9)}
	create_menu_backdrop \{texture = xb_online_bg}
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
	vmenu_id = <id>
	createscreenelement \{type = spriteelement
		parent = accountstatuscontainer
		texture = online_dialog_bg
		dims = (640.0, 500.0)
		pos = (640.0, 80.0)
		just = [
			center
			top
		]
		z_priority = 9
		alpha = 1.0}
	createscreenelement \{type = textelement
		parent = accountstatuscontainer
		font = fontgrid_text_a6
		scale = 0.8
		rgba = [
			223
			223
			223
			250
		]
		text = qs(0x623fd166)
		just = [
			center
			top
		]
		z_priority = 10.0
		pos = (640.0, 132.0)
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
		font = fontgrid_text_a3
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
	createscreenelement \{id = 0xc5cc8c5d
		type = spriteelement
		parent = accountstatuscontainer
		texture = online_load_wheel_bg
		pos = (930.0, 500.0)
		dims = (140.0, 140.0)
		just = [
			center
			center
		]
		z_priority = 520}
	createscreenelement \{id = 0xc91ed60f
		type = spriteelement
		parent = accountstatuscontainer
		texture = online_load_wheel
		pos = (930.0, 500.0)
		dims = (140.0, 140.0)
		just = [
			center
			center
		]
		z_priority = 521}
	spawnscriptlater 0x731c0392 params = {id = <id>}
	launchevent type = focus target = <vmenu_id>
	netsessionfunc \{func = executelogintask}
	spawnscriptlater 0x1f8faedc params = <...>
endscript

script 0x1f8faedc 
	printf \{'--- winport_account_management_status_screen_event_loop'}
	begin
	netsessionfunc \{func = getnetworkstatus}
	printf qs(0x3292d0d9) s = <currentnetworktask> p = <currentnetworkstatus>
	switch (<currentnetworktask>)
		case 'CREATE_ACCOUNT'
		switch (<currentnetworkstatus>)
			case 'PENDING'
			statustext = qs(0x50a1b1c6)
			case 'DONE'
			statustext = qs(0x0053c979)
			success = true
			case 'FAILED'
			statustext = qs(0x25072d1c)
			success = false
			default
			statustext = qs(0xc8d1230a)
			success = false
		endswitch
		case 'LOGIN_ACCOUNT'
		switch (<currentnetworkstatus>)
			case 'PENDING'
			statustext = qs(0x230678c7)
			case 'DONE'
			statustext = qs(0x58441bcf)
			success = true
			case 'FAILED'
			statustext = qs(0x435ba072)
			success = false
			default
			statustext = qs(0xc8d1230a)
			success = false
		endswitch
		case 'CHANGE_ACCOUNT'
		switch (<currentnetworkstatus>)
			case 'PENDING'
			statustext = qs(0xbd5cafcf)
			case 'DONE'
			statustext = qs(0x1cc36e6a)
			success = true
			case 'FAILED'
			statustext = qs(0xda155fa4)
			success = false
			default
			statustext = qs(0xc8d1230a)
			success = false
		endswitch
		case 'RESET_ACCOUNT'
		switch (<currentnetworkstatus>)
			case 'PENDING'
			statustext = qs(0xec23ea5e)
			case 'DONE'
			statustext = qs(0xf6f68c85)
			success = true
			case 'FAILED'
			statustext = qs(0xc7f01ab8)
			success = false
			default
			statustext = qs(0xc8d1230a)
			success = false
		endswitch
		case 'DELETE_ACCOUNT'
		switch (<currentnetworkstatus>)
			case 'PENDING'
			statustext = qs(0x3a6545f4)
			case 'DONE'
			statustext = qs(0x654142fa)
			success = true
			case 'FAILED'
			statustext = qs(0x5c163488)
			success = false
			default
			statustext = qs(0xc8d1230a)
			success = false
		endswitch
		default
		printf qs(0x480f953d) s = <currentnetworktask>
		statustext = qs(0xc8d1230a)
		success = false
	endswitch
	setscreenelementprops id = statusmessage text = <statustext>
	fit_text_into_menu_item \{id = statusmessage
		max_width = 480}
	if gotparam \{success}
		printf \{'got return value...'}
		break
	endif
	wait \{1
		frame}
	if NOT (screenelementexists id = accountstatuscontainer)
		printf \{'accountStatusContainer gone!'}
		killspawnedscript \{name = 0x731c0392}
		return
	endif
	repeat
	printf \{'Network Status obtained...\\n'}
	killspawnedscript \{name = 0x731c0392}
	if screenelementexists \{id = 0xc91ed60f}
		destroyscreenelement \{id = 0xc91ed60f}
	endif
	if screenelementexists \{id = 0xc5cc8c5d}
		destroyscreenelement \{id = 0xc5cc8c5d}
	endif
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
			statustext = qs(0xb1c61217)
			case 667
			statustext = qs(0xcabac166)
			case 668
			statustext = qs(0x95d61e49)
			case 669
			statustext = qs(0x25dd06a8)
			case 700
			statustext = qs(0xc12d2d48)
			case 701
			statustext = qs(0xee47b5fd)
			case 702
			statustext = qs(0xc0b5abdf)
			case 703
			statustext = qs(0xc83332a3)
			case 704
			statustext = qs(0x66aa5e95)
			case 705
			statustext = qs(0x85019694)
			case 706
			statustext = qs(0xf86e8fbb)
			case 707
			statustext = qs(0xef836960)
			case 708
			statustext = qs(0xdd3e1158)
			case 709
			statustext = qs(0x50e514cd)
			case 710
			statustext = qs(0x8335f074)
			case 711
			statustext = qs(0x2ead77bc)
			case 712
			statustext = qs(0x8ee1ad2c)
			case 713
			statustext = qs(0x898e84aa)
			case 714
			statustext = qs(0x5eee8b35)
			case 715
			statustext = qs(0x669915b6)
			case 716
			statustext = qs(0x609a0d6a)
		endswitch
		printf qs(0x7bebc93c) s = <getfailurecode>
		setscreenelementprops id = statusmessage text = <statustext>
		fit_text_into_menu_item \{id = statusmessage
			max_width = 480}
		createscreenelement {
			type = containerelement
			parent = <vmenu_id>
			dims = (100.0, 50.0) 0xc9826196
			event_handlers = [
				{pad_choose 0x503f47ec}
				{pad_back 0x503f47ec}
			]
		}
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
		launchevent type = focus target = <vmenu_id>
		return
	endif
	wait \{3
		seconds}
	printf \{'Login complete...'}
	netsessionfunc \{func = stats_init}
	printstruct <...>
	if ($0xe1d01ead = 1)
		printf \{'online menu signin!'}
		0xf76aa636 = [
			{pad_choose main_menu_select_online}
		]
	elseif ($0x8bcedbb2 = 1)
		printf \{qs(0x4c8f5f2a)}
		0xf76aa636 = [
			{pad_choose 0xe6c19b1a}
		]
	elseif ($0x8c754d49 = 1)
		0xf76aa636 = [
			{pad_choose 0x0736ab95}
		]
	else
		printf \{'No online menu signin...'}
		0xf76aa636 = [
			{pad_choose 0x32d51770 params = <...>}
		]
	endif
	createscreenelement {
		type = containerelement
		parent = <vmenu_id>
		dims = (100.0, 50.0)
		event_handlers = <0xf76aa636>
	}
	add_user_control_helper \{text = qs(0x494b4d7f)
		button = green
		z = 100}
	launchevent type = focus target = <vmenu_id>
	change \{0xe1d01ead = 0}
	change \{0x8bcedbb2 = 0}
	change \{0x8c754d49 = 0}
endscript

script 0xea4d8828 
	if (screenelementexists id = accountstatuscontainer)
		destroyscreenelement \{id = accountstatuscontainer}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script 0x503f47ec 
	ui_event_wait \{event = menu_replace
		state = 0xf63ed937}
endscript

script 0x32d51770 
	ui_signin_process_complete controller = <device_num>
	<callback> controller = <device_num> <callback_params>
endscript

script 0x52282360 
	make_menu_frontend \{screen = guitarist
		title = qs(0xcee5ca64)}
	if (netsessionfunc func = isloggedin)
		add_menu_frontend_item \{text = qs(0x5ee56993)
			pad_choose_script = 0x3ce234f1
			pad_choose_params = {
				action = execute_logout
			}}
		add_menu_frontend_item \{text = qs(0x111659f8)
			pad_choose_script = 0x3ce234f1
			pad_choose_params = {
				action = execute_change_password
			}}
		add_menu_frontend_item \{text = qs(0x34db5bf4)
			pad_choose_script = 0x3ce234f1
			pad_choose_params = {
				action = execute_delete_account
			}}
	endif
	add_menu_frontend_item \{text = qs(0xfd1c07a0)
		pad_choose_script = 0x64253292
		pad_choose_params = {
			no_restart
		}}
	netsessionfunc \{func = getautologinsetting}
	switch <autologinsetting>
		case autologinoff
		0x1fab6f67 = qs(0x9dd9821b)
		case autologinon
		0x1fab6f67 = qs(0xe6b22ea1)
		case autologinunknown
		case autologinprompt
		0x1fab6f67 = qs(0x8de266cb)
	endswitch
	createscreenelement {
		id = 0x83c99266
		parent = <item_container_id>
		type = textblockelement
		pos = (0.0, 24.0)
		text = <0x1fab6f67>
		font = fontgrid_title_a1
		font_spacing = 0
		dims = (0.0, 26.0)
		fit_height = `scale down if larger`
		fit_width = `expand dims`
		rgba = [255 255 255 255]
		internal_just = [center , center]
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 50
	}
	menu_finish
endscript

script 0x35cbfb38 
	destroy_generic_menu
endscript

script 0x3ce234f1 
	printf \{'--- account_management_selection'}
	if (<action> = execute_logout)
		ui_event_wait \{event = menu_replace
			state = 0x827dd453}
	elseif (<action> = execute_change_password)
		ui_event_wait \{event = menu_replace
			state = 0x146525f7}
	elseif (<action> = execute_delete_account)
		ui_event_wait \{event = menu_replace
			state = 0xe2c72a25}
	else
	endif
endscript

script 0x64253292 
	netsessionfunc \{func = getautologinsetting}
	switch <autologinsetting>
		case autologinoff
		0x9ee47fb4 = qs(0xe6b22ea1)
		netsessionfunc \{func = setautologinsetting
			params = {
				autologinsetting = autologinon
			}}
		case autologinon
		0x9ee47fb4 = qs(0x8de266cb)
		netsessionfunc \{func = setautologinsetting
			params = {
				autologinsetting = autologinprompt
			}}
		case autologinunknown
		case autologinprompt
		0x9ee47fb4 = qs(0x9dd9821b)
		netsessionfunc \{func = setautologinsetting
			params = {
				autologinsetting = autologinoff
			}}
	endswitch
	0x83c99266 :setprops text = <0x9ee47fb4>
endscript

script 0xa5a30f72 
endscript

script 0x51cf0da7 
endscript
