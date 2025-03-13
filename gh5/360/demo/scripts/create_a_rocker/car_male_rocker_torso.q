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
		materials = [
			m_torso_layered_primary
			m_torso_layered_secondary
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
		materials = [
			m_torso_layerednostripe_primary
			m_torso_layerednostripe_secondary
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
		materials = [
			m_torso_hoodie_primary
			m_torso_hoodie_secondary
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
		materials = [
			m_torso_ninja_primary
			m_torso_ninja_secondary
			m_torso_ninja_arms
		]
		genre = [
			goth
		]
	}
	{
		desc_id = m_pop_torso_dragon
		frontend_desc = qs(0x66d76586)
		mesh = `models/car/male/m_pop_torso_dragon`
		materials = [
			m_pop_torso_dragon_primary
			m_pop_torso_dragon_secondary
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
		materials = [
			m_pop_torso_leather_primary
			m_pop_torso_leather_secondary
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
		materials = [
			m_pop_torso_suit_primary
			m_pop_torso_suit_secondary
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
		materials = [
			m_pop_torso_turtleshirt_primary
			m_pop_torso_turtleshirt_secondary
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
		materials = [
			m_pop_torso_vest_primary
			m_pop_torso_vest_secondary
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
			}
			{
				materials = [
					m_punk_torso_jstripe_secondary
				]
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
		materials = [
			m_punk_torso_bowling_primary
			m_punk_torso_bowling_secondary
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
		materials = [
			m_punk_torso_jny_1_primary
			m_punk_torso_jny_1_secondary
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
		desc_id = m_clsc_torso_clive
		frontend_desc = qs(0xfc391b7c)
		mesh = `models/car/male/m_clsc_torso_clive`
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		materials = [
			m_clsc_torso_clive_primary
			m_clsc_torso_clive_secondary
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
		materials = [
			m_clsc_torso_clive2_primary
			m_clsc_torso_clive2_secondary
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
		materials = [
			m_clsc_torso_clive3_primary
			m_clsc_torso_clive3_secondary
			m_clsc_torso_clive3_third
			m_clsc_torso_clive3_waist
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
		materials = [
			m_clsc_torso_clive4_jacket
			m_clsc_torso_clive4_tassels
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
		materials = [
			m_clsc_torso_scarf_primary
			m_clsc_torso_scarf_vest
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
		materials = [
			m_clsc_torso_clrdjakt_primary
			m_clsc_torso_clrdjakt_secondary
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
		frontend_desc = qs(0xbe4e5fbc)
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
		frontend_desc = qs(0x6d1302d3)
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
		frontend_desc = qs(0xca85a60b)
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
		materials = [
			m_goth_torso_devilwings_primary
			m_goth_torso_devilwings_secondary
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
			}
			{
				materials = [
					m_goth_torso_sfvest_primary
				]
				shader = $cas_shader_skin_masked2
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
		materials = [
			m_goth_torso_strait_primary
			m_goth_torso_strait_secondary
			m_goth_torso_strait_metal
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
				shader = $cas_shader_hair
			}
			{
				materials = [
					m_goth_torso_tux_secondary
				]
				shader = $cas_shader_skin
			}
			{
				materials = [
					m_goth_torso_tux_shirt
				]
				shader = $cas_shader_skin
			}
			{
				materials = [
					m_goth_torso_tux_tie
				]
				shader = $cas_shader_skin
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
		materials = [
			m_metl_torso_axel1_primary
			m_metl_torso_axel1_secondary
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
			}
			{
				materials = [
					axel2_torso_primary
				]
				shader = $cas_shader_skin_masked2
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
		materials = [
			axel3_torso_shirt
			axel3_torso_jacket
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
			}
			{
				materials = [
					axel4_torso_primary
				]
				shader = $cas_shader_skin_masked2
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
		materials = [
			m_metl_torso_lthrjkt_primary
			m_metl_torso_lthrjkt_secondary
			m_metl_torso_lthrjkt_stripe
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
		materials = [
			m_rock_torso_tie_primary
			m_rock_torso_tie_secondary
			m_rock_torso_tie_tertiary
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
		materials = [
			m_rock_torso_ozzycoat_primary
			m_rock_torso_ozzycoat_secondary
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
		materials = [
			m_rock_torso_erollbowl_primary
			m_rock_torso_erollbowl_secondary
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
		materials = [
			m_rock_torso_ljacket_primary
			m_rock_torso_ljacket_secondary
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
		materials = [
			m_rock_torso_spadesuit_primary
			m_rock_torso_spadesuit_secondary
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
		materials = [
			m_rock_torso_leather_primary
			m_rock_torso_leather_secondary
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
		desc_id = m_torso_tasselvest
		frontend_desc = qs(0xa559f15c)
		mesh = `models/car/male/m_torso_tasselvest`
		materials = [
			m_torso_tasselvest_primary
			m_torso_tasselvest_secondary
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
		materials = [
			m_rock_torso_jersey_primary
			m_rock_torso_jersey_secondary
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
		materials = [
			m_rock_torso_workshirt_primary
			m_rock_torso_workshirt_secondary
		]
		random_weight = 1.0
		genre = [
			rock
		]
		random_weight = 0.25
	}
	{
		desc_id = m_rock_torso_jcashvest
		frontend_desc = qs(0x5175e3b9)
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
			}
			{
				materials = [
					m_glam_torso_tiger_primary
				]
				shader = $cas_shader_skin_masked2
			}
			{
				materials = [
					m_glam_torso_tiger_secondary
				]
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
		materials = [
			m_glam_torso_kiss_primary
			m_glam_torso_kiss_secondary
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
				name = qs(0x2db90b17)
			}
			{
				materials = [
					m_bmtl_torso_lars_1_fur
				]
				shader = $cas_shader_skin
				name = qs(0xd6d4fcf7)
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
		materials = [
			m_bmtl_torso_lars_2_tabard
			m_bmtl_torso_lars_2_torso
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
		materials = [
			m_bmtl_torso_lars_3_primary
			m_bmtl_torso_lars_3_secondary
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
		materials = [
			m_bmtl_torso_skeletonbelt_primary
			m_bmtl_torso_skeletonbelt_secondary
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
		materials = [
			m_metl_torso_coatring_primary
			m_metl_torso_coatring_secondary
			m_metl_torso_coatring_belt
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
		materials = [
			m_bmtl_torso_kdjacket_primary
			m_bmtl_torso_kdjacket_secondary
			m_bmtl_torso_kdjacket_tertiary
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
