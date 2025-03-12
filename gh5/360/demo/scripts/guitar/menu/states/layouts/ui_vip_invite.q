
script ui_create_vip_invite 
	if isps3
		network_text = qs(0x544d9436)
	else
		network_text = qs(0x823af2f0)
	endif
	createscreenelement {
		parent = root_window
		id = vip_invite_screen_id
		type = descinterface
		desc = 'vip_invite'
		exclusive_device = ($primary_controller)
		network_text = <network_text>
		event_handlers = [
			{pad_back generic_event_back}
		]
	}
	if vip_invite_screen_id :desc_resolvealias \{name = alias_bkgd
			param = framing_anim_id}
		<framing_anim_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich'}
	endif
	if vip_invite_screen_id :desc_resolvealias \{name = alias_bkgd
			param = framing_anim_id}
		<framing_anim_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'pdetrich'}
	endif
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	launchevent \{type = focus
		target = vip_invite_screen_id}
endscript

script ui_destroy_vip_invite 
	clean_up_user_control_helpers
	if screenelementexists \{id = vip_invite_screen_id}
		destroyscreenelement \{id = vip_invite_screen_id}
	endif
endscript
