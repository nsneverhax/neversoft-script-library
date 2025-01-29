musicstudio_loadedrhythmguitar = 'none'
musicstudio_loadedleadguitar = 'none'
musicstudio_loadedbass = 'none'
musicstudio_loadedkeyboard = 'none'
musicstudio_loadedrhythmguitar_pak = 'none'
musicstudio_loadedleadguitar_pak = 'none'
musicstudio_loadedbass_pak = 'none'
musicstudio_loadedkeyboard_pak = 'none'
musicstudio_loadedrhythmguitar_block = 0
musicstudio_loadedleadguitar_block = 0
musicstudio_loadedbass_block = 0
musicstudio_loadedkeyboard_block = 0
musicstudio_loadedkeyboard_isoneshot = 0
musicstudio_loadedsound = NULL

script musicstudio_instrument_loadrhythmguitar \{async = 0}
	RequireParams \{[
			index
		]
		all}
	sound_name = ($musicstudio_instrument_list_rhythm [<index>].prefix_nl)
	formatText TextName = pak_name 'pak/sounds/jam_mode/musicstudio_rhythm_%a.pak' a = <sound_name>
	musicstudio_instrument_load {
		Heap = quota_rhythm
		prefix = 'trk_b'
		pak_name = <pak_name>
		loaded_global = musicstudio_loadedrhythmguitar
		loaded_global_pak = musicstudio_loadedrhythmguitar_pak
		block_global = musicstudio_loadedrhythmguitar_block
		async = <async>
	}
endscript

script musicstudio_instrument_unloadrhythmguitar \{async = 0}
	printf \{qs(0x9a93c807)}
	musicstudio_instrument_unload {
		loaded_global = musicstudio_loadedrhythmguitar
		loaded_global_pak = musicstudio_loadedrhythmguitar_pak
		async = <async>
	}
endscript

script musicstudio_instrument_loadleadguitar \{async = 0}
	RequireParams \{[
			index
		]
		all}
	sound_name = ($musicstudio_instrument_list_lead [<index>].prefix_nl)
	formatText TextName = pak_name 'pak/sounds/jam_mode/musicstudio_lead_%a.pak' a = <sound_name>
	musicstudio_instrument_load {
		Heap = quota_lead
		prefix = 'trk_b'
		pak_name = <pak_name>
		loaded_global = musicstudio_loadedleadguitar
		loaded_global_pak = musicstudio_loadedleadguitar_pak
		block_global = musicstudio_loadedleadguitar_block
		async = <async>
	}
endscript

script musicstudio_instrument_unloadleadguitar \{async = 0}
	printf \{qs(0xda0973ef)}
	musicstudio_instrument_unload {
		loaded_global = musicstudio_loadedleadguitar
		loaded_global_pak = musicstudio_loadedleadguitar_pak
		async = <async>
	}
endscript

script musicstudio_instrument_loadbass \{async = 0}
	RequireParams \{[
			index
		]
		all}
	sound_name = ($musicstudio_instrument_list_bass [<index>].prefix_nl)
	formatText TextName = pak_name 'pak/sounds/jam_mode/musicstudio_bass_%a.pak' a = <sound_name>
	musicstudio_instrument_load {
		Heap = quota_bass
		prefix = <sound_name>
		pak_name = <pak_name>
		loaded_global = musicstudio_loadedbass
		loaded_global_pak = musicstudio_loadedbass_pak
		block_global = musicstudio_loadedbass_block
		async = <async>
	}
endscript

script musicstudio_instrument_unloadbass \{async = 0}
	printf \{qs(0xd2a35d22)}
	musicstudio_instrument_unload {
		loaded_global = musicstudio_loadedbass
		loaded_global_pak = musicstudio_loadedbass_pak
		async = <async>
	}
endscript

script musicstudio_instrument_loadkeyboard \{async = 0}
	RequireParams \{[
			index
		]
		all}
	Heap = quota_keyboard
	if NOT musicstudio_mainobj :musicstudio_isinmusicstudio
		Heap = quota_song
	endif
	sound_name = ($musicstudio_instrument_list_keyboard [<index>].prefix_nl)
	formatText TextName = pak_name 'pak/sounds/jam_mode/musicstudio_keyboard_%a.pak' a = <sound_name>
	if StructureContains structure = ($musicstudio_instrument_list_keyboard [<index>]) one_shot
		Change \{musicstudio_loadedkeyboard_isoneshot = 1}
	else
		Change \{musicstudio_loadedkeyboard_isoneshot = 0}
	endif
	musicstudio_instrument_load {
		Heap = <Heap>
		prefix = <sound_name>
		pak_name = <pak_name>
		loaded_global = musicstudio_loadedkeyboard
		loaded_global_pak = musicstudio_loadedkeyboard_pak
		block_global = musicstudio_loadedkeyboard_block
		async = <async>
	}
endscript

script musicstudio_instrument_unloadkeyboard \{async = 0}
	printf \{qs(0x79a4890b)}
	musicstudio_instrument_unload {
		loaded_global = musicstudio_loadedkeyboard
		loaded_global_pak = musicstudio_loadedkeyboard_pak
		async = <async>
	}
endscript

script musicstudio_instrument_blockload 
	begin
	if ($<Global> = 0)
		break
	endif
	printf qs(0x166aeff5) a = <Global>
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

script musicstudio_instrument_load \{async = 0
		Heap = quota_samples}
	RequireParams \{[
			loaded_global
			loaded_global_pak
			pak_name
			prefix
		]
		all}
	setscriptcannotpause
	if GotParam \{block_global}
		musicstudio_instrument_blockload Global = <block_global>
		OnExitRun musicstudio_instrument_load_onexit params = {<...>}
	endif
	if (($<loaded_global_pak>) = <pak_name>)
		printf 'MusicStudio_Instrument_Load: already loaded %g (%a == %b)' g = <loaded_global_pak> a = ($<loaded_global_pak>) b = <pak_name>
		return
	endif
	if ($musicstudio_loadedsound = add_load_screen)
		create_loading_screen
	endif
	printf 'MusicStudio_Instrument_Load: %g (%a != %b)' g = <loaded_global_pak> a = ($<loaded_global_pak>) b = <pak_name>
	status = 0
	if ($skip_async_load = 1)
		printf \{'skipping async load!!!!!!!'}
		<async> = 0
	endif
	if (<async> = 1)
		<status> = 1
		if (($<loaded_global_pak>) = 'none')
			spawnscript LoadPakAsync params = {pak_name = <pak_name> Heap = <Heap> async = <async>}
		else
			spawnscript LoadPakAsync params = {pak_name = <pak_name> Heap = <Heap> async = <async> pak_unload = ($<loaded_global_pak>)}
		endif
	else
		musicstudio_instrument_unload {
			loaded_global = <loaded_global>
			loaded_global_pak = <loaded_global_pak>
		}
		if LoadPak <pak_name> Heap = <Heap>
			<status> = 1
		endif
	endif
	if (<status> = 1)
		Change GlobalName = <loaded_global> NewValue = <prefix>
		Change GlobalName = <loaded_global_pak> NewValue = <pak_name>
	endif
endscript

script musicstudio_instrument_unload \{async = 0}
	RequireParams \{[
			loaded_global
			loaded_global_pak
		]
		all}
	if NOT (($<loaded_global_pak>) = 'none')
		printf 'MusicStudio_Instrument_Unload: Unloading %g %a' g = <loaded_global_pak> a = ($<loaded_global_pak>)
		if (<async> = 1)
			spawnscript UnloadPakAsync params = {pak_name = ($<loaded_global_pak>) async = <async>}
		else
			UnLoadPak ($<loaded_global_pak>)
			WaitUnloadPak ($<loaded_global_pak>) Block
		endif
		Change GlobalName = <loaded_global> NewValue = 'none'
		Change GlobalName = <loaded_global_pak> NewValue = 'none'
	endif
endscript

script musicstudio_instrument_loadall 
	printf \{qs(0x441b6b8e)}
	musicstudio_instrument_unloadall
	gettrackinfo track = ($jam_tracks [0].id)
	musicstudio_change_sound instrument = 0 index = <effect>
	gettrackinfo track = ($jam_tracks [1].id)
	musicstudio_change_sound instrument = 1 index = <effect>
	getsonginfo
	musicstudio_change_sound instrument = 2 index = <bass_kit>
	musicstudio_change_sound instrument = 4 index = <keyboard_sound>
endscript

script musicstudio_instrument_unloadall 
	printf \{qs(0xb011c876)}
	musicstudio_instrument_unloadkeyboard
	musicstudio_instrument_unloadbass
	musicstudio_instrument_unloadleadguitar
	musicstudio_instrument_unloadrhythmguitar
endscript
