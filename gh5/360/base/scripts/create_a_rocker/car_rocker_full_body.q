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
cas_full_body = [
	{
		desc_id = boneman_female
		frontend_desc = qs(0x3c309a3b)
		mesh = `models/car/female/boneman_female`
		$cas_full_body_common_settings_female
		Skeleton = gh_rocker_female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		ragdoll = ragdoll_rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_female
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = avatar
		frontend_desc = qs(0xd1b24c56)
		use_avatar_mesh
		$cas_full_body_common_settings_male
		Skeleton = gh_rocker_avatar
		skeleton_path = 'skeletons/GH_Rocker_Avatar.ske'
		ragdoll = ragdoll_rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_male
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Lars_1
		frontend_desc = qs(0x512158c5)
		mesh = `models/gh_rockers/lars/lars_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_lars
		Skeleton = gh_rocker_lars_1
		skeleton_path = 'skeletons/GH_Rocker_Lars_1.ske'
		ragdoll = rag_gh_rocker_lars_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Lars_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_lars1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Lars_2
		frontend_desc = qs(0xd11011c3)
		mesh = `models/gh_rockers/lars/lars_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_lars
		Skeleton = gh_rocker_lars_2
		skeleton_path = 'skeletons/GH_Rocker_Lars_2.ske'
		ragdoll = rag_gh_rocker_lars_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Lars_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_lars2
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = lars_3
		frontend_desc = qs(0xa395cb5d)
		mesh = `models/gh_rockers/lars/lars_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_lars
		Skeleton = gh_rocker_lars_3
		skeleton_path = 'skeletons/GH_Rocker_Lars_3.ske'
		ragdoll = rag_gh_rocker_lars_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Lars_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_lars3
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = lars_4
		frontend_desc = qs(0x5bad509a)
		mesh = `models/gh_rockers/lars/lars_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_lars
		Skeleton = gh_rocker_lars_4
		skeleton_path = 'skeletons/GH_Rocker_Lars_4.ske'
		ragdoll = rag_gh_rocker_lars_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Lars_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_lars4
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = casey_4
		frontend_desc = qs(0xb8a5a0cf)
		mesh = `models/gh_rockers/casey/casey_4`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		Skeleton = gh_rocker_casey_4
		skeleton_path = 'skeletons/GH_Rocker_Casey_4.ske'
		ragdoll = rag_gh_rocker_casey_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_casey_4
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = casey_1
		frontend_desc = qs(0xfd0f76a3)
		mesh = `models/gh_rockers/casey/casey_1`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		Skeleton = gh_rocker_casey_1
		skeleton_path = 'skeletons/GH_Rocker_Casey_1.ske'
		ragdoll = rag_gh_rocker_casey_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_casey_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = casey_2
		frontend_desc = qs(0x8e5527ab)
		mesh = `models/gh_rockers/casey/casey_2`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		Skeleton = gh_rocker_casey_2
		skeleton_path = 'skeletons/GH_Rocker_Casey_2.ske'
		ragdoll = rag_gh_rocker_casey_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_casey_2
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
		diff_anim = 'female_heels_highplat_d'
	}
	{
		desc_id = casey_3
		frontend_desc = qs(0xab075347)
		mesh = `models/gh_rockers/casey/casey_3`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		Skeleton = gh_rocker_casey_3
		skeleton_path = 'skeletons/GH_Rocker_Casey_3.ske'
		ragdoll = rag_gh_rocker_casey_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_casey_3
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = clive_1
		frontend_desc = qs(0x64d85c64)
		mesh = `models/gh_rockers/clive/clive_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		Skeleton = gh_rocker_clive_1
		skeleton_path = 'skeletons/GH_Rocker_Clive_1.ske'
		ragdoll = rag_gh_rocker_clive_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_clive_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = clive_2
		frontend_desc = qs(0x64cda132)
		mesh = `models/gh_rockers/clive/clive_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		Skeleton = gh_rocker_clive_2
		skeleton_path = 'skeletons/GH_Rocker_Clive_2.ske'
		ragdoll = rag_gh_rocker_clive_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_clive_2
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = clive_3
		frontend_desc = qs(0xb2484b2b)
		mesh = `models/gh_rockers/clive/clive_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		Skeleton = gh_rocker_clive_3
		skeleton_path = 'skeletons/GH_Rocker_Clive_3.ske'
		ragdoll = rag_gh_rocker_clive_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_clive_3
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = clive_4
		frontend_desc = qs(0x5b7551c8)
		mesh = `models/gh_rockers/clive/clive_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		Skeleton = gh_rocker_clive_4
		skeleton_path = 'skeletons/GH_Rocker_Clive_4.ske'
		ragdoll = rag_gh_rocker_clive_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_clive_4
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = pandora_1
		frontend_desc = qs(0x90bdf944)
		mesh = `models/gh_rockers/pandora/pandora_1`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		Skeleton = gh_rocker_pandora_1
		skeleton_path = 'skeletons/GH_Rocker_Pandora_1.ske'
		ragdoll = rag_gh_rocker_pandora_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_pandora_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = pandora_2
		frontend_desc = qs(0x6c3c0092)
		mesh = `models/gh_rockers/pandora/pandora_2`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		Skeleton = gh_rocker_pandora_2
		skeleton_path = 'skeletons/GH_Rocker_Pandora_2.ske'
		ragdoll = rag_gh_rocker_pandora_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_pandora_2
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = pandora_3
		frontend_desc = qs(0x1e4b5eee)
		mesh = `models/gh_rockers/pandora/pandora_3`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		Skeleton = gh_rocker_pandora_3
		skeleton_path = 'skeletons/GH_Rocker_Pandora_3.ske'
		ragdoll = rag_gh_rocker_pandora_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_pandora_3
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
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
		Skeleton = gh_rocker_pandora_4
		skeleton_path = 'skeletons/GH_Rocker_Pandora_4.ske'
		ragdoll = rag_gh_rocker_pandora_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_pandora_4
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
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
		Skeleton = gh_rocker_eddie_1
		skeleton_path = 'skeletons/GH_Rocker_Eddie_1.ske'
		ragdoll = rag_gh_rocker_eddie_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rockereddie_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = eddie_2
		frontend_desc = qs(0x9ec204ee)
		mesh = `models/gh_rockers/eddie/eddie_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		Skeleton = gh_rocker_eddie_2
		skeleton_path = 'skeletons/GH_Rocker_Eddie_2.ske'
		ragdoll = rag_gh_rocker_eddie_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rockereddie_2
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = eddie_3
		frontend_desc = qs(0xaf16c5e3)
		mesh = `models/gh_rockers/eddie/eddie_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		Skeleton = gh_rocker_eddie_3
		skeleton_path = 'skeletons/GH_Rocker_Eddie_3.ske'
		ragdoll = rag_gh_rocker_eddie_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rockereddie_3
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = eddie_4
		frontend_desc = qs(0xf312cb64)
		mesh = `models/gh_rockers/eddie/eddie_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		Skeleton = gh_rocker_eddie_4
		skeleton_path = 'skeletons/GH_Rocker_Eddie_4.ske'
		ragdoll = rag_gh_rocker_eddie_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rockereddie_4
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = axel_1
		frontend_desc = qs(0xe9e3c0ec)
		mesh = `models/gh_rockers/axel/axel_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		Skeleton = gh_rocker_axel_1
		skeleton_path = 'skeletons/GH_Rocker_Axel_1.ske'
		ragdoll = rag_gh_rocker_axel_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_axel_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = axel_2
		frontend_desc = qs(0xb4310579)
		mesh = `models/gh_rockers/axel/axel_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		Skeleton = gh_rocker_axel_2
		skeleton_path = 'skeletons/GH_Rocker_Axel_2.ske'
		ragdoll = rag_gh_rocker_axel_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_axel_2
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = axel_3
		frontend_desc = qs(0xc49ccda8)
		mesh = `models/gh_rockers/axel/axel_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		Skeleton = gh_rocker_axel_3
		skeleton_path = 'skeletons/GH_Rocker_Axel_3.ske'
		ragdoll = rag_gh_rocker_axel_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_axel_3
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = axel_4
		frontend_desc = qs(0xb6af61b2)
		mesh = `models/gh_rockers/axel/axel_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		Skeleton = gh_rocker_axel_4
		skeleton_path = 'skeletons/GH_Rocker_Axel_4.ske'
		ragdoll = rag_gh_rocker_axel_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_axel_4
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = judy_3
		frontend_desc = qs(0xabc3319a)
		mesh = `models/gh_rockers/judy/judy_3`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		Skeleton = gh_rocker_judy_3
		skeleton_path = 'skeletons/GH_Rocker_Judy_3.ske'
		ragdoll = rag_gh_rocker_judy_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_judy_3
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = Judy_1
		frontend_desc = qs(0xc59fb258)
		mesh = `models/gh_rockers/judy/judy_1`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		Skeleton = gh_rocker_judy_1
		skeleton_path = 'skeletons/GH_Rocker_Judy_1.ske'
		ragdoll = rag_gh_rocker_judy_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_judy_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = Judy_2
		frontend_desc = qs(0x662a5870)
		mesh = `models/gh_rockers/judy/judy_2`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		Skeleton = gh_rocker_judy_2
		skeleton_path = 'skeletons/GH_Rocker_Judy_2.ske'
		ragdoll = rag_gh_rocker_judy_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_judy_2
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = judy_4
		frontend_desc = qs(0x53281066)
		mesh = `models/gh_rockers/judy/judy_4`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		Skeleton = gh_rocker_judy_4
		skeleton_path = 'skeletons/GH_Rocker_Judy_4.ske'
		ragdoll = rag_gh_rocker_judy_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_judy_4
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = izzy_1
		frontend_desc = qs(0x80c3cfb0)
		mesh = `models/gh_rockers/izzy/izzy_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		Skeleton = gh_rocker_izzy_1
		skeleton_path = 'skeletons/GH_Rocker_Izzy_1.ske'
		ragdoll = rag_gh_rocker_izzy_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_izzy_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = izzy_2
		frontend_desc = qs(0x4528a892)
		mesh = `models/gh_rockers/izzy/izzy_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		Skeleton = gh_rocker_izzy_2
		skeleton_path = 'skeletons/GH_Rocker_Izzy_2.ske'
		ragdoll = rag_gh_rocker_izzy_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_izzy_2
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = izzy_3
		frontend_desc = qs(0x1b097aa6)
		mesh = `models/gh_rockers/izzy/izzy_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		Skeleton = gh_rocker_izzy_3
		skeleton_path = 'skeletons/GH_Rocker_Izzy_3.ske'
		ragdoll = rag_gh_rocker_izzy_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_izzy_3
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = izzy_4
		frontend_desc = qs(0x4a95dc5c)
		mesh = `models/gh_rockers/izzy/izzy_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		Skeleton = gh_rocker_izzy_4
		skeleton_path = 'skeletons/GH_Rocker_Izzy_4.ske'
		ragdoll = rag_gh_rocker_izzy_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_izzy_4
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Johnny_1
		frontend_desc = qs(0x5c59e748)
		mesh = `models/gh_rockers/johnny/johnny_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		Skeleton = gh_rocker_johnny_1
		skeleton_path = 'skeletons/GH_Rocker_Johnny_1.ske'
		ragdoll = rag_gh_rocker_johnny_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_male
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Johnny_2
		frontend_desc = qs(0xe0314959)
		mesh = `models/gh_rockers/johnny/johnny_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		Skeleton = gh_rocker_johnny_2
		skeleton_path = 'skeletons/GH_Rocker_Johnny_2.ske'
		ragdoll = rag_gh_rocker_johnny_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_johnny_2
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = johnny_3
		frontend_desc = qs(0xd985de8e)
		mesh = `models/gh_rockers/johnny/johnny_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		Skeleton = gh_rocker_johnny_3
		skeleton_path = 'skeletons/GH_Rocker_Johnny_3.ske'
		ragdoll = rag_gh_rocker_johnny_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_johnny_3
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = johnny_4
		frontend_desc = qs(0xb72f9dd8)
		mesh = `models/gh_rockers/johnny/johnny_4`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		Skeleton = gh_rocker_johnny_4
		skeleton_path = 'skeletons/GH_Rocker_Johnny_4.ske'
		ragdoll = rag_gh_rocker_johnny_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_johnny_4
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = johnnycash_1
		frontend_desc = qs(0x3a825a9b)
		mesh = `models/gh_rockers/johnnycash/johnnycash_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnnycash
		Skeleton = gh_rocker_johnnycash_1
		skeleton_path = 'skeletons/GH_Rocker_JohnnyCash_1.ske'
		ragdoll = rag_gh_rocker_johnnycash_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_JohnnyCash_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_johnnycash_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		hidden
	}
	{
		desc_id = johnnycash_car
		frontend_desc = qs(0x3a825a9b)
		mesh = `models/gh_rockers/johnnycash/johnnycash_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnnycash_car
		Skeleton = gh_rocker_johnnycash_car
		skeleton_path = 'skeletons/GH_Rocker_JohnnyCash_CAR.ske'
		ragdoll = rag_gh_rocker_johnnycash_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_JohnnyCash_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_johnnycash_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = santana_1
		frontend_desc = qs(0xdbed6658)
		mesh = `models/gh_rockers/santana/santana_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_santana
		Skeleton = gh_rocker_santana_1
		skeleton_path = 'skeletons/GH_Rocker_Santana_1.ske'
		ragdoll = rag_gh_rocker_santana_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Santana_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_santana_1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = matt_bellamy
		frontend_desc = qs(0x0ccbf66e)
		mesh = `models/gh_rockers/mattbellamy/m_bellamy`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_m_bellamy
		Skeleton = gh_rocker_m_bellamy_1
		skeleton_path = 'skeletons/GH_Rocker_M_Bellamy_1.ske'
		ragdoll = rag_gh_rocker_m_bellamy_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_M_Bellamy_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_m_bellamy_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		hidden
	}
	{
		desc_id = matt_bellamy_car
		frontend_desc = qs(0x0ccbf66e)
		mesh = `models/gh_rockers/mattbellamy/m_bellamy`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_m_bellamy_car
		Skeleton = gh_rocker_m_bellamy_1_car
		skeleton_path = 'skeletons/GH_Rocker_M_Bellamy_1_CAR.ske'
		ragdoll = rag_gh_rocker_m_bellamy_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_M_Bellamy_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_m_bellamy_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = kurtcobain
		frontend_desc = qs(0xf3647ae9)
		mesh = `models/gh_rockers/kurtcobain/kurtcobain`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_kurtcobain
		Skeleton = gh_rocker_kurt_1
		skeleton_path = 'skeletons/GH_Rocker_Kurt_1.ske'
		ragdoll = rag_gh_rocker_kurt_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Kurt_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_kurt_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = kurtcobainlefty
		frontend_desc = qs(0xf3647ae9)
		mesh = `models/gh_rockers/kurtcobain/kurtcobain`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_kurtcobain
		Skeleton = gh_rocker_kurt_1
		skeleton_path = 'skeletons/GH_Rocker_Kurt_1.ske'
		ragdoll = rag_gh_rocker_kurt_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Kurt_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_kurt_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		lefty = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = shirleymanson
		frontend_desc = qs(0x99902597)
		mesh = `models/gh_rockers/shirleymanson/shirleymanson`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_shirleymanson
		Skeleton = gh_rocker_shirleymanson_1
		skeleton_path = 'skeletons/GH_Rocker_ShirleyManson_1.ske'
		ragdoll = rag_gh_rocker_shirleymanson_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_ShirleyManson_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_shirleymanson_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = frankenrocker
		frontend_desc = qs(0x1d374fc1)
		mesh = `models/gh_rockers/frankenrocker/frankenrocker`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_frankenrocker
		Skeleton = gh_rocker_frankenrocker_1
		skeleton_path = 'skeletons/GH_Rocker_FrankenRocker_1.ske'
		ragdoll = rag_gh_rocker_axel_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_axel_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = silhouette_m
		frontend_desc = qs(0x6b5f29e1)
		global_mesh = `models/gh_rockers/silhouette_m.skin`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_silhouette
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_male.ske'
		ragdoll = rag_gh_rocker_johnnycash_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_JohnnyCash_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_johnnycash_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = silhouette_gold
		frontend_desc = qs(0xa6b94703)
		mesh = `models/gh_rockers/silhouette_gold`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_silhouette_gold
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_male.ske'
		ragdoll = rag_gh_rocker_johnnycash_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_JohnnyCash_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_johnnycash_1
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Skeleton
		frontend_desc = qs(0x998b2c00)
		mesh = `models/talent/skeleton`
		$cas_full_body_common_settings_male
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ragdoll = ragdoll_rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_female
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
]
