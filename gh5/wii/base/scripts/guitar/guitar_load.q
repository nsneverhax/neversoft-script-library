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

script load_song_pak \{songqpak = blah
		song_prefix = 'blah'
		song_perf_ext = ''
		async = 0}
	formatText checksumName = songcrc '%a' a = <songqpak> AddToStringLookup = true
	dump_song_heap_status \{title = qs(0xe2c270c6)}
	if ($song_heap_status = <songcrc>)
		return \{true}
	endif
	printf \{channel = loading
		qs(0x363a19fe)
		a = $song_heap_pakname}
	printf \{qs(0x363a19fe)
		a = $song_heap_pakname}
	UnLoadPak ($song_heap_pakname)
	WaitUnloadPak ($song_heap_pakname)
	if ($use_old_system_setup = 0)
		unload_band_song_anims song = ($song_heap_status) async = 1
	endif
	unload_any_song_anims song_prefix = ($song_prefix) song_perf_ext = ($song_perf)
	Change \{song_heap_status = None}
	Change song_heap_status = <songcrc>
	Change song_heap_pakname = <songqpak>
	Change \{song_heap_required = 1}
	Change song_prefix = <song_prefix>
	Change song_perf = <song_perf_ext>
	dump_song_heap_status \{title = qs(0x44ad2c2d)}
	if NOT LoadPakAsync pak_name = <songqpak> Heap = quota_song no_vram async = <async>
		ScriptAssert \{'LoadPakAsync failed!'}
		return \{FALSE}
	endif
	return \{true}
endscript

script unload_song_pak 
	dump_song_heap_status \{title = qs(0xd750a239)}
	Change \{song_heap_required = 0}
	printf \{channel = loading
		qs(0x363a19fe)
		a = $song_heap_pakname}
	printf \{qs(0x363a19fe)
		a = $song_heap_pakname}
	UnLoadPak \{$song_heap_pakname}
	WaitUnloadPak \{$song_heap_pakname}
	if ($use_old_system_setup = 0)
		unload_band_song_anims song = ($song_heap_status) async = 1
	endif
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
in_song_loading_active = 0

script in_song_loading 
	Change \{in_song_loading_active = 1}
	printf \{channel = loading
		qs(0xf2709c6e)}
	unload_other_songqpak
	printf \{channel = loading
		qs(0xd95dcfad)}
	Wait \{1
		Second}
	if NOT gman_songfunc \{func = is_play_list_finished}
		gman_songfunc \{func = get_next_song}
		if ($medley_mode_on)
			get_medley_song \{index = 0}
			next_song = <medley_song>
		endif
		printf channel = loading qs(0x2d00d46b) s = <next_song>
		if is_song_downloaded song_checksum = <next_song>
			if NOT (GotParam content_on_sd)
				if NOT (GotParam patch_on_sd)
					load_songqpak song_name = <next_song> async = 1
					printf \{channel = loading
						qs(0x8f07682b)}
					band_load_anim_paks async = 1 song = <next_song>
					printf \{channel = loading
						qs(0x961c596a)}
				endif
			endif
		endif
	endif
	Change \{in_song_loading_active = 0}
endscript

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
				error_text = qs(0xcf6869d6)}
		endif
		if NOT is_song_downloaded song_checksum = <song_name>
			printf \{'CONTENT IS NO LONGER VALID (1)!!! (SD EJECT?)'}
			printstruct <...>
			return \{FALSE
				error_text = qs(0x91160c27)}
		endif
		printstruct <...>
		if ((GotParam content_on_sd) || (GotParam patch_on_sd))
			songstop \{slot = -1}
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
					error_text = qs(0x91160c27)}
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
					error_text = qs(0x91160c27)}
			endif
			print \{'Success!'}
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
			create_loading_screen
			SpawnScriptNow sysnotify_handle_song_load_failed params = {error_text = <error_text>}
		endif
	endif
endscript
