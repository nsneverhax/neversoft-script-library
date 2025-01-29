gh4_download_songs_guitar = {
	prefix = 'download_guitar'
	num_tiers = 1
	tier1 = {
		title = qs(0xe2838441)
		songs = [
		]
		defaultunlocked = 4
		level = load_z_frathouse
	}
}
gh4_download_songlist = [
]
gh4_download_songs_bass = {
	prefix = 'download_bass'
	num_tiers = 1
	tier1 = {
		title = qs(0xe2838441)
		songs = [
		]
		defaultunlocked = 4
		level = load_z_frathouse
	}
}
gh4_download_songs_drums = {
	prefix = 'download_drums'
	num_tiers = 1
	tier1 = {
		title = qs(0xe2838441)
		songs = [
		]
		defaultunlocked = 4
		level = load_z_frathouse
	}
}
gh4_download_songs_vocals = {
	prefix = 'download_vocals'
	num_tiers = 1
	tier1 = {
		title = qs(0xe2838441)
		songs = [
		]
		defaultunlocked = 4
		level = load_z_frathouse
	}
}
gh4_download_songs_band = {
	prefix = 'download_band'
	num_tiers = 1
	tier1 = {
		title = qs(0xe2838441)
		songs = [
		]
		defaultunlocked = 4
		level = load_z_frathouse
	}
}

script scan_globaltag_downloads 
	printf \{qs(0xd96ce4ee)}
	lockglobaltags \{OFF}
	printstruct ($gh4_download_songlist)
	get_num_globaltag_sets
	if (<num_globaltag_sets> > 0)
		savegame = 0
		begin
		setup_setlisttags savegame = <savegame> SetList_Songs = gh4_download_songs_guitar part = guitar SongList = gh4_download_songlist download = 1
		setup_setlisttags savegame = <savegame> SetList_Songs = gh4_download_songs_bass part = bass SongList = gh4_download_songlist download = 1
		setup_setlisttags savegame = <savegame> SetList_Songs = gh4_download_songs_drums part = drum SongList = gh4_download_songlist download = 1
		setup_setlisttags savegame = <savegame> SetList_Songs = gh4_download_songs_vocals part = vocals SongList = gh4_download_songlist download = 1
		setup_setlisttags savegame = <savegame> SetList_Songs = gh4_download_songs_band part = Band SongList = gh4_download_songlist download = 1
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'guitar'
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'bass'
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'drum'
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'vocals' topscores = ($vocals_topscores)
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'band'
		<savegame> = (<savegame> + 1)
		repeat (<num_globaltag_sets>)
	endif
	lockglobaltags
endscript
0x86fbe97d = -1
global_content_index_pak = 'none'
global_content_index_pak_language = 'none'
0x234d16eb = 0

script Downloads_EnumContent \{0xb5e0fc5b = 0}
	0xce011abd
	mark_unsafe_for_shutdown
	if EnumContentFiles \{download
			dofiles}
		begin
		if EnumContentFilesFinished
			break
		else
			printf \{qs(0xd10f5883)}
			WaitOneGameFrame
		endif
		repeat
	endif
	mark_safe_for_shutdown
	if (<0xb5e0fc5b> = 0)
		if IsEnumContentFilesDamaged
			destroy_popup_warning_menu
			create_popup_warning_menu {
				player_device = <controller>
				create_popup_warning_menu {
					textblock = {
						text = qs(0xa08469f7)
						Wait 3 Seconds
					}
				}
				menu_pos = (640.0, 490.0)
				options = [
					{
						func = {Downloads_Enumcontentfiles_Continue}
						text = qs(0x182f0173)
						Scale = (1.0, 1.0)
					}
				]
			}
			Change \{Downloads_Enumcontentfiles_Continue_Flag = 0}
			begin
			if ($Downloads_Enumcontentfiles_Continue_Flag = 1)
				break
			endif
			WaitOneGameFrame
			repeat
		endif
	endif
	GetArraySize \{gh4_download_songlist
		globalarray}
	Change 0x234d16eb = <array_Size>
	<FileName> = 'DLC1.pak'
	GetContentFolderIndexFromFile <FileName>
	if (<device> = content)
		printf \{qs(0xe31afb3f)}
		printstruct <...>
		mark_unsafe_for_shutdown
		Downloads_UnloadContent
		Change 0x86fbe97d = <content_index>
		EnableDuplicateSymbolWarning \{OFF}
		if NOT LoadPakAsync pak_name = <FileName> Heap = heap_downloads async = 1
			EnableDuplicateSymbolWarning
			mark_safe_for_shutdown
			DownloadContentLost
			return
		endif
		EnableDuplicateSymbolWarning
		Change global_content_index_pak = <FileName>
		mark_safe_for_shutdown
	else
		printf \{qs(0xf4fbf8ce)}
	endif
	if ScriptExists \{Downloads_Startup}
		Downloads_Startup
	endif
	GetLatestContentIndexFile
	GetArraySize \{gh4_download_songlist
		globalarray}
	if (<content_index> > (<array_Size> + 1))
		EnableDuplicateSymbolWarning \{OFF}
		Change \{gh4_download_songlist = [
			]}
		EnableDuplicateSymbolWarning
		if NOT GotParam \{0xd1c075f0}
			destroy_popup_warning_menu
			create_popup_warning_menu {
				title = (qs(0x79597197))
				textblock = {
					text = (qs(0x0a0b2d9c))
				}
				options = [
					{
						func = destroy_popup_warning_menu
						text = qs(0x0e41fe46)
					}
				]
			}
			begin
			if NOT ScreenElementExists \{id = popupelement}
				break
			endif
			WaitOneGameFrame
			repeat
		endif
	endif
	Downloads_PostEnumContent
endscript

script destroy_downloads_EnumContent 
	KillSpawnedScript \{Name = Downloads_EnumContent}
	KillSpawnedScript \{Name = boot_download_scan}
	Downloads_CloseContentFolder \{Force = 1}
endscript

script Downloads_LoadLanguageContent \{async = 1}
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
		mark_unsafe_for_shutdown
		EnableDuplicateSymbolWarning \{OFF}
		if NOT LoadPakAsync pak_name = <pakname> Heap = heap_downloads async = <async>
			EnableDuplicateSymbolWarning
			mark_safe_for_shutdown
			DownloadContentLost
			return
		endif
		EnableDuplicateSymbolWarning
		Change global_content_index_pak_language = <pakname>
		mark_safe_for_shutdown
	else
		printf qs(0x3906d03d) s = <pakname>
	endif
endscript

script Downloads_PostEnumContent 
	GetArraySize \{gh4_download_songlist
		globalarray}
	if (($0x234d16eb) != <array_Size>)
		scan_globaltag_downloads
	endif
endscript
Downloads_Enumcontentfiles_Continue_Flag = 0

script Downloads_Enumcontentfiles_Continue 
	Change \{Downloads_Enumcontentfiles_Continue_Flag = 1}
endscript

script Downloads_UnloadContent 
	KillSpawnedScript \{Name = Downloads_OpenContentFolder}
	Change \{downloadcontentfolder_lock = 0}
	Change \{0x86fbe97d = -1}
	if ScriptExists \{downloads_shutdown}
		downloads_shutdown
	endif
	if NOT ($global_content_index_pak = 'none')
		UnLoadPak \{'DLC1.pak'}
		WaitUnloadPak \{'DLC1.pak'
			Block}
		Change \{global_content_index_pak = 'none'}
	endif
endscript

script downloads_unloadlanguagecontent 
	if NOT ($global_content_index_pak_language = 'none')
		UnLoadPak ($global_content_index_pak_language)
		Change \{global_content_index_pak_language = 'none'}
	endif
endscript
downloadcontentfolder_lock = 0
downloadcontentfolder_index = -1
downloadcontentfolder_count = 0

script Downloads_OpenContentFolder 
	unpausespawnedscript \{Downloads_CloseContentFolder}
	mark_unsafe_for_shutdown
	begin
	if ($downloadcontentfolder_lock = 0)
		break
	endif
	if ($downloadcontentfolder_index = <content_index>)
		Change downloadcontentfolder_count = ($downloadcontentfolder_count + 1)
		mark_safe_for_shutdown
		return \{true}
	endif
	WaitOneGameFrame
	repeat
	Change \{downloadcontentfolder_lock = 1}
	if NOT OpenContentFolder content_index = <content_index>
		mark_safe_for_shutdown
		return \{FALSE}
	endif
	if GotParam \{close_if_script_killed}
		OnExitRun downloads_opencontentfolder_cleanupandclose params = {content_index = <content_index>}
	endif
	begin
	GetContentFolderState
	if (<contentfolderstate> = failed)
		Change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		OnExitRun \{0x00000000}
		return \{FALSE}
	endif
	if (<contentfolderstate> = opened)
		break
	endif
	WaitOneGameFrame
	repeat
	OnExitRun \{0x00000000}
	Change downloadcontentfolder_count = ($downloadcontentfolder_count + 1)
	Change downloadcontentfolder_index = <content_index>
	mark_safe_for_shutdown
	return \{true}
endscript

script downloads_opencontentfolder_cleanupandclose 
	printf \{qs(0x2668da8f)}
	SpawnScriptNow Downloads_CloseContentFolder params = {content_index = <content_index>}
endscript

script Downloads_CloseContentFolder \{Force = 0}
	mark_unsafe_for_shutdown
	if (<Force> = 1)
		if ($downloadcontentfolder_index = -1)
			mark_safe_for_shutdown
			return
		endif
	endif
	if (<Force> = 1)
		Change \{downloadcontentfolder_count = 0}
	else
		Change downloadcontentfolder_count = ($downloadcontentfolder_count - 1)
		if ($downloadcontentfolder_count > 0)
			mark_safe_for_shutdown
			return \{true}
		endif
	endif
	if (<Force> = 1)
		content_index = ($downloadcontentfolder_index)
	else
		Change \{downloadcontentfolder_index = -1}
	endif
	begin
	GetContentFolderState
	switch <contentfolderstate>
		case opened
		break
		case free
		case failed
		Change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		return \{FALSE}
		default
		WaitOneGameFrame
	endswitch
	repeat
	if NOT CloseContentFolder content_index = <content_index>
		Change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		return \{FALSE}
	endif
	begin
	GetContentFolderState
	switch <contentfolderstate>
		case free
		break
		case failed
		Change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		return \{FALSE}
		default
		WaitOneGameFrame
	endswitch
	repeat
	Change \{downloadcontentfolder_lock = 0}
	mark_safe_for_shutdown
	return \{true}
endscript

script create_download_scan_menu 
	Change \{menu_flow_play_sound = 0}
	if ($downloadcontent_enabled = 0)
		return
	endif
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{textblock = {
				text = qs(0x75e1afbf)
			}}
		Wait \{1
			gameframes}
		case Xenon
		create_popup_warning_menu \{textblock = {
				text = qs(0xeef4272c)
			}}
		case ngc
		create_popup_warning_menu \{textblock = {
				text = qs(0xb3a6fa3b)
			}}
	endswitch
	Downloads_EnumContent
endscript

script destroy_download_scan_menu 
	destroy_popup_warning_menu
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
	DownloadContentLost
endscript

script DownloadContentLost 
	return
	Change \{is_changing_levels = 0}
	Change \{practice_songpreview_changing = 0}
	printscriptinfo \{'DownloadContentLost'}
	SpawnScriptNow \{noqbid
		DownloadContentLost_Spawned}
	KillSpawnedScript \{Name = setlist_choose_song}
	KillSpawnedScript \{Name = DownloadContentLost}
endscript

script DownloadContentLost_Spawned 
	if NOT ($shutdown_game_for_signin_change_flag = 0)
		return
	endif
	if ($respond_to_signin_changed = 0)
		return
	endif
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
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = qs(0x10facad3)
		title_props = {
			Scale = 1.0
		}
		textblock = {
			text = qs(0x75e38f5b)
			Pos = (640.0, 380.0)
		}
		menu_pos = (640.0, 490.0)
		options = [
			{
				func = {
					downloadcontentlost_reboot
				}
				text = qs(0x182f0173)
				Scale = (1.0, 1.0)
			}
		]}
endscript

script downloadcontentlost_reboot 
	printf \{qs(0x1858183e)}
	destroy_downloadcontentlost_menu
	Wait \{5
		gameframes}
	ui_event \{event = menu_change
		data = {
			state = uistate_boot_iis
			clear_previous_stack
		}}
	printf \{qs(0x0f1c1713)}
endscript

script destroy_downloadcontentlost_menu 
	destroy_popup_warning_menu
endscript

script recreate_downloadcontentlost_menu 
	destroy_downloadcontentlost_menu
	create_downloadcontentlost_menu
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
net_match_available_items_request_finished = 0
net_match_dlc_sync_finished = 0

script net_match_send_available_items 
	printf \{qs(0xdf3f3534)}
	disable_pause
	Change \{net_match_dlc_sync_finished = 0}
	if IsHost
		net_match_send_available_items_host
	else
		net_match_send_available_items_client
	endif
	Change \{net_match_dlc_sync_finished = 1}
	printf \{qs(0x7e7258ae)}
endscript

script net_match_send_available_items_host 
	net_match_clear_available_items \{for_host = 1}
	SendStructure \{callback = net_match_download_items_send
		data_to_send = {
			for_host = 0
		}}
	getnumremoteconnections
	wait_for_net_match_available_items num_finished = <num_connections>
	net_match_calc_available_items
	net_match_download_items_send \{for_host = 1}
endscript

script net_match_send_available_items_client 
	wait_for_net_match_available_items
	if ($0xfc677337)
		Change \{0xfc677337 = 0}
		skiprenderframes \{10}
	endif
	printf \{qs(0x7e7258ae)}
endscript

script net_match_clear_available_items 
	if NOT net_match_verify_host for_host = <for_host>
		return
	endif
	get_songlist_size
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	if globaltagexists <song_checksum> noassert = 1
		SetGlobalTags <song_checksum> params = {available_on_other_client = 0}
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	printf qs(0xb1f247c3) i = <array_Size>
	return \{true}
endscript

script net_match_calc_available_items 
	printf \{qs(0x7e77d368)}
	getnumremoteconnections
	get_songlist_size
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	if globaltagexists <song_checksum> noassert = 1
		<available> = 0
		if is_song_downloaded song_checksum = <song_checksum>
			<available> = 1
		elseif StructureContains structure = ($sd_songstruct) <song_checksum>
			<available> = 1
		endif
		if (<available> = 1)
			GetGlobalTags <song_checksum>
			if (<available_on_other_client> >= <num_connections>)
				SetGlobalTags <song_checksum> params = {available_on_other_client = 1}
			else
				SetGlobalTags <song_checksum> params = {available_on_other_client = 0}
			endif
		else
			SetGlobalTags <song_checksum> params = {available_on_other_client = 0}
		endif
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	printf \{qs(0xb2c7132d)}
	return \{true}
endscript

script clear_wait_for_net_match_available_items 
	Change \{net_match_available_items_request_finished = 0}
endscript

script wait_for_net_match_available_items \{num_finished = 1}
	begin
	if ($net_match_available_items_request_finished = <num_finished>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	clear_wait_for_net_match_available_items
endscript

script net_match_verify_host 
	if IsHost
		is_host = 1
	else
		is_host = 0
	endif
	if NOT (<is_host> = <for_host>)
		printf \{qs(0xe518c972)}
		printstruct <...>
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script net_match_download_items_send 
	printf \{qs(0x8dbce89d)}
	if NOT net_match_verify_host for_host = <for_host>
		return
	endif
	if NOT IsHost
		net_match_clear_available_items \{for_host = 0}
	endif
	net_match_init_items for_host = (1 - <for_host>)
	get_songlist_size
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	if globaltagexists <song_checksum> noassert = 1
		if IsHost
			GetGlobalTags <song_checksum>
			if (<available_on_other_client> = 1)
				net_match_add_item item = <song_checksum>
			endif
		else
			<available> = 0
			if is_song_downloaded song_checksum = <song_checksum>
				<available> = 1
			elseif StructureContains structure = ($sd_songstruct) <song_checksum>
				<available> = 1
			endif
			if (<available> = 1)
				net_match_add_item item = <song_checksum>
			endif
		endif
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	net_match_send_items
	Wait \{1
		gameframe}
	net_match_init_items for_host = (1 - <for_host>)
	net_match_send_items \{final = 1}
	printf \{qs(0xdb933c51)}
endscript

script net_match_init_items 
	Change \{num_net_checksum_packet = 0}
	Change \{total_num_net_checksum_packet = 0}
	Change net_checksum_packet_for_host = <for_host>
endscript

script net_match_add_item 
	SetArrayElement ArrayName = net_checksum_packet globalarray index = ($num_net_checksum_packet) NewValue = <item>
	Change num_net_checksum_packet = ($num_net_checksum_packet + 1)
	if ($num_net_checksum_packet = 20)
		Change total_num_net_checksum_packet = ($total_num_net_checksum_packet + 1)
		net_match_send_items
		Change \{num_net_checksum_packet = 0}
	else
		return message_struct = <message_struct>
	endif
endscript

script net_match_send_items \{final = 0
		additional_info = {
		}}
	SendStructure callback = net_match_download_items_send_callback data_to_send = {net_items = ($net_checksum_packet)
		num_valid = ($num_net_checksum_packet)
		packet = ($total_num_net_checksum_packet)
		final = <final>
		for_host = ($net_checksum_packet_for_host)
		<additional_info>
		spawn_script_now}
endscript

script net_match_download_items_send_callback 
	printf \{qs(0x9f21d497)}
	printstruct <...>
	if NOT net_match_verify_host for_host = <for_host>
		return
	endif
	if (<num_valid> > 0)
		index = 0
		begin
		if globaltagexists (<net_items> [<index>]) noassert = 1
			available_on_other_client = 0
			GetGlobalTags (<net_items> [<index>])
			available_on_other_client = (<available_on_other_client> + 1)
			SetGlobalTags (<net_items> [<index>]) params = {available_on_other_client = <available_on_other_client>}
		endif
		index = (<index> + 1)
		repeat <num_valid>
	endif
	if (<final> = 1)
		Change net_match_available_items_request_finished = (($net_match_available_items_request_finished) + 1)
	endif
endscript
