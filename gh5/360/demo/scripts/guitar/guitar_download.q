disable_download_cache = 0
g_downloads_enumcontent_fail = 0
gh4_download_songlist = [
]

script scan_globaltag_downloads \{async = 1}
	printf \{qs(0xd96ce4ee)}
	push_unsafe_for_shutdown \{reason = scan_globaltag_downloads}
	lockglobaltags \{off}
	if gotparam \{dlc_scan}
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
	if gotparam \{dlc_scan}
		lockglobaltags \{freeplay_check_on}
	endif
	lockglobaltags
	pop_unsafe_for_shutdown \{reason = scan_globaltag_downloads}
endscript

script abort_for_signout 
	requireparams \{[
			controller
		]
		all}
	if isxenon
		if NOT islocallysignedin controller = <controller>
			return \{true}
		endif
	endif
	return \{false}
endscript
global_content_index_pak = 'none'
global_content_index_pak_language = 'none'

script downloads_enumcontent controller = ($primary_controller) async = 1
	change \{g_downloads_enumcontent_fail = 0}
	downloads_unloadcontent
	push_unsafe_for_shutdown \{reason = enumcontentfiles}
	if enumcontentfiles
		begin
		if enumcontentfileswaitforload
			break
		endif
		wait \{1
			gameframe}
		repeat
		if enumcontentfilesstart download playerid = <controller>
			if NOT enumcontentfilesfinished
				begin
				printf \{qs(0x7b5d03fb)}
				wait \{1
					gameframe}
				if enumcontentfilesfinished
					break
				endif
				repeat
			endif
		endif
	endif
	printf \{'EnumContentFiles finished'}
	waitforasyncloadandsavetofinish
	if NOT isenumcontentfilesdamaged
		printf \{'EnumContentFiles found no damaged folders, continue with manifest checking'}
		listfolderstates
		resolvefoldersusingmanifest \{manifest_array_name = known_dlc_manifest}
		listfolderstates
		addmanifestpakfilesforunresolvedfolders
		countunresolvedfolders
		last_num_unresolved_folders = <num_unresolved_folders>
		begin
		printf qs(0x65ebbc13) d = <num_unresolved_folders>
		if (<num_unresolved_folders> = 0)
			break
		endif
		generaterandommanifestpakname
		printf qs(0x0b7a64c5) s = <pak_name> f = <folder_name>
		getcontentfolderindexfromfile <pak_name>
		if (<device> != content)
			dumpcontentcache
			scriptassert qs(0x1513cfec) s = <pak_name>
		endif
		printf 'load manifest pak %s' s = <pak_name>
		push_unsafe_for_shutdown \{reason = dlc_manifest_load_pak}
		if NOT loadpakasync pak_name = <pak_name> heap = heap_downloads async = 1
			printf qs(0x25f9b95b) a = <pak_name> b = <folder_name>
			mark_safe_for_shutdown
			change \{g_downloads_enumcontent_fail = 1}
			waitforasyncloadandsavetofinish
			removecontentfiles \{clear_cache}
			waitforasyncloadandsavetofinish
			pop_unsafe_for_shutdown \{reason = dlc_manifest_load_pak}
			break
		endif
		pop_unsafe_for_shutdown \{reason = dlc_manifest_load_pak}
		resolvefoldersusingmanifest \{manifest_array_name = dlc_manifest}
		listfolderstates
		unloadpakasync pak_name = <pak_name>
		countunresolvedfolders
		printf qs(0xa979647c) d = <num_unresolved_folders>
		if (<num_unresolved_folders> < <last_num_unresolved_folders>)
		else
			break
		endif
		last_num_unresolved_folders = <num_unresolved_folders>
		repeat
		if (<num_unresolved_folders> > 0)
			printf \{qs(0x2e88107e)}
			change \{g_downloads_enumcontent_fail = 1}
			waitforasyncloadandsavetofinish
			removecontentfiles \{clear_cache}
			waitforasyncloadandsavetofinish
		endif
	endif
	pop_unsafe_for_shutdown \{reason = enumcontentfiles}
	if abort_for_signout controller = <controller>
		if ($respond_to_signin_changed_all_players = 0)
			if NOT ($respond_to_signin_changed_func = none)
				return
			endif
		endif
	endif
	if (($g_downloads_enumcontent_fail = 1) || isenumcontentfilesdamaged)
		printf \{qs(0xd7a91396)}
		destroy_dialog_box
		if gotparam \{savegame_ui_savegame}
			savegame_ui_end savegame = <savegame_ui_savegame>
			if isxenon
				exc_player_device = <savegame_ui_savegame>
			endif
		endif
		if screenelementexists \{id = band_lobby_desc_id}
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		endif
		if ($savegame_ui_state = boot)
			change \{downloads_enumcontentfiles_continue_flag = 1}
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
						func = downloads_enumcontentfiles_continue
						text = qs(0x182f0173)
					}
				]
			}
			change \{downloads_enumcontentfiles_continue_flag = 0}
			begin
			if ($downloads_enumcontentfiles_continue_flag = 1)
				break
			endif
			if abort_for_signout controller = <controller>
				if ($respond_to_signin_changed_all_players = 0)
					if NOT ($respond_to_signin_changed_func = none)
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
			if screenelementexists \{id = band_lobby_desc_id}
				band_lobby_update_button_helpers
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		endif
	endif
	printf qs(0x1fff74fe) i = ($shutdown_game_for_signin_change_flag)
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if getlatestcontentindexfile
		printf \{qs(0xf1fa201d)}
		printstruct <...>
		push_unsafe_for_shutdown \{reason = dlc_content_load_pak}
		enableduplicatesymbolwarning \{off}
		if NOT loadpakasync pak_name = <filename> heap = heap_downloads async = 1
			enableduplicatesymbolwarning
			mark_safe_for_shutdown
			downloadcontentlost
			pop_unsafe_for_shutdown \{reason = dlc_content_load_pak}
			return
		endif
		enableduplicatesymbolwarning
		pop_unsafe_for_shutdown \{reason = dlc_content_load_pak}
		change global_content_index_pak = <filename>
		downloads_loadlanguagecontent <...>
	else
		printf \{qs(0x62e8594a)}
	endif
	if scriptexists \{downloads_startup}
		downloads_startup
	endif
	downloads_postenumcontent
endscript

script destroy_downloads_enumcontent 
	killspawnedscript \{name = downloads_enumcontent}
	killspawnedscript \{name = boot_download_scan}
	closeallcontentfolders
	if ($downloads_enumcontentfiles_continue_flag = 0)
		destroy_dialog_box
		change \{downloads_enumcontentfiles_continue_flag = 1}
	endif
endscript

script downloads_loadlanguagecontent 
	formattext textname = pakname '%s_text.pak' s = <stem>
	getcontentfolderindexfromfile <pakname>
	if (<device> = content)
		printf qs(0x6af97d82) s = <pakname>
		push_unsafe_for_shutdown \{reason = dlc_content_load_language_pak}
		enableduplicatesymbolwarning \{off}
		if NOT loadpakasync pak_name = <pakname> heap = heap_downloads async = 1
			enableduplicatesymbolwarning
			mark_safe_for_shutdown
			downloadcontentlost
			pop_unsafe_for_shutdown \{reason = dlc_content_load_language_pak}
			return
		endif
		enableduplicatesymbolwarning
		change global_content_index_pak_language = <pakname>
		pop_unsafe_for_shutdown \{reason = dlc_content_load_language_pak}
	else
		printf qs(0x3906d03d) s = <pakname>
	endif
endscript

script downloads_postenumcontent 
	scan_globaltag_downloads \{dlc_scan}
endscript
downloads_enumcontentfiles_continue_flag = 1

script downloads_enumcontentfiles_continue 
	change \{downloads_enumcontentfiles_continue_flag = 1}
endscript

script downloads_unloadcontent 
	if scriptexists \{downloads_shutdown}
		downloads_shutdown
	endif
	if NOT ($global_content_index_pak = 'none')
		unloadpak ($global_content_index_pak)
		change \{global_content_index_pak = 'none'}
	endif
	if NOT ($global_content_index_pak_language = 'none')
		unloadpak ($global_content_index_pak_language)
		change \{global_content_index_pak_language = 'none'}
	endif
	songunload
endscript

script downloads_opencontentfolder 
	opencontentfolder content_index = <content_index>
	return <folder_command_success>
endscript

script downloads_closecontentfolder \{force = 0}
	closecontentfolder content_index = <content_index>
	return <folder_command_success>
endscript

script find_instrument_index 
	return \{index = 0
		false}
endscript

script store_select_downloads 
	netsessionfunc \{func = showmarketplaceui}
	wait_for_blade_complete
	downloads_unloadcontent
endscript

script fmod_diskejected_event 
	printf \{qs(0x71a1ceda)}
	downloadcontentlost
endscript

script downloadcontentlost 
	printf \{'DownloadContentLost'}
	printscriptinfo \{qs(0xca95b489)}
	change \{loadpak_lock = 0}
	reset_dlc_signin_state
	if scriptisrunning \{downloads_enumcontent}
		change \{g_downloads_enumcontent_fail = 1}
		return
	endif
	if scriptisrunning \{songlist_item_add_to_playlist}
		killspawnedscript \{name = songlist_item_add_to_playlist}
	endif
	if scriptisrunning \{song_preview_monitor}
		killspawnedscript \{name = song_preview_monitor}
	endif
	if scriptisrunning \{ui_create_play_song_spawned}
		killspawnedscript \{name = ui_create_play_song_spawned}
	endif
	if scriptisrunning \{ui_create_freeplay_spawned}
		killspawnedscript \{name = ui_create_freeplay_spawned}
	endif
	if scriptisrunning \{restart_song}
		killspawnedscript \{name = restart_song}
	endif
	waitforasyncloadandsavetofinish
	change \{is_changing_levels = 0}
	change \{practice_songpreview_changing = 0}
	spawnscriptnow \{noqbid
		downloadcontentlost_spawned}
	killspawnedscript \{name = downloadcontentlost}
endscript

script downloadcontentlost_spawned 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf \{'DownloadContentLost_Spawned'}
	if NOT ($shutdown_game_for_signin_change_flag = 0)
		return
	endif
	printf \{'DownloadContentLost_Spawned shutdown_game_for_signin_change_flag==0'}
	change \{respond_to_signin_changed = 0}
	printf \{qs(0x8a0f6c71)}
	disable_pause
	destroy_loading_screen
	blockforscript \{destroy_loading_screen_spawned}
	create_bink_sub_heaps
	create_loading_screen \{no_bink}
	ui_event_block \{event = menu_back
		data = {
			state = uistate_null
		}}
	shutdown_game_for_signin_change
	waitforasyncloadandsavetofinish
	removecontentfiles \{clear_cache}
	waitforasyncloadandsavetofinish
	ui_event_block \{event = menu_change
		data = {
			state = uistate_signin_changed
			clear_previous_stack
		}}
	destroy_loading_screen \{force = 1}
	launchevent \{type = unfocus
		target = root_window}
	create_downloadcontentlost_menu
	startrendering
	setbuttoneventmappings \{unblock_menu_input}
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
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
	none
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
	if globaltagexists <song_checksum> noassert = 1
		setglobaltags <song_checksum> params = {available_on_other_client = 0}
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	printf qs(0xb1f247c3) i = <array_size>
	return \{true}
endscript

script net_match_set_available_items 
	getsonglistsize
	song_count = 0
	begin
	getsonglistchecksum index = <song_count>
	if globaltagexists <song_checksum> noassert = 1
		setglobaltags <song_checksum> params = {available_on_other_client = 1}
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	printf qs(0xb1f247c3) i = <array_size>
	return \{true}
endscript

script set_online_available_dlc_songs 
	net_match_clear_available_items
	songlistmatch \{func = max_songs}
	i = 0
	begin
	if (songlistmatch func = is_match index = <i>)
		formattext checksumname = song_name 'dlc%i' i = <i>
		setglobaltags <song_name> params = {available_on_other_client = 1}
	endif
	i = (<i> + 1)
	repeat <max_songs>
	change \{net_match_dlc_sync_finished = 1}
endscript
