cas_female_legs = [
	{
		desc_id = f_punk_legs_cheerskirt
		frontend_desc = qs(0xb43d686f)
		mesh = 'models/CAR/Female/F_Punk_Legs_CheerSkirt.skin'
		materials = [
			f_punk_legs_cheerskirt_primary
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_legs_plaid
		frontend_desc = qs(0x2757cbc4)
		mesh = 'models/CAR/Female/F_Punk_Legs_Plaid.skin'
		materials = [
			f_punk_legs_plaid_primary
		]
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_legs_plaid
		acc_ragdoll = rag_f_punk_legs_plaid
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
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
		desc_id = f_punk_legs_shorts
		frontend_desc = qs(0x40da1730)
		mesh = 'models/CAR/Female/F_Punk_Legs_Shorts.skin'
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_legs_shorts
		acc_ragdoll = rag_f_punk_legs_shorts
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		price = 100
	}
	{
		desc_id = f_punk_legs_shorts_02
		frontend_desc = qs(0x3b512c89)
		mesh = 'models/CAR/Female/F_Punk_Legs_Shorts_02.skin'
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_legs_shorts
		acc_ragdoll = rag_f_punk_legs_shorts
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		price = 100
	}
	{
		desc_id = f_punk_legs_shorts_03
		frontend_desc = qs(0x43f98f27)
		mesh = 'models/CAR/Female/F_Punk_Legs_Shorts_03.skin'
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_legs_shorts
		acc_ragdoll = rag_f_punk_legs_shorts
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		price = 100
	}
	{
		desc_id = f_punk_legs_judy01
		frontend_desc = qs(0xd6b90855)
		mesh = 'models/CAR/Female/F_Punk_Legs_Judy01.skin'
		materials = [
			f_punk_legs_judy01_primary
		]
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_legs_judynails1
		acc_ragdoll = rag_f_punk_legs_judynails1
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
		]
	}
	{
		desc_id = f_punk_legs_judy02
		frontend_desc = qs(0x69672169)
		mesh = 'models/CAR/Female/F_Punk_Legs_Judy02.skin'
		genre = [
			punk
		]
		materials = [
			f_punk_legs_judy02_primary
		]
		acc_skeleton = skel_f_punk_legs_judy02
		acc_ragdoll = rag_f_punk_legs_judy02
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		random_weight = 0.0
	}
	{
		desc_id = f_folk_legs_spegyptianskirt
		frontend_desc = qs(0x48057b20)
		mesh = 'models/CAR/Female/f_folk_legs_spegyptianskirt.skin'
		genre = [
			folk
		]
		hidden
	}
	{
		desc_id = f_folk_legs_amplumageskirt
		frontend_desc = qs(0xaa059892)
		mesh = 'models/CAR/Female/F_Folk_Legs_AMPlumageSkirt.skin'
		genre = [
			folk
		]
		material_groups = [
			{
				materials = [
					amplumageskirt_plume
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					amplumageskirt_skirt
				]
			}
			{
				materials = [
					amplumageskirt_straps
				]
			}
		]
		hidden
	}
	{
		desc_id = f_folk_legs_ictwinterbikini
		frontend_desc = qs(0xa7845653)
		mesh = 'models/CAR/Female/F_Folk_Legs_ICtWinterBikini.skin'
		genre = [
			folk
		]
		materials = [
			f_folk_legs_icwinterbikini_winterbikini
		]
		hidden
	}
	{
		desc_id = f_folk_legs_gcnavajooverskirt
		frontend_desc = qs(0x653ba483)
		mesh = 'models/CAR/Female/F_Folk_Legs_GCNavajoOverskirt.skin'
		genre = [
			folk
		]
		hidden
	}
	{
		desc_id = f_folk_legs_lsdirtydolllegs
		frontend_desc = qs(0xbe78e3d1)
		mesh = 'models/CAR/Female/F_Folk_Legs_LSDirtyDollLegs.skin'
		genre = [
			folk
		]
		hidden
	}
	{
		desc_id = f_folk_legs_gwkimono
		frontend_desc = qs(0xd0a348ee)
		mesh = 'models/CAR/Female/F_Folk_Legs_GWKimono.skin'
		genre = [
			folk
		]
		hidden
	}
	{
		desc_id = f_rock_legs_daisy
		frontend_desc = qs(0xd839943f)
		mesh = 'models/CAR/Female/F_Rock_Legs_Daisy.skin'
		materials = [
			f_rock_legs_daisy_primary
			f_rock_legs_daisy_secondary
		]
		genre = [
			rock
		]
		acc_skeleton = skel_f_rock_legs_shorts01
		acc_ragdoll = ragdoll_f_rock_legs_shorts01
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		price = 80
	}
	{
		desc_id = f_rock_legs_jeans
		frontend_desc = qs(0x2111f53f)
		mesh = 'models/CAR/Female/F_Rock_Legs_Jeans.skin'
		materials = [
			f_rock_legs_jeans_primary
		]
		genre = [
			rock
		]
		acc_skeleton = skel_f_rock_legs_jeans
		acc_ragdoll = rag_f_rock_legs_jeans
		acc_bones = [
			bone_acc_legs_01
		]
	}
	{
		desc_id = f_rock_legs_leather
		frontend_desc = qs(0xeeb802ed)
		mesh = 'models/CAR/Female/F_Rock_Legs_Leather.skin'
		genre = [
			rock
			`heavy	metal`
		]
	}
	{
		desc_id = f_rock_legs_ripjeans
		frontend_desc = qs(0xe3ac9732)
		mesh = 'models/CAR/Female/F_Rock_Legs_RipJeans.skin'
		materials = [
			f_rock_legs_ripjeans_primary
		]
		genre = [
			rock
		]
		acc_skeleton = skel_f_rock_legs_ripjeans
		acc_ragdoll = rag_f_rock_legs_ripjeans
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_rock_legs_laceup
		frontend_desc = qs(0x69bc4c0c)
		mesh = 'models/CAR/Female/F_Rock_Legs_Laceup.skin'
		genre = [
			rock
		]
		acc_skeleton = skel_f_rock_legs_laceup
		acc_ragdoll = rag_f_rock_legs_laceup
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		price = 75
	}
	{
		desc_id = f_rock_legs_pinstripe
		frontend_desc = qs(0xdca66e94)
		mesh = 'models/CAR/Female/F_Rock_Legs_Pinstripe.skin'
		materials = [
			f_rock_legs_pinstripe_primary
		]
		genre = [
			rock
		]
		price = 90
	}
	{
		desc_id = f_glam_legs_blingskirt
		frontend_desc = qs(0xd5666752)
		mesh = 'models/CAR/Female/F_Glam_Legs_BlingSkirt.skin'
		genre = [
			`glam	rock`
		]
		materials = [
			f_glam_legs_blingskirt_primary
		]
	}
	{
		desc_id = f_glam_legs_purplebling
		frontend_desc = qs(0xb6bff20d)
		mesh = 'models/CAR/Female/F_Glam_Legs_PurpleBling.skin'
		genre = [
			`glam	rock`
		]
		materials = [
			f_glam_legs_purplebling_primary
		]
		chosen_materials = {
			material1 = carblack_3
		}
		price = 300
	}
	{
		desc_id = f_goth_legs_strapj
		frontend_desc = qs(0x7065c153)
		mesh = 'models/CAR/Female/F_Goth_Legs_StrapJ.skin'
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
		acc_skeleton = skel_f_goth_legs_strapj
		acc_ragdoll = rag_f_goth_legs_strapj
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
		desc_id = f_goth_legs_halfstrap
		frontend_desc = qs(0xea50f22c)
		mesh = 'models/CAR/Female/F_Goth_Legs_HalfStrap.skin'
		materials = [
			f_goth_legs_halfstrap_primary
			f_goth_legs_halfstrap_secondary
		]
		acc_skeleton = skel_f_goth_legs_halfstrap
		acc_ragdoll = rag_f_goth_legs_halfstrap
		acc_bones = [
			bone_acc_legs_01
		]
		genre = [
			goth
		]
		price = 200
	}
	{
		desc_id = f_goth_legs_cyberstrap
		frontend_desc = qs(0x7eed61a5)
		mesh = 'models/CAR/Female/F_Goth_Legs_CyberStrap.skin'
		materials = [
			f_goth_legs_cyberstrap_primary
			f_goth_legs_cyberstrap_secondary
		]
		genre = [
			goth
		]
		acc_skeleton = skel_f_goth_legs_cyberstrap
		acc_ragdoll = rag_f_goth_legs_cyberstrap
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		price = 500
		random_weight_cpu = 0.1
	}
	{
		desc_id = f_goth_legs_lace
		frontend_desc = qs(0x3b3da64c)
		materials = [
			f_goth_legs_lace_primary
			f_goth_legs_lace_secondary
			f_goth_legs_lace_tertiary
		]
		mesh = 'models/CAR/Female/F_Goth_Legs_Lace.skin'
		genre = [
			goth
		]
		acc_skeleton = skel_f_goth_legs_lace
		acc_ragdoll = rag_f_goth_legs_lace
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_metl_legs_zipskrt
		frontend_desc = qs(0x2b356086)
		mesh = 'models/CAR/Female/F_Metl_Legs_ZipSkrt.skin'
		genre = [
			`heavy	metal`
		]
		materials = [
			f_metl_legs_zipskrt_primary
			f_metl_legs_zipskrt_secondary
		]
		acc_skeleton = skel_f_metl_legs_zipskrt
		acc_ragdoll = rag_f_metl_legs_zipskrt
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
	}
	{
		desc_id = f_metl_legs_studs01
		frontend_desc = qs(0xefaaeecc)
		mesh = 'models/CAR/Female/F_Metl_Legs_Studs01.skin'
		genre = [
			`heavy	metal`
			`black	metal`
		]
		materials = [
			f_metl_legs_studs01_primary
			f_metl_legs_studs01_secondary
		]
		acc_skeleton = skel_f_metl_legs_studs01
		acc_ragdoll = rag_f_metl_legs_studs01
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		price = 1100
	}
	{
		desc_id = f_metl_legs_blackwidow
		frontend_desc = qs(0x032bf260)
		mesh = 'models/CAR/Female/F_Metl_Legs_BlackWidow.skin'
		materials = [
			f_metl_legs_blackwidow_primary
			f_metl_legs_blackwidow_secondary
			f_metl_legs_blackwidow_belt
		]
		genre = [
			`heavy	metal`
		]
		price = 350
	}
	{
		desc_id = f_metl_legs_patch
		frontend_desc = qs(0x1800e345)
		mesh = 'models/CAR/Female/F_Metl_Legs_Patch.skin'
		materials = [
			f_metl_legs_patch_primary
			f_metl_legs_patch_secondary
			f_metl_legs_patch_belt
		]
		genre = [
			`heavy	metal`
		]
		price = 450
	}
	{
		desc_id = f_metl_legs_cargo
		frontend_desc = qs(0x05567aa6)
		mesh = 'models/CAR/Female/F_Metl_Legs_Cargo.skin'
		materials = [
			f_metl_legs_cargo_primary
			f_metl_legs_cargo_secondary
		]
		genre = [
			`heavy	metal`
		]
		acc_skeleton = skel_f_metl_legs_cargo
		acc_ragdoll = rag_f_metl_legs_cargo
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
		mesh = 'models/CAR/Female/F_Metl_Legs_JeansRip.skin'
		materials = [
			f_metl_legs_jeansrip_primary
			f_metl_legs_jeansrip_secondary
		]
		genre = [
			`heavy	metal`
		]
		acc_skeleton = skel_f_metl_legs_jeansrip
		acc_ragdoll = rag_f_metl_legs_jeansrip
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		price = 75
		random_weight = 0.25
	}
	{
		desc_id = f_metl_legs_pencilskirt
		frontend_desc = qs(0xf2f1fe2b)
		mesh = 'models/CAR/Female/F_Metl_Legs_PencilSkirt.skin'
		materials = [
			f_metl_legs_pencilskirt_primary
			f_metl_legs_pencilskirt_secondary
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_metl_legs_strapped
		frontend_desc = qs(0x1e4b5eee)
		mesh = 'models/CAR/Female/F_Metl_Legs_Strapped.skin'
		materials = [
			f_metl_legs_strapped_primary
			f_metl_legs_strapped_secondary
		]
		genre = [
			`heavy	metal`
		]
		price = 500
	}
	{
		desc_id = f_metl_legs_strappednoleg
		frontend_desc = qs(0x0d767a12)
		mesh = 'models/CAR/Female/F_Metl_Legs_StrappedNoLeg.skin'
		materials = [
			f_metl_legs_strapped_primary
		]
		genre = [
			`heavy	metal`
		]
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
			`classic	rock`
		]
	}
	{
		desc_id = f_clsc_legs_plaid
		frontend_desc = qs(0x273ed129)
		mesh = 'models/CAR/Female/F_Clsc_Legs_Plaid.skin'
		materials = [
			f_clsc_legs_plaid_primary
			f_clsc_legs_plaid_secondary
		]
		genre = [
			`classic	rock`
		]
		price = 95
	}
	{
		desc_id = f_clsc_legs_vlvttie
		frontend_desc = qs(0x20caefd5)
		mesh = 'models/CAR/Female/F_Clsc_Legs_VlvtTie.skin'
		genre = [
			`classic	rock`
		]
		materials = [
			f_clsc_legs_vlvttie_primary
			f_clsc_legs_vlvttie_secondary
		]
		chosen_materials = {
			material1 = yellow_orange_3
			material2 = red_3
		}
		acc_skeleton = skel_f_clsc_legs_vlvttie
		acc_ragdoll = rag_f_clsc_legs_vlvttie
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
		]
	}
	{
		desc_id = f_clsc_legs_skrt
		frontend_desc = qs(0x208e050e)
		mesh = 'models/CAR/Female/F_Clsc_Legs_Skrt.skin'
		genre = [
			`classic	rock`
		]
		materials = [
			f_clsc_legs_skrt_primary
			f_clsc_legs_skrt_secondary
		]
		acc_skeleton = skel_f_clsc_legs_skrt
		acc_ragdoll = rag_f_clsc_legs_skrt
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		random_weight = 0.25
		random_weight_cpu = 0.0
	}
	{
		desc_id = f_pop_legs_baggypants
		frontend_desc = qs(0xf7feac6c)
		mesh = 'models/CAR/Female/F_Pop_Legs_BaggyPants.skin'
		genre = [
			pop
		]
		materials = [
			f_pop_caprispants_primary
			f_pop_caprispants_secondary
		]
		chosen_materials = {
			material1 = red_2
			material2 = grey_1
		}
		acc_skeleton = skel_f_pop_legs_baggypants
		acc_ragdoll = rag_f_pop_legs_baggypants
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
			bone_acc_legs_03
			bone_acc_legs_04
		]
		price = 100
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
	{
		desc_id = f_pop_legs_plaidpants
		frontend_desc = qs(0x1259a852)
		mesh = 'models/CAR/Female/F_Pop_Legs_PlaidPants.skin'
		materials = [
			f_pop_plaidpants_primary
		]
		genre = [
			pop
		]
		acc_skeleton = skel_f_pop_legs_plaidpants
		acc_ragdoll = rag_f_pop_legs_plaidpants
		acc_bones = [
			bone_acc_legs_01
			bone_acc_legs_02
		]
		price = 100
	}
	{
		desc_id = f_pop_legs_capris
		frontend_desc = qs(0xa28b5f3c)
		mesh = 'models/CAR/Female/F_Pop_Legs_Capris.skin'
		materials = [
			f_pop_caprispants_primary
		]
		genre = [
			pop
		]
		acc_skeleton = skel_f_pop_legs_capris
		acc_ragdoll = rag_f_pop_legs_capris
		acc_bones = [
			bone_acc_legs_01
		]
	}
	{
		desc_id = f_pop_legs_hayleypants
		frontend_desc = qs(0xb3f761cf)
		mesh = 'models/CAR/Female/F_Pop_Legs_HayleyPants.skin'
		materials = [
			f_pop_hayleypants_primary
		]
		genre = [
			pop
		]
	}
]
