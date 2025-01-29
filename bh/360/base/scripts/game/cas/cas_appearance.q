
script GetCurrentCASObject 
	if cas_player_has_character_object player = ($cas_current_player)
		return true cas_object = <character_object>
	endif
	return \{false}
endscript

script GetCASAppearance 
	return true appearance = ($cas_current_appearance)
endscript

script GetCASAppearancePartInstance 
	RequireParams \{[
			part
		]
		all}
	ResolveBodySpecificPartInAppearance part = <part>
	if StructureContains structure = ($cas_current_appearance) <part>
		app_struct = (($cas_current_appearance).<part>)
		if StructureContains structure = <app_struct> desc_id
			return true part_instance = (<app_struct>)
		endif
	endif
	return \{false}
endscript

script SetCASAppearancePartInstance 
	RequireParams \{[
			part
			part_instance
		]
		all}
	ResolveBodySpecificPartInAppearance part = <part>
	AddParam name = <part> structure_name = part_struct value = <part_instance>
	Change cas_current_appearance = {($cas_current_appearance)
		<part_struct>}
endscript

script EditCASAppearance 
	CheckModelBuilderLock
	if checksumequals a = <target> b = SetGenre
		Change cas_current_appearance = {($cas_current_appearance) genre = (<targetParams>.genre)}
	else
		part = (<targetParams>.part)
		ResolveBodySpecificPartInAppearance part = <part>
		if checksumequals a = <target> b = SetPart
			newstruct = {desc_id = (<targetParams>.desc_id)}
			add_cap_array_to_part part = <part> newstruct = <newstruct>
			add_chosen_materials_to_part part = <part> newstruct = <newstruct>
			UpdateStructElement struct = $cas_current_appearance element = <part> value = <newstruct>
			Change cas_current_appearance = <newstruct>
		elseif checksumequals a = <target> b = ClearPart
			loc_appearance = ($cas_current_appearance)
			RemoveComponent structure_name = loc_appearance name = <part>
			Change cas_current_appearance = <loc_appearance>
		elseif checksumequals a = <target> b = HideGeom
			hide_geom = (<targetParams>.hide_geom)
			if StructureContains structure = ($cas_current_appearance) <part>
				newstruct = {(($cas_current_appearance).<part>)
					hide_geom = <hide_geom>}
				UpdateStructElement struct = $cas_current_appearance element = <part> value = <newstruct>
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
	if NOT GetActualCASOptionStruct part = <part> desc_id = (<newstruct>.desc_id)
		ScriptAssert '%s %t not found' s = <part> t = (<newstruct>.desc_id)
	endif
	if GotParam \{chosen_materials}
		newstruct = {<newstruct>
			chosen_materials = <chosen_materials>}
		return newstruct = <newstruct>
	endif
endscript

script RebuildCurrentCASModel instrument = ($cas_current_instrument)
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) instrument = <instrument> in_cas force_update = <force_update>
endscript

script UpdateCurrentCASModel instrument = ($cas_current_instrument)
	RequireParams \{[
			buildScript
		]
		all}
	if cas_queue_is_busy \{in_queue_too}
		printf \{'UpdateCurrentCASModel: Doing full refresh, CAS queue is already working'}
		RebuildCurrentCASModel instrument = <instrument>
		return
	endif
	killspawnedscript \{name = UpdateCurrentCASModelSpawned}
	spawnscriptnow UpdateCurrentCASModelSpawned params = {<...>}
endscript

script UpdateCurrentCASModelSpawned \{instrument = None
		flush_assets = 1
		cache = 1}
	printscriptinfo \{'UpdateCurrentCASModelSpawned'}
	ArchiveWaitLoading \{CAS
		async = 0}
	CasWaitForComposite
	if NOT ($cas_override_object = None)
		cache = 0
		cas_object = ($cas_override_object)
	else
		GetCurrentCASObject
	endif
	if GotParam \{cas_object}
		if CompositeObjectExists name = <cas_object>
			Change \{safe_to_free_cas_temporaries = 0}
			OnExitRun UpdateCurrentCASModelSpawned_Cleanup params = {flush_assets = <flush_assets>}
			<cas_object> :GetSingleTag LightGroup
			<cas_object> :GetSingleTag asset_heap
			appearance = ($cas_current_appearance)
			get_appearance_checksum {appearance = <appearance> instrument = <instrument> mic = 0}
			appearance_checksum = <new_appearance_checksum>
			GetHatHairChoice
			FilterAppearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
			FilterAppearance appearance_name = appearance part_set = $hair_part_sets chosen_set = <hat_hair_choice>
			buildscriptparams = {
				<buildscriptparams>
				temporary_heap = heap_cas_build
				instrument = <instrument>
				LightGroup = <LightGroup>
				hat_hair_choice = <hat_hair_choice>
				no_parts_added_or_removed
			}
			if (<cache> = 1)
				ArchiveWaitLoading \{cas_building_cache
					async = 0}
				CASCacheModel {
					async = 0
					appearance = <appearance>
					global_storage = <asset_heap>
					buildscriptparams = <buildscriptparams>
				}
			endif
			<cas_object> :SetTags appearance_checksum = <appearance_checksum>
			<cas_object> :ModelBuilder_Preload {
				async = 0
				appearance = <appearance>
				buildScript = <buildScript>
				buildscriptparams = <buildscriptparams>
			}
			<cas_object> :ModelBuilder_LoadAssets {
				async = 0
			}
			<cas_object> :ModelBuilder_ProcessAssets
			<cas_object> :ModelBuilder_Build {
				appearance = <appearance>
				buildScript = <buildScript>
				buildscriptparams = <buildscriptparams>
			}
			ForceInstanceUpdate
		endif
	endif
endscript

script UpdateCurrentCASModelSpawned_Cleanup 
	Change \{safe_to_free_cas_temporaries = 1}
	if (<flush_assets> = 1)
		CASTemporariesFlush
	endif
endscript

script printcurrentappearance 
	ReorderStructForCAS struct = ($cas_current_appearance)
	printcompactstruct <out>
endscript

script GetCASMaterialValue 
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
	return \{false}
endscript

script SetCASAppearanceMaterial 
	RequireParams \{[
			part
			material
			value
		]
		all}
	CheckModelBuilderLock
	if StructureContains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if StructureContains structure = <str> chosen_materials
			chosen_materials = (<str>.chosen_materials)
		else
			chosen_materials = {}
		endif
		UpdateStructElement struct = <chosen_materials> element = <material> value = <value>
		chosen_materials = {
			<chosen_materials> <newstruct>
		}
		AppendStruct struct = cas_current_appearance Field = <part> params = {<str> chosen_materials = <chosen_materials>} GlobalStruct
	endif
endscript

script GetCASPartMaterials 
	if NOT GetCASAppearancePartDescID part = <part>
		return \{false}
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if GotParam \{materials}
		GetArraySize <materials>
		if (<array_size> > 0)
			array = []
			i = 0
			begin
			Title = qs(0x1a32079f)
			if (<array_size> = 1)
				name = qs(0xaa2546c1)
			else
				FormatText TextName = name qs(0xdfd513db) d = (<i> + 1)
			endif
			if GotParam \{material_names}
				name = (<material_names> [<i>])
				Title = (<material_names> [<i>])
			endif
			FormatText checksumname = desc_id 'material%d' d = (<i> + 1)
			AddArrayElement array = <array> element = {desc_id = <desc_id> name = <name> Title = <Title>}
			i = (<i> + 1)
			repeat <array_size>
			return true part_materials = <array>
		endif
	else
		if GotParam \{material_groups}
			GetArraySize <material_groups>
			if (<array_size> > 0)
				array = []
				i = 0
				begin
				Title = qs(0x1a32079f)
				if (<array_size> = 1)
					name = qs(0xaa2546c1)
				else
					FormatText TextName = name qs(0xdfd513db) d = (<i> + 1)
				endif
				if StructureContains structure = (<material_groups> [<i>]) name
					name = ((<material_groups> [<i>]).name)
					Title = ((<material_groups> [<i>]).name)
				endif
				if StructureContains structure = (<material_groups> [<i>]) desc_id
					desc_id = ((<material_groups> [<i>]).desc_id)
				else
					FormatText checksumname = desc_id 'material%d' d = (<i> + 1)
				endif
				AddArrayElement array = <array> element = {desc_id = <desc_id> name = <name> Title = <Title>}
				i = (<i> + 1)
				repeat <array_size>
				return true part_materials = <array>
			endif
		else
			if GotParam \{modify_all_materials}
				name = qs(0xaa2546c1)
				Title = qs(0x1a32079f)
				if GotParam \{material_names}
					name = (<material_names> [0])
					Title = (<material_names> [0])
				endif
				return true part_materials = [{desc_id = material1 name = <name> Title = <Title>}]
			endif
		endif
		return \{false}
	endif
endscript

script GetCASPartSwatches 
	if NOT GetCASAppearancePartDescID part = <part>
		return \{false}
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	current_swatch_desc_id = <desc_id>
	if GotParam \{swatch_for}
		if NOT GetActualCASOptionStruct part = <part> desc_id = <swatch_for>
			return \{false}
		endif
	endif
	if GotParam \{swatch_list}
		GetArraySize <swatch_list>
		if (<array_size> > 0)
			array = []
			AddArrayElement array = <array> element = {desc_id = <desc_id>}
			i = 0
			begin
			AddArrayElement array = <array> element = {desc_id = (<swatch_list> [<i>])}
			i = (<i> + 1)
			repeat <array_size>
			return true part_swatches = <array> frontend_desc = <frontend_desc> current_swatch_desc_id = <current_swatch_desc_id>
		endif
	endif
	return \{false}
endscript

script SetCASAppearanceBones 
	printscriptinfo \{'SetCASAppearanceBones'}
	CheckModelBuilderLock
	if StructureContains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		AppendStruct struct = cas_current_appearance Field = <part> params = {<str> bones = <bones>} GlobalStruct
	endif
endscript

script SetCASAppearanceCAP 
	CheckModelBuilderLock
	if StructureContains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if GotParam \{CAP}
			AppendStruct struct = cas_current_appearance Field = <part> params = {<str> CAP = <CAP>} GlobalStruct
		else
			RemoveComponent \{name = CAP
				structure_name = str}
			AppendStruct struct = cas_current_appearance Field = <part> params = {<str>} GlobalStruct
		endif
	endif
endscript

script SetCASAppearance 
	CheckModelBuilderLock
	VerifyCAPProfile Profile = {appearance = <appearance>} AllowLocked
	Change cas_current_appearance = {<appearance>}
endscript

script HideInstrument 
	ForEachIn (($instrument_part_sets).guitar) do = HideInstrument_Foreach
	ForEachIn (($instrument_part_sets).bass) do = HideInstrument_Foreach
	ForEachIn (($instrument_part_sets).Drum) do = HideInstrument_Foreach
	ForEachIn (($instrument_part_sets).vocals) do = HideInstrument_Foreach
endscript

script HideInstrument_Foreach 
	SwitchOffAtomic <checksum>
endscript

script UnHideInstrument 
	ForEachIn (($instrument_part_sets).guitar) do = UnhideInstrument_Foreach
	ForEachIn (($instrument_part_sets).bass) do = UnhideInstrument_Foreach
	ForEachIn (($instrument_part_sets).Drum) do = UnhideInstrument_Foreach
	ForEachIn (($instrument_part_sets).vocals) do = UnhideInstrument_Foreach
endscript

script UnhideInstrument_Foreach 
	SwitchOnAtomic <checksum>
endscript

script HideMusician 
	ForEachIn \{$body_parts
		do = HideMusician_Foreach}
endscript

script HideMusician_Foreach 
	SwitchOffAtomic <checksum>
endscript

script UnHideMusician 
	ForEachIn \{$body_parts
		do = UnHideMusician_Foreach}
endscript

script UnHideMusician_Foreach 
	SwitchOnAtomic <checksum>
endscript

script CasWaitForComposite 
	if ModelBuilderIsCompositingActive
		begin
		printf \{'Waiting for Compositing...'}
		wait \{1
			gameframe}
		if NOT ModelBuilderIsCompositingActive
			break
		endif
		repeat
	endif
endscript

script CasBlockForComposite 
	if ModelBuilderIsCompositingActive
		ModelBuilderBlockForCompositing
	endif
endscript

script PushTemporaryCASAppearance 
	AddArrayElement array = ($cas_temporary_appearance_stack) element = ($cas_current_appearance)
	Change cas_temporary_appearance_stack = <array>
endscript

script PrintTemporaryCASAppearanceStack 
	printcompactstruct ($cas_temporary_appearance_stack)
endscript

script PopTemporaryCASAppearance 
	GetArraySize ($cas_temporary_appearance_stack)
	if (<array_size> > 0)
		RemoveArrayElement array = ($cas_temporary_appearance_stack) index = (<array_size> -1)
		Change cas_temporary_appearance_stack = <array>
	endif
endscript

script RestoreTopTemporaryCASAppearance 
	GetArraySize ($cas_temporary_appearance_stack)
	if (<array_size> > 0)
		Change cas_current_appearance = (($cas_temporary_appearance_stack) [(<array_size> -1)])
	endif
	if GotParam \{update_cap}
		UpdateCASModelCAP part = <part>
	elseif GotParam \{update_color}
		UpdateCurrentCASModel \{buildScript = color_model_from_appearance}
	else
		RebuildCurrentCASModel
	endif
endscript

script MergePartIntoTemporaryCASAppearance 
	RequireParams \{[
			part_list
		]
		all}
	part_list_instances = []
	GetArraySize <part_list>
	i = 0
	begin
	if NOT GetCASAppearancePartInstance part = (<part_list> [<i>])
		<part_instance> = {}
	endif
	AddArrayElement array = <part_list_instances> element = <part_instance>
	part_list_instances = <array>
	i = (<i> + 1)
	repeat <array_size>
	GetArraySize ($cas_temporary_appearance_stack)
	if (<array_size> > 0)
		Change cas_current_appearance = (($cas_temporary_appearance_stack) [(<array_size> -1)])
		RemoveArrayElement array = ($cas_temporary_appearance_stack) index = (<array_size> -1)
		Change cas_temporary_appearance_stack = <array>
		GetArraySize <part_list>
		i = 0
		begin
		if StructureContains structure = (<part_list_instances> [<i>]) desc_id
			SetCASAppearancePartInstance part = (<part_list> [<i>]) part_instance = (<part_list_instances> [<i>])
		endif
		if ((<part_list> [<i>]) = CAS_Hair)
			ResolveBodySpecificPartInAppearance \{part = CAS_Hat_Hair}
			EditCASAppearance {
				target = ClearPart
				targetParams = {part = <part>}
			}
			if GetCASAppearancePartInstance \{part = CAS_Hat}
				ResolveBodySpecificPartInAppearance \{part = CAS_Hat}
				EditCASAppearance {
					target = ClearPart
					targetParams = {part = <part>}
				}
				cas_add_item_to_appearance part = <part> desc_id = (<part_instance>.desc_id) no_rebuild
				SetCASAppearancePartInstance part = <part> part_instance = <part_instance>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
		RebuildCurrentCASModel
	endif
endscript

script CompareTopTemporaryCASAppearance 
	GetArraySize ($cas_temporary_appearance_stack)
	if CompareStructs struct1 = (($cas_temporary_appearance_stack) [(<array_size> -1)]) struct2 = ($cas_current_appearance)
		return \{true}
	else
		return \{false}
	endif
endscript

script generic_exit_restore 
	RestoreTopTemporaryCASAppearance
	ui_event \{event = menu_back}
endscript

script generic_exit_restore_refresh 
	RestoreTopTemporaryCASAppearance
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
	repeat <array_size>
	printstruct {best_heap = <best_heap> best_score = <best_score>}
	if (<best_score> < 0.0)
		ScriptAssert \{'No available heaps'}
	endif
	if CASIsAssetStorageUsed name = <best_heap>
		ScriptAssert 'Asset storage %s is already used' s = <best_heap>
	endif
	return best_heap = <best_heap>
endscript

script get_appearance_heap_score 
	if CASIsAssetStorageUsed name = <heap_name>
		printf 'get_appearance_heap_score - %s is being used!' s = <heap_name>
		return \{score = -1.0}
	else
		CASCompareAssetStorage name = <heap_name> appearance = <appearance>
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
	GenerateChecksumFromStruct \{StructName = appearance}
	appearance_checksum = <structure_checksum>
	if GotParam \{instrument}
		appearance_checksum = (<appearance_checksum> + <instrument>)
	endif
	if (<mic> > 0)
		appearance_checksum = (<appearance_checksum> + mic)
	endif
	return new_appearance_checksum = <appearance_checksum>
endscript

script FlushAllCompositeTexturesFromUI 
	printscriptinfo \{'FlushAllCompositeTexturesFromUI'}
	FlushAllCompositeTextures
	if ScriptIsRunning \{UpdateCurrentCASModelSpawned}
		printf \{'DEALING WITH AN ONGOING UPDATE!'}
		killspawnedscript \{name = UpdateCurrentCASModelSpawned}
		RebuildCurrentCASModel instrument = ($cas_current_instrument)
	endif
endscript
