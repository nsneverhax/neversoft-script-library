disable_download_cache = 0
g_downloads_enumcontent_fail = 0
GH4_download_songlist = [
]

script scan_globaltag_downloads \{async = 1}
	printf \{qs(0xd96ce4ee)}
	push_unsafe_for_shutdown \{reason = scan_globaltag_downloads}
	LockGlobalTags \{off}
	if GotParam \{dlc_scan}
		LockGlobalTags \{freeplay_check_off}
	endif
	get_num_savegames
	if (<num_savegames> > 0)
		savegame = 0
		amount = 1
		begin
		conditional_async_wait async = <async> text = qs(0xde444e7d) frame_length = -1
		<idx> = 0
		begin
		if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'guitar' start = <idx> count = <amount>
			break
		endif
		conditional_async_wait async = <async> text = qs(0xf5691dbe) frame_length = 8
		<idx> = (<idx> + <amount>)
		repeat
		<idx> = 0
		begin
		if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'bass' start = <idx> count = <amount>
			break
		endif
		conditional_async_wait async = <async> text = qs(0xec722cff) frame_length = 8
		<idx> = (<idx> + <amount>)
		repeat
		<idx> = 0
		begin
		if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'drum' start = <idx> count = <amount>
			break
		endif
		conditional_async_wait async = <async> text = qs(0xa333ba38) frame_length = 8
		<idx> = (<idx> + <amount>)
		repeat
		<idx> = 0
		begin
		if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'vocals' start = <idx> count = <amount>
			break
		endif
		conditional_async_wait async = <async> text = qs(0xba288b79) frame_length = 8
		<idx> = (<idx> + <amount>)
		repeat
		<idx> = 0
		begin
		if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'band' start = <idx> count = <amount>
			break
		endif
		conditional_async_wait async = <async> text = qs(0x9105d8ba) frame_length = 8
		<idx> = (<idx> + <amount>)
		repeat
		<savegame> = (<savegame> + 1)
		repeat (<num_savegames>)
	endif
	if GotParam \{dlc_scan}
		LockGlobalTags \{freeplay_check_on}
	endif
	LockGlobalTags
	pop_unsafe_for_shutdown \{reason = scan_globaltag_downloads}
endscript

script abort_for_signout 
	RequireParams \{[
			controller
		]
		all}
	if isXenon
		if NOT IsLocallySignedIn controller = <controller>
			return \{true}
		endif
	endif
	return \{false}
endscript
global_content_index_pak = 'none'
global_content_index_pak_language = 'none'

script Downloads_EnumContent controller = ($primary_controller) async = 1
	Change \{g_downloads_enumcontent_fail = 0}
	Downloads_UnloadContent
	push_unsafe_for_shutdown \{reason = EnumContentFiles}
	if EnumContentFiles
		begin
		if EnumContentFilesWaitForLoad
			break
		endif
		wait \{1
			gameframe}
		repeat
		if EnumContentFilesStart download playerid = <controller>
			if NOT EnumContentFilesFinished
				begin
				printf \{qs(0x7b5d03fb)}
				wait \{1
					gameframe}
				if EnumContentFilesFinished
					break
				endif
				repeat
			endif
		endif
	endif
	printf \{'EnumContentFiles finished'}
	WaitForAsyncLoadAndSaveToFinish
	if NOT IsEnumContentFilesDamaged
		printf \{'EnumContentFiles found no damaged folders, continue with manifest checking'}
		ListFolderStates
		ResolveFoldersUsingManifest \{manifest_array_name = known_dlc_manifest}
		ListFolderStates
		AddManifestPAKFilesForUnresolvedFolders
		CountUnresolvedFolders
		last_num_unresolved_folders = <num_unresolved_folders>
		begin
		printf qs(0x65ebbc13) d = <num_unresolved_folders>
		if (<num_unresolved_folders> = 0)
			break
		endif
		GenerateRandomManifestPAKName
		printf qs(0x0b7a64c5) s = <pak_name> f = <folder_name>
		GetContentFolderIndexFromFile <pak_name>
		if (<device> != content)
			DumpContentCache
			ScriptAssert qs(0x1513cfec) s = <pak_name>
		endif
		printf 'load manifest pak %s' s = <pak_name>
		push_unsafe_for_shutdown \{reason = dlc_manifest_load_pak}
		if NOT LoadPakAsync pak_name = <pak_name> heap = heap_downloads async = 1
			printf qs(0x25f9b95b) a = <pak_name> b = <folder_name>
			mark_safe_for_shutdown
			Change \{g_downloads_enumcontent_fail = 1}
			WaitForAsyncLoadAndSaveToFinish
			RemoveContentFiles \{clear_cache}
			WaitForAsyncLoadAndSaveToFinish
			pop_unsafe_for_shutdown \{reason = dlc_manifest_load_pak}
			break
		endif
		pop_unsafe_for_shutdown \{reason = dlc_manifest_load_pak}
		ResolveFoldersUsingManifest \{manifest_array_name = dlc_manifest}
		ListFolderStates
		UnloadPakAsync pak_name = <pak_name>
		CountUnresolvedFolders
		printf qs(0xa979647c) d = <num_unresolved_folders>
		if (<num_unresolved_folders> < <last_num_unresolved_folders>)
		else
			break
		endif
		last_num_unresolved_folders = <num_unresolved_folders>
		repeat
		if (<num_unresolved_folders> > 0)
			printf \{qs(0x2e88107e)}
			Change \{g_downloads_enumcontent_fail = 1}
			WaitForAsyncLoadAndSaveToFinish
			RemoveContentFiles \{clear_cache}
			WaitForAsyncLoadAndSaveToFinish
		endif
	endif
	pop_unsafe_for_shutdown \{reason = EnumContentFiles}
	if abort_for_signout controller = <controller>
		if ($respond_to_signin_changed_all_players = 0)
			if NOT ($respond_to_signin_changed_func = None)
				return
			endif
		endif
	endif
	if (($g_downloads_enumcontent_fail = 1) || IsEnumContentFilesDamaged)
		printf \{qs(0xd7a91396)}
		destroy_dialog_box
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
				get_savegame_from_controller controller = ($primary_controller)
				reset_savegame savegame = <savegame>
			endif
			reset_dlc_signin_state
		else
			create_dialog_box {
				body_text = qs(0xaac61d00)
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
			wait \{1
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
	if ($shutdown_game_for_signin_change_flag = 1)
		ui_event_get_top
		if (<base_name> = 'boot_download_scan')
			mark_safe_for_shutdown
		endif
		return
	endif
	if GetLatestContentIndexFile
		printf \{qs(0xf1fa201d)}
		printstruct <...>
		push_unsafe_for_shutdown \{reason = dlc_content_load_pak}
		EnableDuplicateSymbolWarning \{off}
		if NOT LoadPakAsync pak_name = <FileName> heap = heap_downloads async = 1
			EnableDuplicateSymbolWarning
			mark_safe_for_shutdown
			DownloadContentLost
			pop_unsafe_for_shutdown \{reason = dlc_content_load_pak}
			return
		endif
		EnableDuplicateSymbolWarning
		pop_unsafe_for_shutdown \{reason = dlc_content_load_pak}
		Change global_content_index_pak = <FileName>
		Downloads_LoadLanguageContent <...>
	else
		printf \{qs(0x62e8594a)}
	endif
	if ScriptExists \{Downloads_Startup}
		Downloads_Startup
	endif
	Downloads_PostEnumContent
endscript

script destroy_downloads_EnumContent 
	killspawnedscript \{name = Downloads_EnumContent}
	killspawnedscript \{name = boot_download_scan}
	CloseAllContentFolders
	if ($Downloads_Enumcontentfiles_Continue_Flag = 0)
		destroy_dialog_box
		Change \{Downloads_Enumcontentfiles_Continue_Flag = 1}
	endif
endscript

script Downloads_LoadLanguageContent 
	FormatText TextName = pakname '%s_text.pak' s = <stem>
	GetContentFolderIndexFromFile <pakname>
	if (<device> = content)
		printf qs(0x6af97d82) s = <pakname>
		push_unsafe_for_shutdown \{reason = dlc_content_load_language_pak}
		EnableDuplicateSymbolWarning \{off}
		if NOT LoadPakAsync pak_name = <pakname> heap = heap_downloads async = 1
			EnableDuplicateSymbolWarning
			mark_safe_for_shutdown
			DownloadContentLost
			pop_unsafe_for_shutdown \{reason = dlc_content_load_language_pak}
			return
		endif
		EnableDuplicateSymbolWarning
		Change global_content_index_pak_language = <pakname>
		pop_unsafe_for_shutdown \{reason = dlc_content_load_language_pak}
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
	if ScriptExists \{Downloads_Shutdown}
		Downloads_Shutdown
	endif
	if NOT ($global_content_index_pak = 'none')
		UnLoadPak ($global_content_index_pak)
		Change \{global_content_index_pak = 'none'}
	endif
	if NOT ($global_content_index_pak_language = 'none')
		UnLoadPak ($global_content_index_pak_language)
		Change \{global_content_index_pak_language = 'none'}
	endif
	SongUnload
endscript

script Downloads_OpenContentFolder 
	OpenContentFolder content_index = <content_index>
	return <folder_command_success>
endscript

script Downloads_CloseContentFolder \{Force = 0}
	CloseContentFolder content_index = <content_index>
	return <folder_command_success>
endscript

script find_instrument_index 
	return \{index = 0
		false}
endscript

script store_select_downloads 
	NetSessionFunc \{func = ShowMarketPlaceUI}
	wait_for_blade_complete
	Downloads_UnloadContent
endscript

script fmod_diskejected_event 
	printf \{qs(0x71a1ceda)}
	DownloadContentLost
endscript

script DownloadContentLost 
	printf \{'DownloadContentLost'}
	printscriptinfo \{qs(0xca95b489)}
	Change \{loadpak_lock = 0}
	reset_dlc_signin_state
	if ScriptIsRunning \{Downloads_EnumContent}
		Change \{g_downloads_enumcontent_fail = 1}
		return
	endif
	if ScriptIsRunning \{songlist_item_add_to_playlist}
		killspawnedscript \{name = songlist_item_add_to_playlist}
	endif
	if ScriptIsRunning \{song_preview_monitor}
		killspawnedscript \{name = song_preview_monitor}
	endif
	if ScriptIsRunning \{ui_create_play_song_spawned}
		killspawnedscript \{name = ui_create_play_song_spawned}
	endif
	if ScriptIsRunning \{ui_create_freeplay_spawned}
		killspawnedscript \{name = ui_create_freeplay_spawned}
	endif
	if ScriptIsRunning \{restart_song}
		killspawnedscript \{name = restart_song}
	endif
	Change \{disable_note_input = 0}
	WaitForAsyncLoadAndSaveToFinish
	Change \{is_changing_levels = 0}
	Change \{practice_songpreview_changing = 0}
	spawnscriptnow \{noqbid
		DownloadContentLost_Spawned}
	killspawnedscript \{name = DownloadContentLost}
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
	destroy_loading_screen
	BlockForScript \{destroy_loading_screen_spawned}
	create_bink_sub_heaps
	create_loading_screen \{no_bink}
	ui_event_block \{event = menu_back
		data = {
			state = UIstate_null
		}}
	shutdown_game_for_signin_change
	WaitForAsyncLoadAndSaveToFinish
	RemoveContentFiles \{clear_cache}
	WaitForAsyncLoadAndSaveToFinish
	ui_event_block \{event = menu_change
		data = {
			state = UIstate_signin_changed
			clear_previous_stack
		}}
	destroy_loading_screen \{Force = 1}
	LaunchEvent \{type = unfocus
		target = root_window}
	create_downloadcontentlost_menu
	StartRendering
	SetButtonEventMappings \{unblock_menu_input}
	printf \{qs(0xc68e2781)}
endscript

script create_downloadcontentlost_menu 
	destroy_dialog_box
	fadetoblack \{off
		time = 0.25
		no_wait}
	create_dialog_box \{heading_text = qs(0x10facad3)
		body_text = qs(0xe600d9eb)
		options = [
			{
				func = signing_change_confirm_reboot
				text = qs(0x182f0173)
			}
		]}
endscript
net_checksum_packet = [
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
	None
]
num_net_checksum_packet = 0
total_num_net_checksum_packet = 0
net_checksum_packet_for_host = 0
net_match_dlc_sync_finished = 0

script net_match_clear_available_items 
	GetSonglistSize
	song_count = 0
	begin
	GetSonglistChecksum index = <song_count>
	if GlobalTagExists <song_checksum> noassert = 1
		SetGlobalTags <song_checksum> params = {available_on_other_client = 0}
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	printf qs(0xb1f247c3) i = <array_size>
	return \{true}
endscript

script net_match_set_available_items 
	GetSonglistSize
	song_count = 0
	begin
	GetSonglistChecksum index = <song_count>
	if GlobalTagExists <song_checksum> noassert = 1
		SetGlobalTags <song_checksum> params = {available_on_other_client = 1}
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	printf qs(0xb1f247c3) i = <array_size>
	return \{true}
endscript

script set_online_available_dlc_songs 
	net_match_clear_available_items
	SonglistMatch \{func = max_songs}
	i = 0
	begin
	if (SonglistMatch func = is_match index = <i>)
		FormatText checksumname = song_name 'dlc%i' i = <i>
		SetGlobalTags <song_name> params = {available_on_other_client = 1}
	endif
	i = (<i> + 1)
	repeat <max_songs>
	Change \{net_match_dlc_sync_finished = 1}
endscript
