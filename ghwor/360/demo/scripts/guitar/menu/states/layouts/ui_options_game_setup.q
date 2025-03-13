social_networks_tester_mode = 0

script ui_create_options_game_setup 
	change \{rich_presence_context = presence_menus}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	<blocked_option_flags> = {
		not_focusable
		icon = strike
		text_focus_color = [220 30 30 255]
		text_unfocus_color = [216 181 117 255]
	}
	uistack_createboundscreenelement {
		parent = root_window
		id = options_game_setup_menu_id
		type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{pad_back ui_options_gameplay_pad_back_script}
		]
		exclusive_device = ($primary_controller)
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0x9c20d63a)
	}
	attempt_to_add_friend_feed \{parent_id = options_game_setup_menu_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = options_game_setup_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = options_game_setup_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = options_game_setup_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = options_game_setup_menu_id
		}}
	if options_game_setup_menu_id :desc_resolvealias \{name = alias_mainmenu_up_arrow}
		<resolved_id> :se_setprops {
			hide
		}
	endif
	if options_game_setup_menu_id :desc_resolvealias \{name = alias_mainmenu_down_arrow}
		<resolved_id> :se_setprops {
			hide
		}
	endif
	<chat_restricted> = 0
	if isps3
		if NOT netsessionfunc \{obj = voice
				func = voice_allowed}
			<chat_restricted> = 1
		endif
	endif
	if ($g_enable_facebook = 1)
		if NOT isps3
			<facebook_flags> = <blocked_option_flags>
			if checkforsignin controller_index = ($primary_controller)
				<facebook_flags> = {}
			endif
		endif
		if NOT netsessionfunc \{func = is_lobby_available}
			<facebook_flags> = <blocked_option_flags>
		endif
		if (<chat_restricted> = 1)
			<facebook_flags> = <blocked_option_flags>
		endif
		facebook_text = qs(0x236266f7)
		if facebook_check_is_registered_flag
			facebook_text = qs(0x11e3f229)
		endif
		mainmenu_setup_option {
			choose_script = ui_options_game_setup_choose_facebook
			back_script = ui_options_gameplay_pad_back_script
			menu_item_text = <facebook_text>
			screen_id = options_game_setup_menu_id
			helper_text = (qs(0xec8345a1) + ($g_facebook_string) + qs(0xcc312057))
			<facebook_flags>
		}
		<icon> = options_controller_x
		if facebook_broadcast_is_enabled
			<icon> = options_controller_check
		endif
		<facebook_flags> = {<facebook_flags> icon = <icon>}
		assignalias id = <mainmenu_item_id> alias = facebook_broadcasting_button
	endif
	if ($g_enable_twitter = 1)
		if NOT isps3
			<twitter_flags> = <blocked_option_flags>
			if checkforsignin controller_index = ($primary_controller)
				<twitter_flags> = {}
			endif
		endif
		if NOT netsessionfunc \{func = is_lobby_available}
			<twitter_flags> = <blocked_option_flags>
		endif
		if (<chat_restricted> = 1)
			<twitter_flags> = <blocked_option_flags>
		endif
		twitter_text = qs(0x54e26fcd)
		if twitter_check_is_registered_flag
			twitter_text = qs(0x512860c3)
		endif
		mainmenu_setup_option {
			menu_item_text = <twitter_text>
			choose_script = ui_options_game_setup_choose_twitter
			back_script = ui_options_gameplay_pad_back_script
			screen_id = options_game_setup_menu_id
			helper_text = (qs(0xec8345a1) + ($g_twitter_string) + qs(0xcc312057))
			<twitter_flags>
		}
		<icon> = options_controller_x
		if twitter_broadcast_is_enabled
			<icon> = options_controller_check
		endif
		<twitter_flags> = {<twitter_flags> icon = <icon>}
		assignalias id = <mainmenu_item_id> alias = twitter_broadcasting_button
	endif
	signin_params = {network_platform_only}
	if isps3
		signin_params = {}
	endif
	if checkforsignin <signin_params> controller_index = ($primary_controller)
		if isps3
			if netsessionfunc \{func = is_lobby_available}
				mainmenu_setup_option \{choose_state = uistate_guitarhero_com
					back_script = ui_options_gameplay_pad_back_script
					menu_item_text = qs(0x94a452ca)
					screen_id = options_game_setup_menu_id
					helper_text = qs(0x81a5615a)}
			else
				mainmenu_setup_option \{choose_state = uistate_vip_invite
					back_script = ui_options_gameplay_pad_back_script
					menu_item_text = qs(0x94a452ca)
					screen_id = options_game_setup_menu_id
					helper_text = qs(0x81a5615a)}
			endif
		else
			mainmenu_setup_option \{choose_state = uistate_guitarhero_com
				back_script = ui_options_gameplay_pad_back_script
				menu_item_text = qs(0x94a452ca)
				screen_id = options_game_setup_menu_id
				helper_text = qs(0x81a5615a)}
		endif
	else
		mainmenu_setup_option \{choose_state = uistate_vip_invite
			back_script = ui_options_gameplay_pad_back_script
			menu_item_text = qs(0x94a452ca)
			screen_id = options_game_setup_menu_id
			helper_text = qs(0x81a5615a)}
	endif
	ui_options_set_settings
	main_menu_finalize
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_options_game_setup 
	clean_up_user_control_helpers
	if screenelementexists \{id = options_game_setup_menu_id}
		destroyscreenelement \{id = options_game_setup_menu_id}
	endif
endscript

script ui_return_options_game_setup 
	mainmenu_setup_physics_elements \{screen_id = options_game_setup_menu_id}
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_options_game_setup_anim_in 
	if screenelementexists \{id = options_game_setup_menu_id}
		add_gamertag_helper exclusive_device = ($primary_controller)
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000
			all_buttons}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000
			all_buttons}
	endif
endscript

script ui_options_game_setup_anim_out 
	mainmenu_animate \{id = options_game_setup_menu_id}
endscript

script ui_options_game_setup_choose_twitter 
	<new_state> = uistate_options_twitter
	<new_data> = {is_popup}
	if NOT twitter_check_is_registered_flag
		if NOT twitter_accepted_terms controller = ($primary_controller)
			<new_state> = uistate_privacy_policy
			<new_data> = {is_popup type = twitter next_state = uistate_options_twitter}
		endif
	endif
	ui_event {
		event = menu_change
		data = {
			state = uistate_signin
			device_num = <device_num>
			new_state = <new_state>
			new_data = <new_data>
			allow_back = 1
			require_live = 1
			show_mainmenu_bg = 1
		}
	}
endscript

script ui_options_game_setup_choose_twitter_continue 
	if gotparam \{registered}
		change g_options_twitter_did_register = <registered>
	else
		change \{g_options_twitter_did_register = 0}
	endif
	generic_event_choose state = <state> data = <data>
endscript

script ui_options_game_setup_choose_facebook 
	<new_state> = uistate_options_facebook
	<new_data> = {is_popup}
	if NOT facebook_check_is_registered_flag
		if NOT facebook_accepted_terms controller = ($primary_controller)
			<new_state> = uistate_privacy_policy
			<new_data> = {is_popup type = facebook next_state = uistate_options_facebook}
		endif
	endif
	ui_event {
		event = menu_change
		data = {
			state = uistate_signin
			device_num = <device_num>
			new_state = <new_state>
			new_data = <new_data>
			require_live = 1
			allow_back = 1
			show_mainmenu_bg = 1
		}
	}
endscript

script ui_options_game_setup_choose_facebook_continue 
	if gotparam \{registered}
		change g_options_facebook_did_register = <registered>
	else
		change \{g_options_facebook_did_register = 0}
	endif
	generic_event_choose state = <state> data = <data>
endscript

script ui_options_game_setup_toggle_facebook_broadcast 
endscript

script ui_options_game_setup_toggle_twitter_broadcast 
endscript

script ui_options_game_setup_menu_anim_in 
	mainmenu_animate \{id = options_game_setup_menu_id}
endscript

script ui_options_game_setup_menu_anim_out 
	mainmenu_animate \{id = options_game_setup_menu_id}
endscript
