musicstudio_loadedguitar = 'none'
musicstudio_loadedbass = 'none'
musicstudio_loadedkeyboard = 'none'
musicstudio_instrument_defaultguitarindex = 0
musicstudio_instrument_defaultbassindex = 0
musicstudio_instrument_defaultkeyboardindex = 0
musicstudio_loadedguitar_block = 0
musicstudio_loadedbass_block = 0
musicstudio_loadedkeyboard_block = 0
musicstudio_loadedbass_iskeyboard = 0
musicstudio_loadedbass_isoneshot = 0
musicstudio_loadedkeyboard_isoneshot = 0
musicstudio_loadedsound = NULL

script musicstudio_instrument_loadguitar \{guitar_prefix = 'sg_b'
		async = 1}
	if GotParam \{index}
		GetArraySize ($musicstudio_instrument_list_guitar)
		if (<index> >= <array_Size> || <index> < 0)
			<index> = 0
		endif
		<guitar_prefix> = ($musicstudio_instrument_list_guitar [<index>].prefix_nl)
	endif
	musicstudio_instrument_load {
		loaded_global = musicstudio_loadedguitar
		block_global = musicstudio_loadedguitar_block
		instrument_nl = 'guitar'
		prefix_nl = <guitar_prefix>
		Heap = heap_musicstudio_guitar
		async = <async>
	}
	musicstudio_init_all_line6_effects
endscript

script musicstudio_instrument_unloadguitar 
	musicstudio_instrument_unload \{loaded_global = musicstudio_loadedguitar
		instrument_nl = 'guitar'}
endscript

script musicstudio_instrument_loadbass \{bass_prefix = 'fj_b'
		async = 1
		index = 0}
	if GotParam \{index}
		GetArraySize ($musicstudio_instrument_list_bass)
		if (<index> >= <array_Size> || <index> < 0)
			<index> = 0
		endif
		<bass_prefix> = ($musicstudio_instrument_list_bass [<index>].prefix_nl)
	endif
	bass_structure = ($musicstudio_instrument_list_bass [<index>])
	musicstudio_instrument_unloadbass
	if StructureContains structure = <bass_structure> bass
		musicstudio_instrument_load {
			loaded_global = musicstudio_loadedbass
			block_global = musicstudio_loadedbass_block
			instrument_nl = 'bass'
			prefix_nl = <bass_prefix>
			Heap = heap_musicstudio_bass
			async = <async>
		}
		Change \{musicstudio_loadedbass_iskeyboard = 0}
	else
		Change \{musicstudio_loadedbass_iskeyboard = 1}
		if (<bass_prefix> = $musicstudio_loadedkeyboard)
			Change musicstudio_loadedbass = <bass_prefix>
			return
		endif
		if StructureContains structure = ($musicstudio_instrument_list_bass [<index>]) one_shot
			Change \{musicstudio_loadedbass_isoneshot = 1}
		else
			Change \{musicstudio_loadedbass_isoneshot = 0}
		endif
		musicstudio_instrument_load {
			loaded_global = musicstudio_loadedbass
			block_global = musicstudio_loadedbass_block
			instrument_nl = 'kb'
			prefix_nl = <bass_prefix>
			Heap = heap_musicstudio_bass
			async = <async>
		}
	endif
endscript

script musicstudio_instrument_unloadbass 
	if ($musicstudio_loadedbass_iskeyboard = 0)
		musicstudio_instrument_unload \{loaded_global = musicstudio_loadedbass
			instrument_nl = 'bass'}
	else
		musicstudio_instrument_unload \{loaded_global = musicstudio_loadedbass
			instrument_nl = 'kb'}
	endif
endscript

script musicstudio_instrument_loadkeyboard \{async = 1}
	if GotParam \{index}
		GetArraySize ($musicstudio_instrument_list_keyboard)
		if (<index> >= <array_Size> || <index> < 0)
			<index> = 0
		endif
		<keyboard_prefix> = ($musicstudio_instrument_list_keyboard [<index>].prefix_nl)
	endif
	if (<keyboard_prefix> = $musicstudio_loadedbass)
		Change musicstudio_loadedkeyboard = <keyboard_prefix>
		return
	endif
	if StructureContains structure = ($musicstudio_instrument_list_keyboard [<index>]) one_shot
		Change \{musicstudio_loadedkeyboard_isoneshot = 1}
	else
		Change \{musicstudio_loadedkeyboard_isoneshot = 0}
	endif
	musicstudio_instrument_load {
		loaded_global = musicstudio_loadedkeyboard
		block_global = musicstudio_loadedkeyboard_block
		instrument_nl = 'kb'
		prefix_nl = <keyboard_prefix>
		Heap = heap_musicstudio_keyboard
		async = <async>
	}
endscript

script musicstudio_instrument_unloadkeyboard 
	musicstudio_instrument_unload \{loaded_global = musicstudio_loadedkeyboard
		instrument_nl = 'kb'}
endscript

script musicstudio_instrument_blockload 
	begin
	if ($<Global> = 0)
		break
	endif
	printf qs(0x9f707dcb) a = <Global>
	Wait \{1
		Frame}
	repeat
	Change GlobalName = <Global> NewValue = 1
endscript

script musicstudio_instrument_endblockload 
	Change GlobalName = <Global> NewValue = 0
endscript

script musicstudio_instrument_load_onexit 
	if GotParam \{block_global}
		musicstudio_instrument_endblockload Global = <block_global>
	endif
endscript

script musicstudio_instrument_load 
	RequireParams \{[
			loaded_global
			instrument_nl
			Heap
			prefix_nl
		]}
	if GotParam \{block_global}
		musicstudio_instrument_blockload Global = <block_global>
		OnExitRun musicstudio_instrument_load_onexit params = {<...>}
	endif
	setscriptcannotpause
	if (($<loaded_global>) = <prefix_nl>)
		printf 'MusicStudio_Instrument_Load: already loaded %g (%a == %b)' g = <loaded_global> a = ($<loaded_global>) b = <prefix_nl>
		return
	endif
	if ($musicstudio_loadedsound = add_load_screen)
		create_loading_screen
	endif
	printf 'MusicStudio_Instrument_Load: %g (%a != %b)' g = <loaded_global> a = ($<loaded_global>) b = <prefix_nl>
	if NOT (($<loaded_global>) = 'none')
		musicstudio_instrument_unload {
			loaded_global = <loaded_global>
			instrument_nl = <instrument_nl>
		}
	endif
	formatText TextName = pak_name 'pak/musicstudio_%a_%b.pak' a = <instrument_nl> b = <prefix_nl>
	if ($skip_async_load = 1)
		printf \{'skipping async load!!!!!!!'}
		<async> = 0
	endif
	if NOT LoadPakAsync pak_name = <pak_name> Heap = <Heap> async = <async>
		ScriptAssert \{'LoadPakAsync failed in MusicStudio_Instrument_Load'}
		DownloadContentLost
		return
	endif
	Change GlobalName = <loaded_global> NewValue = <prefix_nl>
endscript

script musicstudio_instrument_unload 
	RequireParams \{[
			loaded_global
			instrument_nl
		]}
	if (($<loaded_global>) = 'none')
		printf 'MusicStudio_Instrument_Unload: already have nothing in %g' g = <loaded_global>
	else
		printf 'MusicStudio_Instrument_Unload: Unloading %g %a' g = <loaded_global> a = ($<loaded_global>)
		formatText TextName = pak_name 'pak/musicstudio_%a_%b.pak' a = <instrument_nl> b = ($<loaded_global>)
		UnloadPakAsync pak_name = <pak_name>
		Change GlobalName = <loaded_global> NewValue = 'none'
	endif
endscript

script musicstudio_instrument_loadall 
	if NOT GotParam \{guitar_index}
		<guitar_index> = ($musicstudio_instrument_defaultguitarindex)
	endif
	setsonginfo guitar_sound = <guitar_index>
	musicstudio_instrument_loadguitar index = <guitar_index>
	if NOT GotParam \{bass_index}
		<bass_index> = ($musicstudio_instrument_defaultbassindex)
	endif
	setsonginfo bass_sound = <bass_index>
	musicstudio_instrument_loadbass index = <bass_index>
	if NOT GotParam \{keyboard_index}
		<keyboard_index> = ($musicstudio_instrument_defaultkeyboardindex)
	endif
	setsonginfo keyboard_sound = <keyboard_index>
	musicstudio_instrument_loadkeyboard index = <keyboard_index>
endscript

script musicstudio_instrument_unloadall 
	musicstudio_instrument_unloadguitar
	musicstudio_instrument_unloadbass
	musicstudio_instrument_unloadkeyboard
endscript

script musicstudio_instrument_createheaps 
	get_heap_sizes
	MemPushContext \{heap_cas_cache}
	if NOT memheapexists \{Name = heap_musicstudio_guitar}
		MemInitHeap Name = 'heap_musicstudio_guitar' size = <heap_size_musicstudio_guitar> vram_size = <heap_size_musicstudio_guitar_vram>
		MemInitHeap Name = 'heap_musicstudio_bass' size = <heap_size_musicstudio_bass> vram_size = <heap_size_musicstudio_bass_vram>
		MemInitHeap Name = 'heap_musicstudio_keyboard' size = <heap_size_musicstudio_keyboard> vram_size = <heap_size_musicstudio_keyboard_vram>
	endif
	if NOT memheapexists \{Name = heap_drumkitaudio}
		MemInitHeap Name = 'heap_drumkitaudio' size = <heap_size_drumkitaudio> vram_size = <heap_size_drumkitaudio_vram>
		MemInitHeap Name = 'heap_drumkitaudio_percussion' size = <heap_size_drumkitaudio_percussion> vram_size = <heap_size_drumkitaudio_percussion_vram>
	endif
	MemPopContext \{heap_cas_cache}
endscript

script musicstudio_instrument_createdrumheaps 
	if NOT memheapexists \{Name = heap_drumkitaudio}
		get_heap_sizes
		MemPushContext \{heap_cas_cache}
		MemInitHeap Name = 'heap_drumkitaudio' size = <heap_size_drumkitaudio> vram_size = <heap_size_drumkitaudio_vram>
		MemInitHeap Name = 'heap_drumkitaudio_percussion' size = <heap_size_drumkitaudio_percussion> vram_size = <heap_size_drumkitaudio_percussion_vram>
		MemPopContext \{heap_cas_cache}
	endif
endscript

script musicstudio_instrument_deleteheaps 
	memdeleteheap \{Name = heap_musicstudio_guitar}
	memdeleteheap \{Name = heap_musicstudio_bass}
	memdeleteheap \{Name = heap_musicstudio_keyboard}
	memdeleteheap \{Name = heap_drumkitaudio}
	memdeleteheap \{Name = heap_drumkitaudio_percussion}
	if isps3
		memdeleteheap \{Name = heap_drumkitaudio_vram}
		memdeleteheap \{Name = heap_drumkitaudio_percussion_vram}
		memdeleteheap \{Name = heap_musicstudio_guitar_vram}
		memdeleteheap \{Name = heap_musicstudio_bass_vram}
		memdeleteheap \{Name = heap_musicstudio_keyboard_vram}
	endif
endscript
