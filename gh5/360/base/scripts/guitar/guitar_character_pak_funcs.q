unloadpak_lock = 0
loadpak_lock = 0
loadpak_done = 0
loadpak_failed = 0

script smartunloadpak 
	if GotParam \{all}
		pass_params = {all}
	elseif GotParam \{pak_id}
		pass_params = {pak_id = <pak_id>}
	elseif GotParam \{pak_name}
		pass_params = {pak_name = <pak_name>}
	elseif GotParam \{tags}
		pass_params = {tags = <tags>}
	else
		ScriptAssert \{'Bad params passed to SmartUnloadPak'}
		return
	endif
	begin
	if NOT smartpak_unload <pass_params>
		return
	endif
	repeat
endscript

script smartloadpakman \{async = 1}
	RequireParams \{[
			pak_name
			async
			map
		]
		all}
	if NOT ischecksum <pak_name>
		ScriptAssert \{'pak_name must be a checksum for pakman maps'}
	endif
	if smartpak_ispakloaded pak_name = <pak_name> pak_id = <pak_id>
		printf '%s already loaded, no load necessary' s = <pak_name>
		smartpak_load pak_name = <pak_name> pak_id = <pak_id> tags = {map = <map> <tags>}
		return \{true}
	endif
	if getpakmannumfreeslots map = <map>
		slot = <firstfreeslot>
	else
		smartflushpak async = <async> single tags = {map = <map>}
		if NOT getpakmannumfreeslots map = <map>
			smartpak_dump
			ScriptAssert 'map %m has nothing with a zero refcount' m = <map>
		endif
		slot = <firstfreeslot>
	endif
	printf 'SmartLoadPakman %a %b %s...' a = <map> b = <slot> s = <pak_name>
	if NOT loadpakmanasync map = <map> pak_name = <pak_name> async = <async> slot = <slot>
		return \{FALSE}
	endif
	smartpak_load new pak_name = <pak_name> pak_id = <pak_id> map = <map> slot = <slot> tags = {map = <map> <tags>}
	return \{true}
endscript

script smartloadpak \{async = 1}
	RequireParams \{[
			pak_name
			async
			Heap
		]
		all}
	if ischecksum <pak_name>
		ScriptAssert \{'pak_name must be a unlocalized string for loose paks'}
	endif
	if smartpak_ispakloaded pak_name = <pak_name> pak_id = <pak_id>
		printf '%s already loaded, no load necessary' s = <pak_name>
		smartpak_load pak_name = <pak_name> pak_id = <pak_id> tags = {Heap = <Heap> <tags>}
		return \{true}
	endif
	smartflushpak async = <async> tags = {Heap = <Heap>}
	if NOT LoadPakAsync pak_name = <pak_name> async = <async> Heap = <Heap> is_raw = <is_raw> no_vram = <no_vram> file_load_delay = <file_load_delay>
		return \{FALSE}
	endif
	printf 'SmartLoadPak %s...' s = <pak_name>
	smartpak_load new pak_name = <pak_name> pak_id = <pak_id> tags = {Heap = <Heap> <tags>}
	return \{true}
endscript

script smartflushpak \{async = 1}
	RequireParams \{[
			async
		]
		all}
	if GotParam \{all}
		pass_params = {all}
	elseif GotParam \{pak_id}
		pass_params = {pak_id = <pak_id>}
	elseif GotParam \{pak_name}
		pass_params = {pak_name = <pak_name>}
	elseif GotParam \{tags}
		pass_params = {tags = <tags>}
	else
		ScriptAssert \{'Bad params passed to SmartFlushPaks'}
		return
	endif
	smartpak_dump
	begin
	if NOT smartpak_flush <pass_params>
		return
	endif
	if GotParam \{flushed_map}
		printf 'SmartLoadPakman %a %b %s...' a = <flushed_map> b = <flushed_slot> s = <flushed_pak>
		loadpakmanasync async = <async> pak_name = None map = <flushed_map> slot = <flushed_slot>
	else
		printf 'SmartFlushPak %s...' s = <flushed_pak>
		UnloadPakAsync async = <async> checksum_pak_name = <flushed_pak> pak_name = <flushed_pak>
	endif
	RemoveParameter \{flushed_map}
	RemoveParameter \{flushed_slot}
	RemoveParameter \{flushed_pak}
	if GotParam \{single}
		return
	endif
	repeat
endscript

script loadpakmanasync \{slot = 0}
	RequireParams \{[
			pak_name
			map
			async
		]
		all}
	setscriptcannotpause
	printf qs(0xc5b25259) s = <pak_name> a = <map> i = <async> t = <slot>
	begin
	if ($loadpak_lock = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{loadpak_lock = 1}
	Change \{loadpak_done = 0}
	OnExitRun \{check_loadpak_lock}
	device = Default
	if (<pak_name> != None)
		if NOT getpakmanpakfilename pak = <pak_name> map = <map>
			ScriptAssert 'pak %p not found in map %m' p = <pak_name> m = <map>
			Change \{loadpak_lock = 0}
			Change \{loadpak_done = 0}
			return \{FALSE}
		endif
		GetContentFolderIndexFromFile <pak_filename>
		if (<device> = content)
			if NOT Downloads_OpenContentFolder content_index = <content_index>
				printf \{qs(0xb4c2c4ea)}
				Change \{loadpak_lock = 0}
				Change \{loadpak_done = 0}
				return \{FALSE}
			endif
		endif
	endif
	SetPakManCurrentBlock map = <map> pak = <pak_name> block_scripts = (1 - <async>) slot = <slot>
	if (<device> = content)
		Downloads_CloseContentFolder content_index = <content_index>
	endif
	Change \{loadpak_lock = 0}
	Change \{loadpak_done = 0}
	return \{true}
endscript

script UnloadPakAsync \{async = 1}
	RequireParams \{[
			pak_name
			async
		]
		all}
	setscriptcannotpause
	printf qs(0xb0b244ef) s = <pak_name> i = <async>
	begin
	if ($unloadpak_lock = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{unloadpak_lock = 1}
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
	Change \{unloadpak_lock = 0}
endscript

script check_unloadpak_lock 
	if ($unloadpak_lock = 1)
		ScriptAssert \{qs(0xb466d970)}
	endif
endscript

script LoadPakAsync \{async = 1
		is_raw = 0}
	printscriptinfo \{'LoadPakAsync'}
	setscriptcannotpause
	printf qs(0xfaa7513c) s = <pak_name> a = <Heap> i = <async> r = <is_raw>
	if (<is_raw> = 1)
		is_raw_flag = {is_raw}
	endif
	begin
	if ($loadpak_lock = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{loadpak_lock = 1}
	Change \{loadpak_done = 0}
	Change \{loadpak_failed = 0}
	OnExitRun \{check_loadpak_lock}
	GetContentFolderIndexFromFile <pak_name>
	if (<device> = content)
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			printf \{qs(0xb4c2c4ea)}
			Change \{loadpak_lock = 0}
			Change \{loadpak_done = 0}
			return \{FALSE}
		endif
		getcontentfoldercontentid content_index = <content_index>
	endif
	if (<async> = 0)
		if (GotParam no_vram)
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> <is_raw_flag> content_id = <content_id> file_load_delay = <file_load_delay> no_vram
				Change \{loadpak_failed = 1}
			endif
		else
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> <is_raw_flag> content_id = <content_id> file_load_delay = <file_load_delay>
				Change \{loadpak_failed = 1}
			endif
		endif
		Change \{loadpak_done = 1}
	else
		if (GotParam no_vram)
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device> content_id = <content_id> <is_raw_flag> file_load_delay = <file_load_delay> no_vram
		else
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device> content_id = <content_id> <is_raw_flag> file_load_delay = <file_load_delay>
		endif
	endif
	begin
	if ($loadpak_done = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<device> = content)
		Downloads_CloseContentFolder content_index = <content_index>
		if ($loadpak_failed = 1)
			Change \{loadpak_lock = 0}
			Change \{loadpak_done = 0}
			return \{FALSE}
		endif
	endif
	Change \{loadpak_lock = 0}
	Change \{loadpak_done = 0}
	return \{true}
endscript

script check_loadpak_lock 
	if ($loadpak_lock = 1)
		ScriptAssert \{qs(0x2994b14c)}
	endif
endscript

script LoadPakAsync_callback 
	printf \{qs(0x1f56e85f)}
	printstruct <...>
	if NOT (<Result> = 0)
		Change \{loadpak_done = 1}
		Change \{loadpak_failed = 1}
		Change \{loadpak_lock = 0}
	endif
	if GotParam \{end}
		Change \{loadpak_done = 1}
	endif
endscript
