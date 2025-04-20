
script create_model_from_appearance 
	cas_get_required_character_type
	if NOT gotparam editable_list
		build_master_editable_list character_type = <required_character_type>
		editable_list = <master_editable_list>
	endif
	LockCurrentSkaterProfileIndex 1
	modelclearallgeoms
	if gotparam remove_assets
		process_cas_command cas_command = modelremoveasset editable_list = <editable_list>
	endif
	debugprintappearance
	process_cas_command cas_command = modelrunscript editable_list = <editable_list> target = disqualify_script
	process_cas_command cas_command = modeladdgeom editable_list = <editable_list> loading_id = <loading_id> load_method = <load_method>
	process_cas_command cas_command = geomreplacetexture editable_list = <editable_list>
	if NOT gotparam viewerobj
		if gotparam skater_heap
			formattext checksumname = heap_name 'SkaterHeap%i' i = <skater_heap>
			mempushcontext <heap_name>
		endif
		process_cas_command cas_command = setskeleton editable_list = <editable_list> callbackscript = cas_skeleton_swapped
		process_cas_command cas_command = setragdoll editable_list = <editable_list>
		if gotparam skater_heap
			mempopcontext
		endif
	endif
	model_apply_scale
	process_cas_command cas_command = model_hide_geom editable_list = <editable_list>
	modelremovepolys
	process_cas_command cas_command = geommodulatecolor editable_list = <editable_list>
	set_uv_from_appearance
	modelexpandboundingsphere
	modelfinalize
	LockCurrentSkaterProfileIndex 0
endscript

script create_ped_model_from_appearance 
	LockCurrentSkaterProfileIndex \{1}
	modelclearallgeoms
	foreachineditablelist \{do = modeladdgeom}
	model_apply_scale
	modelremovepolys
	foreachineditablelist \{do = geommodulatecolor}
	modelfinalize
	LockCurrentSkaterProfileIndex \{0}
endscript

script replace_igc_skater_from_appearance 
	cas_get_required_character_type
	LockCurrentSkaterProfileIndex \{1}
	model_apply_scale
	build_master_editable_list character_type = <required_character_type>
	process_cas_command cas_command = model_hide_geom editable_list = <master_editable_list>
	process_cas_command cas_command = geommodulatecolor editable_list = <master_editable_list>
	set_uv_from_appearance
	process_cas_command cas_command = geomreplacetexture editable_list = <master_editable_list>
	process_cas_command cas_command = modelapplybonescale editable_list = <master_editable_list>
	modelfinalize
	LockCurrentSkaterProfileIndex \{0}
endscript

script model_apply_scale 
	<standard_scaling> = 1
	modelresetscale
	if (<standard_scaling> = 1)
		modelapplybodyshape
		modelapplyobjectscale
		process_cas_command \{cas_command = modelapplybonescale
			editable_list = $master_scaling_list}
	endif
endscript

script model_hide_geom 
	<invisible> = 0
	if NOT innetgame
		if appearanceallowscalingcheat
			if getglobalflag flag = $CHEAT_INVISIBLE
				<invisible> = 1
			endif
		endif
	endif
	hide_list = [
		CAS_CAREER_Head
		CAS_CAREER_Hair
		body
	]
	getarraysize <hide_list>
	i = 0
	begin
	if checksumequals a = <part> b = (<hide_list> [<i>])
		modelhidegeom part = <part> <invisible>
		return
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script preload_model_from_appearance 
	modelclearallgeoms
	cas_get_required_character_type
	build_master_editable_list character_type = <required_character_type>
	process_cas_command cas_command = modeladdgeom editable_list = <master_editable_list>
endscript

script color_model_from_appearance 
	cas_get_required_character_type
	build_master_editable_list character_type = <required_character_type>
	process_cas_command cas_command = geommodulatecolor editable_list = <master_editable_list>
endscript

script scale_model_from_appearance 
	model_apply_scale
endscript

script hide_model_from_appearance 
	cas_get_required_character_type
	build_master_editable_list character_type = <required_character_type>
	process_cas_command cas_command = model_hide_geom editable_list = <master_editable_list>
endscript

script set_uv_from_appearance 
	cas_get_required_character_type
	if gotparam \{required_character_type}
		getarraysize \{$master_uv_list}
		<index> = 0
		begin
		ResolveCharacterPart part = (($master_uv_list [<index>]).part) character_type = <required_character_type>
		part = <resolved_part>
		ResolveCharacterPart part = (($master_uv_list [<index>]).parent_part) character_type = <required_character_type>
		parent_part = <resolved_part>
		geomsetuvmatrix part = <part> parent_part = <parent_part>
		<index> = (<index> + 1)
		repeat <array_size>
	endif
endscript

script process_cas_command 
	foreachin <editable_list> do = <cas_command> params = <...>
endscript

script cas_get_required_character_type 
	modelappearancemembfunc \{func = getchecksum
		params = {
			field = required_character_type
		}}
	if NOT gotparam \{required_character_type}
		required_character_type = CAS_CAREER
	endif
	return required_character_type = <required_character_type>
endscript
cas_using_temp_geoms = 0

script cas_push_temp_geoms \{skater = 0}
	requireparams \{[
			heap
			skater
		]
		all}
	if ($cas_using_temp_geoms = 1)
		scriptassert \{'Already using temp geoms'}
	endif
	GetCurrentSkaterProfileIndex
	RefreshSkaterModel {
		skater = <skater>
		profile = <currentskaterprofileindex>
		unload_id = cas_temp_parts
		geom_heap = <heap>
		buildscriptparams = {
			loading_id = cas_temp_parts
			load_method = get_then_load
			undo_replace_first
		}
	}
	change \{cas_using_temp_geoms = 1}
endscript

script cas_commit_temp_geoms \{skater = 0}
	requireparams \{[
			skater
		]
		all}
	if ($cas_using_temp_geoms = 0)
		scriptassert \{'Not using temp geoms'}
	endif
	GetCurrentSkaterProfileIndex
	RefreshSkaterModel {
		skater = <skater>
		profile = <currentskaterprofileindex>
		buildscriptparams = {
			load_method = load_only
		}
	}
	change \{cas_using_temp_geoms = 0}
endscript

script cas_pop_temp_geoms skater = 0
	requireparams [skater] all
	if ($cas_using_temp_geoms = 0)
		scriptassert 'Not using temp geoms'
	endif
	GetCurrentSkaterProfileIndex
	if gotparam force_load
		load_method = load_only
	else
		load_method = get_only
		unload_id = cas_temp_parts
	endif
	RefreshSkaterModel {
		skater = <skater>
		profile = <currentskaterprofileindex>
		unload_id = <unload_id>
		buildscriptparams = {
			load_method = <load_method>
			undo_replace_first
		}
	}
	change cas_using_temp_geoms = 0
endscript

script cas_find_tex_swap_parts tex_swap_parts = []
	requireparams [appearance part_list] all
	getarraysize <part_list>
	i = 0
	begin
	if structurecontains structure = (<part_list> [<i>]) part
		part_name = (<part_list> [<i>].part)
		if structurecontains structure = <appearance> <part_name>
			part_desc = ((<appearance>).<part_name>)
			if structurecontains structure = <part_desc> desc_id
				if cas_has_tex_replace part = <part_name> desc_id = ((<part_desc>).desc_id)
					if NOT arraycontains array = <tex_swap_parts> contains = <part_name>
						ve_convert_checksum_to_array checksum = <part_name>
						tex_swap_parts = (<tex_swap_parts> + <checksum_array>)
					endif
				endif
			endif
		endif
		if structurecontains structure = (<part_list> [<i>]) desc_id
			if cas_has_tex_replace part = <part_name> desc_id = ((<part_list> [<i>]).desc_id)
				if NOT arraycontains array = <tex_swap_parts> contains = <part_name>
					ve_convert_checksum_to_array checksum = <part_name>
					tex_swap_parts = (<tex_swap_parts> + <checksum_array>)
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return tex_swap_parts = <tex_swap_parts>
endscript

script cas_has_tex_replace 
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if ((gotparam replace) || (gotparam replace1) || (gotparam replace2) || (gotparam replace3))
		return \{true}
	endif
	return \{false}
endscript
