
script getcurrentcasobject 
	if cas_player_has_character_object Player = ($cas_current_player)
		return true cas_object = <character_object>
	endif
	return \{FALSE}
endscript

script getcasappearance 
	return true appearance = ($cas_current_appearance)
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
	cas_queue_add_request appearance = ($cas_current_appearance) Player = ($cas_current_player) instrument = <instrument> in_cas force_update = <force_update>
endscript

script updatecurrentcasmodel instrument = ($cas_current_instrument)
	RequireParams \{[
			buildscript
		]
		all}
	if cas_queue_is_busy \{in_queue_too}
		printf \{'UpdateCurrentCASModel: Doing full refresh, CAS queue is already working'}
		rebuildcurrentcasmodel instrument = <instrument>
		return
	endif
	KillSpawnedScript \{Name = updatecurrentcasmodelspawned}
	SpawnScriptNow updatecurrentcasmodelspawned params = {<...>}
endscript

script updatecurrentcasmodelspawned \{instrument = None
		flush_assets = 1
		cache = 1}
	printscriptinfo \{'UpdateCurrentCASModelSpawned'}
	archivewaitloading \{cas}
	caswaitforcomposite
	if NOT ($cas_override_object = None)
		cache = 0
		cas_object = ($cas_override_object)
	else
		getcurrentcasobject
	endif
	if GotParam \{cas_object}
		if CompositeObjectExists Name = <cas_object>
			Change \{safe_to_free_cas_temporaries = 0}
			OnExitRun updatecurrentcasmodelspawned_cleanup params = {flush_assets = <flush_assets>}
			<cas_object> :GetSingleTag LightGroup
			<cas_object> :GetSingleTag asset_heap
			appearance = ($cas_current_appearance)
			get_appearance_checksum {appearance = <appearance> instrument = <instrument> mic = 0}
			appearance_checksum = <new_appearance_checksum>
			gethathairchoice
			filterappearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
			filterappearance appearance_name = appearance part_set = $hair_part_sets chosen_set = <hat_hair_choice>
			buildscriptparams = {
				<buildscriptparams>
				temporary_heap = heap_cas_build
				instrument = <instrument>
				LightGroup = <LightGroup>
				hat_hair_choice = <hat_hair_choice>
				no_parts_added_or_removed
			}
			if (<cache> = 1)
				archivewaitloading \{cas_building_cache
					async = 1}
				cascachemodel {
					async = 1
					appearance = <appearance>
					global_storage = <asset_heap>
					buildscriptparams = <buildscriptparams>
				}
			endif
			<cas_object> :SetTags appearance_checksum = <appearance_checksum>
			<cas_object> :modelbuilder_preload {
				async = 0
				appearance = <appearance>
				buildscript = <buildscript>
				buildscriptparams = <buildscriptparams>
			}
			<cas_object> :modelbuilder_loadassets {
				async = 0
			}
			<cas_object> :modelbuilder_processassets
			<cas_object> :modelbuilder_build {
				appearance = <appearance>
				buildscript = <buildscript>
				buildscriptparams = <buildscriptparams>
			}
			forceinstanceupdate
		endif
	endif
endscript

script updatecurrentcasmodelspawned_cleanup 
	Change \{safe_to_free_cas_temporaries = 1}
	if (<flush_assets> = 1)
		castemporariesflush
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
	if NOT getcasappearancepartdescid part = <part>
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
			title = qs(0x1a32079f)
			if (<array_Size> = 1)
				Name = qs(0xaa2546c1)
			else
				formatText TextName = Name qs(0xdfd513db) d = (<i> + 1)
			endif
			if GotParam \{material_names}
				Name = (<material_names> [<i>])
				title = (<material_names> [<i>])
			endif
			formatText checksumName = desc_id 'material%d' d = (<i> + 1)
			AddArrayElement array = <array> element = {desc_id = <desc_id> Name = <Name> title = <title>}
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
				title = qs(0x1a32079f)
				if (<array_Size> = 1)
					Name = qs(0xaa2546c1)
				else
					formatText TextName = Name qs(0xdfd513db) d = (<i> + 1)
				endif
				if StructureContains structure = (<material_groups> [<i>]) Name
					Name = ((<material_groups> [<i>]).Name)
					title = ((<material_groups> [<i>]).Name)
				endif
				if StructureContains structure = (<material_groups> [<i>]) desc_id
					desc_id = ((<material_groups> [<i>]).desc_id)
				else
					formatText checksumName = desc_id 'material%d' d = (<i> + 1)
				endif
				AddArrayElement array = <array> element = {desc_id = <desc_id> Name = <Name> title = <title>}
				i = (<i> + 1)
				repeat <array_Size>
				return true part_materials = <array>
			endif
		else
			if GotParam \{modify_all_materials}
				Name = qs(0xaa2546c1)
				title = qs(0x1a32079f)
				if GotParam \{material_names}
					Name = (<material_names> [0])
					title = (<material_names> [0])
				endif
				return true part_materials = [{desc_id = material1 Name = <Name> title = <title>}]
			endif
		endif
		return \{FALSE}
	endif
endscript

script getcaspartswatches 
	if NOT getcasappearancepartdescid part = <part>
		return \{FALSE}
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{FALSE}
	endif
	current_swatch_desc_id = <desc_id>
	if GotParam \{swatch_for}
		if NOT getactualcasoptionstruct part = <part> desc_id = <swatch_for>
			return \{FALSE}
		endif
	endif
	if GotParam \{swatch_list}
		GetArraySize <swatch_list>
		if (<array_Size> > 0)
			array = []
			AddArrayElement array = <array> element = {desc_id = <desc_id>}
			i = 0
			begin
			AddArrayElement array = <array> element = {desc_id = (<swatch_list> [<i>])}
			i = (<i> + 1)
			repeat <array_Size>
			return true part_swatches = <array> frontend_desc = <frontend_desc> current_swatch_desc_id = <current_swatch_desc_id>
		endif
	endif
	return \{FALSE}
endscript

script setcasappearancebones 
	printscriptinfo \{'SetCASAppearanceBones'}
	checkmodelbuilderlock
	if StructureContains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		appendstruct struct = cas_current_appearance Field = <part> params = {<str> bones = <bones>} globalstruct
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
	verifycapprofile Profile = {appearance = <appearance>} allowlocked
	Change cas_current_appearance = {<appearance>}
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
endscript

script hidemusician_foreach 
	SwitchOffAtomic <checksum>
endscript

script unhidemusician 
	ForEachIn \{$body_parts
		do = unhidemusician_foreach}
endscript

script unhidemusician_foreach 
	SwitchOnAtomic <checksum>
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
		<part_instance> = {}
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
		if StructureContains structure = (<part_list_instances> [<i>]) desc_id
			setcasappearancepartinstance part = (<part_list> [<i>]) part_instance = (<part_list_instances> [<i>])
		endif
		if ((<part_list> [<i>]) = cas_hair)
			resolvebodyspecificpartinappearance \{part = cas_hat_hair}
			editcasappearance {
				target = clearpart
				targetparams = {part = <part>}
			}
			if getcasappearancepartinstance \{part = cas_hat}
				resolvebodyspecificpartinappearance \{part = cas_hat}
				editcasappearance {
					target = clearpart
					targetparams = {part = <part>}
				}
				cas_add_item_to_appearance part = <part> desc_id = (<part_instance>.desc_id) no_rebuild
				setcasappearancepartinstance part = <part> part_instance = <part_instance>
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
		rebuildcurrentcasmodel
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
	restoretoptemporarycasappearance
	ui_event \{event = menu_back}
endscript

script generic_exit_restore_refresh 
	restoretoptemporarycasappearance
	ui_event \{event = menu_back
		data = {
			refresh_previous_state
		}}
endscript
musician_heaps = [
	heap_musician1
	heap_musician2
	heap_musician3
	heap_musician4
]

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

script get_appearance_checksum 
	RequireParams \{[
			appearance
			instrument
			mic
		]
		all}
	generatechecksumfromstruct \{structname = appearance}
	appearance_checksum = <structure_checksum>
	if GotParam \{instrument}
		appearance_checksum = (<appearance_checksum> + <instrument>)
	endif
	if (<mic> > 0)
		appearance_checksum = (<appearance_checksum> + mic)
	endif
	return new_appearance_checksum = <appearance_checksum>
endscript
