memcard_default_title = 'Guitar Hero World Tour'
memcard_content_name = qs(0x7235ca15)
memcard_content_jamsession_name = qs(0xcf50afcb)
memcard_file_name = qs(0xc279b812)
save_data_dirty = 0
memcard_file_types = [
	{
		Name = progress
		version = 57
		fixed_size = 2097152
		use_temp_pools = FALSE
		is_binary_file = true
		num_bytes_per_frame = 102400
	}
	{
		Name = jamsession
		version = 80
		fixed_size = 1150976
		use_temp_pools = FALSE
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
				slots_reserve = 1
			}
		]
	}
	jamsessionscontent = {
		icon_xen = 'memcard\\gh.png'
		icon_ps3 = 'memcard\\ICON0.PNG'
		file_types = [
			{
				Name = jamsession
				slots_reserve = 0
			}
		]
	}
}
MemcardDoneScript = nullscript
MemcardRetryScript = nullscript
MemcardSavingOrLoading = saving
MemcardSuccess = FALSE
memcardcontroller = $primary_controller
memcardinitialboot = FALSE
memcardjamordefault = Default

script memcard_choose_storage_device \{StorageSelectorForce = 0}
	printscriptinfo \{qs(0x10bc9129)}
	create_checking_memory_card_screen
	Wait \{1
		Seconds}
	mc_setactiveplayer userid = ($memcardcontroller)
	if NOT CardIsInSlot
		if (<StorageSelectorForce> = 0)
			Goto \{create_storagedevice_warning_menu}
		endif
	endif
	dump
	ShowStorageSelector Force = <StorageSelectorForce> filetype = progress
endscript

script memcard_check_for_previously_used_folder 
	MC_WaitAsyncOpsFinished
	memcard_check_for_card
	if (<filetype> = jamsession)
		<FolderName> = $memcard_content_jamsession_name
	else
		<FolderName> = $memcard_content_name
	endif
	MC_SetActiveFolder FolderName = <FolderName>
	if mc_hasvalidatedfolder
		printf \{qs(0xa0f86458)}
		return \{found = 1
			corrupt = 0}
	else
		memcard_enum_folders
		if NOT MC_FolderExists FolderName = <FolderName>
			printf \{qs(0x16bcd50d)}
			return \{found = 0
				corrupt = 0}
		endif
		MC_SetActiveFolder FolderName = <FolderName>
		MC_LoadTOCInActiveFolder
		if (<Result> = true)
			if mc_hasvalidatedfolder
				printf \{qs(0xdc39d0c1)}
				return \{found = 1
					corrupt = 0}
			else
				printf \{qs(0x0fa7e44c)}
				return \{found = 0
					corrupt = 0}
			endif
		else
			if (<ErrorCode> = corrupt)
				printf \{qs(0x248ab78f)}
				return \{found = 1
					corrupt = 1}
			else
				printf \{qs(0x3d9186ce)}
				return \{found = 0
					corrupt = 0}
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
	memcard_enum_folders
	MC_WaitAsyncOpsFinished
	memcard_check_for_card
	if MC_FolderExists \{FolderName = $memcard_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_content_name}
		MC_LoadTOCInActiveFolder
		if (<Result> = FALSE)
			return \{found = 1
				corrupt = 1}
		endif
		if MemCardFileExists \{FileName = $memcard_file_name
				filetype = progress}
			return \{found = 1
				corrupt = 0}
		else
			return \{found = 1
				corrupt = 1}
		endif
	endif
	return \{found = 0
		corrupt = 0}
endscript

script memcard_wait_for_timer \{time = 3.0}
	begin
	if TimeGreaterThan <time>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script is_autosave_on 
	RequireParams \{[
			savegame
		]}
	GetGlobalTags user_options savegame = <savegame>
	if (<autosave> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script memcard_save_file \{OverwriteConfirmed = 0}
	printf \{qs(0x63276b9b)}
	mark_unsafe_for_shutdown
	Change \{MemcardSavingOrLoading = saving}
	memcard_check_for_card
	ResetTimer
	<overwrite> = 0
	if MC_FolderExists \{FolderName = $memcard_content_name}
		if (<OverwriteConfirmed> = 1)
			<overwrite> = 1
			create_overwrite_menu
			ResetTimer
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
		else
			Goto \{create_confirm_overwrite_menu}
		endif
	else
		if NOT MC_SpaceForNewFolder \{desc = GuitarContent}
			memcard_error \{error = create_out_of_space_menu}
		endif
		create_save_menu
		ResetTimer
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
	MC_SetActiveFolder \{FolderName = $memcard_content_name}
	MC_LoadTOCInActiveFolder
	memcard_pre_save_progress
	write_globals_to_global_tags
	pushtempmemcardpools \{Heap = heap_bink}
	SaveToMemoryCard \{FileName = $memcard_file_name
		filetype = progress
		usepaddingslot = Always}
	poptempmemcardpools
	if (<Result> = FALSE)
		if (<ErrorCode> = OutOfSpace)
			memcard_error \{error = create_out_of_space_menu}
		else
			if (<ErrorCode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu}
			elseif (<overwrite> = 1)
				memcard_error \{error = create_overwrite_failed_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	refresh_jam_directory_contents
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	if (<overwrite> = 1)
		create_overwrite_success_menu
	else
		create_save_success_menu
	endif
	Change \{save_data_dirty = 0}
	guitar_memcard_save_success_sound
	Wait \{1
		Seconds}
	memcard_sequence_quit
endscript

script memcard_delete_file \{file_type = Default}
	printf \{qs(0x810fae7c)}
	mark_unsafe_for_shutdown
	create_delete_file_menu
	MC_WaitAsyncOpsFinished
	if isps3
		fade_overlay_on \{alpha = 1.0}
		MC_StartPS3ForceDelete
		begin
		if MC_IsPS3ForceDeleteFinished
			break
		endif
		Wait \{1
			gameframes}
		repeat
		refresh_jam_directory_contents
		if NOT (<file_type> = jam_file)
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
			MC_LoadTOCInActiveFolder
		endif
		fade_overlay_off
	else
		if (<file_type> = Default)
			if MC_FolderExists \{FolderName = $memcard_content_name}
				ResetTimer
				MC_DeleteFolder \{FolderName = $memcard_content_name}
				if (<Result> = FALSE)
					memcard_error \{error = create_delete_failed_menu}
				endif
				memcard_wait_for_timer
			endif
		endif
		if (<file_type> = jam_file)
			if MC_FolderExists \{FolderName = $memcard_content_jamsession_name}
				ResetTimer
				MC_DeleteFolder \{FolderName = $memcard_content_jamsession_name}
				if (<Result> = FALSE)
					memcard_error \{error = create_delete_failed_menu}
				endif
				memcard_wait_for_timer
				create_delete_success_menu
			endif
		endif
		Wait \{1
			Seconds}
	endif
	if NotCD
		deleteallsongdatafromfile
	endif
	memcard_check_for_card
	memcard_sequence_retry
endscript

script memcard_load_file \{LoadConfirmed = 0}
	mark_unsafe_for_shutdown
	printf \{qs(0x03a3bf83)}
	Change \{MemcardSavingOrLoading = loading}
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
	pushtempmemcardpools \{Heap = heap_bink}
	LoadFromMemoryCard \{FileName = $memcard_file_name
		filetype = progress}
	poptempmemcardpools
	if (<Result> = FALSE)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	refresh_jam_directory_contents
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_load_success_menu
	memcard_post_load_progress
	Wait \{1
		Seconds}
	memcard_sequence_quit
endscript

script memcard_pre_save_progress 
endscript

script memcard_post_load_progress 
	if (($primary_controller) = $memcardcontroller)
		restore_globals_from_global_tags
	endif
	scan_globaltag_downloads
endscript

script memcard_cleanup_messages 
	destroy_popup_warning_menu
endscript

script memcard_sequence_generic_done 
	if ($MemcardSavingOrLoading = saving)
		if ($MemcardSuccess = true)
			printf \{qs(0xe2a29101)}
			ui_memcard_finish success = save controller = ($memcardcontroller)
		else
			printf \{qs(0x9f566822)}
			MC_SetActiveFolder \{FolderIndex = -1}
			ui_memcard_finish failed = save controller = ($memcardcontroller)
		endif
	else
		if ($MemcardSuccess = true)
			printf \{qs(0x0e63bd4a)}
			ui_memcard_finish success = load controller = ($memcardcontroller)
		else
			printf \{qs(0x264adb01)}
			MC_SetActiveFolder \{FolderIndex = -1}
			ui_memcard_finish failed = load controller = ($memcardcontroller)
		endif
	endif
endscript

script memcard_sequence_retry 
	printf \{qs(0x879b8ee7)}
	MC_WaitAsyncOpsFinished
	Goto $MemcardRetryScript params = {<...> controller = ($memcardcontroller)}
endscript

script memcard_disable_saves_and_quit 
	get_savegame_from_controller controller = ($memcardcontroller)
	SetGlobalTags user_options savegame = <savegame> params = {autosave = 0}
	memcard_sequence_quit
endscript

script memcard_sequence_quit 
	printf \{qs(0x5dba2148)}
	mark_safe_for_shutdown
	Goto $MemcardDoneScript params = <...>
endscript

script memcard_check_for_card 
	if NOT CardIsInSlot
		Goto create_storagedevice_warning_menu params = <...>
	endif
endscript

script memcard_error 
	printf \{qs(0x81c80e89)}
	RequireParams \{[
			error
		]
		all}
	memcard_check_for_card
	Goto <error> params = <params>
endscript

script memcard_sequence_cleanup_generic 
	MC_WaitAsyncOpsFinished
	memcard_cleanup_messages
	Change \{MemcardDoneScript = nullscript}
	Change \{MemcardRetryScript = nullscript}
	Change \{memcardcontroller = $primary_controller}
	mc_setactiveplayer \{querydefault}
endscript

script memcard_validate_card_data \{StorageSelectorForce = 0
		ValidatePrev = 0
		filetype = progress}
	mc_setactiveplayer userid = ($memcardcontroller)
	memcard_choose_storage_device StorageSelectorForce = <StorageSelectorForce>
	memcard_check_for_card <...>
	if (<ValidatePrev> = 1)
		memcard_check_for_previously_used_folder filetype = <filetype>
	else
		memcard_check_for_existing_save
	endif
	RequireParams \{[
			found
			corrupt
		]
		all}
	if (<corrupt> = 1)
		if (<filetype> = progress)
			refresh_jam_directory_contents \{ignore_failure}
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
			MC_LoadTOCInActiveFolder
			memcard_error \{error = create_corrupted_data_menu}
		else
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		endif
	endif
	return found = <found> corrupt = <corrupt>
endscript

script refresh_jam_directory_contents 
	printf \{'refresh_jam_directory_contents'}
	jam_reset_controller_directory_listing controller = ($memcardcontroller)
	Change \{jam_curr_directory_listing = [
		]}
	memcard_enum_folders
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
		MC_LoadTOCInActiveFolder
		GetMemCardDirectoryListing
		if GotParam \{ignore_failure}
			if (<Result> = FALSE)
				jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = []
				Change \{jam_curr_directory_listing = [
					]}
				return
			endif
		endif
		if (<Result> = FALSE)
			if (<ErrorCode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu
					params = {
						file_type = jam_file
					}}
			else
				memcard_error \{error = create_load_failed_menu}
			endif
		endif
		if NOT (<Result> = FALSE)
			if GotParam \{directorylisting}
				jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
				Change jam_curr_directory_listing = <directorylisting>
			endif
		endif
	endif
endscript

script memcard_sequence_begin_bootup 
	SpawnScriptNow memcard_sequence_begin_bootup_logic params = <...>
endscript

script memcard_sequence_begin_save 
	SpawnScriptNow memcard_sequence_begin_save_logic params = <...>
endscript

script memcard_sequence_begin_autosave 
	SpawnScriptNow memcard_sequence_begin_autosave_logic params = <...>
endscript

script memcard_sequence_begin_load 
	SpawnScriptNow memcard_sequence_begin_load_logic params = <...>
endscript

script memcard_sequence_begin_autoload 
	SpawnScriptNow memcard_sequence_begin_autoload_logic params = <...>
endscript

script memcard_sequence_begin_save_jam 
	SpawnScriptNow memcard_sequence_begin_save_jam_logic params = <...>
endscript

script memcard_sequence_begin_load_jam 
	SpawnScriptNow memcard_sequence_begin_load_jam_logic params = <...>
endscript

script memcard_sequence_begin_rename_jam 
	SpawnScriptNow memcard_sequence_begin_rename_jam_logic params = <...>
endscript

script memcard_sequence_begin_delete_jam 
	SpawnScriptNow memcard_sequence_begin_delete_jam_logic params = <...>
endscript

script memcard_sequence_begin_ss_load 
	SpawnScriptNow memcard_sequence_begin_ss_load_logic params = <...>
endscript

script memcard_sequence_begin_bootup_logic \{controller = $primary_controller}
	printf \{qs(0xf46a9374)}
	printstruct <...>
	MC_WaitAsyncOpsFinished
	mark_unsafe_for_shutdown
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardinitialboot = true}
	Change \{memcardjamordefault = Default}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	if (<found> = 1)
		Goto \{memcard_load_file
			params = {
				LoadConfirmed = 1
			}}
	else
		if ($memcard_initial_boot = 0)
			Goto \{memcard_save_file}
		else
			Goto \{$MemcardDoneScript}
		endif
	endif
endscript

script memcard_sequence_begin_save_logic \{StorageSelectorForce = 1
		controller = $primary_controller}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardinitialboot = FALSE}
	Change \{memcardjamordefault = Default}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	Goto \{memcard_save_file}
endscript

script memcard_sequence_begin_autosave_logic \{controller = $primary_controller}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	disable_pause
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardinitialboot = FALSE}
	Change \{memcardjamordefault = Default}
	get_savegame_from_controller controller = <controller>
	GetGlobalTags user_options savegame = <savegame>
	if (<autosave> = 0 && <requested_autosave> = 0)
		printf \{qs(0x4c1699ec)}
		Goto \{memcard_sequence_quit}
	endif
	mc_setactiveplayer userid = <controller>
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

script memcard_sequence_begin_load_logic \{StorageSelectorForce = 1
		controller = $primary_controller}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	Change \{MemcardSavingOrLoading = loading}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardinitialboot = FALSE}
	Change \{memcardjamordefault = Default}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	Goto \{memcard_load_file}
endscript

script memcard_sequence_begin_autoload_logic \{controller = $primary_controller}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	Change \{MemcardSavingOrLoading = loading}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardinitialboot = FALSE}
	Change \{memcardjamordefault = Default}
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

script jam_memcard_validate_card_data \{StorageSelectorForce = 0}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 1 filetype = jamsession
	return <...>
endscript

script memcard_sequence_begin_save_jam_logic \{StorageSelectorForce = 0
		controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x3ab2ee1c)}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_jam_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardinitialboot = FALSE}
	Change \{memcardjamordefault = jam}
	<card_was_in_slot> = FALSE
	if CardIsInSlot
		<card_was_in_slot> = true
	endif
	jam_memcard_validate_card_data <...>
	if (<corrupt> = 0)
		Goto memcard_save_jam params = {card_was_in_slot = <card_was_in_slot>}
	endif
endscript

script memcard_save_jam \{OverwriteConfirmed = 0
		card_was_in_slot = true}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardSavingOrLoading = saving}
	memcard_check_for_card
	ResetTimer
	printf \{channel = jam_mode
		qs(0xf6157763)}
	memcard_enum_folders
	create_save_menu
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		if (<card_was_in_slot> = FALSE)
			if (<OverwriteConfirmed> = 1)
				<overwrite> = 1
				create_overwrite_menu
				ResetTimer
				MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
			else
				Goto \{create_confirm_overwrite_menu}
			endif
		else
			MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
		endif
	else
		if NOT MC_SpaceForNewFolder \{desc = GuitarContent}
			memcard_error \{error = create_out_of_space_menu}
		endif
		MC_CreateFolder \{Name = $memcard_jamsession_content_name
			desc = jamsessionscontent}
		if (<Result> = FALSE)
			if (<ErrorCode> = OutOfSpace)
				memcard_error \{error = create_out_of_space_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	MC_LoadTOCInActiveFolder
	jam_publish_update_playback_track \{guitar_num = 1}
	jam_publish_update_playback_track \{guitar_num = 2}
	jam_publish_update_playback_drumvocal_track
	downloaded = 0
	getsonginfo
	Change memcard_jamsession_song_version = <song_version>
	Change memcard_jamsession_downloaded = <downloaded>
	if GotParam \{file_id}
		Change memcard_jamsession_fileid = <file_id>
	endif
	Change memcard_jamsession_artist = <artist>
	Change memcard_jamsession_playback_track1 = <playback_track1>
	Change memcard_jamsession_playback_track2 = <playback_track2>
	Change memcard_jamsession_playback_track_drums = <playback_track_drums>
	Change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	SaveToMemoryCard \{FileName = $memcard_jamsession_file_name
		filetype = jamsession
		usepaddingslot = never}
	if (<Result> = FALSE)
		if (<ErrorCode> = OutOfSpace)
			memcard_error \{error = create_out_of_space_menu}
		elseif (<ErrorCode> = badfolder)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_save_failed_menu}
		endif
	endif
	LoadFromMemoryCard \{FileName = $memcard_jamsession_file_name
		filetype = jamsession}
	if (<Result> = FALSE)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	Change \{jam_selected_song = $memcard_jamsession_file_name}
	GetMemCardDirectoryListing
	jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
	Change jam_curr_directory_listing = <directorylisting>
	printf \{channel = jam_mode
		qs(0x98e3ad04)}
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_save_success_menu
	guitar_memcard_save_success_sound
	Change \{save_data_dirty = 0}
	Wait \{1
		Seconds}
	if NOT MC_FolderExists \{FolderName = $memcard_content_name}
		if NOT MC_SpaceForNewFolder \{desc = GuitarContent}
			memcard_error \{error = create_out_of_space_menu
				params = {
					message_type = progress
				}}
		endif
	endif
	memcard_sequence_quit
	printf \{channel = jam_mode
		qs(0xe4d22b14)}
endscript

script memcard_sequence_begin_load_jam_logic \{StorageSelectorForce = 0
		controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x1be7f8f0)}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_load_jam_logic}
	Change \{MemcardSavingOrLoading = loading}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardinitialboot = FALSE}
	Change \{memcardjamordefault = jam}
	jam_memcard_validate_card_data <...>
	Goto \{memcard_load_jam}
endscript

script memcard_load_jam 
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardSavingOrLoading = loading}
	memcard_check_for_card
	ResetTimer
	printf \{channel = jam_mode
		qs(0xc201140a)}
	memcard_enum_folders
	create_load_file_menu
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	MC_LoadTOCInActiveFolder
	if (<Result> = FALSE)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	LoadFromMemoryCard \{FileName = $memcard_jamsession_file_name
		filetype = jamsession}
	if (<Result> = FALSE)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	Change \{jam_selected_song = $memcard_jamsession_file_name}
	printf \{channel = jam_mode
		qs(0x21ff1e27)}
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_load_success_menu
	Wait \{1
		Seconds}
	memcard_sequence_quit
endscript

script memcard_sequence_begin_rename_jam_logic \{controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x1be7f8f0)}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_rename_jam_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardinitialboot = FALSE}
	Change \{memcardjamordefault = jam}
	jam_memcard_validate_card_data <...>
	Goto \{memcard_rename_jam}
endscript

script memcard_rename_jam 
	printf \{channel = jam_mode
		qs(0x2e8352e2)}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardSavingOrLoading = loading}
	memcard_check_for_card
	ResetTimer
	printf \{channel = jam_mode
		qs(0x56078b7d)}
	memcard_enum_folders
	create_save_menu
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	MC_LoadTOCInActiveFolder
	MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	renamememcardfile \{FileName = $memcard_jamsession_file_name
		filetype = jamsession
		newfilename = $memcard_jamsession_new_file_name}
	if (<Result> = FALSE)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	SaveToMemoryCard \{FileName = $memcard_jamsession_new_file_name
		filetype = jamsession
		usepaddingslot = never}
	if (<Result> = FALSE)
		if (<ErrorCode> = OutOfSpace)
			memcard_error \{error = create_out_of_space_menu}
		else
			if (<overwrite> = 1)
				memcard_error \{error = create_overwrite_failed_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	Change \{jam_selected_song = $memcard_jamsession_new_file_name}
	Change \{memcard_jamsession_file_name = $memcard_jamsession_new_file_name}
	GetMemCardDirectoryListing
	jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
	Change jam_curr_directory_listing = <directorylisting>
	printf \{channel = jam_mode
		qs(0x6c35e2b6)}
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_rename_success_menu
	guitar_memcard_save_success_sound
	Wait \{1
		Seconds}
	memcard_sequence_quit
endscript

script memcard_sequence_begin_delete_jam_logic \{controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0xb777ae6b)}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_delete_jam_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardinitialboot = FALSE}
	Change \{memcardjamordefault = jam}
	jam_memcard_validate_card_data <...>
	Goto \{memcard_delete_jam}
endscript

script memcard_delete_jam 
	printf \{channel = jam_mode
		qs(0x45db1907)}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardSavingOrLoading = saving}
	memcard_check_for_card
	ResetTimer
	memcard_enum_folders
	create_delete_menu
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	MC_LoadTOCInActiveFolder
	MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	DeleteMemCardFile \{FileName = $memcard_jamsession_file_name
		filetype = jamsession}
	if (<Result> = FALSE)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		elseif (<ErrorCode> = badfolder)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_save_failed_menu}
		endif
	endif
	GetMemCardDirectoryListing
	jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
	Change jam_curr_directory_listing = <directorylisting>
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_delete_success_menu
	guitar_memcard_save_success_sound
	Wait \{1
		Seconds}
	memcard_sequence_quit
	printf \{channel = jam_mode
		qs(0x6b4e39fd)}
endscript

script memcard_sequence_begin_ss_load_logic \{controller = $primary_controller}
	printf \{'memcard_sequence_begin_ss_load_logic'}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_ss_load_logic}
	Change \{MemcardSavingOrLoading = loading}
	Change \{memcardinitialboot = FALSE}
	Change \{memcardjamordefault = Default}
	if memcard_get_new_secondary_signin
		Change \{MemcardSuccess = FALSE}
		Change memcardcontroller = <controller>
		if GotParam \{more_to_come}
			Change \{MemcardDoneScript = memcard_sequence_begin_ss_load_logic}
		endif
	else
		Change \{MemcardSuccess = true}
		mark_safe_for_shutdown
		memcard_sequence_generic_done
		return
	endif
	memcard_validate_card_data \{StorageSelectorForce = 0
		ValidatePrev = 0}
	if (<found> = 1)
		Goto \{memcard_load_file
			params = {
				LoadConfirmed = 1
			}}
	else
		Goto \{memcard_save_file}
	endif
endscript
new_secondary_signin_states = [
	None
	None
	None
	None
]

script memcard_secondary_signin_first_press 
	printf \{'memcard_secondary_signin_first_press'}
	if isps3
		return \{FALSE}
	endif
	if ($primary_controller_assigned = 1)
		GetArraySize \{$new_secondary_signin_states}
		i = 0
		begin
		if NOT (<i> = $primary_controller)
			if CheckForSignIn local controller_index = <i>
				SetArrayElement ArrayName = new_secondary_signin_states globalarray index = <i> NewValue = signin
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script memcard_handle_secondary_signin 
	printf 'memcard_handle_secondary_signin %d' d = <controller>
	if isps3
		return \{FALSE}
	endif
	if CheckForSignIn local controller_index = <controller>
		SetArrayElement ArrayName = new_secondary_signin_states globalarray index = <controller> NewValue = signin
	else
		get_savegame_from_controller controller = <controller>
		reset_globaltags savegame = <savegame>
		SetArrayElement ArrayName = new_secondary_signin_states globalarray index = <controller> NewValue = None
	endif
	KillSpawnedScript \{Name = memcard_handle_secondary_signin_spawned}
	SpawnScriptNow \{memcard_handle_secondary_signin_spawned}
endscript

script memcard_handle_secondary_signin_spawned 
	wait_for_blade_complete
	ui_event_get_stack
	if NOT ((<stack> [0].base_name) = 'band_mode')
		return
	endif
	memcard_load_any_secondary_signins
endscript

script memcard_load_any_secondary_signins 
	ScriptAssert \{qs(0x2c2b1078)}
	printf \{'memcard_load_any_secondary_signins'}
	if isps3
		return \{FALSE}
	endif
	GetArraySize \{$new_secondary_signin_states}
	i = 0
	begin
	if (($new_secondary_signin_states) [<i>] = signin)
		ui_memcard_secondary_siginin_load \{event = menu_back}
		return \{true}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script memcard_get_new_secondary_signin 
	printf \{'memcard_get_new_secondary_signin'}
	if isps3
		return \{FALSE}
	endif
	GetArraySize \{$new_secondary_signin_states}
	i = 0
	begin
	if (($new_secondary_signin_states) [<i>] = signin)
		if GotParam \{controller}
			more_to_come = 1
		else
			SetArrayElement ArrayName = new_secondary_signin_states globalarray index = <i> NewValue = None
			controller = <i>
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if GotParam \{controller}
		return true more_to_come = <more_to_come> controller = <controller>
	endif
	return \{FALSE}
endscript

script guitar_memcard_save_success_sound 
	SoundEvent \{event = save_confirmed_sfx}
endscript

script dim_save_option_for_guest 
	if isXenon
		if NetSessionFunc \{func = xenonisguest
				params = {
					controller_index = $primary_controller
				}}
			if GotParam \{popup_warning_child_index}
				GetScreenElementChildren id = <menu_id>
				(<children> [<popup_warning_child_index>]) :se_setprops not_focusable
			endif
			return \{not_focusable = 1}
		endif
	endif
endscript
