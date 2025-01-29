wii_memcard_save_error_boot_fs = {
	create_params = {
		header = qs(0x79597197)
		message = save_failed
		option1_text = qs(0x96e78a5c)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = save
			check_for_space = 1
			boot = 1
		}
		option2_text = qs(0x8ccc6e9a)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = disable_autosave
		}
	}
}
wii_memcard_corrupt_boot_fs = {
	create_params = {
		header = qs(0x79597197)
		message = corrupt_boot
		option1_text = qs(0x21f73b70)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = delete_all_file
		}
		option2_text = qs(0x9adcc1b2)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_memcard_insufficient_space_boot_fs = {
	create_params = {
		header = qs(0x79597197)
		message = insufficient_space
		option1_text = qs(0x8ccc6e9a)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = disable_autosave
			boot = 1
		}
		option2_text = qs(0x9adcc1b2)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_memcard_insufficient_inode_boot_fs = {
	create_params = {
		header = qs(0x79597197)
		message = insufficient_inode
		option1_text = qs(0x8ccc6e9a)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = disable_autosave
			boot = 1
		}
		option2_text = qs(0x9adcc1b2)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_memcard_autosave_boot_fs = {
	create_params = {
		header = qs(0xb3d16ef9)
		message = disable_autosave
	}
}
wii_memcard_save_complete_boot_fs = {
	create_params = {
		header = qs(0x9853e050)
		message = save_successful
	}
}
wii_memcard_save_error_ingame_fs = {
	create_params = {
		header = qs(0x79597197)
		message = save_failed
		option1_text = qs(0x96e78a5c)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = save
			check_for_space = 1
			boot = 0
		}
		option2_text = qs(0x494b4d7f)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = leave_saveload_flow
		}
	}
}
wii_memcard_insufficient_space_ingame_fs = {
	create_params = {
		header = qs(0x79597197)
		message = insufficient_space
		option1_text = qs(0x8ccc6e9a)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = qs(0x9adcc1b2)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_memcard_corrupt_ingame_fs = {
	create_params = {
		header = qs(0x79597197)
		message = corrupt_boot
		option1_text = qs(0x8ccc6e9a)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = qs(0x21f73b70)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = delete_file
			ingame = 1
		}
	}
}
wii_memcard_insufficient_inode_ingame_fs = {
	create_params = {
		header = qs(0x79597197)
		message = insufficient_inode
		option1_text = qs(0x8ccc6e9a)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = qs(0x9adcc1b2)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_memcard_insufficient_space_jam_fs = {
	create_params = {
		header = qs(0x79597197)
		message = insufficient_space_jam
		option1_text = qs(0x8ccc6e9a)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = qs(0x9adcc1b2)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_memcard_insufficient_inode_jam_fs = {
	create_params = {
		header = qs(0x79597197)
		message = insufficient_inode_jam
		option1_text = qs(0x8ccc6e9a)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = qs(0x9adcc1b2)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_memcard_no_save_ingame_fs = {
	create_params = {
		header = qs(0xaf217c7b)
		message = no_save_boot
		option1_text = qs(0x6d562a67)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = save
			check_for_space = 1
			boot = 0
		}
		option2_text = qs(0x47157885)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = leave_saveload_flow
		}
	}
}
wii_memcard_overwrite_warning_ingame_fs = {
	create_params = {
		header = qs(0xb3d16ef9)
		message = overwrite_warning_ingame
		option1_text = qs(0x47157885)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = qs(0x6d562a67)
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
		header = qs(0x9853e050)
		message = save_successful
	}
}
wii_memcard_load_lose_progress_ingame_fs = {
	create_params = {
		header = qs(0xb3d16ef9)
		message = lose_progress_ingame
		option1_text = qs(0x7343df39)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = qs(0x494b4d7f)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = load
			boot = 0
		}
	}
}
wii_memcard_load_no_save_ingame_fs = {
	create_params = {
		header = qs(0x79597197)
		message = no_save_ingame
		option1_text = qs(0x494b4d7f)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = leave_saveload_flow
		}
		option2_text = qs(0x96e78a5c)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = load
			boot = 0
		}
	}
}
wii_memcard_load_corrupt_ingame_fs = {
	create_params = {
		header = qs(0x79597197)
		message = corrupt_boot
		option1_text = qs(0x8ccc6e9a)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = disable_autosave
		}
		option2_text = qs(0x21f73b70)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = delete_file
		}
	}
}
wii_memcard_load_complete_ingame_fs = {
	create_params = {
		header = qs(0x9853e050)
		message = load_successful
	}
}
wii_memcard_insufficient_space_boot_wfc_only_fs = {
	create_params = {
		header = qs(0x79597197)
		message = insufficient_space_wfc_only
		option1_text = qs(0x494b4d7f)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = continue_to_menu
			boot = 1
			no_space_wfc = 1
		}
		option2_text = qs(0x9adcc1b2)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_memcard_insufficient_inode_boot_wfc_only_fs = {
	create_params = {
		header = qs(0x79597197)
		message = insufficient_inode_wfc_only
		option1_text = qs(0x494b4d7f)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = continue_to_menu
			boot = 1
			no_space_wfc = 1
		}
		option2_text = qs(0x9adcc1b2)
		option2_script = ui_wii_trc_handle_action
		option2_params = {
			action = wii_data_management
		}
	}
}
wii_mii_lib_corrupt = {
	create_params = {
		header = qs(0x79597197)
		message = mii_channel_corrupt
		option1_text = qs(0x9d57d378)
		option1_script = ui_wii_trc_handle_action
		option1_params = {
			action = generic_back
		}
	}
}
