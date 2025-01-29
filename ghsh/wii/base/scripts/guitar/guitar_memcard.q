max_memcard_filename_length = 15
SavingOrLoading = saving
memcard_default_title = 'Guitar Hero Smash Hits'
memcard_content_name = 'Progress'
memcard_content_jamsession_name = 'CustomSongs'
damagedfile = qs(0xd66d8e40)
badversionnumber = qs(0xec29a683)
save_data_dirty = 0
0x64fa86d1 = 0x00000000
memcard_file_types = {
	progress = {
		file_name = 'GH4Progress'
		prefix = 'GH4Prog'
		version = 70
		fixed_size = 900000
	}
	jamsession = {
		file_name = 'JamSave'
		file_temp = 'JamTemp'
		prefix = 'JamSave'
		version = 80
		fixed_size = 102000
	}
}
memcard_file_types_ps2 = {
	progress = {
		file_name = 'GH4Progress'
		suffix = 'Progress'
		folder_name = 'GH Smash Hits'
		icon = 'memcard\\cas.png'
		version = 54
		fixed_size = 409600
		menu_text = qs(0x9d87ba69)
		menu_icon = logo_cas
		suffix = ''
	}
	jamsession = {
		file_name = 'GH4JamSession'
		suffix = '-jam'
		folder_name = 'GH Smash Hits'
		icon = 'memcard\\cas.png'
		version = 80
		fixed_size = 102400
		menu_text = qs(0xfbf74b72)
		menu_icon = thpg
	}
}
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

script get_filename_from_filetype 
	if NOT GotParam \{filetype}
		ScriptAssert \{qs(0xca083485)}
	endif
	switch <filetype>
		case progress
		FileName = ($memcard_file_types.progress.file_name)
		case jamsession
		FileName = ($memcard_file_types.jamsession.file_name)
		default
		ScriptAssert qs(0x9a976be9) a = <filetype>
	endswitch
	return FileName = <FileName>
endscript
MemcardDoneScript = nullscript
MemcardRetryScript = nullscript
MemcardSavingOrLoading = saving
MemcardSuccess = FALSE
memcardcontroller = $primary_controller
memcardinitialboot = FALSE
memcardjamordefault = Default

script memcard_choose_storage_device \{StorageSelectorForce = 0}
	printscriptinfo \{'==> memcard_choose_storage_device'}
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

script memcard_check_for_existing_save \{filetype = NULL}
	if (filetype = NULL)
		filetype = $0x64fa86d1
	endif
	if MemCardFileExists Name = $memcard_file_name filetype = <filetype>
		return \{found = 1
			corrupt = 0}
	else
		return \{found = 0
			corrupt = 0}
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
		get_savegame_from_controller controller = ($memcardcontroller)
		SetGlobalTags user_options savegame = <savegame> params = {autosave = 1}
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
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	if (<overwrite> = 1)
		create_overwrite_success_menu
	else
		create_save_success_menu
	endif
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
		CreateScreenElement \{Type = SpriteElement
			id = ps3_delete_fader
			parent = root_window
			texture = black
			rgba = [
				0
				0
				0
				255
			]
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = $ps3_fade_overlay_z
			alpha = 1.0}
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
		DestroyScreenElement \{id = ps3_delete_fader}
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
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
		MC_LoadTOCInActiveFolder
		GetMemCardDirectoryListing
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
		if GotParam \{directorylisting}
			Change jam_curr_directory_listing = <directorylisting>
		else
			Change \{jam_curr_directory_listing = [
				]}
		endif
	else
		Change \{jam_curr_directory_listing = [
			]}
	endif
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
	refresh_autokick_cheat
	get_savegame_from_controller \{controller = $memcardcontroller}
	reset_transient_tags savegame = <savegame>
endscript

script refresh_autokick_cheat 
	controller = 0
	max_controllers = 4
	getsavegamefromcontroller controller = <controller>
	GetGlobalTags user_options savegame = <savegame>
	if (<unlock_cheat_autokick> = 1 && <cheat_index8> = 1)
		turn_on_autokick = 1
	endif
	if (<unlock_cheat_alwaysslide> = 1 && <cheat_index1> = 1)
		turn_on_autoslide = 1
	endif
	if (<unlock_Cheat_PerformanceMode> = 1 && <cheat_index4> = 1)
		turn_on_preformance = 1
	endif
	if (<unlock_cheat_freedrum> = 1 && <cheat_index0> = 1)
		turn_on_drumfill = 1
	endif
	if (<unlock_cheat_line6unlock> = 1)
		turn_on_line6 = 1
	endif
	if GotParam \{turn_on_autokick}
		Change \{cheat_autokick = 1}
	else
		Change \{cheat_autokick = 2}
	endif
	if GotParam \{turn_on_autoslide}
		Change \{cheat_alwaysslide = 1}
	else
		Change \{cheat_alwaysslide = 2}
	endif
	if GotParam \{turn_on_preformance}
		Change \{Cheat_PerformanceMode = 1}
	else
		Change \{Cheat_PerformanceMode = 2}
	endif
	if GotParam \{turn_on_drumfill}
		Change \{cheat_freedrum = 1}
	else
		Change \{cheat_freedrum = 2}
	endif
	if GotParam \{turn_on_line6}
		Change \{cheat_line6unlock = 1}
	else
		Change \{cheat_line6unlock = 0}
	endif
	printstruct <...>
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
	if ($0x64fa86d1 = jamsession)
		Change \{jam_selected_song = $memcard_jamsession_file_name}
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
			refresh_jam_directory_contents
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
	Change \{jam_curr_directory_listing = [
		]}
	memcard_enum_folders
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
		MC_LoadTOCInActiveFolder
		GetMemCardDirectoryListing
		if NOT (<Result> = FALSE)
			if GotParam \{directorylisting}
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
	MC_WaitAsyncOpsFinished
	mark_unsafe_for_shutdown
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardinitialboot = true}
	Change \{memcardjamordefault = Default}
	Change \{0x64fa86d1 = progress}
	SpawnScriptNow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_load_check_status_boot_fs
		}}
	return
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	if (<found> = 1)
		Goto \{memcard_load_file
			params = {
				LoadConfirmed = 1
			}}
	else
		Goto \{memcard_save_file
			params = {
				boot = 1
			}}
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
	ps2_memcard_set_autosave \{autosave = 0}
	Change \{0x64fa86d1 = progress}
	SpawnScriptNow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}}
	return
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
	if (<requested_autosave> = 1)
		ps2_memcard_set_autosave \{autosave = 0}
	else
		ps2_memcard_set_autosave \{autosave = 1}
	endif
	Change \{0x64fa86d1 = progress}
	SpawnScriptNow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}}
	return
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
	Change \{0x64fa86d1 = progress}
	SpawnScriptNow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_load_check_status_ingame_fs
		}}
	return
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
	jam_publish_update_playback_track \{guitar_num = 1}
	jam_publish_update_playback_track \{guitar_num = 2}
	downloaded = 0
	getsonginfo
	Change memcard_jamsession_song_version = <song_version>
	Change memcard_jamsession_downloaded = <downloaded>
	if GotParam \{fileid}
		Change memcard_jamsession_fileid = <fileid>
	endif
	Change memcard_jamsession_playback_track1 = <playback_track1>
	Change memcard_jamsession_playback_track2 = <playback_track2>
	Change memcard_jamsession_playback_track_drums = <playback_track_drums>
	Change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	ps2_memcard_set_autosave \{autosave = 0}
	Change \{0x64fa86d1 = jamsession}
	SpawnScriptNow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}}
	return
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
	if GotParam \{fileid}
		Change memcard_jamsession_fileid = <fileid>
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
	Change jam_curr_directory_listing = <directorylisting>
	printf \{channel = jam_mode
		qs(0x98e3ad04)}
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_save_success_menu
	guitar_memcard_save_success_sound
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
	Change \{0x64fa86d1 = jamsession}
	SpawnScriptNow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_load_check_status_ingame_fs
		}}
	return
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
	Change \{0x64fa86d1 = jamsession}
	SpawnScriptNow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_delete_check_status_ingame_fs
		}}
	return
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
		else
			memcard_error \{error = create_save_failed_menu}
		endif
	endif
	GetMemCardDirectoryListing
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
endscript

script memcard_set_options_as_successor 
	if isngc
		0xfa4566a5
	else
		ps2_memcard_set_options_as_successor
	endif
endscript

script memcard_overwrite_warning_ingame 
	if isngc
		memcard_check_for_existing_save
		if (<found> = 0)
			printf \{qs(0x857634d4)}
			wii_memcard_check_for_space
			if (<nospace> = 1)
				return \{flow_state = wii_memcard_insufficient_space_ingame_fs}
			elseif (<noinode> = 1)
				return \{flow_state = wii_memcard_insufficient_inode_ingame_fs}
			endif
			return \{flow_state = wii_memcard_no_save_ingame_fs}
		else
			SetSaveFileName filetype = progress Name = ($memcard_file_types.progress.file_name)
			if issavecorrupt \{filetype = progress}
				return \{flow_state = wii_memcard_corrupt_ingame_fs}
			elseif
				return \{flow_state = wii_memcard_overwrite_warning_ingame_fs}
			endif
		endif
	else
		return \{flow_state = ps2_memcard_overwrite_warning_ingame_fs}
	endif
endscript

script memcard_load_lose_progress_ingame 
	if isngc
		return \{flow_state = wii_memcard_load_lose_progress_ingame_fs}
	else
		return \{flow_state = ps2_memcard_load_lose_progress_ingame_fs}
	endif
endscript

script wii_memcard_sequence_begin_bootup 
	printf \{qs(0x2312b375)}
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change \{0x64fa86d1 = progress}
	Change \{wii_need_jamsession_scan = true}
	wii_data_check_and_load \{boot = 1}
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_save 
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change \{0x64fa86d1 = progress}
	local_check_for_space = (<event_params>.check_for_space)
	local_boot = (<event_params>.boot)
	0x8dbdaee4 \{qs(0xaec0694a)}
	0xe6b61ea6 <...>
	wii_memcard_save check_for_space = <local_check_for_space> boot = <local_boot> 0xc6b6bd22 = 'yes'
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_autosave 
	disable_pause
	mark_unsafe_for_shutdown
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change \{0x64fa86d1 = progress}
	GetGlobalTags \{user_options}
	if (<autosave> = 0)
		printf \{qs(0x4c1699ec)}
		return \{memcard_status = None}
	endif
	wii_memcard_save
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_load \{event_params = {
			boot = 0
		}}
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	Change \{MemcardSavingOrLoading = loading}
	Change \{MemcardSuccess = FALSE}
	Change \{0x64fa86d1 = progress}
	local_boot = (<event_params>.boot)
	wii_memcard_load boot = <local_boot>
	printf qs(0xdfd29571) a = <memcard_status>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_autoload 
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change \{0x64fa86d1 = progress}
	wii_data_check_and_load
	return memcard_status = <memcard_status>
endscript

script 0x83865a30 
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change \{0x64fa86d1 = progress}
	wii_replace_file \{boot = 0}
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_save_jam 
	mark_unsafe_for_shutdown
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_jam_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change \{0x64fa86d1 = jamsession}
	Change \{wii_need_jamsession_scan = true}
	getsonginfo
	Change memcard_jamsession_song_version = <song_version>
	Change memcard_jamsession_downloaded = <downloaded>
	if GotParam \{fileid}
		Change memcard_jamsession_fileid = <fileid>
	endif
	Change memcard_jamsession_artist = <artist>
	Change memcard_jamsession_playback_track1 = <playback_track1>
	Change memcard_jamsession_playback_track2 = <playback_track2>
	Change memcard_jamsession_playback_track_drums = <playback_track_drums>
	Change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	local_check_for_space = (<event_params>.check_for_space)
	local_boot = (<event_params>.boot)
	wii_memcard_save filetype = jamsession check_for_space = <local_check_for_space> boot = <local_boot>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_load_jam 
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	Change \{MemcardSavingOrLoading = loading}
	Change \{MemcardSuccess = FALSE}
	Change \{0x64fa86d1 = jamsession}
	local_boot = (<event_params>.boot)
	wii_memcard_load boot = <local_boot> filetype = jamsession
	printf qs(0xdfd29571) a = <memcard_status>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_delete_jam 
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	Change \{MemcardSavingOrLoading = deleting}
	Change \{MemcardSuccess = FALSE}
	Change \{0x64fa86d1 = jamsession}
	Change \{wii_need_jamsession_scan = true}
	wii_memcard_delete \{filetype = jamsession}
	printf qs(0xf4e8c5d2) a = <memcard_status>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_rename_jam 
	SpawnScriptNow memcard_sequence_begin_rename_jam_logic params = <...>
endscript

script guitar_memcard_save_success_sound 
	SoundEvent \{event = generic_menu_up_or_down_sound}
endscript
