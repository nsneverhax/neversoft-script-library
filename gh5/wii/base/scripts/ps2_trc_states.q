blah_blah_temp_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = qs(0x00000000)
		message = overwrite_failed
		option1_text = qs(0x00000000)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = reload
		}
		option2_text = qs(0x00000000)
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
hack_ps2_saveload_successor = {
	create = stop_flow_manager_and_return_to_ui_state_machine
}

script stop_flow_manager_and_return_to_ui_state_machine 
	shut_down_flow_manager
	memcard_sequence_quit
endscript
ps2_memcard_autosave_warning_boot_fs = {
	create = ps2_memcard_message
	create_params = {
		header = $string_ps2_CAUTION
		message = boot_autosave_warning
		Seconds = -1
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
		header = qs(0x232eed4e)
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
		header = qs(0xfab8f6e7)
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
			flow_state = ps2_memcard_corrupt_boot_fs
		}
		{
			action = no_save
			flow_state = ps2_memcard_load_no_save_check_status_boot_fs
		}
	]
}
ps2_memcard_load_no_card_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = no_memcard_boot
		option1_text = qs(0x5d8b66a0)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = retry_load
		}
		option2_text = qs(0x06d0b6b0)
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = autosave
		}
	}
	actions = [
		{
			action = autosave
			flow_state = ps2_memcard_disable_autosave_boot_fs
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
		header = qs(0x232eed4e)
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
			action = status_ok
			flow_state = ps2_memcard_load_no_save_boot_fs
		}
	]
}
ps2_memcard_load_no_save_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_SAVE_NOT_FOUND
		message = no_save_boot
		option1_text = qs(0x58e0a1fb)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = qs(0xd2915c27)
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
		header = $string_ps2_LOAD_SUCCESSFUL
		message = load_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_save_check_status_boot_fs = {
	create = ps2_memcard_save_check_status
	create_params = {
		header = qs(0x232eed4e)
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
		header = qs(0xc13ee209)
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = no_memcard_save_boot
		option1_text = qs(0x5d8b66a0)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = retry_save
		}
		option2_text = qs(0x06d0b6b0)
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
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
	]
}
ps2_memcard_save_error_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = save_failed
		option1_text = qs(0x5d8b66a0)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = qs(0x06d0b6b0)
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
		header = $string_ps2_CAUTION
		message = attempt_format
		option1_text = qs(0xd2915c27)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = cancel_format
		}
		option2_text = qs(0x58e0a1fb)
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
		check_for_memcard_pulled = 1
	}
	actions = [
		{
			action = memcard_pulled
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
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
		header = $string_ps2_CAUTION
		message = confirm_format
		option1_text = qs(0xd2915c27)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = cancel_format
		}
		option2_text = qs(0x58e0a1fb)
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
		check_for_memcard_pulled = 1
	}
	actions = [
		{
			action = memcard_pulled
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
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
		header = qs(0x232eed4e)
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
		{
			action = new_memcard
			flow_state = ps2_memcard_save_new_card_boot_fs
		}
	]
}
ps2_memcard_format_boot_fs = {
	create = ps2_memcard_format
	create_params = {
		header = $string_ps2_FORMATTING
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
ps2_memcard_save_new_card_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = new_memcard_boot
		option1_text = qs(0x58e0a1fb)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = qs(0xd2915c27)
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = disable_autosave
		}
	}
	actions = [
		{
			action = save
			flow_state = ps2_memcard_save_check_status_boot_fs
		}
		{
			action = disable_autosave
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
	]
}
ps2_memcard_is_formatted_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = already_formatted
		option1_text = qs(0xf7723015)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = load
		}
		option2_text = qs(0x5d8b66a0)
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = format_failed
		option1_text = qs(0xf7723015)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = load
		}
		option2_text = qs(0x5d8b66a0)
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
	create = ps2_memcard_format_complete
	create_params = {
		header = $string_ps2_FORMAT_SUCCESSFUL
		message = format_successful
		Seconds = 1
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = corrupt_boot
		option1_text = qs(0x58e0a1fb)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = confirm_overwrite
		}
		option2_text = qs(0xd2915c27)
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
		header = $string_ps2_CAUTION
		message = confirm_overwrite_boot
		option1_text = qs(0x58e0a1fb)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = overwrite
		}
		option2_text = qs(0xd2915c27)
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
		header = qs(0x232eed4e)
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
			action = status_ok
			flow_state = ps2_memcard_overwrite_boot_fs
		}
		{
			action = new_memcard
			flow_state = ps2_memcard_save_new_card_boot_fs
		}
	]
}
ps2_memcard_overwrite_boot_fs = {
	create = ps2_memcard_save
	create_params = {
		header = qs(0xd99906d4)
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = overwrite_failed
		option1_text = qs(0x5d8b66a0)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = qs(0x06d0b6b0)
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
		header = $string_ps2_OVERWRITE_SUCCESSFUL
		message = overwrite_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_insufficient_space_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = insufficient_space_boot
		option1_text = qs(0x5d8b66a0)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = load
		}
		option2_text = qs(0x06d0b6b0)
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
		header = $string_ps2_CAUTION
		message = overwrite_warning_boot
		option1_text = qs(0x58e0a1fb)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = autosave
		}
		option2_text = qs(0xd2915c27)
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = load
		}
	}
	actions = [
		{
			action = autosave
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
		{
			action = load
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
	]
}
ps2_memcard_disable_autosave_boot_fs = {
	create = ps2_disable_autosave
	create_params = {
		header = $string_ps2_CAUTION
		message = disable_autosave
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_save_complete_boot_fs = {
	create = ps2_memcard_saveload_complete
	create_params = {
		header = $string_ps2_SAVE_SUCCESSFUL
		message = save_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_save_check_status_ingame_fs = {
	create = ps2_memcard_save_check_status
	create_params = {
		header = qs(0x232eed4e)
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
		{
			action = corrupt_save
			flow_state_func = ps2_memcard_save_successor
		}
	]
}
ps2_memcard_save_ingame_fs = {
	create = ps2_memcard_save
	create_params = {
		header = qs(0xc13ee209)
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
		header = qs(0xc13ee209)
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = new_memcard_ingame
		option1_text = qs(0x58e0a1fb)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = qs(0xd2915c27)
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = disable_autosave
		}
	}
	actions = [
		{
			action = save
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
		{
			action = disable_autosave
			flow_state = ps2_memcard_disable_autosave_ingame_fs
		}
	]
}
ps2_memcard_disable_autosave_ingame_fs = {
	create = ps2_disable_autosave
	create_params = {
		header = $string_ps2_CAUTION
		message = disable_autosave
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_save_no_card_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = no_memcard_ingame
		option1_text = qs(0x5d8b66a0)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = qs(0x182f0173)
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
		header = $string_ps2_CAUTION
		message = attempt_format
		option1_text = qs(0xd2915c27)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x58e0a1fb)
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
		check_for_memcard_pulled = 1
	}
	actions = [
		{
			action = memcard_pulled
			flow_state = ps2_memcard_save_no_card_ingame_fs
		}
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
		header = $string_ps2_CAUTION
		message = confirm_format
		option1_text = qs(0xd2915c27)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x58e0a1fb)
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = format
		}
		check_for_memcard_pulled = 1
	}
	actions = [
		{
			action = memcard_pulled
			flow_state = ps2_memcard_save_no_card_ingame_fs
		}
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
		header = qs(0x232eed4e)
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
		{
			action = new_memcard
			flow_state = ps2_memcard_save_new_card_ingame_fs
		}
	]
}
ps2_memcard_format_ingame_fs = {
	create = ps2_memcard_format
	create_params = {
		header = $string_ps2_FORMATTING
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = format_failed
		option1_text = qs(0xf7723015)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x5d8b66a0)
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = already_formatted
		option1_text = qs(0xf7723015)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = qs(0x5d8b66a0)
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
		header = $string_ps2_FORMAT_SUCCESSFUL
		message = format_successful
		Seconds = 1
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = save_failed
		option1_text = qs(0x5d8b66a0)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = qs(0x182f0173)
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = insufficient_space_ingame
		option1_text = qs(0x5d8b66a0)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = qs(0xf7723015)
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
		header = $string_ps2_CAUTION
		message = overwrite_warning_ingame
		option1_text = qs(0xd2915c27)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x58e0a1fb)
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
		header = $string_ps2_CAUTION
		message = confirm_overwrite_boot
		option1_text = qs(0xd2915c27)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x58e0a1fb)
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
		header = qs(0x232eed4e)
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
			action = status_ok
			flow_state = ps2_memcard_overwrite_ingame_fs
		}
	]
}
ps2_memcard_overwrite_ingame_fs = {
	create = ps2_memcard_save
	create_params = {
		header = qs(0xd99906d4)
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = overwrite_failed
		option1_text = qs(0x5d8b66a0)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = save
		}
		option2_text = qs(0x06d0b6b0)
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
		header = $string_ps2_OVERWRITE_SUCCESSFUL
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
		header = $string_ps2_SAVE_SUCCESSFUL
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
		header = $string_ps2_CAUTION
		message = lose_progress_ingame
		option1_text = qs(0xf7723015)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x182f0173)
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
		header = qs(0x232eed4e)
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
		header = qs(0xfab8f6e7)
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = no_memcard_ingame
		option1_text = qs(0x182f0173)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x5d8b66a0)
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = no_save_ingame
		option1_text = qs(0x182f0173)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x5d8b66a0)
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
		header = $string_ps2_MEMORY_CARD_ERROR
		message = load_failed
		option1_text = qs(0xf7723015)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x5d8b66a0)
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
		header = $string_ps2_LOAD_SUCCESSFUL
		message = load_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_delete_check_status_ingame_fs = {
	create = ps2_memcard_delete_check_status
	create_params = {
		header = qs(0x232eed4e)
		message = check_memcard
	}
	actions = [
		{
			action = no_memcard
			flow_state = ps2_memcard_delete_no_card_ingame_fs
		}
		{
			action = no_save
			flow_state = ps2_memcard_delete_no_save_ingame_fs
		}
		{
			action = status_ok
			flow_state = ps2_memcard_delete_ingame_fs
		}
	]
}
ps2_memcard_delete_ingame_fs = {
	create = ps2_memcard_delete
	create_params = {
		header = qs(0x6b122c30)
		message = deleting
	}
	actions = [
		{
			action = delete_complete
			flow_state = ps2_memcard_delete_complete_ingame_fs
		}
		{
			action = no_memcard
			flow_state = ps2_memcard_delete_no_card_ingame_fs
		}
		{
			action = no_save
			flow_state = ps2_memcard_delete_no_save_ingame_fs
		}
	]
}
ps2_memcard_delete_no_card_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = no_memcard_ingame
		option1_text = qs(0x182f0173)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x5d8b66a0)
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = retry
		}
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = retry
			flow_state = ps2_memcard_delete_check_status_ingame_fs
		}
	]
}
ps2_memcard_delete_no_save_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = no_save_ingame
		option1_text = qs(0x182f0173)
		option1_script = ps2_leave_saveload_flow
		option2_text = qs(0x5d8b66a0)
		option2_script = ui_flow_manager_respond_to_action
		option2_params = {
			action = retry
		}
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = retry
			flow_state = ps2_memcard_delete_check_status_ingame_fs
		}
	]
}
ps2_memcard_delete_complete_ingame_fs = {
	create = ps2_memcard_delete_complete
	create_params = {
		header = $string_ps2_delete_successful
		message = delete_successful
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
	Destroy = destroy_ps2_trc_menu
	create_params = {
		header = qs(0xaa163738)
		message = warning_480p
		option1_text = qs(0x0e41fe46)
		option1_script = ui_flow_manager_respond_to_action
		option1_params = {
			action = progresserize
		}
		option2_text = qs(0xf7723015)
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
	Destroy = destroy_ps2_trc_menu
	create_params = {
		header = qs(0xaa163738)
		message = now_in_480p
		option1_text = qs(0x0e41fe46)
		option1_script = ps2_accept_progressive_scan
		option2_text = qs(0xf7723015)
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
