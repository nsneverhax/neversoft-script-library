memcard_default_title = 'Guitar Hero Smash Hits'
memcard_content_name = qs(0x7235ca15)
memcard_content_jamsession_name = qs(0xcf50afcb)
memcard_file_name = qs(0xc279b812)
required_trophy_pack_size = 57671680
save_data_dirty = 0
memcard_file_types = {
	progress = {
		version = 57
		fixed_size = 2097152
		use_temp_pools = false
		is_binary_file = true
		num_bytes_per_frame = 102400
	}
	jamsession = {
		version = 80
		fixed_size = 1150976
		use_temp_pools = false
		is_binary_file = false
		num_bytes_per_frame = 102400
	}
}
memcard_folder_desc = {
	guitarcontent = {
		icon_xen = 'memcard\\gh.png'
		icon_ps3 = 'memcard\\ICON0.PNG'
		file_types = [
			{
				name = progress
				slots_reserve = 1
			}
		]
	}
	jamsessionscontent = {
		icon_xen = 'memcard\\gh.png'
		icon_ps3 = 'memcard\\ICON0.PNG'
		file_types = [
			{
				name = jamsession
				slots_reserve = 0
			}
		]
	}
}
memcarddonescript = nullscript
memcardretryscript = nullscript
memcardsavingorloading = saving
memcardsuccess = false
memcardcontroller = $primary_controller
memcardinitialboot = false
memcardjamordefault = `default`

script memcard_choose_storage_device \{storageselectorforce = 0}
	printscriptinfo \{qs(0x10bc9129)}
	create_checking_memory_card_screen
	wait \{1
		seconds}
	mc_setactiveplayer userid = ($memcardcontroller)
	if NOT cardisinslot
		if (<storageselectorforce> = 0)
			goto \{create_storagedevice_warning_menu}
		endif
	endif
	dump
	showstorageselector force = <storageselectorforce> filetype = progress
endscript

script memcard_check_for_previously_used_folder 
	mc_waitasyncopsfinished
	memcard_check_for_card
	if (<filetype> = jamsession)
		<foldername> = $memcard_content_jamsession_name
	else
		<foldername> = $memcard_content_name
	endif
	mc_setactivefolder foldername = <foldername>
	if mc_hasvalidatedfolder
		printf \{qs(0xa0f86458)}
		return \{found = 1
			corrupt = 0}
	else
		memcard_enum_folders
		if NOT mc_folderexists foldername = <foldername>
			printf \{qs(0x16bcd50d)}
			return \{found = 0
				corrupt = 0}
		endif
		mc_setactivefolder foldername = <foldername>
		mc_loadtocinactivefolder
		memcard_check_for_card
		if (<result> = true)
			if mc_hasvalidatedfolder
				printf \{qs(0xdc39d0c1)}
				return \{found = 1
					corrupt = 0}
			else
				printf \{qs(0x0fa7e44c)}
				return \{found = 0
					corrupt = 0}
			endif
		else
			if (<errorcode> = corrupt)
				printf \{qs(0x248ab78f)}
				return \{found = 1
					corrupt = 1}
			else
				printf \{qs(0x3d9186ce)}
				return \{found = 0
					corrupt = 0}
			endif
		endif
	endif
endscript

script memcard_enum_folders 
	mc_enumeratefolders
	if (<result> = false)
		memcard_error \{error = create_storagedevice_warning_menu}
	endif
endscript

script memcard_check_for_existing_save 
	memcard_enum_folders
	mc_waitasyncopsfinished
	memcard_check_for_card
	if mc_folderexists \{foldername = $memcard_content_name}
		mc_setactivefolder \{foldername = $memcard_content_name}
		mc_loadtocinactivefolder
		if (<result> = false)
			return \{found = 1
				corrupt = 1}
		endif
		if memcardfileexists \{filename = $memcard_file_name
				filetype = progress}
			return \{found = 1
				corrupt = 0}
		else
			return \{found = 1
				corrupt = 1}
		endif
	endif
	return \{found = 0
		corrupt = 0}
endscript

script memcard_wait_for_timer \{time = 3.0}
	begin
	if timegreaterthan <time>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script is_autosave_on 
	requireparams \{[
			savegame
		]}
	getglobaltags user_options savegame = <savegame>
	if (<autosave> = 1)
		return \{true}
	endif
	return \{false}
endscript

script memcard_save_file \{overwriteconfirmed = 0}
	printf \{qs(0x63276b9b)}
	mark_unsafe_for_shutdown
	change \{memcardsavingorloading = saving}
	memcard_check_for_card
	resettimer
	<overwrite> = 0
	if mc_folderexists \{foldername = $memcard_content_name}
		if (<overwriteconfirmed> = 1)
			<overwrite> = 1
			create_overwrite_menu
			resettimer
			mc_setactivefolder \{foldername = $memcard_content_name}
		else
			goto \{create_confirm_overwrite_menu}
		endif
	else
		if NOT mc_spacefornewfolder \{desc = guitarcontent}
			memcard_error \{error = create_out_of_space_menu}
		endif
		create_save_menu
		resettimer
		mc_createfolder \{name = $memcard_content_name
			desc = guitarcontent}
		if (<result> = false)
			if (<errorcode> = outofspace)
				memcard_error \{error = create_out_of_space_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
		get_savegame_from_controller controller = ($memcardcontroller)
		setglobaltags user_options savegame = <savegame> params = {autosave = 1}
	endif
	mc_setactivefolder \{foldername = $memcard_content_name}
	mc_loadtocinactivefolder
	memcard_pre_save_progress
	write_globals_to_global_tags
	pushtempmemcardpools \{heap = heap_bink}
	savetomemorycard \{filename = $memcard_file_name
		filetype = progress
		usepaddingslot = always}
	poptempmemcardpools
	if (<result> = false)
		if (<errorcode> = outofspace)
			memcard_error \{error = create_out_of_space_menu}
		else
			if (<errorcode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu}
			elseif (<overwrite> = 1)
				memcard_error \{error = create_overwrite_failed_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	refresh_jam_directory_contents
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	if (<overwrite> = 1)
		create_overwrite_success_menu
	else
		create_save_success_menu
	endif
	change \{save_data_dirty = 0}
	guitar_memcard_save_success_sound
	wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_delete_file \{file_type = `default`}
	printf \{qs(0x810fae7c)}
	mark_unsafe_for_shutdown
	create_delete_file_menu
	mc_waitasyncopsfinished
	if isps3
		createscreenelement \{type = spriteelement
			id = ps3_delete_fader
			parent = root_window
			texture = black
			rgba = [
				0
				0
				0
				255
			]
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = $ps3_fade_overlay_z
			alpha = 1.0}
		mc_startps3forcedelete
		begin
		if mc_isps3forcedeletefinished
			break
		endif
		wait \{1
			gameframes}
		repeat
		refresh_jam_directory_contents
		if NOT (<file_type> = jam_file)
			mc_setactivefolder \{foldername = $memcard_content_name}
			mc_loadtocinactivefolder
		endif
		destroyscreenelement \{id = ps3_delete_fader}
	else
		if (<file_type> = `default`)
			if mc_folderexists \{foldername = $memcard_content_name}
				resettimer
				mc_deletefolder \{foldername = $memcard_content_name}
				if (<result> = false)
					memcard_error \{error = create_delete_failed_menu}
				endif
				memcard_wait_for_timer
			endif
		endif
		if (<file_type> = jam_file)
			if mc_folderexists \{foldername = $memcard_content_jamsession_name}
				resettimer
				mc_deletefolder \{foldername = $memcard_content_jamsession_name}
				if (<result> = false)
					memcard_error \{error = create_delete_failed_menu}
				endif
				memcard_wait_for_timer
				create_delete_success_menu
			endif
		endif
		wait \{1
			seconds}
	endif
	if notcd
		deleteallsongdatafromfile
	endif
	memcard_check_for_card
	memcard_sequence_retry
endscript

script memcard_load_file \{loadconfirmed = 0}
	mark_unsafe_for_shutdown
	printf \{qs(0x03a3bf83)}
	change \{memcardsavingorloading = loading}
	mc_waitasyncopsfinished
	memcard_check_for_card
	resettimer
	if mc_folderexists \{foldername = $memcard_content_name}
		if (<loadconfirmed> = 1)
			mc_setactivefolder \{foldername = $memcard_content_name}
		else
			goto \{create_confirm_load_menu}
		endif
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	mc_setactivefolder \{foldername = $memcard_content_name}
	create_load_file_menu
	pushtempmemcardpools \{heap = heap_bink}
	loadfrommemorycard \{filename = $memcard_file_name
		filetype = progress}
	poptempmemcardpools
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	refresh_jam_directory_contents
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	create_load_success_menu
	memcard_post_load_progress
	wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_pre_save_progress 
endscript

script memcard_post_load_progress 
	if (($primary_controller) = $memcardcontroller)
		restore_globals_from_global_tags
	endif
	scan_globaltag_downloads
	refresh_autokick_cheat
	clearachievementcache \{controller_id = $memcardcontroller}
	setachievementmode \{mode = cache
		controller_id = $memcardcontroller}
	achievements_update
	setachievementmode \{mode = write
		controller_id = $memcardcontroller}
	get_savegame_from_controller \{controller = $memcardcontroller}
	reset_transient_tags savegame = <savegame>
endscript

script refresh_autokick_cheat 
	return
	controller = 0
	max_controllers = 4
	begin
	if checkforsignin local controller_index = <controller>
		if ($primary_controller = <controller>)
			getsavegamefromcontroller controller = <controller>
			getglobaltags user_options savegame = <savegame>
			if (<unlock_cheat_autokick> = 1 && <cheat_index8> = 1)
				turn_on_autokick = 1
			endif
			if (<unlock_cheat_alwaysslide> = 1 && <cheat_index1> = 1)
				turn_on_autoslide = 1
			endif
			if (<unlock_cheat_performancemode> = 1 && <cheat_index4> = 1)
				turn_on_preformance = 1
			endif
			if (<unlock_cheat_freedrum> = 1 && <cheat_index0> = 1)
				turn_on_drumfill = 1
			endif
			if (<unlock_cheat_line6unlock> = 1)
				turn_on_line6 = 1
			endif
		endif
	endif
	controller = (<controller> + 1)
	repeat <max_controllers>
	if gotparam \{turn_on_autokick}
		change \{cheat_autokick = 1}
	else
		change \{cheat_autokick = 2}
	endif
	if gotparam \{turn_on_autoslide}
		change \{cheat_alwaysslide = 1}
	else
		change \{cheat_alwaysslide = 2}
	endif
	if gotparam \{turn_on_preformance}
		change \{cheat_performancemode = 1}
	else
		change \{cheat_performancemode = 2}
	endif
	if gotparam \{turn_on_drumfill}
		change \{cheat_freedrum = 1}
	else
		change \{cheat_freedrum = 2}
	endif
	if gotparam \{turn_on_line6}
		change \{cheat_line6unlock = 1}
	else
		change \{cheat_line6unlock = 0}
	endif
	printstruct <...>
endscript

script memcard_cleanup_messages 
	destroy_popup_warning_menu
endscript

script memcard_sequence_generic_done 
	if ($memcardsavingorloading = saving)
		if ($memcardsuccess = true)
			printf \{qs(0xe2a29101)}
			ui_memcard_finish success = save controller = ($memcardcontroller)
		else
			printf \{qs(0x9f566822)}
			mc_setactivefolder \{folderindex = -1}
			ui_memcard_finish failed = save controller = ($memcardcontroller)
		endif
	else
		if ($memcardsuccess = true)
			printf \{qs(0x0e63bd4a)}
			ui_memcard_finish success = load controller = ($memcardcontroller)
		else
			printf \{qs(0x264adb01)}
			mc_setactivefolder \{folderindex = -1}
			ui_memcard_finish failed = load controller = ($memcardcontroller)
		endif
	endif
endscript

script memcard_sequence_retry 
	printf \{qs(0x879b8ee7)}
	mc_waitasyncopsfinished
	goto $memcardretryscript params = {<...> controller = ($memcardcontroller)}
endscript

script memcard_disable_saves_and_quit 
	get_savegame_from_controller controller = ($memcardcontroller)
	setglobaltags user_options savegame = <savegame> params = {autosave = 0}
	memcard_sequence_quit
endscript

script memcard_sequence_quit 
	printf \{qs(0x5dba2148)}
	mark_safe_for_shutdown
	goto $memcarddonescript params = <...>
endscript

script memcard_check_for_card 
	if NOT cardisinslot
		goto create_storagedevice_warning_menu params = <...>
	endif
endscript

script memcard_error 
	printf \{qs(0x81c80e89)}
	requireparams \{[
			error
		]
		all}
	memcard_check_for_card
	goto <error> params = <params>
endscript

script memcard_sequence_cleanup_generic 
	mc_waitasyncopsfinished
	memcard_cleanup_messages
	change \{memcarddonescript = nullscript}
	change \{memcardretryscript = nullscript}
	change \{memcardcontroller = $primary_controller}
	mc_setactiveplayer \{querydefault}
endscript

script memcard_validate_card_data \{storageselectorforce = 0
		validateprev = 0
		filetype = progress}
	mc_setactiveplayer userid = ($memcardcontroller)
	memcard_choose_storage_device storageselectorforce = <storageselectorforce>
	memcard_check_for_card <...>
	if (<validateprev> = 1)
		memcard_check_for_previously_used_folder filetype = <filetype>
	else
		memcard_check_for_existing_save
	endif
	requireparams \{[
			found
			corrupt
		]
		all}
	if (<corrupt> = 1)
		if (<filetype> = progress)
			refresh_jam_directory_contents \{ignore_failure}
			mc_setactivefolder \{foldername = $memcard_content_name}
			mc_loadtocinactivefolder
			memcard_error \{error = create_corrupted_data_menu}
		else
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		endif
	endif
	return found = <found> corrupt = <corrupt>
endscript

script refresh_jam_directory_contents 
	printf \{'refresh_jam_directory_contents'}
	jam_reset_controller_directory_listing controller = ($memcardcontroller)
	change \{jam_curr_directory_listing = [
		]}
	memcard_enum_folders
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
		mc_loadtocinactivefolder
		getmemcarddirectorylisting
		if gotparam \{ignore_failure}
			if (<result> = false)
				jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = []
				change \{jam_curr_directory_listing = [
					]}
				return
			endif
		endif
		if (<result> = false)
			if (<errorcode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu
					params = {
						file_type = jam_file
					}}
			else
				memcard_error \{error = create_load_failed_menu}
			endif
		endif
		if NOT (<result> = false)
			if gotparam \{directorylisting}
				jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
				change jam_curr_directory_listing = <directorylisting>
			endif
		endif
	endif
endscript

script memcard_sequence_begin_bootup 
	spawnscriptnow memcard_sequence_begin_bootup_logic params = <...>
endscript

script memcard_sequence_begin_save 
	spawnscriptnow memcard_sequence_begin_save_logic params = <...>
endscript

script memcard_sequence_begin_autosave 
	spawnscriptnow memcard_sequence_begin_autosave_logic params = <...>
endscript

script memcard_sequence_begin_load 
	spawnscriptnow memcard_sequence_begin_load_logic params = <...>
endscript

script memcard_sequence_begin_autoload 
	spawnscriptnow memcard_sequence_begin_autoload_logic params = <...>
endscript

script memcard_sequence_begin_save_jam 
	spawnscriptnow memcard_sequence_begin_save_jam_logic params = <...>
endscript

script memcard_sequence_begin_load_jam 
	spawnscriptnow memcard_sequence_begin_load_jam_logic params = <...>
endscript

script memcard_sequence_begin_rename_jam 
	spawnscriptnow memcard_sequence_begin_rename_jam_logic params = <...>
endscript

script memcard_sequence_begin_delete_jam 
	spawnscriptnow memcard_sequence_begin_delete_jam_logic params = <...>
endscript

script memcard_sequence_begin_ss_load 
	spawnscriptnow memcard_sequence_begin_ss_load_logic params = <...>
endscript

script memcard_sequence_begin_bootup_logic \{controller = $primary_controller}
	printf \{qs(0xf46a9374)}
	mc_waitasyncopsfinished
	mark_unsafe_for_shutdown
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_bootup_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = true}
	change \{memcardjamordefault = `default`}
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	if (<found> = 1)
		goto \{memcard_load_file
			params = {
				loadconfirmed = 1
			}}
	else
		goto \{memcard_save_file}
	endif
endscript

script memcard_sequence_begin_save_logic \{storageselectorforce = 1
		controller = $primary_controller}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = `default`}
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	goto \{memcard_save_file}
endscript

script memcard_sequence_begin_autosave_logic \{controller = $primary_controller}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	disable_pause
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = `default`}
	get_savegame_from_controller controller = <controller>
	getglobaltags user_options savegame = <savegame>
	if (<autosave> = 0 && <requested_autosave> = 0)
		printf \{qs(0x4c1699ec)}
		goto \{memcard_sequence_quit}
	endif
	mc_setactiveplayer userid = <controller>
	if NOT cardisinslot
		goto \{create_storagedevice_warning_menu}
	endif
	memcard_validate_card_data \{storageselectorforce = 0
		validateprev = 1}
	if (<found> = 1)
		goto \{memcard_save_file
			params = {
				overwriteconfirmed = 1
			}}
	else
		memcard_sequence_retry
	endif
endscript

script memcard_sequence_begin_load_logic \{storageselectorforce = 1
		controller = $primary_controller}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_load_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = `default`}
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	goto \{memcard_load_file}
endscript

script memcard_sequence_begin_autoload_logic \{controller = $primary_controller}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_bootup_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = `default`}
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	if (<found> = 1)
		goto \{memcard_load_file
			params = {
				loadconfirmed = 1
			}}
	else
		goto \{memcard_save_file}
	endif
endscript

script jam_memcard_validate_card_data \{storageselectorforce = 0}
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 1 filetype = jamsession
	return <...>
endscript

script memcard_sequence_begin_save_jam_logic \{storageselectorforce = 0
		controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x3ab2ee1c)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_jam_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = jam}
	<card_was_in_slot> = false
	if cardisinslot
		<card_was_in_slot> = true
	endif
	jam_memcard_validate_card_data <...>
	if (<corrupt> = 0)
		goto memcard_save_jam params = {card_was_in_slot = <card_was_in_slot>}
	endif
endscript

script memcard_save_jam \{overwriteconfirmed = 0
		card_was_in_slot = true}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcardsavingorloading = saving}
	memcard_check_for_card
	resettimer
	printf \{channel = jam_mode
		qs(0xf6157763)}
	memcard_enum_folders
	create_save_menu
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		if (<card_was_in_slot> = false)
			if (<overwriteconfirmed> = 1)
				<overwrite> = 1
				create_overwrite_menu
				resettimer
				mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
			else
				goto \{create_confirm_overwrite_menu}
			endif
		else
			mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
		endif
	else
		if NOT mc_spacefornewfolder \{desc = guitarcontent}
			memcard_error \{error = create_out_of_space_menu}
		endif
		mc_createfolder \{name = $memcard_jamsession_content_name
			desc = jamsessionscontent}
		if (<result> = false)
			if (<errorcode> = outofspace)
				memcard_error \{error = create_out_of_space_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	mc_loadtocinactivefolder
	jam_publish_update_playback_track \{guitar_num = 1}
	jam_publish_update_playback_track \{guitar_num = 2}
	jam_publish_update_playback_drumvocal_track
	downloaded = 0
	getsonginfo
	change memcard_jamsession_song_version = <song_version>
	change memcard_jamsession_downloaded = <downloaded>
	if gotparam \{file_id}
		change memcard_jamsession_fileid = <file_id>
	endif
	change memcard_jamsession_artist = <artist>
	change memcard_jamsession_playback_track1 = <playback_track1>
	change memcard_jamsession_playback_track2 = <playback_track2>
	change memcard_jamsession_playback_track_drums = <playback_track_drums>
	change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	savetomemorycard \{filename = $memcard_jamsession_file_name
		filetype = jamsession
		usepaddingslot = never}
	if (<result> = false)
		if (<errorcode> = outofspace)
			memcard_error \{error = create_out_of_space_menu}
		elseif (<errorcode> = badfolder)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_save_failed_menu}
		endif
	endif
	loadfrommemorycard \{filename = $memcard_jamsession_file_name
		filetype = jamsession}
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	change \{jam_selected_song = $memcard_jamsession_file_name}
	getmemcarddirectorylisting
	jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
	change jam_curr_directory_listing = <directorylisting>
	printf \{channel = jam_mode
		qs(0x98e3ad04)}
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	create_save_success_menu
	guitar_memcard_save_success_sound
	change \{save_data_dirty = 0}
	wait \{1
		seconds}
	if NOT mc_folderexists \{foldername = $memcard_content_name}
		if NOT mc_spacefornewfolder \{desc = guitarcontent}
			memcard_error \{error = create_out_of_space_menu
				params = {
					message_type = progress
				}}
		endif
	endif
	memcard_sequence_quit
	printf \{channel = jam_mode
		qs(0xe4d22b14)}
endscript

script memcard_sequence_begin_load_jam_logic \{storageselectorforce = 0
		controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x1be7f8f0)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_load_jam_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = jam}
	jam_memcard_validate_card_data <...>
	goto \{memcard_load_jam}
endscript

script memcard_load_jam 
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcardsavingorloading = loading}
	memcard_check_for_card
	resettimer
	printf \{channel = jam_mode
		qs(0xc201140a)}
	memcard_enum_folders
	create_load_file_menu
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	mc_loadtocinactivefolder
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	loadfrommemorycard \{filename = $memcard_jamsession_file_name
		filetype = jamsession}
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	change \{jam_selected_song = $memcard_jamsession_file_name}
	printf \{channel = jam_mode
		qs(0x21ff1e27)}
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	create_load_success_menu
	wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_sequence_begin_rename_jam_logic \{controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x1be7f8f0)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_rename_jam_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = jam}
	jam_memcard_validate_card_data <...>
	goto \{memcard_rename_jam}
endscript

script memcard_rename_jam 
	printf \{channel = jam_mode
		qs(0x2e8352e2)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcardsavingorloading = loading}
	memcard_check_for_card
	resettimer
	printf \{channel = jam_mode
		qs(0x56078b7d)}
	memcard_enum_folders
	create_save_menu
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	mc_loadtocinactivefolder
	mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	renamememcardfile \{filename = $memcard_jamsession_file_name
		filetype = jamsession
		newfilename = $memcard_jamsession_new_file_name}
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	savetomemorycard \{filename = $memcard_jamsession_new_file_name
		filetype = jamsession
		usepaddingslot = never}
	if (<result> = false)
		if (<errorcode> = outofspace)
			memcard_error \{error = create_out_of_space_menu}
		else
			if (<overwrite> = 1)
				memcard_error \{error = create_overwrite_failed_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	change \{jam_selected_song = $memcard_jamsession_new_file_name}
	change \{memcard_jamsession_file_name = $memcard_jamsession_new_file_name}
	getmemcarddirectorylisting
	jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
	change jam_curr_directory_listing = <directorylisting>
	printf \{channel = jam_mode
		qs(0x6c35e2b6)}
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	create_rename_success_menu
	guitar_memcard_save_success_sound
	wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_sequence_begin_delete_jam_logic \{controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0xb777ae6b)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_delete_jam_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = jam}
	jam_memcard_validate_card_data <...>
	goto \{memcard_delete_jam}
endscript

script memcard_delete_jam 
	printf \{channel = jam_mode
		qs(0x45db1907)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcardsavingorloading = saving}
	memcard_check_for_card
	resettimer
	memcard_enum_folders
	create_delete_menu
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	mc_loadtocinactivefolder
	mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	deletememcardfile \{filename = $memcard_jamsession_file_name
		filetype = jamsession}
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		elseif (<errorcode> = badfolder)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_save_failed_menu}
		endif
	endif
	getmemcarddirectorylisting
	jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
	change jam_curr_directory_listing = <directorylisting>
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	create_delete_success_menu
	guitar_memcard_save_success_sound
	wait \{1
		seconds}
	memcard_sequence_quit
	printf \{channel = jam_mode
		qs(0x6b4e39fd)}
endscript

script memcard_sequence_begin_ss_load_logic \{controller = $primary_controller}
	printf \{'memcard_sequence_begin_ss_load_logic'}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_ss_load_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = `default`}
	if memcard_get_new_secondary_signin
		change \{memcardsuccess = false}
		change memcardcontroller = <controller>
		if gotparam \{more_to_come}
			change \{memcarddonescript = memcard_sequence_begin_ss_load_logic}
		endif
	else
		change \{memcardsuccess = true}
		mark_safe_for_shutdown
		memcard_sequence_generic_done
		return
	endif
	memcard_validate_card_data \{storageselectorforce = 0
		validateprev = 0}
	if (<found> = 1)
		goto \{memcard_load_file
			params = {
				loadconfirmed = 1
			}}
	else
		goto \{memcard_save_file}
	endif
endscript
new_secondary_signin_states = [
	none
	none
	none
	none
]

script memcard_secondary_signin_first_press 
	printf \{'memcard_secondary_signin_first_press'}
	if isps3
		return \{false}
	endif
	if ($primary_controller_assigned = 1)
		getarraysize \{$new_secondary_signin_states}
		i = 0
		begin
		if NOT (<i> = $primary_controller)
			if checkforsignin local controller_index = <i>
				setarrayelement arrayname = new_secondary_signin_states globalarray index = <i> newvalue = signin
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script memcard_handle_secondary_signin 
	printf 'memcard_handle_secondary_signin %d' d = <controller>
	if isps3
		return \{false}
	endif
	if checkforsignin local controller_index = <controller>
		setarrayelement arrayname = new_secondary_signin_states globalarray index = <controller> newvalue = signin
	else
		get_savegame_from_controller controller = <controller>
		reset_globaltags savegame = <savegame>
		setarrayelement arrayname = new_secondary_signin_states globalarray index = <controller> newvalue = none
	endif
	killspawnedscript \{name = memcard_handle_secondary_signin_spawned}
	spawnscriptnow \{memcard_handle_secondary_signin_spawned}
endscript

script memcard_handle_secondary_signin_spawned 
	wait_for_blade_complete
	ui_event_get_stack
	if NOT ((<stack> [0].base_name) = 'band_mode')
		return
	endif
	memcard_load_any_secondary_signins
endscript

script memcard_load_any_secondary_signins 
	scriptassert \{qs(0x2c2b1078)}
	printf \{'memcard_load_any_secondary_signins'}
	if isps3
		return \{false}
	endif
	getarraysize \{$new_secondary_signin_states}
	i = 0
	begin
	if (($new_secondary_signin_states) [<i>] = signin)
		ui_memcard_secondary_siginin_load \{event = menu_back}
		return \{true}
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script memcard_get_new_secondary_signin 
	printf \{'memcard_get_new_secondary_signin'}
	if isps3
		return \{false}
	endif
	getarraysize \{$new_secondary_signin_states}
	i = 0
	begin
	if (($new_secondary_signin_states) [<i>] = signin)
		if gotparam \{controller}
			more_to_come = 1
		else
			setarrayelement arrayname = new_secondary_signin_states globalarray index = <i> newvalue = none
			controller = <i>
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	if gotparam \{controller}
		return true more_to_come = <more_to_come> controller = <controller>
	endif
	return \{false}
endscript

script guitar_memcard_save_success_sound 
	soundevent \{event = save_confirmed_sfx}
endscript

script dim_save_option_for_guest 
	if isxenon
		if netsessionfunc \{func = xenonisguest
				params = {
					controller_index = $primary_controller
				}}
			if gotparam \{popup_warning_child_index}
				getscreenelementchildren id = <menu_id>
				(<children> [<popup_warning_child_index>]) :se_setprops not_focusable
			endif
			return \{not_focusable = 1}
		endif
	endif
endscript
