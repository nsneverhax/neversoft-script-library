
script ui_create_net_signin_popup 
	if isxenonorwindx
		if netsessionfunc \{func = iscableunplugged}
			text = qs(0xab79bf04)
		else
			text = qs(0x43c1068a)
		endif
	else
		text = qs(0x272e1a21)
	endif
	create_dialog_box {
		heading_text = qs(0x17df5913)
		body_text = <text>
		options = [
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0x182f0173)
			}
		]
		no_background
		back_button_script = generic_event_back
	}
	assignalias id = <menu_id> alias = net_signin_popup
endscript

script ui_destroy_net_signin_popup 
	destroy_dialog_box
endscript
