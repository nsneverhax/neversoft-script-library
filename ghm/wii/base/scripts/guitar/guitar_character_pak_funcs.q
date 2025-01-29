musician_heaps = [
	heap_musician1
	heap_musician2
	heap_musician3
	heap_musician4
]
0x652da952 = 1
character_pak_loadpak_lock = 0
character_pak_loadpak_done = 0
character_pak_loadpak_failed = 0

script LoadPakAsync \{is_raw = FALSE}
	finalprintf 'LoadPakAsync : %s on heap %a async=%i' s = <pak_name> a = <Heap> i = <async>
	<timeout_counter> = 0
	<timeout> = (60 * 60)
	begin
	if ($character_pak_loadpak_lock = 0)
		break
	endif
	<timeout_counter> = (<timeout_counter> + 1)
	if (<timeout_counter> > <timeout>)
		finalprintf \{'LoadPakAsync timed out waiting for lock!'}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{character_pak_loadpak_lock = 1}
	Change \{character_pak_loadpak_done = 0}
	Change \{character_pak_loadpak_failed = 0}
	Change \{0x652da952 = 0}
	OnExitRun \{check_character_pak_loadpak_lock}
	GetContentFolderIndexFromFile <pak_name>
	if (<device> = content)
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			printf \{qs(0xb4c2c4ea)}
			Change \{character_pak_loadpak_lock = 0}
			Change \{character_pak_loadpak_done = 0}
			return \{FALSE}
		endif
	endif
	if (<async> = 0)
		if (GotParam no_vram)
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> no_vram is_raw = <is_raw>
				Change \{character_pak_loadpak_failed = 1}
			endif
		else
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> is_raw = <is_raw>
				Change \{character_pak_loadpak_failed = 1}
			endif
		endif
		Change \{character_pak_loadpak_done = 1}
	else
		if (GotParam no_vram)
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device> no_vram is_raw = <is_raw>
		else
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device> is_raw = <is_raw>
		endif
	endif
	<timeout_counter> = 0
	begin
	if ($character_pak_loadpak_done = 1)
		break
	endif
	<timeout_counter> = (<timeout_counter> + 1)
	if (<timeout_counter> > <timeout>)
		finalprintf \{'LoadPakAsync timed out waiting for done!'}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<device> = content)
		Downloads_CloseContentFolder content_index = <content_index>
		if ($character_pak_loadpak_failed = 1)
			Change \{character_pak_loadpak_lock = 0}
			Change \{character_pak_loadpak_done = 0}
			return \{FALSE}
		endif
	endif
	Change \{character_pak_loadpak_lock = 0}
	Change \{character_pak_loadpak_done = 0}
	return {
		true
		loadpak_alloc_size = <loadpak_alloc_size>
		loadpak_alloc_size_vram = <loadpak_alloc_size_vram>
	}
endscript

script check_character_pak_loadpak_lock 
	if ($character_pak_loadpak_lock = 1)
		finalprintf \{'Lock left on LoadPakAsync!'}
		ScriptAssert \{'Lock left on LoadPakAsync'}
	endif
endscript

script LoadPakAsync_callback 
	if NOT (<Result> = 0)
		Change \{character_pak_loadpak_done = 1}
		Change \{character_pak_loadpak_failed = 1}
	endif
	if GotParam \{end}
		finalprintf \{'LoadPakAsync_callback end'}
		Change \{character_pak_loadpak_done = 1}
	else
		finalprintf \{'LoadPakAsync_callback NOT end'}
	endif
	Change \{0x652da952 = 1}
endscript
