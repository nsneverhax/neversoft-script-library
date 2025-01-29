g_options_facebook_temp_info = {
	username = qs(0x03ac90f0)
	password = qs(0x03ac90f0)
}
g_options_facebook_did_register = 0
g_options_facebook_should_refetch_data = 0
register_account = 0
g_options_facebook_twitter_z_priority = 1200.0

script ui_init_options_facebook 
	Change \{register_account = 0}
	Change \{g_options_facebook_should_refetch_data = 0}
	Change \{g_options_facebook_temp_info = {
			username = qs(0x03ac90f0)
			password = qs(0x03ac90f0)
		}}
	push_load_social_networks_choose_pak
endscript

script ui_create_options_facebook \{from_boot = 0
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
		id = options_facebook
		Type = descinterface
		desc = 'options_social'
		page_head_text = ($g_facebook_string)
		exclusive_device = ($primary_controller)
		z_priority = ($g_options_facebook_twitter_z_priority)
		tags = {
			from_boot = <from_boot>
			use_mainmenu_bg = <use_mainmenu_bg>
			return_state = <return_state>
			return_params = <return_params>
		}
	}
	title_header = qs(0xb4cb46be)
	options_facebook :se_setprops title_text = <title_header>
	if NOT options_facebook :desc_resolvealias \{Name = alias_social_menu}
		ScriptAssert \{qs(0xbb37c706)}
	endif
	AssignAlias id = <resolved_id> alias = options_facebook_vmenu
	name_id = None
	if ((<from_boot> = 0) && (($register_account) = 0))
		continue = 0
		GetArraySize ($g_registered_facebook_accounts)
		if (($g_options_facebook_should_refetch_data = 0) && (<array_Size> > 0))
			<continue> = 1
			facebook_figured_out_can_post \{Result = success
				registered = 1
				controller_index = 0}
		else
			Change \{g_options_facebook_should_refetch_data = 0}
			options_facebook :social_networks_animate_load
			facebook_get_info
			facebook_get_registered_accounts
			Block \{Type = social_networks_get_registered_accounts}
			if (<event_data>.Result = success)
				<continue> = 1
				social_network_menu_cache_accounts {
					accounts = (<event_data>.registered_accounts)
					network = facebook
					active_account_id = (<facebook_info>.account_id)
				}
				GetArraySize (<event_data>.registered_accounts)
				if (<array_Size> = 0)
					printf \{'no registered accounts, setting register_account = 1'}
					Change \{register_account = 1}
					facebook_figured_out_can_post \{Result = success
						registered = 0
						controller_index = 0}
				elseif (<array_Size> > 0)
					facebook_figured_out_can_post \{Result = success
						registered = 1
						controller_index = 0}
				endif
			else
				social_networks_get_error_string {
					error_code = (<event_data>.error_code)
					controller = 0
					network = facebook
					dev_error_code = (<event_data>.dev_error_code)
				}
			endif
			social_networks_hide_load \{id = options_facebook}
		endif
		if (<continue> = 1)
			if (($register_account) = 0)
				facebook_add_text_item {
					choose_state = nullscript
					text = ($g_active_facebook_name)
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
						func = options_facebook_return_from_error
						text = qs(0x182f0173)
					}
				]
			}
			return
		endif
	endif
	add_generic_menu_up_down_sound_handlers parent = <resolved_id>
	get_savegame_from_controller controller = ($primary_controller)
	facebook_get_info controller = ($primary_controller)
	<username> = ($g_options_facebook_temp_info.username)
	<password> = ($g_options_facebook_temp_info.password)
	<focusable_params> = {}
	if facebook_check_is_registered_flag
		<username> = qs(0xabc711d5)
		<password> = qs(0xabc711d5)
		<focusable_params> = {not_focusable}
	endif
	if (<username> = qs(0x03ac90f0))
		formatText \{TextName = username_text
			qs(0xfd0b0244)
			u = qs(0x26b2e4b2)}
	else
		<username> = qs(0xabc711d5)
		formatText TextName = username_text qs(0xfd0b0244) u = <username>
	endif
	email_prompt = qs(0xb71bd083)
	facebook_add_text_item {
		choose_state = uistate_edit_name
		choose_params = {
			is_popup
			char_limit = 127
			default_name = qs(0x03ac90f0)
			title = <email_prompt>
			device_num = ($primary_controller)
			accept_script = ui_options_facebook_accept_username
			cancel_script = ui_options_facebook_cancel_edit_name
			no_show_history = <no_show_history>
			z_priority = (($g_options_facebook_twitter_z_priority) + 1000)
			allowed_sets = [upper lower number Misc]
			misc_characters = qs(0xcc9fa200)
		}
		text = <username_text>
		helper_text = qs(0xf6ba1774)
		<focusable_params>
		menurow_txt_item_dims = (600.0, 40.0)
	}
	<item_id> :se_setprops menurow_txt_item_fit_width = `\ltruncate`
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
	password_prompt = qs(0x814a6267)
	facebook_add_text_item {
		choose_state = uistate_edit_name
		choose_params = {
			is_popup
			char_limit = 35
			default_name = qs(0x03ac90f0)
			title = <password_prompt>
			device_num = ($primary_controller)
			accept_script = ui_options_facebook_accept_password
			accept_params = {controller = ($primary_controller)}
			cancel_script = ui_options_facebook_cancel_edit_name
			no_show_history = <no_show_history>
			z_priority = (($g_options_facebook_twitter_z_priority) + 1000)
			is_censored = 1
		}
		text = <password_text>
		helper_text = qs(0xfc882c42)
		menurow_txt_item_dims = (600.0, 40.0)
		<focusable_params>
	}
	<item_id> :se_setprops menurow_txt_item_fit_width = `\ltruncate`
	facebook_add_text_item \{choose_script = nullscript
		choose_params = {
		}
		text = qs(0x03ac90f0)
		helper_text = qs(0x03ac90f0)
		not_focusable}
	<item_text> = qs(0xf2f5ef0e)
	<choose_script> = ui_options_facebook_choose_register
	<texture> = black
	<focusable_params> = {not_focusable}
	if facebook_check_is_registered_flag
		<item_text> = qs(0x21a08b41)
		<choose_script> = ui_options_facebook_choose_unregister
		<texture> = white
		<focusable_params> = {}
	else
		<focusable_params> = {}
		if ($social_networks_tester_mode = 1)
			<focusable_params> = {not_focusable}
			if social_networks_string_contains_prefix string = ($g_options_facebook_temp_info.username) prefix = ($g_social_networks_required_prefix)
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
	facebook_add_text_item {
		choose_script = <choose_script>
		text = <item_text>
		helper_text = qs(0x39366f03)
		<focusable_params>
	}
	<focusable_params> = {}
	if NOT facebook_check_is_registered_flag
		<focusable_params> = {not_focusable}
	endif
	if (($register_account) = 0)
		facebook_add_text_item {
			choose_script = social_networks_display_accounts
			choose_params = {
				network = facebook
				previous_menu_id = options_facebook_vmenu
				mainmenu_item_id = <name_id>
				return_script = ui_options_facebook_add_helper_text
			}
			text = qs(0x5d081f3b)
			helper_text = qs(0x7b0f36b2)
			<focusable_params>
		}
	endif
	facebook_add_text_item \{choose_script = ui_options_facebook_check_settings
		choose_params = {
		}
		text = qs(0xaf4d5dd2)
		helper_text = qs(0x03ac90f0)}
	clean_up_user_control_helpers
	if NOT (<from_boot> = 1)
		options_facebook_vmenu :se_setprops \{event_handlers = [
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
					ui_options_facebook_check_settings
				}
			]}
	endif
	options_facebook_vmenu :se_setprops \{event_handlers = [
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
				ui_options_facebook_choose_privacy_policy
			}
		]}
	ui_options_facebook_add_helper_text from_boot = <from_boot>
endscript

script ui_destroy_options_facebook 
	if options_facebook :GetSingleTag \{use_mainmenu_bg}
		if (<use_mainmenu_bg> = 1)
			destroy_mainmenu_bg
		endif
	endif
	clean_up_user_control_helpers
	if ScreenElementExists \{id = options_facebook}
		DestroyScreenElement \{id = options_facebook}
	endif
endscript

script ui_deinit_options_facebook 
	push_unload_social_networks_choose_pak
	Change \{register_account = 0}
endscript

script ui_return_options_facebook \{return_script = None
		return_params = {
		}}
	printf \{qs(0xa09f7d84)}
	printstruct <...>
	ui_options_facebook_add_helper_text
	if NOT (<return_script> = None)
		<return_script> <return_params>
	endif
endscript

script ui_options_facebook_add_helper_text \{from_boot = 0}
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

script ui_options_facebook_choose_register 
	<username> = ($g_options_facebook_temp_info.username)
	<password> = ($g_options_facebook_temp_info.password)
	if ScreenElementExists \{id = options_facebook}
		options_facebook :Obj_SpawnScriptNow \{social_networks_animate_load}
	endif
	if ScreenElementExists \{id = options_facebook_vmenu}
		clean_up_user_control_helpers
		LaunchEvent \{Type = unfocus
			target = options_facebook_vmenu}
	endif
	facebook_register {
		username = <username>
		password = <password>
		callback = ui_options_facebook_did_register
		callback_params = {controller = <device_num>}
		controller = <device_num>
	}
endscript

script ui_options_facebook_did_register \{did_succeed = !i1768515945}
	social_networks_hide_load
	if (<did_succeed> = 0)
		social_networks_get_error_string error_code = <error_code> controller = <controller> network = facebook dev_error_code = <dev_error_code>
		formatText TextName = body_text qs(0x4a2a6e89) f = ($g_facebook_string) e = <error_string>
		generic_event_choose state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0x5a260fdc)
			body_text = <body_text>
		}
	else
		Change \{register_account = 0}
		Change \{g_options_facebook_should_refetch_data = 1}
		Change \{g_options_facebook_did_register = 1}
		options_facebook :GetTags
		if (<return_state> = None)
			if (<from_boot> = 1)
				return_script = ui_social_networks_setup_continue
				return_params = {}
				back_script = ui_social_networks_setup_continue
				back_params = {}
			else
				return_script = ui_options_facebook_back_and_refresh
				return_params = {register_new_account = 0}
				back_script = ui_options_facebook_back_and_refresh
				back_params = {}
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
		formatText TextName = body_text qs(0x48f734cc) f = ($g_facebook_string)
		if (<return_state> = None)
			formatText TextName = body_text qs(0xf1b9c5ec) f = ($g_facebook_string)
			generic_event_choose state = uistate_generic_dialog_box data = {
				is_popup
				is_social_share
				template = cancel_confirm
				heading_text = ($g_facebook_string)
				body_text = <body_text>
				options = [
					{
						func = <return_script>
						func_params = <return_params>
						text = qs(0x494b4d7f)
					}
				]
			}
		else
			generic_event_choose state = uistate_generic_dialog_box data = {
				is_popup
				is_social_share
				template = continue
				heading_text = ($g_facebook_string)
				body_text = <body_text>
				confirm_func = <return_script>
				confirm_func_params = <return_params>
			}
		endif
	endif
endscript

script ui_options_facebook_choose_unregister 
	body_text = qs(0xb84910f0)
	heading_text = qs(0x4f5954ab)
	generic_event_choose state = uistate_generic_dialog_box data = {
		is_popup
		template = cancel_confirm
		heading_text = <heading_text>
		body_text = <body_text>
		confirm_func = facebook_unregister
		confirm_func_params = {controller = ($primary_controller) callback = ui_options_facebook_did_unregister controller = <device_num>}
		cancel_func = ui_options_facebook_back_and_refresh
	}
endscript

script ui_options_facebook_did_unregister \{did_succeed = !i1768515945}
	if (<did_succeed> = 0)
		social_networks_get_error_string error_code = <error_code> controller = <controller> network = facebook dev_error_code = <dev_error_code>
		formatText TextName = body_text qs(0x58beaa7c) f = ($g_facebook_string) e = <error_string>
		generic_event_replace state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0xb1245fb5)
			body_text = <body_text>
		}
	else
		Change \{g_options_facebook_did_register = 0}
		Change \{g_options_facebook_temp_info = {
				username = qs(0x03ac90f0)
				password = qs(0x03ac90f0)
			}}
		Change \{g_options_facebook_should_refetch_data = 1}
		body_text = qs(0x428a85ee)
		generic_event_replace state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0xd1b4a1bb)
			body_text = <body_text>
			confirm_func = ui_options_facebook_back_and_refresh
		}
	endif
endscript

script ui_options_facebook_accept_username 
	ui_sfx \{menustate = Generic
		uitype = select}
	if isngc
		Change g_options_facebook_temp_info = (($g_options_facebook_temp_info) + {username = <text>})
	else
		Change g_options_facebook_temp_info = {($g_options_facebook_temp_info) username = <text>}
	endif
	ui_options_facebook_back_and_refresh
endscript

script ui_options_facebook_accept_password 
	ui_sfx \{menustate = Generic
		uitype = select}
	if isngc
		Change g_options_facebook_temp_info = (($g_options_facebook_temp_info) + {password = <text>})
	else
		Change g_options_facebook_temp_info = {($g_options_facebook_temp_info) password = <text>}
	endif
	ui_options_facebook_back_and_refresh
endscript

script ui_options_facebook_back_and_refresh \{register_new_account = 0}
	ui_event_get_top_base_name
	if NOT (<base_name> = 'options_facebook')
		generic_event_back
	else
		destroy_dialog_box
	endif
	spawnscript ui_options_facebook_back_and_refresh_spawned params = {register_new_account = <register_new_account>}
endscript

script ui_options_facebook_back_and_refresh_spawned 
	ui_event_wait_for_safe
	ui_event event = menu_refresh data = {register_new_account = <register_new_account>}
endscript

script ui_options_facebook_choose_privacy_policy 
	generic_event_choose \{state = uistate_privacy_policy
		data = {
			is_popup
			Type = facebook
			no_accept = 1
		}}
endscript

script ui_options_facebook_cancel_edit_name 
	ui_sfx \{menustate = Generic
		uitype = back}
	ui_options_facebook_back_and_refresh
endscript

script ui_options_facebook_check_settings \{state = uistate_options_game_setup}
	printf \{'--- ui_options_facebook_check_settings ---'}
	options_facebook :GetTags
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
	<username> = ($g_options_facebook_temp_info.username)
	<password> = ($g_options_facebook_temp_info.password)
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
		body_text = (qs(0x4c73f616) + ($g_facebook_nologo_string) + qs(0x051327f7) + ($g_facebook_nologo_string) + qs(0x715b1052))
		template = cancel_confirm
		options = [
			{
				func = ui_options_facebook_back_and_refresh
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

script facebook_add_text_item \{text = 0x69696969}
	mainmenu_setup_option {
		<...>
		parent = options_facebook_vmenu
		screen_id = options_facebook
		menu_item_text = <text>
	}
	if GotParam \{not_focusable}
		<mainmenu_item_id> :se_setprops menurow_txt_item_rgba = (($default_color_scheme).text_color)
	endif
	if GotParam \{menurow_txt_item_dims}
		<mainmenu_item_id> :se_setprops {
			menurow_txt_item_dims = <menurow_txt_item_dims>
			menurow_highlight_bar_pos = (((1.0, 0.0) * ((<menurow_txt_item_dims> [0]) / 2)) + ((0.0, 1.0) * 0))
			menurow_highlight_bar_dims = (((1.0, 0.0) * (<menurow_txt_item_dims> [0])) + ((0.0, 1.0) * (<menurow_txt_item_dims> [1])))
		}
	endif
	return item_id = <mainmenu_item_id>
endscript

script options_facebook_return_from_error 
	destroy_dialog_box
	ui_options_facebook_check_settings
endscript

script options_facebook_register_new_account 
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
			state = uistate_options_facebook
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
			next_state = uistate_options_facebook
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
