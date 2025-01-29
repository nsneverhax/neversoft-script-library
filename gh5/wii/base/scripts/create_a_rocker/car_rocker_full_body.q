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
		desc_id = metalhead
		frontend_desc = qs(0x6fae039b)
		mesh = 'models/car/talent/metalhead.skin'
		highlodmesh = 'models/car/talent/metalhead_highLod.skin'
		pak = 'pak/car/characters/metalhead.pak'
		shadow_pak = 'Pak\\models\\shadows\\male_shadow.pak'
		shadow_models = [
			'male_shadow_asset'
		]
		$cas_full_body_common_settings_male
		Skeleton = gh_rocker_axel_1
		skeleton_path = 'skeletons/GH_Rocker_Axel_1.ske'
		rocker_skeleton = 'GH_Rocker_Axel_1'
		drummer_skeleton = 'GH_Drummer_Axel_1'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = car_ik_params
		ik_params_vocals = car_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = johnnycash_1
		frontend_desc = qs(0x3a825a9b)
		mesh = 'models/GH_Rockers/JohnnyCash/JohnnyCash_1.skin'
		pak = 'pak/car/characters/JohnnyCash.pak'
		highlodmesh = 'models/GH_Rockers/JohnnyCash/JohnnyCash_1_highLod.skin'
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnnycash
		Skeleton = gh_rocker_johnnycash_1
		skeleton_path = 'skeletons/GH_Rocker_JohnnyCash_1.ske'
		rocker_skeleton = 'GH_Rocker_JohnnyCash_1'
		drummer_skeleton = 'GH_Drummer_JohnnyCash_1'
		ik_params = Hero_Ik_params
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
		mesh = 'models/GH_Rockers/JohnnyCash/JohnnyCash_1.skin'
		pak = 'pak/car/characters/JohnnyCash.pak'
		highlodmesh = 'models/GH_Rockers/JohnnyCash/JohnnyCash_1_highLod.skin'
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_johnnycash_car
		Skeleton = gh_rocker_johnnycash_car
		skeleton_path = 'skeletons/GH_Rocker_JohnnyCash_CAR.ske'
		rocker_skeleton = 'GH_Rocker_JohnnyCash_CAR'
		drummer_skeleton = 'GH_Drummer_JohnnyCash_CAR'
		ik_params = Hero_Ik_params
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
		mesh = 'models/GH_Rockers/Santana/Santana_1.skin'
		highlodmesh = 'models/GH_Rockers/Santana/Santana_1_highLod.skin'
		pak = 'pak/car/characters/Santana.pak'
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_santana
		Skeleton = gh_rocker_santana_1
		skeleton_path = 'skeletons/GH_Rocker_Santana_1.ske'
		rocker_skeleton = 'GH_Rocker_Santana'
		drummer_skeleton = 'GH_Drummer_Santana'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = car_ik_params
		ik_params_vocals = car_ik_params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = matt_bellamy
		frontend_desc = qs(0x0ccbf66e)
		mesh = 'models/GH_Rockers/M_Bellamy/M_Bellamy.skin'
		highlodmesh = 'models/GH_Rockers/M_Bellamy/M_Bellamy_highLod.skin'
		pak = 'pak/car/characters/MattBellamy.pak'
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_mattbellamy
		Skeleton = gh_rocker_m_bellamy_1
		skeleton_path = 'skeletons/GH_Rocker_M_Bellamy_1.ske'
		rocker_skeleton = 'GH_Rocker_M_Bellamy_1'
		drummer_skeleton = 'GH_Drummer_M_Bellamy_1'
		ik_params = Hero_Ik_params
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
		mesh = 'models/GH_Rockers/M_Bellamy/M_Bellamy.skin'
		highlodmesh = 'models/GH_Rockers/M_Bellamy/M_Bellamy_highLod.skin'
		pak = 'pak/car/characters/MattBellamy.pak'
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_mattbellamy_car
		Skeleton = gh_rocker_m_bellamy_1_car
		skeleton_path = 'skeletons/GH_Rocker_M_Bellamy_1_CAR.ske'
		rocker_skeleton = 'GH_Rocker_M_Bellamy_1_CAR'
		drummer_skeleton = 'GH_Drummer_M_Bellamy_1_CAR'
		ik_params = Hero_Ik_params
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
		mesh = 'models/GH_Rockers/KurtCobain/Kurt_Cobain.skin'
		highlodmesh = 'models/GH_Rockers/KurtCobain/kurt_cobain_highLod.skin'
		pak = 'pak/car/characters/KurtCobain.pak'
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_kurtcobain
		Skeleton = gh_rocker_kurt_1
		skeleton_path = 'skeletons/GH_Rocker_Kurt_1.ske'
		rocker_skeleton = 'GH_Rocker_Kurt_1'
		drummer_skeleton = 'GH_Drummer_Kurt_1'
		ik_params = Hero_Ik_params
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
		mesh = 'models/GH_Rockers/KurtCobain/Kurt_Cobain.skin'
		highlodmesh = 'models/GH_Rockers/KurtCobain/kurt_cobain_highLod.skin'
		pak = 'pak/car/characters/KurtCobain.pak'
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_kurtcobain
		Skeleton = gh_rocker_kurt_1
		skeleton_path = 'skeletons/GH_Rocker_Kurt_1.ske'
		rocker_skeleton = 'GH_Rocker_Kurt_1'
		drummer_skeleton = 'GH_Drummer_Kurt_1'
		ik_params = Hero_Ik_params
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
		mesh = 'models/GH_Rockers/ShirleyManson/ShirleyManson.skin'
		highlodmesh = 'models/GH_Rockers/ShirleyManson/ShirleyManson_highLod.skin'
		pak = 'pak/car/characters/ShirleyManson.pak'
		$cas_full_body_common_settings_female
		ghrocker = gh_rocker_shirleymanson
		Skeleton = gh_rocker_shirleymanson_1
		skeleton_path = 'skeletons/GH_Rocker_ShirleyManson_1.ske'
		rocker_skeleton = 'GH_Rocker_ShirleyManson_1'
		drummer_skeleton = 'GH_Drummer_ShirleyManson_1'
		ik_params = Hero_Ik_params
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
		mesh = 'models/GH_Rockers/FrankenRocker/FrankenRocker.skin'
		highlodmesh = 'models/GH_Rockers/FrankenRocker/FrankenRocker_highLod.skin'
		pak = 'pak/car/characters/FrankenRocker.pak'
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_frankenrocker
		Skeleton = gh_rocker_frankenrocker_1
		skeleton_path = 'skeletons/GH_Rocker_FrankenRocker_1.ske'
		rocker_skeleton = 'GH_Rocker_Frankenrocker_1'
		drummer_skeleton = 'GH_Drummer_Frankenrocker_1'
		ik_params = Hero_Ik_params
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
		mesh = 'models/gh_rockers/silhouette_m.skin'
		highlodmesh = 'models/GH_Rockers/Silhouette_M_highLod.skin'
		pak = 'pak/car/characters/silhouette_m.pak'
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_silhouette
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = silhouette_gold
		frontend_desc = qs(0xa6b94703)
		mesh = 'models/gh_rockers/silhouette_gold.skin'
		highlodmesh = 'models/GH_Rockers/Silhouette_Gold_highLod.skin'
		pak = 'pak/car/characters/silhouette_gold.pak'
		$cas_full_body_common_settings_male
		ghrocker = gh_rocker_silhouette_gold
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Skeleton
		frontend_desc = qs(0x998b2c00)
		mesh = 'models/car/talent/Skeleton.skin'
		pak = 'pak/car/characters/Skeleton.pak'
		$cas_full_body_common_settings_male
		Skeleton = gh_rocker_male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
]
