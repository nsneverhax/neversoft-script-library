
script getcurrentcasobject 
	if cas_player_has_character_object Player = ($cas_current_player)
		return true cas_object = <character_object>
	endif
	return \{FALSE}
endscript

script getcasappearance 
	return true appearance = ($cas_current_appearance)
endscript

script getcasappearancepart 
	resolvebodyspecificpartinappearance part = <part>
	if StructureContains structure = ($cas_current_appearance) <part>
		app_struct = (($cas_current_appearance).<part>)
		if StructureContains structure = <app_struct> desc_id
			return true {<app_struct>}
		endif
	endif
	return \{FALSE}
endscript

script getcasappearancepartinstance 
	RequireParams \{[
			part
		]
		all}
	resolvebodyspecificpartinappearance part = <part>
	if StructureContains structure = ($cas_current_appearance) <part>
		app_struct = (($cas_current_appearance).<part>)
		if StructureContains structure = <app_struct> desc_id
			return true part_instance = (<app_struct>)
		endif
	endif
	return \{FALSE}
endscript

script setcasappearancepartinstance 
	RequireParams \{[
			part
			part_instance
		]
		all}
	resolvebodyspecificpartinappearance part = <part>
	AddParam Name = <part> structure_name = part_struct value = <part_instance>
	Change cas_current_appearance = {($cas_current_appearance)
		<part_struct>}
endscript

script editcasappearance 
	checkmodelbuilderlock
	if checksumequals a = <target> b = setgenre
		Change cas_current_appearance = {($cas_current_appearance) genre = (<targetparams>.genre)}
	else
		part = (<targetparams>.part)
		resolvebodyspecificpartinappearance part = <part>
		if checksumequals a = <target> b = setpart
			newstruct = {desc_id = (<targetparams>.desc_id)}
			add_cap_array_to_part part = <part> newstruct = <newstruct>
			add_chosen_materials_to_part part = <part> newstruct = <newstruct>
			updatestructelement struct = $cas_current_appearance element = <part> value = <newstruct>
			Change cas_current_appearance = <newstruct>
		elseif checksumequals a = <target> b = clearpart
			loc_appearance = ($cas_current_appearance)
			RemoveComponent structure_name = loc_appearance Name = <part>
			Change cas_current_appearance = <loc_appearance>
		elseif checksumequals a = <target> b = hidegeom
			hide_geom = (<targetparams>.hide_geom)
			if StructureContains structure = ($cas_current_appearance) <part>
				newstruct = {(($cas_current_appearance).<part>)
					hide_geom = <hide_geom>}
				updatestructelement struct = $cas_current_appearance element = <part> value = <newstruct>
				Change cas_current_appearance = <newstruct>
			endif
		else
			ScriptAssert 'EditCASAppearance - %s not supported' s = <target>
		endif
	endif
endscript

script add_chosen_materials_to_part 
	RequireParams \{[
			part
			newstruct
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = (<newstruct>.desc_id)
		ScriptAssert '%s %t not found' s = <part> t = (<newstruct>.desc_id)
	endif
	if GotParam \{chosen_materials}
		newstruct = {<newstruct>
			chosen_materials = <chosen_materials>}
		return newstruct = <newstruct>
	endif
endscript

script rebuildcurrentcasmodel instrument = ($cas_current_instrument)
	if NOT ($cas_heap_state = in_cas)
		ScriptAssert \{'Needs to be in the CAS heap state'}
	endif
	cas_queue_add_request appearance = ($cas_current_appearance) Player = ($cas_current_player) instrument = <instrument> in_cas
endscript

script updatecurrentcasmodel instrument = ($cas_current_instrument)
	RequireParams \{[
			buildscript
		]
		all}
	if cas_queue_is_busy \{in_queue_too}
		printf \{'Waiting for CAS queue to complete first'}
		rebuildcurrentcasmodel instrument = <instrument>
		return
	endif
	KillSpawnedScript \{Name = updatecurrentcasmodelspawned}
	SpawnScriptNow updatecurrentcasmodelspawned params = {<...>}
endscript

script updatecurrentcasmodelspawned 
	casblockforloading
	caswaitforcomposite
	if NOT ($cas_override_object = None)
		cas_object = ($cas_override_object)
	else
		getcurrentcasobject
	endif
	if GotParam \{cas_object}
		if CompositeObjectExists Name = <cas_object>
			<cas_object> :GetSingleTag LightGroup
			get_hat_hair_choice appearance = ($cas_current_appearance)
			<cas_object> :modelbuilder_build {
				appearance = ($cas_current_appearance)
				buildscript = <buildscript>
				buildscriptparams = {
					<buildscriptparams>
					temporary_heap = heap_cas
					instrument = <instrument>
					LightGroup = <LightGroup>
					hat_hair_choice = <hat_hair_choice>
				}
			}
		endif
	endif
endscript

script printcurrentappearance 
	reorderstructforcas struct = ($cas_current_appearance)
	printcompactstruct <out>
endscript

script getcasmaterialvalue 
	RequireParams \{[
			part
			material
		]
		all}
	if StructureContains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if StructureContains structure = <str> chosen_materials
			if StructureContains structure = (<str>.chosen_materials) <material>
				return true value = ((<str>.chosen_materials).<material>)
			endif
		endif
	endif
	return \{FALSE}
endscript

script setcasappearancematerial 
	RequireParams \{[
			part
			material
			value
		]
		all}
	checkmodelbuilderlock
	if StructureContains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if StructureContains structure = <str> chosen_materials
			chosen_materials = (<str>.chosen_materials)
		else
			chosen_materials = {}
		endif
		updatestructelement struct = <chosen_materials> element = <material> value = <value>
		chosen_materials = {
			<chosen_materials> <newstruct>
		}
		appendstruct struct = cas_current_appearance Field = <part> params = {<str> chosen_materials = <chosen_materials>} globalstruct
	endif
endscript

script getcaspartmaterials 
	if NOT getcasappearancepart part = <part>
		return \{FALSE}
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{FALSE}
	endif
	if GotParam \{materials}
		GetArraySize <materials>
		if (<array_Size> > 0)
			array = []
			i = 0
			begin
			formatText checksumName = desc_id 'material%d' d = (<i> + 1)
			AddArrayElement array = <array> element = <desc_id>
			i = (<i> + 1)
			repeat <array_Size>
			return true part_materials = <array>
		endif
	else
		if GotParam \{material_groups}
			GetArraySize <material_groups>
			if (<array_Size> > 0)
				array = []
				i = 0
				begin
				if StructureContains structure = (<material_groups> [<i>]) desc_id
					desc_id = ((<material_groups> [<i>]).desc_id)
				else
					formatText checksumName = desc_id 'material%d' d = (<i> + 1)
				endif
				AddArrayElement array = <array> element = <desc_id>
				i = (<i> + 1)
				repeat <array_Size>
				return true part_materials = <array>
			endif
		else
			if GotParam \{modify_all_materials}
				return \{true
					part_materials = [
						material1
					]}
			endif
		endif
		return \{FALSE}
	endif
endscript

script setcasappearancebones 
	checkmodelbuilderlock
	if StructureContains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		appendstruct struct = cas_current_appearance Field = <part> params = {<str> bones = <bones>} globalstruct
	endif
endscript

script setcasappearanceadditionalbones 
	checkmodelbuilderlock
	if StructureContains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		appendstruct struct = cas_current_appearance Field = <part> params = {<str> additional_bone_transforms = <additional_bone_transforms>} globalstruct
	endif
endscript

script setcasappearancecap 
	checkmodelbuilderlock
	if StructureContains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if GotParam \{cap}
			appendstruct struct = cas_current_appearance Field = <part> params = {<str> cap = <cap>} globalstruct
		else
			RemoveComponent \{Name = cap
				structure_name = str}
			appendstruct struct = cas_current_appearance Field = <part> params = {<str>} globalstruct
		endif
	endif
endscript

script setcasappearance 
	checkmodelbuilderlock
	verifycapprofile Profile = {appearance = <appearance>}
	assertforcaserrors
	Change cas_current_appearance = {<appearance>}
endscript

script resolvebodyspecificpart 
	if getactualcasoptionstruct part = <body_part> desc_id = <desc_id> no_resolve
		if GotParam \{body_specific_parts}
			if StructureContains structure = <body_specific_parts> <part>
				return true part = (<body_specific_parts>.<part>)
			endif
		endif
	endif
	return \{FALSE}
endscript

script resolvebodyspecificpartinappearance appearance = ($cas_current_appearance)
	if StructureContains structure = <appearance> cas_body
		if resolvebodyspecificpart part = <part> desc_id = ((<appearance>.cas_body).desc_id) body_part = cas_body
			return true part = <part>
		endif
	elseif StructureContains structure = <appearance> cas_full_body
		if resolvebodyspecificpart part = <part> desc_id = ((<appearance>.cas_full_body).desc_id) body_part = cas_full_body
			return true part = <part>
		endif
	endif
	return \{FALSE}
endscript

script hideinstrument 
	ForEachIn (($instrument_part_sets).guitar) do = hideinstrument_foreach
	ForEachIn (($instrument_part_sets).bass) do = hideinstrument_foreach
	ForEachIn (($instrument_part_sets).drum) do = hideinstrument_foreach
	ForEachIn (($instrument_part_sets).vocals) do = hideinstrument_foreach
endscript

script hideinstrument_foreach 
	SwitchOffAtomic <checksum>
endscript

script unhideinstrument 
	ForEachIn (($instrument_part_sets).guitar) do = unhideinstrument_foreach
	ForEachIn (($instrument_part_sets).bass) do = unhideinstrument_foreach
	ForEachIn (($instrument_part_sets).drum) do = unhideinstrument_foreach
	ForEachIn (($instrument_part_sets).vocals) do = unhideinstrument_foreach
endscript

script unhideinstrument_foreach 
	SwitchOnAtomic <checksum>
endscript

script hidemusician 
	ForEachIn \{$body_parts
		do = hidemusician_foreach}
	ForEachIn \{$body_parts
		do = hidemusician_foreach}
	ForEachIn \{$body_parts
		do = hidemusician_foreach}
	ForEachIn \{$body_parts
		do = hidemusician_foreach}
endscript

script hidemusician_foreach 
	SwitchOffAtomic <checksum>
endscript

script get_hat_hair_choice 
	if resolvebodyspecificpartinappearance appearance = <appearance> part = cas_hat_hair
		if StructureContains structure = <appearance> <part>
			if StructureContains structure = (<appearance>.<part>) desc_id
				return \{hat_hair_choice = hat_hair}
			endif
		endif
	endif
	return \{hat_hair_choice = hair}
endscript

script caswaitforcomposite 
	if modelbuilderiscompositingactive
		begin
		printf \{'Waiting for Compositing...'}
		Wait \{1
			gameframe}
		if NOT modelbuilderiscompositingactive
			break
		endif
		repeat
	endif
endscript

script casblockforcomposite 
	if modelbuilderiscompositingactive
		modelbuilderblockforcompositing
	endif
endscript

script pushtemporarycasappearance 
	AddArrayElement array = ($cas_temporary_appearance_stack) element = ($cas_current_appearance)
	Change cas_temporary_appearance_stack = <array>
endscript

script printtemporarycasappearancestack 
	printcompactstruct ($cas_temporary_appearance_stack)
endscript

script poptemporarycasappearance 
	GetArraySize ($cas_temporary_appearance_stack)
	if (<array_Size> > 0)
		RemoveArrayElement array = ($cas_temporary_appearance_stack) index = (<array_Size> -1)
		Change cas_temporary_appearance_stack = <array>
	endif
endscript

script restoretoptemporarycasappearance 
	GetArraySize ($cas_temporary_appearance_stack)
	if (<array_Size> > 0)
		Change cas_current_appearance = (($cas_temporary_appearance_stack) [(<array_Size> -1)])
	endif
	if GotParam \{update_cap}
		updatecasmodelcap part = <part>
	elseif GotParam \{update_color}
		updatecurrentcasmodel \{buildscript = color_model_from_appearance}
	else
		printf \{'Rebuild Cas Model'}
		rebuildcurrentcasmodel
	endif
endscript

script mergepartintotemporarycasappearance 
	RequireParams \{[
			part_list
		]
		all}
	part_list_instances = []
	GetArraySize <part_list>
	i = 0
	begin
	if NOT getcasappearancepartinstance part = (<part_list> [<i>])
		ScriptAssert qs(0x1666eb90) p = (<part_list> [<i>]) donotresolve
		return
	endif
	AddArrayElement array = <part_list_instances> element = <part_instance>
	part_list_instances = <array>
	i = (<i> + 1)
	repeat <array_Size>
	GetArraySize ($cas_temporary_appearance_stack)
	if (<array_Size> > 0)
		Change cas_current_appearance = (($cas_temporary_appearance_stack) [(<array_Size> -1)])
		RemoveArrayElement array = ($cas_temporary_appearance_stack) index = (<array_Size> -1)
		Change cas_temporary_appearance_stack = <array>
		GetArraySize <part_list>
		i = 0
		begin
		setcasappearancepartinstance part = (<part_list> [<i>]) part_instance = (<part_list_instances> [<i>])
		i = (<i> + 1)
		repeat <array_Size>
		if (($invite_controller) = -1)
			rebuildcurrentcasmodel
		endif
	endif
endscript

script comparetoptemporarycasappearance 
	GetArraySize ($cas_temporary_appearance_stack)
	if comparestructs struct1 = (($cas_temporary_appearance_stack) [(<array_Size> -1)]) struct2 = ($cas_current_appearance)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script generic_exit_restore 
	destroy_generic_menu
	restoretoptemporarycasappearance
	ui_event \{event = menu_back}
endscript

script list_exit_restore 
	generic_list_destroy
	restoretoptemporarycasappearance
	ui_event \{event = menu_back}
endscript

script get_best_heap_for_appearance \{exclusions = [
		]}
	best_heap = None
	best_score = -1.0
	GetArraySize \{$musician_heaps}
	i = 0
	begin
	heap_name = ($musician_heaps [<i>])
	get_appearance_heap_score appearance = <appearance> heap_name = <heap_name>
	if (<score> >= <best_score>)
		best_score = <score>
		best_heap = <heap_name>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	printstruct {best_heap = <best_heap> best_score = <best_score>}
	if (<best_score> < 0.0)
		ScriptAssert \{'No available heaps'}
	endif
	if casisassetstorageused Name = <best_heap>
		ScriptAssert 'Asset storage %s is already used' s = <best_heap>
	endif
	return best_heap = <best_heap>
endscript

script get_appearance_heap_score 
	if casisassetstorageused Name = <heap_name>
		printf 'get_appearance_heap_score - %s is being used!' s = <heap_name>
		return \{score = -1.0}
	else
		cascompareassetstorage Name = <heap_name> appearance = <appearance>
		return score = <comparevalue>
	endif
endscript
