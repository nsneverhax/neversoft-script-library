
script savegame_async_update_button_in 
	if get_savegame_has_saved_game savegame = <savegame>
		printf 'Already have savegame for %s' s = <savegame>
		return \{true}
	else
		if MC_FolderExists \{FolderName = $memcard_content_name}
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
			LoadFromMemoryCard \{FileName = $memcard_file_name
				filetype = progress}
			if (<Result> = FALSE)
				if (<ErrorCode> = corrupt)
					return \{FALSE
						error = create_corrupted_data_menu}
				else
					return \{FALSE
						error = create_load_failed_menu}
				endif
			endif
			memcard_post_load_progress savegame = <savegame>
			return \{true}
		else
		endif
	endif
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
	Wait \{1
		gameframe}
	repeat
endscript
