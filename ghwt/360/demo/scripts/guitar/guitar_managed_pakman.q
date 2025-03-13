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
	requireparams \{[
			heap
			links
			folder
		]
		all}
	pakman_state = ($mpm_state)
	if NOT arraycontains array = (<pakman_state>.available_links) contains = <links>
		addarrayelement array = (<pakman_state>.available_links) element = <links>
		pakman_state = {<pakman_state> available_links = <array>}
	endif
	mpm_generate_map_id heap = <heap> links = <links> index = <index>
	if structurecontains structure = <pakman_state> <links>
		if mpm_search_for_map_key maps = (<pakman_state>.<links>.maps) key = name value = <map_id>
			scriptassert \{'map already exists!'}
		endif
	endif
	pakman_state_links = {maps = []}
	if structurecontains structure = <pakman_state> <links>
		pakman_state_links = (<pakman_state>.<links>)
	endif
	map_struct = {name = <map_id> pak = none handles = []}
	addarrayelement array = (<pakman_state_links>.maps) element = <map_struct>
	pakman_state_links = {<pakman_state_links> maps = <array>}
	appendstruct struct = pakman_state field = <links> params = <pakman_state_links>
	if gotparam \{no_vram}
		no_vram_flag = {no_vram}
	endif
	mempushcontext \{bottomupheap}
	createpakmanmap map = <map_id> links = <links> folder = <folder> <no_vram_flag> allocheap = <heap>
	mempopcontext
	change mpm_state = <pakman_state>
	printf 'Created map %m on heap %h' m = <map_id> h = <heap>
endscript

script mpm_free_map 
	requireparams \{[
			heap
			links
		]
		all}
	if arraycontains array = (($mpm_state).available_links) contains = <links>
		mpm_generate_map_id heap = <heap> links = <links> index = <index>
		if mpm_free_map_by_id map_id = <map_id>
			return \{true}
		endif
	endif
	printf 'Couldn\'t free map on %h - %l' h = <heap> l = <links>
	return \{false}
endscript

script mpm_free_map_by_id 
	requireparams \{[
			map_id
			links
		]
		all}
	pakman_state = ($mpm_state)
	if structurecontains structure = <pakman_state> <links>
		if mpm_search_for_map_key maps = (<pakman_state>.<links>.maps) key = name value = <map_id>
			links_struct = (<pakman_state>.<links>)
			map_array = ((<links_struct>.maps))
			existing_pak = ((<map_array> [<key_index>]).pak)
			if NOT (<existing_pak> = none)
				mpm_flush_pak pak = <existing_pak> async = 0
			endif
			removearrayelement array = <map_array> index = <key_index>
			links_struct = {<links_struct> maps = <array>}
			appendstruct struct = pakman_state field = <links> params = <links_struct>
			change mpm_state = <pakman_state>
			destroypakmanmap map = <map_id>
			printf 'Freed pakman map %m' m = <map_id>
			getarraysize <map_array>
			if (<array_size> = 0)
			endif
			return \{true}
		endif
	endif
	return \{false}
endscript

script mpm_free_all_maps 
	mpm_flush_all_paks
	foreachin (($mpm_state).available_links) do = mpm_free_all_maps_eachlink
endscript

script mpm_object_load_pak 
	if NOT gotparam \{owner}
		obj_getid
		owner = <objid>
		removeparameter \{objid}
	endif
	mpm_load_pak <...> owner = <obj_id>
endscript

script mpm_load_pak \{async = 0
		owner = no_owner}
	requireparams \{[
			pak
			async
			owner
		]
		all}
	if mpm_find_existing_loaded_pak pak = <pak>
		printf 'mpm_load_pak - using links %l' l = <links> donotresolve
	endif
	if NOT gotparam \{links}
		if NOT find_pak_in_links pak = <pak>
			mpm_dump_state
			scriptassert 'pak %s isn\'t in a managed links set' s = <pak>
		endif
	endif
	pakman_state = ($mpm_state)
	links_struct = (<pakman_state>.<links>)
	map_array = ((<links_struct>.maps))
	if mpm_search_for_map_key maps = <map_array> key = pak value = <pak>
		map_entry = (<map_array> [<key_index>])
		mpm_add_handle map_entry = <map_entry> handle = <owner>
		setarrayelement arrayname = map_array index = <key_index> newvalue = <map_entry>
		printf '%p already loaded. Adding handle %h' p = <pak> h = <owner>
	else
		if NOT mpm_search_for_map_key maps = <map_array> key = pak value = none
			if mpm_search_for_unused_map maps = <map_array>
				mpm_flush_pak pak = (<map_array> [<key_index>].pak) links = <links> async = <async>
				pakman_state = ($mpm_state)
				links_struct = (<pakman_state>.<links>)
				map_array = ((<links_struct>.maps))
			else
				mpm_dump_state
				scriptassert 'All maps in %l are in use, pak %p cannot be loaded' l = <links> p = <pak> donotresolve
			endif
		endif
		map_entry = (<map_array> [<key_index>])
		if NOT mpm_has_no_handles map_entry = <map_entry>
			scriptassert \{'Should have no handles!'}
		endif
		if NOT ((<map_entry>.pak) = none)
			scriptassert \{'pak should be none!'}
		endif
		map_entry = {<map_entry> pak = <pak>}
		mpm_add_handle map_entry = <map_entry> handle = <owner>
		setarrayelement arrayname = map_array index = <key_index> newvalue = <map_entry>
		pak_needs_loading_map = (<map_entry>.name)
	endif
	links_struct = {<links_struct> maps = <map_array>}
	appendstruct struct = pakman_state field = <links> params = <links_struct>
	change mpm_state = <pakman_state>
	if gotparam \{pak_needs_loading_map}
		printf 'Loading %p onto map %m' p = <pak> m = <pak_needs_loading_map>
		if (<async> = 1)
			mpm_wait_until_free
		endif
		onexitrun \{mpm_load_pak_exit}
		mpm_lock
		if NOT structurecontains structure = ($<links>) <pak>
			scriptassert 'pak %s does not exist in pakman links: %m' s = <pak> m = <links> donotresolve
		endif
		pak_filename = ((($<links>).<pak>).name)
		getcontentfolderindexfromfile <pak_filename>
		if (<device> = content)
			if NOT downloads_opencontentfolder content_index = <content_index>
				scriptassert 'Downloads_OpenContentFolder FAILED on %p' p = <pak>
			endif
		endif
		setpakmancurrentblock map = <pak_needs_loading_map> pak = <pak> block_scripts = (1 - <async>) device = <device>
		if (<device> = content)
			downloads_closecontentfolder content_index = <content_index>
		endif
		mpm_unlock
		printf 'Finished loading %p onto map %m' p = <pak> m = <pak_needs_loading_map>
	endif
endscript

script mpm_find_existing_loaded_pak 
	requireparams \{[
			pak
		]
		all}
	i = 0
	getarraysize (($mpm_state).available_links)
	if (<array_size> > 0)
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
		repeat <array_size>
	endif
	return \{false}
endscript

script mpm_load_pak_exit 
	if ($mpm_lock_var = 1)
		mpm_dump_state
		scriptassert \{'Pakman lock violation'}
	endif
endscript

script mpm_flush_pak \{async = 0}
	requireparams \{[
			pak
			async
		]
		all}
	if (<pak> = none)
		printf \{qs(0xb18bc3fc)}
		return
	endif
	if NOT gotparam \{links}
		if NOT find_pak_in_links pak = <pak>
			scriptassert 'pak %s isn\'t in a managed links set' s = <pak>
		endif
	endif
	pakman_state = ($mpm_state)
	links_struct = (<pakman_state>.<links>)
	map_array = ((<links_struct>.maps))
	if NOT mpm_search_for_map_key maps = <map_array> key = pak value = <pak>
		mpm_dump_state
		scriptassert 'Pak %p not found' p = <pak>
	endif
	map_entry = (<map_array> [<key_index>])
	if NOT mpm_has_no_handles map_entry = <map_entry>
		mpm_dump_state
		scriptassert 'There are active handles to %p!' p = <pak>
	endif
	map_entry = {<map_entry> pak = none}
	setarrayelement arrayname = map_array index = <key_index> newvalue = <map_entry>
	links_struct = {<links_struct> maps = <map_array>}
	appendstruct struct = pakman_state field = <links> params = <links_struct>
	change mpm_state = <pakman_state>
	map = (<map_entry>.name)
	printf 'Unloading pak %p on map %m' p = <pak> m = <map>
	if (<async> = 1)
		mpm_wait_until_free
	endif
	mpm_lock
	onexitrun \{mpm_flush_pak_exit}
	pak_filename = ((($<links>).<pak>).name)
	setpakmancurrentblock map = <map> pak = none block_scripts = (1 - <async>)
	mpm_unlock
	printf 'Finished unloading %p on map %m' p = <pak> m = <map>
endscript

script mpm_flush_pak_exit 
	if ($mpm_lock_var = 1)
		mpm_dump_state
		scriptassert \{'Pakman lock violation'}
	endif
endscript

script mpm_flush_all_paks 
	foreachin (($mpm_state).available_links) do = mpm_flush_all_paks_eachlink
endscript

script mpm_unload_pak \{owner = no_owner}
	requireparams \{[
			pak
			owner
		]
		all}
	if NOT gotparam \{links}
		if NOT find_pak_in_links pak = <pak>
			scriptassert 'pak %s isn\'t in a managed links set' s = <pak>
		endif
	endif
	pakman_state = ($mpm_state)
	links_struct = (<pakman_state>.<links>)
	map_array = ((<links_struct>.maps))
	if NOT mpm_search_for_map_key maps = <map_array> key = pak value = <pak>
		scriptassert 'Pak %p not found' p = <pak>
	endif
	map_entry = (<map_array> [<key_index>])
	if (<owner> = all)
		map_entry = {<map_entry> handles = []}
	else
		if mpm_has_no_handles map_entry = <map_entry>
			if gotparam \{already_unloaded_is_okay}
				return
			endif
			scriptassert 'refcount is already zero on %p!' p = <pak>
		endif
		mpm_remove_handle map_entry = <map_entry> handle = <owner>
	endif
	setarrayelement arrayname = map_array index = <key_index> newvalue = <map_entry>
	links_struct = {<links_struct> maps = <map_array>}
	appendstruct struct = pakman_state field = <links> params = <links_struct>
	change mpm_state = <pakman_state>
endscript

script mpm_object_unload_paks 
	if NOT gotparam \{owner}
		obj_getid
		owner = <objid>
		removeparameter \{objid}
	endif
	foreachin (($mpm_state).available_links) do = mpm_object_unload_paks_eachlink params = {<...>}
endscript

script mpm_is_busy 
	if ($mpm_lock_var = 1)
		return \{true}
	endif
	return \{false}
endscript

script mpm_wait_until_free 
	begin
	if ($mpm_lock_var = 0)
		return
	endif
	printf \{'mpm_wait_until_free - Waiting for pakman to finish it\'s stuff'}
	wait \{1
		gameframe}
	repeat
endscript

script mpm_generate_map_id 
	manglechecksums a = <heap> b = <links>
	if gotparam \{index}
		manglechecksums a = <mangled_id> b = <index>
	endif
	manglechecksums a = <mangled_id> b = managed_pakman_map
	return map_id = <mangled_id>
endscript

script mpm_lock 
	if ($mpm_lock_var = 1)
		mpm_dump_state
		scriptassert \{'Pakman lock violation'}
	endif
	change \{mpm_lock_var = 1}
endscript

script mpm_unlock 
	if ($mpm_lock_var = 0)
		mpm_dump_state
		scriptassert \{'Pakman lock violation'}
	endif
	change \{mpm_lock_var = 0}
endscript

script mpm_has_no_handles 
	getarraysize (<map_entry>.handles)
	if (<array_size> = 0)
		return \{true}
	endif
	return \{false}
endscript

script mpm_remove_handle 
	array = (<map_entry>.handles)
	if NOT arraycontains array = <array> contains = <handle>
		mpm_dump_state
		scriptassert 'Handle %h not found!' h = <handle>
	endif
	begin
	getarraysize <array>
	i = 0
	if (<array_size> > 0)
		begin
		if (<handle> = (<array> [<i>]))
			removearrayelement array = <array> index = <i>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if NOT arraycontains array = <array> contains = <handle>
		break
	endif
	repeat
	map_entry = {<map_entry> handles = <array>}
	return map_entry = <map_entry>
endscript

script mpm_add_handle 
	addarrayelement array = (<map_entry>.handles) element = <handle>
	map_entry = {<map_entry> handles = <array>}
	return map_entry = <map_entry>
endscript

script mpm_search_for_unused_map 
	i = 0
	getarraysize <maps>
	if (<array_size> > 0)
		begin
		if mpm_has_no_handles map_entry = (<maps> [<i>])
			return true key_index = <i>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script mpm_unload_paks 
	foreachin (($mpm_state).<checksum>.maps) do = mpm_unload_pak params = {owner = all}
endscript

script mpm_object_unload_paks_eachlink 
	foreachin (($mpm_state).<checksum>.maps) do = mpm_object_unload_paks_eachlink_eachmap params = {<...> links = <checksum>}
endscript

script mpm_object_unload_paks_eachlink_eachmap 
	if arraycontains array = <handles> contains = <owner>
		mpm_unload_pak pak = <pak> links = <links> async = <async> owner = <owner>
	endif
endscript

script mpm_flush_all_paks_eachlink 
	maps_array = (($mpm_state).<checksum>.maps)
	i = 0
	getarraysize <maps_array>
	if (<array_size> > 0)
		begin
		if NOT (((<maps_array> [<i>]).pak) = none)
			mpm_flush_pak pak = ((<maps_array> [<i>]).pak) links = <checksum> async = 0
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script mpm_free_all_maps_eachlink 
	maps_array = (($mpm_state).<checksum>.maps)
	i = 0
	getarraysize <maps_array>
	if (<array_size> > 0)
		begin
		if NOT mpm_free_map_by_id map_id = ((<maps_array> [<i>]).name) links = <checksum>
			scriptassert \{'Problem freeing map'}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script mpm_search_for_map_key 
	requireparams \{[
			maps
			key
			value
		]
		all}
	i = 0
	getarraysize <maps>
	if (<array_size> > 0)
		begin
		key_found = ((<maps> [<i>]).<key>)
		if (<key_found> = <value>)
			return true key_index = <i>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script pakman_links_contains_pak 
	requireparams \{[
			links
			pak
		]
		all}
	if structurecontains structure = ($<links>) <pak>
		return \{true}
	endif
	return \{false}
endscript

script find_pak_in_links 
	i = 0
	getarraysize (($mpm_state).available_links)
	if (<array_size> > 0)
		begin
		links = ((($mpm_state).available_links) [<i>])
		if pakman_links_contains_pak links = <links> pak = <pak>
			return true links = <links>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript
