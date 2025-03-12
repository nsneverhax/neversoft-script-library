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
		skeleton = gh_rocker_female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		ragdoll = ragdoll_rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_female
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = avatar
		frontend_desc = qs(0xd1b24c56)
		use_avatar_mesh
		$cas_full_body_common_settings_male
		skeleton = gh_rocker_avatar
		skeleton_path = 'skeletons/GH_Rocker_Avatar.ske'
		ragdoll = ragdoll_rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_male
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = 0x77edc2fe
		frontend_desc = qs(0x3adac740)
		mesh = 0xb9e71bdc
		$cas_full_body_common_settings_male
		ghrocker = 0xdbbe2b30
		skeleton = 0x1f0755ac
		skeleton_path = 'skeletons/GH_Rocker_Quinton_1.ske'
		ragdoll = 0xaaf2b82d
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Quinton_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x3a721a91
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = 0xeee49344
		frontend_desc = qs(0xbe4e5fbc)
		mesh = 0x20ee4a66
		$cas_full_body_common_settings_male
		ghrocker = 0xdbbe2b30
		skeleton = 0x860e0416
		skeleton_path = 'skeletons/GH_Rocker_Quinton_2.ske'
		ragdoll = 0x33fbe997
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Quinton_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0xa37b4b2b
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = 0x99e3a3d2
		frontend_desc = qs(0x4e531538)
		mesh = 0x57e97af0
		$cas_full_body_common_settings_male
		ghrocker = 0xdbbe2b30
		skeleton = 0xf1093480
		skeleton_path = 'skeletons/GH_Rocker_Quinton_3.ske'
		ragdoll = 0x44fcd901
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Quinton_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0xd47c7bbd
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = 0x07873671
		frontend_desc = qs(0x72ac64c4)
		mesh = 0xc98def53
		$cas_full_body_common_settings_male
		ghrocker = 0xdbbe2b30
		skeleton = 0x6f6da123
		skeleton_path = 'skeletons/GH_Rocker_Quinton_4.ske'
		ragdoll = 0xda984ca2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Quinton_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x4a18ee1e
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = casey_1
		frontend_desc = qs(0xe9ebe643)
		mesh = 0xb5de1a42
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		skeleton = 0x65cec3a4
		skeleton_path = 'skeletons/GH_Rocker_Casey_5.ske'
		ragdoll = 0x28acde16
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_5.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x22870cb0
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = casey_2
		frontend_desc = qs(0xb8a5a0cf)
		mesh = `models/gh_rockers/casey/casey_4`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		skeleton = gh_rocker_casey_4
		skeleton_path = 'skeletons/GH_Rocker_Casey_4.ske'
		ragdoll = rag_gh_rocker_casey_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_casey_4
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = casey_3
		frontend_desc = qs(0xfd0f76a3)
		mesh = `models/gh_rockers/casey/casey_1`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		skeleton = gh_rocker_casey_1
		skeleton_path = 'skeletons/GH_Rocker_Casey_1.ske'
		ragdoll = rag_gh_rocker_casey_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_casey_1
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
		locked
	}
	{
		desc_id = casey_4
		frontend_desc = qs(0xab075347)
		mesh = `models/gh_rockers/casey/casey_3`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_casey
		skeleton = gh_rocker_casey_3
		skeleton_path = 'skeletons/GH_Rocker_Casey_3.ske'
		ragdoll = rag_gh_rocker_casey_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_casey_3
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = midori_1
		frontend_desc = qs(0x148fb64a)
		mesh = 0x05a39ce9
		$cas_full_body_common_settings_female
		ghrocker = 0x9877ee7e
		skeleton = gh_rocker_midori_4
		skeleton_path = 'skeletons/GH_Rocker_Midori_4.ske'
		ragdoll = 0xcfbb06e3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Midori_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_midori_4
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		diff_anim = 'female_heels_high_d'
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = midori_2
		frontend_desc = qs(0x9c3fab7a)
		mesh = 0x9bc7094a
		$cas_full_body_common_settings_female
		ghrocker = 0x9877ee7e
		skeleton = gh_rocker_midori_3
		skeleton_path = 'skeletons/GH_Rocker_Midori_3.ske'
		ragdoll = 0x51df9340
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Midori_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_midori_3
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = midori_3
		frontend_desc = qs(0xc21bd72e)
		mesh = 0xecc039dc
		$cas_full_body_common_settings_female
		ghrocker = 0x9877ee7e
		skeleton = gh_rocker_midori_2
		skeleton_path = 'skeletons/GH_Rocker_Midori_2.ske'
		ragdoll = 0x26d8a3d6
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Midori_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_midori_2
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		diff_anim = 'female_heels_high_d'
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = midori_4
		frontend_desc = qs(0x7ca653e4)
		mesh = 0x75c96866
		$cas_full_body_common_settings_female
		ghrocker = 0x9877ee7e
		skeleton = gh_rocker_midori_1
		skeleton_path = 'skeletons/GH_Rocker_Midori_1.ske'
		ragdoll = 0xbfd1f26c
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Midori_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_midori_1
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = clive_1
		frontend_desc = qs(0xe0cb62ad)
		mesh = 0x201b32f5
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		skeleton = 0xa490fd3c
		skeleton_path = 'skeletons/GH_Rocker_Clive_5.ske'
		ragdoll = 0xe9f2e08e
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_5.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0xe3d93228
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = clive_2
		frontend_desc = qs(0x64d85c64)
		mesh = `models/gh_rockers/clive/clive_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		skeleton = gh_rocker_clive_1
		skeleton_path = 'skeletons/GH_Rocker_Clive_1.ske'
		ragdoll = rag_gh_rocker_clive_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_clive_1
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = clive_3
		frontend_desc = qs(0x64cda132)
		mesh = `models/gh_rockers/clive/clive_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		skeleton = gh_rocker_clive_2
		skeleton_path = 'skeletons/GH_Rocker_Clive_2.ske'
		ragdoll = rag_gh_rocker_clive_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_clive_2
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = clive_4
		frontend_desc = qs(0xb2484b2b)
		mesh = `models/gh_rockers/clive/clive_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_clive
		skeleton = gh_rocker_clive_3
		skeleton_path = 'skeletons/GH_Rocker_Clive_3.ske'
		ragdoll = rag_gh_rocker_clive_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_clive_3
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = pandora_1
		frontend_desc = qs(0x4b0b1164)
		mesh = 0x2524ea25
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		skeleton = 0x2dc3c923
		skeleton_path = 'skeletons/GH_Rocker_Pandora_5.ske'
		ragdoll = 0x983624a2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_5.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x08b6861e
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_med_d'
	}
	{
		desc_id = pandora_2
		frontend_desc = qs(0x90bdf944)
		mesh = `models/gh_rockers/pandora/pandora_1`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		skeleton = gh_rocker_pandora_1
		skeleton_path = 'skeletons/GH_Rocker_Pandora_1.ske'
		ragdoll = rag_gh_rocker_pandora_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_pandora_1
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = pandora_3
		frontend_desc = qs(0x1e4b5eee)
		mesh = `models/gh_rockers/pandora/pandora_3`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		skeleton = gh_rocker_pandora_3
		skeleton_path = 'skeletons/GH_Rocker_Pandora_3.ske'
		ragdoll = rag_gh_rocker_pandora_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_pandora_3
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_highplat_d'
		locked
	}
	{
		desc_id = pandora_4
		frontend_desc = qs(0x65d372d7)
		mesh = `models/gh_rockers/pandora/pandora_4`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_pandora
		skeleton = gh_rocker_pandora_4
		skeleton_path = 'skeletons/GH_Rocker_Pandora_4.ske'
		ragdoll = rag_gh_rocker_pandora_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_pandora_4
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
		diff_anim = 'female_heels_highplat_d'
	}
	{
		desc_id = eddie_1
		frontend_desc = qs(0xb860f923)
		mesh = 0xe4aa389b
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		skeleton = 0xdbf9c913
		skeleton_path = 'skeletons/GH_Rocker_Eddie_5.ske'
		ragdoll = 0x969bd4a1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_5.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x0df1f0ce
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = eddie_2
		frontend_desc = qs(0x24d4343d)
		mesh = `models/gh_rockers/eddie/eddie_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		skeleton = gh_rocker_eddie_1
		skeleton_path = 'skeletons/GH_Rocker_Eddie_1.ske'
		ragdoll = rag_gh_rocker_eddie_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rockereddie_1
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = eddie_3
		frontend_desc = qs(0xab630e48)
		mesh = `models/gh_rockers/eddie/eddie_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		skeleton = gh_rocker_eddie_2
		skeleton_path = 'skeletons/GH_Rocker_Eddie_2.ske'
		ragdoll = rag_gh_rocker_eddie_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rockereddie_2
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = eddie_4
		frontend_desc = qs(0x0d3b34b3)
		mesh = `models/gh_rockers/eddie/eddie_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_eddie
		skeleton = gh_rocker_eddie_3
		skeleton_path = 'skeletons/GH_Rocker_Eddie_3.ske'
		ragdoll = rag_gh_rocker_eddie_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rockereddie_3
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = axel_1
		frontend_desc = qs(0x3c89212a)
		mesh = 0xbd338d67
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		skeleton = 0x4a380e3b
		skeleton_path = 'skeletons/GH_Rocker_Axel_5.ske'
		ragdoll = 0x9a44e45b
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_5.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0xb13865d5
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = axel_2
		frontend_desc = qs(0xe9e3c0ec)
		mesh = `models/gh_rockers/axel/axel_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		skeleton = gh_rocker_axel_1
		skeleton_path = 'skeletons/GH_Rocker_Axel_1.ske'
		ragdoll = rag_gh_rocker_axel_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_axel_1
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = axel_3
		frontend_desc = qs(0xb4310579)
		mesh = `models/gh_rockers/axel/axel_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		skeleton = gh_rocker_axel_2
		skeleton_path = 'skeletons/GH_Rocker_Axel_2.ske'
		ragdoll = rag_gh_rocker_axel_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_axel_2
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = axel_4
		frontend_desc = qs(0xc49ccda8)
		mesh = `models/gh_rockers/axel/axel_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_axel
		skeleton = gh_rocker_axel_3
		skeleton_path = 'skeletons/GH_Rocker_Axel_3.ske'
		ragdoll = rag_gh_rocker_axel_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_axel_3
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = judy_1
		frontend_desc = qs(0x2d8b9794)
		mesh = 0x78ca9813
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		skeleton = 0x7a3e3cb7
		skeleton_path = 'skeletons/GH_Rocker_Judy_5.ske'
		ragdoll = 0xaa42d6d7
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_5.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x813e5759
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = judy_2
		frontend_desc = qs(0xc2d2c3c2)
		mesh = `models/gh_rockers/judy/judy_3`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		skeleton = gh_rocker_judy_3
		skeleton_path = 'skeletons/GH_Rocker_Judy_3.ske'
		ragdoll = rag_gh_rocker_judy_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_judy_3
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = judy_3
		frontend_desc = qs(0xc59fb258)
		mesh = `models/gh_rockers/judy/judy_1`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		skeleton = gh_rocker_judy_1
		skeleton_path = 'skeletons/GH_Rocker_Judy_1.ske'
		ragdoll = rag_gh_rocker_judy_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_judy_1
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = judy_4
		frontend_desc = qs(0x662a5870)
		mesh = `models/gh_rockers/judy/judy_2`
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_judy
		skeleton = gh_rocker_judy_2
		skeleton_path = 'skeletons/GH_Rocker_Judy_2.ske'
		ragdoll = rag_gh_rocker_judy_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_judy_2
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = izzy_1
		frontend_desc = qs(0xae759192)
		mesh = 0xc023f9af
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		skeleton = 0xce3cf964
		skeleton_path = 'skeletons/GH_Rocker_Izzy_5.ske'
		ragdoll = 0x1e401304
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_5.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x353c928a
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = izzy_2
		frontend_desc = qs(0x80c3cfb0)
		mesh = `models/gh_rockers/izzy/izzy_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		skeleton = gh_rocker_izzy_1
		skeleton_path = 'skeletons/GH_Rocker_Izzy_1.ske'
		ragdoll = rag_gh_rocker_izzy_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_izzy_1
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = izzy_3
		frontend_desc = qs(0x4528a892)
		mesh = `models/gh_rockers/izzy/izzy_2`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		skeleton = gh_rocker_izzy_2
		skeleton_path = 'skeletons/GH_Rocker_Izzy_2.ske'
		ragdoll = rag_gh_rocker_izzy_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_2.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_izzy_2
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = izzy_4
		frontend_desc = qs(0x1b097aa6)
		mesh = `models/gh_rockers/izzy/izzy_3`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_izzy
		skeleton = gh_rocker_izzy_3
		skeleton_path = 'skeletons/GH_Rocker_Izzy_3.ske'
		ragdoll = rag_gh_rocker_izzy_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_izzy_3
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = johnny_1
		frontend_desc = qs(0x2283435e)
		mesh = 0xb664541c
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		skeleton = 0xb8c01877
		skeleton_path = 'skeletons/GH_Rocker_Johnny_5.ske'
		ragdoll = 0x9de2a8ca
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_5.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0xa25d85c5
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = johnny_2
		frontend_desc = qs(0xe0314959)
		mesh = `models/gh_rockers/johnny/johnny_1`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		skeleton = gh_rocker_johnny_1
		skeleton_path = 'skeletons/GH_Rocker_Johnny_1.ske'
		ragdoll = rag_gh_rocker_johnny_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_male
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = johnny_3
		frontend_desc = qs(0xd985de8e)
		mesh = `models/gh_rockers/johnny/johnny_3`
		locked
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnny
		skeleton = gh_rocker_johnny_3
		skeleton_path = 'skeletons/GH_Rocker_Johnny_3.ske'
		ragdoll = rag_gh_rocker_johnny_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_3.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_johnny_3
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
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
		skeleton = gh_rocker_johnny_4
		skeleton_path = 'skeletons/GH_Rocker_Johnny_4.ske'
		ragdoll = rag_gh_rocker_johnny_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_4.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_johnny_4
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = 0x34ef4e62
		frontend_desc = qs(0x1198e746)
		mesh = 0x6c0fdb02
		$cas_full_body_common_settings_male
		ghrocker = 0xb1e2942d
		skeleton = 0xbbb5fdf1
		skeleton_path = 'skeletons/GH_Rocker_AdamLevine_1.ske'
		ragdoll = 0x7d4507c1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_AdamLevine_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0xc0885d6e
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = 0x6fa5db01
		frontend_desc = qs(0x3a7cbe0e)
		mesh = 0x2976b3a1
		$cas_full_body_common_settings_female
		ghrocker = 0x89438ada
		skeleton = 0x1a478f49
		skeleton_path = 'skeletons/GH_Rocker_TaylorSwift_1.ske'
		ragdoll = 0x3c584f1f
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_TaylorSwift_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x7a8c3c3c
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = 0xbfbfc4cd
		frontend_desc = qs(0x5f2add08)
		mesh = 0x692fb44d
		$cas_full_body_common_settings_female
		ghrocker = 0x89438ada
		skeleton = 0x1a478f49
		skeleton_path = 'skeletons/GH_Rocker_TaylorSwift_1.ske'
		ragdoll = 0x3c584f1f
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_TaylorSwift_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x7a8c3c3c
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = 0xc8b8f45b
		frontend_desc = qs(0x4631ec49)
		mesh = 0x692fb44d
		$cas_full_body_common_settings_female
		ghrocker = 0x89438ada
		skeleton = 0xf449ee65
		skeleton_path = 'skeletons/GH_Rocker_TaylorSwift_3.ske'
		ragdoll = 0x3c584f1f
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_TaylorSwift_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x7a8c3c3c
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = 0xae3ece6a
		frontend_desc = qs(0x3cdee9de)
		mesh = 0xf87b6250
		$cas_full_body_common_settings_female
		ghrocker = 0x48d89fb1
		skeleton = 0x48d89fb1
		skeleton_path = 'skeletons/GH_Rocker_GwenStefani.ske'
		ragdoll = 0xb4fb1d8b
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_GwenStefani.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0xc453ae7b
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = 0x651ee708
		frontend_desc = qs(0x2b1ddae2)
		mesh = 0xa3447b16
		$cas_full_body_common_settings_female
		ghrocker = 0x48d89fb1
		skeleton = 0x48d89fb1
		skeleton_path = 'skeletons/GH_Rocker_GwenStefani.ske'
		ragdoll = 0xb4fb1d8b
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_GwenStefani.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0xc453ae7b
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = 0xd3959486
		frontend_desc = qs(0xe7c54951)
		mesh = 0x137373bc
		$cas_full_body_common_settings_male
		ghrocker = 0xbb7f03d4
		skeleton = 0x10a0ab7f
		skeleton_path = 'skeletons/GH_Rocker_TomDumont_1.ske'
		ragdoll = 0xec832945
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_TomDumont_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x9c2b9ab5
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = 0x5d05e7ab
		frontend_desc = qs(0x5cb56267)
		mesh = 0x19c752bf
		$cas_full_body_common_settings_male
		ghrocker = 0x35ef70f9
		skeleton = 0xf9865f86
		skeleton_path = 'skeletons/GH_Rocker_TonyKanal_1.ske'
		ragdoll = 0x05a5ddbc
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_TonyKanal_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x750d6e4c
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = 0x3ef5a7db
		frontend_desc = qs(0x34c37d34)
		mesh = 0xe6a801bf
		$cas_full_body_common_settings_male
		ghrocker = 0xd813f600
		skeleton = 0x3823ce9b
		skeleton_path = 'skeletons/GH_Rocker_AdrianYoung_1.ske'
		ragdoll = 0x1e3c0ecd
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_AdrianYoung_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x58e87dee
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = 0x6eb102a0
		frontend_desc = qs(0x24f300ab)
		mesh = 0x9a47d87d
		$cas_full_body_common_settings_female
		ghrocker = 0x26ab6f0d
		skeleton = 0x65cec3a4
		skeleton_path = 'skeletons/GH_Rocker_Casey_5.ske'
		ragdoll = 0x28acde16
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_5.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = 0x22870cb0
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = frankenrocker
		frontend_desc = qs(0x1d374fc1)
		mesh = `models/gh_rockers/frankenrocker/frankenrocker`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_frankenrocker
		skeleton = gh_rocker_frankenrocker_1
		skeleton_path = 'skeletons/GH_Rocker_FrankenRocker_1.ske'
		ragdoll = rag_gh_rocker_axel_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_1.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_axel_1
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
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
		skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ragdoll = ragdoll_rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_female
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = silhouette_gold
		frontend_desc = qs(0xa6b94703)
		mesh = `models/gh_rockers/silhouette_gold`
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_silhouette_gold
		skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ragdoll = ragdoll_rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_female
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = skeleton
		frontend_desc = qs(0x998b2c00)
		mesh = `models/talent/skeleton`
		$cas_full_body_common_settings_male
		skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ragdoll = ragdoll_rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_female
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
]
