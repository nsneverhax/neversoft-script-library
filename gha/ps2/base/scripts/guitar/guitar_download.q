GH3_Download_Songs = {
	prefix = 'download'
	num_tiers = 1
	tier1 = {
		title = 'Downloaded songs'
		songs = [
		]
		defaultunlocked = 4
		level = load_z_nipmuc
	}
}

script scan_globaltag_downloads 
	setup_setlisttags \{SetList_Songs = GH3_Download_Songs
		Force = 1}
	setup_songtags
	setup_generalvenuetags
	setup_characterguitar_tags
endscript
global_content_index_pak = 'none'
global_content_index_pak_language = 'none'

script Downloads_EnumContent 
	mark_unsafe_for_shutdown
	if EnumContentFiles \{download
			dofiles}
		begin
		if EnumContentFilesFinished
			break
		else

			WaitOneGameFrame
		endif
		repeat
	endif
	mark_safe_for_shutdown
	if IsEnumContentFilesDamaged
		destroy_popup_warning_menu
		create_popup_warning_menu \{create_popup_warning_menu
			textblock = {
				text = 'A content package appears damaged or unreadable. Please re-download the content package.'
				Wait
				3
				Seconds
			}
			menu_pos = (640.0, 490.0)
			dialog_dims = (288.0, 64.0)
			options = [
				{
					func = {
						Downloads_Enumcontentfiles_Continue
					}
					text = 'CONTINUE'
					Scale = (1.0, 1.0)
				}
			]}
		Change \{Downloads_Enumcontentfiles_Continue_Flag = 0}
		begin
		if ($Downloads_Enumcontentfiles_Continue_Flag = 1)
			break
		endif
		WaitOneGameFrame
		repeat
	endif
	if GetLatestContentIndexFile

		mark_unsafe_for_shutdown
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
		Downloads_LoadLanguageContent <...>
	else

	endif
	if ScriptExists \{Downloads_Startup}
		Downloads_Startup
	endif
	Downloads_PostEnumContent
endscript

script destroy_downloads_EnumContent 
	KillSpawnedScript \{Name = Downloads_EnumContent}
	Downloads_CloseContentFolder \{Force = 1}
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

		mark_unsafe_for_shutdown
		EnableDuplicateSymbolWarning \{OFF}
		if NOT LoadPakAsync pak_name = <pakname> Heap = heap_downloads async = 1
			EnableDuplicateSymbolWarning
			mark_safe_for_shutdown
			DownloadContentLost
			return
		endif
		EnableDuplicateSymbolWarning
		Change global_content_index_pak_language = <pakname>
		mark_safe_for_shutdown
	else

	endif
endscript

script Downloads_PostEnumContent 
	Download_RecreateZones
	scan_globaltag_downloads
endscript
Downloads_Enumcontentfiles_Continue_Flag = 0

script Downloads_Enumcontentfiles_Continue 
	Change \{Downloads_Enumcontentfiles_Continue_Flag = 1}
endscript

script Downloads_UnloadContent 
	KillSpawnedScript \{Name = Downloads_OpenContentFolder}
	Change \{downloadcontentfolder_lock = 0}
	if NOT ($global_content_index_pak = 'none')
		UnLoadPak ($global_content_index_pak)
		Change \{global_content_index_pak = 'none'}
	endif
	if NOT ($global_content_index_pak_language = 'none')
		UnLoadPak ($global_content_index_pak_language)
		Change \{global_content_index_pak_language = 'none'}
	endif
endscript

script Download_RecreateZones 
	mark_unsafe_for_shutdown

	SetPakManCurrentBlock \{map = zones
		pak = None}
	DestroyPakManMap \{map = zones}
	MemPushContext \{heap_zones}
	CreatePakManMap \{map = zones
		links = GH3Zones
		folder = 'zones/'
		uselinkslots}
	MemPopContext
	SetPakManCurrentBlock \{map = zones
		pak = z_soundcheck}
	mark_safe_for_shutdown
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
	begin
	GetContentFolderState
	if (<contentfolderstate> = failed)
		Change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		return \{FALSE}
	endif
	if (<contentfolderstate> = opened)
		break
	endif
	WaitOneGameFrame
	repeat
	Change downloadcontentfolder_count = ($downloadcontentfolder_count + 1)
	Change downloadcontentfolder_index = <content_index>
	mark_safe_for_shutdown
	return \{true}
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
	if NOT CloseContentFolder content_index = <content_index>
		Change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		return \{FALSE}
	endif
	begin
	GetContentFolderState
	if (<contentfolderstate> = free)
		break
	endif
	WaitOneGameFrame
	repeat
	Change \{downloadcontentfolder_lock = 0}
	mark_safe_for_shutdown
	return \{true}
endscript

script create_download_scan_menu 
	Change \{menu_flow_play_sound = 0}
	if ($downloadcontent_enabled = 0)
		ui_flow_manager_respond_to_action \{action = continue}
		return
	endif
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{textblock = {
				text = 'Checking the HDD. Do not switch off your system.'
			}}
		Wait \{1
			gameframes}
		case Xenon
		create_popup_warning_menu \{textblock = {
				text = 'Checking for downloadable content. Please don\'t turn off your Xbox 360 console.'
			}}
	endswitch
	Downloads_EnumContent
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script destroy_download_scan_menu 
	destroy_popup_warning_menu
endscript

script is_musician_profile_downloaded 
	GetArraySize \{$Musician_Profiles}
	if (<index> < <array_Size>)
		return \{download = 0
			true}
	else
		profile_struct = ($download_musician_profiles [(<index> - <array_Size>)])
		get_pak_filename desc_id = (<profile_struct>.musician_body.desc_id) Type = Body
		GetContentFolderIndexFromFile <pak_name>
		if (<device> = content)
			return \{download = 1
				true}
		else
			return \{download = 1
				FALSE}
		endif
	endif
endscript

script is_musician_instrument_downloaded 
	GetArraySize \{$musician_instrument}
	if (<index> < <array_Size>)
		return \{download = 0
			true}
	else
		profile_struct = ($download_musician_instrument [(<index> - <array_Size>)])
		get_pak_filename desc_id = (<profile_struct>.desc_id) Type = instrument
		GetContentFolderIndexFromFile <pak_name>
		if (<device> = content)
			return \{download = 1
				true}
		else
			return \{download = 1
				FALSE}
		endif
	endif
endscript

script find_instrument_index 
	get_musician_instrument_size
	index = 0
	begin
	get_musician_instrument_struct index = <index>
	if (<info_struct>.desc_id = <desc_id>)
		return index = <index> true
	endif
	index = (<index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script store_select_downloads 
	NetSessionFunc \{func = ShowMarketPlaceUI}
	wait_for_blade_complete
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	destroy_band
	Downloads_UnloadContent
endscript

script fmod_diskejected_event 

	DownloadContentLost
endscript

script DownloadContentLost 
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

	disable_pause
	StopRendering
	shutdown_game_for_signin_change
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_downloadcontentlost_menu
	StartRendering

endscript

script create_downloadcontentlost_menu 
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = 'CONTENT CHANGED'
		title_props = {
			Scale = 1.0
		}
		textblock = {
			text = 'Download Content has changed. As a result, the game has restarted.'
			Pos = (640.0, 380.0)
		}
		menu_pos = (640.0, 490.0)
		dialog_dims = (288.0, 64.0)
		options = [
			{
				func = {
					downloadcontentlost_reboot
				}
				text = 'CONTINUE'
				Scale = (1.0, 1.0)
			}
		]}
endscript

script downloadcontentlost_reboot 

	destroy_downloadcontentlost_menu
	enable_pause
	Wait \{5
		gameframes}
	start_flow_manager \{flow_state = bootup_press_any_button_fs}

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
net_match_available_items_request_finished = 0
net_match_send_available_items_dirty = 0

script net_match_send_available_items 

	disable_pause
	if ($net_match_send_available_items_dirty = 0)
		return
	endif
	Change \{net_match_send_available_items_dirty = 0}
	if NOT IsHost
		destroy_popup_warning_menu
		create_popup_warning_menu \{title = 'ONLINE'
			title_props = {
				Scale = 1.0
			}
			textblock = {
				text = 'Sending Profile Information. Please Wait.'
				Pos = (640.0, 380.0)
			}}
	endif
	net_match_clear_available_items
	Change \{net_match_available_items_request_finished = 0}
	SendStructure \{callback = net_match_available_items_send
		data_to_send = {
			None
		}}
	wait_for_net_match_available_items
	destroy_popup_warning_menu

endscript

script net_match_clear_available_items 
	get_songlist_size
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	SetGlobalTags <song_checksum> params = {available_on_other_client = 0}
	song_count = (<song_count> + 1)
	repeat <array_Size>

	guitar_array = ($Bonus_Guitars)
	store_add_secret_guitars_and_basses guitar_array = (<guitar_array>)
	GetArraySize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	SetGlobalTags <guitar_id> params = {unlocked_on_other_client = 0
		available_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_Size>
	guitar_array = ($Bonus_Guitar_Finishes)
	GetArraySize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	SetGlobalTags <guitar_id> params = {unlocked_on_other_client = 0
		available_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_Size>
	character_array = ($Secret_Characters)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	SetGlobalTags <character_id> params = {unlocked_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_Size>
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	character_id = (<profile_struct>.musician_body.desc_id)
	SetGlobalTags <character_id> params = {available_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_Size>
	character_array = ($Bonus_Outfits)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	SetGlobalTags <character_id> params = {unlocked_on_other_client = 0
		available_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_Size>
	character_array = ($Bonus_Styles)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	SetGlobalTags <character_id> params = {unlocked_on_other_client = 0
		available_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{true}
endscript

script wait_for_net_match_available_items 
	begin
	if ($net_match_available_items_request_finished = 1)
		break
	endif
	WaitOneGameFrame
	repeat
	Change \{net_match_available_items_request_finished = 0}
endscript

script net_match_available_items_send 

	net_match_init_items
	get_songlist_size
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	if is_song_downloaded song_checksum = <song_checksum>
		net_match_add_item <...> item = <song_checksum>
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	net_match_send_items <...>
	net_match_init_items
	guitar_array = ($Bonus_Guitars)
	store_add_secret_guitars_and_basses guitar_array = (<guitar_array>)
	GetArraySize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	GetGlobalTags <guitar_id>
	if (<unlocked> = 1)
		net_match_add_item <...> item = <guitar_id>
	endif
	get_instrument_name_and_index id = <guitar_id>
	<index> = (<index> + 1)
	repeat <array_Size>
	net_match_send_items <...> for_unlock = 1
	net_match_init_items
	guitar_array = ($Bonus_Guitar_Finishes)
	GetArraySize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	GetGlobalTags <guitar_id>
	if (<unlocked> = 1)
		net_match_add_item <...> item = <guitar_id>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	net_match_send_items <...> for_unlock = 1
	net_match_init_items
	character_array = ($Secret_Characters)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if (<unlocked> = 1)
		net_match_add_item <...> item = <character_id>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	net_match_send_items <...> for_unlock = 1
	character_array = ($Bonus_Outfits)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if (<unlocked> = 1)
		net_match_add_item <...> item = <character_id>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	net_match_send_items <...> for_unlock = 1
	character_array = ($Bonus_Styles)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if (<unlocked> = 1)
		net_match_add_item <...> item = <character_id>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	net_match_send_items <...> for_unlock = 1
	net_match_init_items \{Type = Download_Guitars}
	if GlobalExists \{Name = Download_Guitars}
		guitar_array = ($Download_Guitars)
		GetArraySize <guitar_array>
		index2 = 0
		begin
		find_instrument_index desc_id = (<guitar_array> [<index2>])
		get_musician_instrument_struct index = <index>
		if is_musician_instrument_downloaded index = <index>
			if (<download> = 1)
				net_match_add_item <...> item = (<info_struct>.desc_id)
			endif
		endif
		<index2> = (<index2> + 1)
		repeat <array_Size>
	endif
	net_match_send_items <...>
	net_match_init_items \{Type = Download_Basses}
	if GlobalExists \{Name = Download_Basses}
		guitar_array = ($Download_Basses)
		GetArraySize <guitar_array>
		index2 = 0
		begin
		find_instrument_index desc_id = (<guitar_array> [<index2>])
		get_musician_instrument_struct index = <index>
		if is_musician_instrument_downloaded index = <index>
			if (<download> = 1)
				net_match_add_item <...> item = (<info_struct>.desc_id)
			endif
		endif
		<index2> = (<index2> + 1)
		repeat <array_Size>
	endif
	net_match_send_items <...>
	net_match_init_items \{Type = download_characters}
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if is_musician_profile_downloaded index = <index>
		if (<download> = 1)
			net_match_add_item <...> item = (<profile_struct>.musician_body.desc_id)
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	net_match_send_items <...>
	WaitOneGameFrame
	net_match_init_items \{final = 1}
	net_match_send_items <...>

endscript

script net_match_init_items \{final = 0
		Type = Generic}
	Change \{num_net_checksum_packet = 0}
	Change \{total_num_net_checksum_packet = 0}
	return message_struct = {final = <final> Type = <Type>}
endscript

script net_match_add_item \{message_struct = {
			final = 0
		}}
	SetArrayElement ArrayName = net_checksum_packet globalarray index = ($num_net_checksum_packet) NewValue = <item>
	Change num_net_checksum_packet = ($num_net_checksum_packet + 1)
	Change total_num_net_checksum_packet = ($total_num_net_checksum_packet + 1)
	if ($num_net_checksum_packet = 20)
		message_struct = {message_link = <message_struct> net_items = ($net_checksum_packet) num_valid = 20}
		Change \{num_net_checksum_packet = 0}
	endif
	return message_struct = <message_struct>
endscript

script net_match_send_items \{for_unlock = 0
		additional_info = {
		}}
	message_struct = {message_link = <message_struct> net_items = ($net_checksum_packet) num_valid = ($num_net_checksum_packet)}
	SendStructure callback = net_match_download_items_send_callback data_to_send = {message_struct = <message_struct> for_unlock = <for_unlock> total_items = ($total_num_net_checksum_packet) additional_info = <additional_info>}
endscript
download_characters_on_other_client = 0
download_basses_on_other_client = 0
download_guitars_on_other_client = 0

script net_match_download_items_send_callback 


	begin
	if NOT StructureContains structure = <message_struct> num_valid
		if (<message_struct>.final = 1)
			Change \{net_match_available_items_request_finished = 1}
		endif
		break
	endif
	index = 0
	if ((<message_struct>.num_valid) > 0)
		begin
		if (<for_unlock> = 1)
			SetGlobalTags (<message_struct>.net_items [<index>]) params = {unlocked_on_other_client = 1}
		else
			SetGlobalTags (<message_struct>.net_items [<index>]) params = {available_on_other_client = 1}
		endif
		index = (<index> + 1)
		repeat (<message_struct>.num_valid)
	endif
	message_struct = (<message_struct>.message_link)
	repeat
	if (<message_struct>.Type = download_characters)
		Change download_characters_on_other_client = <total_items>
	endif
	if (<message_struct>.Type = Download_Guitars)
		Change download_guitars_on_other_client = <total_items>
	endif
	if (<message_struct>.Type = Download_Basses)
		Change download_basses_on_other_client = <total_items>
	endif
endscript
