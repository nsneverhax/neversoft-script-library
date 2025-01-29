wii_memcard_save_error_boot_fs = {
	create_params = {
		header = $wii_error_header
		message = save_failed
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = disable_saveload
			boot = 1
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_menu
		}
	}
}
wii_memcard_corrupt_boot_fs = {
	create_params = {
		header = $wii_error_header
		message = corrupt_boot
		option1_text = $wii_saveload_deletefile
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = delete_all_file
		}
		option2_text = $wii_saveload_continuecorrupt
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = disable_saveload
			boot = 1
		}
	}
}
wii_memcard_insufficient_space_boot_fs = {
	create_params = {
		header = $wii_error_header
		message = insufficient_space
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = disable_saveload
			boot = 1
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_memcard_insufficient_inode_boot_fs = {
	create_params = {
		header = $wii_error_header
		message = insufficient_inode
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = disable_saveload
			boot = 1
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_memcard_autosave_boot_fs = {
	create_params = {
		header = $wii_caution_header
		message = disable_autosave
	}
}
wii_memcard_save_complete_boot_fs = {
	create_params = {
		header = $wii_success_header
		message = save_successful
	}
}
wii_memcard_save_error_ingame_fs = {
	create_params = {
		header = $wii_error_header
		message = save_failed
		option1_text = $wii_saveload_retry
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = save
			check_for_space = 1
			boot = 0
		}
		option2_text = $wii_saveload_continue
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = leave_saveload_flow
		}
	}
}
wii_memcard_insufficient_space_ingame_fs = {
	create_params = {
		header = $wii_error_header
		message = insufficient_space
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_menu
		}
	}
}
wii_memcard_corrupt_ingame_fs = {
	create_params = {
		header = $wii_error_header
		message = corrupt_boot
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_deletefile
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = delete_file
			ingame = 1
		}
	}
}
wii_memcard_insufficient_inode_ingame_fs = {
	create_params = {
		header = $wii_error_header
		message = insufficient_inode
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_menu
		}
	}
}
wii_memcard_insufficient_space_jam_fs = {
	create_params = {
		header = $wii_error_header
		message = insufficient_space_jam
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_menu
		}
	}
}
wii_memcard_insufficient_inode_jam_fs = {
	create_params = {
		header = $wii_error_header
		message = insufficient_inode_jam
		option1_text = $wii_saveload_continuenosave
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_menu
		}
	}
}
wii_memcard_no_save_ingame_fs = {
	create_params = {
		header = $wii_nosave_header
		message = no_save_boot
		option1_text = $wii_saveload_yes
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = save
			check_for_space = 1
			boot = 0
		}
		option2_text = $wii_saveload_no
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = leave_saveload_flow
		}
	}
}
wii_memcard_overwrite_warning_ingame_fs = {
	create_params = {
		header = $wii_caution_header
		message = overwrite_warning_ingame
		option1_text = $wii_saveload_no
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_yes
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = save
			check_for_space = 1
			boot = 0
		}
	}
}
wii_memcard_save_complete_ingame_fs = {
	create_params = {
		header = $wii_success_header
		message = save_successful
	}
}
wii_memcard_load_lose_progress_ingame_fs = {
	create_params = {
		header = $wii_caution_header
		message = lose_progress_ingame
		option1_text = $wii_saveload_cancel
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_continue
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = load
			boot = 0
		}
	}
}
wii_memcard_load_no_save_ingame_fs = {
	create_params = {
		header = $wii_error_header
		message = no_save_ingame
		option1_text = $wii_saveload_continue
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = $wii_saveload_retry
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = load
			boot = 0
		}
	}
}
wii_memcard_load_corrupt_ingame_fs = {
	create_params = {
		header = $wii_error_header
		message = corrupt_boot
		option1_text = $wii_saveload_deletefile
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = delete_file
		}
		option2_text = $wii_saveload_continuecorrupt
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = disable_autosave
		}
	}
}
wii_memcard_load_complete_ingame_fs = {
	create_params = {
		header = $wii_success_header
		message = load_successful
	}
}
wii_memcard_insufficient_space_boot_wfc_only_fs = {
	create_params = {
		header = $wii_error_header
		message = insufficient_space_wfc_only
		option1_text = $wii_saveload_continue
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = continue_to_menu
			boot = 1
			no_space_wfc = 1
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_menu
		}
	}
}
wii_memcard_insufficient_inode_boot_wfc_only_fs = {
	create_params = {
		header = $wii_error_header
		message = insufficient_inode_wfc_only
		option1_text = $wii_saveload_continue
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = continue_to_menu
			boot = 1
			no_space_wfc = 1
		}
		option2_text = $wii_saveload_wiimenu
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_menu
		}
	}
}
wii_mii_lib_corrupt = {
	create_params = {
		header = $wii_error_header
		message = mii_channel_corrupt
		option1_text = qs(0x9d57d378)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = generic_back
		}
	}
}
