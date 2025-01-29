
script savegame_scan_all_players_for_progress_save 
	getmaxcontrollersignins
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
		return FALSE userid = <userid> ErrorCode = <ErrorCode>
	endif
	return \{FALSE}
endscript

script savegame_scan_for_progress_save 
	RequireParams \{[
			userid
		]
		all}
	if isxenonorwindx
		if NetSessionFunc func = xenonisguest params = {controller_index = <userid>}
			return \{FALSE}
		endif
	endif
	if NOT CheckForSignIn local controller_index = <userid>
		return \{FALSE}
	endif
	if isXenon
		if NOT is_controller_connected controller = <userid>
			return \{FALSE}
		endif
	endif
	RemoveParameter \{folderlisting}
	RemoveParameter \{Result}
	Change memcardcontroller = <userid>
	mc_settouseanystoragedevice userid = <userid>
	printf \{'MC_SetActivePlayer'}
	mc_setactiveplayer userid = <userid>
	printf \{'MC_EnumerateFolders'}
	MC_EnumerateFolders \{progress_only}
	printstruct <...>
	if (<Result> = true)
		if GotParam \{folderlisting}
			if savegame_find_most_recent_progress folderlisting = <folderlisting> userid = <userid>
				if isps3
					device = hdd
				endif
				printf 'Success! UserID %p has a valid progress save. Device=%d' p = <userid> d = <device>
				found_progress_userid = <userid>
				printstruct <...>
			endif
		endif
	else
		mc_invalidatestoragedevice userid = <userid>
	endif
	if GotParam \{ErrorCode}
		RemoveParameter \{found_progress_userid}
	endif
	if GotParam \{found_progress_userid}
		if isxenonorwindx
			mc_setactivestoragedevice userid = <userid> device = (<progress_header>.device)
		endif
		printf \{'MC_EnumerateFolders'}
		MC_EnumerateFolders
		if (<Result> = true)
			printf \{'MC_SetActiveFolder'}
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
			printf \{'MC_LoadTOCInActiveFolder'}
			MC_LoadTOCInActiveFolder
			if (<Result> = true)
				enumeration_success = 1
			else
				ErrorCode = corrupt
			endif
		endif
		if NOT GotParam \{enumeration_success}
			RemoveParameter \{found_progress_userid}
		endif
	else
		mc_invalidatestoragedevice userid = <userid>
	endif
	if GotParam \{found_progress_userid}
		return \{true}
	endif
	return FALSE ErrorCode = <ErrorCode>
endscript

script savegame_find_most_recent_progress 
	RequireParams \{[
			folderlisting
			userid
		]
		all}
	array = []
	GetArraySize \{folderlisting}
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<folderlisting> [<i>].FolderName) = ($memcard_content_name))
			printf 'Found %s in folderlisting' s = ($memcard_content_name)
			FolderIndex = (<folderlisting> [<i>].FolderIndex)
			if isxenonorwindx
				device = (<folderlisting> [<i>].device)
			endif
			printf 'MC_SetActiveFolder %i' i = <FolderIndex>
			MC_SetActiveFolder FolderIndex = <FolderIndex>
			printf \{'MC_LoadTOCInActiveFolder'}
			MC_LoadTOCInActiveFolder
			if (<Result> = FALSE)
				if isxenonorwindx
					mc_setactivestoragedevice userid = <userid> device = <device>
				endif
				return \{FALSE
					ErrorCode = corrupt}
			endif
			printf \{'GetMemCardDirectoryListing'}
			GetMemCardDirectoryListing
			savegame_add_progress_file_to_array array = <array> directorylisting = <directorylisting> device = <device>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if savegame_get_most_recent_entry array = <array>
		return true progress_header = <most_recent>
	endif
	return \{FALSE}
endscript

script savegame_add_progress_file_to_array 
	RequireParams \{[
			array
			directorylisting
		]
		all}
	GetArraySize \{directorylisting}
	if (<array_Size> > 0)
		i = 0
		begin
		data = (<directorylisting> [<i>])
		if ((<data>.FileName) = ($memcard_file_name))
			printf 'Found %s in directorylisting' s = ($memcard_file_name)
			data = {<data> device = <device>}
			AddArrayElement array = <array> element = <data>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return array = <array>
endscript

script savegame_get_most_recent_entry 
	RequireParams \{[
			array
		]
		all}
	GetArraySize <array>
	if (<array_Size> > 0)
		printf \{'savegame_get_most_recent_entry'}
		mc_sorttimestamps timestamps = <array>
		printstruct <...>
		return true most_recent = (<sorted> [0])
	endif
	return \{FALSE}
endscript
