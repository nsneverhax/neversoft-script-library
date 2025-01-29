cas_female_torso = [
	{
		desc_id = f_torso_tshirt
		frontend_desc = qs(0xd5e5d250)
		mesh = 'models/CAR/Female/F_Torso_TShirt.skin'
		mesh1 = 'models/CAR/Female/F_Torso_TShirtLOD.skin'
		0x56504ac4 = 1
		random_weight = 0.5
		genre = [
			rock
			`heavy metal`
		]
		materials = [
			m_torso_tshirt_primary
		]
		sections = [
			{
				desc_id = car_tattoo_decal
				frontend_desc = qs(0x5f195878)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_graphics
				cas_1
				userlayer
			}
		]
		sections = [
			{
				desc_id = car_primitives
				frontend_desc = qs(0x7dc468d3)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_basic_primitives_1
				userlayer
				omit_base_tex
				wrap_u
				cas_1
				initial_values = {
					x_scale = 21
					y_scale = 30
				}
			}
			{
				desc_id = car_outlines_primitives
				frontend_desc = qs(0x955f1285)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_basic_primitives_2
				userlayer
				omit_base_tex
				wrap_u
				cas_1
				initial_values = {
					x_scale = 21
					y_scale = 30
				}
			}
			{
				desc_id = car_tattoo_decal
				frontend_desc = qs(0x80142024)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_gradiant_shapes
				userlayer
				omit_base_tex
				wrap_u
				cas_1
				initial_values = {
					x_scale = 21
					y_scale = 30
				}
			}
			{
				desc_id = car_icon_decals
				frontend_desc = qs(0xcd9be7cd)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_icons
				userlayer
				omit_base_tex
				wrap_u
				cas_1
				initial_values = {
					x_scale = 21
					y_scale = 30
				}
			}
			{
				desc_id = car_living
				frontend_desc = qs(0xac01b8a2)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_living_shapes
				userlayer
				omit_base_tex
				wrap_u
				cas_1
				initial_values = {
					x_scale = 21
					y_scale = 30
				}
			}
			{
				desc_id = car_graphics
				frontend_desc = qs(0xde6cb37a)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_graphics
				userlayer
				omit_base_tex
				wrap_u
				cas_1
				initial_values = {
					x_scale = 21
					y_scale = 30
				}
			}
			{
				desc_id = car_sponsors
				frontend_desc = qs(0xc26f9911)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_sponsors
				userlayer
				omit_base_tex
				wrap_u
				cas_1
				initial_values = {
					x_scale = 21
					y_scale = 30
				}
			}
			{
				desc_id = `font a1`
				frontend_desc = qs(0x1c40b9b0)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_fontgrid_title_a1
				cas_1
				omit_base_tex
				wrap_u
				userlayer
				initial_values = {
					x_scale = 80
					y_scale = 80
				}
			}
			{
				desc_id = `font a3`
				frontend_desc = qs(0x5c8b3f2b)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_fontgrid_text_a3
				cas_1
				omit_base_tex
				wrap_u
				userlayer
				initial_values = {
					x_scale = 80
					y_scale = 80
				}
			}
			{
				desc_id = `font a6`
				frontend_desc = qs(0x16701ac6)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_fontgrid_text_a6
				cas_1
				omit_base_tex
				wrap_u
				userlayer
				initial_values = {
					x_scale = 80
					y_scale = 80
				}
			}
			{
				desc_id = `font a8`
				frontend_desc = qs(0x18698a72)
				base_tex = 'tex/models/Characters/CAR/Male/m_torso_tshirt_o_dnc.dds'
				material = m_torso_tshirt_primary
				mask = $car_fontgrid_text_a8
				cas_1
				omit_base_tex
				wrap_u
				userlayer
				initial_values = {
					x_scale = 80
					y_scale = 80
				}
			}
		]
	}
	{
		desc_id = f_torso_layered
		frontend_desc = qs(0x6df89e70)
		mesh = 'models/CAR/Female/F_Torso_Layered.skin'
		mesh1 = 'models/CAR/Female/F_Torso_LayeredLOD.skin'
		0x56504ac4 = 1
		genre = [
			rock
		]
		materials = [
			f_torso_layered_primary
			f_torso_layered_secondary
		]
	}
	{
		desc_id = f_torso_hoodie
		frontend_desc = qs(0xd8020207)
		mesh = 'models/CAR/Female/F_Torso_Hoodie.skin'
		mesh1 = 'models/CAR/Female/F_Torso_HoodieLOD.skin'
		0x56504ac4 = 1
		genre = [
			rock
		]
		materials = [
			f_torso_hoodie_primary
			f_torso_hoodie_secondary
		]
		acc_skeleton = skel_f_torso_hoodie
		acc_ragdoll = rag_f_torso_hoodie
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_punk_torso_zipup
		frontend_desc = qs(0x0fbdaf71)
		mesh = 'models/CAR/Female/F_Punk_Torso_Zipup.skin'
		mesh1 = 'models/CAR/Female/F_Punk_Torso_ZipupLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_punk_torso_zipup_primary
		]
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_torso_zipup
		acc_ragdoll = rag_f_punk_torso_zipup
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 75
	}
	{
		desc_id = f_punk_torso_leather
		frontend_desc = qs(0x109a2f9f)
		mesh = 'models/CAR/Female/F_Punk_Torso_Leather.skin'
		mesh1 = 'models/CAR/Female/F_Punk_Torso_LeatherLOD.skin'
		0x56504ac4 = 1
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_torso_leather
		acc_ragdoll = rag_f_punk_torso_leather
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 450
	}
	{
		desc_id = f_punk_torso_leather_02
		frontend_desc = qs(0x84a703f5)
		mesh = 'models/CAR/Female/F_Punk_Torso_Leather_02.skin'
		mesh1 = 'models/CAR/Female/F_Punk_Torso_Leather02LOD.skin'
		0x56504ac4 = 1
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_torso_leather
		acc_ragdoll = rag_f_punk_torso_leather
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 500
	}
	{
		desc_id = f_punk_torso_leather_03
		frontend_desc = qs(0xc4af30cb)
		mesh = 'models/CAR/Female/F_Punk_Torso_Leather_03.skin'
		mesh1 = 'models/CAR/Female/F_Punk_Torso_Leather03LOD.skin'
		0x56504ac4 = 1
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_torso_leather
		acc_ragdoll = rag_f_punk_torso_leather
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 650
	}
	{
		desc_id = f_punk_torso_judy01
		frontend_desc = qs(0x3d6a656c)
		mesh = 'models/CAR/Female/F_Punk_Torso_Judy01.skin'
		mesh1 = 'models/CAR/Female/F_Punk_Torso_Judy01LOD.skin'
		0x56504ac4 = 1
		materials = [
			f_punk_torso_judy01_primary
			f_punk_torso_judy01_secondary
		]
		genre = [
			punk
		]
		acc_skeleton = skel_f_punk_torso_judynails1
		acc_ragdoll = rag_f_punk_torso_judynails1
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 0.0
	}
	{
		desc_id = f_punk_torso_stripe
		frontend_desc = qs(0xf22a6cdc)
		mesh = 'models/CAR/Female/F_Punk_Torso_Stripe.skin'
		mesh1 = 'models/CAR/Female/F_Punk_Torso_StripeLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_punk_torso_stripe_primary
			f_punk_torso_stripe_secondary
		]
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
		desc_id = f_punk_torso_judy02
		frontend_desc = qs(0x938ea10f)
		mesh = 'models/CAR/Female/F_Punk_Torso_Judy02.skin'
		mesh1 = 'models/CAR/Female/F_Punk_Torso_Judy02LOD.skin'
		0x56504ac4 = 1
		materials = [
			f_punk_torso_judy02_primary
			f_punk_torso_judy02_secondary
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_rock_torso_jjacket
		frontend_desc = qs(0x35cb3bb6)
		mesh = 'models/CAR/Female/F_Rock_Torso_JJacket.skin'
		mesh1 = 'models/CAR/Female/F_Rock_Torso_JJacketLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_rock_torso_jjacket_primary
			f_rock_torso_jjacket_secondary
			f_rock_torso_jjacket_tertiary
		]
		genre = [
			rock
		]
		acc_skeleton = skel_f_rock_torso_jeanjacket01
		acc_ragdoll = ragdoll_f_rock_torso_jeanjacket01
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_rock_torso_raglan
		frontend_desc = qs(0x33233a56)
		mesh = 'models/CAR/Female/F_Rock_Torso_Raglan.skin'
		mesh1 = 'models/CAR/Female/F_Rock_Torso_RaglanLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_rock_torso_raglan_primary
			f_rock_torso_raglan_secondary
		]
		genre = [
			rock
			`heavy metal`
		]
		acc_skeleton = skel_f_rock_torso_raglan
		acc_ragdoll = rag_f_rock_torso_raglan
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
	}
	{
		desc_id = f_rock_torso_corset
		frontend_desc = qs(0xc231f034)
		mesh = 'models/CAR/Female/F_Rock_Torso_Corset.skin'
		mesh1 = 'models/CAR/Female/F_Rock_Torso_CorsetLOD.skin'
		0x56504ac4 = 1
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
		mesh = 'models/CAR/Female/F_Rock_Torso_LJacket.skin'
		mesh1 = 'models/CAR/Female/F_Rock_Torso_LJacketLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_rock_torso_ljacket_primary
			f_rock_torso_ljacket_secondary
		]
		genre = [
			rock
		]
		acc_skeleton = skel_f_rock_torso_ljacket
		acc_ragdoll = rag_f_rock_torso_ljacket
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 250
	}
	{
		desc_id = f_rock_torso_tie
		frontend_desc = qs(0x41fa4b23)
		mesh = 'models/CAR/Female/F_Rock_Torso_Tie.skin'
		mesh1 = 'models/CAR/Female/F_Rock_Torso_TieLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_rock_torso_tie_primary
			f_rock_torso_tie_secondary
		]
		genre = [
			rock
		]
		acc_skeleton = skel_f_rock_torso_tie
		acc_ragdoll = rag_f_rock_torso_tie
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 80
	}
	{
		desc_id = f_rock_torso_bass
		frontend_desc = qs(0xf16d30ec)
		mesh = 'models/CAR/Female/F_Rock_Torso_Bass.skin'
		mesh1 = 'models/CAR/Female/F_Rock_Torso_BassLOD.skin'
		0x56504ac4 = 1
		genre = [
			rock
		]
		materials = [
			f_rock_torso_bass_primary
		]
	}
	{
		desc_id = f_rock_torso_bass_contest
		frontend_desc = qs(0xa90360a5)
		mesh = 'models/CAR/Female/F_Rock_Torso_Bass_Contest.skin'
		mesh1 = 'models/CAR/Female/F_Rock_Torso_Bass_ContestLOD.skin'
		0x56504ac4 = 1
		genre = [
			rock
		]
		materials = [
			f_rock_torso_bass_contest_primary
		]
		hidden
		price = 5
	}
	{
		desc_id = f_glam_torso_lacebratop
		frontend_desc = qs(0xf9b41104)
		mesh = 'models/CAR/Female/F_Glam_Torso_LaceBraTop.skin'
		mesh1 = 'models/CAR/Female/F_Glam_Torso_LaceBraTopLOD.skin'
		0x56504ac4 = 1
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_torso_lacebratop_primary
		]
		price = 150
	}
	{
		desc_id = f_glam_torso_pinkshirt
		frontend_desc = qs(0xcc867476)
		mesh = 'models/CAR/Female/F_Glam_Torso_PinkShirt.skin'
		mesh1 = 'models/CAR/Female/F_Glam_Torso_PinkShirtLOD.skin'
		0x56504ac4 = 1
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_torso_pinkshirt_primary
		]
		acc_skeleton = skel_f_glam_torso_pinkshirt
		acc_ragdoll = rag_f_glam_torso_pinkshirt
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
	}
	{
		desc_id = f_glam_torso_denimjakcet
		frontend_desc = qs(0x0331630e)
		mesh = 'models/CAR/Female/F_Glam_Torso_DenimJakcet.skin'
		mesh1 = 'models/CAR/Female/F_Glam_Torso_DenimJakcetLOD.skin'
		0x56504ac4 = 1
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_torso_denimjakcet_primary
			f_glam_torso_denimjakcet_secondary
		]
		acc_skeleton = skel_f_glam_torso_denimjakcet
		acc_ragdoll = rag_f_glam_torso_denimjakcet
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_glam_torso_blackclam
		frontend_desc = qs(0x03e6ddb6)
		mesh = 'models/CAR/Female/F_Glam_Torso_BlackClam.skin'
		mesh1 = 'models/CAR/Female/F_Glam_Torso_BlackClamLOD.skin'
		0x56504ac4 = 1
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_torso_blackclam_primary
			f_glam_torso_blackclam_secondary
		]
		price = 1500
	}
	{
		desc_id = f_glam_torso_lightning
		frontend_desc = qs(0xa6fdea62)
		mesh = 'models/CAR/Female/F_Glam_Torso_Lightning.skin'
		mesh1 = 'models/CAR/Female/F_Glam_Torso_LightningLOD.skin'
		0x56504ac4 = 1
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_torso_lightning_primary
			f_glam_torso_lightning_secondary
		]
		acc_skeleton = skel_f_glam_torso_lightning
		acc_ragdoll = rag_f_glam_torso_lightning
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
		price = 210
	}
	{
		desc_id = f_goth_torso_corsetop
		frontend_desc = qs(0xf82dbdc1)
		mesh = 'models/CAR/Female/F_Goth_Torso_Corsetop.skin'
		mesh1 = 'models/CAR/Female/F_Goth_Torso_CorsetopLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_goth_torso_corsetop_primary
			f_goth_torso_corsetop_secondary
		]
		genre = [
			goth
		]
		acc_skeleton = skel_f_goth_torso_corsetop
		acc_ragdoll = rag_f_goth_torso_corsetop
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
		price = 175
	}
	{
		desc_id = f_goth_torso_frillybodice
		frontend_desc = qs(0x8dc40542)
		mesh = 'models/CAR/Female/F_Goth_Torso_FrillyBodice_02.skin'
		materials = [
			f_goth_torso_frillybodice02_shirt
			f_goth_torso_frillybodice02_lining
			f_goth_torso_frillybodice02_corset
			f_goth_torso_frillybodice02_ribbon
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
	}
	{
		desc_id = f_goth_torso_halfstrap
		frontend_desc = qs(0x03c9d10d)
		mesh = 'models/CAR/Female/F_Goth_Torso_HalfStrap.skin'
		mesh1 = 'models/CAR/Female/F_Goth_Torso_HalfStrapLOD.skin'
		0x56504ac4 = 1
		acc_skeleton = skel_f_goth_torso_halfstrap
		acc_ragdoll = rag_f_goth_torso_halfstrap
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
			}
			{
				materials = [
					f_goth_torso_halfstrap_secondary
				]
			}
			{
				materials = [
					f_goth_torso_halfstrap_glove
				]
			}
		]
		genre = [
			goth
		]
		price = 1750
	}
	{
		desc_id = f_goth_torso_cyberstrap
		frontend_desc = qs(0xeb0e0eb6)
		mesh = 'models/CAR/Female/F_Goth_Torso_CyberStrap.skin'
		mesh1 = 'models/CAR/Female/F_Goth_Torso_CyberStrapLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_goth_torso_cyberstrap_primary
			f_goth_torso_cyberstrap_secondary
		]
		acc_skeleton = skel_f_goth_torso_cyberstrap
		acc_ragdoll = rag_f_goth_torso_cyberstrap
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			goth
		]
		price = 550
		random_weight_cpu = 0.1
	}
	{
		desc_id = f_goth_torso_dress
		frontend_desc = qs(0x2c481737)
		mesh = 'models/CAR/Female/F_Goth_Torso_Dress.skin'
		mesh1 = 'models/CAR/Female/F_Goth_Torso_DressLOD.skin'
		0x56504ac4 = 1
		genre = [
			goth
		]
		acc_skeleton = skel_f_goth_torso_dress
		acc_ragdoll = rag_f_goth_torso_dress
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = f_fun_torso_angelw
		frontend_desc = qs(0xc8fe9880)
		mesh = 'models/CAR/Female/F_Fun_Torso_AngelW.skin'
		mesh1 = 'models/CAR/Female/F_Fun_Torso_AngelWLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_fun_torso_angelw_wing
			f_fun_torso_angelw_bra
		]
		genre = [
			goth
		]
		acc_skeleton = skel_f_fun_torso_angelw
		acc_ragdoll = rag_f_fun_torso_angelw
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 7500
		locked
		polaroid = p_f_goth_torso_angelw
		random_weight = 0.0
	}
	{
		desc_id = f_fun_torso_bra
		frontend_desc = qs(0xfe4372bd)
		mesh = 'models/CAR/Female/F_Fun_Torso_Bra.skin'
		mesh1 = 'models/CAR/Female/F_Fun_Torso_BraLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_fun_torso_angelw_bra
		]
		genre = [
			goth
			rock
			`heavy metal`
		]
		random_weight = 0.0
	}
	{
		desc_id = f_metl_torso_bullets01
		frontend_desc = qs(0x154f9f31)
		mesh = 'models/CAR/Female/F_Metl_Torso_Bullets01.skin'
		mesh1 = 'models/CAR/Female/F_Metl_Torso_Bullets01LOD.skin'
		0x56504ac4 = 1
		genre = [
			`heavy metal`
		]
		materials = [
			f_metl_torso_bullets01_primary
			f_metl_torso_bullets01_secondary
		]
		acc_skeleton = skel_f_metl_torso_bullets01
		acc_ragdoll = rag_f_metl_torso_bullets01
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 250
	}
	{
		desc_id = f_metl_torso_vest01
		frontend_desc = qs(0x37dfa29e)
		mesh = 'models/CAR/Female/F_Metl_Torso_Vest01.skin'
		mesh1 = 'models/CAR/Female/F_Metl_Torso_Vest01LOD.skin'
		0x56504ac4 = 1
		genre = [
			`heavy metal`
		]
		acc_skeleton = skel_f_metl_torso_vest01
		acc_ragdoll = rag_f_metl_torso_vest01
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 175
	}
	{
		desc_id = f_metl_torso_bramesh
		frontend_desc = qs(0x00921c12)
		mesh = 'models/CAR/Female/F_Metl_Torso_BraMesh.skin'
		mesh1 = 'models/CAR/Female/F_Metl_Torso_BraMeshLOD.skin'
		0x56504ac4 = 1
		genre = [
			`heavy metal`
			`black metal`
		]
		price = 120
	}
	{
		desc_id = f_metl_torso_jeanlthr
		frontend_desc = qs(0xa2f0a9b4)
		mesh = 'models/CAR/Female/F_Metl_Torso_JeanLthr.skin'
		mesh1 = 'models/CAR/Female/F_Metl_Torso_JeanLthrLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_metl_torso_jeanlthr_primary
			f_metl_torso_jeanlthr_secondary
			f_metl_torso_jeanlthr_shirt
		]
		genre = [
			`heavy metal`
		]
		acc_skeleton = skel_f_metl_torso_jeanlthr
		acc_ragdoll = rag_f_metl_torso_jeanlthr
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 150
	}
	{
		desc_id = f_metl_torso_shirtbra
		frontend_desc = qs(0x12585d96)
		mesh = 'models/CAR/Female/F_Metl_Torso_ShirtBra.skin'
		mesh1 = 'models/CAR/Female/F_Metl_Torso_ShirtBraLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_metl_torso_shirtbra_primary
			f_metl_torso_shirtbra_secondary
		]
		genre = [
			`heavy metal`
			`black metal`
		]
	}
	{
		desc_id = f_clsc_torso_striped
		frontend_desc = qs(0xb3452072)
		mesh = 'models/CAR/Female/F_Clsc_Torso_Striped.skin'
		mesh1 = 'models/CAR/Female/F_Clsc_Torso_StripedLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_clsc_torso_striped_primary
			f_clsc_torso_striped_secondary
		]
		genre = [
			`classic rock`
		]
	}
	{
		desc_id = f_clsc_torso_pldtie
		frontend_desc = qs(0x89ee7a85)
		mesh = 'models/CAR/Female/F_Clsc_Torso_PldTie.skin'
		mesh1 = 'models/CAR/Female/F_Clsc_Torso_PldTieLOD.skin'
		0x56504ac4 = 1
		genre = [
			`classic rock`
		]
		materials = [
			f_clsc_torso_pldtie_primary
			f_clsc_torso_pldtie_secondary
			f_clsc_torso_pldtie_tie
		]
		acc_skeleton = skel_f_clsc_torso_pldtie
		acc_ragdoll = rag_f_clsc_torso_pldtie
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 115
		random_weight = 0.1
	}
	{
		desc_id = f_clsc_torso_jersey
		frontend_desc = qs(0x50433d5b)
		mesh = 'models/CAR/Female/F_Clsc_Torso_Jersey.skin'
		mesh1 = 'models/CAR/Female/F_Clsc_Torso_JerseyLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_clsc_torso_jersey_primary
			f_clsc_torso_jersey_secondary
		]
		genre = [
			`classic rock`
		]
	}
	{
		desc_id = f_clsc_torso_flwr
		frontend_desc = qs(0x9aba2e07)
		mesh = 'models/CAR/Female/F_Clsc_Torso_Flwr.skin'
		mesh1 = 'models/CAR/Female/F_Clsc_Torso_FlwrLOD.skin'
		0x56504ac4 = 1
		genre = [
			`classic rock`
		]
		acc_skeleton = skel_f_clsc_torso_flwr
		acc_ragdoll = rag_f_clsc_torso_flwr
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		materials = [
			f_clsc_torso_flwr_primary
			f_clsc_torso_flwr_secondary
			f_clsc_torso_flwr_third
			f_clsc_torso_flwr_rose
		]
		price = 140
	}
	{
		desc_id = f_clsc_torso_dress
		frontend_desc = qs(0x513dd30e)
		mesh = 'models/CAR/Female/F_Clsc_Torso_Dress.skin'
		mesh1 = 'models/CAR/Female/F_Clsc_Torso_DressLOD.skin'
		0x56504ac4 = 1
		genre = [
			`classic rock`
		]
		materials = [
			f_clsc_torso_dress_primary
		]
		price = 90
	}
	{
		desc_id = f_pop_torso_longsleeves
		frontend_desc = qs(0xc5ae5744)
		mesh = 'models/CAR/Female/F_Pop_Torso_Longsleeves.skin'
		mesh1 = 'models/CAR/Female/F_Pop_Torso_LongsleevesLOD.skin'
		0x56504ac4 = 1
		genre = [
			pop
		]
	}
	{
		desc_id = f_pop_torso_midori
		frontend_desc = qs(0xb176386f)
		mesh = 'models/CAR/Female/F_Pop_Torso_Midori.skin'
		mesh1 = 'models/CAR/Female/F_Pop_Torso_MidoriLOD.skin'
		0x56504ac4 = 1
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
	{
		desc_id = f_pop_torso_ruffletop
		frontend_desc = qs(0x821216c3)
		mesh = 'models/CAR/Female/F_Pop_Torso_RuffleTop.skin'
		mesh1 = 'models/CAR/Female/F_Pop_Torso_RuffleTopLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_pop_ruffletop_primary
			f_pop_ruffletop_secondary
		]
		genre = [
			pop
		]
		acc_skeleton = skel_f_pop_torso_ruffletop
		acc_ragdoll = rag_f_pop_torso_ruffletop
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 180
	}
	{
		desc_id = f_pop_torso_buttontop
		frontend_desc = qs(0x07afb613)
		mesh = 'models/CAR/Female/F_Pop_Torso_ButtonTop.skin'
		mesh1 = 'models/CAR/Female/F_Pop_Torso_ButtonTopLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_pop_buttontop_primary
			f_pop_buttontop_secondary
		]
		genre = [
			pop
		]
		acc_skeleton = skel_f_pop_torso_buttontop
		acc_ragdoll = rag_f_pop_torso_buttontop
		acc_bones = [
			bone_acc_torso_01
		]
		price = 195
		random_weight = 1.5
	}
	{
		desc_id = f_pop_torso_hayleyshirt
		frontend_desc = qs(0x8889c29a)
		mesh = 'models/CAR/Female/F_Pop_Torso_HayleyShirt.skin'
		mesh1 = 'models/CAR/Female/F_Pop_Torso_HayleyShirtLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_pop_torso_hayleyshirt_primary
		]
		genre = [
			pop
		]
		random_weight = 0.0
		random_weight_cpu = 0.0
	}
	{
		desc_id = f_bmtl_torso_corset01
		frontend_desc = qs(0x8993ac6d)
		mesh = 'models/CAR/Female/F_bmtl_Torso_Corset01.skin'
		mesh1 = 'models/CAR/Female/F_bmtl_Torso_Corset01LOD.skin'
		0x56504ac4 = 1
		genre = [
			`black metal`
		]
		acc_skeleton = skel_f_bmtl_torso_corset01
		acc_ragdoll = rag_f_bmtl_torso_corset01
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 450
	}
	{
		desc_id = f_bmtl_torso_spikeshirt
		frontend_desc = qs(0xe08761c6)
		mesh = 'models/CAR/Female/F_Bmtl_Torso_Spikeshirt.skin'
		mesh1 = 'models/CAR/Female/F_Bmtl_Torso_SpikeshirtLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_bmtl_torso_spikeshirt_primary
			f_bmtl_torso_spikeshirt_secondary
		]
		genre = [
			`black metal`
		]
	}
	{
		desc_id = f_bmtl_torso_fur
		frontend_desc = qs(0x97927568)
		mesh = 'models/CAR/Female/F_Bmtl_Torso_Fur.skin'
		mesh1 = 'models/CAR/Female/F_Bmtl_Torso_FurLOD.skin'
		0x56504ac4 = 1
		genre = [
			`black metal`
		]
		acc_skeleton = skel_f_bmtl_torso_fur
		acc_ragdoll = rag_f_bmtl_torso_fur
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
		price = 2000
	}
	{
		desc_id = f_bmtl_torso_spikearmor
		frontend_desc = qs(0x9aa713a4)
		mesh = 'models/CAR/Female/F_Bmtl_Torso_SpikeArmor.skin'
		mesh1 = 'models/CAR/Female/F_Bmtl_Torso_SpikeArmorLOD.skin'
		0x56504ac4 = 1
		genre = [
			`black metal`
		]
		price = 650
	}
	{
		desc_id = f_bmtl_torso_bikini
		frontend_desc = qs(0x77fdf6d5)
		mesh = 'models/CAR/Female/F_Bmtl_Torso_Bikini.skin'
		mesh1 = 'models/CAR/Female/F_Bmtl_Torso_BikiniLOD.skin'
		0x56504ac4 = 1
		materials = [
			f_bmtl_torso_bikini_primary
		]
		genre = [
			`black metal`
		]
		acc_skeleton = skel_f_bmtl_torso_bikini
		acc_ragdoll = rag_f_bmtl_torso_bikini
		acc_bones = [
			bone_acc_torso_01
		]
		price = 275
	}
]
