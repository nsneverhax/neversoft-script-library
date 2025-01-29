0x7fe79b99 = 0
0x4040ed01 = 0

script social_networks_broadcast_init \{facebook_armed = 1
		twitter_armed = 1}
	Change \{g_social_networks_broadcast_sent = 0}
	Change g_facebook_broadcast_armed = <facebook_armed>
	Change g_twitter_broadcast_armed = <twitter_armed>
	Change \{g_social_networks_to_broadcast = [
		]}
endscript

script social_networks_broadcast_deinit 
	Change \{g_facebook_broadcast_armed = 0}
	Change \{g_twitter_broadcast_armed = 0}
endscript

script ui_event_is_top_social_share 
	ui_event_get_top
	if GotParam \{is_social_share}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script social_networks_broadcast {
		0x54 message_id
		0x52 controller = ($primary_controller)
		0x54 return_script = None
		0x59 return_params = {}
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
			return_script = <return_script>
			return_params = <return_params>
		}
	endif
endscript

script social_networks_broadcast_start \{message_id = !q1768515945
		controller = !i1768515945
		networks = !a1768515945}
	printf \{qs(0xc28d613b)}
	printstruct <...>
	Change g_social_networks_to_broadcast = <networks>
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
g_os_msg_char_limit = 140

script social_networks_broadcast_continue \{message_id = !q1768515945
		controller = !i1768515945}
	GetArraySize ($g_social_networks_to_broadcast)
	if (<array_Size> = 0)
		printf \{'social_networks_broadcast_continue early return'}
		social_networks_broadcast_finish return_script = <return_script> return_params = <return_params>
		return
	endif
	<current_network> = ($g_social_networks_to_broadcast [0])
	RemoveArrayElement array = ($g_social_networks_to_broadcast) index = 0
	Change g_social_networks_to_broadcast = <array>
	if checksumequals a = os b = <current_network>
		ScriptAssert \{'os messages not supported on Wii'}
		social_networks_get_message {
			message_id = <message_id>
			message_struct = <message_struct>
			controller = <controller>
			network = os_message
			passed_variables = <passed_variables>
		}
		if CheckForSignIn
			tmp_os_text = (<message_struct>.preset_text)
			StringLength string = <tmp_os_text>
			if (<str_len> > <tmp_os_text>)
				stringncopy string = <tmp_os_text> length = ($g_os_msg_char_limit)
				tmp_os_text = <new_string>
			endif
			social_networks_strip_bad_chars string = <tmp_os_text> out_param = tmp_os_text
			NetSessionFunc {
				func = custommessage
				params = {
					title = qs(0xbe60453e)
					game_msg = <tmp_os_text>
					device_num = <controller>
				}
			}
		else
			console_message = qs(0xc44c209a)
			if isps3
				console_message = qs(0x7cf4d40d)
			endif
			CreatePlatformMessageBox {
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
	SetButtonEventMappings \{block_menu_input}
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
		Change \{g_facebook_broadcast_armed = 0}
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
		Change \{g_twitter_broadcast_armed = 0}
		default
		ScriptAssert \{qs(0x1eb55e77)}
	endswitch
	if ScreenElementExists \{id = social_networks_broadcast}
		social_networks_broadcast :Obj_SpawnScriptNow \{social_networks_animate_load}
	endif
	AddParam \{structure_name = message_struct
		Name = message_sent
		value = 1}
endscript

script social_networks_broadcast_posted_callback \{did_succeed = !i1768515945}
	printf \{qs(0xe1f98af3)}
	broadcast_continue_params = {
		message_id = (<message_struct>.message_id)
		controller = <controller>
		message_struct = <message_struct>
		back_script = <back_script>
		back_params = <back_params>
		return_script = <return_script>
		return_params = <return_params>
	}
	printstruct <...>
	if (<did_succeed> = 1)
		SetButtonEventMappings \{unblock_menu_input}
		social_networks_broadcast_continue <broadcast_continue_params>
	else
		social_networks_hide_load
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = unfocus
				target = current_menu}
		endif
		social_networks_get_error_string error_code = <error_code> controller = <controller> network = <network> dev_error_code = <dev_error_code>
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
		network = !q1768515945
		dev_error_code = 0}
	printf \{qs(0x87a4bcae)}
	found_error = 0
	error_string = qs(0xde51e7f4)
	if NOT NetSessionFunc \{func = is_lobby_available}
		error_string = qs(0xde51e7f4)
		found_error = 1
	endif
	if NOT NetSessionFunc \{func = isoldenoughforonline}
		error_string = qs(0x052f0757)
		found_error = 1
	endif
	if NetSessionFunc \{func = iscableunplugged}
		switch <network>
			case twitter
			error_string = qs(0x8768155c)
			case facebook
			error_string = qs(0x2a64b904)
			default
			ScriptAssert \{qs(0x737d7e8e)}
		endswitch
		found_error = 1
	endif
	if isXenon
		if NOT CheckForSignIn local controller_index = <controller>
			error_string = qs(0xbfb855df)
			found_error = 1
		elseif NOT CheckForSignIn network_platform_only controller_index = <controller>
			switch <network>
				case twitter
				error_string = qs(0x8768155c)
				case facebook
				error_string = qs(0x2a64b904)
				default
				ScriptAssert \{qs(0x737d7e8e)}
			endswitch
			found_error = 1
		endif
	elseif isps3
		if NOT CheckForSignIn network_platform_only controller_index = <controller>
			error_string = qs(0x3fa355e9)
			found_error = 1
		endif
	elseif isngc
		if NOT CheckForSignIn network_platform_only controller_index = <controller>
			error_string = ($wii_demonware_error_not_available)
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
			error_string = qs(0xdc99e6a9)
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
	0x7a997990 = <error_string>
	printf <0x7a997990>
	return error_string = <0x7a997990>
endscript

script social_networks_animate_load 
	printf \{qs(0xe3685389)}
	Obj_GetID
	if <objID> :desc_resolvealias Name = alias_instrument_spinner param = spinner_id
		printf \{qs(0xa1bddbad)}
		<spinner_id> :se_setprops {
			just = [center center]
			pos_anchor = [center center]
			alpha = 1.0
		}
		<spinner_id> :Obj_SpawnScriptNow instrument_spinner_ui_icon_anim
	endif
endscript

script social_networks_hide_load \{id = None}
	if (<id> = None)
		if ScreenElementExists \{id = social_networks_broadcast}
			if social_networks_broadcast :desc_resolvealias \{Name = alias_instrument_spinner
					param = spinner_id}
				<spinner_id> :se_setprops alpha = 0.0 time = 0.25
				<spinner_id> :se_waitprops
				KillSpawnedScript \{Name = social_networks_animate_load}
			endif
		endif
		if ScreenElementExists \{id = options_facebook}
			if options_facebook :desc_resolvealias \{Name = alias_instrument_spinner
					param = spinner_id}
				<spinner_id> :se_setprops alpha = 0.0 time = 0.25
				<spinner_id> :se_waitprops
				KillSpawnedScript \{Name = social_networks_animate_load}
			endif
		endif
		if ScreenElementExists \{id = options_twitter}
			if options_twitter :desc_resolvealias \{Name = alias_instrument_spinner
					param = spinner_id}
				<spinner_id> :se_setprops alpha = 0.0 time = 0.25
				<spinner_id> :se_waitprops
				KillSpawnedScript \{Name = social_networks_animate_load}
			endif
		endif
	else
		if ScreenElementExists id = <id>
			if <id> :desc_resolvealias Name = alias_instrument_spinner param = spinner_id
				<spinner_id> :se_setprops alpha = 0.0 time = 0.25
				<spinner_id> :se_waitprops
				KillSpawnedScript \{Name = social_networks_animate_load}
			endif
		endif
	endif
endscript

script social_networks_broadcast_finish 
	Change \{g_social_networks_broadcast_sent = 1}
	if ui_event_is_top_social_share
		generic_event_back data = {return_script = <return_script> return_params = <return_params>}
	endif
endscript

script social_networks_broadcast_cancel 
	destroy_dialog_box
	generic_event_back data = {return_script = <return_script> return_params = <return_params>}
endscript

script social_networks_get_message \{message_id = !q1768515945
		controller = !i1768515945
		network = !q1768515945}
	netfeed \{func = gettitleid}
	get_player_num_from_controller controller_index = <controller>
	NetSessionFunc func = get_gamertag params = {controller = <controller>}
	if GotParam \{message_struct}
		<custom_text> = (<message_struct>.custom_text)
		if StructureContains structure = <message_struct> message_sent
			<message_sent> = (<message_struct>.message_sent)
		endif
		if StructureContains structure = <message_struct> passed_variables
			<passed_variables> = (<message_struct>.passed_variables)
		endif
	endif
	<default_params> = {
		titleid = <titleid>
		Player = <player_num>
		controller_index = <controller>
		event = <message_id>
		msg_type = <network>
		gamertag_string = <Name>
		<passed_variables>
		out_param = message
	}
	friend_feed_get_message_string <default_params>
	if (<network> = twitter)
		StringLength string = <message>
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
	ret = FALSE
	tmp_str = <string>
	if stringreplace text = <tmp_str> replace = qs(0x6243d162) with = qs(0x2ba2c9a2) new_string = tmp_str
		ret = true
	endif
	if stringreplace text = <tmp_str> replace = qs(0xa41ed6d0) with = qs(0x2ba2c9a2) new_string = tmp_str
		ret = true
	endif
	AddParam structure_name = return_struct Name = <out_param> value = <tmp_str>
	return <ret> <return_struct>
endscript

script social_networks_setup_broadcast_handlers {
		0x54 message_id
		0x54 menu_id
		0x52 controller = ($primary_controller)
	}
	if social_networks_broadcast_allowed
		wii_is_broadcast_allowed
		if (<is_broadcast_allowed> = 1)
			<menu_id> :se_setprops {
				event_handlers = [
					{pad_L1 social_networks_choose_broadcast params = {<...>}}
				]
				replace_handlers
			}
			user_control_destroy_helper \{button = orange}
			add_user_control_helper text = ($g_social_networks_broadcast_string) button = orange z = 100000
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script social_networks_choose_broadcast \{message_id = !q1768515945
		device_num = 0}
	printf \{qs(0x9de9096d)}
	printstruct <...>
	if (<device_num> = ($primary_controller))
		controller = <device_num>
		ui_sfx \{menustate = Generic
			uitype = select}
		Obj_GetID
		LaunchEvent Type = unfocus target = <objID>
		social_networks_broadcast {<...>}
	endif
endscript

script social_networks_broadcast_allowed \{social_did_broadcast = 0}
	printf \{qs(0x810d8c98)}
	if ($g_social_networks_broadcast_sent = 1)
		printf \{qs(0x5f3baf7d)}
		return \{FALSE}
	endif
	if ($g_enable_facebook = 0 && $g_enable_twitter = 0)
		printf \{qs(0x373aff02)}
		return \{FALSE}
	endif
	if isps3
		if NOT NetSessionFunc \{Obj = voice
				func = voice_allowed}
			return \{FALSE}
		endif
	endif
	if NOT ($g_facebook_broadcast_armed = 1 || $g_twitter_broadcast_armed = 1)
		printf \{qs(0x3006128a)}
		return \{FALSE}
	endif
	gamemode_gettype
	if ($is_network_game = 1 || <Type> = competitive)
		printf \{qs(0x1586cae1)}
		return \{FALSE}
	endif
	if NOT CheckForSignIn controller_index = ($primary_controller)
		return \{FALSE}
	endif
	printf \{qs(0x4a8cf4b2)}
	return \{true}
endscript

script social_networks_is_first_boot {
		0x52 controller = ($primary_controller)
	}
	if CheckForSignIn local controller_index = <controller>
		get_savegame_from_controller controller = <controller>
		GetGlobalTags savegame = <savegame> user_options param = social_networks_did_first_boot
	endif
	if (<social_networks_did_first_boot> = 0)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script social_networks_did_first_boot {
		0x52 controller = ($primary_controller)
	}
	get_savegame_from_controller controller = <controller>
	lockglobaltags \{OFF}
	lockglobaltags \{freeplay_check_off}
	if CheckForSignIn local controller_index = <controller>
		SetGlobalTags savegame = <savegame> user_options params = {social_networks_did_first_boot = 1}
	endif
	lockglobaltags \{freeplay_check_on}
	lockglobaltags
endscript

script social_networks_string_contains_prefix \{prefix = 0x69696969
		string = 0x69696969}
	StringLength string = <prefix>
	<required_str_len> = <str_len>
	StringLength string = <string>
	if (<required_str_len> = 0 || <str_len> = 0 || <str_len> < <required_str_len>)
		return \{FALSE}
	endif
	stringncopy string = <string> length = <required_str_len>
	if LocalizedStringEquals a = <new_string> b = <prefix>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script 0xbe1f5a03 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	cleanup_sessionfuncs
	setup_sessionfuncs
	NetSessionFunc \{func = live_settings_init}
	if NetSessionFunc \{Obj = live_settings
			func = get_settings}
		Block \{Type = net_live_settings_download_finished}
	endif
	if (($0x4040ed01) = 1)
		printf \{'social_networks_get_first_time_registration_info : already done, skipping'}
	elseif social_networks_is_first_boot controller = ($primary_controller)
		push_disable_globaltag_freeplay_check
		fatal_error = 0
		0x1025ab60 = 0
		0x20d96d06 = 0
		facebook_get_info
		facebook_get_registered_accounts
		Block \{Type = social_networks_get_registered_accounts}
		if (<event_data>.Result = success)
			social_network_menu_cache_accounts {
				accounts = (<event_data>.registered_accounts)
				network = facebook
				active_account_id = (<facebook_info>.account_id)
			}
			GetArraySize ($g_registered_facebook_accounts)
			<0x1025ab60> = <array_Size>
		else
			<fatal_error> = 1
		endif
		if (<fatal_error> = 0)
			twitter_get_info
			twitter_get_registered_accounts
			Block \{Type = social_networks_get_registered_accounts}
			if (<event_data>.Result = success)
				social_network_menu_cache_accounts {
					accounts = (<event_data>.registered_accounts)
					network = twitter
					active_account_id = (<twitter_info>.account_id)
				}
				GetArraySize ($g_registered_twitter_accounts)
				<0x20d96d06> = <array_Size>
			else
				<fatal_error> = 1
			endif
		endif
		if (<fatal_error> = 0)
			if ((<0x1025ab60> = 0) && (<0x20d96d06> = 0))
				Change \{0x7fe79b99 = 1}
			endif
			Change \{0x4040ed01 = 1}
		endif
		pop_disable_globaltag_freeplay_check
	else
		printf \{'social_networks_get_first_time_registration_info : not first boot, skipping'}
	endif
endscript
