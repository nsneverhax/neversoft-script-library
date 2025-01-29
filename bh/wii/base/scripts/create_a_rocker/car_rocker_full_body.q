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
		desc_id = 0x34ef4e62
		frontend_desc = qs(0x1198e746)
		mesh = 'models/GH_Rockers/AdamLevine/AdamLevine.skin'
		highlodmesh = 'models/GH_Rockers/AdamLevine/AdamLevine_highLod.skin'
		pak = 'pak/car/characters/AdamLevine.pak'
		$cas_full_body_common_settings_male
		ghrocker = 0xb1e2942d
		Skeleton = 0xbbb5fdf1
		skeleton_path = 'skeletons/GH_Rocker_AdamLevine_1.ske'
		rocker_skeleton = 'GH_Rocker_AdamLevine_1'
		drummer_skeleton = 'GH_Drummer_AdamLevine_1'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		locked
	}
	{
		desc_id = 0x6fa5db01
		frontend_desc = qs(0x3a7cbe0e)
		mesh = 'models/GH_Rockers/TaylorSwift/TaylorSwift.skin'
		highlodmesh = 'models/GH_Rockers/TaylorSwift/TaylorSwift_highlod.skin'
		pak = 'pak/car/characters/TaylorSwift.pak'
		$cas_full_body_common_settings_female
		ghrocker = 0x89438ada
		Skeleton = 0x1a478f49
		skeleton_path = 'skeletons/GH_Rocker_TaylorSwift_1.ske'
		rocker_skeleton = 'GH_Rocker_TaylorSwift_1'
		drummer_skeleton = 'GH_Drummer_TaylorSwift_1'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = 0xbfbfc4cd
		frontend_desc = qs(0x5f2add08)
		mesh = 'models/GH_Rockers/TaylorSwift/TaylorSwift2.skin'
		highlodmesh = 'models/GH_Rockers/TaylorSwift/TaylorSwift2_highlod.skin'
		pak = 'pak/car/characters/TaylorSwift2.pak'
		$cas_full_body_common_settings_female
		ghrocker = 0x89438ada
		Skeleton = 0x1a478f49
		skeleton_path = 'skeletons/GH_Rocker_TaylorSwift_1.ske'
		rocker_skeleton = 'GH_Rocker_TaylorSwift_1'
		drummer_skeleton = 'GH_Drummer_TaylorSwift_1'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = 0xc8b8f45b
		frontend_desc = qs(0x4631ec49)
		mesh = 'models/GH_Rockers/TaylorSwift/TaylorSwift2.skin'
		highlodmesh = 'models/GH_Rockers/TaylorSwift/TaylorSwift2_highlod.skin'
		pak = 'pak/car/characters/TaylorSwift2.pak'
		$cas_full_body_common_settings_female
		ghrocker = 0x89438ada
		Skeleton = 0xf449ee65
		skeleton_path = 'skeletons/GH_Rocker_TaylorSwift_3.ske'
		rocker_skeleton = 'GH_Rocker_TaylorSwift_3'
		drummer_skeleton = 'GH_Drummer_TaylorSwift_1'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = 0xae3ece6a
		frontend_desc = qs(0x3cdee9de)
		mesh = 'models/GH_Rockers/GwenStefani/GwenStefani.skin'
		highlodmesh = 'models/GH_Rockers/GwenStefani/GwenStefani_highlod.skin'
		pak = 'pak/car/characters/GwenStefani.pak'
		$cas_full_body_common_settings_female
		ghrocker = 0x48d89fb1
		Skeleton = 0x48d89fb1
		skeleton_path = 'skeletons/GH_Rocker_GwenStefani.ske'
		rocker_skeleton = 'GH_Rocker_GwenStefani'
		drummer_skeleton = 'GH_Drummer_GwenStefani'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = 0x651ee708
		frontend_desc = qs(0x2b1ddae2)
		mesh = 'models/GH_Rockers/GwenStefani/GwenStefani2.skin'
		highlodmesh = 'models/GH_Rockers/GwenStefani/GwenStefani2_highlod.skin'
		pak = 'pak/car/characters/GwenStefani2.pak'
		$cas_full_body_common_settings_female
		ghrocker = 0x48d89fb1
		Skeleton = 0x48d89fb1
		skeleton_path = 'skeletons/GH_Rocker_GwenStefani.ske'
		rocker_skeleton = 'GH_Rocker_GwenStefani'
		drummer_skeleton = 'GH_Drummer_GwenStefani'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = 0xd3959486
		frontend_desc = qs(0xe7c54951)
		mesh = 'models/GH_Rockers/TomDumont/TomDumont.skin'
		highlodmesh = 'models/GH_Rockers/TomDumont/TomDumont_highlod.skin'
		pak = 'pak/car/characters/TomDumont.pak'
		$cas_full_body_common_settings_male
		ghrocker = 0xbb7f03d4
		Skeleton = 0x10a0ab7f
		skeleton_path = 'skeletons/GH_Rocker_TomDumont_1.ske'
		rocker_skeleton = 'GH_Rocker_TomDumont_1'
		drummer_skeleton = 'GH_Drummer_TomDumont_1'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = 0x5d05e7ab
		frontend_desc = qs(0x5cb56267)
		mesh = 'models/GH_Rockers/TonyKanal/TonyKanal.skin'
		highlodmesh = 'models/GH_Rockers/TonyKanal/TonyKanal_highlod.skin'
		pak = 'pak/car/characters/TonyKanal.pak'
		$cas_full_body_common_settings_male
		ghrocker = 0x35ef70f9
		Skeleton = 0xf9865f86
		skeleton_path = 'skeletons/GH_Rocker_TonyKanal_1.ske'
		rocker_skeleton = 'GH_Rocker_TonyKanal_1'
		drummer_skeleton = 'GH_Drummer_TonyKanal_1'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
		diff_anim = 'female_heels_Med_d'
	}
	{
		desc_id = 0x3ef5a7db
		frontend_desc = qs(0x34c37d34)
		mesh = 'models/GH_Rockers/AdrianYoung/AdrianYoung.skin'
		highlodmesh = 'models/GH_Rockers/AdrianYoung/AdrianYoung_highlod.skin'
		pak = 'pak/car/characters/AdrianYoung.pak'
		$cas_full_body_common_settings_male
		ghrocker = 0xd813f600
		Skeleton = 0x3823ce9b
		skeleton_path = 'skeletons/GH_Rocker_AdrianYoung_1.ske'
		rocker_skeleton = 'GH_Rocker_AdrianYoung_1'
		drummer_skeleton = 'GH_Drummer_AdrianYoung_1'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = 0x6eb102a0
		frontend_desc = qs(0x24f300ab)
		mesh = 'models/GH_Rockers/VBot/VBot.skin'
		highlodmesh = 'models/GH_Rockers/VBot/VBot_highlod.skin'
		pak = 'pak/car/characters/VBot.pak'
		$cas_full_body_common_settings_female
		ghrocker = 0x26ab6f0d
		Skeleton = 0x65cec3a4
		skeleton_path = 'skeletons/GH_Rocker_Casey_5.ske'
		rocker_skeleton = 'GH_Rocker_Casey_1'
		drummer_skeleton = 'GH_Drummer_Casey_1'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
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
	{
		desc_id = 0x26d8b3f6
		frontend_desc = qs(0x45baca00)
		mesh = 'models/GH_Rockers/Calista/Calista_1.skin'
		highlodmesh = 'models/GH_Rockers/Calista/Calista_1_highlod.skin'
		pak = 'pak/car/characters/Calista.pak'
		$cas_full_body_common_settings_female
		Skeleton = gh_rocker_female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = 0x55cfe7e9
		frontend_desc = qs(0x7c7a9ba2)
		mesh = 'models/GH_Rockers/Gunner/Gunner_1.skin'
		highlodmesh = 'models/GH_Rockers/Gunner/Gunner_1_highlod.skin'
		pak = 'pak/car/characters/Gunner.pak'
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
	{
		desc_id = 0xe1a1eadd
		frontend_desc = qs(0x07d62cc5)
		mesh = 'models/GH_Rockers/Memphis/Memphis_1.skin'
		highlodmesh = 'models/GH_Rockers/Memphis/Memphis_1_highlod.skin'
		pak = 'pak/car/characters/Memphis.pak'
		$cas_full_body_common_settings_female
		Skeleton = gh_rocker_female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		anim_struct = car_female_anim_struct
	}
	{
		desc_id = 0xc9e14930
		frontend_desc = qs(0x7c8b8fdb)
		mesh = 'models/GH_Rockers/Simon/Simon_1.skin'
		highlodmesh = 'models/GH_Rockers/Simon/Simon_1_highlod.skin'
		pak = 'pak/car/characters/Simon.pak'
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
