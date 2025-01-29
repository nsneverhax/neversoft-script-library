cloth_coll_data = [
	{
		bone = Bone_Head
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
	LockForModelBuilder \{lock = 1}
	if NOT GotParam \{hat_hair_choice}
		hat_hair_choice = Hair
	endif
	if NOT GotParam \{instrument}
		instrument = None
	endif
	if NOT GotParam \{caching}
		GetModelBuilderSkeleton
		GetModelBuilderRagdoll
		if GotParam \{preload}
			ModelRunScript \{scriptname = cas_reset_bones}
			ModelRunScript scriptname = cas_skeleton_reset params = {Skeleton = <modelbuilder_skeleton>}
			ModelRunScript scriptname = cas_ragdoll_reset params = {Skeleton = <modelbuilder_skeleton> Ragdoll = <modelbuilder_ragdoll>}
			if NOT GotParam \{new_object}
				ForEachInCAS \{do = GeomBackupLightCacheData}
			endif
		endif
		ModelClearAllGeoms
	endif
	ForEachInCAS \{do = ModelAddGeom}
	ForEachInCAS \{do = GeomReplaceTexture}
	ForEachInCAS \{do = GeomTextureReplaceCleanup}
	if NOT GotParam \{ViewerObj}
		ForEachInCAS \{do = ModelReskinPart
			params = {
				scriptname = cas_part_reskin
			}}
		ForEachInCAS \{do = GeomSetUVMatrix}
		if NOT GotParam \{preload}
			ModelUpdateMainRigForReskinning \{part = CAS_Body
				scriptname = cas_lowres_rig_reskin}
			ForEachInCAS \{do = ModelCopyGeom
				params = {
					materials = $cas_reskin_materials
				}}
			ForEachInCAS \{do = ModelDeleteReskinTemporaries}
			ForEachInCAS \{do = DeformMainSkeleton
				params = {
					scriptname = cas_main_skel_scale
				}}
		endif
	endif
	if cas_get_is_female player = ($cas_current_player)
		hair_part = CAS_Female_Hair
	else
		hair_part = CAS_Male_Hair
	endif
	ForEachInCAS do = ModelAddCloth params = {part = <hair_part>}
	ForEachInCAS \{do = GeomPolyRemoval}
	ForEachInCAS \{do = GeomSetMaterialVariables}
	if GotParam \{new_object}
		ModelExpandBoundingSphere
	endif
	ModelUpdateSkinningPolyRemoval
	ForEachInCAS \{do = CreateAPieceComposite}
	if GotParam \{preload}
		ForEachInCAS \{do = ApplyPhysicsAccessories}
	endif
	if NOT GotParam \{caching}
		if NOT GotParam \{preload}
			if (<instrument> = Drum)
				ModelRunScript scriptname = cas_merge_in_drummer_bones params = {Skeleton = <modelbuilder_skeleton>}
				ModelRunScript \{scriptname = cas_place_drum_sticks}
			elseif ((<instrument> = guitar) || (<instrument> = bass))
				ModelRunScript scriptname = cas_merge_in_guitar_ragdoll params = {Skeleton = <modelbuilder_skeleton>}
			endif
			if NOT GotParam \{new_object}
				GetModelBuilderAppearance
				ModelRunScript scriptname = cas_update_accessory_bones params = {appearance = <appearance>}
				ForEachInCAS \{do = GeomRestoreLightCacheData}
			endif
			ModelRunScript scriptname = cas_set_difference_anim params = {instrument = <instrument>}
			ModelRunScript \{scriptname = cas_update_pose}
		endif
	endif
	LockForModelBuilder \{lock = 0}
endscript

script poly_removal_from_appearance 
	ForEachInCAS \{do = GeomPolyRemoval}
endscript

script create_ped_model_from_appearance 
	LockForModelBuilder \{lock = 1}
	ModelClearAllGeoms
	ForEachInEditableList \{do = ModelAddGeom}
	ModelRunScript \{scriptname = cas_reset_bones}
	ModelApplyObjectScale
	ForEachInEditableList \{do = GeomPolyRemoval}
	ForEachInEditableList \{do = GeomSetMaterialVariables}
	LockForModelBuilder \{lock = 0}
endscript

script color_model_from_appearance 
	ForEachInCAS \{do = GeomSetMaterialVariables}
endscript

script update_cap_part 
	CreateAPieceComposite part = <part> incremental
endscript

script reskin_model_from_appearance 
	if NOT GotParam \{kill_objects}
		do_not_kill_flags = {do_not_kill}
	endif
	if GotParam \{preload}
		ForEachInCAS \{do = ApplyPhysicsAccessories}
	endif
	GetModelBuilderSkeleton
	ModelRunScript \{scriptname = cas_reset_bones}
	ModelRunScript scriptname = cas_skeleton_reset params = {Skeleton = <modelbuilder_skeleton>}
	ForEachInCAS \{do = ModelReskinPart
		params = {
			scriptname = cas_part_reskin
			force_reskin
		}}
	ModelUpdateMainRigForReskinning \{part = CAS_Body
		scriptname = cas_lowres_rig_reskin
		force_reskin}
	ForEachInCAS \{do = ModelCopyGeom
		params = {
			materials = $cas_reskin_materials
		}}
	ForEachInCAS do = ModelDeleteReskinTemporaries params = <do_not_kill_flags>
	ForEachInCAS \{do = DeformMainSkeleton
		params = {
			scriptname = cas_main_skel_scale
		}}
	GetModelBuilderAppearance
	if NOT GotParam \{preload}
		ModelRunScript scriptname = cas_update_accessory_bones params = {appearance = <appearance> do_ragdoll = 0 update_only}
	endif
endscript

script cas_set_difference_anim 
	if NOT ModelBuilder :GetModelBuilderActualStructKey \{key = diff_anim
			part = CAS_Female_Shoes}
		if NOT ModelBuilder :GetModelBuilderActualStructKey \{key = diff_anim
				part = CAS_Male_Shoes}
			ModelBuilder :GetModelBuilderActualStructKey \{key = diff_anim
				part = CAS_Full_Body}
		endif
	endif
	if NOT GotParam \{diff_anim}
		GetSingleTag \{is_female}
		if GotParam \{is_female}
			if (<is_female> = 1)
				diff_anim_name = gh_rocker_female_empty_d
			else
				diff_anim_name = GH_Rocker_Male_Empty_D
			endif
		endif
	else
		if NOT GotParam \{instrument}
			instrument = None
		endif
		if (<instrument> = Drum)
			FormatText checksumname = diff_anim_name 'GH_Drummer_%s' s = <diff_anim>
		else
			FormatText checksumname = diff_anim_name 'GH_Rocker_%s' s = <diff_anim>
		endif
	endif
	if GotParam \{diff_anim_name}
		printf 'Clothing difference anim = %s' s = <diff_anim_name> DoNotResolve
		hero_add_clothing_difference_anim anim = <diff_anim_name>
	endif
endscript

script cas_update_pose 
	anim_updatepose
endscript

script LockForModelBuilder 
	Change model_builder_lock = <lock>
endscript

script CheckModelBuilderLock 
	if NOT ($model_builder_lock = 0)
		ScriptAssert \{'Profile/appearance modification functions should not be called during a modelbuild'}
	endif
endscript

script BuildCASModel 
	Change \{cas_model_build_success = 0}
	Change \{safe_to_free_cas_temporaries = 0}
	build_incremental = 0
	if StructureContains structure = <buildscriptparams> build_incremental
		build_incremental = 1
	endif
	GetTrueStartTime
	OnExitRun BuildCASModel_Cleanup params = {starttime = <starttime> build_incremental = <build_incremental>}
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
	MangleChecksums a = <objID> b = RagdollUpdateScript
	ragdoll_script_id = <mangled_ID>
	killspawnedscript id = <ragdoll_script_id>
	printscriptinfo 'BuildCASModel %a %o' a = <async> o = <objID> DoNotResolve
	GetSingleTag \{asset_heap}
	GetSingleTag \{LightGroup}
	GetHatHairChoice
	FilterAppearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
	FilterAppearance appearance_name = appearance part_set = $hair_part_sets chosen_set = <hat_hair_choice>
	buildscriptparams = {
		<buildscriptparams>
		LightGroup = <LightGroup>
		temporary_heap = heap_cas_build
		hat_hair_choice = <hat_hair_choice>
	}
	Change \{cancelled_model_build = 0}
	WaitUnloadGroup CAS async = <async>
	ModelBuilder_WaitForAvatar {
		async = <async>
	}
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	ArchiveCancelLoading \{cas_building_cache}
	ArchiveWaitLoading cas_building_cache async = <async>
	original_async = <async>
	if GotParam \{use_cache}
		CASCacheFlushVRAM
		if ($cancelled_model_build = 1)
			return \{false}
		endif
		CASCacheModel {
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
	ArchiveCancelLoading \{CAS}
	CASCancelAvatars
	ArchiveWaitLoading \{CAS}
	ModelBuilder_Preload {
		async = <async>
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	ModelBuilder_LoadAssets {
		async = <async>
	}
	if ($cancelled_model_build = 1)
		printf \{'CancelledLoadAssets-beforeprocess'}
		ModelBuilder_ProcessAssets
		printf \{'CancelledLoadAssets-afterprocess'}
		return \{false}
	endif
	ModelBuilder_WaitForAvatar {
		async = <async>
	}
	ModelBuilder_ProcessAssets
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	ModelBuilder_Build {
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	BuildCASModel_CompositeWait async = <original_async>
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	if (<build_incremental> = 0)
		FlushAllCompositeTextures \{no_block}
	endif
	SetTags appearance_checksum = <appearance_checksum>
	if StructureContains structure = <buildscriptparams> new_object
		if (<async> = 1)
			wait \{2
				gameframes}
		endif
		cas_update_accessory_bones appearance = <appearance>
	endif
	unhide
	ForceInstanceUpdate
	Change \{cas_model_build_success = 1}
	return \{true}
endscript

script BuildCASModel_Cleanup 
	printf \{'********************************************************************'}
	print_loading_time starttime = <starttime> text = qs(0xfea2c3fc)
	printf \{'********************************************************************'}
	Change \{safe_to_free_cas_temporaries = 1}
	CASTemporariesFlush
	if (<build_incremental> = 0)
		BuildCASModel_CompositeWait \{async = 0}
		FlushAllCompositeTextures
	endif
endscript

script BuildCASModel_CompositeWait 
	if (<async> = 1)
		CasWaitForComposite
	else
		CasBlockForComposite
	endif
endscript

script CasCancelLoading 
	ArchiveCancelLoading \{CAS}
	CASCancelAvatars
	if StructureContains structure = ($cas_queue_current_job) appearance_checksum
		Change cas_queue_current_job = {
			($cas_queue_current_job)
			appearance_checksum = Cancelled
		}
	endif
	if ($cas_queue_waiting_to_start = 1)
		Change \{cas_queue_waiting_to_start_cancelled = 1}
	endif
	Change \{cancelled_model_build = 1}
endscript

script CasBlockForLoading 
	ArchiveWaitLoading \{CAS
		async = 0}
endscript
