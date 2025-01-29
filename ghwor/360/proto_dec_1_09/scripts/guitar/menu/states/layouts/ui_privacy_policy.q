
script ui_create_privacy_policy \{Type = !q1768515945}
	<text> = qs(0x00000000)
	switch (<Type>)
		case facebook
		case twitter
		social_networks_get_privacy_policy
		<text> = <privacy_policy_text>
		default
		SoftAssert qs(0x81a87aac) t = <Type>
	endswitch
	CreateScreenElement {
		Type = descinterface
		desc = 'privacy_policy'
		id = privacy_policy
		parent = root_window
		dlog_body_text = <text>
		event_handlers = [
			{pad_back generic_event_back}
		]
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent \{Type = unfocus
		target = current_menu}
endscript

script ui_destroy_privacy_policy 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = privacy_policy}
		DestroyScreenElement \{id = privacy_policy}
	endif
endscript
