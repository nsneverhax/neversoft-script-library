
script savegame_async_update_button_in 
	change memcardcontroller = (<data>.controller)
	if demobuild
		return \{true}
	endif
	if get_savegame_has_saved_game savegame = <savegame>
		printf 'Already have savegame for %s' s = <savegame>
		return \{true}
	else
		mc_setactiveplayer userid = <savegame>
		if isxenon
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
		showstorageselector \{filetype = progress}
		if NOT mc_hasvalidstoragedevice
			if isxenon
				change g_lobby_storageselect_return_savegame = <savegame>
				change \{g_lobby_storageselect_return_confirm = false}
			else
				scriptassert \{'savegame_async_update_button_in: No storage select on PS3'}
			endif
			return \{false
				error = create_storagedevice_warning_menu}
		endif
		mc_enumeratefolders
		if (<result> = false)
			return \{false
				error = create_load_failed_menu}
		endif
		gettruestarttime
		if mc_folderexists \{foldername = $memcard_content_name}
			wait_at_least_x_ms starttime = <starttime> at_least = 1000
			gettruestarttime
			<callback> data = <data> update_ui loading
			change \{memcardsavingorloading = loading}
			mc_setactivefolder \{foldername = $memcard_content_name}
			mc_loadtocinactivefolder
			if (<result> = false)
				return \{false
					error = create_corrupted_data_menu}
			endif
			if NOT memcardfileexists \{filename = $memcard_file_name
					filetype = progress}
				return \{false
					error = create_corrupted_data_menu}
			endif
			printf 'Found previous save for %s' s = <savegame>
			memcard_pre_load_progress savegame = <savegame>
			loadfrommemorycard \{filename = $memcard_file_name
				filetype = progress}
			if (<result> = false)
				memcard_post_load_progress_failed savegame = <savegame>
				if (<errorcode> = corrupt)
					return \{false
						error = create_corrupted_data_menu}
				else
					return \{false
						error = create_load_failed_menu}
				endif
			endif
			memcard_post_load_progress savegame = <savegame> savegame_async = 1
			wait_at_least_x_ms starttime = <starttime> at_least = 1000
			if NOT gotparam \{jamerrorcode}
				return \{true}
			endif
		else
			wait_at_least_x_ms starttime = <starttime> at_least = 1000
			gettruestarttime
			<callback> data = <data> update_ui saving
			change \{memcardsavingorloading = saving}
			printf 'No previous save for %s' s = <savegame>
			mc_createfolder \{name = $memcard_content_name
				desc = guitarcontent}
			if (<result> = false)
				if (<errorcode> = outofspace)
					return \{false
						error = create_out_of_space_menu}
				else
					return \{false
						error = create_save_failed_menu}
				endif
			endif
			mc_setactivefolder \{foldername = $memcard_content_name}
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
							error = create_out_of_space_menu}
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
			endif
		endif
		if gotparam \{jamerrorcode}
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
	if demobuild
		return
	endif
	<callback> data = <data> update_ui scanning_dlc
	gettruestarttime
	downloads_enumcontent controller = <savegame> savegame_ui_savegame = <savegame>
	wait_at_least_x_ms starttime = <starttime> at_least = 1000
endscript

script wait_at_least_x_ms \{at_least = 1000}
	requireparams \{[
			starttime
		]
		all}
	begin
	gettrueelapsedtime starttime = <starttime>
	if (<elapsedtime> > <at_least>)
		break
	endif
	printf \{'wait_at_least_x_ms - waiting...'}
	wait \{1
		gameframe}
	repeat
endscript
