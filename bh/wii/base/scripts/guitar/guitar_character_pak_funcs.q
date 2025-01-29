unloadpak_lock = 0
loadpak_lock = 0
loadpak_done = 0
loadpak_failed = 0

script UnloadPakAsync \{async = 1}
	RequireParams \{[
			pak_name
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
	if (GotParam pak_unload)
		UnloadPakAsync pak_name = <pak_unload> async = <async>
	endif
	GetContentFolderIndexFromFile <pak_name>
	if (<device> = content)
	endif
	if (<async> = 0)
		if (GotParam no_vram)
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> no_vram
				Change \{loadpak_failed = 1}
			endif
		else
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device>
				Change \{loadpak_failed = 1}
			endif
		endif
		Change \{loadpak_done = 1}
	else
		if (ispakloaded <pak_name> Heap = <Heap>)
			LoadPakAsync_callback \{Result = 0
				end = 1}
		else
			if (GotParam no_vram)
				if NOT LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device> no_vram
					LoadPakAsync_callback \{Result = 1
						end = 0}
				endif
			else
				if NOT LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = None device = <device>
					LoadPakAsync_callback \{Result = 1
						end = 0}
				endif
			endif
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
	if NOT (<Result> = 0)
		Change \{loadpak_done = 1}
		Change \{loadpak_failed = 1}
	endif
	if GotParam \{end}
		Change \{loadpak_done = 1}
	endif
endscript
