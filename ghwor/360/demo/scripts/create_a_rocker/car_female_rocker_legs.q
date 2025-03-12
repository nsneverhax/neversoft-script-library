cas_female_legs = [
	{
		desc_id = f_punk_legs_plaid
		frontend_desc = qs(0x2757cbc4)
		mesh = `models/car/female/f_punk_legs_plaid`
		cloth = `models/car/female/f_punk_legs_plaid`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_r
			bone_thigh_l
		]
		materials = [
			f_punk_legs_plaid_primary
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_legs_cheerskirt
		frontend_desc = qs(0xb43d686f)
		mesh = `models/car/female/f_punk_legs_cheerskirt`
		cloth = `models/car/female/f_punk_legs_cheerskirt`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_r
			bone_thigh_l
		]
		material_groups = [
			{
				materials = [
					f_punk_legs_cheerskirt_primary
					f_punk_legs_cheerskirt_primary_cloth
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_legs_skirt
		frontend_desc = qs(0x8936b5d5)
		mesh = `models/car/female/f_punk_legs_skirt`
		cloth = `models/car/female/f_punk_legs_skirt`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_r
			bone_thigh_l
		]
		material_groups = [
			{
				materials = [
					f_punk_legs_skirt_primary
					f_punk_legs_skirt_primary_cloth
				]
				name = qs(0x44458d9d)
			}
			{
				materials = [
					f_punk_legs_skirt_secondary
				]
				name = qs(0x947362be)
			}
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_legs_shorts
		frontend_desc = qs(0x40da1730)
		mesh = `models/car/female/f_punk_legs_shorts`
		cloth = `models/car/female/f_punk_legs_shorts`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
		]
		genre = [
			punk
		]
		swatch_list = [
			f_punk_legs_shorts_02
			f_punk_legs_shorts_03
			f_punk_legs_shorts_04
		]
		swatch_texture = `tex/models/characters/car/female/punk/swatch_shorts01`
	}
	{
		desc_id = f_punk_legs_shorts_02
		frontend_desc = qs(0x3b512c89)
		mesh = `models/car/female/f_punk_legs_shorts_02`
		genre = [
			punk
		]
		swatch_for = f_punk_legs_shorts
		swatch_texture = `tex/models/characters/car/female/punk/swatch_shorts02`
	}
	{
		desc_id = f_punk_legs_shorts_03
		frontend_desc = qs(0x43f98f27)
		mesh = `models/car/female/f_punk_legs_shorts_03`
		genre = [
			punk
		]
		swatch_for = f_punk_legs_shorts
		swatch_texture = `tex/models/characters/car/female/punk/swatch_shorts03`
	}
	{
		desc_id = f_punk_legs_shorts_04
		frontend_desc = qs(0x3ba05dd5)
		mesh = `models/car/female/f_punk_legs_shorts_04`
		genre = [
			punk
		]
		swatch_for = f_punk_legs_shorts
		swatch_texture = `tex/models/characters/car/female/punk/swatch_shorts04`
	}
	{
		desc_id = f_punk_legs_judy01
		frontend_desc = qs(0xd6b90855)
		mesh = `models/car/female/f_punk_legs_judy01`
		materials = [
			f_punk_legs_judy01_primary
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_legs_judy02
		frontend_desc = qs(0x69672169)
		mesh = `models/car/female/f_punk_legs_judy02`
		cloth = `models/car/female/f_punk_legs_judy02`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_thigh_r
			bone_thigh_l
		]
		genre = [
			punk
		]
		material_groups = [
			{
				materials = [
					f_punk_legs_judy02_primary
					f_punk_legs_judy02_primary_cloth
				]
				name = qs(0x44458d9d)
			}
		]
		random_weight = 0.0
	}
	{
		desc_id = f_punk_legs_judynails1
		frontend_desc = qs(0xa6ad39b6)
		mesh = `models/car/female/f_punk_legs_judynails1`
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_legs_judynails2
		frontend_desc = qs(0x7865a044)
		mesh = `models/car/female/f_punk_legs_judynails2`
		materials = [
			f_punk_legs_judynails2_primary
		]
		genre = [
			punk
		]
		cloth = `models/car/female/f_punk_legs_judynails2`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_r
		]
	}
	{
		desc_id = f_punk_legs_judynails3
		frontend_desc = qs(0x8991d527)
		mesh = `models/car/female/f_punk_legs_judynails3`
		materials = [
			f_punk_legs_judynails3_pants
		]
		genre = [
			punk
		]
		cloth = `models/car/female/f_punk_legs_judynails3`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_r
			bone_thigh_l
		]
	}
	{
		desc_id = f_punk_legs_judynails4
		frontend_desc = qs(0xfcb19ae6)
		mesh = `models/car/female/f_punk_legs_judynails4`
		cloth = `models/car/female/f_punk_legs_judynails4`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_thigh_r
			bone_pelvis
			bone_stomach_lower
			bone_stomach_upper
			bone_chest
		]
		materials = [
			f_punk_legs_judynails4_primary
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_rock_legs_daisy
		frontend_desc = qs(0xd839943f)
		mesh = `models/car/female/f_rock_legs_daisy`
		cloth = `models/car/female/f_rock_legs_daisy`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_thigh_r
			bone_pelvis
			bone_stomach_lower
			bone_stomach_upper
			bone_chest
		]
		materials = [
			f_rock_legs_daisy_primary
			f_rock_legs_daisy_secondary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_legs_jeans
		frontend_desc = qs(0x2111f53f)
		mesh = `models/car/female/f_rock_legs_jeans`
		materials = [
			f_rock_legs_jeans_primary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_legs_ecchaps
		frontend_desc = qs(0x1d6d083a)
		mesh = `models/car/female/f_rock_legs_ecchaps`
		materials = [
			f_rock_legs_ecchaps_primary
			f_rock_legs_ecchaps_secondary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_legs_leather
		frontend_desc = qs(0xeeb802ed)
		mesh = `models/car/female/f_rock_legs_leather`
		genre = [
			rock
			`heavy metal`
		]
	}
	{
		desc_id = f_rock_legs_metalstud
		frontend_desc = qs(0x0e794953)
		mesh = `models/car/female/f_rock_legs_metalstud`
		materials = [
			f_rock_legs_metalstud_primary
			f_rock_legs_metalstud_secondary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_legs_cbotstud
		frontend_desc = qs(0x0ba0bfd5)
		mesh = `models/car/female/f_rock_legs_cbotstud`
		material_groups = [
			{
				materials = [
					f_rock_legs_cbotstud_primary
				]
				shader = $cas_shader_skin
			}
			{
				materials = [
					f_rock_legs_cbotstud_secondary
					f_rock_legs_cbotstud_secondary_nxa
				]
				shader = $cas_shader_skin
			}
		]
		cloth = `models/car/female/f_rock_legs_cbotstud`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_thigh_l
			bone_thigh_r
			bone_pelvis
			bone_stomach_lower
			bone_stomach_upper
			bone_chest
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_legs_cgun
		frontend_desc = qs(0x9bef95e1)
		mesh = `models/car/female/f_rock_legs_cgun`
		materials = [
			f_rock_legs_cgun_primary
			f_rock_legs_cgun_secondary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_legs_ripjeans
		frontend_desc = qs(0xe3ac9732)
		mesh = `models/car/female/f_rock_legs_ripjeans`
		materials = [
			f_rock_legs_ripjeans_primary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_legs_pinstripe
		frontend_desc = qs(0xdca66e94)
		mesh = `models/car/female/f_rock_legs_pinstripe`
		materials = [
			f_rock_legs_pinstripe_primary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_glam_legs_flamespandex
		frontend_desc = qs(0x19c9dd3e)
		mesh = `models/car/female/f_glam_legs_flamespandex`
		genre = [
			`glam rock`
		]
		material_groups = [
			{
				materials = [
					f_glam_legs_flamespandex_primary
				]
				shader = $cas_shader_skin_masked1
			}
			{
				materials = [
					f_glam_legs_flamespandex_secondary
				]
			}
		]
		random_weight = 0.0
	}
	{
		desc_id = f_glam_legs_blingskirt
		frontend_desc = qs(0xd5666752)
		mesh = `models/car/female/f_glam_legs_blingskirt`
		cloth = `models/car/female/f_glam_legs_blingskirt`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
		]
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_legs_blingskirt_primary
		]
	}
	{
		desc_id = f_glam_legs_purplebling
		frontend_desc = qs(0xb6bff20d)
		mesh = `models/car/female/f_glam_legs_purplebling`
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_legs_purplebling_primary
		]
	}
	{
		desc_id = f_glam_legs_denimshorts
		frontend_desc = qs(0xfb11a683)
		mesh = `models/car/female/f_glam_legs_denimshorts`
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_legs_denimshorts_secondary
		]
	}
	{
		desc_id = f_goth_legs_strapj
		frontend_desc = qs(0x7065c153)
		mesh = `models/car/female/f_goth_legs_strapj`
		material_groups = [
			{
				materials = [
					f_goth_legs_strapj_straps
					f_goth_legs_strapj_pants
				]
			}
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_legs_frillydress
		frontend_desc = qs(0x0248c494)
		mesh = `models/car/female/f_goth_legs_frillydress`
		material_groups = [
			{
				materials = [
					f_goth_legs_frillydress_dress
				]
				shader = $cas_shader_skin
				name = qs(0xc2a90de2)
			}
			{
				materials = [
					f_goth_legs_frillydress_hose01
				]
				shader = $cas_shader_skin
				name = qs(0x8d5d3115)
			}
			{
				materials = [
					f_goth_legs_frillydress_hose02
				]
				shader = $cas_shader_skin
				name = qs(0x176e1386)
			}
		]
		genre = [
			goth
		]
		cloth = `models/car/female/f_goth_legs_frillydress`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_thigh_r
			bone_thigh_l
			bone_knee_r
			bone_knee_l
		]
	}
	{
		desc_id = f_goth_legs_halfstrap
		frontend_desc = qs(0xea50f22c)
		mesh = `models/car/female/f_goth_legs_halfstrap`
		materials = [
			f_goth_legs_halfstrap_primary
			f_goth_legs_halfstrap_secondary
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_legs_cyberstrap
		frontend_desc = qs(0x7eed61a5)
		mesh = `models/car/female/f_goth_legs_cyberstrap`
		materials = [
			f_goth_legs_cyberstrap_primary
			f_goth_legs_cyberstrap_secondary
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_legs_lace
		frontend_desc = qs(0x3b3da64c)
		mesh = `models/car/female/f_goth_legs_lace`
		genre = [
			goth
		]
		cloth = `models/car/female/f_goth_legs_lace`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
		]
	}
	{
		desc_id = f_goth_legs_pndrcapris
		frontend_desc = qs(0xd3c7f4ab)
		mesh = `models/car/female/f_goth_legs_pndrcapris`
		materials = [
			f_goth_legs_pndrcapris_primary
			f_goth_legs_pndrcapris_secondary
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_legs_pndrrose
		frontend_desc = qs(0x015de8ec)
		mesh = `models/car/female/f_goth_legs_pndrrose`
		material_groups = [
			{
				materials = [
					f_goth_legs_pndrrose_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc1a17d69)
			}
			{
				materials = [
					f_goth_legs_pndrrose_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1cc424d6)
			}
			{
				materials = [
					f_goth_legs_pndrrose_tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x4ff14afd)
			}
			{
				materials = [
					f_goth_legs_pndrrose_lace1
					f_goth_legs_pndrrose_lace2
				]
				shader = $cas_shader_skin
				name = qs(0x6387b943)
			}
		]
		cloth = `models/car/female/f_goth_legs_pndrrose`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_thigh_r
			bone_thigh_l
			bone_knee_r
			bone_knee_l
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_metl_legs_bandana
		frontend_desc = qs(0x7e804157)
		mesh = `models/car/female/f_metl_legs_bandana`
		materials = [
			f_metl_legs_bandana_primary
			f_metl_legs_bandana_secondary
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_legs_studs01
		frontend_desc = qs(0xbe3c59d6)
		mesh = `models/car/female/f_metl_legs_studs01`
		genre = [
			`heavy metal`
			`black metal`
		]
		materials = [
			f_metl_legs_studs01_primary
			f_metl_legs_studs01_secondary
		]
	}
	{
		desc_id = f_metl_legs_blackwidow
		frontend_desc = qs(0x032bf260)
		mesh = `models/car/female/f_metl_legs_blackwidow`
		materials = [
			f_metl_legs_blackwidow_primary
			f_metl_legs_blackwidow_secondary
			f_metl_legs_blackwidow_belt
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_legs_patch
		frontend_desc = qs(0x1800e345)
		mesh = `models/car/female/f_metl_legs_patch`
		materials = [
			f_metl_legs_patch_primary
			f_metl_legs_patch_secondary
			f_metl_legs_patch_belt
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_legs_pencilskirt
		frontend_desc = qs(0xf2f1fe2b)
		mesh = `models/car/female/f_metl_legs_pencilskirt`
		materials = [
			f_metl_legs_pencilskirt_primary
			f_metl_legs_pencilskirt_secondary
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_legs_zipskrt
		frontend_desc = qs(0x2b356086)
		mesh = `models/car/female/f_metl_legs_zipskrt`
		genre = [
			`heavy metal`
		]
		cloth = `models/car/female/f_metl_legs_zipskrt`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
			bone_knee_r
			bone_knee_l
		]
		material_groups = [
			{
				materials = [
					f_metl_legs_zipskrt_primary
					f_metl_legs_zipskrt_primary_cloth
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					f_metl_legs_zipskrt_secondary
					f_metl_legs_zipskrt_secondary_cloth
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
	}
	{
		desc_id = f_metl_legs_strapped
		frontend_desc = qs(0x1e4b5eee)
		mesh = `models/car/female/f_metl_legs_strapped`
		materials = [
			f_metl_legs_strapped_primary
			f_metl_legs_strapped_secondary
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_legs_strappednoleg
		frontend_desc = qs(0x0d767a12)
		mesh = `models/car/female/f_metl_legs_strappednoleg`
		materials = [
			f_metl_legs_strapped_primary
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_legs_cargo
		frontend_desc = qs(0x05567aa6)
		mesh = `models/car/female/f_metl_legs_cargo`
		materials = [
			f_metl_legs_cargo_primary
			f_metl_legs_cargo_secondary
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_legs_jeansrip
		frontend_desc = qs(0x810ebed9)
		mesh = `models/car/female/f_metl_legs_jeansrip`
		materials = [
			f_metl_legs_jeansrip_primary
			f_metl_legs_jeansrip_secondary
		]
		genre = [
			`heavy metal`
		]
		random_weight = 0.25
	}
	{
		desc_id = f_clsc_legs_pvc
		frontend_desc = qs(0x75699582)
		mesh = `models/car/female/f_clsc_legs_pvc`
		materials = [
			f_clsc_legs_pvc_primary
		]
		genre = [
			`classic rock`
		]
	}
	{
		desc_id = f_clsc_legs_plaid
		frontend_desc = qs(0x273ed129)
		mesh = `models/car/female/f_clsc_legs_plaid`
		materials = [
			f_clsc_legs_plaid_primary
			f_clsc_legs_plaid_secondary
		]
		genre = [
			`classic rock`
		]
	}
	{
		desc_id = f_clsc_legs_flrbell
		frontend_desc = qs(0x57cb052a)
		mesh = `models/car/female/f_clsc_legs_flrbell`
		genre = [
			`classic rock`
		]
		cloth = `models/car/female/f_clsc_legs_flrbell`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
			bone_ankle_r
			bone_ankle_l
			bone_knee_l
			bone_knee_r
		]
		materials = [
			f_clsc_legs_flrbell_primary
		]
	}
	{
		desc_id = f_clsc_legs_vlvttie
		frontend_desc = qs(0x20caefd5)
		mesh = `models/car/female/f_clsc_legs_vlvttie`
		cloth = `models/car/female/f_clsc_legs_vlvttie`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
		]
		genre = [
			`classic rock`
		]
		materials = [
			f_clsc_legs_vlvttie_primary
			f_clsc_legs_vlvttie_secondary
		]
	}
	{
		desc_id = f_clsc_legs_skrt
		frontend_desc = qs(0x208e050e)
		mesh = `models/car/female/f_clsc_legs_skrt`
		genre = [
			`classic rock`
		]
		materials = [
			f_clsc_legs_skrt_primary
			f_clsc_legs_skrt_secondary
		]
		random_weight = 0.25
	}
	{
		desc_id = f_pop_legs_baggypants
		frontend_desc = qs(0xf7feac6c)
		mesh = `models/car/female/f_pop_legs_baggypants`
		genre = [
			pop
		]
		cloth = `models/car/female/f_pop_legs_baggypants`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
			bone_knee_l
			bone_knee_r
		]
		materials = [
			f_pop_caprispants_primary
			f_pop_caprispants_secondary
		]
	}
	{
		desc_id = f_pop_legs_plaidpants
		frontend_desc = qs(0x1259a852)
		mesh = `models/car/female/f_pop_legs_plaidpants`
		materials = [
			f_pop_plaidpants_primary
		]
		genre = [
			pop
		]
	}
	{
		desc_id = f_pop_legs_capris
		frontend_desc = qs(0xa28b5f3c)
		mesh = `models/car/female/f_pop_legs_capris`
		materials = [
			f_pop_caprispants_primary
		]
		genre = [
			pop
		]
	}
	{
		desc_id = f_pop_legs_hayleypants
		frontend_desc = qs(0xb3f761cf)
		mesh = `models/car/female/f_pop_legs_hayleypants`
		materials = [
			f_pop_hayleypants_primary
		]
		genre = [
			pop
		]
	}
	{
		desc_id = f_bmtl_legs_skirt01
		frontend_desc = qs(0xe8030f46)
		mesh = `models/car/female/f_bmtl_legs_skirt01`
		cloth = `models/car/female/f_bmtl_legs_skirt01`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
		]
		materials = [
			f_bmtl_legs_skirt01_primary
		]
		genre = [
			`black metal`
		]
	}
	{
		desc_id = f_bmtl_legs_stichbelt
		frontend_desc = qs(0xe7f2bb29)
		mesh = `models/car/female/f_bmtl_legs_stichbelt`
		genre = [
			`black metal`
		]
		cloth = `models/car/female/f_bmtl_legs_stichbelt`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
		]
		swatch_list = [
			f_bmtl_legs_stichbelt02
			f_bmtl_legs_stichbelt03
			f_bmtl_legs_stichbelt04
		]
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichbelt01`
	}
	{
		desc_id = f_bmtl_legs_stichbelt02
		frontend_desc = qs(0x9a6ddd54)
		mesh = `models/car/female/f_bmtl_legs_stichbelt02`
		genre = [
			`black metal`
		]
		cloth = `models/car/female/f_bmtl_legs_stichbelt02`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
		]
		swatch_for = f_bmtl_legs_stichbelt
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichbelt02`
	}
	{
		desc_id = f_bmtl_legs_stichbelt03
		frontend_desc = qs(0x861fb9bb)
		mesh = `models/car/female/f_bmtl_legs_stichbelt03`
		genre = [
			`black metal`
		]
		cloth = `models/car/female/f_bmtl_legs_stichbelt03`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
		]
		swatch_for = f_bmtl_legs_stichbelt
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichbelt03`
	}
	{
		desc_id = f_bmtl_legs_stichbelt04
		frontend_desc = qs(0x2350bc74)
		mesh = `models/car/female/f_bmtl_legs_stichbelt04`
		genre = [
			`black metal`
		]
		cloth = `models/car/female/f_bmtl_legs_stichbelt04`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
		]
		swatch_for = f_bmtl_legs_stichbelt
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichbelt04`
	}
	{
		desc_id = f_bmtl_legs_fish
		frontend_desc = qs(0x3f80f1b4)
		mesh = `models/car/female/f_bmtl_legs_fish`
		cloth = `models/car/female/f_bmtl_legs_fish`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_l
			bone_thigh_r
		]
		genre = [
			`black metal`
		]
	}
	{
		desc_id = f_bmtl_legs_stichpants
		frontend_desc = qs(0x9fb0c41b)
		mesh = `models/car/female/f_bmtl_legs_stichpants`
		genre = [
			`black metal`
		]
		swatch_list = [
			f_bmtl_legs_stichpants02
			f_bmtl_legs_stichpants03
			f_bmtl_legs_stichpants04
		]
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichpants01`
	}
	{
		desc_id = f_bmtl_legs_stichpants02
		frontend_desc = qs(0xcf466e6f)
		mesh = `models/car/female/f_bmtl_legs_stichpants02`
		genre = [
			`black metal`
		]
		swatch_for = f_bmtl_legs_stichpants
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichpants02`
	}
	{
		desc_id = f_bmtl_legs_stichpants03
		frontend_desc = qs(0xd30d277d)
		mesh = `models/car/female/f_bmtl_legs_stichpants03`
		genre = [
			`black metal`
		]
		swatch_for = f_bmtl_legs_stichpants
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichpants03`
	}
	{
		desc_id = f_bmtl_legs_stichpants04
		frontend_desc = qs(0xbf3376f7)
		mesh = `models/car/female/f_bmtl_legs_stichpants04`
		genre = [
			`black metal`
		]
		swatch_for = f_bmtl_legs_stichpants
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichpants04`
	}
	{
		desc_id = f_bmtl_legs_ringskirt
		frontend_desc = qs(0x9c907229)
		mesh = `models/car/female/f_bmtl_legs_ringskirt`
		materials = [
			f_bmtl_legs_ringskirt_primary
		]
		cloth = `models/car/female/f_bmtl_legs_ringskirt`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_thigh_r
			bone_thigh_l
		]
		genre = [
			`black metal`
		]
	}
	{
		desc_id = f_pandband01_legs
		frontend_desc = qs(0xe30acab0)
		mesh = `models/car/female/f_pandband01_legs`
		cloth = `models/car/female/f_pandband01_legs`
		cloth_coll_skeleton = cloth_coll_data_female
		cloth_coll_bones = [
			bone_pelvis
			bone_thigh_r
			bone_thigh_l
		]
		genre = [
			goth
		]
		locked
	}
]
