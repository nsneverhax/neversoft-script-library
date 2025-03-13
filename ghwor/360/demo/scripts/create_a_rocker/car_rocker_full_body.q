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
	guitar = hero_ik_params
	drum = drummer_ik_params
	vocals = singer_ik_params
	frontend = car_ik_params
}
cas_full_body = [
	{
		desc_id = boneman_female
		frontend_desc = qs(0x03ac90f0)
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
		frontend_desc = qs(0x03ac90f0)
		use_avatar_mesh
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_avatar
		ik_params_set = $default_ik_params_set
		global_body_skeleton = `skeletons/gh_rocker_avatar_global`
		global_body_skeleton2 = `skeletons/gh_drummer_avatar_global`
		anim_struct = pick_correct_avatar_anim_struct
	}
	{
		desc_id = lars_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/lars/lars_1`
		$cas_full_body_common_settings_male
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
				bone_neck
				bone_chest
				bone_collar_r
				bone_collar_l
				bone_bicep_r
				bone_bicep_l
			]
			[
				bone_thigh_r
				bone_thigh_l
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
		desc_id = lars_2
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/lars/lars_2`
		$cas_full_body_common_settings_male
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
				bone_stomach_lower
			]
			[
				bone_pelvis
				bone_thigh_r
				bone_thigh_l
				bone_knee_r
				bone_knee_l
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_lars_2`
		body_skeleton2 = `skeletons/gh_drummer_lars_2`
		anim_struct = car_male_anim_struct
		particle_systems = [
			{
				custom_script = lars_snort
			}
		]
	}
	{
		desc_id = lars_2_ghost
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/lars/lars_2_ghost`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_lars_2
		cloth = `models/gh_rockers/lars/lars_2_ghost`
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
				bone_stomach_lower
			]
			[
				bone_pelvis
				bone_thigh_r
				bone_thigh_l
				bone_knee_r
				bone_knee_l
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
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/lars/lars_3`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_lars_3
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_lars_3`
		body_skeleton2 = `skeletons/gh_drummer_lars_3`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = lars_4
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/lars/lars_4`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_lars_4
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_lars_4`
		body_skeleton2 = `skeletons/gh_drummer_lars_4`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = minotaur_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/minotaur/minotaur_1`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_minotaur_1
		cloth = `models/gh_rockers/minotaur/minotaur_1`
		cloth_coll_skeleton = cloth_coll_data_minotaur_1
		cloth_coll_bones = [
			[
				control_hair
				control_leg
			]
			[
				bone_chest
			]
			[
				bone_pelvis
				bone_thigh_r
				bone_thigh_l
				bone_knee_r
				bone_knee_l
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_minotaur_1`
		body_skeleton2 = `skeletons/gh_drummer_minotaur_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = arthas_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/arthas/arthas_1`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_arthas_1
		cloth = `models/gh_rockers/arthas/arthas_1`
		cloth_coll_skeleton = cloth_coll_data_arthas_1
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
			]
			[
				bone_stomach_upper
				bone_pelvis
				bone_thigh_r
				bone_thigh_l
				bone_knee_r
				bone_knee_l
			]
			[
				bone_thigh_r
				bone_thigh_l
				bone_knee_r
				bone_knee_l
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_arthas_1`
		body_skeleton2 = `skeletons/gh_drummer_arthas_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = demigod
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/demigod/demigod`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_demigod_1
		cloth = `models/gh_rockers/demigod/demigod`
		cloth_coll_skeleton = cloth_coll_data_demigod_1
		cloth_coll_bones = [
			[
				control_hair
				control_leg
			]
			[
			]
			[
				bone_thigh_l
				bone_thigh_r
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_demigod_1`
		body_skeleton2 = `skeletons/gh_drummer_demigod_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = `demigod spirit`
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/demigod/demigod_ghost`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_demigod_1
		cloth = `models/gh_rockers/demigod/demigod_ghost`
		cloth_coll_skeleton = cloth_coll_data_demigod_1
		cloth_coll_bones = [
			[
				control_hair
				control_leg
			]
			[
			]
			[
				bone_thigh_l
				bone_thigh_r
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_demigod_1`
		body_skeleton2 = `skeletons/gh_drummer_demigod_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = demigod_scaled
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/demigod/demigod`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_demigod_1
		cloth = `models/gh_rockers/demigod/demigod`
		cloth_coll_skeleton = cloth_coll_data_demigod_1
		cloth_coll_bones = [
			[
				control_hair
				control_leg
			]
			[
			]
			[
				bone_thigh_l
				bone_thigh_r
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 0
		guitar_offset = (0.0, 0.0, 0.0)
		body_skeleton = `skeletons/gh_rocker_demigod_1`
		body_skeleton2 = `skeletons/gh_drummer_demigod_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = casey_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/casey/casey_1`
		$cas_full_body_common_settings_female
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
				bone_neck
			]
			[
				bone_stomach_upper
			]
			[
				bone_ankle_r
				bone_ankle_l
				bone_knee_r
				bone_knee_l
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
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/casey/casey_2`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_casey_2
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		cloth = `models/gh_rockers/casey/casey_2`
		cloth_coll_skeleton = cloth_coll_data_casey_2
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
				bone_head
				bone_neck
			]
			[
				bone_stomach_upper
				bone_stomach_lower
			]
			[
				bone_pelvis
				bone_thigh_r
				bone_thigh_l
				bone_knee_r
				bone_knee_l
			]
		]
		body_skeleton = `skeletons/gh_rocker_casey_2`
		body_skeleton2 = `skeletons/gh_drummer_casey_2`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = casey_2_ghost
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/casey/casey_2_ghost`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_casey_2
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_casey_2`
		body_skeleton2 = `skeletons/gh_drummer_casey_2`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = casey_cut_body
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/casey/casey_cut_body`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_casey_1
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_casey_1`
		body_skeleton2 = `skeletons/gh_drummer_casey_1`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = casey_cut_skin
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/casey/casey_cut_skin`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_casey_1
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_casey_1`
		body_skeleton2 = `skeletons/gh_drummer_casey_1`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = casey_3
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/casey/casey_3`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_casey_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_casey_3`
		body_skeleton2 = `skeletons/gh_drummer_casey_3`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = casey_4
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/casey/casey_4`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_casey_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_casey_4`
		body_skeleton2 = `skeletons/gh_drummer_casey_4`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = clive_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/clive/clive_1`
		$cas_full_body_common_settings_male
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
				bone_neck
				bone_chest
				bone_collar_r
				bone_collar_l
			]
			[
				bone_chest
				bone_stomach_upper
				bone_stomach_lower
			]
			[
				bone_ankle_r
				bone_ankle_l
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_clive_1`
		body_skeleton2 = `skeletons/gh_drummer_clive_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = 2009_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/newfemale/2009_1`
		$cas_full_body_common_settings_female
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
				bone_thigh_r
				bone_thigh_l
			]
			[
				bone_chest
				bone_stomach_upper
				bone_stomach_lower
				bone_bicep_r
				bone_bicep_l
				bone_pelvis
				bone_thigh_l
				bone_thigh_r
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_2009_1`
		body_skeleton2 = `skeletons/gh_drummer_2009_1`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = 2009_2
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/2009_2/2009_2`
		$cas_full_body_common_settings_female
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
				bone_bicep_r
				bone_bicep_l
				bone_pelvis
			]
			[
				bone_forearm_l
			]
			[
				bone_thigh_l
				bone_knee_r
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_2009_2`
		body_skeleton2 = `skeletons/gh_drummer_2009_2`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = 2009_2_ghost
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/2009_2/2009_2_ghost`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_2009_2
		guitar_offset = (0.0, 0.0, 0.0)
		cloth = `models/gh_rockers/2009_2/2009_2_ghost`
		cloth_coll_skeleton = cloth_coll_data_newfemale2
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
				bone_chest
				bone_bicep_r
				bone_bicep_l
				bone_pelvis
			]
			[
				bone_forearm_l
			]
			[
				bone_thigh_l
				bone_knee_r
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_2009_2`
		body_skeleton2 = `skeletons/gh_drummer_2009_2`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = newmale_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/newmale/newmale_1`
		$cas_full_body_common_settings_male
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
				bone_neck
				bone_chest
				bone_bicep_l
				bone_bicep_r
			]
			[
				bone_stomach_lower
				bone_pelvis
				bone_thigh_r
				bone_thigh_l
				bone_knee_r
				bone_knee_l
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_newmale_1`
		body_skeleton2 = `skeletons/gh_drummer_newmale_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = newmale_2
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/newmale/newmale_2`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_newmale_2
		cloth = `models/gh_rockers/newmale/newmale_2`
		cloth_coll_skeleton = cloth_coll_data_newmale_2
		cloth_coll_bones = [
			[
				control_torso
				control_leg
			]
			[
				bone_stomach_upper
				bone_stomach_lower
				bone_pelvis
				bone_thigh_r
				bone_thigh_l
			]
			[
				bone_bicep_l
				bone_bicep_r
				bone_thigh_r
				bone_thigh_l
				bone_knee_l
				bone_knee_r
			]
		]
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_newmale_2`
		body_skeleton2 = `skeletons/gh_drummer_newmale_2`
		anim_struct = car_male_anim_struct
		particle_systems = [
			{
				params_script = $gp_fx_nm_glow_01
				bone = bone_head
			}
			{
				params_script = $gp_fx_nm_smoke_01
				bone = bone_head
			}
		]
	}
	{
		desc_id = newmale_2_ghost
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/newmale/newmale_2_ghost`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_newmale_2
		cloth = `models/gh_rockers/newmale/newmale_2_ghost`
		cloth_coll_skeleton = cloth_coll_data_newmale_2
		cloth_coll_bones = [
			[
				control_torso
				control_leg
			]
			[
				bone_stomach_upper
				bone_stomach_lower
				bone_pelvis
				bone_thigh_r
				bone_thigh_l
			]
			[
				bone_bicep_l
				bone_bicep_r
				bone_thigh_r
				bone_thigh_l
				bone_knee_l
				bone_knee_r
			]
		]
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_newmale_2`
		body_skeleton2 = `skeletons/gh_drummer_newmale_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = clive_2
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/clive/clive_2`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_clive_2
		guitar_offset = (0.0, -0.02, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_clive_2`
		body_skeleton2 = `skeletons/gh_drummer_clive_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = clive_3
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/clive/clive_3`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_clive_3
		guitar_offset = (0.0, -0.02, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_clive_3`
		body_skeleton2 = `skeletons/gh_drummer_clive_3`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = clive_4
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/clive/clive_4`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_clive_4
		guitar_offset = (0.0, -0.02, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_clive_4`
		body_skeleton2 = `skeletons/gh_drummer_clive_4`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = pandora_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/pandora/pandora_1`
		$cas_full_body_common_settings_female
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
				bone_neck
				bone_chest
				bone_collar_r
				bone_collar_l
			]
			[
				bone_chest
				bone_stomach_upper
			]
			[
				bone_thigh_r
				bone_thigh_l
				bone_pelvis
				bone_knee_l
				bone_knee_r
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
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/pandora/pandora_2`
		$cas_full_body_common_settings_female
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
				bone_neck
				bone_chest
				bone_collar_r
				bone_collar_l
			]
			[
				bone_thigh_r
				bone_thigh_l
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
		desc_id = pandora_2_ghost
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/pandora/pandora_2_ghost`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_pandora_2
		cloth = `models/gh_rockers/pandora/pandora_2_ghost`
		cloth_coll_skeleton = cloth_coll_data_pandora_2
		cloth_coll_bones = [
			[
				control_hair
				control_leg
			]
			[
				bone_head
				bone_neck
				bone_chest
				bone_collar_r
				bone_collar_l
			]
			[
				bone_thigh_r
				bone_thigh_l
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
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/pandora/pandora_3`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_pandora_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_pandora_3`
		body_skeleton2 = `skeletons/gh_drummer_pandora_3`
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_highplat_d'
	}
	{
		desc_id = pandora_4
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/pandora/pandora_4`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_pandora_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_pandora_4`
		body_skeleton2 = `skeletons/gh_drummer_pandora_4`
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_highplat_d'
	}
	{
		desc_id = eddie_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/eddie/eddie_1`
		$cas_full_body_common_settings_male
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
				bone_stomach_upper
				bone_stomach_lower
				bone_forearm_r
				bone_forearm_l
			]
			[
				bone_pelvis
				bone_thigh_r
				bone_thigh_l
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_eddie_1`
		body_skeleton2 = `skeletons/gh_drummer_eddie_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = eddie_2
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/eddie/eddie_2`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_eddie_2
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_eddie_2`
		body_skeleton2 = `skeletons/gh_drummer_eddie_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = eddie_3
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/eddie/eddie_3`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_eddie_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_eddie_3`
		body_skeleton2 = `skeletons/gh_drummer_eddie_3`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = eddie_4
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/eddie/eddie_4`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_eddie_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_eddie_4`
		body_skeleton2 = `skeletons/gh_drummer_eddie_4`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = axel_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/axel/axel_1`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_axel_1
		cloth = `models/gh_rockers/axel/axel_1`
		cloth_coll_skeleton = cloth_coll_data_axel_1
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
				bone_chest
			]
			[
				bone_chest
			]
			[
				bone_thigh_r
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 0
		guitar_offset = (0.0, 0.0, 0.0)
		body_skeleton = `skeletons/gh_rocker_axel_1`
		body_skeleton2 = `skeletons/gh_drummer_axel_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = axel_2
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/axel/axel_2`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_axel_2
		cloth = `models/gh_rockers/axel/axel_2`
		cloth_coll_skeleton = cloth_coll_data_axel_2
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
			]
			[
				bone_forearm_l
				bone_thigh_r
				bone_thigh_l
				bone_knee_r
				bone_knee_l
			]
			[
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 0
		guitar_offset = (0.0, 0.0, 0.0)
		body_skeleton = `skeletons/gh_rocker_axel_2`
		body_skeleton2 = `skeletons/gh_drummer_axel_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = axel_2_ghost
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/axel/axel_2_ghost`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_axel_2
		cloth = `models/gh_rockers/axel/axel_2_ghost`
		cloth_coll_skeleton = cloth_coll_data_axel_2
		cloth_coll_bones = [
			[
				control_hair
				control_torso
				control_leg
			]
			[
			]
			[
				bone_forearm_l
				bone_thigh_r
				bone_thigh_l
				bone_knee_r
				bone_knee_l
			]
			[
			]
		]
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 0
		guitar_offset = (0.0, 0.0, 0.0)
		body_skeleton = `skeletons/gh_rocker_axel_2`
		body_skeleton2 = `skeletons/gh_drummer_axel_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = axel_3
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/axel/axel_3`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_axel_3
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_axel_3`
		body_skeleton2 = `skeletons/gh_drummer_axel_3`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = axel_4
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/axel/axel_4`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_axel_4
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_axel_4`
		body_skeleton2 = `skeletons/gh_drummer_axel_4`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = judy_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/judy/judy_1`
		$cas_full_body_common_settings_female
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
				bone_neck
			]
			[
				bone_pelvis
				bone_thigh_r
				bone_thigh_l
			]
		]
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_judy_1`
		body_skeleton2 = `skeletons/gh_drummer_judy_1`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = judy_2
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/judy/judy_2`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_judy_2
		cloth = `models/gh_rockers/judy/judy_2`
		cloth_coll_skeleton = cloth_coll_data_judy_2
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
			]
			[
				bone_pelvis
				bone_thigh_r
			]
		]
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_judy_2`
		body_skeleton2 = `skeletons/gh_drummer_judy_2`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = judy_2_ghost
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/judy/judy_2_ghost`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_judy_2
		cloth = `models/gh_rockers/judy/judy_2_ghost`
		cloth_coll_skeleton = cloth_coll_data_judy_2
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
			]
			[
				bone_pelvis
				bone_thigh_r
			]
		]
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_judy_2`
		body_skeleton2 = `skeletons/gh_drummer_judy_2`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = judy_3
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/judy/judy_3`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_judy_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_judy_3`
		body_skeleton2 = `skeletons/gh_drummer_judy_3`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = judy_4
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/judy/judy_4`
		$cas_full_body_common_settings_female
		skeleton_id = gh_rocker_judy_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_judy_4`
		body_skeleton2 = `skeletons/gh_drummer_judy_4`
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = izzy_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/izzy/izzy_1`
		$cas_full_body_common_settings_male
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
				bone_stomach_upper
				bone_stomach_lower
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_izzy_1`
		body_skeleton2 = `skeletons/gh_drummer_izzy_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = izzy_2
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/izzy/izzy_2`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_izzy_2
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_izzy_2`
		body_skeleton2 = `skeletons/gh_drummer_izzy_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = izzy_3
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/izzy/izzy_3`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_izzy_3
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_izzy_3`
		body_skeleton2 = `skeletons/gh_drummer_izzy_3`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = izzy_4
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/izzy/izzy_4`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_izzy_4
		guitar_offset = (0.0, 0.0, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_izzy_4`
		body_skeleton2 = `skeletons/gh_drummer_izzy_4`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = johnny_1
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/johnny/johnny_1`
		$cas_full_body_common_settings_male
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
				bone_stomach_upper
			]
			[
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_johnny_1`
		body_skeleton2 = `skeletons/gh_drummer_johnny_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = johnny_2
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/johnny/johnny_2`
		$cas_full_body_common_settings_male
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
				bone_stomach_upper
				bone_stomach_lower
			]
			[
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_johnny_2`
		body_skeleton2 = `skeletons/gh_drummer_johnny_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = johnny_2_ghost
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/johnny/johnny_2_ghost`
		$cas_full_body_common_settings_male
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
				bone_stomach_upper
				bone_stomach_lower
			]
			[
			]
		]
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_johnny_2`
		body_skeleton2 = `skeletons/gh_drummer_johnny_2`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = johnny_3
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/johnny/johnny_3`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_johnny_3
		guitar_offset = (0.0, -0.02, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_johnny_3`
		body_skeleton2 = `skeletons/gh_drummer_johnny_3`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = johnny_4
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/johnny/johnny_4`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_johnny_4
		guitar_offset = (0.0, -0.02, 0.0)
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_johnny_4`
		body_skeleton2 = `skeletons/gh_drummer_johnny_4`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = frankenrocker
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/frankenrocker/frankenrocker`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_frankenrocker_1
		ik_params_set = $default_ik_params_set
		large_hands = 1
		is_fat = 1
		guitar_offset = (0.0, 0.1, 0.0)
		body_skeleton = `skeletons/gh_rocker_frankenrocker_1`
		body_skeleton2 = `skeletons/gh_drummer_frankenrocker_1`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = silhouette_net
		frontend_desc = qs(0x03ac90f0)
		global_mesh = `models/gh_rockers/silhouette_m.skin`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_male
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_male`
		body_skeleton2 = `skeletons/gh_drummer_male`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = silhouette_m
		frontend_desc = qs(0x03ac90f0)
		global_mesh = `models/gh_rockers/silhouette_m.skin`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_male
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_male`
		body_skeleton2 = `skeletons/gh_drummer_male`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = silhouette_gold
		frontend_desc = qs(0x03ac90f0)
		mesh = `models/gh_rockers/silhouette_gold`
		$cas_full_body_common_settings_male
		skeleton_id = gh_rocker_male
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_male`
		body_skeleton2 = `skeletons/gh_drummer_male`
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = skeleton
		frontend_desc = qs(0x03ac90f0)
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
		frontend_desc = qs(0x03ac90f0)
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
		skeleton_id = gh_rocker_clive_1
		ik_params_set = $default_ik_params_set
		body_skeleton = `skeletons/gh_rocker_clive_1`
		body_skeleton2 = `skeletons/gh_drummer_clive_1`
		anim_struct = car_male_anim_struct
	}
]
cas_full_body_acc = [
	{
		desc_id = _2009_2_forearmfx_cyl
		mesh = `models/gh_rockers/2009_2/_2009_2_forearmfx_cyl`
		has_node_array
		particle_systems = [
			{
				params_script = $gp_testpos_particles
				attachnode = _2009_2_forearmfx_cyl_fx_dummy_01
				bone = bone_head
			}
		]
	}
]
