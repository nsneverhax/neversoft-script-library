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
	lockglobaltags \{off}
	printstruct ($gh4_download_songlist)
	get_num_globaltag_sets
	if (<num_globaltag_sets> > 0)
		savegame = 0
		begin
		setup_setlisttags savegame = <savegame> setlist_songs = gh4_download_songs_guitar part = guitar songlist = gh4_download_songlist download = 1
		setup_setlisttags savegame = <savegame> setlist_songs = gh4_download_songs_bass part = bass songlist = gh4_download_songlist download = 1
		setup_setlisttags savegame = <savegame> setlist_songs = gh4_download_songs_drums part = drum songlist = gh4_download_songlist download = 1
		setup_setlisttags savegame = <savegame> setlist_songs = gh4_download_songs_vocals part = vocals songlist = gh4_download_songlist download = 1
		setup_setlisttags savegame = <savegame> setlist_songs = gh4_download_songs_band part = band songlist = gh4_download_songlist download = 1
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
global_content_index_pak = 'none'
global_content_index_pak_language = 'none'

script downloads_enumcontent controller = ($primary_controller)
	removecontentfiles playerid = <controller>
	downloads_unloadcontent
	mark_unsafe_for_shutdown
	if enumcontentfiles download dofiles playerid = <controller>
		begin
		if enumcontentfilesfinished
			break
		else
			printf \{qs(0xd10f5883)}
			wait \{1
				gameframe}
		endif
		repeat
	endif
	mark_safe_for_shutdown
	if isenumcontentfilesdamaged
		destroy_popup_warning_menu
		create_popup_warning_menu {
			player_device = <controller>
			create_popup_warning_menu {
				textblock = {
					text = qs(0xa08469f7)
					wait 3 seconds
				}
			}
			menu_pos = (640.0, 490.0)
			options = [
				{
					func = {downloads_enumcontentfiles_continue}
					text = qs(0x182f0173)
					scale = (1.0, 1.0)
				}
			]
		}
		change \{downloads_enumcontentfiles_continue_flag = 0}
		begin
		if ($downloads_enumcontentfiles_continue_flag = 1)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	setsearchallcontentfolders
	filename = 'adl1.pak'
	getcontentfolderindexfromfile <filename>
	if (<device> = content)
		printf \{qs(0xe31afb3f)}
		printstruct <...>
		mark_unsafe_for_shutdown
		enableduplicatesymbolwarning \{off}
		if NOT loadpakasync pak_name = <filename> heap = heap_save_file async = 1 is_raw = true no_vram
			enableduplicatesymbolwarning
			mark_safe_for_shutdown
			downloadcontentlost
			setsearchallcontentfolders \{off}
			return
		endif
		enableduplicatesymbolwarning
		unloadpak <filename>
		mark_safe_for_shutdown
	else
		printf \{qs(0xf4fbf8ce)}
	endif
	setsearchallcontentfolders \{off}
	if scriptexists \{downloads_startup}
		downloads_startup
	endif
	downloads_postenumcontent
endscript

script destroy_downloads_enumcontent 
	killspawnedscript \{name = downloads_enumcontent}
	killspawnedscript \{name = boot_download_scan}
	downloads_closecontentfolder \{force = 1}
endscript

script downloads_loadlanguagecontent 
	formattext textname = pakname '%s_text.pak' s = <stem>
	if english
		formattext textname = pakname '%s_text.pak' s = <stem>
	elseif french
		formattext textname = pakname '%s_text_f.pak' s = <stem>
	elseif italian
		formattext textname = pakname '%s_text_i.pak' s = <stem>
	elseif german
		formattext textname = pakname '%s_text_g.pak' s = <stem>
	elseif spanish
		formattext textname = pakname '%s_text_s.pak' s = <stem>
	endif
	getcontentfolderindexfromfile <pakname>
	if (<device> = content)
		printf qs(0x6af97d82) s = <pakname>
		mark_unsafe_for_shutdown
		enableduplicatesymbolwarning \{off}
		if NOT loadpakasync pak_name = <pakname> heap = heap_downloads async = 1
			enableduplicatesymbolwarning
			mark_safe_for_shutdown
			downloadcontentlost
			return
		endif
		enableduplicatesymbolwarning
		change global_content_index_pak_language = <pakname>
		mark_safe_for_shutdown
	else
		printf qs(0x3906d03d) s = <pakname>
	endif
endscript

script downloads_postenumcontent 
	scan_globaltag_downloads
endscript
downloads_enumcontentfiles_continue_flag = 0

script downloads_enumcontentfiles_continue 
	change \{downloads_enumcontentfiles_continue_flag = 1}
endscript

script downloads_unloadcontent 
	setsearchallcontentfolders \{off}
	killspawnedscript \{name = downloads_opencontentfolder}
	change \{downloadcontentfolder_lock = 0}
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
endscript
downloadcontentfolder_lock = 0
downloadcontentfolder_index = -1
downloadcontentfolder_count = 0

script downloads_opencontentfolder 
	unpausespawnedscript \{downloads_closecontentfolder}
	mark_unsafe_for_shutdown
	begin
	if ($downloadcontentfolder_lock = 0)
		break
	endif
	if ($downloadcontentfolder_index = <content_index>)
		change downloadcontentfolder_count = ($downloadcontentfolder_count + 1)
		mark_safe_for_shutdown
		return \{true}
	endif
	wait \{1
		gameframe}
	repeat
	change \{downloadcontentfolder_lock = 1}
	if NOT opencontentfolder content_index = <content_index>
		mark_safe_for_shutdown
		return \{false}
	endif
	if gotparam \{close_if_script_killed}
		onexitrun downloads_opencontentfolder_cleanupandclose params = {content_index = <content_index>}
	endif
	begin
	getcontentfolderstate
	if (<contentfolderstate> = failed)
		change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		onexitrun \{0x00000000}
		return \{false}
	endif
	if (<contentfolderstate> = opened)
		break
	endif
	wait \{1
		gameframe}
	repeat
	onexitrun \{0x00000000}
	change downloadcontentfolder_count = ($downloadcontentfolder_count + 1)
	change downloadcontentfolder_index = <content_index>
	mark_safe_for_shutdown
	return \{true}
endscript

script downloads_opencontentfolder_cleanupandclose 
	printf \{qs(0x2668da8f)}
	spawnscriptnow downloads_closecontentfolder params = {content_index = <content_index>}
endscript

script downloads_closecontentfolder \{force = 0}
	mark_unsafe_for_shutdown
	if (<force> = 1)
		if ($downloadcontentfolder_index = -1)
			mark_safe_for_shutdown
			return
		endif
	endif
	if (<force> = 1)
		change \{downloadcontentfolder_count = 0}
	else
		change downloadcontentfolder_count = ($downloadcontentfolder_count - 1)
		if ($downloadcontentfolder_count > 0)
			mark_safe_for_shutdown
			return \{true}
		endif
	endif
	if (<force> = 1)
		content_index = ($downloadcontentfolder_index)
	else
		change \{downloadcontentfolder_index = -1}
	endif
	begin
	getcontentfolderstate
	switch <contentfolderstate>
		case opened
		break
		case free
		case failed
		change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		return \{false}
		default
		wait \{1
			gameframe}
	endswitch
	repeat
	if NOT closecontentfolder content_index = <content_index>
		change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		return \{false}
	endif
	begin
	getcontentfolderstate
	switch <contentfolderstate>
		case free
		break
		case failed
		change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		return \{false}
		default
		wait \{1
			gameframe}
	endswitch
	repeat
	change \{downloadcontentfolder_lock = 0}
	mark_safe_for_shutdown
	return \{true}
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
	change \{is_changing_levels = 0}
	change \{practice_songpreview_changing = 0}
	printscriptinfo \{qs(0xca95b489)}
	spawnscriptnow \{noqbid
		downloadcontentlost_spawned}
	killspawnedscript \{name = setlist_choose_song}
	killspawnedscript \{name = downloadcontentlost}
endscript

script downloadcontentlost_spawned 
	if NOT ($shutdown_game_for_signin_change_flag = 0)
		return
	endif
	if ($respond_to_signin_changed = 0)
		return
	endif
	change \{respond_to_signin_changed = 0}
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
	destroy_loading_screen \{force = 1}
	launchevent \{type = unfocus
		target = root_window}
	create_downloadcontentlost_menu
	startrendering
	setbuttoneventmappings \{unblock_menu_input}
	printf \{qs(0xc68e2781)}
endscript

script create_downloadcontentlost_menu 
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = qs(0x10facad3)
		title_props = {
			scale = 1.0
		}
		textblock = {
			text = qs(0x75e38f5b)
			pos = (640.0, 380.0)
		}
		menu_pos = (640.0, 490.0)
		options = [
			{
				func = {
					downloadcontentlost_reboot
				}
				text = qs(0x182f0173)
				scale = (1.0, 1.0)
			}
		]}
endscript

script downloadcontentlost_reboot 
	printf \{qs(0x1858183e)}
	destroy_downloadcontentlost_menu
	wait \{5
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
net_match_available_items_request_finished = 0
net_match_dlc_sync_finished = 0

script net_match_send_available_items 
	printf \{qs(0xdf3f3534)}
	disable_pause
	change \{net_match_dlc_sync_finished = 0}
	if ishost
		net_match_send_available_items_host
	else
		net_match_send_available_items_client
	endif
	change \{net_match_dlc_sync_finished = 1}
	printf \{qs(0x7e7258ae)}
endscript

script net_match_send_available_items_host 
	net_match_clear_available_items \{for_host = 1}
	sendstructure \{callback = net_match_download_items_send
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
		setglobaltags <song_checksum> params = {available_on_other_client = 0}
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	printf qs(0xb1f247c3) i = <array_size>
	return \{true}
endscript

script net_match_set_available_items 
	get_songlist_size
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	if globaltagexists <song_checksum> noassert = 1
		setglobaltags <song_checksum> params = {available_on_other_client = 1}
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	printf qs(0xb1f247c3) i = <array_size>
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
		if is_song_downloaded song_checksum = <song_checksum>
			getglobaltags <song_checksum>
			if (<available_on_other_client> >= <num_connections>)
				setglobaltags <song_checksum> params = {available_on_other_client = 1}
			else
				setglobaltags <song_checksum> params = {available_on_other_client = 0}
			endif
		else
			setglobaltags <song_checksum> params = {available_on_other_client = 0}
		endif
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	printf \{qs(0xb2c7132d)}
	return \{true}
endscript

script clear_wait_for_net_match_available_items 
	change \{net_match_available_items_request_finished = 0}
endscript

script wait_for_net_match_available_items \{num_finished = 1}
	begin
	if ($net_match_available_items_request_finished = <num_finished>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	clear_wait_for_net_match_available_items
endscript

script net_match_verify_host 
	if ishost
		is_host = 1
	else
		is_host = 0
	endif
	if NOT (<is_host> = <for_host>)
		printf \{qs(0xe518c972)}
		printstruct <...>
		return \{false}
	else
		return \{true}
	endif
endscript

script net_match_download_items_send 
	printf \{qs(0x8dbce89d)}
	if NOT net_match_verify_host for_host = <for_host>
		return
	endif
	if NOT ishost
		net_match_clear_available_items \{for_host = 0}
	endif
	net_match_init_items for_host = (1 - <for_host>)
	get_songlist_size
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	if globaltagexists <song_checksum> noassert = 1
		if ishost
			getglobaltags <song_checksum>
			if (<available_on_other_client> = 1)
				net_match_add_item item = <song_checksum>
			endif
		else
			if is_song_downloaded song_checksum = <song_checksum>
				net_match_add_item item = <song_checksum>
			endif
		endif
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	net_match_send_items
	wait \{1
		gameframe}
	net_match_init_items for_host = (1 - <for_host>)
	net_match_send_items \{final = 1}
	printf \{qs(0xdb933c51)}
endscript

script net_match_init_items 
	change \{num_net_checksum_packet = 0}
	change \{total_num_net_checksum_packet = 0}
	change net_checksum_packet_for_host = <for_host>
endscript

script net_match_add_item 
	setarrayelement arrayname = net_checksum_packet globalarray index = ($num_net_checksum_packet) newvalue = <item>
	change num_net_checksum_packet = ($num_net_checksum_packet + 1)
	if ($num_net_checksum_packet = 20)
		change total_num_net_checksum_packet = ($total_num_net_checksum_packet + 1)
		net_match_send_items
		change \{num_net_checksum_packet = 0}
	else
		return message_struct = <message_struct>
	endif
endscript

script net_match_send_items \{final = 0
		additional_info = {
		}}
	sendstructure callback = net_match_download_items_send_callback data_to_send = {net_items = ($net_checksum_packet)
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
			getglobaltags (<net_items> [<index>])
			available_on_other_client = (<available_on_other_client> + 1)
			setglobaltags (<net_items> [<index>]) params = {available_on_other_client = <available_on_other_client>}
		endif
		index = (<index> + 1)
		repeat <num_valid>
	endif
	if (<final> = 1)
		change net_match_available_items_request_finished = (($net_match_available_items_request_finished) + 1)
	endif
endscript
