enter_profile_name_fs = {
	create = create_enter_profile_name_menu
	destroy = destroy_enter_profile_name_menu
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

script 0x0767bf1d \{order = -1}
	0x54ea7391 0xfd02f3b5 = <order>
	destroy_generic_popup
endscript

script 0xc4492fb9 
	wait \{3}
	spawnscriptlater \{0x324d937c}
endscript

script 0x324d937c 
	destroy_generic_popup
	0x03ee527d
	if (<0x0e1f9cdb> = 1)
		0x25a90f38 \{profile_index = 1}
		0x62e058fc = <profile_name>
		create_generic_popup {
			title = $wii_profiles
			message = $wii_select_profile
			previous_menu = vmenu_main_menu
			option_menu = 3
			option1 = {
				title = <0x62e058fc>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose 0x0767bf1d params = {order = 1}}
				]
			}
			option2 = {
				title = $wii_create_new
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose begin_create_profile_from_dialog}
				]
			}
			option3 = {
				title = $wii_delete_profile2
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose 0x4fef6e72}
				]
			}
		}
	endif
	if (<0x0e1f9cdb> = 2)
		0x25a90f38 \{profile_index = 1}
		0x62e058fc = <profile_name>
		0x25a90f38 \{profile_index = 2}
		0xed72d692 = <profile_name>
		create_generic_popup {
			title = $wii_profiles
			message = $wii_select_profile
			previous_menu = vmenu_main_menu
			option_menu = 4
			option1 = {
				title = <0x62e058fc>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose 0x0767bf1d params = {order = 1}}
				]
			}
			option2 = {
				title = <0xed72d692>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose 0x0767bf1d params = {order = 2}}
				]
			}
			option3 = {
				title = $wii_create_new
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose begin_create_profile_from_dialog}
				]
			}
			option4 = {
				title = $wii_delete_profile2
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose 0x4fef6e72}
				]
			}
		}
	endif
	if (<0x0e1f9cdb> = 3)
		0x25a90f38 \{profile_index = 1}
		0x62e058fc = <profile_name>
		0x25a90f38 \{profile_index = 2}
		0xed72d692 = <profile_name>
		0x25a90f38 \{profile_index = 3}
		0xad845683 = <profile_name>
		create_generic_popup {
			title = $wii_profiles
			message = $wii_select_profile
			previous_menu = vmenu_main_menu
			option_menu = 4
			option1 = {
				title = <0x62e058fc>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose 0x0767bf1d params = {order = 1}}
				]
			}
			option2 = {
				title = <0xed72d692>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose 0x0767bf1d params = {order = 2}}
				]
			}
			option3 = {
				title = <0xad845683>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose 0x0767bf1d params = {order = 3}}
				]
			}
			option4 = {
				title = $wii_delete_profile
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0x6d74cdc0}
					{pad_choose 0x4fef6e72}
				]
			}
		}
	endif
endscript

script 0xaa318b42 
	destroy_generic_popup
	0x324d937c
endscript

script 0x4fef6e72 
	destroy_generic_popup
	0x03ee527d
	if (<0x0e1f9cdb> = 1)
		0x25a90f38 \{profile_index = 1}
		0x62e058fc = <profile_name>
		create_generic_popup {
			title = $wii_profiles
			message = $wii_select_profile
			previous_menu = vmenu_main_menu
			option_menu = 2
			option1 = {
				title = <0x62e058fc>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0xaa318b42}
					{pad_choose 0xe34154b4 params = {order = 1}}
				]
			}
			option2 = {
				title = $wii_back
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0xaa318b42}
					{pad_choose 0xaa318b42}
				]
			}
		}
	endif
	if (<0x0e1f9cdb> = 2)
		0x25a90f38 \{profile_index = 1}
		0x62e058fc = <profile_name>
		0x25a90f38 \{profile_index = 2}
		0xed72d692 = <profile_name>
		create_generic_popup {
			title = $wii_profiles
			message = $wii_select_profile
			previous_menu = vmenu_main_menu
			option_menu = 3
			option1 = {
				title = <0x62e058fc>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0xaa318b42}
					{pad_choose 0xe34154b4 params = {order = 1}}
				]
			}
			option2 = {
				title = <0xed72d692>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0xaa318b42}
					{pad_choose 0xe34154b4 params = {order = 2}}
				]
			}
			option3 = {
				title = $wii_back
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0xaa318b42}
					{pad_choose 0xaa318b42}
				]
			}
		}
	endif
	if (<0x0e1f9cdb> = 3)
		0x25a90f38 \{profile_index = 1}
		0x62e058fc = <profile_name>
		0x25a90f38 \{profile_index = 2}
		0xed72d692 = <profile_name>
		0x25a90f38 \{profile_index = 3}
		0xad845683 = <profile_name>
		create_generic_popup {
			title = $wii_profiles
			message = $wii_select_profile
			previous_menu = vmenu_main_menu
			option_menu = 4
			option1 = {
				title = <0x62e058fc>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0xaa318b42}
					{pad_choose 0xe34154b4 params = {order = 1}}
				]
			}
			option2 = {
				title = <0xed72d692>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0xaa318b42}
					{pad_choose 0xe34154b4 params = {order = 2}}
				]
			}
			option3 = {
				title = <0xad845683>
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0xaa318b42}
					{pad_choose 0xe34154b4 params = {order = 3}}
				]
			}
			option4 = {
				title = $wii_back
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_back 0xaa318b42}
					{pad_choose 0xaa318b42}
				]
			}
		}
	endif
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
	formattext textname = 0x42a82189 $wii_delete_confirm2 a = (<profile_name>)
	create_generic_popup {
		title = $wii_delete_profile
		message = <0x42a82189>
		previous_menu = vmenu_main_menu
		yes_no_menu
		yes_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose delete_profile params = {order = <order>}}
		]
		no_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose 0x944ccc4e}
		]
	}
endscript
