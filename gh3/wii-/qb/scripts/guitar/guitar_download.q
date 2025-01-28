gh3_download_songs = {
	prefix = 'download'
	num_tiers = 1
	tier1 = {
		title = 'Downloaded songs'
		songs = [
		]
		defaultunlocked = 4
		level = load_z_artdeco
	}
}

script scan_globaltag_downloads 
	setup_setlisttags \{setlist_songs = gh3_download_songs
		force = 1}
	setup_songtags
	setup_generalvenuetags
	setup_characterguitar_tags
endscript
global_content_index_pak = 'none'
global_content_index_pak_language = 'none'

script downloads_enumcontent 
	mark_unsafe_for_shutdown
	if enumcontentfiles \{download
			dofiles}
		begin
		if enumcontentfilesfinished
			break
		else

			wait \{1
				gameframe}
		endif
		repeat
	endif
	mark_safe_for_shutdown
	if isenumcontentfilesdamaged
		destroy_popup_warning_menu
		create_popup_warning_menu \{create_popup_warning_menu
			textblock = {
				text = 'A content package appears damaged or unreadable. Please re-download the content package.'
				wait
				3
				seconds
			}
			menu_pos = (640.0, 490.0)
			dialog_dims = (288.0, 64.0)
			options = [
				{
					func = {
						downloads_enumcontentfiles_continue
					}
					text = 'CONTINUE'
					scale = (1.0, 1.0)
				}
			]}
		change \{downloads_enumcontentfiles_continue_flag = 0}
		begin
		if ($downloads_enumcontentfiles_continue_flag = 1)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	if getlatestcontentindexfile

		mark_unsafe_for_shutdown
		enableduplicatesymbolwarning \{off}
		if NOT loadpakasync pak_name = <filename> heap = heap_downloads async = 1
			enableduplicatesymbolwarning
			mark_safe_for_shutdown
			downloadcontentlost
			return
		endif
		enableduplicatesymbolwarning
		change global_content_index_pak = <filename>
		mark_safe_for_shutdown
		downloads_loadlanguagecontent <...>
	else

	endif
	if scriptexists \{downloads_startup}
		downloads_startup
	endif
	downloads_postenumcontent
endscript

script destroy_downloads_enumcontent 
	killspawnedscript \{name = downloads_enumcontent}
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

	endif
endscript

script downloads_postenumcontent 
	download_recreatezones
	scan_globaltag_downloads
endscript
downloads_enumcontentfiles_continue_flag = 0

script downloads_enumcontentfiles_continue 
	change \{downloads_enumcontentfiles_continue_flag = 1}
endscript

script downloads_unloadcontent 
	killspawnedscript \{name = downloads_opencontentfolder}
	change \{downloadcontentfolder_lock = 0}
	if NOT ($global_content_index_pak = 'none')
		unloadpak ($global_content_index_pak)
		change \{global_content_index_pak = 'none'}
	endif
	if NOT ($global_content_index_pak_language = 'none')
		unloadpak ($global_content_index_pak_language)
		change \{global_content_index_pak_language = 'none'}
	endif
endscript

script download_recreatezones 
	mark_unsafe_for_shutdown

	setpakmancurrentblock \{map = zones
		pak = none}
	destroypakmanmap \{map = zones}
	mempushcontext \{heap_zones}
	createpakmanmap \{map = zones
		links = gh3zones
		folder = 'zones/'
		uselinkslots}
	mempopcontext
	setpakmancurrentblock \{map = zones
		pak = z_soundcheck}
	mark_safe_for_shutdown
endscript
downloadcontentfolder_lock = 0
downloadcontentfolder_index = -1
downloadcontentfolder_count = 0

script downloads_opencontentfolder 
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
	begin
	getcontentfolderstate
	if (<contentfolderstate> = failed)
		change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		return \{false}
	endif
	if (<contentfolderstate> = opened)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change downloadcontentfolder_count = ($downloadcontentfolder_count + 1)
	change downloadcontentfolder_index = <content_index>
	mark_safe_for_shutdown
	return \{true}
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
			change \{downloadcontentfolder_count = 0}
			mark_safe_for_shutdown
			return \{true}
		endif
	endif
	if (<force> = 1)
		content_index = ($downloadcontentfolder_index)
	else
		change \{downloadcontentfolder_index = -1}
	endif
	if NOT closecontentfolder content_index = <content_index>
		change \{downloadcontentfolder_lock = 0}
		mark_safe_for_shutdown
		return \{false}
	endif
	begin
	getcontentfolderstate
	if (<contentfolderstate> = free)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{downloadcontentfolder_lock = 0}
	mark_safe_for_shutdown
	return \{true}
endscript

script create_download_scan_menu 
	change \{menu_flow_play_sound = 0}
	if ($downloadcontent_enabled = 0)
		ui_flow_manager_respond_to_action \{action = continue}
		return
	endif
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu \{textblock = {
				text = 'Checking the HDD. Do not switch off your console.'
			}}
		wait \{1
			gameframes}
		case xenon
		create_popup_warning_menu \{textblock = {
				text = 'Checking for downloadable content. Please don\'t turn off your Xbox 360 console.'
			}}
	endswitch
	downloads_enumcontent
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script destroy_download_scan_menu 
	destroy_popup_warning_menu
endscript

script is_musician_profile_downloaded 
	getarraysize \{$musician_profiles}
	if (<index> < <array_size>)
		return \{download = 0
			true}
	else
		profile_struct = ($download_musician_profiles [(<index> - <array_size>)])
		get_pak_filename desc_id = (<profile_struct>.musician_body.desc_id) type = body
		getcontentfolderindexfromfile <pak_name>
		if (<device> = content)
			return \{download = 1
				true}
		else
			return \{download = 1
				false}
		endif
	endif
endscript

script is_musician_instrument_downloaded 
	getarraysize \{$musician_instrument}
	if (<index> < <array_size>)
		return \{download = 0
			true}
	else
		profile_struct = ($download_musician_instrument [(<index> - <array_size>)])
		get_pak_filename desc_id = (<profile_struct>.desc_id) type = instrument
		getcontentfolderindexfromfile <pak_name>
		if (<device> = content)
			return \{download = 1
				true}
		else
			return \{download = 1
				false}
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
	repeat <array_size>
	return \{false}
endscript

script store_select_downloads 
	netsessionfunc \{func = showmarketplaceui}
	wait_for_blade_complete
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	destroy_band
	downloads_unloadcontent
endscript

script fmod_diskejected_event 

	downloadcontentlost
endscript

script downloadcontentlost 
	printscriptinfo \{'DownloadContentLost'}
	spawnscriptnow \{downloadcontentlost_spawned}
	killspawnedscript \{name = downloadcontentlost}
endscript

script downloadcontentlost_spawned 
	if ($respond_to_signin_changed = 0)
		return
	endif
	change \{respond_to_signin_changed = 0}

	disable_pause
	stoprendering
	shutdown_game_for_signin_change
	launchevent \{type = unfocus
		target = root_window}
	create_downloadcontentlost_menu
	startrendering

endscript

script create_downloadcontentlost_menu 
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = 'CONTENT CHANGED'
		title_props = {
			scale = 1.0
		}
		textblock = {
			text = 'Download Content has changed. As a result, the game has restarted.'
			pos = (640.0, 380.0)
		}
		menu_pos = (640.0, 490.0)
		dialog_dims = (288.0, 64.0)
		options = [
			{
				func = {
					downloadcontentlost_reboot
				}
				text = 'CONTINUE'
				scale = (1.0, 1.0)
			}
		]}
endscript

script downloadcontentlost_reboot 

	destroy_downloadcontentlost_menu
	enable_pause
	wait \{5
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
net_match_available_items_request_finished = 0
net_match_send_available_items_dirty = 0

script net_match_send_available_items 

	disable_pause
	if ($net_match_send_available_items_dirty = 0)
		return
	endif
	change \{net_match_send_available_items_dirty = 0}
	if NOT ishost
		destroy_popup_warning_menu
		create_popup_warning_menu \{title = 'ONLINE'
			title_props = {
				scale = 1.0
			}
			textblock = {
				text = 'Sending Profile Information. Please Wait.'
				pos = (640.0, 380.0)
			}}
	endif
	net_match_clear_available_items
	change \{net_match_available_items_request_finished = 0}
	sendstructure \{callback = net_match_available_items_send
		data_to_send = {
			none
		}}
	wait_for_net_match_available_items
	if NOT ishost
		destroy_popup_warning_menu
	endif
	if ($0xfc677337)
		change \{0xfc677337 = 0}
		skiprenderframes \{10}
	endif

endscript

script net_match_clear_available_items 
	get_songlist_size
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	setglobaltags <song_checksum> params = {available_on_other_client = 0}
	song_count = (<song_count> + 1)
	repeat <array_size>

	guitar_array = ($bonus_guitars)
	store_add_secret_guitars_and_basses guitar_array = (<guitar_array>)
	getarraysize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	setglobaltags <guitar_id> params = {unlocked_on_other_client = 0
		available_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_size>
	guitar_array = ($bonus_guitar_finishes)
	getarraysize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	setglobaltags <guitar_id> params = {unlocked_on_other_client = 0
		available_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_size>
	character_array = ($secret_characters)
	getarraysize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	setglobaltags <character_id> params = {unlocked_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_size>
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	character_id = (<profile_struct>.musician_body.desc_id)
	setglobaltags <character_id> params = {available_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_size>
	character_array = ($bonus_outfits)
	getarraysize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	setglobaltags <character_id> params = {unlocked_on_other_client = 0
		available_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_size>
	character_array = ($bonus_styles)
	getarraysize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	setglobaltags <character_id> params = {unlocked_on_other_client = 0
		available_on_other_client = 0}
	<index> = (<index> + 1)
	repeat <array_size>
	return \{true}
endscript

script wait_for_net_match_available_items 
	begin
	if ($net_match_available_items_request_finished = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{net_match_available_items_request_finished = 0}
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
	repeat <array_size>
	net_match_send_items <...>
	net_match_init_items
	guitar_array = ($bonus_guitars)
	store_add_secret_guitars_and_basses guitar_array = (<guitar_array>)
	getarraysize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	getglobaltags <guitar_id>
	if (<unlocked> = 1)
		net_match_add_item <...> item = <guitar_id>
	endif
	get_instrument_name_and_index id = <guitar_id>
	<index> = (<index> + 1)
	repeat <array_size>
	net_match_send_items <...> for_unlock = 1
	net_match_init_items
	guitar_array = ($bonus_guitar_finishes)
	getarraysize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	getglobaltags <guitar_id>
	if (<unlocked> = 1)
		net_match_add_item <...> item = <guitar_id>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	net_match_send_items <...> for_unlock = 1
	net_match_init_items
	character_array = ($secret_characters)
	getarraysize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	getglobaltags <character_id>
	if (<unlocked> = 1)
		net_match_add_item <...> item = <character_id>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	net_match_send_items <...> for_unlock = 1
	character_array = ($bonus_outfits)
	getarraysize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	getglobaltags <character_id>
	if (<unlocked> = 1)
		net_match_add_item <...> item = <character_id>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	net_match_send_items <...> for_unlock = 1
	character_array = ($bonus_styles)
	getarraysize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	getglobaltags <character_id>
	if (<unlocked> = 1)
		net_match_add_item <...> item = <character_id>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	net_match_send_items <...> for_unlock = 1
	net_match_init_items \{type = download_guitars}
	if globalexists \{name = download_guitars}
		guitar_array = ($download_guitars)
		getarraysize <guitar_array>
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
		repeat <array_size>
	endif
	net_match_send_items <...>
	net_match_init_items \{type = download_basses}
	if globalexists \{name = download_basses}
		guitar_array = ($download_basses)
		getarraysize <guitar_array>
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
		repeat <array_size>
	endif
	net_match_send_items <...>
	net_match_init_items \{type = download_characters}
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
	repeat <array_size>
	net_match_send_items <...>
	wait \{1
		gameframe}
	net_match_init_items \{final = 1}
	net_match_send_items <...>

endscript

script net_match_init_items \{final = 0
		type = generic}
	change \{num_net_checksum_packet = 0}
	change \{total_num_net_checksum_packet = 0}
	return message_struct = {final = <final> type = <type>}
endscript

script net_match_add_item \{message_struct = {
			final = 0
		}}
	setarrayelement arrayname = net_checksum_packet globalarray index = ($num_net_checksum_packet) newvalue = <item>
	change num_net_checksum_packet = ($num_net_checksum_packet + 1)
	change total_num_net_checksum_packet = ($total_num_net_checksum_packet + 1)
	if ($num_net_checksum_packet = 20)
		message_struct = {message_link = <message_struct> net_items = ($net_checksum_packet) num_valid = 20}
		change \{num_net_checksum_packet = 0}
	endif
	return message_struct = <message_struct>
endscript

script net_match_send_items \{for_unlock = 0
		additional_info = {
		}}
	message_struct = {message_link = <message_struct> net_items = ($net_checksum_packet) num_valid = ($num_net_checksum_packet)}
	sendstructure callback = net_match_download_items_send_callback data_to_send = {message_struct = <message_struct> for_unlock = <for_unlock> total_items = ($total_num_net_checksum_packet) additional_info = <additional_info>}
endscript
download_characters_on_other_client = 0
download_basses_on_other_client = 0
download_guitars_on_other_client = 0

script net_match_download_items_send_callback 


	begin
	if NOT structurecontains structure = <message_struct> num_valid
		if (<message_struct>.final = 1)
			change \{net_match_available_items_request_finished = 1}
		endif
		break
	endif
	index = 0
	if ((<message_struct>.num_valid) > 0)
		begin
		if (<for_unlock> = 1)
			setglobaltags (<message_struct>.net_items [<index>]) params = {unlocked_on_other_client = 1}
		else
			setglobaltags (<message_struct>.net_items [<index>]) params = {available_on_other_client = 1}
		endif
		index = (<index> + 1)
		repeat (<message_struct>.num_valid)
	endif
	message_struct = (<message_struct>.message_link)
	repeat
	if (<message_struct>.type = download_characters)
		change download_characters_on_other_client = <total_items>
	endif
	if (<message_struct>.type = download_guitars)
		change download_guitars_on_other_client = <total_items>
	endif
	if (<message_struct>.type = download_basses)
		change download_basses_on_other_client = <total_items>
	endif
endscript
