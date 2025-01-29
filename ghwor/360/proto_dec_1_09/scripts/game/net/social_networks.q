
script social_networks_broadcast {
		0x52 controller = ($primary_controller)
		0x52 retry_on_fail = 1
	}
endscript

script social_networks_get_privacy_policy 
	<privacy_policy_text> = qs(0xfe9398fb)
	return privacy_policy_text = <privacy_policy_text>
endscript
