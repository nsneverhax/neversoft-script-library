
script create_model_from_appearance 
	ModelAppearanceMembFunc \{func = GetChecksum
		Params = {
			Field = required_character_type
		}}
	if NOT GotParam \{editable_list}
		build_master_editable_list character_type = <required_character_type>
		editable_list = <master_editable_list>
	endif
	ModelClearAllGeoms
	if GotParam \{remove_assets}
		process_cas_command cas_command = ModelRemoveAsset editable_list = <editable_list>
	endif
	DebugPrintAppearance
	process_cas_command cas_command = ModelRunScript editable_list = <editable_list> Target = disqualify_script
	process_cas_command cas_command = ModelAddGeom editable_list = <editable_list>
	process_cas_command cas_command = GeomReplaceTexture editable_list = <editable_list>
	if GotParam \{skater_heap}
		Printf "Skater_Heap = %d" D = <skater_heap>
		FormatText ChecksumName = heap_name 'SkaterHeap%i' I = <skater_heap>
		MemPushContext <heap_name>
	endif
	if GotParam \{skater_heap}
		MemPopContext
	endif
	ModelExpandBoundingSphere
	ModelFinalize
endscript

script create_ped_model_from_appearance 
	ModelClearAllGeoms
	ForEachInEditableList \{do = ModelAddGeom}
	ModelRemovePolys
	ForEachInEditableList \{do = GeomModulateColor}
	ModelFinalize
endscript

script process_cas_command 
	ForEachIn <editable_list> do = <cas_command> Params = <...>
endscript
