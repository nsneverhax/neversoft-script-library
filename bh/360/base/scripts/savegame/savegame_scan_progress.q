
script savegame_scan_all_players_for_progress_save 
	GetMaxControllerSignins
	userid = 0
	begin
	if savegame_scan_for_progress_save userid = <userid>
		found_progress = 1
		break
	else
		if GotParam \{ErrorCode}
			break
		endif
	endif
	userid = (<userid> + 1)
	repeat <max_signins>
	if GotParam \{found_progress}
		return true userid = <userid>
	endif
	if GotParam \{ErrorCode}
		return false userid = <userid> ErrorCode = <ErrorCode>
	endif
	return \{false}
endscript

script savegame_scan_for_progress_save 
	RequireParams \{[
			userid
		]
		all}
	if IsXenonOrWinDX
		if NetSessionFunc func = XenonIsGuest params = {controller_index = <userid>}
			return \{false}
		endif
	endif
	if NOT CheckForSignIn local controller_index = <userid>
		return \{false}
	endif
	if isXenon
		if NOT is_controller_connected controller = <userid>
			return \{false}
		endif
	endif
	RemoveParameter \{folderlisting}
	RemoveParameter \{result}
	Change MemcardController = <userid>
	MC_SetToUseAnyStorageDevice userid = <userid>
	printf \{'MC_SetActivePlayer'}
	MC_SetActivePlayer userid = <userid>
	printf \{'MC_EnumerateFolders'}
	MC_EnumerateFolders \{progress_only}
	printstruct <...>
	if (<result> = true)
		if GotParam \{folderlisting}
			if savegame_find_most_recent_progress folderlisting = <folderlisting> userid = <userid>
				if IsPS3
					device = hdd
				endif
				printf 'Success! UserID %p has a valid progress save. Device=%d' p = <userid> d = <device>
				found_progress_userid = <userid>
				printstruct <...>
			endif
		endif
	else
		MC_InvalidateStorageDevice userid = <userid>
	endif
	if GotParam \{ErrorCode}
		RemoveParameter \{found_progress_userid}
	endif
	if GotParam \{found_progress_userid}
		if IsXenonOrWinDX
			MC_SetActiveStorageDevice userid = <userid> device = (<progress_header>.device)
		endif
		printf \{'MC_EnumerateFolders'}
		MC_EnumerateFolders
		if (<result> = true)
			printf \{'MC_SetActiveFolder'}
			MC_SetActiveFolder \{foldername = $memcard_content_name}
			printf \{'MC_LoadTOCInActiveFolder'}
			MC_LoadTOCInActiveFolder
			if (<result> = true)
				enumeration_success = 1
			else
				ErrorCode = corrupt
			endif
		endif
		if NOT GotParam \{enumeration_success}
			RemoveParameter \{found_progress_userid}
		endif
	else
		MC_InvalidateStorageDevice userid = <userid>
	endif
	if GotParam \{found_progress_userid}
		return \{true}
	endif
	return false ErrorCode = <ErrorCode>
endscript

script savegame_find_most_recent_progress 
	RequireParams \{[
			folderlisting
			userid
		]
		all}
	array = []
	GetArraySize \{folderlisting}
	if (<array_size> > 0)
		i = 0
		begin
		if ((<folderlisting> [<i>].foldername) = ($memcard_content_name))
			printf 'Found %s in folderlisting' s = ($memcard_content_name)
			folderindex = (<folderlisting> [<i>].folderindex)
			if IsXenonOrWinDX
				device = (<folderlisting> [<i>].device)
			endif
			printf 'MC_SetActiveFolder %i' i = <folderindex>
			MC_SetActiveFolder folderindex = <folderindex>
			printf \{'MC_LoadTOCInActiveFolder'}
			MC_LoadTOCInActiveFolder
			if (<result> = false)
				if IsXenonOrWinDX
					MC_SetActiveStorageDevice userid = <userid> device = <device>
				endif
				return \{false
					ErrorCode = corrupt}
			endif
			printf \{'GetMemCardDirectoryListing'}
			GetMemCardDirectoryListing
			savegame_add_progress_file_to_array array = <array> directorylisting = <directorylisting> device = <device>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if savegame_get_most_recent_entry array = <array>
		return true progress_header = <most_recent>
	endif
	return \{false}
endscript

script savegame_add_progress_file_to_array 
	RequireParams \{[
			array
			directorylisting
		]
		all}
	GetArraySize \{directorylisting}
	if (<array_size> > 0)
		i = 0
		begin
		data = (<directorylisting> [<i>])
		if ((<data>.FileName) = ($memcard_file_name))
			printf 'Found %s in directorylisting' s = ($memcard_file_name)
			data = {<data> device = <device>}
			AddArrayElement array = <array> element = <data>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return array = <array>
endscript

script savegame_get_most_recent_entry 
	RequireParams \{[
			array
		]
		all}
	GetArraySize <array>
	if (<array_size> > 0)
		printf \{'savegame_get_most_recent_entry'}
		MC_SortTimestamps timestamps = <array>
		printstruct <...>
		return true most_recent = (<sorted> [0])
	endif
	return \{false}
endscript
