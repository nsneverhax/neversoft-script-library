
script savegame_scan_all_players_for_progress_save 
	getmaxcontrollersignins
	userid = 0
	begin
	if savegame_scan_for_progress_save userid = <userid>
		found_progress = 1
		break
	else
		if gotparam \{errorcode}
			break
		endif
	endif
	userid = (<userid> + 1)
	repeat <max_signins>
	if gotparam \{found_progress}
		return true userid = <userid>
	endif
	if gotparam \{errorcode}
		return false userid = <userid> errorcode = <errorcode>
	endif
	return \{false}
endscript

script savegame_scan_for_progress_save 
	requireparams \{[
			userid
		]
		all}
	if isxenonorwindx
		if netsessionfunc func = xenonisguest params = {controller_index = <userid>}
			return \{false}
		endif
	endif
	if NOT checkforsignin local controller_index = <userid>
		return \{false}
	endif
	if isxenon
		if NOT is_controller_connected controller = <userid>
			return \{false}
		endif
	endif
	removeparameter \{folderlisting}
	removeparameter \{result}
	change memcardcontroller = <userid>
	mc_settouseanystoragedevice userid = <userid>
	printf \{'MC_SetActivePlayer'}
	mc_setactiveplayer userid = <userid>
	printf \{'MC_EnumerateFolders'}
	mc_enumeratefolders \{progress_only}
	printstruct <...>
	if (<result> = true)
		if gotparam \{folderlisting}
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
	if gotparam \{errorcode}
		removeparameter \{found_progress_userid}
	endif
	if gotparam \{found_progress_userid}
		if isxenonorwindx
			mc_setactivestoragedevice userid = <userid> device = (<progress_header>.device)
		endif
		printf \{'MC_EnumerateFolders'}
		mc_enumeratefolders
		if (<result> = true)
			printf \{'MC_SetActiveFolder'}
			mc_setactivefolder \{foldername = $memcard_content_name}
			printf \{'MC_LoadTOCInActiveFolder'}
			mc_loadtocinactivefolder
			if (<result> = true)
				enumeration_success = 1
			else
				errorcode = corrupt
			endif
		endif
		if NOT gotparam \{enumeration_success}
			removeparameter \{found_progress_userid}
		endif
	else
		mc_invalidatestoragedevice userid = <userid>
	endif
	if gotparam \{found_progress_userid}
		return \{true}
	endif
	return false errorcode = <errorcode>
endscript

script savegame_find_most_recent_progress 
	requireparams \{[
			folderlisting
			userid
		]
		all}
	array = []
	getarraysize \{folderlisting}
	if (<array_size> > 0)
		i = 0
		begin
		if ((<folderlisting> [<i>].foldername) = ($memcard_content_name))
			printf 'Found %s in folderlisting' s = ($memcard_content_name)
			folderindex = (<folderlisting> [<i>].folderindex)
			if isxenonorwindx
				device = (<folderlisting> [<i>].device)
			endif
			printf 'MC_SetActiveFolder %i' i = <folderindex>
			mc_setactivefolder folderindex = <folderindex>
			printf \{'MC_LoadTOCInActiveFolder'}
			mc_loadtocinactivefolder
			if (<result> = false)
				if isxenonorwindx
					mc_setactivestoragedevice userid = <userid> device = <device>
				endif
				return \{false
					errorcode = corrupt}
			endif
			printf \{'GetMemCardDirectoryListing'}
			getmemcarddirectorylisting
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
	requireparams \{[
			array
			directorylisting
		]
		all}
	getarraysize \{directorylisting}
	if (<array_size> > 0)
		i = 0
		begin
		data = (<directorylisting> [<i>])
		if ((<data>.filename) = ($memcard_file_name))
			printf 'Found %s in directorylisting' s = ($memcard_file_name)
			data = {<data> device = <device>}
			addarrayelement array = <array> element = <data>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return array = <array>
endscript

script savegame_get_most_recent_entry 
	requireparams \{[
			array
		]
		all}
	getarraysize <array>
	if (<array_size> > 0)
		printf \{'savegame_get_most_recent_entry'}
		mc_sorttimestamps timestamps = <array>
		printstruct <...>
		return true most_recent = (<sorted> [0])
	endif
	return \{false}
endscript
