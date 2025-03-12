cas_male_hair_random_colors = [
	{
		color = carblack_1
		random_weight = 1.0
	}
	{
		color = yellow_4
		random_weight = 1.0
		genre = [
			punk
			`heavy metal`
			`glam rock`
			pop
			rock
			`classic rock`
			`black metal`
		]
	}
	{
		color = yellow_2
		random_weight = 1.0
		genre = [
			punk
			`heavy metal`
			`glam rock`
			pop
			rock
			`classic rock`
		]
	}
	{
		color = red_2
		random_weight = 1.0
		genre = [
			punk
			goth
			rock
		]
	}
	{
		color = brown_4
		random_weight = 1.0
		genre = [
			punk
			`heavy metal`
			`glam rock`
			pop
			rock
			`classic rock`
		]
	}
	{
		color = brown_3
		random_weight = 1.0
		genre = [
			punk
			`heavy metal`
			`glam rock`
			pop
			rock
			`classic rock`
		]
	}
	{
		color = brown_2
		random_weight = 1.0
		genre = [
			punk
			`heavy metal`
			`glam rock`
			pop
			rock
			`classic rock`
		]
	}
	{
		color = grey_5
		random_weight = 0.2
		genre = [
			`black metal`
		]
	}
]
cas_male_hair_common_settings = {
	modify_all_materials
	shader = $cas_shader_hair
	random_colors = $cas_male_hair_random_colors
}
cas_male_hair_common_settings_skinshader = {
	modify_all_materials
	shader = $cas_shader_skin
	random_colors = $cas_male_hair_random_colors
}
cas_male_hair = [
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
		random_weight = 0.0
	}
	{
		desc_id = m_bmtl_hair_lars
		frontend_desc = qs(0x295bdc1d)
		mesh = 'models/CAR/Male/M_Bmtl_Hair_Lars.skin'
		deform_mesh = 'models/CAR/Male/M_Bmtl_Hair_Lars_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_bmtl_hathair_lars
		acc_skeleton = skel_m_bmtl_hair_lars
		acc_ragdoll = rag_m_bmtl_hair_lars
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`black metal`
		]
	}
	{
		desc_id = m_clsc_hair_country
		frontend_desc = qs(0x479d7f40)
		mesh = 'models/CAR/Male/M_Clsc_hair_Country.skin'
		deform_mesh = 'models/CAR/Male/M_Clsc_hair_Country_def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_country
		materials = [
			m_clsc_hair_country_hair
		]
		acc_skeleton = skel_m_clsc_hair_country
		acc_ragdoll = rag_m_clsc_hair_country
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`classic rock`
			rock
		]
	}
	{
		desc_id = m_metl_hair_axel
		frontend_desc = qs(0x361d7224)
		mesh = 'models/CAR/Male/M_Metl_Hair_Axel.skin'
		deform_mesh = 'models/CAR/Male/M_Metl_Hair_Axel_def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_metl_hathair_axel
		acc_skeleton = skel_m_metl_hair_axel
		acc_ragdoll = rag_m_metl_hair_axel
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`heavy metal`
			rock
		]
	}
	{
		desc_id = m_metl_hair_midhigh
		frontend_desc = qs(0xded47344)
		mesh = 'models/CAR/Male/M_Metl_Hair_MidHigh.skin'
		deform_mesh = 'models/CAR/Male/M_Metl_Hair_MidHigh_def.skin'
		$cas_male_hair_common_settings
		chosen_materials = {
			material1 = yellow_1
		}
		hat_hair = m_metl_hathair_midhigh
		acc_skeleton = skel_m_clsc_hair_messy
		acc_ragdoll = rag_m_clsc_hair_messy
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`heavy metal`
			`glam rock`
		]
	}
	{
		desc_id = m_pop_hair_eddieknox
		frontend_desc = qs(0x51aae246)
		mesh = 'models/CAR/Male/M_Pop_Hair_EddieKnox.skin'
		deform_mesh = 'models/CAR/Male/M_Pop_Hair_EddieKnox_def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_pop_hathair_pomp
		acc_skeleton = skel_m_pop_hair_pomp
		acc_ragdoll = rag_m_pop_hair_pomp
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
		]
		hidden
	}
	{
		desc_id = m_punk_hair_lspike
		frontend_desc = qs(0x4a5273e4)
		mesh = 'models/CAR/Male/M_Punk_Hair_LSpike.skin'
		deform_mesh = 'models/CAR/Male/M_Punk_Hair_LSpike_Def.skin'
		$cas_male_hair_common_settings
		chosen_materials = {
			material1 = red_orange_3
		}
		hat_hair = none
		acc_skeleton = skel_m_punk_hair_lspike
		acc_ragdoll = rag_m_punk_hair_lspike
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			punk
		]
	}
]
cas_male_hat_hair_common_settings = {
	modify_all_materials
	shader = $cas_shader_hair
}
cas_male_hat_hair_common_settings_skinshader = {
	modify_all_materials
	shader = $cas_shader_skin
}
cas_male_hat_hair = [
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
	}
]
cas_male_hat = [
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
]
cas_male_facial_hair_common_settings = {
	modify_all_materials
	shader = $cas_shader_hair
	random_weight = 0.0
}
cas_male_facial_hair = [
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
		random_weight = 25.0
	}
	{
		desc_id = m_clsc_fhair_stache04
		frontend_desc = qs(0xe1760794)
		mesh = 'models/CAR/Male/M_Clsc_Fhair_Stache02.skin'
		deform_mesh = 'models/CAR/Male/M_Clsc_Fhair_Stache02_def.skin'
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
]
cas_male_age = [
	{
		desc_id = car_male_teen
		frontend_desc = qs(0xe40e025b)
	}
	{
		desc_id = car_male_mature
		replace = 'tex/models/Characters/car/male/car_male_head_n.dds'
		with = 'tex/models/Characters/Layers/CAR_Male_Age/CAR_Male_Age03_N.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with2 = 'tex/models/Characters/Layers/CAR_Male_Age/CAR_male_Age03_D.dds'
		frontend_desc = qs(0xbe8a142d)
		in = cas_body
		in2 = cas_body
		random_weight = 0.25
	}
	{
		desc_id = car_male_aged
		replace = 'tex/models/Characters/car/male/car_male_head_n.dds'
		with = 'tex/models/Characters/Layers/CAR_Male_Age/CAR_Male_Age04_N.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with2 = 'tex/models/Characters/Layers/CAR_Male_Age/CAR_male_Age04_D.dds'
		frontend_desc = qs(0x67727495)
		in = cas_body
		in2 = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_male_old
		replace = 'tex/models/Characters/car/male/car_male_head_n.dds'
		with = 'tex/models/Characters/Layers/CAR_Male_Age/CAR_Male_Age05_N.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with2 = 'tex/models/Characters/Layers/CAR_Male_Age/CAR_male_Age05_D.dds'
		frontend_desc = qs(0xc05200fd)
		in = cas_body
		in2 = cas_body
		random_weight = 0.0
	}
]
