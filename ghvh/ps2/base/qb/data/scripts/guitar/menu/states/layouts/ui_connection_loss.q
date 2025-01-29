
script ui_create_connection_loss \{no_options = 0}


	destroy_popup_warning_menu
	if (<no_options> = 0)
		options = [
			{
				func = ui_connection_loss_continue
				text = qs(0x182f0173)
				Scale = (1.0, 1.0)
			}
		]
	endif
	if isXenon
		text = qs(0x851ba98a)
	else
		if CheckForSignIn \{network_platform_only}
			text = qs(0x0f686da5)
		else
			text = qs(0x389abcd2)
		endif
	endif
	if GotParam \{cable_unplugged}
		text = qs(0xd5c7d8b1)
	elseif GotParam \{lost_lobby_connection}
		text = qs(0x3c4b0427)
	endif
	StartRendering
	create_popup_warning_menu {
		title = qs(0x5ce7042a)
		title_props = {Scale = 1.0}
		textblock = {
			text = <text>
			Pos = (640.0, 380.0)
		}
		menu_pos = (600.0, 475.0)
		options = <options>
		use_all_controllers
	}
endscript

script ui_destroy_connection_loss 
	destroy_popup_warning_menu
endscript

script ui_deinit_connection_loss 
	Change \{g_connection_loss_dialogue = 0}
endscript

script ui_connection_loss_continue 
	destroy_popup_warning_menu
	generic_event_choose \{state = uistate_mainmenu
		data = {
			clear_previous_stack
		}}
endscript
