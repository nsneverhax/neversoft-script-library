
script ui_create_options_facebook \{from_mainmenu = 0}
	uistack_createboundscreenelement \{parent = root_window
		id = 0x5abc1765
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}}
	mainmenu_setup_physics_elements \{screen_id = 0x5abc1765}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = 0x5abc1765
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = 0x5abc1765
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = 0x5abc1765
		}}
	get_savegame_from_controller controller = ($primary_controller)
	facebook_get_info controller = ($primary_controller)
	<username> = (<facebook_info>.username)
	if (<username> = qs(0x03ac90f0))
		<username> = qs(0x26b2e4b2)
	endif
	formatText TextName = username_text qs(0xeaf34c0b) u = <username>
	mainmenu_setup_option {
		choose_state = uistate_edit_name
		choose_params = {
			is_popup
			char_limit = 50
			default_name = (<facebook_info>.username)
			title = qs(0xf36cebbd)
			device_num = ($primary_controller)
			accept_script = ui_options_facebook_accept_username
			accept_params = {controller = ($primary_controller)}
			no_show_history = <no_show_history>
		}
		back_script = 0x3da159cc
		menu_item_text = <username_text>
		screen_id = 0x5abc1765
		helper_text = qs(0x3be82c09)
	}
	<mainmenu_item_id> :se_setprops menurow_txt_item_dims = (370.0, 35.0)
	<mainmenu_item_id> :se_setprops menurow_txt_item_fit_width = truncate
	<password> = qs(0x26b2e4b2)
	if NOT (<facebook_info>.password = qs(0x03ac90f0))
		get_censored_text text = (<facebook_info>.password)
		<password> = <censored_text>
	endif
	formatText TextName = password_text qs(0x123e3c95) p = <password>
	mainmenu_setup_option {
		choose_state = uistate_edit_name
		choose_params = {
			is_popup
			char_limit = 50
			default_name = (<facebook_info>.password)
			is_censored = 1
			title = qs(0x4a91d0b0)
			device_num = ($primary_controller)
			accept_script = ui_options_facebook_accept_password
			accept_params = {controller = ($primary_controller)}
			no_show_history = <no_show_history>
		}
		back_script = 0x3da159cc
		menu_item_text = <password_text>
		screen_id = 0x5abc1765
		helper_text = qs(0xb3f1f25e)
	}
	<mainmenu_item_id> :se_setprops menurow_txt_item_dims = (370.0, 35.0)
	<mainmenu_item_id> :se_setprops menurow_txt_item_fit_width = truncate
	mainmenu_setup_option \{back_script = 0x3da159cc
		menu_item_text = qs(0x2974ea41)
		screen_id = 0x5abc1765
		helper_text = qs(0x63d21e38)}
	mainmenu_setup_option \{choose_script = 0x3da159cc
		choose_params = {
		}
		back_script = 0x3da159cc
		menu_item_text = qs(0x5fa3667c)
		screen_id = 0x5abc1765
		helper_text = qs(0x00000000)}
	<focusable_params> = {}
	if (<facebook_info>.username = qs(0x03ac90f0) || <facebook_info>.password = qs(0x03ac90f0))
		<focusable_params> = {not_focusable}
	endif
	mainmenu_setup_option {
		choose_script = 0x81967546
		choose_params = {}
		back_script = 0x3da159cc
		menu_item_text = qs(0xd4b05a31)
		screen_id = 0x5abc1765
		helper_text = qs(0x66bf7d83)
		<focusable_params>
	}
	<0x1edfa21c> = qs(0x3d260ff6)
	if ((<facebook_info>.broadcast_enabled) = 1)
		<0x1edfa21c> = qs(0x86e399d6)
	endif
	mainmenu_setup_option {
		choose_script = 0x33d87bdb
		choose_params = {
			broadcast_enabled = (1 - (<facebook_info>.broadcast_enabled))
		}
		back_script = 0x3da159cc
		menu_item_text = <0x1edfa21c>
		screen_id = 0x5abc1765
		helper_text = qs(0x5d233059)
		<focusable_params>
	}
	<0xd901c79f> = {}
	if (<facebook_info>.username = qs(0x03ac90f0) && <facebook_info>.password = qs(0x03ac90f0))
		<0xd901c79f> = <focusable_params>
	endif
	mainmenu_setup_option {
		choose_state = uistate_generic_dialog_box
		choose_params = {
			is_popup
			heading_text = qs(0xaa163738)
			body_text = qs(0xc7772d56)
			confirm_func = 0xceaa8b0f
			template = cancel_confirm
		}
		back_script = 0x3da159cc
		menu_item_text = qs(0xd6d6c2be)
		screen_id = 0x5abc1765
		helper_text = qs(0x80de769e)
		<0xd901c79f>
	}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
	if GotParam \{0xebfcf363}
		current_menu :SetTags {user_options = <0xebfcf363>}
	else
		ui_options_set_settings
	endif
endscript

script ui_destroy_options_facebook 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = 0x5abc1765}
		DestroyScreenElement \{id = 0x5abc1765}
	endif
endscript

script 0x81967546 
	formatText \{TextName = body_text
		qs(0xd84ac1be)
		m = qs(0xe717d22a)}
	generic_event_choose state = uistate_generic_dialog_box data = {
		template = cancel_confirm
		confirm_func = 0xe5629b87
		is_popup
		heading_text = qs(0xd4b05a31)
		body_text = <body_text>
	}
endscript

script 0xe5629b87 
	facebook_post \{message = qs(0xe717d22a)}
	current_menu :GetSingleTag \{user_options}
	generic_event_back data = {0xebfcf363 = <user_options>}
endscript

script 0x3da159cc 
	facebook_get_info controller = ($primary_controller)
	if ((<facebook_info>.username = qs(0x03ac90f0) && <facebook_info>.password != qs(0x03ac90f0)) ||
			(<facebook_info>.username != qs(0x03ac90f0) && <facebook_info>.password = qs(0x03ac90f0)))
		generic_event_choose \{state = uistate_generic_dialog_box
			data = {
				template = cancel_confirm
				confirm_func = 0xd410608d
				is_popup
				heading_text = qs(0xaa163738)
				body_text = qs(0x29323caa)
			}}
	else
		0xd410608d
	endif
endscript

script ui_options_facebook_choose_privacy_policy 
	generic_event_choose \{state = uistate_privacy_policy
		data = {
			is_popup
			Type = facebook
		}}
endscript

script 0xd410608d 
	0xf59af0b2
endscript

script 0xceaa8b0f 
	facebook_set_info controller = ($primary_controller) element = username value = qs(0x03ac90f0)
	facebook_set_info controller = ($primary_controller) element = password value = qs(0x03ac90f0)
	facebook_set_info controller = ($primary_controller) element = broadcast_enabled value = 1
	current_menu :GetSingleTag \{user_options}
	generic_event_back data = {0xebfcf363 = <user_options>}
	ui_event_wait \{event = menu_refresh}
endscript

script ui_options_facebook_accept_username 
	facebook_set_info controller = ($primary_controller) element = username value = <text>
	if 0x08155a39 controller = ($primary_controller)
		facebook_unregister controller = <controller>
		facebook_register username = (<facebook_info>.username) password = (<facebook_info>.password)
	endif
	current_menu :GetSingleTag \{user_options}
	generic_event_back data = {0xebfcf363 = <user_options>}
	ui_event_wait \{event = menu_refresh}
endscript

script ui_options_facebook_accept_password 
	facebook_set_info controller = ($primary_controller) element = password value = <text>
	if 0x08155a39 controller = ($primary_controller)
		facebook_unregister controller = <controller>
		facebook_register username = (<facebook_info>.username) password = (<facebook_info>.password)
	endif
	current_menu :GetSingleTag \{user_options}
	generic_event_back data = {0xebfcf363 = <user_options>}
	ui_event_wait \{event = menu_refresh}
endscript

script 0x33d87bdb \{broadcast_enabled = !i1768515945}
	facebook_set_info controller = ($primary_controller) element = broadcast_enabled value = <broadcast_enabled>
	current_menu :GetSingleTag \{user_options}
	ui_event_add_params 0xebfcf363 = <user_options>
	ui_event_wait \{event = menu_refresh}
endscript
