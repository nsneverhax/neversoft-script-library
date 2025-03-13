memcard_default_title = 'Guitar Hero 5'
memcard_content_name = qs(0x7235ca15)
memcard_content_jamsession_name = qs(0xcf50afcb)
memcard_file_name = qs(0x2d2b0ef3)
required_trophy_pack_size = 57671680
memcard_file_types = [
	{
		name = progress
		version = 58
		fixed_size = 2097152
		use_temp_pools = false
		is_binary_file = true
		num_bytes_per_frame = 102400
	}
	{
		name = jamsession
		version = 82
		fixed_size = 1150976
		use_temp_pools = false
		is_binary_file = false
		num_bytes_per_frame = 102400
	}
	{
		name = jamsessionpatterns
		version = 82
		fixed_size = 1150976
		use_temp_pools = false
		is_binary_file = false
		num_bytes_per_frame = 102400
	}
]
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
			{
				name = jamsessionpatterns
				slots_reserve = 0
			}
		]
	}
}

script memcard_choose_storage_device \{storageselectorforce = 0
		storageselectortry = 0}
	printscriptinfo \{qs(0x10bc9129)}
	mc_setactiveplayer userid = ($memcardcontroller)
	if NOT mc_hasvalidstoragedevice
		if NOT gotparam \{invalid_device_okay}
			if (<storageselectorforce> = 0)
				goto \{create_storagedevice_warning_menu}
			endif
		endif
	endif
	dump
	no_storage_device = 0
	if NOT mc_hasvalidstoragedevice
		no_storage_device = 1
	endif
	if ((<storageselectorforce> = 1) || (<no_storage_device> = 1) || (<storageselectortry> = 1))
		showstorageselector force = <storageselectorforce> try = <storageselectortry> filetype = progress
	endif
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
	get_savegame_from_controller controller = ($memcardcontroller)
	memcard_enum_folders
	<overwrite> = 0
	if mc_folderexists \{foldername = $memcard_content_name}
		if (<overwriteconfirmed> = 1)
			<overwrite> = 1
			savegame_ui_begin savegame = <savegame> text = qs(0x93e360b9)
			onexitrun savegame_ui_end params = {savegame = <savegame>}
			resettimer
			mc_setactivefolder \{foldername = $memcard_content_name}
		else
			goto \{create_confirm_overwrite_menu}
		endif
	else
		if NOT mc_spacefornewfolder \{desc = guitarcontent}
			memcard_error \{error = create_out_of_space_menu}
		endif
		savegame_ui_begin savegame = <savegame> text = qs(0x93e360b9)
		onexitrun savegame_ui_end params = {savegame = <savegame>}
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
	endif
	mc_setactivefolder \{foldername = $memcard_content_name}
	mc_loadtocinactivefolder
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
	memcard_pre_save_progress savegame = ($memcardcontroller)
	savetomemorycard \{filename = $memcard_file_name
		filetype = progress
		usepaddingslot = always}
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
	memcard_post_save_progress savegame = <savegame>
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	guitar_memcard_save_success_sound
	savegame_ui_end savegame = <savegame>
	wait \{15
		gameframes}
	memcard_sequence_quit
endscript

script memcard_delete_file \{file_type = `default`}
	printf \{qs(0x810fae7c)}
	mark_unsafe_for_shutdown
	get_savegame_from_controller controller = ($memcardcontroller)
	savegame_ui_begin savegame = <savegame> text = qs(0x4acaa8b9) hide_on_ps3
	onexitrun savegame_ui_end params = {savegame = <savegame>}
	mc_waitasyncopsfinished
	if isps3
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
			endif
		endif
	endif
	if notcd
		deleteallsongdatafromfile
	endif
	if ($memcard_boot_process = false)
		memcard_check_for_card
	endif
	memcard_sequence_retry
endscript

script memcard_load_file 
	mark_unsafe_for_shutdown
	printf \{qs(0x03a3bf83)}
	change \{memcardsavingorloading = loading}
	mc_waitasyncopsfinished
	memcard_validate_card_data invalid_device_okay = 1 storageselectorforce = <storageselectorforce> validateprev = 0
	resettimer
	if mc_folderexists \{foldername = $memcard_content_name}
		mc_setactivefolder \{foldername = $memcard_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	mc_setactivefolder \{foldername = $memcard_content_name}
	get_savegame_from_controller controller = ($memcardcontroller)
	savegame_ui_begin savegame = <savegame> text = qs(0xc8aec9d3)
	onexitrun savegame_ui_end params = {savegame = <savegame>}
	if gotparam \{boot_load}
		printf 'Setting primary controller at boot: %d' d = <savegame>
		change_primary_controller controller = <savegame>
	endif
	memcard_pre_load_progress savegame = <savegame>
	loadfrommemorycard \{filename = $memcard_file_name
		filetype = progress}
	if (<result> = false)
		memcard_post_load_progress_failed savegame = <savegame>
		if gotparam \{boot_load}
		endif
		if gotparam \{boot_load}
			mc_invalidatestoragedevice userid = <savegame>
			memcard_wait_for_timer \{time = 1.0}
			memcard_sequence_quit
		else
			if (<errorcode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu}
			else
				memcard_error \{error = create_load_failed_menu}
			endif
		endif
	endif
	get_savegame_from_controller controller = ($memcardcontroller)
	if gotparam \{boot_load}
		change \{primary_controller_assigned = 1}
	endif
	memcard_post_load_progress savegame = <savegame> boot_load = <boot_load>
	if gotparam \{boot_load}
		change \{primary_controller_assigned = 0}
	endif
	change \{memcardsuccess = true}
	memcard_wait_for_timer \{time = 1.0}
	memcard_sequence_quit
endscript

script memcard_load_file_confirmed 
	memcard_cleanup_messages
	memcard_load_file \{storageselectorforce = 1}
endscript

script memcard_pre_save_progress 
	globaltag_sanity_check_pre_save savegame = <savegame>
endscript

script memcard_post_save_progress \{savegame_async = 0}
	setglobaltags savegame = <savegame> user_options params = {autosave = 1}
	setglobaltags savegame = <savegame> user_options params = {has_saved_game = 1}
	change \{cas_logo_data_dirty = 0}
	if NOT refresh_jam_directory_contents savegame = <savegame> no_enumeration savegame_async = <savegame_async>
		return false jamerrorcode = <errorcode>
	endif
	return \{true}
endscript

script memcard_pre_load_progress 
	lockglobaltags \{freeplay_check_off}
endscript

script memcard_post_load_progress_failed 
	lockglobaltags \{freeplay_check_on}
endscript

script memcard_post_load_progress \{savegame_async = 0
		boot_load = 0}
	if isxenonorwindx
		if (($primary_controller) = <savegame>)
			restore_globals_from_global_tags savegame = <savegame>
		endif
	else
		restore_globals_from_global_tags savegame = <savegame>
	endif
	scan_globaltag_downloads
	globaltag_update_avatar_metadata savegame = <savegame>
	if ($override_band_members = 1)
		setup_band_member_tags savegame = <savegame>
	endif
	if NOT isavatarsysteminitialized
		remove_avatars_from_band savegame = <savegame>
	endif
	reset_transient_tags savegame = <savegame>
	fix_deleted_character_savegame savegame = <savegame>
	check_cas \{savegames}
	setglobaltags savegame = <savegame> user_options params = {autosave = 1}
	setglobaltags savegame = <savegame> user_options params = {has_saved_game = 1}
	lockglobaltags \{freeplay_check_on}
	ignore_failure = 0
	if (<boot_load> = 1)
		<ignore_failure> = 1
	endif
	if NOT refresh_jam_directory_contents savegame = <savegame> no_enumeration savegame_async = <savegame_async> ignore_failure = <ignore_failure>
		if (<boot_load> = 1)
			printf \{channel = bkutcher
				qs(0x870823ba)}
			reset_savegame savegame = <savegame>
		endif
		return false jamerrorcode = <errorcode>
	endif
	return \{true}
endscript

script memcard_boot_scan 
	if (($savegame_ui_state) != boot)
		scriptassert \{'Should be in boot UI state'}
	endif
	gettruestarttime
	savegame_ui_begin \{text = qs(0xfa4a9022)}
	onexitrun \{savegame_ui_end}
	success = 0
	if savegame_scan_all_players_for_progress_save
		if isxenonorwindx
			change memcardcontroller = <userid>
		endif
		goto \{memcard_load_file
			params = {
				boot_load = 1
			}}
		return
	else
		if gotparam \{errorcode}
			printf 'ui_create_savegame_boot_scan_spawned: savegame had errors %s' s = <errorcode>
			printf \{'ui_create_savegame_boot_scan_spawned: error loading up savegame'}
			memcard_sequence_quit
			return
		else
			wait_at_least_x_ms starttime = <starttime> at_least = 3000
			printf \{'ui_create_savegame_boot_scan_spawned: savegame not found'}
			memcard_sequence_quit
		endif
	endif
endscript

script refresh_autokick_cheat 
	controller = 0
	max_controllers = 4
	begin
	if checkforsignin local controller_index = <controller>
		getsavegamefromcontroller controller = <controller>
		getglobaltags user_options savegame = <savegame>
		if (<unlock_cheat_autokick> = 1 && <cheat_index12> = 1)
			get_local_player_num_from_controller controller_index = <controller>
			setplayerinfo <local_player_num> cheat_autokick = 1
		else
			setplayerinfo <local_player_num> cheat_autokick = 0
		endif
		if (<unlock_cheat_alwaysslide> = 1 && <cheat_index1> = 1)
			get_local_player_num_from_controller controller_index = <controller>
			setplayerinfo <local_player_num> cheat_alwaysslide = 1
		else
			setplayerinfo <local_player_num> cheat_alwaysslide = 0
		endif
	endif
	controller = (<controller> + 1)
	repeat <max_controllers>
endscript

script refresh_all_cheats_globals 
	getplayerinfo \{1
		controller}
	if checkforsignin local controller_index = <controller>
		getsavegamefromcontroller controller = <controller>
		getglobaltags user_options savegame = <savegame>
		getarraysize ($guitar_hero_cheats)
		guitar_hero_cheats_size = <array_size>
		if (<guitar_hero_cheats_size> > 0)
			guitar_hero_cheat_index = 0
			begin
			formattext checksumname = cheat_unlocked 'unlock_Cheat_%a' a = ($guitar_hero_cheats [<guitar_hero_cheat_index>].name)
			if gotparam <cheat_unlocked>
				if ((<...>.<cheat_unlocked>) > 0)
					var = ($guitar_hero_cheats [<guitar_hero_cheat_index>].var)
					formattext checksumname = cheat_index_crc 'cheat_index%d' d = <guitar_hero_cheat_index>
					cheat_index = (<...>.<cheat_index_crc>)
					if structurecontains structure = ($guitar_hero_cheats [<guitar_hero_cheat_index>]) options
						globals = ($guitar_hero_cheats [<guitar_hero_cheat_index>].options [<cheat_index>].globals)
						getarraysize <globals>
						if (<array_size> > 0)
							globals_index = 0
							begin
							if (<globals> [<globals_index>].set = <var>)
								change globalname = <var> newvalue = (<globals> [<globals_index>].value)
								break
							endif
							globals_index = (<globals_index> + 1)
							repeat <array_size>
						endif
					endif
				endif
			endif
			guitar_hero_cheat_index = (<guitar_hero_cheat_index> + 1)
			repeat <guitar_hero_cheats_size>
		endif
	endif
endscript

script memcard_cleanup_messages 
	destroy_dialog_box
endscript

script memcard_sequence_generic_done 
	if ($memcardsavingorloading = saving)
		if ($memcardsuccess = true)
			printf \{qs(0xe2a29101)}
			ui_memcard_finish success = save controller = ($memcardcontroller)
		else
			printf \{qs(0x9f566822)}
			if ($memcardinvalfolderonfail = true)
				mc_setactivefolder \{folderindex = -1}
			endif
			ui_memcard_finish failed = save controller = ($memcardcontroller)
		endif
	else
		if ($memcardsuccess = true)
			printf \{qs(0x0e63bd4a)}
			ui_memcard_finish success = load controller = ($memcardcontroller)
		else
			printf \{qs(0x264adb01)}
			if ($memcardinvalfolderonfail = true)
				mc_setactivefolder \{folderindex = -1}
			endif
			ui_memcard_finish failed = load controller = ($memcardcontroller)
		endif
	endif
endscript

script memcard_sequence_retry 
	printf \{qs(0x879b8ee7)}
	memcard_cleanup_messages
	mc_waitasyncopsfinished
	goto $memcardretryscript params = {<...> controller = ($memcardcontroller)}
endscript

script memcard_disable_saves_and_quit 
	hide_glitch \{num_frames = 20}
	get_savegame_from_controller controller = ($memcardcontroller)
	lockglobaltags \{freeplay_check_off}
	setglobaltags savegame = <savegame> user_options params = {autosave = 0}
	lockglobaltags \{freeplay_check_on}
	memcard_sequence_quit
endscript

script memcard_sequence_quit 
	printf \{qs(0x5dba2148)}
	mark_safe_for_shutdown
	goto $memcarddonescript params = <...>
endscript

script memcard_check_for_card 
	if NOT mc_hasvalidstoragedevice
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
	if screenelementexists \{id = loading_screen_container}
		loading_screen_container :se_setprops \{z_priority = 0}
	endif
	if scriptisrunning \{guitar_startup_spawned}
		spawnscriptnow \{memcard_handle_intro_movie}
	endif
	goto <error> params = <params>
endscript

script memcard_handle_intro_movie 
	printf \{'memcard_handle_intro_movie'}
	setscriptcannotpause
	setbuttoneventmappings \{block_menu_input}
	printf \{'memcard_handle_intro_movie - waiting for startup to finish'}
	begin
	if NOT ismovieplaying \{textureslot = 2}
		break
	endif
	wait \{1
		gameframe}
	repeat
	printf \{'memcard_handle_intro_movie - done with startup movie'}
	setbuttoneventmappings \{unblock_menu_input}
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
	get_savegame_from_controller controller = ($memcardcontroller)
	if isps3
		if NOT gotparam \{no_ui_on_ps3}
			gettruestarttime
			savegame_ui_begin savegame = <savegame> text = qs(0x54b62ebd)
			onexitrun savegame_ui_end params = {savegame = <savegame>}
			wait_at_least_x_ms starttime = <starttime> at_least = 1000
		endif
	endif
	memcard_choose_storage_device storageselectorforce = <storageselectorforce> storageselectortry = <storageselectortry> invalid_device_okay = <invalid_device_okay>
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
			refresh_jam_directory_contents \{ignore_failure = 1}
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

script reload_jam_patterns 
	if NOT musicstudio_mainobj :musicstudio_isinmusicstudio
		return
	endif
	loadfrommemorycard \{filename = $memcard_jamsession_file_name_patterns
		filetype = jamsessionpatterns}
	if (<result> = true)
		printf \{qs(0x148b91db)}
	else
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
		endif
	endif
endscript

script refresh_jam_directory_contents \{savegame_async = 0
		ignore_failure = 0}
	printscriptinfo \{'refresh_jam_directory_contents'}
	if (($memcardcontroller) = ($primary_controller))
		update_curr_listing = 1
	endif
	jam_reset_controller_directory_listing controller = ($memcardcontroller)
	if gotparam \{update_curr_listing}
		change \{jam_curr_directory_listing = [
			]}
	endif
	if NOT gotparam \{no_enumeration}
		memcard_enum_folders
	endif
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
		mc_loadtocinactivefolder
		getmemcarddirectorylisting
		if ((<ignore_failure> = 1) || (<savegame_async> = 1))
			if (<result> = false)
				return false errorcode = <errorcode>
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
			return false errorcode = <errorcode>
		endif
		if NOT (<result> = false)
			if gotparam \{directorylisting}
				jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
				if gotparam \{update_curr_listing}
					musicstudio_copy_curr_directory_listing directorylisting = <directorylisting>
				endif
			endif
		endif
	endif
	return \{true}
endscript

script memcard_sequence_begin_single_signin 
	spawnscriptnow memcard_sequence_begin_single_signin_logic params = <...>
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

script memcard_sequence_begin_boot 
	spawnscriptnow memcard_sequence_begin_boot_logic params = <...>
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

script memcard_sequence_begin_lobby_error 
	spawnscriptnow memcard_sequence_begin_lobby_error_logic params = <...>
endscript

script memcard_sequence_begin_single_signin_logic \{controller = $primary_controller}
	printscriptinfo \{qs(0xbc135bc3)}
	printstruct <...>
	mc_getactiveplayer
	mc_waitasyncopsfinished
	mark_unsafe_for_shutdown
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_single_signin_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardsigningin = true}
	change \{memcardjamordefault = `default`}
	change \{memcardinvalfolderonfail = true}
	memcard_validate_card_data invalid_device_okay = 1 storageselectorforce = <storageselectorforce> validateprev = 0
	if (<found> = 1)
		goto \{memcard_load_file}
	else
		goto \{memcard_save_file}
	endif
endscript

script memcard_sequence_begin_save_logic \{storageselectorforce = 0
		controller = $primary_controller
		overwriteconfirmed = 0}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardsigningin = false}
	change \{memcardjamordefault = `default`}
	if (<overwriteconfirmed> = 0)
		change \{memcardinvalfolderonfail = false}
		storageselectorforce = 1
	else
		change \{memcardinvalfolderonfail = true}
	endif
	get_savegame_from_controller controller = <controller>
	if is_autosave_on savegame = <savegame>
		validateprev = 1
	else
		validateprev = 0
	endif
	memcard_validate_card_data storageselectorforce = <storageselectorforce> storageselectortry = <storageselectortry> validateprev = 1
	goto memcard_save_file params = {overwriteconfirmed = <overwriteconfirmed>}
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
	change \{memcardsigningin = false}
	change \{memcardjamordefault = `default`}
	change \{memcardinvalfolderonfail = true}
	get_savegame_from_controller controller = <controller>
	getglobaltags user_options savegame = <savegame>
	if (<autosave> = 0 && <requested_autosave> = 0)
		printf \{qs(0x4c1699ec)}
		goto \{memcard_sequence_quit}
	endif
	mc_setactiveplayer userid = <controller>
	if NOT mc_hasvalidstoragedevice
		goto \{create_storagedevice_warning_menu}
	endif
	memcard_validate_card_data \{storageselectorforce = 0
		validateprev = 1}
	if (<found> = 1)
		goto \{memcard_save_file
			params = {
				overwriteconfirmed = 1
				autosave = 1
			}}
	else
		memcard_sequence_retry
	endif
endscript

script memcard_sequence_begin_load_logic \{storageselectorforce = 1
		show_confirm_dialog = 0
		controller = $primary_controller}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_load_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardsigningin = false}
	change \{memcardjamordefault = `default`}
	if (<show_confirm_dialog> = 1)
		change \{memcardinvalfolderonfail = false}
	else
		change \{memcardinvalfolderonfail = true}
	endif
	if (<show_confirm_dialog> = 1)
		goto \{create_confirm_load_menu}
	else
		memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
		goto \{memcard_load_file}
	endif
endscript

script memcard_sequence_begin_boot_logic 
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_generic_done}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	change \{memcardcontroller = 0}
	change \{memcardsigningin = false}
	change \{memcardjamordefault = `default`}
	change \{memcardinvalfolderonfail = true}
	goto \{memcard_boot_scan}
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
	change \{memcardsigningin = false}
	change \{memcardjamordefault = jam}
	change \{memcardinvalfolderonfail = true}
	<card_was_in_slot> = false
	if mc_hasvalidstoragedevice
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
	if NOT gotparam \{savegame}
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	savegame_ui_begin savegame = <savegame> text = qs(0x93e360b9)
	onexitrun savegame_ui_end params = {savegame = <savegame>}
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		if (<card_was_in_slot> = false)
			if (<overwriteconfirmed> = 1)
				<overwrite> = 1
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
	change memcard_jamsession_genre = <genre>
	change memcard_jamsession_song_version = <song_version>
	change memcard_jamsession_downloaded = <downloaded>
	musicstudio_mainobj :musicstudio_getsonglength
	change memcard_jamsession_song_length = <song_length>
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
	savetomemorycard \{filename = $memcard_jamsession_file_name_patterns
		filetype = jamsessionpatterns
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
	musicstudio_update_selected_song_name filename = ($memcard_jamsession_file_name)
	getmemcarddirectorylisting
	jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
	musicstudio_copy_curr_directory_listing directorylisting = <directorylisting>
	printf \{channel = jam_mode
		qs(0x98e3ad04)}
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	guitar_memcard_save_success_sound
	change \{cas_logo_data_dirty = 0}
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
	change \{memcardsigningin = false}
	change \{memcardjamordefault = jam}
	change \{memcardinvalfolderonfail = true}
	jam_memcard_validate_card_data <...>
	goto \{memcard_load_jam}
endscript

script memcard_load_jam 
	musicstudio_mainobj :musicstudio_addsong \{song_name = $jam_selected_song}
	if (<already_loaded> = true)
		scriptassert \{qs(0xdc310379)}
	endif
	onexitrun \{exit_load_music_studio_song}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcardsavingorloading = loading}
	memcard_check_for_card
	resettimer
	get_savegame_from_controller controller = ($memcardcontroller)
	printf \{channel = jam_mode
		qs(0xc201140a)}
	memcard_enum_folders
	savegame_ui_begin savegame = <savegame> text = qs(0xc8aec9d3)
	onexitrun savegame_ui_end params = {savegame = <savegame>}
	<pattern_only_load> = false
	if (($memcard_jamsession_file_name) = ($memcard_jamsession_file_name_patterns))
		<pattern_only_load> = true
	endif
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	else
		if (<pattern_only_load> = true)
			change \{memcardsuccess = true}
			memcard_sequence_quit
		endif
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
	reload_jam_patterns <...>
	if (<pattern_only_load> = false)
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
	endif
	if (<pattern_only_load> = false)
		musicstudio_update_selected_song_name filename = ($memcard_jamsession_file_name)
	endif
	printf \{channel = jam_mode
		qs(0x21ff1e27)}
	change \{memcardsuccess = true}
	memcard_wait_for_timer \{time = 1.0}
	memcard_sequence_quit
endscript

script exit_load_music_studio_song 
	musicstudio_mainobj :musicstudio_removecurrentsong
endscript

script async_load_music_studio_song 
	musicstudio_mainobj :musicstudio_addsong song_name = <filename> mark_for_load = async
	if (<already_loaded> = true)
		printf \{qs(0xf1492eef)}
		return
	endif
	onexitrun \{exit_load_music_studio_song}
	jam_recording_create_editable_arrays
	change memcard_jamsession_file_name = <filename>
	memcard_enum_folders
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	else
		printf \{qs(0x1db3a2a4)}
		return
	endif
	mc_loadtocinactivefolder
	if (<result> = false)
		printf \{qs(0xa69ecbe4)}
		return
	endif
	mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	loadfrommemorycard filename = <filename> filetype = jamsession
	if (<result> = false)
		printf \{qs(0x7d24815b)}
		return
	endif
	printf \{qs(0x55a76790)}
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
	change \{memcardsigningin = false}
	change \{memcardjamordefault = jam}
	change \{memcardinvalfolderonfail = true}
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
	if NOT gotparam \{savegame}
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	savegame_ui_begin savegame = <savegame> text = qs(0x93e360b9)
	onexitrun savegame_ui_end params = {savegame = <savegame>}
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
	musicstudio_update_selected_song_name filename = ($memcard_jamsession_new_file_name)
	getmemcarddirectorylisting
	jam_update_controller_directory_listing controller = ($memcardcontroller) directorylisting = <directorylisting>
	musicstudio_copy_curr_directory_listing directorylisting = <directorylisting>
	printf \{channel = jam_mode
		qs(0x6c35e2b6)}
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	guitar_memcard_save_success_sound
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
	change \{memcardsigningin = false}
	change \{memcardjamordefault = jam}
	change \{memcardinvalfolderonfail = true}
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
	if NOT gotparam \{savegame}
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	savegame_ui_begin savegame = <savegame> text = qs(0x4acaa8b9)
	onexitrun savegame_ui_end params = {savegame = <savegame>}
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
	musicstudio_copy_curr_directory_listing directorylisting = <directorylisting>
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	guitar_memcard_save_success_sound
	memcard_sequence_quit
	printf \{channel = jam_mode
		qs(0x6b4e39fd)}
endscript

script memcard_sequence_begin_lobby_error_logic \{storageselectorforce = 0}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_lobby_error}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardsigningin = false}
	change \{memcardjamordefault = `default`}
	change \{memcardinvalfolderonfail = true}
	if gotparam \{error}
		memcard_error error = <error> params = <event_params>
	else
		if (<storageselectorforce> = 1)
			memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
			if mc_hasvalidstoragedevice
				change \{g_lobby_storageselect_return_confirm = true}
			endif
		endif
		memcard_sequence_generic_done
	endif
endscript

script guitar_memcard_save_success_sound 
endscript

script dim_save_option_for_guest 
	if isxenonorwindx
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

script get_all_saving_players_controller_list 
	array = []
	addarrayelement array = <array> element = ($primary_controller)
	if isxenon
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <player> controller
			if islocallysignedin controller = <controller>
				if get_savegame_has_saved_game savegame = <controller>
					if is_autosave_on savegame = <controller>
						if NOT arraycontains array = <array> contains = <controller>
							if gotparam \{reverse_order}
								insertarrayelement array = <array> element = <controller> index = 0
							else
								addarrayelement array = <array> element = <controller>
							endif
						endif
					endif
				endif
			endif
			getnextplayer local player = <player>
			repeat <num_players>
		endif
	endif
	return controller_list = <array>
endscript
