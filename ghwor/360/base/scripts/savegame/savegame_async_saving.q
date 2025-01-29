
script savegame_async_update_saving 
	GetTrueStartTime
	if demobuild
		return \{true}
	endif
	mc_setactiveplayer userid = <savegame>
	if NOT mc_hasvalidstoragedevice
		MC_EnumerateFolders
		if (<Result> = FALSE)
			return \{FALSE
				error = create_storagedevice_warning_menu}
		endif
	endif
	MC_SetActiveFolder \{FolderName = $memcard_content_name}
	MC_LoadTOCInActiveFolder
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
					error = create_corrupted_data_menu}
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
	else
		if (<jamerrorcode> = corrupt)
			return \{FALSE
				error = create_corrupted_data_menu
				error_params = {
					file_type = jam_file
				}}
		else
			printf \{channel = bkutcher
				qs(0xa22f5fc4)}
			return \{true}
		endif
	endif
endscript
