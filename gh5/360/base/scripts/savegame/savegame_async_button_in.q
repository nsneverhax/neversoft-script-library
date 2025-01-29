
script savegame_async_update_button_in 
	Change memcardcontroller = (<data>.controller)
	if get_savegame_has_saved_game savegame = <savegame>
		printf 'Already have savegame for %s' s = <savegame>
		return \{true}
	else
		mc_setactiveplayer userid = <savegame>
		if isXenon
			Wait \{2
				gameframes}
			begin
			if ($paused_for_hardware = 0)
				break
			endif
			if abort_for_signout controller = <savegame>
				return \{FALSE}
			endif
			printf \{'Waiting for $paused_for_hardware...'}
			Wait \{1
				gameframe}
			repeat
			sysnotify_wait_until_safe
			if abort_for_signout controller = <savegame>
				return \{FALSE}
			endif
		endif
		ShowStorageSelector \{filetype = progress}
		if NOT mc_hasvalidstoragedevice
			if isXenon
				Change g_lobby_storageselect_return_savegame = <savegame>
				Change \{g_lobby_storageselect_return_confirm = FALSE}
			else
				ScriptAssert \{'savegame_async_update_button_in: No storage select on PS3'}
			endif
			return \{FALSE
				error = create_storagedevice_warning_menu}
		endif
		MC_EnumerateFolders
		if (<Result> = FALSE)
			return \{FALSE
				error = create_load_failed_menu}
		endif
		GetTrueStartTime
		if MC_FolderExists \{FolderName = $memcard_content_name}
			wait_at_least_x_ms starttime = <starttime> at_least = 1000
			GetTrueStartTime
			<callback> data = <data> update_ui loading
			Change \{MemcardSavingOrLoading = loading}
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
			MC_LoadTOCInActiveFolder
			if (<Result> = FALSE)
				return \{FALSE
					error = create_corrupted_data_menu}
			endif
			if NOT MemCardFileExists \{FileName = $memcard_file_name
					filetype = progress}
				return \{FALSE
					error = create_corrupted_data_menu}
			endif
			printf 'Found previous save for %s' s = <savegame>
			memcard_pre_load_progress savegame = <savegame>
			LoadFromMemoryCard \{FileName = $memcard_file_name
				filetype = progress}
			if (<Result> = FALSE)
				memcard_post_load_progress_failed savegame = <savegame>
				if (<ErrorCode> = corrupt)
					return \{FALSE
						error = create_corrupted_data_menu}
				else
					return \{FALSE
						error = create_load_failed_menu}
				endif
			endif
			memcard_post_load_progress savegame = <savegame> savegame_async = 1
			wait_at_least_x_ms starttime = <starttime> at_least = 1000
			if NOT GotParam \{jamerrorcode}
				return \{true}
			endif
		else
			wait_at_least_x_ms starttime = <starttime> at_least = 1000
			GetTrueStartTime
			<callback> data = <data> update_ui saving
			Change \{MemcardSavingOrLoading = saving}
			printf 'No previous save for %s' s = <savegame>
			MC_CreateFolder \{Name = $memcard_content_name
				desc = GuitarContent}
			if (<Result> = FALSE)
				if (<ErrorCode> = OutOfSpace)
					return \{FALSE
						error = create_out_of_space_menu}
				else
					return \{FALSE
						error = create_save_failed_menu}
				endif
			endif
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
			memcard_pre_save_progress savegame = <savegame>
			SaveToMemoryCard \{FileName = $memcard_file_name
				filetype = progress
				usepaddingslot = Always}
			if (<Result> = FALSE)
				if (<ErrorCode> = OutOfSpace)
					return \{FALSE
						error = create_out_of_space_menu}
				else
					if (<ErrorCode> = corrupt)
						return \{FALSE
							error = create_out_of_space_menu}
					else
						return \{FALSE
							error = create_save_failed_menu}
					endif
				endif
			endif
			memcard_post_save_progress savegame = <savegame> savegame_async = 1
			wait_at_least_x_ms starttime = <starttime> at_least = 3000
			if NOT GotParam \{jamerrorcode}
				return \{true}
			endif
		endif
		if GotParam \{jamerrorcode}
			if (<jamerrorcode> = corrupt)
				return \{FALSE
					error = create_corrupted_data_menu
					error_params = {
						file_type = jam_file
					}}
			else
				return \{true}
			endif
		endif
	endif
endscript

script savegame_async_update_dlc_scan 
	if NOT should_scan_dlc
		return
	endif
	<callback> data = <data> update_ui scanning_dlc
	GetTrueStartTime
	Downloads_EnumContent controller = <savegame> savegame_ui_savegame = <savegame>
	wait_at_least_x_ms starttime = <starttime> at_least = 1000
endscript

script wait_at_least_x_ms \{at_least = 1000}
	RequireParams \{[
			starttime
		]
		all}
	begin
	GetTrueElapsedTime starttime = <starttime>
	if (<ElapsedTime> > <at_least>)
		break
	endif
	printf \{'wait_at_least_x_ms - waiting...'}
	Wait \{1
		gameframe}
	repeat
endscript
