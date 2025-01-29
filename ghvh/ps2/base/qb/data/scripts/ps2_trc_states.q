hack_ps2_saveload_successor = {
	create = stop_flow_manager_and_return_to_ui_state_machine
}
ps2_memcard_autosave_warning_boot_fs = {
	create = ps2_memcard_message
	create_params = {
		header = $string_ps2_CAUTION
		message = boot_autosave_warning
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
			flow_state_func = 0xb391c092
			flow_state_func_params = {
				message = no_memcard_boot
			}
		}
		{
			action = insufficient_space
			flow_state_func = 0xb391c092
			flow_state_func_params = {
				message = insufficient_space_boot
			}
		}
		{
			action = no_save
			flow_state = ps2_memcard_load_no_save_boot_fs
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
			flow_state_func = 0xb391c092
			flow_state_func_params = {
				message = no_memcard_boot
			}
		}
		{
			action = load_complete
			flow_state = ps2_memcard_load_complete_boot_fs
		}
		{
			action = corrupt_save
			flow_state = 0x287f25a0
		}
		{
			action = no_save
			flow_state = ps2_memcard_load_no_save_boot_fs
		}
	]
}
0x2f2e9d9b = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = $0xe674201a
		option1_text = qs(0x5d8b66a0)
		0x9c953112 = retry_load
		option2_text = qs(0xf7723015)
		0x121a36f1 = disable_autosave
	}
	actions = [
		{
			action = disable_autosave
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
		{
			action = retry_load
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
	]
}
ps2_memcard_load_no_save_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_SAVE_NOT_FOUND
		message = no_save_boot
		option1_text = qs(0xc08e8aaf)
		0x9c953112 = save
		option2_text = qs(0xf7723015)
		0x121a36f1 = 0x94e94c59
	}
	actions = [
		{
			action = save
			flow_state_func = 0xdfb56609
			flow_state_func_params = {
				mode = save
				flow_state = ps2_memcard_save_check_status_boot_fs
			}
		}
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
	]
}
0x287f25a0 = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = corrupt_boot
		option1_text = qs(0xf77909ae)
		0x9c953112 = confirm_overwrite
		option2_text = qs(0xf7723015)
		0x121a36f1 = 0x94e94c59
	}
	actions = [
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
		{
			action = confirm_overwrite
			flow_state_func = 0xdfb56609
			flow_state_func_params = {
				mode = overwrite
				flow_state = ps2_memcard_save_check_status_boot_fs
			}
		}
	]
}
ps2_memcard_load_complete_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $0x27e4f29a
		message = load_successful
		0x81a048de = 1
	}
	actions = [
		{
			action = continue
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
		0x9c953112 = load
		option2_text = qs(0xf7723015)
		0x121a36f1 = 0x94e94c59
	}
	actions = [
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
		{
			action = load
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
	]
}
ps2_memcard_save_check_status_boot_fs = {
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
			flow_state = ps2_memcard_save_boot_fs
		}
		{
			action = new_memcard
			flow_state = ps2_memcard_save_new_card_boot_fs
		}
	]
}
ps2_memcard_save_boot_fs = {
	create = ps2_memcard_save
	create_params = {
		save = {
			header = qs(0xc13ee209)
			message = saving
		}
		overwrite = {
			header = qs(0xd99906d4)
			message = overwriting
		}
	}
	actions = [
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
		message = no_memcard_boot
		option1_text = qs(0xf9ea2606)
		0x9c953112 = retry_save
		option2_text = qs(0xf7723015)
		0x121a36f1 = disable_autosave
	}
	actions = [
		{
			action = retry_save
			flow_state_func = 0xdfb56609
			flow_state_func_params = {
				mode = save
				flow_state = ps2_memcard_save_check_status_boot_fs
			}
		}
		{
			action = disable_autosave
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
	]
}
ps2_memcard_save_new_card_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = new_memcard
		option1_text = qs(0xe618e644)
		0x9c953112 = save
		option2_text = qs(0xf7723015)
		0x121a36f1 = disable_autosave
	}
	actions = [
		{
			action = save
			flow_state_func = 0xdfb56609
			flow_state_func_params = {
				mode = save
				flow_state = ps2_memcard_save_check_status_boot_fs
			}
		}
		{
			action = disable_autosave
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
	]
}
ps2_memcard_save_error_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		save = {
			message = save_failed
			option1_text = qs(0xf9ea2606)
		}
		overwrite = {
			message = overwrite_failed
			option1_text = qs(0xf929226b)
		}
		0x9c953112 = retry
		option2_text = qs(0xf7723015)
		0x121a36f1 = 0x94e94c59
	}
	actions = [
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
		{
			action = retry
			flow_state = ps2_memcard_save_check_status_boot_fs
		}
	]
}
ps2_memcard_save_complete_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $0x27e4f29a
		save = {
			message = save_successful
		}
		overwrite = {
			message = overwrite_successful
		}
		0x81a048de = 1
	}
	actions = [
		{
			action = continue
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_attempt_format_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_CAUTION
		message = attempt_format
		option1_text = qs(0xf7723015)
		0x9c953112 = 0x94e94c59
		option2_text = qs(0x6d7f3dac)
		0x121a36f1 = format
	}
	actions = [
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
		{
			action = format
			flow_state = 0x9924624a
		}
	]
}
0x9924624a = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_CAUTION
		message = 0xf754fd03
		option1_text = qs(0xf7723015)
		0x9c953112 = 0x94e94c59
		option2_text = qs(0x6d7f3dac)
		0x121a36f1 = format
	}
	actions = [
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_boot_fs
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
			action = no_memcard
			flow_state_func = 0xf321b8b3
			flow_state_func_params = {
				message = no_memcard
			}
		}
		{
			action = status_ok
			flow_state = ps2_memcard_format_boot_fs
		}
		{
			action = is_formatted
			flow_state_func = 0xf321b8b3
			flow_state_func_params = {
				message = is_formatted
			}
		}
		{
			action = new_memcard
			flow_state_func = 0xf321b8b3
			flow_state_func_params = {
				message = 0xb55bb074
			}
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
			action = success
			flow_state = ps2_memcard_format_complete_boot_fs
		}
		{
			action = error
			flow_state_func = 0xf321b8b3
			flow_state_func_params = {
				message = format_failed
			}
		}
	]
}
0x3a26f17e = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = $0xeb206b72
		option1_text = qs(0x5d8b66a0)
		0x9c953112 = load
		option2_text = qs(0xf7723015)
		0x121a36f1 = 0x94e94c59
	}
	actions = [
		{
			action = load
			flow_state = ps2_memcard_load_check_status_boot_fs
		}
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_boot_fs
		}
	]
}
ps2_memcard_format_complete_boot_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $0x27e4f29a
		message = format_successful
		0x81a048de = 1
	}
	actions = [
		{
			action = continue
			flow_state_func = 0xdfb56609
			flow_state_func_params = {
				mode = save
				flow_state = ps2_memcard_save_check_status_boot_fs
			}
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
			action = continue
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
0x9d327bc2 = {
	create = 0x785d4cd3
	actions = [
		{
			action = continue
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
	]
}
ps2_memcard_save_check_status_ingame_fs = {
	create = ps2_memcard_save_check_status
	create_params = {
		header = qs(0x232eed4e)
		message = check_memcard
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
			flow_state = ps2_memcard_save_ingame_fs
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
		save = {
			header = qs(0xc13ee209)
			message = saving
		}
		autosave = {
			header = qs(0xede50683)
			message = autosaving
		}
		overwrite = {
			header = qs(0xd99906d4)
			message = overwriting
		}
	}
	actions = [
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
ps2_memcard_insufficient_space_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = insufficient_space_ingame
		option1_text = qs(0xf9ea2606)
		0x9c953112 = save
		option2_text = qs(0xf7723015)
		0x121a36f1 = 0x94e94c59
	}
	actions = [
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_ingame_fs
		}
		{
			action = save
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
	]
}
ps2_memcard_save_new_card_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = new_memcard
		option1_text = qs(0xe618e644)
		0x9c953112 = save
		option2_text = qs(0xf7723015)
		0x121a36f1 = disable_autosave
	}
	actions = [
		{
			action = save
			flow_state_func = 0xdfb56609
			flow_state_func_params = {
				mode = save
				flow_state = ps2_memcard_save_check_status_ingame_fs
			}
		}
		{
			action = disable_autosave
			flow_state = ps2_memcard_disable_autosave_ingame_fs
		}
	]
}
ps2_memcard_overwrite_confirm_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_CAUTION
		message = confirm_overwrite
		option1_text = qs(0x06d0b6b0)
		0x9c953112 = 0x94e94c59
		option2_text = qs(0xf77909ae)
		0x121a36f1 = overwrite
	}
	actions = [
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_ingame_fs
		}
		{
			action = overwrite
			flow_state_func = 0xdfb56609
			flow_state_func_params = {
				mode = overwrite
				flow_state = ps2_memcard_save_check_status_ingame_fs
			}
		}
	]
}
ps2_memcard_save_error_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		save = {
			message = save_failed
			option1_text = qs(0xf9ea2606)
		}
		autosave = {
			message = save_failed
			option1_text = qs(0xf9ea2606)
		}
		overwrite = {
			message = overwrite_failed
			option1_text = qs(0xf929226b)
		}
		0x9c953112 = save
		option2_text = qs(0xf7723015)
		0x121a36f1 = 0x94e94c59
	}
	actions = [
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_ingame_fs
		}
		{
			action = save
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
	]
}
ps2_memcard_save_no_card_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = no_memcard
		option1_text = qs(0xf9ea2606)
		0x9c953112 = save
		option2_text = qs(0xf7723015)
		0x121a36f1 = 0x94e94c59
	}
	actions = [
		{
			action = save
			flow_state_func = 0xdfb56609
			flow_state_func_params = {
				mode = save
				flow_state = ps2_memcard_save_check_status_ingame_fs
			}
		}
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_ingame_fs
		}
	]
}
ps2_memcard_save_complete_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $0x27e4f29a
		save = {
			message = save_successful
		}
		autosave = {
			message = save_successful
		}
		overwrite = {
			message = overwrite_successful
		}
		0x81a048de = 1
	}
	actions = [
		{
			action = continue
			flow_state_func = ps2_get_saveload_successor
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
			action = continue
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
ps2_memcard_attempt_format_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_CAUTION
		message = attempt_format
		option1_text = qs(0xf7723015)
		0x9c953112 = 0x94e94c59
		option2_text = qs(0x6d7f3dac)
		0x121a36f1 = format
	}
	actions = [
		{
			action = format
			flow_state = 0x85896af8
		}
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_ingame_fs
		}
	]
}
0x85896af8 = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_CAUTION
		message = 0xf754fd03
		option1_text = qs(0xf7723015)
		0x9c953112 = 0x94e94c59
		option2_text = qs(0x6d7f3dac)
		0x121a36f1 = format
	}
	actions = [
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_ingame_fs
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
			action = no_memcard
			flow_state_func = 0x6f2725de
			flow_state_func_params = {
				message = no_memcard
			}
		}
		{
			action = status_ok
			flow_state = ps2_memcard_format_ingame_fs
		}
		{
			action = is_formatted
			flow_state_func = 0x6f2725de
			flow_state_func_params = {
				message = is_formatted
			}
		}
		{
			action = new_memcard
			flow_state_func = 0x6f2725de
			flow_state_func_params = {
				message = 0xb55bb074
			}
		}
	]
}
0x57a5f8f3 = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = $0xeb206b72
		option1_text = qs(0x5d8b66a0)
		0x9c953112 = load
		option2_text = qs(0xf7723015)
		0x121a36f1 = 0x94e94c59
	}
	actions = [
		{
			action = load
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_ingame_fs
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
			action = error
			flow_state = ps2_memcard_retry_format_ingame_fs
		}
	]
}
ps2_memcard_retry_format_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = format_failed
		option1_text = qs(0x5d8b66a0)
		0x9c953112 = format
		option2_text = qs(0xf7723015)
		0x121a36f1 = 0x94e94c59
	}
	actions = [
		{
			action = format
			flow_state = ps2_memcard_format_check_status_ingame_fs
		}
		{
			action = 0x94e94c59
			flow_state = ps2_memcard_disable_autosave_ingame_fs
		}
	]
}
ps2_memcard_format_complete_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $0x27e4f29a
		message = format_successful
		0x81a048de = 1
	}
	actions = [
		{
			action = continue
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}
	]
}
0xed33d43f = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = string_ps2_CAUTION
		message = 0xde9a0f99
		option1_text = qs(0xf7723015)
		0x9c953112 = 0xe489929a
		option2_text = qs(0xc2993a50)
		0x121a36f1 = load
	}
	actions = [
		{
			action = 0xe489929a
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
		0x76001281 = 0
	}
	actions = [
		{
			action = no_memcard
			flow_state_func = 0xbd668983
			flow_state_func_params = {
				message = no_memcard
			}
		}
		{
			action = no_save
			flow_state_func = 0xbd668983
			flow_state_func_params = {
				message = no_save_ingame
			}
		}
		{
			action = status_ok
			flow_state = ps2_memcard_load_ingame_fs
		}
	]
}
0x30a8c721 = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = $0xe674201a
		option1_text = qs(0xf7723015)
		0x9c953112 = leave_saveload_flow
		option2_text = qs(0x5d8b66a0)
		0x121a36f1 = load
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
			flow_state_func = 0xbd668983
			flow_state_func_params = {
				message = no_memcard
			}
		}
		{
			action = no_save
			flow_state_func = 0xbd668983
			flow_state_func_params = {
				message = no_save_ingame
			}
		}
		{
			action = corrupt_save
			flow_state_func = 0xbd668983
			flow_state_func_params = {
				message = 0x8f9625eb
			}
		}
	]
}
ps2_memcard_load_complete_ingame_fs = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $0x27e4f29a
		message = load_successful
		0x81a048de = 1
	}
	actions = [
		{
			action = continue
			flow_state_func = ps2_get_saveload_successor
		}
	]
}
0x1df77d65 = {
	create = 0x29eee292
	create_params = {
		header = qs(0x232eed4e)
		message = check_memcard
		0x76001281 = 0
	}
	actions = [
		{
			action = no_memcard
			flow_state_func = 0x0b6c2529
			flow_state_func_params = {
				message = no_memcard
			}
		}
		{
			action = status_ok
			flow_state = ps2_memcard_load_ingame_fs
		}
	]
}
0xab51b627 = {
	create = 0x4dc01ebe
	create_params = {
		header = qs(0xfab8f6e7)
		message = 0xeabaadcd
	}
	actions = [
		{
			action = error
			flow_state_func = 0x0b6c2529
			flow_state_func_params = {
				message = 0xc6d29ab7
			}
		}
		{
			action = status_ok
			flow_state = ps2_memcard_load_ingame_fs
		}
	]
}
0x062005da = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = $0xe674201a
		option1_text = qs(0xf7723015)
		0x9c953112 = leave_saveload_flow
		option2_text = qs(0x5d8b66a0)
		0x121a36f1 = load
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = load
			flow_state = 0x1df77d65
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
			flow_state_func = 0xbd668983
			flow_state_func_params = {
				message = no_memcard
			}
		}
		{
			action = no_save
			flow_state_func = 0xbd668983
			flow_state_func_params = {
				message = no_save
			}
		}
		{
			action = status_ok
			flow_state = ps2_memcard_delete_ingame_fs
		}
	]
}
0x12f2ab7e = {
	create = refresh_ps2_trc_menu
	create_params = {
		header = $string_ps2_MEMORY_CARD_ERROR
		message = $0x5e74f644
		option1_text = qs(0x5919baae)
		0x9c953112 = leave_saveload_flow
		option2_text = qs(0x2c2a9e0f)
		0x121a36f1 = retry
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
			flow_state_func = 0xbd668983
			flow_state_func_params = {
				message = no_memcard
			}
		}
		{
			action = no_save
			flow_state_func = 0xbd668983
			flow_state_func_params = {
				message = no_save
			}
		}
	]
}
ps2_memcard_delete_complete_ingame_fs = {
	create = ps2_memcard_delete_complete
	create_params = {
		header = $0x27e4f29a
		message = delete_successful
	}
	actions = [
		{
			action = leave_saveload_flow
			flow_state_func = ps2_get_saveload_successor
		}
		{
			action = 0xddf6d24c
			flow_state = 0xab51b627
		}
	]
}
