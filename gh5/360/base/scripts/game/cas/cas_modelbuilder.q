cloth_coll_data = [
	{
		bone = bone_head
		radius = 0.085
		length = 0.044999998
		offset = (0.05, 0.03, 0.0)
	}
	{
		bone = Bone_Forearm_R
		radius = 0.08
		length = 0.3
	}
	{
		bone = Bone_Forearm_L
		radius = 0.08
		length = 0.3
	}
]

script create_model_from_appearance 
	lockformodelbuilder \{lock = 1}
	if NOT GotParam \{hat_hair_choice}
		hat_hair_choice = hair
	endif
	if NOT GotParam \{instrument}
		instrument = None
	endif
	if NOT GotParam \{caching}
		getmodelbuilderskeleton
		getmodelbuilderragdoll
		if GotParam \{preload}
			ModelRunScript \{scriptname = cas_reset_bones}
			ModelRunScript scriptname = cas_skeleton_reset params = {Skeleton = <modelbuilder_skeleton>}
			ModelRunScript scriptname = cas_ragdoll_reset params = {Skeleton = <modelbuilder_skeleton> ragdoll = <modelbuilder_ragdoll>}
			if NOT GotParam \{new_object}
				foreachincas \{do = geombackuplightcachedata}
			endif
		endif
		ModelClearAllGeoms
	endif
	foreachincas \{do = ModelAddGeom}
	foreachincas \{do = GeomReplaceTexture}
	foreachincas \{do = geomtexturereplacecleanup}
	if NOT GotParam \{ViewerObj}
		foreachincas \{do = modelreskinpart
			params = {
				scriptname = cas_part_reskin
			}}
		foreachincas \{do = geomsetuvmatrix}
		if NOT GotParam \{preload}
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
	if cas_get_is_female Player = ($cas_current_player)
		hair_part = cas_female_hair
	else
		hair_part = cas_male_hair
	endif
	foreachincas do = modeladdcloth params = {part = <hair_part>}
	foreachincas \{do = geompolyremoval}
	foreachincas \{do = geomsetmaterialvariables}
	if GotParam \{new_object}
		ModelExpandBoundingSphere
	endif
	modelupdateskinningpolyremoval
	foreachincas \{do = createapiececomposite}
	if GotParam \{preload}
		foreachincas \{do = applyphysicsaccessories}
	endif
	if NOT GotParam \{caching}
		if NOT GotParam \{preload}
			if (<instrument> = drum)
				ModelRunScript scriptname = cas_merge_in_drummer_bones params = {Skeleton = <modelbuilder_skeleton>}
				ModelRunScript \{scriptname = cas_place_drum_sticks}
			elseif ((<instrument> = guitar) || (<instrument> = bass))
				ModelRunScript scriptname = cas_merge_in_guitar_ragdoll params = {Skeleton = <modelbuilder_skeleton>}
			endif
			if NOT GotParam \{new_object}
				getmodelbuilderappearance
				ModelRunScript scriptname = cas_update_accessory_bones params = {appearance = <appearance>}
				foreachincas \{do = geomrestorelightcachedata}
			endif
			ModelRunScript scriptname = cas_set_difference_anim params = {instrument = <instrument>}
			ModelRunScript \{scriptname = cas_update_pose}
		endif
	endif
	lockformodelbuilder \{lock = 0}
endscript

script poly_removal_from_appearance 
	foreachincas \{do = geompolyremoval}
endscript

script create_ped_model_from_appearance 
	lockformodelbuilder \{lock = 1}
	ModelClearAllGeoms
	ForEachInEditableList \{do = ModelAddGeom}
	ModelRunScript \{scriptname = cas_reset_bones}
	modelapplyobjectscale
	ForEachInEditableList \{do = geompolyremoval}
	ForEachInEditableList \{do = geomsetmaterialvariables}
	lockformodelbuilder \{lock = 0}
endscript

script color_model_from_appearance 
	foreachincas \{do = geomsetmaterialvariables}
endscript

script update_cap_part 
	createapiececomposite part = <part> incremental
endscript

script reskin_model_from_appearance 
	if NOT GotParam \{kill_objects}
		do_not_kill_flags = {do_not_kill}
	endif
	if GotParam \{preload}
		foreachincas \{do = applyphysicsaccessories}
	endif
	getmodelbuilderskeleton
	ModelRunScript \{scriptname = cas_reset_bones}
	ModelRunScript scriptname = cas_skeleton_reset params = {Skeleton = <modelbuilder_skeleton>}
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
	if NOT GotParam \{preload}
		ModelRunScript scriptname = cas_update_accessory_bones params = {appearance = <appearance> do_ragdoll = 0 update_only}
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
	if NOT GotParam \{diff_anim}
		GetSingleTag \{is_female}
		if GotParam \{is_female}
			if (<is_female> = 1)
				diff_anim_name = gh_rocker_female_empty_d
			else
				diff_anim_name = gh_rocker_male_empty_d
			endif
		endif
	else
		if NOT GotParam \{instrument}
			instrument = None
		endif
		if (<instrument> = drum)
			formatText checksumName = diff_anim_name 'GH_Drummer_%s' s = <diff_anim>
		else
			formatText checksumName = diff_anim_name 'GH_Rocker_%s' s = <diff_anim>
		endif
	endif
	if GotParam \{diff_anim_name}
		printf 'Clothing difference anim = %s' s = <diff_anim_name> donotresolve
		hero_add_clothing_difference_anim anim = <diff_anim_name>
	endif
endscript

script cas_update_pose 
	Anim_UpdatePose
endscript

script lockformodelbuilder 
	Change model_builder_lock = <lock>
endscript

script checkmodelbuilderlock 
	if NOT ($model_builder_lock = 0)
		ScriptAssert \{'Profile/appearance modification functions should not be called during a modelbuild'}
	endif
endscript

script buildcasmodel 
	Change \{cas_model_build_success = 0}
	Change \{safe_to_free_cas_temporaries = 0}
	build_incremental = 0
	if StructureContains structure = <buildscriptparams> build_incremental
		build_incremental = 1
	endif
	GetTrueStartTime
	OnExitRun buildcasmodel_cleanup params = {starttime = <starttime> build_incremental = <build_incremental>}
	RequireParams \{[
			async
			buildscriptparams
			appearance
		]
		all}
	if StructureContains \{structure = buildscriptparams
			instrument}
		instrument = (<buildscriptparams>.instrument)
	else
		instrument = None
	endif
	Obj_GetID
	MangleChecksums a = <objID> b = ragdollupdatescript
	ragdoll_script_id = <mangled_ID>
	KillSpawnedScript id = <ragdoll_script_id>
	printscriptinfo 'BuildCASModel %a %o' a = <async> o = <objID> donotresolve
	GetSingleTag \{asset_heap}
	GetSingleTag \{LightGroup}
	gethathairchoice
	filterappearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
	filterappearance appearance_name = appearance part_set = $hair_part_sets chosen_set = <hat_hair_choice>
	buildscriptparams = {
		<buildscriptparams>
		LightGroup = <LightGroup>
		temporary_heap = heap_cas_build
		hat_hair_choice = <hat_hair_choice>
	}
	Change \{cancelled_model_build = 0}
	waitunloadgroup cas async = <async>
	modelbuilder_waitforavatar {
		async = <async>
	}
	if ($cancelled_model_build = 1)
		return \{FALSE}
	endif
	archivecancelloading \{cas_building_cache}
	archivewaitloading cas_building_cache async = <async>
	original_async = <async>
	if GotParam \{use_cache}
		cascacheflushvram
		if ($cancelled_model_build = 1)
			return \{FALSE}
		endif
		cascachemodel {
			appearance = <appearance>
			buildscriptparams = <buildscriptparams>
			async = <async>
			global_storage = <asset_heap>
		}
		if ($cancelled_model_build = 1)
			return \{FALSE}
		endif
		async = 0
	endif
	if (<async> = 0)
	else
		Hide
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
		return \{FALSE}
	endif
	modelbuilder_loadassets {
		async = <async>
	}
	if ($cancelled_model_build = 1)
		printf \{'CancelledLoadAssets-beforeprocess'}
		modelbuilder_processassets
		printf \{'CancelledLoadAssets-afterprocess'}
		return \{FALSE}
	endif
	modelbuilder_waitforavatar {
		async = <async>
	}
	modelbuilder_processassets
	if ($cancelled_model_build = 1)
		return \{FALSE}
	endif
	modelbuilder_build {
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	buildcasmodel_compositewait async = <original_async>
	if ($cancelled_model_build = 1)
		return \{FALSE}
	endif
	if (<build_incremental> = 0)
		flushallcompositetextures \{no_block}
	endif
	SetTags appearance_checksum = <appearance_checksum>
	if StructureContains structure = <buildscriptparams> new_object
		if (<async> = 1)
			Wait \{2
				gameframes}
		endif
		cas_update_accessory_bones appearance = <appearance>
	endif
	unhide
	forceinstanceupdate
	Change \{cas_model_build_success = 1}
	return \{true}
endscript

script buildcasmodel_cleanup 
	printf \{'********************************************************************'}
	print_loading_time starttime = <starttime> text = qs(0xfea2c3fc)
	printf \{'********************************************************************'}
	Change \{safe_to_free_cas_temporaries = 1}
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
	if StructureContains structure = ($cas_queue_current_job) appearance_checksum
		Change cas_queue_current_job = {
			($cas_queue_current_job)
			appearance_checksum = cancelled
		}
	endif
	if ($cas_queue_waiting_to_start = 1)
		Change \{cas_queue_waiting_to_start_cancelled = 1}
	endif
	Change \{cancelled_model_build = 1}
endscript

script casblockforloading 
	archivewaitloading \{cas
		async = 0}
endscript
