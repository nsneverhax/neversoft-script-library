cas_female_legs = [
	{
		desc_id = f_punk_legs_plaid
		frontend_desc = qs(0x2757cbc4)
		mesh = `models/car/female/f_punk_legs_plaid`
		materials = [
			f_punk_legs_plaid_primary
		]
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_f_punk_legs_plaid`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_legs_plaid`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_punk_legs_cheerskirt
		frontend_desc = qs(0xb43d686f)
		mesh = `models/car/female/f_punk_legs_cheerskirt`
		materials = [
			f_punk_legs_cheerskirt_primary
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_legs_skirt
		frontend_desc = qs(0x8936b5d5)
		mesh = `models/car/female/f_punk_legs_skirt`
		material_groups = [
			{
				materials = [
					f_punk_legs_skirt_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc1a17d69)
			}
			{
				materials = [
					f_punk_legs_skirt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x38e7dd6d)
			}
		]
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_f_punk_legs_skirt`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_legs_skirt`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_punk_legs_shorts
		frontend_desc = qs(0x40da1730)
		mesh = `models/car/female/f_punk_legs_shorts`
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_f_punk_legs_shorts`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_legs_shorts`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		acc_skeleton = `skeletons/skel_f_punk_legs_shorts`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_legs_shorts`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		acc_skeleton = `skeletons/skel_f_punk_legs_shorts`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_legs_shorts`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		acc_skeleton = `skeletons/skel_f_punk_legs_shorts`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_legs_shorts`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		acc_skeleton = `skeletons/skel_f_punk_legs_judynails1`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_legs_judynails1`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
		]
		locked
	}
	{
		desc_id = f_punk_legs_judy02
		frontend_desc = qs(0x69672169)
		mesh = `models/car/female/f_punk_legs_judy02`
		genre = [
			punk
		]
		materials = [
			f_punk_legs_judy02_primary
		]
		acc_skeleton = `skeletons/skel_f_punk_legs_judy02`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_legs_judy02`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		locked
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
		acc_skeleton = 0xf7d2f0af
		acc_ragdoll = 0xa70062a5
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
		]
		locked
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
	}
	{
		desc_id = f_punk_legs_judynails4
		frontend_desc = qs(0xfcb19ae6)
		mesh = `models/car/female/f_punk_legs_judynails4`
		materials = [
			f_punk_legs_judynails4_primary
		]
		genre = [
			punk
		]
		acc_skeleton = 0x1eb1559a
		acc_ragdoll = 0x4e63c790
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
		]
		locked
	}
	{
		desc_id = 0xc5dbd295
		frontend_desc = qs(0xfc194d5a)
		mesh = 0x7309b398
		material_groups = [
			{
				materials = [
					0x041ff72c
				]
				shader = $cas_shader_skin
				name = qs(0xc1767ec0)
			}
			{
				materials = [
					0x6d644d0a
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
			{
				materials = [
					0xc767aca1
				]
				shader = $cas_shader_skin
				name = qs(0xc77f68b4)
			}
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_rock_legs_daisy
		frontend_desc = qs(0xd839943f)
		mesh = `models/car/female/f_rock_legs_daisy`
		material_groups = [
			{
				materials = [
					f_rock_legs_daisy_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc1767ec0)
			}
			{
				materials = [
					f_rock_legs_daisy_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/skel_f_rock_legs_shorts01`
		acc_ragdoll = `ragdolls/car/female/rock/ragdoll_f_rock_legs_shorts01`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		acc_skeleton = `skeletons/skel_f_rock_legs_jeans`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_legs_jeans`
		acc_bones = [
			bone_acc_legs_01
		]
	}
	{
		desc_id = f_rock_legs_ecchaps
		frontend_desc = qs(0x1d6d083a)
		mesh = `models/car/female/f_rock_legs_ecchaps`
		material_groups = [
			{
				materials = [
					f_rock_legs_ecchaps_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_rock_legs_ecchaps_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		genre = [
			rock
		]
		locked
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
		material_groups = [
			{
				materials = [
					f_rock_legs_metalstud_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_rock_legs_metalstud_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		genre = [
			rock
		]
		locked
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
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_rock_legs_cbotstud_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/skel_f_rock_legs_cbotstud`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_legs_cbotstud`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
		]
		locked
	}
	{
		desc_id = f_rock_legs_cgun
		frontend_desc = qs(0x9bef95e1)
		mesh = `models/car/female/f_rock_legs_cgun`
		material_groups = [
			{
				materials = [
					f_rock_legs_cgun_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_rock_legs_cgun_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
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
		acc_skeleton = `skeletons/skel_f_rock_legs_ripjeans`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_legs_ripjeans`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_glam_legs_flamespandex_secondary
				]
				name = qs(0x4ff14afd)
			}
		]
		random_weight = 0.0
	}
	{
		desc_id = f_glam_legs_blingskirt
		frontend_desc = qs(0xd5666752)
		mesh = `models/car/female/f_glam_legs_blingskirt`
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_legs_blingskirt_primary
		]
		acc_skeleton = `skeletons/skel_f_glam_legs_blingskirt`
		acc_ragdoll = `ragdolls/car/female/glam/rag_f_glam_legs_blingskirt`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		random_weight = 0.0
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
		random_weight = 0.0
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
		acc_skeleton = `skeletons/skel_f_goth_legs_strapj`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_legs_strapj`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		acc_skeleton = `skeletons/skel_f_goth_legs_frillydress`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_legs_frillydress`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		random_weight = 0.6
	}
	{
		desc_id = f_goth_legs_halfstrap
		frontend_desc = qs(0xea50f22c)
		mesh = `models/car/female/f_goth_legs_halfstrap`
		material_groups = [
			{
				materials = [
					f_goth_legs_halfstrap_primary
				]
				shader = $cas_shader_skin
				name = qs(0xe50c0ad1)
			}
			{
				materials = [
					f_goth_legs_halfstrap_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x3333c09e)
			}
		]
		acc_skeleton = `skeletons/skel_f_goth_legs_halfstrap`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_legs_halfstrap`
		acc_bones = [
			bone_acc_legs_01
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_legs_cyberstrap
		frontend_desc = qs(0x7eed61a5)
		mesh = `models/car/female/f_goth_legs_cyberstrap`
		material_groups = [
			{
				materials = [
					f_goth_legs_cyberstrap_primary
				]
				shader = $cas_shader_skin
				name = qs(0x4ff14afd)
			}
			{
				materials = [
					f_goth_legs_cyberstrap_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x58cf8c6c)
			}
		]
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_f_goth_legs_cyberstrap`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_legs_cyberstrap`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_goth_legs_lace
		frontend_desc = qs(0x3b3da64c)
		mesh = `models/car/female/f_goth_legs_lace`
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_f_goth_legs_lace`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_legs_lace`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_goth_legs_pndrcapris
		frontend_desc = qs(0xd3c7f4ab)
		mesh = `models/car/female/f_goth_legs_pndrcapris`
		material_groups = [
			{
				materials = [
					f_goth_legs_pndrcapris_primary
				]
				shader = $cas_shader_skin
				name = qs(0x38ab9fd4)
			}
			{
				materials = [
					f_goth_legs_pndrcapris_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x8f4f26f2)
			}
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_legs_pndrrose
		frontend_desc = qs(0x015de8ec)
		mesh = `models/car/female/f_goth_legs_pndrrose`
		locked
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
		acc_skeleton = `skeletons/skel_f_goth_legs_pndrrose`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_legs_pndrrose`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		genre = [
			goth
		]
	}
	{
		desc_id = 0x2e5f00da
		frontend_desc = qs(0xcd108fa1)
		mesh = 0x32bc7a21
		material_groups = [
			{
				materials = [
					0x12db9501
				]
				shader = $cas_shader_skin
				name = qs(0x66499c58)
			}
			{
				materials = [
					0xeef20155
				]
				shader = $cas_shader_skin
				name = qs(0x87257fd9)
			}
			{
				materials = [
					0x58659c37
					0xc16ccd8d
				]
				shader = $cas_shader_skin
				name = qs(0x6cb8681a)
			}
		]
		acc_skeleton = 0xa5c086e5
		acc_ragdoll = 0x99a8f91b
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_metl_legs_bandana
		frontend_desc = qs(0xb7e9218c)
		mesh = `models/car/female/f_metl_legs_bandana`
		material_groups = [
			{
				materials = [
					f_metl_legs_bandana_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_metl_legs_bandana_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x55a35727)
			}
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
		material_groups = [
			{
				materials = [
					f_metl_legs_studs01_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_metl_legs_studs01_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd8d7273a)
			}
		]
		acc_skeleton = `skeletons/skel_f_metl_legs_studs01`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_legs_studs01`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_metl_legs_blackwidow
		frontend_desc = qs(0x032bf260)
		mesh = `models/car/female/f_metl_legs_blackwidow`
		material_groups = [
			{
				materials = [
					f_metl_legs_blackwidow_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_metl_legs_blackwidow_belt
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_legs_patch
		frontend_desc = qs(0x1800e345)
		mesh = `models/car/female/f_metl_legs_patch`
		material_groups = [
			{
				materials = [
					f_metl_legs_patch_primary
				]
				shader = $cas_shader_skin
				name = qs(0x32c35b4d)
			}
			{
				materials = [
					f_metl_legs_patch_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_metl_legs_patch_belt
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_legs_pencilskirt
		frontend_desc = qs(0xf2f1fe2b)
		mesh = `models/car/female/f_metl_legs_pencilskirt`
		material_groups = [
			{
				materials = [
					f_metl_legs_pencilskirt_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc1a17d69)
			}
			{
				materials = [
					f_metl_legs_pencilskirt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xedade552)
			}
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
		material_groups = [
			{
				materials = [
					f_metl_legs_zipskrt_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc1a17d69)
			}
			{
				materials = [
					f_metl_legs_zipskrt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		acc_skeleton = `skeletons/skel_f_metl_legs_zipskrt`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_legs_zipskrt`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_metl_legs_strapped
		frontend_desc = qs(0x1e4b5eee)
		mesh = `models/car/female/f_metl_legs_strapped`
		material_groups = [
			{
				materials = [
					f_metl_legs_strapped_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc1a17d69)
			}
			{
				materials = [
					f_metl_legs_strapped_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x4ff14afd)
			}
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
		material_groups = [
			{
				materials = [
					f_metl_legs_cargo_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_metl_legs_cargo_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		genre = [
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_f_metl_legs_cargo`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_legs_cargo`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_metl_legs_jeansrip
		frontend_desc = qs(0x810ebed9)
		mesh = `models/car/female/f_metl_legs_jeansrip`
		material_groups = [
			{
				materials = [
					f_metl_legs_jeansrip_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_metl_legs_jeansrip_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		genre = [
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_f_metl_legs_jeansrip`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_legs_jeansrip`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		material_groups = [
			{
				materials = [
					f_clsc_legs_plaid_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_clsc_legs_plaid_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
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
		materials = [
			f_clsc_legs_flrbell_primary
		]
		acc_skeleton = `skeletons/skel_f_clsc_legs_flrbell`
		acc_ragdoll = `ragdolls/car/female/clsc/rag_f_clsc_legs_flrbell`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
		]
	}
	{
		desc_id = f_clsc_legs_vlvttie
		frontend_desc = qs(0x20caefd5)
		mesh = `models/car/female/f_clsc_legs_vlvttie`
		genre = [
			`classic rock`
		]
		material_groups = [
			{
				materials = [
					f_clsc_legs_vlvttie_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_clsc_legs_vlvttie_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xae032c82)
			}
		]
		acc_skeleton = `skeletons/skel_f_clsc_legs_vlvttie`
		acc_ragdoll = `ragdolls/car/female/clsc/rag_f_clsc_legs_vlvttie`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
		]
	}
	{
		desc_id = f_clsc_legs_skrt
		frontend_desc = qs(0x208e050e)
		mesh = `models/car/female/f_clsc_legs_skrt`
		genre = [
			`classic rock`
		]
		material_groups = [
			{
				materials = [
					f_clsc_legs_skrt_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc1a17d69)
			}
			{
				materials = [
					f_clsc_legs_skrt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		acc_skeleton = `skeletons/skel_f_clsc_legs_skrt`
		acc_ragdoll = `ragdolls/car/female/clsc/rag_f_clsc_legs_skrt`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		material_groups = [
			{
				materials = [
					f_pop_caprispants_primary
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_pop_caprispants_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc358c93f)
			}
		]
		acc_skeleton = `skeletons/skel_f_pop_legs_baggypants`
		acc_ragdoll = `ragdolls/car/female/pop/rag_f_pop_legs_baggypants`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_pop_legs_skirt
		frontend_desc = qs(0x5cf71640)
		mesh = 0x63421ea1
		genre = [
			pop
		]
		material_groups = [
			{
				materials = [
					skin_f_legs_skirt_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc358c93f)
			}
			{
				materials = [
					skin_f_legs_skirt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc1a17d69)
			}
		]
		acc_skeleton = 0xcb23e29d
		acc_ragdoll = 0x4f007279
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		random_weight = 0.0
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
		acc_skeleton = `skeletons/skel_f_pop_legs_plaidpants`
		acc_ragdoll = `ragdolls/car/female/pop/rag_f_pop_legs_plaidpants`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
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
		acc_skeleton = `skeletons/skel_f_pop_legs_capris`
		acc_ragdoll = `ragdolls/car/female/pop/rag_f_pop_legs_capris`
		acc_bones = [
			bone_acc_legs_01
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
		desc_id = f_pop_legs_midori01
		frontend_desc = qs(0x17b20e86)
		mesh = 0xa29cc330
		material_groups = [
			{
				materials = [
					0x93e55d23
				]
				shader = $cas_shader_skin
				name = qs(0xe50c0ad1)
			}
			{
				materials = [
					0x0aec0c99
				]
				shader = $cas_shader_skin
				name = qs(0x3333c09e)
			}
			{
				materials = [
					0x7deb3c0f
				]
				shader = $cas_shader_skin
				name = qs(0xd146e2ed)
			}
		]
		genre = [
			pop
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_pop_legs_midori02
		frontend_desc = qs(0x4d7e8557)
		mesh = 0x3b95928a
		material_groups = [
			{
				materials = [
					f_pop_legs_midori02_01
				]
				shader = $cas_shader_skin
				name = qs(0x0fc13be6)
			}
			{
				materials = [
					f_pop_legs_midori02_02
				]
				shader = $cas_shader_skin
				name = qs(0xc1a17d69)
			}
		]
		genre = [
			pop
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_pop_legs_midori03
		frontend_desc = qs(0xced8c151)
		mesh = 0x4c92a21c
		material_groups = [
			{
				materials = [
					0x39ec95a8
				]
				shader = $cas_shader_skin
				name = qs(0xc1a17d69)
			}
			{
				materials = [
					0xd7e2f484
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		genre = [
			pop
		]
	}
	{
		desc_id = f_pop_legs_midori04
		frontend_desc = qs(0xa4e16a6f)
		mesh = 0xd2f637bf
		material_groups = [
			{
				materials = [
					f_pop_legs_midori04_01
				]
				shader = $cas_shader_skin
				name = qs(0x78beb957)
			}
			{
				materials = [
					f_pop_legs_midori04_03
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
			{
				materials = [
					f_pop_legs_midori04_04
				]
				shader = $cas_shader_skin
				name = qs(0xbbee58bc)
			}
		]
		genre = [
			pop
		]
	}
	{
		desc_id = f_bmtl_legs_skirt01
		frontend_desc = qs(0xe8030f46)
		mesh = `models/car/female/f_bmtl_legs_skirt01`
		materials = [
			f_bmtl_legs_skirt01_primary
		]
		genre = [
			`black metal`
		]
		random_weight = 0.25
	}
	{
		desc_id = f_bmtl_legs_stichbelt
		frontend_desc = qs(0xe7f2bb29)
		mesh = `models/car/female/f_bmtl_legs_stichbelt`
		genre = [
			`black metal`
		]
		acc_skeleton = `skeletons/skel_f_bmtl_legs_stichbelt`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_legs_stichbelt`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		swatch_list = [
			f_bmtl_legs_stichbelt02
			f_bmtl_legs_stichbelt03
			f_bmtl_legs_stichbelt04
		]
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichbelt01`
		random_weight = 0.7
	}
	{
		desc_id = f_bmtl_legs_stichbelt02
		frontend_desc = qs(0x9a6ddd54)
		mesh = `models/car/female/f_bmtl_legs_stichbelt02`
		genre = [
			`black metal`
		]
		acc_skeleton = `skeletons/skel_f_bmtl_legs_stichbelt`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_legs_stichbelt`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
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
		acc_skeleton = `skeletons/skel_f_bmtl_legs_stichbelt`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_legs_stichbelt`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		swatch_for = f_bmtl_legs_stichbelt
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichbelt03`
	}
	{
		desc_id = f_bmtl_legs_stichbelt04
		frontend_desc = qs(0x49db940f)
		mesh = `models/car/female/f_bmtl_legs_stichbelt04`
		genre = [
			`black metal`
		]
		acc_skeleton = `skeletons/skel_f_bmtl_legs_stichbelt`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_legs_stichbelt`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		swatch_for = f_bmtl_legs_stichbelt
		swatch_texture = `tex/models/characters/car/female/bmtl/swatch_stichbelt04`
	}
	{
		desc_id = f_bmtl_legs_fish
		frontend_desc = qs(0x3f80f1b4)
		mesh = `models/car/female/f_bmtl_legs_fish`
		genre = [
			`black metal`
		]
		acc_skeleton = `skeletons/skel_f_bmtl_legs_fish`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_legs_fish`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		random_weight = 0.5
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
		genre = [
			`black metal`
		]
		acc_skeleton = `skeletons/skel_f_bmtl_legs_ringskirt`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_legs_ringskirt`
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
]
