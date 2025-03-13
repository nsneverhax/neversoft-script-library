cas_male_torso = [
	{
		desc_id = m_torso_tshirt
		frontend_desc = qs(0x80c803f2)
		mesh = 'models/CAR/Male/M_Torso_TShirt.skin'
		random_weight = 1.0
		genre = [
			rock
			pop
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
		desc_id = shirtless
		frontend_desc = qs(0xb404a80c)
		random_weight = 0.0
	}
	{
		desc_id = m_torso_layered
		frontend_desc = qs(0x75e1cc5d)
		mesh = 'models/CAR/Male/M_Torso_Layered.skin'
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
		frontend_desc = qs(0xfa670229)
		mesh = 'models/CAR/Male/M_Torso_LayeredNoStripe.skin'
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
		mesh = 'models/CAR/Male/M_Torso_Hoodie.skin'
		random_weight = 1.0
		materials = [
			m_torso_hoodie_primary
			m_torso_hoodie_secondary
		]
		genre = [
			rock
		]
		acc_skeleton = skel_m_torso_hoodie
		acc_ragdoll = rag_m_torso_hoodie
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
		mesh = 'models/CAR/Male/M_Torso_Ninja.skin'
		random_weight = 0.0
		materials = [
			m_torso_ninja_primary
			m_torso_ninja_secondary
			m_torso_ninja_arms
		]
		genre = [
			goth
		]
		price = 1750
	}
	{
		desc_id = m_pop_torso_dragon
		frontend_desc = qs(0x66d76586)
		mesh = 'models/CAR/Male/M_Pop_Torso_Dragon.skin'
		materials = [
			m_pop_torso_dragon_primary
			m_pop_torso_dragon_secondary
		]
		acc_skeleton = skel_m_pop_torso_dragon
		acc_ragdoll = rag_m_pop_torso_dragon
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 0.0
		price = 8000
	}
	{
		desc_id = m_pop_torso_leather
		frontend_desc = qs(0xca431d9a)
		mesh = 'models/CAR/Male/M_Pop_Torso_Leather.skin'
		materials = [
			m_pop_torso_leather_primary
			m_pop_torso_leather_secondary
		]
		random_weight = 1.0
		acc_skeleton = skel_m_pop_torso_leather
		acc_ragdoll = rag_m_pop_torso_leather
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			pop
		]
		price = 150
	}
	{
		desc_id = m_pop_torso_openshirt
		frontend_desc = qs(0x903c37b0)
		mesh = 'models/CAR/Male/M_Pop_Torso_OpenShirt.skin'
		materials = [
			m_pop_torso_openshirt_primary
			m_pop_torso_openshirt_secondary
		]
		random_weight = 1.0
		acc_skeleton = skel_m_pop_torso_openshirt
		acc_ragdoll = rag_m_pop_torso_openshirt
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
		mesh = 'models/CAR/Male/M_Pop_Torso_Suit.skin'
		materials = [
			m_pop_torso_suit_primary
			m_pop_torso_suit_secondary
		]
		random_weight = 1.0
		genre = [
			pop
		]
		price = 300
	}
	{
		desc_id = m_pop_torso_turtleshirt
		frontend_desc = qs(0x483148bd)
		mesh = 'models/CAR/Male/M_Pop_Torso_TurtleShirt.skin'
		random_weight = 1.0
		materials = [
			m_pop_torso_turtleshirt_primary
			m_pop_torso_turtleshirt_secondary
		]
		acc_skeleton = skel_m_pop_torso_turtleshirt
		acc_ragdoll = rag_m_pop_torso_turtleshirt
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			pop
		]
		price = 225
	}
	{
		desc_id = m_pop_torso_vest
		frontend_desc = qs(0x3b3d04c5)
		mesh = 'models/CAR/Male/M_Pop_Torso_Vest.skin'
		random_weight = 1.0
		genre = [
			pop
		]
		materials = [
			m_pop_torso_vest_primary
			m_pop_torso_vest_secondary
		]
		acc_skeleton = skel_m_pop_torso_vest
		acc_ragdoll = rag_m_pop_torso_vest
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 175
	}
	{
		desc_id = m_punk_torso_jacket
		frontend_desc = qs(0xdec0d31b)
		mesh = 'models/CAR/Male/M_Punk_Torso_Jacket.skin'
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_torso_jacket
		acc_ragdoll = rag_m_punk_torso_jacket
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 150
	}
	{
		desc_id = m_punk_torso_jacket_02
		frontend_desc = qs(0xd58d8dcd)
		mesh = 'models/CAR/Male/M_Punk_Torso_Jacket_02.skin'
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_torso_jacket
		acc_ragdoll = rag_m_punk_torso_jacket
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 150
	}
	{
		desc_id = m_punk_torso_jacket_03
		frontend_desc = qs(0x718e92e2)
		mesh = 'models/CAR/Male/M_Punk_Torso_Jacket_03.skin'
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_torso_jacket
		acc_ragdoll = rag_m_punk_torso_jacket
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 150
	}
	{
		desc_id = m_punk_torso_hood
		frontend_desc = qs(0xd017a37b)
		mesh = 'models/CAR/Male/M_Punk_Torso_Hood.skin'
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_torso_hood_03
		acc_ragdoll = rag_m_punk_torso_hood_03
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_punk_torso_hood_03
		frontend_desc = qs(0xdb1ea893)
		mesh = 'models/CAR/Male/M_Punk_Torso_Hood_03.skin'
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_torso_hood_03
		acc_ragdoll = rag_m_punk_torso_hood_03
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 250
	}
	{
		desc_id = m_punk_torso_hood_02
		frontend_desc = qs(0xc2641269)
		mesh = 'models/CAR/Male/M_Punk_Torso_Hood_02.skin'
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_torso_hood_03
		acc_ragdoll = rag_m_punk_torso_hood_03
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 250
	}
	{
		desc_id = m_punk_torso_beater
		frontend_desc = qs(0x61e6dc36)
		mesh = 'models/CAR/Male/M_Punk_Torso_Beater.skin'
		materials = [
			m_punk_torso_beater_primary
		]
		random_weight = 1.0
		genre = [
			punk
		]
	}
	{
		desc_id = m_punk_torso_bowling
		frontend_desc = qs(0x6c89158b)
		mesh = 'models/CAR/Male/M_Punk_Torso_Bowling.skin'
		materials = [
			m_punk_torso_bowling_primary
			m_punk_torso_bowling_secondary
		]
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
		desc_id = m_punk_torso_johnny1
		frontend_desc = qs(0xfb918590)
		mesh = 'models/CAR/Male/M_Punk_Torso_Johnny1.skin'
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_torso_johnny1
		acc_ragdoll = rag_m_punk_torso_johnny1
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_punk_torso_johnny1_02
		frontend_desc = qs(0x59773dda)
		mesh = 'models/CAR/Male/M_Punk_Torso_Johnny1_02.skin'
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_torso_johnny1
		acc_ragdoll = rag_m_punk_torso_johnny1
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 850
	}
	{
		desc_id = m_punk_torso_johnny1_03
		frontend_desc = qs(0x936f53d8)
		mesh = 'models/CAR/Male/M_Punk_Torso_Johnny1_03.skin'
		random_weight = 1.0
		genre = [
			punk
		]
		acc_skeleton = skel_m_punk_torso_johnny1
		acc_ragdoll = rag_m_punk_torso_johnny1
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_clsc_torso_scarf
		frontend_desc = qs(0x98fd55e5)
		mesh = 'models/CAR/Male/M_Clsc_Torso_scarf.skin'
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		materials = [
			m_clsc_torso_scarf_primary
			m_clsc_torso_scarf_vest
			m_clsc_torso_scarf_secondary
		]
		acc_skeleton = skel_m_clsc_torso_scarf
		acc_ragdoll = rag_m_clsc_torso_scarf
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
		mesh = 'models/CAR/Male/M_Clsc_Torso_confed.skin'
		random_weight = 1.0
		genre = [
			`classic rock`
		]
		materials = [
			m_clsc_torso_confed_primary
		]
		acc_skeleton = skel_m_clsc_torso_confed
		acc_ragdoll = rag_m_clsc_torso_confed
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 350
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
		acc_skeleton = skel_m_clsc_torso_clrdjakt
		acc_ragdoll = rag_m_clsc_torso_clrdjakt
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_clsc_torso_jimi
		frontend_desc = qs(0xebfe5def)
		mesh = 'models/CAR/Male/M_Clsc_Torso_Jimi.skin'
		genre = [
			`classic rock`
		]
		price = 5
		acc_skeleton = skel_m_clsc_torso_jimi
		acc_ragdoll = rag_m_clsc_torso_jimi
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		materials = [
			m_clsc_torso_jimi_primary
		]
		price = 2000
		random_weight = 0.0
	}
	{
		desc_id = m_goth_torso_strait
		frontend_desc = qs(0xcb53adfe)
		mesh = 'models/CAR/Male/M_Goth_Torso_Strait.skin'
		random_weight = 1.0
		genre = [
			goth
		]
		price = 5
		materials = [
			m_goth_torso_strait_primary
			m_goth_torso_strait_secondary
			m_goth_torso_strait_metal
		]
		acc_skeleton = skel_m_goth_torso_strait
		acc_ragdoll = rag_m_goth_torso_strait
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 1500
	}
	{
		desc_id = m_goth_torso_madmax
		frontend_desc = qs(0x010fa69b)
		mesh = 'models/CAR/Male/M_Goth_Torso_MadMax.skin'
		materials = [
			m_goth_torso_madmax_leather
			m_goth_torso_madmax_sleeve
		]
		random_weight = 1.0
		genre = [
			goth
		]
		acc_skeleton = skel_m_goth_torso_madmax
		acc_ragdoll = rag_m_goth_torso_madmax
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 450
	}
	{
		desc_id = m_goth_torso_tux
		frontend_desc = qs(0x3a5a5695)
		mesh = 'models/CAR/Male/M_Goth_Torso_Tux.skin'
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
		acc_skeleton = skel_m_goth_torso_tux
		acc_ragdoll = rag_m_goth_torso_tux
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
		]
	}
	{
		desc_id = m_goth_torso_poet
		frontend_desc = qs(0x5ad056ff)
		mesh = 'models/CAR/Male/M_Goth_Torso_Poet.skin'
		materials = [
			m_goth_torso_poet_primary
		]
		random_weight = 1.0
		genre = [
			goth
		]
		acc_skeleton = skel_m_goth_torso_poet
		acc_ragdoll = rag_m_goth_torso_poet
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
	}
	{
		desc_id = m_goth_torso_vest
		frontend_desc = qs(0x283675e8)
		mesh = 'models/CAR/Male/M_Goth_Torso_Vest.skin'
		random_weight = 1.0
		genre = [
			goth
		]
		acc_skeleton = skel_m_goth_torso_vest
		acc_ragdoll = rag_m_goth_torso_vest
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
		price = 300
	}
	{
		desc_id = m_fun_torso_angelw
		frontend_desc = qs(0xc8fe9880)
		mesh = 'models/CAR/male/M_Fun_Torso_AngelW.skin'
		materials = [
			m_fun_torso_angelw_wing
		]
		genre = [
			goth
		]
		acc_skeleton = skel_m_fun_torso_angelw
		acc_ragdoll = rag_m_fun_torso_angelw
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 7500
		locked
		polaroid = p_m_goth_torso_angelw
		random_weight = 0.0
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
		desc_id = m_metl_torso_axel2
		frontend_desc = qs(0xd3caf88a)
		mesh = 'models/CAR/Male/M_Metl_Torso_Axel2.skin'
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		acc_skeleton = skel_m_metl_torso_axel2
		acc_ragdoll = rag_m_metl_torso_axel2
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_metl_torso_zakk
		frontend_desc = qs(0xc3ab6498)
		mesh = 'models/CAR/Male/M_Metl_Torso_Zakk.skin'
		materials = [
			m_metl_torso_zakk_primary
			m_metl_torso_zakk_secondary
		]
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		acc_skeleton = skel_m_metl_torso_zakk
		acc_ragdoll = rag_m_metl_torso_zakk
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		random_weight = 0.25
		random_weight_cpu = 0.0
		locked
	}
	{
		desc_id = m_metl_torso_straps
		frontend_desc = qs(0xd7d98d81)
		mesh = 'models/CAR/Male/M_Metl_Torso_Straps.skin'
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
		price = 350
	}
	{
		desc_id = m_metl_torso_lthrjkt
		frontend_desc = qs(0x6a7176b4)
		mesh = 'models/CAR/Male/M_Metl_Torso_LthrJkt.skin'
		materials = [
			m_metl_torso_lthrjkt_primary
			m_metl_torso_lthrjkt_secondary
			m_metl_torso_lthrjkt_stripe
		]
		random_weight = 1.0
		genre = [
			`heavy metal`
		]
		acc_skeleton = skel_m_metl_torso_lthrjkt
		acc_ragdoll = rag_m_metl_torso_lthrjkt
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
	}
	{
		desc_id = m_rock_torso_tie
		frontend_desc = qs(0xa0d0d3bb)
		mesh = 'models/CAR/Male/M_Rock_Torso_Tie.skin'
		materials = [
			m_rock_torso_tie_primary
			m_rock_torso_tie_secondary
			m_rock_torso_tie_tertiary
		]
		random_weight = 1.0
		genre = [
			rock
		]
		acc_skeleton = skel_m_rock_torso_tie
		acc_ragdoll = rag_m_rock_torso_tie
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 150
	}
	{
		desc_id = m_rock_torso_bandana
		frontend_desc = qs(0x5c95d8b1)
		mesh = 'models/CAR/Male/M_Rock_Torso_Bandana.skin'
		random_weight = 1.0
		genre = [
			rock
		]
		acc_skeleton = skel_m_rock_torso_bandana
		acc_ragdoll = rag_m_rock_torso_bandana
		acc_bones = [
			bone_acc_torso_01
		]
		price = 100
	}
	{
		desc_id = m_rock_torso_ozzycoat
		frontend_desc = qs(0x0fd4c4e4)
		mesh = 'models/CAR/Male/M_Rock_Torso_OzzyCoat.skin'
		materials = [
			m_rock_torso_ozzycoat_primary
			m_rock_torso_ozzycoat_secondary
		]
		random_weight = 1.0
		acc_skeleton = skel_m_rock_torso_ozzycoat
		acc_ragdoll = rag_m_rock_torso_ozzycoat
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
		random_weight_cpu = 0.0
		locked
	}
	{
		desc_id = m_rock_torso_sleeveless
		frontend_desc = qs(0xd8b0b44a)
		mesh = 'models/CAR/Male/M_Rock_Torso_Sleeveless.skin'
		materials = [
			m_rock_torso_sleeveless_primary
		]
		random_weight = 1.0
		acc_skeleton = skel_m_rock_torso_sleeveless
		acc_ragdoll = rag_m_rock_torso_sleeveless
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
		mesh = 'models/CAR/Male/M_Rock_Torso_LJacket.skin'
		materials = [
			m_rock_torso_ljacket_primary
			m_rock_torso_ljacket_secondary
		]
		random_weight = 1.0
		acc_skeleton = skel_m_rock_torso_ljacket
		acc_ragdoll = rag_m_rock_torso_ljacket
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			rock
		]
		price = 250
	}
	{
		desc_id = m_rock_torso_ripshirt
		frontend_desc = qs(0xac86e5d7)
		mesh = 'models/CAR/Male/M_Rock_Torso_RipShirt.skin'
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
		mesh = 'models/CAR/Male/M_Rock_Torso_RolledSlvs.skin'
		materials = [
			m_rock_torso_rolledslvs_primary
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_torso_tasselvest
		frontend_desc = qs(0xa559f15c)
		mesh = 'models/CAR/Male/M_Torso_TasselVest.skin'
		materials = [
			m_torso_tasselvest_primary
			m_torso_tasselvest_secondary
		]
		random_weight = 0.1
		acc_skeleton = skel_m_torso_tasselvest
		acc_ragdoll = rag_m_torso_tasselvest
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
		desc_id = m_rock_torso_rockbot
		frontend_desc = qs(0x3ab7a665)
		mesh = 'models/CAR/Male/M_Rock_Torso_RockBot.skin'
		materials = [
			m_rock_torso_rockbot_primary
		]
		random_weight = 0.0
		price = 15000
	}
	{
		desc_id = m_glam_torso_rags
		frontend_desc = qs(0x56b233aa)
		mesh = 'models/CAR/Male/M_Glam_Torso_Rags.skin'
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
		mesh = 'models/CAR/Male/M_Glam_Torso_Champ.skin'
		materials = [
			m_glam_torso_champ_primary
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		acc_skeleton = skel_m_glam_torso_champ
		acc_ragdoll = rag_m_glam_torso_champ
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		price = 400
	}
	{
		desc_id = m_glam_torso_tiger
		frontend_desc = qs(0x71c4b537)
		mesh = 'models/CAR/Male/M_Glam_Torso_Tiger.skin'
		materials = [
			m_glam_torso_tiger_primary
			m_glam_torso_tiger_secondary
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		acc_skeleton = skel_m_glam_torso_tiger
		acc_ragdoll = rag_m_glam_torso_tiger
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
	}
	{
		desc_id = m_glam_torso_gold
		frontend_desc = qs(0xd14cda2e)
		mesh = 'models/CAR/Male/M_Glam_Torso_Gold.skin'
		materials = [
			m_glam_torso_gold_primary
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		acc_skeleton = skel_m_glam_torso_gold
		acc_ragdoll = rag_m_glam_torso_gold
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
		mesh = 'models/CAR/Male/M_Glam_Torso_Kiss.skin'
		materials = [
			m_glam_torso_kiss_primary
			m_glam_torso_kiss_secondary
		]
		random_weight = 1.0
		genre = [
			`glam rock`
		]
		acc_skeleton = skel_m_glam_torso_kiss
		acc_ragdoll = rag_m_glam_torso_kiss
		acc_bones = [
			bone_acc_torso_01
		]
		price = 2500
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
	{
		desc_id = m_bmtl_torso_skeleton
		frontend_desc = qs(0xeb74999f)
		mesh = 'models/CAR/Male/M_Bmtl_Torso_Skeleton.skin'
		random_weight = 1.0
		genre = [
			`black metal`
		]
		price = 1400
	}
	{
		desc_id = m_bmtl_torso_skeletonbelt
		frontend_desc = qs(0xd1f5c120)
		mesh = 'models/CAR/Male/M_Bmtl_Torso_SkeletonBelt.skin'
		materials = [
			m_bmtl_torso_skeletonbelt_primary
			m_bmtl_torso_skeletonbelt_secondary
		]
		random_weight = 1.0
		acc_skeleton = skel_m_bmtl_torso_skeletonbelt
		acc_ragdoll = rag_m_bmtl_torso_skeletonbelt
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
		]
		genre = [
			`black metal`
		]
		price = 1500
	}
	{
		desc_id = m_bmtl_torso_patternjacket
		frontend_desc = qs(0x12daf194)
		mesh = 'models/CAR/Male/M_Bmtl_Torso_PatternJacket.skin'
		random_weight = 1.0
		materials = [
			m_bmtl_patternjacket_primary
		]
		acc_skeleton = skel_m_bmtl_torso_patternjacket
		acc_ragdoll = rag_m_bmtl_torso_patternjacket
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
		mesh = 'models/CAR/Male/M_Bmtl_Torso_CoatRing.skin'
		materials = [
			m_metl_torso_coatring_primary
			m_metl_torso_coatring_secondary
			m_metl_torso_coatring_belt
		]
		random_weight = 1.0
		acc_skeleton = skel_m_bmtl_torso_coatring
		acc_ragdoll = rag_m_bmtl_torso_coatring
		acc_bones = [
			bone_acc_torso_01
			bone_acc_torso_02
			bone_acc_torso_03
			bone_acc_torso_04
		]
		genre = [
			`black metal`
		]
		price = 1550
	}
]
