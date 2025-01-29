cas_full_body_common_settings_male = {
	body_specific_parts = {
		cas_physique = cas_male_physique
	}
	is_female = 0
}
cas_full_body_common_settings_female = {
	body_specific_parts = {
		cas_physique = cas_female_physique
	}
	is_female = 1
}
default_ik_params_set = {
	guitar = Hero_Ik_params
	drum = Drummer_IK_Params
	vocals = Singer_IK_Params
	FrontEnd = car_ik_params
}
cas_full_body = [
	{
		desc_id = boneman_female
		frontend_desc = qs(0x3c309a3b)
		mesh = `models/car/female/boneman_female`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_female
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_female`
		body_skeleton2 = `skeletons/gh_drummer_female`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = avatar
		frontend_desc = qs(0xd1b24c56)
		use_avatar_mesh
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_avatar
		ik_params_set = $default_ik_params_set
		global_body_skeleton = `skeletons/gh_rocker_avatar_global`
		global_body_skeleton2 = `skeletons/gh_drummer_avatar_global`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Lars_1
		frontend_desc = qs(0x512158c5)
		mesh = `models/gh_rockers/lars/lars_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_lars
		skeleton_id = gh_rocker_lars_1
		cloth = `models/gh_rockers/lars/lars_1`
		cloth_coll_skeleton = cloth_coll_data_lars_1
		cloth_coll_bones = [
			[
				control_hair
				control_leg
			]
			[
				bone_head
				Bone_Neck
				bone_chest
				Bone_Collar_R
				Bone_Collar_L
				Bone_Bicep_R
				Bone_Bicep_L
			]
			[
				Bone_Thigh_R
				Bone_Thigh_L
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_lars_1`
		body_skeleton2 = `skeletons/gh_drummer_lars_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Lars_2
		frontend_desc = qs(0xd11011c3)
		mesh = `models/gh_rockers/lars/lars_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_lars
		skeleton_id = gh_rocker_lars_2
		cloth = `models/gh_rockers/lars/lars_2`
		cloth_coll_skeleton = cloth_coll_data_lars_2
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
			]
			[
				Bone_Stomach_Lower
			]
			[
				BONE_PELVIS
				Bone_Thigh_R
				Bone_Thigh_L
				Bone_Knee_R
				Bone_Knee_L
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_lars_2`
		body_skeleton2 = `skeletons/gh_drummer_lars_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = lars_3
		frontend_desc = qs(0xa395cb5d)
		mesh = `models/gh_rockers/lars/lars_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_lars
		skeleton_id = gh_rocker_lars_3
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_lars_3`
		body_skeleton2 = `skeletons/gh_drummer_lars_3`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = lars_4
		frontend_desc = qs(0x5bad509a)
		mesh = `models/gh_rockers/lars/lars_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_lars
		skeleton_id = gh_rocker_lars_4
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_lars_4`
		body_skeleton2 = `skeletons/gh_drummer_lars_4`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = minotaur_1
		frontend_desc = qs(0x1e3c77ae)
		mesh = `models/gh_rockers/minotaur/minotaur_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_minotaur
		skeleton_id = gh_rocker_lars_1
		cloth = `models/gh_rockers/minotaur/minotaur_1`
		cloth_coll_skeleton = cloth_coll_data_lars_1
		cloth_coll_bones = [
			[
				control_hair
				control_leg
			]
			[
				bone_head
				Bone_Neck
				bone_chest
				Bone_Collar_R
				Bone_Collar_L
				Bone_Bicep_R
				Bone_Bicep_L
			]
			[
				Bone_Thigh_R
				Bone_Thigh_L
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_lars_1`
		body_skeleton2 = `skeletons/gh_drummer_lars_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = arthas_1
		frontend_desc = qs(0x053ccfee)
		mesh = `models/gh_rockers/arthas/arthas_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_arthas
		skeleton_id = gh_rocker_lars_1
		cloth = `models/gh_rockers/arthas/arthas_1`
		cloth_coll_skeleton = cloth_coll_data_lars_1
		cloth_coll_bones = [
			[
				control_hair
				control_leg
			]
			[
				bone_head
				Bone_Neck
				bone_chest
				Bone_Collar_R
				Bone_Collar_L
				Bone_Bicep_R
				Bone_Bicep_L
			]
			[
				Bone_Thigh_R
				Bone_Thigh_L
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_lars_1`
		body_skeleton2 = `skeletons/gh_drummer_lars_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = casey_1
		frontend_desc = qs(0xb4221b9c)
		mesh = `models/gh_rockers/casey/casey_1`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		skeleton_id = gh_rocker_casey_1
		cloth = `models/gh_rockers/casey/casey_1`
		cloth_coll_skeleton = cloth_coll_data_casey_1
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
				bone_head
				Bone_Neck
			]
			[
				Bone_Stomach_Upper
			]
			[
				Bone_Ankle_R
				Bone_Ankle_L
				Bone_Knee_R
				Bone_Knee_L
			]
		]
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_casey_1`
		body_skeleton2 = `skeletons/gh_drummer_casey_1`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = casey_2
		frontend_desc = qs(0x8e5527ab)
		mesh = `models/gh_rockers/casey/casey_2`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		skeleton_id = gh_rocker_casey_2
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_casey_2`
		body_skeleton2 = `skeletons/gh_drummer_casey_2`
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_highplat_d'
	}
	{
		desc_id = casey_3
		frontend_desc = qs(0xab075347)
		mesh = `models/gh_rockers/casey/casey_3`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		skeleton_id = gh_rocker_casey_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_casey_3`
		body_skeleton2 = `skeletons/gh_drummer_casey_3`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = casey_4
		frontend_desc = qs(0xb8a5a0cf)
		mesh = `models/gh_rockers/casey/casey_4`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		skeleton_id = gh_rocker_casey_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_casey_4`
		body_skeleton2 = `skeletons/gh_drummer_casey_4`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = clive_1
		frontend_desc = qs(0x64d85c64)
		mesh = `models/gh_rockers/clive/clive_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		skeleton_id = gh_rocker_clive_1
		guitar_offset = (0.0, -0.02, 0.0)
		cloth = `models/gh_rockers/clive/clive_1`
		cloth_coll_skeleton = cloth_coll_data_clive_1
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
				bone_head
				Bone_Neck
				bone_chest
				Bone_Collar_R
				Bone_Collar_L
			]
			[
				bone_chest
				Bone_Stomach_Upper
				Bone_Stomach_Lower
			]
			[
				Bone_Ankle_R
				Bone_Ankle_L
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_clive_1`
		body_skeleton2 = `skeletons/gh_drummer_clive_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = 2009_1
		frontend_desc = qs(0x68c2782a)
		mesh = `models/gh_rockers/newfemale/2009_1`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_2009
		skeleton_id = gh_rocker_2009_1
		guitar_offset = (0.0, 0.0, 0.0)
		cloth = `models/gh_rockers/newfemale/2009_1`
		cloth_coll_skeleton = cloth_coll_data_newfemale
		cloth_coll_bones = [
			[
				control_legs
				control_hair
			]
			[
				Bone_Thigh_R
				Bone_Thigh_L
			]
			[
				bone_chest
				Bone_Stomach_Upper
				Bone_Stomach_Lower
				Bone_Bicep_R
				Bone_Bicep_L
				BONE_PELVIS
				Bone_Thigh_L
				Bone_Thigh_R
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_2009_1`
		body_skeleton2 = `skeletons/gh_drummer_2009_1`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = 2009_2
		frontend_desc = qs(0x43ef2be9)
		mesh = `models/gh_rockers/2009_2/2009_2`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_2009
		skeleton_id = gh_rocker_2009_2
		guitar_offset = (0.0, 0.0, 0.0)
		cloth = `models/gh_rockers/2009_2/2009_2`
		cloth_coll_skeleton = cloth_coll_data_newfemale2
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
				bone_chest
				Bone_Bicep_R
				Bone_Bicep_L
				BONE_PELVIS
			]
			[
				Bone_Forearm_L
			]
			[
				Bone_Thigh_L
				Bone_Knee_R
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_2009_2`
		body_skeleton2 = `skeletons/gh_drummer_2009_2`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = newmale_1
		frontend_desc = qs(0x781fafc2)
		mesh = `models/gh_rockers/newmale/newmale_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_newmale
		skeleton_id = gh_rocker_newmale_1
		guitar_offset = (0.0, 0.0, 0.0)
		cloth = `models/gh_rockers/newmale/newmale_1`
		cloth_coll_skeleton = cloth_coll_data_newmale_1
		cloth_coll_bones = [
			[
				control_hair
				control_torso
			]
			[
				bone_head
				Bone_Neck
				bone_chest
				Bone_Bicep_L
				Bone_Bicep_R
			]
			[
				Bone_Stomach_Lower
				BONE_PELVIS
				Bone_Thigh_R
				Bone_Thigh_L
				Bone_Knee_R
				Bone_Knee_L
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_newmale_1`
		body_skeleton2 = `skeletons/gh_drummer_newmale_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = newmale_2
		frontend_desc = qs(0x5332fc01)
		mesh = `models/gh_rockers/newmale/newmale_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_newmale
		skeleton_id = gh_rocker_newmale_2
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_newmale_2`
		body_skeleton2 = `skeletons/gh_drummer_newmale_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = clive_2
		frontend_desc = qs(0x64cda132)
		mesh = `models/gh_rockers/clive/clive_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		skeleton_id = gh_rocker_clive_2
		guitar_offset = (0.0, -0.02, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_clive_2`
		body_skeleton2 = `skeletons/gh_drummer_clive_2`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = clive_3
		frontend_desc = qs(0xb2484b2b)
		mesh = `models/gh_rockers/clive/clive_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		skeleton_id = gh_rocker_clive_3
		guitar_offset = (0.0, -0.02, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_clive_3`
		body_skeleton2 = `skeletons/gh_drummer_clive_3`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = clive_4
		frontend_desc = qs(0x5b7551c8)
		mesh = `models/gh_rockers/clive/clive_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		skeleton_id = gh_rocker_clive_4
		guitar_offset = (0.0, -0.02, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_clive_4`
		body_skeleton2 = `skeletons/gh_drummer_clive_4`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = pandora_1
		frontend_desc = qs(0x90bdf944)
		mesh = `models/gh_rockers/pandora/pandora_1`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		skeleton_id = gh_rocker_pandora_1
		guitar_offset = (0.0, 0.0, 0.0)
		cloth = `models/gh_rockers/pandora/pandora_1`
		cloth_coll_skeleton = cloth_coll_data_pandora_1
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
				bone_head
				Bone_Neck
				bone_chest
				Bone_Collar_R
				Bone_Collar_L
			]
			[
				bone_chest
				Bone_Stomach_Upper
			]
			[
				Bone_Thigh_R
				Bone_Thigh_L
				BONE_PELVIS
				Bone_Knee_L
				Bone_Knee_R
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_pandora_1`
		body_skeleton2 = `skeletons/gh_drummer_pandora_1`
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = pandora_2
		frontend_desc = qs(0x6c3c0092)
		mesh = `models/gh_rockers/pandora/pandora_2`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		skeleton_id = gh_rocker_pandora_2
		cloth = `models/gh_rockers/pandora/pandora_2`
		cloth_coll_skeleton = cloth_coll_data_pandora_2
		cloth_coll_bones = [
			[
				control_hair
				control_leg
			]
			[
				bone_head
				Bone_Neck
				bone_chest
				Bone_Collar_R
				Bone_Collar_L
			]
			[
				Bone_Thigh_R
				Bone_Thigh_L
				BONE_PELVIS
			]
		]
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_pandora_2`
		body_skeleton2 = `skeletons/gh_drummer_pandora_2`
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = pandora_3
		frontend_desc = qs(0x1e4b5eee)
		mesh = `models/gh_rockers/pandora/pandora_3`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		skeleton_id = gh_rocker_pandora_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_pandora_3`
		body_skeleton2 = `skeletons/gh_drummer_pandora_3`
		anim_struct = car_female_anim_struct
		locked
		diff_anim = 'female_heels_highplat_d'
	}
	{
		desc_id = pandora_4
		frontend_desc = qs(0x65d372d7)
		mesh = `models/gh_rockers/pandora/pandora_4`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		skeleton_id = gh_rocker_pandora_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_pandora_4`
		body_skeleton2 = `skeletons/gh_drummer_pandora_4`
		anim_struct = car_female_anim_struct
		locked
		diff_anim = 'female_heels_highplat_d'
	}
	{
		desc_id = eddie_1
		frontend_desc = qs(0x24d4343d)
		mesh = `models/gh_rockers/eddie/eddie_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		skeleton_id = gh_rocker_eddie_1
		guitar_offset = (0.0, 0.0, 0.0)
		cloth = `models/gh_rockers/eddie/eddie_1`
		cloth_coll_skeleton = cloth_coll_data_eddie_1
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
			]
			[
				bone_head
				bone_chest
				Bone_Stomach_Upper
				Bone_Stomach_Lower
				Bone_Forearm_R
				Bone_Forearm_L
			]
			[
				BONE_PELVIS
				Bone_Thigh_R
				Bone_Thigh_L
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_eddie_1`
		body_skeleton2 = `skeletons/gh_drummer_eddie_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = eddie_2
		frontend_desc = qs(0x9ec204ee)
		mesh = `models/gh_rockers/eddie/eddie_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		skeleton_id = gh_rocker_eddie_2
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_eddie_2`
		body_skeleton2 = `skeletons/gh_drummer_eddie_2`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = eddie_3
		frontend_desc = qs(0xaf16c5e3)
		mesh = `models/gh_rockers/eddie/eddie_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		skeleton_id = gh_rocker_eddie_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_eddie_3`
		body_skeleton2 = `skeletons/gh_drummer_eddie_3`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = eddie_4
		frontend_desc = qs(0xf312cb64)
		mesh = `models/gh_rockers/eddie/eddie_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		skeleton_id = gh_rocker_eddie_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_eddie_4`
		body_skeleton2 = `skeletons/gh_drummer_eddie_4`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = axel_1
		frontend_desc = qs(0xe9e3c0ec)
		mesh = `models/gh_rockers/axel/axel_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		skeleton_id = gh_rocker_axel_1
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		large_hands = 1
		body_skeleton = `skeletons/gh_rocker_axel_1`
		body_skeleton2 = `skeletons/gh_drummer_axel_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = axel_2
		frontend_desc = qs(0xb4310579)
		mesh = `models/gh_rockers/axel/axel_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		skeleton_id = gh_rocker_axel_2
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		large_hands = 1
		body_skeleton = `skeletons/gh_rocker_axel_2`
		body_skeleton2 = `skeletons/gh_drummer_axel_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = axel_3
		frontend_desc = qs(0xc49ccda8)
		mesh = `models/gh_rockers/axel/axel_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		skeleton_id = gh_rocker_axel_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		large_hands = 1
		body_skeleton = `skeletons/gh_rocker_axel_3`
		body_skeleton2 = `skeletons/gh_drummer_axel_3`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = axel_4
		frontend_desc = qs(0xb6af61b2)
		mesh = `models/gh_rockers/axel/axel_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		skeleton_id = gh_rocker_axel_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		large_hands = 1
		body_skeleton = `skeletons/gh_rocker_axel_4`
		body_skeleton2 = `skeletons/gh_drummer_axel_4`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Judy_1
		frontend_desc = qs(0xc59fb258)
		mesh = `models/gh_rockers/judy/judy_1`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		skeleton_id = gh_rocker_judy_1
		cloth = `models/gh_rockers/judy/judy_1`
		cloth_coll_skeleton = cloth_coll_data_judy_1
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
				bone_head
			]
			[
				Bone_Neck
			]
			[
				BONE_PELVIS
				Bone_Thigh_R
				Bone_Thigh_L
			]
		]
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_judy_1`
		body_skeleton2 = `skeletons/gh_drummer_judy_1`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = Judy_2
		frontend_desc = qs(0x662a5870)
		mesh = `models/gh_rockers/judy/judy_2`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		skeleton_id = gh_rocker_judy_2
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_judy_2`
		body_skeleton2 = `skeletons/gh_drummer_judy_2`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = judy_3
		frontend_desc = qs(0xabc3319a)
		mesh = `models/gh_rockers/judy/judy_3`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		skeleton_id = gh_rocker_judy_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_judy_3`
		body_skeleton2 = `skeletons/gh_drummer_judy_3`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = judy_4
		frontend_desc = qs(0x53281066)
		mesh = `models/gh_rockers/judy/judy_4`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		skeleton_id = gh_rocker_judy_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_judy_4`
		body_skeleton2 = `skeletons/gh_drummer_judy_4`
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = izzy_1
		frontend_desc = qs(0x80c3cfb0)
		mesh = `models/gh_rockers/izzy/izzy_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		skeleton_id = gh_rocker_izzy_1
		guitar_offset = (0.0, 0.0, 0.0)
		cloth = `models/gh_rockers/izzy/izzy_1`
		cloth_coll_skeleton = cloth_coll_data_izzy_1
		cloth_coll_bones = [
			[
				control_hair
				control_torso
			]
			[
				bone_head
				bone_chest
			]
			[
				bone_chest
				Bone_Stomach_Upper
				Bone_Stomach_Lower
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_izzy_1`
		body_skeleton2 = `skeletons/gh_drummer_izzy_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = izzy_2
		frontend_desc = qs(0x4528a892)
		mesh = `models/gh_rockers/izzy/izzy_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		skeleton_id = gh_rocker_izzy_2
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_izzy_2`
		body_skeleton2 = `skeletons/gh_drummer_izzy_2`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = izzy_3
		frontend_desc = qs(0x1b097aa6)
		mesh = `models/gh_rockers/izzy/izzy_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		skeleton_id = gh_rocker_izzy_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_izzy_3`
		body_skeleton2 = `skeletons/gh_drummer_izzy_3`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = izzy_4
		frontend_desc = qs(0x4a95dc5c)
		mesh = `models/gh_rockers/izzy/izzy_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		skeleton_id = gh_rocker_izzy_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_izzy_4`
		body_skeleton2 = `skeletons/gh_drummer_izzy_4`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Johnny_1
		frontend_desc = qs(0x0dddf43a)
		mesh = `models/gh_rockers/johnny/johnny_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		skeleton_id = gh_rocker_johnny_1
		guitar_offset = (0.0, -0.02, 0.0)
		cloth = `models/gh_rockers/johnny/johnny_1`
		cloth_coll_skeleton = cloth_coll_data_johnny_1
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
			]
			[
				Bone_Stomach_Upper
				Bone_Stomach_Lower
				BONE_PELVIS
			]
			[
				BONE_PELVIS
				Bone_Thigh_R
				Bone_Thigh_L
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_johnny_1`
		body_skeleton2 = `skeletons/gh_drummer_johnny_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Johnny_2
		frontend_desc = qs(0x26f0a7f9)
		mesh = `models/gh_rockers/johnny/johnny_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		skeleton_id = gh_rocker_johnny_2
		guitar_offset = (0.0, -0.02, 0.0)
		cloth = `models/gh_rockers/johnny/johnny_2`
		cloth_coll_skeleton = cloth_coll_data_johnny_2
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
			]
			[
				Bone_Stomach_Upper
				Bone_Stomach_Lower
			]
			[
				Bone_Thigh_R
				Bone_Thigh_L
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_johnny_2`
		body_skeleton2 = `skeletons/gh_drummer_johnny_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = johnny_2_ghost
		frontend_desc = qs(0x1a39605b)
		mesh = `models/gh_rockers/johnny/johnny_2_ghost`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		skeleton_id = gh_rocker_johnny_2
		guitar_offset = (0.0, -0.02, 0.0)
		cloth = `models/gh_rockers/johnny/johnny_2_ghost`
		cloth_coll_skeleton = cloth_coll_data_johnny_2
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
			]
			[
				Bone_Stomach_Upper
				Bone_Stomach_Lower
			]
			[
				Bone_Thigh_R
				Bone_Thigh_L
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_johnny_2`
		body_skeleton2 = `skeletons/gh_drummer_johnny_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = johnny_3
		frontend_desc = qs(0xd985de8e)
		mesh = `models/gh_rockers/johnny/johnny_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		skeleton_id = gh_rocker_johnny_3
		guitar_offset = (0.0, -0.02, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_johnny_3`
		body_skeleton2 = `skeletons/gh_drummer_johnny_3`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = johnny_4
		frontend_desc = qs(0xb72f9dd8)
		mesh = `models/gh_rockers/johnny/johnny_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		skeleton_id = gh_rocker_johnny_4
		guitar_offset = (0.0, -0.02, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_johnny_4`
		body_skeleton2 = `skeletons/gh_drummer_johnny_4`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = frankenrocker
		frontend_desc = qs(0x1d374fc1)
		mesh = `models/gh_rockers/frankenrocker/frankenrocker`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_frankenrocker
		skeleton_id = gh_rocker_frankenrocker_1
		ik_params_set = $default_ik_params_set
		large_hands = 1
		body_skeleton = `skeletons/gh_rocker_frankenrocker_1`
		body_skeleton2 = `skeletons/gh_drummer_frankenrocker_1`
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = silhouette_net
		frontend_desc = qs(0x6b5f29e1)
		global_mesh = `models/gh_rockers/silhouette_m.skin`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_silhouette
		skeleton_id = gh_rocker_male
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_male`
		body_skeleton2 = `skeletons/gh_drummer_male`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = silhouette_m
		frontend_desc = qs(0x6b5f29e1)
		global_mesh = `models/gh_rockers/silhouette_m.skin`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_silhouette
		skeleton_id = gh_rocker_male
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_male`
		body_skeleton2 = `skeletons/gh_drummer_male`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = silhouette_gold
		frontend_desc = qs(0xa6b94703)
		mesh = `models/gh_rockers/silhouette_gold`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_silhouette_gold
		skeleton_id = gh_rocker_male
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_male`
		body_skeleton2 = `skeletons/gh_drummer_male`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Skeleton
		frontend_desc = qs(0x998b2c00)
		mesh = `models/talent/skeleton`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_male
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_male`
		body_skeleton2 = `skeletons/gh_drummer_male`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = bh2_lightstreaks
		frontend_desc = qs(0x2dbf1f49)
		mesh = `models/gh_rockers/bh2_research/bh2_lightstreaks`
		cloth = `models/gh_rockers/bh2_research/bh2_lightstreaks`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
		]
		genre = [
			rock
		]
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		skeleton_id = gh_rocker_clive_1
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_clive_1`
		body_skeleton2 = `skeletons/gh_drummer_clive_1`
		anim_struct = car_male_anim_struct
	}
]
cas_full_body_acc = [
	{
		desc_id = 2009_2_forearmfx_cyl
		mesh = 0x39890d58
	}
]
