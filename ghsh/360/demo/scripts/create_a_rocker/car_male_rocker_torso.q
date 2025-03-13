cas_male_torso = [
	{
		desc_id = shirtless
		frontend_desc = qs(0xb404a80c)
		random_weight = 0.0
	}
	{
		desc_id = m_punk_torso_bowling
		frontend_desc = qs(0x6c89158b)
		mesh = 'models/CAR/Male/M_Punk_Torso_Bowling.skin'
		materials = [
			m_punk_torso_bowling_primary
			m_punk_torso_bowling_secondary
		]
		chosen_materials = {
			material2 = grey_5
		}
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_torso_bowling
		acc_ragdoll = rag_m_punk_torso_bowling
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
		mesh = 'models/CAR/Male/M_Clsc_Torso_Clrdjakt.skin'
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		materials = [
			m_clsc_torso_clrdjakt_primary
			m_clsc_torso_clrdjakt_secondary
		]
		chosen_materials = {
			material1 = red_orange_3
		}
		acc_skeleton = skel_m_clsc_torso_clrdjakt
		acc_ragdoll = rag_m_clsc_torso_clrdjakt
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_mtl_torso_axel1
		frontend_desc = qs(0x89954397)
		mesh = 'models/CAR/Male/M_Mtl_Torso_Axel1.skin'
		materials = [
			m_metl_torso_axel1_primary
			m_metl_torso_axel1_secondary
		]
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		acc_skeleton = skel_m_metl_torso_axel1
		acc_ragdoll = rag_m_metl_torso_axel1
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_glam_torso_rags
		frontend_desc = qs(0x56b233aa)
		mesh = 'models/CAR/Male/M_Glam_Torso_Rags.skin'
		materials = [
			m_glam_torso_rags_primary
		]
		chosen_materials = {
			material1 = red_2
		}
		random_weight = 1.0
		genre = [
			`glam rock`
		]
	}
	{
		desc_id = m_bmtl_torso_lars
		frontend_desc = qs(0x7fbbd35c)
		mesh = 'models/CAR/Male/M_Bmtl_Torso_Lars.skin'
		random_weight = 1.0
		genre = [
			`black metal`
		]
	}
]
