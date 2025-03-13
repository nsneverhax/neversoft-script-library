
script ui_create_net_signin_popup 
	if isxenon
		if netsessionfunc \{func = iscableunplugged}
			text = qs(0xab79bf04)
		else
			text = qs(0x43c1068a)
		endif
	else
		text = qs(0x272e1a21)
	endif
	create_popup_warning_menu {
		title = qs(0x2c41c7cf)
		textblock = {
			text = <text>
		}
		options = [
			{
				func = generic_event_back
				text = qs(0x494b4d7f)
			}
		]
		no_background
		popup_event_handlers = [
			{pad_back generic_event_back}
		]
	}
	assignalias id = <menu_id> alias = net_signin_popup
endscript

script ui_destroy_net_signin_popup 
	destroy_popup_warning_menu
endscript
