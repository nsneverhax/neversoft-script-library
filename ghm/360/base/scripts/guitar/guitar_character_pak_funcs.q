musician_heaps = [
	heap_musician1
	heap_musician2
	heap_musician3
	heap_musician4
]
character_pak_loadpak_lock = 0
character_pak_loadpak_done = 0
character_pak_loadpak_failed = 0

script LoadPakAsync \{is_raw = FALSE}
	finalprintf qs(0xc712b829) s = <pak_name> a = <Heap> i = <async>
	<timeout_counter> = 0
	<timeout> = (60 * 60)
	begin
	if ($character_pak_loadpak_lock = 0)
		break
	endif
	<timeout_counter> = (<timeout_counter> + 1)
	if (<timeout_counter> > <timeout>)
		finalprintf \{qs(0xf2dc26f6)}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{character_pak_loadpak_lock = 1}
	Change \{character_pak_loadpak_done = 0}
	Change \{character_pak_loadpak_failed = 0}
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
		finalprintf \{qs(0xbd4a02ef)}
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
		finalprintf \{qs(0x815b9564)}
		ScriptAssert \{qs(0x2994b14c)}
	endif
endscript

script LoadPakAsync_callback 
	if NOT (<Result> = 0)
		Change \{character_pak_loadpak_done = 1}
		Change \{character_pak_loadpak_failed = 1}
	endif
	if GotParam \{end}
		finalprintf \{qs(0x808a582f)}
		Change \{character_pak_loadpak_done = 1}
	else
		finalprintf \{qs(0x2cbdd4b0)}
	endif
endscript
