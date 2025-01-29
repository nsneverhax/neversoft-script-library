ps2_band_logo_texture = 'tex\\cag_logo_64'
test_16bit_cap = 0

script create_model_from_appearance 
	if ($ps2_cas_load_canceled = 1)
		Change \{ps2_cas_load_canceled = 0}
		return
	endif
	lockformodelbuilder \{lock = 1}
	if NOT GotParam \{hat_hair_choice}
		hat_hair_choice = hair
	endif
	if NOT GotParam \{instrument}
		instrument = None
	endif
	if NOT GotParam \{acc_left_choice}
		acc_left_choice = normal_acc
	endif
	if NOT GotParam \{acc_right_choice}
		acc_right_choice = normal_acc
	endif
	if NOT GotParam \{shoes_choice}
		shoes_choice = shoes
	endif
	filterappearancepartset part_set = $instrument_part_sets chosen_set = <instrument>
	filterappearancepartset part_set = $hair_part_sets chosen_set = <hat_hair_choice>
	filterappearancepartset part_set = $acc_left_part_sets chosen_set = <acc_left_choice>
	filterappearancepartset part_set = $acc_right_part_sets chosen_set = <acc_right_choice>
	filterappearancepartset part_set = $shoes_part_sets chosen_set = <shoes_choice>
	if NOT GotParam \{caching}
		if GotParam \{preload}
			ModelRunScript \{scriptname = cas_reset_bones}
			ModelRunScript scriptname = cas_skeleton_reset params = {Skeleton = <modelbuilder_skeleton>}
			ModelRunScript scriptname = cas_ragdoll_reset params = {Skeleton = <modelbuilder_skeleton> ragdoll = <modelbuilder_ragdoll>}
		endif
		ModelClearAllGeoms
	endif
	foreachincas \{do = ModelAddGeom}
	foreachincas \{do = GeomReplaceTexture}
	geomsetcreatedtexture
	if NOT GotParam \{ViewerObj}
		if NOT GotParam \{preload}
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
			ModelRunScript \{scriptname = cas_reset_bones}
			foreachincas \{do = deformmainskeleton
				params = {
					scriptname = cas_main_skel_scale
				}}
		endif
	endif
	if NOT isngc
		ModelRemovePolys
	endif
	foreachincas \{do = GeomModulateColor}
	set_uv_from_appearance
	if GotParam \{new_object}
		ModelExpandBoundingSphere
	endif
	modelupdateskinningpolyremoval
	foreachincas \{do = createapiececomposite}
	if NOT GotParam \{caching}
		if NOT GotParam \{preload}
			getmodelbuilderappearance
			if (<instrument> = drum)
				ModelRunScript scriptname = cas_merge_in_drummer_bones params = {Skeleton = <modelbuilder_skeleton>}
			elseif ((<instrument> = guitar) || (<instrument> = bass))
				ModelRunScript scriptname = cas_merge_in_guitar_ragdoll params = {Skeleton = <modelbuilder_skeleton>}
			endif
			if NOT GotParam \{new_object}
				ModelRunScript scriptname = cas_update_accessory_bones params = {appearance = <appearance>}
			endif
			ModelRunScript \{scriptname = cas_update_pose}
			ModelRunScript scriptname = cas_set_difference_anim params = {appearance = <appearance> instrument = <instrument>}
		endif
	endif
	lockformodelbuilder \{lock = 0}
endscript
ps2_body_color_h = 0
ps2_body_color_s = 0
ps2_body_color_v = 0
ps2_body_color_use_default_diffuse = 0
ps2_fleshy_parts = {
	cas_female_base_face
	cas_female_base_arms
	cas_female_base_hands
	cas_female_base_legs
	cas_female_base_shoes
	cas_female_base_torso
	cas_male_base_face
	cas_male_base_arms
	cas_male_base_hands
	cas_male_base_legs
	cas_male_base_shoes
	cas_male_base_torso
}
ps2_fleshy_parts_array = [
	cas_female_base_face
	cas_female_base_arms
	cas_female_base_hands
	cas_female_base_legs
	cas_female_base_shoes
	cas_female_base_torso
	cas_male_base_face
	cas_male_base_arms
	cas_male_base_hands
	cas_male_base_legs
	cas_male_base_shoes
	cas_male_base_torso
]

script ps2_propegate_body_color 
	if ($ps2_body_color_use_default_diffuse = 1)
		return
	endif
	if StructureContains structure = $ps2_fleshy_parts <part>
		setcasappearancecolor part = <part> h = ($ps2_body_color_h) s = ($ps2_body_color_s) v = ($ps2_body_color_v) use_default_diffuse = ($ps2_body_color_use_default_diffuse)
	endif
endscript

script poly_removal_from_appearance 
	ScriptAssert \{'poly_removal_from_appearance: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_ped_model_from_appearance 
	ScriptAssert \{'create_ped_model_from_appearance: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script color_model_from_appearance 
	filterappearancepartset part_set = $instrument_part_sets chosen_set = <instrument>
	if getcasappearancepart \{part = cas_body}
		if GotParam \{h}
			Change ps2_body_color_h = (<h>)
			Change ps2_body_color_s = (<s>)
			Change ps2_body_color_v = (<v>)
			Change ps2_body_color_use_default_diffuse = (<use_default_diffuse>)
			ForEachIn ($master_editable_list) do = ps2_propegate_body_color
		endif
	endif
	cas_propogate_color_to_other_parts \{part = cas_body
		other_parts = $ps2_fleshy_parts_array}
	foreachincas \{do = GeomModulateColor}
endscript

script update_cap_part 
	createapiececomposite part = <part> incremental
endscript

script reskin_model_from_appearance 
	if NOT GotParam \{kill_objects}
		do_not_kill_flags = {do_not_kill}
	endif
	filterappearancepartset part_set = $instrument_part_sets chosen_set = <instrument>
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
	ModelRunScript scriptname = cas_update_accessory_bones params = {appearance = <appearance> do_ragdoll = 0}
endscript

script set_uv_from_appearance 
	GetArraySize \{$master_uv_list}
	if (<array_Size> > 0)
		<index> = 0
		begin
		part = (($master_uv_list [<index>]).part)
		parent_part = (($master_uv_list [<index>]).parent_part)
		geomsetuvmatrix part = <part> parent_part = <parent_part>
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
endscript

script cas_set_difference_anim 
	if NOT get_part_key_from_appearance key = diff_anim appearance = <appearance> part = cas_full_body
		if NOT get_part_key_from_appearance key = diff_anim appearance = <appearance> part = cas_outfit
			if NOT get_part_key_from_appearance key = diff_anim appearance = <appearance> part = cas_female_shoes
				if NOT get_part_key_from_appearance key = diff_anim appearance = <appearance> part = cas_female_shoes_cutoff
					if NOT get_part_key_from_appearance key = diff_anim appearance = <appearance> part = cas_male_shoes
						get_part_key_from_appearance key = diff_anim appearance = <appearance> part = cas_male_shoes_cutoff
					endif
				endif
			endif
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
	ScriptAssert \{'BuildCASModel: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script buildcasmodel_loadwait 
	if (<async> = 1)
		caswaitforloading
	else
		casblockforloading
	endif
	if GotParam \{cancelled}
		return \{FALSE}
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
		caswaitforunloads \{Block}
	endif
	if GotParam \{cancelled}
		return \{FALSE}
	endif
	return \{true}
endscript

script buildcasmodel_updateragdoll 
	Wait \{2
		gameframes}
	cas_update_accessory_bones appearance = <appearance>
endscript

script model_apply_created_texture 
	geomsetcreatedtexture
endscript

script foreachincas \{params = {
		}}
	ForEachIn $master_editable_list do = <do> params = <params>
endscript
