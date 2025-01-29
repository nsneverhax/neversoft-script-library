cas_full_body_common_settings_male = {
	$0xf291756f
	is_female = 0
	anim_struct = car_male_anim_struct
	lefty = 0
	large_hands = 0
}
cas_full_body_common_settings_female = {
	$0xf291756f
	is_female = 1
	anim_struct = car_female_anim_struct
	lefty = 0
	large_hands = 0
}
0xf291756f = {
	shadow_pak = 'Pak\\models\\shadows\\male_shadow.pak'
	shadow_models = [
		'male_shadow_asset'
	]
	ik_params = Hero_Ik_params
	ik_params_guitar = Hero_Ik_params
	ik_params_drum = car_ik_params
	ik_params_vocals = car_ik_params
	ik_params_frontend = car_ik_params
}
