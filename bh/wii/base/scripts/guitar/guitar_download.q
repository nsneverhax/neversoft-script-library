disable_download_cache = 0
gh4_download_songlist = [
]

script scan_globaltag_downloads \{async = 1}
	printf \{qs(0xd96ce4ee)}
	return
	lockglobaltags \{OFF}
	if GotParam \{dlc_scan}
		lockglobaltags \{freeplay_check_off}
	endif
	get_num_savegames
	if (<num_savegames> > 0)
		savegame = 0
		begin
		conditional_async_wait async = <async> text = qs(0xde444e7d)
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'guitar'
		conditional_async_wait async = <async> text = qs(0xf5691dbe)
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'bass'
		conditional_async_wait async = <async> text = qs(0xec722cff)
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'drum'
		conditional_async_wait async = <async> text = qs(0xa333ba38)
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'vocals'
		conditional_async_wait async = <async> text = qs(0xba288b79)
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'band'
		conditional_async_wait async = <async> text = qs(0x9105d8ba)
		<savegame> = (<savegame> + 1)
		repeat (<num_savegames>)
	endif
	if GotParam \{dlc_scan}
		lockglobaltags \{freeplay_check_on}
	endif
	lockglobaltags
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
global_content_index_pak = 'none'
global_content_index_pak_language = 'none'

script Downloads_EnumContent controller = ($primary_controller) async = 1
	removecontentfiles playerid = <controller>
	Downloads_UnloadContent
	push_unsafe_for_shutdown \{reason = EnumContentFiles}
	if EnumContentFiles download dofiles playerid = <controller>
		if NOT EnumContentFilesFinished
			begin
			printf \{qs(0x7b5d03fb)}
			Wait \{1
				gameframe}
			if EnumContentFilesFinished
				break
			endif
			repeat
		endif
	endif
	pop_unsafe_for_shutdown \{reason = EnumContentFiles}
	if abort_for_signout controller = <controller>
		return
	endif
	if IsEnumContentFilesDamaged
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
		create_dialog_box {
			body_text = qs(0xa08469f7)
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
			break
		endif
		Wait \{1
			gameframe}
		repeat
		destroy_dialog_box
		if ($shutdown_game_for_signin_change_flag = 0)
			if ScreenElementExists \{id = band_lobby_desc_id}
				band_lobby_update_button_helpers
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		endif
	endif
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if isngc
	else
		setsearchallcontentfolders
		if GetLatestContentIndexFile
			printf \{qs(0xf1fa201d)}
			printstruct <...>
			push_unsafe_for_shutdown \{reason = dlc_content_load_pak}
			EnableDuplicateSymbolWarning \{OFF}
			if NOT LoadPakAsync pak_name = <FileName> Heap = heap_downloads async = 1
				EnableDuplicateSymbolWarning
				mark_safe_for_shutdown
				DownloadContentLost
				setsearchallcontentfolders \{OFF}
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
		setsearchallcontentfolders \{OFF}
	endif
	if ScriptExists \{Downloads_Startup}
		Downloads_Startup
	endif
	Downloads_PostEnumContent
endscript

script destroy_downloads_EnumContent 
	KillSpawnedScript \{Name = Downloads_EnumContent}
	KillSpawnedScript \{Name = boot_download_scan}
	closeallcontentfolders
	if ($Downloads_Enumcontentfiles_Continue_Flag = 0)
		destroy_dialog_box
		Change \{Downloads_Enumcontentfiles_Continue_Flag = 1}
	endif
endscript

script Downloads_LoadLanguageContent 
	formatText TextName = pakname '%s_text.pak' s = <stem>
	if English
		formatText TextName = pakname '%s_text.pak' s = <stem>
	elseif French
		formatText TextName = pakname '%s_text_f.pak' s = <stem>
	elseif Italian
		formatText TextName = pakname '%s_text_i.pak' s = <stem>
	elseif German
		formatText TextName = pakname '%s_text_g.pak' s = <stem>
	elseif Spanish
		formatText TextName = pakname '%s_text_s.pak' s = <stem>
	endif
	GetContentFolderIndexFromFile <pakname>
	if (<device> = content)
		printf qs(0x6af97d82) s = <pakname>
		push_unsafe_for_shutdown \{reason = dlc_content_load_language_pak}
		EnableDuplicateSymbolWarning \{OFF}
		if NOT LoadPakAsync pak_name = <pakname> Heap = heap_downloads async = 1
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
	setsearchallcontentfolders \{OFF}
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
		FALSE}
endscript

script store_select_downloads 
	NetSessionFunc \{func = ShowMarketPlaceUI}
	wait_for_blade_complete
	Downloads_UnloadContent
endscript

script fmod_diskejected_event 
	printf \{qs(0x71a1ceda)}
	KillSpawnedScript \{Name = song_preview_monitor}
	DownloadContentLost
endscript

script DownloadContentLost 
	ScriptAssert \{'Craaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaap.'}
	return
	Change \{is_changing_levels = 0}
	Change \{practice_songpreview_changing = 0}
	printscriptinfo \{qs(0xca95b489)}
	SpawnScriptNow \{noqbid
		DownloadContentLost_Spawned}
	KillSpawnedScript \{Name = DownloadContentLost}
endscript

script DownloadContentLost_Spawned 
	printf \{'DownloadContentLost_Spawned'}
	if NOT ($shutdown_game_for_signin_change_flag = 0)
		return
	endif
	printf \{'DownloadContentLost_Spawned shutdown_game_for_signin_change_flag==0'}
	if ($respond_to_signin_changed = 0)
		return
	endif
	printf \{'DownloadContentLost_Spawned respond_to_signin_changed==1'}
	Change \{respond_to_signin_changed = 0}
	printf \{qs(0x8a0f6c71)}
	disable_pause
	create_loading_screen \{no_bink}
	ui_event_block \{event = menu_back
		data = {
			state = uistate_null
		}}
	shutdown_game_for_signin_change
	removecontentfiles \{playerid = -1
		clear_cache}
	ui_event_block \{event = menu_change
		data = {
			state = uistate_signin_changed
			clear_previous_stack
		}}
	destroy_loading_screen \{Force = 1}
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_downloadcontentlost_menu
	StartRendering
	SetButtonEventMappings \{unblock_menu_input}
	printf \{qs(0xc68e2781)}
endscript

script create_downloadcontentlost_menu 
	destroy_dialog_box
	create_dialog_box \{heading_text = qs(0x10facad3)
		body_text = qs(0xf36b8d4a)
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
	getsonglistsize
	song_count = 0
	begin
	getsonglistchecksum index = <song_count>
	setupdlcsongtag content_name = <song_checksum> savegame = 0
	if globaltagexists <song_checksum> noassert = 1
		SetGlobalTags <song_checksum> params = {available_on_other_client = 0}
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	printf qs(0xb1f247c3) i = <array_Size>
	return \{true}
endscript

script net_match_set_available_items 
	getsonglistsize
	song_count = 0
	begin
	getsonglistchecksum index = <song_count>
	setupdlcsongtag content_name = <song_checksum> savegame = 0
	if globaltagexists <song_checksum> noassert = 1
		SetGlobalTags <song_checksum> params = {available_on_other_client = 1}
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	printf qs(0xb1f247c3) i = <array_Size>
	return \{true}
endscript

script set_online_available_dlc_songs 
	net_match_clear_available_items
	songlistmatch \{func = max_songs}
	i = 0
	begin
	if (songlistmatch func = is_match index = <i>)
		dlcmanagerfunc func = get_content_checksum content_net_index = <i>
		if globaltagexists <content_checksum> noassert = 1
			SetGlobalTags <content_checksum> params = {available_on_other_client = 1}
		endif
	endif
	i = (<i> + 1)
	repeat <max_songs>
	Change \{net_match_dlc_sync_finished = 1}
endscript
wii_sd_card_enumeration_text = qs(0x012da0bd)

script dlc_patch_unload 
endscript

script dlc_patch_load 
endscript

script sd_unload_song 
	songstop
	sdcardmanagerfunc \{func = clear_cached_song}
endscript
