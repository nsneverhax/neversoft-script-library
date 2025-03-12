g_unloadpak_lock = 0
g_loadpak_lock = 0
g_loadpak_done = 0
g_loadpak_failed = 0

script loadpakmanasync \{slot = 0
		pak_name = !q1768515945
		map = !q1768515945
		async = !i1768515945}
	setscriptcannotpause
	begin
	if ($g_loadpak_lock = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{g_loadpak_lock = 1}
	change \{g_loadpak_done = 0}
	onexitrun \{check_loadpak_lock}
	device = `default`
	if (<pak_name> != none)
		if NOT getpakmanpakfilename pak = <pak_name> map = <map>
			scriptassert 'pak %p not found in map %m' p = <pak_name> m = <map>
			change \{g_loadpak_lock = 0}
			change \{g_loadpak_done = 0}
			return \{false}
		endif
		contentfoldermanager func = get_content_folder_index_from_file file = <pak_filename>
		if (<device> = content)
			if (<status> = damaged)
				printf \{qs(0x855b445f)}
				change \{g_loadpak_lock = 0}
				change \{g_loadpak_done = 0}
				return \{false}
			endif
			if NOT downloads_opencontentfolder content_index = <content_index>
				contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
				printf \{qs(0xb4c2c4ea)}
				change \{g_loadpak_lock = 0}
				change \{g_loadpak_done = 0}
				return \{false}
			endif
		endif
	endif
	setpakmancurrentblock map = <map> pak = <pak_name> block_scripts = (1 - <async>) slot = <slot>
	if (<device> = content)
		downloads_closecontentfolder content_index = <content_index>
	endif
	change \{g_loadpak_lock = 0}
	change \{g_loadpak_done = 0}
	return \{true}
endscript

script unloadpakasync \{async = 1
		pak_name = 0x69696969}
	setscriptcannotpause
	begin
	if ($g_unloadpak_lock = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{g_unloadpak_lock = 1}
	onexitrun \{check_unloadpak_lock}
	if gotparam \{checksum_pak_name}
		unload_params = {pak_name = <checksum_pak_name>}
	else
		unload_params = {<pak_name>}
	endif
	unloadpak <unload_params>
	if (<async> = 1)
		begin
		if waitunloadpak <unload_params> noblock
			break
		endif
		wait \{1
			gameframe}
		repeat
	else
		waitunloadpak <pak_name> block
	endif
	change \{g_unloadpak_lock = 0}
endscript

script check_unloadpak_lock 
	if ($g_unloadpak_lock = 1)
		scriptassert \{qs(0xb466d970)}
	endif
endscript

script loadpakasync \{async = 1
		is_raw = 0
		pak_name = 0x69696969
		heap = !q1768515945}
	setscriptcannotpause
	if (<is_raw> = 1)
		is_raw_flag = {is_raw}
	endif
	begin
	if ($g_loadpak_lock = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{g_loadpak_lock = 1}
	change \{g_loadpak_done = 0}
	change \{g_loadpak_failed = 0}
	onexitrun \{check_loadpak_lock}
	contentfoldermanager func = get_content_folder_index_from_file file = <pak_name>
	if (<device> = content)
		if (<status> = damaged)
			printf \{qs(0x855b445f)}
			change \{g_loadpak_lock = 0}
			change \{g_loadpak_done = 0}
			return \{false}
		endif
		if NOT downloads_opencontentfolder content_index = <content_index>
			contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
			printf \{qs(0xb4c2c4ea)}
			change \{g_loadpak_lock = 0}
			change \{g_loadpak_done = 0}
			return \{false}
		endif
		contentfoldermanager func = get_content_folder_device_id content_index = <content_index>
	endif
	if (<async> = 0)
		if (gotparam no_vram)
			if NOT loadpak <pak_name> heap = <heap> device = <device> <is_raw_flag> content_id = <content_id> file_load_delay = <file_load_delay> file_filter = <file_filter> no_vram
				change \{g_loadpak_failed = 1}
			endif
		else
			if NOT loadpak <pak_name> heap = <heap> device = <device> <is_raw_flag> content_id = <content_id> file_load_delay = <file_load_delay> file_filter = <file_filter>
				change \{g_loadpak_failed = 1}
			endif
		endif
		change \{g_loadpak_done = 1}
	else
		if (gotparam no_vram)
			loadpak <pak_name> heap = <heap> load_callback = loadpakasync_callback callback_data = none device = <device> content_id = <content_id> <is_raw_flag> file_load_delay = <file_load_delay> file_filter = <file_filter> no_vram
		else
			loadpak <pak_name> heap = <heap> load_callback = loadpakasync_callback callback_data = none device = <device> content_id = <content_id> <is_raw_flag> file_load_delay = <file_load_delay> file_filter = <file_filter>
		endif
	endif
	begin
	if ($g_loadpak_done = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<device> = content)
		downloads_closecontentfolder content_index = <content_index>
		if ($g_loadpak_failed = 1)
			contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
			change \{g_loadpak_lock = 0}
			change \{g_loadpak_done = 0}
			return \{false}
		endif
	endif
	change \{g_loadpak_lock = 0}
	change \{g_loadpak_done = 0}
	return \{true}
endscript

script check_loadpak_lock 
	if ($g_loadpak_lock = 1)
		scriptassert \{qs(0x2994b14c)}
	endif
endscript

script loadpakasync_callback 
	if NOT (<result> = 0)
		change \{g_loadpak_done = 1}
		change \{g_loadpak_failed = 1}
		change \{g_loadpak_lock = 0}
	endif
	if gotparam \{end}
		change \{g_loadpak_done = 1}
	endif
endscript
