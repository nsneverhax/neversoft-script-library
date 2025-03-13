g_options_facebook_temp_info = {
	username = qs(0x03ac90f0)
	password = qs(0x03ac90f0)
}
g_options_facebook_did_register = 0

script ui_init_options_facebook 
	change \{g_options_facebook_temp_info = {
			username = qs(0x03ac90f0)
			password = qs(0x03ac90f0)
		}}
endscript

script ui_create_options_facebook \{from_boot = 0}
	create_mainmenu_bg
	createscreenelement {
		parent = root_window
		id = options_facebook
		type = descinterface
		desc = 'options_social'
		page_head_text = ($g_facebook_string)
		exclusive_device = ($primary_controller)
		tags = {from_boot = <from_boot>}
	}
	title_header = qs(0x1893f291)
	if facebook_check_is_registered_flag
		title_header = qs(0x2bdce054)
	endif
	options_facebook :se_setprops title_text = <title_header>
	if NOT options_facebook :desc_resolvealias \{name = alias_social_menu}
		scriptassert \{qs(0xbb37c706)}
	endif
	assignalias id = <resolved_id> alias = options_facebook_vmenu
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
		formattext \{textname = username_text
			qs(0x9e23c924)
			u = qs(0x26b2e4b2)}
	else
		<username> = qs(0xabc711d5)
		formattext textname = username_text qs(0x9e23c924) u = <username>
	endif
	email_prompt = qs(0x1877604d)
	facebook_add_text_item {
		choose_state = uistate_os_edit_name
		choose_params = {
			is_popup
			char_limit = 127
			default_name = <username>
			title = <email_prompt>
			device_num = ($primary_controller)
			accept_script = ui_options_facebook_accept_username
			cancel_script = ui_options_facebook_cancel_edit_name
			no_show_history = <no_show_history>
			z_priority = 1010
			valid_characters = [
				$name_entry_upper_characters
				$name_entry_lower_characters
				$name_entry_number_characters
				$name_entry_email_characters
			]
			os_kb_flags = {xenon_email_input ps3_alphabet_input}
		}
		text = <username_text>
		helper_text = qs(0xf6ba1774)
		<focusable_params>
		menurow_txt_item_dims = (600.0, 40.0)
	}
	<item_id> :se_setprops menurow_txt_item_fit_width = `\ltruncate`
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
	password_prompt = qs(0xb9c82798)
	facebook_add_text_item {
		choose_state = uistate_os_edit_name
		choose_params = {
			is_popup
			char_limit = 35
			default_name = <uncensored_text>
			title = <password_prompt>
			device_num = ($primary_controller)
			accept_script = ui_options_facebook_accept_password
			accept_params = {controller = ($primary_controller)}
			cancel_script = ui_options_facebook_cancel_edit_name
			no_show_history = <no_show_history>
			z_priority = 1010
			valid_characters = []
			is_censored = 1
			os_kb_flags = {ps3_password_input xenon_password_input}
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
			if social_networks_string_contains_prefix string = ($g_options_facebook_temp_info.username) prefix = ($g_social_networks_required_prefix2)
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
						menustate = generic
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
					menustate = generic
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
	destroy_mainmenu_bg
	clean_up_user_control_helpers
	if screenelementexists \{id = options_facebook}
		destroyscreenelement \{id = options_facebook}
	endif
endscript

script ui_return_options_facebook 
	printf \{qs(0xa09f7d84)}
	printstruct <...>
	ui_event_wait \{event = menu_refresh}
endscript

script ui_options_facebook_add_helper_text \{from_boot = 0}
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
	if screenelementexists \{id = options_facebook}
		options_facebook :obj_spawnscriptnow \{social_networks_animate_load}
	endif
	if screenelementexists \{id = options_facebook_vmenu}
		clean_up_user_control_helpers
		launchevent \{type = unfocus
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
		social_networks_get_error_string error_code = <error_code> controller = <controller> network = facebook
		formattext textname = body_text qs(0x142dd555) f = ($g_facebook_string) e = <error_string>
		generic_event_choose state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0x5a260fdc)
			body_text = <body_text>
		}
	else
		change \{g_options_facebook_did_register = 1}
		change \{g_options_facebook_temp_info = {
				username = qs(0x03ac90f0)
				password = qs(0x03ac90f0)
			}}
		formattext textname = body_text qs(0xf1b9c5ec) f = ($g_facebook_string)
		generic_event_choose state = uistate_generic_dialog_box data = {
			is_popup
			is_social_share
			template = cancel_confirm
			heading_text = qs(0x7ab8ac58)
			body_text = <body_text>
			options = [
				{
					func = ui_options_facebook_back_and_refresh
					text = qs(0x494b4d7f)
				}
			]
		}
	endif
endscript

script ui_options_facebook_choose_unregister 
	body_text = qs(0xa0efc234)
	heading_text = qs(0x11e3f229)
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
		social_networks_get_error_string error_code = <error_code> controller = <controller> network = facebook
		formattext textname = body_text qs(0x2980146c) f = ($g_facebook_string) e = <error_string>
		generic_event_replace state = uistate_generic_dialog_box data = {
			is_popup
			template = continue
			heading_text = qs(0xb1245fb5)
			body_text = <body_text>
		}
	else
		change \{g_options_facebook_did_register = 0}
		change \{g_options_facebook_temp_info = {
				username = qs(0x03ac90f0)
				password = qs(0x03ac90f0)
			}}
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

script ui_options_facebook_choose_test_post 
	if screenelementexists \{id = dialog_box_desc_id}
		dialog_box_desc_id :obj_spawnscriptnow \{social_networks_animate_load}
	elseif screenelementexists \{id = options_facebook}
		options_facebook :obj_spawnscriptnow \{social_networks_animate_load}
	endif
	social_networks_get_message message_id = test_update network = facebook controller = ($primary_controller)
	facebook_post {
		message_struct = <message_struct>
		callback = ui_options_facebook_did_post
		callback_params = {retry_on_fail = 1 controller = <device_num>}
	}
endscript

script ui_options_facebook_did_post \{message_struct = 0x69696969
		did_succeed = !i1768515945
		status = !q1768515945
		retry_on_fail = !i1768515945}
	social_networks_hide_load
	<username> = ($g_options_facebook_temp_info.username)
	<password> = ($g_options_facebook_temp_info.password)
	if (<did_succeed> = 1)
		formattext textname = body_text qs(0xc593791c) f = ($g_facebook_string)
		create_dialog_box {
			heading_text = qs(0xdd4db710)
			body_text = <body_text>
			options = [
				{
					func = ui_options_facebook_back_and_refresh
					text = qs(0x182f0173)
				}
			]
			no_background
		}
	else
		if (<retry_on_fail> = 1 && <username> != qs(0x03ac90f0) && <password> != qs(0x03ac90f0))
			facebook_post {
				message_struct = <message_struct>
				callback = ui_options_facebook_did_post
				callback_params = {retry_on_fail = 0 controller = <controller>}
			}
		else
			social_networks_get_error_string error_code = <error_code> controller = <controller> network = facebook
			formattext textname = body_text qs(0x611fcbae) f = ($g_facebook_string) e = <error_string>
			create_dialog_box {
				heading_text = qs(0xe7187b7e)
				body_text = <body_text>
				options = [
					{
						func = ui_options_facebook_back_and_refresh
						text = qs(0x182f0173)
					}
				]
				no_background
			}
		endif
	endif
	if screenelementexists \{id = options_facebook_vmenu}
		launchevent \{type = unfocus
			target = options_facebook_vmenu}
	endif
	launchevent type = focus target = <menu_id>
endscript

script ui_options_facebook_accept_username 
	ui_sfx \{menustate = generic
		uitype = select}
	change g_options_facebook_temp_info = {($g_options_facebook_temp_info) username = <text>}
	ui_options_facebook_back_and_refresh
endscript

script ui_options_facebook_accept_password 
	ui_sfx \{menustate = generic
		uitype = select}
	change g_options_facebook_temp_info = {($g_options_facebook_temp_info) password = <text>}
	ui_options_facebook_back_and_refresh
endscript

script ui_options_facebook_back_and_refresh 
	ui_event_get_top
	if NOT (<base_name> = 'options_facebook')
		generic_event_back
	else
		destroy_dialog_box
	endif
	ui_event_wait \{event = menu_refresh}
endscript

script ui_options_facebook_choose_privacy_policy 
	generic_event_choose \{state = uistate_privacy_policy
		data = {
			is_popup
			type = facebook
			no_accept = 1
		}}
endscript

script ui_options_facebook_cancel_edit_name 
	ui_sfx \{menustate = generic
		uitype = back}
	ui_options_facebook_back_and_refresh
endscript

script ui_options_facebook_check_settings \{state = uistate_options_game_setup}
	<exit_func> = generic_event_back
	options_facebook :getsingletag \{from_boot}
	if (<from_boot> = 1)
		<exit_func> = ui_social_networks_setup_continue
	endif
	<username> = ($g_options_facebook_temp_info.username)
	<password> = ($g_options_facebook_temp_info.password)
	if (<username> = qs(0x03ac90f0) && <password> = qs(0x03ac90f0))
		<exit_func> state = <state>
		return
	endif
	generic_event_choose state = uistate_generic_dialog_box data = {
		is_popup
		heading_text = qs(0xaa163738)
		body_text = (qs(0x4c73f616) + ($g_facebook_nologo_string) + qs(0xd1bf7fa9) + ($g_facebook_nologo_string) + qs(0x715b1052))
		template = cancel_confirm
		options = [
			{
				func = ui_options_facebook_back_and_refresh
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

script facebook_add_text_item \{text = 0x69696969}
	mainmenu_setup_option {
		<...>
		parent = options_facebook_vmenu
		screen_id = options_facebook
		menu_item_text = <text>
	}
	if gotparam \{not_focusable}
		<mainmenu_item_id> :se_setprops menurow_txt_item_rgba = (($default_color_scheme).text_color)
	endif
	if gotparam \{menurow_txt_item_dims}
		<mainmenu_item_id> :se_setprops {
			menurow_txt_item_dims = <menurow_txt_item_dims>
			menurow_highlight_bar_pos = (((1.0, 0.0) * ((<menurow_txt_item_dims> [0]) / 2)) + ((0.0, 1.0) * 0))
			menurow_highlight_bar_dims = (((1.0, 0.0) * (<menurow_txt_item_dims> [0])) + ((0.0, 1.0) * (<menurow_txt_item_dims> [1])))
		}
	endif
	return item_id = <mainmenu_item_id>
endscript
