musician_heaps = [
	heap_musician1
	heap_musician2
	heap_musician3
	heap_musician4
]
character_pak_loadpak_lock = 0
character_pak_loadpak_done = 0
character_pak_loadpak_failed = 0

script LoadPakAsync 
	printf qs(0x61a6fcd3) s = <pak_name> a = <Heap> i = <async>
	begin
	if ($character_pak_loadpak_lock = 0)
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
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> no_vram
				Change \{character_pak_loadpak_failed = 1}
			endif
		else
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device>
				Change \{character_pak_loadpak_failed = 1}
			endif
		endif
		Change \{character_pak_loadpak_done = 1}
	else
		if (GotParam no_vram)
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device> no_vram
		else
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device>
		endif
	endif
	begin
	if ($character_pak_loadpak_done = 1)
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
	return \{true}
endscript

script check_character_pak_loadpak_lock 
	if ($character_pak_loadpak_lock = 1)
		ScriptAssert \{qs(0x2994b14c)}
	endif
endscript

script LoadPakAsync_callback 
	printf \{qs(0x1f56e85f)}
	printstruct <...>
	if NOT (<Result> = 0)
		Change \{character_pak_loadpak_done = 1}
		Change \{character_pak_loadpak_failed = 1}
	endif
	if GotParam \{end}
		Change \{character_pak_loadpak_done = 1}
	endif
endscript
