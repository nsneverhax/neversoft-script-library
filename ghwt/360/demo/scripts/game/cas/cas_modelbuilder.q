test_16bit_cap = 0

script create_model_from_appearance 
	lockformodelbuilder \{lock = 1}
	if NOT gotparam \{hat_hair_choice}
		hat_hair_choice = hair
	endif
	if NOT gotparam \{instrument}
		instrument = none
	endif
	filterappearancepartset part_set = $instrument_part_sets chosen_set = <instrument>
	filterappearancepartset part_set = $hair_part_sets chosen_set = <hat_hair_choice>
	if NOT gotparam \{caching}
		getmodelbuilderskeleton
		getmodelbuilderragdoll
		if gotparam \{preload}
			modelrunscript \{scriptname = cas_reset_bones}
			modelrunscript scriptname = cas_skeleton_reset params = {skeleton = <modelbuilder_skeleton>}
			modelrunscript scriptname = cas_ragdoll_reset params = {skeleton = <modelbuilder_skeleton> ragdoll = <modelbuilder_ragdoll>}
		endif
		modelclearallgeoms
	endif
	foreachincas \{do = modeladdgeom}
	foreachincas \{do = geomreplacetexture}
	foreachincas \{do = geomtexturereplacecleanup}
	if NOT gotparam \{viewerobj}
		if NOT gotparam \{preload}
			foreachincas \{do = modelreskinpart
				params = {
					scriptname = cas_part_reskin
				}}
			modelupdatemainrigforreskinning \{part = cas_body
				scriptname = cas_lowres_rig_reskin}
			foreachincas \{do = modelcopygeom
				params = {
					materials = $cas_reskin_materials
				}}
			foreachincas \{do = modeldeletereskintemporaries}
			foreachincas \{do = deformmainskeleton
				params = {
					scriptname = cas_main_skel_scale
				}}
		endif
	endif
	foreachincas \{do = geompolyremoval}
	foreachincas \{do = geomsetmaterialvariables}
	set_uv_from_appearance
	if gotparam \{new_object}
		modelexpandboundingsphere
	endif
	modelupdateskinningpolyremoval
	foreachincas \{do = createapiececomposite}
	if NOT gotparam \{caching}
		if NOT gotparam \{preload}
			getmodelbuilderappearance
			if (<instrument> = drum)
				modelrunscript scriptname = cas_merge_in_drummer_bones params = {skeleton = <modelbuilder_skeleton>}
			elseif ((<instrument> = guitar) || (<instrument> = bass))
				modelrunscript scriptname = cas_merge_in_guitar_ragdoll params = {skeleton = <modelbuilder_skeleton>}
			endif
			if NOT gotparam \{new_object}
				modelrunscript scriptname = cas_update_accessory_bones params = {appearance = <appearance>}
			endif
			modelrunscript \{scriptname = cas_update_pose}
			modelrunscript scriptname = cas_set_difference_anim params = {appearance = <appearance> instrument = <instrument>}
		endif
	endif
	lockformodelbuilder \{lock = 0}
endscript

script poly_removal_from_appearance 
	foreachincas \{do = geompolyremoval}
endscript

script create_ped_model_from_appearance 
	lockformodelbuilder \{lock = 1}
	modelclearallgeoms
	foreachineditablelist \{do = modeladdgeom}
	modelrunscript \{scriptname = cas_reset_bones}
	modelapplyobjectscale
	foreachineditablelist \{do = geompolyremoval}
	foreachineditablelist \{do = geomsetmaterialvariables}
	lockformodelbuilder \{lock = 0}
endscript

script color_model_from_appearance 
	foreachincas \{do = geomsetmaterialvariables}
endscript

script update_cap_part 
	createapiececomposite part = <part> incremental
endscript

script reskin_model_from_appearance 
	if NOT gotparam \{kill_objects}
		do_not_kill_flags = {do_not_kill}
	endif
	filterappearancepartset part_set = $instrument_part_sets chosen_set = <instrument>
	getmodelbuilderskeleton
	modelrunscript \{scriptname = cas_reset_bones}
	modelrunscript scriptname = cas_skeleton_reset params = {skeleton = <modelbuilder_skeleton>}
	foreachincas \{do = modelreskinpart
		params = {
			scriptname = cas_part_reskin
			force_reskin
		}}
	modelupdatemainrigforreskinning \{part = cas_body
		scriptname = cas_lowres_rig_reskin
		force_reskin}
	foreachincas \{do = modelcopygeom
		params = {
			materials = $cas_reskin_materials
		}}
	foreachincas do = modeldeletereskintemporaries params = <do_not_kill_flags>
	foreachincas \{do = deformmainskeleton
		params = {
			scriptname = cas_main_skel_scale
		}}
	getmodelbuilderappearance
	modelrunscript scriptname = cas_update_accessory_bones params = {appearance = <appearance> do_ragdoll = 0}
endscript

script set_uv_from_appearance 
	getarraysize \{$master_uv_list}
	if (<array_size> > 0)
		<index> = 0
		begin
		part = (($master_uv_list [<index>]).part)
		parent_part = (($master_uv_list [<index>]).parent_part)
		geomsetuvmatrix part = <part> parent_part = <parent_part>
		<index> = (<index> + 1)
		repeat <array_size>
	endif
endscript

script cas_set_difference_anim 
	if NOT get_part_key_from_appearance key = diff_anim appearance = <appearance> part = cas_female_shoes
		get_part_key_from_appearance key = diff_anim appearance = <appearance> part = cas_male_shoes
	endif
	if NOT gotparam \{diff_anim}
		getsingletag \{is_female}
		if gotparam \{is_female}
			if (<is_female> = 1)
				diff_anim_name = gh_rocker_female_empty_d
			else
				diff_anim_name = gh_rocker_male_empty_d
			endif
		endif
	else
		if NOT gotparam \{instrument}
			instrument = none
		endif
		if (<instrument> = drum)
			formattext checksumname = diff_anim_name 'GH_Drummer_%s' s = <diff_anim>
		else
			formattext checksumname = diff_anim_name 'GH_Rocker_%s' s = <diff_anim>
		endif
	endif
	if gotparam \{diff_anim_name}
		printf 'Clothing difference anim = %s' s = <diff_anim_name> donotresolve
		hero_add_clothing_difference_anim anim = <diff_anim_name>
	endif
endscript

script cas_update_pose 
	anim_updatepose
endscript

script lockformodelbuilder 
	change model_builder_lock = <lock>
endscript

script checkmodelbuilderlock 
	if NOT ($model_builder_lock = 0)
		scriptassert \{'Profile/appearance modification functions should not be called during a modelbuild'}
	endif
endscript

script buildcasmodel 
	requireparams \{[
			async
			buildscriptparams
			appearance
		]
		all}
	obj_getid
	manglechecksums a = <objid> b = ragdollupdatescript
	ragdoll_script_id = <mangled_id>
	killspawnedscript id = <ragdoll_script_id>
	printscriptinfo 'BuildCASModel %a %o' a = <async> o = <objid> donotresolve
	getsingletag \{asset_heap}
	getsingletag \{lightgroup}
	get_hat_hair_choice appearance = <appearance>
	buildscriptparams = {
		<buildscriptparams>
		lightgroup = <lightgroup>
		temporary_heap = heap_cas
		hat_hair_choice = <hat_hair_choice>
	}
	if gotparam \{use_cache}
		cascacheflushvram
		caswaitforunloads
		if gotparam \{cancelled}
			return \{false}
		endif
		cascachemodel {
			appearance = <appearance>
			buildscriptparams = <buildscriptparams>
			async = <async>
			global_storage = <asset_heap>
		}
		if NOT buildcasmodel_loadwait async = <async>
			return \{false}
		endif
		async = 0
	endif
	if (<async> = 0)
	else
		hide
	endif
	modelbuilder_preload {
		async = <async>
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	if NOT buildcasmodel_unloadwait async = <async>
		castemporariesflush
		return \{false}
	endif
	modelbuilder_loadassets {
		async = <async>
	}
	if NOT buildcasmodel_loadwait async = <async>
		castemporariesflush
		return \{false}
	endif
	castemporariesloadpending
	if NOT buildcasmodel_loadwait async = <async>
		castemporariesflush
		return \{false}
	endif
	modelbuilder_build {
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	buildcasmodel_compositewait async = <async>
	if NOT structurecontains structure = <buildscriptparams> build_incremental
		flushallcompositetextures \{no_block}
		castemporariesflush
		if NOT buildcasmodel_unloadwait async = <async>
			return \{false}
		endif
	endif
	if structurecontains structure = <buildscriptparams> new_object
		if (<async> = 1)
			buildcasmodel_updateragdoll appearance = <appearance>
		else
			obj_spawnscriptnow buildcasmodel_updateragdoll id = <ragdoll_script_id> params = {appearance = <appearance>}
		endif
	endif
	generatechecksumfromstruct struct = <appearance>
	settags appearance_checksum = <structure_checksum>
	if (<async> = 1)
		unhide
		if structurecontains structure = <buildscriptparams> new_object
			if NOT gotparam \{use_cache}
				if NOT structurecontains structure = <buildscriptparams> loading_into_song
					obj_setposition \{position = (500.0, 500.0, 500.0)}
					wait \{1
						gameframe}
				endif
			endif
		endif
	endif
	return \{true}
endscript

script buildcasmodel_loadwait 
	if (<async> = 1)
		caswaitforloading
	else
		casblockforloading
	endif
	if gotparam \{cancelled}
		return \{false}
	endif
	return \{true}
endscript

script buildcasmodel_compositewait 
	if (<async> = 1)
		caswaitforcomposite
	else
		casblockforcomposite
	endif
endscript

script buildcasmodel_unloadwait 
	if (<async> = 1)
		caswaitforunloads
	else
		caswaitforunloads \{block}
	endif
	if gotparam \{cancelled}
		return \{false}
	endif
	return \{true}
endscript

script buildcasmodel_updateragdoll 
	wait \{2
		gameframes}
	cas_update_accessory_bones appearance = <appearance>
endscript
