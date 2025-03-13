cas_male_eyebrows = [
	{
		desc_id = car_no_brow
		frontend_desc = qs(0x9c1b5214)
		replace = `tex\models\characters\car\male\car_male_brow_d`
		with = `tex\models\characters\car\male\car_male_brow_00_d`
		in = cas_body
	}
	{
		desc_id = car_default_brow
		frontend_desc = qs(0x675459e3)
	}
	{
		desc_id = car_rounded
		frontend_desc = qs(0xf9ea62fa)
		replace = `tex\models\characters\car\male\car_male_brow_d`
		with = `tex\models\characters\car\male\car_male_brow_02_d`
		in = cas_body
	}
]
cas_male_hair_random_colors = [
	{
		color = carblack_1
		random_weight = 1.0
	}
	{
		color = hairorange_3
		random_weight = 1.0
		genre = [
			rock
			pop
			`glam rock`
			`classic rock`
		]
	}
	{
		color = hairred_orange_3
		random_weight = 1.0
		genre = [
			rock
			pop
			`glam rock`
			`classic rock`
		]
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
		color = blue_3
		random_weight = 1.0
		genre = [
			punk
			goth
		]
	}
	{
		color = blue_1
		random_weight = 1.0
		genre = [
			punk
			goth
		]
	}
	{
		color = teal_3
		random_weight = 0.5
		genre = [
			punk
			goth
		]
	}
	{
		color = green_1
		random_weight = 0.5
		genre = [
			punk
			goth
		]
	}
	{
		color = grey_5
		random_weight = 0.5
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
		desc_id = m_clsc_hair_george
		frontend_desc = qs(0xcf536075)
		mesh = `models/car/male/m_clsc_hair_george`
		deform_mesh = `models/car/male/m_clsc_hair_george_def`
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_george
		acc_skeleton = `skeletons/skel_m_clsc_hair_george`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_george`
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
			pop
		]
		hidden
	}
	{
		desc_id = m_clsc_hair_contest
		frontend_desc = qs(0x0bb644b3)
		mesh = `models/car/male/m_clsc_hair_contest`
		deform_mesh = `models/car/male/m_clsc_hair_contest_def`
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_contest
		random_weight = 0.0
		hidden
	}
	{
		desc_id = m_bmtl_hair_straight
		frontend_desc = qs(0x295bdc1d)
		mesh = `models/car/male/m_bmtl_hair_straight`
		deform_mesh = `models/car/male/m_bmtl_hair_straight_def`
		$cas_male_hair_common_settings
		hat_hair = m_bmtl_hathair_straight
		acc_skeleton = `skeletons/skel_m_bmtl_hair_straight`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_hair_straight`
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
		desc_id = m_bmtl_hair_lars_3
		frontend_desc = qs(0x47b5e332)
		mesh = `models/car/male/m_bmtl_hair_lars_3`
		deform_mesh = `models/car/male/m_bmtl_hair_lars_3_def`
		hat_hair = m_bmtl_hathair_lars_3
		$cas_male_hair_common_settings_skinshader
		material_groups = [
			{
				materials = [
					m_bmtl_hair_lars_3_primary
				]
				shader = $cas_shader_skin
			}
		]
		acc_skeleton = `skeletons/skel_m_bmtl_hair_lars_3`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_hair_lars_3`
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
		desc_id = m_bmtl_hair_lars4
		frontend_desc = qs(0xf01f6780)
		mesh = `models/car/male/m_bmtl_hair_lars4`
		deform_mesh = `models/car/male/m_bmtl_hair_lars4_def`
		$cas_male_hair_common_settings
		hat_hair = m_bmtl_hathair_lars4
		acc_skeleton = `skeletons/skel_m_bmtl_hair_lars_4`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_hair_lars_4`
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
		desc_id = m_bmtl_hair_dread
		frontend_desc = qs(0x3d5f28b1)
		mesh = `models/car/male/m_bmtl_hair_dread`
		deform_mesh = `models/car/male/m_bmtl_hair_dread_def`
		$cas_male_hair_common_settings
		hat_hair = m_bmtl_hathair_dread
		acc_skeleton = `skeletons/skel_m_bmtl_hair_dread`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_hair_dread`
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
		desc_id = m_clsc_hair_clive
		frontend_desc = qs(0xb243be28)
		mesh = `models/car/male/m_clsc_hair_clive`
		deform_mesh = `models/car/male/m_clsc_hair_clive_def`
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_clive
		acc_skeleton = `skeletons/skel_m_clsc_hair_clive`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_clive`
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
			m_clsc_hair_clive_primary
		]
		genre = [
			`classic rock`
		]
	}
	{
		desc_id = m_clsc_hair_clive2
		frontend_desc = qs(0x19161011)
		mesh = `models/car/male/m_clsc_hair_clive2`
		deform_mesh = `models/car/male/m_clsc_hair_clive2_def`
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_clive2
		acc_skeleton = `skeletons/skel_m_clsc_hair_clive2`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_clive2`
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
			m_clsc_hair_clive2_primary
		]
		genre = [
			`classic rock`
		]
	}
	{
		desc_id = m_clsc_hair_clive3
		frontend_desc = qs(0x02788adf)
		mesh = `models/car/male/m_clsc_hair_clive3`
		deform_mesh = `models/car/male/m_clsc_hair_clive3_def`
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_clive3
		acc_skeleton = `skeletons/skel_m_clsc_hair_clive3`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_clive3`
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
			m_clsc_hair_clive3_primary
		]
		genre = [
			`classic rock`
		]
	}
	{
		desc_id = m_clsc_hair_clive4
		frontend_desc = qs(0x25206033)
		mesh = `models/car/male/m_clsc_hair_clive4`
		deform_mesh = `models/car/male/m_clsc_hair_clive4_def`
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_clive4
		acc_skeleton = `skeletons/skel_m_clsc_hair_clive4`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_clive4`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
		]
		material_groups = [
			{
				materials = [
					m_clsc_hair_clive4_primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					m_clsc_hair_clive4_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xda6ae6fb)
			}
		]
		genre = [
			`classic rock`
		]
	}
	{
		desc_id = m_clsc_hair_country
		frontend_desc = qs(0x479d7f40)
		mesh = `models/car/male/m_clsc_hair_country`
		deform_mesh = `models/car/male/m_clsc_hair_country_def`
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_country
		materials = [
			m_clsc_hair_country_hair
		]
		acc_skeleton = `skeletons/skel_m_clsc_hair_country`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_country`
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
		hidden
	}
	{
		desc_id = m_clsc_hair_messy
		frontend_desc = qs(0x925e89e6)
		mesh = `models/car/male/m_clsc_hair_messy`
		deform_mesh = `models/car/male/m_clsc_hair_messy_def`
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_messy
		acc_skeleton = `skeletons/skel_m_clsc_hair_messy`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_messy`
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
		random_weight = 0.0
		hidden
	}
	{
		desc_id = m_clsc_hair_blfro
		frontend_desc = qs(0x2114f878)
		mesh = `models/car/male/m_clsc_hair_blfro`
		deform_mesh = `models/car/male/m_clsc_hair_blfro_def`
		$cas_male_hair_common_settings_skinshader
		material_groups = [
			{
				materials = [
					m_clsc_hair_blfro_base
					m_clsc_hair_blfro_alpha
				]
				shader = $cas_shader_skin
			}
		]
		hat_hair = m_clsc_hathair_blfro
		acc_skeleton = `skeletons/skel_m_clsc_hair_blfro`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_blfro`
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
		desc_id = m_clsc_hair_jimi
		frontend_desc = qs(0xd3f52ad2)
		mesh = `models/car/male/m_clsc_hair_jimi`
		deform_mesh = `models/car/male/m_clsc_hair_jimi_def`
		$cas_male_hair_common_settings_skinshader
		hat_hair = m_clsc_hathair_jimi
		acc_skeleton = `skeletons/skel_m_clsc_hair_jimi`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_jimi`
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
			m_clsc_hair_jimi_primary
			m_clsc_hair_jimi_secondary
		]
		genre = [
			`classic rock`
		]
		random_weight = 0.25
		hidden
	}
	{
		desc_id = m_glam_hair_lapalms
		frontend_desc = qs(0xbd135a6c)
		mesh = `models/car/male/m_glam_hair_lapalms`
		deform_mesh = `models/car/male/m_glam_hair_lapalms_def`
		$cas_male_hair_common_settings
		hat_hair = m_glam_hathair_lapalms
		acc_skeleton = `skeletons/skel_m_glam_hair_lapalms`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_lapalms`
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
		genre = [
			`glam rock`
		]
		random_weight = 0.25
		hidden
	}
	{
		desc_id = m_glam_hair_seagull
		frontend_desc = qs(0x75a88322)
		mesh = `models/car/male/m_glam_hair_seagull`
		deform_mesh = `models/car/male/m_glam_hair_seagull_def`
		$cas_male_hair_common_settings
		hat_hair = m_glam_hathair_seagull
		acc_skeleton = `skeletons/skel_m_glam_hair_seagull`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_seagull`
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
			`glam rock`
		]
	}
	{
		desc_id = m_glam_hair_gold
		frontend_desc = qs(0xb8f4def5)
		mesh = `models/car/male/m_glam_hair_gold`
		deform_mesh = `models/car/male/m_glam_hair_gold_def`
		$cas_male_hair_common_settings
		hat_hair = m_glam_hathair_gold
		acc_skeleton = `skeletons/skel_m_glam_hair_gold`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_gold`
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
			`glam rock`
		]
		hidden
	}
	{
		desc_id = m_glam_hair_izzy1
		frontend_desc = qs(0x92f3930e)
		mesh = `models/car/male/m_glam_hair_izzy1`
		deform_mesh = `models/car/male/m_glam_hair_izzy1_def`
		$cas_male_hair_common_settings
		hat_hair = m_glam_hathair_izzy1
		acc_skeleton = `skeletons/skel_m_glam_hair_izzy1`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_izzy1`
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
			`glam rock`
		]
	}
	{
		desc_id = m_glam_hair_izzy2
		frontend_desc = qs(0xf02a101d)
		mesh = `models/car/male/m_glam_hair_izzy2`
		deform_mesh = `models/car/male/m_glam_hair_izzy2_def`
		$cas_male_hair_common_settings
		hat_hair = m_glam_hathair_izzy2
		acc_skeleton = `skeletons/skel_m_glam_hair_izzy2`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_izzy2`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_05
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`glam rock`
		]
	}
	{
		desc_id = m_glam_hair_izzy3
		frontend_desc = qs(0x4b945d02)
		mesh = `models/car/male/m_glam_hair_izzy3`
		deform_mesh = `models/car/male/m_glam_hair_izzy3_def`
		$cas_male_hair_common_settings
		hat_hair = m_glam_hathair_izzy3
		acc_skeleton = `skeletons/skel_m_glam_hair_izzy3`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_izzy3`
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
			`glam rock`
		]
	}
	{
		desc_id = m_glam_hair_izzy4
		frontend_desc = qs(0xe4de4c10)
		mesh = `models/car/male/m_glam_hair_izzy4`
		deform_mesh = `models/car/male/m_glam_hair_izzy4_def`
		$cas_male_hair_common_settings
		material_groups = [
			{
				materials = [
					m_glam_hair_izzy4_primary
				]
				shader = $cas_shader_hair
				name = qs(0x44458d9d)
			}
			{
				materials = [
					m_glam_hair_izzy4_secondary
				]
				shader = $cas_shader_hair
				name = qs(0x947362be)
			}
			{
				materials = [
					m_glam_hair_izzy4_torso_etc
				]
				shader = $cas_shader_skin
				name = qs(0xda6ae6fb)
			}
		]
		hat_hair = m_glam_hathair_izzy4
		acc_skeleton = `skeletons/skel_m_glam_hair_izzy4`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_izzy4`
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
			`glam rock`
		]
	}
	{
		desc_id = 0xfee669c0
		frontend_desc = qs(0x222b3c01)
		mesh = 0x2839f00e
		$cas_male_hair_common_settings
		hat_hair = 0xf3e89204
		acc_skeleton = 0x0998bc76
		acc_ragdoll = 0xa7726d8a
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
			`glam rock`
		]
	}
	{
		desc_id = m_goth_hair_remedy
		frontend_desc = qs(0xcafba8c1)
		mesh = `models/car/male/m_goth_hair_remedy`
		deform_mesh = `models/car/male/m_goth_hair_remedy_def`
		$cas_male_hair_common_settings
		hat_hair = m_goth_hathair_remedy
		acc_skeleton = `skeletons/skel_m_goth_hair_remedy`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_hair_remedy`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
		]
		genre = [
			goth
		]
	}
	{
		desc_id = m_goth_hair_dreads
		frontend_desc = qs(0x4f27cb2e)
		mesh = `models/car/male/m_goth_hair_dreads`
		deform_mesh = `models/car/male/m_goth_hair_dreads_def`
		$cas_male_hair_common_settings_skinshader
		hat_hair = m_goth_hathair_dreads
		materials = [
			m_goth_hair_dreads_primary
		]
		acc_skeleton = `skeletons/skel_m_goth_hair_dreads`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_hair_dreads`
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
		desc_id = m_goth_hair_devilock
		frontend_desc = qs(0x959ee9ad)
		mesh = `models/car/male/m_goth_hair_devilock`
		deform_mesh = `models/car/male/m_goth_hair_devilock_def`
		$cas_male_hair_common_settings
		hat_hair = m_goth_hathair_devilock
		acc_skeleton = `skeletons/skel_m_goth_hair_devilock`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_hair_devilock`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_03
			bone_acc_head_05
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			goth
			punk
		]
		material_groups = [
			{
				materials = [
					m_goth_hair_devilock_hair
					m_goth_hair_devilock_hairtop
				]
				shader = $cas_shader_hair
			}
		]
	}
	{
		desc_id = m_metl_hair_axel_1
		frontend_desc = qs(0x26aa668b)
		mesh = `models/car/male/m_metl_hair_axel_1`
		deform_mesh = `models/car/male/m_metl_hair_axel_1_def`
		$cas_male_hair_common_settings
		hat_hair = m_metl_hathair_axel_1
		materials = [
			m_metl_hair_axel_1_primary
		]
		acc_skeleton = `skeletons/skel_m_metl_hair_axel_1`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_hair_axel_1`
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
		desc_id = m_metl_hair_axel_4
		frontend_desc = qs(0xe5e630c4)
		mesh = `models/car/male/m_metl_hair_axel_4`
		deform_mesh = `models/car/male/m_metl_hair_axel_4_def`
		$cas_male_hair_common_settings
		hat_hair = m_metl_hathair_axel_4
		materials = [
			axel4_hair_primary
		]
		acc_skeleton = `skeletons/skel_m_metl_hair_axel_4`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_hair_axel_4`
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
		]
	}
	{
		desc_id = 0x0078b3cc
		frontend_desc = qs(0x3405f866)
		mesh = 0xdcd2b433
		deform_mesh = 0x7c491f66
		$cas_male_hair_common_settings
		hat_hair = 0x28e325de
		materials = [
			0x1d09f890
		]
		acc_skeleton = 0x445e6bd7
		acc_ragdoll = 0xc85b8235
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = m_metl_hair_curlio
		frontend_desc = qs(0x75e6742b)
		mesh = `models/car/male/m_metl_hair_curlio`
		deform_mesh = `models/car/male/m_metl_hair_curlio_def`
		$cas_male_hair_common_settings
		hat_hair = m_metl_hathair_curlio
		acc_skeleton = `skeletons/skel_m_metl_hair_curlio`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_hair_curlio`
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
		desc_id = m_metl_hair_lars
		frontend_desc = qs(0x2c2db6e7)
		mesh = `models/car/male/m_metl_hair_lars`
		deform_mesh = `models/car/male/m_metl_hair_lars_def`
		$cas_male_hair_common_settings
		hat_hair = m_metl_hathair_lars
		acc_skeleton = `skeletons/skel_m_metl_hair_lars`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_hair_lars`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_05
			bone_acc_head_06
		]
		genre = [
			pop
			`heavy metal`
		]
		random_weight = 0.25
	}
	{
		desc_id = 0xac253de7
		frontend_desc = qs(0xccc932ef)
		mesh = 0x708f3a18
		deform_mesh = 0x30a4cd09
		$cas_male_hair_common_settings
		hat_hair = 0xd3acaf29
		acc_skeleton = 0xe803e5fc
		acc_ragdoll = 0x03ac585d
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
		random_weight = 0.25
	}
	{
		desc_id = m_pop_hair_buzz
		frontend_desc = qs(0x28da4eed)
		mesh = `models/car/male/m_pop_hair_buzz`
		deform_mesh = `models/car/male/m_pop_hair_buzz_def`
		$cas_male_hair_common_settings_skinshader
		hat_hair = m_pop_hathair_buzz
		genre = [
			pop
		]
		random_weight = 0.25
	}
	{
		desc_id = 0xaee61771
		frontend_desc = qs(0x4ba2b26b)
		mesh = 0xd2ec275f
		deform_mesh = 0x5491670e
		$cas_male_hair_common_settings
		hat_hair = 0x4d79623d
		genre = [
			pop
		]
		random_weight = 0.25
	}
	{
		desc_id = 0x865b9f17
		frontend_desc = qs(0x3b4876b6)
		mesh = 0x8b1b2b6c
		deform_mesh = 0xf65f570f
		$cas_male_hair_common_settings_skinshader
		hat_hair = 0xcd23e836
		genre = [
			pop
		]
		random_weight = 0.25
	}
	{
		desc_id = m_pop_hair_emo1
		frontend_desc = qs(0x8024e99c)
		mesh = `models/car/male/m_pop_hair_emo1`
		deform_mesh = `models/car/male/m_pop_hair_emo1_def`
		$cas_male_hair_common_settings
		hat_hair = m_pop_hathair_emo1
		acc_skeleton = `skeletons/skel_m_pop_hair_emo1`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_pop_hair_emo1`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
		]
		genre = [
			pop
			rock
		]
	}
	{
		desc_id = m_pop_hair_pomp
		frontend_desc = qs(0xd965807d)
		mesh = `models/car/male/m_pop_hair_pomp`
		deform_mesh = `models/car/male/m_pop_hair_pomp_def`
		$cas_male_hair_common_settings
		hat_hair = m_pop_hathair_pomp
		acc_skeleton = `skeletons/skel_m_pop_hair_pomp`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_pop_hair_pomp`
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
		genre = [
			pop
			rock
		]
	}
	{
		desc_id = m_pop_hair_eddieknox
		frontend_desc = qs(0x51aae246)
		mesh = `models/car/male/m_pop_hair_eddieknox`
		deform_mesh = `models/car/male/m_pop_hair_eddieknox_def`
		$cas_male_hair_common_settings
		hat_hair = m_pop_hathair_pomp
		acc_skeleton = `skeletons/skel_m_pop_hair_pomp`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_pop_hair_pomp`
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
		desc_id = m_punk_hair_hawk
		frontend_desc = qs(0x29146d81)
		mesh = `models/car/male/m_punk_hair_hawk`
		deform_mesh = `models/car/male/m_punk_hair_hawk_def`
		$cas_male_hair_common_settings
		hat_hair = m_punk_hathair_hawk
		acc_skeleton = `skeletons/skel_m_punk_hair_hawk`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_hawk`
		acc_bones = [
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
	{
		desc_id = m_punk_hair_lspike
		frontend_desc = qs(0x4a5273e4)
		mesh = `models/car/male/m_punk_hair_lspike`
		deform_mesh = `models/car/male/m_punk_hair_lspike_def`
		$cas_male_hair_common_settings
		hat_hair = m_punk_hathair_lspike
		acc_skeleton = `skeletons/skel_m_punk_hair_lspike`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_lspike`
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
	{
		desc_id = m_punk_hair_j4spike
		frontend_desc = qs(0x37f5abc9)
		mesh = `models/car/male/m_punk_hair_j4spike`
		deform_mesh = `models/car/male/m_punk_hair_j4spike_def`
		$cas_male_hair_common_settings
		hat_hair = m_punk_hathair_j4spike
		acc_skeleton = `skeletons/skel_m_punk_hair_j4spike`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_j4spike`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
		]
		genre = [
			punk
		]
		random_weight = 0.25
	}
	{
		desc_id = m_punk_hair_spike
		frontend_desc = qs(0xcca40c61)
		mesh = `models/car/male/m_punk_hair_spike`
		deform_mesh = `models/car/male/m_punk_hair_spike_def`
		$cas_male_hair_common_settings
		hat_hair = m_punk_hathair_spike
		acc_skeleton = `skeletons/skel_m_punk_hair_spike`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_spike`
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
		random_weight = 0.25
	}
	{
		desc_id = m_punk_hair_jny_1
		frontend_desc = qs(0xb14dcfd4)
		mesh = `models/car/male/m_punk_hair_jny_1`
		deform_mesh = `models/car/male/m_punk_hair_jny_1_def`
		$cas_male_hair_common_settings
		hat_hair = none
		acc_skeleton = `skeletons/skel_m_punk_hair_jny_1`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_jny_1`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
		]
		genre = [
			punk
		]
	}
	{
		desc_id = m_punk_hair_jny_2
		frontend_desc = qs(0x840db1c5)
		mesh = `models/car/male/m_punk_hair_jny_2`
		deform_mesh = `models/car/male/m_punk_hair_jny_2_def`
		$cas_male_hair_common_settings
		hat_hair = m_punk_hathair_jny_2
		acc_skeleton = `skeletons/skel_m_punk_hair_jny_2`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_jny_2`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
		]
		genre = [
			punk
		]
	}
	{
		desc_id = 0xc7934de6
		frontend_desc = qs(0xb384678a)
		mesh = 0x1b394a19
		deform_mesh = 0xb41673d2
		$cas_male_hair_common_settings
		materials = [
			0x5537bb12
		]
		hat_hair = none
		acc_skeleton = 0x83b595fd
		acc_ragdoll = 0x67b10ade
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
		]
		genre = [
			punk
		]
	}
	{
		desc_id = m_rock_hair_drummer
		frontend_desc = qs(0x7a5a66fa)
		mesh = `models/car/male/m_rock_hair_drummer`
		deform_mesh = `models/car/male/m_rock_hair_drummer_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_drummer
		acc_skeleton = `skeletons/skel_m_rock_hair_drummer`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_drummer`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_03
			bone_acc_head_05
			bone_acc_head_07
		]
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_hair_guitarist
		frontend_desc = qs(0x5bccca2d)
		mesh = `models/car/male/m_rock_hair_guitarist`
		deform_mesh = `models/car/male/m_rock_hair_guitarist_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_guitarist
		acc_skeleton = `skeletons/skel_m_rock_hair_guitarist`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_guitarist`
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
			rock
			`heavy metal`
		]
		random_weight = 0.1
	}
	{
		desc_id = m_rock_hair_midpart
		frontend_desc = qs(0xb8b238cc)
		mesh = `models/car/male/m_rock_hair_midpart`
		deform_mesh = `models/car/male/m_rock_hair_midpart_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_midpart
		acc_skeleton = `skeletons/skel_m_rock_hair_midpart`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_midpart`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
		]
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_hair_slash
		frontend_desc = qs(0xdaa3e182)
		mesh = `models/car/male/m_rock_hair_slash`
		deform_mesh = `models/car/male/m_rock_hair_slash_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_slash
		acc_skeleton = `skeletons/skel_m_rock_hair_slash`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_slash`
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
			rock
			`heavy metal`
		]
		random_weight = 0.0
		hidden
	}
	{
		desc_id = m_rock_hair_braids
		frontend_desc = qs(0x2922f18c)
		mesh = `models/car/male/m_rock_hair_braids`
		deform_mesh = `models/car/male/m_rock_hair_braids_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_braids
		acc_skeleton = `skeletons/skel_m_rock_hair_braids`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_braids`
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
			rock
		]
		random_weight = 0.0
	}
	{
		desc_id = m_rock_hair_eddie2
		frontend_desc = qs(0x10b39ebd)
		mesh = `models/car/male/m_rock_hair_eddie2`
		deform_mesh = `models/car/male/m_rock_hair_eddie2_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_eddie2
		materials = [
			m_rock_hair_eddie2_primary
		]
		acc_skeleton = `skeletons/skel_m_rock_hair_eddie3`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_eddie3`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
		]
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_hair_eddie3
		frontend_desc = qs(0x563e0ee1)
		mesh = `models/car/male/m_rock_hair_eddie3`
		deform_mesh = `models/car/male/m_rock_hair_eddie3_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_eddie3
		material_groups = [
			{
				materials = [
					m_rock_hair_eddie3_primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					m_rock_hair_eddie3_secondary
				]
				shader = $cas_shader_hair
				name = qs(0xbbaf5fd1)
			}
		]
		acc_skeleton = `skeletons/skel_m_rock_hair_eddie3`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_eddie3`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
		]
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_hair_eddie4
		frontend_desc = qs(0xd254aac2)
		mesh = `models/car/male/m_rock_hair_eddie4`
		deform_mesh = `models/car/male/m_rock_hair_eddie4_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_eddie4
		materials = [
			m_rock_hair_eddie4_primary
		]
		acc_skeleton = `skeletons/skel_m_rock_hair_eddie3`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_eddie3`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
		]
		genre = [
			rock
		]
	}
	{
		desc_id = 0x8fe24602
		frontend_desc = qs(0x2fb6e6eb)
		mesh = 0xa23c0388
		deform_mesh = 0x016bbc31
		$cas_male_hair_common_settings
		hat_hair = 0x85df6d92
		material_groups = [
			{
				materials = [
					0x42ffbd58
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					0xb03e1f96
				]
				shader = $cas_shader_hair
				name = qs(0xbbaf5fd1)
			}
		]
		acc_skeleton = 0x05c3a936
		acc_ragdoll = 0xe2549eb0
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
		]
		genre = [
			rock
		]
	}
	{
		desc_id = m_funpart_hair_octo
		frontend_desc = qs(0xec85351c)
		mesh = `models/car/male/m_funpart_hair_octo`
		deform_mesh = `models/car/male/m_funpart_hair_octo_def`
		hat_hair = m_funpart_hathair_octo
		acc_skeleton = `skeletons/skel_m_funpart_hair_octo`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_funpart_hair_octo`
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
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_funpart_hair_slime
		frontend_desc = qs(0xdbfe1db5)
		mesh = `models/car/male/m_funpart_hair_slime`
		deform_mesh = `models/car/male/m_funpart_hair_slime_def`
		hat_hair = m_funpart_hathair_slime
		materials = [
			m_funpart_hair_slime_primary
		]
		acc_skeleton = `skeletons/skel_m_funpart_hair_slime`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_funpart_hair_slime`
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
		random_weight = 0.0
		locked
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
	{
		desc_id = m_bmtl_hathair_straight
		mesh = `models/car/male/m_bmtl_hathair_straight`
		deform_mesh = `models/car/male/m_bmtl_hathair_straight_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_bmtl_hair_straight`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_hair_straight`
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
	}
	{
		desc_id = m_bmtl_hathair_dread
		mesh = `models/car/male/m_bmtl_hathair_dread`
		deform_mesh = `models/car/male/m_bmtl_hathair_dread_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_bmtl_hair_dread`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_hair_dread`
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
	}
	{
		desc_id = m_bmtl_hathair_lars_3
		mesh = `models/car/male/m_bmtl_hathair_lars_3`
		deform_mesh = `models/car/male/m_bmtl_hathair_lars_3_def`
		$cas_male_hat_hair_common_settings
		material_groups = [
			{
				materials = [
					m_bmtl_hair_lars_3_primary
				]
				shader = $cas_shader_skin
				name = qs(0xabcff5c4)
			}
		]
		acc_skeleton = `skeletons/skel_m_bmtl_hair_lars_3`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_hair_lars_3`
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
	}
	{
		desc_id = m_bmtl_hathair_lars4
		mesh = `models/car/male/m_bmtl_hathair_lars4`
		deform_mesh = `models/car/male/m_bmtl_hathair_lars4_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_bmtl_hair_lars_4`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_hair_lars_4`
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
	}
	{
		desc_id = m_clsc_hathair_clive
		mesh = `models/car/male/m_clsc_hathair_clive`
		deform_mesh = `models/car/male/m_clsc_hathair_clive_def`
		acc_skeleton = `skeletons/skel_m_clsc_hair_clive`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_clive`
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
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_clsc_hathair_clive2
		mesh = `models/car/male/m_clsc_hathair_clive2`
		deform_mesh = `models/car/male/m_clsc_hathair_clive2_def`
		acc_skeleton = `skeletons/skel_m_clsc_hair_clive2`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_clive2`
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
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_clsc_hathair_clive3
		mesh = `models/car/male/m_clsc_hathair_clive3`
		deform_mesh = `models/car/male/m_clsc_hathair_clive3_def`
		acc_skeleton = `skeletons/skel_m_clsc_hair_clive3`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_clive3`
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
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_clsc_hathair_clive4
		mesh = `models/car/male/m_clsc_hathair_clive4`
		deform_mesh = `models/car/male/m_clsc_hathair_clive4_def`
		$cas_male_hair_common_settings
		acc_skeleton = `skeletons/skel_m_clsc_hair_clive4`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_clive4`
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
		$cas_male_hat_hair_common_settings
		material_groups = [
			{
				materials = [
					m_clsc_hathair_clive4_primary
				]
				shader = $cas_shader_hair
				name = qs(0xabcff5c4)
			}
		]
	}
	{
		desc_id = m_clsc_hathair_messy
		mesh = `models/car/male/m_clsc_hathair_messy`
		deform_mesh = `models/car/male/m_clsc_hathair_messy_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_clsc_hair_messy`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_messy`
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
	}
	{
		desc_id = m_clsc_hathair_country
		mesh = `models/car/male/m_clsc_hathair_country`
		deform_mesh = `models/car/male/m_clsc_hathair_country_def`
		$cas_male_hat_hair_common_settings
		materials = [
			m_clsc_hair_country_hair
		]
		acc_skeleton = `skeletons/skel_m_clsc_hair_messy`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_messy`
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
	}
	{
		desc_id = m_clsc_hathair_george
		mesh = `models/car/male/m_clsc_hathair_george`
		deform_mesh = `models/car/male/m_clsc_hathair_george_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_clsc_hair_george`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_george`
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
	}
	{
		desc_id = m_clsc_hathair_contest
		mesh = `models/car/male/m_clsc_hathair_contest`
		deform_mesh = `models/car/male/m_clsc_hathair_contest_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_clsc_hathair_jimi
		mesh = `models/car/male/m_clsc_hathair_jimi`
		deform_mesh = `models/car/male/m_clsc_hathair_jimi_def`
		$cas_male_hair_common_settings_skinshader
		materials = [
			m_clsc_hair_jimi_primary
			m_clsc_hair_jimi_secondary
		]
		acc_skeleton = `skeletons/skel_m_clsc_hair_george`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_george`
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
	}
	{
		desc_id = m_clsc_hathair_blfro
		mesh = `models/car/male/m_clsc_hathair_blfro`
		deform_mesh = `models/car/male/m_clsc_hathair_blfro_def`
		material_groups = [
			{
				materials = [
					m_clsc_hair_blfro_base
					m_clsc_hair_blfro_alpha
				]
				shader = $cas_shader_skin
				name = qs(0xdaa67e9a)
			}
		]
		$cas_male_hair_common_settings_skinshader
		acc_skeleton = `skeletons/skel_m_clsc_hair_blfro`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_hair_blfro`
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
	}
	{
		desc_id = m_glam_hathair_lapalms
		mesh = `models/car/male/m_glam_hathair_lapalms`
		deform_mesh = `models/car/male/m_glam_hathair_lapalms_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_glam_hair_lapalms`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_lapalms`
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
	}
	{
		desc_id = m_glam_hathair_seagull
		mesh = `models/car/male/m_glam_hathair_seagull`
		deform_mesh = `models/car/male/m_glam_hathair_seagull_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_glam_hair_seagull`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_seagull`
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
	}
	{
		desc_id = m_glam_hathair_gold
		mesh = `models/car/male/m_glam_hathair_gold`
		deform_mesh = `models/car/male/m_glam_hathair_gold_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_glam_hair_gold`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_gold`
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
	}
	{
		desc_id = m_glam_hathair_izzy1
		mesh = `models/car/male/m_glam_hathair_izzy1`
		deform_mesh = `models/car/male/m_glam_hathair_izzy1_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_glam_hair_izzy1`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_izzy1`
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
	}
	{
		desc_id = m_glam_hathair_izzy2
		mesh = `models/car/male/m_glam_hathair_izzy2`
		deform_mesh = `models/car/male/m_glam_hathair_izzy2_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_glam_hair_izzy2`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_izzy2`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_05
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = m_glam_hathair_izzy3
		mesh = `models/car/male/m_glam_hathair_izzy3`
		deform_mesh = `models/car/male/m_glam_hathair_izzy3_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_glam_hair_izzy3`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_izzy3`
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
	}
	{
		desc_id = m_glam_hathair_izzy4
		mesh = `models/car/male/m_glam_hathair_izzy4`
		deform_mesh = tut_demo_song_rhythmcoop_expert
		$cas_male_hat_hair_common_settings
		material_groups = [
			{
				materials = [
					m_glam_hair_izzy4_primary
				]
				shader = $cas_shader_hair
				name = qs(0xdcb77541)
			}
			{
				materials = [
					m_glam_hair_izzy4_secondary
				]
				shader = $cas_shader_hair
				name = qs(0x62587786)
			}
			{
				materials = [
					m_glam_hair_izzy4_torso_etc
				]
				shader = $cas_shader_skin
				name = qs(0xa6a2ed9c)
			}
		]
		acc_skeleton = `skeletons/skel_m_glam_hair_izzy4`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_hair_izzy4`
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
	}
	{
		desc_id = 0xf3e89204
		mesh = 0xde36d78e
		$cas_male_hat_hair_common_settings
		acc_skeleton = 0x0998bc76
		acc_ragdoll = 0xa7726d8a
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
	}
	{
		desc_id = m_metl_hathair_axel_1
		mesh = `models/car/male/m_metl_hathair_axel_1`
		deform_mesh = `models/car/male/m_metl_hathair_axel_1_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_metl_hair_axel_1`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_hair_axel_1`
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
	}
	{
		desc_id = m_metl_hathair_axel_4
		mesh = `models/car/male/m_metl_hathair_axel_4`
		deform_mesh = `models/car/male/m_metl_hathair_axel_4_def`
		$cas_male_hair_common_settings
		materials = [
			axel4_hair_primary
		]
		acc_skeleton = `skeletons/skel_m_metl_hair_axel_4`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_hair_axel_4`
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
	}
	{
		desc_id = 0x28e325de
		mesh = 0xef39cdde
		deform_mesh = 0x01269e6d
		$cas_male_hair_common_settings
		materials = [
			0x1d09f890
		]
		acc_skeleton = 0x445e6bd7
		acc_ragdoll = 0xc85b8235
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
		]
	}
	{
		desc_id = m_metl_hathair_curlio
		mesh = `models/car/male/m_metl_hathair_curlio`
		deform_mesh = `models/car/male/m_metl_hathair_curlio_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_metl_hair_curlio`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_hair_curlio`
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
	}
	{
		desc_id = m_metl_hathair_lars
		mesh = `models/car/male/m_metl_hathair_lars`
		deform_mesh = `models/car/male/m_metl_hathair_lars_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_metl_hair_lars`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_hair_lars`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_05
			bone_acc_head_06
		]
	}
	{
		desc_id = m_metl_hathair_midhigh
		mesh = `models/car/male/m_metl_hathair_midhigh`
		deform_mesh = `models/car/male/m_metl_hathair_midhigh_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_metl_hair_midhigh`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_hair_midhigh`
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
	}
	{
		desc_id = 0xd3acaf29
		mesh = 0x14764729
		deform_mesh = 0xabbb567b
		acc_skeleton = 0xe803e5fc
		acc_ragdoll = 0x03ac585d
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
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_pop_hathair_buzz
		mesh = `models/car/male/m_pop_hathair_buzz`
		deform_mesh = `models/car/male/m_pop_hathair_buzz_def`
		$cas_male_hair_common_settings_skinshader
	}
	{
		desc_id = m_pop_hathair_pomp
		mesh = `models/car/male/m_pop_hathair_pomp`
		deform_mesh = `models/car/male/m_pop_hathair_pomp_def`
		$cas_male_hair_common_settings
		acc_skeleton = `skeletons/skel_m_pop_hair_pomp`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_pop_hair_pomp`
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
	}
	{
		desc_id = m_pop_hathair_emo1
		mesh = `models/car/male/m_pop_hathair_emo1`
		deform_mesh = `models/car/male/m_pop_hathair_emo1_def`
		$cas_male_hair_common_settings
		acc_skeleton = `skeletons/skel_m_pop_hair_emo1`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_pop_hair_emo1`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
		]
	}
	{
		desc_id = 0x4d79623d
		mesh = 0x4039d646
		deform_mesh = 0x2fc8a5ce
		$cas_male_hair_common_settings
	}
	{
		desc_id = 0xcd23e836
		mesh = 0x63f245a6
		deform_mesh = 0x8c8b9da8
		$cas_male_hair_common_settings
	}
	{
		desc_id = m_punk_hathair_spike
		mesh = `models/car/male/m_punk_hathair_spike`
		deform_mesh = `models/car/male/m_punk_hathair_spike_def`
		$cas_male_hair_common_settings
		acc_skeleton = `skeletons/skel_m_punk_hair_spike`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_spike`
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
	}
	{
		desc_id = m_punk_hathair_hawk
		mesh = `models/car/male/m_punk_hathair_hawk`
		deform_mesh = `models/car/male/m_punk_hathair_hawk_def`
		$cas_male_hair_common_settings
		acc_skeleton = `skeletons/skel_m_punk_hair_hawk`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_hawk`
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
	}
	{
		desc_id = m_punk_hathair_lspike
		mesh = `models/car/male/m_punk_hathair_lspike`
		deform_mesh = `models/car/male/m_punk_hathair_lspike_def`
		$cas_male_hair_common_settings
		acc_skeleton = `skeletons/skel_m_punk_hair_lspike`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_lspike`
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
	}
	{
		desc_id = m_punk_hathair_jny_2
		mesh = `models/car/male/m_punk_hathair_jny_2`
		deform_mesh = `models/car/male/m_punk_hathair_jny_2_def`
		$cas_male_hair_common_settings
		acc_skeleton = `skeletons/skel_m_punk_hair_jny_2`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_jny_2`
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
	}
	{
		desc_id = m_punk_hathair_j4spike
		mesh = `models/car/male/m_punk_hathair_j4spike`
		deform_mesh = `models/car/male/m_punk_hathair_j4spike_def`
		$cas_male_hair_common_settings
		acc_skeleton = `skeletons/skel_m_punk_hair_j4spike`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_hair_j4spike`
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
	}
	{
		desc_id = m_rock_hathair_drummer
		mesh = `models/car/male/m_rock_hathair_drummer`
		deform_mesh = `models/car/male/m_rock_hathair_drummer_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_rock_hair_drummer`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_drummer`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_03
			bone_acc_head_05
			bone_acc_head_07
		]
	}
	{
		desc_id = m_rock_hathair_midpart
		mesh = `models/car/male/m_rock_hathair_midpart`
		deform_mesh = `models/car/male/m_rock_hathair_midpart_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_rock_hair_midpart`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_midpart`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
		]
	}
	{
		desc_id = m_rock_hathair_slash
		mesh = `models/car/male/m_rock_hathair_slash`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_rock_hair_slash`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_slash`
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
	}
	{
		desc_id = m_rock_hathair_guitarist
		mesh = `models/car/male/m_rock_hathair_guitarist`
		deform_mesh = `models/car/male/m_rock_hathair_guitarist_def`
		$cas_male_hair_common_settings
		acc_skeleton = `skeletons/skel_m_rock_hair_guitarist`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_guitarist`
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
	}
	{
		desc_id = m_rock_hathair_braids
		mesh = `models/car/male/m_rock_hathair_braids`
		deform_mesh = `models/car/male/m_rock_hathair_braids_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_rock_hair_braids`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_braids`
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
	}
	{
		desc_id = m_rock_hathair_eddie2
		mesh = `models/car/male/m_rock_hathair_eddie2`
		deform_mesh = `models/car/male/m_rock_hathair_eddie2_def`
		$cas_male_hat_hair_common_settings
		materials = [
			m_rock_hair_eddie2_primary
		]
		acc_skeleton = `skeletons/skel_m_rock_hair_eddie3`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_eddie3`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
		]
	}
	{
		desc_id = m_rock_hathair_eddie3
		mesh = `models/car/male/m_rock_hathair_eddie3`
		deform_mesh = `models/car/male/m_rock_hathair_eddie3_def`
		$cas_male_hat_hair_common_settings
		materials = [
			m_rock_hair_eddie3_primary
		]
		acc_skeleton = `skeletons/skel_m_rock_hair_eddie3`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_eddie3`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
		]
	}
	{
		desc_id = m_rock_hathair_eddie4
		mesh = `models/car/male/m_rock_hathair_eddie4`
		deform_mesh = `models/car/male/m_rock_hathair_eddie4_def`
		$cas_male_hat_hair_common_settings
		materials = [
			m_rock_hair_eddie4_primary
		]
		acc_skeleton = `skeletons/skel_m_rock_hair_eddie3`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_hair_eddie3`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
		]
	}
	{
		desc_id = 0x85df6d92
		mesh = 0x8518b77a
		deform_mesh = 0xbbb1601c
		$cas_male_hat_hair_common_settings
		materials = [
			0x42ffbd58
			0xb03e1f96
		]
		acc_skeleton = 0x05c3a936
		acc_ragdoll = 0xe2549eb0
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
		]
	}
	{
		desc_id = m_funpart_hathair_octo
		mesh = `models/car/male/m_funpart_hathair_octo`
		deform_mesh = `models/car/male/m_funpart_hathair_octo_def`
		acc_skeleton = `skeletons/skel_m_funpart_hair_octo`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_funpart_hair_octo`
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
	}
	{
		desc_id = m_funpart_hathair_slime
		mesh = `models/car/male/m_funpart_hair_slime`
		deform_mesh = `models/car/male/m_funpart_hair_slime_def`
		materials = [
			m_funpart_hair_slime_primary
		]
		acc_skeleton = `skeletons/skel_m_funpart_hair_slime`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_funpart_hair_slime`
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
	}
	{
		desc_id = m_goth_hathair_devilock
		mesh = `models/car/male/m_goth_hathair_devilock`
		deform_mesh = `models/car/male/m_goth_hathair_devilock_def`
		$cas_male_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_m_goth_hair_devilock`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_hair_devilock`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_03
			bone_acc_head_05
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = m_goth_hathair_dreads
		mesh = `models/car/male/m_goth_hathair_dreads`
		deform_mesh = `models/car/male/m_goth_hathair_dreads_def`
		$cas_male_hair_common_settings_skinshader
		materials = [
			m_goth_hair_dreads_primary
		]
		acc_skeleton = `skeletons/skel_m_goth_hair_dreads`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_hair_dreads`
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
	}
	{
		desc_id = m_goth_hathair_remedy
		mesh = `models/car/male/m_goth_hathair_remedy`
		deform_mesh = `models/car/male/m_goth_hathair_remedy_def`
		$cas_male_hair_common_settings
		acc_skeleton = `skeletons/skel_m_goth_hair_remedy`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_hair_remedy`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
		]
	}
]
cas_male_hat = [
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
		random_weight = 4.0
	}
	{
		desc_id = m_clsc_hat_cowboy
		frontend_desc = qs(0xffaea878)
		mesh = `models/car/male/m_clsc_hat_cowboy`
		deform_mesh = `models/car/male/m_clsc_hat_cowboy_def`
		genre = [
			`classic rock`
		]
		random_weight = 0.25
	}
	{
		desc_id = m_clsc_hat_clive3
		frontend_desc = qs(0x953c0bb9)
		mesh = `models/car/male/m_clsc_hat_clive3`
		deform_mesh = `models/car/male/m_clsc_hat_clive3_def`
		material_groups = [
			{
				materials = [
					m_clsc_hat_clive3_primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					m_clsc_hat_clive3_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xee3a510b)
			}
		]
		genre = [
			`classic rock`
		]
		random_weight = 0.25
		locked
	}
	{
		desc_id = m_punk_hat_helmet
		frontend_desc = qs(0xef1f656a)
		mesh = `models/car/male/m_punk_hat_helmet`
		deform_mesh = `models/car/male/m_punk_hat_helmet_def`
		genre = [
			punk
		]
		random_weight = 0
	}
	{
		desc_id = m_rock_hat_spacehelmet
		frontend_desc = qs(0x348960af)
		mesh = `models/car/male/m_rock_hat_spacehelmet`
		deform_mesh = `models/car/male/m_rock_hat_spacehelmet_def`
		hat_hair = none
		genre = [
			rock
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_rock_hat_halo
		frontend_desc = qs(0x36f714a7)
		mesh = `models/car/male/m_rock_hat_halo`
		deform_mesh = `models/car/male/m_rock_hat_halo_def`
		hat_hair = original_hair
		genre = [
			rock
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_clsc_hat_cptn
		frontend_desc = qs(0xeb12864d)
		mesh = `models/car/male/m_clsc_hat_cptn`
		materials = [
			m_clsc_hat_cptn_primary
		]
		deform_mesh = `models/car/male/m_clsc_hat_cptn_def`
		genre = [
			`classic rock`
		]
		random_weight = 0.1
	}
	{
		desc_id = m_fun_hat_eyeball
		frontend_desc = qs(0x3b86ba16)
		mesh = `models/car/male/m_fun_hat_eyeball`
		deform_mesh = `models/car/male/m_fun_hat_eyeball_def`
		hat_hair = none
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_clsc_hat_triangle
		frontend_desc = qs(0xa1bdcefb)
		mesh = `models/car/male/m_clsc_hat_triangle`
		deform_mesh = `models/car/male/m_clsc_hat_triangle_def`
		material_groups = [
			{
				materials = [
					m_clsc_hat_triangle_primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					m_clsc_hat_triangle_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x9266c624)
			}
		]
		genre = [
			`classic rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = m_pop_hat_beanie
		frontend_desc = qs(0x8cfec6e5)
		mesh = `models/car/male/m_pop_hat_beanie`
		deform_mesh = `models/car/male/m_pop_hat_beanie_def`
		materials = [
			m_pop_hat_beanie_primary
		]
		genre = [
			pop
		]
		random_weight = 0.5
	}
	{
		desc_id = m_pop_hat_bucket
		frontend_desc = qs(0xff1d662e)
		mesh = `models/car/male/m_pop_hat_bucket`
		deform_mesh = `models/car/male/m_pop_hat_bucket_def`
		material_groups = [
			{
				materials = [
					m_pop_hat_bucket_primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					m_pop_hat_bucket_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xee3a510b)
			}
		]
		genre = [
			pop
		]
		random_weight = 0.5
	}
	{
		desc_id = m_pop_hat_bucket2
		frontend_desc = qs(0x520453e4)
		mesh = `models/car/male/m_pop_hat_bucket2`
		deform_mesh = `models/car/male/m_pop_hat_bucket2_def`
		material_groups = [
			{
				materials = [
					m_pop_hat_bucket2_primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					m_pop_hat_bucket2_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xee3a510b)
			}
		]
		genre = [
			pop
		]
		random_weight = 0.5
	}
	{
		desc_id = m_pop_head_gasmask
		frontend_desc = qs(0x0039dd19)
		mesh = `models/car/male/m_pop_head_gasmask`
		deform_mesh = `models/car/male/m_pop_head_gasmask_def`
		materials = [
			m_pop_head_gasmask_mask
		]
		hat_hair = none
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_pop_head_ww2helm
		frontend_desc = qs(0xa1ed9a95)
		mesh = `models/car/male/m_pop_head_ww2helm`
		deform_mesh = `models/car/male/m_pop_head_ww2helm_def`
		random_weight = 0.0
		locked
	}
	{
		desc_id = 0xf4d4ea48
		frontend_desc = qs(0xa691c807)
		mesh = 0x287eedb7
		deform_mesh = 0xc57deed5
		materials = [
			0x6f9c5c37
		]
		genre = [
			pop
		]
		random_weight = 0.0
	}
	{
		desc_id = 0xa335313b
		frontend_desc = qs(0x05549fc9)
		mesh = 0x8eeb74b1
		deform_mesh = 0x21574af4
		hat_hair = none
		material_groups = [
			{
				materials = [
					0x3dfd378d
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					0x411c3bf0
				]
				shader = $cas_shader_skin
				name = qs(0x58cf8c6c)
			}
			{
				materials = [
					0xa01f8c2e
				]
				shader = $cas_shader_skin
				name = qs(0x974dd072)
			}
		]
		genre = [
			pop
		]
		random_weight = 0.0
	}
	{
		desc_id = m_rock_hat_starpin
		frontend_desc = qs(0x4be7facb)
		mesh = `models/car/male/m_rock_hat_starpin`
		deform_mesh = `models/car/male/m_rock_hat_starpin_def`
		materials = [
			m_rock_hat_starpin_primary
		]
		genre = [
			rock
		]
		random_weight = 0.25
	}
	{
		desc_id = m_rock_hat_cowboy
		frontend_desc = qs(0x2e4734b1)
		mesh = `models/car/male/m_rock_hat_cowboy`
		deform_mesh = `models/car/male/m_rock_hat_cowboy_def`
		material_groups = [
			{
				materials = [
					m_rock_hat_cowboy_primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					m_rock_hat_cowboy_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x55a35727)
			}
		]
		genre = [
			rock
		]
		random_weight = 0.25
	}
	{
		desc_id = m_metl_hat_zakk
		frontend_desc = qs(0xf8ed58a5)
		mesh = `models/car/male/m_metl_hat_zakk`
		deform_mesh = `models/car/male/m_metl_hat_zakk_def`
		genre = [
			`heavy metal`
		]
		random_weight = 0.25
	}
	{
		desc_id = m_metl_hat_armorhelm
		frontend_desc = qs(0x7adc03ce)
		mesh = `models/car/male/m_metl_hat_armorhelm`
		deform_mesh = `models/car/male/m_metl_hat_armorhelm_def`
		hat_hair = none
		genre = [
			`heavy metal`
		]
		random_weight = 0.0
	}
	{
		desc_id = m_metl_hat_axel2
		frontend_desc = qs(0xc2879778)
		mesh = `models/car/male/m_metl_hat_axel2`
		deform_mesh = `models/car/male/m_metl_hat_axel2_def`
		genre = [
			`heavy metal`
		]
		random_weight = 0.4
	}
	{
		desc_id = m_metl_hat_studs
		frontend_desc = qs(0x3e943475)
		mesh = `models/car/male/m_metl_hat_studs`
		deform_mesh = `models/car/male/m_metl_hat_studs_def`
		genre = [
			`heavy metal`
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_metl_horn
		frontend_desc = qs(0x6fea43c1)
		mesh = `models/car/male/m_metl_acc_horn`
		deform_mesh = `models/car/male/m_metl_acc_horn_def`
		material_groups = [
			{
				materials = [
					m_metl_acc_horn_primary
				]
				shader = $cas_shader_skin
				name = qs(0x3330d471)
			}
			{
				materials = [
					m_metl_acc_horn_hornbase
				]
				shader = $cas_shader_skin
				name = qs(0x9c58ccba)
			}
		]
		hat_hair = original_hair
		genre = [
			`heavy metal`
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_bmtl_hat_viking
		frontend_desc = qs(0xbbf00af8)
		mesh = `models/car/male/m_bmtl_hat_viking`
		deform_mesh = `models/car/male/m_bmtl_hat_viking_def`
		genre = [
			`black metal`
		]
		hat_hair = none
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_bmtl_hat_lars4
		frontend_desc = qs(0x055650a5)
		mesh = `models/car/male/m_bmtl_hat_lars4`
		hat_hair = none
		deform_mesh = `models/car/male/m_bmtl_hat_lars4_def`
		genre = [
			`black metal`
		]
		locked
	}
	{
		desc_id = m_bmtl_hat_skullhelmet
		frontend_desc = qs(0xea89ff84)
		mesh = `models/car/male/m_bmtl_hat_skullhelmet`
		material_groups = [
			{
				materials = [
					m_bmtl_hat_skullhelmet_primary
				]
				shader = $cas_shader_skin
				name = qs(0x9c33f5de)
			}
			{
				materials = [
					m_bmtl_hat_skullhelmet_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x60b5b214)
			}
		]
		deform_mesh = `models/car/male/m_bmtl_hat_skullhelmet_def`
		genre = [
			`black metal`
		]
		hat_hair = none
		random_weight = 0.5
		locked
	}
	{
		desc_id = m_bmtl_hat_brain
		frontend_desc = qs(0xe5baded2)
		mesh = `models/car/male/m_bmtl_hat_brain`
		deform_mesh = `models/car/male/m_bmtl_hat_brain_def`
		genre = [
			`black metal`
		]
		material_groups = [
			{
				materials = [
					m_bmtl_hat_brain_primary
				]
				shader = $cas_shader_skin
				name = qs(0x782c48e1)
			}
			{
				materials = [
					m_bmtl_hat_brain_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x10a77f06)
			}
		]
		hat_hair = none
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_goth_hat_tophat
		frontend_desc = qs(0xd9f3b456)
		mesh = `models/car/male/m_goth_hat_tophat`
		deform_mesh = `models/car/male/m_goth_hat_tophat_def`
		$cas_male_hair_common_settings
		material_groups = [
			{
				materials = [
					m_goth_acc_tophat_primary
				]
				shader = $cas_shader_hair
				name = qs(0x4a6d745b)
			}
			{
				materials = [
					m_goth_acc_tophat_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xee3a510b)
			}
		]
		genre = [
			goth
		]
		random_weight = 0.25
	}
	{
		desc_id = m_hat_ninja_c1
		frontend_desc = qs(0x97d60449)
		mesh = `models/car/male/m_hat_ninja_c1`
		deform_mesh = `models/car/male/m_hat_ninja_c1_def`
		material_groups = [
			{
				materials = [
					m_hat_ninja_c1_primary
				]
				shader = $cas_shader_skin
				name = qs(0x24f7c8f6)
			}
			{
				materials = [
					m_hat_ninja_c1_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xf398865c)
			}
		]
		hat_hair = none
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_hat_gorilla
		frontend_desc = qs(0x6d95532b)
		mesh = `models/car/male/m_hat_gorilla`
		deform_mesh = `models/car/male/m_hat_gorilla_def`
		hat_hair = none
		materials = [
			m_hat_gorilla_primary
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_hat_pimp
		frontend_desc = qs(0xd8a55f8a)
		mesh = `models/car/male/m_hat_pimp`
		deform_mesh = `models/car/male/m_hat_pimp_def`
		material_groups = [
			{
				materials = [
					m_hat_pimp_primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					m_hat_pimp_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x8cff0357)
			}
			{
				materials = [
					m_hat_pimp_feather
				]
				shader = $cas_shader_skin
				name = qs(0x9266c624)
			}
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_rock_hat_retrotv
		frontend_desc = qs(0xaf00387d)
		mesh = `models/car/male/m_rock_hat_retrotv`
		hat_hair = none
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_fun_hat_ww2helmet
		frontend_desc = qs(0x8db59eb9)
		mesh = `models/car/male/m_fun_hat_ww2helmet`
		deform_mesh = `models/car/male/m_fun_hat_ww2helmet_def`
		hat_hair = none
		materials = [
			m_fun_hat_ww2helmet_helmet
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_fun_hat_demon
		frontend_desc = qs(0x364f141c)
		mesh = `models/car/male/m_rock_hat_cyclops`
		deform_mesh = `models/car/male/m_rock_hat_cyclops_def`
		hat_hair = none
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_funpart_hat_clown
		frontend_desc = qs(0x102e4c2d)
		mesh = `models/car/male/m_funpart_hat_clown`
		deform_mesh = `models/car/male/m_funpart_hat_clown_def`
		hat_hair = none
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_rock_hat_pumpkin
		frontend_desc = qs(0x6ee59962)
		mesh = `models/car/male/m_rock_hat_pumpkin`
		hat_hair = none
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_fun_hat_magical
		frontend_desc = qs(0x82770ec9)
		mesh = `models/car/male/m_fun_hat_hannya`
		deform_mesh = `models/car/male/m_fun_hat_hannya_def`
		hat_hair = none
		random_weight = 0.0
		locked
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
		desc_id = m_rock_fhair_stub
		frontend_desc = qs(0x4371be74)
		mesh = `models/car/male/m_rock_fhair_stub`
		deform_mesh = `models/car/male/m_rock_fhair_stub_def`
		$cas_male_hair_common_settings_skinshader
		random_weight = 0.0
	}
	{
		desc_id = m_rock_fhair_goatee01
		frontend_desc = qs(0x51861c55)
		mesh = `models/car/male/m_rock_fhair_goatee01`
		deform_mesh = `models/car/male/m_rock_fhair_goatee01_def`
		$cas_male_hair_common_settings
		random_weight = 1.0
	}
	{
		desc_id = m_rock_fhair_goatee02
		frontend_desc = qs(0x3ffb7e3d)
		mesh = `models/car/male/m_rock_fhair_goatee02`
		deform_mesh = `models/car/male/m_rock_fhair_goatee02_def`
		$cas_male_hair_common_settings
		random_weight = 1.0
	}
	{
		desc_id = m_rock_fhair_goatee03
		frontend_desc = qs(0x963b21da)
		mesh = `models/car/male/m_rock_fhair_goatee03`
		deform_mesh = `models/car/male/m_rock_fhair_goatee03_def`
		$cas_male_hair_common_settings
		random_weight = 1.0
	}
	{
		desc_id = m_clsc_fhair_stache01
		frontend_desc = qs(0xb4651acf)
		mesh = `models/car/male/m_clsc_fhair_stache01`
		deform_mesh = `models/car/male/m_clsc_fhair_stache01_def`
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_fhair_stache04
		frontend_desc = qs(0xe1760794)
		mesh = `models/car/male/m_clsc_fhair_stache02`
		deform_mesh = `models/car/male/m_clsc_fhair_stache02_def`
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_fhair_soulpatch
		frontend_desc = qs(0x507ad5bb)
		mesh = `models/car/male/m_clsc_fhair_soulpatch`
		deform_mesh = `models/car/male/m_clsc_fhair_soulpatch_def`
		$cas_male_hair_common_settings_skinshader
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_fhair_clive
		frontend_desc = qs(0xe9db2fa2)
		mesh = `models/car/male/m_clsc_fhair_clive`
		deform_mesh = `models/car/male/m_clsc_fhair_clive_def`
		$cas_male_hair_common_settings
		random_weight = 0.0
		materials = [
			m_clsc_fhair_clive_primary
		]
	}
	{
		desc_id = m_clsc_fhair_clive3
		frontend_desc = qs(0xb4593717)
		mesh = `models/car/male/m_clsc_fhair_clive3`
		deform_mesh = `models/car/male/m_clsc_fhair_clive3_def`
		$cas_male_hair_common_settings
		random_weight = 0.0
		materials = [
			m_clsc_fhair_clive3_primary
		]
	}
	{
		desc_id = m_clsc_fhair_burns01
		frontend_desc = qs(0xeb07e68a)
		mesh = `models/car/male/m_rock_fhair_burns01`
		deform_mesh = `models/car/male/m_rock_fhair_burns01_def`
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_fhair_country
		frontend_desc = qs(0xddb9e702)
		mesh = `models/car/male/m_clsc_fhair_country`
		deform_mesh = `models/car/male/m_clsc_fhair_country_def`
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
	{
		desc_id = m_bmtl_fhair_beard
		frontend_desc = qs(0xecf78185)
		mesh = `models/car/male/m_bmtl_fhair_beard`
		deform_mesh = `models/car/male/m_bmtl_fhair_beard_def`
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
	{
		desc_id = m_metl_fhair_overgrth
		frontend_desc = qs(0x46c59274)
		mesh = `models/car/male/m_metl_fhair_overgrth`
		materials = [
			m_metl_fhair_overgrth_primary
		]
		deform_mesh = `models/car/male/m_metl_fhair_overgrth_def`
		cas_male_hair_common_settings_skinshader
		random_weight = 0.0
	}
	{
		desc_id = m_metl_fhair_zzbeard
		frontend_desc = qs(0xad162047)
		mesh = `models/car/male/m_metl_fhair_zzbeard`
		materials = [
			m_metl_fhair_zzbeard_primary
		]
		deform_mesh = `models/car/male/m_metl_fhair_zzbeard_def`
		cas_male_hair_common_settings_skinshader
		random_weight = 0.0
	}
	{
		desc_id = m_metl_fhair_blackb
		frontend_desc = qs(0x0652f2e0)
		mesh = `models/car/male/m_metl_fhair_blackb`
		materials = [
			m_metl_fhair_blackb_primary
			m_metl_fhair_blackb_secondary
		]
		deform_mesh = `models/car/male/m_metl_fhair_blackb_def`
		cas_male_hair_common_settings_skinshader
		random_weight = 0.0
	}
	{
		desc_id = m_mtl_fhair_axel4
		frontend_desc = qs(0x910e3ea9)
		mesh = `models/car/male/m_mtl_fhair_axel4`
		deform_mesh = `models/car/male/m_mtl_fhair_axel4_def`
		materials = [
			axel4_fhair_primary
		]
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
		replace = `tex/models/characters/car/male/car_gh5_male_head_n`
		with = `tex/models/characters/layers/car/male/age/car_male_age03_n`
		frontend_desc = qs(0xbe8a142d)
		in = cas_body
		in2 = cas_body
		random_weight = 0.25
	}
	{
		desc_id = car_male_aged
		replace = `tex/models/characters/car/male/car_gh5_male_head_n`
		with = `tex/models/characters/layers/car/male/age/car_male_age04_n`
		frontend_desc = qs(0x1dd22d68)
		in = cas_body
		in2 = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_male_old
		replace = `tex/models/characters/car/male/car_gh5_male_head_n`
		with = `tex/models/characters/layers/car/male/age/car_male_age05_n`
		frontend_desc = qs(0xc05200fd)
		in = cas_body
		in2 = cas_body
		random_weight = 0.0
	}
]
cas_male_teeth = [
	{
		desc_id = car_male_teeth
		frontend_desc = qs(0x675459e3)
		mesh = `models/car/male/car_male_teeth`
		deform_mesh = `models/car/male/car_male_teeth_def`
	}
	{
		desc_id = car_male_teeth01
		frontend_desc = qs(0x038dcbee)
		mesh = `models/car/male/car_male_teeth01`
		deform_mesh = `models/car/male/car_male_teeth01_def`
		random_weight = 0.0
	}
	{
		desc_id = car_male_teeth02
		frontend_desc = qs(0x1a2ce811)
		mesh = `models/car/male/car_male_teeth02`
		deform_mesh = `models/car/male/car_male_teeth02_def`
		random_weight = 0.0
	}
	{
		desc_id = car_male_teeth03
		frontend_desc = qs(0xd067d16e)
		mesh = `models/car/male/car_male_teeth03`
		deform_mesh = `models/car/male/car_male_teeth03_def`
		random_weight = 0.0
	}
]
