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
	ui_event \{event = menu_change
		data = {
			state = uistate_profile_menu
		}}
endscript

script begin_create_profile_from_dialog 
	destroy_generic_popup
	0xd1d80d19
endscript
