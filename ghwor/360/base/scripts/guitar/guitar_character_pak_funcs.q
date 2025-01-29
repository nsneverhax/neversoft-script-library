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
	Wait \{1
		gameframe}
	repeat
	Change \{g_loadpak_lock = 1}
	Change \{g_loadpak_done = 0}
	OnExitRun \{check_loadpak_lock}
	device = Default
	if (<pak_name> != None)
		if NOT getpakmanpakfilename pak = <pak_name> map = <map>
			ScriptAssert 'pak %p not found in map %m' p = <pak_name> m = <map>
			Change \{g_loadpak_lock = 0}
			Change \{g_loadpak_done = 0}
			return \{FALSE}
		endif
		contentfoldermanager func = get_content_folder_index_from_file file = <pak_filename>
		if (<device> = content)
			if (<status> = damaged)
				printf \{qs(0x855b445f)}
				Change \{g_loadpak_lock = 0}
				Change \{g_loadpak_done = 0}
				return \{FALSE}
			endif
			if NOT Downloads_OpenContentFolder content_index = <content_index>
				contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
				printf \{qs(0xb4c2c4ea)}
				Change \{g_loadpak_lock = 0}
				Change \{g_loadpak_done = 0}
				return \{FALSE}
			endif
		endif
	endif
	SetPakManCurrentBlock map = <map> pak = <pak_name> block_scripts = (1 - <async>) slot = <slot>
	if (<device> = content)
		Downloads_CloseContentFolder content_index = <content_index>
	endif
	Change \{g_loadpak_lock = 0}
	Change \{g_loadpak_done = 0}
	return \{true}
endscript

script UnloadPakAsync \{async = 1
		pak_name = 0x69696969}
	setscriptcannotpause
	begin
	if ($g_unloadpak_lock = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{g_unloadpak_lock = 1}
	OnExitRun \{check_unloadpak_lock}
	if GotParam \{checksum_pak_name}
		unload_params = {pak_name = <checksum_pak_name>}
	else
		unload_params = {<pak_name>}
	endif
	UnLoadPak <unload_params>
	if (<async> = 1)
		begin
		if WaitUnloadPak <unload_params> noblock
			break
		endif
		Wait \{1
			gameframe}
		repeat
	else
		WaitUnloadPak <pak_name> Block
	endif
	Change \{g_unloadpak_lock = 0}
endscript

script check_unloadpak_lock 
	if ($g_unloadpak_lock = 1)
		ScriptAssert \{qs(0xb466d970)}
	endif
endscript

script LoadPakAsync \{async = 1
		is_raw = 0
		pak_name = 0x69696969
		Heap = !q1768515945}
	setscriptcannotpause
	if (<is_raw> = 1)
		is_raw_flag = {is_raw}
	endif
	begin
	if ($g_loadpak_lock = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{g_loadpak_lock = 1}
	Change \{g_loadpak_done = 0}
	Change \{g_loadpak_failed = 0}
	OnExitRun \{check_loadpak_lock}
	contentfoldermanager func = get_content_folder_index_from_file file = <pak_name>
	if (<device> = content)
		if (<status> = damaged)
			printf \{qs(0x855b445f)}
			Change \{g_loadpak_lock = 0}
			Change \{g_loadpak_done = 0}
			return \{FALSE}
		endif
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
			printf \{qs(0xb4c2c4ea)}
			Change \{g_loadpak_lock = 0}
			Change \{g_loadpak_done = 0}
			return \{FALSE}
		endif
		contentfoldermanager func = get_content_folder_device_id content_index = <content_index>
	endif
	if (<async> = 0)
		if (GotParam no_vram)
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> <is_raw_flag> content_id = <content_id> file_load_delay = <file_load_delay> file_filter = <file_filter> no_vram
				Change \{g_loadpak_failed = 1}
			endif
		else
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> <is_raw_flag> content_id = <content_id> file_load_delay = <file_load_delay> file_filter = <file_filter>
				Change \{g_loadpak_failed = 1}
			endif
		endif
		Change \{g_loadpak_done = 1}
	else
		if (GotParam no_vram)
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device> content_id = <content_id> <is_raw_flag> file_load_delay = <file_load_delay> file_filter = <file_filter> no_vram
		else
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device> content_id = <content_id> <is_raw_flag> file_load_delay = <file_load_delay> file_filter = <file_filter>
		endif
	endif
	begin
	if ($g_loadpak_done = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<device> = content)
		Downloads_CloseContentFolder content_index = <content_index>
		if ($g_loadpak_failed = 1)
			contentfoldermanager func = mark_content_folder_damaged content_index = <content_index>
			Change \{g_loadpak_lock = 0}
			Change \{g_loadpak_done = 0}
			return \{FALSE}
		endif
	endif
	Change \{g_loadpak_lock = 0}
	Change \{g_loadpak_done = 0}
	return \{true}
endscript

script check_loadpak_lock 
	if ($g_loadpak_lock = 1)
		ScriptAssert \{qs(0x2994b14c)}
	endif
endscript

script LoadPakAsync_callback 
	if NOT (<Result> = 0)
		Change \{g_loadpak_done = 1}
		Change \{g_loadpak_failed = 1}
		Change \{g_loadpak_lock = 0}
	endif
	if GotParam \{end}
		Change \{g_loadpak_done = 1}
	endif
endscript
