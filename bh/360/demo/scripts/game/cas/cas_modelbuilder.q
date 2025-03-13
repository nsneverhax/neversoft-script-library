cloth_coll_data = [
	{
		bone = bone_head
		radius = 0.085
		length = 0.044999998
		offset = (0.05, 0.03, 0.0)
	}
	{
		bone = bone_forearm_r
		radius = 0.08
		length = 0.3
	}
	{
		bone = bone_forearm_l
		radius = 0.08
		length = 0.3
	}
]

script create_model_from_appearance 
	lockformodelbuilder \{lock = 1}
	if NOT gotparam \{hat_hair_choice}
		hat_hair_choice = hair
	endif
	if NOT gotparam \{instrument}
		instrument = none
	endif
	if NOT gotparam \{caching}
		getmodelbuilderskeleton
		getmodelbuilderragdoll
		if gotparam \{preload}
			modelrunscript \{scriptname = cas_reset_bones}
			modelrunscript scriptname = cas_skeleton_reset params = {skeleton = <modelbuilder_skeleton>}
			modelrunscript scriptname = cas_ragdoll_reset params = {skeleton = <modelbuilder_skeleton> ragdoll = <modelbuilder_ragdoll>}
			if NOT gotparam \{new_object}
				foreachincas \{do = geombackuplightcachedata}
			endif
		endif
		modelclearallgeoms
	endif
	foreachincas \{do = modeladdgeom}
	foreachincas \{do = geomreplacetexture}
	foreachincas \{do = geomtexturereplacecleanup}
	if NOT gotparam \{viewerobj}
		foreachincas \{do = modelreskinpart
			params = {
				scriptname = cas_part_reskin
			}}
		foreachincas \{do = geomsetuvmatrix}
		if NOT gotparam \{preload}
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
	if cas_get_is_female player = ($cas_current_player)
		hair_part = cas_female_hair
	else
		hair_part = cas_male_hair
	endif
	foreachincas do = modeladdcloth params = {part = <hair_part>}
	foreachincas \{do = geompolyremoval}
	foreachincas \{do = geomsetmaterialvariables}
	if gotparam \{new_object}
		modelexpandboundingsphere
	endif
	modelupdateskinningpolyremoval
	foreachincas \{do = createapiececomposite}
	if gotparam \{preload}
		foreachincas \{do = applyphysicsaccessories}
	endif
	if NOT gotparam \{caching}
		if NOT gotparam \{preload}
			if (<instrument> = drum)
				modelrunscript scriptname = cas_merge_in_drummer_bones params = {skeleton = <modelbuilder_skeleton>}
				modelrunscript \{scriptname = cas_place_drum_sticks}
			elseif ((<instrument> = guitar) || (<instrument> = bass))
				modelrunscript scriptname = cas_merge_in_guitar_ragdoll params = {skeleton = <modelbuilder_skeleton>}
			endif
			if NOT gotparam \{new_object}
				getmodelbuilderappearance
				modelrunscript scriptname = cas_update_accessory_bones params = {appearance = <appearance>}
				foreachincas \{do = geomrestorelightcachedata}
			endif
			modelrunscript scriptname = cas_set_difference_anim params = {instrument = <instrument>}
			modelrunscript \{scriptname = cas_update_pose}
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
	if gotparam \{preload}
		foreachincas \{do = applyphysicsaccessories}
	endif
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
	if NOT gotparam \{preload}
		modelrunscript scriptname = cas_update_accessory_bones params = {appearance = <appearance> do_ragdoll = 0 update_only}
	endif
endscript

script cas_set_difference_anim 
	if NOT modelbuilder :getmodelbuilderactualstructkey \{key = diff_anim
			part = cas_female_shoes}
		if NOT modelbuilder :getmodelbuilderactualstructkey \{key = diff_anim
				part = cas_male_shoes}
			modelbuilder :getmodelbuilderactualstructkey \{key = diff_anim
				part = cas_full_body}
		endif
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
	change \{cas_model_build_success = 0}
	change \{safe_to_free_cas_temporaries = 0}
	build_incremental = 0
	if structurecontains structure = <buildscriptparams> build_incremental
		build_incremental = 1
	endif
	gettruestarttime
	onexitrun buildcasmodel_cleanup params = {starttime = <starttime> build_incremental = <build_incremental>}
	requireparams \{[
			async
			buildscriptparams
			appearance
		]
		all}
	if structurecontains \{structure = buildscriptparams
			instrument}
		instrument = (<buildscriptparams>.instrument)
	else
		instrument = none
	endif
	obj_getid
	manglechecksums a = <objid> b = ragdollupdatescript
	ragdoll_script_id = <mangled_id>
	killspawnedscript id = <ragdoll_script_id>
	printscriptinfo 'BuildCASModel %a %o' a = <async> o = <objid> donotresolve
	getsingletag \{asset_heap}
	getsingletag \{lightgroup}
	gethathairchoice
	filterappearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
	filterappearance appearance_name = appearance part_set = $hair_part_sets chosen_set = <hat_hair_choice>
	buildscriptparams = {
		<buildscriptparams>
		lightgroup = <lightgroup>
		temporary_heap = heap_cas_build
		hat_hair_choice = <hat_hair_choice>
	}
	change \{cancelled_model_build = 0}
	waitunloadgroup cas async = <async>
	modelbuilder_waitforavatar {
		async = <async>
	}
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	archivecancelloading \{cas_building_cache}
	archivewaitloading cas_building_cache async = <async>
	original_async = <async>
	if gotparam \{use_cache}
		cascacheflushvram
		if ($cancelled_model_build = 1)
			return \{false}
		endif
		cascachemodel {
			appearance = <appearance>
			buildscriptparams = <buildscriptparams>
			async = <async>
			global_storage = <asset_heap>
		}
		if ($cancelled_model_build = 1)
			return \{false}
		endif
		async = 0
	endif
	if (<async> = 0)
	else
		hide
	endif
	archivecancelloading \{cas}
	cascancelavatars
	archivewaitloading \{cas}
	modelbuilder_preload {
		async = <async>
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	modelbuilder_loadassets {
		async = <async>
	}
	if ($cancelled_model_build = 1)
		printf \{'CancelledLoadAssets-beforeprocess'}
		modelbuilder_processassets
		printf \{'CancelledLoadAssets-afterprocess'}
		return \{false}
	endif
	modelbuilder_waitforavatar {
		async = <async>
	}
	modelbuilder_processassets
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	modelbuilder_build {
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	buildcasmodel_compositewait async = <original_async>
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	if (<build_incremental> = 0)
		flushallcompositetextures \{no_block}
	endif
	settags appearance_checksum = <appearance_checksum>
	if structurecontains structure = <buildscriptparams> new_object
		if (<async> = 1)
			wait \{2
				gameframes}
		endif
		cas_update_accessory_bones appearance = <appearance>
	endif
	unhide
	forceinstanceupdate
	change \{cas_model_build_success = 1}
	return \{true}
endscript

script buildcasmodel_cleanup 
	printf \{'********************************************************************'}
	print_loading_time starttime = <starttime> text = qs(0xfea2c3fc)
	printf \{'********************************************************************'}
	change \{safe_to_free_cas_temporaries = 1}
	castemporariesflush
	if (<build_incremental> = 0)
		buildcasmodel_compositewait \{async = 0}
		flushallcompositetextures
	endif
endscript

script buildcasmodel_compositewait 
	if (<async> = 1)
		caswaitforcomposite
	else
		casblockforcomposite
	endif
endscript

script cascancelloading 
	archivecancelloading \{cas}
	cascancelavatars
	if structurecontains structure = ($cas_queue_current_job) appearance_checksum
		change cas_queue_current_job = {
			($cas_queue_current_job)
			appearance_checksum = cancelled
		}
	endif
	if ($cas_queue_waiting_to_start = 1)
		change \{cas_queue_waiting_to_start_cancelled = 1}
	endif
	change \{cancelled_model_build = 1}
endscript

script casblockforloading 
	archivewaitloading \{cas
		async = 0}
endscript
