
script create_online_signin_splash 
	printf \{"--- create_online_signin_splash"}
	create_menu_backdrop \{texture = Online_Background}
	if CheckForSignIn
		NetSessionFunc \{func = OnlineSignIn}
	else
		if isXenon
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back online_signin_select_cancel}
			]
			menu_pos = (640.0, 437.0)
			bookend_r_pos = (710.0, 533.0)
			bookend_l_pos = (500.0, 533.0)
			new_menu scrollid = sign_in_scoller vmenuid = sign_in_vmenu use_backdrop = (0) menu_pos = <menu_pos> just = [left top] event_handlers = <event_handlers> spacing = -45
			CreateScreenElement \{Type = ContainerElement
				parent = root_window
				id = signin_container
				Pos = (0.0, 0.0)}
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
			create_pause_menu_frame \{z = 5}
			displaySprite \{parent = signin_container
				tex = Dialog_Title_BG
				dims = (224.0, 224.0)
				z = 9
				Pos = (640.0, 100.0)
				just = [
					right
					top
				]
				flip_v}
			displaySprite \{parent = signin_container
				tex = Dialog_Title_BG
				dims = (224.0, 224.0)
				z = 9
				Pos = (640.0, 100.0)
				just = [
					left
					top
				]}
			displaySprite id = hi_right parent = signin_container tex = Dialog_Highlight Pos = <bookend_r_pos> z = (11)
			displaySprite id = hi_left parent = signin_container tex = Dialog_Highlight flip_v Pos = <bookend_l_pos> z = (11)
			displaySprite \{parent = signin_container
				id = options_bg_1
				tex = Dialog_BG
				Pos = (640.0, 500.0)
				dims = (320.0, 64.0)
				z = 9
				just = [
					center
					botom
				]}
			displaySprite \{parent = signin_container
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
			CreateScreenElement \{Type = TextElement
				parent = signin_container
				font = fontgrid_title_gh3
				Scale = 1.3
				rgba = [
					223
					223
					223
					250
				]
				text = "WARNING"
				just = [
					center
					top
				]
				z_priority = 10.0
				Pos = (640.0, 175.0)
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [
					0
					0
					0
					255
				]}
			if isXenon
				<sign_in_text> = "The current Gamer Profile is not enabled for Xbox LIVE multiplayer game play"
			else
				<sign_in_text> = "The current profile does not have permission to enter the PLAYSTATION®Network lobby."
			endif
			Scale = 1
			StringLength string = <sign_in_text>
			printf "len = %d" d = <str_len>
			if (<str_len> >= 135)
				<Scale> = 0.8
			endif
			CreateScreenElement {
				Type = TextBlockElement
				parent = signin_container
				font = fontgrid_title_gh3
				Scale = 0.6
				rgba = [210 210 210 250]
				text = <sign_in_text>
				just = [center top]
				internal_just = [center top]
				internal_scale = <Scale>
				z_priority = 10.0
				Pos = (640.0, 310.0)
				dims = (800.0, 320.0)
				line_spacing = 1.0
			}
			largest_width = 0
			CreateScreenElement \{Type = ContainerElement
				parent = sign_in_vmenu
				dims = (0.0, 100.0)
				event_handlers = [
					{
						focus
						0x935e80c3
						params = {
							id = 0x3f1f29da
							y_pos = 490
						}
					}
					{
						unfocus
						retail_menu_unfocus
						params = {
							id = 0x3f1f29da
						}
					}
					{
						pad_choose
						online_signin_select_signin
					}
				]}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				id = 0x3f1f29da
				font = fontgrid_title_gh3
				Scale = 0.85
				rgba = ($menu_unfocus_color)
				text = "SIGN IN"
				just = [center top]
				z_priority = 10.0
			}
			GetScreenElementDims id = <id>
			if (<width> > <largest_width>)
				<largest_width> = <width>
			endif
			CreateScreenElement \{Type = ContainerElement
				parent = sign_in_vmenu
				dims = (0.0, 100.0)
				event_handlers = [
					{
						focus
						0x935e80c3
						params = {
							id = 0xb99ab8bd
							y_pos = 540
						}
					}
					{
						unfocus
						retail_menu_unfocus
						params = {
							id = 0xb99ab8bd
						}
					}
					{
						pad_choose
						online_signin_select_cancel
					}
				]}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				id = 0xb99ab8bd
				font = fontgrid_title_gh3
				Scale = 0.85
				rgba = ($menu_unfocus_color)
				text = "CANCEL"
				just = [center top]
				z_priority = 10.0
			}
			GetScreenElementDims id = <id>
			if (<width> > <largest_width>)
				<largest_width> = <width>
			endif
			0x935e80c3 \{id = 0x3f1f29da
				y_pos = 490}
			SetScreenElementProps id = options_bg_1 dims = (<largest_width> * (1.0, 0.0) + (150.0, 80.0))
			SetScreenElementProps id = options_bg_2 dims = (<largest_width> * (1.0, 0.0) + (150.0, 80.0)) flip_h
			add_user_control_helper \{text = "SELECT"
				button = green
				z = 100}
			add_user_control_helper \{text = "BACK"
				button = red
				z = 100}
			add_user_control_helper \{text = "UP/DOWN"
				button = strumbar
				z = 100}
			LaunchEvent \{Type = focus
				target = sign_in_vmenu}
		else
			NetSessionFunc \{func = OnlineSignIn}
		endif
	endif
endscript

script destroy_online_signin_splash 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = sign_in_scoller}
	destroy_menu_backdrop
	if ScreenElementExists \{id = signin_container}
		DestroyScreenElement \{id = signin_container}
	endif
endscript

script online_signin_select_signin 
	NetSessionFunc \{func = OnlineSignIn}
endscript

script online_signin_select_cancel 
	ui_flow_manager_respond_to_action \{action = cancel}
endscript

script 0x935e80c3 \{y_pos = 320}
	retail_menu_focus <...>
	if NOT GotParam \{id}
		GetTags
	endif
	GetScreenElementDims id = <id>
	SetScreenElementProps id = hi_left Pos = ((630.0, 0.0) + <y_pos> * (0.0, 1.0) - (<width> * (0.5, 0.0))) flip_v just = [right top]
	SetScreenElementProps id = hi_right Pos = ((650.0, 0.0) + <y_pos> * (0.0, 1.0) + (<width> * (0.5, 0.0))) just = [left top]
endscript
