
script ui_create_wii_handle_trc \{event_params = {
			event = menu_back
		}}
	caller_event_params = (<event_params>.event_params)
	caller_type = (<event_params>.Type)
	printstruct <...>
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = current_menu
		Pos = (0.0, 0.0)
		just = [left center]
		z_priority = 0
		tags = {
			Type = <caller_type>
			event_params = <caller_event_params>
		}
	}
	show_wii_handle_trc <...> separate_state = 1
endscript
wii_memcard_status = Blank

script show_wii_handle_trc \{separate_state = 0}
	if isngc
		if StructureContains \{structure = event_params
				memcard_status}
			memcard_status = (<event_params>.memcard_status)
			printf 'memcard_status = |%s|' s = <memcard_status>
			printstruct <memcard_status>
			Change wii_memcard_status = <memcard_status>
			switch <memcard_status>
				case corrupt_boot
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_corrupt_boot_fs
				case load_corrupt_ingame
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_load_corrupt_ingame_fs
				case load_no_save_boot
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_load_no_save_boot_ingame_fs
				case load_no_save_ingame
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_load_no_save_ingame_fs
				case insufficient_space_boot
				enablereset
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_space_boot_fs
				case insufficient_space_ingame
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_space_ingame_fs
				case insufficient_space_jam
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_space_jam_fs
				case insufficient_inode_boot
				enablereset
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_inode_boot_fs
				case insufficient_inode_ingame
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_inode_ingame_fs
				case insufficient_inode_jam
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_inode_jam_fs
				case save_error_boot
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_save_error_boot_fs
				case save_error_ingame
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_save_error_ingame_fs
				case insufficient_space_boot_wfc_only
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_space_boot_wfc_only_fs
				case insufficient_inode_boot_wfc_only
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_inode_boot_wfc_only_fs
				case delete_error_ingame
				script_func = wii_memcard_saveload_complete
				window_header = $wii_fail_header
				window_message = delete_failed
				script_param = {create_params = {header = <window_header> message = <window_message>}}
				case choose_proper_using_guitar_screen
				case press_any_button
				case success
				window_header = $wii_success_header
				if ($MemcardSavingOrLoading = loading)
					window_message = load_successful
				elseif ($MemcardSavingOrLoading = deleting)
					window_message = delete_successful
				else
					window_message = save_successful
				endif
				script_func = wii_memcard_saveload_complete
				script_param = {create_params = {header = <window_header> message = <window_message>}}
				case None
				ui_memcard_finish success = wii controller = ($memcardcontroller)
				default
				ScriptAssert \{qs(0x772214d4)}
			endswitch
		endif
		if StructureContains \{structure = event_params
				mii_lib_status}
			mii_lib_status = (<event_params>.mii_lib_status)
			printf \{qs(0x78499ec8)
				s = mii_lib_status}
			switch (<mii_lib_status>)
				case corrupt
				script_func = refresh_wii_trc_menu
				script_param = $wii_mii_lib_corrupt
				default
				ScriptAssert \{qs(0x58dc5be7)}
			endswitch
		endif
		if StructureContains \{structure = event_params
				menu_to_load}
			menu_to_load = (<event_params>.menu_to_load)
			switch (<menu_to_load>)
				case overwrite_menu
				script_func = refresh_wii_trc_menu
				script_param = (wii_memcard_overwrite_warning_ingame_fs)
			endswitch
		endif
		if GotParam \{script_param}
			printstruct <script_param>
			params_Script = (<script_param>.create_params)
			SpawnScriptNow <script_func> params = (<params_Script>)
		endif
	endif
endscript

script ui_destroy_wii_handle_trc 
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	memcard_sequence_cleanup_generic
	if isngc
		if ScreenElementExists \{id = wii_trc_container}
			destroy_wii_trc_menu
		endif
	endif
endscript

script ui_wii_trc_handle_action \{action = unknown_action
		ingame = 1
		check_for_space = 0
		boot = 0}
	if ScreenElementExists \{id = wii_trc_container}
		destroy_wii_trc_menu
	endif
	switch <action>
		case continue_to_menu
		if (<no_space_wfc> = 1)
			wii_memcard_load \{boot = 1}
			wii_scan_jamsession_files \{Force = 1}
		endif
		ui_memcard_finish success = wii controller = ($memcardcontroller)
		case delete_file
		if (<ingame> = 1)
			wii_replace_file_ingame
		else
			wii_replace_file
		endif
		ui_memcard_finish success = wii controller = ($memcardcontroller)
		case delete_all_file
		get_string_wii \{message = save_successful}
		savegame_ui_begin savegame = 0 text = <localized_string>
		Wait \{3
			frames}
		Wait \{2
			Seconds}
		savegame_ui_end \{savegame = 0}
		memcard_cleanup_messages
		wii_replace_file
		wii_scan_jamsession_files \{Force = 1}
		jam_recording_create_editable_arrays
		clearcustomsong
		setsonginfo \{genre = -1
			bpm = 120
			song_version = $jam_song_version_dummy
			downloaded = 0
			drum_kit = 0
			file_id = {
				file_id = [
					0
					0
				]
			}
			tuning = 0
			bass_kit = 0}
		directorylisting = $jam_curr_directory_listing
		GetArraySize <directorylisting>
		if (<array_Size> > 0)
			index = 0
			begin
			Change memcard_jamsession_actual_file_name = (<directorylisting> [<index>].actual_file_name)
			writedummyjamsong
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
		jam_recording_destroy_editable_arrays
		ui_memcard_finish success = wii controller = ($memcardcontroller)
		refresh_jam_directory_contents
		case disable_autosave
		wii_disable_autosave header = $wii_caution_header message = disable_autosave boot = <boot>
		ui_memcard_finish success = wii controller = ($memcardcontroller)
		case disable_saveload
		Change \{enable_saving = 0}
		Change \{enable_loading = 0}
		Change \{disable_wifi = 1}
		wifinanddisablesaving
		if (<boot> = 1)
			ui_memcard_finish success = wii boot_disable_saveload controller = ($memcardcontroller)
		else
			ui_memcard_finish success = wii controller = ($memcardcontroller)
		endif
		case leave_saveload_flow
		memcard_cleanup_messages
		ui_memcard_finish success = wii controller = ($memcardcontroller)
		case load
		SpawnScriptLater ui_memcard_load params = {this_event = menu_replace event = menu_back check_for_space = <check_for_space> boot = <boot>}
		case load_complete
		wii_memcard_saveload_complete \{header = $wii_success_header
			message = load_successful}
		ui_memcard_finish success = wii controller = ($memcardcontroller)
		case overwrite_warning
		ui_event \{event = menu_replace
			data = {
				state = uistate_wii_handle_trc
				event_params = {
					menu_to_load = overwrite_menu
				}
			}}
		case save
		SpawnScriptLater ui_memcard_save params = {check_for_space = <check_for_space> boot = <boot>}
		case save_complete
		wii_memcard_saveload_complete \{header = $wii_success_header
			message = save_successful}
		ui_memcard_finish success = wii controller = ($memcardcontroller)
		case jam_failed
		memcard_cleanup_messages
		ui_memcard_finish failed = wii controller = ($memcardcontroller)
		case wii_menu
		wii_goto_system_menu
		ui_memcard_finish success = wii controller = ($memcardcontroller)
		case wii_data_management
		enablereset
		wii_goto_data_management_screen
		case generic_back
		ui_event \{event = menu_back}
	endswitch
endscript
