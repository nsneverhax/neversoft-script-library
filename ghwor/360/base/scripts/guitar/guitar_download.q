
script scan_globaltag_downloads \{async = 1}
	printf \{qs(0xd96ce4ee)}
	pushunsafeforshutdown \{context = scan_globaltag_downloads}
	lockglobaltags \{OFF}
	if GotParam \{dlc_scan}
		lockglobaltags \{freeplay_check_off}
	endif
	get_num_savegames
	if (<num_savegames> > 0)
		savegame = 0
		amount = 1
		begin
		conditional_async_wait async = <async> text = qs(0xde444e7d) frame_length = -1
		<idx> = 0
		begin
		if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> start = <idx> count = <amount>
			break
		endif
		conditional_async_wait async = <async> text = qs(0xf5691dbe) frame_length = 8
		<idx> = (<idx> + <amount>)
		repeat
		<savegame> = (<savegame> + 1)
		repeat (<num_savegames>)
	endif
	if GotParam \{dlc_scan}
		lockglobaltags \{freeplay_check_on}
	endif
	lockglobaltags
	popunsafeforshutdown \{context = scan_globaltag_downloads}
endscript

script abort_for_signout 
	RequireParams \{[
			controller
		]
		all}
	if isXenon
		if NOT islocallysignedin controller = <controller>
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script should_ignore_warning 
	if ScriptIsRunning \{band_lobby_end_game}
		return \{true}
	endif
	if ScriptIsRunning \{band_lobby_end_game_spawned}
		return \{true}
	endif
	if ScriptIsRunning \{net_party_lost_party_connection}
		return \{true}
	endif
	if ScriptIsRunning \{net_party_lost_party_connection_kill_popup}
		return \{true}
	endif
	return \{FALSE}
endscript
g_numsongsinlibrary = 0

script Downloads_EnumContent controller = ($primary_controller) async = 1 manifest_enumeration = 1
	marketplacebgmonitorfunc \{func = reset_enumerate_state}
	Downloads_UnloadContent
	if demobuild
		return
	endif
	pushunsafeforshutdown \{context = EnumContentFiles}
	contentfoldermanager \{func = enumerate_folders}
	begin
	if contentfoldermanager \{func = is_enumeration_finished}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	printf \{'enumerate_folders finished'}
	if (<manifest_enumeration> = 1)
		if NOT contentfoldermanager \{func = is_any_folder_damaged}
			printf \{'EnumContentFiles found no damaged folders, continue with manifest checking'}
			contentfoldermanager \{func = list_folder_states}
			contentfoldermanager \{func = resolve_folders_using_manifest
				manifest_array_name = known_dlc_manifest}
			contentfoldermanager \{func = list_folder_states}
			contentfoldermanager \{func = add_manifest_pak_files_for_unresolved_folders}
			contentfoldermanager \{func = count_unresolved_folders}
			last_num_unresolved_folders = <num_unresolved_folders>
			begin
			printf qs(0x65ebbc13) d = <num_unresolved_folders>
			if (<num_unresolved_folders> = 0)
				break
			endif
			contentfoldermanager \{func = generate_random_manifest_pak_name}
			printf qs(0x0b7a64c5) s = <pak_name> f = <folder_name>
			contentfoldermanager func = get_content_folder_index_from_file file = <pak_name>
			if (<device> != content)
				contentfoldermanager \{func = dump}
				contentfoldermanager \{func = mark_unknown_content_folder_damaged}
				ScriptAssert qs(0x1513cfec) s = <pak_name>
			endif
			printf 'load manifest pak %s' s = <pak_name>
			pushunsafeforshutdown \{context = dlc_manifest_load_pak}
			if NOT LoadPakAsync pak_name = <pak_name> Heap = heap_downloads async = 1
				popunsafeforshutdown \{context = dlc_manifest_load_pak}
				popunsafeforshutdown \{context = gameplay
					Type = unchecked}
				contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
				contentfoldermanager \{func = dump}
				printf qs(0x25f9b95b) a = <pak_name> b = <folder_name>
			else
				popunsafeforshutdown \{context = dlc_manifest_load_pak}
				if GlobalExists \{Name = dlc_manifest}
					contentfoldermanager \{func = resolve_folders_using_manifest
						manifest_array_name = dlc_manifest}
					contentfoldermanager \{func = list_folder_states}
				else
					contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
				endif
				UnloadPakAsync pak_name = <pak_name>
			endif
			contentfoldermanager \{func = count_unresolved_folders}
			printf qs(0xa979647c) d = <num_unresolved_folders>
			if (<num_unresolved_folders> < <last_num_unresolved_folders>)
			else
				break
			endif
			last_num_unresolved_folders = <num_unresolved_folders>
			repeat
			if (<num_unresolved_folders> > 0)
				printf \{qs(0x2e88107e)}
				contentfoldermanager \{func = mark_unresolved_folders_as_damaged}
			endif
		endif
	else
		contentfoldermanager \{func = list_folder_states}
		contentfoldermanager \{func = resolve_folders_individually}
		begin
		if contentfoldermanager \{func = is_enumeration_finished}
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	popunsafeforshutdown \{context = EnumContentFiles}
	if abort_for_signout controller = <controller>
		if ($respond_to_signin_changed_all_players = 0)
			if NOT ($respond_to_signin_changed_func = None)
				return
			endif
		endif
	endif
	if contentfoldermanager \{func = is_any_folder_damaged}
		printf \{qs(0xd7a91396)}
		if GotParam \{savegame_ui_savegame}
			savegame_ui_end savegame = <savegame_ui_savegame>
			if isXenon
				exc_player_device = <savegame_ui_savegame>
			endif
		endif
		if ScreenElementExists \{id = band_lobby_desc_id}
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		endif
		if ($savegame_ui_state = boot)
			Change \{Downloads_Enumcontentfiles_Continue_Flag = 1}
			if ($primary_controller != -1)
				reset_dlc_signin_state
			endif
		elseif should_ignore_warning
		else
			contentfoldermanager \{func = get_damaged_folder_list}
			printstruct <...>
			GetArraySize <damaged_folder_list>
			if (<array_Size> > 2)
				formatText TextName = damaged_dlc_text qs(0x7ab98368) a = (<damaged_folder_list> [0]) b = (<damaged_folder_list> [1])
			elseif (<array_Size> = 2)
				formatText TextName = damaged_dlc_text qs(0xd7295ca8) a = (<damaged_folder_list> [0]) b = (<damaged_folder_list> [1])
			elseif (<array_Size> = 1)
				formatText TextName = damaged_dlc_text qs(0x9431eded) a = (<damaged_folder_list> [0])
			else
				damaged_dlc_text = qs(0x47d9238c)
			endif
			destroy_dialog_box
			create_dialog_box {
				body_text = <damaged_dlc_text>
				player_device = <exc_player_device>
				options = [
					{
						func = Downloads_Enumcontentfiles_Continue
						text = qs(0x182f0173)
					}
				]
			}
			Change \{Downloads_Enumcontentfiles_Continue_Flag = 0}
			begin
			if ($Downloads_Enumcontentfiles_Continue_Flag = 1)
				break
			endif
			if abort_for_signout controller = <controller>
				if ($respond_to_signin_changed_all_players = 0)
					if NOT ($respond_to_signin_changed_func = None)
						break
					endif
				endif
			endif
			Wait \{1
				gameframe}
			repeat
			destroy_dialog_box
		endif
		if ($shutdown_game_for_signin_change_flag = 0)
			if ScreenElementExists \{id = band_lobby_desc_id}
				band_lobby_update_button_helpers
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		endif
	endif
	printf qs(0x1fff74fe) i = ($shutdown_game_for_signin_change_flag)
	if contentfoldermanager \{func = get_latest_content_index_file}
		printf \{qs(0xf1fa201d)}
		printstruct <...>
		pushunsafeforshutdown \{context = dlc_content_load_pak}
		EnableDuplicateSymbolWarning \{OFF}
		if NOT LoadPakAsync pak_name = <FileName> Heap = heap_downloads async = 1
			EnableDuplicateSymbolWarning
			popunsafeforshutdown \{context = dlc_content_load_pak}
			popunsafeforshutdown \{context = gameplay
				Type = unchecked}
			contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
			DownloadContentLost
			return
		endif
		EnableDuplicateSymbolWarning
		popunsafeforshutdown \{context = dlc_content_load_pak}
		Change global_content_index_pak = <FileName>
		Downloads_LoadLanguageContent <...>
	else
		printf \{qs(0x62e8594a)}
	endif
	conditional_async_wait async = <async>
	cache_songsinlibrary async = <async>
	conditional_async_wait async = <async>
	if ($g_long_dlc_scan_at_boot = 1)
		pushunsafeforshutdown \{context = extra_ui_wait_for_dlc_scan}
		begin
		GetTrueElapsedTime starttime = ($g_long_dlc_scan_at_boot_start_time)
		if (<ElapsedTime> >= 1000)
			break
		endif
		printf \{'Artificial DLC UI wait... <whistles away> ... We are doing complex work, honest!'}
		Wait \{1
			gameframe}
		repeat
		popunsafeforshutdown \{context = extra_ui_wait_for_dlc_scan}
		Change \{g_long_dlc_scan_at_boot = 0}
	endif
	if ScriptExists \{Downloads_Startup}
		Downloads_Startup
	endif
	Downloads_PostEnumContent
endscript

script destroy_downloads_EnumContent 
	KillSpawnedScript \{Name = Downloads_EnumContent}
	KillSpawnedScript \{Name = boot_download_scan}
	downloads_closeallcontentfolders
	if ($Downloads_Enumcontentfiles_Continue_Flag = 0)
		destroy_dialog_box
		Change \{Downloads_Enumcontentfiles_Continue_Flag = 1}
	endif
endscript

script Downloads_LoadLanguageContent 
	formatText TextName = pakname '%s_text.pak' s = <stem>
	contentfoldermanager func = get_content_folder_index_from_file file = <pakname>
	if (<device> = content)
		printf qs(0x6af97d82) s = <pakname>
		pushunsafeforshutdown \{context = dlc_content_load_language_pak}
		EnableDuplicateSymbolWarning \{OFF}
		if NOT LoadPakAsync pak_name = <pakname> Heap = heap_downloads async = 1
			EnableDuplicateSymbolWarning
			popunsafeforshutdown \{context = dlc_content_load_language_pak}
			popunsafeforshutdown \{context = gameplay
				Type = unchecked}
			contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
			DownloadContentLost
			return
		endif
		EnableDuplicateSymbolWarning
		Change global_content_index_pak_language = <pakname>
		popunsafeforshutdown \{context = dlc_content_load_language_pak}
	else
		printf qs(0x3906d03d) s = <pakname>
	endif
endscript

script Downloads_PostEnumContent 
	scan_globaltag_downloads \{dlc_scan}
endscript
Downloads_Enumcontentfiles_Continue_Flag = 1

script Downloads_Enumcontentfiles_Continue 
	Change \{Downloads_Enumcontentfiles_Continue_Flag = 1}
endscript

script Downloads_UnloadContent 
	if ScriptExists \{downloads_shutdown}
		downloads_shutdown
	endif
	if NOT ($global_content_index_pak = 'none')
		UnLoadPak ($global_content_index_pak)
		Change \{global_content_index_pak = 'none'}
	endif
	if NOT ($global_content_index_pak_language = 'none')
		UnLoadPak ($global_content_index_pak_language)
		Change \{global_content_index_pak_language = 'none'}
	endif
	sap_unload
endscript

script Downloads_OpenContentFolder 
	pushunsafeforshutdown \{context = Downloads_OpenContentFolder}
	contentfoldermanager func = open_content_folder content_index = <content_index>
	popunsafeforshutdown \{context = Downloads_OpenContentFolder}
	if NOT (<folder_command_success> = true)
		contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
	endif
	return <folder_command_success>
endscript

script Downloads_CloseContentFolder \{Force = 0}
	pushunsafeforshutdown \{context = Downloads_CloseContentFolder}
	contentfoldermanager func = close_content_folder content_index = <content_index> Force = <Force>
	popunsafeforshutdown \{context = Downloads_CloseContentFolder}
	return <folder_command_success>
endscript

script downloads_closeallcontentfolders 
	pushunsafeforshutdown \{context = downloads_closeallcontentfolders}
	contentfoldermanager \{func = close_all_content_folders}
	popunsafeforshutdown \{context = downloads_closeallcontentfolders}
endscript

script find_instrument_index 
	return \{index = 0
		FALSE}
endscript

script store_select_downloads 
	NetSessionFunc \{func = ShowMarketPlaceUI}
	wait_for_blade_complete
	Downloads_UnloadContent
endscript

script file_media_lost_event 
	printf \{qs(0xa3c1f8a0)}
	contentfoldermanager \{func = mark_unknown_content_folder_damaged}
	DownloadContentLost
endscript

script DownloadContentLost 
	if ScriptIsRunning \{DownloadContentLost_Spawned}
		return
	endif
	printf \{'DownloadContentLost'}
	printscriptinfo \{qs(0xc68e2781)}
	sap_clearallcommands
	if ScriptIsRunning \{Downloads_EnumContent}
		contentfoldermanager \{func = mark_unknown_content_folder_damaged}
		return
	endif
	reset_dlc_signin_state
	random_on_disc = ($random_songs_on_disc_only)
	Change \{random_songs_on_disc_only = 1}
	get_random_song
	Change random_songs_on_disc_only = <random_on_disc>
	playlist_setcurrentsong song = <song>
	Change \{is_changing_levels = 0}
	Change \{practice_songpreview_changing = 0}
	SpawnScriptNow \{noqbid
		DownloadContentLost_Spawned}
	KillSpawnedScript \{Name = DownloadContentLost}
endscript

script DownloadContentLost_Spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{'DownloadContentLost_Spawned'}
	if NOT ($shutdown_game_for_signin_change_flag = 0)
		return
	endif
	printf \{'DownloadContentLost_Spawned shutdown_game_for_signin_change_flag==0'}
	Change \{respond_to_signin_changed = 0}
	printf \{qs(0x8a0f6c71)}
	disable_pause
	KillSpawnedScript \{Name = songlist_item_add_to_playlist}
	shutdown_preview_monitor
	KillSpawnedScript \{Name = ui_create_play_song_spawned}
	KillSpawnedScript \{Name = restart_song}
	KillSpawnedScript \{Name = start_gem_scroller}
	KillSpawnedScript \{Name = guitar_startup_spawned}
	Change \{disable_note_input = 0}
	previewassetcache \{func = cancel_all_requests}
	previewassetcache \{func = unload_all}
	previewassetcache \{func = shutdown}
	if memheapexists \{Name = heap_preview_assets}
		memdeleteheap \{Name = heap_preview_assets}
	endif
	destroy_loading_screen \{wait_for_unload}
	create_bink_sub_heaps
	create_loading_screen \{loading_screen_type = static}
	ui_event_block \{event = menu_back
		data = {
			state = uistate_null
		}}
	downloads_closeallcontentfolders
	shutdown_game_for_signin_change
	ui_event_block \{event = menu_change
		data = {
			state = uistate_signin_changed
		}}
	destroy_loading_screen \{wait_for_unload}
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_downloadcontentlost_menu
	StartRendering
	SetButtonEventMappings \{unblock_menu_input}
	printf \{qs(0xc68e2781)}
endscript

script create_downloadcontentlost_menu 
	destroy_dialog_box
	destroy_friend_feed
	fadetoblack \{On
		time = 0
		alpha = 1.0
		z_priority = 0}
	contentfoldermanager \{func = get_damaged_folder_list}
	printstruct <...>
	GetArraySize <damaged_folder_list>
	if (<array_Size> > 2)
		formatText TextName = damaged_dlc_text qs(0x7f2647d4) a = (<damaged_folder_list> [0]) b = (<damaged_folder_list> [1])
	elseif (<array_Size> = 2)
		formatText TextName = damaged_dlc_text qs(0xc4b59ade) a = (<damaged_folder_list> [0]) b = (<damaged_folder_list> [1])
	elseif (<array_Size> = 1)
		formatText TextName = damaged_dlc_text qs(0x54f0360d) a = (<damaged_folder_list> [0])
	else
		damaged_dlc_text = qs(0x9772e886)
	endif
	create_dialog_box {
		heading_text = qs(0x10facad3)
		body_text = <damaged_dlc_text>
		options = [
			{
				func = downloadcontentlost_menu_continue
				text = qs(0x182f0173)
			}
		]
	}
endscript

script downloadcontentlost_menu_continue 
	fadetoblack \{OFF
		time = 0
		no_wait}
	signing_change_confirm_reboot
endscript
