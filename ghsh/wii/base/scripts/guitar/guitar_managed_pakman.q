mpm_state = {
	available_links = [
	]
}
mpm_lock_var = 0

script mpm_dump_state 
	printf \{'--------------------------------------------------------------'}
	printf \{'Managed Pakman State'}
	printcompactstruct ($mpm_state)
	printf \{'--------------------------------------------------------------'}
endscript

script mpm_new_map 
	RequireParams \{[
			Heap
			links
			folder
		]
		all}
	pakman_state = ($mpm_state)
	if NOT ArrayContains array = (<pakman_state>.available_links) contains = <links>
		AddArrayElement array = (<pakman_state>.available_links) element = <links>
		pakman_state = {<pakman_state> available_links = <array>}
	endif
	mpm_generate_map_id Heap = <Heap> links = <links> index = <index>
	if StructureContains structure = <pakman_state> <links>
		if mpm_search_for_map_key maps = (<pakman_state>.<links>.maps) key = Name value = <map_id>
			ScriptAssert \{'map already exists!'}
		endif
	endif
	pakman_state_links = {maps = []}
	if StructureContains structure = <pakman_state> <links>
		pakman_state_links = (<pakman_state>.<links>)
	endif
	map_struct = {Name = <map_id> pak = None handles = []}
	AddArrayElement array = (<pakman_state_links>.maps) element = <map_struct>
	pakman_state_links = {<pakman_state_links> maps = <array>}
	appendstruct struct = pakman_state Field = <links> params = <pakman_state_links>
	if GotParam \{no_vram}
		no_vram_flag = {no_vram}
	endif
	MemPushContext <Heap>
	CreatePakManMap map = <map_id> links = <links> folder = <folder> <no_vram_flag>
	MemPopContext
	Change mpm_state = <pakman_state>
	printf 'Created map %m on heap %h' m = <map_id> h = <Heap>
endscript

script mpm_free_map 
	0xb2c6e895 \{[
			Heap
			links
		]
		all}
	if ArrayContains array = (($mpm_state).available_links) contains = <links>
		mpm_generate_map_id Heap = <Heap> links = <links> index = <index>
		if mpm_free_map_by_id map_id = <map_id> links = <links>
			return \{true}
		endif
	endif
	printf 'Couldn\'t free map on %h - %l' h = <Heap> l = <links>
	return \{FALSE}
endscript

script mpm_free_map_by_id 
	0xb2c6e895 \{[
			map_id
			links
		]
		all}
	pakman_state = ($mpm_state)
	if StructureContains structure = <pakman_state> <links>
		if mpm_search_for_map_key maps = (<pakman_state>.<links>.maps) key = Name value = <map_id>
			links_struct = (<pakman_state>.<links>)
			map_array = ((<links_struct>.maps))
			existing_pak = ((<map_array> [<key_index>]).pak)
			if NOT (<existing_pak> = None)
				mpm_flush_pak pak = <existing_pak> async = 0
			endif
			RemoveArrayElement array = <map_array> index = <key_index>
			links_struct = {<links_struct> maps = <array>}
			appendstruct struct = pakman_state Field = <links> params = <links_struct>
			Change mpm_state = <pakman_state>
			DestroyPakManMap map = <map_id>
			printf 'Freed pakman map %m' m = <map_id>
			GetArraySize <map_array>
			if (<array_Size> = 0)
			endif
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script mpm_free_all_maps 
	mpm_flush_all_paks
	ForEachIn (($mpm_state).available_links) do = mpm_free_all_maps_eachlink
endscript

script mpm_object_load_pak 
	if NOT GotParam \{owner}
		Obj_GetID
		owner = <objID>
		RemoveParameter \{objID}
	endif
	mpm_load_pak <...> owner = <obj_id>
endscript

script mpm_load_pak \{async = 0
		owner = no_owner}
	0xb2c6e895 \{[
			pak
			async
			owner
		]
		all}
	if mpm_find_existing_loaded_pak pak = <pak>
		0x8dbdaee4 'mpm_load_pak - using links %l' l = <links> donotresolve
	endif
	if NOT GotParam \{links}
		if NOT find_pak_in_links pak = <pak>
			mpm_dump_state
			0x93d8d5cf 'pak %s isn\'t in a managed links set' s = <pak>
		endif
	endif
	pakman_state = ($mpm_state)
	links_struct = (<pakman_state>.<links>)
	map_array = ((<links_struct>.maps))
	if mpm_search_for_map_key maps = <map_array> key = pak value = <pak>
		map_entry = (<map_array> [<key_index>])
		mpm_add_handle map_entry = <map_entry> handle = <owner>
		SetArrayElement ArrayName = map_array index = <key_index> NewValue = <map_entry>
		printf '%p already loaded. Adding handle %h' p = <pak> h = <owner>
	else
		if NOT mpm_search_for_map_key maps = <map_array> key = pak value = None
			if mpm_search_for_unused_map maps = <map_array>
				mpm_flush_pak pak = (<map_array> [<key_index>].pak) links = <links> async = <async>
				pakman_state = ($mpm_state)
				links_struct = (<pakman_state>.<links>)
				map_array = ((<links_struct>.maps))
			else
				mpm_dump_state
				ScriptAssert 'All maps in %l are in use, pak %p cannot be loaded' l = <links> p = <pak> donotresolve
			endif
		endif
		map_entry = (<map_array> [<key_index>])
		if NOT mpm_has_no_handles map_entry = <map_entry>
			ScriptAssert \{'Should have no handles!'}
		endif
		if NOT ((<map_entry>.pak) = None)
			ScriptAssert \{'pak should be none!'}
		endif
		map_entry = {<map_entry> pak = <pak>}
		mpm_add_handle map_entry = <map_entry> handle = <owner>
		SetArrayElement ArrayName = map_array index = <key_index> NewValue = <map_entry>
		pak_needs_loading_map = (<map_entry>.Name)
	endif
	links_struct = {<links_struct> maps = <map_array>}
	appendstruct struct = pakman_state Field = <links> params = <links_struct>
	Change mpm_state = <pakman_state>
	if GotParam \{pak_needs_loading_map}
		printf 'Loading %p onto map %m' p = <pak> m = <pak_needs_loading_map>
		if (<async> = 1)
			mpm_wait_until_free
		endif
		OnExitRun \{mpm_load_pak_exit}
		mpm_lock
		if NOT StructureContains structure = ($<links>) <pak>
			ScriptAssert 'pak %s does not exist in pakman links: %m' s = <pak> m = <links> donotresolve
		endif
		pak_filename = ((($<links>).<pak>).Name)
		GetContentFolderIndexFromFile <pak_filename>
		if (<device> = content)
			if NOT Downloads_OpenContentFolder content_index = <content_index>
				ScriptAssert 'Downloads_OpenContentFolder FAILED on %p' p = <pak>
			endif
		endif
		SetPakManCurrentBlock map = <pak_needs_loading_map> pak = <pak> block_scripts = (1 - <async>) device = <device>
		if (<device> = content)
			Downloads_CloseContentFolder content_index = <content_index>
		endif
		mpm_unlock
		printf 'Finished loading %p onto map %m' p = <pak> m = <pak_needs_loading_map>
	endif
endscript

script mpm_find_existing_loaded_pak 
	RequireParams \{[
			pak
		]
		all}
	i = 0
	GetArraySize (($mpm_state).available_links)
	if (<array_Size> > 0)
		begin
		links = ((($mpm_state).available_links) [<i>])
		if pakman_links_contains_pak links = <links> pak = <pak>
			links_struct = (($mpm_state).<links>)
			map_array = ((<links_struct>.maps))
			if mpm_search_for_map_key maps = <map_array> key = pak value = <pak>
				return true links = <links>
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script mpm_load_pak_exit 
	if ($mpm_lock_var = 1)
		mpm_dump_state
		ScriptAssert \{'Pakman lock violation'}
	endif
endscript

script mpm_flush_pak \{async = 0}
	RequireParams \{[
			pak
			async
		]
		all}
	if (<pak> = None)
		printf \{qs(0xb18bc3fc)}
		return
	endif
	if NOT GotParam \{links}
		if NOT find_pak_in_links pak = <pak>
			ScriptAssert 'pak %s isn\'t in a managed links set' s = <pak>
		endif
	endif
	pakman_state = ($mpm_state)
	links_struct = (<pakman_state>.<links>)
	map_array = ((<links_struct>.maps))
	if NOT mpm_search_for_map_key maps = <map_array> key = pak value = <pak>
		mpm_dump_state
		ScriptAssert 'Pak %p not found' p = <pak>
	endif
	map_entry = (<map_array> [<key_index>])
	if NOT mpm_has_no_handles map_entry = <map_entry>
		mpm_dump_state
		ScriptAssert 'There are active handles to %p!' p = <pak>
	endif
	map_entry = {<map_entry> pak = None}
	SetArrayElement ArrayName = map_array index = <key_index> NewValue = <map_entry>
	links_struct = {<links_struct> maps = <map_array>}
	appendstruct struct = pakman_state Field = <links> params = <links_struct>
	Change mpm_state = <pakman_state>
	map = (<map_entry>.Name)
	printf 'Unloading pak %p on map %m' p = <pak> m = <map>
	if (<async> = 1)
		mpm_wait_until_free
	endif
	mpm_lock
	OnExitRun \{mpm_flush_pak_exit}
	pak_filename = ((($<links>).<pak>).Name)
	SetPakManCurrentBlock map = <map> pak = None block_scripts = (1 - <async>)
	mpm_unlock
	printf 'Finished unloading %p on map %m' p = <pak> m = <map>
endscript

script mpm_flush_pak_exit 
	if ($mpm_lock_var = 1)
		mpm_dump_state
		ScriptAssert \{'Pakman lock violation'}
	endif
endscript

script mpm_flush_all_paks 
	ForEachIn (($mpm_state).available_links) do = mpm_flush_all_paks_eachlink
endscript

script mpm_unload_pak \{owner = no_owner}
	RequireParams \{[
			pak
			owner
		]
		all}
	if NOT GotParam \{links}
		if NOT find_pak_in_links pak = <pak>
			ScriptAssert 'pak %s isn\'t in a managed links set' s = <pak>
		endif
	endif
	pakman_state = ($mpm_state)
	links_struct = (<pakman_state>.<links>)
	map_array = ((<links_struct>.maps))
	if NOT mpm_search_for_map_key maps = <map_array> key = pak value = <pak>
		ScriptAssert 'Pak %p not found' p = <pak>
	endif
	map_entry = (<map_array> [<key_index>])
	if (<owner> = all)
		map_entry = {<map_entry> handles = []}
	else
		if mpm_has_no_handles map_entry = <map_entry>
			if GotParam \{already_unloaded_is_okay}
				return
			endif
			ScriptAssert 'refcount is already zero on %p!' p = <pak>
		endif
		mpm_remove_handle map_entry = <map_entry> handle = <owner>
	endif
	SetArrayElement ArrayName = map_array index = <key_index> NewValue = <map_entry>
	links_struct = {<links_struct> maps = <map_array>}
	appendstruct struct = pakman_state Field = <links> params = <links_struct>
	Change mpm_state = <pakman_state>
endscript

script mpm_object_unload_paks 
	if NOT GotParam \{owner}
		Obj_GetID
		owner = <objID>
		RemoveParameter \{objID}
	endif
	ForEachIn (($mpm_state).available_links) do = mpm_object_unload_paks_eachlink params = {<...>}
endscript

script mpm_is_busy 
	if ($mpm_lock_var = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script mpm_wait_until_free 
	begin
	if ($mpm_lock_var = 0)
		return
	endif
	printf \{'mpm_wait_until_free - Waiting for pakman to finish it\'s stuff'}
	Wait \{1
		gameframe}
	repeat
endscript

script mpm_generate_map_id 
	MangleChecksums a = <Heap> b = <links>
	if GotParam \{index}
		MangleChecksums a = <mangled_ID> b = <index>
	endif
	MangleChecksums a = <mangled_ID> b = managed_pakman_map
	return map_id = <mangled_ID>
endscript

script mpm_lock 
	mpm_wait_until_free
	if ($mpm_lock_var = 1)
		mpm_dump_state
		ScriptAssert \{'Pakman lock violation'}
	endif
	Change \{mpm_lock_var = 1}
endscript

script mpm_unlock 
	if ($mpm_lock_var = 0)
		mpm_dump_state
		ScriptAssert \{'Pakman lock violation'}
	endif
	Change \{mpm_lock_var = 0}
endscript

script mpm_has_no_handles 
	GetArraySize (<map_entry>.handles)
	if (<array_Size> = 0)
		return \{true}
	endif
	return \{FALSE}
endscript

script mpm_remove_handle 
	array = (<map_entry>.handles)
	if NOT ArrayContains array = <array> contains = <handle>
		mpm_dump_state
		ScriptAssert 'Handle %h not found!' h = <handle>
	endif
	begin
	GetArraySize <array>
	i = 0
	if (<array_Size> > 0)
		begin
		if (<handle> = (<array> [<i>]))
			RemoveArrayElement array = <array> index = <i>
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if NOT ArrayContains array = <array> contains = <handle>
		break
	endif
	repeat
	map_entry = {<map_entry> handles = <array>}
	return map_entry = <map_entry>
endscript

script mpm_add_handle 
	AddArrayElement array = (<map_entry>.handles) element = <handle>
	map_entry = {<map_entry> handles = <array>}
	return map_entry = <map_entry>
endscript

script mpm_search_for_unused_map 
	i = 0
	GetArraySize <maps>
	if (<array_Size> > 0)
		begin
		if mpm_has_no_handles map_entry = (<maps> [<i>])
			return true key_index = <i>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script mpm_unload_paks 
	ForEachIn (($mpm_state).<checksum>.maps) do = mpm_unload_pak params = {owner = all}
endscript

script mpm_object_unload_paks_eachlink 
	ForEachIn (($mpm_state).<checksum>.maps) do = mpm_object_unload_paks_eachlink_eachmap params = {<...> links = <checksum>}
endscript

script mpm_object_unload_paks_eachlink_eachmap 
	if ArrayContains array = <handles> contains = <owner>
		mpm_unload_pak pak = <pak> links = <links> async = <async> owner = <owner>
	endif
endscript

script mpm_flush_all_paks_eachlink 
	maps_array = (($mpm_state).<checksum>.maps)
	i = 0
	GetArraySize <maps_array>
	if (<array_Size> > 0)
		begin
		if NOT (((<maps_array> [<i>]).pak) = None)
			mpm_flush_pak pak = ((<maps_array> [<i>]).pak) links = <checksum> async = 0
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script mpm_free_all_maps_eachlink 
	maps_array = (($mpm_state).<checksum>.maps)
	i = 0
	GetArraySize <maps_array>
	if (<array_Size> > 0)
		begin
		if NOT mpm_free_map_by_id map_id = ((<maps_array> [<i>]).Name) links = <checksum>
			ScriptAssert \{'Problem freeing map'}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script mpm_search_for_map_key 
	RequireParams \{[
			maps
			key
			value
		]
		all}
	i = 0
	GetArraySize <maps>
	if (<array_Size> > 0)
		begin
		key_found = ((<maps> [<i>]).<key>)
		if (<key_found> = <value>)
			return true key_index = <i>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script pakman_links_contains_pak 
	RequireParams \{[
			links
			pak
		]
		all}
	if StructureContains structure = ($<links>) <pak>
		return \{true}
	endif
	return \{FALSE}
endscript

script find_pak_in_links 
	i = 0
	GetArraySize (($mpm_state).available_links)
	if (<array_Size> > 0)
		begin
		links = ((($mpm_state).available_links) [<i>])
		if pakman_links_contains_pak links = <links> pak = <pak>
			return true links = <links>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript
