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
		mesh = 'models/CAR/Male/M_Clsc_Hair_George.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Hair_GeorgeLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_Hair_George_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_george
		acc_skeleton = skel_m_clsc_hair_george
		acc_ragdoll = rag_m_clsc_hair_george
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
	}
	{
		desc_id = m_clsc_hair_contest
		frontend_desc = qs(0x0bb644b3)
		mesh = 'models/CAR/Male/M_Clsc_Hair_Contest.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Hair_ContestLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_Hair_Contest_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_contest
		random_weight = 0.0
		hidden
	}
	{
		desc_id = m_bmtl_hair_lars
		frontend_desc = qs(0x295bdc1d)
		mesh = 'models/CAR/Male/M_Bmtl_Hair_Lars.skin'
		mesh1 = 'models/CAR/Male/M_Bmtl_Hair_LarsLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Bmtl_Hair_Lars_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_bmtl_hathair_lars
		acc_skeleton = skel_m_bmtl_hair_lars
		acc_ragdoll = rag_m_bmtl_hair_lars
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
			`black metal`
		]
	}
	{
		desc_id = m_bmtl_hair_dread
		frontend_desc = qs(0x3d5f28b1)
		mesh = 'models/CAR/Male/M_Bmtl_Hair_Dread.skin'
		mesh1 = 'models/CAR/Male/M_Bmtl_Hair_DreadLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Bmtl_Hair_Dread_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_bmtl_hathair_dread
		acc_skeleton = skel_m_bmtl_hair_dread
		acc_ragdoll = rag_m_bmtl_hair_dread
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
			`black metal`
		]
	}
	{
		desc_id = m_clsc_hair_country
		frontend_desc = qs(0x479d7f40)
		mesh = 'models/CAR/Male/M_Clsc_hair_Country.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_hair_CountryLOD.skin'
		0x56504ac4 = 1
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
		]
		genre = [
			`classic rock`
			rock
		]
	}
	{
		desc_id = m_clsc_hair_messy
		frontend_desc = qs(0x925e89e6)
		mesh = 'models/CAR/Male/M_Clsc_Hair_Messy.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Hair_MessyLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_Hair_Messy_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_clsc_hathair_messy
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
			`classic rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_hair_afro
		frontend_desc = qs(0xcb1a231a)
		mesh = 'models/CAR/Male/M_Clsc_Hair_Afro.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Hair_AfroLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_Hair_Afro_def.skin'
		cas_male_hair_common_settings_skinshader
		hat_hair = m_clsc_hathair_afro
		materials = [
			m_clsc_hair_afro_primary
		]
		acc_skeleton = skel_m_clsc_hair_afro
		acc_ragdoll = rag_m_clsc_hair_afro
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
		mesh = 'models/CAR/Male/M_Clsc_Hair_Jimi.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Hair_JimiLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_Hair_Jimi_Def.skin'
		cas_male_hair_common_settings_skinshader
		hat_hair = m_clsc_hathair_jimi
		acc_skeleton = skel_m_clsc_hair_jimi
		acc_ragdoll = rag_m_clsc_hair_jimi
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
	}
	{
		desc_id = m_glam_hair_lapalms
		frontend_desc = qs(0xbd135a6c)
		mesh = 'models/CAR/Male/M_Glam_Hair_LaPalms.skin'
		mesh1 = 'models/CAR/Male/M_Glam_Hair_LaPalmsLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Glam_Hair_LaPalms_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_glam_hathair_lapalms
		acc_skeleton = skel_m_glam_hair_lapalms
		acc_ragdoll = rag_m_glam_hair_lapalms
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
	}
	{
		desc_id = m_glam_hair_seagull
		frontend_desc = qs(0x75a88322)
		mesh = 'models/CAR/Male/M_Glam_Hair_Seagull.skin'
		mesh1 = 'models/CAR/Male/M_Glam_Hair_SeagullLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Glam_Hair_Seagull_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_glam_hathair_seagull
		acc_skeleton = skel_m_glam_hair_seagull
		acc_ragdoll = rag_m_glam_hair_seagull
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
		mesh = 'models/CAR/Male/M_Glam_Hair_Gold.skin'
		mesh1 = 'models/CAR/Male/M_Glam_Hair_GoldLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Glam_Hair_Gold_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_glam_hathair_gold
		acc_skeleton = skel_m_glam_hair_gold
		acc_ragdoll = rag_m_glam_hair_gold
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
		mesh = 'models/CAR/Male/M_Goth_Hair_Remedy.skin'
		mesh1 = 'models/CAR/Male/M_Goth_Hair_RemedyLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Goth_Hair_Remedy_def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_goth_hathair_remedy
		acc_skeleton = skel_m_goth_hair_remedy
		acc_ragdoll = rag_m_goth_hair_remedy
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
		mesh = 'models/CAR/Male/M_Goth_Hair_Dreads.skin'
		mesh1 = 'models/CAR/Male/M_Goth_Hair_DreadsLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Goth_Hair_Dreads_def.skin'
		cas_male_hair_common_settings_skinshader
		hat_hair = m_goth_hathair_dreads
		materials = [
			m_goth_hair_dreads_primary
		]
		acc_skeleton = skel_m_goth_hair_dreads
		acc_ragdoll = rag_m_goth_hair_dreads
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
		mesh = 'models/CAR/Male/M_Goth_Hair_Devilock.skin'
		mesh1 = 'models/CAR/Male/M_Goth_Hair_DevilockLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Goth_Hair_Devilock_def.skin'
		cas_male_hair_common_settings
		hat_hair = m_goth_hathair_devilock
		acc_skeleton = skel_m_goth_hair_devilock
		acc_ragdoll = rag_m_goth_hair_devilock
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
		desc_id = m_metl_hair_axel
		frontend_desc = qs(0x361d7224)
		mesh = 'models/CAR/Male/M_Metl_Hair_Axel.skin'
		mesh1 = 'models/CAR/Male/M_Metl_Hair_AxelLOD.skin'
		0x56504ac4 = 1
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
		mesh1 = 'models/CAR/Male/M_Metl_Hair_MidHighLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Metl_Hair_MidHigh_def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_metl_hathair_midhigh
		acc_skeleton = skel_m_metl_hair_midhigh
		acc_ragdoll = rag_m_metl_hair_midhigh
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
		desc_id = m_pop_hair_buzz
		frontend_desc = qs(0x28da4eed)
		mesh = 'models/CAR/Male/M_Pop_Hair_Buzz.skin'
		mesh1 = 'models/CAR/Male/M_Pop_Hair_BuzzLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Pop_Hair_Buzz_def.skin'
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
		mesh = 'models/CAR/Male/M_Pop_Hair_Emo1.skin'
		mesh1 = 'models/CAR/Male/M_Pop_Hair_Emo1LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Pop_Hair_Emo1_def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_pop_hathair_emo1
		acc_skeleton = skel_m_pop_hair_emo1
		acc_ragdoll = rag_m_pop_hair_emo1
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
		mesh = 'models/CAR/Male/M_Pop_Hair_Pomp.skin'
		mesh1 = 'models/CAR/Male/M_Pop_Hair_PompLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Pop_Hair_Pomp_def.skin'
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
		genre = [
			pop
			rock
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
		desc_id = m_bbkid_hair_beanie
		frontend_desc = qs(0x10d142d6)
		mesh = 'models/CAR/Male/M_BBKid_Hair_Beanie.skin'
		mesh1 = 'models/CAR/Male/M_BBKid_Hair_BeanieLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_BBKid_Hair_Beanie_def.skin'
		hat_hair = none
		hidden
		random_weight = 0.0
		acc_skeleton = skel_m_clsc_hair_country
		acc_ragdoll = rag_m_clsc_hair_country
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
		]
	}
	{
		desc_id = m_punk_hair_hawk
		frontend_desc = qs(0x29146d81)
		mesh = 'models/CAR/Male/M_Punk_Hair_Hawk.skin'
		mesh1 = 'models/CAR/Male/M_Punk_Hair_HawkLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Punk_Hair_Hawk_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = none
		acc_skeleton = skel_m_punk_hair_hawk
		acc_ragdoll = rag_m_punk_hair_hawk
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
		mesh = 'models/CAR/Male/M_Punk_Hair_LSpike.skin'
		mesh1 = 'models/CAR/Male/M_Punk_Hair_LSpikeLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Punk_Hair_LSpike_Def.skin'
		$cas_male_hair_common_settings
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
	{
		desc_id = m_punk_hair_spike
		frontend_desc = qs(0xf7e9c00c)
		mesh = 'models/CAR/Male/M_Punk_Hair_Spike.skin'
		mesh1 = 'models/CAR/Male/M_Punk_Hair_SpikeLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Punk_Hair_Spike_Def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_punk_hathair_spike
		acc_skeleton = skel_m_punk_hair_spike
		acc_ragdoll = rag_m_punk_hair_spike
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
		desc_id = m_rock_hair_drummer
		frontend_desc = qs(0x7a5a66fa)
		mesh = 'models/CAR/Male/M_Rock_Hair_Drummer.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Hair_DrummerLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Hair_Drummer_def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_drummer
		acc_skeleton = skel_m_rock_hair_drummer
		acc_ragdoll = rag_m_rock_hair_drummer
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
		mesh = 'models/CAR/Male/M_Rock_Hair_Guitarist.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Hair_GuitaristLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Hair_Guitarist_def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_guitarist
		acc_skeleton = skel_m_rock_hair_guitarist
		acc_ragdoll = rag_m_rock_hair_guitarist
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
			rock
			`heavy metal`
		]
		random_weight = 0.1
	}
	{
		desc_id = m_rock_hair_midpart
		frontend_desc = qs(0xb8b238cc)
		mesh = 'models/CAR/Male/M_Rock_Hair_MidPart.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Hair_MidPartLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Hair_MidPart_def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_midpart
		acc_skeleton = skel_m_rock_hair_midpart
		acc_ragdoll = rag_m_rock_hair_midpart
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
		mesh = 'models/CAR/Male/M_Rock_Hair_Slash.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Hair_SlashLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Hair_Slash_def.skin'
		$cas_male_hair_common_settings
		hat_hair = m_rock_hathair_slash
		acc_skeleton = skel_m_rock_hair_slash
		acc_ragdoll = rag_m_rock_hair_slash
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
		desc_id = m_bmtl_hathair_lars
		mesh = 'models/CAR/Male/M_Bmtl_HatHair_Lars.skin'
		mesh1 = 'models/CAR/Male/M_Bmtl_HatHair_LarsLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Bmtl_HatHair_Lars_def.skin'
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_bmtl_hair_lars
		acc_ragdoll = rag_m_bmtl_hair_lars
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
	}
	{
		desc_id = m_bmtl_hathair_dread
		mesh = 'models/CAR/Male/M_Bmtl_HatHair_Dread.skin'
		mesh1 = 'models/CAR/Male/M_Bmtl_HatHair_DreadLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Bmtl_HatHair_Dread_def.skin'
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_bmtl_hair_dread
		acc_ragdoll = rag_m_bmtl_hair_dread
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
	}
	{
		desc_id = m_clsc_hathair_messy
		mesh = 'models/CAR/Male/M_Clsc_HatHair_Messy.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_HatHair_MessyLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_HatHair_Messy_def.skin'
		$cas_male_hat_hair_common_settings
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
	}
	{
		desc_id = m_clsc_hathair_country
		mesh = 'models/CAR/Male/M_Clsc_Hathair_Country.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Hathair_CountryLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_Hathair_Country_def.skin'
		$cas_male_hat_hair_common_settings
		materials = [
			m_clsc_hair_country_hair
		]
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
	}
	{
		desc_id = m_clsc_hathair_george
		mesh = 'models/CAR/Male/M_Clsc_HatHair_George.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_HatHair_GeorgeLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_HatHair_George_def.skin'
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_clsc_hair_george
		acc_ragdoll = rag_m_clsc_hair_george
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
		mesh = 'models/CAR/Male/M_Clsc_HatHair_Contest.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_HatHair_ContestLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_HatHair_Contest_def.skin'
		$cas_male_hat_hair_common_settings
	}
	{
		desc_id = m_clsc_hathair_jimi
		mesh = 'models/CAR/Male/M_Clsc_HatHair_Jimi.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_HatHair_JimiLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_HatHair_Jimi_def.skin'
		cas_male_hair_common_settings_skinshader
		materials = [
			m_clsc_hair_jimi_primary
			m_clsc_hair_jimi_secondary
		]
		acc_skeleton = skel_m_clsc_hair_george
		acc_ragdoll = rag_m_clsc_hair_george
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
		desc_id = m_clsc_hathair_afro
		mesh = 'models/CAR/Male/M_Clsc_HatHair_Afro.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_HatHair_AfroLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_HatHair_Afro_def.skin'
		cas_male_hair_common_settings_skinshader
		materials = [
			m_clsc_hair_afro_primary
		]
		acc_skeleton = skel_m_clsc_hair_afro
		acc_ragdoll = rag_m_clsc_hair_afro
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
		mesh = 'models/CAR/Male/M_Glam_HatHair_LaPalms.skin'
		mesh1 = 'models/CAR/Male/M_Glam_HatHair_LaPalmsLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Glam_HatHair_LaPalms_def.skin'
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_glam_hair_lapalms
		acc_ragdoll = rag_m_glam_hair_lapalms
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
		mesh = 'models/CAR/Male/M_Glam_HatHair_Seagull.skin'
		mesh1 = 'models/CAR/Male/M_Glam_HatHair_SeagullLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Glam_HatHair_Seagull_def.skin'
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_glam_hair_seagull
		acc_ragdoll = rag_m_glam_hair_seagull
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
		mesh = 'models/CAR/Male/M_Glam_HatHair_Gold.skin'
		mesh1 = 'models/CAR/Male/M_Glam_HatHair_GoldLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Glam_HatHair_Gold_def.skin'
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_glam_hair_gold
		acc_ragdoll = rag_m_glam_hair_gold
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
		desc_id = m_metl_hathair_axel
		mesh = 'models/CAR/Male/M_Metl_HatHair_Axel.skin'
		mesh1 = 'models/CAR/Male/M_Metl_HatHair_AxelLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Metl_HatHair_Axel_def.skin'
		$cas_male_hat_hair_common_settings
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
	}
	{
		desc_id = m_metl_hathair_midhigh
		mesh = 'models/CAR/Male/M_Metl_HatHair_MidHigh.skin'
		mesh1 = 'models/CAR/Male/M_Metl_HatHair_MidHighLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Metl_HatHair_MidHigh_def.skin'
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_metl_hair_midhigh
		acc_ragdoll = rag_m_metl_hair_midhigh
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
		desc_id = m_pop_hathair_buzz
		mesh = 'models/CAR/Male/M_Pop_HatHair_Buzz.skin'
		mesh1 = 'models/CAR/Male/M_Pop_HatHair_BuzzLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Pop_HatHair_Buzz_def.skin'
		$cas_male_hair_common_settings_skinshader
	}
	{
		desc_id = m_pop_hathair_pomp
		mesh = 'models/CAR/Male/M_Pop_HatHair_Pomp.skin'
		mesh1 = 'models/CAR/Male/M_Pop_HatHair_PompLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Pop_HatHair_Pomp_def.skin'
		$cas_male_hair_common_settings
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
	}
	{
		desc_id = m_pop_hathair_emo1
		mesh = 'models/CAR/Male/M_Pop_HatHair_Emo1.skin'
		mesh1 = 'models/CAR/Male/M_Pop_HatHair_Emo1LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Pop_HatHair_Emo1_def.skin'
		$cas_male_hair_common_settings
		acc_skeleton = skel_m_pop_hair_emo1
		acc_ragdoll = rag_m_pop_hair_emo1
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
		]
	}
	{
		desc_id = m_punk_hathair_spike
		mesh = 'models/CAR/Male/M_Punk_Hathair_Spike.skin'
		mesh1 = 'models/CAR/Male/M_Punk_Hathair_SpikeLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Punk_Hathair_Spike_Def.skin'
		$cas_male_hair_common_settings
		acc_skeleton = skel_m_punk_hair_spike
		acc_ragdoll = rag_m_punk_hair_spike
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
		mesh = 'models/CAR/Male/M_Rock_HatHair_Drummer.skin'
		mesh1 = 'models/CAR/Male/M_Rock_HatHair_DrummerLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_HatHair_Drummer_def.skin'
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_rock_hair_drummer
		acc_ragdoll = rag_m_rock_hair_drummer
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_03
			bone_acc_head_05
			bone_acc_head_07
		]
	}
	{
		desc_id = m_rock_hathair_midpart
		mesh = 'models/CAR/Male/M_Rock_HatHair_MidPart.skin'
		mesh1 = 'models/CAR/Male/M_Rock_HatHair_MidPartLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_HatHair_MidPart_def.skin'
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_rock_hair_midpart
		acc_ragdoll = rag_m_rock_hair_midpart
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
		mesh = 'models/CAR/Male/M_Rock_HatHair_Slash.skin'
		mesh1 = 'models/CAR/Male/M_Rock_HatHair_SlashLOD.skin'
		0x56504ac4 = 1
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_rock_hair_slash
		acc_ragdoll = rag_m_rock_hair_slash
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
		mesh = 'models/CAR/Male/M_Rock_HatHair_Guitarist.skin'
		mesh1 = 'models/CAR/Male/M_Rock_HatHair_GuitaristLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_HatHair_Guitarist_def.skin'
		$cas_male_hair_common_settings
		acc_skeleton = skel_m_rock_hair_guitarist
		acc_ragdoll = rag_m_rock_hair_guitarist
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
	}
	{
		desc_id = m_goth_hathair_devilock
		mesh = 'models/CAR/Male/M_Goth_HatHair_Devilock.skin'
		mesh1 = 'models/CAR/Male/M_Goth_HatHair_DevilockLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Goth_HatHair_Devilock_def.skin'
		$cas_male_hat_hair_common_settings
		acc_skeleton = skel_m_goth_hair_devilock
		acc_ragdoll = rag_m_goth_hair_devilock
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
		mesh = 'models/CAR/Male/M_Goth_HatHair_Dreads.skin'
		mesh1 = 'models/CAR/Male/M_Goth_HatHair_DreadsLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Goth_HatHair_Dreads_def.skin'
		cas_male_hair_common_settings_skinshader
		materials = [
			m_goth_hair_dreads_primary
		]
		acc_skeleton = skel_m_goth_hair_dreads
		acc_ragdoll = rag_m_goth_hair_dreads
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
		mesh = 'models/CAR/Male/M_Goth_HatHair_Remedy.skin'
		mesh1 = 'models/CAR/Male/M_Goth_HatHair_RemedyLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Goth_HatHair_Remedy_def.skin'
		$cas_male_hair_common_settings
		acc_skeleton = skel_m_goth_hair_remedy
		acc_ragdoll = rag_m_goth_hair_remedy
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
		mesh = 'models/CAR/Male/M_Clsc_Hat_Cowboy.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Hat_CowboyLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_Hat_Cowboy_def.skin'
		genre = [
			`classic rock`
		]
		price = 200
		random_weight = 0.25
		locked
		polaroid = p_m_clsc_hat_cowboy
	}
	{
		desc_id = m_punk_hat_helmet
		frontend_desc = qs(0xef1f656a)
		mesh = 'models/CAR/Male/M_Punk_Hat_Helmet.skin'
		mesh1 = 'models/CAR/Male/M_Punk_Hat_HelmetLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Punk_Hat_Helmet_def.skin'
		genre = [
			punk
		]
		random_weight = 0.8
		price = 450
	}
	{
		desc_id = m_clsc_hat_cptn
		frontend_desc = qs(0xeb12864d)
		mesh = 'models/CAR/Male/M_Clsc_Hat_Cptn.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Hat_CptnLOD.skin'
		0x56504ac4 = 1
		materials = [
			m_clsc_hat_cptn_primary
		]
		deform_mesh = 'models/CAR/Male/M_Clsc_Hat_Cptn_def.skin'
		genre = [
			`classic rock`
		]
		price = 300
		random_weight = 0.1
		locked
		polaroid = p_m_clsc_hat_cptn
	}
	{
		desc_id = m_punk_hat_kfc
		frontend_desc = qs(0xd6595358)
		mesh = 'models/CAR/Male/M_Punk_Hat_KFC.skin'
		mesh1 = 'models/CAR/Male/M_Punk_Hat_KFCLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Punk_Hat_KFC_def.skin'
		hat_hair = none
		price = 800
		locked
		random_weight = 0.0
	}
	{
		desc_id = m_fun_hat_eyeball
		frontend_desc = qs(0x3b86ba16)
		mesh = 'models/CAR/Male/M_Fun_Hat_EyeBall.skin'
		mesh1 = 'models/CAR/Male/M_Fun_Hat_EyeBallLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Fun_Hat_EyeBall_def.skin'
		hat_hair = none
		price = 150000
		polaroid = p_m_fun_hat_eyeball
		locked
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_hat_triangle
		frontend_desc = qs(0xa1bdcefb)
		mesh = 'models/CAR/Male/M_Clsc_Hat_Triangle.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Hat_TriangleLOD.skin'
		0x56504ac4 = 1
		materials = [
			m_clsc_hat_triangle_primary
			m_clsc_hat_triangle_secondary
		]
		genre = [
			`classic rock`
		]
		price = 500
		random_weight = 0.0
		locked
		polaroid = p_m_clsc_hat_triangle
	}
	{
		desc_id = m_pop_hat_bucket
		frontend_desc = qs(0xff1d662e)
		mesh = 'models/CAR/Male/M_Pop_Hat_Bucket.skin'
		mesh1 = 'models/CAR/Male/M_Pop_Hat_BucketLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Pop_Hat_Bucket_def.skin'
		materials = [
			m_pop_hat_bucket_primary
			m_pop_hat_bucket_secondary
		]
		genre = [
			pop
		]
		price = 125
		random_weight = 0.5
	}
	{
		desc_id = m_pop_hat_bucket2
		frontend_desc = qs(0x520453e4)
		mesh = 'models/CAR/Male/M_Pop_Hat_Bucket2.skin'
		mesh1 = 'models/CAR/Male/M_Pop_Hat_Bucket2LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Pop_Hat_Bucket2_def.skin'
		materials = [
			m_pop_hat_bucket2_primary
			m_pop_hat_bucket2_secondary
		]
		genre = [
			pop
		]
		price = 125
		random_weight = 0.5
	}
	{
		desc_id = m_pop_head_gasmask
		frontend_desc = qs(0x0039dd19)
		mesh = 'models/CAR/Male/M_Pop_Head_GasMask.skin'
		mesh1 = 'models/CAR/Male/M_Pop_Head_GasMaskLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Pop_Head_GasMask_def.skin'
		materials = [
			m_pop_head_gasmask_mask
		]
		hat_hair = none
		price = 5000
		polaroid = p_f_pop_head_gasmask
		locked
		random_weight = 0.0
	}
	{
		desc_id = m_pop_head_ww2helm
		frontend_desc = qs(0xa1ed9a95)
		mesh = 'models/CAR/Male/M_Pop_Head_WW2Helm.skin'
		mesh1 = 'models/CAR/Male/M_Pop_Head_WW2HelmLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Pop_Head_WW2Helm_def.skin'
		price = 800
		random_weight = 0.0
		locked
		polaroid = p_m_pop_hat_ww2helm
	}
	{
		desc_id = m_rock_hat_starpin
		frontend_desc = qs(0x4be7facb)
		mesh = 'models/CAR/Male/M_Rock_Hat_Starpin.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Hat_StarpinLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Hat_Starpin_def.skin'
		materials = [
			m_rock_hat_starpin_primary
		]
		genre = [
			rock
		]
		price = 175
		random_weight = 0.25
		locked
		polaroid = p_m_rock_hat_starpin
	}
	{
		desc_id = m_rock_hat_cowboy
		frontend_desc = qs(0x2e4734b1)
		mesh = 'models/CAR/Male/M_Rock_Hat_Cowboy.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Hat_CowboyLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Hat_Cowboy_def.skin'
		materials = [
			m_rock_hat_cowboy_primary
			m_rock_hat_cowboy_secondary
		]
		genre = [
			rock
		]
		price = 250
		random_weight = 0.25
	}
	{
		desc_id = m_metl_hat_zakk
		frontend_desc = qs(0xf8ed58a5)
		mesh = 'models/CAR/Male/M_Metl_Hat_Zakk.skin'
		mesh1 = 'models/CAR/Male/M_Metl_Hat_ZakkLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Metl_Hat_Zakk_def.skin'
		genre = [
			`heavy metal`
		]
		price = 400
		random_weight = 0.25
	}
	{
		desc_id = m_metl_hat_axel2
		frontend_desc = qs(0xc2879778)
		mesh = 'models/CAR/Male/M_Metl_Hat_Axel2.skin'
		mesh1 = 'models/CAR/Male/M_Metl_Hat_Axel2LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Metl_Hat_Axel2_def.skin'
		genre = [
			`heavy metal`
		]
		price = 150
		random_weight = 0.4
	}
	{
		desc_id = m_metl_hat_studs
		frontend_desc = qs(0x3e025606)
		mesh = 'models/CAR/Male/M_Metl_Hat_Studs.skin'
		mesh1 = 'models/CAR/Male/M_Metl_Hat_StudsLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Metl_Hat_Studs_def.skin'
		genre = [
			`heavy metal`
		]
		price = 400
		locked
		random_weight = 0.0
	}
	{
		desc_id = m_metl_horn
		frontend_desc = qs(0x6fea43c1)
		mesh = 'models/CAR/Male/M_Metl_acc_Horn.skin'
		mesh1 = 'models/CAR/Male/M_Metl_acc_HornLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Metl_acc_Horn_def.skin'
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
		polaroid = p_m_metl_acc_horn
	}
	{
		desc_id = m_bmtl_hat_chicken
		frontend_desc = qs(0x5db621d5)
		mesh = 'models/CAR/Male/M_Bmtl_Hat_Chicken.skin'
		mesh1 = 'models/CAR/Male/M_Bmtl_Hat_ChickenLOD.skin'
		0x56504ac4 = 1
		materials = [
			m_bmtl_hat_chicken_primary
			m_bmtl_hat_chicken_secondary
		]
		hat_hair = none
		price = 500000
		polaroid = p_m_bmtl_hat_chicken
		locked
		random_weight = 0.0
	}
	{
		desc_id = m_bmtl_hat_viking
		frontend_desc = qs(0xbbf00af8)
		mesh = 'models/CAR/Male/M_Bmtl_Hat_Viking.skin'
		mesh1 = 'models/CAR/Male/M_Bmtl_Hat_VikingLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Bmtl_Hat_Viking_def.skin'
		genre = [
			`black metal`
		]
		hat_hair = none
		price = 25000
		random_weight = 0.25
		random_weight_cpu = 0.0
		locked
		polaroid = p_f_bmtl_hat_viking
	}
	{
		desc_id = m_bmtl_hat_skullhelmet
		frontend_desc = qs(0xea89ff84)
		mesh = 'models/CAR/Male/M_Bmtl_Hat_SkullHelmet.skin'
		mesh1 = 'models/CAR/Male/M_Bmtl_Hat_SkullHelmetLOD.skin'
		0x56504ac4 = 1
		materials = [
			m_bmtl_hat_skullhelmet_primary
			m_bmtl_hat_skullhelmet_secondary
		]
		deform_mesh = 'models/CAR/Male/M_Bmtl_Hat_SkullHelmet_def.skin'
		genre = [
			`black metal`
		]
		hat_hair = none
		price = 6066
		random_weight = 0.5
		random_weight_cpu = 0.1
		locked
		polaroid = p_m_bmtl_hat_skullhelmet
	}
	{
		desc_id = m_bmtl_hat_brain
		frontend_desc = qs(0xe5baded2)
		mesh = 'models/CAR/Male/M_Bmtl_Hat_Brain.skin'
		mesh1 = 'models/CAR/Male/M_Bmtl_Hat_BrainLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Bmtl_Hat_Brain_def.skin'
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
		price = 100000
		random_weight = 0.0
	}
	{
		desc_id = m_goth_hat_tophat
		frontend_desc = qs(0xd9f3b456)
		mesh = 'models/CAR/Male/M_Goth_Hat_TopHat.skin'
		mesh1 = 'models/CAR/Male/M_Goth_Hat_TopHatLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Goth_Hat_TopHat_def.skin'
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
		price = 450
		random_weight = 0.25
		random_weight_cpu = 0.0
		locked
		polaroid = p_m_goth_hat_tophat
	}
	{
		desc_id = m_hat_ninja_c1
		frontend_desc = qs(0x97d60449)
		mesh = 'models/CAR/Male/M_Hat_Ninja_c1.skin'
		mesh1 = 'models/CAR/Male/M_Hat_Ninja_c1LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Hat_Ninja_c1_def.skin'
		materials = [
			m_hat_ninja_c1_primary
			m_hat_ninja_c1_secondary
		]
		hat_hair = none
		price = 500
		random_weight = 0.0
	}
	{
		desc_id = m_hat_gorilla
		frontend_desc = qs(0x6d95532b)
		mesh = 'models/CAR/Male/M_Hat_Gorilla.skin'
		mesh1 = 'models/CAR/Male/M_Hat_GorillaLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Hat_Gorilla_def.skin'
		hat_hair = none
		materials = [
			m_hat_gorilla_primary
		]
		price = 8000
		random_weight = 0.0
	}
	{
		desc_id = m_hat_pimp
		frontend_desc = qs(0xd8a55f8a)
		mesh = 'models/CAR/Male/M_Hat_Pimp.skin'
		mesh1 = 'models/CAR/Male/M_Hat_PimpLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Hat_Pimp_def.skin'
		materials = [
			m_hat_pimp_primary
			m_hat_pimp_secondary
			m_hat_pimp_feather
		]
		price = 2500
		locked
		polaroid = p_m_hat_pimp
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
		mesh = 'models/CAR/Male/M_Rock_Fhair_Stub.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Fhair_StubLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Fhair_Stub_def.skin'
		$cas_male_hair_common_settings_skinshader
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_fhair_soulpatch
		frontend_desc = qs(0x507ad5bb)
		mesh = 'models/CAR/Male/M_Clsc_FHair_Soulpatch.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_FHair_SoulpatchLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_FHair_Soulpatch_def.skin'
		$cas_male_hair_common_settings_skinshader
		materials = [
			m_clsc_fhair_soulpatch_primary
		]
		random_weight = 0.0
	}
	{
		desc_id = m_rock_fhair_goatee03
		frontend_desc = qs(0x963b21da)
		mesh = 'models/CAR/Male/M_Rock_Fhair_Goatee03.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Fhair_Goatee03LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Fhair_Goatee03_def.skin'
		$cas_male_hair_common_settings
		random_weight = 1.0
	}
	{
		desc_id = m_rock_fhair_goatee01
		frontend_desc = qs(0x51861c55)
		mesh = 'models/CAR/Male/M_Rock_Fhair_Goatee01.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Fhair_Goatee01LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Fhair_Goatee01_def.skin'
		$cas_male_hair_common_settings
		random_weight = 1.0
	}
	{
		desc_id = m_rock_fhair_goatee02
		frontend_desc = qs(0x3ffb7e3d)
		mesh = 'models/CAR/Male/M_Rock_Fhair_Goatee02.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Fhair_Goatee02LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Fhair_Goatee02_def.skin'
		$cas_male_hair_common_settings
		random_weight = 1.0
	}
	{
		desc_id = m_clsc_fhair_stache01
		frontend_desc = qs(0xb4651acf)
		mesh = 'models/CAR/Male/M_Clsc_Fhair_Stache01.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Fhair_Stache01LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_Fhair_Stache01_def.skin'
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_fhair_stache04
		frontend_desc = qs(0xe1760794)
		mesh = 'models/CAR/Male/M_Clsc_Fhair_Stache02.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Fhair_Stache02LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_Fhair_Stache02_def.skin'
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_fhair_burns01
		frontend_desc = qs(0xeb07e68a)
		mesh = 'models/CAR/Male/M_Rock_Fhair_Burns01.skin'
		mesh1 = 'models/CAR/Male/M_Rock_Fhair_Burns01LOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Rock_Fhair_Burns01_def.skin'
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
	{
		desc_id = m_bmtl_fhair_beard
		frontend_desc = qs(0xecf78185)
		mesh = 'models/CAR/Male/M_Bmtl_FHair_Beard.skin'
		mesh1 = 'models/CAR/Male/M_Bmtl_FHair_BeardLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Bmtl_FHair_Beard_def.skin'
		$cas_male_hair_common_settings
		random_weight = 0.0
	}
	{
		desc_id = m_clsc_fhair_country
		frontend_desc = qs(0xddb9e702)
		mesh = 'models/CAR/Male/M_Clsc_Fhair_Country.skin'
		mesh1 = 'models/CAR/Male/M_Clsc_Fhair_CountryLOD.skin'
		0x56504ac4 = 1
		deform_mesh = 'models/CAR/Male/M_Clsc_Fhair_Country_def.skin'
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
		with = 'tex/models/Characters/Layers/CAR/Male/Age/CAR_Male_Age03_N.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with2 = 'tex/models/Characters/Layers/CAR/Male/Age/CAR_male_Age03_D.dds'
		frontend_desc = qs(0xbe8a142d)
		in = cas_body
		in2 = cas_body
		random_weight = 0.25
	}
	{
		desc_id = car_male_aged
		replace = 'tex/models/Characters/car/male/car_male_head_n.dds'
		with = 'tex/models/Characters/Layers/CAR/Male/Age/CAR_Male_Age04_N.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with2 = 'tex/models/Characters/Layers/CAR/Male/Age/CAR_male_Age04_D.dds'
		frontend_desc = qs(0x67727495)
		in = cas_body
		in2 = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_male_old
		replace = 'tex/models/Characters/car/male/car_male_head_n.dds'
		with = 'tex/models/Characters/Layers/CAR/Male/Age/CAR_Male_Age05_N.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with2 = 'tex/models/Characters/Layers/CAR/Male/Age/CAR_male_Age05_D.dds'
		frontend_desc = qs(0xc05200fd)
		in = cas_body
		in2 = cas_body
		random_weight = 0.0
	}
]
