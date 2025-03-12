cas_female_torso = [
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
			`heavy metal`
		]
		random_weight = 0.0
		hidden
	}
	{
		desc_id = f_torso_tshirt
		frontend_desc = qs(0xd5e5d250)
		mesh = `models/car/female/f_torso_tshirt`
		random_weight = 0.5
		genre = [
			rock
			`heavy metal`
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
		material_groups = [
			{
				materials = [
					f_torso_layered_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_torso_layered_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1c9f493b)
			}
		]
	}
	{
		desc_id = f_torso_hoodie
		frontend_desc = qs(0xd8020207)
		mesh = `models/car/female/f_torso_hoodie`
		genre = [
			rock
		]
		material_groups = [
			{
				materials = [
					f_torso_hoodie_primary
				]
				shader = $cas_shader_skin
				name = qs(0x001541ab)
			}
			{
				materials = [
					f_torso_hoodie_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/skel_f_torso_hoodie`
		acc_ragdoll = `ragdolls/car/female/pop/rag_f_torso_hoodie`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_punk_torso_tanktop
		frontend_desc = qs(0x0a2e1e2f)
		mesh = `models/car/female/f_punk_torso_tanktop`
		material_groups = [
			{
				materials = [
					f_punk_torso_tanktop_primary
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
			{
				materials = [
					f_punk_torso_tanktop_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x233cd0bb)
			}
		]
		acc_skeleton = `skeletons/skel_f_rock_torso_flower`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_torso_flower`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
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
		materials = [
			f_punk_torso_zipup_primary
		]
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_f_punk_torso_zipup`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_torso_zipup`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_punk_torso_leather
		frontend_desc = qs(0x109a2f9f)
		mesh = `models/car/female/f_punk_torso_leather`
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_f_punk_torso_leather`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_torso_leather`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_list = [
			f_punk_torso_leather_02
			f_punk_torso_leather_03
			f_punk_torso_leather_04
		]
		swatch_texture = `tex/models/characters/car/female/punk/swatch_leather_01`
		random_weight = 0.0
	}
	{
		desc_id = f_punk_torso_leather_02
		frontend_desc = qs(0x84a703f5)
		mesh = `models/car/female/f_punk_torso_leather_02`
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_f_punk_torso_leather`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_torso_leather`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = f_punk_torso_leather
		swatch_texture = `tex/models/characters/car/female/punk/swatch_leather_02`
	}
	{
		desc_id = f_punk_torso_leather_03
		frontend_desc = qs(0xc4af30cb)
		mesh = `models/car/female/f_punk_torso_leather_03`
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_f_punk_torso_leather`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_torso_leather`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = f_punk_torso_leather
		swatch_texture = `tex/models/characters/car/female/punk/swatch_leather_03`
	}
	{
		desc_id = f_punk_torso_leather_04
		frontend_desc = qs(0x4c8150a2)
		mesh = `models/car/female/f_punk_torso_leather_04`
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_f_punk_torso_leather`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_torso_leather`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = f_punk_torso_leather
		swatch_texture = `tex/models/characters/car/female/punk/swatch_leather_04`
	}
	{
		desc_id = f_punk_torso_judy01
		frontend_desc = qs(0x3d6a656c)
		mesh = `models/car/female/f_punk_torso_judy01`
		material_groups = [
			{
				materials = [
					f_punk_torso_judy01_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_punk_torso_judy01_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x0ba43538)
			}
		]
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_f_punk_torso_judynails1`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_torso_judynails1`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_punk_torso_stripe
		frontend_desc = qs(0xf22a6cdc)
		mesh = `models/car/female/f_punk_torso_stripe`
		material_groups = [
			{
				materials = [
					f_punk_torso_stripe_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_punk_torso_stripe_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd5145808)
			}
		]
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_f_punk_torso_stripe`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_torso_stripe`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
	}
	{
		desc_id = f_punk_torso_judy02
		frontend_desc = qs(0x938ea10f)
		mesh = `models/car/female/f_punk_torso_judy02`
		material_groups = [
			{
				materials = [
					f_punk_torso_judy02_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			punk
		]
		random_weight = 0.2
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
		material_groups = [
			{
				materials = [
					f_punk_torso_judynails2_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_punk_torso_judynails2_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd08b7252)
			}
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
		desc_id = 0x8da0f98c
		frontend_desc = qs(0xda6937d6)
		mesh = 0xf3a75750
		material_groups = [
			{
				materials = [
					0xa3375ec0
				]
				shader = $cas_shader_skin_masked2
				name = qs(0xbd6b03c4)
			}
			{
				materials = [
					0xa3375ec0
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xbc6d3766)
			}
			{
				materials = [
					0x30a54d8e
				]
				name = qs(0x878633d6)
			}
		]
		genre = [
			punk
		]
		acc_skeleton = 0x078116b8
		acc_ragdoll = 0x2d0b2d3c
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = 0xbec79819
		frontend_desc = qs(0x39e6e30c)
		mesh = 0x31dc0148
		material_groups = [
			{
				materials = [
					0x1ae65eb0
				]
				shader = $cas_shader_skin
				name = qs(0x7bcfa2db)
			}
			{
				materials = [
					0x1f9a8da9
				]
				shader = $cas_shader_skin
				name = qs(0x07ae8700)
			}
			{
				materials = [
					0x9f82701f
				]
				shader = $cas_shader_skin
				name = qs(0x9aa16676)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = 0x9ff94d43
		acc_ragdoll = 0xaf232cd3
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
	}
	{
		desc_id = f_rock_torso_jjacket
		frontend_desc = qs(0x35cb3bb6)
		mesh = `models/car/female/f_rock_torso_jjacket`
		material_groups = [
			{
				materials = [
					f_rock_torso_jjacket_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					f_rock_torso_jjacket_secondary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x0ba43538)
			}
			{
				materials = [
					f_rock_torso_jjacket_tertiary
				]
				name = qs(0x7bee49df)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/skel_f_rock_torso_jeanjacket01`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_torso_jeanjacket01`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_rock_torso_metalstud
		frontend_desc = qs(0x04d5ee56)
		mesh = `models/car/female/f_rock_torso_metalstud`
		material_groups = [
			{
				materials = [
					f_rock_torso_metalstud_primary
				]
				shader = $cas_shader_skin
				name = qs(0x91b94d01)
			}
			{
				materials = [
					f_rock_torso_metalstud_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x58cf8c6c)
			}
		]
		genre = [
			rock
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_f_rock_torso_metalstud`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_torso_metalstud`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		locked
	}
	{
		desc_id = f_rock_torso_ctank
		frontend_desc = qs(0x3cabc341)
		mesh = `models/car/female/f_rock_torso_ctank`
		material_groups = [
			{
				materials = [
					f_rock_torso_ctank_primary
				]
				shader = $cas_shader_skin
				name = qs(0xedade552)
			}
			{
				materials = [
					f_rock_torso_ctank_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x233cd0bb)
			}
		]
		genre = [
			rock
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_f_rock_torso_ctank`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_torso_ctank`
		acc_bones = [
			bone_acc_torso_01
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
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					f_rock_torso_cjean_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_torso_raglan
		frontend_desc = qs(0x33233a56)
		mesh = `models/car/female/f_rock_torso_raglan`
		material_groups = [
			{
				materials = [
					f_rock_torso_raglan_primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					f_rock_torso_raglan_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		genre = [
			rock
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_f_rock_torso_raglan`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_torso_raglan`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
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
		material_groups = [
			{
				materials = [
					f_rock_torso_ljacket_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					f_rock_torso_ljacket_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/skel_f_rock_torso_ljacket`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_torso_ljacket`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_rock_torso_tie
		frontend_desc = qs(0x41fa4b23)
		mesh = `models/car/female/f_rock_torso_tie`
		material_groups = [
			{
				materials = [
					f_rock_torso_tie_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_rock_torso_tie_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/skel_f_rock_torso_tie`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_torso_tie`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
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
			`glam rock`
		]
		materials = [
			f_glam_torso_lacebratop_primary
		]
		random_weight = 0.2
	}
	{
		desc_id = f_glam_torso_pinkshirt
		frontend_desc = qs(0xcc867476)
		mesh = 0x26163ab0
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_torso_pinkshirt_primary
		]
		acc_skeleton = 0x3d8b01b1
		acc_ragdoll = 0x866c87c6
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
		random_weight = 0
	}
	{
		desc_id = f_glam_torso_denimjakcet
		frontend_desc = qs(0x0331630e)
		mesh = `models/car/female/f_glam_torso_denimjakcet`
		genre = [
			`glam rock`
		]
		material_groups = [
			{
				materials = [
					f_glam_torso_denimjakcet_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					f_glam_torso_denimjakcet_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/skel_f_glam_torso_denimjakcet`
		acc_ragdoll = `ragdolls/car/female/glam/rag_f_glam_torso_denimjakcet`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 0.0
	}
	{
		desc_id = f_glam_torso_lightning
		frontend_desc = qs(0xa6fdea62)
		mesh = `models/car/female/f_glam_torso_lightning`
		genre = [
			`glam rock`
		]
		material_groups = [
			{
				materials = [
					f_glam_torso_lightning_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_glam_torso_lightning_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd146e2ed)
			}
		]
		acc_skeleton = `skeletons/skel_f_glam_torso_lightning`
		acc_ragdoll = `ragdolls/car/female/glam/rag_f_glam_torso_lightning`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
	}
	{
		desc_id = f_goth_torso_corsetop
		frontend_desc = qs(0xf82dbdc1)
		mesh = `models/car/female/f_goth_torso_corsetop`
		material_groups = [
			{
				materials = [
					f_goth_torso_corsetop_primary
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
			{
				materials = [
					f_goth_torso_corsetop_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_f_goth_torso_corsetop`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_torso_corsetop`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
	}
	{
		desc_id = f_goth_torso_frillybodice
		frontend_desc = qs(0x8dc40542)
		mesh = `models/car/female/f_goth_torso_frillybodice`
		material_groups = [
			{
				materials = [
					f_goth_torso_frillybodice_shirt
				]
				shader = $cas_shader_skin
				name = qs(0x4e432dd1)
			}
			{
				materials = [
					f_goth_torso_frillybodice_lining
				]
				shader = $cas_shader_skin
				name = qs(0xf86af33e)
			}
			{
				materials = [
					f_goth_torso_frillybodice_corset
				]
				shader = $cas_shader_skin
				name = qs(0x840bd6e5)
			}
			{
				materials = [
					f_goth_torso_frillybodice_ribbon
				]
				shader = $cas_shader_skin
				name = qs(0x8dc5707b)
			}
		]
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_f_goth_torso_frillybodice`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_torso_frillybodice`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 0.6
	}
	{
		desc_id = f_goth_torso_halfstrap
		frontend_desc = qs(0x03c9d10d)
		mesh = `models/car/female/f_goth_torso_halfstrap`
		acc_skeleton = `skeletons/skel_f_goth_torso_halfstrap`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_torso_halfstrap`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
		material_groups = [
			{
				materials = [
					f_goth_torso_halfstrap_primary
				]
				name = qs(0xa948cbf1)
			}
			{
				materials = [
					f_goth_torso_halfstrap_secondary
				]
				name = qs(0xa51865aa)
			}
			{
				materials = [
					f_goth_torso_halfstrap_glove
				]
				name = qs(0xf4432fa3)
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
		material_groups = [
			{
				materials = [
					f_goth_torso_cyberstrap_primary
				]
				shader = $cas_shader_skin
				name = qs(0x3fab7478)
			}
			{
				materials = [
					f_goth_torso_cyberstrap_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x58cf8c6c)
			}
		]
		acc_skeleton = `skeletons/skel_f_goth_torso_cyberstrap`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_torso_cyberstrap`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_torso_dress
		frontend_desc = qs(0x2c481737)
		mesh = `models/car/female/f_goth_torso_dress`
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_f_goth_torso_dress`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_torso_dress`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_goth_torso_pndrband
		frontend_desc = qs(0x171c04a5)
		mesh = `models/car/female/f_goth_torso_pndrband`
		material_groups = [
			{
				materials = [
					f_goth_torso_pndrband_1st
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
			{
				materials = [
					f_goth_torso_pndrband_2nd
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					f_goth_torso_pndrband_3rd
				]
				shader = $cas_shader_skin
				name = qs(0xf13523f5)
			}
			{
				materials = [
					f_goth_torso_pndrband_4th
				]
				shader = $cas_shader_skin
				name = qs(0x30ccabdb)
			}
			{
				materials = [
					f_goth_torso_pndrband_5th
				]
				shader = $cas_shader_skin
				name = qs(0xbdfd0b71)
			}
		]
		acc_skeleton = `skeletons/skel_f_goth_torso_pndrband`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_torso_pndrband`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
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
		material_groups = [
			{
				materials = [
					f_goth_torso_pndrmaid_primary1
					f_goth_torso_pndrmaid_primary2
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_goth_torso_pndrmaid_secondary1
					f_goth_torso_pndrmaid_secondary2
				]
				shader = $cas_shader_skin
				name = qs(0x1c2e7bb3)
			}
		]
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_f_goth_torso_pndrmaid`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_torso_pndrmaid`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
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
				name = qs(0x3fab7478)
			}
			{
				materials = [
					f_goth_torso_pndrstraps_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
			{
				materials = [
					f_goth_torso_pndrstraps_tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x42923e18)
			}
		]
		genre = [
			goth
		]
		random_weight = 0.25
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
				name = qs(0x7a282392)
			}
			{
				materials = [
					f_goth_torso_pndrtrench_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
			{
				materials = [
					f_goth_torso_pndrtrench_tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x940d778e)
			}
		]
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_f_goth_torso_pndrtrench`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_torso_pndrtrenchd`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = 0x0cf9e823
		frontend_desc = qs(0x99b3fe7e)
		mesh = 0x268a20cd
		material_groups = [
			{
				materials = [
					0xb6f4fc87
				]
				shader = $cas_shader_skin
				name = qs(0x56bdd5f5)
			}
			{
				materials = [
					0xb067dd61
					0x296e8cdb
				]
				shader = $cas_shader_skin
				name = qs(0x9b26dc03)
			}
		]
		genre = [
			goth
		]
		acc_skeleton = 0xba145a98
		acc_ragdoll = 0xe02dedfc
		acc_bones = [
			bone_acc_torso_01
		]
		random_weight = 0.0
	}
	{
		desc_id = f_metl_torso_bullets01
		frontend_desc = qs(0x154f9f31)
		mesh = `models/car/female/f_metl_torso_bullets01`
		genre = [
			`heavy metal`
		]
		material_groups = [
			{
				materials = [
					f_metl_torso_bullets01_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					f_metl_torso_bullets01_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x0ba43538)
			}
		]
		acc_skeleton = `skeletons/skel_f_metl_torso_bullets01`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_torso_bullets01`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_metl_torso_vest01
		frontend_desc = qs(0x37dfa29e)
		mesh = `models/car/female/f_metl_torso_vest01`
		genre = [
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_f_metl_torso_vest01`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_torso_vest01`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_metl_torso_bramesh
		frontend_desc = qs(0x00921c12)
		mesh = `models/car/female/f_metl_torso_bramesh`
		genre = [
			`heavy metal`
			`black metal`
		]
	}
	{
		desc_id = f_metl_torso_jeanlthr
		frontend_desc = qs(0xa2f0a9b4)
		mesh = `models/car/female/f_metl_torso_jeanlthr`
		material_groups = [
			{
				materials = [
					f_metl_torso_jeanlthr_primary
				]
				shader = $cas_shader_skin
				name = qs(0x2494ed1e)
			}
			{
				materials = [
					f_metl_torso_jeanlthr_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					f_metl_torso_jeanlthr_shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_f_metl_torso_jeanlthr`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_torso_jeanlthr`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_metl_torso_lacetank
		frontend_desc = qs(0x94a5446d)
		mesh = `models/car/female/f_metl_torso_lacetank`
		material_groups = [
			{
				materials = [
					f_metl_torso_lacetank_primary
				]
				shader = $cas_shader_skin
				name = qs(0xdc4bd30d)
			}
			{
				materials = [
					f_metl_torso_lacetank_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6387b943)
			}
		]
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_torso_shldrhoody
		frontend_desc = qs(0x06e5b3d5)
		mesh = `models/car/female/f_metl_torso_shldrhoody`
		material_groups = [
			{
				materials = [
					f_metl_torso_shldrhoody_primary
				]
				shader = $cas_shader_skin
				name = qs(0xaab0cc95)
			}
			{
				materials = [
					f_metl_torso_shldrhoody_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x91b94d01)
			}
		]
		chosen_materials = {
			material1 = purple_blue_1
			material2 = carblack_1
		}
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = f_metl_torso_acid
		frontend_desc = qs(0xfb8add4c)
		mesh = `models/car/female/f_metl_torso_acid`
		material_groups = [
			{
				materials = [
					f_metl_torso_acid_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_metl_torso_acid_sleeves
				]
				shader = $cas_shader_skin
				name = qs(0x1c9f493b)
			}
			{
				materials = [
					f_metl_torso_acid_straps
				]
				shader = $cas_shader_skin
				name = qs(0x58cf8c6c)
			}
			{
				materials = [
					f_metl_torso_acid_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		genre = [
			`heavy metal`
			`black metal`
		]
	}
	{
		desc_id = f_metl_torso_shirtbra
		frontend_desc = qs(0x12585d96)
		mesh = `models/car/female/f_metl_torso_shirtbra`
		material_groups = [
			{
				materials = [
					f_metl_torso_shirtbra_primary
				]
				shader = $cas_shader_skin
				name = qs(0xedade552)
			}
			{
				materials = [
					f_metl_torso_shirtbra_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x0ba43538)
			}
		]
		genre = [
			`heavy metal`
			`black metal`
		]
	}
	{
		desc_id = f_metl_torso_dvest
		frontend_desc = qs(0x94134454)
		mesh = `models/car/female/f_metl_torso_dvest`
		material_groups = [
			{
				materials = [
					f_metl_torso_dvest_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					f_metl_torso_dvest_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			`heavy metal`
			`black metal`
		]
		acc_skeleton = `skeletons/skel_f_metl_torso_dvest`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_torso_dvest`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_clsc_torso_striped
		frontend_desc = qs(0xb3452072)
		mesh = `models/car/female/f_clsc_torso_striped`
		material_groups = [
			{
				materials = [
					f_clsc_torso_striped_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_clsc_torso_striped_secondary
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
		desc_id = f_clsc_torso_pldtie
		frontend_desc = qs(0x89ee7a85)
		mesh = `models/car/female/f_clsc_torso_pldtie`
		genre = [
			`classic rock`
		]
		material_groups = [
			{
				materials = [
					f_clsc_torso_pldtie_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					f_clsc_torso_pldtie_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_clsc_torso_pldtie_tie
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		acc_skeleton = `skeletons/skel_f_clsc_torso_pldtie`
		acc_ragdoll = `ragdolls/car/female/clsc/rag_f_clsc_torso_pldtie`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 0.1
	}
	{
		desc_id = f_clsc_torso_jersey
		frontend_desc = qs(0x50433d5b)
		mesh = `models/car/female/f_clsc_torso_jersey`
		material_groups = [
			{
				materials = [
					f_clsc_torso_jersey_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_clsc_torso_jersey_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x8cff0357)
			}
		]
		genre = [
			`classic rock`
		]
	}
	{
		desc_id = f_clsc_torso_flwr
		frontend_desc = qs(0x9aba2e07)
		mesh = `models/car/female/f_clsc_torso_flwr`
		genre = [
			`classic rock`
		]
		acc_skeleton = `skeletons/skel_f_clsc_torso_flwr`
		acc_ragdoll = `ragdolls/car/female/clsc/rag_f_clsc_torso_flwr`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		material_groups = [
			{
				materials = [
					f_clsc_torso_flwr_primary
				]
				shader = $cas_shader_skin
				name = qs(0x7a282392)
			}
			{
				materials = [
					f_clsc_torso_flwr_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_clsc_torso_flwr_third
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
			{
				materials = [
					f_clsc_torso_flwr_rose
				]
				shader = $cas_shader_skin
				name = qs(0x3b25461b)
			}
		]
	}
	{
		desc_id = f_clsc_torso_dress
		frontend_desc = qs(0x513dd30e)
		mesh = `models/car/female/f_clsc_torso_dress`
		genre = [
			`classic rock`
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
		desc_id = f_pop_torso_midori
		frontend_desc = qs(0xb176386f)
		mesh = 0x73c03f71
		genre = [
			pop
		]
		material_groups = [
			{
				materials = [
					f_pop_torso_midori_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					0x25b9458c
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
			{
				materials = [
					f_pop_torso_midori_shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = 0xc90f0405
		acc_ragdoll = 0x6eec01f4
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
		random_weight = 0.0
	}
	{
		desc_id = f_pop_torso_ruffletop
		frontend_desc = qs(0x821216c3)
		mesh = `models/car/female/f_pop_torso_ruffletop`
		material_groups = [
			{
				materials = [
					f_pop_ruffletop_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_pop_ruffletop_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		genre = [
			pop
		]
		acc_skeleton = `skeletons/skel_f_pop_torso_ruffletop`
		acc_ragdoll = `ragdolls/car/female/pop/rag_f_pop_torso_ruffletop`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_pop_torso_buttontop
		frontend_desc = qs(0x07afb613)
		mesh = `models/car/female/f_pop_torso_buttontop`
		material_groups = [
			{
				materials = [
					f_pop_buttontop_primary
				]
				shader = $cas_shader_skin
				name = qs(0x3fab7478)
			}
			{
				materials = [
					f_pop_buttontop_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x647ddfc6)
			}
		]
		genre = [
			pop
		]
		acc_skeleton = `skeletons/skel_f_pop_torso_buttontop`
		acc_ragdoll = `ragdolls/car/female/pop/rag_f_pop_torso_buttontop`
		acc_bones = [
			bone_acc_torso_01
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
		desc_id = f_pop_torso_midori01
		frontend_desc = qs(0xeee6345f)
		mesh = 0x0eda2083
		material_groups = [
			{
				materials = [
					0xaccb5b68
				]
				shader = $cas_shader_skin
				name = qs(0x7b24e027)
			}
			{
				materials = [
					0x35c20ad2
				]
				shader = $cas_shader_skin
				name = qs(0x0745c5fc)
			}
			{
				materials = [
					0x42c53a44
				]
				shader = $cas_shader_skin
				name = qs(0x2b353295)
			}
			{
				materials = [
					0xdca1afe7
				]
				shader = $cas_shader_skin
				name = qs(0xb1f8de98)
			}
		]
		genre = [
			pop
		]
		price = 0
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_pop_torso_midori02
		frontend_desc = qs(0x870acacb)
		mesh = 0x97d37139
		material_groups = [
			{
				materials = [
					f_pop_torso_midori02_03
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					f_pop_torso_midori02_04
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		acc_skeleton = 0x00af8dfd
		acc_ragdoll = 0xfbf1047f
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			pop
		]
		price = 0
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_pop_torso_midori03
		frontend_desc = qs(0xa0c845e5)
		mesh = 0xe0d441af
		material_groups = [
			{
				materials = [
					f_pop_torso_midori03_01
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_pop_torso_midori03_02
				]
				shader = $cas_shader_skin
				name = qs(0xd5145808)
			}
		]
		genre = [
			pop
		]
		acc_skeleton = 0x77a8bd6b
		acc_ragdoll = 0x8cf634e9
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 0
		random_weight = 0.5
	}
	{
		desc_id = f_pop_torso_midori04
		frontend_desc = qs(0x88842954)
		mesh = 0x7eb0d40c
		material_groups = [
			{
				materials = [
					f_pop_torso_midori04_01
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					f_pop_torso_midori04_02
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					f_pop_torso_midori04_03
				]
				shader = $cas_shader_skin
				name = qs(0xd5145808)
			}
		]
		genre = [
			pop
		]
		price = 0
		random_weight = 0.0
	}
	{
		desc_id = f_bmtl_torso_corset01
		frontend_desc = qs(0xa47f89a5)
		mesh = `models/car/female/f_bmtl_torso_corset01`
		genre = [
			`black metal`
		]
		acc_skeleton = `skeletons/skel_f_bmtl_torso_corset01`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_torso_corset01`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_bmtl_torso_spikeshirt
		frontend_desc = qs(0xe08761c6)
		mesh = `models/car/female/f_bmtl_torso_spikeshirt`
		material_groups = [
			{
				materials = [
					f_bmtl_torso_spikeshirt_primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					f_bmtl_torso_spikeshirt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		genre = [
			`black metal`
		]
		random_weight = 0.1
	}
	{
		desc_id = f_bmtl_torso_fur
		frontend_desc = qs(0x97927568)
		mesh = `models/car/female/f_bmtl_torso_fur`
		genre = [
			`black metal`
		]
		acc_skeleton = `skeletons/skel_f_bmtl_torso_fur`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_torso_fur`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
	}
	{
		desc_id = f_bmtl_torso_spikearmor
		frontend_desc = qs(0x9aa713a4)
		mesh = `models/car/female/f_bmtl_torso_spikearmor`
		genre = [
			`black metal`
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
			`black metal`
		]
		acc_skeleton = `skeletons/skel_f_bmtl_torso_bikini`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_torso_bikini`
		acc_bones = [
			bone_acc_torso_01
		]
	}
]
