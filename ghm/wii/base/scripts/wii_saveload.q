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
			SoftAssert \{qs(0xd3ef34a0)}
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
		ClearGlobalTags
		setup_globaltags
		printf qs(0x4cd59a7d) a = <boot>
		if (<boot> = 1)
			return \{memcard_status = corrupt_boot}
		elseif (<boot> = 0)
			return \{memcard_status = load_corrupt_ingame}
		endif
	endif
	scan_globaltag_downloads
	restore_globals_from_global_tags
	cheats_load
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
endscript

script wii_memcard_check_for_space 
	thename = ($memcard_file_types.$0x64fa86d1.file_name)
	thetype = $0x64fa86d1
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

script 0x63cff2c7 \{params = {
		}}
	RequireParams \{[
			func
		]
		all}
	0xaad694ba
	<func> <params>
	if NOT (<0xf1ef0fdd> = true)
		0x8c166256
	endif
	return <...>
endscript

script wii_memcard_save 
	0x63cff2c7 func = 0x8645513b params = <...>
	return <...>
endscript

script 0x8645513b \{check_for_space = 1
		boot = 0
		filetype = progress}
	0x8dbdaee4 \{qs(0xbc2ee3c8)}
	0xe6b61ea6 <...>
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
		Change memcard_jamsession_song_version = <song_version>
		Change memcard_jamsession_downloaded = <downloaded>
		if GotParam \{fileid}
			Change memcard_jamsession_fileid = <fileid>
		endif
		Change memcard_jamsession_playback_track1 = <playback_track1>
		Change memcard_jamsession_playback_track2 = <playback_track2>
		Change memcard_jamsession_playback_track_drums = <playback_track_drums>
		Change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
		if NOT ($jam_band_new_song = 0)
			directorylisting = $jam_curr_directory_listing
			GetArraySize <directorylisting>
			if (<array_Size> > 0)
				index = 0
				0x22e3c87d = []
				begin
				if NOT ((<directorylisting> [<index>].song_version) = 0)
					AddArrayElement array = <0x22e3c87d> element = (<directorylisting> [<index>].actual_file_name)
					0x22e3c87d = <array>
				endif
				index = (<index> + 1)
				repeat <array_Size>
			endif
			GetArraySize <0x22e3c87d>
			suffix = 0
			begin
			if (<suffix> < 10)
				0xd88b7582 = '00'
			elseif (<suffix> < 100)
				0xd88b7582 = '0'
			else
				0xd88b7582 = ''
			endif
			formatText TextName = unique_name '%f%z%s' f = <FileName> z = <0xd88b7582> s = <suffix>
			if NOT (ArrayContains array = <0x22e3c87d> contains = <unique_name>)
				break
			endif
			suffix = (<suffix> + 1)
			repeat
			Change memcard_jamsession_actual_file_name = <unique_name>
		endif
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
endscript

script wii_replace_file 
	0x63cff2c7 func = 0x3df3b17d params = <...>
	return <...>
endscript

script 0x3df3b17d \{boot = 1}
	create_popup_warning_menu \{textblock = {
			text = qs(0xbcacfe8f)
		}}
	0x724c4dfb \{parent_id = popup_warning_container
		z_priority = 1001}
	Wait \{1
		Second}
	ClearGlobalTags
	setup_globaltags
	DeleteMemCardFile \{filetype = progress}
	wii_memcard_save check_for_space = 0 boot = <boot>
	if GotParam \{0x67f4a21c}
		Wait \{1
			Second}
		wii_scan_jamsession_files \{Force = 1}
		jam_recording_create_editable_arrays
		clearjamsession
		Wait \{1
			Second}
		setsonginfo \{genre = -1
			song_version = $jam_song_version_valid
			downloaded = 0
			drum_kit = 0
			file_id = {
				file_id = [
					0
					0
				]
			}}
		directorylisting = $jam_curr_directory_listing
		GetArraySize <directorylisting>
		index = 0
		begin
		Change memcard_jamsession_actual_file_name = (<directorylisting> [<index>].actual_file_name)
		writedummyjamsong
		<index> = (<index> + 1)
		Wait \{1
			gameframe}
		repeat <array_Size>
		jam_save_song_unload
	endif
	destroy_popup_warning_menu
	return memcard_status = <memcard_status>
endscript

script wii_replace_file_ingame 
	wii_replace_file \{boot = 0}
	return <...>
endscript

script wii_memcard_delete 
	0x63cff2c7 func = 0x34233a96 params = <...>
	return <...>
endscript

script 0x34233a96 \{filetype = jamsession}
	get_filename_from_filetype filetype = <filetype>
	printf qs(0x578e9c9a) a = <filetype> b = <FileName>
	SetSaveFileName filetype = <filetype> Name = <FileName>
	if (<filetype> = jamsession)
		jam_recording_create_editable_arrays
		clearjamsession
		setsonginfo \{genre = -1
			song_version = 0
			downloaded = 0
			drum_kit = 0
			file_id = {
				file_id = [
					0
					0
				]
			}}
		Change \{memcard_jamsession_song_version = $jam_song_version_valid}
		Change \{memcard_jamsession_downloaded = 0}
		Change \{memcard_jamsession_playback_track1 = 0}
		Change \{memcard_jamsession_playback_track2 = 0}
		Change \{memcard_jamsession_playback_track_drums = 0}
		Change \{memcard_jamsession_playback_track_vocals = 0}
		Change \{memcard_jamsession_file_name = qs(0xbf9c7a91)}
		Change \{memcard_jamsession_artist = qs(0x2dc91c7c)}
		if NOT writedummyjamsong
			printf \{qs(0x6b7bc255)}
			return \{memcard_status = delete_error_ingame}
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
		create_wii_saveload_screen <...>
		Wait \{3
			frames}
		Wait \{2
			Seconds}
		ui_event_get_stack
		if GotParam \{stack}
			GetArraySize <stack>
			if (<array_Size> > 0)
				0xa0171747 = (<stack> [0])
				if StructureContains structure = <0xa0171747> 0x6d221ff1
					create_loading_screen
					Wait \{8
						gameframes}
				elseif StructureContains structure = <0xa0171747> event_params
					if StructureContains structure = (<0xa0171747>.event_params) data
						if StructureContains structure = (<0xa0171747>.event_params.data) 0x6d221ff1
							create_loading_screen
							Wait \{8
								gameframes}
						endif
					endif
				endif
			endif
		endif
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

script wii_delete_file_toggle_autosave 
	0x63cff2c7 func = 0x068d8193 params = <...>
	return <...>
endscript

script 0x068d8193 
	destroy_generic_popup
	DeleteMemCardFile \{filetype = progress}
endscript

script wii_scan_jamsession_files \{Force = 0}
	if (($wii_need_jamsession_scan = true) || (Force != 0))
		printf \{qs(0x00a6754e)}
		SetSaveFileName filetype = jamsession Name = ($memcard_file_types.jamsession.file_name)
		GetMemCardDirectoryListing \{filetype = jamsession}
		Change jam_curr_directory_listing = <directorylisting>
		Change \{wii_need_jamsession_scan = FALSE}
	endif
endscript

script wifi_nand_continue_without_saving 
	destroy_generic_popup
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
endscript

script open_insufficient_space_dialog 
	destroy_generic_popup
	formatText TextName = message_text (qs(0x5a570615)) d = (<fsblocks>)
	create_generic_popup {
		title = qs(0x79597197)
		message = <message_text>
		option_menu = 2
		option1 = {
			title = qs(0x8ccc6e9a)
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wifi_nand_continue_without_saving}
			]
		}
		option2 = {
			title = qs(0xea6b87ed)
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
	create_generic_popup \{title = qs(0x79597197)
		message = qs(0xb041d8e1)
		option_menu = 2
		option1 = {
			title = qs(0x8ccc6e9a)
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
			title = qs(0xea6b87ed)
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

script open_corrupt_save_dialog 
	destroy_generic_popup
	get_string_wii \{message = corrupt_boot}
	create_generic_popup {
		title = qs(0x79597197)
		message = <localized_string>
		option_menu = 2
		font_scale = 0.6
		option1 = {
			title = qs(0x8ccc6e9a)
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wifi_nand_continue_without_saving}
			]
		}
		option2 = {
			title = qs(0x21f73b70)
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wii_delete_file_toggle_autosave}
			]
		}
	}
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

script wii_create_missing_files 
	0x63cff2c7 func = 0x3a0e14da params = <...>
	return <...>
endscript
disable_wifi = 0

script 0x3a0e14da 
	if ($progression_pop_count = 1)
		pop_later = 1
		progression_push_current
	else
		pop_later = 0
	endif
	jam_recording_create_editable_arrays
	clearjamsession
	setsonginfo \{genre = -1
		song_version = $jam_song_version_valid
		downloaded = 0
		drum_kit = 0
		file_id = {
			file_id = [
				0
				0
			]
		}}
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
				return \{memcard_status = insufficient_space_boot}
			else
				printf \{qs(0x39fe5ec9)}
				Change \{enable_saving = 0}
				Change \{disable_wifi = 1}
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
	return flow_state = <flow_state> memcard_status = <memcard_status>
endscript
