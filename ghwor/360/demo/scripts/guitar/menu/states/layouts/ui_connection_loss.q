
script ui_create_connection_loss \{no_options = 0}
	printf \{qs(0x9a635b14)}
	printstruct <...>
	destroy_dialog_box
	if (<no_options> = 0)
		options = [
			{
				func = ui_connection_loss_continue
				text = qs(0x182f0173)
				scale = (1.0, 1.0)
			}
		]
	endif
	if isxenonorwindx
		text = qs(0x851ba98a)
	else
		if checkforsignin \{network_platform_only}
			text = qs(0xd8f3244a)
		else
			text = qs(0x14b9b86d)
		endif
	endif
	if gotparam \{cable_unplugged}
		text = qs(0xd5c7d8b1)
	elseif gotparam \{lost_lobby_connection}
		text = qs(0x3c4b0427)
	endif
	startrendering
	fadetoblack \{on
		time = 0.0
		alpha = 1
		no_wait}
	change \{invite_controller = -1}
	ui_sfx \{menustate = generic
		uitype = warningmessage}
	create_dialog_box {
		heading_text = qs(0x5ce7042a)
		body_text = <text>
		options = <options>
		use_all_controllers
	}
endscript

script ui_destroy_connection_loss 
	fadetoblack \{off
		time = 0
		no_wait}
	destroy_dialog_box
endscript

script ui_deinit_connection_loss 
	fadetoblack \{off
		time = 0
		no_wait}
	change \{g_connection_loss_dialogue = 0}
endscript

script ui_connection_loss_continue 
	ui_event_block \{event = menu_replace
		data = {
			state = uistate_mainmenu
			clear_previous_stack
		}}
endscript
