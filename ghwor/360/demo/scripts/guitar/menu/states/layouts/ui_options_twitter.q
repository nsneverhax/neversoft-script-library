g_options_twitter_temp_info = {
	username = qs(0x03ac90f0)
	password = qs(0x03ac90f0)
}
g_options_twitter_did_register = 0

script ui_init_options_twitter 
	change \{g_options_twitter_temp_info = {
			username = qs(0x03ac90f0)
			password = qs(0x03ac90f0)
		}}
endscript

script ui_create_options_twitter \{from_boot = 0}
	create_mainmenu_bg
	createscreenelement {
		parent = root_window
		id = options_twitter
		type = descinterface
		desc = 'options_social'
		page_head_text = ($g_twitter_icon)
		exclusive_device = ($primary_controller)
		tags = {from_boot = <from_boot> username = qs(0x03ac90f0) password = qs(0x03ac90f0)}
	}
	options_twitter :se_setprops title_text = ($g_twitter_icon)
	if NOT options_twitter :desc_resolvealias \{name = alias_social_menu}
		scriptassert \{qs(0xc94e8951)}
	endif
	assignalias id = <resolved_id> alias = options_twitter_vmenu
	add_generic_menu_up_down_sound_handlers parent = <resolved_id>
	get_savegame_from_controller controller = ($primary_controller)
	twitter_get_info controller = ($primary_controller)
	<username> = ($g_options_twitter_temp_info.username)
	<password> = ($g_options_twitter_temp_info.password)
	<focusable_params> = {}
	if twitter_check_is_registered_flag
		<username> = qs(0xabc711d5)
		<password> = qs(0xabc711d5)
		<focusable_params> = {not_focusable}
	endif
	if (<username> = qs(0x03ac90f0))
		formattext \{textname = username_text
			qs(0xeaf34c0b)
			u = qs(0x26b2e4b2)}
	else
		<username> = qs(0xabc711d5)
		formattext textname = username_text qs(0xeaf34c0b) u = <username>
	endif
	formattext textname = username_prompt qs(0xb424f650) s = ($g_twitter_tm_string)
	twitter_add_text_item {
		choose_state = uistate_os_edit_name
		choose_params = {
			is_popup
			char_limit = 127
			default_name = <username>
			title = <username_prompt>
			device_num = ($primary_controller)
			accept_script = ui_options_twitter_accept_username
			accept_params = {savegame = <savegame>}
			cancel_script = ui_options_twitter_cancel_edit_name
			no_show_history = <no_show_history>
			z_priority = 1010
			valid_characters = [
				$name_entry_upper_characters
				$name_entry_lower_characters
				$name_entry_number_characters
				$name_entry_twitter_username_characters
			]
			os_kb_flags = {xenon_email_input ps3_alphabet_input}
		}
		text = <username_text>
		helper_text = qs(0x7491f215)
		<focusable_params>
	}
	<item_id> :se_setprops menurow_txt_item_dims = (400.0, 40.0)
	<uncensored_text> = <password>
	if NOT (<password> = qs(0x03ac90f0))
		social_networks_get_censored_text text = <password>
		<password> = <censored_text>
	endif
	if (<password> = qs(0x03ac90f0))
		formattext \{textname = password_text
			qs(0x123e3c95)
			p = qs(0x26b2e4b2)}
	else
		formattext textname = password_text qs(0x123e3c95) p = <password>
	endif
	formattext textname = password_prompt qs(0x0dd9cd5d) s = ($g_twitter_tm_string)
	twitter_add_text_item {
		choose_state = uistate_os_edit_name
		choose_params = {
			is_popup
			char_limit = 35
			default_name = <uncensored_text>
			title = <password_prompt>
			device_num = ($primary_controller)
			accept_script = ui_options_twitter_accept_password
			accept_params = {savegame = <savegame>}
			cancel_script = ui_options_twitter_cancel_edit_name
			no_show_history = <no_show_history>
			z_priority = 1010
			valid_characters = []
			is_censored = 1
			os_kb_flags = {ps3_password_input xenon_password_input}
		}
		text = <password_text>
		helper_text = qs(0xfc882c42)
		<focusable_params>
	}
	<item_id> :se_setprops menurow_txt_item_dims = (400.0, 40.0)
	twitter_add_text_item \{choose_script = nullscript
		choose_params = {
		}
		text = qs(0x03ac90f0)
		helper_text = qs(0x03ac90f0)
		not_focusable}
	<item_text> = qs(0x72e02432)
	<choose_script> = ui_options_twitter_choose_register
	<texture> = black
	<focusable_params> = {not_focusable}
	if twitter_check_is_registered_flag
		<item_text> = qs(0x5ee56993)
		<choose_script> = ui_options_twitter_choose_unregister
		<texture> = white
		<focusable_params> = {}
	else
		<focusable_params> = {}
		if ($social_networks_tester_mode = 1)
			<focusable_params> = {not_focusable}
			if social_networks_string_contains_prefix string = ($g_options_twitter_temp_info.username) prefix = ($g_social_networks_required_prefix)
				<focusable_params> = {}
			endif
			if social_networks_string_contains_prefix string = ($g_options_twitter_temp_info.username) prefix = ($g_social_networks_required_prefix2)
				<focusable_params> = {}
			endif
			if (<username> = qs(0x03ac90f0) || <password> = qs(0x03ac90f0))
				<focusable_params> = {not_focusable}
			endif
		else
			<focusable_params> = {not_focusable}
			if (<username> != qs(0x03ac90f0) && <password> != qs(0x03ac90f0))
				<focusable_params> = {}
			endif
		endif
	endif
	twitter_add_text_item {
		choose_script = <choose_script>
		text = <item_text>
		helper_text = qs(0xf901a7e2)
		<focusable_params>
	}
	twitter_add_text_item \{choose_script = ui_options_twitter_check_settings
		choose_params = {
		}
		text = qs(0xaf4d5dd2)
		helper_text = qs(0x00000000)}
	clean_up_user_control_helpers
	if NOT (<from_boot> = 1)
		options_twitter_vmenu :se_setprops \{event_handlers = [
				{
					pad_back
					ui_sfx
					params = {
						menustate = generic
						uitype = back
					}
				}
				{
					pad_back
					ui_options_twitter_check_settings
				}
			]}
	endif
	options_twitter_vmenu :se_setprops \{event_handlers = [
			{
				pad_option2
				ui_sfx
				params = {
					menustate = generic
					uitype = select
				}
			}
			{
				pad_option2
				ui_options_twitter_choose_privacy_policy
			}
		]}
	ui_options_twitter_add_helper_text from_boot = <from_boot>
endscript

script ui_destroy_options_twitter 
	destroy_mainmenu_bg
	clean_up_user_control_helpers
	if screenelementexists \{id = options_twitter}
		destroyscreenelement \{id = options_twitter}
	endif
endscript

script ui_return_options_twitter 
	printf \{qs(0xa6221efc)}
	printstruct <...>
	ui_event_wait \{event = menu_refresh}
endscript

script ui_options_twitter_add_helper_text \{from_boot = 0}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	if NOT (<from_boot> = 1)
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0x97c623cf)
		button = yellow
		z = 100000}
endscript

script ui_options_twitter_choose_privacy_policy 
	generic_event_choose \{state = uistate_privacy_policy
		data = {
			is_popup
			type = twitter
			no_accept = 1
		}}
endscript

script ui_options_twitter_choose_register 
	<username> = ($g_options_twitter_temp_info.username)
	<password> = ($g_options_twitter_temp_info.password)
	if screenelementexists \{id = options_twitter}
		options_twitter :obj_spawnscriptnow \{social_networks_animate_load}
	endif
	if screenelementexists \{id = options_twitter_vmenu}
		clean_up_user_control_helpers
		launchevent \{type = unfocus
			target = options_twitter_vmenu}
	endif
	twitter_register {
		username = <username>
		password = <password>
		callback = ui_options_twitter_did_register
		callback_params = {controller = <device_num>}
		controller = <device_num>
	}
endscript

script ui_options_twitter_did_register \{did_succeed = !i1768515945}
	social_networks_hide_load
	if (<did_succeed> = 0)
		social_networks_get_error_string error_code = <error_code> controller = <controller> network = twitter
		formattext textname = body_text qs(0xc69b09b6) t = ($g_twitter_string) e = <error_string>
		generic_event_choose state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0x5a260fdc)
			body_text = <body_text>
		}
	else
		change \{g_options_twitter_did_register = 1}
		change \{g_options_twitter_temp_info = {
				username = qs(0x03ac90f0)
				password = qs(0x03ac90f0)
			}}
		body_text = qs(0x56728c95)
		generic_event_choose state = uistate_generic_dialog_box data = {
			is_popup
			is_social_share
			template = cancel_confirm
			heading_text = qs(0x2f09a459)
			body_text = <body_text>
			options = [
				{
					func = ui_options_twitter_back_and_refresh
					text = qs(0x182f0173)
				}
			]
		}
	endif
endscript

script ui_options_twitter_choose_unregister 
	formattext textname = body_text qs(0x9e655dab) t = ($g_twitter_tm_string)
	generic_event_choose state = uistate_generic_dialog_box data = {
		is_popup
		template = cancel_confirm
		heading_text = qs(0x5ee56993)
		body_text = <body_text>
		confirm_func = twitter_unregister
		confirm_func_params = {controller = ($primary_controller) callback = ui_options_twitter_did_unregister controller = <device_num>}
		cancel_func = ui_options_twitter_back_and_refresh
	}
endscript

script ui_options_twitter_did_unregister \{did_succeed = !i1768515945}
	if (<did_succeed> = 0)
		social_networks_get_error_string error_code = <error_code> controller = <controller> network = twitter
		formattext textname = body_text qs(0xbdcfb682) t = ($g_twitter_string) e = <error_string>
		generic_event_replace state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0xb1245fb5)
			body_text = <body_text>
		}
	else
		change \{g_options_twitter_did_register = 0}
		change \{g_options_twitter_temp_info = {
				username = qs(0x03ac90f0)
				password = qs(0x03ac90f0)
			}}
		formattext textname = body_text qs(0x35913383) t = ($g_twitter_tm_string)
		generic_event_replace state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0xd1b4a1bb)
			body_text = <body_text>
			confirm_func = ui_options_twitter_back_and_refresh
		}
	endif
endscript

script ui_options_twitter_choose_test_post 
	if screenelementexists \{id = dialog_box_desc_id}
		dialog_box_desc_id :obj_spawnscriptnow \{social_networks_animate_load}
	elseif screenelementexists \{id = options_twitter}
		options_twitter :obj_spawnscriptnow \{social_networks_animate_load}
	endif
	social_networks_get_message message_id = test_update network = twitter controller = ($primary_controller)
	twitter_post {
		message_struct = <message_struct>
		callback = ui_options_twitter_did_post
		callback_params = {retry_on_fail = 1 controller = <device_num>}
	}
endscript

script ui_options_twitter_did_post \{message_struct = 0x69696969
		did_succeed = !i1768515945
		status = !q1768515945
		retry_on_fail = !i1768515945}
	social_networks_hide_load
	<username> = ($g_options_twitter_temp_info.username)
	<password> = ($g_options_twitter_temp_info.password)
	if (<did_succeed> = 1)
		formattext textname = body_text qs(0xc593791c) f = ($g_twitter_string)
		create_dialog_box {
			heading_text = qs(0xdd4db710)
			body_text = <body_text>
			options = [
				{
					func = ui_options_twitter_back_and_refresh
					text = qs(0x182f0173)
				}
			]
			no_background
		}
	else
		if (<retry_on_fail> = 1 && <username> != qs(0x03ac90f0) && <password> != qs(0x03ac90f0))
			twitter_post {
				message_struct = <message_struct>
				callback = ui_options_twitter_did_post
				callback_params = {retry_on_fail = 0 controller = <controller>}
			}
		else
			social_networks_get_error_string error_code = <error_code> controller = <controller> network = twitter
			formattext textname = body_text qs(0x611fcbae) f = ($g_twitter_string) e = <error_string>
			create_dialog_box {
				heading_text = qs(0xe7187b7e)
				body_text = <body_text>
				options = [
					{
						func = ui_options_twitter_back_and_refresh
						text = qs(0x182f0173)
					}
				]
				no_background
			}
		endif
	endif
	if screenelementexists \{id = options_twitter_vmenu}
		launchevent \{type = unfocus
			target = options_twitter_vmenu}
	endif
	launchevent type = focus target = <menu_id>
endscript

script ui_options_twitter_accept_username 
	ui_sfx \{menustate = generic
		uitype = select}
	change g_options_twitter_temp_info = {($g_options_twitter_temp_info) username = <text>}
	ui_options_twitter_back_and_refresh
endscript

script ui_options_twitter_accept_password 
	ui_sfx \{menustate = generic
		uitype = select}
	change g_options_twitter_temp_info = {($g_options_twitter_temp_info) password = <text>}
	ui_options_twitter_back_and_refresh
endscript

script ui_options_twitter_back_and_refresh 
	ui_event_get_top
	if NOT (<base_name> = 'options_twitter')
		generic_event_back
	else
		destroy_dialog_box
	endif
	ui_event_wait \{event = menu_refresh}
endscript

script ui_options_twitter_cancel_edit_name 
	ui_sfx \{menustate = generic
		uitype = back}
	ui_options_twitter_back_and_refresh
endscript

script ui_options_twitter_check_settings \{state = uistate_options_game_setup}
	<exit_func> = generic_event_back
	options_twitter :getsingletag \{from_boot}
	if (<from_boot> = 1)
		<exit_func> = ui_social_networks_setup_continue
	endif
	<username> = ($g_options_twitter_temp_info.username)
	<password> = ($g_options_twitter_temp_info.password)
	if (<username> = qs(0x03ac90f0) && <password> = qs(0x03ac90f0))
		<exit_func> state = <state>
		return
	endif
	generic_event_choose state = uistate_generic_dialog_box data = {
		is_popup
		heading_text = qs(0xaa163738)
		body_text = (qs(0x4c73f616) + ($g_twitter_string) + qs(0xd1bf7fa9) + ($g_twitter_string) + qs(0x715b1052))
		template = cancel_confirm
		options = [
			{
				func = ui_options_twitter_back_and_refresh
				text = qs(0xf7723015)
			}
			{
				func = <exit_func>
				func_params = {state = <state>}
				text = qs(0x23b6e962)
			}
		]
	}
endscript

script twitter_add_text_item \{text = 0x69696969}
	mainmenu_setup_option {
		<...>
		parent = options_twitter_vmenu
		screen_id = options_twitter
		menu_item_text = <text>
	}
	if gotparam \{not_focusable}
		<mainmenu_item_id> :se_setprops menurow_txt_item_rgba = (($default_color_scheme).text_color)
	endif
	return item_id = <mainmenu_item_id>
endscript
