gh3_download_songs = {
	prefix = 'download'
	num_tiers = 1
	tier1 = {
		title = "Downloaded songs"
		songs = [
		]
		defaultunlocked = 4
		level = load_z_artdeco
	}
}

script scan_globaltag_downloads 
	printstruct ($gh3_download_songs)
	setup_setlisttags \{setlist_songs = gh3_download_songs}
	setup_songtags
	setup_generalvenuetags
endscript
global_content_index_pak = 'none'

script downloads_enumcontent 
	if enumcontentfiles download dofiles
		begin
		if enumcontentfilesfinished
			break
		else
			wait 1 gameframe
		endif
		repeat
	endif
	if getlatestcontentindexfile
		print "Found latest content index file:"
		printstruct <...>
		downloads_opencontentfolder content_index = <content_index>
		enableduplicatesymbolwarning off
		loadpak <filename> device = <device> content_index = <content_index> heap = heap_downloads
		change global_content_index_pak = <filename>
		enableduplicatesymbolwarning
		downloads_closecontentfolder content_index = <content_index>
	else
		print "Found no latest content index file"
	endif
	getcontentfolderindexfromfile 'z_download_dive.pak'
	printf "GetContentFolderIndexFromFile"
	printstruct <...>
	if scriptexists downloads_startup
		downloads_startup
	endif
	downloads_postenumcontent
endscript

script downloads_postenumcontent 
	download_recreatezones
	scan_globaltag_downloads
endscript

script downloads_unloadcontent 
	if NOT ($global_content_index_pak = 'none')
		unloadpak ($global_content_index_pak)
		change \{global_content_index_pak = 'none'}
	endif
endscript

script download_recreatezones 
	printf \{"Loading Zone"}
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	destroypakmanmap \{map = zones}
	mempushcontext \{heap_zones}
	createpakmanmap \{map = zones
		links = gh3zones
		folder = 'zones/'
		uselinkslots}
	mempopcontext
	setpakmancurrentblock \{map = zones
		pak = z_soundcheck
		block_scripts = 1}
endscript
downloadcontentfolder_lock = 0

script downloads_opencontentfolder 
	begin
	if ($downloadcontentfolder_lock = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{downloadcontentfolder_lock = 1}
	opencontentfolder content_index = <content_index>
	begin
	getcontentfolderstate
	if (<contentfolderstate> = opened)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script downloads_closecontentfolder 
	closecontentfolder content_index = <content_index>
	begin
	getcontentfolderstate
	if (<contentfolderstate> = free)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{downloadcontentfolder_lock = 0}
endscript

script create_download_scan_menu 
	if ($downloadcontent_enabled = 0)
		ui_flow_manager_respond_to_action action = continue
		return
	endif
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = "Checking the HDD. Do not switch off your console."
			}
		}
		case xenon
		create_popup_warning_menu {
			textblock = {
				text = "Checking for downloadable content. Please don't turn off your Xbox 360 console."
			}
		}
	endswitch
	downloads_enumcontent
	ui_flow_manager_respond_to_action action = continue
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
