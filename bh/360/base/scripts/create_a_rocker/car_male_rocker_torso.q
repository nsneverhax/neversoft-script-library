CAS_Male_Torso = [
	{
		desc_id = M_Torso_TShirt
		frontend_desc = qs(0x80c803f2)
		mesh = `models/CAR/Male/M_Torso_TShirt`
		random_weight = 1.0
		genre = [
			rock
			Pop
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
		desc_id = Shirtless
		frontend_desc = qs(0xb404a80c)
		random_weight = 0.0
	}
	{
		desc_id = M_Torso_BoneMan
		frontend_desc = qs(0xecd1f08c)
		mesh = `models/CAR/Male/M_Torso_BoneMan`
		random_weight = 0.0
		locked
		genre = [
			rock
		]
	}
	{
		desc_id = M_Torso_Layered
		frontend_desc = qs(0x75e1cc5d)
		mesh = `models/CAR/Male/M_Torso_Layered`
		random_weight = 1.0
		material_groups = [
			{
				materials = [
					M_Torso_Layered_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Torso_Layered_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1c9f493b)
			}
		]
		genre = [
			rock
		]
	}
	{
		desc_id = M_Torso_LayeredNoStripe
		frontend_desc = qs(0x7a91fac9)
		mesh = `models/CAR/Male/M_Torso_LayeredNoStripe`
		random_weight = 1.0
		material_groups = [
			{
				materials = [
					M_Torso_LayeredNoStripe_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Torso_LayeredNoStripe_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1c9f493b)
			}
		]
		genre = [
			rock
		]
	}
	{
		desc_id = M_Torso_Hoodie
		frontend_desc = qs(0xc5fa8f19)
		mesh = `models/CAR/Male/M_Torso_Hoodie`
		random_weight = 1.0
		material_groups = [
			{
				materials = [
					M_Torso_Hoodie_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x001541ab)
			}
			{
				materials = [
					M_Torso_Hoodie_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/Skel_M_Torso_Hoodie`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Torso_Hoodie`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Torso_Ninja
		frontend_desc = qs(0xd296152e)
		mesh = `models/CAR/Male/M_Torso_Ninja`
		random_weight = 0.0
		material_groups = [
			{
				materials = [
					M_Torso_Ninja_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					M_Torso_Ninja_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd5145808)
			}
			{
				materials = [
					M_Torso_Ninja_Arms
				]
				shader = $cas_shader_skin
				name = qs(0x2e53d20c)
			}
		]
		genre = [
			Goth
		]
	}
	{
		desc_id = M_Pop_Torso_Clive5
		frontend_desc = qs(0x2c29a8be)
		mesh = `models/CAR/Male/M_Pop_Torso_Clive5`
		material_groups = [
			{
				materials = [
					M_Pop_Torso_Clive5_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Pop_Torso_Clive5_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xe582d049)
			}
			{
				materials = [
					M_Pop_Torso_Clive5_DressShirt
				]
				shader = $cas_shader_skin
				name = qs(0x99e3f592)
			}
			{
				materials = [
					M_Pop_Torso_Clive5_DressMetal
				]
				shader = $cas_shader_skin
				name = qs(0x84f1b1b5)
			}
			{
				materials = [
					M_Pop_Torso_Clive5_ArmWrap
				]
				shader = $cas_shader_skin
				name = qs(0x6d64bf70)
			}
			{
				materials = [
					M_Pop_Torso_Clive5_Buttons
				]
				shader = $cas_shader_skin
				name = qs(0x031d52e9)
			}
		]
		random_weight = 0.0
	}
	{
		desc_id = M_Pop_Torso_Dragon
		frontend_desc = qs(0x66d76586)
		mesh = `models/CAR/Male/M_Pop_Torso_Dragon`
		material_groups = [
			{
				materials = [
					M_Pop_Torso_Dragon_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x181ef56c)
			}
			{
				materials = [
					M_Pop_Torso_Dragon_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x9803693e)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Pop_Torso_Dragon`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Torso_Dragon`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 0.0
	}
	{
		desc_id = M_Pop_Torso_Leather
		frontend_desc = qs(0xca431d9a)
		mesh = `models/CAR/Male/M_Pop_Torso_Leather`
		material_groups = [
			{
				materials = [
					M_Pop_Torso_Leather_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Pop_Torso_Leather_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Pop_Torso_Leather`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Torso_Leather`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			Pop
		]
	}
	{
		desc_id = M_Pop_Torso_OpenShirt
		frontend_desc = qs(0x903c37b0)
		mesh = `models/CAR/Male/M_Pop_Torso_OpenShirt`
		materials = [
			M_Pop_Torso_OpenShirt_Primary
			M_Pop_Torso_OpenShirt_Secondary
		]
		material_groups = [
			{
				materials = [
					M_Pop_Torso_OpenShirt_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Pop_Torso_OpenShirt_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x233cd0bb)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Pop_Torso_OpenShirt`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Torso_OpenShirt`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
		genre = [
			Pop
		]
	}
	{
		desc_id = M_Pop_Torso_Suit
		frontend_desc = qs(0x7b3b9bbd)
		mesh = `models/CAR/Male/M_Pop_Torso_Suit`
		material_groups = [
			{
				materials = [
					M_Pop_Torso_Suit_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x7a282392)
			}
			{
				materials = [
					M_Pop_Torso_Suit_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					M_Pop_Torso_Suit_Tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Pop_Torso_Suit_Tie
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		random_weight = 1.0
		genre = [
			Pop
		]
	}
	{
		desc_id = M_Pop_Torso_TurtleShirt
		frontend_desc = qs(0x483148bd)
		mesh = `models/CAR/Male/M_Pop_Torso_TurtleShirt`
		random_weight = 1.0
		material_groups = [
			{
				materials = [
					M_Pop_Torso_TurtleShirt_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x72ad86ad)
			}
			{
				materials = [
					M_Pop_Torso_TurtleShirt_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Pop_Torso_TurtleShirt`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Torso_TurtleShirt`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			Pop
		]
	}
	{
		desc_id = M_Pop_Torso_Vest
		frontend_desc = qs(0x3b3d04c5)
		mesh = `models/CAR/Male/M_Pop_Torso_Vest`
		random_weight = 1.0
		genre = [
			Pop
		]
		material_groups = [
			{
				materials = [
					M_Pop_Torso_Vest_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					M_Pop_Torso_Vest_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Pop_Torso_Vest`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Torso_Vest`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Pop_Torso_QuinLive
		frontend_desc = qs(0x0472f28f)
		mesh = `models/CAR/Male/M_Pop_Torso_QuinLive`
		random_weight = 1.0
		genre = [
			Pop
		]
		material_groups = [
			{
				materials = [
					M_Pop_Torso_QuinLive_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Pop_Torso_QuinLive_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Pop_Torso_QuinLive`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Torso_QuinLive`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
	}
	{
		desc_id = M_Pop_Torso_Quin3
		frontend_desc = qs(0x76f58e8c)
		mesh = `models/CAR/Male/M_Pop_Torso_Quin3`
		random_weight = 0.0
		locked
		genre = [
			Pop
		]
		material_groups = [
			{
				materials = [
					M_Pop_Torso_Quin3_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xf65ad30f)
			}
			{
				materials = [
					M_Pop_Torso_Quin3_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
	}
	{
		desc_id = M_Pop_Torso_Quinton2
		frontend_desc = qs(0x1a3548c4)
		mesh = `models/CAR/Male/M_Pop_Torso_Quinton2`
		random_weight = 0.0
		genre = [
			Pop
		]
		material_groups = [
			{
				materials = [
					Quinton2_Torso_Primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x6916eee4)
			}
			{
				materials = [
					Quinton2_Torso_Primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0xc26686da)
			}
			{
				materials = [
					Quinton2_Torso_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					Quinton2_Torso_Quarternary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x58cf8c6c)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Pop_Torso_Quinton2`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Torso_Quinton2`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
	}
	{
		desc_id = M_Pop_Torso_Quinton4
		frontend_desc = qs(0x051ee636)
		mesh = `models/CAR/Male/M_Pop_Torso_Quinton4`
		random_weight = 0.0
		locked
		genre = [
			Pop
		]
		material_groups = [
			{
				materials = [
					Quinton4_Torso_Shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					Quinton4_Torso_Tshirt
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xe929ac48)
			}
			{
				materials = [
					Quinton4_Torso_Tshirt
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x5273dbeb)
			}
			{
				materials = [
					Quinton4_Torso_Tie
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Pop_Torso_Quinton4`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Torso_Quinton4`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Punk_Torso_Jacket
		frontend_desc = qs(0xdec0d31b)
		mesh = `models/CAR/Male/M_Punk_Torso_Jacket`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Jacket`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Jacket`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_list = [
			M_Punk_Torso_Jacket_02
			M_Punk_Torso_Jacket_03
			M_Punk_Torso_Jacket_04
		]
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Denim03`
	}
	{
		desc_id = M_Punk_Torso_Jacket_02
		frontend_desc = qs(0xd58d8dcd)
		mesh = `models/CAR/Male/M_Punk_Torso_Jacket_02`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Jacket`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Jacket`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = M_Punk_Torso_Jacket
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Denim02`
	}
	{
		desc_id = M_Punk_Torso_Jacket_03
		frontend_desc = qs(0x718e92e2)
		mesh = `models/CAR/Male/M_Punk_Torso_Jacket_03`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Jacket`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Jacket`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = M_Punk_Torso_Jacket
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Denim01`
	}
	{
		desc_id = M_Punk_Torso_Jacket_04
		frontend_desc = qs(0x8221b6e6)
		mesh = `models/CAR/Male/M_Punk_Torso_Jacket_04`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Jacket`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Jacket`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = M_Punk_Torso_Jacket
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Denim04`
	}
	{
		desc_id = M_Punk_Torso_Hood
		frontend_desc = qs(0xd017a37b)
		mesh = `models/CAR/Male/M_Punk_Torso_Hood`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_hood_03`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_hood_03`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_list = [
			M_Punk_Torso_Hood_02
			M_Punk_Torso_Hood_03
			M_Punk_Torso_Hood_04
		]
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Vest01`
	}
	{
		desc_id = M_Punk_Torso_Hood_02
		frontend_desc = qs(0xc2641269)
		mesh = `models/CAR/Male/M_Punk_Torso_Hood_02`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_hood_03`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_hood_03`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = M_Punk_Torso_Hood
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Vest02`
	}
	{
		desc_id = M_Punk_Torso_Hood_03
		frontend_desc = qs(0xdb1ea893)
		mesh = `models/CAR/Male/M_Punk_Torso_Hood_03`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_hood_03`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_hood_03`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = M_Punk_Torso_Hood
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Vest03`
	}
	{
		desc_id = M_Punk_Torso_Hood_04
		frontend_desc = qs(0x755fa713)
		mesh = `models/CAR/Male/M_Punk_Torso_Hood_04`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_hood_03`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_hood_03`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = M_Punk_Torso_Hood
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Vest04`
	}
	{
		desc_id = M_Punk_Torso_Beater
		frontend_desc = qs(0x61e6dc36)
		mesh = `models/CAR/Male/M_Punk_Torso_Beater`
		materials = [
			M_Punk_Torso_Beater_Primary
		]
		random_weight = 1.0
		genre = [
			Punk
		]
	}
	{
		desc_id = M_Punk_Torso_Bomber
		frontend_desc = qs(0x67bd487c)
		mesh = `models/CAR/Male/M_Punk_Torso_Bomber`
		materials = [
			M_Punk_Torso_Bomber_Primary
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Bomber`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Bomber`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			Punk
		]
	}
	{
		desc_id = M_Punk_Torso_Jstripe
		frontend_desc = qs(0x223511bf)
		mesh = `models/CAR/Male/M_Punk_Torso_Jstripe`
		locked
		material_groups = [
			{
				materials = [
					M_Punk_Torso_Jstripe_Primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x6916eee4)
			}
			{
				materials = [
					M_Punk_Torso_Jstripe_Secondary
				]
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Jstripe`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Jstripe`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
		genre = [
			Punk
		]
	}
	{
		desc_id = M_Punk_Torso_Bowling
		frontend_desc = qs(0x6c89158b)
		mesh = `models/CAR/Male/M_Punk_Torso_Bowling`
		material_groups = [
			{
				materials = [
					M_Punk_Torso_Bowling_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Punk_Torso_Bowling_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x233cd0bb)
			}
		]
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Bowling`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Bowling`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Punk_Torso_Johnny1
		frontend_desc = qs(0x936f53d8)
		mesh = `models/CAR/Male/M_Punk_Torso_Johnny1`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Johnny1`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Johnny1`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_list = [
			M_Punk_Torso_Johnny1_02
			M_Punk_Torso_Johnny1_03
			M_Punk_Torso_Johnny1_04
		]
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Leather01`
	}
	{
		desc_id = M_Punk_Torso_Johnny1_02
		frontend_desc = qs(0xfb918590)
		mesh = `models/CAR/Male/M_Punk_Torso_Johnny1_02`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Johnny1`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Johnny1`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = M_Punk_Torso_Johnny1
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Leather02`
	}
	{
		desc_id = M_Punk_Torso_Johnny1_03
		frontend_desc = qs(0x59773dda)
		mesh = `models/CAR/Male/M_Punk_Torso_Johnny1_03`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Johnny1`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Johnny1`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = M_Punk_Torso_Johnny1
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Leather03`
	}
	{
		desc_id = M_Punk_Torso_Johnny1_04
		frontend_desc = qs(0x98fa9ce7)
		mesh = `models/CAR/Male/M_Punk_Torso_Johnny1_04`
		random_weight = 1.0
		genre = [
			Punk
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Johnny1`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Johnny1`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		swatch_for = M_Punk_Torso_Johnny1
		swatch_texture = `tex/models/Characters/Car/Male/Punk/Swatch_Leather04`
	}
	{
		desc_id = M_Punk_Torso_Jny_1
		frontend_desc = qs(0x15360a01)
		mesh = `models/CAR/Male/M_Punk_Torso_Jny_1`
		material_groups = [
			{
				materials = [
					M_Punk_Torso_Jny_1_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x001541ab)
			}
			{
				materials = [
					M_Punk_Torso_Jny_1_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Jny_1`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Jny_1`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 1.0
		genre = [
			Punk
		]
	}
	{
		desc_id = M_Punk_Torso_Jny_2
		frontend_desc = qs(0xba16efab)
		mesh = `models/CAR/Male/M_Punk_Torso_Jny_2`
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Jny_2`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Jny_2`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 1.0
		genre = [
			Punk
		]
		locked
	}
	{
		desc_id = M_Punk_Torso_Jny_5
		frontend_desc = qs(0x4c30d951)
		mesh = `models/CAR/Male/M_Punk_Torso_Jny_5`
		acc_skeleton = `skeletons/Skel_M_Punk_Torso_Jny_5`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Torso_Jny_5`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		material_groups = [
			{
				materials = [
					Jny5_Torso_Primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xe582d049)
			}
			{
				materials = [
					Jny5_Torso_Secondary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xf9d45296)
			}
			{
				materials = [
					Jny5_Torso_Secondary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x702a88c7)
			}
			{
				materials = [
					Jny5_Torso_Tertiary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x8e2b4f9d)
			}
		]
		random_weight = 1.0
		genre = [
			Punk
		]
	}
	{
		desc_id = M_Clsc_Torso_Clive
		frontend_desc = qs(0xfc391b7c)
		mesh = `models/CAR/Male/M_Clsc_Torso_Clive`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		material_groups = [
			{
				materials = [
					M_Clsc_Torso_Clive_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Clsc_Torso_Clive_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Clsc_Torso_Clive`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Torso_Clive`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Clsc_Torso_Clive2
		frontend_desc = qs(0x2d1241d7)
		mesh = `models/CAR/Male/M_Clsc_Torso_Clive2`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		material_groups = [
			{
				materials = [
					M_Clsc_Torso_Clive2_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Clsc_Torso_Clive2_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xccf7fd16)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Clsc_Torso_Clive2`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Torso_Clive2`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		locked
	}
	{
		desc_id = M_Clsc_Torso_Clive3
		frontend_desc = qs(0x8597c3d4)
		mesh = `models/CAR/Male/M_Clsc_Torso_Clive3`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		material_groups = [
			{
				materials = [
					M_Clsc_Torso_Clive3_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Clsc_Torso_Clive3_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xe4340e11)
			}
			{
				materials = [
					M_Clsc_Torso_Clive3_Third
				]
				shader = $cas_shader_skin
				name = qs(0xccf7fd16)
			}
			{
				materials = [
					M_Clsc_Torso_Clive3_Waist
				]
				shader = $cas_shader_skin
				name = qs(0xae032c82)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Clsc_Torso_Clive3`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Torso_Clive3`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		locked
	}
	{
		desc_id = M_Clsc_Torso_Clive4
		frontend_desc = qs(0x755fa713)
		mesh = `models/CAR/Male/M_Clsc_Torso_Clive4`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		material_groups = [
			{
				materials = [
					M_Clsc_Torso_Clive4_Jacket
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Clsc_Torso_Clive4_Tassels
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Clsc_Torso_Clive4`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Torso_Clive4`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		locked
	}
	{
		desc_id = M_Clsc_Torso_scarf
		frontend_desc = qs(0x98fd55e5)
		mesh = `models/CAR/Male/M_Clsc_Torso_scarf`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		material_groups = [
			{
				materials = [
					M_Clsc_Torso_scarf_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Clsc_Torso_scarf_Vest
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Clsc_Torso_scarf`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Torso_scarf`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Clsc_Torso_confed
		frontend_desc = qs(0x2ec68eb5)
		mesh = `models/CAR/Male/M_Clsc_Torso_confed`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		materials = [
			M_Clsc_Torso_confed_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Clsc_Torso_confed`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Torso_confed`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Clsc_Torso_Clrdjakt
		frontend_desc = qs(0x5ef3da0a)
		mesh = `models/CAR/Male/M_Clsc_Torso_Clrdjakt`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		material_groups = [
			{
				materials = [
					M_Clsc_Torso_Clrdjakt_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Clsc_Torso_Clrdjakt_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Clsc_Torso_Clrdjakt`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Torso_Clrdjakt`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Clsc_Torso_Santana_D1
		frontend_desc = qs(0xde2ef3a8)
		mesh = `models/CAR/Male/M_Clsc_Torso_Santana_D1`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		swatch_list = [
			M_Clsc_Torso_Santana_D2
			M_Clsc_Torso_Santana_D3
			M_Clsc_Torso_Santana_D4
		]
		swatch_texture = `tex/models/Characters/Car/Male/Clsc/Swatch_Santana_Torso_Diamonds`
		locked
	}
	{
		desc_id = M_Clsc_Torso_Santana_D2
		frontend_desc = qs(0xe5ed87ae)
		mesh = `models/CAR/Male/M_Clsc_Torso_Santana_D2`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		swatch_for = M_Clsc_Torso_Santana_D1
		swatch_texture = `tex/models/Characters/Car/Male/Clsc/Swatch_Santana_Torso_Flowers`
	}
	{
		desc_id = M_Clsc_Torso_Santana_D3
		frontend_desc = qs(0xe7ba4448)
		mesh = `models/CAR/Male/M_Clsc_Torso_Santana_D3`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		swatch_for = M_Clsc_Torso_Santana_D1
		swatch_texture = `tex/models/Characters/Car/Male/Clsc/Swatch_Santana_Torso_Pinstripe`
	}
	{
		desc_id = M_Clsc_Torso_Santana_D4
		frontend_desc = qs(0x9146af69)
		mesh = `models/CAR/Male/M_Clsc_Torso_Santana_D4`
		random_weight = 1.0
		genre = [
			`Classic	Rock`
		]
		swatch_for = M_Clsc_Torso_Santana_D1
		swatch_texture = `tex/models/Characters/Car/Male/Clsc/Swatch_Santana_Torso_Plaid`
	}
	{
		desc_id = M_Goth_Torso_Devilwings
		frontend_desc = qs(0xd7d6cd09)
		mesh = `models/CAR/Male/M_Goth_Torso_Devilwings`
		random_weight = 1.0
		genre = [
			Goth
		]
		material_groups = [
			{
				materials = [
					M_Goth_Torso_Devilwings_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x3c4d23a1)
			}
			{
				materials = [
					M_Goth_Torso_Devilwings_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x693b5da0)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Goth_Torso_Devilwings`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Torso_Devilwings`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		locked
	}
	{
		desc_id = M_Goth_Torso_SFVest
		frontend_desc = qs(0xaa5e242b)
		mesh = `models/CAR/Male/M_Goth_Torso_SFVest`
		random_weight = 1.0
		genre = [
			Goth
		]
		material_groups = [
			{
				materials = [
					M_Goth_Torso_SFVest_Primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xc26686da)
			}
			{
				materials = [
					M_Goth_Torso_SFVest_Primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x1d55e1b4)
			}
		]
		locked
	}
	{
		desc_id = M_Goth_Torso_Strait
		frontend_desc = qs(0xcb53adfe)
		mesh = `models/CAR/Male/M_Goth_Torso_Strait`
		random_weight = 1.0
		genre = [
			Goth
		]
		material_groups = [
			{
				materials = [
					M_Goth_Torso_Strait_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					M_Goth_Torso_Strait_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
			{
				materials = [
					M_Goth_Torso_Strait_Metal
				]
				shader = $cas_shader_skin
				name = qs(0x6ad7504e)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Goth_Torso_Strait`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Torso_Strait`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Goth_Torso_MadMax
		frontend_desc = qs(0x010fa69b)
		mesh = `models/CAR/Male/M_Goth_Torso_MadMax`
		materials = [
			M_Goth_Torso_MadMax_Leather
			M_Goth_Torso_MadMax_Sleeve
		]
		material_groups = [
			{
				materials = [
					M_Goth_Torso_MadMax_Leather
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					M_Goth_Torso_MadMax_Sleeve
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_M_Goth_Torso_MadMax`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Torso_MadMax`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Goth_Torso_Tux
		frontend_desc = qs(0x3a5a5695)
		mesh = `models/CAR/Male/M_Goth_Torso_Tux`
		$CAS_Male_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					M_Goth_Torso_Tux_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Goth_Torso_Tux_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xe4340e11)
			}
			{
				materials = [
					M_Goth_Torso_Tux_Shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Goth_Torso_Tux_Tie
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		random_weight = 1.0
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_M_Goth_Torso_Tux`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Torso_Tux`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
		]
	}
	{
		desc_id = M_Goth_Torso_Poet
		frontend_desc = qs(0x5ad056ff)
		mesh = `models/CAR/Male/M_Goth_Torso_Poet`
		materials = [
			M_Goth_Torso_Poet_Primary
		]
		random_weight = 1.0
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_M_Goth_Torso_Poet`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Torso_Poet`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
	}
	{
		desc_id = M_Goth_Torso_Vest
		frontend_desc = qs(0x283675e8)
		mesh = `models/CAR/Male/M_Goth_Torso_Vest`
		random_weight = 1.0
		material_groups = [
			{
				materials = [
					M_Goth_Torso_Vest_Primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_M_Goth_Torso_Vest`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Torso_Vest`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
	}
	{
		desc_id = M_Fun_Torso_AngelW
		frontend_desc = qs(0xc8fe9880)
		mesh = `models/CAR/male/M_Fun_Torso_AngelW`
		materials = [
			M_Fun_Torso_AngelW_Wing
		]
		genre = [
			Goth
		]
		acc_skeleton = `skeletons/Skel_M_Fun_Torso_AngelW`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Fun_Torso_AngelW`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 0.0
	}
	{
		desc_id = M_Mtl_Torso_Axel1
		frontend_desc = qs(0x89954397)
		mesh = `models/CAR/Male/M_Mtl_Torso_Axel1`
		material_groups = [
			{
				materials = [
					M_Metl_Torso_Axel1_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					M_Metl_Torso_Axel1_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
		acc_skeleton = `skeletons/Skel_M_Metl_Torso_Axel1`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Torso_Axel1`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Metl_Torso_Axel2
		frontend_desc = qs(0xd3caf88a)
		mesh = `models/CAR/Male/M_Metl_Torso_Axel2`
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
		acc_skeleton = `skeletons/Skel_M_Metl_Torso_Axel2`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Torso_Axel2`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Metl_Torso_Axel_1
		frontend_desc = qs(0x88c9b801)
		mesh = `models/CAR/Male/M_Metl_Torso_Axel_1`
		materials = [
			M_Metl_Torso_Axel_1_Vest
			M_Metl_Torso_Axel_1_Flannel
			M_Metl_Torso_Axel_1_Shirt
		]
		material_groups = [
			{
				materials = [
					M_Metl_Torso_Axel_1_Vest
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					M_Metl_Torso_Axel_1_Flannel
				]
				shader = $cas_shader_skin
				name = qs(0xd5c841cf)
			}
			{
				materials = [
					M_Metl_Torso_Axel_1_Shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
	}
	{
		desc_id = M_Metl_Torso_Axel2GH5
		frontend_desc = qs(0x39c9192e)
		mesh = `models/CAR/Male/M_Metl_Torso_Axel2GH5`
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
		locked
		material_groups = [
			{
				materials = [
					Axel2_Torso_Primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xc26686da)
			}
			{
				materials = [
					Axel2_Torso_Primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x6e0830a3)
			}
		]
	}
	{
		desc_id = M_Metl_Torso_Axel3
		frontend_desc = qs(0xce8065a3)
		mesh = `models/CAR/Male/M_Mtl_Torso_Axel3`
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
		locked
		material_groups = [
			{
				materials = [
					Axel3_Torso_Shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					Axel3_Torso_Jacket
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
	}
	{
		desc_id = M_Metl_Torso_Axel4
		frontend_desc = qs(0xdeca0c09)
		mesh = `models/CAR/Male/M_Mtl_Torso_Axel4`
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
		locked
		material_groups = [
			{
				materials = [
					Axel4_Torso_Primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					Axel4_Torso_Primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x83ec98a9)
			}
		]
	}
	{
		desc_id = M_Metl_Torso_Axel5
		frontend_desc = qs(0x2770296a)
		mesh = `models/CAR/Male/M_Metl_Torso_Axel5`
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
		material_groups = [
			{
				materials = [
					Axel5_Torso_Primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					Axel5_Torso_Primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x83ec98a9)
			}
		]
	}
	{
		desc_id = M_Metl_Torso_Straps
		frontend_desc = qs(0xd7d98d81)
		mesh = `models/CAR/Male/M_Metl_Torso_Straps`
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
		acc_skeleton = `skeletons/Skel_M_Metl_Torso_Axel1`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Torso_Axel1`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Metl_Torso_LthrJkt
		frontend_desc = qs(0x6a7176b4)
		mesh = `models/CAR/Male/M_Metl_Torso_LthrJkt`
		material_groups = [
			{
				materials = [
					M_Metl_Torso_LthrJkt_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Metl_Torso_LthrJkt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Metl_Torso_LthrJkt_stripe
				]
				shader = $cas_shader_skin
				name = qs(0x42c13822)
			}
		]
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
		acc_skeleton = `skeletons/Skel_M_Metl_Torso_LthrJkt`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Torso_LthrJkt`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Metl_Torso_Unbttond
		frontend_desc = qs(0x93a71016)
		mesh = `models/CAR/Male/M_Metl_Torso_Unbttond`
		materials = [
			M_Metl_Torso_Unbttond_primary
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Metl_Torso_Unbttond`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Torso_Unbttond`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			`Heavy	Metal`
		]
		polaroid = CAR_FullSleeves
	}
	{
		desc_id = M_Metl_Torso_Sleveless
		frontend_desc = qs(0xf59c4d58)
		mesh = `models/CAR/Male/M_Metl_Torso_Sleveless`
		materials = [
			M_Metl_Torso_Sleveless_primary
		]
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
	}
	{
		desc_id = M_Metl_Torso_Armor
		frontend_desc = qs(0x55c4874c)
		mesh = `models/CAR/Male/M_Metl_Torso_Armor`
		random_weight = 0.4
		genre = [
			`Heavy	Metal`
		]
		polaroid = CAR_SuitOfArmor
	}
	{
		desc_id = M_Metl_Torso_Sleevecut
		frontend_desc = qs(0xb2be70ae)
		mesh = `models/CAR/Male/M_Metl_Torso_Sleevecut`
		materials = [
			M_Metl_Torso_Sleevecut_primary
		]
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
	}
	{
		desc_id = M_Metl_Torso_JamesAlt
		frontend_desc = qs(0xaae03cbd)
		mesh = `models/CAR/Male/M_Metl_Torso_JamesAlt`
		materials = [
			M_Metl_Torso_JamesAlt_primary
		]
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
		]
	}
	{
		desc_id = M_Rock_Torso_Tie
		frontend_desc = qs(0xa0d0d3bb)
		mesh = `models/CAR/Male/M_Rock_Torso_Tie`
		material_groups = [
			{
				materials = [
					M_Rock_Torso_Tie_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Rock_Torso_Tie_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1c9f493b)
			}
			{
				materials = [
					M_Rock_Torso_Tie_Tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		random_weight = 1.0
		genre = [
			rock
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Torso_Tie`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Torso_Tie`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Rock_Torso_Bandana
		frontend_desc = qs(0x5c95d8b1)
		mesh = `models/CAR/Male/M_Rock_Torso_Bandana`
		random_weight = 1.0
		genre = [
			rock
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Torso_Bandana`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Torso_Bandana`
		acc_bones = [
			Bone_ACC_Torso_01
		]
	}
	{
		desc_id = M_Rock_Torso_OzzyCoat
		frontend_desc = qs(0x0fd4c4e4)
		mesh = `models/CAR/Male/M_Rock_Torso_OzzyCoat`
		material_groups = [
			{
				materials = [
					M_Rock_Torso_OzzyCoat_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x7a282392)
			}
			{
				materials = [
					M_Rock_Torso_OzzyCoat_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Rock_Torso_OzzyCoat`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Torso_OzzyCoat`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			rock
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Rock_Torso_ERollBowl
		frontend_desc = qs(0x78855aee)
		mesh = `models/CAR/Male/M_Rock_Torso_ERollBowl`
		material_groups = [
			{
				materials = [
					M_Rock_Torso_ERollBowl_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Rock_Torso_ERollBowl_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd5145808)
			}
		]
		random_weight = 1.0
		genre = [
			rock
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Torso_ERollBowl`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Torso_ERollBowl`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
	}
	{
		desc_id = M_Rock_Torso_Sleeveless
		frontend_desc = qs(0xd8b0b44a)
		mesh = `models/CAR/Male/M_Rock_Torso_Sleeveless`
		materials = [
			M_Rock_Torso_Sleeveless_Primary
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Rock_Torso_Sleeveless`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Torso_Sleeveless`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
		genre = [
			rock
		]
	}
	{
		desc_id = M_Rock_Torso_LJacket
		frontend_desc = qs(0x368fb7d4)
		mesh = `models/CAR/Male/M_Rock_Torso_LJacket`
		material_groups = [
			{
				materials = [
					M_Rock_Torso_LJacket_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Rock_Torso_LJacket_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Rock_Torso_LJacket`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Torso_LJacket`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			rock
		]
	}
	{
		desc_id = M_Rock_Torso_RipShirt
		frontend_desc = qs(0xac86e5d7)
		mesh = `models/CAR/Male/M_Rock_Torso_RipShirt`
		materials = [
			M_Rock_Torso_RipShirt_Primary
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = M_Rock_Torso_RolledSlvs
		frontend_desc = qs(0x2d4d7f8a)
		mesh = `models/CAR/Male/M_Rock_Torso_RolledSlvs`
		materials = [
			M_Rock_Torso_RolledSlvs_Primary
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = M_Rock_Torso_SpadeSuit
		frontend_desc = qs(0x87c6a96b)
		mesh = `models/CAR/Male/M_Rock_Torso_SpadeSuit`
		material_groups = [
			{
				materials = [
					M_Rock_Torso_SpadeSuit_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Rock_Torso_SpadeSuit_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		genre = [
			rock
		]
		locked
	}
	{
		desc_id = M_Rock_Torso_Leather
		frontend_desc = qs(0x1b18b97f)
		mesh = `models/CAR/Male/M_Rock_Torso_Leather`
		material_groups = [
			{
				materials = [
					M_Rock_Torso_Leather_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Rock_Torso_Leather_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Rock_Torso_Leather`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Torso_Leather`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			rock
		]
		locked
	}
	{
		desc_id = M_Rock_Torso_Eddie5
		frontend_desc = qs(0x6be12145)
		mesh = `models/CAR/Male/M_Rock_Torso_Eddie5`
		material_groups = [
			{
				materials = [
					Eddie5_Torso_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					Eddie5_Torso_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					Eddie5_Torso_Tertiary
				]
				shader = $cas_shader_skin
				name = qs(0xd8d7273a)
			}
			{
				materials = [
					Eddie5_Torso_Quaternary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					Eddie5_Torso_Quinary
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = M_Torso_TasselVest
		frontend_desc = qs(0xa559f15c)
		mesh = `models/CAR/Male/M_Torso_TasselVest`
		material_groups = [
			{
				materials = [
					M_Torso_TasselVest_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Torso_TasselVest_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xb43c5b4e)
			}
		]
		random_weight = 0.1
		acc_skeleton = `skeletons/Skel_M_Torso_TasselVest`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Torso_TasselVest`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			rock
		]
	}
	{
		desc_id = M_Rock_Torso_Jersey
		frontend_desc = qs(0x6b2f7573)
		mesh = `models/CAR/Male/M_Rock_Torso_Jersey`
		material_groups = [
			{
				materials = [
					M_Rock_Torso_Jersey_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x3c42e759)
			}
			{
				materials = [
					M_Rock_Torso_Jersey_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		random_weight = 1.0
		genre = [
			rock
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Rock_Torso_WorkShirt
		frontend_desc = qs(0x539a7019)
		mesh = `models/CAR/Male/M_Rock_Torso_WorkShirt`
		material_groups = [
			{
				materials = [
					M_Rock_Torso_WorkShirt_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Rock_Torso_WorkShirt_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x031d52e9)
			}
		]
		random_weight = 1.0
		genre = [
			rock
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Rock_Torso_JCashVest
		frontend_desc = qs(0x0de20777)
		mesh = `models/CAR/Male/M_Rock_Torso_JCashVest`
		material_groups = [
			{
				materials = [
					M_Rock_Torso_JCashVest_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x7a282392)
			}
			{
				materials = [
					M_Rock_Torso_JCashVest_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					M_Rock_Torso_JCashVest_Tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = M_Glam_Torso_Rags
		frontend_desc = qs(0x56b233aa)
		mesh = `models/CAR/Male/M_Glam_Torso_Rags`
		materials = [
			M_Glam_Torso_Rags_Primary
		]
		random_weight = 1.0
		genre = [
			`Glam	Rock`
		]
	}
	{
		desc_id = M_Glam_Torso_Champ
		frontend_desc = qs(0x59c78648)
		mesh = `models/CAR/Male/M_Glam_Torso_Champ`
		materials = [
			M_Glam_Torso_Champ_Primary
		]
		random_weight = 1.0
		genre = [
			`Glam	Rock`
		]
		acc_skeleton = `skeletons/Skel_M_Glam_Torso_Champ`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Torso_Champ`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Glam_Torso_Tiger
		frontend_desc = qs(0x71c4b537)
		mesh = `models/CAR/Male/M_Glam_Torso_Tiger`
		random_weight = 1.0
		genre = [
			`Glam	Rock`
		]
		material_groups = [
			{
				materials = [
					M_Glam_Torso_Tiger_Primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x6916eee4)
			}
			{
				materials = [
					M_Glam_Torso_Tiger_Primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0xbd6b03c4)
			}
			{
				materials = [
					M_Glam_Torso_Tiger_Secondary
				]
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Glam_Torso_Tiger_Fur
				]
				shader = $cas_shader_hair
				name = qs(0xe72603fc)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Glam_Torso_Tiger`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Torso_Tiger`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
	}
	{
		desc_id = M_Glam_Torso_Gold
		frontend_desc = qs(0xd14cda2e)
		mesh = `models/CAR/Male/M_Glam_Torso_Gold`
		materials = [
			M_Glam_Torso_Gold_Primary
		]
		random_weight = 1.0
		genre = [
			`Glam	Rock`
		]
		acc_skeleton = `skeletons/Skel_M_Glam_Torso_Gold`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Torso_Gold`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
	}
	{
		desc_id = M_Glam_Torso_Kiss
		frontend_desc = qs(0x1a6924a3)
		mesh = `models/CAR/Male/M_Glam_Torso_Kiss`
		material_groups = [
			{
				materials = [
					M_Glam_Torso_Kiss_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					M_Glam_Torso_Kiss_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		random_weight = 1.0
		genre = [
			`Glam	Rock`
		]
		acc_skeleton = `skeletons/Skel_M_Glam_Torso_Kiss`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Torso_Kiss`
		acc_bones = [
			Bone_ACC_Torso_01
		]
	}
	{
		desc_id = M_Glam_torso_glamsuit
		frontend_desc = qs(0xf6992dd6)
		mesh = `models/CAR/Male/M_Glam_torso_glamsuit`
		material_groups = [
			{
				materials = [
					M_Glam_torso_glamsuit_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xd5db8e6f)
			}
			{
				materials = [
					M_Glam_torso_glamsuit_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		random_weight = 1.0
		genre = [
			`Glam	Rock`
		]
	}
	{
		desc_id = M_Glam_Torso_Mink
		frontend_desc = qs(0x49780f13)
		mesh = `models/CAR/Male/M_Glam_Torso_Mink`
		material_groups = [
			{
				materials = [
					M_Glam_Torso_Mink_Primary
				]
				shader = $cas_shader_hair
				name = qs(0x7a282392)
			}
			{
				materials = [
					M_Glam_Torso_Mink_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0x42923e18)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Glam_Torso_Mink`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Torso_Mink`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 1.0
		genre = [
			`Glam	Rock`
		]
		locked
	}
	{
		desc_id = M_Glam_Torso_Ljacket
		frontend_desc = qs(0xeb601aa1)
		mesh = `models/CAR/Male/M_Glam_Torso_Ljacket`
		material_groups = [
			{
				materials = [
					M_Glam_Torso_Ljacket_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Glam_Torso_Ljacket_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc9bbbd67)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Glam_Torso_Ljacket`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Torso_Ljacket`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		random_weight = 1.0
		genre = [
			`Glam	Rock`
		]
		locked
	}
	{
		desc_id = M_Glam_Torso_Jester
		frontend_desc = qs(0x406931b8)
		mesh = `models/CAR/Male/M_Glam_Torso_Jester`
		materials = [
			M_Glam_Torso_Jester_Primary
		]
		random_weight = 1.0
		genre = [
			`Glam	Rock`
		]
		locked
	}
	{
		desc_id = M_Glam_Torso_TshirtVest
		frontend_desc = qs(0xacd9b880)
		mesh = `models/CAR/Male/M_Glam_Torso_TshirtVest`
		random_weight = 1.0
		genre = [
			`Glam	Rock`
		]
	}
	{
		desc_id = M_Bmtl_Torso_Lars
		frontend_desc = qs(0x7fbbd35c)
		mesh = `models/CAR/Male/M_Bmtl_Torso_Lars`
		random_weight = 1.0
		genre = [
			`Black	Metal`
		]
	}
	{
		desc_id = M_Bmtl_Torso_Lars_1
		frontend_desc = qs(0x7585180d)
		mesh = `models/CAR/Male/M_Bmtl_Torso_Lars_1`
		material_groups = [
			{
				materials = [
					M_Bmtl_Torso_Lars_1_Cape
				]
				shader = $cas_shader_skin
				name = qs(0x162d24d4)
			}
			{
				materials = [
					M_Bmtl_Torso_Lars_1_Fur
				]
				shader = $cas_shader_skin
				name = qs(0xe72603fc)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Bmtl_Torso_Lars_1`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Torso_Lars_1`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			`Black	Metal`
		]
	}
	{
		desc_id = M_Bmtl_Torso_Lars_2
		frontend_desc = qs(0xb26225b2)
		mesh = `models/CAR/Male/M_Bmtl_Torso_Lars_2`
		material_groups = [
			{
				materials = [
					M_Bmtl_Torso_Lars_2_Tabard
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					M_Bmtl_Torso_Lars_2_Torso
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		genre = [
			`Black	Metal`
		]
		locked
	}
	{
		desc_id = M_Bmtl_Torso_Lars_3
		frontend_desc = qs(0xf17e3ab0)
		mesh = `models/CAR/Male/M_Bmtl_Torso_Lars_3`
		material_groups = [
			{
				materials = [
					M_Bmtl_Torso_Lars_3_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Bmtl_Torso_Lars_3_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		random_weight = 1.0
		genre = [
			`Black	Metal`
		]
		locked
	}
	{
		desc_id = M_Bmtl_Torso_Lars4
		frontend_desc = qs(0x410a8876)
		mesh = `models/CAR/Male/M_Bmtl_Torso_Lars4`
		material_groups = [
			{
				materials = [
					M_Bmtl_Torso_Lars4_Primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Bmtl_Torso_Lars_4`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Torso_Lars_4`
		acc_bones = [
			Bone_ACC_Torso_01
		]
		genre = [
			`Black	Metal`
		]
		locked
	}
	{
		desc_id = M_Bmtl_Torso_Skeleton
		frontend_desc = qs(0xeb74999f)
		mesh = `models/CAR/Male/M_Bmtl_Torso_Skeleton`
		random_weight = 1.0
		genre = [
			`Black	Metal`
		]
	}
	{
		desc_id = M_Bmtl_Torso_SkeletonBelt
		frontend_desc = qs(0xd1f5c120)
		mesh = `models/CAR/Male/M_Bmtl_Torso_SkeletonBelt`
		material_groups = [
			{
				materials = [
					M_Bmtl_Torso_SkeletonBelt_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					M_Bmtl_Torso_SkeletonBelt_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Bmtl_Torso_SkeletonBelt`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Torso_SkeletonBelt`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
		]
		genre = [
			`Black	Metal`
		]
	}
	{
		desc_id = M_Bmtl_Torso_PatternJacket
		frontend_desc = qs(0x12daf194)
		mesh = `models/CAR/Male/M_Bmtl_Torso_PatternJacket`
		random_weight = 1.0
		materials = [
			M_Bmtl_PatternJacket_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Bmtl_Torso_PatternJ`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Torso_PatternJacket`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
		]
		genre = [
			`Black	Metal`
		]
	}
	{
		desc_id = M_Bmtl_Torso_CoatRing
		frontend_desc = qs(0x5b5d16b9)
		mesh = `models/CAR/Male/M_Bmtl_Torso_CoatRing`
		material_groups = [
			{
				materials = [
					M_Metl_Torso_CoatRing_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Metl_Torso_CoatRing_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					M_Metl_Torso_CoatRing_Belt
				]
				shader = $cas_shader_skin
				name = qs(0x647ddfc6)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_BMTL_Torso_CoatRing`
		acc_ragdoll = `Ragdolls/CAR/Male/BMTL/Rag_M_BMTL_Torso_CoatRing`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			`Black	Metal`
		]
	}
	{
		desc_id = M_Bmtl_Torso_KDJacket
		frontend_desc = qs(0x78b42879)
		mesh = `models/CAR/Male/M_Bmtl_Torso_KDJacket`
		material_groups = [
			{
				materials = [
					M_Bmtl_Torso_KDJacket_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					M_Bmtl_Torso_KDJacket_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					M_Bmtl_Torso_KDJacket_Tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/Skel_M_Bmtl_Torso_KDJacket`
		acc_ragdoll = `Ragdolls/CAR/Male/BMTL/Rag_M_Bmtl_Torso_KDJacket`
		acc_bones = [
			Bone_ACC_Torso_01
			Bone_ACC_Torso_02
			Bone_ACC_Torso_03
			Bone_ACC_Torso_04
		]
		genre = [
			`Black	Metal`
		]
	}
]
