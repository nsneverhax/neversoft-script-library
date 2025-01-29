enter_profile_name_fs = {
	create = create_enter_profile_name_menu
	Destroy = destroy_enter_profile_name_menu
	remove_focus = enter_profile_name_remove_focus
	refocus = enter_profile_name_refocus
	actions = [
		{
			action = profile_name_confirmed
			flow_state = main_menu_fs
		}
		{
			action = go_back
			flow_state = main_menu_fs
		}
	]
}

script begin_create_profile 
	ui_flow_manager_respond_to_action \{action = 0x653f903a}
endscript

script begin_create_profile_from_dialog 
	destroy_generic_popup
	0xd1d80d19
endscript

script 0x6d74cdc0 
	cancelenterwifimenu
	set_home_button_allowed
	destroy_generic_popup
endscript

script 0x0767bf1d \{order = -1
		startup = FALSE}
	destroy_generic_popup
	clean_up_user_control_helpers
	0x54ea7391 0xfd02f3b5 = <order> startup = <startup>
endscript

script 0xc4492fb9 
	Wait \{3}
	SpawnScriptLater \{0x324d937c}
endscript

script 0x324d937c 
	destroy_generic_popup
	clean_up_user_control_helpers
	0x03ee527d
	if ($ui_flow_manager_state [0] = bootup_press_any_button_fs)
		0xb74c9c45 = true
		cancel_script = wii_bootup_skip_login
		popup_title = $wii_login
		add_user_control_helper \{text = 'SELECT'
			button = green
			z = 110}
		add_user_control_helper \{text = $wii_skip
			button = red
			z = 110}
		add_user_control_helper \{text = 'UP/DOWN'
			button = strumbar
			z = 110}
	else
		0xb74c9c45 = FALSE
		cancel_script = 0x6d74cdc0
		popup_title = $wii_profiles
		add_user_control_helper \{text = 'SELECT'
			button = green
			z = 110}
		add_user_control_helper \{text = 'BACK'
			button = red
			z = 110}
		add_user_control_helper \{text = 'UP/DOWN'
			button = strumbar
			z = 110}
	endif
	0x59eecf5c
	0x4228f41c = (<0xc3d301b0> + 1)
	0x68f07e06 = {
		title = <popup_title>
		message = $wii_select_profile
		back_script = <cancel_script>
		default_blackout
		focus_option = <0x4228f41c>
	}
	0xa2b02521 = 0
	0xd4a5d075 = 1
	begin
	if (<0xd4a5d075> > <0x0e1f9cdb>)
		break
	endif
	0x25a90f38 profile_index = <0xd4a5d075>
	0x62ee3e1e = {
		title = <profile_name>
		eventhandlers = [
			{pad_choose 0x0767bf1d params = {order = <0xd4a5d075> startup = <0xb74c9c45>}}
		]
	}
	0xa2b02521 = (<0xa2b02521> + 1)
	formatText checksumName = 0x49d22b1a 'option%a' a = <0xa2b02521>
	AddParam structure_name = 0x68f07e06 Name = <0x49d22b1a> value = <0x62ee3e1e>
	0xd4a5d075 = (<0xd4a5d075> + 1)
	repeat
	if (<0xb74c9c45> = true)
		0x62ee3e1e = {
			title = $wii_dont_sign_in
			eventhandlers = [
				{pad_choose <cancel_script>}
			]
		}
		0xa2b02521 = (<0xa2b02521> + 1)
		formatText checksumName = 0x49d22b1a 'option%a' a = <0xa2b02521>
		AddParam structure_name = 0x68f07e06 Name = <0x49d22b1a> value = <0x62ee3e1e>
	else
		if NOT 0x1a1d4efe
			0x62ee3e1e = {
				title = $wii_create_new
				eventhandlers = [
					{pad_choose begin_create_profile_from_dialog}
				]
			}
			0xa2b02521 = (<0xa2b02521> + 1)
			formatText checksumName = 0x49d22b1a 'option%a' a = <0xa2b02521>
			AddParam structure_name = 0x68f07e06 Name = <0x49d22b1a> value = <0x62ee3e1e>
		endif
		0x62ee3e1e = {
			title = $wii_delete_profile
			eventhandlers = [
				{pad_choose 0x4fef6e72}
			]
		}
		0xa2b02521 = (<0xa2b02521> + 1)
		formatText checksumName = 0x49d22b1a 'option%a' a = <0xa2b02521>
		AddParam structure_name = 0x68f07e06 Name = <0x49d22b1a> value = <0x62ee3e1e>
	endif
	AddParam structure_name = 0x68f07e06 Name = option_menu value = <0xa2b02521>
	create_generic_popup <0x68f07e06>
endscript

script 0xaa318b42 
	destroy_generic_popup
	0x324d937c
endscript

script 0x4fef6e72 
	destroy_generic_popup
	0x03ee527d
	0x68f07e06 = {
		title = $wii_profiles
		message = $wii_delete_profile_message
		back_script = 0xaa318b42
		default_blackout
		add_user_control_helpers
	}
	0xa2b02521 = 0
	0xd4a5d075 = 1
	begin
	if (<0xd4a5d075> > <0x0e1f9cdb>)
		break
	endif
	0x25a90f38 profile_index = <0xd4a5d075>
	0x62ee3e1e = {
		title = <profile_name>
		eventhandlers = [
			{pad_choose 0xe34154b4 params = {order = <0xd4a5d075>}}
		]
	}
	0xa2b02521 = (<0xa2b02521> + 1)
	formatText checksumName = 0x49d22b1a 'option%a' a = <0xa2b02521>
	AddParam structure_name = 0x68f07e06 Name = <0x49d22b1a> value = <0x62ee3e1e>
	<0xd4a5d075> = (<0xd4a5d075> + 1)
	repeat
	0x62ee3e1e = {
		title = $wii_back
		eventhandlers = [
			{pad_choose 0xaa318b42}
		]
	}
	0xa2b02521 = (<0xa2b02521> + 1)
	formatText checksumName = 0x49d22b1a 'option%a' a = <0xa2b02521>
	AddParam structure_name = 0x68f07e06 Name = <0x49d22b1a> value = <0x62ee3e1e>
	AddParam structure_name = 0x68f07e06 Name = option_menu value = <0xa2b02521>
	create_generic_popup <0x68f07e06>
endscript

script delete_profile 
	destroy_generic_popup
	0xca4f9011 0xfd02f3b5 = <order>
endscript

script 0x944ccc4e 
	destroy_generic_popup
	0x4fef6e72
endscript

script 0xe34154b4 
	destroy_generic_popup
	0x25a90f38 profile_index = <order>
	formatText TextName = 0x42a82189 $wii_delete_confirm2 a = (<profile_name>)
	create_generic_popup {
		title = $wii_confirm
		message = <0x42a82189>
		default_blackout
		yes_no_menu
		focus_no
		back_script = 0x944ccc4e
		add_user_control_helpers
		yes_eventhandlers = [
			{pad_choose delete_profile params = {order = <order>}}
		]
		no_eventhandlers = [
			{pad_choose 0x944ccc4e}
		]
	}
endscript
