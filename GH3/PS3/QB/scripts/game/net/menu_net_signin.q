online_signin_autoload_required = 0

script create_online_signin_splash \{menu_id = signin_dialog_menu
		vmenu_id = signin_dialog_vmenu
		Pos = (640.0, 520.0)
		Z = 110}
	Printf \{"--- create_online_signin_splash"}
	create_menu_backdrop \{texture = Online_Background}
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
		if IsXENON
			Menu_pos = (640.0, 465.0)
			bookend_r_pos = (710.0, 533.0)
			bookend_l_pos = (500.0, 533.0)
			CreateScreenElement \{Type = ContainerElement
				PARENT = root_window
				Id = warning_message_container
				Pos = (0.0, 0.0)}
			CreateScreenElement {
				Type = VScrollingMenu
				PARENT = warning_message_container
				Id = <menu_id>
				just = [Center Top]
				Dims = (500.0, 150.0)
				Pos = (640.0, 465.0)
				z_priority = 1
			}
			CreateScreenElement {
				Type = VMenu
				PARENT = <menu_id>
				Id = <vmenu_id>
				Pos = (298.0, 0.0)
				just = [Center Top]
				internal_just = [Center Top]
				Dims = (500.0, 150.0)
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound Params = {UP}}
					{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
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
			create_pause_menu_frame \{PARENT = warning_message_container
				Z = 5}
			displaySprite \{PARENT = warning_message_container
				tex = Dialog_Title_BG
				Dims = (224.0, 224.0)
				Z = 9
				Pos = (640.0, 100.0)
				just = [
					RIGHT
					Top
				]
				flip_v}
			displaySprite \{PARENT = warning_message_container
				tex = Dialog_Title_BG
				Dims = (224.0, 224.0)
				Z = 9
				Pos = (640.0, 100.0)
				just = [
					LEFT
					Top
				]}
			displaySprite \{PARENT = warning_message_container
				Id = options_bg_1
				tex = Dialog_BG
				Pos = (640.0, 500.0)
				Dims = (320.0, 64.0)
				Z = 9
				just = [
					Center
					botom
				]}
			displaySprite \{PARENT = warning_message_container
				Id = options_bg_2
				tex = Dialog_BG
				Pos = (640.0, 530.0)
				Dims = (320.0, 64.0)
				Z = 9
				just = [
					Center
					Top
				]
				flip_h}
			CreateScreenElement \{Type = TextElement
				PARENT = warning_message_container
				font = fontgrid_title_gh3
				Scale = 1.3
				rgba = [
					223
					223
					223
					250
				]
				Text = "WARNING"
				just = [
					Center
					Top
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
			if IsXENON
				if (NetSessionFunc func = is_cable_unplugged)
					<sign_in_text> = "Unable to connect to Xbox LIVE. Please check your network connection and settings and try again."
					single_option = 1
				elseif (CheckForSignIn local)
					<sign_in_text> = "The current Gamer Profile is not enabled for Xbox LIVE multiplayer game play."
				else
					<sign_in_text> = "No gamer profile currently signed in. Please sign into an Xbox LIVE multiplayer enabled gamer profile to continue."
				endif
			else
				<sign_in_text> = "The current profile does not have permission to enter the PLAYSTATION®Network lobby."
			endif
			CreateScreenElement {
				Type = TextBlockElement
				PARENT = warning_message_container
				font = fontgrid_title_gh3
				Scale = 0.6
				rgba = [210 210 210 250]
				Text = <sign_in_text>
				just = [Center Top]
				internal_just = [Center Top]
				internal_scale = <Scale>
				z_priority = <Z>
				Pos = (640.0, 310.0)
				Dims = (800.0, 320.0)
				line_spacing = 1.0
			}
			cancel_text = "CONTINUE"
			if NOT GotParam \{single_option}
				CreateScreenElement {
					Type = ContainerElement
					PARENT = <vmenu_id>
					Dims = (100.0, 50.0)
					event_handlers = [
						{Focus net_warning_focus}
						{unfocus net_warning_unfocus}
						{pad_choose online_signin_select_signin}
					]
				}
				container_id = <Id>
				CreateScreenElement {
					Type = TextElement
					PARENT = <container_id>
					local_id = Text
					font = fontgrid_title_gh3
					Scale = 0.85
					rgba = ($menu_unfocus_color)
					Text = "SIGN IN"
					just = [Center Top]
					z_priority = (<Z> + 0.1)
				}
				fit_text_into_menu_item Id = <Id> max_width = 240
				GetScreenElementDims Id = <Id>
				CreateScreenElement {
					Type = SpriteElement
					PARENT = <container_id>
					local_id = bookend_left
					texture = Dialog_Highlight
					Alpha = 0.0
					just = [RIGHT Center]
					Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
					z_priority = (<Z> + 0.1)
					Scale = (1.0, 1.0)
					flip_v
				}
				CreateScreenElement {
					Type = SpriteElement
					PARENT = <container_id>
					local_id = bookend_right
					texture = Dialog_Highlight
					Alpha = 0.0
					just = [LEFT Center]
					Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
					z_priority = (<Z> + 0.1)
					Scale = (1.0, 1.0)
				}
				cancel_text = "CANCEL"
			endif
			CreateScreenElement {
				Type = ContainerElement
				PARENT = <vmenu_id>
				Dims = (100.0, 50.0)
				event_handlers = [
					{Focus net_warning_focus}
					{unfocus net_warning_unfocus}
					{pad_choose online_signin_select_cancel}
				]
			}
			container_id = <Id>
			CreateScreenElement {
				Type = TextElement
				PARENT = <container_id>
				local_id = Text
				font = fontgrid_title_gh3
				Scale = 0.85
				rgba = ($menu_unfocus_color)
				Text = <cancel_text>
				just = [Center Top]
				z_priority = (<Z> + 0.1)
			}
			fit_text_into_menu_item Id = <Id> max_width = 240
			GetScreenElementDims Id = <Id>
			CreateScreenElement {
				Type = SpriteElement
				PARENT = <container_id>
				local_id = bookend_left
				texture = Dialog_Highlight
				Alpha = 0.0
				just = [RIGHT Center]
				Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
				z_priority = (<Z> + 0.1)
				Scale = (1.0, 1.0)
				flip_v
			}
			CreateScreenElement {
				Type = SpriteElement
				PARENT = <container_id>
				local_id = bookend_right
				texture = Dialog_Highlight
				Alpha = 0.0
				just = [LEFT Center]
				Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
				z_priority = (<Z> + 0.1)
				Scale = (1.0, 1.0)
			}
			add_user_control_helper \{Text = "SELECT"
				button = Green
				Z = 100}
			add_user_control_helper \{Text = "BACK"
				button = RED
				Z = 100}
			add_user_control_helper \{Text = "UP/DOWN"
				button = Strumbar
				Z = 100}
			LaunchEvent Type = Focus Target = <vmenu_id>
		else
			NetSessionFunc \{func = OnlineSignIn}
		endif
	endif
endscript

script destroy_online_signin_splash 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{Id = warning_message_container}
		DestroyScreenElement \{Id = warning_message_container}
	endif
	if ScreenElementExists \{Id = signin_container}
		DestroyScreenElement \{Id = signin_container}
	endif
	if ScreenElementExists \{Id = sign_in_scoller}
		DestroyScreenElement \{Id = sign_in_scoller}
	endif
endscript

script online_signin_select_signin 
	Change \{online_signin_autoload_required = 1}
	NetSessionFunc \{func = OnlineSignIn}
endscript

script online_signin_select_cancel 
	ui_flow_manager_respond_to_action \{action = cancel}
endscript
