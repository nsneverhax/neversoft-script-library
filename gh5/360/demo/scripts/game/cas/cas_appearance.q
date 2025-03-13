
script getcurrentcasobject 
	if cas_player_has_character_object player = ($cas_current_player)
		return true cas_object = <character_object>
	endif
	return \{false}
endscript

script getcasappearance 
	return true appearance = ($cas_current_appearance)
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
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) instrument = <instrument> in_cas force_update = <force_update>
endscript

script updatecurrentcasmodel instrument = ($cas_current_instrument)
	requireparams \{[
			buildscript
		]
		all}
	if cas_queue_is_busy \{in_queue_too}
		printf \{'UpdateCurrentCASModel: Doing full refresh, CAS queue is already working'}
		rebuildcurrentcasmodel instrument = <instrument>
		return
	endif
	killspawnedscript \{name = updatecurrentcasmodelspawned}
	spawnscriptnow updatecurrentcasmodelspawned params = {<...>}
endscript

script updatecurrentcasmodelspawned \{instrument = none
		flush_assets = 1
		cache = 1}
	printscriptinfo \{'UpdateCurrentCASModelSpawned'}
	archivewaitloading \{cas}
	caswaitforcomposite
	if NOT ($cas_override_object = none)
		cache = 0
		cas_object = ($cas_override_object)
	else
		getcurrentcasobject
	endif
	if gotparam \{cas_object}
		if compositeobjectexists name = <cas_object>
			change \{safe_to_free_cas_temporaries = 0}
			onexitrun updatecurrentcasmodelspawned_cleanup params = {flush_assets = <flush_assets>}
			<cas_object> :getsingletag lightgroup
			<cas_object> :getsingletag asset_heap
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
				lightgroup = <lightgroup>
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
			<cas_object> :settags appearance_checksum = <appearance_checksum>
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
	change \{safe_to_free_cas_temporaries = 1}
	if (<flush_assets> = 1)
		castemporariesflush
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
	if NOT getcasappearancepartdescid part = <part>
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
			title = qs(0x1a32079f)
			if (<array_size> = 1)
				name = qs(0xaa2546c1)
			else
				formattext textname = name qs(0xdfd513db) d = (<i> + 1)
			endif
			if gotparam \{material_names}
				name = (<material_names> [<i>])
				title = (<material_names> [<i>])
			endif
			formattext checksumname = desc_id 'material%d' d = (<i> + 1)
			addarrayelement array = <array> element = {desc_id = <desc_id> name = <name> title = <title>}
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
				title = qs(0x1a32079f)
				if (<array_size> = 1)
					name = qs(0xaa2546c1)
				else
					formattext textname = name qs(0xdfd513db) d = (<i> + 1)
				endif
				if structurecontains structure = (<material_groups> [<i>]) name
					name = ((<material_groups> [<i>]).name)
					title = ((<material_groups> [<i>]).name)
				endif
				if structurecontains structure = (<material_groups> [<i>]) desc_id
					desc_id = ((<material_groups> [<i>]).desc_id)
				else
					formattext checksumname = desc_id 'material%d' d = (<i> + 1)
				endif
				addarrayelement array = <array> element = {desc_id = <desc_id> name = <name> title = <title>}
				i = (<i> + 1)
				repeat <array_size>
				return true part_materials = <array>
			endif
		else
			if gotparam \{modify_all_materials}
				name = qs(0xaa2546c1)
				title = qs(0x1a32079f)
				if gotparam \{material_names}
					name = (<material_names> [0])
					title = (<material_names> [0])
				endif
				return true part_materials = [{desc_id = material1 name = <name> title = <title>}]
			endif
		endif
		return \{false}
	endif
endscript

script getcaspartswatches 
	if NOT getcasappearancepartdescid part = <part>
		return \{false}
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	current_swatch_desc_id = <desc_id>
	if gotparam \{swatch_for}
		if NOT getactualcasoptionstruct part = <part> desc_id = <swatch_for>
			return \{false}
		endif
	endif
	if gotparam \{swatch_list}
		getarraysize <swatch_list>
		if (<array_size> > 0)
			array = []
			addarrayelement array = <array> element = {desc_id = <desc_id>}
			i = 0
			begin
			addarrayelement array = <array> element = {desc_id = (<swatch_list> [<i>])}
			i = (<i> + 1)
			repeat <array_size>
			return true part_swatches = <array> frontend_desc = <frontend_desc> current_swatch_desc_id = <current_swatch_desc_id>
		endif
	endif
	return \{false}
endscript

script setcasappearancebones 
	printscriptinfo \{'SetCASAppearanceBones'}
	checkmodelbuilderlock
	if structurecontains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		appendstruct struct = cas_current_appearance field = <part> params = {<str> bones = <bones>} globalstruct
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
	verifycapprofile profile = {appearance = <appearance>} allowlocked
	change cas_current_appearance = {<appearance>}
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
endscript

script hidemusician_foreach 
	switchoffatomic <checksum>
endscript

script unhidemusician 
	foreachin \{$body_parts
		do = unhidemusician_foreach}
endscript

script unhidemusician_foreach 
	switchonatomic <checksum>
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
		rebuildcurrentcasmodel
	endif
endscript

script mergepartintotemporarycasappearance 
	requireparams \{[
			part_list
		]
		all}
	part_list_instances = []
	getarraysize <part_list>
	i = 0
	begin
	if NOT getcasappearancepartinstance part = (<part_list> [<i>])
		<part_instance> = {}
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
		if structurecontains structure = (<part_list_instances> [<i>]) desc_id
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
		repeat <array_size>
		rebuildcurrentcasmodel
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

script get_appearance_checksum 
	requireparams \{[
			appearance
			instrument
			mic
		]
		all}
	generatechecksumfromstruct \{structname = appearance}
	appearance_checksum = <structure_checksum>
	if gotparam \{instrument}
		appearance_checksum = (<appearance_checksum> + <instrument>)
	endif
	if (<mic> > 0)
		appearance_checksum = (<appearance_checksum> + mic)
	endif
	return new_appearance_checksum = <appearance_checksum>
endscript
