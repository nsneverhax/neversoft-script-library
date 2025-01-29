
script ui_create_options_twitter 
	uistack_createboundscreenelement \{parent = root_window
		id = 0x8ac77fac
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}}
	mainmenu_setup_physics_elements \{screen_id = 0x8ac77fac}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = 0x8ac77fac
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = 0x8ac77fac
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = 0x8ac77fac
		}}
	get_savegame_from_controller controller = ($primary_controller)
	twitter_get_info controller = ($primary_controller)
	<username> = (<twitter_info>.username)
	if (<username> = qs(0x03ac90f0))
		<username> = qs(0x26b2e4b2)
	endif
	formatText TextName = username_text qs(0xeaf34c0b) u = <username>
	mainmenu_setup_option {
		choose_state = uistate_edit_name
		choose_params = {
			is_popup
			char_limit = 20
			default_name = (<twitter_info>.username)
			title = qs(0xf36cebbd)
			device_num = ($primary_controller)
			accept_script = ui_options_twitter_accept_username
			accept_params = {savegame = <savegame>}
			no_show_history = <no_show_history>
		}
		back_script = 0xd353a1b2
		menu_item_text = <username_text>
		screen_id = 0x8ac77fac
		helper_text = qs(0x951c1b2b)
	}
	<mainmenu_item_id> :se_setprops menurow_txt_item_fit_width = truncate
	<mainmenu_item_id> :se_setprops menurow_txt_item_dims = (370.0, 35.0)
	<password> = qs(0x26b2e4b2)
	if NOT (<twitter_info>.password = qs(0x03ac90f0))
		get_censored_text text = (<twitter_info>.password)
		<password> = <censored_text>
	endif
	formatText TextName = password_text qs(0x123e3c95) p = <password>
	mainmenu_setup_option {
		choose_state = uistate_edit_name
		choose_params = {
			is_popup
			char_limit = 20
			default_name = (<twitter_info>.password)
			is_censored = 1
			title = qs(0x4a91d0b0)
			device_num = ($primary_controller)
			accept_script = ui_options_twitter_accept_password
			accept_params = {savegame = <savegame>}
			no_show_history = <no_show_history>
		}
		back_script = 0xd353a1b2
		menu_item_text = <password_text>
		screen_id = 0x8ac77fac
		helper_text = qs(0x1d05c57c)
	}
	<mainmenu_item_id> :se_setprops menurow_txt_item_fit_width = truncate
	<mainmenu_item_id> :se_setprops menurow_txt_item_dims = (375.0, 35.0)
	mainmenu_setup_option \{back_script = 0xd353a1b2
		menu_item_text = qs(0x2974ea41)
		screen_id = 0x8ac77fac
		helper_text = qs(0x63d21e38)}
	mainmenu_setup_option \{choose_script = 0xd353a1b2
		choose_params = {
		}
		back_script = 0xd353a1b2
		menu_item_text = qs(0x5fa3667c)
		screen_id = 0x8ac77fac
		helper_text = qs(0x00000000)}
	<focusable_params> = {}
	if (<twitter_info>.username = qs(0x03ac90f0) || <twitter_info>.password = qs(0x03ac90f0))
		<focusable_params> = {not_focusable}
	endif
	mainmenu_setup_option {
		choose_script = 0x502fc877
		choose_params = {}
		back_script = 0xd353a1b2
		menu_item_text = qs(0xd4b05a31)
		screen_id = 0x8ac77fac
		helper_text = qs(0x061fbe9a)
		<focusable_params>
	}
	<0x1edfa21c> = qs(0x3d260ff6)
	if (<twitter_info>.broadcast_enabled = 1)
		<0x1edfa21c> = qs(0x86e399d6)
	endif
	mainmenu_setup_option {
		choose_script = 0xe261c6ea
		choose_params = {
			broadcast_enabled = (1 - (<twitter_info>.broadcast_enabled))
		}
		back_script = 0xd353a1b2
		menu_item_text = <0x1edfa21c>
		screen_id = 0x8ac77fac
		helper_text = qs(0xafc8c459)
		<focusable_params>
	}
	<0xd901c79f> = {}
	if (<twitter_info>.username = qs(0x03ac90f0) && <twitter_info>.password = qs(0x03ac90f0))
		<0xd901c79f> = <focusable_params>
	endif
	mainmenu_setup_option {
		choose_state = uistate_generic_dialog_box
		choose_params = {
			is_popup
			heading_text = qs(0xaa163738)
			body_text = qs(0x0cb284b5)
			confirm_func = 0xe58dcfb2
			template = cancel_confirm
		}
		back_script = 0xd353a1b2
		menu_item_text = qs(0xd6d6c2be)
		screen_id = 0x8ac77fac
		helper_text = qs(0xa3ebfe58)
		<0xd901c79f>
	}
	ui_options_set_settings
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if GotParam \{0xebfcf363}
		current_menu :SetTags {user_options = <0xebfcf363>}
	else
		ui_options_set_settings
	endif
endscript

script ui_destroy_options_twitter 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = 0x8ac77fac}
		DestroyScreenElement \{id = 0x8ac77fac}
	endif
endscript

script 0x502fc877 
	formatText \{TextName = body_text
		qs(0x43155b99)
		m = qs(0xe717d22a)}
	generic_event_choose state = uistate_generic_dialog_box data = {
		template = cancel_confirm
		confirm_func = 0xb46d2200
		is_popup
		heading_text = qs(0xd4b05a31)
		body_text = <body_text>
	}
endscript

script 0xb46d2200 
	twitter_post \{message = qs(0xe717d22a)}
	current_menu :GetSingleTag \{user_options}
	generic_event_back data = {0xebfcf363 = <user_options>}
endscript

script 0xd353a1b2 
	twitter_get_info controller = ($primary_controller)
	if ((<twitter_info>.username = qs(0x03ac90f0) && <twitter_info>.password != qs(0x03ac90f0)) ||
			(<twitter_info>.username != qs(0x03ac90f0) && <twitter_info>.password = qs(0x03ac90f0)))
		generic_event_choose \{state = uistate_generic_dialog_box
			data = {
				template = cancel_confirm
				confirm_func = 0x2889328f
				is_popup
				heading_text = qs(0xaa163738)
				body_text = qs(0x7d903af1)
			}}
	else
		0x2889328f
	endif
endscript

script ui_options_twitter_choose_privacy_policy 
	generic_event_choose \{state = uistate_privacy_policy
		data = {
			is_popup
			Type = twitter
		}}
endscript

script 0x2889328f 
	0xf939648f
endscript

script 0xe58dcfb2 
	twitter_set_info controller = ($primary_controller) element = username value = qs(0x03ac90f0)
	twitter_set_info controller = ($primary_controller) element = password value = qs(0x03ac90f0)
	twitter_set_info controller = ($primary_controller) element = broadcast_enabled value = 1
	current_menu :GetSingleTag \{user_options}
	generic_event_back data = {0xebfcf363 = <user_options>}
	ui_event_wait \{event = menu_refresh}
endscript

script ui_options_twitter_accept_username 
	twitter_set_info controller = ($primary_controller) element = username value = <text>
	if 0x959f4979 controller = ($primary_controller)
		twitter_unregister controller = <controller>
		twitter_register username = (<twitter_info>.username) password = (<twitter_info>.password)
	endif
	current_menu :GetSingleTag \{user_options}
	generic_event_back data = {0xebfcf363 = <user_options>}
	ui_event_wait event = menu_refresh data = {0xebfcf363 = <user_options>}
endscript

script ui_options_twitter_accept_password 
	twitter_set_info controller = ($primary_controller) element = password value = <text>
	if 0x959f4979 controller = ($primary_controller)
		twitter_unregister controller = <controller>
		twitter_register username = (<twitter_info>.username) password = (<twitter_info>.password)
	endif
	current_menu :GetSingleTag \{user_options}
	generic_event_back data = {0xebfcf363 = <user_options>}
	ui_event_wait \{event = menu_refresh}
endscript

script 0xe261c6ea \{broadcast_enabled = !i1768515945}
	twitter_set_info controller = ($primary_controller) element = broadcast_enabled value = <broadcast_enabled>
	current_menu :GetSingleTag \{user_options}
	ui_event_add_params 0xebfcf363 = <user_options>
	ui_event_wait \{event = menu_refresh}
endscript
