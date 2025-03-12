
script savegame_async_update_saving 
	gettruestarttime
	if demobuild
		return \{true}
	endif
	mc_setactiveplayer userid = <savegame>
	if NOT mc_hasvalidstoragedevice
		mc_enumeratefolders
		if (<result> = false)
			return \{false
				error = create_storagedevice_warning_menu}
		endif
	endif
	mc_setactivefolder \{foldername = $memcard_content_name}
	mc_loadtocinactivefolder
	memcard_pre_save_progress savegame = <savegame>
	savetomemorycard \{filename = $memcard_file_name
		filetype = progress
		usepaddingslot = always}
	if (<result> = false)
		if (<errorcode> = outofspace)
			return \{false
				error = create_out_of_space_menu}
		else
			if (<errorcode> = corrupt)
				return \{false
					error = create_corrupted_data_menu}
			else
				return \{false
					error = create_save_failed_menu}
			endif
		endif
	endif
	memcard_post_save_progress savegame = <savegame> savegame_async = 1
	wait_at_least_x_ms starttime = <starttime> at_least = 3000
	if NOT gotparam \{jamerrorcode}
		return \{true}
	else
		if (<jamerrorcode> = corrupt)
			return \{false
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
