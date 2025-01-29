
script ui_create_connection_loss \{no_options = 0}
	printf \{qs(0x9a635b14)}
	printstruct <...>
	songlist_clear_playlist
	destroy_dialog_box
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
		text = 'You must be signed in to Xbox LIVE to continue.'
	else
		text = 'You must be signed in to the PLAYSTATION®Network to continue.'
	endif
	if GotParam \{cable_unplugged}
		text = qs(0xd5c7d8b1)
	elseif GotParam \{lost_lobby_connection}
		text = qs(0x3c4b0427)
	endif
	if NOT GotParam \{is_local_dlc_error}
		if isngc
			getngcneterrors \{reset_on_begin_connect = 1}
			if (<dwc_error_code> > 0)
				formatText TextName = text qs(0xcfb2fe82) d = (<dwc_error_code>) s = (<dwc_error_text>)
			else
				formatText TextName = text qs(0x73307931) s = (<dwc_error_text>)
			endif
			if (<fatal_error> > 0)
				ngc_nand_fatal
			endif
			if ($dlc_online_delayed_error != 0)
				formatText TextName = text qs(0xc7fdd388) e = <text> s = ($dlc_online_delayed_error_text)
				Change \{dlc_online_delayed_error = 0}
				Change \{dlc_online_delayed_error_text = qs(0x03ac90f0)}
				<template> = large_body
			endif
		endif
		create_dialog_box {
			heading_text = qs(0x5ce7042a)
			body_text = <text>
			options = <options>
			use_all_controllers
			template = <template>
		}
	else
		create_dialog_box {
			heading_text = qs(0x79597197)
			body_text = <error_text>
			options = <options>
			use_all_controllers
			large_body
		}
	endif
endscript

script ui_destroy_connection_loss 
	destroy_dialog_box
endscript

script ui_deinit_connection_loss 
	Change \{g_connection_loss_dialogue = 0}
endscript

script ui_connection_loss_continue 
	destroy_dialog_box
	generic_event_choose \{state = uistate_mainmenu
		data = {
			clear_previous_stack
		}}
endscript
