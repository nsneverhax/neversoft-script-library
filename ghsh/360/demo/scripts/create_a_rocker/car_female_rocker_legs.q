cas_female_legs = [
	{
		desc_id = f_punk_legs_skirt
		frontend_desc = qs(0x8936b5d5)
		mesh = 'models/CAR/Female/F_Punk_Legs_Skirt.skin'
		materials = [
			f_punk_legs_skirt_primary
			f_punk_legs_skirt_secondary
		]
		chosen_materials = {
			material1 = red_2
			material2 = grey_5
			material3 = grey_1
		}
		genre = [
			punk
		]
	}
	{
		desc_id = f_goth_legs_frillydress
		frontend_desc = qs(0x0248c494)
		mesh = 'models/CAR/Female/F_Goth_Legs_Frillydress.skin'
		genre = [
			goth
		]
		materials = [
			f_goth_legs_frillydress_dress
			f_goth_legs_frillydress_pants
		]
		chosen_materials = {
			material1 = carblack_3
		}
		acc_skeleton = skel_f_goth_legs_frillydress
		acc_ragdoll = rag_f_goth_legs_frillydress
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		price = 150
	}
	{
		desc_id = f_clsc_legs_pvc
		frontend_desc = qs(0x75699582)
		mesh = 'models/CAR/Female/F_Clsc_Legs_Pvc.skin'
		materials = [
			f_clsc_legs_pvc_primary
		]
		chosen_materials = {
			material1 = grey_1
		}
		genre = [
			`classic rock`
		]
	}
	{
		desc_id = f_pop_legs_skirt
		frontend_desc = qs(0x5cf71640)
		mesh = 'models/CAR/Female/F_Pop_Legs_Skirt.skin'
		genre = [
			pop
		]
		materials = [
			skin_f_legs_skirt_primary
			skin_f_legs_skirt_secondary
		]
		chosen_materials = {
			material1 = red_1
			material2 = carblack_1
		}
		acc_skeleton = skel_f_pop_legs_midori_skirt
		acc_ragdoll = rag_f_pop_legs_midori_skirt
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
]
