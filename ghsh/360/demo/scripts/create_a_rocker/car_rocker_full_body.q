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
		desc_id = folkspecial
		frontend_desc = qs(0x4165c80e)
		mesh = 'models/Talent/M_Folk_Special.skin'
		skeleton = gh_rocker_male_folk_special
		skeleton_path = 'skeletons/GH_Rocker_Male_Folk_Special.ske'
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
]
