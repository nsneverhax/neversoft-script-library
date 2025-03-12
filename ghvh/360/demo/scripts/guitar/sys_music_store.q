music_store_songlist_buffer_size = 524288
songlist_pak_filename = 'songlist'

script music_store_init 
	mark_unsafe_for_shutdown
	music_store_show_loading_screen
	if ($music_store_inited = 1)
		scriptassert \{'Store already inited'}
	endif
	change \{music_store_inited = 1}
	cas_destroy_all_characters
	unload_songqpak
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	flushdeferreddeletes
	if isps3
		vmheap \{func = swap_out}
		vmheap \{func = alloc_commerce}
		mempushcontext \{bottomupheap}
		meminitheap name = 'heap_musicstore' size = (1024 * 1024) vram_size = (8 * 1024 * 1024)
		mempopcontext
	else
		mempushcontext \{$heap_song}
		meminitheap name = 'heap_musicstore' size = (9 * 1024 * 1024)
		mempopcontext
	endif
	mempushcontext \{heap_musicstore}
	pushmemprofile \{'Songlist'}
	initdownloadsonglist buffer_size = ($music_store_songlist_buffer_size)
	popmemprofile
	mempopcontext
	netsessionfunc \{func = cdn_init}
	music_store_hide_loading_screen
	mark_safe_for_shutdown
endscript

script music_store_deinit 
	if ($music_store_inited = 1)
		change \{music_store_inited = 0}
		music_store_show_loading_screen
		music_store_cleanup_asset_requests
		marketplacefunc \{func = deinit}
		netsessionfunc \{func = cdn_uninit}
		flushdeferreddeletes
		if downloadsonglistloaded
			get_songlist_filename
			unloadpak <songlist_filename>
			unloaded_pak_flag = {unloaded_pak}
		endif
		freedownloadsonglist <unloaded_pak_flag>
		memdeleteheap \{name = heap_musicstore}
		if isps3
			memdeleteheap \{name = heap_musicstore_vram}
			vmheap \{func = free_commerce}
			vmheap \{func = swap_in}
		endif
		setpakmancurrentblock \{map = zones
			pak = z_soundcheck
			block_scripts = 1}
		music_store_hide_loading_screen
	endif
endscript

script music_store_show_loading_screen 
	if isps3
		displayloadingscreen \{'boot_copyright_BG_1'
			spin3d_texture = 'load_wheel'
			spin_x = 877
			spin_y = 467
			scale = 0.055
			speed = -2}
	endif
endscript

script music_store_hide_loading_screen 
	if isps3
		hideloadingscreen
	endif
endscript

script music_store_preload_album_covers 
	requireparams \{[
			list
		]
		all}
	music_store_calculate_image_limit
	getarraysize <list>
	if (<array_size> > 0)
		if (<array_size> > <limit>)
			array_size = <limit>
		endif
		array = []
		i = 0
		begin
		if structurecontains structure = (<list> [<i>]) asset_name
			addarrayelement array = <array> element = ((<list> [<i>]).asset_name)
		endif
		i = (<i> + 1)
		repeat <array_size>
		musicstorerequestimages images = <array>
	endif
endscript

script music_store_main_preload_album_covers 
	requireparams \{[
			list_array
		]
		all}
	max_preload = 10
	getarraysize <list_array>
	num_lists = <array_size>
	if (<num_lists> > 0)
		i = 0
		begin
		music_store_preload_album_covers list = (<list_array> [<i>]) limit = <max_preload>
		i = (<i> + 1)
		repeat <num_lists>
	endif
endscript

script music_store_cleanup_asset_requests 
	if scriptisrunning \{music_store_request_album_cover_change}
		killspawnedscript \{name = music_store_request_album_cover_change}
	endif
	if scriptisrunning \{music_store_change_album_cover}
		killspawnedscript \{name = music_store_change_album_cover}
	endif
	if scriptisrunning \{music_store_replace_album_cover_when_loaded}
		killspawnedscript \{name = music_store_replace_album_cover_when_loaded}
	endif
endscript

script get_songlist_filename 
	songlistfile = ($songlist_pak_filename)
	getterritory
	if french
		songlistfile = (<songlistfile> + '_f')
	elseif italian
		songlistfile = (<songlistfile> + '_i')
	elseif german
		songlistfile = (<songlistfile> + '_g')
	elseif spanish
		songlistfile = (<songlistfile> + '_s')
	elseif (<territory> != territory_us)
		songlistfile = (<songlistfile> + '_b')
	endif
	return songlist_filename = (<songlistfile> + '.pak')
endscript

script music_store_download_songlist 
	get_songlist_filename
	mark_unsafe_for_shutdown
	enableduplicatesymbolwarning \{off}
	setduplicateqsfilesassertstatus \{enabled = false}
	if downloadsonglist filename = <songlist_filename>
		begin
		if downloadsonglistfinished
			printf \{qs(0x4e7bf527)}
			break
		endif
		printf \{qs(0x1c5cd493)}
		wait \{1
			gameframe}
		repeat
	else
		success = 0
	endif
	setduplicateqsfilesassertstatus \{enabled = true}
	enableduplicatesymbolwarning
	mark_safe_for_shutdown
	printstruct <...>
	if (<success> = 0)
		printf \{qs(0x4bf369a7)}
		return \{false}
	else
		printf \{qs(0x726d014e)}
	endif
	return \{true}
endscript

script music_store_wait_for_manifest 
	mark_unsafe_for_shutdown
	wait \{2
		gameframes}
	begin
	if netsessionfunc \{obj = cdn
			func = is_cdn_ready}
		printf \{qs(0x3e4d686a)}
		break
	endif
	if ($music_store_entry_cancelled = 1)
		printf \{qs(0xbfe6dcdc)}
		failed = 1
		break
	endif
	if netsessionfunc \{obj = cdn
			func = check_for_cdn_error}
		printf 'Manifest download error %e' e = <error>
		failed = 1
		break
	endif
	printf \{qs(0xe1bfc9fa)}
	wait \{1
		gameframe}
	repeat
	mark_safe_for_shutdown
	if netsessionfunc \{obj = cdn
			func = check_for_cdn_error}
		failed = 1
	endif
	if gotparam \{failed}
		printf \{qs(0x2e0e7a7f)}
		return \{false}
	endif
	return \{true}
endscript

script music_store_check_signin_state 
	if NOT checkforsignin controller_index = ($primary_controller)
		if isps3
			return \{false
				fail_text = qs(0x25f75105)}
		endif
		if netsessionfunc func = xenonisguest params = {controller_index = ($primary_controller)}
			return \{false
				fail_text = qs(0xb9fd7c2c)}
		endif
		if NOT checkforsignin network_platform_only controller_index = ($primary_controller)
			return \{false
				fail_text = qs(0xd1dc3d89)}
		endif
		if checkforsignin local controller_index = ($primary_controller)
			if netsessionfunc \{func = iscableunplugged}
				return \{false
					fail_text = qs(0xa76a52e8)}
			endif
		else
			if isxenon
				dialog_txt = qs(0x680a3a16)
			elseif isps3
				dialog_txt = qs(0x25f75105)
			endif
			return false fail_text = <dialog_txt>
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
		if netsessionfunc \{obj = cdn
				func = check_for_cdn_error}
			cdn_error = <error>
			break
		endif
		printf \{qs(0xa63efc50)}
		wait \{1
			gameframe}
		repeat
		printf \{qs(0xa840b03b)}
		if netsessionfunc \{obj = cdn
				func = check_for_cdn_error}
			cdn_error = <error>
		endif
		if gotparam \{cdn_error}
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
	return false enum_error = <enum_error>
endscript

script music_store_cancel_entry 
	printf 'music_store_cancel_entry - %s' s = ($music_store_entry_step)
	if ($music_store_entry_step = enum)
		generic_menu_pad_back_sound
		marketplacefunc \{func = cancel_enum}
		change \{music_store_entry_step = none}
		change \{music_store_entry_cancelled = 1}
	endif
	if ($music_store_entry_step = songlist)
		generic_menu_pad_back_sound
		canceldownloadsonglist
		change \{music_store_entry_step = none}
		change \{music_store_entry_cancelled = 1}
	endif
	if ($music_store_entry_step = manifest)
		generic_menu_pad_back_sound
		change \{music_store_entry_step = none}
		change \{music_store_entry_cancelled = 1}
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
	wait \{1
		gameframe}
	repeat
endscript

script music_store_purchase_content 
	printf \{'music_store_purchase_content - Starting checkout'}
	printstruct <purchase_struct>
	change \{music_store_attempted_purchase = 1}
	change \{generic_menu_block_input = 1}
	mark_unsafe_for_shutdown
	dumpheaps
	marketplacefunc func = checkout id = (<purchase_struct>.code)
	begin
	marketplacefunc \{func = get_state}
	if NOT (<state> = checkout)
		break
	endif
	wait \{1
		gameframe}
	repeat
	mark_safe_for_shutdown
	change \{generic_menu_block_input = 0}
	printf \{'music_store_purchase_content - Done checkout'}
endscript

script music_store_signin_check_start_checking 
	spawnscriptnow \{music_store_signin_check_spawned}
endscript

script music_store_signin_check_stop_checking 
	killspawnedscript \{name = music_store_signin_check_spawned}
endscript

script music_store_signin_check_spawned 
	begin
	if ($is_shutdown_safe = 1)
		if ($blade_active = 0)
			if NOT checkforsignin controller_index = ($primary_controller)
				if isps3
					music_store_signin_check_failed \{text = qs(0x25f75105)}
					return
				endif
				if netsessionfunc func = xenonisguest params = {controller_index = ($primary_controller)}
					music_store_signin_check_failed \{text = qs(0xb9fd7c2c)}
					return
				endif
				if NOT checkforsignin network_platform_only controller_index = ($primary_controller)
					music_store_signin_check_failed \{text = qs(0x2e3df874)}
					return
				endif
				if checkforsignin local controller_index = ($primary_controller)
					if netsessionfunc \{func = iscableunplugged}
						music_store_signin_check_failed \{text = qs(0x2e3df874)}
						return
					endif
				else
					if isxenon
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
	wait \{1
		gameframe}
	repeat
endscript

script music_store_signin_check_failed 
	event = menu_change
	if ui_event_exists_in_stack \{name = 'music_store_scan_marketplace'}
		event = menu_replace
	endif
	ui_event_wait event = <event> data = {state = uistate_music_store_unavailible text = <text>}
endscript

script music_store_calculate_image_limit 
	if isxenon
		return limit = (($default_music_store_image_cache_size_xenon) / ($default_music_store_image_size_xenon))
	else
		return limit = (($default_music_store_image_cache_size_ps3) / ($default_music_store_image_size_ps3))
	endif
endscript

script music_store_check_download_status 
	begin
	if NOT marketplacefunc func = currently_downloading id = <id>
		obj_getid
		setscreenelementprops id = <objid> focusable
		setscreenelementprops id = <objid> options_list_item_text_text = qs(0x40886130)
		break
	endif
	wait \{2
		gameframes}
	repeat
endscript
