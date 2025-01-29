
script savegame_async_update_button_in 
	Change MemcardController = (<data>.controller)
	if get_savegame_has_saved_game savegame = <savegame>
		printf 'Already have savegame for %s' s = <savegame>
		return \{true}
	else
		MC_SetActivePlayer userid = <savegame>
		if isXenon
			wait \{2
				gameframes}
			begin
			if ($paused_for_hardware = 0)
				break
			endif
			if abort_for_signout controller = <savegame>
				return \{false}
			endif
			printf \{'Waiting for $paused_for_hardware...'}
			wait \{1
				gameframe}
			repeat
			sysnotify_wait_until_safe
			if abort_for_signout controller = <savegame>
				return \{false}
			endif
		endif
		ShowStorageSelector \{filetype = progress}
		if NOT MC_HasValidStorageDevice
			if isXenon
				Change g_lobby_storageselect_return_savegame = <savegame>
				Change \{g_lobby_storageselect_return_confirm = false}
			else
				ScriptAssert \{'savegame_async_update_button_in: No storage select on PS3'}
			endif
			return \{false
				error = create_storagedevice_warning_menu}
		endif
		MC_EnumerateFolders
		if (<result> = false)
			return \{false
				error = create_load_failed_menu}
		endif
		GetTrueStartTime
		if MC_FolderExists \{foldername = $memcard_content_name}
			wait_at_least_x_ms starttime = <starttime> at_least = 1000
			GetTrueStartTime
			<callback> data = <data> update_ui loading
			Change \{MemcardSavingOrLoading = loading}
			MC_SetActiveFolder \{foldername = $memcard_content_name}
			MC_LoadTOCInActiveFolder
			if (<result> = false)
				return \{false
					error = create_corrupted_data_menu}
			endif
			if NOT MemCardFileExists \{FileName = $memcard_file_name
					filetype = progress}
				return \{false
					error = create_corrupted_data_menu}
			endif
			printf 'Found previous save for %s' s = <savegame>
			memcard_pre_load_progress savegame = <savegame>
			LoadFromMemoryCard \{FileName = $memcard_file_name
				filetype = progress}
			if (<result> = false)
				memcard_post_load_progress_failed savegame = <savegame>
				if (<ErrorCode> = corrupt)
					return \{false
						error = create_corrupted_data_menu}
				else
					return \{false
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
			MC_CreateFolder \{name = $memcard_content_name
				desc = GuitarContent}
			if (<result> = false)
				if (<ErrorCode> = OutOfSpace)
					return \{false
						error = create_out_of_space_menu}
				else
					return \{false
						error = create_save_failed_menu}
				endif
			endif
			MC_SetActiveFolder \{foldername = $memcard_content_name}
			memcard_pre_save_progress savegame = <savegame>
			SaveToMemoryCard \{FileName = $memcard_file_name
				filetype = progress
				usepaddingslot = Always}
			if (<result> = false)
				if (<ErrorCode> = OutOfSpace)
					return \{false
						error = create_out_of_space_menu}
				else
					if (<ErrorCode> = corrupt)
						return \{false
							error = create_out_of_space_menu}
					else
						return \{false
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
				return \{false
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
	if (<elapsedtime> > <at_least>)
		break
	endif
	printf \{'wait_at_least_x_ms - waiting...'}
	wait \{1
		gameframe}
	repeat
endscript
