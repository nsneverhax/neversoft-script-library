wii_saveload_successor = null_flow_state
wii_nosave_onboot = 0
wii_memcard_autosave = 0
wii_need_jamsession_scan = FALSE

script wii_leave_saveload_flow 
	if ($wii_memcard_autosave = 0)
		printf \{qs(0xce230ea1)}
		return \{flow_state = options_data_settings_fs}
	else
		printf \{qs(0x5b882e0d)}
		ps2_get_saveload_successor
		return flow_state = <flow_state>
	endif
endscript

script wii_memcard_load \{boot = 0
		filetype = progress}
	if ($wii_nosave_onboot = 1 && <boot> = 1)
		Change \{MemcardSavingOrLoading = saving}
	else
		Change \{MemcardSavingOrLoading = loading}
	endif
	get_filename_from_filetype filetype = <filetype>
	printf qs(0xea1c23bd) a = <filetype> b = <FileName>
	SetSaveFileName filetype = <filetype> Name = <FileName>
	GetGlobalTags \{globaltag_checksum
		params = globaltag_checksum}
	oldglobaltag_checksum = <globaltag_checksum>
	if ($wii_memcard_autosave = 1 || (<boot> = 1))
		loadfromoptions = FALSE
	else
		loadfromoptions = true
	endif
	if NOT LoadFromMemoryCard filetype = <filetype> loadfromoptions = <loadfromoptions>
		if GotParam \{CorruptedData}
			printf qs(0xf1f0a647) a = <boot>
			if (<boot> = 1)
				return \{memcard_status = corrupt_boot}
			elseif (<boot> = 0)
				return \{memcard_status = load_corrupt_ingame}
			endif
		elseif GotParam \{nosave}
			printf qs(0x6d7f0273) a = <boot>
			if (<boot> = 1)
				return \{memcard_status = load_no_save_boot}
			elseif (<boot> = 0)
				return \{memcard_status = load_no_save_ingame}
			endif
		else
			ScriptAssert \{qs(0xd3ef34a0)}
			if (<boot> = 1)
				return \{memcard_status = corrupt_boot}
			elseif (<boot> = 0)
				return \{memcard_status = load_corrupt_ingame}
			endif
		endif
	endif
	globaltag_checksum = invalid
	GetGlobalTags \{globaltag_checksum
		params = globaltag_checksum
		noassert = 1}
	if NOT (<globaltag_checksum> = <oldglobaltag_checksum>)
		printf \{qs(0xff2fd0d4)}
		printf qs(0x4cd59a7d) a = <boot>
		if (<boot> = 1)
			return \{memcard_status = corrupt_boot}
		elseif (<boot> = 0)
			return \{memcard_status = load_corrupt_ingame}
		endif
	endif
	restore_globals_from_global_tags \{savegame = 0}
	printf qs(0x3cce5422) a = <boot>
	if (<boot> = 1)
		if ($wii_nosave_onboot = 1)
			return \{memcard_status = choose_proper_using_guitar_screen}
		else
			return \{memcard_status = press_any_button}
		endif
	elseif (<boot> = 0)
		wii_leave_saveload_flow
		return \{memcard_status = success}
	endif
	if NOT ispakloaded \{'pak\\car_parts_data\\car_parts_data.pak'
			Heap = heap_system}
		LoadPak \{'pak\\car_parts_data\\car_parts_data.pak'
			Heap = heap_system}
	endif
endscript

script wii_memcard_check_for_space 
	thename = (($memcard_file_types [$savefiletypeindex]).file_name)
	thetype = (($memcard_file_types [$savefiletypeindex]).Name)
	if NOT getmemcardspaceavailable Name = <thename> filetype = <thetype>
		if (<no_space> = true)
			return \{nospace = 1
				noinode = 0}
		elseif (<no_inodes> = true)
			return \{noinode = 1
				nospace = 0}
		endif
	endif
	return \{nospace = 0
		noinode = 0}
endscript

script SaveToMemoryCard 
	RequireParams \{[
			filetype
			savefromoptions
		]
		all}
	if ispakloaded \{'pak\\car_parts_data\\car_parts_data.pak'
			Heap = heap_system}
		UnLoadPak \{'pak\\car_parts_data\\car_parts_data.pak'
			Heap = heap_system}
	endif
	<Result> = FALSE
	if savetomemorycard_cfunc filetype = <filetype> savefromoptions = <savefromoptions>
		<Result> = true
	endif
	if NOT ispakloaded \{'pak\\car_parts_data\\car_parts_data.pak'
			Heap = heap_system}
		LoadPakAsync \{pak_name = 'pak\\car_parts_data\\car_parts_data.pak'
			Heap = heap_system
			async = 1}
	endif
	return <Result>
endscript

script wii_memcard_save \{check_for_space = 1
		boot = 0
		filetype = progress}
	printf qs(0xf5022901) a = <boot>
	printf qs(0x1c1c5b40) a = <check_for_space>
	Change \{MemcardSavingOrLoading = saving}
	get_filename_from_filetype filetype = <filetype>
	printf qs(0x47c2056f) a = <filetype> b = <FileName>
	if (<check_for_space> = 1 && <boot> = 1)
		memcard_check_for_existing_save filetype = <filetype>
		if (<found> = 0)
			wii_memcard_check_for_space
			printf qs(0x9447f983) a = <found>
			printf qs(0xe865c7cf) a = <nospace>
			printf qs(0x5c35e2f6) a = <noinode>
			if (<nospace> = 1)
				printf \{qs(0xf01ae7a5)}
				if (<filetype> = jamsession)
					return \{memcard_status = insufficient_space_jam}
				elseif (<boot> = 1)
					return \{memcard_status = insufficient_space_boot}
				elseif (<boot> = 0)
					return \{memcard_status = insufficient_space_ingame}
				endif
			elseif (<noinode> = 1)
				printf \{qs(0x2ae99d08)}
				if (<filetype> = jamsession)
					return \{memcard_status = insufficient_inode_jam}
				elseif (<boot> = 1)
					return \{memcard_status = insufficient_inode_boot}
				elseif (<boot> = 0)
					return \{memcard_status = insufficient_inode_ingame}
				endif
			endif
		endif
	endif
	if (($progression_pop_count = 1) && (<filetype> = progress))
		pop_later = 1
		progression_push_current
	else
		pop_later = 0
	endif
	if (<filetype> = jamsession)
		jam_publish_update_playback_track \{guitar_num = 1}
		jam_publish_update_playback_track \{guitar_num = 2}
		jam_publish_update_playback_drumvocal_track
		downloaded = 0
		getsonginfo
		Change memcard_jamsession_genre = <genre>
		Change memcard_jamsession_song_version = <song_version>
		Change memcard_jamsession_downloaded = <downloaded>
		musicstudio_mainobj :musicstudio_getsonglength
		Change memcard_jamsession_song_length = <song_length>
		if GotParam \{fileid}
			Change memcard_jamsession_fileid = <fileid>
		endif
		Change memcard_jamsession_playback_track1 = <playback_track1>
		Change memcard_jamsession_playback_track2 = <playback_track2>
		Change memcard_jamsession_playback_track_drums = <playback_track_drums>
		Change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	endif
	SetSaveFileName filetype = <filetype> Name = <FileName>
	if (($wii_memcard_autosave = 1) || ((<boot>) = 1))
		savefromoptions = FALSE
	else
		savefromoptions = true
	endif
	if NOT SaveToMemoryCard filetype = <filetype> savefromoptions = <savefromoptions>
		printf \{qs(0x9da901f3)}
		if (<boot> = 1)
			return \{memcard_status = save_error_boot}
		elseif (<boot> = 0)
			return \{memcard_status = save_error_ingame}
		endif
	endif
	if (<pop_later> = 1)
		progression_pop_current
	endif
	guitar_memcard_save_success_sound
	printf \{qs(0xbefb2963)}
	return \{memcard_status = success}
	if NOT ispakloaded \{'pak\\car_parts_data\\car_parts_data.pak'
			Heap = heap_system}
		LoadPakAsync \{'pak\\car_parts_data\\car_parts_data.pak'
			Heap = heap_system}
	endif
endscript

script wii_replace_file 
	get_filename_from_filetype \{filetype = progress}
	SetSaveFileName filetype = progress Name = <FileName>
	DeleteMemCardFile \{filetype = progress}
	wii_memcard_save \{boot = 1
		check_for_space = 0
		filetype = progress}
	return memcard_status = <memcard_status>
endscript

script wii_replace_file_ingame 
	get_filename_from_filetype \{filetype = progress}
	SetSaveFileName filetype = progress Name = <FileName>
	DeleteMemCardFile \{filetype = progress}
	wii_memcard_save \{boot = 0
		check_for_space = 0
		filetype = progress}
	return memcard_status = <memcard_status>
endscript

script wii_memcard_delete \{filetype = jamsession}
	get_filename_from_filetype filetype = <filetype>
	printf qs(0x578e9c9a) a = <filetype> b = <FileName>
	SetSaveFileName filetype = <filetype> Name = <FileName>
	if (<filetype> = jamsession)
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
		Change \{memcard_jamsession_genre = 0}
		Change \{memcard_jamsession_song_version = $jam_song_version_dummy}
		Change \{memcard_jamsession_downloaded = 0}
		Change \{memcard_jamsession_playback_track1 = 0}
		Change \{memcard_jamsession_playback_track2 = 0}
		Change \{memcard_jamsession_playback_track_drums = 0}
		Change \{memcard_jamsession_playback_track_vocals = 0}
		Change \{memcard_jamsession_file_name = $wii_jam_custom_song}
		Change \{memcard_jamsession_artist = qs(0x2dc91c7c)}
		Change \{memcard_jamsession_song_length = 0}
		if NOT writedummyjamsong
			printf \{qs(0x6b7bc255)}
			jam_recording_destroy_editable_arrays
			return \{memcard_status = delete_error_ingame}
		else
			jam_recording_destroy_editable_arrays
		endif
	else
		if NOT DeleteMemCardFile filetype = <filetype>
			printf \{qs(0x6b7bc255)}
			return \{memcard_status = delete_error_ingame}
		endif
	endif
	printf \{qs(0xe21f37eb)}
	return \{memcard_status = success}
endscript

script wii_disable_autosave 
	if NOT (<boot> = 1)
		create_wii_saveload_screen <...>
		Wait \{3
			Seconds}
	endif
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	SpawnScriptNow \{ui_wii_trc_handle_action
		params = {
			action = leave_saveload_flow
		}}
endscript

script wii_memcard_saveload_complete 
	printstruct <...>
	printf \{qs(0x09346280)}
	wii_scan_jamsession_files
	directorylisting = $jam_curr_directory_listing
	GetArraySize <directorylisting>
	index = 0
	corruptjamfile = 0
	if NOT (<array_Size> = $jam_max_user_songs)
		<corruptjamfile> = 1
	elseif (<array_Size> > 0)
		begin
		if StructureContains structure = (<directorylisting> [<index>]) corrupt
			<corruptjamfile> = 1
			break
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	if (<corruptjamfile> = 1)
		ui_event_wait event = menu_replace data = {state = uistate_wii_handle_trc event_params = {memcard_status = corrupt_boot event_params = <event_params> Type = boot}}
	else
		if NOT ($save_message_start_time = -1)
			getelapsedtime \{starttime = $save_message_start_time}
			printf qs(0x3701f241) a = <ElapsedTime>
			if (<ElapsedTime> < 2000)
				<added_delay> = ((2500 - <ElapsedTime>) / 1000)
				Wait <added_delay> Seconds
			endif
			Change \{save_message_start_time = -1}
		endif
		if ($wii_nosave_onboot = 1)
			jam_save_song_unload
			Change \{wii_nosave_onboot = 0}
		endif
		memcard_cleanup_messages
		destroy_wii_saveload_screen
		Wait \{3
			frames}
		memcard_cleanup_messages
		SpawnScriptLater \{ui_wii_trc_handle_action
			params = {
				action = leave_saveload_flow
			}}
	endif
endscript

script wii_goto_system_menu 
	resettoipl
endscript

script wii_goto_data_management_screen 
	resettodatamanagementscreen
endscript

script wii_scan_jamsession_files \{Force = 0}
	if (($wii_need_jamsession_scan = true) || (Force != 0))
		printf \{qs(0x00a6754e)}
		SetSaveFileName filetype = jamsession Name = ($memcard_file_types [$jamsessionfiletypeindex].file_name)
		GetMemCardDirectoryListing \{filetype = jamsession}
		Change jam_curr_directory_listing = <directorylisting>
		Change \{wii_need_jamsession_scan = FALSE}
	endif
endscript

script wifi_nand_continue_without_saving 
	destroy_generic_popup
	wifinanddisablesaving
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	Change \{enable_saving = 0}
endscript

script open_insufficient_space_dialog 
	destroy_generic_popup
	formatText TextName = message_text ($wii_wifi_nand_insufficient_space_text) d = (<fsblocks>)
	create_generic_popup {
		title = $wii_error_header
		message = <message_text>
		option_menu = 2
		option1 = {
			title = $wii_saveload_continuenosave
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wifi_nand_continue_without_saving}
			]
		}
		option2 = {
			title = $wii_saveload_wiimenu
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wii_goto_system_menu}
			]
		}
	}
endscript

script open_insufficient_inodes_dialog 
	destroy_generic_popup
	create_generic_popup \{title = $wii_error_header
		message = $wii_wifi_nand_insufficient_inodes_text
		option_menu = 2
		option1 = {
			title = $wii_saveload_continuenosave
			eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					wifi_nand_continue_without_saving
				}
			]
		}
		option2 = {
			title = $wii_saveload_wiimenu
			eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					wii_goto_system_menu
				}
			]
		}}
endscript

script wii_data_check_and_load 
	if ((progressfileexists) && (wfcfileexists))
		wii_memcard_load boot = <boot>
	else
		Change \{wii_nosave_onboot = 1}
		wii_create_missing_files boot = <boot>
	endif
	return memcard_status = <memcard_status>
endscript
disable_wifi = 0

script wii_create_missing_files 
	create_loading_screen \{saving_warning = 1}
	Wait \{1
		Second}
	memcard_cleanup_messages
	if ($progression_pop_count = 1)
		pop_later = 1
		progression_push_current
	else
		pop_later = 0
	endif
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
	if attempttocreatemissingfiles
		printf \{qs(0x269fa249)}
	else
		printf qs(0x40b357f1) a = <check_failed>
		printf qs(0xfa907d39) a = <no_progressfile>
		printf qs(0x46e69ace) a = <no_wfcfile>
		printf qs(0x3a5bcff4) a = <no_space>
		printf qs(0x8589e9cb) a = <no_inodes>
		if (<check_failed> = true)
			printf \{qs(0x7c7d2f7c)}
			return \{memcard_status = save_error_boot}
		elseif ((<no_progressfile> = true) && (<no_wfcfile> = true))
			printf \{qs(0xd6b7c4dc)}
			if (<no_space> = true)
				printf \{qs(0x7192f298)}
				Change \{enable_saving = 0}
				Change \{disable_wifi = 1}
				wifinanddisablesaving
				return \{memcard_status = insufficient_space_boot}
			else
				printf \{qs(0x39fe5ec9)}
				Change \{enable_saving = 0}
				Change \{disable_wifi = 1}
				wifinanddisablesaving
				return \{memcard_status = insufficient_inode_boot}
			endif
		elseif (<no_wfcfile> = true)
			printf \{qs(0xc5c4ebc7)}
			wifinanddisablesaving
			if (<no_space> = true)
				printf \{qs(0x7192f298)}
				Change \{enable_saving = 1}
				Change \{disable_wifi = 1}
				return \{memcard_status = insufficient_space_boot_wfc_only}
			else
				printf \{qs(0x39fe5ec9)}
				Change \{enable_saving = 1}
				Change \{disable_wifi = 1}
				return \{memcard_status = insufficient_inode_boot_wfc_only}
			endif
		elseif (<no_progressfile> = true)
			printf \{qs(0xf34b61b9)}
			get_filename_from_filetype \{filetype = progress}
			SetSaveFileName filetype = progress Name = <FileName>
			return \{memcard_status = corrupt_boot}
		else
			printf \{qs(0x9e85554a)}
			return \{memcard_status = save_error_boot}
		endif
	endif
	if (<pop_later> = 1)
		progression_pop_current
	endif
	wii_memcard_load boot = <boot>
	destroy_loading_screen
	return flow_state = <flow_state> memcard_status = <memcard_status>
endscript
