online_signin_autoload_required = 0

script create_online_signin_splash \{menu_id = signin_dialog_menu
		vmenu_id = signin_dialog_vmenu
		Pos = (640.0, 520.0)
		z = 110}
	printf \{qs(0x373bc011)}
	create_menu_backdrop \{texture = xb_online_bg}
	begin
	if ($net_safe_to_enter_net_play = 1)
		break
	else
		Wait \{0.5
			Seconds}
	endif
	repeat
	Wait \{2
		frames}
	Change \{online_signin_autoload_required = 0}
	if CheckForSignIn
		NetSessionFunc \{func = OnlineSignIn}
	else
		if isXenon
			menu_pos = (640.0, 465.0)
			bookend_r_pos = (710.0, 533.0)
			bookend_l_pos = (500.0, 533.0)
			CreateScreenElement \{Type = ContainerElement
				parent = root_window
				id = warning_message_container
				Pos = (0.0, 0.0)}
			CreateScreenElement {
				Type = VScrollingMenu
				parent = warning_message_container
				id = <menu_id>
				just = [center top]
				dims = (500.0, 150.0)
				Pos = (640.0, 465.0)
				z_priority = 1
			}
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
					{pad_back online_signin_select_cancel}
				]
			}
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
			create_pause_menu_frame \{parent = warning_message_container
				z = 5}
			displaySprite \{parent = warning_message_container
				tex = Dialog_Title_BG
				dims = (224.0, 224.0)
				z = 9
				Pos = (640.0, 100.0)
				just = [
					right
					top
				]
				flip_v}
			displaySprite \{parent = warning_message_container
				tex = Dialog_Title_BG
				dims = (224.0, 224.0)
				z = 9
				Pos = (640.0, 100.0)
				just = [
					left
					top
				]}
			displaySprite \{parent = warning_message_container
				id = options_bg_1
				tex = dialog_menu_bg
				Pos = (640.0, 500.0)
				dims = (320.0, 64.0)
				z = 9
				just = [
					center
					botom
				]}
			displaySprite \{parent = warning_message_container
				id = options_bg_2
				tex = dialog_menu_bg
				Pos = (640.0, 530.0)
				dims = (320.0, 64.0)
				z = 9
				just = [
					center
					top
				]
				flip_h}
			CreateScreenElement \{Type = TextElement
				parent = warning_message_container
				font = fontgrid_title_a1
				Scale = 1.3
				rgba = [
					223
					223
					223
					250
				]
				text = qs(0xaa163738)
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
				if (NetSessionFunc func = is_cable_unplugged)
					<sign_in_text> = qs(0xeef7c882)
					single_option = 1
				elseif (CheckForSignIn local)
					<sign_in_text> = qs(0xa5439413)
				else
					<sign_in_text> = qs(0xee63bbfc)
				endif
			else
				<sign_in_text> = qs(0x30d792b4)
			endif
			CreateScreenElement {
				Type = TextBlockElement
				parent = warning_message_container
				font = fontgrid_title_a1
				Scale = 0.6
				rgba = [210 210 210 250]
				text = <sign_in_text>
				just = [center top]
				internal_just = [center top]
				internal_scale = <Scale>
				z_priority = <z>
				Pos = (640.0, 310.0)
				dims = (800.0, 320.0)
				line_spacing = 1.0
			}
			cancel_text = qs(0x182f0173)
			if NOT GotParam \{single_option}
				CreateScreenElement {
					Type = ContainerElement
					parent = <vmenu_id>
					dims = (100.0, 50.0)
					event_handlers = [
						{focus net_warning_focus}
						{unfocus net_warning_unfocus}
						{pad_choose online_signin_select_signin}
					]
				}
				container_id = <id>
				CreateScreenElement {
					Type = TextElement
					parent = <container_id>
					local_id = text
					font = fontgrid_title_a1
					Scale = 0.85
					rgba = ($menu_unfocus_color)
					text = qs(0x17df5913)
					just = [center top]
					z_priority = (<z> + 0.1)
				}
				fit_text_into_menu_item id = <id> max_width = 240
				GetScreenElementDims id = <id>
				CreateScreenElement {
					Type = SpriteElement
					parent = <container_id>
					local_id = bookend_left
					texture = dialog_menu_hilight
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
					texture = dialog_menu_hilight
					alpha = 0.0
					just = [left center]
					Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
					z_priority = (<z> + 0.1)
					Scale = (1.0, 1.0)
				}
				cancel_text = qs(0xf7723015)
			endif
			CreateScreenElement {
				Type = ContainerElement
				parent = <vmenu_id>
				dims = (100.0, 50.0)
				event_handlers = [
					{focus net_warning_focus}
					{unfocus net_warning_unfocus}
					{pad_choose online_signin_select_cancel}
				]
			}
			container_id = <id>
			CreateScreenElement {
				Type = TextElement
				parent = <container_id>
				local_id = text
				font = fontgrid_title_a1
				Scale = 0.85
				rgba = ($menu_unfocus_color)
				text = <cancel_text>
				just = [center top]
				z_priority = (<z> + 0.1)
			}
			fit_text_into_menu_item id = <id> max_width = 240
			GetScreenElementDims id = <id>
			CreateScreenElement {
				Type = SpriteElement
				parent = <container_id>
				local_id = bookend_left
				texture = dialog_menu_hilight
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
				texture = dialog_menu_hilight
				alpha = 0.0
				just = [left center]
				Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
				z_priority = (<z> + 0.1)
				Scale = (1.0, 1.0)
			}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100}
			LaunchEvent Type = focus target = <vmenu_id>
		else
			NetSessionFunc \{func = OnlineSignIn}
		endif
	endif
endscript

script destroy_online_signin_splash 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{id = warning_message_container}
		DestroyScreenElement \{id = warning_message_container}
	endif
	if ScreenElementExists \{id = signin_container}
		DestroyScreenElement \{id = signin_container}
	endif
	if ScreenElementExists \{id = sign_in_scoller}
		DestroyScreenElement \{id = sign_in_scoller}
	endif
endscript

script online_signin_select_signin 
	Change \{online_signin_autoload_required = 1}
	NetSessionFunc \{func = OnlineSignIn}
endscript

script online_signin_select_cancel 
	ui_flow_manager_respond_to_action \{action = cancel}
endscript
