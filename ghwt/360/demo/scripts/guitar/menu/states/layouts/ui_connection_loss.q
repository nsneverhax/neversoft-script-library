
script ui_create_connection_loss \{no_options = 0}
	printf \{qs(0x9a635b14)}
	printstruct <...>
	destroy_popup_warning_menu
	if (<no_options> = 0)
		options = [
			{
				func = ui_connection_loss_continue
				text = qs(0x182f0173)
				scale = (1.0, 1.0)
			}
		]
	endif
	if isxenon
		text = qs(0x851ba98a)
	else
		if checkforsignin \{network_platform_only}
			text = qs(0x0f686da5)
		else
			text = qs(0x389abcd2)
		endif
	endif
	if gotparam \{cable_unplugged}
		text = qs(0xd5c7d8b1)
	elseif gotparam \{lost_lobby_connection}
		text = qs(0x3c4b0427)
	endif
	startrendering
	create_popup_warning_menu {
		title = qs(0x5ce7042a)
		title_props = {scale = 1.0}
		textblock = {
			text = <text>
			pos = (640.0, 380.0)
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
	change \{g_connection_loss_dialogue = 0}
endscript

script ui_connection_loss_continue 
	destroy_popup_warning_menu
	generic_event_choose \{state = uistate_mainmenu
		data = {
			clear_previous_stack
		}}
endscript
