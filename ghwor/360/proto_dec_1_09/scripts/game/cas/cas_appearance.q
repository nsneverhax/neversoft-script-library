
script getcurrentcasobject 
	if cas_player_has_character_object Player = ($cas_current_player)
		return true cas_object = <character_object>
	endif
	return \{FALSE}
endscript

script getcasappearance 
	return true appearance = ($cas_current_appearance)
endscript

script getcasappearancepartinstance \{part = !q1768515945}
	resolvebodyspecificpartinappearance part = <part>
	if StructureContains structure = ($cas_current_appearance) <part>
		app_struct = (($cas_current_appearance).<part>)
		if StructureContains structure = <app_struct> desc_id
			return true part_instance = (<app_struct>)
		endif
	endif
	return \{FALSE}
endscript

script setcasappearancepartinstance \{part = !q1768515945
		part_instance = 0x69696969}
	resolvebodyspecificpartinappearance part = <part>
	AddParam Name = <part> structure_name = part_struct value = <part_instance>
	Change cas_current_appearance = {
		($cas_current_appearance)
		<part_struct>
	}
endscript

script editcasappearance \{target = !q1768515945
		targetparams = 0x69696969}
	modelbuilder_check_lock
	part = (<targetparams>.part)
	resolvebodyspecificpartinappearance part = <part>
	switch (<target>)
		case setpart
		newstruct = {desc_id = (<targetparams>.desc_id)}
		add_default_cap_array_to_newstruct part = <part> newstruct = <newstruct>
		add_default_chosen_materials_to_newstruct part = <part> newstruct = <newstruct>
		updatestructelement struct = $cas_current_appearance element = <part> value = <newstruct>
		Change cas_current_appearance = <newstruct>
		case clearpart
		newstruct = ($cas_current_appearance)
		RemoveComponent structure_name = newstruct Name = <part>
		Change cas_current_appearance = <newstruct>
		case hidegeom
		hide_geom = (<targetparams>.hide_geom)
		if StructureContains structure = ($cas_current_appearance) <part>
			newstruct = {
				(($cas_current_appearance).<part>)
				hide_geom = <hide_geom>
			}
			updatestructelement struct = $cas_current_appearance element = <part> value = <newstruct>
			Change cas_current_appearance = <newstruct>
		endif
		default
		ScriptAssert 'EditCASAppearance - %s not supported' s = <target>
	endswitch
endscript

script add_default_chosen_materials_to_newstruct \{part = !q1768515945
		newstruct = 0x69696969}
	if NOT getactualcasoptionstruct part = <part> desc_id = (<newstruct>.desc_id)
		ScriptAssert '%s %t not found' s = <part> t = (<newstruct>.desc_id)
	endif
	if GotParam \{chosen_materials}
		return newstruct = {
			<newstruct>
			chosen_materials = <chosen_materials>
		}
	endif
endscript

script rebuildcurrentcasmodel {
		0x54 instrument = ($cas_current_instrument)
	}
	cas_queue_add_request {
		appearance = ($cas_current_appearance)
		Player = ($cas_current_player)
		instrument = <instrument>
		force_update = <force_update>
		in_cas
	}
endscript

script updatecurrentcasmodel {
		0x54 buildscript
		0x59 buildscriptparams = {}
		0x54 instrument = ($cas_current_instrument)
		0x52 flush_assets = 1
		0x52 cache = 1
	}
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
	SpawnScriptNow updatecurrentcasmodelspawned params = {
		buildscript = <buildscript>
		buildscriptparams = <buildscriptparams>
		instrument = <instrument>
		flush_assets = <flush_assets>
		cache = <cache>
	}
endscript

script updatecurrentcasmodelspawned \{instrument = !q1768515945
		flush_assets = !i1768515945
		cache = !i1768515945}
	printscriptinfo \{'UpdateCurrentCASModelSpawned'}
	archivewaitloading \{cas
		async = 0}
	caswaitforcomposite
	if NOT ($cas_override_object = None)
		<cache> = 0
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
			gethathairchoice
			filterappearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
			filterappearance appearance_name = appearance part_set = $hair_part_sets chosen_set = <hat_hair_choice>
			if (<instrument> = drum)
				use_body_skeleton2 = true
			endif
			buildscriptparams = {
				<buildscriptparams>
				temporary_heap = heap_cas_build
				instrument = <instrument>
				LightGroup = <LightGroup>
				hat_hair_choice = <hat_hair_choice>
				use_body_skeleton2 = <use_body_skeleton2>
				no_parts_added_or_removed
			}
			if (<cache> = 1)
				cascachemodel {
					async = 0
					appearance = <appearance>
					global_storage = <asset_heap>
					buildscript = <buildscript>
					buildscriptparams = <buildscriptparams>
				}
			endif
			<cas_object> :SetTags appearance_checksum = <new_appearance_checksum>
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

script updatecurrentcasmodelspawned_cleanup \{flush_assets = !i1768515945}
	Change \{safe_to_free_cas_temporaries = 1}
	if (<flush_assets> = 1)
		castemporariesflush
	endif
endscript

script printcurrentappearance 
	reorderstructforcas struct = ($cas_current_appearance)
	printcompactstruct <out>
endscript

script getcasmaterialvalue \{part = !q1768515945
		material = !q1768515945}
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

script setcasappearancematerial \{part = !q1768515945
		material = !q1768515945}
	RequireParams \{[
			value
		]
		all}
	modelbuilder_check_lock
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

script getcaspartmaterials \{part = !q1768515945}
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

script getcaspartswatches \{part = !q1768515945}
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

script setcasappearancebones \{part = !q1768515945
		bones = 0x69696969}
	printscriptinfo \{'SetCASAppearanceBones'}
	modelbuilder_check_lock
	if StructureContains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		appendstruct struct = cas_current_appearance Field = <part> params = {<str> bones = <bones>} globalstruct
	endif
endscript

script setcasappearancecap \{part = !q1768515945}
	modelbuilder_check_lock
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

script getcasappearancecap \{part = !q1768515945}
	if NOT StructureContains structure = ($cas_current_appearance) <part>
		ScriptAssert qs(0x1136de11) p = <part>
	endif
	<part_struct> = ($cas_current_appearance.<part>)
	if StructureContains structure = <part_struct> cap
		return true cap = (<part_struct>.cap)
	else
		return \{FALSE
			cap = [
			]}
	endif
endscript

script setcasappearancecapmakeup \{base_tex = !q1768515945
		post_layer = !a1768515945
		layers = [
		]}
	getcasappearancecap \{part = cas_body}
	GetArraySize <cap>
	if (<array_Size> = 0)
		setcasappearancecap part = cas_body cap = [{base_tex = <base_tex> post_layer = <post_layer> layers = <layers>}]
		return
	endif
	<i> = 0
	begin
	<cap_entry> = (<cap> [<i>])
	if StructureContains structure = <cap_entry> post_layer
		SetArrayElement ArrayName = cap index = <i> NewValue = {base_tex = <base_tex> post_layer = <post_layer> layers = <layers>}
		setcasappearancecap part = cas_body cap = <cap>
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script setcasappearancecaptattoo \{tattoos = !a1768515945}
	cap_new_design_worker \{part = cas_body
		div_id = Body}
	cap_new_design_worker \{part = cas_body
		div_id = `right	arm`}
	cap_new_design_worker \{part = cas_body
		div_id = `left	arm`}
	getcasappearancecap \{part = cas_body}
	GetArraySize <tattoos>
	if (<array_Size> = 0)
		return
	endif
	<i> = 0
	begin
	<0x87347ac1> = (<tattoos> [<i>])
	AddArrayElement array = <cap> element = <0x87347ac1>
	<cap> = <array>
	<i> = (<i> + 1)
	repeat <array_Size>
	setcasappearancecap part = cas_body cap = <cap>
endscript

script setcasappearancepresets \{presets = !a1768515945}
	modelbuilder_check_lock
	Change cas_current_appearance = {
		($cas_current_appearance)
		presets = <presets>
	}
endscript

script getcasappearancepresets \{presets = !a1768515945}
	if StructureContains structure = ($cas_current_appearance) presets
		return true presets = ($cas_current_appearance.presets)
	else
		return \{FALSE
			presets = [
			]}
	endif
endscript

script setcasappearance \{appearance = 0x69696969}
	modelbuilder_check_lock
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
		updatecurrentcasmodel \{buildscript = modelbuilder_update_colors}
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
g_best_heap_score_iterative_bias = 0.01
g_best_heap_score_iterative_bias_index = 0

script get_best_heap_for_appearance \{appearance = 0x69696969
		instrument = !q1768515945}
	best_heap = None
	best_score = -1.0
	gethathairchoice
	filterappearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
	filterappearance appearance_name = appearance part_set = $hair_part_sets chosen_set = <hat_hair_choice>
	GetArraySize \{$musician_heaps}
	i = 0
	begin
	heap_name = ($musician_heaps [<i>])
	get_appearance_heap_score appearance = <appearance> heap_name = <heap_name>
	if (($g_best_heap_score_iterative_bias_index) = <i>)
		<score> = (<score> + ($g_best_heap_score_iterative_bias))
	endif
	if (<score> >= <best_score>)
		best_score = <score>
		best_heap = <heap_name>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	Change g_best_heap_score_iterative_bias_index = (($g_best_heap_score_iterative_bias_index) + 1)
	if (($g_best_heap_score_iterative_bias_index) = <array_Size>)
		Change \{g_best_heap_score_iterative_bias_index = 0}
	endif
	printstruct {best_heap = <best_heap> best_score = <best_score>}
	if (<best_score> < 0.0)
		ScriptAssert \{'No available heaps'}
	endif
	if casisassetstorageused Name = <best_heap>
		ScriptAssert 'Asset storage %s is already used' s = <best_heap>
	endif
	return best_heap = <best_heap>
endscript

script get_appearance_heap_score \{appearance = 0x69696969
		heap_name = !q1768515945}
	if casisassetstorageused Name = <heap_name>
		printf 'get_appearance_heap_score - %s is being used!' s = <heap_name>
		return \{score = -1.0}
	else
		cascompareassetstorage Name = <heap_name> appearance = <appearance>
		return score = <comparevalue>
	endif
endscript

script get_appearance_checksum \{appearance = 0x69696969
		instrument = !q1768515945
		mic = !i1768515945}
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

script flushallcompositetexturesfromui 
	printscriptinfo \{'FlushAllCompositeTexturesFromUI'}
	flushallcompositetextures
	if ScriptIsRunning \{updatecurrentcasmodelspawned}
		printf \{'DEALING WITH AN ONGOING UPDATE!'}
		KillSpawnedScript \{Name = updatecurrentcasmodelspawned}
		rebuildcurrentcasmodel instrument = ($cas_current_instrument)
	endif
endscript

script is_preset_type_in_appearance \{preset_type = !q1768515945}
	<appearance> = ($cas_current_appearance)
	if NOT StructureContains structure = <appearance> presets
		return \{FALSE}
	endif
	<gender> = male
	cas_get_is_female Player = ($cas_current_player)
	if (<is_female> = 1)
		<gender> = female
	endif
	if StructureContains structure = (<appearance>.presets) <preset_type>
		return true preset_index = (<appearance>.presets.<preset_type>.index) preset_list = ($<preset_type>.<gender>)
	else
		return \{FALSE}
	endif
endscript

script add_preset_to_appearance \{preset_type = !q1768515945
		preset_index = !i1768515945}
	<appearance> = ($cas_current_appearance)
	if NOT StructureContains structure = <appearance> presets
		return \{FALSE}
	endif
	<presets> = (<appearance>.presets)
	AddParam structure_name = presets Name = <preset_type> value = {index = <preset_index>}
	<appearance> = {<appearance> presets = <presets>}
	Change cas_current_appearance = <appearance>
endscript

script remove_preset_from_appearance \{preset_type = !q1768515945}
	<appearance> = ($cas_current_appearance)
	if NOT StructureContains structure = <appearance> presets
		return \{FALSE}
	endif
	<presets> = (<appearance>.presets)
	if NOT StructureContains structure = presets <preset_type>
		return
	endif
	RemoveComponent structure_name = presets Name = <preset_type>
	<appearance> = {<appearance> presets = <presets>}
	Change cas_current_appearance = <appearance>
endscript
