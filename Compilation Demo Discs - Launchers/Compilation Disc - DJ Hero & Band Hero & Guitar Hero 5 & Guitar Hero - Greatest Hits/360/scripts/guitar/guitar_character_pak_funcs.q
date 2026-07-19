musician_heaps = [
	heap_musician1
	heap_musician2
	heap_musician3
	heap_musician4
]
character_pak_loadpak_lock = 0
character_pak_loadpak_done = 0
character_pak_loadpak_failed = 0

script LoadPakAsync \{is_raw = false}
	finalprintf qs("LoadPakAsync : %s on heap %a async=%i") s = <pak_name> a = <heap> i = <async>
	<timeout_counter> = 0
	<timeout> = (60 * 60)
	begin
	if ($character_pak_loadpak_lock = 0)
		break
	endif
	<timeout_counter> = (<timeout_counter> + 1)
	if (<timeout_counter> > <timeout>)
		finalprintf \{qs("LoadPakAsync timed out waiting for lock!")}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	change \{character_pak_loadpak_lock = 1}
	change \{character_pak_loadpak_done = 0}
	change \{character_pak_loadpak_failed = 0}
	OnExitRun \{check_character_pak_loadpak_lock}
	GetContentFolderIndexFromFile <pak_name>
	if (<device> = content)
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			printf \{qs("\LDownloads_OpenContentFolder FAILED")}
			change \{character_pak_loadpak_lock = 0}
			change \{character_pak_loadpak_done = 0}
			return \{false}
		endif
	endif
	if (<async> = 0)
		if (GotParam no_vram)
			if NOT LoadPak <pak_name> heap = <heap> device = <device> no_vram is_raw = <is_raw>
				change \{character_pak_loadpak_failed = 1}
			endif
		else
			if NOT LoadPak <pak_name> heap = <heap> device = <device> is_raw = <is_raw>
				change \{character_pak_loadpak_failed = 1}
			endif
		endif
		change \{character_pak_loadpak_done = 1}
	else
		if (GotParam no_vram)
			LoadPak <pak_name> heap = <heap> load_callback = LoadPakAsync_callback callback_data = none device = <device> no_vram is_raw = <is_raw>
		else
			LoadPak <pak_name> heap = <heap> load_callback = LoadPakAsync_callback callback_data = none device = <device> is_raw = <is_raw>
		endif
	endif
	<timeout_counter> = 0
	begin
	if ($character_pak_loadpak_done = 1)
		break
	endif
	<timeout_counter> = (<timeout_counter> + 1)
	if (<timeout_counter> > <timeout>)
		finalprintf \{qs("LoadPakAsync timed out waiting for done!")}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<device> = content)
		Downloads_CloseContentFolder content_index = <content_index>
		if ($character_pak_loadpak_failed = 1)
			change \{character_pak_loadpak_lock = 0}
			change \{character_pak_loadpak_done = 0}
			return \{false}
		endif
	endif
	change \{character_pak_loadpak_lock = 0}
	change \{character_pak_loadpak_done = 0}
	return {
		true
		loadpak_alloc_size = <loadpak_alloc_size>
		loadpak_alloc_size_vram = <loadpak_alloc_size_vram>
	}
endscript

script check_character_pak_loadpak_lock 
	if ($character_pak_loadpak_lock = 1)
		finalprintf \{qs("Lock left on LoadPakAsync!")}
		ScriptAssert \{qs("\LLock left on LoadPakAsync")}
	endif
endscript

script LoadPakAsync_callback 
	if NOT (<result> = 0)
		change \{character_pak_loadpak_done = 1}
		change \{character_pak_loadpak_failed = 1}
	endif
	if GotParam \{end}
		finalprintf \{qs("LoadPakAsync_callback end")}
		change \{character_pak_loadpak_done = 1}
	else
		finalprintf \{qs("LoadPakAsync_callback NOT end")}
	endif
endscript
