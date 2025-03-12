musician_heaps = [
	heap_musician1
	heap_musician2
	heap_musician3
	heap_musician4
]
character_pak_loadpak_lock = 0
character_pak_loadpak_done = 0
character_pak_loadpak_failed = 0

script loadpakasync 
	printf qs(0x61a6fcd3) s = <pak_name> a = <heap> i = <async>
	begin
	if ($character_pak_loadpak_lock = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{character_pak_loadpak_lock = 1}
	change \{character_pak_loadpak_done = 0}
	change \{character_pak_loadpak_failed = 0}
	onexitrun \{check_character_pak_loadpak_lock}
	getcontentfolderindexfromfile <pak_name>
	if (<device> = content)
		if NOT downloads_opencontentfolder content_index = <content_index>
			printf \{qs(0xb4c2c4ea)}
			change \{character_pak_loadpak_lock = 0}
			change \{character_pak_loadpak_done = 0}
			return \{false}
		endif
	endif
	if (<async> = 0)
		if (gotparam no_vram)
			if NOT loadpak <pak_name> heap = <heap> device = <device> no_vram
				change \{character_pak_loadpak_failed = 1}
			endif
		else
			if NOT loadpak <pak_name> heap = <heap> device = <device>
				change \{character_pak_loadpak_failed = 1}
			endif
		endif
		change \{character_pak_loadpak_done = 1}
	else
		if (gotparam no_vram)
			loadpak <pak_name> heap = <heap> load_callback = loadpakasync_callback callback_data = none device = <device> no_vram
		else
			loadpak <pak_name> heap = <heap> load_callback = loadpakasync_callback callback_data = none device = <device>
		endif
	endif
	begin
	if ($character_pak_loadpak_done = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<device> = content)
		downloads_closecontentfolder content_index = <content_index>
		if ($character_pak_loadpak_failed = 1)
			change \{character_pak_loadpak_lock = 0}
			change \{character_pak_loadpak_done = 0}
			return \{false}
		endif
	endif
	change \{character_pak_loadpak_lock = 0}
	change \{character_pak_loadpak_done = 0}
	return \{true}
endscript

script check_character_pak_loadpak_lock 
	if ($character_pak_loadpak_lock = 1)
		scriptassert \{qs(0x2994b14c)}
	endif
endscript

script loadpakasync_callback 
	printf \{qs(0x1f56e85f)}
	printstruct <...>
	if NOT (<result> = 0)
		change \{character_pak_loadpak_done = 1}
		change \{character_pak_loadpak_failed = 1}
	endif
	if gotparam \{end}
		change \{character_pak_loadpak_done = 1}
	endif
endscript
