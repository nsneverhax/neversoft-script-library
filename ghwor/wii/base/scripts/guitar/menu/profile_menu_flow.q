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
