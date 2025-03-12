
script getcurrentcasobject 
	if cas_player_has_character_object player = ($cas_current_player)
		return true cas_object = <character_object>
	endif
	return \{false}
endscript

script getcasappearance 
	return true appearance = ($cas_current_appearance)
endscript

script getcasappearancepartinstance \{part = !q1768515945}
	resolvebodyspecificpartinappearance part = <part>
	if structurecontains structure = ($cas_current_appearance) <part>
		app_struct = (($cas_current_appearance).<part>)
		if structurecontains structure = <app_struct> desc_id
			return true part_instance = (<app_struct>)
		endif
	endif
	return \{false}
endscript

script setcasappearancepartinstance \{part = !q1768515945
		part_instance = 0x69696969}
	resolvebodyspecificpartinappearance part = <part>
	addparam name = <part> structure_name = part_struct value = <part_instance>
	change cas_current_appearance = {
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
		change cas_current_appearance = <newstruct>
		case clearpart
		newstruct = ($cas_current_appearance)
		removecomponent structure_name = newstruct name = <part>
		change cas_current_appearance = <newstruct>
		case hidegeom
		hide_geom = (<targetparams>.hide_geom)
		if structurecontains structure = ($cas_current_appearance) <part>
			newstruct = {
				(($cas_current_appearance).<part>)
				hide_geom = <hide_geom>
			}
			updatestructelement struct = $cas_current_appearance element = <part> value = <newstruct>
			change cas_current_appearance = <newstruct>
		endif
		default
		scriptassert 'EditCASAppearance - %s not supported' s = <target>
	endswitch
endscript

script add_default_chosen_materials_to_newstruct \{part = !q1768515945
		newstruct = 0x69696969}
	if NOT getactualcasoptionstruct part = <part> desc_id = (<newstruct>.desc_id)
		scriptassert '%s %t not found' s = <part> t = (<newstruct>.desc_id)
	endif
	if gotparam \{chosen_materials}
		return newstruct = {
			<newstruct>
			chosen_materials = <chosen_materials>
		}
	endif
endscript

script printcurrentappearance 
	reorderstructforcas struct = ($cas_current_appearance)
	printcompactstruct <out>
endscript

script getcasmaterialvalue \{part = !q1768515945
		material = !q1768515945}
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

script setcasappearancematerial \{part = !q1768515945
		material = !q1768515945}
	requireparams \{[
			value
		]
		all}
	modelbuilder_check_lock
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

script getcaspartmaterials \{part = !q1768515945}
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

script getcaspartswatches \{part = !q1768515945}
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

script setcasappearancebones \{part = !q1768515945
		bones = 0x69696969}
	modelbuilder_check_lock
	if structurecontains structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		appendstruct struct = cas_current_appearance field = <part> params = {<str> bones = <bones>} globalstruct
	endif
endscript

script setcasappearancecap \{part = !q1768515945}
	modelbuilder_check_lock
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

script getcasappearancecap \{part = !q1768515945}
	if NOT structurecontains structure = ($cas_current_appearance) <part>
		scriptassert qs(0x1136de11) p = <part>
	endif
	<part_struct> = ($cas_current_appearance.<part>)
	if structurecontains structure = <part_struct> cap
		return true cap = (<part_struct>.cap)
	else
		return \{false
			cap = [
			]}
	endif
endscript

script setcasappearancecapmakeup \{base_tex = !q1768515945
		post_layer = !a1768515945}
	getcasappearancecap \{part = cas_body}
	getarraysize <cap>
	if (<array_size> = 0)
		setcasappearancecap part = cas_body cap = [{base_tex = <base_tex> post_layer = <post_layer> layers = <layers>}]
		return
	endif
	<i> = 0
	begin
	<cap_entry> = (<cap> [<i>])
	if structurecontains structure = <cap_entry> base_tex
		if ((<cap_entry>.base_tex) = <base_tex>)
			setarrayelement arrayname = cap index = <i> newvalue = {base_tex = <base_tex> post_layer = <post_layer> layers = <layers>}
			setcasappearancecap part = cas_body cap = <cap>
			return
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	addarrayelement array = <cap> element = {base_tex = <base_tex> post_layer = <post_layer> layers = <layers>}
	setcasappearancecap part = cas_body cap = <array>
endscript

script cas_set_cap_layer_from_preset \{part = !q1768515945
		base_tex = !q1768515945}
	getcasappearancecap \{part = cas_body}
	getarraysize <cap>
	if (<array_size> > 0)
		<i> = 0
		begin
		if ((<cap> [<i>]).base_tex = <base_tex>)
			if gotparam \{new_layers}
				printf 'cas_set_cap_layer_from_preset %t - Setting existing' t = <base_tex>
				setarrayelement arrayname = cap index = <i> newvalue = {
					(<cap> [<i>])
					layers = <new_layers>
				}
				setcasappearancecap part = <part> cap = <cap>
			else
				printf 'cas_set_cap_layer_from_preset %t - Removing existing' t = <base_tex>
				remove_layers_struct_from_cap part = <part> cap = <cap> cap_index = <i>
			endif
			return
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if gotparam \{new_layers}
		printf 'cas_set_cap_layer_from_preset %t - Adding new' t = <base_tex>
		addarrayelement array = <cap> element = {
			base_tex = <base_tex>
			layers = <new_layers>
		}
		setcasappearancecap part = <part> cap = <array>
	else
		printf 'cas_set_cap_layer_from_preset %t - Nothing to delete' t = <base_tex>
	endif
endscript

script cas_merge_in_cap_layers \{part = !q1768515945
		base_tex = !q1768515945
		merge_in = !a1768515945}
	getarraysize <merge_in>
	if (<array_size> > 0)
		<i> = 0
		begin
		if ((<merge_in> [<i>]).base_tex = <base_tex>)
			if structurecontains structure = (<merge_in> [<i>]) layers
				cas_set_cap_layer_from_preset {
					part = <part>
					base_tex = <base_tex>
					new_layers = ((<merge_in> [<i>]).layers)
				}
				return \{true}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	cas_set_cap_layer_from_preset {
		part = <part>
		base_tex = <base_tex>
	}
	return \{false}
endscript

script setcasappearancecaptattoo \{tattoos = !a1768515945
		div_ids = !a1768515945
		part = cas_body}
	getarraysize <div_ids>
	<i> = 0
	begin
	if get_div_info part = <part> div_id = (<div_ids> [<i>])
		cas_merge_in_cap_layers {
			part = <part>
			base_tex = <base_tex>
			merge_in = <tattoos>
		}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script setcasappearancepresets \{presets = !a1768515945}
	modelbuilder_check_lock
	change cas_current_appearance = {
		($cas_current_appearance)
		presets = <presets>
	}
endscript

script getcasappearancepresets \{presets = !a1768515945}
	if structurecontains structure = ($cas_current_appearance) presets
		return true presets = ($cas_current_appearance.presets)
	else
		return \{false
			presets = [
			]}
	endif
endscript

script setcasappearance \{appearance = 0x69696969}
	modelbuilder_check_lock
	verifycapprofile profile = {appearance = <appearance>} allowlocked
	change cas_current_appearance = {<appearance>}
endscript

script hideinstrument 
	obj_setintegertag \{tag_name = instrument_hidden
		integer_value = 1}
	obj_getchecksumtag \{tag_name = instrument}
	if (<checksum_value> != none)
		foreachin (($instrument_part_sets).<checksum_value>) do = hideinstrument_foreach
	endif
endscript

script hideinstrument_foreach 
	switchoffatomic <checksum>
endscript

script unhideinstrument 
	obj_setintegertag \{tag_name = instrument_hidden
		integer_value = 0}
	obj_getchecksumtag \{tag_name = instrument}
	if (<checksum_value> != none)
		foreachin (($instrument_part_sets).<checksum_value>) do = unhideinstrument_foreach
	endif
endscript

script unhideinstrument_foreach 
	switchonatomic <checksum>
endscript

script hidemusician 
	foreachin \{$body_parts
		do = hidemusician_foreach}
	obj_getid
	character_hide_particle_systems object_name = <objid>
endscript

script hidemusician_foreach 
	switchoffatomic <checksum>
endscript

script unhidemusician 
	foreachin \{$body_parts
		do = unhidemusician_foreach}
	obj_getid
	character_unhide_particle_systems object_name = <objid>
endscript

script unhidemusician_foreach 
	switchonatomic <checksum>
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
		updatecurrentcasmodel \{buildscript = modelbuilder_update_colors}
	elseif NOT gotparam \{no_rebuild}
		rebuildcurrentcasmodel
	endif
endscript

script mergepartintotemporarycasappearance \{part_list = !a1768515945
		merge_presets = false}
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
	old_presets = {}
	if structurecontains \{structure = $cas_current_appearance
			presets}
		old_presets = ($cas_current_appearance.presets)
	endif
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
		if (<merge_presets> = true)
			change cas_current_appearance = {($cas_current_appearance) presets = <old_presets>}
		endif
		rebuildcurrentcasmodel
	endif
endscript

script selective_restore_top_temporary_appearance \{parts = !a1768515945}
	getarraysize ($cas_temporary_appearance_stack)
	<changed> = 0
	if (<array_size> > 0)
		old_appearance = (($cas_temporary_appearance_stack) [(<array_size> -1)])
		getarraysize <parts>
		i = 0
		begin
		<part> = (<parts> [<i>])
		resolvebodyspecificpartinappearance part = <part>
		if structurecontains structure = <old_appearance> <part>
			setcasappearancepartinstance part = <part> part_instance = (<old_appearance>.<part>)
			<changed> = 1
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if (<changed> = 1)
		return \{true}
	endif
	return \{false}
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
g_best_heap_score_iterative_bias = 0.01
g_best_heap_score_iterative_bias_index = 0

script get_best_heap_for_appearance \{appearance = 0x69696969
		instrument = !q1768515945}
	best_heap = none
	best_score = -1.0
	gethathairchoice
	filterappearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
	filterappearance appearance_name = appearance part_set = $hair_part_sets chosen_set = <hat_hair_choice>
	getarraysize \{$musician_heaps}
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
	repeat <array_size>
	change g_best_heap_score_iterative_bias_index = (($g_best_heap_score_iterative_bias_index) + 1)
	if (($g_best_heap_score_iterative_bias_index) = <array_size>)
		change \{g_best_heap_score_iterative_bias_index = 0}
	endif
	printstruct {best_heap = <best_heap> best_score = <best_score>}
	if (<best_score> < 0.0)
		scriptassert \{'No available heaps'}
	endif
	if casisassetstorageused name = <best_heap>
		scriptassert 'Asset storage %s is already used' s = <best_heap>
	endif
	return best_heap = <best_heap>
endscript

script get_appearance_heap_score \{appearance = 0x69696969
		heap_name = !q1768515945}
	if casisassetstorageused name = <heap_name>
		printf 'get_appearance_heap_score - %s is being used!' s = <heap_name>
		return \{score = -1.0}
	else
		cascompareassetstorage name = <heap_name> appearance = <appearance>
		return score = <comparevalue>
	endif
endscript

script get_appearance_checksum \{appearance = 0x69696969
		instrument = !q1768515945
		mic = !i1768515945}
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

script flushallcompositetexturesfromui 
	printscriptinfo \{'FlushAllCompositeTexturesFromUI'}
	flushallcompositetextures
	if scriptisrunning \{updatecurrentcasmodelspawned}
		printf \{'DEALING WITH AN ONGOING UPDATE!'}
		killspawnedscript \{name = updatecurrentcasmodelspawned}
		rebuildcurrentcasmodel instrument = ($cas_current_instrument)
	endif
endscript

script is_preset_type_in_appearance \{preset_type = !q1768515945}
	<appearance> = ($cas_current_appearance)
	if NOT structurecontains structure = <appearance> presets
		return \{false}
	endif
	<gender> = male
	cas_get_is_female player = ($cas_current_player)
	if (<is_female> = 1)
		<gender> = female
	endif
	if structurecontains structure = (<appearance>.presets) <preset_type>
		return true preset_index = (<appearance>.presets.<preset_type>.index) preset_list = ($<preset_type>.<gender>)
	else
		return \{false}
	endif
endscript

script add_preset_to_appearance \{preset_type = !q1768515945
		preset_index = !i1768515945}
	<appearance> = ($cas_current_appearance)
	if NOT structurecontains structure = <appearance> presets
		return \{false}
	endif
	<presets> = (<appearance>.presets)
	addparam structure_name = presets name = <preset_type> value = {index = <preset_index>}
	if (<preset_type> = car_presets_face)
		addparam structure_name = presets name = car_presets_original_face value = {index = <preset_index>}
	endif
	<appearance> = {<appearance> presets = <presets>}
	change cas_current_appearance = <appearance>
endscript

script remove_preset_from_appearance \{preset_type = !q1768515945}
	<appearance> = ($cas_current_appearance)
	if NOT structurecontains structure = <appearance> presets
		return \{false}
	endif
	<presets> = (<appearance>.presets)
	if NOT structurecontains structure = presets <preset_type>
		return
	endif
	removecomponent structure_name = presets name = <preset_type>
	<appearance> = {<appearance> presets = <presets>}
	change cas_current_appearance = <appearance>
endscript

script get_frontend_desc \{part = !q1768515945
		desc_id = !q1768515945}
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if gotparam \{frontend_desc}
			return true frontend_desc = <frontend_desc>
		endif
	endif
	return \{false}
endscript

script cas_apply_preset \{preset_type = !q1768515945
		preset_index = !i1768515945
		gender = !q1768515945}
	<new_preset> = (($<preset_type>.<gender>) [<preset_index>])
	<parts_list> = ($g_preset_parts_lists.<preset_type>)
	getarraysize <parts_list>
	if (<array_size> > 0)
		<i> = 0
		begin
		<cur_part> = (<parts_list> [<i>])
		if structurecontains structure = <new_preset> <cur_part>
			<part_struct> = (<new_preset>.<cur_part>)
			if (<cur_part> = cas_body)
				scriptassert \{'CAS_Body parts shouldn\'t be used on presets!'}
			else
				cas_add_item_to_appearance part = <cur_part> desc_id = (<part_struct>.desc_id) no_rebuild
				setcasappearancepartinstance part = <cur_part> part_instance = <part_struct>
			endif
		else
			editcasappearance {
				target = clearpart
				targetparams = {part = <cur_part>}
			}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if (<preset_type> = car_presets_face)
		<bone_settings> = {}
		if structurecontains structure = <new_preset> cas_body
			if structurecontains structure = (<new_preset>.cas_body) bones
				<bone_settings> = ((<new_preset>.cas_body).bones)
			endif
		endif
		setcasappearancebones part = cas_body bones = <bone_settings>
	endif
	if (<preset_type> = car_presets_face)
		cas_set_body_material_from_preset {
			preset = <new_preset>
			mat_name = skin
			default_value = skin_white3
		}
	endif
	if (<preset_type> = car_presets_body)
		cas_set_body_material_from_preset {
			preset = <new_preset>
			mat_name = nails
			default_value = grey_3
		}
	endif
	if (<preset_type> = car_presets_makeup)
		if structurecontains structure = <new_preset> post_layer
			if structurecontains structure = <new_preset> base_tex
				<base_tex> = (<new_preset>.base_tex)
				<post_layer> = (<new_preset>.post_layer)
				if structurecontains structure = <new_preset> layers
					setcasappearancecapmakeup base_tex = <base_tex> post_layer = <post_layer> layers = (<new_preset>.layers)
				else
					setcasappearancecapmakeup base_tex = <base_tex> post_layer = <post_layer>
				endif
			endif
		endif
	endif
	if (<preset_type> = car_presets_tattoo)
		if structurecontains structure = <new_preset> tattoos
			setcasappearancecaptattoo {
				tattoos = (<new_preset>.tattoos)
				div_ids = [body `left arm` `right arm`]
			}
		endif
	endif
	add_preset_to_appearance preset_type = <preset_type> preset_index = <preset_index>
endscript
