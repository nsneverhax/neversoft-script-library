
script ui_create_vip_invite 
	if isps3
		network_text = 'CONNECT TO The PlayStation®Network TO:'
	elseif isXenon
		network_text = ' CONNECT TO Xbox LIVE TO:'
	else
		network_text = qs(0x05471f5a)
	endif
	CreateScreenElement {
		parent = root_window
		id = vip_invite_screen_id
		Type = descinterface
		desc = 'vip_invite'
		network_text = <network_text>
		event_handlers = [
			{pad_back generic_event_back}
		]
	}
	if vip_invite_screen_id :desc_resolvealias \{Name = 0x29901814
			param = 0xa59a3dfe}
		<0xa59a3dfe> :obj_spawnscript ui_frazzmatazz_03
	endif
	if vip_invite_screen_id :desc_resolvealias \{Name = alias_bkgd
			param = framing_anim_id}
		<framing_anim_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'pdetrich'}
	endif
	if vip_invite_screen_id :desc_resolvealias \{Name = alias_bkgd
			param = framing_anim_id}
		<framing_anim_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'pdetrich'}
	endif
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
