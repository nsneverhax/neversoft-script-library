music_store_songlist_buffer_size = 524288
songlist_pak_filename = 'songlist'

script music_store_init 
	mark_unsafe_for_shutdown
	music_store_show_loading_screen
	if ($music_store_inited = 1)
		ScriptAssert \{'Store already inited'}
	endif
	Change \{music_store_inited = 1}
	cas_destroy_all_characters
	unload_songqpak
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	flushdeferreddeletes
	if isps3
		vmheap \{func = swap_out}
		vmheap \{func = alloc_commerce}
		MemPushContext \{BottomUpHeap}
		MemInitHeap Name = 'heap_musicstore' size = (1024 * 1024) vram_size = (8 * 1024 * 1024)
		MemPopContext
	else
		MemPushContext \{$heap_song}
		MemInitHeap Name = 'heap_musicstore' size = (9 * 1024 * 1024)
		MemPopContext
	endif
	MemPushContext \{heap_musicstore}
	PushMemProfile \{'Songlist'}
	initdownloadsonglist buffer_size = ($music_store_songlist_buffer_size)
	PopMemProfile
	MemPopContext
	NetSessionFunc \{func = cdn_init}
	music_store_hide_loading_screen
	mark_safe_for_shutdown
endscript

script music_store_deinit 
	if ($music_store_inited = 1)
		Change \{music_store_inited = 0}
		music_store_show_loading_screen
		music_store_cleanup_asset_requests
		marketplacefunc \{func = deinit}
		NetSessionFunc \{func = cdn_uninit}
		flushdeferreddeletes
		if downloadsonglistloaded
			get_songlist_filename
			UnLoadPak <songlist_filename>
			unloaded_pak_flag = {unloaded_pak}
		endif
		freedownloadsonglist <unloaded_pak_flag>
		memdeleteheap \{Name = heap_musicstore}
		if isps3
			memdeleteheap \{Name = heap_musicstore_vram}
			vmheap \{func = free_commerce}
			vmheap \{func = swap_in}
		endif
		SetPakManCurrentBlock \{map = zones
			pak = z_soundcheck
			block_scripts = 1}
		music_store_hide_loading_screen
	endif
endscript

script music_store_show_loading_screen 
	if isps3
		DisplayLoadingScreen \{'boot_copyright_BG_1'
			spin3d_texture = 'load_wheel'
			spin_x = 877
			spin_y = 467
			Scale = 0.055
			speed = -2}
	endif
endscript

script music_store_hide_loading_screen 
	if isps3
		HideLoadingScreen
	endif
endscript

script music_store_preload_album_covers 
	RequireParams \{[
			list
		]
		all}
	music_store_calculate_image_limit
	GetArraySize <list>
	if (<array_Size> > 0)
		if (<array_Size> > <limit>)
			array_Size = <limit>
		endif
		array = []
		i = 0
		begin
		if StructureContains structure = (<list> [<i>]) asset_name
			AddArrayElement array = <array> element = ((<list> [<i>]).asset_name)
		endif
		i = (<i> + 1)
		repeat <array_Size>
		musicstorerequestimages images = <array>
	endif
endscript

script music_store_main_preload_album_covers 
	RequireParams \{[
			list_array
		]
		all}
	max_preload = 10
	GetArraySize <list_array>
	num_lists = <array_Size>
	if (<num_lists> > 0)
		i = 0
		begin
		music_store_preload_album_covers list = (<list_array> [<i>]) limit = <max_preload>
		i = (<i> + 1)
		repeat <num_lists>
	endif
endscript

script music_store_cleanup_asset_requests 
	if ScriptIsRunning \{music_store_request_album_cover_change}
		KillSpawnedScript \{Name = music_store_request_album_cover_change}
	endif
	if ScriptIsRunning \{music_store_change_album_cover}
		KillSpawnedScript \{Name = music_store_change_album_cover}
	endif
	if ScriptIsRunning \{music_store_replace_album_cover_when_loaded}
		KillSpawnedScript \{Name = music_store_replace_album_cover_when_loaded}
	endif
endscript

script get_songlist_filename 
	songlistfile = ($songlist_pak_filename)
	getterritory
	if French
		songlistfile = (<songlistfile> + '_f')
	elseif Italian
		songlistfile = (<songlistfile> + '_i')
	elseif German
		songlistfile = (<songlistfile> + '_g')
	elseif Spanish
		songlistfile = (<songlistfile> + '_s')
	elseif (<territory> != territory_us)
		songlistfile = (<songlistfile> + '_b')
	endif
	return songlist_filename = (<songlistfile> + '.pak')
endscript

script music_store_download_songlist 
	get_songlist_filename
	mark_unsafe_for_shutdown
	EnableDuplicateSymbolWarning \{OFF}
	setduplicateqsfilesassertstatus \{Enabled = FALSE}
	if downloadsonglist FileName = <songlist_filename>
		begin
		if downloadsonglistfinished
			printf \{qs(0x4e7bf527)}
			break
		endif
		printf \{qs(0x1c5cd493)}
		Wait \{1
			gameframe}
		repeat
	else
		success = 0
	endif
	setduplicateqsfilesassertstatus \{Enabled = true}
	EnableDuplicateSymbolWarning
	mark_safe_for_shutdown
	printstruct <...>
	if (<success> = 0)
		printf \{qs(0x4bf369a7)}
		return \{FALSE}
	else
		printf \{qs(0x726d014e)}
	endif
	return \{true}
endscript

script music_store_wait_for_manifest 
	mark_unsafe_for_shutdown
	Wait \{2
		gameframes}
	begin
	if NetSessionFunc \{Obj = cdn
			func = is_cdn_ready}
		printf \{qs(0x3e4d686a)}
		break
	endif
	if ($music_store_entry_cancelled = 1)
		printf \{qs(0xbfe6dcdc)}
		failed = 1
		break
	endif
	if NetSessionFunc \{Obj = cdn
			func = check_for_cdn_error}
		printf 'Manifest download error %e' e = <error>
		failed = 1
		break
	endif
	printf \{qs(0xe1bfc9fa)}
	Wait \{1
		gameframe}
	repeat
	mark_safe_for_shutdown
	if NetSessionFunc \{Obj = cdn
			func = check_for_cdn_error}
		failed = 1
	endif
	if GotParam \{failed}
		printf \{qs(0x2e0e7a7f)}
		return \{FALSE}
	endif
	return \{true}
endscript

script music_store_check_signin_state 
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if isps3
			return \{FALSE
				fail_text = qs(0x25f75105)}
		endif
		if NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
			return \{FALSE
				fail_text = qs(0xb9fd7c2c)}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			return \{FALSE
				fail_text = qs(0xd1dc3d89)}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = iscableunplugged}
				return \{FALSE
					fail_text = qs(0xa76a52e8)}
			endif
		else
			if isXenon
				dialog_txt = qs(0x680a3a16)
			elseif isps3
				dialog_txt = qs(0x25f75105)
			endif
			return FALSE fail_text = <dialog_txt>
		endif
	endif
	if isps3
		return \{true
			valid_user = 0}
	else
		return true valid_user = ($primary_controller)
	endif
endscript

script music_store_enumerate_store 
	mark_unsafe_for_shutdown
	if marketplacefunc \{func = enum_content}
		begin
		marketplacefunc \{func = get_state}
		if NOT (<state> = enum)
			break
		endif
		if NetSessionFunc \{Obj = cdn
				func = check_for_cdn_error}
			cdn_error = <error>
			break
		endif
		printf \{qs(0xa63efc50)}
		Wait \{1
			gameframe}
		repeat
		printf \{qs(0xa840b03b)}
		if NetSessionFunc \{Obj = cdn
				func = check_for_cdn_error}
			cdn_error = <error>
		endif
		if GotParam \{cdn_error}
			enum_error = <cdn_error>
		else
			if marketplacefunc \{func = is_enum_valid}
				mark_safe_for_shutdown
				return \{true}
			else
				printf \{qs(0x05aee8e5)}
				if marketplacefunc \{func = get_enum_error_result}
					printf qs(0x5d0e464d) e = <error>
					enum_error = <error>
				endif
			endif
		endif
	endif
	mark_safe_for_shutdown
	return FALSE enum_error = <enum_error>
endscript

script music_store_cancel_entry 
	printf 'music_store_cancel_entry - %s' s = ($music_store_entry_step)
	if ($music_store_entry_step = enum)
		generic_menu_pad_back_sound
		marketplacefunc \{func = cancel_enum}
		Change \{music_store_entry_step = None}
		Change \{music_store_entry_cancelled = 1}
	endif
	if ($music_store_entry_step = SongList)
		generic_menu_pad_back_sound
		canceldownloadsonglist
		Change \{music_store_entry_step = None}
		Change \{music_store_entry_cancelled = 1}
	endif
	if ($music_store_entry_step = manifest)
		generic_menu_pad_back_sound
		Change \{music_store_entry_step = None}
		Change \{music_store_entry_cancelled = 1}
	endif
endscript

script music_store_enum_heartbeat_start 
endscript

script music_store_enum_heartbeat_stop 
endscript

script music_store_enum_heartbeat_spawned 
endscript

script music_store_enum_wait_for_init_state 
	begin
	marketplacefunc \{func = get_state}
	if (<state> = init)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script music_store_purchase_content 
	printf \{'music_store_purchase_content - Starting checkout'}
	printstruct <purchase_struct>
	Change \{music_store_attempted_purchase = 1}
	Change \{generic_menu_block_input = 1}
	mark_unsafe_for_shutdown
	Dumpheaps
	marketplacefunc func = checkout id = (<purchase_struct>.code)
	begin
	marketplacefunc \{func = get_state}
	if NOT (<state> = checkout)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	mark_safe_for_shutdown
	Change \{generic_menu_block_input = 0}
	printf \{'music_store_purchase_content - Done checkout'}
endscript

script music_store_signin_check_start_checking 
	SpawnScriptNow \{music_store_signin_check_spawned}
endscript

script music_store_signin_check_stop_checking 
	KillSpawnedScript \{Name = music_store_signin_check_spawned}
endscript

script music_store_signin_check_spawned 
	begin
	if ($is_shutdown_safe = 1)
		if ($blade_active = 0)
			if NOT CheckForSignIn controller_index = ($primary_controller)
				if isps3
					music_store_signin_check_failed \{text = qs(0x25f75105)}
					return
				endif
				if NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
					music_store_signin_check_failed \{text = qs(0xb9fd7c2c)}
					return
				endif
				if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
					music_store_signin_check_failed \{text = qs(0x2e3df874)}
					return
				endif
				if CheckForSignIn local controller_index = ($primary_controller)
					if NetSessionFunc \{func = iscableunplugged}
						music_store_signin_check_failed \{text = qs(0x2e3df874)}
						return
					endif
				else
					if isXenon
						dialog_txt = qs(0x680a3a16)
					elseif isps3
						dialog_txt = qs(0x25f75105)
					endif
					music_store_signin_check_failed text = <dialog_txt>
					return
				endif
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script music_store_signin_check_failed 
	event = menu_change
	if ui_event_exists_in_stack \{Name = 'music_store_scan_marketplace'}
		event = menu_replace
	endif
	ui_event_wait event = <event> data = {state = uistate_music_store_unavailible text = <text>}
endscript

script music_store_calculate_image_limit 
	if isXenon
		return limit = (($default_music_store_image_cache_size_xenon) / ($default_music_store_image_size_xenon))
	else
		return limit = (($default_music_store_image_cache_size_ps3) / ($default_music_store_image_size_ps3))
	endif
endscript

script music_store_check_download_status 
	begin
	if NOT marketplacefunc func = currently_downloading id = <id>
		Obj_GetID
		SetScreenElementProps id = <objID> focusable
		SetScreenElementProps id = <objID> options_list_item_text_text = qs(0x40886130)
		break
	endif
	Wait \{2
		gameframes}
	repeat
endscript
