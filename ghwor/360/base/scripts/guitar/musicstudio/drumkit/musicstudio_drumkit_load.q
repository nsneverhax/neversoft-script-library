
script loaddrumkitall \{standard = 1
		percussion = 1
		practice_percussion = 0
		async = 1
		reset_percussion = 1
		song = NULL}
	begin
	if ($loaddrumkitall_lock = 0)
		break
		printf \{qs(0x73a6effd)}
	endif
	Wait \{1
		Frame}
	repeat
	if ((<song> != NULL) && (<song> != jamsession))
		<percussion> = 0
	endif
	Change \{loaddrumkitall_lock = 1}
	OnExitRun \{loaddrumkitall_exit}
	printf \{qs(0x2f92d628)}
	if (<reset_percussion> = 1)
		Change \{is_percussion_kit = 0}
	endif
	yield
	if (<standard> = 1)
		if NOT GotParam \{drum_kit_index}
			<drum_kit_index> = $jam_current_drum_kit
		endif
		loaddrumpadgroup percussion = 0 drum_kit_index = <drum_kit_index> async = <async> song = <song>
	endif
	if (<practice_percussion> = 1)
		loaddrumpadgroup percussion = 1 kit_string = ($g_practice_percussion_kit) async = <async> song = <song>
	elseif (<percussion> = 1)
		if GotParam \{take_perc_from_base}
			find_percussion_from_base_kit drum_kit_index = <drum_kit_index>
		endif
		if NOT GotParam \{percussion_kit_index}
			musicstudio_get_current_percussion_kit
			<percussion_kit_index> = <current_percussion_kit>
		endif
		if (<percussion_kit_index> = -1)
			ScriptAssert qs(0x8a7974c7) a = <drum_kit_index>
			<percussion_kit_index> = 0
		endif
		loaddrumpadgroup percussion = 1 drum_kit_index = <percussion_kit_index> async = <async> song = <song>
	endif
endscript

script loaddrumkitall_exit 
	Change \{loaddrumkitall_lock = 0}
endscript

script loaddrumpadgroup 
	RequireParams \{[
			percussion
			async
		]
		all}
	Change \{loadeddrumkits_hadchange = 0}
	if GotParam \{kit_string}
		collectpadspecifickitloadinginfo song = <song> Type = cymbal kit_string = <kit_string> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> Type = tom2 kit_string = <kit_string> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> Type = hihat kit_string = <kit_string> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> Type = tom1 kit_string = <kit_string> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> Type = kick kit_string = <kit_string> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> Type = snare kit_string = <kit_string> percussion = <percussion>
	else
		if (<percussion> = 1)
			musicstudio_clamp_drum_kit_range percussion = 1 index = <drum_kit_index>
			<song> = NULL
		else
			musicstudio_clamp_drum_kit_range percussion = 0 index = <drum_kit_index>
		endif
		Change \{loadeddrumkits_hadchange = 0}
		collectpadspecifickitloadinginfo song = <song> Type = cymbal drum_kit_index = <drum_kit_index> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> Type = tom2 drum_kit_index = <drum_kit_index> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> Type = hihat drum_kit_index = <drum_kit_index> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> Type = tom1 drum_kit_index = <drum_kit_index> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> Type = kick drum_kit_index = <drum_kit_index> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> Type = snare drum_kit_index = <drum_kit_index> percussion = <percussion>
	endif
	if ($loadeddrumkits_hadchange = 1)
		if (<percussion> = 0)
		else
		endif
		if (<percussion> = 1)
			unloaddrumkitall async = <async> standard = 0 reset_globals = 0
		else
			unloaddrumkitall async = <async> percussion = 0 reset_globals = 0
		endif
		loaddrumkit Type = cymbal async = <async> percussion = <percussion>
		loaddrumkit Type = tom2 async = <async> percussion = <percussion>
		loaddrumkit Type = hihat async = <async> percussion = <percussion>
		loaddrumkit Type = tom1 async = <async> percussion = <percussion>
		loaddrumkit Type = kick async = <async> percussion = <percussion>
		loaddrumkit Type = snare async = <async> percussion = <percussion>
	else
		print_drum_pad_kits \{message = 'Drum kit already loaded. Leaving in memory.'}
	endif
endscript

script loaddrumkit \{Type = snare
		drum_kit = 'heavyrock'
		async = 1
		percussion = 0}
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	setscriptcannotpause
	get_global_pad_struct_checksum Type = <Type> percussion = <percussion>
	<drum_kit> = $<global_pad_struct>
	if StructureContains structure = $drumkitparts <Type>
		get_loadeddrumkitpak pad = <Type> percussion = <percussion>
		if NOT (<pakname> = 'none')
			unloaddrumkit Type = <Type> percussion = <percussion>
		endif
		<type_string> = ($drumkitparts.<Type>)
		if (<Type> = tom1)
			<type_string> = 'hitom'
		elseif (<Type> = tom2)
			<type_string> = 'floortom'
		endif
		formatText TextName = drumkit_pakname 'pak/drumkits/%s_%t.pak' s = <drum_kit> t = <type_string>
		if (<percussion> = 1)
			<Heap> = heap_drumkitaudio_percussion
		else
			<Heap> = heap_drumkitaudio
		endif
		if ($musicstudio_loadedsound = add_load_screen)
			create_loading_screen
		endif
		if NOT LoadPakAsync pak_name = <drumkit_pakname> Heap = <Heap> async = <async>
			DownloadContentLost
			return
		endif
		set_loadeddrumkitpak pad = <Type> percussion = <percussion> pakname = <drumkit_pakname>
	else
		printscriptinfo \{qs(0xe6275509)}
		ScriptAssert \{qs(0x0d594f4d)}
	endif
endscript

script unloaddrumkitall \{standard = 1
		percussion = 1
		async = 0
		reset_globals = 1}
	if (<standard> = 1)
		unloaddrumkit \{Type = cymbal
			percussion = 0}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit \{Type = tom2
			percussion = 0}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit \{Type = hihat
			percussion = 0}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit \{Type = tom1
			percussion = 0}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit \{Type = kick
			percussion = 0}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit \{Type = snare
			percussion = 0}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		if (<reset_globals> = 1)
			Change \{perpad_drum_cymbal = 'null'}
			Change \{perpad_drum_tom2 = 'null'}
			Change \{perpad_drum_hihat = 'null'}
			Change \{perpad_drum_tom1 = 'null'}
			Change \{perpad_drum_kick = 'null'}
			Change \{perpad_drum_snare = 'null'}
		endif
	endif
	if (<percussion> = 1)
		unloaddrumkit \{Type = cymbal
			percussion = 1}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit \{Type = tom2
			percussion = 1}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit \{Type = hihat
			percussion = 1}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit \{Type = tom1
			percussion = 1}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit \{Type = kick
			percussion = 1}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit \{Type = snare
			percussion = 1}
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		if (<reset_globals> = 1)
			Change \{perpad_drum_p_cymbal = 'null'}
			Change \{perpad_drum_p_tom2 = 'null'}
			Change \{perpad_drum_p_hihat = 'null'}
			Change \{perpad_drum_p_tom1 = 'null'}
			Change \{perpad_drum_p_kick = 'null'}
			Change \{perpad_drum_p_snare = 'null'}
		endif
	endif
endscript

script unloaddrumkit \{Type = snare}
	if StructureContains structure = $drumkitparts <Type>
		get_loadeddrumkitpak pad = <Type> percussion = <percussion>
		if NOT (<pakname> = 'none')
			UnloadPakAsync pak_name = (<pakname>)
			set_loadeddrumkitpak pad = <Type> percussion = <percussion> pakname = 'none'
		endif
	else
		printscriptinfo \{qs(0x1bc96f66)}
		ScriptAssert \{qs(0x0d594f4d)}
	endif
endscript

script collectpadspecifickitloadinginfo \{song = NULL}
	if (<song> = NULL)
		<song_name> = 'null'
		<songlist_structure> = {}
	else
		get_song_name song = <song>
		<songlist_structure> = ($gh_songlist_props.<song>)
	endif
	if GotParam \{kit_string}
		printf channel = musicstudio qs(0xbe47b0e7) a = <Type> b = <kit_string>
		change_jam_current_drum_kit_padspecifickit pad = <Type> kit_string = <kit_string> persong_sample = NULL percussion = <percussion>
		return
	endif
	if (<percussion> = 1)
		<kit_structure> = (($percussion_drum_kits) [<drum_kit_index>])
		get_global_pad_struct_checksum percussion = 1 Type = <Type>
		<pad_checksum> = <Type>
		per_song_sample_struct = NULL
		<kit_string> = (<kit_structure>.string_id)
	else
		<kit_structure> = (($drum_kits) [<drum_kit_index>])
		get_global_pad_struct_checksum percussion = 0 Type = <Type>
		<pad_checksum> = <Type>
		formatText checksumName = per_song_sample_struct '%s_persong_%a_sampleset' s = <song_name> a = ($drumkitparts.<Type>)
		<kit_string> = (<kit_structure>.string_id)
	endif
	if GlobalExists Name = <per_song_sample_struct>
		change_jam_current_drum_kit_padspecifickit pad = <Type> kit_string = <song_name> persong_sample = <per_song_sample_struct> percussion = 0
	elseif StructureContains structure = <songlist_structure> <pad_checksum>
		<kit_string> = (<songlist_structure>.<pad_checksum>)
		change_jam_current_drum_kit_padspecifickit pad = <Type> kit_string = <kit_string> persong_sample = NULL percussion = <percussion>
	elseif StructureContains structure = <kit_structure> <pad_checksum>
		<kit_string> = (<kit_structure>.<pad_checksum>)
		change_jam_current_drum_kit_padspecifickit pad = <Type> kit_string = <kit_string> persong_sample = NULL percussion = <percussion>
	else
		change_jam_current_drum_kit_padspecifickit pad = <Type> kit_string = <kit_string> persong_sample = NULL percussion = <percussion>
	endif
endscript

script get_global_pad_struct_checksum \{percussion = 0
		Type = cymbal}
	if (<percussion> = 1)
		formatText checksumName = global_pad_struct 'perpad_drum_p_%s' s = ($drumkitparts.<Type>)
	else
		formatText checksumName = global_pad_struct 'perpad_drum_%s' s = ($drumkitparts.<Type>)
	endif
	return global_pad_struct = <global_pad_struct>
endscript

script change_jam_current_drum_kit_padspecifickit \{percussion = 0}
	<pad_string> = ($drumkitparts.<pad>)
	if (<percussion> = 1)
		formatText checksumName = global_checksum 'perpad_drum_p_%s' s = <pad_string>
	else
		formatText checksumName = global_checksum 'perpad_drum_%s' s = <pad_string>
	endif
	if ($<global_checksum> != <kit_string>)
		Change \{loadeddrumkits_hadchange = 1}
	endif
	Change GlobalName = <global_checksum> NewValue = <kit_string>
	if GotParam \{persong_sample}
		formatText checksumName = global_checksum_persong 'persong_drum_%s' s = <pad_string>
		Change GlobalName = <global_checksum_persong> NewValue = <persong_sample>
	endif
endscript

script get_drum_kit_globals \{pad = cymbal}
	<pad_string> = ($drumkitparts.<pad>)
	formatText checksumName = global_checksum 'perpad_drum_%s' s = <pad_string>
	<perpad_drum> = ($<global_checksum>)
	formatText checksumName = global_checksum 'perpad_drum_p_%s' s = <pad_string>
	<perpad_drum_p> = ($<global_checksum>)
	formatText checksumName = global_checksum 'persong_drum_%s' s = <pad_string>
	<persong_drum_p> = ($<global_checksum>)
	return perpad_drum = <perpad_drum> perpad_drum_p = <perpad_drum_p> persong_drum_p = <persong_drum_p>
endscript

script find_percussion_from_base_kit \{drum_kit_index = 1}
	<base_kit_structure> = (($drum_kits) [<drum_kit_index>])
	<percussion_id> = (<base_kit_structure>.percussion_id)
	GetArraySize \{$percussion_drum_kits}
	i = 0
	begin
	<percussion_kit_structure> = (($percussion_drum_kits) [<i>])
	if (<percussion_id> = (<percussion_kit_structure>.id))
		return percussion_kit_index = <i>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return \{percussion_kit_index = 0}
endscript

script musicstudio_clamp_drum_kit_range 
	if (<percussion> = 1)
		GetArraySize ($percussion_drum_kits)
	else
		GetArraySize ($drum_kits)
	endif
	if (<index> >= <array_Size>)
		printf qs(0x8c4ce13f) a = <index> b = <percussion> c = <array_Size>
		<index> = (<array_Size> -1)
	endif
	if (<index> < 0)
		<index> = 0
	endif
	return drum_kit_index = <index>
endscript

script get_per_pad_kit 
	formatText checksumName = global_pad_struct 'perpad_drum_%s' s = ($drumkitparts.<Type>)
	<drum_kit_index> = ($<global_pad_struct>.kit_index)
	<drumset> = ((($drum_kits) [<drum_kit_index>]).id)
	<drum_kit_string> = ((($drum_kits) [<drum_kit_index>]).string_id)
	return drum_kit_string = <drum_kit_string>
endscript

script get_loadeddrumkitpak_type 
	RequireParams \{[
			percussion
		]
		all}
	if (<percussion> = 0)
		<Type> = pak
	else
		<Type> = pak_percussion
	endif
	return Type = <Type>
endscript

script get_loadeddrumkitpak 
	RequireParams \{[
			pad
			percussion
		]
		all}
	get_loadeddrumkitpak_type percussion = <percussion>
	<pakname> = (($loadeddrumkitpaks.<pad>).<Type>)
	return pakname = <pakname>
endscript

script set_loadeddrumkitpak 
	RequireParams \{[
			pad
			percussion
		]
		all}
	get_loadeddrumkitpak_type percussion = <percussion>
	<pad_struct> = ($loadeddrumkitpaks.<pad>)
	updatestructelement struct = <pad_struct> element = <Type> value = <pakname>
	updatestructelement struct = $loadeddrumkitpaks element = <pad> value = <newstruct>
	Change loadeddrumkitpaks = <newstruct>
endscript
