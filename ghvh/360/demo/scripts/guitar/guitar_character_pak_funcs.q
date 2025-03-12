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
	finalprintf qs(0xc712b829) s = <pak_name> a = <heap> i = <async>
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
	<timeout_counter> = 0
	begin
	if ($character_pak_loadpak_done = 1)
		break
	endif
	<timeout_counter> = (<timeout_counter> + 1)
	if (<timeout_counter> > <timeout>)
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
	return {
		true
		loadpak_alloc_size = <loadpak_alloc_size>
		loadpak_alloc_size_vram = <loadpak_alloc_size_vram>
	}
endscript

script check_character_pak_loadpak_lock 
	if ($character_pak_loadpak_lock = 1)
		finalprintf \{qs(0x815b9564)}
		scriptassert \{qs(0x2994b14c)}
	endif
endscript

script loadpakasync_callback 
	if ($character_pak_loadpak_done = 1)
		return \{true}
	endif
	if NOT (<result> = 0)
		change \{character_pak_loadpak_done = 1}
		change \{character_pak_loadpak_failed = 1}
		return \{true}
	endif
	if gotparam \{end}
		finalprintf \{qs(0x808a582f)}
		change \{character_pak_loadpak_done = 1}
	else
		finalprintf \{qs(0x2cbdd4b0)}
	endif
endscript
