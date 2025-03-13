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
	{
		desc_id = car_angled
		frontend_desc = qs(0x48b339dd)
		replace = `tex\models\characters\car\male\car_male_brow_d`
		with = `tex\models\characters\car\male\car_male_brow_03_d`
		in = cas_body
	}
	{
		desc_id = car_dash
		frontend_desc = qs(0x200cdea3)
		replace = `tex\models\characters\car\male\car_male_brow_d`
		with = `tex\models\characters\car\male\car_male_brow_04_d`
		in = cas_body
	}
	{
		desc_id = car_vulcan
		frontend_desc = qs(0x36cc96ef)
		replace = `tex\models\characters\car\male\car_male_brow_d`
		with = `tex\models\characters\car\male\car_male_brow_05_d`
		in = cas_body
	}
	{
		desc_id = car_uni_brow
		frontend_desc = qs(0xb662b00c)
		replace = `tex\models\characters\car\male\car_male_brow_d`
		with = `tex\models\characters\car\male\car_male_brow_06_d`
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
		cloth = `models/car/male/m_bmtl_hair_straight`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_bicep_r
			bone_bicep_l
		]
		deform_mesh = `models/car/male/m_bmtl_hair_straight_def`
		$cas_male_hair_common_settings
		hat_hair = m_bmtl_hathair_straight
		genre = [
			`black metal`
		]
	}
	{
		desc_id = m_bmtl_hair_lars_3
		frontend_desc = qs(0x300e23e8)
		mesh = `models/car/male/m_bmtl_hair_lars_3`
		deform_mesh = `models/car/male/m_bmtl_hair_lars_3_def`
		hat_hair = m_bmtl_hathair_lars_3
		cloth = `models/car/male/m_bmtl_hair_lars_3`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
		]
		$cas_male_hair_common_settings_skinshader
		material_groups = [
			{
				materials = [
					m_bmtl_hair_lars_3_primary
				]
				shader = $cas_shader_skin
				name = qs(0xabcff5c4)
			}
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
		cloth = `models/car/male/m_bmtl_hair_lars4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_chest
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
		cloth = `models/car/male/m_bmtl_hair_dread`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_l
			bone_collar_r
			bone_bicep_l
			bone_bicep_r
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
		cloth = `models/car/male/m_clsc_hair_clive`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		hat_hair = m_clsc_hathair_clive
		materials = [
			m_clsc_hair_clive_primary
		]
		genre = [
			`classic rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_hair_clive2
		frontend_desc = qs(0x19161011)
		mesh = `models/car/male/m_clsc_hair_clive2`
		deform_mesh = `models/car/male/m_clsc_hair_clive2_def`
		cloth = `models/car/male/m_clsc_hair_clive2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_clive2
		materials = [
			m_clsc_hair_clive2_primary
		]
		genre = [
			`classic rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_hair_clive3
		frontend_desc = qs(0x02788adf)
		mesh = `models/car/male/m_clsc_hair_clive3`
		cloth = `models/car/male/m_clsc_hair_clive3`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
		]
		deform_mesh = `models/car/male/m_clsc_hair_clive3_def`
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_clive3
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
		cloth = `models/car/male/m_clsc_hair_clive4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
		]
		deform_mesh = `models/car/male/m_clsc_hair_clive4_def`
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_clive4
		material_groups = [
			{
				materials = [
					m_clsc_hair_clive4_primary
				]
				shader = $cas_shader_hair
				name = qs(0xabcff5c4)
			}
			{
				materials = [
					m_clsc_hair_clive4_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x80e2a607)
			}
		]
		genre = [
			`classic rock`
		]
		random_weight = 0.0
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
				name = qs(0xdaa67e9a)
			}
		]
		hat_hair = m_clsc_hathair_blfro
		cloth = `models/car/male/m_clsc_hair_blfro`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		genre = [
			`classic rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_hair_jimi
		frontend_desc = qs(0xd3f52ad2)
		mesh = `models/car/male/m_clsc_hair_jimi`
		deform_mesh = `models/car/male/m_clsc_hair_jimi_def`
		$cas_male_hair_common_settings_skinshader
		hat_hair = m_clsc_hathair_jimi
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
		cloth = `models/car/male/m_glam_hair_seagull`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		deform_mesh = `models/car/male/m_glam_hair_seagull_def`
		$cas_male_hair_common_settings
		hat_hair = m_glam_hathair_seagull
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
		cloth = `models/car/male/m_glam_hair_izzy1`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
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
		cloth = `models/car/male/m_glam_hair_izzy2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
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
		cloth = `models/car/male/m_glam_hair_izzy3`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
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
		hat_hair = m_glam_hathair_izzy4
		cloth = `models/car/male/m_glam_hair_izzy4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		genre = [
			`glam rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = m_goth_hair_remedy
		frontend_desc = qs(0xcafba8c1)
		mesh = `models/car/male/m_goth_hair_remedy`
		deform_mesh = `models/car/male/m_goth_hair_remedy_def`
		$cas_male_hair_common_settings
		hat_hair = m_goth_hathair_remedy
		cloth = `models/car/male/m_goth_hair_remedy`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		genre = [
			goth
		]
	}
	{
		desc_id = m_goth_hair_dreads
		frontend_desc = qs(0x4f27cb2e)
		mesh = `models/car/male/m_goth_hair_dreads`
		cloth = `models/car/male/m_goth_hair_dreads`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		deform_mesh = `models/car/male/m_goth_hair_dreads_def`
		$cas_male_hair_common_settings_skinshader
		hat_hair = m_goth_hathair_dreads
		materials = [
			m_goth_hair_dreads_primary
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
		cloth = `models/car/male/m_goth_hair_devilock`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_collar_r
			bone_collar_l
			bone_chest
		]
		random_weight = 0.0
	}
	{
		desc_id = m_metl_hair_axel_1
		frontend_desc = qs(0x26aa668b)
		mesh = `models/car/male/m_metl_hair_axel_1`
		cloth = `models/car/male/m_metl_hair_axel_1`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_forearm_l
			bone_forearm_r
		]
		deform_mesh = `models/car/male/m_metl_hair_axel_1_def`
		$cas_male_hair_common_settings
		hat_hair = m_metl_hathair_axel_1
		materials = [
			m_metl_hair_axel_1_primary
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
		cloth = `models/car/male/m_metl_hair_axel_4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_forearm_l
			bone_forearm_r
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = m_metl_hair_curlio
		frontend_desc = qs(0x75e6742b)
		mesh = `models/car/male/m_metl_hair_curlio`
		cloth = `models/car/male/m_metl_hair_curlio`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_bicep_r
			bone_bicep_l
		]
		deform_mesh = `models/car/male/m_metl_hair_curlio_def`
		$cas_male_hair_common_settings
		hat_hair = m_metl_hathair_curlio
		genre = [
			`heavy metal`
			rock
		]
		random_weight = 0.0
	}
	{
		desc_id = m_metl_hair_lars
		frontend_desc = qs(0x2c2db6e7)
		mesh = `models/car/male/m_metl_hair_lars`
		deform_mesh = `models/car/male/m_metl_hair_lars_def`
		$cas_male_hair_common_settings
		hat_hair = m_metl_hathair_lars
		genre = [
			pop
			`heavy metal`
		]
		random_weight = 0.25
	}
	{
		desc_id = m_metl_hair_midhigh
		frontend_desc = qs(0xded47344)
		mesh = `models/car/male/m_metl_hair_midhigh`
		cloth = `models/car/male/m_metl_hair_midhigh`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_bicep_r
			bone_bicep_l
		]
		deform_mesh = `models/car/male/m_metl_hair_midhigh_def`
		$cas_male_hair_common_settings
		hat_hair = m_metl_hathair_midhigh
		genre = [
			`heavy metal`
			`glam rock`
		]
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
		desc_id = m_pop_hair_emo1
		frontend_desc = qs(0x8024e99c)
		mesh = `models/car/male/m_pop_hair_emo1`
		cloth = `models/car/male/m_pop_hair_emo1`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
		]
		deform_mesh = `models/car/male/m_pop_hair_emo1_def`
		$cas_male_hair_common_settings
		hat_hair = m_pop_hathair_emo1
		genre = [
			pop
			rock
		]
	}
	{
		desc_id = m_pop_hair_pomp
		frontend_desc = qs(0xd965807d)
		mesh = `models/car/male/m_pop_hair_pomp`
		cloth = `models/car/male/m_pop_hair_pomp`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
		]
		deform_mesh = `models/car/male/m_pop_hair_pomp_def`
		$cas_male_hair_common_settings
		hat_hair = m_pop_hathair_pomp
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
		hidden
	}
	{
		desc_id = m_punk_hair_hawk
		frontend_desc = qs(0x29146d81)
		mesh = `models/car/male/m_punk_hair_hawk`
		deform_mesh = `models/car/male/m_punk_hair_hawk_def`
		$cas_male_hair_common_settings
		hat_hair = m_punk_hathair_hawk
		cloth = `models/car/male/m_punk_hair_hawk`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
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
		cloth = `models/car/male/m_punk_hair_lspike`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
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
		cloth = `models/car/male/m_punk_hair_j4spike`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
		]
		genre = [
			punk
		]
		random_weight = 0.25
	}
	{
		desc_id = m_punk_hair_spike
		frontend_desc = qs(0xf7e9c00c)
		mesh = `models/car/male/m_punk_hair_spike`
		deform_mesh = `models/car/male/m_punk_hair_spike_def`
		$cas_male_hair_common_settings
		hat_hair = m_punk_hathair_spike
		cloth = `models/car/male/m_punk_hair_spike`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
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
		cloth = `models/car/male/m_punk_hair_jny_1`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
		]
		deform_mesh = `models/car/male/m_punk_hair_jny_1_def`
		$cas_male_hair_common_settings
		hat_hair = none
		genre = [
			punk
		]
	}
	{
		desc_id = m_punk_hair_jny_2
		frontend_desc = qs(0x840db1c5)
		mesh = `models/car/male/m_punk_hair_jny_2`
		cloth = `models/car/male/m_punk_hair_jny_2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_bicep_r
			bone_bicep_l
		]
		deform_mesh = `models/car/male/m_punk_hair_jny_2_def`
		$cas_male_hair_common_settings
		hat_hair = m_punk_hathair_jny_2
		genre = [
			punk
		]
	}
	{
		desc_id = m_rock_hair_drummer
		frontend_desc = qs(0x7a5a66fa)
		mesh = `models/car/male/m_rock_hair_drummer`
		cloth = `models/car/male/m_rock_hair_drummer`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
		]
		deform_mesh = `models/car/male/m_rock_hair_drummer_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_drummer
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_hair_guitarist
		frontend_desc = qs(0x5bccca2d)
		mesh = `models/car/male/m_rock_hair_guitarist`
		cloth = `models/car/male/m_rock_hair_guitarist`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_collar_l
			bone_collar_r
			bone_chest
			bone_stomach_upper
			bone_bicep_r
			bone_bicep_l
		]
		deform_mesh = `models/car/male/m_rock_hair_guitarist_def`
		$cas_male_hair_common_settings
		material_groups = [
			{
				materials = [
					m_rock_hair_guitarist_primary
					m_rock_hair_guitarist_primary_cloth
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
		]
		hat_hair = m_rock_hathair_guitarist
		genre = [
			rock
			`heavy metal`
		]
		random_weight = 0.0
	}
	{
		desc_id = m_rock_hair_midpart
		frontend_desc = qs(0xb8b238cc)
		mesh = `models/car/male/m_rock_hair_midpart`
		cloth = `models/car/male/m_rock_hair_midpart`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
		]
		deform_mesh = `models/car/male/m_rock_hair_midpart_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_midpart
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
		cloth = `models/car/male/m_rock_hair_braids`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_chest
			bone_collar_r
			bone_collar_l
			bone_stomach_upper
			bone_stomach_lower
			bone_forearm_l
			bone_forearm_r
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
		cloth = `models/car/male/m_rock_hair_eddie2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_l
			bone_collar_r
			bone_bicep_l
			bone_bicep_r
		]
		materials = [
			m_rock_hair_eddie2_primary
		]
		genre = [
			rock
		]
		random_weight = 0.0
	}
	{
		desc_id = m_rock_hair_eddie3
		frontend_desc = qs(0x563e0ee1)
		mesh = `models/car/male/m_rock_hair_eddie3`
		deform_mesh = `models/car/male/m_rock_hair_eddie3_def`
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_eddie3
		materials = [
			m_rock_hair_eddie3_primary
			m_rock_hair_eddie3_secondary
		]
		cloth = `models/car/male/m_rock_hair_eddie3`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_l
			bone_collar_r
			bone_bicep_l
			bone_bicep_r
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
		cloth = `models/car/male/m_rock_hair_eddie4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_l
			bone_collar_r
			bone_bicep_l
			bone_bicep_r
		]
		genre = [
			rock
		]
		random_weight = 0.0
	}
	{
		desc_id = m_funpart_hair_octo
		frontend_desc = qs(0xec85351c)
		mesh = `models/car/male/m_funpart_hair_octo`
		deform_mesh = `models/car/male/m_funpart_hair_octo_def`
		hat_hair = m_funpart_hathair_octo
		cloth = `models/car/male/m_funpart_hair_octo`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_l
			bone_collar_r
			bone_bicep_l
			bone_bicep_r
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = m_funpart_hair_slime
		frontend_desc = qs(0xdbfe1db5)
		mesh = `models/car/male/m_funpart_hair_slime`
		deform_mesh = `models/car/male/m_funpart_hair_slime_def`
		cloth = `models/car/male/m_funpart_hair_slime`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_l
			bone_collar_r
			bone_bicep_l
			bone_bicep_r
		]
		hat_hair = m_funpart_hathair_slime
		materials = [
			m_funpart_hair_slime_primary
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
		cloth = `models/car/male/m_bmtl_hathair_straight`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_bicep_r
			bone_bicep_l
		]
		deform_mesh = `models/car/male/m_bmtl_hathair_straight_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_bmtl_hathair_dread
		mesh = `models/car/male/m_bmtl_hathair_dread`
		deform_mesh = `models/car/male/m_bmtl_hathair_dread_def`
		cloth = `models/car/male/m_bmtl_hathair_dread`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_l
			bone_collar_r
			bone_bicep_l
			bone_bicep_r
		]
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_bmtl_hathair_lars_3
		mesh = `models/car/male/m_bmtl_hathair_lars_3`
		deform_mesh = `models/car/male/m_bmtl_hathair_lars_3_def`
		$cas_male_hat_hair_common_settings
		cloth = `models/car/male/m_bmtl_hathair_lars_3`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
		]
		material_groups = [
			{
				materials = [
					m_bmtl_hair_lars_3_primary
				]
				shader = $cas_shader_skin
				name = qs(0xabcff5c4)
			}
		]
	}
	{
		desc_id = m_bmtl_hathair_lars4
		mesh = `models/car/male/m_bmtl_hathair_lars4`
		cloth = `models/car/male/m_bmtl_hathair_lars4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
		]
		deform_mesh = `models/car/male/m_bmtl_hathair_lars4_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_clsc_hathair_clive
		mesh = `models/car/male/m_clsc_hathair_clive`
		deform_mesh = `models/car/male/m_clsc_hathair_clive_def`
		cloth = `models/car/male/m_clsc_hathair_clive`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_clsc_hathair_clive2
		mesh = `models/car/male/m_clsc_hathair_clive2`
		cloth = `models/car/male/m_clsc_hathair_clive2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		deform_mesh = `models/car/male/m_clsc_hathair_clive2_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_clsc_hathair_clive3
		mesh = `models/car/male/m_clsc_hathair_clive3`
		cloth = `models/car/male/m_clsc_hathair_clive3`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
		]
		deform_mesh = `models/car/male/m_clsc_hathair_clive3_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_clsc_hathair_clive4
		mesh = `models/car/male/m_clsc_hathair_clive4`
		cloth = `models/car/male/m_clsc_hathair_clive4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
		]
		deform_mesh = `models/car/male/m_clsc_hathair_clive4_def`
		$cas_male_hair_common_settings
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
	}
	{
		desc_id = m_clsc_hathair_country
		mesh = `models/car/male/m_clsc_hathair_country`
		deform_mesh = `models/car/male/m_clsc_hathair_country_def`
		$cas_male_hat_hair_common_settings
		materials = [
			m_clsc_hair_country_hair
		]
	}
	{
		desc_id = m_clsc_hathair_george
		mesh = `models/car/male/m_clsc_hathair_george`
		deform_mesh = `models/car/male/m_clsc_hathair_george_def`
		$cas_male_hat_hair_common_settings
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
	}
	{
		desc_id = m_glam_hathair_lapalms
		mesh = `models/car/male/m_glam_hathair_lapalms`
		deform_mesh = `models/car/male/m_glam_hathair_lapalms_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_glam_hathair_seagull
		mesh = `models/car/male/m_glam_hathair_seagull`
		cloth = `models/car/male/m_glam_hathair_seagull`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		deform_mesh = `models/car/male/m_glam_hathair_seagull_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_glam_hathair_gold
		mesh = `models/car/male/m_glam_hathair_gold`
		deform_mesh = `models/car/male/m_glam_hathair_gold_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_glam_hathair_izzy1
		mesh = `models/car/male/m_glam_hathair_izzy1`
		deform_mesh = `models/car/male/m_glam_hathair_izzy1_def`
		cloth = `models/car/male/m_glam_hathair_izzy1`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_glam_hathair_izzy2
		mesh = `models/car/male/m_glam_hathair_izzy2`
		deform_mesh = `models/car/male/m_glam_hathair_izzy2_def`
		cloth = `models/car/male/m_glam_hathair_izzy2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_glam_hathair_izzy3
		mesh = `models/car/male/m_glam_hathair_izzy3`
		deform_mesh = `models/car/male/m_glam_hathair_izzy3_def`
		cloth = `models/car/male/m_glam_hathair_izzy3`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_glam_hathair_izzy4
		mesh = `models/car/male/m_glam_hathair_izzy4`
		deform_mesh = tut_demo_song_rhythmcoop_expert
		$cas_male_hat_hair_common_settings
		cloth = `models/car/male/m_glam_hathair_izzy4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
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
	}
	{
		desc_id = m_metl_hathair_axel_1
		mesh = `models/car/male/m_metl_hathair_axel_1`
		cloth = `models/car/male/m_metl_hathair_axel_1`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_forearm_l
			bone_forearm_r
		]
		deform_mesh = `models/car/male/m_metl_hathair_axel_1_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_metl_hathair_axel_4
		mesh = `models/car/male/m_metl_hathair_axel_4`
		cloth = `models/car/male/m_metl_hathair_axel_4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_forearm_l
			bone_forearm_r
		]
		deform_mesh = `models/car/male/m_metl_hathair_axel_4_def`
		$cas_male_hair_common_settings
		materials = [
			axel4_hair_primary
		]
	}
	{
		desc_id = m_metl_hathair_curlio
		mesh = `models/car/male/m_metl_hathair_curlio`
		cloth = `models/car/male/m_metl_hathair_curlio`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_bicep_r
			bone_bicep_l
		]
		deform_mesh = `models/car/male/m_metl_hathair_curlio_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_metl_hathair_lars
		mesh = `models/car/male/m_metl_hathair_lars`
		cloth = `models/car/male/m_metl_hathair_lars`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
		]
		deform_mesh = `models/car/male/m_metl_hathair_lars_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_metl_hathair_midhigh
		mesh = `models/car/male/m_metl_hathair_midhigh`
		cloth = `models/car/male/m_metl_hathair_midhigh`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_bicep_r
			bone_bicep_l
		]
		deform_mesh = `models/car/male/m_metl_hathair_midhigh_def`
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
		cloth = `models/car/male/m_pop_hathair_pomp`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
		]
		deform_mesh = `models/car/male/m_pop_hathair_pomp_def`
		$cas_male_hair_common_settings
	}
	{
		desc_id = m_pop_hathair_emo1
		mesh = `models/car/male/m_pop_hathair_emo1`
		cloth = `models/car/male/m_pop_hathair_emo1`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
		]
		deform_mesh = `models/car/male/m_pop_hathair_emo1_def`
		$cas_male_hair_common_settings
	}
	{
		desc_id = m_punk_hathair_spike
		mesh = `models/car/male/m_punk_hathair_spike`
		deform_mesh = `models/car/male/m_punk_hathair_spike_def`
		$cas_male_hair_common_settings
	}
	{
		desc_id = m_punk_hathair_hawk
		mesh = `models/car/male/m_punk_hathair_hawk`
		cloth = `models/car/male/m_punk_hathair_hawk`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
		]
		deform_mesh = `models/car/male/m_punk_hathair_hawk_def`
		$cas_male_hair_common_settings
	}
	{
		desc_id = m_punk_hathair_lspike
		mesh = `models/car/male/m_punk_hathair_lspike`
		deform_mesh = `models/car/male/m_punk_hathair_lspike_def`
		$cas_male_hair_common_settings
	}
	{
		desc_id = m_punk_hathair_jny_2
		mesh = `models/car/male/m_punk_hathair_jny_2`
		cloth = `models/car/male/m_punk_hathair_jny_2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_stomach_upper
			bone_collar_r
			bone_collar_l
			bone_bicep_r
			bone_bicep_l
		]
		deform_mesh = `models/car/male/m_punk_hathair_jny_2_def`
		$cas_male_hair_common_settings
	}
	{
		desc_id = m_punk_hathair_j4spike
		mesh = `models/car/male/m_punk_hathair_j4spike`
		deform_mesh = `models/car/male/m_punk_hathair_j4spike_def`
		$cas_male_hair_common_settings
	}
	{
		desc_id = m_rock_hathair_drummer
		mesh = `models/car/male/m_rock_hathair_drummer`
		deform_mesh = `models/car/male/m_rock_hathair_drummer_def`
		cloth = `models/car/male/m_rock_hathair_drummer`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
		]
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_rock_hathair_midpart
		mesh = `models/car/male/m_rock_hathair_midpart`
		deform_mesh = `models/car/male/m_rock_hathair_midpart_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_rock_hathair_slash
		mesh = `models/car/male/m_rock_hathair_slash`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_rock_hathair_guitarist
		mesh = `models/car/male/m_rock_hathair_guitarist`
		cloth = `models/car/male/m_rock_hathair_guitarist`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_collar_l
			bone_collar_r
			bone_chest
			bone_stomach_upper
			bone_bicep_r
			bone_bicep_l
		]
		deform_mesh = `models/car/male/m_rock_hathair_guitarist_def`
		$cas_male_hair_common_settings
		material_groups = [
			{
				materials = [
					m_rock_hair_guitarist_primary
					m_rock_hair_guitarist_primary_cloth
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
		]
	}
	{
		desc_id = m_rock_hathair_braids
		mesh = `models/car/male/m_rock_hathair_braids`
		cloth = `models/car/male/m_rock_hathair_braids`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_chest
			bone_collar_r
			bone_collar_l
			bone_stomach_upper
			bone_stomach_lower
			bone_forearm_l
			bone_forearm_r
		]
		deform_mesh = `models/car/male/m_rock_hathair_braids_def`
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_rock_hathair_eddie2
		mesh = `models/car/male/m_rock_hathair_eddie2`
		deform_mesh = `models/car/male/m_rock_hathair_eddie2_def`
		$cas_male_hat_hair_common_settings
		materials = [
			m_rock_hair_eddie2_primary
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
	}
	{
		desc_id = m_rock_hathair_eddie4
		mesh = `models/car/male/m_rock_hathair_eddie4`
		deform_mesh = `models/car/male/m_rock_hathair_eddie4_def`
		$cas_male_hat_hair_common_settings
		materials = [
			m_rock_hair_eddie4_primary
		]
	}
	{
		desc_id = m_funpart_hathair_octo
		mesh = `models/car/male/m_funpart_hathair_octo`
		cloth = `models/car/male/m_funpart_hathair_octo`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_l
			bone_collar_r
			bone_bicep_l
			bone_bicep_r
		]
		deform_mesh = `models/car/male/m_funpart_hathair_octo_def`
	}
	{
		desc_id = m_funpart_hathair_slime
		mesh = `models/car/male/m_funpart_hair_slime`
		cloth = `models/car/male/m_funpart_hair_slime`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_l
			bone_collar_r
			bone_bicep_l
			bone_bicep_r
		]
		deform_mesh = `models/car/male/m_funpart_hair_slime_def`
		materials = [
			m_funpart_hair_slime_primary
		]
	}
	{
		desc_id = m_goth_hathair_devilock
		mesh = `models/car/male/m_goth_hathair_devilock`
		deform_mesh = `models/car/male/m_goth_hathair_devilock_def`
		$cas_male_hat_hair_common_settings
		cloth = `models/car/male/m_goth_hathair_devilock`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_collar_r
			bone_collar_l
		]
	}
	{
		desc_id = m_goth_hathair_dreads
		mesh = `models/car/male/m_goth_hathair_dreads`
		deform_mesh = `models/car/male/m_goth_hathair_dreads_def`
		cloth = `models/car/male/m_goth_hathair_dreads`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_chest
			bone_collar_r
			bone_collar_l
		]
		$cas_male_hair_common_settings_skinshader
		materials = [
			m_goth_hair_dreads_primary
		]
	}
	{
		desc_id = m_goth_hathair_remedy
		mesh = `models/car/male/m_goth_hathair_remedy`
		deform_mesh = `models/car/male/m_goth_hathair_remedy_def`
		cloth = `models/car/male/m_goth_hathair_remedy`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			bone_head
			bone_neck
			bone_collar_r
			bone_collar_l
		]
		$cas_male_hair_common_settings
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
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_hat_clive3
		frontend_desc = qs(0x953c0bb9)
		mesh = `models/car/male/m_clsc_hat_clive3`
		deform_mesh = `models/car/male/m_clsc_hat_clive3_def`
		materials = [
			m_clsc_hat_clive3_primary
			m_clsc_hat_clive3_secondary
		]
		genre = [
			`classic rock`
		]
		random_weight = 0.0
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
	}
	{
		desc_id = m_fun_hat_xhood
		frontend_desc = qs(0xc2558321)
		mesh = `models/car/male/m_fun_hat_xhood`
		deform_mesh = `models/car/male/m_fun_hat_xhood_def`
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
		random_weight = 0.0
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
		materials = [
			m_clsc_hat_triangle_primary
			m_clsc_hat_triangle_secondary
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
		materials = [
			m_pop_hat_bucket_primary
			m_pop_hat_bucket_secondary
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
		materials = [
			m_pop_hat_bucket2_primary
			m_pop_hat_bucket2_secondary
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
		materials = [
			m_rock_hat_cowboy_primary
			m_rock_hat_cowboy_secondary
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
		frontend_desc = qs(0x3e025606)
		mesh = `models/car/male/m_metl_hat_studs`
		deform_mesh = `models/car/male/m_metl_hat_studs_def`
		genre = [
			`heavy metal`
		]
		random_weight = 0.0
	}
	{
		desc_id = m_metl_horn
		frontend_desc = qs(0x6fea43c1)
		mesh = `models/car/male/m_metl_acc_horn`
		deform_mesh = `models/car/male/m_metl_acc_horn_def`
		materials = [
			m_metl_acc_horn_primary
			m_metl_acc_horn_hornbase
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
		random_weight = 0.25
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
	}
	{
		desc_id = m_bmtl_hat_skullhelmet
		frontend_desc = qs(0xea89ff84)
		mesh = `models/car/male/m_bmtl_hat_skullhelmet`
		materials = [
			m_bmtl_hat_skullhelmet_primary
			m_bmtl_hat_skullhelmet_secondary
		]
		deform_mesh = `models/car/male/m_bmtl_hat_skullhelmet_def`
		genre = [
			`black metal`
		]
		hat_hair = none
		random_weight = 0.5
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
			}
			{
				materials = [
					m_bmtl_hat_brain_secondary
				]
				shader = $cas_shader_skin
			}
		]
		hat_hair = none
		random_weight = 0.0
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
			}
			{
				materials = [
					m_goth_acc_tophat_secondary
				]
				shader = $cas_shader_skin
			}
		]
		genre = [
			goth
		]
		random_weight = 0.25
		locked
	}
	{
		desc_id = m_hat_ninja_c1
		frontend_desc = qs(0x97d60449)
		mesh = `models/car/male/m_hat_ninja_c1`
		deform_mesh = `models/car/male/m_hat_ninja_c1_def`
		materials = [
			m_hat_ninja_c1_primary
			m_hat_ninja_c1_secondary
		]
		hat_hair = none
		random_weight = 0.0
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
		materials = [
			m_hat_pimp_primary
			m_hat_pimp_secondary
			m_hat_pimp_feather
		]
		random_weight = 0.0
	}
	{
		desc_id = m_rock_hat_retrotv
		frontend_desc = qs(0xaf00387d)
		mesh = `models/car/male/m_rock_hat_retrotv`
		hat_hair = none
		random_weight = 0.0
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
	}
	{
		desc_id = m_fun_hat_magical
		frontend_desc = qs(0x82770ec9)
		mesh = `models/car/male/m_fun_hat_hannya`
		deform_mesh = `models/car/male/m_fun_hat_hannya_def`
		hat_hair = none
		random_weight = 0.0
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
