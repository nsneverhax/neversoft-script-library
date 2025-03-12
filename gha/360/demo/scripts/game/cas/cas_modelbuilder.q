
script create_model_from_appearance 
	modelappearancemembfunc \{func = getchecksum
		params = {
			field = required_character_type
		}}
	if NOT gotparam \{editable_list}
		build_master_editable_list character_type = <required_character_type>
		editable_list = <master_editable_list>
	endif
	modelclearallgeoms
	if gotparam \{remove_assets}
		process_cas_command cas_command = modelremoveasset editable_list = <editable_list>
	endif
	debugprintappearance
	process_cas_command cas_command = modelrunscript editable_list = <editable_list> target = disqualify_script
	process_cas_command cas_command = modeladdgeom editable_list = <editable_list>
	process_cas_command cas_command = geomreplacetexture editable_list = <editable_list>
	if gotparam \{skater_heap}
		printf "Skater_Heap = %d" d = <skater_heap>
		formattext checksumname = heap_name 'SkaterHeap%i' i = <skater_heap>
		mempushcontext <heap_name>
	endif
	if gotparam \{skater_heap}
		mempopcontext
	endif
	modelexpandboundingsphere
	modelfinalize
endscript

script create_ped_model_from_appearance 
	modelclearallgeoms
	foreachineditablelist \{do = modeladdgeom}
	modelremovepolys
	foreachineditablelist \{do = geommodulatecolor}
	modelfinalize
endscript

script process_cas_command 
	foreachin <editable_list> do = <cas_command> params = <...>
endscript
