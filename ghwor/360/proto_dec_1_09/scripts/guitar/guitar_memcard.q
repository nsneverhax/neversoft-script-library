memcard_default_title = 'Guitar Hero 6'
memcard_content_name = qs(0x7235ca15)
memcard_content_jamsession_name = qs(0xcf50afcb)
memcard_file_name = qs(0xc7add391)
required_trophy_pack_size = 57671680
memcard_file_types = [
	{
		Name = progress
		version = 58
		fixed_size = 2097152
		use_temp_pools = FALSE
		is_binary_file = true
		num_bytes_per_frame = 102400
	}
	{
		Name = jamsession
		version = 82
		fixed_size = 1150976
		use_temp_pools = FALSE
		is_binary_file = FALSE
		num_bytes_per_frame = 102400
	}
	{
		Name = jamsessionpatterns
		version = 82
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
			{
				Name = jamsessionpatterns
				slots_reserve = 0
			}
		]
	}
}

script memcard_choose_storage_device \{StorageSelectorForce = 0
		storageselectortry = 0}
	printscriptinfo \{qs(0x10bc9129)}
	mc_setactiveplayer userid = ($memcardcontroller)
	if NOT mc_hasvalidstoragedevice
		if NOT GotParam \{invalid_device_okay}
			if (<StorageSelectorForce> = 0)
				Goto \{create_storagedevice_warning_menu}
			endif
		endif
	endif
	dump
	no_storage_device = 0
	if NOT mc_hasvalidstoragedevice
		no_storage_device = 1
	endif
	if ((<StorageSelectorForce> = 1) || (<no_storage_device> = 1) || (<storageselectortry> = 1))
		ShowStorageSelector Force = <StorageSelectorForce> try = <storageselectortry> filetype = progress
	endif
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
	memcard_sequence_begin
	Change \{MemcardSavingOrLoading = saving}
	memcard_check_for_card
	ResetTimer
	get_savegame_from_controller controller = ($memcardcontroller)
	memcard_enum_folders
	MC_WaitAsyncOpsFinished
	<overwrite> = 0
	if MC_FolderExists \{FolderName = $memcard_content_name}
		if (<OverwriteConfirmed> = 1)
			<overwrite> = 1
			savegame_ui_begin savegame = <savegame> text = qs(0x93e360b9)
			OnExitRun savegame_ui_end params = {savegame = <savegame>}
			ResetTimer
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
		else
			Goto \{create_confirm_overwrite_menu}
		endif
	else
		if NOT MC_SpaceForNewFolder \{desc = GuitarContent}
			memcard_error \{error = create_out_of_space_menu}
		endif
		savegame_ui_begin savegame = <savegame> text = qs(0x93e360b9)
		OnExitRun savegame_ui_end params = {savegame = <savegame>}
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
	memcard_pre_save_progress savegame = ($memcardcontroller)
	SaveToMemoryCard \{FileName = $memcard_file_name
		filetype = progress
		usepaddingslot = Always}
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
	memcard_post_save_progress savegame = <savegame>
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	guitar_memcard_save_success_sound
	savegame_ui_end savegame = <savegame>
	Wait \{15
		gameframes}
	memcard_sequence_quit
endscript

script memcard_delete_file \{file_type = Default}
	printf \{qs(0x810fae7c)}
	memcard_sequence_begin
	get_savegame_from_controller controller = ($memcardcontroller)
	savegame_ui_begin savegame = <savegame> text = qs(0x4acaa8b9) hide_on_ps3
	OnExitRun savegame_ui_end params = {savegame = <savegame>}
	MC_WaitAsyncOpsFinished
	if isps3
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
			endif
		endif
	endif
	if NotCD
		deleteallsongdatafromfile
	endif
	if ($memcard_boot_process = FALSE)
		memcard_check_for_card
	endif
	memcard_sequence_retry
endscript

script memcard_load_file 
	memcard_sequence_begin
	printf \{qs(0x03a3bf83)}
	Change \{MemcardSavingOrLoading = loading}
	MC_WaitAsyncOpsFinished
	memcard_validate_card_data invalid_device_okay = 1 StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	ResetTimer
	if MC_FolderExists \{FolderName = $memcard_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	MC_SetActiveFolder \{FolderName = $memcard_content_name}
	get_savegame_from_controller controller = ($memcardcontroller)
	savegame_ui_begin savegame = <savegame> text = qs(0xc8aec9d3)
	OnExitRun savegame_ui_end params = {savegame = <savegame>}
	if GotParam \{boot_load}
		printf 'Setting primary controller at boot: %d' d = <savegame>
		change_primary_controller controller = <savegame>
	endif
	memcard_pre_load_progress savegame = <savegame>
	LoadFromMemoryCard \{FileName = $memcard_file_name
		filetype = progress}
	if (<Result> = FALSE)
		memcard_post_load_progress_failed savegame = <savegame>
		if GotParam \{boot_load}
		endif
		if GotParam \{boot_load}
			mc_invalidatestoragedevice userid = <savegame>
			memcard_wait_for_timer \{time = 1.0}
			memcard_sequence_quit
		else
			if (<ErrorCode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu}
			else
				memcard_error \{error = create_load_failed_menu}
			endif
		endif
	endif
	get_savegame_from_controller controller = ($memcardcontroller)
	if GotParam \{boot_load}
		Change \{primary_controller_assigned = 1}
	endif
	memcard_post_load_progress savegame = <savegame> boot_load = <boot_load>
	if GotParam \{boot_load}
		Change \{primary_controller_assigned = 0}
	endif
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer \{time = 1.0}
	memcard_sequence_quit
endscript

script memcard_load_file_confirmed 
	memcard_cleanup_messages
	memcard_load_file \{StorageSelectorForce = 1}
endscript

script memcard_pre_save_progress 
	globaltag_sanity_check_pre_save savegame = <savegame>
endscript

script memcard_post_save_progress \{savegame_async = 0}
	SetGlobalTags savegame = <savegame> user_options params = {autosave = 1}
	SetGlobalTags savegame = <savegame> user_options params = {has_saved_game = 1}
	Change \{cas_logo_data_dirty = 0}
	if NOT refresh_jam_directory_contents savegame = <savegame> no_enumeration savegame_async = <savegame_async>
		return FALSE jamerrorcode = <ErrorCode>
	endif
	return \{true}
endscript

script memcard_pre_load_progress 
	lockglobaltags \{freeplay_check_off}
endscript

script memcard_post_load_progress_failed 
	lockglobaltags \{freeplay_check_on}
endscript

script memcard_post_load_progress \{savegame_async = 0
		boot_load = 0}
	if isxenonorwindx
		if (($primary_controller) = <savegame>)
			restore_globals_from_global_tags savegame = <savegame>
		endif
	else
		restore_globals_from_global_tags savegame = <savegame>
	endif
	scan_globaltag_downloads
	globaltag_update_avatar_metadata savegame = <savegame>
	if ($override_band_members = 1)
		setup_band_member_tags savegame = <savegame>
	endif
	if NOT isavatarsysteminitialized
		remove_avatars_from_band savegame = <savegame>
	endif
	reset_transient_tags savegame = <savegame>
	fix_deleted_character_savegame savegame = <savegame>
	check_cas \{savegames}
	SetGlobalTags savegame = <savegame> user_options params = {autosave = 1}
	SetGlobalTags savegame = <savegame> user_options params = {has_saved_game = 1}
	reset_universal_help_per_session_tags savegame = <savegame>
	lockglobaltags \{freeplay_check_on}
	ignore_failure = 0
	if (<boot_load> = 1)
		<ignore_failure> = 1
	endif
	if NOT refresh_jam_directory_contents savegame = <savegame> no_enumeration savegame_async = <savegame_async> ignore_failure = <ignore_failure>
		if (<boot_load> = 1)
			printf \{channel = bkutcher
				qs(0x870823ba)}
			reset_savegame savegame = <savegame>
		endif
		return FALSE jamerrorcode = <ErrorCode>
	endif
	return \{true}
endscript

script memcard_boot_scan 
	if (($savegame_ui_state) != boot)
		ScriptAssert \{'Should be in boot UI state'}
	endif
	GetTrueStartTime
	savegame_ui_begin \{text = qs(0xfa4a9022)}
	OnExitRun \{savegame_ui_end}
	success = 0
	if savegame_scan_all_players_for_progress_save
		if isxenonorwindx
			Change memcardcontroller = <userid>
		endif
		Goto \{memcard_load_file
			params = {
				boot_load = 1
			}}
		return
	else
		if GotParam \{ErrorCode}
			printf 'ui_create_savegame_boot_scan_spawned: savegame had errors %s' s = <ErrorCode>
			printf \{'ui_create_savegame_boot_scan_spawned: error loading up savegame'}
			memcard_sequence_quit
			return
		else
			wait_at_least_x_ms starttime = <starttime> at_least = 3000
			printf \{'ui_create_savegame_boot_scan_spawned: savegame not found'}
			memcard_sequence_quit
		endif
	endif
endscript

script refresh_autokick_cheat 
	controller = 0
	max_controllers = 4
	begin
	if CheckForSignIn local controller_index = <controller>
		getsavegamefromcontroller controller = <controller>
		GetGlobalTags user_options savegame = <savegame>
		if (<unlock_cheat_autokick> = 1 && <cheat_index12> = 1)
			get_local_player_num_from_controller controller_index = <controller>
			setplayerinfo <local_player_num> cheat_autokick = 1
		else
			setplayerinfo <local_player_num> cheat_autokick = 0
		endif
		if (<unlock_cheat_alwaysslide> = 1 && <cheat_index1> = 1)
			get_local_player_num_from_controller controller_index = <controller>
			setplayerinfo <local_player_num> cheat_alwaysslide = 1
		else
			setplayerinfo <local_player_num> cheat_alwaysslide = 0
		endif
	endif
	controller = (<controller> + 1)
	repeat <max_controllers>
endscript

script refresh_all_cheats_globals 
	getplayerinfo \{1
		controller}
	if CheckForSignIn local controller_index = <controller>
		getsavegamefromcontroller controller = <controller>
		GetGlobalTags user_options savegame = <savegame>
		GetArraySize ($guitar_hero_cheats)
		guitar_hero_cheats_size = <array_Size>
		if (<guitar_hero_cheats_size> > 0)
			guitar_hero_cheat_index = 0
			begin
			formatText checksumName = cheat_unlocked 'unlock_Cheat_%a' a = ($guitar_hero_cheats [<guitar_hero_cheat_index>].Name)
			if GotParam <cheat_unlocked>
				if ((<...>.<cheat_unlocked>) > 0)
					var = ($guitar_hero_cheats [<guitar_hero_cheat_index>].var)
					formatText checksumName = cheat_index_crc 'cheat_index%d' d = <guitar_hero_cheat_index>
					cheat_index = (<...>.<cheat_index_crc>)
					if StructureContains structure = ($guitar_hero_cheats [<guitar_hero_cheat_index>]) options
						globals = ($guitar_hero_cheats [<guitar_hero_cheat_index>].options [<cheat_index>].globals)
						GetArraySize <globals>
						if (<array_Size> > 0)
							globals_index = 0
							begin
							if (<globals> [<globals_index>].Set = <var>)
								Change GlobalName = <var> NewValue = (<globals> [<globals_index>].value)
								break
							endif
							globals_index = (<globals_index> + 1)
							repeat <array_Size>
						endif
					endif
				endif
			endif
			guitar_hero_cheat_index = (<guitar_hero_cheat_index> + 1)
			repeat <guitar_hero_cheats_size>
		endif
	endif
endscript

script memcard_cleanup_messages 
	destroy_dialog_box
endscript

script memcard_sequence_generic_done 
	if ($MemcardSavingOrLoading = saving)
		if ($MemcardSuccess = true)
			printf \{qs(0xe2a29101)}
			ui_memcard_finish success = save controller = ($memcardcontroller)
		else
			printf \{qs(0x9f566822)}
			if ($memcardinvalfolderonfail = true)
				MC_SetActiveFolder \{FolderIndex = -1}
			endif
			ui_memcard_finish failed = save controller = ($memcardcontroller)
		endif
	else
		if ($MemcardSuccess = true)
			printf \{qs(0x0e63bd4a)}
			ui_memcard_finish success = load controller = ($memcardcontroller)
		else
			printf \{qs(0x264adb01)}
			if ($memcardinvalfolderonfail = true)
				MC_SetActiveFolder \{FolderIndex = -1}
			endif
			ui_memcard_finish failed = load controller = ($memcardcontroller)
		endif
	endif
endscript

script memcard_sequence_retry 
	printf \{qs(0x879b8ee7)}
	memcard_cleanup_messages
	MC_WaitAsyncOpsFinished
	Goto $MemcardRetryScript params = {<...> controller = ($memcardcontroller)}
endscript

script memcard_disable_saves_and_quit 
	hide_glitch \{num_frames = 20}
	get_savegame_from_controller controller = ($memcardcontroller)
	lockglobaltags \{freeplay_check_off}
	SetGlobalTags savegame = <savegame> user_options params = {autosave = 0}
	lockglobaltags \{freeplay_check_on}
	memcard_sequence_quit
endscript

script memcard_sequence_begin 
	printf \{qs(0xa7ec2b32)}
	MC_WaitAsyncOpsFinished
	pushunsafeforshutdown \{context = memcard
		Type = unchecked}
endscript

script memcard_sequence_show_dialog 
	printf \{qs(0x333f44f9)}
	popunsafeforshutdown \{context = memcard
		Type = unchecked}
	memcard_cleanup_messages
endscript

script memcard_sequence_quit 
	printf \{qs(0x5dba2148)}
	popunsafeforshutdown \{context = memcard
		Type = unchecked}
	Goto $MemcardDoneScript params = <...>
endscript

script memcard_check_for_card 
	if NOT mc_hasvalidstoragedevice
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
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :se_setprops \{z_priority = 0}
	endif
	if ScriptIsRunning \{guitar_startup_spawned}
		SpawnScriptNow \{memcard_handle_intro_movie}
	endif
	Goto <error> params = <params>
endscript

script memcard_handle_intro_movie 
	printf \{'memcard_handle_intro_movie'}
	setscriptcannotpause
	SetButtonEventMappings \{block_menu_input}
	printf \{'memcard_handle_intro_movie - waiting for startup to finish'}
	begin
	if NOT IsMoviePlaying \{textureSlot = 2}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	printf \{'memcard_handle_intro_movie - done with startup movie'}
	SetButtonEventMappings \{unblock_menu_input}
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
	get_savegame_from_controller controller = ($memcardcontroller)
	if isps3
		if NOT GotParam \{no_ui_on_ps3}
			GetTrueStartTime
			savegame_ui_begin savegame = <savegame> text = qs(0x54b62ebd)
			OnExitRun savegame_ui_end params = {savegame = <savegame>}
			wait_at_least_x_ms starttime = <starttime> at_least = 1000
		endif
	endif
	memcard_choose_storage_device StorageSelectorForce = <StorageSelectorForce> storageselectortry = <storageselectortry> invalid_device_okay = <invalid_device_okay>
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
			refresh_jam_directory_contents \{ignore_failure = 1}
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

script reload_jam_patterns 
	if NOT musicstudio_mainobj :musicstudio_isinmusicstudio
		return
	endif
	LoadFromMemoryCard \{FileName = $memcard_jamsession_file_name_patterns
		filetype = jamsessionpatterns}
	if (<Result> = true)
		printf \{qs(0x148b91db)}
	else
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
		endif
	endif
endscript

script refresh_jam_directory_contents \{savegame_async = 0
		ignore_failure = 0}
	printscriptinfo \{'refresh_jam_directory_contents'}
	if (($memcardcontroller) = ($primary_controller))
		update_curr_listing = 1
	endif
	jam_reset_controller_directory_listing controller = ($memcardcontroller)
	if GotParam \{update_curr_listing}
		Change \{jam_curr_directory_listing = [
			]}
	endif
	if NOT GotParam \{no_enumeration}
		memcard_enum_folders
	endif
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
		MC_LoadTOCInActiveFolder
		GetMemCardDirectoryListing
		if ((<ignore_failure> = 1) || (<savegame_async> = 1))
			if (<Result> = FALSE)
				return FALSE ErrorCode = <ErrorCode>
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
			return FALSE ErrorCode = <ErrorCode>
		endif
		if NOT (<Result> = FALSE)
			if GotParam \{directorylisting}
				jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
				if GotParam \{update_curr_listing}
					musicstudio_copy_curr_directory_listing directorylisting = <directorylisting>
				endif
			endif
		endif
	endif
	return \{true}
endscript

script memcard_sequence_begin_single_signin 
	SpawnScriptNow memcard_sequence_begin_single_signin_logic params = <...>
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

script memcard_sequence_begin_boot 
	SpawnScriptNow memcard_sequence_begin_boot_logic params = <...>
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

script memcard_sequence_begin_lobby_error 
	SpawnScriptNow memcard_sequence_begin_lobby_error_logic params = <...>
endscript

script memcard_sequence_begin_single_signin_logic \{controller = $primary_controller}
	printscriptinfo \{qs(0xbc135bc3)}
	printstruct <...>
	mc_getactiveplayer
	memcard_sequence_begin
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_single_signin_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardsigningin = true}
	Change \{memcardjamordefault = Default}
	Change \{memcardinvalfolderonfail = true}
	memcard_validate_card_data invalid_device_okay = 1 StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	if (<found> = 1)
		Goto \{memcard_load_file}
	else
		Goto \{memcard_save_file}
	endif
endscript

script memcard_sequence_begin_save_logic \{StorageSelectorForce = 0
		controller = $primary_controller
		OverwriteConfirmed = 0}
	memcard_sequence_begin
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardsigningin = FALSE}
	Change \{memcardjamordefault = Default}
	if (<OverwriteConfirmed> = 0)
		Change \{memcardinvalfolderonfail = FALSE}
		StorageSelectorForce = 1
	else
		Change \{memcardinvalfolderonfail = true}
	endif
	get_savegame_from_controller controller = <controller>
	if is_autosave_on savegame = <savegame>
		ValidatePrev = 1
	else
		ValidatePrev = 0
	endif
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> storageselectortry = <storageselectortry> ValidatePrev = 1
	Goto memcard_save_file params = {OverwriteConfirmed = <OverwriteConfirmed>}
endscript

script memcard_sequence_begin_autosave_logic \{controller = $primary_controller}
	memcard_sequence_begin
	disable_pause
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardsigningin = FALSE}
	Change \{memcardjamordefault = Default}
	Change \{memcardinvalfolderonfail = true}
	get_savegame_from_controller controller = <controller>
	GetGlobalTags user_options savegame = <savegame>
	if (<autosave> = 0 && <requested_autosave> = 0)
		printf \{qs(0x4c1699ec)}
		Goto \{memcard_sequence_quit}
	endif
	mc_setactiveplayer userid = <controller>
	if NOT mc_hasvalidstoragedevice
		Goto \{create_storagedevice_warning_menu}
	endif
	memcard_validate_card_data \{StorageSelectorForce = 0
		ValidatePrev = 1}
	if (<found> = 1)
		Goto \{memcard_save_file
			params = {
				OverwriteConfirmed = 1
				autosave = 1
			}}
	else
		memcard_sequence_retry
	endif
endscript

script memcard_sequence_begin_load_logic \{StorageSelectorForce = 1
		show_confirm_dialog = 0
		controller = $primary_controller}
	memcard_sequence_begin
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	Change \{MemcardSavingOrLoading = loading}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardsigningin = FALSE}
	Change \{memcardjamordefault = Default}
	if (<show_confirm_dialog> = 1)
		Change \{memcardinvalfolderonfail = FALSE}
	else
		Change \{memcardinvalfolderonfail = true}
	endif
	if (<show_confirm_dialog> = 1)
		Goto \{create_confirm_load_menu}
	else
		memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
		Goto \{memcard_load_file}
	endif
endscript

script memcard_sequence_begin_boot_logic 
	memcard_sequence_begin
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_generic_done}
	Change \{MemcardSavingOrLoading = loading}
	Change \{MemcardSuccess = FALSE}
	Change \{memcardcontroller = 0}
	Change \{memcardsigningin = FALSE}
	Change \{memcardjamordefault = Default}
	Change \{memcardinvalfolderonfail = true}
	Goto \{memcard_boot_scan}
endscript

script jam_memcard_validate_card_data \{StorageSelectorForce = 0}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 1 filetype = jamsession
	return <...>
endscript

script memcard_sequence_begin_save_jam_logic \{StorageSelectorForce = 0
		controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x3ab2ee1c)}
	memcard_sequence_begin
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_jam_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardsigningin = FALSE}
	Change \{memcardjamordefault = jam}
	Change \{memcardinvalfolderonfail = true}
	<card_was_in_slot> = FALSE
	if mc_hasvalidstoragedevice
		<card_was_in_slot> = true
	endif
	jam_memcard_validate_card_data <...>
	if (<corrupt> = 0)
		Goto memcard_save_jam params = {card_was_in_slot = <card_was_in_slot>}
	endif
endscript

script memcard_save_jam \{OverwriteConfirmed = 0
		card_was_in_slot = true}
	memcard_sequence_begin
	Change \{MemcardSavingOrLoading = saving}
	memcard_check_for_card
	ResetTimer
	printf \{channel = jam_mode
		qs(0xf6157763)}
	memcard_enum_folders
	if NOT GotParam \{savegame}
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	savegame_ui_begin savegame = <savegame> text = qs(0x93e360b9)
	OnExitRun savegame_ui_end params = {savegame = <savegame>}
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		if (<card_was_in_slot> = FALSE)
			if (<OverwriteConfirmed> = 1)
				<overwrite> = 1
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
	Change memcard_jamsession_genre = <genre>
	Change memcard_jamsession_song_version = <song_version>
	Change memcard_jamsession_downloaded = <downloaded>
	musicstudio_mainobj :musicstudio_getsonglength
	Change memcard_jamsession_song_length = <song_length>
	if GotParam \{file_id}
		Change memcard_jamsession_fileid = <file_id>
	endif
	Change memcard_jamsession_artist = <artist>
	Change memcard_jamsession_playback_track1 = <playback_track1>
	Change memcard_jamsession_playback_track2 = <playback_track2>
	Change memcard_jamsession_playback_track_drums = <playback_track_drums>
	Change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	Change 0xdc3b55be = <streamfile>
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
	SaveToMemoryCard \{FileName = $memcard_jamsession_file_name_patterns
		filetype = jamsessionpatterns
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
	musicstudio_update_selected_song_name FileName = ($memcard_jamsession_file_name)
	GetMemCardDirectoryListing
	jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
	musicstudio_copy_curr_directory_listing directorylisting = <directorylisting>
	printf \{channel = jam_mode
		qs(0x98e3ad04)}
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	guitar_memcard_save_success_sound
	Change \{cas_logo_data_dirty = 0}
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
	memcard_sequence_begin
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_load_jam_logic}
	Change \{MemcardSavingOrLoading = loading}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardsigningin = FALSE}
	Change \{memcardjamordefault = jam}
	Change \{memcardinvalfolderonfail = true}
	jam_memcard_validate_card_data <...>
	Goto \{memcard_load_jam}
endscript

script memcard_load_jam 
	musicstudio_mainobj :musicstudio_addsong \{song_name = $jam_selected_song}
	if (<already_loaded> = true)
		ScriptAssert \{qs(0xdc310379)}
	endif
	OnExitRun \{exit_load_music_studio_song}
	memcard_sequence_begin
	Change \{MemcardSavingOrLoading = loading}
	memcard_check_for_card
	ResetTimer
	get_savegame_from_controller controller = ($memcardcontroller)
	printf \{channel = jam_mode
		qs(0xc201140a)}
	memcard_enum_folders
	savegame_ui_begin savegame = <savegame> text = qs(0xc8aec9d3)
	OnExitRun savegame_ui_end params = {savegame = <savegame>}
	<pattern_only_load> = FALSE
	if (($memcard_jamsession_file_name) = ($memcard_jamsession_file_name_patterns))
		<pattern_only_load> = true
	endif
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	else
		if (<pattern_only_load> = true)
			Change \{MemcardSuccess = true}
			memcard_sequence_quit
		endif
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
	reload_jam_patterns <...>
	if (<pattern_only_load> = FALSE)
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
	endif
	if (<pattern_only_load> = FALSE)
		musicstudio_update_selected_song_name FileName = ($memcard_jamsession_file_name)
	endif
	printf \{channel = jam_mode
		qs(0x21ff1e27)}
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer \{time = 1.0}
	memcard_sequence_quit
endscript

script exit_load_music_studio_song 
	musicstudio_mainobj :musicstudio_removecurrentsong
endscript

script async_load_music_studio_song 
	musicstudio_mainobj :musicstudio_addsong song_name = <FileName> mark_for_load = async
	if (<already_loaded> = true)
		printf \{qs(0xf1492eef)}
		return
	endif
	OnExitRun \{exit_load_music_studio_song}
	jam_recording_create_editable_arrays
	Change memcard_jamsession_file_name = <FileName>
	memcard_enum_folders
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	else
		printf \{qs(0x1db3a2a4)}
		return
	endif
	MC_LoadTOCInActiveFolder
	if (<Result> = FALSE)
		printf \{qs(0xa69ecbe4)}
		return
	endif
	MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	LoadFromMemoryCard FileName = <FileName> filetype = jamsession
	if (<Result> = FALSE)
		printf \{qs(0x7d24815b)}
		return
	endif
	printf \{qs(0x55a76790)}
endscript

script memcard_sequence_begin_rename_jam_logic \{controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x1be7f8f0)}
	memcard_sequence_begin
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_rename_jam_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardsigningin = FALSE}
	Change \{memcardjamordefault = jam}
	Change \{memcardinvalfolderonfail = true}
	jam_memcard_validate_card_data <...>
	Goto \{memcard_rename_jam}
endscript

script memcard_rename_jam 
	printf \{channel = jam_mode
		qs(0x2e8352e2)}
	memcard_sequence_begin
	Change \{MemcardSavingOrLoading = loading}
	memcard_check_for_card
	ResetTimer
	printf \{channel = jam_mode
		qs(0x56078b7d)}
	memcard_enum_folders
	if NOT GotParam \{savegame}
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	savegame_ui_begin savegame = <savegame> text = qs(0x93e360b9)
	OnExitRun savegame_ui_end params = {savegame = <savegame>}
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
	musicstudio_update_selected_song_name FileName = ($memcard_jamsession_new_file_name)
	GetMemCardDirectoryListing
	jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
	musicstudio_copy_curr_directory_listing directorylisting = <directorylisting>
	printf \{channel = jam_mode
		qs(0x6c35e2b6)}
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	guitar_memcard_save_success_sound
	memcard_sequence_quit
endscript

script memcard_sequence_begin_delete_jam_logic \{controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0xb777ae6b)}
	memcard_sequence_begin
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_delete_jam_logic}
	Change \{MemcardSavingOrLoading = saving}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardsigningin = FALSE}
	Change \{memcardjamordefault = jam}
	Change \{memcardinvalfolderonfail = true}
	jam_memcard_validate_card_data <...>
	Goto \{memcard_delete_jam}
endscript

script memcard_delete_jam 
	printf \{channel = jam_mode
		qs(0x45db1907)}
	memcard_sequence_begin
	Change \{MemcardSavingOrLoading = saving}
	memcard_check_for_card
	ResetTimer
	memcard_enum_folders
	if NOT GotParam \{savegame}
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	savegame_ui_begin savegame = <savegame> text = qs(0x4acaa8b9)
	OnExitRun savegame_ui_end params = {savegame = <savegame>}
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
	musicstudio_copy_curr_directory_listing directorylisting = <directorylisting>
	Change \{MemcardSuccess = true}
	memcard_wait_for_timer
	guitar_memcard_save_success_sound
	memcard_sequence_quit
	printf \{channel = jam_mode
		qs(0x6b4e39fd)}
endscript

script memcard_sequence_begin_lobby_error_logic \{StorageSelectorForce = 0}
	memcard_sequence_begin
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_lobby_error}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <controller>
	Change \{memcardsigningin = FALSE}
	Change \{memcardjamordefault = Default}
	Change \{memcardinvalfolderonfail = true}
	if GotParam \{error}
		memcard_error error = <error> params = <event_params>
	else
		if (<StorageSelectorForce> = 1)
			memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
			if mc_hasvalidstoragedevice
				Change \{g_lobby_storageselect_return_confirm = true}
			endif
		endif
		memcard_sequence_generic_done
	endif
endscript

script guitar_memcard_save_success_sound 
endscript

script dim_save_option_for_guest 
	if isxenonorwindx
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

script get_all_saving_players_controller_list 
	array = []
	AddArrayElement array = <array> element = ($primary_controller)
	if isXenon
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <Player> controller
			if islocallysignedin controller = <controller>
				if get_savegame_has_saved_game savegame = <controller>
					if is_autosave_on savegame = <controller>
						if NOT ArrayContains array = <array> contains = <controller>
							if GotParam \{reverse_order}
								insertarrayelement array = <array> element = <controller> index = 0
							else
								AddArrayElement array = <array> element = <controller>
							endif
						endif
					endif
				endif
			endif
			getnextplayer local Player = <Player>
			repeat <num_players>
		endif
	endif
	return controller_list = <array>
endscript
