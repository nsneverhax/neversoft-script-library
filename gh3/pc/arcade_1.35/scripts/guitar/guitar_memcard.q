max_memcard_filename_length = 15
SavingOrLoading = saving
memcard_using_new_save_system = 1
memcard_default_title = 'Guitar Hero III: Legends of Rock'
memcard_content_name = "Progress"
memcard_file_name = "GH3Progress"
memcard_backup_file_name = "GH3ProgressBak"
memcard_padding_file_name = "GH3ProgressPad"
memcard_file_types = [
	{
		Name = progress
		version = 49
		fixed_size = 524288
		menu_text = "GAME PROGRESS"
		menu_icon = logo_cas
		use_temp_pools = true
		is_binary_file = FALSE
		num_bytes_per_frame = 102400
	}
]
memcard_folder_desc = {
	GuitarContent = {
		icon_xen = 'memcard\\gh.png'
		icon_ps3 = 'memcard\\ICON0.PNG'
		file_types = [
			{
				Name = progress
				slots_reserve = 2
			}
		]
	}
}
WriteToBuffer_CompressionLookupTable_8 = [
]
WriteToBuffer_CompressionLookupTable_16 = [
]
MemcardDoneScript = nullscript
MemcardRetryScript = nullscript
MemcardSavingOrLoading = saving
MemcardSuccess = FALSE

script memcard_choose_storage_device \{StorageSelectorForce = 0}
	printscriptinfo \{"==> memcard_choose_storage_device"}
	if ($memcard_using_new_save_system = 0)
		if NOT isXenon
			return
		endif
	endif
	if ($paused_for_hardware = 1)
		return
	endif
	Wait \{3
		gameframe}
	if ($memcard_using_new_save_system = 0)
		ShowStorageSelector Force = <Force> filetype = progress
		begin
		if StorageSelectorFinished
			break
		else
			Wait \{1
				gameframe}
		endif
		repeat
	else
		NewShowStorageSelector Force = <StorageSelectorForce> filetype = progress
	endif
endscript

script memcard_check_for_previously_used_folder 
	MC_WaitAsyncOpsFinished
	memcard_check_for_card
	if MC_HasActiveFolder
		printf \{"Card didn't change, re-using old data!"}
		return \{found = 1
			corrupt = 0}
	else
		memcard_enum_folders
		MC_LoadTOCInActiveFolder \{ValidatePrev}
		if (<Result> = true)
			if MemCardFileExists \{FileName = $memcard_file_name
					filetype = progress}
				printf \{"Card re-inserted, re-using old data!"}
				return \{found = 1
					corrupt = 0}
			else
				printf \{"memcard_check_for_previously_used_folder: MemCardFileExists returned false"}
				return \{found = 1
					corrupt = 1}
			endif
		else
			if (<ErrorCode> = InvalidTOC)
				return \{found = 0
					corrupt = 0}
			else
				if MC_FolderExists \{FolderName = $memcard_content_name}
					printf \{"memcard_check_for_previously_used_folder: um, whaaa?"}
					return \{found = 1
						corrupt = 1}
				else
					return \{found = 0
						corrupt = 0}
				endif
			endif
		endif
	endif
endscript

script memcard_enum_folders 
	MC_EnumerateFolders
	if (<Result> = FALSE)
		memcard_error \{error = create_storagedevice_warning_menu}
	endif
endscript

script memcard_check_for_existing_save 
	if ($memcard_using_new_save_system = 0)
		if isps3
			return \{found = 0}
		endif
		memcard_choose_storage_device
		GetMemCardDirectoryListing \{filetype = progress}
		if (<totalthps4filesoncard> = 1)
			printf \{"Found save file"}
			return \{found = 1
				corrupt = 0}
		endif
	else
		memcard_enum_folders
		MC_WaitAsyncOpsFinished
		memcard_check_for_card
		printf \{"memcard_check_for_existing_save: checking filename %s"
			s = $memcard_content_name}
		if MC_FolderExists \{FolderName = $memcard_content_name}
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
			MC_LoadTOCInActiveFolder
			if (<Result> = FALSE)
				printf \{"memcard_check_for_existing_save: um, whaaaa???"}
				return \{found = 1
					corrupt = 1}
			endif
			if MemCardFileExists \{FileName = $memcard_file_name
					filetype = progress}
				return \{found = 1
					corrupt = 0}
			else
				printf \{"memcard_check_for_existing_save: MemCardFileExists returned false"}
				return \{found = 1
					corrupt = 1}
			endif
		endif
	endif
	return \{found = 0
		corrupt = 0}
endscript

script memcard_wait_for_timer \{time = 5.0}
	begin
	if TimeGreaterThan <time>
		break
	endif
	printf \{"memcard_wait_for_timer: waiting..."}
	Wait \{1
		gameframe}
	repeat
endscript
memcard_active_saves = 0

script memcard_save_file \{OverwriteConfirmed = 0}
	printf \{"==> memcard_save_file"}
	Change \{MemcardSavingOrLoading = saving}
	if ($memcard_using_new_save_system = 0)
		if isps3
			return
		endif
		SetSaveFileName \{filetype = progress
			Name = "GH3Progress"}
		if NOT SaveToMemoryCard \{filetype = progress}
			printstruct <...>
			return \{failed = 1}
		endif
	else
		memcard_check_for_card
		ResetTimer
		<overwrite> = 0
		if MC_FolderExists \{FolderName = $memcard_content_name}
			if (<OverwriteConfirmed> = 1)
				<overwrite> = 1
				MC_SetActiveFolder \{FolderName = $memcard_content_name}
			else
				Goto \{create_confirm_overwrite_menu}
			endif
		else
			if isps3
				if NOT MC_SpaceForNewFolder \{desc = GuitarContent}
					memcard_error \{error = create_out_of_space_menu}
				endif
			endif
			MC_CreateFolder \{Name = $memcard_content_name
				desc = GuitarContent}
			if (<Result> = FALSE)
				if (<ErrorCode> = OutOfSpace)
					memcard_error \{error = create_out_of_space_menu}
				else
					memcard_error \{error = create_save_failed_menu}
				endif
			endif
		endif
		memcard_pre_save_progress
		Change memcard_active_saves = ($memcard_active_saves + 1)
		SaveToMemoryCard \{FileName = $memcard_file_name
			filetype = progress
			usepaddingslot = Always}
		Wait \{2
			Seconds}
		printf \{"memcard_save_file: memcard_active_saves = %a"
			a = $memcard_active_saves}
		if ($memcard_active_saves = 1)
			printf \{"memcard_save_file: saving backup"}
			SaveToMemoryCard \{FileName = $memcard_backup_file_name
				filetype = progress
				usepaddingslot = never}
		endif
		Change memcard_active_saves = ($memcard_active_saves -1)
		Change \{MemcardSuccess = true}
		if (<overwrite> = 1)
		else
			create_save_success_menu
		endif
	endif
	memcard_sequence_quit
endscript

script memcard_delete_file \{show_output = 1}
	printf \{"==> memcard_delete_file"}
	if ($memcard_using_new_save_system = 0)
		if NOT DeleteMemCardFile \{filetype = progress}
			if (<show_output> = 1)
				destroy_popup_warning_menu
				create_delete_failed_menu
			endif
		else
			if (<show_output> = 1)
				destroy_popup_warning_menu
				create_delete_success_menu
			endif
		endif
	else
		if (<show_output> = 1)
			create_delete_file_menu
		endif
		MC_WaitAsyncOpsFinished
		if isps3
			fade_overlay_on
			MC_StartPS3ForceDelete
			begin
			if MC_IsPS3ForceDeleteFinished
				break
			endif
			Wait \{1
				gameframes}
			repeat
			fade_overlay_off
		else
			ResetTimer
			MC_DeleteFolder \{FolderName = $memcard_content_name}
			if ((<Result> = FALSE) && (<show_output> = 1))
				memcard_error \{error = create_delete_failed_menu}
			endif
			if (<show_output> = 1)
				create_delete_success_menu
			endif
		endif
	endif
	if (<show_output> = 1)
		memcard_check_for_card
		memcard_sequence_retry
	endif
endscript

script memcard_load_file \{LoadConfirmed = 0}
	printf \{"==> memcard_load_file"}
	Change \{MemcardSavingOrLoading = loading}
	if ($memcard_using_new_save_system = 0)
		if isps3
			return
		endif
		SetSaveFileName \{filetype = progress
			Name = "GH3Progress"}
		GetGlobalTags \{globaltag_checksum
			params = globaltag_checksum}
		oldglobaltag_checksum = <globaltag_checksum>
		if NOT LoadFromMemoryCard \{filetype = progress}
			printstruct <...>
			if GotParam \{CorruptedData}
				return \{CorruptedData = 1}
			else
				printstruct <...>
				return \{failed = 1}
			endif
		endif
	else
		MC_WaitAsyncOpsFinished
		memcard_check_for_card
		ResetTimer
		if MC_FolderExists \{FolderName = $memcard_content_name}
			if (<LoadConfirmed> = 1)
				MC_SetActiveFolder \{FolderName = $memcard_content_name}
			else
				Goto \{create_confirm_load_menu}
			endif
		else
			memcard_error \{error = create_no_save_found_menu}
		endif
		MC_SetActiveFolder \{FolderName = $memcard_content_name}
		create_load_file_menu
		LoadFromMemoryCard \{FileName = $memcard_file_name
			filetype = progress}
		if (<Result> = FALSE)
			if (<ErrorCode> = corrupt)
				printf \{"memcard_load_file: whaa??? try the backup!!!"}
				LoadFromMemoryCard \{FileName = $memcard_backup_file_name
					filetype = progress}
				if (<Result> = FALSE)
					if (<ErrorCode> = corrupt)
						printf \{"memcard_load_file: whaa???"}
						memcard_error \{error = create_corrupted_data_menu}
					else
						memcard_error \{error = create_load_failed_menu}
					endif
				else
					memcard_error \{error = create_backup_data_menu}
				endif
			else
				memcard_error \{error = create_load_failed_menu}
			endif
		endif
		Change \{MemcardSuccess = true}
		create_load_success_menu
		memcard_post_load_progress
	endif
	memcard_sequence_quit
endscript

script memcard_pre_save_progress 
	<do_update> = 0
	if ($game_mode = p1_career)
		<do_update> = 1
	elseif ($game_mode = p2_career)
		<do_update> = 1
	endif
	if (<do_update> = 1)
		if ($progression_pop_count = 1)
			progression_push_current
			progression_pop_current
		endif
	endif
endscript

script memcard_post_load_progress 
	restore_options_from_global_tags
	scan_globaltag_downloads
endscript

script memcard_cleanup_messages 
	destroy_popup_warning_menu
endscript

script memcard_sequence_generic_done 
	if ($MemcardSavingOrLoading = saving)
		if ($MemcardSuccess = true)
			printf \{"==> Memcard sequence finished (save success)"}
			ui_flow_manager_respond_to_action \{action = memcard_sequence_save_success
				play_sound = 0}
		else
			printf \{"==> Memcard sequence finished (save failed)"}
			MC_SetActiveFolder \{FolderIndex = -1}
			ui_flow_manager_respond_to_action \{action = memcard_sequence_save_failed}
		endif
	else
		if ($MemcardSuccess = true)
			printf \{"==> Memcard sequence finished (load success)"}
			ui_flow_manager_respond_to_action \{action = memcard_sequence_load_success
				play_sound = 0}
		else
			printf \{"==> Memcard sequence finished (load failed)"}
			MC_SetActiveFolder \{FolderIndex = -1}
			ui_flow_manager_respond_to_action \{action = memcard_sequence_load_failed}
		endif
	endif
endscript

script memcard_sequence_empty_done 
	if ($MemcardSavingOrLoading = saving)
		if ($MemcardSuccess = true)
			printf \{"==> Memcard sequence finished (save success)"}
		else
			printf \{"==> Memcard sequence finished (save failed)"}
			MC_SetActiveFolder \{FolderIndex = -1}
		endif
	else
		if ($MemcardSuccess = true)
			printf \{"==> Memcard sequence finished (load success)"}
		else
			printf \{"==> Memcard sequence finished (load failed)"}
			MC_SetActiveFolder \{FolderIndex = -1}
		endif
	endif
	return
endscript

script memcard_sequence_retry 
	printf \{"memcard_sequence_retry"}
	Goto MemcardRetryScript params = <...>
endscript

script memcard_disable_saves_and_quit 
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	memcard_sequence_quit
endscript

script memcard_sequence_quit 
	printf \{"memcard_sequence_quit"}
	mark_safe_for_shutdown
	Goto MemcardDoneScript params = <...>
endscript

script memcard_check_for_card 
	if NOT CardIsInSlot
		printf \{"memcard_check_for_card: no card in slot"}
		Goto \{create_storagedevice_warning_menu}
	endif
endscript

script memcard_error 
	printf \{"memcard_error"}
	RequireParams \{[
			error
		]
		all}
	memcard_check_for_card
	printf "memcard_error: goto %s" s = <error>
	Goto <error> params = <params>
endscript

script memcard_sequence_cleanup_generic \{display_anything = 1}
	MC_WaitAsyncOpsFinished
	if (<display_anything> = 1)
		memcard_cleanup_messages
	endif
	Change \{MemcardDoneScript = nullscript}
	Change \{MemcardRetryScript = nullscript}
endscript

script memcard_validate_card_data \{StorageSelectorForce = 0
		ValidatePrev = 0}
	memcard_choose_storage_device StorageSelectorForce = <StorageSelectorForce>
	memcard_check_for_card
	if (<ValidatePrev> = 1)
		printf \{"memcard_validate_card_data: calling memcard_check_for_previously_used_folder"}
		memcard_check_for_previously_used_folder
	else
		printf \{"memcard_validate_card_data: calling memcard_check_for_existing_save"}
		memcard_check_for_existing_save
	endif
	RequireParams \{[
			found
			corrupt
		]
		all}
	if (<corrupt> = 1)
		printf \{"memcard_validate_card_data: corrupted data!"}
		memcard_error \{error = create_corrupted_data_menu}
	endif
	return found = <found>
endscript

script memcard_sequence_begin_bootup 
	disable_coin_display
	SpawnScriptNow memcard_sequence_begin_bootup_logic params = <...>
endscript

script memcard_sequence_begin_save 
	SpawnScriptNow memcard_sequence_begin_save_logic params = <...>
endscript

script memcard_sequence_begin_autosave 
	printf \{"memcard_sequence_begin_autosave"}
	SpawnScriptNow memcard_sequence_begin_autosave_logic params = <...>
endscript

script memcard_sequence_begin_load 
	SpawnScriptNow memcard_sequence_begin_load_logic params = <...>
endscript

script memcard_sequence_begin_bootup_logic 
	printf \{"memcard_sequence_begin_bootup"}
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	if (<found> = 1)
		Goto \{memcard_load_file
			params = {
				LoadConfirmed = 1
			}}
	else
		Goto \{memcard_save_file}
	endif
endscript

script memcard_sequence_begin_save_logic \{StorageSelectorForce = 1}
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	Goto \{memcard_save_file}
endscript

script memcard_sequence_begin_autosave_logic 
	disable_pause
	mark_unsafe_for_shutdown
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	GetGlobalTags \{user_options}
	if (<autosave> = 0)
		printf \{"Aborting autosave due to option being off"}
		Goto \{memcard_sequence_quit}
	endif
	if NOT CardIsInSlot
		Goto \{create_storagedevice_warning_menu}
	endif
	memcard_validate_card_data \{StorageSelectorForce = 0
		ValidatePrev = 1}
	if (<found> = 1)
		Goto \{memcard_save_file
			params = {
				OverwriteConfirmed = 1
			}}
	else
		memcard_sequence_retry
	endif
endscript

script memcard_sequence_begin_load_logic \{StorageSelectorForce = 1}
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	Change \{MemcardSavingOrLoading = loading}
	Change \{MemcardSuccess = FALSE}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	Goto \{memcard_load_file}
endscript
