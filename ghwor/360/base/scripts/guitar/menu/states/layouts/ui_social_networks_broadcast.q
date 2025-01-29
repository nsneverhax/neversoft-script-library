g_twitter_msg_char_limit = 133
g_twitter_additional_truncate_space = 1
g_twitter_normal_append = qs(0x50e07d9b)
g_twitter_truncate_append = qs(0x5a5dc2df)

script ui_create_social_networks_broadcast \{message_struct = 0x69696969
		back_script = generic_event_back
		back_params = {
		}}
	printf \{qs(0xedc43b41)}
	<network> = (<message_struct>.network)
	<preset_text> = (<message_struct>.preset_text)
	switch <network>
		case facebook
		<desc_id> = 'options_social_facebook_broadcast'
		<custom_text> = ($g_social_networks_custom_text)
		if StructureContains structure = <message_struct> custom_text
			<custom_text> = (<message_struct>.custom_text)
		endif
		char_limit = 127
		case twitter
		<desc_id> = 'options_social_twitter_broadcast'
		StringLength string = <preset_text>
		char_limit = ($g_twitter_msg_char_limit - <str_len> - 1)
		if (<char_limit> < 0)
			<char_limit> = 0
		endif
		custom_text = qs(0x03ac90f0)
		if NOT GotParam \{preset_text}
			preset_text = qs(0x03ac90f0)
		endif
		if StructureContains structure = <message_struct> custom_text
			if StructureContains structure = <message_struct> preset_text
				if (<message_struct>.custom_text != qs(0x00000000))
					<custom_text> = (<message_struct>.custom_text)
				endif
			endif
		elseif (($g_social_networks_custom_text) != qs(0x00000000))
			<custom_text> = ($g_social_networks_custom_text)
		endif
		if (<custom_text> != qs(0x00000000))
			tmp_string = (<custom_text> + qs(0x2ba2c9a2) + <preset_text>)
		else
			tmp_string = <preset_text>
		endif
		StringLength string = <tmp_string>
		if (<str_len> <= $g_twitter_msg_char_limit)
			custom_text = <tmp_string>
		else
			updatestructelement struct = <message_struct> element = custom_text value = qs(0x00000000)
			message_struct = <newstruct>
			Change \{g_social_networks_custom_text = qs(0x00000000)}
			custom_text = <preset_text>
		endif
		ui_event_add_params message_struct = <message_struct>
		default
		ScriptAssert \{qs(0x1436ca08)}
	endswitch
	<network_string> = ($g_social_networks_strings.<network>)
	controller_to_use = ($primary_controller)
	if isps3
		controller_to_use = 0
	endif
	getlocalgamertag controller = <controller_to_use>
	CreateScreenElement {
		parent = root_window
		id = social_networks_broadcast
		Type = descinterface
		desc = <desc_id>
		z_priority = 100
		page_head_text = <network_string>
		warning_text = (qs(0x82c70113) + <network_string>)
		customized_message_text = <custom_text>
		exclusive_device = ($primary_controller)
		header_text = <preset_text>
		event_handlers = [
			{pad_choose social_networks_broadcast_accept params = {return_script = <return_script> return_params = <return_params>}}
			{pad_option2 social_networks_customize_message params = {char_limit = <char_limit> network = <network>}}
			{pad_back social_networks_broadcast_back params = {return_script = <return_script> return_params = <return_params>}}
		]
		tags = {message_struct = <message_struct> back_script = <back_script> back_params = <back_params> return_script = <return_script> return_params = <return_params>}
	}
	if social_networks_broadcast :desc_resolvealias \{Name = alias_customized_message
			param = custom_message_block}
		<custom_message_block> :text_splitlongwords
	endif
	if StructureContains structure = <message_struct> facebook_name
		<id> :se_setprops header_text = (<message_struct>.facebook_name)
	endif
	if StructureContains structure = <message_struct> facebook_caption
		if StructureContains structure = <message_struct> facebook_description
			formatText TextName = facebook_body qs(0xcacd24bc) a = (<message_struct>.facebook_caption) b = (<message_struct>.facebook_description)
			<id> :se_setprops stats_text = <facebook_body>
		else
			<id> :se_setprops stats_text = (<message_struct>.facebook_caption)
		endif
	else
		if StructureContains structure = <message_struct> facebook_description
			<id> :se_setprops stats_text = (<message_struct>.facebook_description)
		endif
	endif
	if checksumequals a = <network> b = facebook
		if StructureContains structure = <message_struct> image_url
			image_url = (<message_struct>.image_url)
			printstruct <...>
			facebook_get_texture_from_url image_url = <image_url>
			<id> :se_setprops fb_icon_texture = <fb_img>
		endif
	endif
	LaunchEvent Type = focus target = <id>
	AssignAlias id = <id> alias = current_menu
	social_networks_broadcast_create_helper_text network = <network>
endscript

script social_networks_broadcast_create_helper_text \{network = !q1768515945}
	clean_up_user_control_helpers
	switch <network>
		case facebook
		add_user_control_helper \{text = qs(0x80a55e63)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x0bc5134a)
			button = yellow
			z = 100000}
		case twitter
		add_user_control_helper \{text = qs(0xdee1e0e4)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0xc23883c4)
			button = yellow
			z = 100000}
	endswitch
endscript

script social_networks_broadcast_accept 
	SetButtonEventMappings \{block_menu_input}
	ui_sfx \{menustate = Generic
		uitype = select}
	social_networks_broadcast :GetTags
	social_networks_broadcast_confirm {
		controller = ($primary_controller)
		message_struct = <message_struct>
		back_script = <back_script>
		back_params = <back_params>
		return_script = <return_script>
		return_params = <return_params>
	}
endscript

script social_networks_broadcast_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	social_networks_broadcast :GetTags
	if StructureContains structure = <message_struct> message_sent
		if (<message_struct>.message_sent = 1)
			social_networks_broadcast_deinit
		endif
	endif
	<back_script> <back_params>
endscript

script social_networks_customize_message \{char_limit = 50}
	social_networks_broadcast :GetTags
	<initial_text> = qs(0x03ac90f0)
	if StructureContains structure = <message_struct> custom_text
		<initial_text> = (<message_struct>.custom_text)
	elseif (($g_social_networks_custom_text) != qs(0x00000000))
		<initial_text> = ($g_social_networks_custom_text)
	endif
	if checksumequals a = <network> b = facebook
		formatText TextName = title_text qs(0x43b55b89) a = <char_limit>
	else
		formatText TextName = title_text qs(0x35d5c3ce) a = <char_limit>
	endif
	ui_event event = menu_change data = {
		is_popup
		state = uistate_os_edit_name
		char_limit = <char_limit>
		default_name = <initial_text>
		title = <title_text>
		device_num = <device_num>
		accept_script = social_networks_customize_message_accept
		accept_params = {message_struct = <message_struct>}
		accept_empty = 1
	}
endscript

script social_networks_customize_message_accept \{message_struct = 0x69696969}
	updatestructelement struct = <message_struct> element = custom_text value = <text>
	Change g_social_networks_custom_text = <text>
	generic_event_back data = {message_struct = <newstruct>}
endscript

script ui_return_social_networks_broadcast 
	SpawnScriptLater \{ui_return_social_networks_broadcast_spawned}
endscript

script ui_return_social_networks_broadcast_spawned 
	ui_event_wait_for_safe
	generic_event_refresh
endscript

script ui_destroy_social_networks_broadcast 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = social_networks_broadcast}
		DestroyScreenElement \{id = social_networks_broadcast}
	endif
endscript
