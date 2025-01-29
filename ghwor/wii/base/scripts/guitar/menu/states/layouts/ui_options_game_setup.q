social_networks_tester_mode = 0

script ui_create_options_game_setup 
	Change \{rich_presence_context = presence_menus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	<blocked_option_flags> = {
		not_focusable
		icon = strike
		text_focus_color = [220 30 30 255]
		text_unfocus_color = [216 181 117 255]
	}
	uistack_createboundscreenelement {
		parent = root_window
		id = options_game_setup_menu_id
		Type = descinterface
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
	if options_game_setup_menu_id :desc_resolvealias \{Name = alias_mainmenu_up_arrow}
		<resolved_id> :se_setprops {
			Hide
		}
	endif
	if options_game_setup_menu_id :desc_resolvealias \{Name = alias_mainmenu_down_arrow}
		<resolved_id> :se_setprops {
			Hide
		}
	endif
	<chat_restricted> = 0
	if isps3
		if NOT NetSessionFunc \{Obj = voice
				func = voice_allowed}
			<chat_restricted> = 1
		endif
	endif
	if ($g_enable_facebook = 1)
		facebook_text = qs(0x8f3ad2d8)
		mainmenu_setup_option {
			choose_script = ui_options_game_setup_choose_facebook
			back_script = ui_options_gameplay_pad_back_script
			menu_item_text = <facebook_text>
			screen_id = options_game_setup_menu_id
			helper_text = (qs(0xec8345a1) + ($g_facebook_string) + qs(0xcc312057))
			<facebook_flags>
		}
		<icon> = Options_Controller_X
		if facebook_broadcast_is_enabled
			<icon> = Options_Controller_Check
		endif
		<facebook_flags> = {<facebook_flags> icon = <icon>}
		AssignAlias id = <mainmenu_item_id> alias = facebook_broadcasting_button
	endif
	if ($g_enable_twitter = 1)
		twitter_text = qs(0x1e562c6d)
		mainmenu_setup_option {
			menu_item_text = <twitter_text>
			choose_script = ui_options_game_setup_choose_twitter
			back_script = ui_options_gameplay_pad_back_script
			screen_id = options_game_setup_menu_id
			helper_text = (qs(0xec8345a1) + ($g_twitter_string) + qs(0xcc312057))
			<twitter_flags>
		}
		<icon> = Options_Controller_X
		if twitter_broadcast_is_enabled
			<icon> = Options_Controller_Check
		endif
		<twitter_flags> = {<twitter_flags> icon = <icon>}
		AssignAlias id = <mainmenu_item_id> alias = twitter_broadcasting_button
	endif
	signin_params = {network_platform_only}
	if isps3
		signin_params = {}
	endif
	if CheckForSignIn <signin_params> controller_index = ($primary_controller)
		if ((isps3) || (isngc))
			if NetSessionFunc \{func = is_lobby_available}
				mainmenu_setup_option \{choose_state = uistate_guitarhero_com
					back_script = ui_options_gameplay_pad_back_script
					menu_item_text = qs(0x94a452ca)
					screen_id = options_game_setup_menu_id
					helper_text = qs(0x97a2129d)}
			else
				mainmenu_setup_option \{choose_state = uistate_vip_invite
					back_script = ui_options_gameplay_pad_back_script
					menu_item_text = qs(0x94a452ca)
					screen_id = options_game_setup_menu_id
					helper_text = qs(0x97a2129d)}
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
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_options_game_setup 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = options_game_setup_menu_id}
		DestroyScreenElement \{id = options_game_setup_menu_id}
	endif
endscript

script ui_return_options_game_setup 
	mainmenu_setup_physics_elements \{screen_id = options_game_setup_menu_id}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_options_game_setup_anim_in 
	if ScreenElementExists \{id = options_game_setup_menu_id}
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
	show_error = 1
	if NetSessionFunc \{func = can_view_user_content
			params = {
				set_explicit_error_code
			}}
		if NetSessionFunc \{func = is_lobby_available}
			<show_error> = 0
			<state> = uistate_options_twitter
			<data> = {is_popup}
			if NOT twitter_check_is_registered_flag
				if NOT twitter_accepted_terms controller = ($primary_controller)
					<state> = uistate_privacy_policy
					<data> = {is_popup Type = twitter next_state = uistate_options_twitter}
				endif
			endif
			generic_event_choose state = <state> data = <data>
		endif
	endif
	if (<show_error> = 1)
		show_last_connection_error \{context = default_lobby}
	endif
endscript

script ui_options_game_setup_choose_facebook 
	show_error = 1
	if NetSessionFunc \{func = can_view_user_content
			params = {
				set_explicit_error_code
			}}
		if NetSessionFunc \{func = is_lobby_available}
			<show_error> = 0
			<state> = uistate_options_facebook
			<data> = {is_popup}
			if NOT facebook_check_is_registered_flag
				if NOT facebook_accepted_terms controller = ($primary_controller)
					<state> = uistate_privacy_policy
					<data> = {is_popup Type = facebook next_state = uistate_options_facebook}
				endif
			endif
			generic_event_choose state = <state> data = <data>
		endif
	endif
	if (<show_error> = 1)
		show_last_connection_error \{context = default_lobby}
	endif
endscript
