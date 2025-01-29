0xe91b3668 = {
	create = wii_memcard_load
	create_params = {
		header = $wii_loading_header
		message = loading
	}
	Destroy = destroy_wii_saveload_screen
	actions = [
		{
			action = load_complete
			flow_state = 0x7ab0caa1
		}
		{
			action = corrupt_save
			flow_state = wii_memcard_corrupt_boot_fs
		}
		{
			action = insufficient_space
			flow_state = wii_memcard_insufficient_space_boot_fs
		}
		{
			action = no_save
			flow_state = 0x3bed5889
		}
	]
}
0x3bed5889 = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_nosave_header
		message = no_save_boot
		option1_text = $wii_saveload_yes
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
			flow_state_func_params = {
				check_for_space = 1
				boot = 1
			}
		}
		option2_text = $wii_saveload_no
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = disable_autosave
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = save
			flow_state_func = wii_memcard_save
		}
		{
			action = disable_autosave
			flow_state = wii_memcard_autosave_boot_fs
		}
	]
}
0x7ab0caa1 = {
	create = wii_memcard_saveload_complete
	create_params = {
		header = $wii_loadsuccess_header
		message = load_successful
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state = bootup_press_any_button_fs
		}
	]
}
wii_memcard_save_error_boot_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = save_failed
		option1_text = $wii_saveload_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
			flow_state_func_params = {
				check_for_space = 1
				boot = 1
			}
		}
		option2_text = $wii_saveload_continuenosave
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = overwrite_warning
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = overwrite_warning
			flow_state = wii_memcard_autosave_boot_fs
		}
		{
			action = save
			flow_state_func = wii_memcard_save
		}
	]
}
wii_memcard_corrupt_boot_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = corrupt_boot
		option1_text = $wii_saveload_continuecorrupt
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = disable_autosave
		}
		option2_text = $wii_saveload_deletefile
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = delete_file
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = disable_autosave
			flow_state = wii_memcard_autosave_boot_fs
		}
		{
			action = delete_file
			flow_state_func = wii_replace_file
		}
	]
}
wii_memcard_insufficient_space_boot_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = insufficient_space
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = overwrite_warning
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = wii_menu
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = overwrite_warning
			flow_state = wii_memcard_autosave_boot_fs
		}
		{
			action = wii_menu
			flow_state_func = wii_goto_system_menu
		}
	]
}
wii_memcard_insufficient_inode_boot_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = insufficient_inode
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = overwrite_warning
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = wii_menu
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = overwrite_warning
			flow_state = wii_memcard_autosave_boot_fs
		}
		{
			action = wii_menu
			flow_state_func = wii_goto_system_menu
		}
	]
}
wii_memcard_autosave_boot_fs = {
	create = wii_disable_autosave
	create_params = {
		header = $wii_caution_header
		message = disable_autosave
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = choose_proper_using_guitar_screen
		}
	]
}
wii_memcard_save_complete_boot_fs = {
	create = wii_memcard_saveload_complete
	create_params = {
		header = $wii_savesuccess_header
		message = save_successful
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = choose_proper_using_guitar_screen
		}
	]
}
0xcfaf32c4 = {
	create = wii_memcard_save
	create_params = {
		header = $wii_saving_header
		message = autosaving
	}
	Destroy = destroy_wii_saveload_screen
	actions = [
		{
			action = error
			flow_state = wii_memcard_save_error_ingame_fs
		}
		{
			action = insufficient_space
			flow_state = wii_memcard_insufficient_space_ingame_fs
		}
		{
			action = save_complete
			flow_state = wii_memcard_save_complete_ingame_fs
		}
	]
}
wii_memcard_save_error_ingame_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = save_failed
		option1_text = $wii_saveload_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
			flow_state_func_params = {
				check_for_space = 1
				boot = 0
			}
		}
		option2_text = $wii_saveload_continue
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = leave_saveload_flow
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = wii_leave_saveload_flow
		}
		{
			action = save
			flow_state_func = wii_memcard_save
		}
	]
}
wii_memcard_insufficient_space_ingame_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = insufficient_space
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = wii_menu
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = wii_leave_saveload_flow
		}
		{
			action = wii_menu
			flow_state_func = wii_goto_system_menu
		}
	]
}
wii_memcard_corrupt_ingame_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = corrupt_boot
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_deletefile
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = delete_file
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = wii_leave_saveload_flow
		}
		{
			action = delete_file
			flow_state_func = wii_replace_file_ingame
		}
	]
}
wii_memcard_insufficient_inode_ingame_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = insufficient_inode
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = wii_menu
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = wii_leave_saveload_flow
		}
		{
			action = wii_menu
			flow_state_func = wii_goto_system_menu
		}
	]
}
wii_memcard_no_save_ingame_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_nosave_header
		message = no_save_boot
		option1_text = $wii_saveload_yes
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
			flow_state_func_params = {
				check_for_space = 1
				boot = 0
			}
		}
		option2_text = $wii_saveload_no
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = leave_saveload_flow
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = wii_leave_saveload_flow
		}
		{
			action = save
			flow_state_func = wii_memcard_save
		}
	]
}
wii_memcard_overwrite_warning_ingame_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_caution_header
		message = overwrite_warning_ingame
		option1_text = $wii_saveload_no
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_yes
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = save
			flow_state_func_params = {
				check_for_space = 1
				boot = 0
			}
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = wii_leave_saveload_flow
		}
		{
			action = save
			flow_state_func = wii_memcard_save
		}
	]
}
wii_memcard_save_complete_ingame_fs = {
	create = wii_memcard_saveload_complete
	create_params = {
		header = $wii_savesuccess_header
		message = save_successful
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = wii_leave_saveload_flow
		}
	]
}
wii_memcard_load_lose_progress_ingame_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_caution_header
		message = lose_progress_ingame
		option1_text = $wii_saveload_cancel
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_continue
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = load
			flow_state_func_params = {
				boot = 0
			}
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = wii_leave_saveload_flow
		}
		{
			action = load
			flow_state_func = wii_memcard_load
		}
	]
}
0x4e3dc90a = {
	create = wii_memcard_load
	create_params = {
		header = $wii_loading_header
		message = loading
	}
	Destroy = destroy_wii_saveload_screen
	actions = [
		{
			action = load_complete
			flow_state = wii_memcard_load_complete_ingame_fs
		}
		{
			action = no_save
			flow_state = wii_memcard_load_no_save_ingame_fs
		}
		{
			action = corrupt_save
			flow_state = wii_memcard_load_corrupt_ingame_fs
		}
	]
}
wii_memcard_load_no_save_ingame_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = no_save_ingame
		option1_text = $wii_saveload_continue
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_retry
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = load
			flow_state_func_params = {
				boot = 0
			}
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = wii_leave_saveload_flow
		}
		{
			action = load
			flow_state_func = wii_memcard_load
		}
	]
}
wii_memcard_load_corrupt_ingame_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = corrupt_boot
		option1_text = $wii_saveload_continuecorrupt
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = disable_autosave
		}
		option2_text = $wii_saveload_deletefile
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = delete_file
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = disable_autosave
			flow_state = wii_memcard_autosave_boot_fs
		}
		{
			action = delete_file
			flow_state_func = wii_replace_file
		}
	]
}
wii_memcard_load_complete_ingame_fs = {
	create = wii_memcard_saveload_complete
	create_params = {
		header = $wii_loadsuccess_header
		message = load_successful
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = wii_leave_saveload_flow
		}
	]
}
wii_memcard_insufficient_space_boot_wfc_only_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = insufficient_space_wfc_only
		option1_text = $wii_saveload_continue
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = continue
			flow_state_func_params = {
				boot = 1
			}
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = wii_menu
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = continue
			flow_state_func = wii_memcard_load
		}
		{
			action = wii_menu
			flow_state_func = wii_goto_system_menu
		}
	]
}
wii_memcard_insufficient_inode_boot_wfc_only_fs = {
	create = refresh_wii_trc_menu
	create_params = {
		header = $wii_error_header
		message = insufficient_inode_wfc_only
		option1_text = $wii_saveload_continue
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = continue
			flow_state_func_params = {
				boot = 1
			}
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = wii_menu
		}
	}
	Destroy = destroy_wii_trc_menu
	actions = [
		{
			action = continue
			flow_state_func = wii_memcard_load
		}
		{
			action = wii_menu
			flow_state_func = wii_goto_system_menu
		}
	]
}
