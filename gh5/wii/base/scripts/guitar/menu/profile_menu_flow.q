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
	ScriptAssert \{'begin_create_profile: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script begin_create_profile_from_dialog 
	ScriptAssert \{'begin_create_profile_from_dialog: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
