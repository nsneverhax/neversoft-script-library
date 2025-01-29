g_options_twitter_temp_info = {
	username = qs(0x03ac90f0)
	password = qs(0x03ac90f0)
}
g_options_twitter_did_register = 0
g_options_twitter_should_refetch_data = 0

script ui_init_options_twitter 
	Change \{register_account = 0}
	Change \{g_options_twitter_should_refetch_data = 0}
	Change \{g_options_twitter_temp_info = {
			username = qs(0x03ac90f0)
			password = qs(0x03ac90f0)
		}}
	push_load_social_networks_choose_pak
endscript

script ui_create_options_twitter \{from_boot = 0
		use_mainmenu_bg = 1
		return_state = None
		return_params = {
		}
		register_new_account = 0}
	if (<use_mainmenu_bg> = 1)
		create_mainmenu_bg
	endif
	if (<register_new_account> = 1)
		Change \{register_account = 1}
	endif
	CreateScreenElement {
		parent = root_window
		id = options_twitter
		Type = descinterface
		desc = 'options_social'
		page_head_text = ($g_twitter_icon)
		exclusive_device = ($primary_controller)
		z_priority = ($g_options_facebook_twitter_z_priority)
		tags = {
			from_boot = <from_boot>
			use_mainmenu_bg = <use_mainmenu_bg>
			return_state = <return_state>
			return_params = <return_params>
			username = qs(0x03ac90f0) password = qs(0x03ac90f0)
		}
	}
	options_twitter :se_setprops title_text = ($g_twitter_icon)
	if NOT options_twitter :desc_resolvealias \{Name = alias_social_menu}
		ScriptAssert \{qs(0xc94e8951)}
	endif
	AssignAlias id = <resolved_id> alias = options_twitter_vmenu
	name_id = None
	if ((<from_boot> = 0) && (($register_account) = 0))
		continue = 0
		GetArraySize ($g_registered_twitter_accounts)
		if (($g_options_twitter_should_refetch_data = 0) && (<array_Size> > 0))
			<continue> = 1
			twitter_figured_out_can_post \{Result = success
				registered = 1
				controller_index = 0}
		else
			Change \{g_options_twitter_should_refetch_data = 0}
			options_twitter :social_networks_animate_load
			twitter_get_info
			twitter_get_registered_accounts
			Block \{Type = social_networks_get_registered_accounts}
			if (<event_data>.Result = success)
				<continue> = 1
				social_network_menu_cache_accounts {
					accounts = (<event_data>.registered_accounts)
					network = twitter
					active_account_id = (<twitter_info>.account_id)
				}
				GetArraySize (<event_data>.registered_accounts)
				if (<array_Size> = 0)
					printf \{'no registered accounts, setting register_account = 1'}
					Change \{register_account = 1}
					twitter_figured_out_can_post \{Result = success
						registered = 0
						controller_index = 0}
				elseif (<array_Size> > 0)
					twitter_figured_out_can_post \{Result = success
						registered = 1
						controller_index = 0}
				endif
			else
				social_networks_get_error_string {
					error_code = (<event_data>.error_code)
					controller = 0
					network = twitter
					dev_error_code = (<event_data>.dev_error_code)
				}
			endif
			social_networks_hide_load \{id = options_twitter}
		endif
		if (<continue> = 1)
			if (($register_account) = 0)
				twitter_add_text_item {
					choose_state = nullscript
					text = ($g_active_twitter_name)
					helper_text = qs(0x86be1220)
					not_focusable
				}
				<item_id> :se_setprops menurow_txt_item_dims = (400.0, 40.0)
				<item_id> :se_setprops menurow_txt_item_fit_width = truncate
				<name_id> = <item_id>
			endif
		else
			create_dialog_box {
				heading_text = qs(0x79597197)
				body_text = <error_string>
				no_background
				options = [
					{
						func = options_twitter_return_from_error
						text = qs(0x182f0173)
					}
				]
			}
			return
		endif
	endif
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
		formatText \{TextName = username_text
			qs(0xeaf34c0b)
			u = qs(0x26b2e4b2)}
	else
		<username> = qs(0xabc711d5)
		formatText TextName = username_text qs(0xeaf34c0b) u = <username>
	endif
	formatText TextName = username_prompt qs(0x9fb8175c) s = ($g_twitter_tm_string)
	twitter_add_text_item {
		choose_state = uistate_edit_name
		choose_params = {
			is_popup
			char_limit = 127
			default_name = qs(0x03ac90f0)
			title = <username_prompt>
			device_num = ($primary_controller)
			accept_script = ui_options_twitter_accept_username
			accept_params = {savegame = <savegame>}
			cancel_script = ui_options_twitter_cancel_edit_name
			no_show_history = <no_show_history>
			z_priority = (($g_options_facebook_twitter_z_priority) + 1000)
			allowed_sets = [upper lower number Misc]
			misc_characters = qs(0xcc9fa200)
		}
		text = <username_text>
		helper_text = qs(0x7491f215)
		<focusable_params>
		menurow_txt_item_dims = (600.0, 40.0)
		menurow_txt_item_fit_width = `\ltruncate`
	}
	if NOT (<password> = qs(0x03ac90f0))
		<password> = qs(0xabc711d5)
	endif
	if (<password> = qs(0x03ac90f0))
		formatText \{TextName = password_text
			qs(0x123e3c95)
			p = qs(0x26b2e4b2)}
	else
		formatText TextName = password_text qs(0x123e3c95) p = <password>
	endif
	formatText TextName = password_prompt qs(0x26452c51) s = ($g_twitter_tm_string)
	twitter_add_text_item {
		choose_state = uistate_edit_name
		choose_params = {
			is_popup
			char_limit = 35
			default_name = qs(0x03ac90f0)
			title = <password_prompt>
			device_num = ($primary_controller)
			accept_script = ui_options_twitter_accept_password
			accept_params = {savegame = <savegame>}
			cancel_script = ui_options_twitter_cancel_edit_name
			no_show_history = <no_show_history>
			z_priority = (($g_options_facebook_twitter_z_priority) + 1000)
			is_censored = 1
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
		<item_text> = qs(0x34db5bf4)
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
	<focusable_params> = {}
	if NOT twitter_check_is_registered_flag
		<focusable_params> = {not_focusable}
	endif
	if (($register_account) = 0)
		twitter_add_text_item {
			choose_script = social_networks_display_accounts
			choose_params = {
				network = twitter
				previous_menu_id = options_twitter_vmenu
				mainmenu_item_id = <name_id>
				return_script = ui_options_twitter_add_helper_text
			}
			text = qs(0x5d081f3b)
			helper_text = qs(0x7b0f36b2)
			<focusable_params>
		}
	endif
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
						menustate = Generic
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
					menustate = Generic
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
	if options_twitter :GetSingleTag \{use_mainmenu_bg}
		if (<use_mainmenu_bg> = 1)
			destroy_mainmenu_bg
		endif
	endif
	clean_up_user_control_helpers
	if ScreenElementExists \{id = options_twitter}
		DestroyScreenElement \{id = options_twitter}
	endif
endscript

script ui_deinit_options_twitter 
	push_unload_social_networks_choose_pak
	Change \{register_account = 0}
endscript

script ui_return_options_twitter \{return_script = None
		return_params = {
		}}
	printf \{qs(0xa6221efc)}
	printstruct <...>
	ui_options_twitter_add_helper_text
	if NOT (<return_script> = None)
		spawnscript ui_return_options_twitter_spawned params = {
			return_script = <return_script>
			return_params = <return_params>
		}
	endif
endscript

script ui_return_options_twitter_spawned \{return_script = None
		return_params = {
		}}
	ui_event_wait_for_safe
	if NOT (<return_script> = None)
		<return_script> <return_params>
	endif
endscript

script ui_options_twitter_add_helper_text \{from_boot = 0}
	clean_up_user_control_helpers
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
			Type = twitter
			no_accept = 1
		}}
endscript

script ui_options_twitter_choose_register 
	<username> = ($g_options_twitter_temp_info.username)
	<password> = ($g_options_twitter_temp_info.password)
	if ScreenElementExists \{id = options_twitter}
		options_twitter :Obj_SpawnScriptNow \{social_networks_animate_load}
	endif
	if ScreenElementExists \{id = options_twitter_vmenu}
		clean_up_user_control_helpers
		LaunchEvent \{Type = unfocus
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

script ui_options_twitter_did_register \{did_succeed = !i1768515945
		return_state = None}
	social_networks_hide_load
	if (<did_succeed> = 0)
		social_networks_get_error_string error_code = <error_code> controller = <controller> network = twitter dev_error_code = <dev_error_code>
		formatText TextName = body_text qs(0xc69b09b6) t = ($g_twitter_string) e = <error_string>
		generic_event_choose state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0x5a260fdc)
			body_text = <body_text>
		}
	else
		Change \{register_account = 0}
		Change \{g_options_twitter_should_refetch_data = 1}
		Change \{g_options_twitter_did_register = 1}
		options_twitter :GetTags
		if (<return_state> = None)
			if (<from_boot> = 1)
				return_script = ui_social_networks_setup_continue
				return_params = {}
				back_script = ui_social_networks_setup_continue
				back_params = {}
			else
				return_script = ui_options_twitter_back_and_refresh
				return_params = {register_new_account = 0}
				back_script = ui_options_twitter_back_and_refresh
				back_params = {register_new_account = 0}
			endif
		else
			return_script = ui_social_networks_return_to_social_networks_choose
			return_params = {
				state = <return_state>
				return_params = <return_params>
			}
			back_script = ui_social_networks_return_to_social_networks_choose
			back_params = <return_params>
		endif
		body_text = qs(0x56728c95)
		generic_event_choose state = uistate_generic_dialog_box data = {
			is_popup
			is_social_share
			template = cancel_confirm
			heading_text = qs(0x2f09a459)
			body_text = <body_text>
			options = [
				{
					func = <return_script>
					func_params = <return_params>
					text = qs(0x182f0173)
				}
			]
		}
	endif
endscript

script ui_options_twitter_choose_unregister 
	formatText TextName = body_text qs(0x9e655dab) t = ($g_twitter_tm_string)
	generic_event_choose state = uistate_generic_dialog_box data = {
		is_popup
		template = cancel_confirm
		heading_text = qs(0x34db5bf4)
		body_text = <body_text>
		confirm_func = twitter_unregister
		confirm_func_params = {controller = ($primary_controller) callback = ui_options_twitter_did_unregister controller = <device_num>}
		cancel_func = ui_options_twitter_back_and_refresh
	}
endscript

script ui_options_twitter_did_unregister \{did_succeed = !i1768515945}
	if (<did_succeed> = 0)
		social_networks_get_error_string error_code = <error_code> controller = <controller> network = twitter dev_error_code = <dev_error_code>
		formatText TextName = body_text qs(0xbdcfb682) t = ($g_twitter_string) e = <error_string>
		generic_event_replace state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0xb1245fb5)
			body_text = <body_text>
		}
	else
		Change \{g_options_twitter_did_register = 0}
		Change \{g_options_twitter_temp_info = {
				username = qs(0x03ac90f0)
				password = qs(0x03ac90f0)
			}}
		Change \{g_options_twitter_should_refetch_data = 1}
		formatText TextName = body_text qs(0x35913383) t = ($g_twitter_tm_string)
		generic_event_replace state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0xd1b4a1bb)
			body_text = <body_text>
			confirm_func = ui_options_twitter_back_and_refresh
		}
	endif
endscript

script ui_options_twitter_accept_username 
	ui_sfx \{menustate = Generic
		uitype = select}
	if isngc
		Change g_options_twitter_temp_info = (($g_options_twitter_temp_info) + {username = <text>})
	else
		Change g_options_twitter_temp_info = {($g_options_twitter_temp_info) username = <text>}
	endif
	ui_options_twitter_back_and_refresh
endscript

script ui_options_twitter_accept_password 
	ui_sfx \{menustate = Generic
		uitype = select}
	if isngc
		Change g_options_twitter_temp_info = (($g_options_twitter_temp_info) + {password = <text>})
	else
		Change g_options_twitter_temp_info = {($g_options_twitter_temp_info) password = <text>}
	endif
	ui_options_twitter_back_and_refresh
endscript

script ui_options_twitter_back_and_refresh \{register_new_account = 0}
	ui_event_get_top_base_name
	if NOT (<base_name> = 'options_twitter')
		generic_event_back
	else
		destroy_dialog_box
	endif
	spawnscript ui_options_twitter_back_and_refresh_spawned params = {register_new_account = <register_new_account>}
endscript

script ui_options_twitter_back_and_refresh_spawned 
	ui_event_wait_for_safe
	ui_event event = menu_refresh data = {register_new_account = <register_new_account>}
endscript

script ui_options_twitter_cancel_edit_name 
	ui_sfx \{menustate = Generic
		uitype = back}
	ui_options_twitter_back_and_refresh
endscript

script ui_options_twitter_check_settings \{state = uistate_options_game_setup
		return_state = None}
	printf \{'--- ui_options_facebook_check_settings ---'}
	options_twitter :GetTags
	if (<return_state> = None)
		exit_func = generic_event_back
		exit_func_params = {state = <state>}
	else
		exit_func = ui_social_networks_return_to_social_networks_choose
		exit_func_params = {
			state = <return_state>
			return_params = <return_params>
		}
	endif
	if (<from_boot> = 1)
		<exit_func> = ui_social_networks_setup_continue
	endif
	<username> = ($g_options_twitter_temp_info.username)
	<password> = ($g_options_twitter_temp_info.password)
	if (($register_account) = 0)
		<username> = qs(0x03ac90f0)
		<password> = qs(0x03ac90f0)
	endif
	if (<username> = qs(0x03ac90f0) && <password> = qs(0x03ac90f0))
		<exit_func> <exit_func_params> from_dialog_box = 0
		return
	endif
	generic_event_choose state = uistate_generic_dialog_box data = {
		is_popup
		heading_text = qs(0xaa163738)
		body_text = (qs(0x4c73f616) + ($g_twitter_string) + qs(0x051327f7) + ($g_twitter_string) + qs(0x715b1052))
		template = cancel_confirm
		options = [
			{
				func = ui_options_twitter_back_and_refresh
				text = qs(0xf7723015)
			}
			{
				func = <exit_func>
				func_params = <exit_func_params>
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
	if GotParam \{not_focusable}
		<mainmenu_item_id> :se_setprops menurow_txt_item_rgba = (($default_color_scheme).text_color)
	endif
	return item_id = <mainmenu_item_id>
endscript

script options_twitter_return_from_error 
	destroy_dialog_box
	ui_options_twitter_check_settings
endscript

script options_twitter_register_new_account 
	destroy_social_network_accounts_menu
	privacy_policy_cancel_script = None
	privacy_policy_cancel_params = {}
	if ScreenElementExists \{id = social_networks_broadcast_choose}
		social_networks_broadcast_choose :GetTags
		<privacy_policy_cancel_script> = <return_script>
		<privacy_policy_cancel_params> = <return_params>
		return_params = {
			is_social_share
			is_popup
			func_params = <func_params>
			back_script = <back_script>
			back_params = <back_params>
			message_id = <message_id>
		}
		next_state_params = {
			state = uistate_options_twitter
			is_popup
			return_state = uistate_social_networks_choose
			return_params = <return_params>
			use_mainmenu_bg = 0
			register_new_account = 1
		}
	else
		next_state_params = {register_new_account = 1}
	endif
	generic_event_replace {
		state = uistate_privacy_policy
		data = {
			is_popup
			Type = facebook
			next_state = uistate_options_twitter
			next_state_params = <next_state_params>
			back_params = {
				data = {
					return_script = <privacy_policy_cancel_script>
					return_params = <privacy_policy_cancel_params>
				}
			}
		}
	}
endscript
