cas_female_torso = [
	{
		desc_id = f_punk_torso_stripe
		frontend_desc = qs(0xf22a6cdc)
		mesh = 'models/CAR/Female/F_Punk_Torso_Stripe.skin'
		materials = [
			f_punk_torso_stripe_primary
			f_punk_torso_stripe_secondary
		]
		chosen_materials = {
			material2 = grey_4
			material1 = grey_5
		}
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_torso_stripe
		acc_ragdoll = rag_f_punk_torso_stripe
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
	}
	{
		desc_id = f_goth_torso_frillybodice
		frontend_desc = qs(0x8dc40542)
		mesh = 'models/CAR/Female/F_Goth_Torso_FrillyBodice.skin'
		materials = [
			f_goth_torso_frillybodice_shirt
			f_goth_torso_frillybodice_lining
			f_goth_torso_frillybodice_corset
			f_goth_torso_frillybodice_ribbon
		]
		genre = [
			goth
		]
		acc_skeleton = skel_f_goth_torso_frillybodice
		acc_ragdoll = rag_f_goth_torso_frillybodice
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 175
	}
	{
		desc_id = f_fun_torso_bra
		frontend_desc = qs(0xfe4372bd)
		mesh = 'models/CAR/Female/F_Fun_Torso_Bra.skin'
		materials = [
			f_fun_torso_angelw_bra
		]
		chosen_materials = {
			material1 = grey_1
		}
		genre = [
			goth
			rock
			`heavy metal`
		]
		random_weight = 0.0
	}
	{
		desc_id = f_pop_torso_midori
		frontend_desc = qs(0xb176386f)
		mesh = 'models/CAR/Female/F_Pop_Torso_Midori.skin'
		genre = [
			pop
		]
		materials = [
			f_pop_torso_midori_primary
			f_pop_torso_midori_shirt
		]
		acc_skeleton = skel_f_pop_torso_midori_skirt
		acc_ragdoll = rag_f_pop_torso_midori_skirt
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
	}
]
cas_female_tshirt_def = {
	mesh = 'models/CAR/Female/F_Torso_TShirt.skin'
	materials = [
		m_torso_tshirt_primary
	]
	sections = [
	]
}
