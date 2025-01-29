
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
	else
		get_loadeddrumkitpak_type percussion = <percussion>
		<pakname> = (($loadeddrumkitpaks.<pad>).<Type>)
		if (<pakname> = 'none')
			Change \{loadeddrumkits_hadchange = 1}
		endif
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

script collectpadspecifickitloadinginfo \{song = NULL}
	if (<song> = NULL)
		<song_name> = 'null'
		<songlist_structure> = {}
	else
		get_song_name song = <song>
		<songlist_structure> = ($gh_songlist_props.<song>)
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
		printf qs(0xa847cc6f) a = <per_song_sample_struct>
		change_jam_current_drum_kit_padspecifickit pad = <Type> kit_string = <song_name> persong_sample = <per_song_sample_struct> percussion = 0
	elseif StructureContains structure = <songlist_structure> <pad_checksum>
		printf qs(0x15a596b6) b = <song> a = <pad_checksum>
		<kit_string> = (<songlist_structure>.<pad_checksum>)
		change_jam_current_drum_kit_padspecifickit pad = <Type> kit_string = <kit_string> persong_sample = NULL percussion = <percussion>
	elseif StructureContains structure = <kit_structure> <pad_checksum>
		printf qs(0xf2bcf87f) a = <pad_checksum>
		<kit_string> = (<kit_structure>.<pad_checksum>)
		change_jam_current_drum_kit_padspecifickit pad = <Type> kit_string = <kit_string> persong_sample = NULL percussion = <percussion>
	else
		printf qs(0x36a00a68) a = <pad_checksum>
		change_jam_current_drum_kit_padspecifickit pad = <Type> kit_string = <kit_string> persong_sample = NULL percussion = <percussion>
	endif
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

script print_drum_pad_kits \{message = ''
		percussion = 0}
	if (<percussion> = 1)
		printf qs(0xc2b1f611) {
			z = <message>
			a = $perpad_drum_p_cymbal
			b = $perpad_drum_p_tom2
			c = $perpad_drum_p_hihat
			d = $perpad_drum_p_tom1
			e = $perpad_drum_p_kick
			f = $perpad_drum_p_snare
		}
	else
		printf qs(0xc2b1f611) {
			z = <message>
			a = $perpad_drum_cymbal
			b = $perpad_drum_tom2
			c = $perpad_drum_hihat
			d = $perpad_drum_tom1
			e = $perpad_drum_kick
			f = $perpad_drum_snare
		}
	endif
endscript

script loaddrumpadgroup \{Heap = quota_samples}
	RequireParams \{[
			percussion
			drum_kit_index
			async
		]
		all}
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
	if ($loadeddrumkits_hadchange = 1)
		if (<percussion> = 0)
			print_drum_pad_kits message = qs(0x549f77a8) percussion = <percussion>
		else
			print_drum_pad_kits message = qs(0x0325791e) percussion = <percussion>
		endif
		if (<percussion> = 1)
			unloaddrumkitall async = <async> standard = 0
		else
			unloaddrumkitall async = <async> percussion = 0
		endif
		loaddrumkit Type = cymbal async = <async> percussion = <percussion> Heap = <Heap>
		loaddrumkit Type = tom2 async = <async> percussion = <percussion> Heap = <Heap>
		loaddrumkit Type = hihat async = <async> percussion = <percussion> Heap = <Heap>
		loaddrumkit Type = tom1 async = <async> percussion = <percussion> Heap = <Heap>
		loaddrumkit Type = kick async = <async> percussion = <percussion> Heap = <Heap>
		loaddrumkit Type = snare async = <async> percussion = <percussion> Heap = <Heap>
	else
		print_drum_pad_kits \{message = 'Drum kit already loaded. Leaving in memory.'}
	endif
endscript
loaddrumkitall_lock = 0

script loaddrumkitall_exit 
	Change \{loaddrumkitall_lock = 0}
endscript

script loaddrumkitall \{standard = 1
		percussion = 1
		async = 0
		reset_percussion = 1
		song = NULL
		heap_drums = quota_samples
		heap_percussion = quota_samples}
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
	if (<standard> = 1)
		if NOT GotParam \{drum_kit_index}
			<drum_kit_index> = $jam_current_drum_kit
		endif
		loaddrumpadgroup percussion = 0 drum_kit_index = <drum_kit_index> async = <async> song = <song> Heap = <heap_drums>
	endif
	if (<percussion> = 1)
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
		loaddrumpadgroup percussion = 1 drum_kit_index = <percussion_kit_index> async = <async> song = <song> Heap = <heap_percussion>
	endif
endscript

script loaddrumkit \{Type = snare
		drum_kit = 'heavyrock'
		async = 0
		percussion = 0
		Heap = quota_samples}
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
			unloaddrumkit Type = <Type> percussion = <percussion> async = <async>
		endif
		<type_string> = ($drumkitparts.<Type>)
		if (<Type> = tom1)
			<type_string> = 'hitom'
		elseif (<Type> = tom2)
			<type_string> = 'floortom'
		endif
		formatText TextName = drumkit_pakname 'pak/drumkits/%s_%t.pak' s = <drum_kit> t = <type_string>
		if ($musicstudio_loadedsound = add_load_screen)
			create_loading_screen
		endif
		if (<async> = 1)
			if NOT LoadPakAsync pak_name = <drumkit_pakname> Heap = <Heap> async = <async>
				DownloadContentLost
				return
			endif
		else
			if NOT LoadPak <drumkit_pakname> Heap = <Heap>
				DownloadContentLost
				return
			endif
		endif
		set_loadeddrumkitpak pad = <Type> percussion = <percussion> pakname = <drumkit_pakname>
	else
		printscriptinfo \{qs(0x6d0085b6)}
		ScriptAssert \{qs(0x0d594f4d)}
	endif
endscript

script unloaddrumkitall \{standard = 1
		percussion = 1
		async = 0}
	if (<standard> = 1)
		unloaddrumkit Type = cymbal percussion = 0 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit Type = tom2 percussion = 0 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit Type = hihat percussion = 0 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit Type = tom1 percussion = 0 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit Type = kick percussion = 0 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit Type = snare percussion = 0 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
	endif
	if (<percussion> = 1)
		unloaddrumkit Type = cymbal percussion = 1 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit Type = tom2 percussion = 1 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit Type = hihat percussion = 1 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit Type = tom1 percussion = 1 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit Type = kick percussion = 1 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		unloaddrumkit Type = snare percussion = 1 async = <async>
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
	endif
endscript

script unloaddrumkit \{Type = snare
		async = 0}
	if StructureContains structure = $drumkitparts <Type>
		get_loadeddrumkitpak pad = <Type> percussion = <percussion>
		if NOT (<pakname> = 'none')
			if (<async> = 1)
				UnloadPakAsync pak_name = (<pakname>)
			else
				UnLoadPak <pakname>
				WaitUnloadPak <pakname> Block
			endif
			set_loadeddrumkitpak pad = <Type> percussion = <percussion> pakname = 'none'
		endif
	else
		printscriptinfo \{qs(0x73feec57)}
		ScriptAssert \{qs(0x0d594f4d)}
	endif
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

script play_drum_sample 
	getdrumpadstring percussion = 0 pad = <pad>
	playdrumsample_cfunc <...> drum_kit_string = <drum_pad_string>
	return drum_sample = <drum_sample>
endscript

script debug_set_and_load_kit_from_index \{song = NULL}
	if (<song> != NULL)
		get_song_drum_kit_index song = <song>
		loaddrumkitall {
			drum_kit_index = <drum_kit_index>
			async = 0
			song = <song>
			Force
		}
	else
		loaddrumkitall {
			drum_kit_index = <drum_kit_index>
			percussion_kit_index = <percussion_kit_index>
			async = 0
			Force
		}
	endif
endscript

script debug_preview_all_drumkits \{SongList = 1
		drum_kits = 1
		perc_kits = 1}
	if (<SongList> = 1)
		<song_struct> = ($gh5_songlist_props)
		GetArraySize ($gh5_songlist)
		ii = 0
		begin
		<song> = (($gh5_songlist) [<ii>])
		printf channel = drumkit_preview qs(0xb7bcf4cf) a = <song>
		debug_preview_drums song = <song> previewkit = 1
		<ii> = (<ii> + 1)
		repeat <array_Size>
	endif
	if (<drum_kits> = 1)
		GetArraySize ($drum_kits)
		ii = 0
		begin
		<kit> = (($drum_kits) [<ii>].id)
		printf channel = drumkit_preview qs(0x3e033ea1) a = <kit>
		debug_preview_drums drum_kit_index = <ii> previewkit = 1
		<ii> = (<ii> + 1)
		repeat <array_Size>
	endif
	if (<perc_kits> = 1)
		GetArraySize ($percussion_drum_kits)
		ii = 0
		begin
		<kit> = (($percussion_drum_kits) [<ii>].id)
		printf channel = drumkit_preview qs(0xaff31234) a = <kit>
		debug_preview_drums percussion_kit_index = <ii> previewperc = 1
		<ii> = (<ii> + 1)
		repeat <array_Size>
	endif
endscript

script debug_preview_drums \{drum_kit_index = 0
		percussion_kit_index = 0
		song = NULL
		previewkit = 0
		previewperc = 0}
	debug_set_and_load_kit_from_index {
		drum_kit_index = <drum_kit_index>
		percussion_kit_index = <percussion_kit_index>
		song = <song>
	}
	<controller> = 0
	<Player> = 1
	if (<previewkit> = 1)
		musicstudio_drum_kit_preview_loop controller = <controller> Player = <Player> percussion = 0
	endif
	if (<previewperc> = 1)
		musicstudio_drum_kit_preview_loop controller = <controller> Player = <Player> percussion = 1
	endif
endscript

script debug_play_all_drum_samples \{song = NULL}
	debug_set_and_load_kit_from_index
	<iterate_velocity> = 0
	if (<iterate_velocity> = 1)
		<base_vel> = 7
	else
		<base_vel> = 127
	endif
	velocity = <base_vel>
	pad = snare
	begin
	get_per_pad_kit Type = <pad> drum_kit_index = <drum_kit_index>
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity> drum_kit_string = <drum_kit_string>
	<velocity> = (<velocity> + 2)
	Wait \{0.3
		Seconds}
	if (<velocity> >= 127)
		if (<pad> = snare)
			<pad> = kick
			velocity = <base_vel>
		elseif (<pad> = kick)
			<pad> = tom1
			velocity = <base_vel>
		elseif (<pad> = tom1)
			<pad> = tom2
			velocity = <base_vel>
		elseif (<pad> = tom2)
			<pad> = hihat
			velocity = <base_vel>
		elseif (<pad> = hihat)
			<pad> = cymbal
			velocity = <base_vel>
		elseif (<pad> = cymbal)
			break
		endif
	endif
	repeat
endscript

script debug_play_test_samples \{pad = kick}
	waitTime = 0.3
	velocity = 7
	drumset = classicrock
	pad = <pad>
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waitTime> Seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script get_pad_string_from_kit 
	if StructureContains structure = <kit_structure> <pad>
		return pad_string = (<kit_structure>.<pad>)
	else
		return pad_string = (<kit_structure>.string_id)
	endif
endscript

script musicstudio_get_current_drum_kits 
	musicstudio_get_current_percussion_kit
	<percussion_kit> = ($percussion_drum_kits [<current_percussion_kit>])
	<drum_kit> = ($drum_kits [$jam_current_drum_kit])
	return percussion_kit = <percussion_kit> drum_kit = <drum_kit>
endscript

script musicstudio_get_drum_kit_text 
	musicstudio_get_current_drum_kits
	if GotParam \{percussion}
		if GotParam \{custom}
			formatText \{TextName = name_text
				qs(0x226bdd25)}
		else
			formatText TextName = name_text qs(0xd72835b5) s = (<percussion_kit>.name_text)
		endif
	else
		if GotParam \{custom}
			formatText \{TextName = name_text
				qs(0xb81c1840)}
		else
			formatText TextName = name_text qs(0xf50214cc) s = (<drum_kit>.name_text)
		endif
	endif
	return name_text = <name_text>
endscript

script musicstudio_sound_customize_get_state 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 3)
		return \{musicstudio_state = musicstudio_drum_kit_state}
	else
		return \{musicstudio_scrolling_state = musicstudio_scrolling_sound_select_state}
	endif
endscript

script musicstudio_get_default_drum_kit_list_checksum 
	return \{list_checksum = drum_kits}
endscript

script musicstudio_get_percussion_kit_list_checksum_sound 
	return \{list_checksum = percussion_drum_kits}
endscript

script musicstudio_get_customize_drum_kit_text 
	if ($musicstudio_percussion_menu = 1)
		name_text = qs(0x226bdd25)
	else
		name_text = qs(0xb81c1840)
	endif
	return name_text = <name_text>
endscript

script musicstudio_get_drum_pad_text 
	if ($musicstudio_percussion_menu = 1)
		musicstudio_mainobj :musicstudioghmix_getcustomdrumkit \{percussion = true}
		percussion = 1
	else
		musicstudio_mainobj :musicstudioghmix_getcustomdrumkit \{percussion = FALSE}
		percussion = 0
	endif
	<pad_text> = ($drumkitparts_onscreen.<Type>)
	<pad_kit_text> = (<kit_structure>.<Type>)
	musicstudio_drum_pad_display_find_matching_kit_from_pad_string string = <pad_kit_text> percussion = <percussion>
	if StructureContains structure = <return_struct> name_text
		formatText TextName = name_text qs(0xe91be69c) a = <pad_text> b = (<return_struct>.name_text)
	else
		formatText TextName = name_text qs(0xe91be69c) a = <pad_text> b = <pad_kit_text>
	endif
	return name_text = <name_text>
endscript

script musicstudio_get_drum_kit_pad_scrolling_state 
	if ($musicstudio_percussion_menu = 1)
		return \{musicstudio_scrolling_state = musicstudio_scrolling_select_percussionkit_pad_state}
	else
		return \{musicstudio_scrolling_state = musicstudio_scrolling_select_dumkit_pad_state}
	endif
endscript

script musicstudio_get_drum_kit_list_checksum 
	if ($musicstudio_percussion_menu = 1)
		return \{list_checksum = percussion_drum_kits}
	else
		return \{list_checksum = drum_kits}
	endif
endscript

script musicstudio_get_drum_kit_list_size_checksum 
	if ($musicstudio_percussion_menu = 1)
		GetArraySize ($percussion_drum_kits)
	else
		GetArraySize ($drum_kits)
	endif
	if (<array_Size> > 0)
		<array_Size> = (<array_Size> -1)
	endif
	return list_size = <array_Size>
endscript

script musicstudio_choose_customize 
	if GotParam \{custom_kit}
		SpawnScriptNow musicstudio_custom_kit_setup_pads_on_entry params = {<...>}
	endif
	if GotParam \{percussion}
		Change \{musicstudio_percussion_menu = 1}
	else
		Change \{musicstudio_percussion_menu = 0}
	endif
endscript

script musicstudio_change_drum_kit 
	if GotParam \{percussion}
		musicstudio_change_sound async = 0 Player = <Player> index = <index> drum_kit_percussion
	else
		musicstudio_change_sound async = 0 percussion = 0 Player = <Player> index = <index>
	endif
endscript

script musicstudio_change_drum_kit_go_back 
endscript

script musicstudio_drumkit_customize_set_pad 
	Change musicstudio_menu_current_pad = <Type>
endscript

script musicstudio_preview_drum_kit 
	if GotParam \{per_pad}
		Change \{musicstudio_per_pad_had_preview = 1}
	endif
	if GotParam \{percussion}
		musicstudio_drum_kit_preview index = <index> target = <scrolling_menu_elements> standard = 0
	else
		musicstudio_drum_kit_preview index = <index> target = <scrolling_menu_elements> percussion = 0
	endif
endscript

script musicstudio_change_drum_kit_pad 
	if NOT GotParam \{pad_checksum}
		<pad_checksum> = ($musicstudio_menu_current_pad)
	endif
	if NOT GotParam \{percussion}
		percussion = ($musicstudio_percussion_menu)
	endif
	if (<percussion> = 1)
		get_pad_string_from_kit kit_structure = ($percussion_drum_kits [<index>]) pad = <pad_checksum>
		musicstudio_mainobj :musicstudioghmix_getcustomdrumkit \{percussion = true}
		<global_kit_array> = percussion_drum_kits
	else
		get_pad_string_from_kit kit_structure = ($drum_kits [<index>]) pad = <pad_checksum>
		musicstudio_mainobj :musicstudioghmix_getcustomdrumkit \{percussion = FALSE}
		<global_kit_array> = drum_kits
	endif
	updatestructelement struct = <kit_structure> element = <pad_checksum> value = <pad_string>
	SetArrayElement ArrayName = <global_kit_array> globalarray index = <custom_kit_index> NewValue = <newstruct>
endscript

script musicstudio_get_current_percussion_kit 
	if ($jam_current_percussion_kit != -1)
		<percussion_kit_index> = $jam_current_percussion_kit
	else
		find_percussion_from_base_kit \{drum_kit_index = $jam_current_drum_kit}
	endif
	GetArraySize \{$percussion_drum_kits}
	if (<percussion_kit_index> < 0)
		<percussion_kit_index> = 0
	elseif (<percussion_kit_index> >= <array_Size>)
		<percussion_kit_index> = (<array_Size> -1)
	endif
	return current_percussion_kit = <percussion_kit_index>
endscript

script musicstudio_set_current_kit_to_custom 
	if NOT GotParam \{percussion}
		percussion = ($musicstudio_percussion_menu)
	endif
	if (<percussion> = 1)
		musicstudio_mainobj :musicstudioghmix_getcustomdrumkit \{percussion = true}
		musicstudio_change_drum_kit percussion index = <custom_kit_index> Player = <Player>
	else
		musicstudio_mainobj :musicstudioghmix_getcustomdrumkit \{percussion = FALSE}
		musicstudio_change_drum_kit index = <custom_kit_index> Player = <Player>
	endif
	musicstudio_change_drum_kit_go_back
endscript

script musicstudio_drum_kit_menu_enter 
	musicstudio_drum_pad_display_refresh <...>
endscript

script musicstudio_drum_kit_menu_exit 
	musicstudio_drum_pad_display_destroy <...>
endscript

script musicstudio_drum_pad_display_find_matching_kit_from_pad_string \{percussion = 0}
	if (<percussion> = 1)
		<kit_list> = $percussion_drum_kits
	else
		<kit_list> = $drum_kits
	endif
	GetArraySize <kit_list>
	ii = 0
	begin
	<kit_struct> = (<kit_list> [<ii>])
	if ((<kit_struct>.string_id) = <string>)
		return return_struct = <kit_struct>
	endif
	<ii> = (<ii> + 1)
	repeat <array_Size>
	return \{return_struct = {
		}}
endscript

script musicstudio_drum_pad_display_refresh_drum_set \{percussion = 0}
	musicstudio_get_current_drum_kits
	<header_offset> = -20
	if (<percussion> = 1)
		<kit> = <percussion_kit>
		<header_text> = qs(0x9d25bc53)
		<header_id> = ghmix_drum_perc_header
		if NOT GotParam \{preview_menu}
			<header_offset> = 210
		endif
	else
		<kit> = <drum_kit>
		<header_text> = qs(0xeb6e9c99)
		<header_id> = ghmix_drum_kit_header
	endif
	CreateScreenElement {
		Type = TextElement
		parent = ghmix_drum_reference
		id = <header_id>
		font = fontgrid_text_a1
		just = [left top]
		Scale = 0.4
		Pos = (((0.0, 1.0) * <header_offset>) + (5.0, 0.0))
		rgba = [113 121 133 255]
		text = <header_text>
	}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getplayerindex
	<main_player> :musicstudioplayer_getcontroller
	lefty_flip = 0
	if isdrumcontroller controller = <controller>
		getplayerinfo <Player> lefty_flip
	endif
	if (<lefty_flip> = 0)
		data_array = [
			{
				id = tom2
				rgba = [55 116 61 255]
			}
			{
				id = snare
				rgba = [151 68 85 255]
			}
			{
				id = hihat
				rgba = [185 171 71 255]
			}
			{
				id = tom1
				rgba = [68 92 131 255]
			}
			{
				id = cymbal
				rgba = [154 80 56 255]
			}
			{
				id = kick
				rgba = [50 50 50 255]
			}
		]
	else
		data_array = [
			{
				id = tom2
				rgba = [151 68 85 255]
			}
			{
				id = snare
				rgba = [55 116 61 255]
			}
			{
				id = hihat
				rgba = [154 80 56 255]
			}
			{
				id = tom1
				rgba = [68 92 131 255]
			}
			{
				id = cymbal
				rgba = [185 171 71 255]
			}
			{
				id = kick
				rgba = [50 50 50 255]
			}
		]
	endif
	GetArraySize <data_array>
	ii = 0
	begin
	<pad_struct> = (<data_array> [<ii>])
	<rgba> = (<pad_struct>.rgba)
	<height_offset> = (<ii> * 30.0)
	show_button = 1
	if isrbdrum controller = <controller>
		if (<pad_struct>.id = cymbal)
			<show_button> = 0
		endif
	endif
	if (<show_button> = 1)
		<height_offset> = (<height_offset> + 32)
		if (<percussion> = 1)
			if NOT GotParam \{preview_menu}
				<height_offset> = (<height_offset> + 230)
			endif
		endif
		<text> = qs(0x459d002b)
		<pad_text> = ($drumkitparts_onscreen.(<pad_struct>.id))
		if StructureContains structure = <kit> (<pad_struct>.id)
			musicstudio_drum_pad_display_find_matching_kit_from_pad_string percussion = <percussion> string = (<kit>.(<pad_struct>.id))
			if StructureContains structure = <return_struct> name_text
				formatText TextName = text qs(0xe91be69c) a = <pad_text> b = (<return_struct>.name_text)
			endif
		endif
		if (<text> = qs(0x459d002b))
			formatText TextName = text qs(0xe91be69c) a = <pad_text> b = (<kit>.name_text)
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = ghmix_drum_reference
			texture = ghmix_generic_button
			just = [left bottom]
			rgba = <rgba>
			Pos = ((0.0, 1.0) * <height_offset>)
			Scale = 0.75
			z_priority = 22
		}
		CreateScreenElement {
			Type = TextElement
			parent = <id>
			font = fontgrid_text_a1
			just = [left center]
			Scale = 0.4
			Pos = (70.0, 17.0)
			rgba = [113 121 133 255]
			text = <text>
		}
	endif
	<ii> = (<ii> + 1)
	repeat <array_Size>
endscript

script musicstudio_drum_pad_display_refresh \{percussion = 0}
	if NOT ScreenElementExists \{id = musicstudio_ghmix}
		return
	endif
	musicstudio_drum_pad_display_destroy Player = <Player>
	if GotParam \{preview_menu}
		Pos = (800.0, 130.0)
		Scale = 1
	else
		Pos = (150.0, 100.0)
		Scale = 1
		musicstudio_highway_blackout \{blackout = [
				1
				1
				1
				1
				1
				1
			]}
	endif
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	<player_object> :musicstudiomenu_getcurrentstate
	if (<current_state> = musicstudio_step_record_state)
		Pos = ((800.0, 130.0) + (0.0, -10.0))
		<Scale> = 0.75
		return
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = ghmix_drum_reference
		parent = musicstudio_ghmix
		Pos = <Pos>
		z_priority = 22
		alpha = 1
		Scale = <Scale>
	}
	if NOT GotParam \{preview_menu}
		musicstudio_drum_pad_display_refresh_drum_set
		musicstudio_drum_pad_display_refresh_drum_set \{percussion = 1}
	elseif (<percussion> = 1)
		musicstudio_drum_pad_display_refresh_drum_set \{percussion = 1
			preview_menu}
	else
		musicstudio_drum_pad_display_refresh_drum_set
	endif
endscript

script musicstudio_drum_pad_display_destroy 
	musicstudio_highway_blackout \{remove}
	if ScreenElementExists \{id = ghmix_drum_reference}
		DestroyScreenElement \{id = ghmix_drum_reference}
	endif
endscript

script musicstudio_enter_drum_sub_menu 
	musicstudio_drum_pad_display_refresh <...>
endscript

script musicstudio_enter_custom 
	musicstudio_enter_drum_sub_menu <...>
endscript

script musicstudio_drum_kit_preview \{standard = 1
		percussion = 1}
	LaunchEvent Type = unfocus target = <target>
	if NOT GotParam \{controller}
		musicstudio_mainobj :musicstudio_getmainplayercontroller
	endif
	if NOT GotParam \{Player}
		musicstudio_mainobj :musicstudio_getmainplayeridindex
		Player = <playerid_index>
	endif
	preview_one_pad = 0
	if ($musicstudio_per_pad_had_preview = 1)
		<preview_one_pad> = 1
	endif
	if (<standard> = 1)
		musicstudio_change_sound async = 0 Player = <Player> index = <index> drum_kit_only
		Wait \{1.0
			Seconds}
		if (<preview_one_pad> = 0)
			musicstudio_drum_kit_preview_loop controller = <controller> Player = <Player> percussion = 0
		else
			musicstudio_drum_kit_preview_loop controller = <controller> Player = <Player> percussion = 0 pad = ($musicstudio_menu_current_pad)
		endif
	endif
	if (<percussion> = 1)
		musicstudio_change_sound async = 0 Player = <Player> index = <index> drum_kit_percussion
		Wait \{1.0
			Seconds}
		if (<preview_one_pad> = 0)
			musicstudio_drum_kit_preview_loop controller = <controller> Player = <Player> percussion = 1
		else
			musicstudio_drum_kit_preview_loop controller = <controller> Player = <Player> percussion = 1 pad = ($musicstudio_menu_current_pad)
		endif
	endif
	LaunchEvent Type = focus target = <target>
endscript

script musicstudio_drum_kit_preview_loop 
	per_drum_wait = 0.2
	preview_pattern_array = [1048576 4096 16 65536 256 1]
	preview_pad_array = [kick snare tom1 tom2 hihat cymbal]
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getcontroller
	lefty_flip = 0
	if isdrumcontroller controller = <controller>
		getplayerinfo <Player> lefty_flip
	endif
	if (<lefty_flip> = 1)
		preview_pattern_array = [1048576 65536 16 4096 1 256]
	endif
	GetArraySize <preview_pattern_array>
	pad_index = 0
	begin
	preview_pad = 0
	if GotParam \{pad}
		if (<pad> = (<preview_pad_array> [<pad_index>]))
			<preview_pad> = 1
		endif
	else
		<preview_pad> = 1
	endif
	if (<preview_pad> = 1)
		musicstudio_play_sound_get_buss instrument = 3 pad = (<preview_pad_array> [<pad_index>])
		jam_input_drum_strum {
			hold_pattern = (<preview_pattern_array> [<pad_index>])
			velocity = 100
			controller = <controller>
			buss = <buss>
			select_player = <Player>
			loop_pitch = 0
			Loop
			percussion = <percussion>
		}
		Wait <per_drum_wait> Seconds
	endif
	<pad_index> = (<pad_index> + 1)
	repeat <array_Size>
endscript

script musicstudio_is_custom_kit \{percussion = FALSE}
	musicstudio_mainobj :musicstudioghmix_getcustomdrumkit percussion = <percussion>
	if (<custom_kit_index> = <index>)
		return \{true}
	endif
	return \{FALSE}
endscript

script musicstudio_custom_kit_refresh_from_kit 
	musicstudio_change_drum_kit_pad pad_checksum = snare percussion = <percussion> index = <index>
	musicstudio_change_drum_kit_pad pad_checksum = kick percussion = <percussion> index = <index>
	musicstudio_change_drum_kit_pad pad_checksum = tom1 percussion = <percussion> index = <index>
	musicstudio_change_drum_kit_pad pad_checksum = tom2 percussion = <percussion> index = <index>
	musicstudio_change_drum_kit_pad pad_checksum = hihat percussion = <percussion> index = <index>
	musicstudio_change_drum_kit_pad pad_checksum = cymbal percussion = <percussion> index = <index>
endscript

script musicstudio_custom_kit_setup_pads_on_entry 
	getsonginfo
	<do_standard> = 1
	if GotParam \{percussion}
		<do_standard> = 0
	endif
	if NOT musicstudio_is_custom_kit percussion = true index = <percussion_kit>
		printf \{channel = bkutcher
			qs(0x6337a1cd)}
		musicstudio_custom_kit_refresh_from_kit percussion = 1 index = <percussion_kit>
		musicstudio_set_current_kit_to_custom percussion = 1 Player = <Player>
	endif
	if (<do_standard> = 1)
		if NOT musicstudio_is_custom_kit percussion = FALSE index = <drum_kit>
			printf \{channel = bkutcher
				qs(0xd7151ce6)}
			musicstudio_custom_kit_refresh_from_kit percussion = 0 index = <drum_kit>
			musicstudio_set_current_kit_to_custom percussion = 0 Player = <Player>
		endif
	endif
endscript

script musicstudio_custom_kit_get_selected_pad 
	if ($musicstudio_percussion_menu = 1)
		kit = percussion_drum_kits
		musicstudio_mainobj :musicstudioghmix_getcustomdrumkit \{percussion = true}
	else
		kit = drum_kits
		musicstudio_mainobj :musicstudioghmix_getcustomdrumkit \{percussion = FALSE}
	endif
	<pad_checksum> = ($musicstudio_menu_current_pad)
	<pad_kit_string> = (<kit_structure>.<pad_checksum>)
	formatText checksumName = kit_id_checksum '%s' s = <pad_kit_string>
	arraycontainselementwithid id_type = id id_value = <kit_id_checksum> array = ($<kit>)
	return selected = <return_struct_index>
endscript
musicstudio_per_pad_had_preview = 0

script musicstudio_per_pad_init 
	Change \{musicstudio_per_pad_had_preview = 0}
endscript

script musicstudio_per_pad_deinit 
	if ($musicstudio_per_pad_had_preview = 1)
		musicstudio_set_current_kit_to_custom <...>
	endif
	Change \{musicstudio_per_pad_had_preview = 0}
endscript

script musicstudio_ghmix_refresh_drum_preview_display 
	if NOT GotParam \{Player}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		if (<main_player> = NULL)
			return
		endif
		musicstudio_mainobj :musicstudio_getmainplayeridindex
		<Player> = <playerid_index>
	endif
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> != 3)
		return
	endif
	if ($is_percussion_kit = 1)
		musicstudio_drum_pad_display_refresh Player = <Player> preview_menu percussion = 1
	else
		musicstudio_drum_pad_display_refresh Player = <Player> preview_menu percussion = 0
	endif
endscript
