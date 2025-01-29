
script ui_create_net_signin_popup 
	if isXenon
		if NetSessionFunc \{func = iscableunplugged}
			text = 'You are not currently connected to Xbox LIVE. Please connect and try again.'
		else
			text = 'The current gamer profile is not Xbox LIVE multiplayer enabled. Please sign into an Xbox LIVE multiplayer enabled gamer profile to continue.'
		endif
	else
		text = $wii_not_signed_in
	endif
	create_dialog_box {
		heading_text = qs(0x2c41c7cf)
		body_text = <text>
		options = [
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0x494b4d7f)
			}
		]
		no_background
		dlog_event_handlers = [
			{pad_back generic_event_back}
		]
	}
	AssignAlias id = <menu_id> alias = net_signin_popup
endscript

script ui_destroy_net_signin_popup 
	destroy_dialog_box
endscript
