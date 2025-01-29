current_body_type_list = {
	heap_musician1 = None
	heap_musician2 = None
	heap_musician3 = None
	heap_musician4 = None
}
current_instrument_type_list = {
	heap_musician1 = None
	heap_musician2 = None
	heap_musician3 = None
	heap_musician4 = None
}

script create_new_type_heaps 
	RequireParams \{[
			appearance
			Heap
			Type
		]
		all}
	if (<Type> = instrument)
		type_heap_map = $instrument_type_heap_map
		if GotParam \{instrument_type}
			type_checksum = <instrument_type>
		else
			ScriptAssert \{'Type instrument require intrument_type parameter'}
		endif
	elseif (<Type> = Body)
		type_heap_map = $body_type_heap_map
		if StructureContains structure = <appearance> cas_body
			type_checksum = ((<appearance>.cas_body).desc_id)
			printf 'type_checksum = %d' d = <type_checksum>
		else
			if StructureContains structure = <appearance> cas_full_body
				type_checksum = ((<appearance>.cas_full_body).desc_id)
				printf 'type_checksum = %d' d = <type_checksum>
			else
				ScriptAssert \{'No way to know what type of body we have'}
				type_checksum = mainline
			endif
		endif
	else
		ScriptAssert 'Type =%s not supported' s = <Type>
		return
	endif
	setcasappearance appearance = <appearance>
	if NOT (<type_checksum> = None)
		if StructureContains structure = <type_heap_map> <type_checksum>
			heap_map = ((<type_heap_map>).<type_checksum>)
		elseif (<Type> = Body)
			type_checksum = mainline
			heap_map = ((<type_heap_map>).<type_checksum>)
		else
			ScriptAssert 'Type =%s not found in heap map' s = <Type>
			return
		endif
	endif
	map_exist = 0
	current_type = None
	if (<Type> = instrument)
		current_type = (($current_instrument_type_list).<Heap>)
	elseif (<Type> = Body)
		current_type = (($current_body_type_list).<Heap>)
	endif
	printf 'current_type = %d' d = <current_type>
	if (<current_type> = <type_checksum>)
		printf \{'<current_type> = <type_checksum>'}
		map_exist = 1
	else
		printf \{'<current_type> != <type_checksum>'}
		if NOT (<current_type> = None)
			get_current_part_heap_map Heap = <Heap> Type = <Type>
			ForEachIn $<current_part_heap_map> do = delete_part_heap params = {Heap = <Heap>}
		endif
	endif
	if (<type_checksum> = None)
		switch <Heap>
			case heap_musician1
			if (<Type> = instrument)
				Change structurename = current_instrument_type_list heap_musician1 = (<type_checksum>)
			elseif (<Type> = Body)
				Change structurename = current_body_type_list heap_musician1 = (<type_checksum>)
			endif
			case heap_musician2
			if (<Type> = instrument)
				Change structurename = current_instrument_type_list heap_musician2 = (<type_checksum>)
			elseif (<Type> = Body)
				Change structurename = current_body_type_list heap_musician2 = (<type_checksum>)
			endif
			case heap_musician3
			if (<Type> = instrument)
				Change structurename = current_instrument_type_list heap_musician3 = (<type_checksum>)
			elseif (<Type> = Body)
				Change structurename = current_body_type_list heap_musician3 = (<type_checksum>)
			endif
			case heap_musician4
			if (<Type> = instrument)
				Change structurename = current_instrument_type_list heap_musician4 = (<type_checksum>)
			elseif (<Type> = Body)
				Change structurename = current_body_type_list heap_musician4 = (<type_checksum>)
			endif
			default
			script_assert \{'Could not find heap type'}
		endswitch
		map_exist = 1
	endif
	if (<map_exist> = 0)
		printf \{'Create new map'}
		ForEachIn $<heap_map> do = create_part_heap params = {Heap = <Heap> Type = <Type>}
		printf 'heap = %d' d = <Heap>
		switch <Heap>
			case heap_musician1
			if (<Type> = instrument)
				Change structurename = current_instrument_type_list heap_musician1 = (<type_checksum>)
			elseif (<Type> = Body)
				Change structurename = current_body_type_list heap_musician1 = (<type_checksum>)
			endif
			case heap_musician2
			if (<Type> = instrument)
				Change structurename = current_instrument_type_list heap_musician2 = (<type_checksum>)
			elseif (<Type> = Body)
				Change structurename = current_body_type_list heap_musician2 = (<type_checksum>)
			endif
			case heap_musician3
			if (<Type> = instrument)
				Change structurename = current_instrument_type_list heap_musician3 = (<type_checksum>)
			elseif (<Type> = Body)
				Change structurename = current_body_type_list heap_musician3 = (<type_checksum>)
			endif
			case heap_musician4
			if (<Type> = instrument)
				Change structurename = current_instrument_type_list heap_musician4 = (<type_checksum>)
			elseif (<Type> = Body)
				Change structurename = current_body_type_list heap_musician4 = (<type_checksum>)
			endif
			default
			script_assert \{'Could not find heap type'}
		endswitch
	endif
endscript

script create_part_heap 
	RequireParams \{[
			Heap
			Type
		]
		all}
	switch <Heap>
		case heap_musician1
		if (<Type> = instrument)
			car_heap = heap_instrument_musician1
		elseif (<Type> = Body)
			car_heap = heap_car_musician1
		endif
		heap_part_checksum = <heap_musician1>
		case heap_musician2
		if (<Type> = instrument)
			car_heap = heap_instrument_musician2
		elseif (<Type> = Body)
			car_heap = heap_car_musician2
		endif
		heap_part_checksum = <heap_musician2>
		case heap_musician3
		if (<Type> = instrument)
			car_heap = heap_instrument_musician3
		elseif (<Type> = Body)
			car_heap = heap_car_musician3
		endif
		heap_part_checksum = <heap_musician3>
		case heap_musician4
		if (<Type> = instrument)
			car_heap = heap_instrument_musician4
		elseif (<Type> = Body)
			car_heap = heap_car_musician4
		endif
		heap_part_checksum = <heap_musician4>
		default
		script_assert \{'Could not find heap type'}
		return
	endswitch
	heap_part_size = <heap_size>
	heap_part_name = <heap_name>
	printf 'heap_part_checksum = %d' d = <heap_part_checksum>
	printf 'heap_part_size = %d' d = <heap_part_size>
	printf 'heap_part_name = %d' d = <heap_part_name>
	MemPushContext <car_heap>
	createsubheap heap_checksum = <heap_part_checksum> heap_size = <heap_part_size> heap_name = <heap_part_name>
	MemPopContext
endscript

script delete_part_heap 
	RequireParams \{[
			Heap
		]
		all}
	switch <Heap>
		case heap_musician1
		heap_part_checksum = <heap_musician1>
		case heap_musician2
		heap_part_checksum = <heap_musician2>
		case heap_musician3
		heap_part_checksum = <heap_musician3>
		case heap_musician4
		heap_part_checksum = <heap_musician4>
		default
		script_assert \{'Could not find heap type'}
		return
	endswitch
	printf 'heap_part_checksum = %d' d = <heap_part_checksum>
	deletesubheap heap_checksum = <heap_part_checksum>
endscript

script get_current_part_heap_map 
	RequireParams \{[
			Heap
			Type
		]
		all}
	printf 'get_current_part_heap_map for type = %s' s = <Type>
	if (<Type> = instrument)
		current_type = (($current_instrument_type_list).<Heap>)
		type_heap_map = $instrument_type_heap_map
	elseif (<Type> = Body)
		current_type = (($current_body_type_list).<Heap>)
		type_heap_map = $body_type_heap_map
	endif
	part_heap_map = ((<type_heap_map>).<current_type>)
	printstruct <...>
	return current_part_heap_map = <part_heap_map>
endscript
