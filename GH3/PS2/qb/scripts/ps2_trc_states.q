blah_blah_temp_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_blah
		message = overwrite_failed
		option1_text = $string_ps2_blah
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = reload
		}
		option2_text = $string_ps2_blah
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = reload
		}
	}
	actions = [
		{
			action = reload
			flow_state = blah_blah_temp_fs
		}
	]
}
ps2_memcard_autosave_warning_boot_fs = {
	create = ps2_memcard_message
	create_params = {
		header = $string_ps2_caution
		message = boot_autosave_warning
		seconds = -1
	}
	actions = [
		{
			action = continue
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
	]
}
ps2_memcard_load_check_status_boot_fs = {
	create = ps2_memcard_load_check_status
	create_params = {
		header = $string_ps2_checking
		message = check_memcard
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_load_no_card_boot_fs
		}
		{
			action = no_save
			flow_state = ps2_memcard_load_no_save_check_status_boot_fs
		}
		{
			action = status_ok
			flow_state = ps2_memcard_load_boot_fs
		}
	]
}
ps2_memcard_load_boot_fs = {
	create = ps2_memcard_load
	create_params = {
		header = $string_ps2_loading
		message = loading
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_load_no_card_boot_fs
		}
		{
			action = load_complete
			flow_state = ps2_memcard_load_complete_boot_fs
		}
		{
			action = corrupt_save
			flow_state = ps2_memcard_load_no_save_check_status_boot_fs
		}
	]
}
ps2_memcard_load_no_card_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = no_memcard_boot
		option1_text = $string_ps2_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = retry_load
		}
		option2_text = $string_ps2_continue_without_saving
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = autosave
		}
	}
	actions = [
		{
			action = autosave
			flow_state = 0x51972dc7
		}
		{
			action = retry_load
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
	]
}
ps2_memcard_load_no_save_check_status_boot_fs = {
	create = ps2_memcard_save_check_status
	create_params = {
		header = $string_ps2_checking
		message = check_memcard
		no_check = 1
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_load_no_card_boot_fs
		}
		{
			action = not_formatted
			flow_state = ps2_memcard_load_no_save_boot_fs
		}
		{
			action = insufficient_space
			flow_state = ps2_memcard_insufficient_space_boot_fs
		}
		{
			action = status_ok
			flow_state = ps2_memcard_load_no_save_boot_fs
		}
	]
}
ps2_memcard_load_no_save_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_save_not_found
		message = no_save_boot
		option1_text = $string_ps2_yes
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = $string_ps2_no
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = overwrite_warning
		}
	}
	actions = [
		{
			action = save
			flow_state = ps2_memcard_save_check_status_boot_fs
		}
		{
			action = overwrite_warning
			flow_state = ps2_memcard_overwrite_warning_boot_fs
		}
	]
}
ps2_memcard_load_complete_boot_fs = {
	create = ps2_memcard_saveload_complete
	create_params = {
		header = $string_ps2_load_successful
		message = load_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state = bootup_press_any_button_fs
		}
	]
}
ps2_memcard_save_check_status_boot_fs = {
	create = ps2_memcard_save_check_status
	create_params = {
		header = $string_ps2_checking
		message = check_memcard
		no_check = 1
		check_for_existing = 1
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_save_no_card_boot_fs
		}
		{
			action = not_formatted
			flow_state = ps2_memcard_attempt_format_boot_fs
		}
		{
			action = insufficient_space
			flow_state = ps2_memcard_insufficient_space_boot_fs
		}
		{
			action = status_ok
			flow_state = ps2_memcard_save_boot_fs
		}
		{
			action = existing_save
			flow_state = ps2_memcard_corrupt_boot_fs
		}
	]
}
ps2_memcard_save_boot_fs = {
	create = ps2_memcard_save
	create_params = {
		header = $string_ps2_saving
		message = saving
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_save_no_card_boot_fs
		}
		{
			action = not_formatted
			flow_state = ps2_memcard_attempt_format_boot_fs
		}
		{
			action = save_complete
			flow_state = ps2_memcard_save_complete_boot_fs
		}
		{
			action = error
			flow_state = ps2_memcard_save_error_boot_fs
		}
		{
			action = insufficient_space
			flow_state = ps2_memcard_insufficient_space_boot_fs
		}
	]
}
ps2_memcard_save_no_card_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = no_memcard_save_boot
		option1_text = $string_ps2_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = retry_save
		}
		option2_text = $string_ps2_continue_without_saving
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = autosave
		}
	}
	actions = [
		{
			action = retry_save
			flow_state = ps2_memcard_save_check_status_boot_fs
		}
		{
			action = autosave
			flow_state = 0x51972dc7
		}
	]
}
ps2_memcard_save_error_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = save_failed
		option1_text = $string_ps2_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = $string_ps2_continue_without_saving
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = overwrite_warning
		}
	}
	actions = [
		{
			action = overwrite_warning
			flow_state = ps2_memcard_overwrite_warning_boot_fs
		}
		{
			action = save
			flow_state = ps2_memcard_save_check_status_boot_fs
		}
	]
}
ps2_memcard_attempt_format_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_caution
		message = attempt_format
		option1_text = $string_ps2_no
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = cancel_format
		}
		option2_text = $string_ps2_yes
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
	}
	actions = [
		{
			action = cancel_format
			flow_state = ps2_memcard_overwrite_warning_boot_fs
		}
		{
			action = format
			flow_state = ps2_memcard_confirm_format_boot_fs
		}
	]
}
ps2_memcard_confirm_format_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_caution
		message = confirm_format
		option1_text = $string_ps2_no
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = cancel_format
		}
		option2_text = $string_ps2_yes
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
	}
	actions = [
		{
			action = cancel_format
			flow_state = ps2_memcard_overwrite_warning_boot_fs
		}
		{
			action = format
			flow_state = ps2_memcard_format_check_status_boot_fs
		}
	]
}
ps2_memcard_format_check_status_boot_fs = {
	create = ps2_memcard_format_check_status
	create_params = {
		header = $string_ps2_checking
		message = check_memcard
	}
	actions = [
		{
			action = is_formatted
			flow_state = ps2_memcard_is_formatted_boot_fs
		}
		{
			action = no_memcard
			flow_state = ps2_memcard_retry_format_boot_fs
		}
		{
			action = status_ok
			flow_state = ps2_memcard_format_boot_fs
		}
	]
}
ps2_memcard_format_boot_fs = {
	create = ps2_memcard_format
	create_params = {
		header = $string_ps2_formatting
		message = formatting
	}
	actions = [
		{
			action = is_formatted
			flow_state = ps2_memcard_is_formatted_boot_fs
		}
		{
			action = success
			flow_state = ps2_memcard_format_complete_boot_fs
		}
		{
			action = no_memcard
			flow_state = ps2_memcard_retry_format_boot_fs
		}
	]
}
ps2_memcard_is_formatted_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = already_formatted
		option1_text = $string_ps2_cancel
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = load
		}
		option2_text = $string_ps2_retry
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
	}
	actions = [
		{
			action = format
			flow_state = ps2_memcard_format_check_status_boot_fs
		}
		{
			action = load
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
	]
}
ps2_memcard_retry_format_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = format_failed
		option1_text = $string_ps2_cancel
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = load
		}
		option2_text = $string_ps2_retry
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
	}
	actions = [
		{
			action = format
			flow_state = ps2_memcard_format_check_status_boot_fs
		}
		{
			action = load
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
	]
}
ps2_memcard_format_complete_boot_fs = {
	create = ps2_memcard_message
	create_params = {
		header = $string_ps2_format_successful
		message = format_successful
		seconds = 1
	}
	actions = [
		{
			action = continue
			flow_state = ps2_memcard_save_check_status_boot_fs
		}
	]
}
ps2_memcard_corrupt_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = corrupt_boot
		option1_text = $string_ps2_yes
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = confirm_overwrite
		}
		option2_text = $string_ps2_no
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = overwrite_warning
		}
	}
	actions = [
		{
			action = overwrite_warning
			flow_state = ps2_memcard_overwrite_warning_boot_fs
		}
		{
			action = confirm_overwrite
			flow_state = ps2_memcard_corrupt_confirm_overwrite_boot_fs
		}
	]
}
ps2_memcard_corrupt_confirm_overwrite_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_caution
		message = confirm_overwrite_boot
		option1_text = $string_ps2_yes
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = overwrite
		}
		option2_text = $string_ps2_no
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = overwrite_warning
		}
	}
	actions = [
		{
			action = overwrite_warning
			flow_state = ps2_memcard_overwrite_warning_boot_fs
		}
		{
			action = overwrite
			flow_state = ps2_memcard_overwrite_check_status_boot_fs
		}
	]
}
ps2_memcard_overwrite_check_status_boot_fs = {
	create = ps2_memcard_save_check_status
	create_params = {
		header = $string_ps2_checking
		message = check_memcard
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_save_no_card_boot_fs
		}
		{
			action = not_formatted
			flow_state = ps2_memcard_attempt_format_boot_fs
		}
		{
			action = insufficient_space
			flow_state = ps2_memcard_insufficient_space_boot_fs
		}
		{
			action = status_ok
			flow_state = ps2_memcard_overwrite_boot_fs
		}
	]
}
ps2_memcard_overwrite_boot_fs = {
	create = ps2_memcard_save
	create_params = {
		header = $string_ps2_overwriting
		message = overwriting
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_save_no_card_boot_fs
		}
		{
			action = not_formatted
			flow_state = ps2_memcard_attempt_format_boot_fs
		}
		{
			action = save_complete
			flow_state = ps2_memcard_overwrite_complete_boot_fs
		}
		{
			action = error
			flow_state = ps2_memcard_overwrite_error_boot_fs
		}
		{
			action = insufficient_space
			flow_state = ps2_memcard_insufficient_space_boot_fs
		}
	]
}
ps2_memcard_overwrite_error_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = overwrite_failed
		option1_text = $string_ps2_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = $string_ps2_continue_without_saving
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = overwrite_warning
		}
	}
	actions = [
		{
			action = overwrite_warning
			flow_state = ps2_memcard_overwrite_warning_boot_fs
		}
		{
			action = save
			flow_state = ps2_memcard_overwrite_check_status_boot_fs
		}
	]
}
ps2_memcard_overwrite_complete_boot_fs = {
	create = ps2_memcard_saveload_complete
	create_params = {
		header = $string_ps2_overwrite_successful
		message = overwrite_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state = bootup_using_guitar_controller_fs
		}
	]
}
ps2_memcard_insufficient_space_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = insufficient_space_boot
		option1_text = $string_ps2_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = load
		}
		option2_text = $string_ps2_continue_without_saving
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = overwrite_warning
		}
	}
	actions = [
		{
			action = overwrite_warning
			flow_state = ps2_memcard_overwrite_warning_boot_fs
		}
		{
			action = load
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
	]
}
ps2_memcard_overwrite_warning_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_caution
		message = overwrite_warning_boot
		option1_text = $string_ps2_yes
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = autosave
		}
		option2_text = $string_ps2_no
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = load
		}
	}
	actions = [
		{
			action = autosave
			flow_state = 0x51972dc7
		}
		{
			action = load
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
	]
}
0x51972dc7 = {
	create = ps2_disable_autosave
	create_params = {
		header = $string_ps2_caution
		message = disable_autosave
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state = bootup_using_guitar_controller_fs
		}
	]
}
ps2_memcard_save_complete_boot_fs = {
	create = ps2_memcard_saveload_complete
	create_params = {
		header = $string_ps2_save_successful
		message = save_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state = bootup_using_guitar_controller_fs
		}
	]
}
ps2_memcard_save_check_status_ingame_fs = {
	create = ps2_memcard_save_check_status
	create_params = {
		header = $string_ps2_checking
		message = check_memcard
		check_for_existing = 1
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_save_no_card_ingame_fs
		}
		{
			action = not_formatted
			flow_state = ps2_memcard_attempt_format_ingame_fs
		}
		{
			action = insufficient_space
			flow_state = ps2_memcard_insufficient_space_ingame_fs
		}
		{
			action = status_ok
			flow_state_func = ps2_memcard_save_successor
		}
		{
			action = new_memcard
			flow_state = ps2_memcard_save_new_card_ingame_fs
		}
		{
			action = existing_save
			flow_state_func = ps2_memcard_existing_save_successor
		}
	]
}
ps2_memcard_save_ingame_fs = {
	create = ps2_memcard_save
	create_params = {
		header = $string_ps2_saving
		message = saving
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_save_no_card_ingame_fs
		}
		{
			action = not_formatted
			flow_state = ps2_memcard_attempt_format_ingame_fs
		}
		{
			action = error
			flow_state = ps2_memcard_save_error_ingame_fs
		}
		{
			action = insufficient_space
			flow_state = ps2_memcard_insufficient_space_ingame_fs
		}
		{
			action = save_complete
			flow_state = ps2_memcard_save_complete_ingame_fs
		}
	]
}
ps2_memcard_autosave_ingame_fs = {
	create = ps2_memcard_save
	create_params = {
		header = $string_ps2_saving
		message = autosaving
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_save_no_card_ingame_fs
		}
		{
			action = not_formatted
			flow_state = ps2_memcard_attempt_format_ingame_fs
		}
		{
			action = error
			flow_state = ps2_memcard_save_error_ingame_fs
		}
		{
			action = insufficient_space
			flow_state = ps2_memcard_insufficient_space_ingame_fs
		}
		{
			action = save_complete
			flow_state = ps2_memcard_save_complete_ingame_fs
		}
	]
}
ps2_memcard_save_new_card_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = new_memcard_ingame
		option1_text = $string_ps2_yes
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = $string_ps2_no
		option2_script = ps2_leave_saveload_flow
	}
	actions = [
		{
			action = save
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_save_no_card_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = no_memcard_ingame
		option1_text = $string_ps2_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = $string_ps2_continue
		option2_script = ps2_leave_saveload_flow
	}
	actions = [
		{
			action = save
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_attempt_format_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_caution
		message = attempt_format
		option1_text = $string_ps2_no
		option1_script = ps2_leave_saveload_flow
		option2_text = $string_ps2_yes
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
	}
	actions = [
		{
			action = format
			flow_state = ps2_memcard_confirm_format_ingame_fs
		}
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_confirm_format_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_caution
		message = confirm_format
		option1_text = $string_ps2_no
		option1_script = ps2_leave_saveload_flow
		option2_text = $string_ps2_yes
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = format
			flow_state = ps2_memcard_format_check_status_ingame_fs
		}
	]
}
ps2_memcard_format_check_status_ingame_fs = {
	create = ps2_memcard_format_check_status
	create_params = {
		header = $string_ps2_checking
		message = check_memcard
	}
	actions = [
		{
			action = is_formatted
			flow_state = ps2_memcard_is_formatted_ingame_fs
		}
		{
			action = no_memcard
			flow_state = ps2_memcard_retry_format_ingame_fs
		}
		{
			action = status_ok
			flow_state = ps2_memcard_format_ingame_fs
		}
	]
}
ps2_memcard_format_ingame_fs = {
	create = ps2_memcard_format
	create_params = {
		header = $string_ps2_formatting
		message = formatting
	}
	actions = [
		{
			action = success
			flow_state = ps2_memcard_format_complete_ingame_fs
		}
		{
			action = no_memcard
			flow_state = ps2_memcard_retry_format_ingame_fs
		}
		{
			action = is_formatted
			flow_state = ps2_memcard_is_formatted_ingame_fs
		}
	]
}
ps2_memcard_retry_format_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = format_failed
		option1_text = $string_ps2_cancel
		option1_script = ps2_leave_saveload_flow
		option2_text = $string_ps2_retry
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
	}
	actions = [
		{
			action = format
			flow_state = ps2_memcard_format_check_status_ingame_fs
		}
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_is_formatted_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = already_formatted
		option1_text = $string_ps2_cancel
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = $string_ps2_retry
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
	}
	actions = [
		{
			action = format
			flow_state = ps2_memcard_format_check_status_ingame_fs
		}
		{
			action = save
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
	]
}
ps2_memcard_format_complete_ingame_fs = {
	create = ps2_memcard_message
	create_params = {
		header = $string_ps2_format_successful
		message = format_successful
		seconds = 1
	}
	actions = [
		{
			action = continue
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
	]
}
ps2_memcard_save_error_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = save_failed
		option1_text = $string_ps2_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = $string_ps2_continue
		option2_script = ps2_leave_saveload_flow
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = save
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
	]
}
ps2_memcard_insufficient_space_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = insufficient_space_ingame
		option1_text = $string_ps2_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = $string_ps2_cancel
		option2_script = ps2_leave_saveload_flow
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = save
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
	]
}
ps2_memcard_overwrite_warning_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_caution
		message = overwrite_warning_ingame
		option1_text = $string_ps2_no
		option1_script = ps2_leave_saveload_flow
		option2_text = $string_ps2_yes
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = save
		}
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = save
			func = destroy_ps2_trc_menu
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
	]
}
ps2_memcard_overwrite_confirm_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_caution
		message = confirm_overwrite_boot
		option1_text = $string_ps2_no
		option1_script = ps2_leave_saveload_flow
		option2_text = $string_ps2_yes
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = overwrite
		}
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = overwrite
			func = destroy_ps2_trc_menu
			flow_state = ps2_memcard_overwrite_check_status_ingame_fs
		}
	]
}
ps2_memcard_overwrite_check_status_ingame_fs = {
	create = ps2_memcard_save_check_status
	create_params = {
		header = $string_ps2_checking
		message = check_memcard
		no_check = 1
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_save_no_card_ingame_fs
		}
		{
			action = not_formatted
			flow_state = ps2_memcard_attempt_format_ingame_fs
		}
		{
			action = insufficient_space
			flow_state = ps2_memcard_insufficient_space_ingame_fs
		}
		{
			action = status_ok
			flow_state = ps2_memcard_overwrite_ingame_fs
		}
	]
}
ps2_memcard_overwrite_ingame_fs = {
	create = ps2_memcard_save
	create_params = {
		header = $string_ps2_overwriting
		message = overwriting
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_save_no_card_ingame_fs
		}
		{
			action = not_formatted
			flow_state = ps2_memcard_attempt_format_ingame_fs
		}
		{
			action = save_complete
			flow_state = ps2_memcard_overwrite_complete_ingame_fs
		}
		{
			action = error
			flow_state = ps2_memcard_overwrite_error_ingame_fs
		}
		{
			action = insufficient_space
			flow_state = ps2_memcard_insufficient_space_ingame_fs
		}
	]
}
ps2_memcard_overwrite_error_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = overwrite_failed
		option1_text = $string_ps2_retry
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = $string_ps2_continue_without_saving
		option2_script = ps2_leave_saveload_flow
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = save
			flow_state = ps2_memcard_overwrite_check_status_ingame_fs
		}
	]
}
ps2_memcard_overwrite_complete_ingame_fs = {
	create = ps2_memcard_saveload_complete
	create_params = {
		header = $string_ps2_overwrite_successful
		message = overwrite_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_save_complete_ingame_fs = {
	create = ps2_memcard_saveload_complete
	create_params = {
		header = $string_ps2_save_successful
		message = save_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_load_lose_progress_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_caution
		message = lose_progress_ingame
		option1_text = $string_ps2_cancel
		option1_script = ps2_leave_saveload_flow
		option2_text = $string_ps2_continue
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = load
		}
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = load
			flow_state = ps2_memcard_load_check_status_ingame_fs
		}
	]
}
ps2_memcard_load_check_status_ingame_fs = {
	create = ps2_memcard_load_check_status
	create_params = {
		header = $string_ps2_checking
		message = check_memcard
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_load_no_card_ingame_fs
		}
		{
			action = no_save
			flow_state = ps2_memcard_load_no_save_ingame_fs
		}
		{
			action = status_ok
			flow_state = ps2_memcard_load_ingame_fs
		}
	]
}
ps2_memcard_load_ingame_fs = {
	create = ps2_memcard_load
	create_params = {
		header = $string_ps2_loading
		message = loading
	}
	actions = [
		{
			action = load_complete
			flow_state = ps2_memcard_load_complete_ingame_fs
		}
		{
			action = no_memcard
			flow_state = ps2_memcard_load_no_card_ingame_fs
		}
		{
			action = no_save
			flow_state = ps2_memcard_load_no_save_ingame_fs
		}
		{
			action = corrupt_save
			flow_state = ps2_memcard_load_corrupt_ingame_fs
		}
	]
}
ps2_memcard_load_no_card_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = no_memcard_ingame
		option1_text = $string_ps2_continue
		option1_script = ps2_leave_saveload_flow
		option2_text = $string_ps2_retry
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = load
		}
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = load
			flow_state = ps2_memcard_load_check_status_ingame_fs
		}
	]
}
ps2_memcard_load_no_save_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = no_save_ingame
		option1_text = $string_ps2_continue
		option1_script = ps2_leave_saveload_flow
		option2_text = $string_ps2_retry
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = load
		}
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = load
			flow_state = ps2_memcard_load_check_status_ingame_fs
		}
	]
}
ps2_memcard_load_corrupt_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_memory_card_error
		message = load_failed
		option1_text = $string_ps2_cancel
		option1_script = ps2_leave_saveload_flow
		option2_text = $string_ps2_retry
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = load
		}
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = load
			flow_state = ps2_memcard_load_check_status_ingame_fs
		}
	]
}
ps2_memcard_load_complete_ingame_fs = {
	create = ps2_memcard_saveload_complete
	create_params = {
		header = $string_ps2_load_successful
		message = load_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_480p_warning_fs = {
	create = refresh_ps2_trc_menu
	destroy = destroy_ps2_trc_menu
	create_params = {
		header = $string_ps2_warning
		message = warning_480p
		option1_text = $string_ps2_ok
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = progresserize
		}
		option2_text = $string_ps2_cancel
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = leave_warning_flow
		}
	}
	actions = [
		{
			action = progresserize
			flow_state = ps2_now_in_480p_fs
		}
		{
			action = leave_warning_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_now_in_480p_fs = {
	create = ps2_try_progressive_scan
	destroy = destroy_ps2_trc_menu
	create_params = {
		header = $string_ps2_warning
		message = now_in_480p
		option1_text = $string_ps2_ok
		option1_script = ps2_accept_progressive_scan
		option2_text = $string_ps2_cancel
		option2_script = ps2_cancel_progressive_scan
	}
	actions = [
		{
			action = leave_warning_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = leave_warning_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
