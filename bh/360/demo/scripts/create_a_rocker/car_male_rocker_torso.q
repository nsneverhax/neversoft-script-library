cas_male_torso = [
	{
		desc_id = m_torso_tshirt
		frontend_desc = qs(0x80c803f2)
		mesh = `models/car/male/m_torso_tshirt`
		random_weight = 1.0
		genre = [
			rock
			pop
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
		desc_id = shirtless
		frontend_desc = qs(0xb404a80c)
		random_weight = 0.0
	}
	{
		desc_id = m_torso_boneman
		frontend_desc = qs(0xecd1f08c)
		mesh = `models/car/male/m_torso_boneman`
		random_weight = 0.0
		locked
		genre = [
			rock
		]
	}
	{
		desc_id = m_torso_layered
		frontend_desc = qs(0x75e1cc5d)
		mesh = `models/car/male/m_torso_layered`
		random_weight = 1.0
		material_groups = [
			{
				materials = [
					m_torso_layered_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_torso_layered_secondary
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
		desc_id = m_torso_layerednostripe
		frontend_desc = qs(0x7a91fac9)
		mesh = `models/car/male/m_torso_layerednostripe`
		random_weight = 1.0
		material_groups = [
			{
				materials = [
					m_torso_layerednostripe_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_torso_layerednostripe_secondary
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
		desc_id = m_torso_hoodie
		frontend_desc = qs(0xc5fa8f19)
		mesh = `models/car/male/m_torso_hoodie`
		random_weight = 1.0
		material_groups = [
			{
				materials = [
					m_torso_hoodie_primary
				]
				shader = $cas_shader_skin
				name = qs(0x001541ab)
			}
			{
				materials = [
					m_torso_hoodie_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		genre = [
			rock
		]
		acc_skeleton = `skeletons/skel_m_torso_hoodie`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_torso_hoodie`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_torso_ninja
		frontend_desc = qs(0xd296152e)
		mesh = `models/car/male/m_torso_ninja`
		random_weight = 0.0
		material_groups = [
			{
				materials = [
					m_torso_ninja_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					m_torso_ninja_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd5145808)
			}
			{
				materials = [
					m_torso_ninja_arms
				]
				shader = $cas_shader_skin
				name = qs(0x2e53d20c)
			}
		]
		genre = [
			goth
		]
	}
	{
		desc_id = 0x8439d5a8
		frontend_desc = qs(0x2c29a8be)
		mesh = 0xa9e79022
		material_groups = [
			{
				materials = [
					0xe16f447e
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					0xb781759a
				]
				shader = $cas_shader_skin
				name = qs(0xe582d049)
			}
			{
				materials = [
					0xcfc08419
				]
				shader = $cas_shader_skin
				name = qs(0x99e3f592)
			}
			{
				materials = [
					0x84079cc0
				]
				shader = $cas_shader_skin
				name = qs(0x84f1b1b5)
			}
			{
				materials = [
					0xecb12620
				]
				shader = $cas_shader_skin
				name = qs(0x6d64bf70)
			}
			{
				materials = [
					0xb5762b4e
				]
				shader = $cas_shader_skin
				name = qs(0x031d52e9)
			}
		]
		random_weight = 0.0
	}
	{
		desc_id = m_pop_torso_dragon
		frontend_desc = qs(0x66d76586)
		mesh = `models/car/male/m_pop_torso_dragon`
		material_groups = [
			{
				materials = [
					m_pop_torso_dragon_primary
				]
				shader = $cas_shader_skin
				name = qs(0x181ef56c)
			}
			{
				materials = [
					m_pop_torso_dragon_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x9803693e)
			}
		]
		acc_skeleton = `skeletons/skel_m_pop_torso_dragon`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_pop_torso_dragon`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 0.0
	}
	{
		desc_id = m_pop_torso_leather
		frontend_desc = qs(0xca431d9a)
		mesh = `models/car/male/m_pop_torso_leather`
		material_groups = [
			{
				materials = [
					m_pop_torso_leather_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_pop_torso_leather_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_pop_torso_leather`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_pop_torso_leather`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			pop
		]
	}
	{
		desc_id = m_pop_torso_openshirt
		frontend_desc = qs(0x903c37b0)
		mesh = `models/car/male/m_pop_torso_openshirt`
		materials = [
			m_pop_torso_openshirt_primary
			m_pop_torso_openshirt_secondary
		]
		material_groups = [
			{
				materials = [
					m_pop_torso_openshirt_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_pop_torso_openshirt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x233cd0bb)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_pop_torso_openshirt`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_pop_torso_openshirt`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
		genre = [
			pop
		]
	}
	{
		desc_id = m_pop_torso_suit
		frontend_desc = qs(0x7b3b9bbd)
		mesh = `models/car/male/m_pop_torso_suit`
		material_groups = [
			{
				materials = [
					m_pop_torso_suit_primary
				]
				shader = $cas_shader_skin
				name = qs(0x7a282392)
			}
			{
				materials = [
					m_pop_torso_suit_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					0x2f0b804e
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					0x037395de
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		random_weight = 1.0
		genre = [
			pop
		]
	}
	{
		desc_id = m_pop_torso_turtleshirt
		frontend_desc = qs(0x483148bd)
		mesh = `models/car/male/m_pop_torso_turtleshirt`
		random_weight = 1.0
		material_groups = [
			{
				materials = [
					m_pop_torso_turtleshirt_primary
				]
				shader = $cas_shader_skin
				name = qs(0x72ad86ad)
			}
			{
				materials = [
					m_pop_torso_turtleshirt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/skel_m_pop_torso_turtleshirt`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_pop_torso_turtleshirt`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			pop
		]
	}
	{
		desc_id = m_pop_torso_vest
		frontend_desc = qs(0x3b3d04c5)
		mesh = `models/car/male/m_pop_torso_vest`
		random_weight = 1.0
		genre = [
			pop
		]
		material_groups = [
			{
				materials = [
					m_pop_torso_vest_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					m_pop_torso_vest_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/skel_m_pop_torso_vest`
		acc_ragdoll = `ragdolls/car/male/pop/rag_m_pop_torso_vest`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = 0x503c7472
		frontend_desc = qs(0x0472f28f)
		mesh = 0x97e69c72
		random_weight = 1.0
		genre = [
			pop
		]
		material_groups = [
			{
				materials = [
					0xbbd6be5a
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					0x1b01d587
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = 0xdba3f24d
		acc_ragdoll = 0x141bab7d
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
	}
	{
		desc_id = 0xb0b6c649
		frontend_desc = qs(0x76f58e8c)
		mesh = 0x6c1cc1b6
		random_weight = 0.0
		locked
		genre = [
			pop
		]
		material_groups = [
			{
				materials = [
					0x2cdb7b56
				]
				shader = $cas_shader_skin
				name = qs(0xf65ad30f)
			}
			{
				materials = [
					0x43645f99
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
	}
	{
		desc_id = 0xb6082bbe
		frontend_desc = qs(0x1a3548c4)
		mesh = 0x71d2c3be
		random_weight = 0.0
		genre = [
			pop
		]
		material_groups = [
			{
				materials = [
					0x43eb248e
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x6916eee4)
			}
			{
				materials = [
					0x43eb248e
				]
				shader = $cas_shader_skin_masked2
				name = qs(0xc26686da)
			}
			{
				materials = [
					0xee8f57fb
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					0xa755138f
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x58cf8c6c)
			}
		]
		acc_skeleton = 0x3d97ad81
		acc_ragdoll = 0xf22ff4b1
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
	}
	{
		desc_id = 0x5f6b8e8b
		frontend_desc = qs(0x051ee636)
		mesh = 0x98b1668b
		random_weight = 0.0
		locked
		genre = [
			pop
		]
		material_groups = [
			{
				materials = [
					0xbd7628a7
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					0xebc7ef1f
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xe929ac48)
			}
			{
				materials = [
					0xebc7ef1f
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x5273dbeb)
			}
			{
				materials = [
					0xaeea632d
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		acc_skeleton = 0xd4f408b4
		acc_ragdoll = 0x1b4c5184
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_punk_torso_jacket
		frontend_desc = qs(0xdec0d31b)
		mesh = `models/car/male/m_punk_torso_jacket`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_jacket`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_jacket`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_list = [
			m_punk_torso_jacket_02
			m_punk_torso_jacket_03
			m_punk_torso_jacket_04
		]
		swatch_texture = `tex/models/characters/car/male/punk/swatch_denim03`
	}
	{
		desc_id = m_punk_torso_jacket_02
		frontend_desc = qs(0xd58d8dcd)
		mesh = `models/car/male/m_punk_torso_jacket_02`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_jacket`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_jacket`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = m_punk_torso_jacket
		swatch_texture = `tex/models/characters/car/male/punk/swatch_denim02`
	}
	{
		desc_id = m_punk_torso_jacket_03
		frontend_desc = qs(0x718e92e2)
		mesh = `models/car/male/m_punk_torso_jacket_03`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_jacket`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_jacket`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = m_punk_torso_jacket
		swatch_texture = `tex/models/characters/car/male/punk/swatch_denim01`
	}
	{
		desc_id = m_punk_torso_jacket_04
		frontend_desc = qs(0x8221b6e6)
		mesh = `models/car/male/m_punk_torso_jacket_04`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_jacket`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_jacket`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = m_punk_torso_jacket
		swatch_texture = `tex/models/characters/car/male/punk/swatch_denim04`
	}
	{
		desc_id = m_punk_torso_hood
		frontend_desc = qs(0xd017a37b)
		mesh = `models/car/male/m_punk_torso_hood`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_hood_03`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_hood_03`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_list = [
			m_punk_torso_hood_02
			m_punk_torso_hood_03
			m_punk_torso_hood_04
		]
		swatch_texture = `tex/models/characters/car/male/punk/swatch_vest01`
	}
	{
		desc_id = m_punk_torso_hood_02
		frontend_desc = qs(0xc2641269)
		mesh = `models/car/male/m_punk_torso_hood_02`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_hood_03`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_hood_03`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = m_punk_torso_hood
		swatch_texture = `tex/models/characters/car/male/punk/swatch_vest02`
	}
	{
		desc_id = m_punk_torso_hood_03
		frontend_desc = qs(0xdb1ea893)
		mesh = `models/car/male/m_punk_torso_hood_03`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_hood_03`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_hood_03`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = m_punk_torso_hood
		swatch_texture = `tex/models/characters/car/male/punk/swatch_vest03`
	}
	{
		desc_id = m_punk_torso_hood_04
		frontend_desc = qs(0x755fa713)
		mesh = `models/car/male/m_punk_torso_hood_04`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_hood_03`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_hood_03`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = m_punk_torso_hood
		swatch_texture = `tex/models/characters/car/male/punk/swatch_vest04`
	}
	{
		desc_id = m_punk_torso_beater
		frontend_desc = qs(0x61e6dc36)
		mesh = `models/car/male/m_punk_torso_beater`
		materials = [
			m_punk_torso_beater_primary
		]
		random_weight = 1.0
		genre = [
			punk
		]
	}
	{
		desc_id = m_punk_torso_bomber
		frontend_desc = qs(0x67bd487c)
		mesh = `models/car/male/m_punk_torso_bomber`
		materials = [
			m_punk_torso_bomber_primary
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_punk_torso_bomber`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_bomber`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			punk
		]
	}
	{
		desc_id = m_punk_torso_jstripe
		frontend_desc = qs(0x223511bf)
		mesh = `models/car/male/m_punk_torso_jstripe`
		locked
		material_groups = [
			{
				materials = [
					m_punk_torso_jstripe_primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x6916eee4)
			}
			{
				materials = [
					m_punk_torso_jstripe_secondary
				]
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_punk_torso_jstripe`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_jstripe`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
		genre = [
			punk
		]
	}
	{
		desc_id = m_punk_torso_bowling
		frontend_desc = qs(0x6c89158b)
		mesh = `models/car/male/m_punk_torso_bowling`
		material_groups = [
			{
				materials = [
					m_punk_torso_bowling_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_punk_torso_bowling_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x233cd0bb)
			}
		]
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_bowling`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_bowling`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_punk_torso_johnny1
		frontend_desc = qs(0x936f53d8)
		mesh = `models/car/male/m_punk_torso_johnny1`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_johnny1`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_johnny1`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_list = [
			m_punk_torso_johnny1_02
			m_punk_torso_johnny1_03
			m_punk_torso_johnny1_04
		]
		swatch_texture = `tex/models/characters/car/male/punk/swatch_leather01`
	}
	{
		desc_id = m_punk_torso_johnny1_02
		frontend_desc = qs(0xfb918590)
		mesh = `models/car/male/m_punk_torso_johnny1_02`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_johnny1`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_johnny1`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = m_punk_torso_johnny1
		swatch_texture = `tex/models/characters/car/male/punk/swatch_leather02`
	}
	{
		desc_id = m_punk_torso_johnny1_03
		frontend_desc = qs(0x59773dda)
		mesh = `models/car/male/m_punk_torso_johnny1_03`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_johnny1`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_johnny1`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = m_punk_torso_johnny1
		swatch_texture = `tex/models/characters/car/male/punk/swatch_leather03`
	}
	{
		desc_id = m_punk_torso_johnny1_04
		frontend_desc = qs(0x98fa9ce7)
		mesh = `models/car/male/m_punk_torso_johnny1_04`
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_johnny1`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_johnny1`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		swatch_for = m_punk_torso_johnny1
		swatch_texture = `tex/models/characters/car/male/punk/swatch_leather04`
	}
	{
		desc_id = m_punk_torso_jny_1
		frontend_desc = qs(0x15360a01)
		mesh = `models/car/male/m_punk_torso_jny_1`
		material_groups = [
			{
				materials = [
					m_punk_torso_jny_1_primary
				]
				shader = $cas_shader_skin
				name = qs(0x001541ab)
			}
			{
				materials = [
					m_punk_torso_jny_1_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
		]
		acc_skeleton = `skeletons/skel_m_punk_torso_jny_1`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_jny_1`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 1.0
		genre = [
			punk
		]
	}
	{
		desc_id = m_punk_torso_jny_2
		frontend_desc = qs(0xba16efab)
		mesh = `models/car/male/m_punk_torso_jny_2`
		acc_skeleton = `skeletons/skel_m_punk_torso_jny_2`
		acc_ragdoll = `ragdolls/car/male/punk/rag_m_punk_torso_jny_2`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 1.0
		genre = [
			punk
		]
		locked
	}
	{
		desc_id = 0x204fe97b
		frontend_desc = qs(0x4c30d951)
		mesh = 0x0d91acf1
		acc_skeleton = 0xaa6e064f
		acc_ragdoll = 0x08ed73a2
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		material_groups = [
			{
				materials = [
					0xcd87e526
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xe582d049)
			}
			{
				materials = [
					0x64321d50
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xf9d45296)
			}
			{
				materials = [
					0x64321d50
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x702a88c7)
			}
			{
				materials = [
					0xe1eb8c9c
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x8e2b4f9d)
			}
		]
		random_weight = 1.0
		genre = [
			punk
		]
	}
	{
		desc_id = m_clsc_torso_clive
		frontend_desc = qs(0xfc391b7c)
		mesh = `models/car/male/m_clsc_torso_clive`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		material_groups = [
			{
				materials = [
					m_clsc_torso_clive_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_clsc_torso_clive_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		acc_skeleton = `skeletons/skel_m_clsc_torso_clive`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_torso_clive`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_clsc_torso_clive2
		frontend_desc = qs(0x2d1241d7)
		mesh = `models/car/male/m_clsc_torso_clive2`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		material_groups = [
			{
				materials = [
					m_clsc_torso_clive2_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_clsc_torso_clive2_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xccf7fd16)
			}
		]
		acc_skeleton = `skeletons/skel_m_clsc_torso_clive2`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_torso_clive2`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		locked
	}
	{
		desc_id = m_clsc_torso_clive3
		frontend_desc = qs(0x8597c3d4)
		mesh = `models/car/male/m_clsc_torso_clive3`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		material_groups = [
			{
				materials = [
					m_clsc_torso_clive3_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_clsc_torso_clive3_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xe4340e11)
			}
			{
				materials = [
					m_clsc_torso_clive3_third
				]
				shader = $cas_shader_skin
				name = qs(0xccf7fd16)
			}
			{
				materials = [
					m_clsc_torso_clive3_waist
				]
				shader = $cas_shader_skin
				name = qs(0xae032c82)
			}
		]
		acc_skeleton = `skeletons/skel_m_clsc_torso_clive3`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_torso_clive3`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		locked
	}
	{
		desc_id = m_clsc_torso_clive4
		frontend_desc = qs(0x755fa713)
		mesh = `models/car/male/m_clsc_torso_clive4`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		material_groups = [
			{
				materials = [
					m_clsc_torso_clive4_jacket
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_clsc_torso_clive4_tassels
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		acc_skeleton = `skeletons/skel_m_clsc_torso_clive4`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_torso_clive4`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		locked
	}
	{
		desc_id = m_clsc_torso_scarf
		frontend_desc = qs(0x98fd55e5)
		mesh = `models/car/male/m_clsc_torso_scarf`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		material_groups = [
			{
				materials = [
					m_clsc_torso_scarf_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_clsc_torso_scarf_vest
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
		]
		acc_skeleton = `skeletons/skel_m_clsc_torso_scarf`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_torso_scarf`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_clsc_torso_confed
		frontend_desc = qs(0x2ec68eb5)
		mesh = `models/car/male/m_clsc_torso_confed`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		materials = [
			m_clsc_torso_confed_primary
		]
		acc_skeleton = `skeletons/skel_m_clsc_torso_confed`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_torso_confed`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_clsc_torso_clrdjakt
		frontend_desc = qs(0x5ef3da0a)
		mesh = `models/car/male/m_clsc_torso_clrdjakt`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		material_groups = [
			{
				materials = [
					m_clsc_torso_clrdjakt_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_clsc_torso_clrdjakt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		acc_skeleton = `skeletons/skel_m_clsc_torso_clrdjakt`
		acc_ragdoll = `ragdolls/car/male/clsc/rag_m_clsc_torso_clrdjakt`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_clsc_torso_santana_d1
		frontend_desc = qs(0xde2ef3a8)
		mesh = `models/car/male/m_clsc_torso_santana_d1`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		swatch_list = [
			m_clsc_torso_santana_d2
			m_clsc_torso_santana_d3
			m_clsc_torso_santana_d4
		]
		swatch_texture = `tex/models/characters/car/male/clsc/swatch_santana_torso_diamonds`
		locked
	}
	{
		desc_id = m_clsc_torso_santana_d2
		frontend_desc = qs(0xe5ed87ae)
		mesh = `models/car/male/m_clsc_torso_santana_d2`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		swatch_for = m_clsc_torso_santana_d1
		swatch_texture = `tex/models/characters/car/male/clsc/swatch_santana_torso_flowers`
	}
	{
		desc_id = m_clsc_torso_santana_d3
		frontend_desc = qs(0xe7ba4448)
		mesh = `models/car/male/m_clsc_torso_santana_d3`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		swatch_for = m_clsc_torso_santana_d1
		swatch_texture = `tex/models/characters/car/male/clsc/swatch_santana_torso_pinstripe`
	}
	{
		desc_id = m_clsc_torso_santana_d4
		frontend_desc = qs(0x9146af69)
		mesh = `models/car/male/m_clsc_torso_santana_d4`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		swatch_for = m_clsc_torso_santana_d1
		swatch_texture = `tex/models/characters/car/male/clsc/swatch_santana_torso_plaid`
	}
	{
		desc_id = m_goth_torso_devilwings
		frontend_desc = qs(0xd7d6cd09)
		mesh = `models/car/male/m_goth_torso_devilwings`
		random_weight = 1.0
		genre = [
			goth
		]
		material_groups = [
			{
				materials = [
					m_goth_torso_devilwings_primary
				]
				shader = $cas_shader_skin
				name = qs(0x3c4d23a1)
			}
			{
				materials = [
					m_goth_torso_devilwings_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x693b5da0)
			}
		]
		acc_skeleton = `skeletons/skel_m_goth_torso_devilwings`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_torso_devilwings`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		locked
	}
	{
		desc_id = m_goth_torso_sfvest
		frontend_desc = qs(0xaa5e242b)
		mesh = `models/car/male/m_goth_torso_sfvest`
		random_weight = 1.0
		genre = [
			goth
		]
		material_groups = [
			{
				materials = [
					m_goth_torso_sfvest_primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xc26686da)
			}
			{
				materials = [
					m_goth_torso_sfvest_primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x1d55e1b4)
			}
		]
		locked
	}
	{
		desc_id = m_goth_torso_strait
		frontend_desc = qs(0xcb53adfe)
		mesh = `models/car/male/m_goth_torso_strait`
		random_weight = 1.0
		genre = [
			goth
		]
		material_groups = [
			{
				materials = [
					m_goth_torso_strait_primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					m_goth_torso_strait_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
			{
				materials = [
					m_goth_torso_strait_metal
				]
				shader = $cas_shader_skin
				name = qs(0x6ad7504e)
			}
		]
		acc_skeleton = `skeletons/skel_m_goth_torso_strait`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_torso_strait`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_goth_torso_madmax
		frontend_desc = qs(0x010fa69b)
		mesh = `models/car/male/m_goth_torso_madmax`
		materials = [
			m_goth_torso_madmax_leather
			m_goth_torso_madmax_sleeve
		]
		material_groups = [
			{
				materials = [
					m_goth_torso_madmax_leather
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					m_goth_torso_madmax_sleeve
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_m_goth_torso_madmax`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_torso_madmax`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_goth_torso_tux
		frontend_desc = qs(0x3a5a5695)
		mesh = `models/car/male/m_goth_torso_tux`
		$cas_male_hair_common_settings
		material_groups = [
			{
				materials = [
					m_goth_torso_tux_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_goth_torso_tux_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xe4340e11)
			}
			{
				materials = [
					m_goth_torso_tux_shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_goth_torso_tux_tie
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		random_weight = 1.0
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_m_goth_torso_tux`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_torso_tux`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
	}
	{
		desc_id = m_goth_torso_poet
		frontend_desc = qs(0x5ad056ff)
		mesh = `models/car/male/m_goth_torso_poet`
		materials = [
			m_goth_torso_poet_primary
		]
		random_weight = 1.0
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_m_goth_torso_poet`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_torso_poet`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
	}
	{
		desc_id = m_goth_torso_vest
		frontend_desc = qs(0x283675e8)
		mesh = `models/car/male/m_goth_torso_vest`
		random_weight = 1.0
		material_groups = [
			{
				materials = [
					m_goth_torso_vest_primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_m_goth_torso_vest`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_goth_torso_vest`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
	}
	{
		desc_id = m_fun_torso_angelw
		frontend_desc = qs(0xc8fe9880)
		mesh = `models/car/male/m_fun_torso_angelw`
		materials = [
			m_fun_torso_angelw_wing
		]
		genre = [
			goth
		]
		acc_skeleton = `skeletons/skel_m_fun_torso_angelw`
		acc_ragdoll = `ragdolls/car/male/goth/rag_m_fun_torso_angelw`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 0.0
	}
	{
		desc_id = m_mtl_torso_axel1
		frontend_desc = qs(0x89954397)
		mesh = `models/car/male/m_mtl_torso_axel1`
		material_groups = [
			{
				materials = [
					m_metl_torso_axel1_primary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					m_metl_torso_axel1_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_m_metl_torso_axel1`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_torso_axel1`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_metl_torso_axel2
		frontend_desc = qs(0xd3caf88a)
		mesh = `models/car/male/m_metl_torso_axel2`
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_m_metl_torso_axel2`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_torso_axel2`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_metl_torso_axel_1
		frontend_desc = qs(0x88c9b801)
		mesh = `models/car/male/m_metl_torso_axel_1`
		materials = [
			m_metl_torso_axel_1_vest
			m_metl_torso_axel_1_flannel
			m_metl_torso_axel_1_shirt
		]
		material_groups = [
			{
				materials = [
					m_metl_torso_axel_1_vest
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					m_metl_torso_axel_1_flannel
				]
				shader = $cas_shader_skin
				name = qs(0xd5c841cf)
			}
			{
				materials = [
					m_metl_torso_axel_1_shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = m_metl_torso_axel2gh5
		frontend_desc = qs(0x39c9192e)
		mesh = `models/car/male/m_metl_torso_axel2gh5`
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		locked
		material_groups = [
			{
				materials = [
					axel2_torso_primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0xc26686da)
			}
			{
				materials = [
					axel2_torso_primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x6e0830a3)
			}
		]
	}
	{
		desc_id = m_metl_torso_axel3
		frontend_desc = qs(0xce8065a3)
		mesh = `models/car/male/m_mtl_torso_axel3`
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		locked
		material_groups = [
			{
				materials = [
					axel3_torso_shirt
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					axel3_torso_jacket
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
	}
	{
		desc_id = m_metl_torso_axel4
		frontend_desc = qs(0xdeca0c09)
		mesh = `models/car/male/m_mtl_torso_axel4`
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		locked
		material_groups = [
			{
				materials = [
					axel4_torso_primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					axel4_torso_primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x83ec98a9)
			}
		]
	}
	{
		desc_id = 0xa143ec2a
		frontend_desc = qs(0x2770296a)
		mesh = 0x8c9da9a0
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		material_groups = [
			{
				materials = [
					0xce793969
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					0xce793969
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x83ec98a9)
			}
		]
	}
	{
		desc_id = m_metl_torso_straps
		frontend_desc = qs(0xd7d98d81)
		mesh = `models/car/male/m_metl_torso_straps`
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_m_metl_torso_axel1`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_torso_axel1`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_metl_torso_lthrjkt
		frontend_desc = qs(0x6a7176b4)
		mesh = `models/car/male/m_metl_torso_lthrjkt`
		material_groups = [
			{
				materials = [
					m_metl_torso_lthrjkt_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_metl_torso_lthrjkt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_metl_torso_lthrjkt_stripe
				]
				shader = $cas_shader_skin
				name = qs(0x42c13822)
			}
		]
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		acc_skeleton = `skeletons/skel_m_metl_torso_lthrjkt`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_torso_lthrjkt`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_metl_torso_unbttond
		frontend_desc = qs(0x93a71016)
		mesh = `models/car/male/m_metl_torso_unbttond`
		materials = [
			m_metl_torso_unbttond_primary
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_metl_torso_unbttond`
		acc_ragdoll = `ragdolls/car/male/metl/rag_m_metl_torso_unbttond`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			`heavy metal`
		]
		polaroid = car_fullsleeves
	}
	{
		desc_id = m_metl_torso_sleveless
		frontend_desc = qs(0xf59c4d58)
		mesh = `models/car/male/m_metl_torso_sleveless`
		materials = [
			m_metl_torso_sleveless_primary
		]
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = m_metl_torso_armor
		frontend_desc = qs(0x55c4874c)
		mesh = `models/car/male/m_metl_torso_armor`
		random_weight = 0.4
		genre = [
			`heavy metal`
		]
		polaroid = car_suitofarmor
	}
	{
		desc_id = m_metl_torso_sleevecut
		frontend_desc = qs(0xb2be70ae)
		mesh = `models/car/male/m_metl_torso_sleevecut`
		materials = [
			m_metl_torso_sleevecut_primary
		]
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = m_metl_torso_jamesalt
		frontend_desc = qs(0xaae03cbd)
		mesh = `models/car/male/m_metl_torso_jamesalt`
		materials = [
			m_metl_torso_jamesalt_primary
		]
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
	}
	{
		desc_id = m_rock_torso_tie
		frontend_desc = qs(0xa0d0d3bb)
		mesh = `models/car/male/m_rock_torso_tie`
		material_groups = [
			{
				materials = [
					m_rock_torso_tie_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_rock_torso_tie_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1c9f493b)
			}
			{
				materials = [
					m_rock_torso_tie_tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x8e2b4f9d)
			}
		]
		random_weight = 1.0
		genre = [
			rock
		]
		acc_skeleton = `skeletons/skel_m_rock_torso_tie`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_torso_tie`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_rock_torso_bandana
		frontend_desc = qs(0x5c95d8b1)
		mesh = `models/car/male/m_rock_torso_bandana`
		random_weight = 1.0
		genre = [
			rock
		]
		acc_skeleton = `skeletons/skel_m_rock_torso_bandana`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_torso_bandana`
		acc_bones = [
			bone_acc_torso_01
		]
	}
	{
		desc_id = m_rock_torso_ozzycoat
		frontend_desc = qs(0x0fd4c4e4)
		mesh = `models/car/male/m_rock_torso_ozzycoat`
		material_groups = [
			{
				materials = [
					m_rock_torso_ozzycoat_primary
				]
				shader = $cas_shader_skin
				name = qs(0x7a282392)
			}
			{
				materials = [
					m_rock_torso_ozzycoat_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_rock_torso_ozzycoat`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_torso_ozzycoat`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			rock
		]
		random_weight = 0.25
	}
	{
		desc_id = m_rock_torso_erollbowl
		frontend_desc = qs(0x78855aee)
		mesh = `models/car/male/m_rock_torso_erollbowl`
		material_groups = [
			{
				materials = [
					m_rock_torso_erollbowl_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_rock_torso_erollbowl_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd5145808)
			}
		]
		random_weight = 1.0
		genre = [
			rock
		]
		acc_skeleton = `skeletons/skel_m_rock_torso_erollbowl`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_torso_erollbowl`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
	}
	{
		desc_id = m_rock_torso_sleeveless
		frontend_desc = qs(0xd8b0b44a)
		mesh = `models/car/male/m_rock_torso_sleeveless`
		materials = [
			m_rock_torso_sleeveless_primary
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_rock_torso_sleeveless`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_torso_sleeveless`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_torso_ljacket
		frontend_desc = qs(0x368fb7d4)
		mesh = `models/car/male/m_rock_torso_ljacket`
		material_groups = [
			{
				materials = [
					m_rock_torso_ljacket_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_rock_torso_ljacket_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_rock_torso_ljacket`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_torso_ljacket`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_torso_ripshirt
		frontend_desc = qs(0xac86e5d7)
		mesh = `models/car/male/m_rock_torso_ripshirt`
		materials = [
			m_rock_torso_ripshirt_primary
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_torso_rolledslvs
		frontend_desc = qs(0x2d4d7f8a)
		mesh = `models/car/male/m_rock_torso_rolledslvs`
		materials = [
			m_rock_torso_rolledslvs_primary
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_torso_spadesuit
		frontend_desc = qs(0x87c6a96b)
		mesh = `models/car/male/m_rock_torso_spadesuit`
		material_groups = [
			{
				materials = [
					m_rock_torso_spadesuit_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_rock_torso_spadesuit_secondary
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
		desc_id = m_rock_torso_leather
		frontend_desc = qs(0x1b18b97f)
		mesh = `models/car/male/m_rock_torso_leather`
		material_groups = [
			{
				materials = [
					m_rock_torso_leather_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_rock_torso_leather_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_rock_torso_leather`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_rock_torso_leather`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			rock
		]
		locked
	}
	{
		desc_id = 0x282aa447
		frontend_desc = qs(0x6be12145)
		mesh = 0x256a103c
		material_groups = [
			{
				materials = [
					0x5b9985ae
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					0xdadaf855
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					0x021e99ee
				]
				shader = $cas_shader_skin
				name = qs(0xd8d7273a)
			}
			{
				materials = [
					0x9d5bad4b
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					0xf25e114c
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
		desc_id = m_torso_tasselvest
		frontend_desc = qs(0xa559f15c)
		mesh = `models/car/male/m_torso_tasselvest`
		material_groups = [
			{
				materials = [
					m_torso_tasselvest_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_torso_tasselvest_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xb43c5b4e)
			}
		]
		random_weight = 0.1
		acc_skeleton = `skeletons/skel_m_torso_tasselvest`
		acc_ragdoll = `ragdolls/car/male/rock/rag_m_torso_tasselvest`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_torso_jersey
		frontend_desc = qs(0x6b2f7573)
		mesh = `models/car/male/m_rock_torso_jersey`
		material_groups = [
			{
				materials = [
					m_rock_torso_jersey_primary
				]
				shader = $cas_shader_skin
				name = qs(0x3c42e759)
			}
			{
				materials = [
					m_rock_torso_jersey_secondary
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
		desc_id = m_rock_torso_workshirt
		frontend_desc = qs(0x539a7019)
		mesh = `models/car/male/m_rock_torso_workshirt`
		material_groups = [
			{
				materials = [
					m_rock_torso_workshirt_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_rock_torso_workshirt_secondary
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
		desc_id = m_rock_torso_jcashvest
		frontend_desc = qs(0x0de20777)
		mesh = `models/car/male/m_rock_torso_jcashvest`
		material_groups = [
			{
				materials = [
					m_rock_torso_jcashvest_primary
				]
				shader = $cas_shader_skin
				name = qs(0x7a282392)
			}
			{
				materials = [
					m_rock_torso_jcashvest_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					m_rock_torso_jcashvest_tertiary
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
		desc_id = m_glam_torso_rags
		frontend_desc = qs(0x56b233aa)
		mesh = `models/car/male/m_glam_torso_rags`
		materials = [
			m_glam_torso_rags_primary
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
	}
	{
		desc_id = m_glam_torso_champ
		frontend_desc = qs(0x59c78648)
		mesh = `models/car/male/m_glam_torso_champ`
		materials = [
			m_glam_torso_champ_primary
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		acc_skeleton = `skeletons/skel_m_glam_torso_champ`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_torso_champ`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_glam_torso_tiger
		frontend_desc = qs(0x71c4b537)
		mesh = `models/car/male/m_glam_torso_tiger`
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		material_groups = [
			{
				materials = [
					m_glam_torso_tiger_primary
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x6916eee4)
			}
			{
				materials = [
					m_glam_torso_tiger_primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0xbd6b03c4)
			}
			{
				materials = [
					m_glam_torso_tiger_secondary
				]
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					0xee29e58f
				]
				shader = $cas_shader_hair
				name = qs(0xe72603fc)
			}
		]
		acc_skeleton = `skeletons/skel_m_glam_torso_tiger`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_torso_tiger`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
	}
	{
		desc_id = m_glam_torso_gold
		frontend_desc = qs(0xd14cda2e)
		mesh = `models/car/male/m_glam_torso_gold`
		materials = [
			m_glam_torso_gold_primary
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		acc_skeleton = `skeletons/skel_m_glam_torso_gold`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_torso_gold`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_glam_torso_kiss
		frontend_desc = qs(0x1a6924a3)
		mesh = `models/car/male/m_glam_torso_kiss`
		material_groups = [
			{
				materials = [
					m_glam_torso_kiss_primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					m_glam_torso_kiss_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		acc_skeleton = `skeletons/skel_m_glam_torso_kiss`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_torso_kiss`
		acc_bones = [
			bone_acc_torso_01
		]
	}
	{
		desc_id = m_glam_torso_glamsuit
		frontend_desc = qs(0xf6992dd6)
		mesh = `models/car/male/m_glam_torso_glamsuit`
		material_groups = [
			{
				materials = [
					m_glam_torso_glamsuit_primary
				]
				shader = $cas_shader_skin
				name = qs(0xd5db8e6f)
			}
			{
				materials = [
					m_glam_torso_glamsuit_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
	}
	{
		desc_id = m_glam_torso_mink
		frontend_desc = qs(0x49780f13)
		mesh = `models/car/male/m_glam_torso_mink`
		material_groups = [
			{
				materials = [
					m_glam_torso_mink_primary
				]
				shader = $cas_shader_hair
				name = qs(0x7a282392)
			}
			{
				materials = [
					m_glam_torso_mink_secondary
				]
				shader = $cas_shader_hair
				name = qs(0x42923e18)
			}
		]
		acc_skeleton = `skeletons/skel_m_glam_torso_mink`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_torso_mink`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		locked
	}
	{
		desc_id = m_glam_torso_ljacket
		frontend_desc = qs(0xeb601aa1)
		mesh = `models/car/male/m_glam_torso_ljacket`
		material_groups = [
			{
				materials = [
					m_glam_torso_ljacket_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_glam_torso_ljacket_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc9bbbd67)
			}
		]
		acc_skeleton = `skeletons/skel_m_glam_torso_ljacket`
		acc_ragdoll = `ragdolls/car/male/glam/rag_m_glam_torso_ljacket`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		locked
	}
	{
		desc_id = m_glam_torso_jester
		frontend_desc = qs(0x406931b8)
		mesh = `models/car/male/m_glam_torso_jester`
		materials = [
			m_glam_torso_jester_primary
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		locked
	}
	{
		desc_id = 0xeeda69fd
		frontend_desc = qs(0xacd9b880)
		mesh = 0x1e7b2b14
		random_weight = 1.0
		genre = [
			`glam rock`
		]
	}
	{
		desc_id = m_bmtl_torso_lars
		frontend_desc = qs(0x7fbbd35c)
		mesh = `models/car/male/m_bmtl_torso_lars`
		random_weight = 1.0
		genre = [
			`black metal`
		]
	}
	{
		desc_id = m_bmtl_torso_lars_1
		frontend_desc = qs(0x7585180d)
		mesh = `models/car/male/m_bmtl_torso_lars_1`
		material_groups = [
			{
				materials = [
					m_bmtl_torso_lars_1_cape
				]
				shader = $cas_shader_skin
				name = qs(0x162d24d4)
			}
			{
				materials = [
					m_bmtl_torso_lars_1_fur
				]
				shader = $cas_shader_skin
				name = qs(0xe72603fc)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_bmtl_torso_lars_1`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_torso_lars_1`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			`black metal`
		]
	}
	{
		desc_id = m_bmtl_torso_lars_2
		frontend_desc = qs(0xb26225b2)
		mesh = `models/car/male/m_bmtl_torso_lars_2`
		material_groups = [
			{
				materials = [
					m_bmtl_torso_lars_2_tabard
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					m_bmtl_torso_lars_2_torso
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		genre = [
			`black metal`
		]
		locked
	}
	{
		desc_id = m_bmtl_torso_lars_3
		frontend_desc = qs(0xf17e3ab0)
		mesh = `models/car/male/m_bmtl_torso_lars_3`
		material_groups = [
			{
				materials = [
					m_bmtl_torso_lars_3_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_bmtl_torso_lars_3_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		random_weight = 1.0
		genre = [
			`black metal`
		]
		locked
	}
	{
		desc_id = m_bmtl_torso_lars4
		frontend_desc = qs(0x410a8876)
		mesh = `models/car/male/m_bmtl_torso_lars4`
		material_groups = [
			{
				materials = [
					m_bmtl_torso_lars4_primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_bmtl_torso_lars_4`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_torso_lars_4`
		acc_bones = [
			bone_acc_torso_01
		]
		genre = [
			`black metal`
		]
		locked
	}
	{
		desc_id = m_bmtl_torso_skeleton
		frontend_desc = qs(0xeb74999f)
		mesh = `models/car/male/m_bmtl_torso_skeleton`
		random_weight = 1.0
		genre = [
			`black metal`
		]
	}
	{
		desc_id = m_bmtl_torso_skeletonbelt
		frontend_desc = qs(0xd1f5c120)
		mesh = `models/car/male/m_bmtl_torso_skeletonbelt`
		material_groups = [
			{
				materials = [
					m_bmtl_torso_skeletonbelt_primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					m_bmtl_torso_skeletonbelt_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_bmtl_torso_skeletonbelt`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_torso_skeletonbelt`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
		genre = [
			`black metal`
		]
	}
	{
		desc_id = m_bmtl_torso_patternjacket
		frontend_desc = qs(0x12daf194)
		mesh = `models/car/male/m_bmtl_torso_patternjacket`
		random_weight = 1.0
		materials = [
			m_bmtl_patternjacket_primary
		]
		acc_skeleton = `skeletons/skel_m_bmtl_torso_patternj`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_torso_patternjacket`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
		genre = [
			`black metal`
		]
	}
	{
		desc_id = m_bmtl_torso_coatring
		frontend_desc = qs(0x5b5d16b9)
		mesh = `models/car/male/m_bmtl_torso_coatring`
		material_groups = [
			{
				materials = [
					m_metl_torso_coatring_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_metl_torso_coatring_secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
			{
				materials = [
					m_metl_torso_coatring_belt
				]
				shader = $cas_shader_skin
				name = qs(0x647ddfc6)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_bmtl_torso_coatring`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_torso_coatring`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			`black metal`
		]
	}
	{
		desc_id = m_bmtl_torso_kdjacket
		frontend_desc = qs(0x78b42879)
		mesh = `models/car/male/m_bmtl_torso_kdjacket`
		material_groups = [
			{
				materials = [
					m_bmtl_torso_kdjacket_primary
				]
				shader = $cas_shader_skin
				name = qs(0x6b4a6675)
			}
			{
				materials = [
					m_bmtl_torso_kdjacket_secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc26686da)
			}
			{
				materials = [
					m_bmtl_torso_kdjacket_tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x6e0830a3)
			}
		]
		random_weight = 1.0
		acc_skeleton = `skeletons/skel_m_bmtl_torso_kdjacket`
		acc_ragdoll = `ragdolls/car/male/bmtl/rag_m_bmtl_torso_kdjacket`
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			`black metal`
		]
	}
]
