
script ui_create_vip_invite 
	if isps3
		network_text = qs(0x544d9436)
	else
		network_text = qs(0x823af2f0)
	endif
	CreateScreenElement {
		parent = root_window
		id = vip_invite_screen_id
		Type = descinterface
		desc = 'vip_invite'
		network_text = <network_text>
		event_handlers = [
			{pad_back ui_sfx params = {menustate = Generic uitype = back}}
			{pad_back generic_event_back}
		]
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	LaunchEvent \{Type = focus
		target = vip_invite_screen_id}
endscript

script ui_destroy_vip_invite 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = vip_invite_screen_id}
		DestroyScreenElement \{id = vip_invite_screen_id}
	endif
endscript
