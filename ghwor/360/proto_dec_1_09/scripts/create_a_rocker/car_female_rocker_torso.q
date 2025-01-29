cas_female_torso = [
	{
		desc_id = f_torso_boneman
		frontend_desc = qs(0x51011b0c)
		mesh = 0xb30ce5d7
		genre = [
			rock
		]
	}
	{
		desc_id = f_torso_tshirt
		frontend_desc = qs(0xd5e5d250)
		mesh = `models/car/female/f_torso_tshirt`
		random_weight = 0.5
		genre = [
			rock
			`heavy	metal`
		]
		materials = [
			m_torso_tshirt_primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/characters/car/male/m_torso_tshirt_o_dnc`
				material = m_torso_tshirt_primary
				omit_base_tex
				user_layer_settings = {
					wrap_u
					cas_1
					initial_values = {
						x_scale = 21
						y_scale = 30
					}
				}
			}
		]
	}
	{
		desc_id = f_torso_layered
		frontend_desc = qs(0x6df89e70)
		mesh = `models/car/female/f_torso_layered`
		genre = [
			rock
		]
		materials = [
			f_torso_layered_primary
			f_torso_layered_secondary
		]
	}
	{
		desc_id = f_torso_hoodie
		frontend_desc = qs(0xd8020207)
		mesh = `models/car/female/f_torso_hoodie`
		cloth = `models/car/female/f_torso_hoodie`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
			Bone_Bicep_R
			Bone_Bicep_L
		]
		genre = [
			rock
		]
		material_groups = [
			{
				materials = [
					f_torso_hoodie_primary
					f_torso_hoodie_null
				]
				shader = $cas_shader_skin
				Name = qs(0x1a32079f)
			}
			{
				materials = [
					f_torso_hoodie_secondary
				]
				shader = $cas_shader_skin
				Name = qs(0x1a32079f)
			}
		]
	}
	{
		desc_id = f_punk_torso_tanktop
		frontend_desc = qs(0x0a2e1e2f)
		mesh = `models/car/female/f_punk_torso_tanktop`
		cloth = `models/car/female/f_punk_torso_tanktop`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
		]
		materials = [
			f_punk_torso_tanktop_primary
			f_punk_torso_tanktop_secondary
		]
		genre = [
			punk
		]
		random_weight = 0.5
	}
	{
		desc_id = f_punk_torso_zipup
		frontend_desc = qs(0x0fbdaf71)
		mesh = `models/car/female/f_punk_torso_zipup`
		cloth = `models/car/female/f_punk_torso_zipup`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
		]
		materials = [
			f_punk_torso_zipup_primary
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_torso_leather
		frontend_desc = qs(0x109a2f9f)
		mesh = `models/car/female/f_punk_torso_leather`
		cloth = `models/car/female/f_punk_torso_leather`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
			Bone_Stomach_Lower
			BONE_PELVIS
			Bone_Forearm_L
			Bone_Forearm_R
		]
		genre = [
			punk
		]
		swatch_list = [
			f_punk_torso_leather_02
			f_punk_torso_leather_03
			f_punk_torso_leather_04
		]
		swatch_texture = `tex/models/characters/car/female/punk/swatch_leather_01`
	}
	{
		desc_id = f_punk_torso_leather_02
		frontend_desc = qs(0x84a703f5)
		mesh = `models/car/female/f_punk_torso_leather_02`
		cloth = `models/car/female/f_punk_torso_leather_02`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
			Bone_Stomach_Lower
			BONE_PELVIS
			Bone_Forearm_L
			Bone_Forearm_R
		]
		genre = [
			punk
		]
		swatch_for = f_punk_torso_leather
		swatch_texture = `tex/models/characters/car/female/punk/swatch_leather_02`
	}
	{
		desc_id = f_punk_torso_leather_03
		frontend_desc = qs(0xc4af30cb)
		mesh = `models/car/female/f_punk_torso_leather_03`
		cloth = `models/car/female/f_punk_torso_leather_03`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
			Bone_Stomach_Lower
			BONE_PELVIS
			Bone_Forearm_L
			Bone_Forearm_R
		]
		genre = [
			punk
		]
		swatch_for = f_punk_torso_leather
		swatch_texture = `tex/models/characters/car/female/punk/swatch_leather_03`
	}
	{
		desc_id = f_punk_torso_leather_04
		frontend_desc = qs(0x4c8150a2)
		mesh = `models/car/female/f_punk_torso_leather_04`
		cloth = `models/car/female/f_punk_torso_leather_04`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
			Bone_Stomach_Lower
			BONE_PELVIS
			Bone_Forearm_L
			Bone_Forearm_R
		]
		genre = [
			punk
		]
		swatch_for = f_punk_torso_leather
		swatch_texture = `tex/models/characters/car/female/punk/swatch_leather_04`
	}
	{
		desc_id = f_punk_torso_judy01
		frontend_desc = qs(0x3d6a656c)
		mesh = `models/car/female/f_punk_torso_judy01`
		materials = [
			f_punk_torso_judy01_primary
			f_punk_torso_judy01_secondary
		]
		genre = [
			punk
		]
		cloth = `models/car/female/f_punk_torso_judy01`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
			Bone_Stomach_Lower
			Bone_Bicep_R
			Bone_Bicep_L
			BONE_PELVIS
		]
		random_weight = 0.0
	}
	{
		desc_id = f_punk_torso_stripe
		frontend_desc = qs(0xf22a6cdc)
		mesh = `models/car/female/f_punk_torso_stripe`
		cloth = `models/car/female/f_punk_torso_stripe`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Neck
		]
		materials = [
			f_punk_torso_stripe_primary
			f_punk_torso_stripe_secondary
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_torso_judy02
		frontend_desc = qs(0x938ea10f)
		mesh = `models/car/female/f_punk_torso_judy02`
		materials = [
			f_punk_torso_judy02_primary
			f_punk_torso_judy02_secondary
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_torso_judynails1
		frontend_desc = qs(0xadc4f432)
		mesh = `models/car/female/f_punk_torso_judynails1`
		genre = [
			punk
		]
		locked
	}
	{
		desc_id = f_punk_torso_judynails2
		frontend_desc = qs(0x9e074d13)
		mesh = `models/car/female/f_punk_torso_judynails2`
		materials = [
			f_punk_torso_judynails2_primary
			f_punk_torso_judynails2_secondary
		]
		genre = [
			punk
		]
		locked
	}
	{
		desc_id = f_punk_torso_judynails3
		frontend_desc = qs(0x24142091)
		mesh = `models/car/female/f_punk_torso_judynails3`
		cloth = `models/car/female/f_punk_torso_judynails3`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_torso_judynails4
		frontend_desc = qs(0xbcb3da98)
		mesh = `models/car/female/f_punk_torso_judynails4`
		material_groups = [
			{
				materials = [
					f_punk_torso_judynails4_primary
				]
				shader = $cas_shader_skin_masked1
			}
		]
		genre = [
			punk
		]
		locked
	}
	{
		desc_id = f_rock_torso_jjacket
		frontend_desc = qs(0x35cb3bb6)
		mesh = `models/car/female/f_rock_torso_jjacket`
		cloth = `models/car/female/f_rock_torso_jjacket`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
			Bone_Stomach_Lower
			Bone_Collar_L
			Bone_Collar_R
			Bone_Bicep_L
			Bone_Bicep_R
		]
		materials = [
			f_rock_torso_jjacket_primary
			f_rock_torso_jjacket_secondary
			f_rock_torso_jjacket_tertiary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_torso_metalstud
		frontend_desc = qs(0x04d5ee56)
		mesh = `models/car/female/f_rock_torso_metalstud`
		cloth = `models/car/female/f_rock_torso_metalstud`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			Bone_Stomach_Upper
			Bone_Stomach_Lower
		]
		materials = [
			f_rock_torso_metalstud_primary
			f_rock_torso_metalstud_secondary
		]
		genre = [
			rock
			`heavy	metal`
		]
		locked
	}
	{
		desc_id = f_rock_torso_ctank
		frontend_desc = qs(0x3cabc341)
		mesh = `models/car/female/f_rock_torso_ctank`
		cloth = `models/car/female/f_rock_torso_ctank`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
		]
		materials = [
			f_rock_torso_ctank_primary
			f_rock_torso_ctank_secondary
		]
		genre = [
			rock
			`heavy	metal`
		]
		locked
	}
	{
		desc_id = f_rock_torso_cjean
		frontend_desc = qs(0x8af2b01b)
		mesh = `models/car/female/f_rock_torso_cjean`
		material_groups = [
			{
				materials = [
					f_rock_torso_cjean_primary
				]
				shader = $cas_shader_skin_masked2
			}
			{
				materials = [
					f_rock_torso_cjean_secondary
				]
				shader = $cas_shader_skin
			}
		]
		cloth = `models/car/female/f_rock_torso_cjean`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_torso_raglan
		frontend_desc = qs(0x33233a56)
		mesh = `models/car/female/f_rock_torso_raglan`
		cloth = `models/car/female/f_rock_torso_raglan`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
		]
		materials = [
			f_rock_torso_raglan_primary
			f_rock_torso_raglan_secondary
		]
		genre = [
			rock
			`heavy	metal`
		]
	}
	{
		desc_id = f_rock_torso_corset
		frontend_desc = qs(0xc231f034)
		mesh = `models/car/female/f_rock_torso_corset`
		materials = [
			f_rock_torso_corset_primary
		]
		genre = [
			rock
		]
		random_weight = 0.1
	}
	{
		desc_id = f_rock_torso_ljacket
		frontend_desc = qs(0x0f400a62)
		mesh = `models/car/female/f_rock_torso_ljacket`
		materials = [
			f_rock_torso_ljacket_primary
			f_rock_torso_ljacket_secondary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_torso_tie
		frontend_desc = qs(0x41fa4b23)
		mesh = `models/car/female/f_rock_torso_tie`
		materials = [
			f_rock_torso_tie_primary
			f_rock_torso_tie_secondary
		]
		cloth = `models/car/female/f_rock_torso_tie`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
			Bone_Stomach_Lower
			Bone_Collar_R
			Bone_Collar_L
			Bone_Bicep_R
			Bone_Bicep_L
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_torso_eccorset
		frontend_desc = qs(0xe09f4c8f)
		mesh = `models/car/female/f_rock_torso_eccorset`
		material_groups = [
			{
				materials = [
					f_rock_torso_eccorset_primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		genre = [
			rock
		]
		locked
	}
	{
		desc_id = f_rock_torso_bass
		frontend_desc = qs(0xf16d30ec)
		mesh = `models/car/female/f_rock_torso_bass`
		genre = [
			rock
		]
		materials = [
			f_rock_torso_bass_contest_primary
		]
	}
	{
		desc_id = f_glam_torso_lacebratop
		frontend_desc = qs(0xf9b41104)
		mesh = `models/car/female/f_glam_torso_lacebratop`
		genre = [
			`glam	rock`
		]
		materials = [
			f_glam_torso_lacebratop_primary
		]
	}
	{
		desc_id = f_glam_torso_denimjakcet
		frontend_desc = qs(0x0331630e)
		mesh = `models/car/female/f_glam_torso_denimjakcet`
		genre = [
			`glam	rock`
		]
		materials = [
			f_glam_torso_denimjakcet_primary
			f_glam_torso_denimjakcet_secondary
		]
		material_names = [
			qs(0x6b4a6675)
			qs(0x6e0830a3)
		]
	}
	{
		desc_id = f_glam_torso_blackclam
		frontend_desc = qs(0x03e6ddb6)
		mesh = `models/car/female/f_glam_torso_blackclam`
		genre = [
			`glam	rock`
		]
		materials = [
			f_glam_torso_blackclam_primary
			f_glam_torso_blackclam_secondary
		]
	}
	{
		desc_id = f_glam_torso_lightning
		frontend_desc = qs(0xa6fdea62)
		mesh = `models/car/female/f_glam_torso_lightning`
		genre = [
			`glam	rock`
		]
		materials = [
			f_glam_torso_lightning_primary
			f_glam_torso_lightning_secondary
		]
	}
	{
		desc_id = f_goth_torso_corsetop
		frontend_desc = qs(0xf82dbdc1)
		mesh = `models/car/female/f_goth_torso_corsetop`
		materials = [
			f_goth_torso_corsetop_primary
			f_goth_torso_corsetop_secondary
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_torso_frillybodice
		frontend_desc = qs(0x8dc40542)
		mesh = `models/car/female/f_goth_torso_frillybodice`
		materials = [
			f_goth_torso_frillybodice_shirt
			f_goth_torso_frillybodice_lining
			f_goth_torso_frillybodice_corset
			f_goth_torso_frillybodice_ribbon
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_torso_halfstrap
		frontend_desc = qs(0x03c9d10d)
		mesh = `models/car/female/f_goth_torso_halfstrap`
		material_groups = [
			{
				materials = [
					f_goth_torso_halfstrap_primary
				]
			}
			{
				materials = [
					f_goth_torso_halfstrap_secondary
				]
			}
			{
				materials = [
					f_goth_torso_halfstrap_glove
				]
			}
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_torso_cyberstrap
		frontend_desc = qs(0xeb0e0eb6)
		mesh = `models/car/female/f_goth_torso_cyberstrap`
		materials = [
			f_goth_torso_cyberstrap_primary
			f_goth_torso_cyberstrap_secondary
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_torso_dress
		frontend_desc = qs(0x2c481737)
		mesh = `models/car/female/f_goth_torso_dress`
		cloth = `models/car/female/f_goth_torso_dress`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Bicep_R
			Bone_Bicep_L
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_fun_torso_angelw
		frontend_desc = qs(0xc8fe9880)
		mesh = `models/car/female/f_fun_torso_angelw`
		materials = [
			f_fun_torso_angelw_wing
			f_fun_torso_angelw_bra
		]
		genre = [
			goth
		]
		random_weight = 0.0
	}
	{
		desc_id = f_fun_torso_bra
		frontend_desc = qs(0xfe4372bd)
		mesh = `models/car/female/f_fun_torso_bra`
		materials = [
			f_fun_torso_angelw_bra
		]
		genre = [
			goth
			rock
			`heavy	metal`
		]
		random_weight = 0.0
	}
	{
		desc_id = f_goth_torso_pndrband
		frontend_desc = qs(0x171c04a5)
		mesh = `models/car/female/f_goth_torso_pndrband`
		cloth = `models/car/female/f_goth_torso_pndrband`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			Bone_Thigh_L
			Bone_Thigh_R
			Bone_Neck
			bone_head
			Bone_Collar_L
			Bone_Collar_R
			BONE_PELVIS
		]
		material_groups = [
			{
				materials = [
					f_goth_torso_pndrband_1st
				]
				shader = $cas_shader_skin
			}
			{
				materials = [
					f_goth_torso_pndrband_2nd
					f_goth_torso_pndrband_2_1
				]
				shader = $cas_shader_skin
			}
			{
				materials = [
					f_goth_torso_pndrband_3rd
					f_goth_torso_pndrband_3_1
				]
				shader = $cas_shader_skin
			}
			{
				materials = [
					f_goth_torso_pndrband_4th
					f_goth_torso_pndrband_4_1
				]
				shader = $cas_shader_skin
			}
			{
				materials = [
					f_goth_torso_pndrband_5th
				]
				shader = $cas_shader_skin
			}
		]
		genre = [
			goth
		]
		random_weight = 0.0
	}
	{
		desc_id = f_goth_torso_pndrmaid
		frontend_desc = qs(0xbd0091e9)
		mesh = `models/car/female/f_goth_torso_pndrmaid`
		cloth = `models/car/female/f_goth_torso_pndrmaid`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			Bone_Thigh_L
			Bone_Thigh_R
			BONE_PELVIS
			Bone_Bicep_R
			Bone_Bicep_L
		]
		material_groups = [
			{
				materials = [
					f_goth_torso_pndrmaid_primary1
					f_goth_torso_pndrmaid_primary2
				]
				shader = $cas_shader_skin
			}
			{
				materials = [
					f_goth_torso_pndrmaid_secondary1
					f_goth_torso_pndrmaid_secondary2
				]
				shader = $cas_shader_skin
			}
		]
		genre = [
			goth
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_goth_torso_pndrstraps
		frontend_desc = qs(0x04d0f192)
		mesh = `models/car/female/f_goth_torso_pndrstraps`
		locked
		material_groups = [
			{
				materials = [
					f_goth_torso_pndrstraps_primary
				]
				shader = $cas_shader_skin
				Name = qs(0x3fab7478)
			}
			{
				materials = [
					f_goth_torso_pndrstraps_secondary
				]
				shader = $cas_shader_skin
				Name = qs(0x4f83211b)
			}
			{
				materials = [
					f_goth_torso_pndrstraps_tertiary
				]
				shader = $cas_shader_skin
				Name = qs(0x42923e18)
			}
		]
		genre = [
			goth
		]
		random_weight = 0.0
	}
	{
		desc_id = f_goth_torso_pndrtrench
		frontend_desc = qs(0x061a0536)
		mesh = `models/car/female/f_goth_torso_pndrtrench`
		material_groups = [
			{
				materials = [
					f_goth_torso_pndrtrench_primary
				]
				shader = $cas_shader_skin
				Name = qs(0x7a282392)
			}
			{
				materials = [
					f_goth_torso_pndrtrench_secondary
				]
				shader = $cas_shader_skin
				Name = qs(0x4f83211b)
			}
			{
				materials = [
					f_goth_torso_pndrtrench_tertiary
				]
				shader = $cas_shader_skin
				Name = qs(0x940d778e)
			}
		]
		genre = [
			goth
		]
		cloth = `models/car/female/f_goth_torso_pndrtrench`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
			Bone_Knee_R
			Bone_Knee_L
		]
		random_weight = 0.0
	}
	{
		desc_id = f_metl_torso_bullets01
		frontend_desc = qs(0x154f9f31)
		mesh = `models/car/female/f_metl_torso_bullets01`
		cloth = `models/car/female/f_metl_torso_bullets01`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			Bone_Stomach_Upper
			Bone_Stomach_Lower
		]
		genre = [
			`heavy	metal`
		]
		material_groups = [
			{
				materials = [
					f_metl_torso_bullets01_primary
					f_metl_torso_bullets01_1_1
				]
				shader = $cas_shader_skin
				Name = qs(0x6b4a6675)
			}
			{
				materials = [
					f_metl_torso_bullets01_secondary
				]
				shader = $cas_shader_skin
				Name = qs(0x3fab7478)
			}
		]
	}
	{
		desc_id = f_metl_torso_vest01
		frontend_desc = qs(0x37dfa29e)
		mesh = `models/car/female/f_metl_torso_vest01`
		cloth = `models/car/female/f_metl_torso_vest01`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			Bone_Stomach_Upper
			Bone_Stomach_Lower
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_metl_torso_bramesh
		frontend_desc = qs(0x00921c12)
		mesh = `models/car/female/f_metl_torso_bramesh`
		genre = [
			`heavy	metal`
			`black	metal`
		]
	}
	{
		desc_id = f_metl_torso_jeanlthr
		frontend_desc = qs(0xa2f0a9b4)
		mesh = `models/car/female/f_metl_torso_jeanlthr`
		materials = [
			f_metl_torso_jeanlthr_primary
			f_metl_torso_jeanlthr_secondary
			f_metl_torso_jeanlthr_shirt
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_metl_torso_lacetank
		frontend_desc = qs(0x94a5446d)
		mesh = `models/car/female/f_metl_torso_lacetank`
		materials = [
			f_metl_torso_lacetank_primary
			f_metl_torso_lacetank_secondary
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_metl_torso_shldrhoody
		frontend_desc = qs(0x06e5b3d5)
		mesh = `models/car/female/f_metl_torso_shldrhoody`
		materials = [
			f_metl_torso_shldrhoody_primary
			f_metl_torso_shldrhoody_secondary
		]
		chosen_materials = {
			material1 = purple_blue_1
			material2 = carblack_1
		}
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_metl_torso_acid
		frontend_desc = qs(0xfb8add4c)
		mesh = `models/car/female/f_metl_torso_acid`
		materials = [
			f_metl_torso_acid_primary
			f_metl_torso_acid_sleeves
			f_metl_torso_acid_straps
			f_metl_torso_acid_secondary
		]
		genre = [
			`heavy	metal`
			`black	metal`
		]
	}
	{
		desc_id = f_metl_torso_shirtbra
		frontend_desc = qs(0x12585d96)
		mesh = `models/car/female/f_metl_torso_shirtbra`
		materials = [
			f_metl_torso_shirtbra_primary
			f_metl_torso_shirtbra_secondary
		]
		genre = [
			`heavy	metal`
			`black	metal`
		]
	}
	{
		desc_id = f_metl_torso_dvest
		frontend_desc = qs(0x94134454)
		mesh = `models/car/female/f_metl_torso_dvest`
		cloth = `models/car/female/f_metl_torso_dvest`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Collar_R
			Bone_Collar_L
		]
		material_groups = [
			{
				materials = [
					f_metl_torso_dvest_primary
					f_metl_torso_dvest_primary_cloth
				]
				shader = $cas_shader_skin
				Name = qs(0x44458d9d)
			}
			{
				materials = [
					f_metl_torso_dvest_secondary
				]
				shader = $cas_shader_skin
				Name = qs(0x947362be)
			}
		]
		genre = [
			`heavy	metal`
			`black	metal`
		]
	}
	{
		desc_id = f_clsc_torso_striped
		frontend_desc = qs(0xb3452072)
		mesh = `models/car/female/f_clsc_torso_striped`
		materials = [
			f_clsc_torso_striped_primary
			f_clsc_torso_striped_secondary
		]
		genre = [
			`classic	rock`
		]
	}
	{
		desc_id = f_clsc_torso_pldtie
		frontend_desc = qs(0x89ee7a85)
		mesh = `models/car/female/f_clsc_torso_pldtie`
		genre = [
			`classic	rock`
		]
		materials = [
			f_clsc_torso_pldtie_primary
			f_clsc_torso_pldtie_secondary
			f_clsc_torso_pldtie_tie
		]
		cloth = `models/car/female/f_clsc_torso_pldtie`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
			Bone_Stomach_Lower
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		random_weight = 0.1
	}
	{
		desc_id = f_clsc_torso_jersey
		frontend_desc = qs(0x50433d5b)
		mesh = `models/car/female/f_clsc_torso_jersey`
		materials = [
			f_clsc_torso_jersey_primary
			f_clsc_torso_jersey_secondary
		]
		genre = [
			`classic	rock`
		]
	}
	{
		desc_id = f_clsc_torso_flwr
		frontend_desc = qs(0x9aba2e07)
		mesh = `models/car/female/f_clsc_torso_flwr`
		genre = [
			`classic	rock`
		]
		cloth = `models/car/female/f_clsc_torso_flwr`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
			Bone_Stomach_Upper
			Bone_Stomach_Lower
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		materials = [
			f_clsc_torso_flwr_primary
			f_clsc_torso_flwr_secondary
			f_clsc_torso_flwr_third
			f_clsc_torso_flwr_rose
		]
	}
	{
		desc_id = f_clsc_torso_dress
		frontend_desc = qs(0x513dd30e)
		mesh = `models/car/female/f_clsc_torso_dress`
		genre = [
			`classic	rock`
		]
		materials = [
			f_clsc_torso_dress_primary
		]
	}
	{
		desc_id = f_pop_torso_longsleeves
		frontend_desc = qs(0xc5ae5744)
		mesh = `models/car/female/f_pop_torso_longsleeves`
		genre = [
			pop
		]
	}
	{
		desc_id = f_pop_torso_ruffletop
		frontend_desc = qs(0x821216c3)
		mesh = `models/car/female/f_pop_torso_ruffletop`
		materials = [
			f_pop_ruffletop_primary
			f_pop_ruffletop_secondary
		]
		genre = [
			pop
		]
	}
	{
		desc_id = f_pop_torso_buttontop
		frontend_desc = qs(0x07afb613)
		mesh = `models/car/female/f_pop_torso_buttontop`
		materials = [
			f_pop_buttontop_primary
			f_pop_buttontop_secondary
		]
		genre = [
			pop
		]
		cloth = `models/car/female/f_pop_torso_buttontop`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
		]
		random_weight = 1.5
	}
	{
		desc_id = f_pop_torso_hayleyshirt
		frontend_desc = qs(0x51c7ef28)
		mesh = `models/car/female/f_pop_torso_hayleyshirt`
		materials = [
			f_pop_torso_hayleyshirt_primary
		]
		genre = [
			pop
		]
		random_weight = 0.0
	}
	{
		desc_id = f_bmtl_torso_corset01
		frontend_desc = qs(0x8993ac6d)
		mesh = `models/car/female/f_bmtl_torso_corset01`
		cloth = `models/car/female/f_bmtl_torso_corset01`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_chest
		]
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = f_bmtl_torso_spikeshirt
		frontend_desc = qs(0xe08761c6)
		mesh = `models/car/female/f_bmtl_torso_spikeshirt`
		materials = [
			f_bmtl_torso_spikeshirt_primary
			f_bmtl_torso_spikeshirt_secondary
		]
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = f_bmtl_torso_fur
		frontend_desc = qs(0x97927568)
		mesh = `models/car/female/f_bmtl_torso_fur`
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = f_bmtl_torso_spikearmor
		frontend_desc = qs(0x9aa713a4)
		mesh = `models/car/female/f_bmtl_torso_spikearmor`
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = f_bmtl_torso_bikini
		frontend_desc = qs(0xa739ba04)
		mesh = `models/car/female/f_bmtl_torso_bikini`
		materials = [
			f_bmtl_torso_bikini_primary
		]
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = f_bmtl_torso_bat
		frontend_desc = qs(0x4b36a11e)
		mesh = `models/car/female/f_bmtl_torso_bat`
		cloth = `models/car/female/f_bmtl_torso_bat`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			Bone_Bicep_L
			Bone_Bicep_R
		]
		materials = [
			f_bmtl_torso_bat_primary
			f_bmtl_torso_bat_secondary
		]
		genre = [
			`black	metal`
		]
	}
]
