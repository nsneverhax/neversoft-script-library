CAS_Full_Body_Common_Settings_Male = {
	body_specific_parts = {
		CAS_Physique = CAS_Male_Physique
	}
	is_female = 0
}
CAS_Full_Body_Common_Settings_Female = {
	body_specific_parts = {
		CAS_Physique = CAS_Female_Physique
	}
	is_female = 1
}
CAS_Full_Body = [
	{
		desc_id = BoneMan_Female
		frontend_desc = qs(0x3c309a3b)
		mesh = `models/CAR/Female/Boneman_Female`
		$CAS_Full_Body_Common_Settings_Female
		Skeleton = gh_rocker_female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		Ragdoll = ragdoll_Rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Female
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = avatar
		frontend_desc = qs(0xd1b24c56)
		use_avatar_mesh
		$CAS_Full_Body_Common_Settings_Male
		Skeleton = GH_Rocker_Avatar
		skeleton_path = 'skeletons/GH_Rocker_Avatar.ske'
		Ragdoll = ragdoll_Rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Male
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Quinton_1
		frontend_desc = qs(0x3adac740)
		mesh = `models/GH_Rockers/Quinton/Quinton_1`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Quinton
		Skeleton = GH_Rocker_Quinton_1
		skeleton_path = 'skeletons/GH_Rocker_Quinton_1.ske'
		Ragdoll = Rag_GH_Rocker_Quinton_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Quinton_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Quinton_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Quinton_2
		frontend_desc = qs(0xbe4e5fbc)
		mesh = `models/GH_Rockers/Quinton/Quinton_2`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Quinton
		Skeleton = GH_Rocker_Quinton_2
		skeleton_path = 'skeletons/GH_Rocker_Quinton_2.ske'
		Ragdoll = Rag_GH_Rocker_Quinton_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Quinton_2.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Quinton_2
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Quinton_3
		frontend_desc = qs(0x4e531538)
		mesh = `models/GH_Rockers/Quinton/Quinton_3`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Quinton
		Skeleton = GH_Rocker_Quinton_3
		skeleton_path = 'skeletons/GH_Rocker_Quinton_3.ske'
		Ragdoll = Rag_GH_Rocker_Quinton_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Quinton_3.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Quinton_3
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Quinton_4
		frontend_desc = qs(0x72ac64c4)
		mesh = `models/GH_Rockers/Quinton/Quinton_4`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Quinton
		Skeleton = GH_Rocker_Quinton_4
		skeleton_path = 'skeletons/GH_Rocker_Quinton_4.ske'
		Ragdoll = Rag_GH_Rocker_Quinton_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Quinton_4.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Quinton_4
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Casey_1
		frontend_desc = qs(0xe9ebe643)
		mesh = `models/GH_Rockers/Casey/Casey_5`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Casey
		Skeleton = gh_rocker_Casey_5
		skeleton_path = 'skeletons/GH_Rocker_Casey_5.ske'
		Ragdoll = Rag_GH_Rocker_Casey_5
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_5.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Casey_5
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = Casey_2
		frontend_desc = qs(0xb8a5a0cf)
		mesh = `models/GH_Rockers/Casey/Casey_4`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Casey
		Skeleton = gh_rocker_Casey_4
		skeleton_path = 'skeletons/GH_Rocker_Casey_4.ske'
		Ragdoll = Rag_GH_Rocker_Casey_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_4.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Casey_4
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = Casey_3
		frontend_desc = qs(0xfd0f76a3)
		mesh = `models/GH_Rockers/Casey/Casey_1`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Casey
		Skeleton = gh_rocker_Casey_1
		skeleton_path = 'skeletons/GH_Rocker_Casey_1.ske'
		Ragdoll = Rag_GH_Rocker_Casey_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Casey_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
		locked
	}
	{
		desc_id = Casey_4
		frontend_desc = qs(0xab075347)
		mesh = `models/GH_Rockers/Casey/Casey_3`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Casey
		Skeleton = gh_rocker_Casey_3
		skeleton_path = 'skeletons/GH_Rocker_Casey_3.ske'
		Ragdoll = Rag_GH_Rocker_Casey_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_3.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Casey_3
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = Midori_1
		frontend_desc = qs(0x148fb64a)
		mesh = `models/GH_Rockers/Midori/Midori_4`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Midori
		Skeleton = gh_rocker_Midori_4
		skeleton_path = 'skeletons/GH_Rocker_Midori_4.ske'
		Ragdoll = Rag_GH_Rocker_Midori_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Midori_4.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Midori_4
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		diff_anim = 'female_heels_high_d'
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = Midori_2
		frontend_desc = qs(0x9c3fab7a)
		mesh = `models/GH_Rockers/Midori/Midori_3`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Midori
		Skeleton = gh_rocker_Midori_3
		skeleton_path = 'skeletons/GH_Rocker_Midori_3.ske'
		Ragdoll = Rag_GH_Rocker_Midori_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Midori_3.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Midori_3
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = Midori_3
		frontend_desc = qs(0xc21bd72e)
		mesh = `models/GH_Rockers/Midori/Midori_2`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Midori
		Skeleton = gh_rocker_Midori_2
		skeleton_path = 'skeletons/GH_Rocker_Midori_2.ske'
		Ragdoll = Rag_GH_Rocker_Midori_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Midori_2.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Midori_2
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		diff_anim = 'female_heels_high_d'
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = Midori_4
		frontend_desc = qs(0x7ca653e4)
		mesh = `models/GH_Rockers/Midori/Midori_1`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Midori
		Skeleton = gh_rocker_Midori_1
		skeleton_path = 'skeletons/GH_Rocker_Midori_1.ske'
		Ragdoll = Rag_GH_Rocker_Midori_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Midori_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Midori_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = Clive_1
		frontend_desc = qs(0xe0cb62ad)
		mesh = `models/GH_Rockers/Clive/Clive_5`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Clive
		Skeleton = gh_rocker_Clive_5
		skeleton_path = 'skeletons/GH_Rocker_Clive_5.ske'
		Ragdoll = Rag_GH_Rocker_Clive_5
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_5.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Clive_5
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Clive_2
		frontend_desc = qs(0x64d85c64)
		mesh = `models/GH_Rockers/Clive/Clive_1`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Clive
		Skeleton = gh_rocker_Clive_1
		skeleton_path = 'skeletons/GH_Rocker_Clive_1.ske'
		Ragdoll = Rag_GH_Rocker_Clive_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Clive_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Clive_3
		frontend_desc = qs(0x64cda132)
		mesh = `models/GH_Rockers/Clive/Clive_2`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Clive
		Skeleton = gh_rocker_Clive_2
		skeleton_path = 'skeletons/GH_Rocker_Clive_2.ske'
		Ragdoll = Rag_GH_Rocker_Clive_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_2.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Clive_2
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Clive_4
		frontend_desc = qs(0xb2484b2b)
		mesh = `models/GH_Rockers/Clive/Clive_3`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Clive
		Skeleton = gh_rocker_Clive_3
		skeleton_path = 'skeletons/GH_Rocker_Clive_3.ske'
		Ragdoll = Rag_GH_Rocker_Clive_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Clive_3.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Clive_3
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Pandora_1
		frontend_desc = qs(0x4b0b1164)
		mesh = `models/GH_Rockers/Pandora/Pandora_5`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Pandora
		Skeleton = gh_rocker_Pandora_5
		skeleton_path = 'skeletons/GH_Rocker_Pandora_5.ske'
		Ragdoll = Rag_GH_Rocker_Pandora_5
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_5.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Pandora_5
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_med_d'
	}
	{
		desc_id = Pandora_2
		frontend_desc = qs(0x90bdf944)
		mesh = `models/GH_Rockers/Pandora/Pandora_1`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Pandora
		Skeleton = gh_rocker_Pandora_1
		skeleton_path = 'skeletons/GH_Rocker_Pandora_1.ske'
		Ragdoll = Rag_GH_Rocker_Pandora_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Pandora_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = Pandora_3
		frontend_desc = qs(0x1e4b5eee)
		mesh = `models/GH_Rockers/Pandora/Pandora_3`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Pandora
		Skeleton = gh_rocker_Pandora_3
		skeleton_path = 'skeletons/GH_Rocker_Pandora_3.ske'
		Ragdoll = Rag_GH_Rocker_Pandora_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_3.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Pandora_3
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_highplat_d'
		locked
	}
	{
		desc_id = Pandora_4
		frontend_desc = qs(0x65d372d7)
		mesh = `models/GH_Rockers/Pandora/Pandora_4`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Pandora
		Skeleton = gh_rocker_Pandora_4
		skeleton_path = 'skeletons/GH_Rocker_Pandora_4.ske'
		Ragdoll = Rag_GH_Rocker_Pandora_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Pandora_4.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Pandora_4
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		locked
		diff_anim = 'female_heels_highplat_d'
	}
	{
		desc_id = Eddie_1
		frontend_desc = qs(0xb860f923)
		mesh = `models/GH_Rockers/Eddie/Eddie_5`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Eddie
		Skeleton = gh_rocker_Eddie_5
		skeleton_path = 'skeletons/GH_Rocker_Eddie_5.ske'
		Ragdoll = Rag_GH_Rocker_Eddie_5
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_5.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_RockerEddie_5
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Eddie_2
		frontend_desc = qs(0x24d4343d)
		mesh = `models/GH_Rockers/Eddie/Eddie_1`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Eddie
		Skeleton = gh_rocker_Eddie_1
		skeleton_path = 'skeletons/GH_Rocker_Eddie_1.ske'
		Ragdoll = Rag_GH_Rocker_Eddie_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_RockerEddie_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Eddie_3
		frontend_desc = qs(0xab630e48)
		mesh = `models/GH_Rockers/Eddie/Eddie_2`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Eddie
		Skeleton = gh_rocker_Eddie_2
		skeleton_path = 'skeletons/GH_Rocker_Eddie_2.ske'
		Ragdoll = Rag_GH_Rocker_Eddie_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_2.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_RockerEddie_2
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Eddie_4
		frontend_desc = qs(0x0d3b34b3)
		mesh = `models/GH_Rockers/Eddie/Eddie_3`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Eddie
		Skeleton = gh_rocker_Eddie_3
		skeleton_path = 'skeletons/GH_Rocker_Eddie_3.ske'
		Ragdoll = Rag_GH_Rocker_Eddie_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Eddie_3.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_RockerEddie_3
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Axel_1
		frontend_desc = qs(0x3c89212a)
		mesh = `models/GH_Rockers/Axel/Axel_5`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Axel
		Skeleton = gh_rocker_Axel_5
		skeleton_path = 'skeletons/GH_Rocker_Axel_5.ske'
		Ragdoll = Rag_GH_Rocker_Axel_5
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_5.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Axel_5
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		large_hands = 1
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Axel_2
		frontend_desc = qs(0xe9e3c0ec)
		mesh = `models/GH_Rockers/Axel/Axel_1`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Axel
		Skeleton = gh_rocker_Axel_1
		skeleton_path = 'skeletons/GH_Rocker_Axel_1.ske'
		Ragdoll = Rag_GH_Rocker_Axel_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Axel_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		large_hands = 1
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Axel_3
		frontend_desc = qs(0xb4310579)
		mesh = `models/GH_Rockers/Axel/Axel_2`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Axel
		Skeleton = gh_rocker_Axel_2
		skeleton_path = 'skeletons/GH_Rocker_Axel_2.ske'
		Ragdoll = Rag_GH_Rocker_Axel_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_2.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Axel_2
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Axel_4
		frontend_desc = qs(0xc49ccda8)
		mesh = `models/GH_Rockers/Axel/Axel_3`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Axel
		Skeleton = gh_rocker_Axel_3
		skeleton_path = 'skeletons/GH_Rocker_Axel_3.ske'
		Ragdoll = Rag_GH_Rocker_Axel_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_3.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Axel_3
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Judy_1
		frontend_desc = qs(0x2d8b9794)
		mesh = `models/GH_Rockers/Judy/Judy_5`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Judy
		Skeleton = gh_rocker_Judy_5
		skeleton_path = 'skeletons/GH_Rocker_Judy_5.ske'
		Ragdoll = Rag_GH_Rocker_Judy_5
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_5.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Judy_5
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = Judy_2
		frontend_desc = qs(0xc2d2c3c2)
		mesh = `models/GH_Rockers/Judy/Judy_3`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Judy
		Skeleton = gh_rocker_Judy_3
		skeleton_path = 'skeletons/GH_Rocker_Judy_3.ske'
		Ragdoll = Rag_GH_Rocker_Judy_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_3.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Judy_3
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = Judy_3
		frontend_desc = qs(0xc59fb258)
		mesh = `models/GH_Rockers/Judy/Judy_1`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Judy
		Skeleton = gh_rocker_Judy_1
		skeleton_path = 'skeletons/GH_Rocker_Judy_1.ske'
		Ragdoll = Rag_GH_Rocker_Judy_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Judy_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = Judy_4
		frontend_desc = qs(0x662a5870)
		mesh = `models/GH_Rockers/Judy/Judy_2`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_Judy
		Skeleton = gh_rocker_Judy_2
		skeleton_path = 'skeletons/GH_Rocker_Judy_2.ske'
		Ragdoll = Rag_GH_Rocker_Judy_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Judy_2.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Judy_2
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		locked
	}
	{
		desc_id = Izzy_1
		frontend_desc = qs(0xae759192)
		mesh = `models/GH_Rockers/Izzy/Izzy_5`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Izzy
		Skeleton = GH_Rocker_Izzy_5
		skeleton_path = 'skeletons/GH_Rocker_Izzy_5.ske'
		Ragdoll = Rag_GH_Rocker_Izzy_5
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_5.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Izzy_5
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Izzy_2
		frontend_desc = qs(0x80c3cfb0)
		mesh = `models/GH_Rockers/Izzy/Izzy_1`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Izzy
		Skeleton = gh_rocker_Izzy_1
		skeleton_path = 'skeletons/GH_Rocker_Izzy_1.ske'
		Ragdoll = Rag_GH_Rocker_Izzy_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Izzy_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Izzy_3
		frontend_desc = qs(0x4528a892)
		mesh = `models/GH_Rockers/Izzy/Izzy_2`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Izzy
		Skeleton = gh_rocker_Izzy_2
		skeleton_path = 'skeletons/GH_Rocker_Izzy_2.ske'
		Ragdoll = Rag_GH_Rocker_Izzy_2
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_2.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Izzy_2
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Izzy_4
		frontend_desc = qs(0x1b097aa6)
		mesh = `models/GH_Rockers/Izzy/Izzy_3`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Izzy
		Skeleton = gh_rocker_Izzy_3
		skeleton_path = 'skeletons/GH_Rocker_Izzy_3.ske'
		Ragdoll = Rag_GH_Rocker_Izzy_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Izzy_3.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Izzy_3
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Johnny_1
		frontend_desc = qs(0x2283435e)
		mesh = `models/GH_Rockers/Johnny/Johnny_5`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Johnny
		Skeleton = GH_Rocker_Johnny_5
		skeleton_path = 'skeletons/GH_Rocker_Johnny_5.ske'
		Ragdoll = Rag_GH_Rocker_Johnny_5
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_5.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Johnny_5
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Johnny_2
		frontend_desc = qs(0xe0314959)
		mesh = `models/GH_Rockers/Johnny/Johnny_1`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Johnny
		Skeleton = gh_rocker_Johnny_1
		skeleton_path = 'skeletons/GH_Rocker_Johnny_1.ske'
		Ragdoll = Rag_GH_Rocker_Johnny_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Male
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Johnny_3
		frontend_desc = qs(0xd985de8e)
		mesh = `models/GH_Rockers/Johnny/Johnny_3`
		locked
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Johnny
		Skeleton = gh_rocker_Johnny_3
		skeleton_path = 'skeletons/GH_Rocker_Johnny_3.ske'
		Ragdoll = Rag_GH_Rocker_Johnny_3
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_3.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Johnny_3
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Johnny_4
		frontend_desc = qs(0xb72f9dd8)
		mesh = `models/GH_Rockers/Johnny/Johnny_4`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Johnny
		Skeleton = gh_rocker_Johnny_4
		skeleton_path = 'skeletons/GH_Rocker_Johnny_4.ske'
		Ragdoll = Rag_GH_Rocker_Johnny_4
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Johnny_4.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Johnny_4
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = AdamLevine
		frontend_desc = qs(0x1198e746)
		mesh = `models/GH_Rockers/AdamLevine/AdamLevine`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_AdamLevine
		Skeleton = GH_Rocker_AdamLevine_1
		skeleton_path = 'skeletons/GH_Rocker_AdamLevine_1.ske'
		Ragdoll = Rag_GH_Rocker_AdamLevine_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_AdamLevine_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_AdamLevine_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = TaylorSwift
		frontend_desc = qs(0x3a7cbe0e)
		mesh = `models/GH_Rockers/TaylorSwift/TaylorSwift`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_TaylorSwift
		Skeleton = GH_Rocker_TaylorSwift_1
		skeleton_path = 'skeletons/GH_Rocker_TaylorSwift_1.ske'
		Ragdoll = Rag_GH_Rocker_TaylorSwift_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_TaylorSwift_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_TaylorSwift_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = TaylorSwift2
		frontend_desc = qs(0x5f2add08)
		mesh = `models/GH_Rockers/TaylorSwift/TaylorSwift2`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_TaylorSwift
		Skeleton = GH_Rocker_TaylorSwift_1
		skeleton_path = 'skeletons/GH_Rocker_TaylorSwift_1.ske'
		Ragdoll = Rag_GH_Rocker_TaylorSwift_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_TaylorSwift_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_TaylorSwift_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = TaylorSwift3
		frontend_desc = qs(0x4631ec49)
		mesh = `models/GH_Rockers/TaylorSwift/TaylorSwift2`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_TaylorSwift
		Skeleton = GH_Rocker_TaylorSwift_3
		skeleton_path = 'skeletons/GH_Rocker_TaylorSwift_3.ske'
		Ragdoll = Rag_GH_Rocker_TaylorSwift_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_TaylorSwift_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_TaylorSwift_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = GwenStefani
		frontend_desc = qs(0x3cdee9de)
		mesh = `models/GH_Rockers/GwenStefani/GwenStefani`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_GwenStefani
		Skeleton = GH_Rocker_GwenStefani
		skeleton_path = 'skeletons/GH_Rocker_GwenStefani.ske'
		Ragdoll = Rag_GH_Rocker_GwenStefani
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_GwenStefani.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_GwenStefani
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = GwenStefani2
		frontend_desc = qs(0x2b1ddae2)
		mesh = `models/GH_Rockers/GwenStefani/GwenStefani2`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_GwenStefani
		Skeleton = GH_Rocker_GwenStefani
		skeleton_path = 'skeletons/GH_Rocker_GwenStefani.ske'
		Ragdoll = Rag_GH_Rocker_GwenStefani
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_GwenStefani.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_GwenStefani
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = TomDumont
		frontend_desc = qs(0xe7c54951)
		mesh = `models/GH_Rockers/TomDumont/TomDumont`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_TomDumont
		Skeleton = GH_Rocker_TomDumont_1
		skeleton_path = 'skeletons/GH_Rocker_TomDumont_1.ske'
		Ragdoll = Rag_GH_Rocker_TomDumont_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_TomDumont_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_TomDumont_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = TonyKanal
		frontend_desc = qs(0x5cb56267)
		mesh = `models/GH_Rockers/TonyKanal/TonyKanal`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_TonyKanal
		Skeleton = GH_Rocker_TonyKanal_1
		skeleton_path = 'skeletons/GH_Rocker_TonyKanal_1.ske'
		Ragdoll = Rag_GH_Rocker_TonyKanal_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_TonyKanal_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_TonyKanal_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = AdrianYoung
		frontend_desc = qs(0x34c37d34)
		mesh = `models/GH_Rockers/AdrianYoung/AdrianYoung`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_AdrianYoung
		Skeleton = GH_Rocker_AdrianYoung_1
		skeleton_path = 'skeletons/GH_Rocker_AdrianYoung_1.ske'
		Ragdoll = Rag_GH_Rocker_AdrianYoung_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_AdrianYoung_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_AdrianYoung_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Vbot
		frontend_desc = qs(0x24f300ab)
		mesh = `models/GH_Rockers/VBot/VBot`
		$CAS_Full_Body_Common_Settings_Female
		ghrocker = GH_Rocker_VBot
		Skeleton = gh_rocker_Casey_5
		skeleton_path = 'skeletons/GH_Rocker_Casey_5.ske'
		Ragdoll = Rag_GH_Rocker_Casey_5
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Casey_5.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Casey_5
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = FrankenRocker
		frontend_desc = qs(0x1d374fc1)
		mesh = `models/GH_Rockers/FrankenRocker/FrankenRocker`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_FrankenRocker
		Skeleton = gh_rocker_FrankenRocker_1
		skeleton_path = 'skeletons/GH_Rocker_FrankenRocker_1.ske'
		Ragdoll = Rag_GH_Rocker_Axel_1
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Axel_1.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Axel_1
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		large_hands = 1
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = Silhouette_M
		frontend_desc = qs(0x6b5f29e1)
		global_mesh = `models/gh_rockers/silhouette_m.skin`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Silhouette
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		Ragdoll = ragdoll_Rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Female
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Silhouette_Gold
		frontend_desc = qs(0xa6b94703)
		mesh = `models/gh_rockers/silhouette_gold`
		$CAS_Full_Body_Common_Settings_Male
		ghrocker = GH_Rocker_Silhouette_Gold
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		Ragdoll = ragdoll_Rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Female
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Skeleton
		frontend_desc = qs(0x998b2c00)
		mesh = `models/Talent/Skeleton`
		$CAS_Full_Body_Common_Settings_Male
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		Ragdoll = ragdoll_Rocker_male
		ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Female
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = car_male_anim_struct
	}
]
