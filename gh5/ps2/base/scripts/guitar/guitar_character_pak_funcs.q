unloadpak_lock = 0
loadpak_lock = 0
loadpak_done = 0
loadpak_failed = 0
0x652da952 = 1

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

		return
	endif
	begin
	if NOT smartpak_unload <pass_params>
		return
	endif
	repeat
endscript

script smartloadpakman \{async = 1}

	if NOT ischecksum <pak_name>

	endif
	if smartpak_ispakloaded pak_name = <pak_name> pak_id = <pak_id>

		smartpak_load pak_name = <pak_name> pak_id = <pak_id> tags = {map = <map> <tags>}
		return \{true}
	endif
	if getpakmannumfreeslots map = <map>
		slot = <firstfreeslot>
		0x8dbdaee4 qs(0xa095962a) i = <slot>
	else
		0x8dbdaee4 \{qs(0x404d6310)}
		smartflushpak async = <async> single tags = {map = <map>}
		if NOT getpakmannumfreeslots map = <map>
			smartpak_dump

		endif
		slot = <firstfreeslot>
	endif

	if NOT loadpakmanasync map = <map> pak_name = <pak_name> async = <async> slot = <slot>
		return \{FALSE}
	endif
	smartpak_load new pak_name = <pak_name> pak_id = <pak_id> map = <map> slot = <slot> tags = {map = <map> <tags>}
	return \{true}
endscript

script smartloadpak \{async = 1}

	if ischecksum <pak_name>

	endif
	if smartpak_ispakloaded pak_name = <pak_name> pak_id = <pak_id>

		smartpak_load pak_name = <pak_name> pak_id = <pak_id> tags = {Heap = <Heap> <tags>}
		return \{true}
	endif
	smartflushpak async = <async> tags = {Heap = <Heap>}
	if NOT LoadPakAsync pak_name = <pak_name> async = <async> Heap = <Heap> is_raw = <is_raw> no_vram = <no_vram>
		return \{FALSE}
	endif

	smartpak_load new pak_name = <pak_name> pak_id = <pak_id> tags = {Heap = <Heap> <tags>}
	return \{true}
endscript

script smartflushpak \{async = 1}

	if GotParam \{all}
		pass_params = {all}
	elseif GotParam \{pak_id}
		pass_params = {pak_id = <pak_id>}
	elseif GotParam \{pak_name}
		pass_params = {pak_name = <pak_name>}
	elseif GotParam \{tags}
		pass_params = {tags = <tags>}
	else

		return
	endif
	smartpak_dump
	begin
	if NOT smartpak_flush <pass_params>
		return
	endif
	if GotParam \{flushed_map}

		loadpakmanasync async = <async> pak_name = None map = <flushed_map> slot = <flushed_slot>
	else

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

	setscriptcannotpause

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
		GetContentFolderIndexFromFile <pak_filename>
		if (<device> = content)
			if NOT Downloads_OpenContentFolder content_index = <content_index>

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

	setscriptcannotpause

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

	endif
endscript

script LoadPakAsync \{async = 1
		is_raw = 0}

	setscriptcannotpause

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
	Change \{0x652da952 = 0}
	GetContentFolderIndexFromFile <pak_name>
	if (<device> = content)
		if NOT Downloads_OpenContentFolder content_index = <content_index>

			Change \{loadpak_lock = 0}
			Change \{loadpak_done = 0}
			return \{FALSE}
		endif
	endif
	if (<async> = 0)
		if (GotParam no_vram)
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> <is_raw_flag> content_id = <content_id> no_vram
				Change \{loadpak_failed = 1}
			endif
		else
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> <is_raw_flag> content_id = <content_id>
				Change \{loadpak_failed = 1}
			endif
		endif
		Change \{loadpak_done = 1}
	else
		if (GotParam no_vram)
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device> content_id = <content_id> <is_raw_flag> no_vram
		else
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device> content_id = <content_id> <is_raw_flag>
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

	endif
endscript

script LoadPakAsync_callback 
	if NOT (<Result> = 0)
		Change \{loadpak_done = 1}
		Change \{loadpak_failed = 1}
	endif
	if GotParam \{end}
		Change \{loadpak_done = 1}
	endif
endscript
