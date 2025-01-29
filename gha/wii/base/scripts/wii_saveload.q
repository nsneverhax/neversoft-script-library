wii_saveload_successor = null_flow_state
wii_nosave_onboot = 0

script wii_leave_saveload_flow 
	if ($wii_memcard_autosave = 0)

		return \{flow_state = options_data_settings_fs}
	else

		ps2_get_saveload_successor
		return flow_state = <flow_state>
	endif
endscript

script wii_memcard_load 
	SetSaveFileName \{filetype = progress
		Name = 'GH3Progress'}
	GetGlobalTags \{globaltag_checksum
		params = globaltag_checksum}
	oldglobaltag_checksum = <globaltag_checksum>
	if ($wii_memcard_autosave = 1 || (<boot> = 1))
		loadfromoptions = FALSE
	else
		loadfromoptions = true
	endif
	if NOT LoadFromMemoryCard filetype = progress loadfromoptions = <loadfromoptions>
		if GotParam \{CorruptedData}

			if (<boot> = 1)
				return \{flow_state = wii_memcard_corrupt_boot_fs}
			elseif (<boot> = 0)
				return \{flow_state = wii_memcard_load_corrupt_ingame_fs}
			endif
		elseif GotParam \{nosave}

			if (<boot> = 1)
				return \{flow_state = 0x3bed5889}
			elseif (<boot> = 0)
				return \{flow_state = wii_memcard_load_no_save_ingame_fs}
			endif
		else
			ScriptAssert \{'Something went wrong with the file load that we don\'t handle yet'}
			if (<boot> = 1)
				return \{flow_state = wii_memcard_corrupt_boot_fs}
			elseif (<boot> = 0)
				return \{flow_state = wii_memcard_load_corrupt_ingame_fs}
			endif
		endif
	endif
	globaltag_checksum = invalid
	GetGlobalTags \{globaltag_checksum
		params = globaltag_checksum
		noassert = 1}
	if NOT (<globaltag_checksum> = <oldglobaltag_checksum>)

		ClearGlobalTags
		setup_globaltags

		if (<boot> = 1)
			return \{flow_state = wii_memcard_corrupt_boot_fs}
		elseif (<boot> = 0)
			return \{flow_state = wii_memcard_load_corrupt_ingame_fs}
		endif
	endif
	scan_globaltag_downloads

	if (<boot> = 1)
		if ($wii_nosave_onboot = 1)
			choose_proper_using_guitar_screen
			return flow_state = <flow_state>
		else
			return \{flow_state = bootup_press_any_button_fs}
		endif
	elseif (<boot> = 0)
		wii_leave_saveload_flow
		return flow_state = <flow_state>
	endif
endscript

script wii_memcard_check_for_space 
	if NOT getmemcardspaceavailable \{Name = $memcard_file_name
			filetype = progress}
		if (<no_space> = true)
			return \{nospace = 1
				noinode = 0}
		elseif (<no_inodes> = true)
			return \{noinode = 1
				nospace = 0}
		endif
	endif
	return \{nospace = 0
		noinode = 0}
endscript

script wii_memcard_save \{check_for_space = 1}


	if (<check_for_space> = 1)
		memcard_check_for_existing_save
		if (<found> = 0)
			wii_memcard_check_for_space



			if (<nospace> = 1)

				if (<boot> = 1)
					return \{flow_state = wii_memcard_insufficient_space_boot_fs}
				elseif (<boot> = 0)
					return \{flow_state = wii_memcard_insufficient_space_ingame_fs}
				endif
			elseif (<noinode> = 1)
				if (<boot> = 1)
					return \{flow_state = wii_memcard_insufficient_inode_boot_fs}
				elseif (<boot> = 0)
					return \{flow_state = wii_memcard_insufficient_inode_ingame_fs}
				endif
			endif
		endif
	endif
	if ($progression_pop_count = 1)
		pop_later = 1
		progression_push_current
	else
		pop_later = 0
	endif
	SetSaveFileName \{filetype = progress
		Name = 'GH3Progress'}
	if ($wii_memcard_autosave = 1 || (<boot> = 1))
		savefromoptions = FALSE
	else
		savefromoptions = true
	endif
	if NOT SaveToMemoryCard filetype = progress savefromoptions = <savefromoptions>

		if (<boot> = 1)
			return \{flow_state = wii_memcard_save_error_boot_fs}
		elseif (<boot> = 0)
			return \{flow_state = wii_memcard_save_error_ingame_fs}
		endif
	endif
	if (<pop_later> = 1)
		progression_pop_current
	endif

	if ($wii_memcard_autosave = 1)
		return \{success = 1}
	else
		wii_leave_saveload_flow
		return flow_state = <flow_state>
	endif
endscript

script wii_replace_file 
	ClearGlobalTags
	setup_globaltags
	DeleteMemCardFile \{filetype = progress}
	wii_memcard_save \{boot = 1}
	return flow_state = <flow_state>
endscript

script wii_replace_file_ingame 
	ClearGlobalTags
	setup_globaltags
	DeleteMemCardFile \{filetype = progress}
	wii_memcard_save \{boot = 0}
	return flow_state = <flow_state>
endscript

script wii_disable_autosave 
	create_wii_saveload_screen <...>
	Wait \{3
		Seconds}
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = leave_saveload_flow
		}}
endscript

script 0x37b6c168 
	get_flow_manager_action_state \{action = continue}
	Change wii_saveload_successor = <state>
endscript

script 0xfa4566a5 
	0x4ec04eb6 \{autosave = 0}
	Change \{wii_saveload_successor = options_data_settings_fs}
endscript

script wii_memcard_saveload_complete 
	create_wii_saveload_screen <...>
	SpawnScriptLater \{ui_flow_manager_respond_to_action
		params = {
			action = leave_saveload_flow
		}}
endscript
wii_memcard_autosave = 0

script 0x4ec04eb6 
	Change wii_memcard_autosave = <autosave>
endscript

script wii_goto_system_menu 
	resettoipl
endscript

script wii_delete_file_toggle_autosave 
	destroy_generic_popup
	DeleteMemCardFile \{filetype = progress}
endscript

script wifi_nand_continue_without_saving 
	destroy_generic_popup
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
endscript

script open_insufficient_space_dialog 
	destroy_generic_popup
	formatText TextName = message_text ($wii_wifi_nand_insufficient_space_text) d = (<fsblocks>)
	create_generic_popup {
		title = $wii_error_header
		message = <message_text>
		option_menu = 2
		option1 = {
			title = $wii_saveload_continuenosave
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wifi_nand_continue_without_saving}
			]
		}
		option2 = {
			title = $wii_saveload_wiimenu
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wii_goto_system_menu}
			]
		}
	}
endscript

script open_insufficient_inodes_dialog 
	destroy_generic_popup
	create_generic_popup \{title = $wii_error_header
		message = $wii_wifi_nand_insufficient_inodes_text
		option_menu = 2
		option1 = {
			title = $wii_saveload_continuenosave
			eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					wifi_nand_continue_without_saving
				}
			]
		}
		option2 = {
			title = $wii_saveload_wiimenu
			eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					wii_goto_system_menu
				}
			]
		}}
endscript

script open_corrupt_save_dialog 
	destroy_generic_popup
	get_string_wii \{message = corrupt_boot}
	create_generic_popup {
		title = $wii_error_header
		message = <localized_string>
		option_menu = 2
		font_scale = 0.6
		option1 = {
			title = $wii_saveload_continuecorrupt
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wifi_nand_continue_without_saving}
			]
		}
		option2 = {
			title = $wii_saveload_deletefile
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wii_delete_file_toggle_autosave}
			]
		}
	}
endscript

script wii_data_check_and_load 
	if ((progressfileexists) && (wfcfileexists))
		wii_memcard_load boot = <boot>
	else
		Change \{wii_nosave_onboot = 1}
		wii_create_missing_files boot = <boot>
	endif
	return flow_state = <flow_state>
endscript
disable_wifi = 0

script wii_create_missing_files 
	if ($progression_pop_count = 1)
		pop_later = 1
		progression_push_current
	else
		pop_later = 0
	endif
	if attempttocreatemissingfiles

	else





		if (<check_failed> = true)

			return \{flow_state = wii_memcard_save_error_boot_fs}
		elseif ((<no_progressfile> = true) && (<no_wfcfile> = true))

			if (<no_space> = true)

				Change \{enable_saving = 0}
				Change \{disable_wifi = 1}
				return \{flow_state = wii_memcard_insufficient_space_boot_fs}
			else

				Change \{enable_saving = 0}
				Change \{disable_wifi = 1}
				return \{flow_state = wii_memcard_insufficient_inode_boot_fs}
			endif
		elseif (<no_wfcfile> = true)

			wifinanddisablesaving
			if (<no_space> = true)

				Change \{disable_wifi = 1}
				Change \{enable_saving = 1}
				return \{flow_state = wii_memcard_insufficient_space_boot_wfc_only_fs}
			else

				Change \{disable_wifi = 1}
				Change \{enable_saving = 1}
				return \{flow_state = wii_memcard_insufficient_inode_boot_wfc_only_fs}
			endif
		elseif (<no_progressfile> = true)

			ScriptAssert \{'Somehow have a wfc file but no progress file'}
		else

			return \{flow_state = wii_memcard_save_error_boot_fs}
		endif
	endif
	if (<pop_later> = 1)
		progression_pop_current
	endif
	wii_memcard_load boot = <boot>
	return flow_state = <flow_state>
endscript
