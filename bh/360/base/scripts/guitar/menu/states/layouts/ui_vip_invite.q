
script ui_create_vip_invite 
	if IsPS3
		network_text = qs(0x544d9436)
	else
		network_text = qs(0x823af2f0)
	endif
	CreateScreenElement {
		parent = root_window
		id = vip_invite_screen_id
		type = DescInterface
		desc = 'vip_invite'
		network_text = <network_text>
		event_handlers = [
			{pad_back generic_event_back}
		]
	}
	if vip_invite_screen_id :Desc_ResolveAlias \{name = alias_speaker_r
			param = speaker_r_id}
		<speaker_r_id> :Obj_SpawnScript ui_frazzmatazz_03
	endif
	if vip_invite_screen_id :Desc_ResolveAlias \{name = alias_bkgd
			param = framing_anim_id}
		<framing_anim_id> :Obj_SpawnScript ui_shakey
	else
		ScriptAssert \{'pdetrich'}
	endif
	if vip_invite_screen_id :Desc_ResolveAlias \{name = alias_bkgd
			param = framing_anim_id}
		<framing_anim_id> :Obj_SpawnScript ui_frazzmatazz
	else
		ScriptAssert \{'pdetrich'}
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	LaunchEvent \{type = focus
		target = vip_invite_screen_id}
endscript

script ui_destroy_vip_invite 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = vip_invite_screen_id}
		DestroyScreenElement \{id = vip_invite_screen_id}
	endif
endscript
