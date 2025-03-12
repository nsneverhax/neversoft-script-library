
script getcurrentcasobject 
	if cas_player_has_character_object player = ($cas_current_player)
		return true cas_object = <character_object>
	endif
	return \{false}
endscript

script getcasappearance 
	return true appearance = ($cas_current_appearance)
endscript

script getcasappearancepart 
	resolvebodyspecificpartinappearance part = <part>
	if structurecontains structure = ($cas_current_appearance) <part>
		app_struct = (($cas_current_appearance).<part>)
		if structurecontains structure = <app_struct> desc_id
			return true {<app_struct>}
		endif
	endif
	return \{false}
endscript

script getcasappearancepartinstance 
	requireparams \{[
			part
		]
		all}
	resolvebodyspecificpartinappearance part = <part>
	if structurecontains structure = ($cas_current_appearance) <part>
		app_struct = (($cas_current_appearance).<part>)
		if structurecontains structure = <app_struct> desc_id
			return true part_instance = (<app_struct>)
		endif
	endif
	return \{false}
endscript

script setcasappearancepartinstance 
	requireparams \{[
			part
			part_instance
		]
		all}
	resolvebodyspecificpartinappearance part = <part>
	addparam name = <part> structure_name = part_struct value = <part_instance>
	change cas_current_appearance = {($cas_current_appearance)
		<part_struct>}
endscript

script editcasappearance 
	checkmodelbuilderlock
	if checksumequals a = <target> b = setgenre
		change cas_current_appearance = {($cas_current_appearance) genre = (<targetparams>.genre)}
	else
		part = (<targetparams>.part)
		resolvebodyspecificpartinappearance part = <part>
		if checksumequals a = <target> b = setpart
			newstruct = {desc_id = (<targetparams>.desc_id)}
			add_cap_array_to_part part = <part> newstruct = <newstruct>
			add_chosen_materials_to_part part = <part> newstruct = <newstruct>
			updatestructelement struct = $cas_current_appearance element = <part> value = <newstruct>
			change cas_current_appearance = <newstruct>
		elseif checksumequals a = <target> b = clearpart
			loc_appearance = ($cas_current_appearance)
			removecomponent structure_name = loc_appearance name = <part>
			change cas_current_appearance = <loc_appearance>
		elseif checksumequals a = <target> b = hidegeom
			hide_geom = (<targetparams>.hide_geom)
			if structurecontains structure = ($cas_current_appearance) <part>
				newstruct = {(($cas_current_appearance).<part>)
					hide_geom = <hide_geom>}
				updatestructelement struct = $cas_current_appearance element = <part> value = <newstruct>
				change cas_current_appearance = <newstruct>
			endif
		else
			scriptassert 'EditCASAppearance - %s not supported' s = <target>
		endif
	endif
endscript

script add_chosen_materials_to_part 
	requireparams \{[
			part
			newstruct
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = (<newstruct>.desc_id)
		scriptassert '%s %t not found' s = <part> t = (<newstruct>.desc_id)
	endif
	if gotparam \{chosen_materials}
		newstruct = {<newstruct>
			chosen_materials = <chosen_materials>}
		return newstruct = <newstruct>
	endif
endscript

script rebuildcurrentcasmodel instrument = ($cas_current_instrument)
	if NOT ($cas_heap_state = in_cas)
		scriptassert \{'Needs to be in the CAS heap state'}
	endif
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) instrument = <instrument> in_cas
endscript

script updatecurrentcasmodel instrument = ($cas_current_instrument)
	requireparams \{[
			buildscript
		]
		all}
	if cas_queue_is_busy \{in_queue_too}
		printf \{'Waiting for CAS queue to complete first'}
		rebuildcurrentcasmodel instrument = <instrument>
		return
	endif
	killspawnedscript \{name = updatecurrentcasmodelspawned}
	spawnscriptnow updatecurrentcasmodelspawned params = {<...>}
endscript

script updatecurrentcasmodelspawned 
	casblockforloading
	caswaitforcomposite
	if NOT ($cas_override_object = none)
		cas_object = ($cas_override_object)
	else
		getcurrentcasobject
	endif
	if gotparam \{cas_object}
		if compositeobjectexists name = <cas_object>
			<cas_object> :getsingletag lightgroup
			get_hat_hair_choice appearance = ($cas_current_appearance)
			<cas_object> :modelbuilder_build {
				appearance = ($cas_current_appearance)
				buildscript = <buildscript>
				buildscriptparams = {
					<buildscriptparams>
					temporary_heap = heap_cas
					instrument = <instrument>
					lightgroup = <lightgroup>
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
	requireparams \{[
			part
			material
		]
		all}
	if structurecontains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if structurecontains structure = <str> chosen_materials
			if structurecontains structure = (<str>.chosen_materials) <material>
				return true value = ((<str>.chosen_materials).<material>)
			endif
		endif
	endif
	return \{false}
endscript

script setcasappearancematerial 
	requireparams \{[
			part
			material
			value
		]
		all}
	checkmodelbuilderlock
	if structurecontains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if structurecontains structure = <str> chosen_materials
			chosen_materials = (<str>.chosen_materials)
		else
			chosen_materials = {}
		endif
		updatestructelement struct = <chosen_materials> element = <material> value = <value>
		chosen_materials = {
			<chosen_materials> <newstruct>
		}
		appendstruct struct = cas_current_appearance field = <part> params = {<str> chosen_materials = <chosen_materials>} globalstruct
	endif
endscript

script getcaspartmaterials 
	if NOT getcasappearancepart part = <part>
		return \{false}
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if gotparam \{materials}
		getarraysize <materials>
		if (<array_size> > 0)
			array = []
			i = 0
			begin
			formattext checksumname = desc_id 'material%d' d = (<i> + 1)
			addarrayelement array = <array> element = <desc_id>
			i = (<i> + 1)
			repeat <array_size>
			return true part_materials = <array>
		endif
	else
		if gotparam \{material_groups}
			getarraysize <material_groups>
			if (<array_size> > 0)
				array = []
				i = 0
				begin
				if structurecontains structure = (<material_groups> [<i>]) desc_id
					desc_id = ((<material_groups> [<i>]).desc_id)
				else
					formattext checksumname = desc_id 'material%d' d = (<i> + 1)
				endif
				addarrayelement array = <array> element = <desc_id>
				i = (<i> + 1)
				repeat <array_size>
				return true part_materials = <array>
			endif
		else
			if gotparam \{modify_all_materials}
				return \{true
					part_materials = [
						material1
					]}
			endif
		endif
		return \{false}
	endif
endscript

script setcasappearancebones 
	checkmodelbuilderlock
	if structurecontains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		appendstruct struct = cas_current_appearance field = <part> params = {<str> bones = <bones>} globalstruct
	endif
endscript

script setcasappearanceadditionalbones 
	checkmodelbuilderlock
	if structurecontains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		appendstruct struct = cas_current_appearance field = <part> params = {<str> additional_bone_transforms = <additional_bone_transforms>} globalstruct
	endif
endscript

script setcasappearancecap 
	checkmodelbuilderlock
	if structurecontains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if gotparam \{cap}
			appendstruct struct = cas_current_appearance field = <part> params = {<str> cap = <cap>} globalstruct
		else
			removecomponent \{name = cap
				structure_name = str}
			appendstruct struct = cas_current_appearance field = <part> params = {<str>} globalstruct
		endif
	endif
endscript

script setcasappearance 
	checkmodelbuilderlock
	verifycapprofile profile = {appearance = <appearance>}
	assertforcaserrors
	change cas_current_appearance = {<appearance>}
endscript

script resolvebodyspecificpart 
	if getactualcasoptionstruct part = <body_part> desc_id = <desc_id> no_resolve
		if gotparam \{body_specific_parts}
			if structurecontains structure = <body_specific_parts> <part>
				return true part = (<body_specific_parts>.<part>)
			endif
		endif
	endif
	return \{false}
endscript

script resolvebodyspecificpartinappearance appearance = ($cas_current_appearance)
	if structurecontains structure = <appearance> cas_body
		if resolvebodyspecificpart part = <part> desc_id = ((<appearance>.cas_body).desc_id) body_part = cas_body
			return true part = <part>
		endif
	elseif structurecontains structure = <appearance> cas_full_body
		if resolvebodyspecificpart part = <part> desc_id = ((<appearance>.cas_full_body).desc_id) body_part = cas_full_body
			return true part = <part>
		endif
	endif
	return \{false}
endscript

script hideinstrument 
	foreachin (($instrument_part_sets).guitar) do = hideinstrument_foreach
	foreachin (($instrument_part_sets).bass) do = hideinstrument_foreach
	foreachin (($instrument_part_sets).drum) do = hideinstrument_foreach
	foreachin (($instrument_part_sets).vocals) do = hideinstrument_foreach
endscript

script hideinstrument_foreach 
	switchoffatomic <checksum>
endscript

script unhideinstrument 
	foreachin (($instrument_part_sets).guitar) do = unhideinstrument_foreach
	foreachin (($instrument_part_sets).bass) do = unhideinstrument_foreach
	foreachin (($instrument_part_sets).drum) do = unhideinstrument_foreach
	foreachin (($instrument_part_sets).vocals) do = unhideinstrument_foreach
endscript

script unhideinstrument_foreach 
	switchonatomic <checksum>
endscript

script hidemusician 
	foreachin \{$body_parts
		do = hidemusician_foreach}
	foreachin \{$body_parts
		do = hidemusician_foreach}
	foreachin \{$body_parts
		do = hidemusician_foreach}
	foreachin \{$body_parts
		do = hidemusician_foreach}
endscript

script hidemusician_foreach 
	switchoffatomic <checksum>
endscript

script get_hat_hair_choice 
	if resolvebodyspecificpartinappearance appearance = <appearance> part = cas_hat_hair
		if structurecontains structure = <appearance> <part>
			if structurecontains structure = (<appearance>.<part>) desc_id
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
		wait \{1
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
	addarrayelement array = ($cas_temporary_appearance_stack) element = ($cas_current_appearance)
	change cas_temporary_appearance_stack = <array>
endscript

script printtemporarycasappearancestack 
	printcompactstruct ($cas_temporary_appearance_stack)
endscript

script poptemporarycasappearance 
	getarraysize ($cas_temporary_appearance_stack)
	if (<array_size> > 0)
		removearrayelement array = ($cas_temporary_appearance_stack) index = (<array_size> -1)
		change cas_temporary_appearance_stack = <array>
	endif
endscript

script restoretoptemporarycasappearance 
	getarraysize ($cas_temporary_appearance_stack)
	if (<array_size> > 0)
		change cas_current_appearance = (($cas_temporary_appearance_stack) [(<array_size> -1)])
	endif
	if gotparam \{update_cap}
		updatecasmodelcap part = <part>
	elseif gotparam \{update_color}
		updatecurrentcasmodel \{buildscript = color_model_from_appearance}
	else
		printf \{'Rebuild Cas Model'}
		rebuildcurrentcasmodel
	endif
endscript

script mergepartintotemporarycasappearance 
	requireparams \{[
			part_list
		]
		all}
	hide_glitch \{num_frames = 10}
	part_list_instances = []
	getarraysize <part_list>
	i = 0
	begin
	if NOT getcasappearancepartinstance part = (<part_list> [<i>])
		scriptassert qs(0x1666eb90) p = (<part_list> [<i>]) donotresolve
		return
	endif
	addarrayelement array = <part_list_instances> element = <part_instance>
	part_list_instances = <array>
	i = (<i> + 1)
	repeat <array_size>
	getarraysize ($cas_temporary_appearance_stack)
	if (<array_size> > 0)
		change cas_current_appearance = (($cas_temporary_appearance_stack) [(<array_size> -1)])
		removearrayelement array = ($cas_temporary_appearance_stack) index = (<array_size> -1)
		change cas_temporary_appearance_stack = <array>
		getarraysize <part_list>
		i = 0
		begin
		setcasappearancepartinstance part = (<part_list> [<i>]) part_instance = (<part_list_instances> [<i>])
		i = (<i> + 1)
		repeat <array_size>
		if (($invite_controller) = -1)
			rebuildcurrentcasmodel
		endif
	endif
endscript

script comparetoptemporarycasappearance 
	getarraysize ($cas_temporary_appearance_stack)
	if comparestructs struct1 = (($cas_temporary_appearance_stack) [(<array_size> -1)]) struct2 = ($cas_current_appearance)
		return \{true}
	else
		return \{false}
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
	best_heap = none
	best_score = -1.0
	getarraysize \{$musician_heaps}
	i = 0
	begin
	heap_name = ($musician_heaps [<i>])
	get_appearance_heap_score appearance = <appearance> heap_name = <heap_name>
	if (<score> >= <best_score>)
		best_score = <score>
		best_heap = <heap_name>
	endif
	i = (<i> + 1)
	repeat <array_size>
	printstruct {best_heap = <best_heap> best_score = <best_score>}
	if (<best_score> < 0.0)
		scriptassert \{'No available heaps'}
	endif
	if casisassetstorageused name = <best_heap>
		scriptassert 'Asset storage %s is already used' s = <best_heap>
	endif
	return best_heap = <best_heap>
endscript

script get_appearance_heap_score 
	if casisassetstorageused name = <heap_name>
		printf 'get_appearance_heap_score - %s is being used!' s = <heap_name>
		return \{score = -1.0}
	else
		cascompareassetstorage name = <heap_name> appearance = <appearance>
		return score = <comparevalue>
	endif
endscript
