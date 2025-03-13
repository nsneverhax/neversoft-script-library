unloadpak_lock = 0
loadpak_lock = 0
loadpak_done = 0
loadpak_failed = 0

script smartunloadpak 
	if gotparam \{all}
		pass_params = {all}
	elseif gotparam \{pak_id}
		pass_params = {pak_id = <pak_id>}
	elseif gotparam \{pak_name}
		pass_params = {pak_name = <pak_name>}
	elseif gotparam \{tags}
		pass_params = {tags = <tags>}
	else
		scriptassert \{'Bad params passed to SmartUnloadPak'}
		return
	endif
	begin
	if NOT smartpak_unload <pass_params>
		return
	endif
	repeat
endscript

script smartloadpakman \{async = 1}
	requireparams \{[
			pak_name
			async
			map
		]
		all}
	if NOT ischecksum <pak_name>
		scriptassert \{'pak_name must be a checksum for pakman maps'}
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
			scriptassert 'map %m has nothing with a zero refcount' m = <map>
		endif
		slot = <firstfreeslot>
	endif
	printf 'SmartLoadPakman %a %b %s...' a = <map> b = <slot> s = <pak_name>
	if NOT loadpakmanasync map = <map> pak_name = <pak_name> async = <async> slot = <slot>
		return \{false}
	endif
	smartpak_load new pak_name = <pak_name> pak_id = <pak_id> map = <map> slot = <slot> tags = {map = <map> <tags>}
	return \{true}
endscript

script smartloadpak \{async = 1}
	requireparams \{[
			pak_name
			async
			heap
		]
		all}
	if ischecksum <pak_name>
		scriptassert \{'pak_name must be a unlocalized string for loose paks'}
	endif
	if smartpak_ispakloaded pak_name = <pak_name> pak_id = <pak_id>
		printf '%s already loaded, no load necessary' s = <pak_name>
		smartpak_load pak_name = <pak_name> pak_id = <pak_id> tags = {heap = <heap> <tags>}
		return \{true}
	endif
	smartflushpak async = <async> tags = {heap = <heap>}
	if NOT loadpakasync pak_name = <pak_name> async = <async> heap = <heap> is_raw = <is_raw> no_vram = <no_vram> file_load_delay = <file_load_delay>
		return \{false}
	endif
	printf 'SmartLoadPak %s...' s = <pak_name>
	smartpak_load new pak_name = <pak_name> pak_id = <pak_id> tags = {heap = <heap> <tags>}
	return \{true}
endscript

script smartflushpak \{async = 1}
	requireparams \{[
			async
		]
		all}
	if gotparam \{all}
		pass_params = {all}
	elseif gotparam \{pak_id}
		pass_params = {pak_id = <pak_id>}
	elseif gotparam \{pak_name}
		pass_params = {pak_name = <pak_name>}
	elseif gotparam \{tags}
		pass_params = {tags = <tags>}
	else
		scriptassert \{'Bad params passed to SmartFlushPaks'}
		return
	endif
	smartpak_dump
	begin
	if NOT smartpak_flush <pass_params>
		return
	endif
	if gotparam \{flushed_map}
		printf 'SmartLoadPakman %a %b %s...' a = <flushed_map> b = <flushed_slot> s = <flushed_pak>
		loadpakmanasync async = <async> pak_name = none map = <flushed_map> slot = <flushed_slot>
	else
		printf 'SmartFlushPak %s...' s = <flushed_pak>
		unloadpakasync async = <async> checksum_pak_name = <flushed_pak> pak_name = <flushed_pak>
	endif
	removeparameter \{flushed_map}
	removeparameter \{flushed_slot}
	removeparameter \{flushed_pak}
	if gotparam \{single}
		return
	endif
	repeat
endscript

script loadpakmanasync \{slot = 0}
	requireparams \{[
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
	wait \{1
		gameframe}
	repeat
	change \{loadpak_lock = 1}
	change \{loadpak_done = 0}
	onexitrun \{check_loadpak_lock}
	device = `default`
	if (<pak_name> != none)
		if NOT getpakmanpakfilename pak = <pak_name> map = <map>
			scriptassert 'pak %p not found in map %m' p = <pak_name> m = <map>
			change \{loadpak_lock = 0}
			change \{loadpak_done = 0}
			return \{false}
		endif
		getcontentfolderindexfromfile <pak_filename>
		if (<device> = content)
			if NOT downloads_opencontentfolder content_index = <content_index>
				printf \{qs(0xb4c2c4ea)}
				change \{loadpak_lock = 0}
				change \{loadpak_done = 0}
				return \{false}
			endif
		endif
	endif
	setpakmancurrentblock map = <map> pak = <pak_name> block_scripts = (1 - <async>) slot = <slot>
	if (<device> = content)
		downloads_closecontentfolder content_index = <content_index>
	endif
	change \{loadpak_lock = 0}
	change \{loadpak_done = 0}
	return \{true}
endscript

script unloadpakasync \{async = 1}
	requireparams \{[
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
	wait \{1
		gameframe}
	repeat
	change \{unloadpak_lock = 1}
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
	change \{unloadpak_lock = 0}
endscript

script check_unloadpak_lock 
	if ($unloadpak_lock = 1)
		scriptassert \{qs(0xb466d970)}
	endif
endscript

script loadpakasync \{async = 1
		is_raw = 0}
	printscriptinfo \{'LoadPakAsync'}
	setscriptcannotpause
	printf qs(0xfaa7513c) s = <pak_name> a = <heap> i = <async> r = <is_raw>
	if (<is_raw> = 1)
		is_raw_flag = {is_raw}
	endif
	begin
	if ($loadpak_lock = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{loadpak_lock = 1}
	change \{loadpak_done = 0}
	change \{loadpak_failed = 0}
	onexitrun \{check_loadpak_lock}
	getcontentfolderindexfromfile <pak_name>
	if (<device> = content)
		if NOT downloads_opencontentfolder content_index = <content_index>
			printf \{qs(0xb4c2c4ea)}
			change \{loadpak_lock = 0}
			change \{loadpak_done = 0}
			return \{false}
		endif
		getcontentfoldercontentid content_index = <content_index>
	endif
	if (<async> = 0)
		if (gotparam no_vram)
			if NOT loadpak <pak_name> heap = <heap> device = <device> <is_raw_flag> content_id = <content_id> file_load_delay = <file_load_delay> no_vram
				change \{loadpak_failed = 1}
			endif
		else
			if NOT loadpak <pak_name> heap = <heap> device = <device> <is_raw_flag> content_id = <content_id> file_load_delay = <file_load_delay>
				change \{loadpak_failed = 1}
			endif
		endif
		change \{loadpak_done = 1}
	else
		if (gotparam no_vram)
			loadpak <pak_name> heap = <heap> load_callback = loadpakasync_callback callback_data = none device = <device> content_id = <content_id> <is_raw_flag> file_load_delay = <file_load_delay> no_vram
		else
			loadpak <pak_name> heap = <heap> load_callback = loadpakasync_callback callback_data = none device = <device> content_id = <content_id> <is_raw_flag> file_load_delay = <file_load_delay>
		endif
	endif
	begin
	if ($loadpak_done = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<device> = content)
		downloads_closecontentfolder content_index = <content_index>
		if ($loadpak_failed = 1)
			change \{loadpak_lock = 0}
			change \{loadpak_done = 0}
			return \{false}
		endif
	endif
	change \{loadpak_lock = 0}
	change \{loadpak_done = 0}
	return \{true}
endscript

script check_loadpak_lock 
	if ($loadpak_lock = 1)
		scriptassert \{qs(0x2994b14c)}
	endif
endscript

script loadpakasync_callback 
	printf \{qs(0x1f56e85f)}
	printstruct <...>
	if NOT (<result> = 0)
		change \{loadpak_done = 1}
		change \{loadpak_failed = 1}
		change \{loadpak_lock = 0}
	endif
	if gotparam \{end}
		change \{loadpak_done = 1}
	endif
endscript
