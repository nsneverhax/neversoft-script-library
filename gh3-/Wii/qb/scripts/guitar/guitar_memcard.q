max_memcard_filename_length = 15
savingorloading = saving
memcard_using_new_save_system = 0
memcard_default_title = 'Guitar Hero III: Legends of Rock'
memcard_content_name = 'Progress'
memcard_file_name = 'GH3Progress'
memcard_file_types = [
	{
		name = progress
		suffix = '-Progress'
		version = 48
		fixed_size = 262144
		folder_name = 'Guitar Hero III'
		icon = 'memcard\\cas.png'
		menu_text = 'GAME PROGRESS'
		menu_icon = logo_cas
		use_temp_pools = true
		is_binary_file = false
		num_bytes_per_frame = 102400
	}
]
memcard_file_types_ps2 = [
	{
		name = progress
		suffix = '-Progress'
		folder_name = 'Guitar Hero III'
		icon = 'memcard\\cas.png'
		version = 54
		fixed_size = 262144
		menu_text = 'GAME PROGRESS'
		menu_icon = logo_cas
	}
]
memcard_folder_desc = {
	guitarcontent = {
		icon_xen = 'memcard\\gh.png'
		icon_ps3 = 'memcard\\ICON0.PNG'
		file_types = [
			{
				name = progress
				slots_reserve = 1
			}
		]
	}
}
writetobuffer_compressionlookuptable_8 = [
]
writetobuffer_compressionlookuptable_16 = [
]
memcarddonescript = nullscript
memcardretryscript = nullscript
memcardsavingorloading = saving
memcardsuccess = false

script memcard_choose_storage_device \{storageselectorforce = 0}
	printscriptinfo \{'==> memcard_choose_storage_device'}
	if ($memcard_using_new_save_system = 0)
		if NOT isxenon
			return
		endif
	endif
	if ($paused_for_hardware = 1)
		return
	endif
	create_checking_memory_card_screen
	wait \{3
		gameframe}
	if ($memcard_using_new_save_system = 0)
		showstorageselector force = <force> filetype = progress
		begin
		if storageselectorfinished
			break
		else
			waitonegameframe
		endif
		repeat
	else
		newshowstorageselector force = <storageselectorforce> filetype = progress
	endif
endscript

script memcard_check_for_previously_used_folder 
	mc_waitasyncopsfinished
	memcard_check_for_card
	if mc_hasactivefolder

		return \{found = 1
			corrupt = 0}
	else
		memcard_enum_folders
		mc_loadtocinactivefolder \{validateprev}
		if (<result> = true)
			if memcardfileexists \{filename = $memcard_file_name
					filetype = progress}

				return \{found = 1
					corrupt = 0}
			else
				return \{found = 1
					corrupt = 1}
			endif
		else
			if (<errorcode> = invalidtoc)
				return \{found = 0
					corrupt = 0}
			else
				if mc_folderexists \{foldername = $memcard_content_name}
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
	if isps2
		return
	endif
	mc_enumeratefolders
	if (<result> = false)
		memcard_error \{error = create_storagedevice_warning_menu}
	endif
endscript

script memcard_check_for_existing_save 
	if ($memcard_using_new_save_system = 0)
		if isps3
			return \{found = 0}
		endif
		if isngc
			if memcardfileexists \{name = $memcard_file_name
					filetype = progress}
				return \{found = 1}
			else
				return \{found = 0}
			endif
		else
			memcard_choose_storage_device
			getmemcarddirectorylisting \{filetype = progress}
			if (<totalthps4filesoncard> = 1)

				return \{found = 1
					corrupt = 0}
			endif
		endif
	else
		memcard_enum_folders
		mc_waitasyncopsfinished
		memcard_check_for_card
		if mc_folderexists \{foldername = $memcard_content_name}
			mc_setactivefolder \{foldername = $memcard_content_name}
			mc_loadtocinactivefolder
			if (<result> = false)
				return \{found = 1
					corrupt = 1}
			endif
			if memcardfileexists \{filename = $memcard_file_name
					filetype = progress}
				return \{found = 1
					corrupt = 0}
			else
				return \{found = 1
					corrupt = 1}
			endif
		endif
	endif
	return \{found = 0
		corrupt = 0}
endscript

script memcard_wait_for_timer \{time = 3.0}
	begin
	if timegreaterthan <time>
		break
	endif
	waitonegameframe
	repeat
endscript

script memcard_save_file \{overwriteconfirmed = 0}

	change \{memcardsavingorloading = saving}
	if ($memcard_using_new_save_system = 0)
		if isps3
			return
		endif
		setsavefilename \{filetype = progress
			name = 'GH3Progress'}
		if NOT savetomemorycard \{filetype = progress}

			return \{failed = 1}
		endif
	else
		memcard_check_for_card
		resettimer
		<overwrite> = 0
		if mc_folderexists \{foldername = $memcard_content_name}
			if (<overwriteconfirmed> = 1)
				<overwrite> = 1
				create_overwrite_menu
				mc_setactivefolder \{foldername = $memcard_content_name}
			else
				goto \{create_confirm_overwrite_menu}
			endif
		else
			create_save_menu
			mc_createfolder \{name = $memcard_content_name
				desc = guitarcontent}
			if (<result> = false)
				if (<errorcode> = outofspace)
					memcard_error \{error = create_out_of_space_menu}
				else
					memcard_error \{error = create_save_failed_menu}
				endif
			endif
		endif
		memcard_pre_save_progress
		savetomemorycard \{filename = $memcard_file_name
			filetype = progress
			usepaddingslot = true}
		if (<result> = false)
			if (<errorcode> = outofspace)
				memcard_error \{error = create_out_of_space_menu}
			else
				if (<overwrite> = 1)
					memcard_error \{error = create_overwrite_failed_menu}
				else
					memcard_error \{error = create_save_failed_menu}
				endif
			endif
		endif
		change \{memcardsuccess = true}
		memcard_wait_for_timer
		if (<overwrite> = 1)
			create_overwrite_success_menu
		else
			create_save_success_menu
		endif
		wait \{1
			seconds}
	endif
	memcard_sequence_quit
endscript

script memcard_delete_file 

	if ($memcard_using_new_save_system = 0)
		if NOT deletememcardfile \{filetype = progress}
			destroy_popup_warning_menu
			create_delete_failed_menu
		else
			destroy_popup_warning_menu
			create_delete_success_menu
		endif
	else
		create_delete_file_menu
		mc_waitasyncopsfinished
		if isps3
			fade_overlay_on
			mc_startps3forcedelete
			begin
			if mc_isps3forcedeletefinished
				break
			endif
			waitonegameframe
			repeat
			fade_overlay_off
		else
			resettimer
			fade_overlay_on
			mc_deletefolder \{foldername = $memcard_content_name}
			fade_overlay_off
			if (<result> = false)
				memcard_error \{error = create_delete_failed_menu}
			endif
			memcard_wait_for_timer
			create_delete_success_menu
			wait \{1
				seconds}
		endif
	endif
	memcard_check_for_card
	memcard_sequence_retry
endscript

script memcard_load_file \{loadconfirmed = 0}

	change \{memcardsavingorloading = loading}
	if ($memcard_using_new_save_system = 0)
		if isps3
			return
		endif
		setsavefilename \{filetype = progress
			name = 'GH3Progress'}
		getglobaltags \{globaltag_checksum
			params = globaltag_checksum}
		oldglobaltag_checksum = <globaltag_checksum>
		if NOT loadfrommemorycard \{filetype = progress}

			if gotparam \{corrupteddata}
				return \{corrupteddata = 1}
			else

				return \{failed = 1}
			endif
		endif
	else
		mc_waitasyncopsfinished
		memcard_check_for_card
		resettimer
		if mc_folderexists \{foldername = $memcard_content_name}
			if (<loadconfirmed> = 1)
				mc_setactivefolder \{foldername = $memcard_content_name}
			else
				goto \{create_confirm_load_menu}
			endif
		else
			memcard_error \{error = create_no_save_found_menu}
		endif
		mc_setactivefolder \{foldername = $memcard_content_name}
		create_load_file_menu
		loadfrommemorycard \{filename = $memcard_file_name
			filetype = progress}
		if (<result> = false)
			if (<errorcode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu}
			else
				memcard_error \{error = create_load_failed_menu}
			endif
		endif
		change \{memcardsuccess = true}
		memcard_wait_for_timer
		create_load_success_menu
		memcard_post_load_progress
	endif
	wait \{1
		seconds}
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
	if ($memcardsavingorloading = saving)
		if ($memcardsuccess = true)

			ui_flow_manager_respond_to_action \{action = memcard_sequence_save_success
				play_sound = 0}
		else

			mc_setactivefolder \{folderindex = -1}
			ui_flow_manager_respond_to_action \{action = memcard_sequence_save_failed}
		endif
	else
		if ($memcardsuccess = true)

			ui_flow_manager_respond_to_action \{action = memcard_sequence_load_success
				play_sound = 0}
		else

			mc_setactivefolder \{folderindex = -1}
			ui_flow_manager_respond_to_action \{action = memcard_sequence_load_failed}
		endif
	endif
endscript

script memcard_sequence_retry 

	goto memcardretryscript params = <...>
endscript

script memcard_disable_saves_and_quit 
	setglobaltags \{user_options
		params = {
			autosave = 0
		}}
	memcard_sequence_quit
endscript

script memcard_sequence_quit 

	goto memcarddonescript params = <...>
endscript

script memcard_check_for_card 
	if NOT cardisinslot
		goto \{create_storagedevice_warning_menu}
	endif
endscript

script memcard_error 

	requireparams \{[
			error
		]
		all}
	memcard_check_for_card
	goto <error> params = <params>
endscript

script memcard_sequence_cleanup_generic 
	if isps2
		if ($restartmenumusic = 1)
			change \{restartmenumusic = 0}

			spawnscriptnow \{menu_music_on
				params = {
					setflag = 1
				}}
		endif
		return
	endif
	mc_waitasyncopsfinished
	memcard_cleanup_messages
	change \{memcarddonescript = nullscript}
	change \{memcardretryscript = nullscript}
endscript

script memcard_validate_card_data \{storageselectorforce = 0
		validateprev = 0}
	memcard_choose_storage_device storageselectorforce = <storageselectorforce>
	memcard_check_for_card
	if (<validateprev> = 1)
		memcard_check_for_previously_used_folder
	else
		memcard_check_for_existing_save
	endif
	requireparams \{[
			found
			corrupt
		]
		all}
	if (<corrupt> = 1)
		memcard_error \{error = create_corrupted_data_menu}
	endif
	return found = <found>
endscript

script memcard_sequence_begin_bootup 
	spawnscriptnow memcard_sequence_begin_bootup_logic params = <...>
endscript

script memcard_sequence_begin_save 
	spawnscriptnow memcard_sequence_begin_save_logic params = <...>
endscript

script 0x57db8579 
	waitonegameframe
	ui_flow_manager_respond_to_action \{action = memcard_sequence_save_success}
endscript

script memcard_sequence_begin_autosave 
	getglobaltags \{user_options}
	if (<autosave> = 0)

		spawnscriptlater \{0x57db8579}
		return
	endif
	if ($ismenumusicon = 1)
		menu_music_off \{setflag = 1}

		change \{restartmenumusic = 1}
	endif
	get_flow_manager_action_state \{action = memcard_sequence_save_success}
	change ps2_saveload_successor = <state>
	hack_ps2_set_saveload_successor_checksum <state>
	change ps2_saveload_successor_action_state = <action_struct>
	if isps2
		ps2_memcard_set_autosave \{autosave = 1}
		spawnscriptnow \{start_flow_manager
			params = {
				flow_state = ps2_memcard_save_check_status_ingame_fs
			}}
	else
		0x4ec04eb6 \{autosave = 1}
		wii_memcard_save \{boot = 0}
		if gotparam \{success}
			wii_leave_saveload_flow
			hack_ps2_get_saveload_successor_checksum
			if (<ps2_saveload_successor_checksum> = none)
				spawnscriptnow \{ui_flow_manager_respond_to_action
					params = {
						action = memcard_sequence_save_success
					}}
			else
				spawnscriptnow start_flow_manager params = {flow_state = <ps2_saveload_successor_checksum>}
				hack_ps2_set_saveload_successor_checksum \{none}
			endif
		else
			spawnscriptnow start_flow_manager params = {flow_state = <flow_state>}
		endif
	endif
	return
	spawnscriptnow memcard_sequence_begin_autosave_logic params = <...>
endscript

script memcard_sequence_begin_load 
	spawnscriptnow memcard_sequence_begin_load_logic params = <...>
endscript

script memcard_sequence_begin_bootup_logic 

	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_bootup_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	if (<found> = 1)
		goto \{memcard_load_file
			params = {
				loadconfirmed = 1
			}}
	else
		goto \{memcard_save_file}
	endif
endscript

script memcard_sequence_begin_save_logic \{storageselectorforce = 1}
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	goto \{memcard_save_file}
endscript

script memcard_sequence_begin_autosave_logic 
	disable_pause
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	getglobaltags \{user_options}
	if (<autosave> = 0)

		goto \{memcard_sequence_quit}
	endif
	if NOT cardisinslot
		goto \{create_storagedevice_warning_menu}
	endif
	memcard_validate_card_data \{storageselectorforce = 0
		validateprev = 1}
	if (<found> = 1)
		goto \{memcard_save_file
			params = {
				overwriteconfirmed = 1
			}}
	else
		memcard_sequence_retry
	endif
endscript

script memcard_sequence_begin_load_logic \{storageselectorforce = 1}
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_load_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	goto \{memcard_load_file}
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

			wii_memcard_check_for_space
			if (<nospace> = 1)
				return \{flow_state = wii_memcard_insufficient_space_ingame_fs}
			elseif (<noinode> = 1)
				return \{flow_state = wii_memcard_insufficient_inode_ingame_fs}
			endif
			return \{flow_state = wii_memcard_no_save_ingame_fs}
		else
			setsavefilename \{filetype = progress
				name = 'GH3Progress'}
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
