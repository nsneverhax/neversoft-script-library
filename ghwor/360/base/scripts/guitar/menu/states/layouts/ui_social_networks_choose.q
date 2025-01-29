
script ui_create_social_networks_choose \{message_id = test_update}
	printf \{qs(0xbaedebaa)}
	uistack_createboundscreenelement {
		parent = root_window
		id = social_networks_broadcast_choose
		Type = descinterface
		desc = 'social_networks_choose'
		z_priority = 100
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back social_networks_broadcast_back params = {return_script = <return_script> return_params = <return_params>}}
		]
		tags = {message_struct = <message_struct> back_script = <back_script> back_params = <back_params> return_script = <return_script> return_params = <return_params>}
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
	if social_networks_broadcast_choose :desc_resolvealias \{Name = alias_social_choose_vmenu
			param = social_vmenu_id}
		<social_vmenu_id> :se_setprops {
			event_handlers = [
				{pad_up ui_sfx params = {menustate = Generic uitype = scrollup}}
				{pad_down ui_sfx params = {menustate = Generic uitype = scrolldown}}
				{pad_back ui_sfx params = {menustate = Generic uitype = back}}
				{pad_back <back_script> params = <back_params>}
			]
		}
		if (<show_facebook> = 1)
			if ($g_facebook_default_broadcast = 1)
				<icon> = Options_Controller_Check
			else
				<icon> = Options_Controller_X
			endif
			mainmenu_setup_option {
				choose_script = social_networks_network_toggle
				choose_params = {
					network = facebook
				}
				menu_item_text = (qs(0x267367ae) + ($g_facebook_string))
				icon = <icon>
				parent = <social_vmenu_id>
			}
			<mainmenu_item_id> :se_setprops {
				menurow_txt_item_font = fontgrid_text_a1
			}
		else
			Change \{g_facebook_default_broadcast = 0}
		endif
		if (<show_twitter> = 1)
			if ($g_twitter_default_broadcast = 1)
				<icon> = Options_Controller_Check
			else
				<icon> = Options_Controller_X
			endif
			mainmenu_setup_option {
				choose_script = social_networks_network_toggle
				choose_params = {
					network = twitter
				}
				menu_item_text = (qs(0x267367ae) + ($g_twitter_string))
				icon = <icon>
				parent = <social_vmenu_id>
			}
			<mainmenu_item_id> :se_setprops {
				menurow_txt_item_font = fontgrid_text_a1
			}
		else
			Change \{g_twitter_default_broadcast = 0}
		endif
		if ($g_os_default_broadcast = 1)
			<icon> = Options_Controller_Check
		else
			<icon> = Options_Controller_X
		endif
		os_option_text = qs(0x2a71c44d)
		if isps3
			os_option_text = qs(0x186fc25c)
		endif
		mainmenu_setup_option {
			choose_script = social_networks_network_toggle
			choose_params = {
				network = os
			}
			menu_item_text = <os_option_text>
			icon = <icon>
			parent = <social_vmenu_id>
		}
		menurow_txt_item_dims = (600.0, 40.0)
		<mainmenu_item_id> :se_setprops {
			menurow_ico_txt_desc_hmenu_dims = <menurow_txt_item_dims>
			menurow_txt_item_dims = <menurow_txt_item_dims>
			menurow_highlight_bar_pos = (((1.0, 0.0) * ((<menurow_txt_item_dims> [0]) / 2)) + ((0.0, 1.0) * 0))
			menurow_highlight_bar_dims = (((1.0, 0.0) * (<menurow_txt_item_dims> [0])) + ((0.0, 1.0) * (<menurow_txt_item_dims> [1])))
			menurow_txt_item_font = fontgrid_text_a1
		}
		mainmenu_setup_option {
			choose_script = social_networks_choose_share_continue
			choose_params = {
				message_id = <message_id>
				func_params = <func_params>
			}
			menu_item_text = qs(0x9c20d63a)
			parent = <social_vmenu_id>
		}
		<mainmenu_item_id> :se_setprops {
			menurow_txt_item_font = fontgrid_text_a1
		}
		AssignAlias id = <social_vmenu_id> alias = alias_social_choose_vmenu
	endif
	social_networks_choose_create_helper_text
endscript

script social_networks_choose_test 
	printf \{qs(0xe3ea15eb)}
	social_networks_broadcast :desc_resolvealias \{Name = alias_social_choose_vmenu
		param = social_vmenu_id}
	if ScreenElementExists id = <social_vmenu_id>
		printf \{qs(0xd9ad6601)}
	endif
endscript

script ui_return_social_networks_choose 
	printf \{qs(0x46185ecc)}
	social_networks_choose_create_helper_text
endscript

script social_networks_choose_create_helper_text 
	printf \{qs(0x2785bbe6)}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller) z = 100000
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_social_networks_choose 
	clean_up_user_control_helpers
endscript

script social_networks_network_toggle \{network = !q1768515945}
	Obj_GetID
	switch <network>
		case facebook
		global_checksum = g_facebook_default_broadcast
		case twitter
		global_checksum = g_twitter_default_broadcast
		case os
		global_checksum = g_os_default_broadcast
		default
		ScriptAssert \{qs(0x265f2b5b)}
	endswitch
	if ($<global_checksum> = 0)
		<new_value> = 1
		<checkbox> = Options_Controller_Check
		ui_sfx \{menustate = Generic
			uitype = toggleon}
	else
		<new_value> = 0
		<checkbox> = Options_Controller_X
		ui_sfx \{menustate = Generic
			uitype = toggleoff}
	endif
	Change GlobalName = <global_checksum> NewValue = <new_value>
	<objID> :SetProps menurow_ico_item_texture = <checkbox>
endscript

script social_networks_choose_share_continue \{message_id = !q1768515945}
	printf \{qs(0xf97e9c6b)}
	networks_array = []
	if ($g_facebook_default_broadcast = 1)
		AddArrayElement array = <networks_array> element = facebook
		networks_array = <array>
	endif
	if ($g_twitter_default_broadcast = 1)
		AddArrayElement array = <networks_array> element = twitter
		networks_array = <array>
	endif
	if ($g_os_default_broadcast = 1)
		AddArrayElement array = <networks_array> element = os
		networks_array = <array>
	endif
	social_networks_broadcast_start {
		<func_params>
		message_id = <message_id>
		controller = <device_num>
		networks = <networks_array>
	}
	printstruct <...>
endscript
