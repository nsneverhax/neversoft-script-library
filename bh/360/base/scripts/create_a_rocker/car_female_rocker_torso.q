CAS_Female_Torso = [
	{
		desc_id = F_Fun_Torso_Bra
		frontend_desc = qs(0xfe4372bd)
		mesh = `models/CAR/Female/F_Fun_Torso_Bra`
		materials = [
			F_Fun_Torso_AngelW_Bra
		]
		genre = [
			Goth
			rock
			`Heavy	Metal`
		]
		random_weight = 0.0
		hidden
	}
	{
		desc_id = F_Torso_TShirt
		frontend_desc = qs(0xd5e5d250)
		mesh = `models/CAR/Female/F_Torso_TShirt`
		random_weight = 0.5
		genre = [
			rock
			`Heavy	Metal`
		]
		materials = [
			M_Torso_TShirt_Primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc`
				material = M_Torso_TShirt_Primary
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
		desc_id = F_Torso_Layered
		frontend_desc = qs(0x6df89e70)
		mesh = `models/CAR/Female/F_Torso_Layered`
		genre = [
			rock
		]
		material_groups = [
			{
				materials = [
					F_Torso_Layered_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Torso_Layered_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1c9f493b)
			}
		]
	}
	{
		desc_id = F_Torso_Hoodie
		frontend_desc = qs(0xd8020207)
		mesh = `models/CAR/Female/F_Torso_Hoodie`
		genre = [
			rock
		]
		material_groups = [
			{
				materials = [
					F_Torso_Hoodie_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x001541ab)
			}
			{
				materials = [
					F_Torso_Hoodie_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Torso_Hoodie`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Torso_Hoodie`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Punk_Torso_TankTop
		frontend_desc = qs(0x0a2e1e2f)
		mesh = `models/CAR/Female/F_Punk_Torso_TankTop`
		material_groups = [
			{
				materials = [
					F_Punk_Torso_TankTop_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
			{
				materials = [
					F_Punk_Torso_TankTop_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x233cd0bb)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Rock_Torso_Flower`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Torso_Flower`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
		genre = [
			Punk
		]
		random_weight = 0.5
	}
	{
		desc_id = F_Punk_Torso_Zipup
		frontend_desc = qs(0x0fbdaf71)
		mesh = `models/CAR/Female/F_Punk_Torso_Zipup`
		materials = [
			F_Punk_Torso_Zipup_Primary
		]
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_F_Punk_Torso_Zipup`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Torso_Zipup`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Punk_Torso_Leather
		frontend_desc = qs(0x109a2f9f)
		mesh = `models/CAR/Female/F_Punk_Torso_Leather`
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_F_Punk_Torso_Leather`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Torso_Leather`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_list = [
			F_Punk_Torso_Leather_02
			F_Punk_Torso_Leather_03
			F_Punk_Torso_Leather_04
		]
		swatch_texture = `tex/models/Characters/Car/Female/Punk/Swatch_Leather_01`
		random_weight = 0.0
	}
	{
		desc_id = F_Punk_Torso_Leather_02
		frontend_desc = qs(0x84a703f5)
		mesh = `models/CAR/Female/F_Punk_Torso_Leather_02`
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_F_Punk_Torso_Leather`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Torso_Leather`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = F_Punk_Torso_Leather
		swatch_texture = `tex/models/Characters/Car/Female/Punk/Swatch_Leather_02`
	}
	{
		desc_id = F_Punk_Torso_Leather_03
		frontend_desc = qs(0xc4af30cb)
		mesh = `models/CAR/Female/F_Punk_Torso_Leather_03`
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_F_Punk_Torso_Leather`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Torso_Leather`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = F_Punk_Torso_Leather
		swatch_texture = `tex/models/Characters/Car/Female/Punk/Swatch_Leather_03`
	}
	{
		desc_id = F_Punk_Torso_Leather_04
		frontend_desc = qs(0x4c8150a2)
		mesh = `models/CAR/Female/F_Punk_Torso_Leather_04`
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_F_Punk_Torso_Leather`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Torso_Leather`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = F_Punk_Torso_Leather
		swatch_texture = `tex/models/Characters/Car/Female/Punk/Swatch_Leather_04`
	}
	{
		desc_id = F_Punk_Torso_Judy01
		frontend_desc = qs(0x3d6a656c)
		mesh = `models/CAR/Female/F_Punk_Torso_Judy01`
		material_groups = [
			{
				materials = [
					F_Punk_Torso_Judy01_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Punk_Torso_Judy01_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x0ba43538)
			}
		]
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_F_Punk_Torso_JudyNails1`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Torso_JudyNails1`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Punk_Torso_Stripe
		frontend_desc = qs(0xf22a6cdc)
		mesh = `models/CAR/Female/F_Punk_Torso_Stripe`
		material_groups = [
			{
				materials = [
					F_Punk_Torso_Stripe_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Punk_Torso_Stripe_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd5145808)
			}
		]
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_F_Punk_Torso_Stripe`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Torso_Stripe`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
		]
	}
	{
		desc_id = F_Punk_Torso_Judy02
		frontend_desc = qs(0x938ea10f)
		mesh = `models/CAR/Female/F_Punk_Torso_Judy02`
		material_groups = [
			{
				materials = [
					F_Punk_Torso_Judy02_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			Punk
		]
		random_weight = 0.2
	}
	{
		desc_id = F_Punk_Torso_JudyNails1
		frontend_desc = qs(0xadc4f432)
		mesh = `models/CAR/Female/F_Punk_Torso_JudyNails1`
		genre = [
			Punk
		]
		locked
	}
	{
		desc_id = F_Punk_Torso_JudyNails2
		frontend_desc = qs(0x9e074d13)
		mesh = `models/CAR/Female/F_Punk_Torso_JudyNails2`
		material_groups = [
			{
				materials = [
					F_Punk_Torso_JudyNails2_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Punk_Torso_JudyNails2_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd08b7252)
			}
		]
		genre = [
			Punk
		]
		locked
	}
	{
		desc_id = F_Punk_Torso_JudyNails3
		frontend_desc = qs(0x24142091)
		mesh = `models/CAR/Female/F_Punk_Torso_JudyNails3`
		genre = [
			Punk
		]
	}
	{
		desc_id = F_Punk_Torso_JudyNails4
		frontend_desc = qs(0xbcb3da98)
		mesh = `models/CAR/Female/F_Punk_Torso_JudyNails4`
		material_groups = [
			{
				materials = [
					F_Punk_Torso_JudyNails4_Primary
				]
				shader = $cas_shader_skin_masked1
			}
		]
		genre = [
			Punk
		]
		locked
	}
	{
		desc_id = F_Punk_Torso_Judy5
		frontend_desc = qs(0xda6937d6)
		mesh = `models/CAR/Female/F_Punk_Torso_Judy5`
		material_groups = [
			{
				materials = [
					F_Punk_Torso_Judy5_primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0xbd6b03c4)
			}
			{
				materials = [
					F_Punk_Torso_Judy5_primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xbc6d3766)
			}
			{
				materials = [
					F_Punk_Torso_Judy5_secondary
				]
				name = qs(0x878633d6)
			}
		]
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_F_Punk_Torso_Judy5`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Torso_Judy5`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Rock_Torso_Casey5
		frontend_desc = qs(0x39e6e30c)
		mesh = `models/CAR/Female/F_Rock_Torso_Casey5`
		material_groups = [
			{
				materials = [
					F_Rock_Torso_Casey5_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x7bcfa2db)
			}
			{
				materials = [
					F_Rock_Torso_Casey5_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x07ae8700)
			}
			{
				materials = [
					F_Rock_Torso_Casey5_Straps
				]
				shader = $cas_shader_skin
				name = qs(0x9aa16676)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/Skel_F_Rock_Torso_Casey5`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Torso_Casey5`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
	}
	{
		desc_id = F_Rock_Torso_JJacket
		frontend_desc = qs(0x35cb3bb6)
		mesh = `models/CAR/Female/F_Rock_Torso_JJacket`
		material_groups = [
			{
				materials = [
					F_Rock_Torso_JJacket_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					F_Rock_Torso_JJacket_Secondary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x0ba43538)
			}
			{
				materials = [
					F_Rock_Torso_JJacket_Tertiary
				]
				name = qs(0x7bee49df)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/Skel_F_Rock_Torso_JeanJacket01`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Torso_JeanJacket01`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Rock_Torso_MetalStud
		frontend_desc = qs(0x04d5ee56)
		mesh = `models/CAR/Female/F_Rock_Torso_MetalStud`
		material_groups = [
			{
				materials = [
					F_Rock_Torso_MetalStud_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x91b94d01)
			}
			{
				materials = [
					F_Rock_Torso_MetalStud_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x58cf8c6c)
			}
		]
		genre = [
			rock
			`Heavy	Metal`
		]
		acc_skeleton = `skeletons/Skel_F_Rock_Torso_MetalStud`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Torso_MetalStud`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		locked
	}
	{
		desc_id = F_Rock_Torso_CTank
		frontend_desc = qs(0x3cabc341)
		mesh = `models/CAR/Female/F_Rock_Torso_CTank`
		material_groups = [
			{
				materials = [
					F_Rock_Torso_CTank_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xedade552)
			}
			{
				materials = [
					F_Rock_Torso_CTank_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x233cd0bb)
			}
		]
		genre = [
			rock
			`Heavy	Metal`
		]
		acc_skeleton = `skeletons/Skel_F_Rock_Torso_CTank`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Torso_CTank`
		acc_bones = [
			Bone_ACC_Torso_01
		]
		locked
	}
	{
		desc_id = F_Rock_Torso_CJean
		frontend_desc = qs(0x8af2b01b)
		mesh = `models/CAR/Female/F_Rock_Torso_CJean`
		material_groups = [
			{
				materials = [
					F_Rock_Torso_CJean_Primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					F_Rock_Torso_CJean_Secondary
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
		desc_id = F_Rock_Torso_Raglan
		frontend_desc = qs(0x33233a56)
		mesh = `models/CAR/Female/F_Rock_Torso_Raglan`
		material_groups = [
			{
				materials = [
					F_Rock_Torso_Raglan_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					F_Rock_Torso_Raglan_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		genre = [
			rock
			`Heavy	Metal`
		]
		acc_skeleton = `skeletons/Skel_F_Rock_Torso_Raglan`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Torso_Raglan`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
		]
	}
	{
		desc_id = F_Rock_Torso_Corset
		frontend_desc = qs(0xc231f034)
		mesh = `models/CAR/Female/F_Rock_Torso_Corset`
		materials = [
			F_Rock_Torso_Corset_Primary
		]
		genre = [
			rock
		]
		random_weight = 0.1
	}
	{
		desc_id = F_Rock_Torso_LJacket
		frontend_desc = qs(0x0f400a62)
		mesh = `models/CAR/Female/F_Rock_Torso_LJacket`
		material_groups = [
			{
				materials = [
					F_Rock_Torso_LJacket_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					F_Rock_Torso_LJacket_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/Skel_F_Rock_Torso_LJacket`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Torso_LJacket`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Rock_Torso_Tie
		frontend_desc = qs(0x41fa4b23)
		mesh = `models/CAR/Female/F_Rock_Torso_Tie`
		material_groups = [
			{
				materials = [
					F_Rock_Torso_Tie_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Rock_Torso_Tie_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/Skel_F_Rock_Torso_Tie`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Torso_Tie`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Rock_Torso_ECCorset
		frontend_desc = qs(0xe09f4c8f)
		mesh = `models/CAR/Female/F_Rock_Torso_ECCorset`
		material_groups = [
			{
				materials = [
					F_Rock_Torso_ECCorset_Primary
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
		desc_id = F_Rock_Torso_Bass
		frontend_desc = qs(0xf16d30ec)
		mesh = `models/CAR/Female/F_Rock_Torso_Bass`
		genre = [
			rock
		]
		materials = [
			F_Rock_Torso_Bass_Contest_Primary
		]
	}
	{
		desc_id = F_Glam_Torso_LaceBraTop
		frontend_desc = qs(0xf9b41104)
		mesh = `models/CAR/Female/F_Glam_Torso_LaceBraTop`
		genre = [
			`Glam	Rock`
		]
		materials = [
			F_Glam_Torso_LaceBraTop_Primary
		]
		random_weight = 0.2
	}
	{
		desc_id = F_Glam_Torso_PinkShirt
		frontend_desc = qs(0xcc867476)
		mesh = `models/CAR/Female/F_Glam_Torso_PinkShirt`
		genre = [
			`Glam	Rock`
		]
		materials = [
			F_Glam_Torso_PinkShirt_Primary
		]
		acc_skeleton = `skeletons/Skel_F_Glam_Torso_PinkShirt`
		acc_ragdoll = `Ragdolls/CAR/Female/Glam/Rag_F_Glam_Torso_PinkShirt`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
		]
		random_weight = 0
	}
	{
		desc_id = F_Glam_Torso_DenimJakcet
		frontend_desc = qs(0x0331630e)
		mesh = `models/CAR/Female/F_Glam_Torso_DenimJakcet`
		genre = [
			`Glam	Rock`
		]
		material_groups = [
			{
				materials = [
					F_Glam_Torso_DenimJakcet_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					F_Glam_Torso_DenimJakcet_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Glam_Torso_DenimJakcet`
		acc_ragdoll = `Ragdolls/CAR/Female/Glam/Rag_F_Glam_Torso_DenimJakcet`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Glam_Torso_Lightning
		frontend_desc = qs(0xa6fdea62)
		mesh = `models/CAR/Female/F_Glam_Torso_Lightning`
		genre = [
			`Glam	Rock`
		]
		material_groups = [
			{
				materials = [
					F_Glam_Torso_Lightning_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Glam_Torso_Lightning_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd146e2ed)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Glam_Torso_Lightning`
		acc_ragdoll = `Ragdolls/CAR/Female/Glam/Rag_F_Glam_Torso_Lightning`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
		]
	}
	{
		desc_id = F_Goth_Torso_Corsetop
		frontend_desc = qs(0xf82dbdc1)
		mesh = `models/CAR/Female/F_Goth_Torso_Corsetop`
		material_groups = [
			{
				materials = [
					F_Goth_Torso_Corsetop_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
			{
				materials = [
					F_Goth_Torso_Corsetop_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_F_Goth_Torso_Corsetop`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Torso_Corsetop`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
		]
	}
	{
		desc_id = F_Goth_Torso_Frillybodice
		frontend_desc = qs(0x8dc40542)
		mesh = `models/CAR/Female/F_Goth_Torso_FrillyBodice`
		material_groups = [
			{
				materials = [
					F_Goth_Torso_FrillyBodice_shirt
				]
				shader = $cas_shader_skin
				name = qs(0x4e432dd1)
			}
			{
				materials = [
					F_Goth_Torso_FrillyBodice_lining
				]
				shader = $cas_shader_skin
				name = qs(0xf86af33e)
			}
			{
				materials = [
					F_Goth_Torso_FrillyBodice_corset
				]
				shader = $cas_shader_skin
				name = qs(0x840bd6e5)
			}
			{
				materials = [
					F_Goth_Torso_FrillyBodice_ribbon
				]
				shader = $cas_shader_skin
				name = qs(0x8dc5707b)
			}
		]
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_F_Goth_Torso_FrillyBodice`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Torso_FrillyBodice`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 0.6
	}
	{
		desc_id = F_Goth_Torso_HalfStrap
		frontend_desc = qs(0x03c9d10d)
		mesh = `models/CAR/Female/F_Goth_Torso_HalfStrap`
		acc_skeleton = `skeletons/Skel_F_Goth_Torso_HalfStrap`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Torso_HalfStrap`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
		material_groups = [
			{
				materials = [
					F_Goth_Torso_HalfStrap_Primary
				]
				name = qs(0xa948cbf1)
			}
			{
				materials = [
					F_Goth_Torso_HalfStrap_Secondary
				]
				name = qs(0xa51865aa)
			}
			{
				materials = [
					F_Goth_Torso_HalfStrap_Glove
				]
				name = qs(0xf4432fa3)
			}
		]
		genre = [
			Goth
		]
	}
	{
		desc_id = F_Goth_Torso_CyberStrap
		frontend_desc = qs(0xeb0e0eb6)
		mesh = `models/CAR/Female/F_Goth_Torso_CyberStrap`
		material_groups = [
			{
				materials = [
					F_Goth_Torso_CyberStrap_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x3fab7478)
			}
			{
				materials = [
					F_Goth_Torso_CyberStrap_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x58cf8c6c)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Goth_Torso_CyberStrap`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Torso_CyberStrap`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			Goth
		]
	}
	{
		desc_id = F_Goth_Torso_Dress
		frontend_desc = qs(0x2c481737)
		mesh = `models/CAR/Female/F_Goth_Torso_Dress`
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_F_Goth_Torso_Dress`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Torso_Dress`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Goth_Torso_PndrBand
		frontend_desc = qs(0x171c04a5)
		mesh = `models/CAR/Female/F_Goth_Torso_PndrBand`
		material_groups = [
			{
				materials = [
					F_Goth_Torso_PndrBand_1st
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
			{
				materials = [
					F_Goth_Torso_PndrBand_2nd
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					F_Goth_Torso_PndrBand_3rd
				]
				shader = $cas_shader_skin
				name = qs(0xf13523f5)
			}
			{
				materials = [
					F_Goth_Torso_PndrBand_4th
				]
				shader = $cas_shader_skin
				name = qs(0x30ccabdb)
			}
			{
				materials = [
					F_Goth_Torso_PndrBand_5th
				]
				shader = $cas_shader_skin
				name = qs(0xbdfd0b71)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Goth_Torso_PndrBand`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Torso_PndrBand`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			Goth
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Goth_Torso_PndrMaid
		frontend_desc = qs(0xbd0091e9)
		mesh = `models/CAR/Female/F_Goth_Torso_PndrMaid`
		material_groups = [
			{
				materials = [
					F_Goth_Torso_PndrMaid_Primary1
					F_Goth_Torso_PndrMaid_Primary2
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Goth_Torso_PndrMaid_Secondary1
					F_Goth_Torso_PndrMaid_Secondary2
				]
				shader = $cas_shader_skin
				name = qs(0x1c2e7bb3)
			}
		]
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_F_Goth_Torso_PndrMaid`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Torso_PndrMaid`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Goth_Torso_PndrStraps
		frontend_desc = qs(0x04d0f192)
		mesh = `models/CAR/Female/F_Goth_Torso_PndrStraps`
		locked
		material_groups = [
			{
				materials = [
					F_Goth_Torso_PndrStraps_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x3fab7478)
			}
			{
				materials = [
					F_Goth_Torso_PndrStraps_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
			{
				materials = [
					F_Goth_Torso_PndrStraps_Tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x42923e18)
			}
		]
		genre = [
			Goth
		]
		random_weight = 0.25
	}
	{
		desc_id = F_Goth_Torso_PndrTrench
		frontend_desc = qs(0x061a0536)
		mesh = `models/CAR/Female/F_Goth_Torso_PndrTrench`
		material_groups = [
			{
				materials = [
					F_Goth_Torso_PndrTrench_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x7a282392)
			}
			{
				materials = [
					F_Goth_Torso_PndrTrench_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x4f83211b)
			}
			{
				materials = [
					F_Goth_Torso_PndrTrench_Tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x940d778e)
			}
		]
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_F_Goth_Torso_PndrTrench`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Torso_PndrTrenchd`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Goth_Torso_Pandora5
		frontend_desc = qs(0x99b3fe7e)
		mesh = `models/CAR/Female/F_Goth_Torso_Pandora5`
		material_groups = [
			{
				materials = [
					F_Goth_Torso_Pandora5_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x56bdd5f5)
			}
			{
				materials = [
					F_Goth_Torso_Pandora5_Secondary1
					F_Goth_Torso_Pandora5_Secondary2
				]
				shader = $cas_shader_skin
				name = qs(0x9b26dc03)
			}
		]
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_F_Goth_Torso_Pandora5`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Torso_Pandora5`
		acc_bones = [
			Bone_ACC_Torso_01
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Metl_Torso_Bullets01
		frontend_desc = qs(0x154f9f31)
		mesh = `models/CAR/Female/F_Metl_Torso_Bullets01`
		genre = [
			`Heavy	Metal`
		]
		material_groups = [
			{
				materials = [
					F_Metl_Torso_bullets01_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					F_Metl_Torso_Bullets01_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x0ba43538)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Metl_Torso_Bullets01`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Torso_Bullets01`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Metl_Torso_Vest01
		frontend_desc = qs(0x37dfa29e)
		mesh = `models/CAR/Female/F_Metl_Torso_Vest01`
		genre = [
			`Heavy	Metal`
		]
		acc_skeleton = `skeletons/Skel_F_Metl_Torso_Vest01`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Torso_Vest01`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Metl_Torso_BraMesh
		frontend_desc = qs(0x00921c12)
		mesh = `models/CAR/Female/F_Metl_Torso_BraMesh`
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
	}
	{
		desc_id = F_Metl_Torso_JeanLthr
		frontend_desc = qs(0xa2f0a9b4)
		mesh = `models/CAR/Female/F_Metl_Torso_JeanLthr`
		material_groups = [
			{
				materials = [
					F_Metl_Torso_JeanLthr_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x2494ed1e)
			}
			{
				materials = [
					F_Metl_Torso_JeanLthr_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					F_Metl_Torso_JeanLthr_Shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			`Heavy	Metal`
		]
		acc_skeleton = `skeletons/Skel_F_Metl_Torso_JeanLthr`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Torso_JeanLthr`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Metl_Torso_LaceTank
		frontend_desc = qs(0x94a5446d)
		mesh = `models/CAR/Female/F_Metl_Torso_LaceTank`
		material_groups = [
			{
				materials = [
					F_Metl_Torso_LaceTank_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xdc4bd30d)
			}
			{
				materials = [
					F_Metl_Torso_LaceTank_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6387b943)
			}
		]
		genre = [
			`Heavy	Metal`
		]
	}
	{
		desc_id = F_Metl_Torso_ShldrHoody
		frontend_desc = qs(0x06e5b3d5)
		mesh = `models/CAR/Female/F_Metl_Torso_ShldrHoody`
		material_groups = [
			{
				materials = [
					F_Metl_Torso_ShldrHoody_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xaab0cc95)
			}
			{
				materials = [
					F_Metl_Torso_ShldrHoody_Secondary
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
			`Heavy	Metal`
		]
	}
	{
		desc_id = F_Metl_Torso_Acid
		frontend_desc = qs(0xfb8add4c)
		mesh = `models/CAR/Female/F_Metl_Torso_Acid`
		material_groups = [
			{
				materials = [
					F_Metl_Torso_Acid_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Metl_Torso_Acid_Sleeves
				]
				shader = $cas_shader_skin
				name = qs(0x1c9f493b)
			}
			{
				materials = [
					F_Metl_Torso_Acid_Straps
				]
				shader = $cas_shader_skin
				name = qs(0x58cf8c6c)
			}
			{
				materials = [
					F_Metl_Torso_Acid_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
	}
	{
		desc_id = F_Metl_Torso_ShirtBra
		frontend_desc = qs(0x12585d96)
		mesh = `models/CAR/Female/F_Metl_Torso_ShirtBra`
		material_groups = [
			{
				materials = [
					F_Metl_Torso_ShirtBra_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xedade552)
			}
			{
				materials = [
					F_Metl_Torso_ShirtBra_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x0ba43538)
			}
		]
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
	}
	{
		desc_id = F_Metl_Torso_Dvest
		frontend_desc = qs(0x94134454)
		mesh = `models/CAR/Female/F_Metl_Torso_Dvest`
		material_groups = [
			{
				materials = [
					F_Metl_Torso_Dvest_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					F_Metl_Torso_Dvest_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
		acc_skeleton = `skeletons/Skel_F_Metl_Torso_Dvest`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Torso_Dvest`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Clsc_Torso_Striped
		frontend_desc = qs(0xb3452072)
		mesh = `models/CAR/Female/F_Clsc_Torso_Striped`
		material_groups = [
			{
				materials = [
					F_Clsc_Torso_Striped_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Clsc_Torso_Striped_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		genre = [
			`Classic	Rock`
		]
	}
	{
		desc_id = F_Clsc_Torso_PldTie
		frontend_desc = qs(0x89ee7a85)
		mesh = `models/CAR/Female/F_Clsc_Torso_PldTie`
		genre = [
			`Classic	Rock`
		]
		material_groups = [
			{
				materials = [
					F_Clsc_Torso_PldTie_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					F_Clsc_Torso_PldTie_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Clsc_Torso_PldTie_Tie
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Clsc_Torso_PldTie`
		acc_ragdoll = `Ragdolls/CAR/Female/Clsc/Rag_F_Clsc_Torso_PldTie`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 0.1
	}
	{
		desc_id = F_Clsc_Torso_Jersey
		frontend_desc = qs(0x50433d5b)
		mesh = `models/CAR/Female/F_Clsc_Torso_Jersey`
		material_groups = [
			{
				materials = [
					F_Clsc_Torso_Jersey_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Clsc_Torso_Jersey_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x8cff0357)
			}
		]
		genre = [
			`Classic	Rock`
		]
	}
	{
		desc_id = F_Clsc_Torso_Flwr
		frontend_desc = qs(0x9aba2e07)
		mesh = `models/CAR/Female/F_Clsc_Torso_Flwr`
		genre = [
			`Classic	Rock`
		]
		acc_skeleton = `skeletons/Skel_F_Clsc_Torso_Flwr`
		acc_ragdoll = `Ragdolls/CAR/Female/Clsc/Rag_F_Clsc_Torso_Flwr`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		material_groups = [
			{
				materials = [
					F_Clsc_Torso_Flwr_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x7a282392)
			}
			{
				materials = [
					F_Clsc_Torso_Flwr_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Clsc_Torso_Flwr_Third
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
			{
				materials = [
					F_Clsc_Torso_Flwr_Rose
				]
				shader = $cas_shader_skin
				name = qs(0x3b25461b)
			}
		]
	}
	{
		desc_id = F_Clsc_Torso_Dress
		frontend_desc = qs(0x513dd30e)
		mesh = `models/CAR/Female/F_Clsc_Torso_Dress`
		genre = [
			`Classic	Rock`
		]
		materials = [
			F_Clsc_Torso_Dress_Primary
		]
	}
	{
		desc_id = F_Pop_Torso_Longsleeves
		frontend_desc = qs(0xc5ae5744)
		mesh = `models/CAR/Female/F_Pop_Torso_Longsleeves`
		genre = [
			Pop
		]
	}
	{
		desc_id = F_Pop_Torso_Midori
		frontend_desc = qs(0xb176386f)
		mesh = `models/CAR/Female/F_Pop_Torso_Midori`
		genre = [
			Pop
		]
		material_groups = [
			{
				materials = [
					F_Pop_Torso_Midori_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					F_Pop_Torso_Midori_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
			{
				materials = [
					F_Pop_Torso_Midori_Shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Pop_Torso_Midori_Skirt`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Torso_Midori_Skirt`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Pop_Torso_RuffleTop
		frontend_desc = qs(0x821216c3)
		mesh = `models/CAR/Female/F_Pop_Torso_RuffleTop`
		material_groups = [
			{
				materials = [
					F_Pop_RuffleTop_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Pop_RuffleTop_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		genre = [
			Pop
		]
		acc_skeleton = `skeletons/Skel_F_Pop_Torso_RuffleTop`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Torso_RuffleTop`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Pop_Torso_ButtonTop
		frontend_desc = qs(0x07afb613)
		mesh = `models/CAR/Female/F_Pop_Torso_ButtonTop`
		material_groups = [
			{
				materials = [
					F_Pop_ButtonTop_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x3fab7478)
			}
			{
				materials = [
					F_Pop_ButtonTop_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x647ddfc6)
			}
		]
		genre = [
			Pop
		]
		acc_skeleton = `skeletons/Skel_F_Pop_Torso_ButtonTop`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Torso_ButtonTop`
		acc_bones = [
			Bone_ACC_Torso_01
		]
		random_weight = 1.5
	}
	{
		desc_id = F_Pop_Torso_HayleyShirt
		frontend_desc = qs(0x51c7ef28)
		mesh = `models/CAR/Female/F_Pop_Torso_HayleyShirt`
		materials = [
			F_Pop_Torso_HayleyShirt_Primary
		]
		genre = [
			Pop
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Pop_Torso_Midori01
		frontend_desc = qs(0xeee6345f)
		mesh = `models/CAR/Female/F_Pop_Torso_Midori01`
		material_groups = [
			{
				materials = [
					F_Pop_Torso_Midori01_01
				]
				shader = $cas_shader_skin
				name = qs(0x7b24e027)
			}
			{
				materials = [
					F_Pop_Torso_Midori01_02
				]
				shader = $cas_shader_skin
				name = qs(0x0745c5fc)
			}
			{
				materials = [
					F_Pop_Torso_Midori01_03
				]
				shader = $cas_shader_skin
				name = qs(0x2b353295)
			}
			{
				materials = [
					F_Pop_Torso_Midori01_04
				]
				shader = $cas_shader_skin
				name = qs(0xb1f8de98)
			}
		]
		genre = [
			Pop
		]
		price = 0
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Pop_Torso_Midori02
		frontend_desc = qs(0x870acacb)
		mesh = `models/CAR/Female/F_Pop_Torso_Midori02`
		material_groups = [
			{
				materials = [
					F_Pop_Torso_Midori02_03
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					F_Pop_Torso_Midori02_04
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Pop_Torso_Midori02`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Torso_Midori02`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			Pop
		]
		price = 0
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Pop_Torso_Midori03
		frontend_desc = qs(0xa0c845e5)
		mesh = `models/CAR/Female/F_Pop_Torso_Midori03`
		material_groups = [
			{
				materials = [
					F_Pop_Torso_Midori03_01
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Pop_Torso_Midori03_02
				]
				shader = $cas_shader_skin
				name = qs(0xd5145808)
			}
		]
		genre = [
			Pop
		]
		acc_skeleton = `skeletons/Skel_F_Pop_Torso_Midori03`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Torso_Midori03`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		price = 0
		random_weight = 0.5
	}
	{
		desc_id = F_Pop_Torso_Midori04
		frontend_desc = qs(0x88842954)
		mesh = `models/CAR/Female/F_Pop_Torso_Midori04`
		material_groups = [
			{
				materials = [
					F_Pop_Torso_Midori04_01
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					F_Pop_Torso_Midori04_02
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					F_Pop_Torso_Midori04_03
				]
				shader = $cas_shader_skin
				name = qs(0xd5145808)
			}
		]
		genre = [
			Pop
		]
		price = 0
		random_weight = 0.0
	}
	{
		desc_id = F_bmtl_Torso_Corset01
		frontend_desc = qs(0xa47f89a5)
		mesh = `models/CAR/Female/F_Bmtl_Torso_Corset01`
		genre = [
			`Black	Metal`
		]
		acc_skeleton = `skeletons/Skel_F_Bmtl_Torso_Corset01`
		acc_ragdoll = `Ragdolls/CAR/Female/Bmtl/Rag_F_bmtl_Torso_Corset01`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = F_Bmtl_Torso_Spikeshirt
		frontend_desc = qs(0xe08761c6)
		mesh = `models/CAR/Female/F_Bmtl_Torso_Spikeshirt`
		material_groups = [
			{
				materials = [
					F_Bmtl_Torso_Spikeshirt_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					F_Bmtl_Torso_Spikeshirt_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		genre = [
			`Black	Metal`
		]
		random_weight = 0.1
	}
	{
		desc_id = F_Bmtl_Torso_Fur
		frontend_desc = qs(0x97927568)
		mesh = `models/CAR/Female/F_Bmtl_Torso_Fur`
		genre = [
			`Black	Metal`
		]
		acc_skeleton = `skeletons/Skel_F_Bmtl_Torso_Fur`
		acc_ragdoll = `Ragdolls/CAR/Female/Bmtl/Rag_F_Bmtl_Torso_Fur`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
		]
	}
	{
		desc_id = F_Bmtl_Torso_SpikeArmor
		frontend_desc = qs(0x9aa713a4)
		mesh = `models/CAR/Female/F_Bmtl_Torso_SpikeArmor`
		genre = [
			`Black	Metal`
		]
	}
	{
		desc_id = F_Bmtl_Torso_Bikini
		frontend_desc = qs(0xa739ba04)
		mesh = `models/CAR/Female/F_Bmtl_Torso_Bikini`
		materials = [
			F_Bmtl_Torso_Bikini_Primary
		]
		genre = [
			`Black	Metal`
		]
		acc_skeleton = `skeletons/Skel_F_Bmtl_Torso_Bikini`
		acc_ragdoll = `Ragdolls/CAR/Female/Bmtl/Rag_F_Bmtl_Torso_Bikini`
		acc_bones = [
			Bone_ACC_Torso_01
		]
	}
]
