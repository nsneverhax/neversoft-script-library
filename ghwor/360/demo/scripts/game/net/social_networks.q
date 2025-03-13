
script social_networks_broadcast_init \{facebook_armed = 1
		twitter_armed = 1}
	change \{g_social_networks_broadcast_sent = 0}
	change g_facebook_broadcast_armed = <facebook_armed>
	change g_twitter_broadcast_armed = <twitter_armed>
	change \{g_social_networks_to_broadcast = [
		]}
	change \{g_social_networks_custom_text = qs(0x00000000)}
endscript

script social_networks_broadcast_deinit 
	change \{g_facebook_broadcast_armed = 0}
	change \{g_twitter_broadcast_armed = 0}
	change \{g_social_networks_custom_text = qs(0x00000000)}
endscript

script ui_event_is_top_social_share 
	ui_event_get_top
	if gotparam \{is_social_share}
		return \{true}
	else
		return \{false}
	endif
endscript

script social_networks_broadcast {
		0x54 message_id
		0x52 controller = ($primary_controller)
	}
	printf \{qs(0x580e8c93)}
	cancel_script = social_networks_broadcast_cancel
	cancel_params = {
		return_script = <return_script>
		return_params = <return_params>
	}
	<show_facebook> = 0
	if facebook_check_is_registered_flag controller = <controller>
		if ($g_facebook_broadcast_armed = 1)
			<show_facebook> = 1
			net_counter_increment \{counter_name = globalcounter_facebook_broadcast}
		endif
	endif
	<show_twitter> = 0
	if twitter_check_is_registered_flag controller = <controller>
		if ($g_twitter_broadcast_armed = 1)
			<show_twitter> = 1
			net_counter_increment \{counter_name = globalcounter_twitter_broadcast}
		endif
	endif
	<event> = menu_change
	if ui_event_is_top_social_share
		<event> = menu_replace
	endif
	<func_params> = {
		message_id = <message_id>
		message_struct = <message_struct>
		controller = <controller>
		cancel_script = <cancel_script>
		cancel_params = <cancel_params>
		return_script = <return_script>
		return_params = <return_params>
		passed_variables = <passed_variables>
	}
	if (<show_facebook> = 1 || <show_twitter> = 1)
		ui_event event = <event> state = uistate_social_networks_choose data = {
			is_social_share
			is_popup
			func_params = <func_params>
			back_script = <cancel_script>
			back_params = <cancel_params>
			message_id = <message_id>
		}
	else
		social_networks_broadcast_start networks = [os] <func_params>
		launchevent type = focus target = <objid>
	endif
endscript

script social_networks_broadcast_start_pad_shim 
	social_networks_broadcast_start {
		controller = <device_num>
		<...>
	}
endscript

script social_networks_broadcast_start \{message_id = !q1768515945
		controller = !i1768515945
		networks = !a1768515945}
	printf \{qs(0xc28d613b)}
	printstruct <...>
	change g_social_networks_to_broadcast = <networks>
	social_networks_broadcast_continue {
		message_id = <message_id>
		controller = <controller>
		passed_variables = <passed_variables>
		back_script = <cancel_script>
		back_params = <cancel_params>
		return_script = <return_script>
		return_params = <return_params>
	}
endscript
g_os_msg_char_limit = 200

script social_networks_broadcast_continue \{message_id = !q1768515945
		controller = !i1768515945}
	getarraysize ($g_social_networks_to_broadcast)
	if (<array_size> = 0)
		social_networks_broadcast_finish return_script = <return_script> return_params = <return_params>
		return
	endif
	<current_network> = ($g_social_networks_to_broadcast [0])
	removearrayelement array = ($g_social_networks_to_broadcast) index = 0
	change g_social_networks_to_broadcast = <array>
	if checksumequals a = os b = <current_network>
		social_networks_get_message {
			message_id = <message_id>
			message_struct = <message_struct>
			controller = <controller>
			network = os_message
			passed_variables = <passed_variables>
		}
		if checkforsignin
			tmp_os_text = (<message_struct>.preset_text)
			stringlength string = <tmp_os_text>
			if (<str_len> > <tmp_os_text>)
				stringncopy string = <tmp_os_text> length = ($g_os_msg_char_limit)
				tmp_os_text = <new_string>
			endif
			social_networks_strip_bad_chars string = <tmp_os_text> out_param = tmp_os_text
			netsessionfunc {
				func = custommessage
				params = {
					title = qs(0xc01a1dfa)
					game_msg = <tmp_os_text>
					device_num = <controller>
				}
			}
		else
			console_message = qs(0xc44c209a)
			if isps3
				console_message = qs(0x7cf4d40d)
			endif
			createplatformmessagebox {
				user = ($primary_controller)
				title = qs(0xb2359d6b)
				message = <console_message>
				buttons = [qs(0x494b4d7f)]
				active_button = 0
			}
		endif
		social_networks_broadcast_continue {
			message_id = <message_id>
			controller = <controller>
			return_script = <return_script>
			return_params = <return_params>
			back_script = <back_script>
			back_params = <back_params>
		}
	else
		social_networks_get_message {
			message_id = <message_id>
			message_struct = <message_struct>
			controller = <controller>
			network = <current_network>
			passed_variables = <passed_variables>
		}
		<event> = menu_change
		if ui_event_is_top_social_share
			<event> = menu_replace
		endif
		ui_event event = <event> state = uistate_social_networks_broadcast data = {
			is_popup
			is_social_share
			template = cancel_confirm
			heading_text = ($g_social_networks_strings.<current_network>)
			network = <current_network>
			message_struct = <message_struct>
			back_script = <back_script>
			back_params = <back_params>
			return_script = <return_script>
			return_params = <return_params>
		}
	endif
endscript

script social_networks_broadcast_confirm \{controller = !i1768515945
		message_struct = 0x69696969}
	setbuttoneventmappings \{block_menu_input}
	clean_up_user_control_helpers
	switch (<message_struct>.network)
		case facebook
		facebook_post {
			message_struct = <message_struct>
			callback = social_networks_broadcast_posted_callback
			callback_params = {
				message_id = (<message_struct>.message_id)
				controller = <controller>
				message_struct = <message_struct>
				back_script = <back_script>
				back_params = <back_params>
				return_script = <return_script>
				return_params = <return_params>
				network = facebook
			}
		}
		change \{g_facebook_broadcast_armed = 0}
		case twitter
		twitter_post {
			message_struct = <message_struct>
			callback = social_networks_broadcast_posted_callback
			callback_params = {
				message_id = (<message_struct>.message_id)
				controller = <controller>
				message_struct = <message_struct>
				back_script = <back_script>
				back_params = <back_params>
				return_script = <return_script>
				return_params = <return_params>
				network = twitter
			}
		}
		change \{g_twitter_broadcast_armed = 0}
		default
		scriptassert \{qs(0x1eb55e77)}
	endswitch
	if screenelementexists \{id = social_networks_broadcast}
		social_networks_broadcast :obj_spawnscriptnow \{social_networks_animate_load}
	endif
	addparam \{structure_name = message_struct
		name = message_sent
		value = 1}
endscript

script social_networks_broadcast_posted_callback \{did_succeed = !i1768515945}
	printf \{qs(0xe1f98af3)}
	printstruct <...>
	broadcast_continue_params = {
		message_id = (<message_struct>.message_id)
		controller = <controller>
		message_struct = <message_struct>
		back_script = <back_script>
		back_params = <back_params>
		return_script = <return_script>
		return_params = <return_params>
	}
	if (<did_succeed> = 1)
		setbuttoneventmappings \{unblock_menu_input}
		social_networks_broadcast_continue <broadcast_continue_params>
	else
		social_networks_hide_load
		if screenelementexists \{id = current_menu}
			launchevent \{type = unfocus
				target = current_menu}
		endif
		social_networks_get_error_string error_code = <error_code> controller = <controller> network = <network>
		create_dialog_box {
			heading_text = qs(0x79597197)
			body_text = <error_string>
			player_device = <controller>
			options = [
				{
					func = social_networks_clear_error_dialog
					func_params = <broadcast_continue_params>
					text = qs(0x182f0173)
				}
			]
			back_button_script = social_networks_clear_error_dialog
			back_button_params = <broadcast_continue_params>
		}
	endif
endscript

script social_networks_clear_error_dialog 
	printf \{qs(0xacf221ce)}
	destroy_dialog_box
	social_networks_broadcast_continue <...>
endscript

script social_networks_get_error_string \{error_code = !q1768515945
		controller = !i1768515945
		network = !q1768515945}
	printf \{qs(0x87a4bcae)}
	found_error = 0
	error_string = qs(0xde51e7f4)
	if NOT netsessionfunc \{func = is_lobby_available}
		error_string = qs(0xde51e7f4)
		found_error = 1
	endif
	if NOT netsessionfunc \{func = isoldenoughforonline}
		error_string = qs(0x052f0757)
		found_error = 1
	endif
	if netsessionfunc \{func = iscableunplugged}
		switch <network>
			case twitter
			error_string = qs(0x8768155c)
			case facebook
			error_string = qs(0x2a64b904)
			default
			scriptassert \{qs(0x737d7e8e)}
		endswitch
		found_error = 1
	endif
	if isxenon
		if NOT checkforsignin local controller_index = <controller>
			error_string = qs(0xbfb855df)
			found_error = 1
		elseif NOT checkforsignin network_platform_only controller_index = <controller>
			switch <network>
				case twitter
				error_string = qs(0x8768155c)
				case facebook
				error_string = qs(0x2a64b904)
				default
				scriptassert \{qs(0x737d7e8e)}
			endswitch
			found_error = 1
		endif
	elseif isps3
		if NOT checkforsignin network_platform_only controller_index = <controller>
			error_string = qs(0x3fa355e9)
			found_error = 1
		endif
	endif
	if (<found_error> = 0)
		switch <error_code>
			case twitter_disabled
			case facebook_disabled
			error_string = qs(0x25e1fc54)
			case twitter_auth_attempt_failed
			case facebook_auth_attempt_failed
			error_string = qs(0x8c0c0d78)
			case twitter_auth_token_invalid
			error_string = qs(0x269b937a)
			case facebook_auth_token_invalid
			error_string = qs(0x9107dc94)
			case twitter_update_limit_reached
			error_string = qs(0x177fc39b)
			case twitter_unavailable
			case facebook_unavailable
			error_string = qs(0xde51e7f4)
			case twitter_error
			case facebook_error
			error_string = qs(0xde51e7f4)
			case twitter_timed_out
			case facebook_timed_out
			error_string = qs(0xdb3aa991)
			case twitter_disabled_for_user
			error_string = qs(0xc8bcd121)
			case facebook_disabled_for_user
			error_string = qs(0x1cf50c79)
			case twitter_unknown_error
			case facebook_unknown_error
			default
			error_string = qs(0xde51e7f4)
		endswitch
	endif
	printf <error_string>
	return error_string = <error_string>
endscript

script social_networks_animate_load 
	printf \{qs(0xe3685389)}
	obj_getid
	if <objid> :desc_resolvealias name = alias_instrument_spinner param = spinner_id
		printf \{qs(0xa1bddbad)}
		<spinner_id> :se_setprops alpha = 1.0
		<spinner_id> :obj_spawnscriptnow instrument_spinner_ui_icon_anim
	endif
endscript

script social_networks_hide_load 
	if screenelementexists \{id = social_networks_broadcast}
		if social_networks_broadcast :desc_resolvealias \{name = alias_instrument_spinner
				param = spinner_id}
			<spinner_id> :se_setprops alpha = 0.0 time = 0.25
			<spinner_id> :se_waitprops
			killspawnedscript \{name = social_networks_animate_load}
		endif
	endif
	if screenelementexists \{id = options_facebook}
		if options_facebook :desc_resolvealias \{name = alias_instrument_spinner
				param = spinner_id}
			<spinner_id> :se_setprops alpha = 0.0 time = 0.25
			<spinner_id> :se_waitprops
			killspawnedscript \{name = social_networks_animate_load}
		endif
	endif
	if screenelementexists \{id = options_twitter}
		if options_twitter :desc_resolvealias \{name = alias_instrument_spinner
				param = spinner_id}
			<spinner_id> :se_setprops alpha = 0.0 time = 0.25
			<spinner_id> :se_waitprops
			killspawnedscript \{name = social_networks_animate_load}
		endif
	endif
endscript

script social_networks_broadcast_finish 
	change \{g_social_networks_broadcast_sent = 1}
	if ui_event_is_top_social_share
		generic_event_back data = {return_script = <return_script> return_params = <return_params>}
	endif
endscript

script social_networks_broadcast_cancel 
	generic_event_back data = {return_script = <return_script> return_params = <return_params>}
endscript

script social_networks_get_message \{message_id = !q1768515945
		controller = !i1768515945
		network = !q1768515945}
	netfeed \{func = gettitleid}
	get_player_num_from_controller controller_index = <controller>
	netsessionfunc func = get_gamertag params = {controller = <controller>}
	if gotparam \{message_struct}
		<custom_text> = (<message_struct>.custom_text)
		if structurecontains structure = <message_struct> message_sent
			<message_sent> = (<message_struct>.message_sent)
		endif
		if structurecontains structure = <message_struct> passed_variables
			<passed_variables> = (<message_struct>.passed_variables)
		endif
	endif
	<default_params> = {
		titleid = <titleid>
		player = <player_num>
		controller_index = <controller>
		event = <message_id>
		msg_type = <network>
		gamertag_string = <name>
		<passed_variables>
		out_param = message
	}
	friend_feed_get_message_string <default_params>
	if (<network> = twitter)
		stringlength string = <message>
		if (<str_len> > $g_twitter_msg_char_limit)
			stringncopy string = <message> length = ($g_twitter_msg_char_limit - $g_twitter_additional_truncate_space)
			message = (<new_string> + ($g_twitter_truncate_append))
		else
			message = (<message> + ($g_twitter_normal_append))
		endif
	endif
	<new_message_struct> = {
		message_id = <message_id>
		network = <network>
		controller = <controller>
		preset_text = <message>
		custom_text = <custom_text>
		message_sent = <message_sent>
		passed_variables = <passed_variables>
	}
	if (<network> = facebook)
		friend_feed_get_message_string {
			<default_params>
			<passed_variables>
			msg_type = image_url
			out_param = image_url
		}
		friend_feed_get_message_string {
			<default_params>
			<passed_variables>
			msg_type = image_href
			out_param = image_href
		}
		friend_feed_get_message_string {
			<default_params>
			<passed_variables>
			msg_type = facebook_name
			out_param = facebook_name
		}
		friend_feed_get_message_string {
			<default_params>
			<passed_variables>
			msg_type = facebook_caption
			out_param = facebook_caption
		}
		friend_feed_get_message_string {
			<default_params>
			<passed_variables>
			msg_type = facebook_description
			out_param = facebook_description
		}
		<new_message_struct> = {<new_message_struct> image_url = <image_url> image_href = <image_href> facebook_name = <facebook_name> facebook_caption = <facebook_caption> facebook_description = <facebook_description>}
	endif
	printf \{qs(0xafdba68c)}
	printstruct <...>
	return message_struct = <new_message_struct>
endscript

script social_networks_strip_bad_chars \{out_param = !q1768515945
		string = 0x69696969}
	ret = false
	tmp_str = <string>
	if stringreplace text = <tmp_str> replace = qs(0x6243d162) with = qs(0x2ba2c9a2) new_string = tmp_str
		ret = true
	endif
	if stringreplace text = <tmp_str> replace = qs(0xa41ed6d0) with = qs(0x2ba2c9a2) new_string = tmp_str
		ret = true
	endif
	addparam structure_name = return_struct name = <out_param> value = <tmp_str>
	return <ret> <return_struct>
endscript

script social_networks_get_privacy_policy 
	<privacy_policy_text> = qs(0xfe9398fb)
	return privacy_policy_text = <privacy_policy_text>
endscript

script social_networks_setup_broadcast_handlers {
		0x54 message_id
		0x54 menu_id
		0x52 controller = ($primary_controller)
	}
	if social_networks_broadcast_allowed
		<menu_id> :se_setprops {
			event_handlers = [
				{pad_l1 social_networks_choose_broadcast params = {<...>}}
			]
			replace_handlers
		}
		user_control_destroy_helper \{button = orange}
		add_user_control_helper text = ($g_social_networks_broadcast_string) button = orange z = 100000
		return \{true}
	endif
	return \{false}
endscript

script social_networks_choose_broadcast \{message_id = !q1768515945}
	printf \{qs(0x9de9096d)}
	printstruct <...>
	if (<device_num> = ($primary_controller))
		controller = <device_num>
		ui_sfx \{menustate = generic
			uitype = select}
		obj_getid
		launchevent type = unfocus target = <objid>
		user_control_destroy_helper \{button = orange}
		<objid> :se_setprops event_handlers = [{pad_l1 nullscript}] replace_handlers
		social_networks_broadcast {<...>}
	endif
endscript

script social_networks_broadcast_allowed \{social_did_broadcast = 0}
	printf \{qs(0x810d8c98)}
	if ($g_social_networks_broadcast_sent = 1)
		printf \{qs(0x5f3baf7d)}
		return \{false}
	endif
	if ($g_enable_facebook = 0 && $g_enable_twitter = 0)
		printf \{qs(0x373aff02)}
		return \{false}
	endif
	if isps3
		if NOT netsessionfunc \{obj = voice
				func = voice_allowed}
			return \{false}
		endif
	endif
	if NOT ($g_facebook_broadcast_armed = 1 || $g_twitter_broadcast_armed = 1)
		printf \{qs(0x3006128a)}
		return \{false}
	endif
	gamemode_gettype
	if ($is_network_game = 1 || <type> = competitive)
		printf \{qs(0x1586cae1)}
		return \{false}
	endif
	if NOT checkforsignin controller_index = ($primary_controller)
		return \{false}
	endif
	printf \{qs(0x4a8cf4b2)}
	return \{true}
endscript

script social_networks_is_first_boot {
		0x52 controller = ($primary_controller)
	}
	if checkforsignin local controller_index = <controller>
		get_savegame_from_controller controller = <controller>
		getglobaltags savegame = <savegame> user_options param = social_networks_did_first_boot
	endif
	if (<social_networks_did_first_boot> = 0)
		return \{true}
	else
		return \{false}
	endif
endscript

script social_networks_did_first_boot {
		0x52 controller = ($primary_controller)
	}
	get_savegame_from_controller controller = <controller>
	lockglobaltags \{off}
	lockglobaltags \{freeplay_check_off}
	if checkforsignin local controller_index = <controller>
		setglobaltags savegame = <savegame> user_options params = {social_networks_did_first_boot = 1}
	endif
	lockglobaltags \{freeplay_check_on}
	lockglobaltags
endscript

script social_networks_string_contains_prefix \{prefix = 0x69696969
		string = 0x69696969}
	stringlength string = <prefix>
	<required_str_len> = <str_len>
	stringlength string = <string>
	if (<required_str_len> = 0 || <str_len> = 0 || <str_len> < <required_str_len>)
		return \{false}
	endif
	stringncopy string = <string> length = <required_str_len>
	if localizedstringequals a = <new_string> b = <prefix>
		return \{true}
	else
		return \{false}
	endif
endscript

script social_networks_get_censored_text \{text = 0x69696969}
	stringlength string = <text>
	<censored_text> = qs(0x03ac90f0)
	if (<str_len> > 0)
		<i> = 0
		begin
		formattext textname = censored_text qs(0x1d38498b) t = <censored_text>
		<i> = (<i> + 1)
		repeat <str_len>
	endif
	return censored_text = <censored_text>
endscript
