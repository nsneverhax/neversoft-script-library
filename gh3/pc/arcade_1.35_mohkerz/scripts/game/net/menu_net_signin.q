loginTextColor = [
	255
	200
	0
	255
]
gPrivateMatchId = 0

script create_winport_connection_status_screen 
	printf \{"--- create_winport_connection_status_screen"}
	create_menu_backdrop \{texture = Online_Background}
	z = 110
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = connectionStatusContainer
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = VScrollingMenu
		parent = connectionStatusContainer
		just = [
			center
			top
		]
		dims = (500.0, 150.0)
		Pos = (640.0, 465.0)
		z_priority = 1}
	menu_id = <id>
	CreateScreenElement {
		Type = VMenu
		parent = <menu_id>
		Pos = (298.0, 0.0)
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
	Change \{menu_focus_color = [
			180
			50
			50
			255
		]}
	Change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	create_pause_menu_frame \{parent = connectionStatusContainer
		z = 5}
	displaySprite \{parent = connectionStatusContainer
		tex = Dialog_Title_BG
		dims = (224.0, 224.0)
		z = 9
		Pos = (640.0, 100.0)
		just = [
			right
			top
		]
		flip_v}
	displaySprite \{parent = connectionStatusContainer
		tex = Dialog_Title_BG
		dims = (224.0, 224.0)
		z = 9
		Pos = (640.0, 100.0)
		just = [
			left
			top
		]}
	CreateScreenElement \{Type = TextElement
		parent = connectionStatusContainer
		font = fontgrid_title_gh3
		Scale = 1.2
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
		Pos = (640.0, 182.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	CreateScreenElement {
		Type = TextBlockElement
		parent = connectionStatusContainer
		id = statusMessage
		font = text_a4
		Scale = 0.8
		rgba = [210 210 210 250]
		just = [center top]
		internal_just = [center top]
		internal_scale = <Scale>
		z_priority = <z>
		Pos = (640.0, 310.0)
		dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	if NOT (NetSessionFunc func = IsConnected)
		add_user_control_helper \{text = "CANCEL"
			button = red
			z = 100}
		LaunchEvent Type = focus target = <vmenu_id>
		NetSessionFunc \{func = OnlineSignIn}
		begin
		NetSessionFunc \{func = GetNetworkStatus}
		switch (<CurrentNetworkTask>)
			case "START_NETWORK"
			switch (<CurrentNetworkStatus>)
				case "PENDING"
				statusText = "Initializing Online Services"
				case "DONE"
				statusText = "Online Services Ready"
				case "FAILED"
				statusText = "Unable to Initialize Online Services"
				success = FALSE
				default
				statusText = "Internal Error: Unexpected Network State!"
				success = FALSE
			endswitch
			case "CHECK_DNS"
			switch (<CurrentNetworkStatus>)
				case "PENDING"
				statusText = "Locating Game Servers"
				case "DONE"
				statusText = "Game Servers Located"
				success = true
				case "FAILED"
				statusText = "Unable to locate Game Servers"
				success = FALSE
				default
				statusText = "Internal Error: Unexpected Network State!"
				success = FALSE
			endswitch
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		SetScreenElementProps id = statusMessage text = <statusText>
		fit_text_into_menu_item \{id = statusMessage
			max_width = 480}
		if GotParam \{success}
			clean_up_user_control_helpers
			if (<success> = FALSE)
				add_user_control_helper \{text = "BACK"
					button = red
					z = 100}
				return
			endif
			break
		endif
		Wait \{1
			Frame}
		if NOT (ScreenElementExists id = connectionStatusContainer)
			return
		endif
		repeat
	endif
	if NOT (NetSessionFunc func = HasExistingLogin)
		SetScreenElementProps \{id = statusMessage
			text = "Existing Login Not Found.\\nDo you want to Create a New Account or Use an Existing Account?"}
		fit_text_into_menu_item \{id = statusMessage
			max_width = 480}
		displaySprite \{parent = connectionStatusContainer
			id = options_bg_1
			tex = Dialog_BG
			Pos = (640.0, 500.0)
			dims = (320.0, 64.0)
			z = 9
			just = [
				center
				botom
			]}
		displaySprite \{parent = connectionStatusContainer
			id = options_bg_2
			tex = Dialog_BG
			Pos = (640.0, 530.0)
			dims = (320.0, 64.0)
			z = 9
			just = [
				center
				top
			]
			flip_h}
		CreateScreenElement {
			Type = ContainerElement
			parent = <vmenu_id>
			dims = (100.0, 50.0)
			event_handlers = [
				{focus net_warning_focus}
				{unfocus net_warning_unfocus}
				{pad_choose start_winport_account_create_screen}
				{pad_back cancel_winport_connection_status_screen}
			]
		}
		container_id = <id>
		CreateScreenElement {
			Type = TextElement
			parent = <container_id>
			local_id = text
			font = fontgrid_title_gh3
			Scale = 0.85
			rgba = ($menu_unfocus_color)
			text = "NEW ACCOUNT"
			just = [center top]
			z_priority = (<z> + 0.1)
		}
		fit_text_into_menu_item id = <id> max_width = 200
		GetScreenElementDims id = <id>
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_id>
			local_id = bookend_left
			texture = Dialog_Highlight
			alpha = 0.0
			just = [right center]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_id>
			local_id = bookend_right
			texture = Dialog_Highlight
			alpha = 0.0
			just = [left center]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
		}
		CreateScreenElement {
			Type = ContainerElement
			parent = <vmenu_id>
			dims = (100.0, 50.0)
			event_handlers = [
				{focus net_warning_focus}
				{unfocus net_warning_unfocus}
				{pad_choose start_winport_account_login_screen}
				{pad_back cancel_winport_connection_status_screen}
			]
		}
		container_id = <id>
		CreateScreenElement {
			Type = TextElement
			parent = <container_id>
			local_id = text
			font = fontgrid_title_gh3
			Scale = 0.85
			rgba = ($menu_unfocus_color)
			text = "EXISTING ACCOUNT"
			just = [center top]
			z_priority = (<z> + 0.1)
		}
		fit_text_into_menu_item id = <id> max_width = 200
		GetScreenElementDims id = <id>
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_id>
			local_id = bookend_left
			texture = Dialog_Highlight
			alpha = 0.0
			just = [right center]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_id>
			local_id = bookend_right
			texture = Dialog_Highlight
			alpha = 0.0
			just = [left center]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
		}
		add_user_control_helper \{text = "SELECT"
			button = green
			z = 100}
		add_user_control_helper \{text = "BACK"
			button = red
			z = 100}
		add_user_control_helper \{text = "UP/DOWN"
			button = strumbar
			z = 100}
		LaunchEvent Type = focus target = <vmenu_id>
		return
	endif
	if NOT (NetSessionFunc func = IsLoggedIn)
		ui_flow_manager_respond_to_action \{action = account_login}
	endif
	ui_flow_manager_respond_to_action \{action = goto_online_menu}
endscript

script destroy_winport_connection_status_screen 
	DestroyScreenElement \{id = connectionStatusContainer}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script cancel_winport_connection_status_screen 
	NetSessionFunc \{func = ResetNetwork}
	ui_flow_manager_respond_to_action \{action = back}
endscript

script create_winport_account_create_screen 
	create_winport_account_management_screen \{mode = createAccount
		title = "Account Creation"
		container = accountCreateContainer}
endscript

script destroy_winport_account_create_screen 
	destroy_winport_account_management_screen \{container = accountCreateContainer}
endscript

script start_winport_account_create_screen 
	ui_flow_manager_respond_to_action \{action = account_create}
endscript

script create_winport_account_login_screen 
	NetSessionFunc \{func = GetAutoLoginSetting}
	if (<autoLoginSetting> = autoLoginOn && NetSessionFunc func = HasExistingLogin)
		NetSessionFunc \{func = InitializeLoginFields
			params = {
				loginMode = loginAccount
			}}
		ui_flow_manager_respond_to_action \{action = executeLogin}
	else
		create_winport_account_management_screen \{mode = loginAccount
			title = "Account Login"
			container = accountLoginContainer
			yellowButtonText = "CHANGE PASSWORD"
			yellowButtonAction = start_winport_account_change_screen
			blueButtonText = "NEW ACCOUNT"
			blueButtonAction = start_winport_account_create_screen}
	endif
endscript

script destroy_winport_account_login_screen 
	destroy_winport_account_management_screen \{container = accountLoginContainer}
endscript

script start_winport_account_login_screen 
	ui_flow_manager_respond_to_action \{action = account_login}
endscript

script create_winport_account_change_screen 
	create_winport_account_management_screen \{mode = changeAccount
		title = "Change Password"
		container = accountChangeContainer
		yellowButtonText = "RESET PASSWORD"
		yellowButtonAction = start_winport_account_reset_screen}
endscript

script destroy_winport_account_change_screen 
	destroy_winport_account_management_screen \{container = accountChangeContainer}
endscript

script start_winport_account_change_screen 
	ui_flow_manager_respond_to_action \{action = account_change}
endscript

script create_winport_account_reset_screen 
	create_winport_account_management_screen \{mode = resetAccount
		title = "Reset Password"
		container = accountResetContainer
		yellowButtonText = "DELETE ACCOUNT"
		yellowButtonAction = start_winport_account_delete_screen}
endscript

script destroy_winport_account_reset_screen 
	destroy_winport_account_management_screen \{container = accountResetContainer}
endscript

script start_winport_account_reset_screen 
	ui_flow_manager_respond_to_action \{action = account_reset}
endscript

script create_winport_account_delete_screen 
	create_winport_account_management_screen \{mode = deleteAccount
		title = "Delete Account"
		container = accountDeleteContainer}
endscript

script destroy_winport_account_delete_screen 
	destroy_winport_account_management_screen \{container = accountDeleteContainer}
endscript

script start_winport_account_delete_screen 
	ui_flow_manager_respond_to_action \{action = account_delete}
endscript

script create_change_password_submenu 
	create_winport_account_management_screen \{mode = changeAccount
		title = "Change Password"
		container = accountChangeContainer
		yellowButtonAction = winport_null_action}
endscript

script destroy_change_password_submenu 
	destroy_winport_account_management_screen \{container = accountChangeContainer}
endscript

script create_account_delete_submenu 
	create_winport_account_management_screen \{mode = deleteAccount
		title = "Delete Account"
		container = accountDeleteSubmenuContainer
		yellowButtonAction = winport_null_action}
endscript

script destroy_account_delete_submenu 
	destroy_winport_account_management_screen \{container = accountDeleteSubmenuContainer}
endscript

script winport_null_action 
endscript

script create_winport_account_management_screen 
	printf \{"--- create_winport_account_management_screen"}
	z = 110
	create_menu_backdrop \{texture = Online_Background}
	if ((GotParam yellowButtonAction) && (GotParam blueButtonAction))
		Handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = executeLogin}}
			{pad_option2 <yellowButtonAction>}
			{pad_option <blueButtonAction>}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	elseif (GotParam yellowButtonAction)
		Handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = executeLogin}}
			{pad_option2 <yellowButtonAction>}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	elseif (GotParam blueButtonAction)
		Handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = executeLogin}}
			{pad_option <blueButtonAction>}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	else
		Handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = executeLogin}}
			{pad_back cancel_winport_account_management_screen params = {mode = <mode>}}
		]
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = <container>
		Pos = (0.0, 0.0)
		event_handlers = <Handlers>
	}
	NetSessionFunc func = InitializeLoginFields params = {loginMode = <mode>}
	displaySprite parent = <container> tex = Dialog_Title_BG dims = (300.0, 230.0) z = 9 Pos = (640.0, 40.0) just = [right top] flip_v
	displaySprite parent = <container> tex = Dialog_Title_BG dims = (300.0, 230.0) z = 9 Pos = (640.0, 40.0) just = [left top]
	CreateScreenElement {
		Type = TextElement
		parent = <container>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = [223 223 223 250]
		text = <title>
		just = [center top]
		z_priority = 10.0
		Pos = (640.0, 125.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_in_rectangle id = <id> dims = (400.0, 75.0) Pos = (640.0, 125.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center
	CreateScreenElement {
		Type = TextElement
		parent = <container>
		id = capsLockField
		font = text_a4
		Scale = 0.6
		rgba = [255 0 0 255]
		text = "(Caps Lock Is On)"
		just = [center top]
		z_priority = 10.0
		Pos = (640.0, 530.0)
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	CreateScreenElement {
		Type = TextElement
		parent = <container>
		font = text_a4
		Scale = 0.6
		rgba = [180 180 180 255]
		text = "Game Experience May Change During Online Play"
		just = [center top]
		z_priority = 10.0
		Pos = (640.0, 560.0)
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	CreateScreenElement {
		Type = TextElement
		parent = <container>
		font = text_a4
		Scale = 1.0
		rgba = [180 180 180 255]
		text = "*Please use the keyboard to enter all account information*"
		just = [center top]
		z_priority = 10.0
		Pos = (640.0, 595.0)
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_in_rectangle id = <id> dims = (600.0, 25.0) Pos = (640.0, 595.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center keep_ar = 1
	<Pos> = (375.0, 290.0)
	create_winport_login_field container = <container> Pos = <Pos> label = "Username: " labelId = usernameLabelId prefixId = usernamePrefixId cursorId = usernameCursorId suffixId = usernameSuffixId ang = -2.0
	GetScreenElementDims \{id = usernameLabelId}
	lineHeight = (<height> + 8)
	if (<mode> = loginAccount || <mode> = deleteAccount || <mode> = changeAccount)
		Pos = (<Pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field container = <container> Pos = <Pos> label = "Password: " labelId = passwordLabelId prefixId = passwordPrefixId cursorId = passwordCursorId suffixId = passwordSuffixId ang = 0.2
	endif
	if (<mode> = createAccount || <mode> = changeAccount || <mode> = resetAccount)
		Pos = (<Pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field container = <container> Pos = <Pos> label = "New Password: " labelId = newPassword1LabelId prefixId = newPassword1PrefixId cursorId = newPassword1CursorId suffixId = newPassword1SuffixId ang = -0.6
		Pos = (<Pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field container = <container> Pos = <Pos> label = "Repeat New Password: " labelId = newPassword2LabelId prefixId = newPassword2PrefixId cursorId = newPassword2CursorId suffixId = newPassword2SuffixId ang = 0.5
	endif
	if (<mode> = createAccount || <mode> = resetAccount)
		Pos = (<Pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field container = <container> Pos = <Pos> label = "License: " labelId = licenseLabelId prefixId = licensePrefixId cursorId = licenseCursorId suffixId = licenseSuffixId ang = 1.5
	endif
	add_user_control_helper \{text = "ACCEPT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	if GotParam \{yellowButtonText}
		add_user_control_helper text = <yellowButtonText> button = yellow z = 100
	endif
	if GotParam \{blueButtonText}
		add_user_control_helper text = <blueButtonText> button = blue z = 100
	endif
	LaunchEvent Type = focus target = <container>
	begin
	if (IsCapsLockOn)
		SetScreenElementProps \{id = capsLockField
			alpha = 1.0}
	else
		SetScreenElementProps \{id = capsLockField
			alpha = 0.0}
	endif
	update_winport_login_field \{Field = username
		labelId = usernameLabelId
		prefixId = usernamePrefixId
		cursorId = usernameCursorId
		suffixId = usernameSuffixId}
	update_winport_login_field \{Field = password
		labelId = passwordLabelId
		prefixId = passwordPrefixId
		cursorId = passwordCursorId
		suffixId = passwordSuffixId}
	update_winport_login_field \{Field = newPassword1
		labelId = newPassword1LabelId
		prefixId = newPassword1PrefixId
		cursorId = newPassword1CursorId
		suffixId = newPassword1SuffixId}
	update_winport_login_field \{Field = newPassword2
		labelId = newPassword2LabelId
		prefixId = newPassword2PrefixId
		cursorId = newPassword2CursorId
		suffixId = newPassword2SuffixId}
	update_winport_login_field \{Field = license
		labelId = licenseLabelId
		prefixId = licensePrefixId
		cursorId = licenseCursorId
		suffixId = licenseSuffixId}
	Wait \{1
		Frame}
	if NOT (ScreenElementExists id = <container>)
		return
	endif
	NetSessionFunc \{func = GetLoginEntry}
	if (<loginEntry> = loginAccepted)
		break
	endif
	if (<loginEntry> = loginAborted)
		break
	endif
	if ((GotParam yellowButtonAction) && (<loginEntry> = loginOption1))
		printf \{"Got yellowButtonAction button"}
		break
	endif
	if ((GotParam blueButtonAction) && (<loginEntry> = loginOption2))
		printf \{"Got blueButtonAction button"}
		break
	endif
	repeat
	switch <loginEntry>
		case loginAccepted
		ui_flow_manager_respond_to_action \{action = executeLogin}
		case loginOption1
		printf \{"Executing option 1"}
		ui_flow_manager_respond_to_action \{action = executeOption1}
		case loginOption2
		printf \{"Executing option 2"}
		ui_flow_manager_respond_to_action \{action = executeOption2}
		case loginAborted
		cancel_winport_account_management_screen mode = <mode>
	endswitch
endscript

script destroy_winport_account_management_screen 
	NetSessionFunc \{func = DestroyLoginFields}
	if (ScreenElementExists id = <container>)
		DestroyScreenElement id = <container>
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script cancel_winport_account_management_screen 
	if (<mode> = loginAccount)
		if (NetSessionFunc func = HasExistingLogin)
			ui_flow_manager_respond_to_action \{action = back_to_main}
		else
			ui_flow_manager_respond_to_action \{action = back_to_connection_status}
		endif
	else
		ui_flow_manager_respond_to_action \{action = back}
	endif
endscript

script create_winport_login_field 
	CreateScreenElement {
		Type = ContainerElement
		parent = <container>
		rot_angle = <ang>
	}
	rotContainer = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <rotContainer>
		id = <labelId>
		font = fontgrid_title_gh3
		Scale = 0.8
		rgba = $loginTextColor
		text = <label>
		just = [left top]
		z_priority = 10.0
		Pos = <Pos>
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	CreateScreenElement {
		Type = TextElement
		parent = <rotContainer>
		id = <prefixId>
		font = fontgrid_title_gh3
		Scale = 0.8
		rgba = $loginTextColor
		text = ""
		just = [left top]
		z_priority = 10.0
		Pos = (300.0, 300.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	CreateScreenElement {
		Type = TextElement
		parent = <rotContainer>
		id = <cursorId>
		font = fontgrid_title_gh3
		Scale = (0.5, 0.8)
		rgba = $loginTextColor
		text = "I"
		just = [left top]
		z_priority = 10.0
		Pos = (400.0, 300.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	CreateScreenElement {
		Type = TextElement
		parent = <rotContainer>
		id = <suffixId>
		font = fontgrid_title_gh3
		Scale = 0.8
		rgba = $loginTextColor
		text = ""
		just = [left top]
		z_priority = 10.0
		Pos = (500.0, 300.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	RunScriptOnScreenElement id = <cursorId> winport_cursor_blinker params = {blinkId = <cursorId>}
endscript

script update_winport_login_field 
	if NOT (ScreenElementExists id = <labelId>)
		return
	endif
	NetSessionFunc func = GetLoginField params = {Field = <Field>}
	if (<Active> = 1)
		SetScreenElementProps id = <prefixId> text = <prefix>
		SetScreenElementProps id = <cursorId> text = "I"
		SetScreenElementProps id = <suffixId> text = <suffix>
	else
		SetScreenElementProps id = <prefixId> text = <prefix>
		SetScreenElementProps id = <cursorId> text = ""
		SetScreenElementProps id = <suffixId> text = ""
	endif
	GetScreenElementDims id = <labelId>
	GetScreenElementPosition id = <labelId>
	Pos = (<screenelementpos> + ((1.0, 0.0) * <width>))
	SetScreenElementProps id = <prefixId> Pos = <Pos>
	GetScreenElementPosition id = <prefixId>
	GetScreenElementDims id = <prefixId>
	Pos = (<screenelementpos> + ((1.0, 0.0) * <width>))
	SetScreenElementProps id = <cursorId> Pos = <Pos>
	GetScreenElementPosition id = <cursorId>
	GetScreenElementDims id = <cursorId>
	Pos = (<screenelementpos> + ((1.0, 0.0) * <width>))
	SetScreenElementProps id = <suffixId> Pos = <Pos>
endscript

script winport_cursor_blinker 
	begin
	if NOT (ScreenElementExists id = <blinkId>)
		return
	endif
	DoScreenElementMorph id = <blinkId> alpha = 0 time = 0.5
	Wait \{0.5
		Seconds}
	if NOT (ScreenElementExists id = <blinkId>)
		return
	endif
	DoScreenElementMorph id = <blinkId> alpha = 1.0 time = 0.5
	Wait \{0.5
		Seconds}
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
	create_menu_backdrop \{texture = Online_Background}
	z = 110
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = accountStatusContainer
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = VScrollingMenu
		parent = accountStatusContainer
		just = [
			center
			top
		]
		dims = (500.0, 150.0)
		Pos = (640.0, 465.0)
		z_priority = 1}
	menu_id = <id>
	CreateScreenElement {
		Type = VMenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = (298.0, 0.0)
		just = [center top]
		internal_just = [center top]
		dims = (500.0, 150.0)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	vmenu_id = <id>
	Change \{menu_focus_color = [
			180
			50
			50
			255
		]}
	Change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	create_pause_menu_frame \{parent = accountStatusContainer
		z = 5}
	displaySprite \{parent = accountStatusContainer
		tex = Dialog_Title_BG
		dims = (224.0, 224.0)
		z = 9
		Pos = (640.0, 100.0)
		just = [
			right
			top
		]
		flip_v}
	displaySprite \{parent = accountStatusContainer
		tex = Dialog_Title_BG
		dims = (224.0, 224.0)
		z = 9
		Pos = (640.0, 100.0)
		just = [
			left
			top
		]}
	CreateScreenElement \{Type = TextElement
		parent = accountStatusContainer
		font = fontgrid_title_gh3
		Scale = 1.2
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
		Pos = (640.0, 182.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	CreateScreenElement {
		Type = TextBlockElement
		parent = accountStatusContainer
		id = statusMessage
		font = text_a4
		Scale = 0.8
		rgba = [210 210 210 250]
		just = [center top]
		internal_just = [center top]
		internal_scale = <Scale>
		z_priority = <z>
		Pos = (640.0, 310.0)
		dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	LaunchEvent Type = focus target = <vmenu_id>
	NetSessionFunc \{func = ExecuteLoginTask}
	begin
	NetSessionFunc \{func = GetNetworkStatus}
	switch (<CurrentNetworkTask>)
		case "CREATE_ACCOUNT"
		switch (<CurrentNetworkStatus>)
			case "PENDING"
			statusText = "Requesting Account Creation"
			case "DONE"
			statusText = "Account Created"
			success = true
			case "FAILED"
			statusText = "Unable to Create Account"
			success = FALSE
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		case "LOGIN_ACCOUNT"
		switch (<CurrentNetworkStatus>)
			case "PENDING"
			statusText = "Authorizing Account"
			case "DONE"
			statusText = "Account Authorized"
			success = true
			case "FAILED"
			statusText = "Unable to Authorize Account"
			success = FALSE
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		case "CHANGE_ACCOUNT"
		switch (<CurrentNetworkStatus>)
			case "PENDING"
			statusText = "Requesting Password Change"
			case "DONE"
			statusText = "Password Changed"
			success = true
			case "FAILED"
			statusText = "Unable to Change Password"
			success = FALSE
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		case "RESET_ACCOUNT"
		switch (<CurrentNetworkStatus>)
			case "PENDING"
			statusText = "Requesting Account Reset"
			case "DONE"
			statusText = "Account Password Reset"
			success = true
			case "FAILED"
			statusText = "Unable to Reset Account"
			success = FALSE
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		case "DELETE_ACCOUNT"
		switch (<CurrentNetworkStatus>)
			case "PENDING"
			statusText = "Requesting Account Deletion"
			case "DONE"
			statusText = "Account Deleted"
			success = true
			case "FAILED"
			statusText = "Unable to Delete Account"
			success = FALSE
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		default
		printf "Unexpected state = %s" s = <CurrentNetworkTask>
		statusText = "Internal Error: Unexpected Network State!"
		success = FALSE
	endswitch
	SetScreenElementProps id = statusMessage text = <statusText>
	fit_text_into_menu_item \{id = statusMessage
		max_width = 480}
	if GotParam \{success}
		break
	endif
	Wait \{1
		Frame}
	if NOT (ScreenElementExists id = accountStatusContainer)
		return
	endif
	repeat
	if (<success> = FALSE)
		NetSessionFunc \{func = GetAutoLoginSetting}
		if (<autoLoginSetting> = autoLoginOn && NetSessionFunc func = HasExistingLogin)
			NetSessionFunc \{func = SetAutoLoginSetting
				params = {
					autoLoginSetting = autoLoginPrompt
				}}
		endif
		NetSessionFunc \{func = GetFailureCode}
		switch <FailureCode>
			case 666
			statusText = "New password fields do not match"
			case 667
			statusText = "Authorization Service failed"
			case 668
			statusText = "Usernames must be between 6 and 16 characters long"
			case 669
			statusText = "Passwords must be between 6 and 16 characters long"
			case 700
			statusText = "Task Succeeded"
			case 701
			statusText = "Bad Authorization Request"
			case 702
			statusText = "Server Configuration Error"
			case 703
			statusText = "Invalid Game Title Id"
			case 704
			statusText = "Invalid Account Information"
			case 705
			statusText = "Illegal Authorization Request"
			case 706
			statusText = "Invalid License Code"
			case 707
			statusText = "Username Already Exists"
			case 708
			statusText = "Invalid Username Format"
			case 709
			statusText = "Username Declined"
			case 710
			statusText = "Too Many Accounts for License Code"
			case 711
			statusText = "Account Migration not Supported"
			case 712
			statusText = "Title has been disabled"
			case 713
			statusText = "Account has Expired"
			case 714
			statusText = "Account is Locked"
			case 715
			statusText = "Authentication Error: Online functions will not be available until Guitar Hero III is quit and relaunched."
			case 716
			statusText = "Incorrect Password"
		endswitch
		SetScreenElementProps id = statusMessage text = <statusText>
		fit_text_into_menu_item \{id = statusMessage
			max_width = 480}
		displaySprite \{parent = accountStatusContainer
			id = options_bg_1
			tex = Dialog_BG
			Pos = (640.0, 500.0)
			dims = (320.0, 64.0)
			z = 9
			just = [
				center
				botom
			]}
		displaySprite \{parent = accountStatusContainer
			id = options_bg_2
			tex = Dialog_BG
			Pos = (640.0, 530.0)
			dims = (320.0, 64.0)
			z = 9
			just = [
				center
				top
			]
			flip_h}
		CreateScreenElement {
			Type = ContainerElement
			parent = <vmenu_id>
			dims = (100.0, 50.0)
			event_handlers = [
				{focus net_warning_focus}
				{unfocus net_warning_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = errorAction}}
				{pad_back ui_flow_manager_respond_to_action params = {action = errorAction}}
			]
		}
		container_id = <id>
		CreateScreenElement {
			Type = TextElement
			parent = <container_id>
			local_id = text
			font = fontgrid_title_gh3
			Scale = 0.85
			rgba = ($menu_unfocus_color)
			text = "TRY AGAIN"
			just = [center top]
			z_priority = (<z> + 0.1)
		}
		fit_text_into_menu_item id = <id> max_width = 480
		GetScreenElementDims id = <id>
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_id>
			local_id = bookend_left
			texture = Dialog_Highlight
			alpha = 0.0
			just = [right center]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_id>
			local_id = bookend_right
			texture = Dialog_Highlight
			alpha = 0.0
			just = [left center]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
		}
		clean_up_user_control_helpers
		add_user_control_helper \{text = "SELECT"
			button = green
			z = 100}
		add_user_control_helper \{text = "BACK"
			button = red
			z = 100}
		LaunchEvent Type = focus target = <vmenu_id>
		return
	endif
	Wait \{3
		Seconds}
	ui_flow_manager_respond_to_action \{action = successAction}
	NetSessionFunc \{func = stats_init}
endscript

script destroy_winport_account_management_status_screen 
	if (ScreenElementExists id = accountStatusContainer)
		DestroyScreenElement \{id = accountStatusContainer}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_join_private_menu 
	printf \{"--- create_join_private_menu"}
	z = 110
	create_menu_backdrop \{texture = Online_Background}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = private_menu_container
		Pos = (0.0, 0.0)
		event_handlers = [
			{
				focus
				net_warning_focus
			}
			{
				unfocus
				net_warning_unfocus
			}
			{
				pad_choose
				executeJoinAttempt
			}
			{
				pad_back
				ui_flow_manager_respond_to_action
				params = {
					action = back
				}
			}
		]}
	NetSessionFunc \{func = InitializeLoginFields
		params = {
			loginMode = matchUsername
		}}
	displaySprite \{parent = private_menu_container
		tex = Dialog_Title_BG
		dims = (300.0, 250.0)
		z = 9
		Pos = (640.0, 50.0)
		just = [
			right
			top
		]
		flip_v}
	displaySprite \{parent = private_menu_container
		tex = Dialog_Title_BG
		dims = (300.0, 250.0)
		z = 9
		Pos = (640.0, 50.0)
		just = [
			left
			top
		]}
	CreateScreenElement \{Type = TextElement
		parent = private_menu_container
		font = fontgrid_title_gh3
		Scale = 1.0
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
		Pos = (640.0, 145.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	fit_text_in_rectangle id = <id> dims = (400.0, 75.0) Pos = (640.0, 145.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center
	CreateScreenElement \{Type = TextElement
		parent = private_menu_container
		font = text_a4
		Scale = 1.0
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
		Pos = (640.0, 590.0)
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	fit_text_in_rectangle id = <id> dims = (600.0, 25.0) Pos = (640.0, 590.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center keep_ar = 1
	<Pos> = (375.0, 320.0)
	create_winport_login_field container = private_menu_container Pos = <Pos> label = "Match Username: " labelId = usernameLabelId prefixId = usernamePrefixId cursorId = usernameCursorId suffixId = usernameSuffixId ang = -2.0
	add_user_control_helper \{text = "ACCEPT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	LaunchEvent \{Type = focus
		target = private_menu_container}
	begin
	update_winport_login_field \{Field = matchUsername
		labelId = usernameLabelId
		prefixId = usernamePrefixId
		cursorId = usernameCursorId
		suffixId = usernameSuffixId}
	Wait \{1
		Frame}
	if NOT (ScreenElementExists id = private_menu_container)
		return
	endif
	NetSessionFunc \{func = GetLoginEntry}
	if ((<loginEntry> = loginAccepted) || (<loginEntry> = loginAborted))
		break
	endif
	repeat
	switch <loginEntry>
		case loginAccepted
		executeJoinAttempt
		case loginAborted
		ui_flow_manager_respond_to_action \{action = back}
	endswitch
endscript

script executeJoinAttempt 
	NetSessionFunc \{func = GeneratePrivateMatchId}
	Change gPrivateMatchId = <privateMatchId>
	ui_flow_manager_respond_to_action \{action = attempt_join}
endscript

script destroy_join_private_menu 
	NetSessionFunc \{func = DestroyLoginFields}
	DestroyScreenElement \{id = private_menu_container}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_logout_submenu 
	printf \{"--- create_logout_submenu"}
	create_menu_backdrop \{texture = Online_Background}
	z = 110
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = logoutContainer
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = VScrollingMenu
		parent = logoutContainer
		just = [
			center
			top
		]
		dims = (500.0, 150.0)
		Pos = (640.0, 465.0)
		z_priority = 1}
	menu_id = <id>
	CreateScreenElement {
		Type = VMenu
		parent = <menu_id>
		Pos = (298.0, 0.0)
		just = [center top]
		internal_just = [center top]
		dims = (500.0, 150.0)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_flow_manager_respond_to_action params = {action = back}}
		]
	}
	vmenu_id = <id>
	Change \{menu_focus_color = [
			180
			50
			50
			255
		]}
	Change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	create_pause_menu_frame \{parent = logoutContainer
		z = 5}
	displaySprite \{parent = logoutContainer
		tex = Dialog_Title_BG
		dims = (224.0, 224.0)
		z = 9
		Pos = (640.0, 100.0)
		just = [
			right
			top
		]
		flip_v}
	displaySprite \{parent = logoutContainer
		tex = Dialog_Title_BG
		dims = (224.0, 224.0)
		z = 9
		Pos = (640.0, 100.0)
		just = [
			left
			top
		]}
	CreateScreenElement \{Type = TextElement
		parent = logoutContainer
		font = fontgrid_title_gh3
		Scale = 1.2
		rgba = [
			223
			223
			223
			250
		]
		text = "LOG OUT"
		just = [
			center
			top
		]
		z_priority = 10.0
		Pos = (640.0, 182.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	CreateScreenElement {
		Type = TextBlockElement
		parent = logoutContainer
		id = statusMessage
		text = "Selecting Logout will end your current Online session.  Your scores will not be tracked in the leaderboard until you login again."
		font = text_a4
		Scale = 0.8
		rgba = [210 210 210 250]
		just = [center top]
		internal_just = [center top]
		internal_scale = <Scale>
		z_priority = <z>
		Pos = (640.0, 300.0)
		dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	fit_text_into_menu_item \{id = statusMessage
		max_width = 470}
	displaySprite \{parent = logoutContainer
		id = options_bg_1
		tex = Dialog_BG
		Pos = (640.0, 500.0)
		dims = (320.0, 64.0)
		z = 9
		just = [
			center
			botom
		]}
	displaySprite \{parent = logoutContainer
		id = options_bg_2
		tex = Dialog_BG
		Pos = (640.0, 530.0)
		dims = (320.0, 64.0)
		z = 9
		just = [
			center
			top
		]
		flip_h}
	CreateScreenElement {
		Type = ContainerElement
		parent = <vmenu_id>
		dims = (100.0, 50.0)
		event_handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose executeLogout}
			{pad_back ui_flow_manager_respond_to_action params = {action = back}}
		]
	}
	container_id = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <container_id>
		local_id = text
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($menu_unfocus_color)
		text = "LOG OUT"
		just = [center top]
		z_priority = (<z> + 0.1)
	}
	fit_text_into_menu_item id = <id> max_width = 200
	GetScreenElementDims id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		alpha = 0.0
		just = [right center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		z_priority = (<z> + 0.1)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		alpha = 0.0
		just = [left center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		z_priority = (<z> + 0.1)
		Scale = (1.0, 1.0)
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = <vmenu_id>
		dims = (100.0, 50.0)
		event_handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = back}}
			{pad_back ui_flow_manager_respond_to_action params = {action = back}}
		]
	}
	container_id = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <container_id>
		local_id = text
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($menu_unfocus_color)
		text = "STAY ONLINE"
		just = [center top]
		z_priority = (<z> + 0.1)
	}
	fit_text_into_menu_item id = <id> max_width = 200
	GetScreenElementDims id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		alpha = 0.0
		just = [right center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		z_priority = (<z> + 0.1)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		alpha = 0.0
		just = [left center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		z_priority = (<z> + 0.1)
		Scale = (1.0, 1.0)
	}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	LaunchEvent Type = focus target = <vmenu_id>
endscript

script destroy_logout_submenu 
	DestroyScreenElement \{id = logoutContainer}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script executeLogout 
	NetSessionFunc \{func = ResetNetwork}
	Wait \{1.0
		Second}
	destroy_logout_submenu
	start_flow_manager \{flow_state = main_menu_fs}
endscript

script create_account_submenu \{menu_title = "ACCOUNT MANAGEMENT"
		menu_id = online_account_menu
		vmenu_id = online_account_vmenu}
	Change \{online_main_menu_pos = (640.0, 110.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = account_submenu_anchor
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = VScrollingMenu
		parent = account_submenu_anchor
		id = <menu_id>
		just = [center top]
		dims = (400.0, 480.0)
		Pos = (($online_main_menu_pos) + (0.0, 75.0))
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = (47.5, 0.0)
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
	CreateScreenElement \{Type = ContainerElement
		parent = account_submenu_anchor
		id = online_account_submenu_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = online_account_submenu_container
		id = online_account_submenu_text_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = account_submenu_anchor
		id = online_info_pane_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Online_Background}
	displaySprite id = online_frame parent = online_account_submenu_container tex = Online_Frame_Large Pos = ($online_main_menu_pos) dims = (660.0, 480.0) just = [center top] z = 2
	displaySprite id = Online_Frame_Crown parent = online_account_submenu_container tex = Online_Frame_Crown Pos = (($online_main_menu_pos) + (0.0, -62.0)) dims = (256.0, 105.0) just = [center top] z = 3
	CreateScreenElement {
		Type = TextElement
		parent = online_account_submenu_text_container
		id = online_title
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_dark_purple)
		Pos = (($online_main_menu_pos) + (0.0, 35.0))
		text = <menu_title>
		just = [center top]
		z_priority = 4.0
	}
	GetScreenElementDims id = <id>
	if (<width> > 420)
		SetScreenElementProps {
			id = <id>
			Scale = 1.0
		}
		scale_element_to_size {
			id = <id>
			target_width = 420
			target_height = <height>
		}
	endif
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = "Log Out"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_logout}
		line_spacing = 50
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = "Change Password"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_change_password}
		line_spacing = 50
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = "Delete Account"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_delete_account}
		line_spacing = 50
	}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	create_online_main_menu_helper_buttons
	LaunchEvent Type = focus target = <vmenu_id>
endscript

script destroy_account_submenu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{id = account_submenu_anchor}
		DestroyScreenElement \{id = account_submenu_anchor}
	endif
endscript
