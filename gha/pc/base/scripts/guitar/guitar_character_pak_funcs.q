loaded_body_heaps = [
	heap_musician1
	heap_musician2
	heap_musician3
	heap_musician4
	heap_musician5
]
loaded_body_paks = [
	none
	none
	none
	none
	none
]
loaded_body_paks_ref_counts = [
	0
	0
	0
	0
	0
]
loaded_anim_heaps = [
	heap_musician1_anim
	heap_musician2_anim
	heap_musician3_anim
	heap_musician4_anim
	heap_musician5_anim
]
loaded_anim_paks = [
	none
	none
	none
	none
	none
]
loaded_anim_paks_ref_counts = [
	0
	0
	0
	0
	0
]
loaded_instrument_heaps = [
	heap_instrument1
	heap_instrument2
	heap_instrument3
	heap_instrument4
	heap_instrument5
]
loaded_instrument_paks = [
	none
	none
	none
	none
	none
]
loaded_instrument_paks_ref_counts = [
	0
	0
	0
	0
	0
]
guitarist_asset_context = none
guitarist_body_pak_file = no_pak_id
guitarist_anim_pak_file = no_pak_id
guitarist_instrument_pak_file = no_pak_id
bassist_body_pak_file = no_pak_id
bassist_anim_pak_file = no_pak_id
bassist_instrument_pak_file = no_pak_id
vocalist_body_pak_file = no_pak_id
vocalist_anim_pak_file = no_pak_id
vocalist_instrument_pak_file = no_pak_id
vocalist2_body_pak_file = no_pak_id
vocalist2_anim_pak_file = no_pak_id
vocalist2_instrument_pak_file = no_pak_id
drummer_body_pak_file = no_pak_id
drummer_anim_pak_file = no_pak_id
drummer_instrument_pak_file = no_pak_id
rhythm_body_pak_file = no_pak_id
rhythm_anim_pak_file = no_pak_id
rhythm_instrument_pak_file = no_pak_id
character_pak_crc_to_text = {
	guitarist = 'guitarist'
	bassist = 'bassist'
	vocalist = 'vocalist'
	vocalist2 = 'vocalist2'
	drummer = 'drummer'
	rhythm = 'rhythm'
	body = 'body'
	anim = 'anim'
	instrument = 'instrument'
}
musician_arrays = {
	body = {
		pak_type = musician_body
		size_func = get_musician_body_size
		access_func = get_musician_body_struct
		element = pak
	}
	anim = {
		pak_type = musician_body
		size_func = get_musician_body_size
		access_func = get_musician_body_struct
		element = anims_pak
	}
	instrument = {
		pak_type = musician_instrument
		size_func = get_musician_instrument_size
		access_func = get_musician_instrument_struct
		element = pak
	}
}

script get_num_free_character_pak_slots 
	pak_type = ($character_pak_crc_to_text.<type>)
	formattext checksumname = loaded_paks_ref_counts 'loaded_%p_paks_ref_counts' p = <pak_type>
	getarraysize $<loaded_paks_ref_counts>
	index = 0
	freeslots = (<freeslots> + 1)
	begin
	ref_count = ($<loaded_paks_ref_counts> [<index>])
	if (<ref_count> = 0)
		freeslots = (<freeslots> + 1)
	endif
	index = (<index> + 1)
	repeat <array_size>
	return freeslots = <freeslots>
endscript

script get_pak_filename 
	addparams ($musician_arrays.<type>)
	<size_func>
	found = 0
	index = 0
	begin
	<access_func> index = <index>
	if ((<info_struct>.desc_id) = <desc_id>)
		if structurecontains structure = (<info_struct>) <element>
			pak_name = (<info_struct>.<element>)
			found = 1
		else
			return found = 0 pak_index = <index>
		endif
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	if (<found> = 0)
		if ($cheat_airguitar = 1)
			return found = 0 pak_index = <index>
		endif
		printstruct <...>
		printf \{"Pak filename not found"}
	endif
	return found = <found> pak_index = <index> pak_name = <pak_name>
endscript

script get_pak_filename_using_filename_crc 
	addparams ($musician_arrays.<type>)
	<size_func>
	found = 0
	index = 0
	begin
	<access_func> index = <index>
	formattext checksumname = filename_crc '%s' s = (<info_struct>.<element>)
	if (<filename_crc> = <pak_crc>)
		if structurecontains structure = (<info_struct>) <element>
			pak_name = (<info_struct>.<element>)
			found = 1
		else
			return found = 0 pak_index = <index>
		endif
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	return found = <found> pak_index = <index> pak_name = <pak_name>
endscript

script unload_musician_pak_file 
	pak_type = ($character_pak_crc_to_text.<type>)
	formattext checksumname = loaded_paks_ref_counts 'loaded_%p_paks_ref_counts' p = <pak_type>
	if NOT (<desc_id> = no_pak_id)
		find_loaded_pak_file desc_id = <desc_id> type = <type>
		if (<found> = 1)
			ref_count = ($<loaded_paks_ref_counts> [<pak_index>])
			new_ref_count = (<ref_count> - 1)
			setarrayelement arrayname = <loaded_paks_ref_counts> globalarray index = <pak_index> newvalue = <new_ref_count>
		else
			formattext checksumname = loaded_paks 'loaded_%p_paks' p = <pak_type>
			formattext checksumname = loaded_heaps 'loaded_%p_heaps' p = <pak_type>
			printstruct <...>
			printstruct ($<loaded_heaps>)
			printstruct ($<loaded_paks>)
			printstruct ($<loaded_paks_ref_counts>)
			scriptassert \{"Loaded Asset not found"}
		endif
	endif
endscript

script force_unload_all_character_paks \{async = 0}
	force_unload_all_character_paks_by_type <...> type = body
	force_unload_all_character_paks_by_type <...> type = anim
	force_unload_all_character_paks_by_type <...> type = instrument
endscript

script force_unload_all_character_paks_by_type 
	pak_type = ($character_pak_crc_to_text.<type>)
	formattext checksumname = loaded_paks 'loaded_%p_paks' p = <pak_type>
	formattext checksumname = loaded_paks_ref_counts 'loaded_%p_paks_ref_counts' p = <pak_type>
	getarraysize $<loaded_paks>
	index = 0
	begin
	next_pak = ($<loaded_paks> [<index>])
	if NOT (<next_pak> = none)
		get_pak_filename_using_filename_crc pak_crc = <next_pak> type = <type>
		if (<found> = 1)
			unloadpakasync pak_name = <pak_name> heap = bottomupheap async = <async>
		endif
		setarrayelement arrayname = <loaded_paks_ref_counts> globalarray index = <index> newvalue = 0
		setarrayelement arrayname = <loaded_paks> globalarray index = <index> newvalue = none
	endif
	index = (<index> + 1)
	repeat <array_size>
endscript

script load_musician_pak_file \{startslot = 0}
	if NOT (gotparam profile)
		scriptassert \{"Need profile of musician type"}
	endif
	pak_type = ($character_pak_crc_to_text.<type>)
	formattext checksumname = loaded_paks_ref_counts 'loaded_%p_paks_ref_counts' p = <pak_type>
	formattext checksumname = loaded_paks 'loaded_%p_paks' p = <pak_type>
	formattext checksumname = loaded_heaps 'loaded_%p_heaps' p = <pak_type>
	addparams ($musician_arrays.<type>)
	desc_id = ((<profile>.<pak_type>).desc_id)
	get_pak_filename desc_id = <desc_id> type = <type>
	if (<found> = 0)
		return \{filename_crc = no_pak_id
			assetcontext = 0
			true}
	endif
	formattext checksumname = filename_crc '%s' s = <pak_name> addtostringlookup = true
	if (<type> = body)
		get_musician_body_struct index = <pak_index>
		assetcontext = (<info_struct>.asset_context)
		printf channel = animinfo "loaded pak has asset context %a ................" a = <assetcontext>
	else
		assetcontext = 0
	endif
	find_loaded_pak_file desc_id = <filename_crc> type = <type>
	if (<found> = 1)
		ref_count = ($<loaded_paks_ref_counts> [<pak_index>])
		if (<ref_count> = 0)
		endif
		new_ref_count = (<ref_count> + 1)
		setarrayelement arrayname = <loaded_paks_ref_counts> globalarray index = <pak_index> newvalue = <new_ref_count>
	else
		getarraysize $<loaded_paks_ref_counts>
		index = <startslot>
		begin
		ref_count = ($<loaded_paks_ref_counts> [<index>])
		if (<ref_count> = 0)
			unused_pak = ($<loaded_paks> [<index>])
			setarrayelement arrayname = <loaded_paks_ref_counts> globalarray index = <index> newvalue = 0
			setarrayelement arrayname = <loaded_paks> globalarray index = <index> newvalue = none
			if NOT (<unused_pak> = none)
				get_pak_filename_using_filename_crc pak_crc = <unused_pak> type = <type>
				if (<found> = 1)
					unloadpakasync pak_name = <pak_name> heap = bottomupheap async = <async>
				endif
			else
				printf \{"slot not yet assigned...."}
			endif
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
		if (<index> = <array_size>)
			scriptassert \{"Spare slot not found"}
		endif
		get_pak_filename desc_id = <desc_id> type = <type>
		if (<found> = 1)
			setarrayelement arrayname = <loaded_paks_ref_counts> globalarray index = <index> newvalue = 1
			setarrayelement arrayname = <loaded_paks> globalarray index = <index> newvalue = <filename_crc>
			if NOT loadpakasync pak_name = <pak_name> heap = ($<loaded_heaps> [<index>]) async = <async>
				setarrayelement arrayname = <loaded_paks_ref_counts> globalarray index = <index> newvalue = 0
				setarrayelement arrayname = <loaded_paks> globalarray index = <index> newvalue = none
				return \{false}
			endif
		endif
	endif
	return filename_crc = <filename_crc> assetcontext = <assetcontext> true
endscript

script find_loaded_pak_file 
	pak_type = ($character_pak_crc_to_text.<type>)
	formattext checksumname = loaded_paks 'loaded_%p_paks' p = <pak_type>
	getarraysize $<loaded_paks>
	found = 0
	index = 0
	begin
	if (($<loaded_paks> [<index>]) = <desc_id>)
		found = 1
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	return found = <found> pak_index = <index>
endscript

script dump_pak_info 
	dump_pak_info_by_type \{type = body}
	dump_pak_info_by_type \{type = anim}
	dump_pak_info_by_type \{type = instrument}
endscript

script dump_pak_info_by_type 
	pak_type = ($character_pak_crc_to_text.<type>)
	printf \{"------------------------------------------------------------"}
	printf "dumping %t pak information" t = <pak_type>
	printf \{" "}
	formattext checksumname = loaded_paks_ref_counts 'loaded_%p_paks_ref_counts' p = <pak_type>
	formattext checksumname = loaded_paks 'loaded_%p_paks' p = <pak_type>
	formattext checksumname = loaded_heaps 'loaded_%p_heaps' p = <pak_type>
	index = 0
	begin
	body_pak = ($<loaded_paks> [<index>])
	ref_count = ($<loaded_paks_ref_counts> [<index>])
	printf "loaded_%t_paks[%a] = %b (%c) ...." a = <index> b = <body_pak> c = <ref_count> t = <pak_type>
	index = (<index> + 1)
	repeat 4
endscript

script unloadpakasync 
	printf "UnloadPakAsync : %s on heap %a async=%i" s = <pak_name> a = <heap> i = <async>
	unloadpak <pak_name> heap = <heap>
	if (<async> = 1)
		begin
		if waitunloadpak <pak_name> noblock
			break
		endif
		wait \{1
			gameframe}
		repeat
	else
		waitunloadpak <pak_name> block
	endif
endscript
character_pak_loadpak_lock = 0
character_pak_loadpak_done = 0
character_pak_loadpak_failed = 0

script loadpakasync 
	printf "LoadPakAsync : %s on heap %a async=%i" s = <pak_name> a = <heap> i = <async>
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
	getcontentfolderindexfromfile <pak_name>
	if (<device> = content)
		if NOT downloads_opencontentfolder content_index = <content_index>
			printf \{"Downloads_OpenContentFolder FAILED"}
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

script loadpakasync_callback 
	printf \{"LoadPakAsync_callback"}
	printstruct <...>
	if NOT (<result> = 0)
		change \{character_pak_loadpak_done = 1}
		change \{character_pak_loadpak_failed = 1}
	endif
	if gotparam \{end}
		change \{character_pak_loadpak_done = 1}
	endif
endscript
