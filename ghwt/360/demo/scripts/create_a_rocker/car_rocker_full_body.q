cas_full_body = [
	{
		desc_id = boneman_female
		frontend_desc = qs(0x3c309a3b)
		mesh = 'models/CAR/Female/Boneman_Female.skin'
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
		pointing_anim_set = haley_pointing_anims
		is_female = 1
		anim_struct = car_female_anim_struct
		body_specific_parts = {
			cas_intro_anim = cas_female_intro_anim
			cas_win_anim = cas_female_win_anim
			cas_lose_anim = cas_female_lose_anim
		}
	}
	{
		desc_id = skeleton
		frontend_desc = qs(0x998b2c00)
		mesh = 'models/Talent/Skeleton.skin'
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
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			cas_intro_anim = cas_male_intro_anim
			cas_win_anim = cas_male_win_anim
			cas_lose_anim = cas_male_lose_anim
		}
	}
	{
		desc_id = hayley
		frontend_desc = qs(0x2115e78e)
		mesh = 'models/Talent/HayleyWilliams.skin'
		skeleton = gh_rocker_female_hayley
		skeleton_path = 'skeletons/GH_Rocker_Female_Hayley.ske'
		ragdoll = rag_f_pop_hair_hayley
		ragdoll_path = 'Ragdolls/CAR/Female/Pop/rag_f_pop_hair_hayley.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_female
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		pointing_anim_set = haley_pointing_anims
		is_female = 1
		anim_struct = car_female_anim_struct
		body_specific_parts = {
			cas_intro_anim = cas_female_intro_anim
			cas_win_anim = cas_female_win_anim
			cas_lose_anim = cas_female_lose_anim
		}
	}
	{
		desc_id = debug_face_reskin
		frontend_desc = qs(0x0d1322aa)
		mesh = 'models/CAR/Male/Debug_Face_Reskin.skin'
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
		deform_mesh = 'models/CAR/Male/Debug_Face_Reskin_Def.skin'
		deform_bones = car_bones_male_face
		deform_skel = gh_male_deform
		deform_child_parts = [
			cas_male_hat
			cas_male_hair
			cas_male_hat_hair
			cas_male_facial_hair
			cas_male_acc_face
			cas_male_acc_ears
		]
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			cas_intro_anim = cas_male_intro_anim
			cas_win_anim = cas_male_win_anim
			cas_lose_anim = cas_male_lose_anim
		}
	}
	{
		desc_id = rockbot
		frontend_desc = qs(0x3ab7a665)
		mesh = 'models/Talent/Rockbot.skin'
		skeleton = gh_rocker_male_rockbot
		skeleton_path = 'skeletons/GH_Rocker_Male_Rockbot.ske'
		ragdoll = rag_gh_rocker_male_rockbot
		ragdoll_path = 'Ragdolls/Talent/Rag_GH_Rocker_Male_Rockbot.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_female
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			cas_intro_anim = cas_male_intro_anim
			cas_win_anim = cas_male_win_anim
			cas_lose_anim = cas_male_lose_anim
		}
	}
]
