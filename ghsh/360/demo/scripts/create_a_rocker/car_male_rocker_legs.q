cas_male_legs = [
	{
		desc_id = m_punk_legs_cuff
		frontend_desc = qs(0x31368878)
		mesh = 'models/CAR/Male/M_Punk_Legs_Cuff.skin'
		materials = [
			m_punk_legs_cuff_primary
		]
		random_weight = 1.0
		acc_skeleton = skel_m_punk_legs_cuff
		acc_ragdoll = rag_m_punk_legs_cuff
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		genre = [
			punk
		]
	}
	{
		desc_id = m_punk_legs_johnny1
		frontend_desc = qs(0x5b8f114a)
		mesh = 'models/CAR/Male/M_Punk_Legs_Johnny1.skin'
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_legs_johnny1
		acc_ragdoll = rag_m_punk_legs_johnny1
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = m_clsc_legs_whtbells
		frontend_desc = qs(0x6fca794c)
		mesh = 'models/CAR/Male/M_Clsc_Legs_whtbells.skin'
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		materials = [
			m_clsc_legs_whtbells_primary
		]
		chosen_materials = {
			material1 = grey_1
		}
	}
	{
		desc_id = m_glam_legs_stripes
		frontend_desc = qs(0x46610ad9)
		mesh = 'models/CAR/Male/M_Glam_Legs_Stripes.skin'
		materials = [
			m_glam_legs_stripes_primary
			m_glam_legs_stripes_secondary
		]
		chosen_materials = {
			material1 = grey_4
			material2 = red_3
		}
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		acc_skeleton = skel_m_glam_legs_leopard
		acc_ragdoll = rag_m_glam_legs_leopard
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = m_bmtl_legs_lars
		frontend_desc = qs(0x229ff04f)
		mesh = 'models/CAR/Male/M_Bmtl_Legs_Lars.skin'
		random_weight = 1.0
		genre = [
			`black metal`
		]
	}
	{
		desc_id = m_mtl_legs_axel1
		frontend_desc = qs(0x9b2c1509)
		mesh = 'models/CAR/Male/M_Mtl_Legs_Axel1.skin'
		materials = [
			m_metl_legs_axel1_primary
		]
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
	}
]
