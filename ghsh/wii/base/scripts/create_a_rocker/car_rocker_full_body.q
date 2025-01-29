cas_full_body = [
	{
		desc_id = 0x7736ca68
		frontend_desc = qs(0x4165c80e)
		mesh = 'models/car/Talent/M_Folk_Special.skin'
		pak = 'pak/car/characters/M_Folk_Special.pak'
		shadow_pak = 'Pak\\models\\shadows\\male_shadow.pak'
		shadow_models = [
			'male_shadow_asset'
		]
		rocker_skeleton = 'GH_Rocker_Male_M_Folk_Special'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
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
		desc_id = Skeleton
		frontend_desc = qs(0x998b2c00)
		mesh = 'models/car/talent/Skeleton.skin'
		pak = 'pak/car/characters/Skeleton.pak'
		shadow_pak = 'Pak\\models\\shadows\\Ozzy_shadow.pak'
		shadow_models = [
			'Ozzy_Shadow_Asset'
		]
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = car_ik_params
		ik_params_vocals = car_ik_params
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
		desc_id = metalhead
		frontend_desc = qs(0x6fae039b)
		mesh = 'models/car/talent/metalhead.skin'
		pak = 'pak/car/characters/metalhead.pak'
		shadow_pak = 'Pak\\models\\shadows\\male_shadow.pak'
		shadow_models = [
			'male_shadow_asset'
		]
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = car_ik_params
		ik_params_vocals = car_ik_params
		ik_params_frontend = car_ik_params
		is_female = 0
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = rockbot
		frontend_desc = qs(0xdfb74ad3)
		mesh = 'models/car/talent/RockBot.skin'
		pak = 'pak/car/characters/RockBot.pak'
		shadow_pak = 'Pak\\models\\shadows\\male_shadow.pak'
		shadow_models = [
			'male_shadow_asset'
		]
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = car_ik_params
		ik_params_vocals = car_ik_params
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
		desc_id = 0xf650b8fb
		frontend_desc = qs(0xd9275462)
		mesh = 'models/car/talent/fembot.skin'
		pak = 'pak/car/characters/fembot.pak'
		shadow_pak = 'Pak\\models\\shadows\\male_shadow.pak'
		shadow_models = [
			'male_shadow_asset'
		]
		Skeleton = gh_rocker_female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = car_ik_params
		ik_params_vocals = car_ik_params
		ik_params_frontend = car_ik_params
		is_female = 1
		anim_struct = car_female_anim_struct
	}
]
