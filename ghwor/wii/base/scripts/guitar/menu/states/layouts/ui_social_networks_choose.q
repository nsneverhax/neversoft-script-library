0x13c0671a = 'pak\\ui\\social_networks_choose.pak'
g_registered_facebook_accounts = [
]
g_active_facebook_name = qs(0x00000000)
g_registered_twitter_accounts = [
]
g_active_twitter_name = qs(0x00000000)

script 0xcfb85ad0 
	push_load_social_networks_choose_pak
endscript

script ui_create_social_networks_choose \{message_id = test_update}
	printf \{qs(0xbaedebaa)}
	uistack_createboundscreenelement {
		parent = root_window
		id = social_networks_broadcast_choose
		Type = descinterface
		desc = 'social_networks_choose'
		z_priority = 1500
		dlog_body_text = qs(0xe561128e)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back social_networks_broadcast_back params = {return_script = <return_script> return_params = <return_params>}}
		]
		tags = {
			message_id = <message_id>
			message_struct = <message_struct>
			back_script = <back_script>
			back_params = <back_params>
			return_script = <return_script>
			return_params = <return_params>
			func_params = <func_params>
		}
	}
	menurow_txt_item_dims = (600.0, 50.0)
	fatal_error = 0
	<show_facebook> = 0
	0x224b27b1 = 0
	if facebook_check_is_registered_flag controller = <controller>
		if ($g_facebook_broadcast_armed = 1)
			<show_facebook> = 1
			net_counter_increment \{counter_name = globalcounter_facebook_broadcast}
			GetArraySize ($g_registered_facebook_accounts)
			if ((($g_options_facebook_should_refetch_data) = 1) || (<array_Size> = 0))
				Change \{g_options_facebook_should_refetch_data = 0}
				social_networks_broadcast_choose :Obj_SpawnScriptNow \{social_networks_animate_load}
				<0x224b27b1> = 1
				facebook_get_info
				facebook_get_registered_accounts
				Block \{Type = social_networks_get_registered_accounts}
				if (<event_data>.Result = success)
					social_network_menu_cache_accounts {
						accounts = (<event_data>.registered_accounts)
						network = facebook
						active_account_id = (<facebook_info>.account_id)
					}
				else
					<fatal_error> = 1
					social_networks_get_error_string {
						error_code = (<event_data>.error_code)
						controller = 0
						network = facebook
						dev_error_code = (<event_data>.dev_error_code)
					}
				endif
			endif
		endif
	endif
	<show_twitter> = 0
	if twitter_check_is_registered_flag controller = <controller>
		if ($g_twitter_broadcast_armed = 1)
			<show_twitter> = 1
			net_counter_increment \{counter_name = globalcounter_twitter_broadcast}
			GetArraySize ($g_registered_twitter_accounts)
			if ((($g_options_twitter_should_refetch_data) = 1) || (<array_Size> = 0))
				Change \{g_options_twitter_should_refetch_data = 0}
				if (<0x224b27b1> = 0)
					social_networks_broadcast_choose :Obj_SpawnScriptNow \{social_networks_animate_load}
				endif
				twitter_get_info
				twitter_get_registered_accounts
				Block \{Type = social_networks_get_registered_accounts}
				if (<event_data>.Result = success)
					social_network_menu_cache_accounts {
						accounts = (<event_data>.registered_accounts)
						network = twitter
						active_account_id = (<twitter_info>.account_id)
					}
				else
					<fatal_error> = 1
					social_networks_get_error_string {
						error_code = (<event_data>.error_code)
						controller = 0
						network = twitter
						dev_error_code = (<event_data>.dev_error_code)
					}
				endif
			endif
		endif
	endif
	if social_networks_broadcast_choose :desc_resolvealias \{Name = alias_social_choose_vmenu
			param = social_vmenu_id}
		if (<fatal_error> = 1)
			social_networks_hide_load \{id = social_networks_broadcast_choose}
			create_dialog_box {
				heading_text = qs(0x79597197)
				dlg_z_priority = 1600
				body_text = <error_string>
				no_background
				options = [
					{
						func = <back_script>
						params = <back_params>
						text = qs(0x182f0173)
					}
				]
			}
		else
			<social_vmenu_id> :se_setprops {
				event_handlers = [
					{pad_up ui_sfx params = {menustate = Generic uitype = scrollup}}
					{pad_down ui_sfx params = {menustate = Generic uitype = scrolldown}}
					{pad_back ui_sfx params = {menustate = Generic uitype = back}}
					{pad_back <back_script> params = <back_params>}
				]
			}
			social_networks_broadcast_choose :se_setprops \{dlog_body_text = qs(0x400caa9b)}
			if (<show_facebook> = 1)
				if ($g_facebook_default_broadcast = 1)
					<icon> = Options_Controller_Check
				else
					<icon> = Options_Controller_X
				endif
				formatText TextName = facebook_name qs(0xf0ed29d0) a = ($0xf995a51e) b = ($g_facebook_nologo_string) c = ($g_active_facebook_name)
				mainmenu_setup_option {
					choose_script = social_networks_network_toggle
					choose_params = {
						network = facebook
					}
					menu_item_text = <facebook_name>
					icon = <icon>
					parent = <social_vmenu_id>
					additional_focus_script = 0xc25b5611
				}
				<mainmenu_item_id> :se_setprops {
					menurow_txt_item_font = fontgrid_text_a1
					menurow_txt_item_internal_just = [left center]
					menurow_txt_item_dims = <menurow_txt_item_dims>
					menurow_txt_item_fit_width = truncate
					event_handlers = [
						{pad_option2 social_networks_display_accounts
							params = {
								network = facebook
								previous_menu_id = <social_vmenu_id>
								mainmenu_item_id = <mainmenu_item_id>
							}
						}
					]
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
				formatText TextName = 0x8698d0ea qs(0xe408d8e5) a = ($g_twitter_icon) b = ($0xb46fe7c1) c = ($g_active_twitter_name)
				mainmenu_setup_option {
					choose_script = social_networks_network_toggle
					choose_params = {
						network = twitter
					}
					menu_item_text = <0x8698d0ea>
					icon = <icon>
					parent = <social_vmenu_id>
					additional_focus_script = 0xc25b5611
				}
				<mainmenu_item_id> :se_setprops {
					menurow_txt_item_font = fontgrid_text_a1
					menurow_txt_item_internal_just = [left center]
					menurow_txt_item_dims = <menurow_txt_item_dims>
					menurow_txt_item_fit_width = truncate
					event_handlers = [
						{pad_option2 social_networks_display_accounts
							params = {
								network = twitter
								previous_menu_id = <social_vmenu_id>
								mainmenu_item_id = <mainmenu_item_id>
							}
						}
					]
				}
			else
				Change \{g_twitter_default_broadcast = 0}
			endif
			mainmenu_setup_option {
				choose_script = social_networks_choose_share_continue
				choose_params = {
					message_id = <message_id>
					func_params = <func_params>
				}
				menu_item_text = qs(0x9c20d63a)
				parent = <social_vmenu_id>
				additional_focus_script = 0x79138655
			}
			<mainmenu_item_id> :se_setprops {
				menurow_txt_item_font = fontgrid_text_a1
			}
			AssignAlias id = <social_vmenu_id> alias = alias_social_choose_vmenu
			social_networks_hide_load \{id = social_networks_broadcast_choose}
			0xc25b5611
		endif
	endif
endscript

script 0xdbdfb191 \{0x1b379154 = !a1768515945
		0x70919dc3 = !a1768515945}
	if (<0x1b379154> [0] = <0x70919dc3> [0])
		if (<0x1b379154> [1] = <0x70919dc3> [1])
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script ui_return_social_networks_choose 
	printf \{qs(0x46185ecc)}
	social_networks_choose_create_helper_text
endscript

script social_networks_choose_create_helper_text 
	printf \{qs(0x2785bbe6)}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script 0xc25b5611 
	social_networks_choose_create_helper_text
	add_user_control_helper \{text = qs(0x5d081f3b)
		button = yellow
		z = 100000}
endscript

script 0x79138655 
	social_networks_choose_create_helper_text
endscript

script ui_destroy_social_networks_choose 
	clean_up_user_control_helpers
endscript

script 0x6dda12cd 
	push_unload_social_networks_choose_pak
endscript

script social_networks_network_toggle \{network = !q1768515945}
	Obj_GetID
	switch <network>
		case facebook
		global_checksum = g_facebook_default_broadcast
		0x815f61d1 = Options_Controller_Check
		icon_x = Options_Controller_X
		case twitter
		global_checksum = g_twitter_default_broadcast
		0x815f61d1 = Options_Controller_Check
		icon_x = Options_Controller_X
		default
		ScriptAssert \{qs(0x265f2b5b)}
	endswitch
	if ($<global_checksum> = 0)
		<new_value> = 1
		<checkbox> = <0x815f61d1>
		ui_sfx \{menustate = Generic
			uitype = toggleon}
	else
		<new_value> = 0
		<checkbox> = <icon_x>
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
	social_networks_broadcast_start {
		<func_params>
		message_id = <message_id>
		controller = <device_num>
		networks = <networks_array>
	}
	printstruct <...>
endscript

script social_networks_display_accounts \{network = 0x00000018
		previous_menu_id = !q1768515945
		mainmenu_item_id = None
		return_script = None
		return_params = {
		}}
	printf \{'--- social_networks_display_accounts ---'}
	CreateScreenElement {
		Type = descinterface
		desc = 'friendinvite_popup'
		parent = root_window
		popup_title_text = qs(0x00000000)
		id = 0x8d07d4f5
		z_priority = 100000.0
		tags = {
			mainmenu_item_id = <mainmenu_item_id>
			focus_id = <previous_menu_id>
			return_script = <return_script>
			return_params = <return_params>
		}
	}
	0x8d07d4f5 :se_setprops \{event_handlers = [
			{
				pad_back
				destroy_social_network_accounts_menu
			}
		]}
	if 0x8d07d4f5 :desc_resolvealias \{Name = alias_buttons_scrollbox}
		AssignAlias id = <resolved_id> alias = 0xee42c241
	else
		ScriptAssert \{'failed to resolve alias_buttons_scrollbox'}
	endif
	if 0x8d07d4f5 :desc_resolvealias \{Name = alias_item_highlight}
		AssignAlias id = <resolved_id> alias = 0x2e9eb558
	else
		ScriptAssert \{'failed to resolve alias_item_highlight'}
	endif
	if 0x8d07d4f5 :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		AssignAlias id = <resolved_id> alias = 0x521d3bf9
		generic_scrollbar_wgt_initialize \{id = 0x521d3bf9}
	else
		ScriptAssert \{'failed to resolve alias_generic_scrollbar_wgt'}
	endif
	0x374129ae
	if (<network> = facebook)
		0x1baba5b8 {
			accounts = ($g_registered_facebook_accounts)
			title = ($g_facebook_string)
			network = <network>
		}
	elseif (<network> = twitter)
		0x1baba5b8 {
			accounts = ($g_registered_twitter_accounts)
			title = ($g_twitter_string)
			network = <network>
		}
	endif
	LaunchEvent Type = unfocus target = <previous_menu_id>
	LaunchEvent \{Type = focus
		target = 0x8d07d4f5}
	LaunchEvent \{Type = focus
		target = 0xee42c241}
endscript

script 0x4ca2490a \{account_id = !a1768515945
		account_name = 0x69696969
		network = 0x00000038
		element_id = !q1768515945}
	if (<element_id> = NULL)
		ScriptAssert \{'invalid screen element id'}
		return
	endif
	if ScreenElementExists id = <element_id>
		DestroyScreenElement id = <element_id>
	endif
	0x0622ebb1 = qs(0x03ac90f0)
	if (<network> = facebook)
		0x0622ebb1 = ($g_facebook_string)
		facebook_set_info {
			element = account_id
			value = <account_id>
		}
		logo = ($0xf995a51e)
		<0x0622ebb1> = ($g_facebook_nologo_string)
		Change g_active_facebook_name = <account_name>
	elseif (<network> = twitter)
		0x0622ebb1 = ($g_twitter_string)
		twitter_set_info {
			element = account_id
			value = <account_id>
		}
		logo = ($g_twitter_icon)
		<0x0622ebb1> = ($0xb46fe7c1)
		Change g_active_twitter_name = <account_name>
	else
		ScriptAssert \{'unknown social network'}
	endif
	if 0x8d07d4f5 :GetSingleTag \{mainmenu_item_id}
		if ScreenElementExists id = <mainmenu_item_id>
			ui_event_get_top_base_name
			if (<base_name> = 'social_networks_choose')
				formatText TextName = display_name qs(0xf0ed29d0) a = <logo> b = <0x0622ebb1> c = <account_name>
			else
				display_name = <account_name>
			endif
			<mainmenu_item_id> :se_setprops menurow_txt_item_text = <display_name>
		endif
	endif
	destroy_social_network_accounts_menu
endscript

script 0x374129ae 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x14bf6830)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script 0x1baba5b8 \{accounts = [
		]
		title = 0x69696969
		network = 0x00000044}
	0x8d07d4f5 :se_setprops {
		popup_title_text = <title>
	}
	0x301c0e91 {
		accounts = <accounts>
		network = <network>
	}
endscript

script 0x301c0e91 \{accounts = [
		]
		network = 0x00000034}
	0xbea0c213 {
		gamertag_text = qs(0x006d26a5)
		account_id = [0 , 0]
		network = <network>
		0xeea211e8 = 1
		index = 0
	}
	GetArraySize <accounts>
	if (<array_Size> > 0)
		i = 0
		begin
		0xbea0c213 {
			gamertag_text = (<accounts> [<i>].account_name)
			account_id = (<accounts> [<i>].account_id)
			network = <network>
			index = (<i> + 1)
		}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	generic_scrollbar_wgt_set_resolution id = 0x521d3bf9 num_elements = (<array_Size> + 1)
endscript

script 0xbea0c213 \{gamertag_text = 0x69696969
		account_id = !a1768515945
		network = 0x00000038
		0xeea211e8 = 0
		index = !i1768515945}
	printf \{'--- social_network_accounts_menu_add_account_to_popup ---'}
	if ScreenElementExists \{id = 0xee42c241}
		CreateScreenElement {
			parent = 0xee42c241
			Type = descinterface
			desc = 'friendinvite_button'
			autosizedims = true
			gamer_tag_text = <gamertag_text>
			friend_icon_alpha = 1
			rival_icon_alpha = 0
		}
		if (<0xeea211e8> = 1)
			<id> :se_setprops {
				event_handlers = [
					{focus 0x56b9200f
						params = {
							index = <index>
						}
					}
					{pad_choose 0x16d96ca1
						params = {
							network = <network>
						}
					}
				]
			}
		else
			<id> :se_setprops {
				event_handlers = [
					{focus 0x56b9200f
						params = {
							index = <index>
						}
					}
					{pad_choose 0x4ca2490a
						params = {
							account_id = <account_id>
							element_id = <id>
							account_name = <gamertag_text>
							network = <network>
						}
					}
				]
			}
		endif
	endif
endscript

script destroy_social_network_accounts_menu 
	0x8d07d4f5 :GetTags
	if GotParam \{focus_id}
		if ScreenElementExists id = <focus_id>
			LaunchEvent Type = focus target = <focus_id>
		endif
	else
		printf \{'destroy_social_network_accounts_menu could not find focus_id'}
	endif
	DestroyScreenElement \{id = 0x8d07d4f5}
	if GotParam \{return_script}
		if GotParam \{return_params}
			if NOT (<return_script> = None)
				<return_script> <return_params>
			endif
		else
			printf \{'destroy_social_network_accounts_menu could not find return_params'}
		endif
	else
		printf \{'destroy_social_network_accounts_menu could not find return_script'}
	endif
endscript

script 0x56b9200f \{index = !i1768515945}
	Obj_GetID
	0x2e9eb558 :se_setprops {
		parent = <objID>
		Pos = (0.0, 0.0)
		alpha = 0.4
		pos_anchor = [center center]
		just = [center center]
	}
	generic_scrollbar_wgt_update_thumb_pos id = 0x521d3bf9 index = <index>
endscript

script social_network_menu_cache_accounts \{network = 0x00000018
		accounts = !a1768515945
		active_account_id = !a1768515945}
	if (<network> = facebook)
		Change \{g_registered_facebook_accounts = [
			]}
		Change \{g_active_facebook_name = qs(0x00000000)}
	elseif (<network> = twitter)
		Change \{g_registered_twitter_accounts = [
			]}
		Change \{g_active_twitter_name = qs(0x00000000)}
	endif
	GetArraySize (<accounts>)
	i = 0
	if (<array_Size> > 0)
		array = []
		begin
		AddArrayElement {
			array = <array>
			element = {
				account_id = ((<accounts> [<i>]).account_id)
				account_name = ((<accounts> [<i>]).account_name)
			}
		}
		if 0xdbdfb191 {
				0x1b379154 = <active_account_id>
				0x70919dc3 = ((<accounts> [<i>]).account_id)
			}
			if (<network> = facebook)
				Change g_active_facebook_name = ((<accounts> [<i>]).account_name)
			elseif (<network> = twitter)
				Change g_active_twitter_name = ((<accounts> [<i>]).account_name)
			endif
		endif
		<i> = (<i> + 1)
		repeat (<array_Size>)
		if (<network> = facebook)
			Change g_registered_facebook_accounts = <array>
			if (($g_active_facebook_name) = qs(0x00000000))
				Change g_active_facebook_name = ((<accounts> [0]).account_name)
				facebook_set_info element = account_id value = ((<accounts> [0]).account_id)
			endif
			facebook_figured_out_can_post \{Result = success
				registered = 1
				controller_index = 0}
		elseif (<network> = twitter)
			Change g_registered_twitter_accounts = <array>
			if (($g_active_twitter_name) = qs(0x00000000))
				Change g_active_twitter_name = ((<accounts> [0]).account_name)
				twitter_set_info element = account_id value = ((<accounts> [0]).account_id)
			endif
			twitter_figured_out_can_post \{Result = success
				registered = 1
				controller_index = 0}
		endif
	else
		printf \{'social_network_menu_cache_accounts got zero size accounts array'}
	endif
endscript

script 0x16d96ca1 \{network = 0x00000018}
	printf \{'--- social_networks_choose_register_new_account ---'}
	if ScreenElementExists \{id = 0x8d07d4f5}
		DestroyScreenElement \{id = 0x8d07d4f5}
	endif
	if (<network> = facebook)
		options_facebook_register_new_account
	elseif (<network> = twitter)
		options_twitter_register_new_account
	endif
	destroy_social_network_accounts_menu
endscript
0x9b204fda = 0

script push_load_social_networks_choose_pak 
	if (($0x9b204fda) = 0)
		if NOT ispakloaded ($0x13c0671a) Heap = quota_misc
			LoadPak ($0x13c0671a) Heap = quota_misc
		endif
	elseif (($0x9b204fda) < 0)
		ScriptAssert \{'g_social_networks_choose_pak_stack cannot be negative, one too many calls to push_load/push_unload'}
	endif
	Change 0x9b204fda = (($0x9b204fda) + 1)
endscript

script push_unload_social_networks_choose_pak 
	Change 0x9b204fda = (($0x9b204fda) - 1)
	if (($0x9b204fda) = 0)
		if ispakloaded ($0x13c0671a) Heap = quota_misc
			UnLoadPak ($0x13c0671a) Heap = quota_misc
		endif
	elseif (($0x9b204fda) < 0)
		ScriptAssert \{'g_social_networks_choose_pak_stack cannot be negative, one too many calls to push_load/push_unload'}
	endif
endscript

script ui_social_networks_return_to_social_networks_choose \{state = !q1768515945
		return_params = 0x69696969
		from_dialog_box = 1}
	Change \{register_account = 0}
	if (<from_dialog_box> = 1)
		generic_event_back
	endif
	ui_event_wait event = menu_replace data = {
		state = <state>
		<return_params>
	}
endscript
