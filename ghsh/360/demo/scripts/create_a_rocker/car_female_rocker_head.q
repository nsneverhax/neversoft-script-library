cas_female_hair_random_colors = [
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
		random_weight = 0.5
		genre = [
			`black metal`
		]
	}
	{
		color = pink_3
		random_weight = 0.5
		genre = [
			punk
			goth
			pop
		]
	}
]
cas_female_hair_common_settings = {
	modify_all_materials
	shader = $cas_shader_hair
	random_colors = $cas_female_hair_random_colors
}
cas_female_hair_common_settings_skinshader = {
	modify_all_materials
	shader = $cas_shader_skin
	random_colors = $cas_female_hair_random_colors
}
cas_female_hair = [
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
		random_weight = 0.0
	}
	{
		desc_id = f_clsc_hair_farah
		frontend_desc = qs(0x728be496)
		mesh = 'models/CAR/Female/F_Clsc_Hair_Farah.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_Hair_Farah_def.skin'
		$cas_female_hair_common_settings
		chosen_materials = {
			material1 = red_orange_5
		}
		hat_hair = f_clsc_hathair_farah
		acc_skeleton = skel_f_clsc_hair_farah
		acc_ragdoll = rag_f_clsc_hair_farah
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
		]
	}
	{
		desc_id = f_goth_hair_updo
		frontend_desc = qs(0x0fcbbbe1)
		mesh = 'models/CAR/Female/F_Goth_Hair_UpDo.skin'
		deform_mesh = 'models/CAR/Female/F_Goth_Hair_UpDo_Def.skin'
		material_groups = [
			{
				materials = [
					f_goth_hair_updo_hair
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					f_goth_hair_updo_vale
				]
				shader = $cas_shader_skin
			}
		]
		hat_hair = f_goth_hathair_updo
		acc_skeleton = skel_f_goth_hair_updo
		acc_ragdoll = rag_f_goth_hair_updo
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
			goth
		]
	}
	{
		desc_id = f_pop_hair_midori
		frontend_desc = qs(0x4c47fb49)
		mesh = 'models/CAR/Female/F_Pop_Hair_Midori.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_Hair_Midori_Def.skin'
		material_groups = [
			{
				materials = [
					pop_midorihair_primary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					pop_midorihair_secondary
				]
				shader = $cas_shader_skin
			}
		]
		hat_hair = f_pop_hathair_midori
		acc_skeleton = skel_f_pop_hair_midori
		acc_ragdoll = rag_f_pop_hair_midori
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
			pop
		]
		random_weight = 0.0
	}
	{
		desc_id = f_punk_hair_judynails1
		frontend_desc = qs(0xdc357545)
		mesh = 'models/CAR/Female/F_Punk_Hair_JudyNails1.skin'
		deform_mesh = 'models/CAR/Female/F_Punk_Hair_JudyNails1_def.skin'
		$cas_female_hair_common_settings
		chosen_materials = {
			material1 = red_3
			material2 = red_1
		}
		hat_hair = f_punk_hathair_judynails1
		acc_skeleton = skel_f_punk_hair_judynails1
		acc_ragdoll = rag_f_punk_hair_judynails1
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
		materials = [
			f_punk_hair_judynails1_primary
			f_punk_hair_judynails1_secondary
		]
		chosen_materials = {
			material1 = red_1
			material2 = carblack_1
		}
		genre = [
			punk
		]
	}
]
cas_female_hat_hair_common_settings = {
	modify_all_materials
	shader = $cas_shader_hair
}
cas_female_hat_hair_common_settings_skinshader = {
	modify_all_materials
	shader = $cas_shader_skin
}
cas_female_hat_hair = [
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
	}
]
cas_female_hat = [
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
]
cas_female_facial_hair = [
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
	}
]
cas_female_age = [
	{
		desc_id = car_female_teen
		frontend_desc = qs(0xe40e025b)
	}
]
