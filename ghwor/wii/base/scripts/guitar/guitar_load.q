song_heap_status = None
song_heap_pakname = 'none'
song_heap_required = 0
song_prefix = 'none'
song_perf = ''

script dump_song_heap_status \{title = qs(0x5c9f30ca)}
	printf \{channel = loading
		qs(0xaa9ecf0f)}
	printf channel = loading qs(0x0bc409e2) a = <title>
	printf \{channel = loading
		qs(0xaa9ecf0f)}
	printf channel = loading qs(0xe5d7dcde) a = ($song_heap_pakname) c = ($song_heap_status) b = ($song_heap_required)
	printf \{channel = loading
		qs(0xaa9ecf0f)}
endscript

script load_song_pak \{song_prefix = 'blah'
		song_perf_ext = ''
		async = 0}
	RequireParams \{[
			songqpak
		]
		all}
	if ischecksum <songqpak>
		ScriptAssert \{'%s is a checksum! It should be a nonloc string'}
	endif
	formatText checksumName = songcrc '%a' a = <songqpak> AddToStringLookup = true
	dump_song_heap_status \{title = qs(0xe2c270c6)}
	if ($song_heap_status = <songcrc>)
		return \{true}
	endif
	enablesongsymboltableasset
	UnLoadPak ($song_heap_pakname)
	WaitUnloadPak ($song_heap_pakname)
	enablesongsymboltableasset \{OFF}
	unload_any_song_anims song_prefix = ($song_prefix) song_perf_ext = ($song_perf)
	Change \{song_heap_status = None}
	Change song_heap_status = <songcrc>
	Change song_heap_pakname = <songqpak>
	Change \{song_heap_required = 1}
	Change song_prefix = <song_prefix>
	Change song_perf = <song_perf_ext>
	dump_song_heap_status \{title = qs(0x44ad2c2d)}
	yield
	if NOT LoadPakAsync pak_name = <songqpak> Heap = quota_song no_vram async = <async> file_filter = filter_song_q_symbols
		ScriptAssert \{'LoadPakAsync failed!'}
		return \{FALSE}
	endif
	yield
	return \{true}
endscript

script unload_song_pak 
	dump_song_heap_status \{title = qs(0xd750a239)}
	Change \{song_heap_required = 0}
	enablesongsymboltableasset
	UnLoadPak \{$song_heap_pakname}
	WaitUnloadPak \{$song_heap_pakname}
	enablesongsymboltableasset \{OFF}
	unload_any_song_anims song_prefix = ($song_prefix) song_perf_ext = ($song_perf)
	Change \{song_heap_status = None}
	Change \{song_heap_pakname = 'none'}
	dump_song_heap_status \{title = qs(0x3ce9ae5c)}
endscript

script unload_all_song_paks 
	unload_song_pak <...>
	Change \{current_song_qpak = None}
	Change \{current_song_qpak_performance = 0}
endscript

script filter_song_q_symbols 
	if (<preload> = true)
		enablesongsymboltableasset
	else
		enablesongsymboltableasset \{OFF}
	endif
	return \{true}
endscript
in_song_loading_active = 0

script load_song_from_sd \{song_name = None}
	printf 'load_song_from_SD song_name=%s' s = <song_name>
	if dlcmanagerfunc func = get_content_id content_name = <song_name>
		if NOT dlcmanagerfunc func = have_content_info content_id = <content_id>
			printf \{'Missing catalog info... trying to reload the catalogs now!'}
			begin
			if NOT dlccatalogmanagerfunc \{func = is_busy}
				break
			endif
			WaitOneGameFrame
			repeat
			dlccatalogmanagerfunc \{func = load_catalogs}
			begin
			if NOT dlccatalogmanagerfunc \{func = is_busy}
				break
			endif
			WaitOneGameFrame
			repeat
			Wait \{5
				gameframes}
		endif
		if NOT dlcmanagerfunc func = have_content_info content_id = <content_id>
			printf \{'UNABLE TO GET THE CATALOG INFORMATION FOR THIS SONG LOADED!!'}
			return \{FALSE
				error_text = qs(0xf576728e)}
		endif
		if NOT is_song_downloaded song_checksum = <song_name>
			printf \{'CONTENT IS NO LONGER VALID (1)!!! (SD EJECT?)'}
			printstruct <...>
			return \{FALSE
				error_text = qs(0x624e56ea)}
		endif
		printstruct <...>
		if ((GotParam content_on_sd) || (GotParam patch_on_sd))
			sap_stop
			disablereset
			sdcardmanagerfunc \{func = setup_transfer}
			if sdcardmanagerfunc func = restore content_name = <song_name> use_cache
				WaitForEvent \{Type = sdcard_transfer_complete}
			endif
			sdcardmanagerfunc \{func = get_transfer_results}
			sdcardmanagerfunc \{func = shutdown_transfer}
			enablereset
			printstruct <...>
			if wii_dlc_get_error_text <...>
				printf \{'TRANSFER ERROR!'}
				return FALSE error_text = <error_text>
			endif
			RemoveParameter \{content_on_sd}
			RemoveParameter \{patch_on_sd}
			if NOT is_song_downloaded song_checksum = <song_name>
				printf \{'CONTENT IS NO LONGER VALID (2)!!! (SD EJECT?)'}
				printstruct <...>
				return \{FALSE
					error_text = qs(0x624e56ea)}
			endif
			if ((GotParam content_on_sd) || (GotParam patch_on_sd))
				printf \{'CONTENT IS STILL ON THE SD CARD!'}
				if GotParam \{content_on_sd}
					if StructureContains structure = <transfer_results> <song_name>
						if wii_dlc_get_error_text (<transfer_results>.<song_name>)
							printstruct <...>
							return FALSE error_text = <error_text>
						endif
					endif
				endif
				if GotParam \{patch_on_sd}
					<patch_name> = None
					<song_struct> = ($download_songlist_props.<song_name>)
					if StructureContains structure = (<song_struct>) patch_id
						if dlcmanagerfunc func = get_content_checksum content_name = (<song_struct>.patch_id)
							<patch_name> = <content_checksum>
						endif
					endif
					if StructureContains structure = <transfer_results> <patch_name>
						if wii_dlc_get_error_text (<transfer_results>.<patch_name>)
							printstruct <...>
							return FALSE error_text = <error_text>
						endif
					endif
				endif
				return \{FALSE
					error_text = qs(0x624e56ea)}
			endif
			printf \{'Success!'}
		else
			printf \{'Content not on the SD... all good!'}
		endif
	else
		printf \{'Song is not DLC...'}
	endif
	return \{true}
endscript

script load_song_from_sd_needed \{song_name = None}
	if dlcmanagerfunc func = get_content_id content_name = <song_name>
		if NOT dlcmanagerfunc func = have_content_info content_id = <content_id>
			return \{true}
		endif
		is_song_downloaded song_checksum = <song_name>
		if ((GotParam content_on_sd) || (GotParam patch_on_sd))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript
dlc_online_delayed_error = 0
dlc_online_delayed_error_text = qs(0x03ac90f0)

script online_sd_ejected_error 
	spawnscript \{band_lobby_disc_eject_handler}
	if (($dlc_online_delayed_error = 1) || ($g_connection_loss_dialog = 1))
		return
	endif
	if ($is_network_game = 1)
		wii_dlc_get_error_text \{error_crc = cntsd_result_sd_ejected}
		song_load_failed error_text = <error_text>
	endif
endscript

script song_load_failed \{error_text = qs(0xb2921c25)}
	if (($dlc_online_delayed_error = 1) || ($g_connection_loss_dialog = 1))
		return
	endif
	if ($is_network_game = 1)
		Change \{dlc_online_delayed_error = 1}
		Change dlc_online_delayed_error_text = <error_text>
		networkhandledlcerror
	else
		if NOT ScriptIsRunning \{sysnotify_handle_song_load_failed}
			if NOT GotParam \{no_loading_screen}
				create_loading_screen
			else
				Change \{is_changing_levels = 1}
				pushunsafeforshutdown \{context = loading_screen
					Type = unchecked}
			endif
			SpawnScriptNow sysnotify_handle_song_load_failed params = {error_text = <error_text>}
		endif
	endif
endscript
