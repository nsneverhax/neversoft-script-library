
script loaddrumkitall \{standard = 1
		percussion = 1
		practice_percussion = 0
		async = 1
		reset_percussion = 1
		song = null}
	begin
	if ($loaddrumkitall_lock = 0)
		break
		printf \{qs(0x73a6effd)}
	endif
	wait \{1
		frame}
	repeat
	if ((<song> != null) && (<song> != jamsession))
		<percussion> = 0
	endif
	change \{loaddrumkitall_lock = 1}
	onexitrun \{loaddrumkitall_exit}
	printf \{qs(0x2f92d628)}
	if (<reset_percussion> = 1)
		change \{is_percussion_kit = 0}
	endif
	yield
	if (<standard> = 1)
		if NOT gotparam \{drum_kit_index}
			<drum_kit_index> = $jam_current_drum_kit
		endif
		loaddrumpadgroup percussion = 0 drum_kit_index = <drum_kit_index> async = <async> song = <song>
	endif
	if (<practice_percussion> = 1)
		loaddrumpadgroup percussion = 1 kit_string = ($g_practice_percussion_kit) async = <async> song = <song>
	elseif (<percussion> = 1)
		if gotparam \{take_perc_from_base}
			find_percussion_from_base_kit drum_kit_index = <drum_kit_index>
		endif
		if NOT gotparam \{percussion_kit_index}
			musicstudio_get_current_percussion_kit
			<percussion_kit_index> = <current_percussion_kit>
		endif
		if (<percussion_kit_index> = -1)
			scriptassert qs(0x8a7974c7) a = <drum_kit_index>
			<percussion_kit_index> = 0
		endif
		loaddrumpadgroup percussion = 1 drum_kit_index = <percussion_kit_index> async = <async> song = <song>
	endif
endscript

script loaddrumkitall_exit 
	change \{loaddrumkitall_lock = 0}
endscript

script loaddrumpadgroup 
	requireparams \{[
			percussion
			async
		]
		all}
	change \{loadeddrumkits_hadchange = 0}
	if gotparam \{kit_string}
		collectpadspecifickitloadinginfo song = <song> type = cymbal kit_string = <kit_string> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> type = tom2 kit_string = <kit_string> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> type = hihat kit_string = <kit_string> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> type = tom1 kit_string = <kit_string> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> type = kick kit_string = <kit_string> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> type = snare kit_string = <kit_string> percussion = <percussion>
	else
		if (<percussion> = 1)
			musicstudio_clamp_drum_kit_range percussion = 1 index = <drum_kit_index>
			<song> = null
		else
			musicstudio_clamp_drum_kit_range percussion = 0 index = <drum_kit_index>
		endif
		change \{loadeddrumkits_hadchange = 0}
		collectpadspecifickitloadinginfo song = <song> type = cymbal drum_kit_index = <drum_kit_index> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> type = tom2 drum_kit_index = <drum_kit_index> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> type = hihat drum_kit_index = <drum_kit_index> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> type = tom1 drum_kit_index = <drum_kit_index> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> type = kick drum_kit_index = <drum_kit_index> percussion = <percussion>
		collectpadspecifickitloadinginfo song = <song> type = snare drum_kit_index = <drum_kit_index> percussion = <percussion>
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
		loaddrumkit type = cymbal async = <async> percussion = <percussion>
		loaddrumkit type = tom2 async = <async> percussion = <percussion>
		loaddrumkit type = hihat async = <async> percussion = <percussion>
		loaddrumkit type = tom1 async = <async> percussion = <percussion>
		loaddrumkit type = kick async = <async> percussion = <percussion>
		loaddrumkit type = snare async = <async> percussion = <percussion>
	else
		print_drum_pad_kits \{message = 'Drum kit already loaded. Leaving in memory.'}
	endif
endscript

script loaddrumkit \{type = snare
		drum_kit = 'heavyrock'
		async = 1
		percussion = 0}
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	setscriptcannotpause
	get_global_pad_struct_checksum type = <type> percussion = <percussion>
	<drum_kit> = $<global_pad_struct>
	if structurecontains structure = $drumkitparts <type>
		get_loadeddrumkitpak pad = <type> percussion = <percussion>
		if NOT (<pakname> = 'none')
			unloaddrumkit type = <type> percussion = <percussion>
		endif
		<type_string> = ($drumkitparts.<type>)
		if (<type> = tom1)
			<type_string> = 'hitom'
		elseif (<type> = tom2)
			<type_string> = 'floortom'
		endif
		formattext textname = drumkit_pakname 'pak/drumkits/%s_%t.pak' s = <drum_kit> t = <type_string>
		if (<percussion> = 1)
			<heap> = heap_drumkitaudio_percussion
		else
			<heap> = heap_drumkitaudio
		endif
		if ($musicstudio_loadedsound = add_load_screen)
			create_loading_screen
		endif
		if NOT loadpakasync pak_name = <drumkit_pakname> heap = <heap> async = <async>
			downloadcontentlost
			return
		endif
		set_loadeddrumkitpak pad = <type> percussion = <percussion> pakname = <drumkit_pakname>
	else
		printscriptinfo \{qs(0xe6275509)}
		scriptassert \{qs(0x0d594f4d)}
	endif
endscript

script unloaddrumkitall \{standard = 1
		percussion = 1
		async = 0
		reset_globals = 1}
	if (<standard> = 1)
		unloaddrumkit \{type = cymbal
			percussion = 0}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		unloaddrumkit \{type = tom2
			percussion = 0}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		unloaddrumkit \{type = hihat
			percussion = 0}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		unloaddrumkit \{type = tom1
			percussion = 0}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		unloaddrumkit \{type = kick
			percussion = 0}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		unloaddrumkit \{type = snare
			percussion = 0}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		if (<reset_globals> = 1)
			change \{perpad_drum_cymbal = 'null'}
			change \{perpad_drum_tom2 = 'null'}
			change \{perpad_drum_hihat = 'null'}
			change \{perpad_drum_tom1 = 'null'}
			change \{perpad_drum_kick = 'null'}
			change \{perpad_drum_snare = 'null'}
		endif
	endif
	if (<percussion> = 1)
		unloaddrumkit \{type = cymbal
			percussion = 1}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		unloaddrumkit \{type = tom2
			percussion = 1}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		unloaddrumkit \{type = hihat
			percussion = 1}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		unloaddrumkit \{type = tom1
			percussion = 1}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		unloaddrumkit \{type = kick
			percussion = 1}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		unloaddrumkit \{type = snare
			percussion = 1}
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		if (<reset_globals> = 1)
			change \{perpad_drum_p_cymbal = 'null'}
			change \{perpad_drum_p_tom2 = 'null'}
			change \{perpad_drum_p_hihat = 'null'}
			change \{perpad_drum_p_tom1 = 'null'}
			change \{perpad_drum_p_kick = 'null'}
			change \{perpad_drum_p_snare = 'null'}
		endif
	endif
endscript

script unloaddrumkit \{type = snare}
	if structurecontains structure = $drumkitparts <type>
		get_loadeddrumkitpak pad = <type> percussion = <percussion>
		if NOT (<pakname> = 'none')
			unloadpakasync pak_name = (<pakname>)
			set_loadeddrumkitpak pad = <type> percussion = <percussion> pakname = 'none'
		endif
	else
		printscriptinfo \{qs(0x1bc96f66)}
		scriptassert \{qs(0x0d594f4d)}
	endif
endscript

script collectpadspecifickitloadinginfo \{song = null}
	if (<song> = null)
		<song_name> = 'null'
		<songlist_structure> = {}
	else
		get_song_name song = <song>
		<songlist_structure> = ($gh_songlist_props.<song>)
	endif
	if gotparam \{kit_string}
		printf channel = musicstudio qs(0xbe47b0e7) a = <type> b = <kit_string>
		change_jam_current_drum_kit_padspecifickit pad = <type> kit_string = <kit_string> persong_sample = null percussion = <percussion>
		return
	endif
	if (<percussion> = 1)
		<kit_structure> = (($percussion_drum_kits) [<drum_kit_index>])
		get_global_pad_struct_checksum percussion = 1 type = <type>
		<pad_checksum> = <type>
		per_song_sample_struct = null
		<kit_string> = (<kit_structure>.string_id)
	else
		<kit_structure> = (($drum_kits) [<drum_kit_index>])
		get_global_pad_struct_checksum percussion = 0 type = <type>
		<pad_checksum> = <type>
		formattext checksumname = per_song_sample_struct '%s_persong_%a_sampleset' s = <song_name> a = ($drumkitparts.<type>)
		<kit_string> = (<kit_structure>.string_id)
	endif
	if globalexists name = <per_song_sample_struct>
		change_jam_current_drum_kit_padspecifickit pad = <type> kit_string = <song_name> persong_sample = <per_song_sample_struct> percussion = 0
	elseif structurecontains structure = <songlist_structure> <pad_checksum>
		<kit_string> = (<songlist_structure>.<pad_checksum>)
		change_jam_current_drum_kit_padspecifickit pad = <type> kit_string = <kit_string> persong_sample = null percussion = <percussion>
	elseif structurecontains structure = <kit_structure> <pad_checksum>
		<kit_string> = (<kit_structure>.<pad_checksum>)
		change_jam_current_drum_kit_padspecifickit pad = <type> kit_string = <kit_string> persong_sample = null percussion = <percussion>
	else
		change_jam_current_drum_kit_padspecifickit pad = <type> kit_string = <kit_string> persong_sample = null percussion = <percussion>
	endif
endscript

script get_global_pad_struct_checksum \{percussion = 0
		type = cymbal}
	if (<percussion> = 1)
		formattext checksumname = global_pad_struct 'perpad_drum_p_%s' s = ($drumkitparts.<type>)
	else
		formattext checksumname = global_pad_struct 'perpad_drum_%s' s = ($drumkitparts.<type>)
	endif
	return global_pad_struct = <global_pad_struct>
endscript

script change_jam_current_drum_kit_padspecifickit \{percussion = 0}
	<pad_string> = ($drumkitparts.<pad>)
	if (<percussion> = 1)
		formattext checksumname = global_checksum 'perpad_drum_p_%s' s = <pad_string>
	else
		formattext checksumname = global_checksum 'perpad_drum_%s' s = <pad_string>
	endif
	if ($<global_checksum> != <kit_string>)
		change \{loadeddrumkits_hadchange = 1}
	endif
	change globalname = <global_checksum> newvalue = <kit_string>
	if gotparam \{persong_sample}
		formattext checksumname = global_checksum_persong 'persong_drum_%s' s = <pad_string>
		change globalname = <global_checksum_persong> newvalue = <persong_sample>
	endif
endscript

script get_drum_kit_globals \{pad = cymbal}
	<pad_string> = ($drumkitparts.<pad>)
	formattext checksumname = global_checksum 'perpad_drum_%s' s = <pad_string>
	<perpad_drum> = ($<global_checksum>)
	formattext checksumname = global_checksum 'perpad_drum_p_%s' s = <pad_string>
	<perpad_drum_p> = ($<global_checksum>)
	formattext checksumname = global_checksum 'persong_drum_%s' s = <pad_string>
	<persong_drum_p> = ($<global_checksum>)
	return perpad_drum = <perpad_drum> perpad_drum_p = <perpad_drum_p> persong_drum_p = <persong_drum_p>
endscript

script find_percussion_from_base_kit \{drum_kit_index = 1}
	<base_kit_structure> = (($drum_kits) [<drum_kit_index>])
	<percussion_id> = (<base_kit_structure>.percussion_id)
	getarraysize \{$percussion_drum_kits}
	i = 0
	begin
	<percussion_kit_structure> = (($percussion_drum_kits) [<i>])
	if (<percussion_id> = (<percussion_kit_structure>.id))
		return percussion_kit_index = <i>
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{percussion_kit_index = 0}
endscript

script musicstudio_clamp_drum_kit_range 
	if (<percussion> = 1)
		getarraysize ($percussion_drum_kits)
	else
		getarraysize ($drum_kits)
	endif
	if (<index> >= <array_size>)
		printf qs(0x8c4ce13f) a = <index> b = <percussion> c = <array_size>
		<index> = (<array_size> -1)
	endif
	if (<index> < 0)
		<index> = 0
	endif
	return drum_kit_index = <index>
endscript

script get_per_pad_kit 
	formattext checksumname = global_pad_struct 'perpad_drum_%s' s = ($drumkitparts.<type>)
	<drum_kit_index> = ($<global_pad_struct>.kit_index)
	<drumset> = ((($drum_kits) [<drum_kit_index>]).id)
	<drum_kit_string> = ((($drum_kits) [<drum_kit_index>]).string_id)
	return drum_kit_string = <drum_kit_string>
endscript

script get_loadeddrumkitpak_type 
	requireparams \{[
			percussion
		]
		all}
	if (<percussion> = 0)
		<type> = pak
	else
		<type> = pak_percussion
	endif
	return type = <type>
endscript

script get_loadeddrumkitpak 
	requireparams \{[
			pad
			percussion
		]
		all}
	get_loadeddrumkitpak_type percussion = <percussion>
	<pakname> = (($loadeddrumkitpaks.<pad>).<type>)
	return pakname = <pakname>
endscript

script set_loadeddrumkitpak 
	requireparams \{[
			pad
			percussion
		]
		all}
	get_loadeddrumkitpak_type percussion = <percussion>
	<pad_struct> = ($loadeddrumkitpaks.<pad>)
	updatestructelement struct = <pad_struct> element = <type> value = <pakname>
	updatestructelement struct = $loadeddrumkitpaks element = <pad> value = <newstruct>
	change loadeddrumkitpaks = <newstruct>
endscript
