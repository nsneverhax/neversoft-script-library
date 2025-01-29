
script ui_create_vip_invite 
	if ScreenElementExists \{id = friends_feed_desc_id}
		friends_feed_desc_id :se_setprops \{alpha = 0.0}
	endif
	if isps3
		network_text = qs(0x544d9436)
	elseif isngc
		network_text = qs(0x05471f5a)
	else
		network_text = qs(0x823af2f0)
	endif
	create_mainmenu_bg
	CreateScreenElement {
		parent = root_window
		id = vip_invite_screen_id
		Type = descinterface
		desc = 'vip_invite'
		z_priority = 175
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
	destroy_mainmenu_bg
	clean_up_user_control_helpers
	if ScreenElementExists \{id = vip_invite_screen_id}
		DestroyScreenElement \{id = vip_invite_screen_id}
	endif
	if ScreenElementExists \{id = friends_feed_desc_id}
		friends_feed_desc_id :se_setprops \{alpha = 1.0}
	endif
endscript
