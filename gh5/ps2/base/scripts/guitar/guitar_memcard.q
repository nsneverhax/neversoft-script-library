max_memcard_filename_length = 15
SavingOrLoading = saving
memcard_default_title = 'Guitar Hero 5'
memcard_content_name = qs(0x7235ca15)
memcard_content_jamsession_name = qs(0xcf50afcb)
save_data_dirty = 0
0x64fa86d1 = 0x00000000
memcard_file_types = {
	progress = {
		file_name = 'GH5Progress'
		suffix = 'Progress'
		folder_name = 'Guitar Hero 5'
		icon = 'memcard\\progress.ico'
		version = 54
		fixed_size = 409600
		menu_text = qs(0x9d87ba69)
	}
	jamsession = {
		file_name = 'GH5JamSession'
		suffix = '-jam'
		folder_name = 'Guitar Hero 5'
		icon = 'memcard\\jam.ico'
		version = 80
		fixed_size = 124928
		menu_text = 'JAM SESSION'
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
MemcardDoneScript = nullscript
MemcardRetryScript = nullscript
MemcardSavingOrLoading = saving
MemcardSuccess = FALSE
memcardcontroller = $primary_controller
memcardinitialboot = FALSE
memcardjamordefault = Default

script memcard_check_for_existing_save 
	memcard_choose_storage_device
	GetMemCardDirectoryListing \{filetype = $0x64fa86d1}
	if (<totalthps4filesoncard> = 1)

		return \{found = 1
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

	GetGlobalTags user_options savegame = <savegame>
	if (<autosave> = 1)
		return \{true}
	endif
	return \{FALSE}
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
	begin
	if CheckForSignIn local controller_index = <controller>
		getsavegamefromcontroller controller = <controller>
		GetGlobalTags user_options savegame = <savegame>
		if (<unlock_cheat_autokick> = 1 && <cheat_index7> = 1)
			turn_on_autokick = 1
		endif
		if (<unlock_cheat_alwaysslide> = 1 && <cheat_index0> = 1)
			turn_on_autoslide = 1
		endif
		if (<unlock_Cheat_PerformanceMode> = 1 && <cheat_index3> = 1)
			turn_on_preformance = 1
		endif
		if (<unlock_cheat_freedrum> = 1 && <cheat_index16> = 1)
			turn_on_drumfill = 1
		endif
	endif
	controller = (<controller> + 1)
	repeat <max_controllers>
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

endscript

script memcard_cleanup_messages 
	destroy_popup_warning_menu
endscript

script memcard_sequence_generic_done 
	if ($MemcardSavingOrLoading = saving)
		if ($MemcardSuccess = true)

			ui_memcard_finish success = save controller = ($memcardcontroller)
		else

			MC_SetActiveFolder \{FolderIndex = -1}
			ui_memcard_finish failed = save controller = ($memcardcontroller)
		endif
	else
		if ($MemcardSuccess = true)

			ui_memcard_finish success = load controller = ($memcardcontroller)
		else

			MC_SetActiveFolder \{FolderIndex = -1}
			ui_memcard_finish failed = load controller = ($memcardcontroller)
		endif
	endif
	if ($0x64fa86d1 = jamsession)
		Change \{jam_selected_song = $memcard_jamsession_file_name}
	endif
endscript

script memcard_sequence_retry 

	MC_WaitAsyncOpsFinished
	Goto $MemcardRetryScript params = {<...> controller = ($memcardcontroller)}
endscript

script memcard_disable_saves_and_quit 
	get_savegame_from_controller controller = ($memcardcontroller)
	SetGlobalTags user_options savegame = <savegame> params = {autosave = 0}
	memcard_sequence_quit
endscript

script memcard_sequence_quit 

	mark_safe_for_shutdown
	Goto $MemcardDoneScript params = <...>
endscript

script memcard_check_for_card 
	if NOT CardIsInSlot
		Goto create_storagedevice_warning_menu params = <...>
	endif
endscript

script memcard_error 


	memcard_check_for_card
	Goto <error> params = <params>
endscript

script memcard_sequence_cleanup_generic 
	if ($restartmenumusic = 1)
		Change \{restartmenumusic = 0}

		if ($menu_music_on_flag = 1)
			menu_music_off
		endif
		SpawnScriptNow \{menu_music_on}
	endif
	Change \{MemcardDoneScript = nullscript}
	return
	MC_WaitAsyncOpsFinished
	memcard_cleanup_messages
	Change \{MemcardDoneScript = nullscript}
	Change \{MemcardRetryScript = nullscript}
	Change \{memcardcontroller = $primary_controller}
	mc_setactiveplayer \{querydefault}
endscript

script memcard_sequence_begin_bootup 
	SpawnScriptNow memcard_sequence_begin_bootup_logic params = <...>
endscript

script memcard_sequence_begin_save 
	SpawnScriptNow memcard_sequence_begin_save_logic params = <...>
endscript

script 0x57db8579 
	WaitOneGameFrame
	ui_flow_manager_respond_to_action \{action = memcard_sequence_save_success}
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
			flow_state = ps2_memcard_autosave_warning_boot_fs
		}}
	return
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
	ps2_memcard_set_autosave \{autosave = 0}
	Change \{0x64fa86d1 = progress}
	SpawnScriptNow \{start_flow_manager
		params = {
			flow_state = 0x9d327bc2
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

		Goto \{memcard_sequence_quit}
	endif
	if (<requested_autosave> = 1)
		ps2_memcard_set_autosave \{autosave = 0}
	else
		ps2_memcard_set_autosave \{autosave = 1}
	endif
	Change \{0x64fa86d1 = progress}
	destroy_loading_screen
	Wait \{16
		gameframes}
	SpawnScriptNow \{start_flow_manager
		params = {
			flow_state = 0x9d327bc2
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

script jam_memcard_validate_card_data \{StorageSelectorForce = 0}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 1 filetype = jamsession
	return <...>
endscript

script memcard_sequence_begin_save_jam_logic \{StorageSelectorForce = 0
		controller = $primary_controller}

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
	jam_publish_update_playback_drumvocal_track
	downloaded = 0
	getsonginfo
	Change memcard_jamsession_song_version = <song_version>
	Change memcard_jamsession_downloaded = <downloaded>
	if GotParam \{file_id}
		Change memcard_jamsession_fileid = <file_id>
	endif
	Change memcard_jamsession_playback_track1 = <playback_track1>
	Change memcard_jamsession_playback_track2 = <playback_track2>
	Change memcard_jamsession_playback_track_drums = <playback_track_drums>
	Change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	ps2_memcard_set_autosave \{autosave = 0}
	Change \{0x64fa86d1 = jamsession}
	SpawnScriptNow \{start_flow_manager
		params = {
			flow_state = 0x9d327bc2
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

script memcard_sequence_begin_load_jam_logic \{StorageSelectorForce = 0
		controller = $primary_controller}

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

script memcard_sequence_begin_delete_jam_logic \{controller = $primary_controller}

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

script guitar_memcard_save_success_sound 
	SoundEvent \{event = save_confirmed_sfx}
endscript

script dim_save_option_for_guest 
endscript
