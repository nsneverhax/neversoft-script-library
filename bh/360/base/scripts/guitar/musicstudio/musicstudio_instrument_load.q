MusicStudio_LoadedGuitar = 'none'
MusicStudio_LoadedBass = 'none'
MusicStudio_LoadedKeyboard = 'none'
MusicStudio_Instrument_DefaultGuitarIndex = 0
MusicStudio_Instrument_DefaultBassIndex = 0
MusicStudio_Instrument_DefaultKeyboardIndex = 0
MusicStudio_LoadedGuitar_Block = 0
MusicStudio_LoadedBass_Block = 0
MusicStudio_LoadedKeyboard_Block = 0
MusicStudio_LoadedBass_IsKeyboard = 0
MusicStudio_LoadedBass_IsOneShot = 0
MusicStudio_LoadedKeyboard_IsOneShot = 0
Musicstudio_LoadedSound = null

script MusicStudio_Instrument_LoadGuitar \{guitar_prefix = 'sg_b'
		async = 1}
	if GotParam \{index}
		GetArraySize ($musicstudio_instrument_list_guitar)
		if (<index> >= <array_size> || <index> < 0)
			<index> = 0
		endif
		<guitar_prefix> = ($musicstudio_instrument_list_guitar [<index>].prefix_nl)
	endif
	MusicStudio_Instrument_Load {
		loaded_global = MusicStudio_LoadedGuitar
		block_global = MusicStudio_LoadedGuitar_Block
		instrument_nl = 'guitar'
		prefix_nl = <guitar_prefix>
		heap = heap_musicstudio_guitar
		async = <async>
	}
	musicstudio_init_all_line6_effects
endscript

script MusicStudio_Instrument_UnloadGuitar 
	MusicStudio_Instrument_Unload \{loaded_global = MusicStudio_LoadedGuitar
		instrument_nl = 'guitar'}
endscript

script MusicStudio_Instrument_LoadBass \{bass_prefix = 'fj_b'
		async = 1
		index = 0}
	if GotParam \{index}
		GetArraySize ($musicstudio_instrument_list_bass)
		if (<index> >= <array_size> || <index> < 0)
			<index> = 0
		endif
		<bass_prefix> = ($musicstudio_instrument_list_bass [<index>].prefix_nl)
	endif
	bass_structure = ($musicstudio_instrument_list_bass [<index>])
	MusicStudio_Instrument_UnloadBass
	if StructureContains structure = <bass_structure> bass
		MusicStudio_Instrument_Load {
			loaded_global = MusicStudio_LoadedBass
			block_global = MusicStudio_LoadedBass_Block
			instrument_nl = 'bass'
			prefix_nl = <bass_prefix>
			heap = heap_musicstudio_bass
			async = <async>
		}
		Change \{MusicStudio_LoadedBass_IsKeyboard = 0}
	else
		Change \{MusicStudio_LoadedBass_IsKeyboard = 1}
		if (<bass_prefix> = $MusicStudio_LoadedKeyboard)
			return
		endif
		if StructureContains structure = ($musicstudio_instrument_list_bass [<index>]) one_shot
			Change \{MusicStudio_LoadedBass_IsOneShot = 1}
		else
			Change \{MusicStudio_LoadedBass_IsOneShot = 0}
		endif
		MusicStudio_Instrument_Load {
			loaded_global = MusicStudio_LoadedBass
			block_global = MusicStudio_LoadedBass_Block
			instrument_nl = 'kb'
			prefix_nl = <bass_prefix>
			heap = heap_musicstudio_bass
			async = <async>
		}
	endif
endscript

script MusicStudio_Instrument_UnloadBass 
	if ($MusicStudio_LoadedBass_IsKeyboard = 0)
		MusicStudio_Instrument_Unload \{loaded_global = MusicStudio_LoadedBass
			instrument_nl = 'bass'}
	else
		MusicStudio_Instrument_Unload \{loaded_global = MusicStudio_LoadedBass
			instrument_nl = 'kb'}
	endif
endscript

script MusicStudio_Instrument_LoadKeyboard \{async = 1}
	if GotParam \{index}
		GetArraySize ($musicstudio_instrument_list_keyboard)
		if (<index> >= <array_size> || <index> < 0)
			<index> = 0
		endif
		<keyboard_prefix> = ($musicstudio_instrument_list_keyboard [<index>].prefix_nl)
	endif
	if (<keyboard_prefix> = $MusicStudio_LoadedBass)
		return
	endif
	if StructureContains structure = ($musicstudio_instrument_list_keyboard [<index>]) one_shot
		Change \{MusicStudio_LoadedKeyboard_IsOneShot = 1}
	else
		Change \{MusicStudio_LoadedKeyboard_IsOneShot = 0}
	endif
	MusicStudio_Instrument_Load {
		loaded_global = MusicStudio_LoadedKeyboard
		block_global = MusicStudio_LoadedKeyboard_Block
		instrument_nl = 'kb'
		prefix_nl = <keyboard_prefix>
		heap = heap_musicstudio_keyboard
		async = <async>
	}
endscript

script MusicStudio_Instrument_UnloadKeyboard 
	MusicStudio_Instrument_Unload \{loaded_global = MusicStudio_LoadedKeyboard
		instrument_nl = 'kb'}
endscript

script MusicStudio_Instrument_BlockLoad 
	begin
	if ($<Global> = 0)
		break
	endif
	printf qs(0x9f707dcb) a = <Global>
	wait \{1
		frame}
	repeat
	Change globalname = <Global> newValue = 1
endscript

script MusicStudio_Instrument_EndBlockLoad 
	Change globalname = <Global> newValue = 0
endscript

script MusicStudio_Instrument_Load_OnExit 
	if GotParam \{block_global}
		MusicStudio_Instrument_EndBlockLoad Global = <block_global>
	endif
endscript

script MusicStudio_Instrument_Load 
	RequireParams \{[
			loaded_global
			instrument_nl
			heap
			prefix_nl
		]}
	if GotParam \{block_global}
		MusicStudio_Instrument_BlockLoad Global = <block_global>
		OnExitRun MusicStudio_Instrument_Load_OnExit params = {<...>}
	endif
	SetScriptCannotPause
	if (($<loaded_global>) = <prefix_nl>)
		printf 'MusicStudio_Instrument_Load: already loaded %g (%a == %b)' g = <loaded_global> a = ($<loaded_global>) b = <prefix_nl>
		return
	endif
	if ($Musicstudio_LoadedSound = add_load_screen)
		create_loading_screen
	endif
	printf 'MusicStudio_Instrument_Load: %g (%a != %b)' g = <loaded_global> a = ($<loaded_global>) b = <prefix_nl>
	if NOT (($<loaded_global>) = 'none')
		MusicStudio_Instrument_Unload {
			loaded_global = <loaded_global>
			instrument_nl = <instrument_nl>
		}
	endif
	FormatText TextName = pak_name 'pak/musicstudio_%a_%b.pak' a = <instrument_nl> b = <prefix_nl>
	if ($skip_async_load = 1)
		printf \{'skipping async load!!!!!!!'}
		<async> = 0
	endif
	if NOT LoadPakAsync pak_name = <pak_name> heap = <heap> async = <async>
		ScriptAssert \{'LoadPakAsync failed in MusicStudio_Instrument_Load'}
		DownloadContentLost
		return
	endif
	Change globalname = <loaded_global> newValue = <prefix_nl>
endscript

script MusicStudio_Instrument_Unload 
	RequireParams \{[
			loaded_global
			instrument_nl
		]}
	if (($<loaded_global>) = 'none')
		printf 'MusicStudio_Instrument_Unload: already have nothing in %g' g = <loaded_global>
	else
		printf 'MusicStudio_Instrument_Unload: Unloading %g %a' g = <loaded_global> a = ($<loaded_global>)
		FormatText TextName = pak_name 'pak/musicstudio_%a_%b.pak' a = <instrument_nl> b = ($<loaded_global>)
		UnloadPakAsync pak_name = <pak_name>
		Change globalname = <loaded_global> newValue = 'none'
	endif
endscript

script MusicStudio_Instrument_LoadAll 
	if NOT GotParam \{guitar_index}
		<guitar_index> = ($MusicStudio_Instrument_DefaultGuitarIndex)
	endif
	SetSongInfo guitar_sound = <guitar_index>
	MusicStudio_Instrument_LoadGuitar index = <guitar_index>
	if NOT GotParam \{bass_index}
		<bass_index> = ($MusicStudio_Instrument_DefaultBassIndex)
	endif
	SetSongInfo bass_sound = <bass_index>
	MusicStudio_Instrument_LoadBass index = <bass_index>
	if NOT GotParam \{keyboard_index}
		<keyboard_index> = ($MusicStudio_Instrument_DefaultKeyboardIndex)
	endif
	SetSongInfo keyboard_sound = <keyboard_index>
	MusicStudio_Instrument_LoadKeyboard index = <keyboard_index>
endscript

script MusicStudio_Instrument_UnloadAll 
	MusicStudio_Instrument_UnloadGuitar
	MusicStudio_Instrument_UnloadBass
	MusicStudio_Instrument_UnloadKeyboard
endscript

script MusicStudio_Instrument_CreateHeaps 
	get_heap_sizes
	MemPushContext \{heap_cas_cache}
	if NOT MemHeapExists \{name = heap_musicstudio_guitar}
		MemInitHeap name = 'heap_musicstudio_guitar' size = <heap_size_musicstudio_guitar> vram_size = <heap_size_musicstudio_guitar_vram>
		MemInitHeap name = 'heap_musicstudio_bass' size = <heap_size_musicstudio_bass> vram_size = <heap_size_musicstudio_bass_vram>
		MemInitHeap name = 'heap_musicstudio_keyboard' size = <heap_size_musicstudio_keyboard> vram_size = <heap_size_musicstudio_keyboard_vram>
	endif
	if NOT MemHeapExists \{name = heap_drumkitaudio}
		MemInitHeap name = 'heap_drumkitaudio' size = <heap_size_drumkitaudio> vram_size = <heap_size_drumkitaudio_vram>
		MemInitHeap name = 'heap_drumkitaudio_percussion' size = <heap_size_drumkitaudio_percussion> vram_size = <heap_size_drumkitaudio_percussion_vram>
	endif
	MemPopContext \{heap_cas_cache}
endscript

script MusicStudio_Instrument_CreateDrumHeaps 
	if NOT MemHeapExists \{name = heap_drumkitaudio}
		get_heap_sizes
		MemPushContext \{heap_cas_cache}
		MemInitHeap name = 'heap_drumkitaudio' size = <heap_size_drumkitaudio> vram_size = <heap_size_drumkitaudio_vram>
		MemInitHeap name = 'heap_drumkitaudio_percussion' size = <heap_size_drumkitaudio_percussion> vram_size = <heap_size_drumkitaudio_percussion_vram>
		MemPopContext \{heap_cas_cache}
	endif
endscript

script MusicStudio_Instrument_DeleteHeaps 
	MemDeleteHeap \{name = heap_musicstudio_guitar}
	MemDeleteHeap \{name = heap_musicstudio_bass}
	MemDeleteHeap \{name = heap_musicstudio_keyboard}
	MemDeleteHeap \{name = heap_drumkitaudio}
	MemDeleteHeap \{name = heap_drumkitaudio_percussion}
	if IsPS3
		MemDeleteHeap \{name = heap_drumkitaudio_vram}
		MemDeleteHeap \{name = heap_drumkitaudio_percussion_vram}
		MemDeleteHeap \{name = heap_musicstudio_guitar_vram}
		MemDeleteHeap \{name = heap_musicstudio_bass_vram}
		MemDeleteHeap \{name = heap_musicstudio_keyboard_vram}
	endif
endscript
