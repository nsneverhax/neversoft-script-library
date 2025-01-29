CAS_Female_Shoes = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 0.0
	}
	{
		desc_id = F_Flipflops
		frontend_desc = qs(0x4fcc1639)
		mesh = `models/CAR/Female/F_Flipflops`
		material_groups = [
			{
				materials = [
					F_Flipflops_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					F_Flipflops_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		genre = [
			`Classic	Rock`
			Pop
		]
		random_weight = 0.1
	}
	{
		desc_id = F_Shoe_Fuzzy
		frontend_desc = qs(0x657acf9e)
		mesh = `models/CAR/Female/F_Pop_Shoe_Fuzzy`
		material_groups = [
			{
				materials = [
					F_Shoe_Fuzzy_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Shoe_Fuzzy_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x1d55e1b4)
			}
		]
		genre = [
			Pop
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Shoe_Ninja
		frontend_desc = qs(0x2eb17c31)
		mesh = `models/CAR/Female/F_Shoe_Ninja`
		materials = [
			F_Shoe_Ninja_Primary
		]
		genre = [
			Goth
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Pop_Shoes_Sneakers
		frontend_desc = qs(0x120cfee9)
		mesh = `models/CAR/Female/F_Pop_Shoe_Sneakers`
		genre = [
			Pop
		]
		material_groups = [
			{
				materials = [
					M_Pop_Shoe_Sneakers_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					M_Pop_Shoe_Sneakers_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
	}
	{
		desc_id = F_Pop_Shoes_SparkleHeels
		frontend_desc = qs(0xc437fd4d)
		mesh = `models/CAR/Female/F_Pop_Shoes_SparkleHeels`
		diff_anim = 'female_heels_high_d'
		materials = [
			F_Pop_SparkleHeels_Primary
		]
		genre = [
			Pop
		]
		random_weight = 0.25
	}
	{
		desc_id = F_Pop_Shoe_Platforms
		frontend_desc = qs(0x13038d3b)
		mesh = `models/CAR/Female/F_Pop_Shoe_Platforms`
		diff_anim = 'female_heels_highplat_d'
		materials = [
			F_Pop_Shoe_Platforms_Primary
		]
		genre = [
			Pop
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Pop_Shoes_HayleyShoes
		frontend_desc = qs(0xe7047321)
		mesh = `models/CAR/Female/F_Pop_Shoes_HayleyShoes`
		material_groups = [
			{
				materials = [
					F_Pop_HayleyShoes_Primary
				]
				shader = $cas_shader_skin_masked1
			}
			{
				materials = [
					F_Pop_HayleyShoes_Primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		random_weight = 0.0
		genre = [
			Pop
		]
	}
	{
		desc_id = F_Pop_Shoe_Midori01
		frontend_desc = qs(0x569fef2c)
		mesh = `models/CAR/Female/F_Pop_Shoe_Midori01`
		genre = [
			Pop
		]
		price = 0
		locked
	}
	{
		desc_id = F_Pop_Shoe_Midori02
		frontend_desc = qs(0x0e346d43)
		mesh = `models/CAR/Female/F_Pop_Shoe_Midori02`
		diff_anim = 'female_heels_highplat_d'
		materials = [
			F_Pop_Shoe_Midori02_01
		]
		genre = [
			Pop
		]
		price = 0
		locked
	}
	{
		desc_id = F_Pop_Shoe_Midori03
		frontend_desc = qs(0x7554d4e1)
		mesh = `models/CAR/Female/F_Pop_Shoe_Midori03`
		materials = [
			F_Pop_Shoe_Midori03_01
		]
		genre = [
			Pop
		]
		price = 0
	}
	{
		desc_id = F_Pop_Shoe_Midori04
		frontend_desc = qs(0xecee99a7)
		mesh = `models/CAR/Female/F_Pop_Shoe_Midori04`
		diff_anim = 'female_heels_highplat_d'
		material_groups = [
			{
				materials = [
					F_Pop_Shoe_Midori04_01
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Pop_Shoe_Midori04_02
				]
				shader = $cas_shader_skin
				name = qs(0x91b94d01)
			}
		]
		genre = [
			Pop
		]
		price = 0
	}
	{
		desc_id = F_Pop_Shoe_EmericaAR
		frontend_desc = qs(0x2856dc10)
		mesh = `models/CAR/Female/F_Pop_Shoe_EmericaAR`
		material_groups = [
			{
				materials = [
					F_Pop_Shoe_EmericaAR_Primary_L
					F_Pop_Shoe_EmericaAR_Primary_R
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Pop_Shoe_EmericaAR_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x681917f4)
			}
		]
		random_weight = 1.0
		genre = [
			Pop
		]
	}
	{
		desc_id = F_Pop_Shoe_Braydon_01
		frontend_desc = qs(0xe1821fef)
		mesh = `models/CAR/Female/F_Pop_Shoe_Braydon_01`
		random_weight = 1.0
		genre = [
			Pop
		]
		swatch_list = [
			F_Pop_Shoe_Braydon_02
			F_Pop_Shoe_Braydon_03
			F_Pop_Shoe_Braydon_04
		]
		swatch_texture = `tex/models/Characters/Car/Male/Pop/Swatch_Braydon_01`
	}
	{
		desc_id = F_Pop_Shoe_Braydon_02
		frontend_desc = qs(0xf04ac3ee)
		mesh = `models/CAR/Female/F_Pop_Shoe_Braydon_02`
		random_weight = 1.0
		genre = [
			Pop
		]
		swatch_for = F_Pop_Shoe_Braydon_01
		swatch_texture = `tex/models/Characters/Car/Male/Pop/Swatch_Braydon_02`
	}
	{
		desc_id = F_Pop_Shoe_Braydon_03
		frontend_desc = qs(0x565b0070)
		mesh = `models/CAR/Female/F_Pop_Shoe_Braydon_03`
		random_weight = 1.0
		genre = [
			Pop
		]
		swatch_for = F_Pop_Shoe_Braydon_01
		swatch_texture = `tex/models/Characters/Car/Male/Pop/Swatch_Braydon_03`
	}
	{
		desc_id = F_Pop_Shoe_Braydon_04
		frontend_desc = qs(0x33a76d68)
		mesh = `models/CAR/Female/F_Pop_Shoe_Braydon_04`
		random_weight = 1.0
		genre = [
			Pop
		]
		swatch_for = F_Pop_Shoe_Braydon_01
		swatch_texture = `tex/models/Characters/Car/Male/Pop/Swatch_Braydon_04`
	}
	{
		desc_id = F_Shoes_Etnies01
		frontend_desc = qs(0x088b3be8)
		mesh = `models/CAR/Female/F_Shoes_Etnies01`
		random_weight = 1.0
		genre = [
			Pop
		]
		swatch_list = [
			F_Shoes_Etnies02
			F_Shoes_Etnies03
			F_Shoes_Etnies04
		]
		swatch_texture = `tex\models\Characters\CAR\Sponsor\Swatch_F_Etnies01`
	}
	{
		desc_id = F_Shoes_Etnies02
		frontend_desc = qs(0xdadb3ae6)
		mesh = `models/CAR/Female/F_Shoes_Etnies02`
		random_weight = 1.0
		genre = [
			Pop
		]
		swatch_for = F_Shoes_Etnies01
		swatch_texture = `tex\models\Characters\CAR\Sponsor\Swatch_F_Etnies02`
	}
	{
		desc_id = F_Shoes_Etnies03
		frontend_desc = qs(0x72f7ed1f)
		mesh = `models/CAR/Female/F_Shoes_Etnies03`
		random_weight = 1.0
		genre = [
			Pop
		]
		swatch_for = F_Shoes_Etnies01
		swatch_texture = `tex\models\Characters\CAR\Sponsor\Swatch_F_Etnies03`
	}
	{
		desc_id = F_Shoes_Etnies04
		frontend_desc = qs(0x630e7a77)
		mesh = `models/CAR/Female/F_Shoes_Etnies04`
		random_weight = 1.0
		genre = [
			Pop
		]
		swatch_for = F_Shoes_Etnies01
		swatch_texture = `tex\models\Characters\CAR\Sponsor\Swatch_F_Etnies04`
	}
	{
		desc_id = F_Punk_Shoe_ThickBoots
		frontend_desc = qs(0x92d1874e)
		mesh = `models/CAR/Female/F_Punk_Shoe_ThickBoots`
		material_groups = [
			{
				materials = [
					F_Punk_Shoe_ThickBoot_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Punk_Shoe_ThickBoot_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x681917f4)
			}
		]
		diff_anim = 'female_heels_highplat_d'
		genre = [
			Punk
		]
	}
	{
		desc_id = F_Punk_Shoe_Army
		frontend_desc = qs(0x32f046fc)
		mesh = `models/CAR/Female/F_Punk_Shoe_Army`
		material_groups = [
			{
				materials = [
					F_Punk_Shoe_Army_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Punk_Shoe_Army_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x8f4f26f2)
			}
		]
		diff_anim = 'female_heels_med_d'
		genre = [
			Punk
		]
	}
	{
		desc_id = F_Punk_Shoes_Judy01
		frontend_desc = qs(0xc18378f6)
		mesh = `models/CAR/Female/F_Punk_Shoes_Judy01`
		materials = [
			F_Punk_Shoes_Judy01_Primary
		]
		diff_anim = 'female_heels_highplat_d'
		genre = [
			Punk
		]
	}
	{
		desc_id = F_Punk_Shoe_Judy5
		frontend_desc = qs(0x491f1767)
		mesh = `models/CAR/Female/F_Punk_Shoe_Judy5`
		materials = [
			F_Punk_Shoe_Judy5_Primary
		]
		genre = [
			Punk
		]
	}
	{
		desc_id = F_Punk_Shoe_JudyNails1
		frontend_desc = qs(0xe1dab999)
		mesh = `models/CAR/Female/F_Punk_Shoe_JudyNails1`
		materials = [
			F_Punk_Shoe_JudyNails1_Primary
		]
		genre = [
			Punk
		]
		locked
	}
	{
		desc_id = F_Rock_Shoe_Casey5
		frontend_desc = qs(0xe4e3dfd0)
		mesh = `models/CAR/Female/F_Rock_Shoe_Casey5`
		diff_anim = 'female_heels_high_d'
		genre = [
			rock
		]
		material_groups = [
			{
				materials = [
					F_Rock_Shoe_Casey5_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Rock_Shoe_Casey5_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6ad7504e)
			}
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Rock_Shoe_Cowboy
		frontend_desc = qs(0x195e8eeb)
		mesh = `models/CAR/Female/F_Rock_Shoe_Cowboy`
		diff_anim = 'female_heels_med_d'
		genre = [
			rock
		]
		material_groups = [
			{
				materials = [
					F_Rock_Shoe_Cowboy_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Rock_Shoe_Cowboy_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6ad7504e)
			}
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Rock_Shoe_Kneehigh
		frontend_desc = qs(0x523e1e30)
		mesh = `models/CAR/Female/F_Rock_Shoe_Kneehigh`
		diff_anim = 'female_heels_high_d'
		materials = [
			F_Rock_Shoe_Kneehigh_Primary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = F_Rock_Shoe_CBuck
		frontend_desc = qs(0xfdb03783)
		mesh = `models/CAR/Female/F_Rock_Shoe_CBuck`
		materials = [
			F_Rock_Shoe_CBuck_Primary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = F_Rock_Shoe_ThighHigh
		frontend_desc = qs(0xa42c268a)
		mesh = `models/CAR/Female/F_Rock_Shoe_ThighHigh`
		materials = [
			F_Rock_Shoe_ThighHigh_Primary
		]
		diff_anim = 'female_heels_highplat_d'
		genre = [
			rock
		]
		locked
	}
	{
		desc_id = F_Rock_Shoe_Buckles
		frontend_desc = qs(0x4839b3fa)
		mesh = `models/CAR/Female/F_Rock_Shoe_Buckles`
		diff_anim = 'female_heels_high_d'
		genre = [
			rock
		]
	}
	{
		desc_id = F_Rock_shoe_ECBBoot
		frontend_desc = qs(0xabf1bc05)
		mesh = `models/CAR/Female/F_Rock_Shoe_ECBBoot`
		diff_anim = 'female_heels_med_d'
		genre = [
			rock
		]
		materials = [
			F_Rock_Shoe_ECBBoot_Primary
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Rock_Shoe_Wingtip
		frontend_desc = qs(0xddb88f0b)
		mesh = `models/CAR/Female/F_Rock_Shoe_Wingtip`
		genre = [
			rock
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Glam_Shoes_VelvetBaggyBoots
		frontend_desc = qs(0x76585e26)
		mesh = `models/CAR/Female/F_Glam_Shoes_VelvetBaggyBoots`
		diff_anim = 'female_heels_high_d'
		genre = [
			`Glam	Rock`
		]
		material_groups = [
			{
				materials = [
					F_Glam_Shoes_VelvetBaggyBoots_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					F_Glam_Shoes_VelvetBaggyBoots_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Glam_shoe_WrinkleBoot
		frontend_desc = qs(0xd3cf190e)
		mesh = `models/CAR/Female/F_Glam_shoe_WrinkleBoot`
		diff_anim = 'female_heels_high_d'
		genre = [
			`Glam	Rock`
		]
		materials = [
			F_Glam_shoe_WrinkleBoot_Primary
		]
	}
	{
		desc_id = F_Glam_shoe_PlatformHeel
		frontend_desc = qs(0xd859b053)
		mesh = `models/CAR/Female/F_Glam_shoe_PlatformHeel`
		diff_anim = 'female_heels_highplat_d'
		genre = [
			`Glam	Rock`
		]
	}
	{
		desc_id = F_Goth_Shoe_BuckleB
		frontend_desc = qs(0xb94a8887)
		mesh = `models/CAR/Female/F_Goth_Shoe_BuckleB`
		diff_anim = 'female_heels_highplat_d'
		genre = [
			Goth
		]
	}
	{
		desc_id = F_Goth_Shoes_Maryjanes
		frontend_desc = qs(0xaa08c478)
		mesh = `models/CAR/Female/F_Goth_Shoes_Maryjanes`
		material_groups = [
			{
				materials = [
					F_Goth_Shoes_Maryjanes_shoe
					F_Goth_Shoes_Maryjanes_sole
				]
			}
		]
		diff_anim = 'female_heels_highplat_d'
		genre = [
			Goth
		]
	}
	{
		desc_id = F_Goth_Shoe_CyberB
		frontend_desc = qs(0x7cdca4fa)
		mesh = `models/CAR/Female/F_Goth_Shoes_CyberB`
		material_groups = [
			{
				materials = [
					F_Goth_Shoes_CyberB_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Goth_Shoes_CyberB_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xc9bbbd67)
			}
			{
				materials = [
					F_Goth_Shoes_CyberB_sole
				]
				shader = $cas_shader_skin
				name = qs(0x681917f4)
			}
		]
		diff_anim = 'female_heels_highplat_d'
		genre = [
			Goth
		]
		random_weight = 0.1
	}
	{
		desc_id = F_Goth_Shoe_WitchB
		frontend_desc = qs(0x47b64ca9)
		mesh = `models/CAR/Female/F_Goth_Shoes_WitchB`
		material_groups = [
			{
				materials = [
					F_Goth_Shoes_WitchB_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Goth_Shoes_WitchB_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xdb0513b8)
			}
		]
		diff_anim = 'female_heels_high_d'
		genre = [
			Goth
		]
	}
	{
		desc_id = F_Goth_Shoe_Pumps
		frontend_desc = qs(0x86a299fe)
		mesh = `models/CAR/Female/F_Goth_Shoes_Pumps`
		genre = [
			Goth
		]
		diff_anim = 'female_heels_med_d'
	}
	{
		desc_id = F_Goth_Shoe_Pndr3buckle
		frontend_desc = qs(0xd703ef3e)
		mesh = `models/CAR/Female/F_Goth_Shoe_Pndr3buckle`
		materials = [
			F_Goth_Shoe_Pndr3buckle_Primary
		]
		diff_anim = 'female_heels_high_d'
		genre = [
			Goth
		]
	}
	{
		desc_id = F_Goth_Shoe_Pilgrim
		frontend_desc = qs(0x0fd701a6)
		mesh = `models/CAR/Female/F_Goth_Shoe_Pilgrim`
		materials = [
			F_Goth_Shoe_Pilgrim_Primary
		]
		diff_anim = 'female_heels_high_d'
		genre = [
			Goth
		]
		locked
	}
	{
		desc_id = F_Goth_Shoe_PndrPlats
		frontend_desc = qs(0xe4174a12)
		mesh = `models/CAR/Female/F_Goth_Shoe_PndrPlats`
		locked
		material_groups = [
			{
				materials = [
					F_Goth_Shoe_PndrPlats_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x3fcdee7f)
			}
			{
				materials = [
					F_Goth_Shoe_PndrPlats_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x04809f02)
			}
		]
		diff_anim = 'female_heels_highplat_d'
		genre = [
			Goth
		]
	}
	{
		desc_id = F_Goth_Shoe_PndrSpike
		frontend_desc = qs(0x6fc546d8)
		mesh = `models/CAR/Female/F_Goth_Shoe_PndrSpike`
		material_groups = [
			{
				materials = [
					F_Goth_Shoe_PndrSpike_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x3fcdee7f)
			}
		]
		diff_anim = 'female_heels_highplat_d'
		genre = [
			Goth
		]
		locked
	}
	{
		desc_id = F_Goth_Shoe_Pandora5
		frontend_desc = qs(0xef71af7a)
		mesh = `models/CAR/Female/F_Goth_Shoe_Pandora5`
		material_groups = [
			{
				materials = [
					F_Goth_Shoe_Pandora5_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Goth_Shoe_Pandora5_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xdb0513b8)
			}
		]
		diff_anim = 'female_heels_high_d'
		genre = [
			Goth
		]
	}
	{
		desc_id = F_Metl_Shoe_HighTop
		frontend_desc = qs(0x35993379)
		mesh = `models/CAR/Female/F_Metl_Shoe_HighTop`
		material_groups = [
			{
				materials = [
					F_Metl_Shoe_HighTop_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Metl_Shoe_HighTop_Laces
				]
				shader = $cas_shader_skin
				name = qs(0x8f4f26f2)
			}
			{
				materials = [
					F_Metl_Shoe_HighTop_Sock
				]
				shader = $cas_shader_skin
				name = qs(0xc358c93f)
			}
		]
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
			`Glam	Rock`
		]
	}
	{
		desc_id = F_Metl_Shoes_Studs01
		frontend_desc = qs(0x543d6880)
		mesh = `models/CAR/Female/F_Metl_Shoes_Studs01`
		materials = [
			F_Metl_shoes_Studs01_Primary
		]
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
		diff_anim = 'female_heels_med_d'
	}
	{
		desc_id = F_Metl_Shoe_LtrRing
		frontend_desc = qs(0x2f0aeb4a)
		mesh = `models/CAR/Female/F_Metl_Shoe_LtrRing`
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
	}
	{
		desc_id = F_Metl_Shoe_Platform
		frontend_desc = qs(0x5c7ecc3e)
		mesh = `models/CAR/Female/F_Metl_Shoe_Platform`
		diff_anim = 'female_heels_med_d'
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
	}
	{
		desc_id = F_Metl_Shoe_Combat
		frontend_desc = qs(0x456ba563)
		mesh = `models/CAR/Female/F_Metl_Shoe_Combat`
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
	}
	{
		desc_id = F_Metl_Shoe_Flame
		frontend_desc = qs(0x7999466d)
		mesh = `models/CAR/Female/F_Metl_Shoe_Flame`
		diff_anim = 'female_heels_high_d'
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
			`Glam	Rock`
		]
	}
	{
		desc_id = F_Metl_Shoe_FlameB
		frontend_desc = qs(0xd2bcc5a4)
		mesh = `models/CAR/Female/F_Metl_Shoe_FlameB`
		diff_anim = 'female_heels_high_d'
		materials = [
			F_Metl_Shoe_FlameB_Leather
		]
		random_weight = 0.0
		genre = [
			rock
			`Glam	Rock`
		]
	}
	{
		desc_id = F_Metl_Shoe_BuckleStrap
		frontend_desc = qs(0xf358715e)
		mesh = `models/CAR/Female/F_Metl_Shoe_BuckleStrap`
		material_groups = [
			{
				materials = [
					F_Metl_Shoe_BuckleStrap_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Metl_Shoe_BuckleStrap_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x0a919705)
			}
		]
		random_weight = 1.0
		genre = [
			`Heavy	Metal`
			`Glam	Rock`
			`Black	Metal`
		]
	}
	{
		desc_id = F_Metl_Shoe_PlatSndl
		frontend_desc = qs(0x08b6600b)
		mesh = `models/CAR/Female/F_Metl_Shoe_PlatSndl`
		material_groups = [
			{
				materials = [
					F_Metl_Shoe_PlatSndl_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Metl_Shoe_PlatSndl_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x681917f4)
			}
		]
		chosen_materials = {
			material1 = navy_1
		}
		diff_anim = 'female_heels_highplat_d'
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
	}
	{
		desc_id = F_Metl_Shoe_Mocboot
		frontend_desc = qs(0xcf2066e1)
		mesh = `models/CAR/Female/F_Metl_Shoe_Mocboot`
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
	}
	{
		desc_id = F_Clsc_Shoe_LtrSndl
		frontend_desc = qs(0xc651a219)
		mesh = `models/CAR/Female/F_Clsc_Shoe_LtrSndl`
		genre = [
			`Classic	Rock`
		]
		diff_anim = 'female_heels_high_d'
		random_weight = 0.25
	}
	{
		desc_id = F_Clsc_Shoe_WtBoot
		frontend_desc = qs(0x20c64505)
		mesh = `models/CAR/Female/F_Clsc_Shoe_WtBoot`
		materials = [
			F_Clsc_Shoe_WtBoot_Primary
		]
		diff_anim = 'female_heels_med_d'
		genre = [
			`Classic	Rock`
		]
	}
	{
		desc_id = F_Clsc_Shoe_Pvc
		frontend_desc = qs(0xf86ae6c4)
		mesh = `models/CAR/Female/F_Clsc_Shoe_Pvc`
		genre = [
			`Classic	Rock`
		]
		materials = [
			F_Clsc_Shoe_Pvc_Primary
		]
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = F_Clsc_Shoe_Mcsin
		frontend_desc = qs(0xa4730d8c)
		mesh = `models/CAR/Female/F_Clsc_Shoe_Mcsin`
		material_groups = [
			{
				materials = [
					F_Clsc_Shoe_Mcsin_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					F_Clsc_Shoe_Mcsin_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x8f4f26f2)
			}
		]
		genre = [
			`Classic	Rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Clsc_Shoe_Platboot
		frontend_desc = qs(0xdce393a1)
		mesh = `models/CAR/Female/F_Clsc_Shoe_Platboot`
		genre = [
			`Classic	Rock`
		]
		material_groups = [
			{
				materials = [
					F_Clsc_Shoe_Platboot_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x44458d9d)
			}
			{
				materials = [
					F_Clsc_Shoe_Platboot_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x947362be)
			}
		]
		diff_anim = 'female_heels_highplat_d'
	}
	{
		desc_id = F_Bmtl_Shoe_SpkBoot
		frontend_desc = qs(0x9a54fc52)
		mesh = `models/CAR/Female/F_Bmtl_Shoe_SpkBoot`
		genre = [
			`Black	Metal`
		]
		diff_anim = 'female_heels_highplat_d'
	}
	{
		desc_id = F_Bmtl_Shoes_Combatboots
		frontend_desc = qs(0xec54c044)
		mesh = `models/CAR/Female/F_Bmtl_Shoes_Combatboots`
		diff_anim = 'female_heels_med_d'
		genre = [
			`Black	Metal`
		]
	}
	{
		desc_id = F_Bmtl_Shoes_Fur
		frontend_desc = qs(0x7fd2cf3a)
		mesh = `models/CAR/Female/F_Bmtl_Shoes_Fur`
		genre = [
			`Black	Metal`
		]
		random_weight = 0.25
	}
	{
		desc_id = F_Bmtl_Shoe_ShinGrin
		frontend_desc = qs(0x77eeb987)
		mesh = `models/CAR/Female/F_Bmtl_Shoe_ShinGrin`
		genre = [
			`Black	Metal`
		]
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = F_Bmtl_Shoe_Plated
		frontend_desc = qs(0x61483148)
		mesh = `models/CAR/Female/F_Bmtl_Shoe_Plated`
		genre = [
			`Black	Metal`
		]
		diff_anim = 'female_heels_high_d'
	}
	{
		desc_id = F_Spnr_Shoes_VansH_BW
		frontend_desc = qs(0x5a5c4446)
		mesh = `models/CAR/Female/F_Spnr_Shoes_VansH_BW`
		random_weight = 0.0
		genre = [
			rock
		]
		material_groups = [
			{
				materials = [
					F_Spnr_Shoes_VansH_BW_01
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x44458d9d)
			}
			{
				materials = [
					F_Spnr_Shoes_VansH_BW_01
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x947362be)
			}
		]
	}
	{
		desc_id = F_Spnr_Shoe_VansH_Hearts
		frontend_desc = qs(0x2ee7429f)
		mesh = `models/CAR/Female/F_Spnr_Shoe_VansH_Hearts`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_list = [
			F_Spnr_Shoes_VansH_Checker
			F_Spnr_Shoe_VansH_ClrdOTW
			F_Spnr_Shoe_VansH_Star
		]
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_F_Vans04`
	}
	{
		desc_id = F_Spnr_Shoes_VansH_Checker
		frontend_desc = qs(0x5eb3bca3)
		mesh = `models/CAR/Female/F_Spnr_Shoes_VansH_Checker`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_VansH_Hearts
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_F_Vans01`
	}
	{
		desc_id = F_Spnr_Shoe_VansH_ClrdOTW
		frontend_desc = qs(0xa0c3f0e6)
		mesh = `models/CAR/Female/F_Spnr_Shoe_VansH_ClrdOTW`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_VansH_Hearts
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_F_Vans_ClrdOTW`
	}
	{
		desc_id = F_Spnr_Shoe_VansH_Star
		frontend_desc = qs(0x2b665b46)
		mesh = `models/CAR/Female/F_Spnr_Shoe_VansH_Star`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_VansH_Hearts
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_F_Vans03`
	}
	{
		desc_id = F_Spnr_Shoe_VansL_BW
		frontend_desc = qs(0xb3a91ea7)
		mesh = `models/CAR/Female/F_Spnr_Shoe_VansL_BW`
		random_weight = 0.0
		genre = [
			rock
		]
		material_groups = [
			{
				materials = [
					F_Spnr_Shoe_VansL_BW_01
				]
				shader = $cas_shader_skin_masked1
				name = qs(0x44458d9d)
			}
			{
				materials = [
					F_Spnr_Shoe_VansL_BW_01
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x947362be)
			}
		]
	}
	{
		desc_id = F_Spnr_Shoe_VansL_Hearts
		frontend_desc = qs(0xfe2dbeb8)
		mesh = `models/CAR/Female/F_Spnr_Shoe_VansL_Hearts`
		random_weight = 0.0
		genre = [
			rock
		]
		swatch_list = [
			F_Spnr_Shoe_VansL_Checker
			F_Spnr_Shoe_VansL_ClrdOTW
			F_Spnr_Shoe_VansL_Star
		]
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_F_Vans04`
	}
	{
		desc_id = F_Spnr_Shoe_VansL_Checker
		frontend_desc = qs(0xfbb06df3)
		mesh = `models/CAR/Female/F_Spnr_Shoe_VansL_Checker`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_VansL_Hearts
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_F_Vans01`
	}
	{
		desc_id = F_Spnr_Shoe_VansL_ClrdOTW
		frontend_desc = qs(0x63250fc9)
		mesh = `models/CAR/Female/F_Spnr_Shoe_VansL_ClrdOTW`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_VansL_Hearts
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_F_Vans_ClrdOTW`
	}
	{
		desc_id = F_Spnr_Shoe_VansL_Star
		frontend_desc = qs(0xf911574a)
		mesh = `models/CAR/Female/F_Spnr_Shoe_VansL_Star`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_VansL_Hearts
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_F_Vans03`
	}
	{
		desc_id = F_Spnr_Shoe_VansL_NDoubt
		frontend_desc = qs(0xf5c05b17)
		mesh = `models/CAR/Female/F_Spnr_Shoe_VansL_NDoubt`
		genre = [
			Pop
		]
		locked
	}
	{
		desc_id = F_Spnr_Shoe_DrM
		frontend_desc = qs(0x908af1bc)
		mesh = `models/CAR/Female/F_Spnr_Shoe_DrM`
		random_weight = 0.0
		genre = [
			rock
		]
		materials = [
			F_Spnr_Shoe_DrM_01
		]
	}
	{
		desc_id = F_Spnr_Shoe_DrM_Wing
		frontend_desc = qs(0x05318d03)
		mesh = `models/CAR/Female/F_Spnr_Shoe_DrM_Wing`
		random_weight = 0.0
		genre = [
			rock
		]
		swatch_list = [
			F_Spnr_Shoe_DrM_Flower
			F_Spnr_Shoe_DrM_Brown
			F_Spnr_Shoe_DrM_Green
		]
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_F_DrM_01`
	}
	{
		desc_id = F_Spnr_Shoe_DrM_Flower
		frontend_desc = qs(0x5ee57975)
		mesh = `models/CAR/Female/F_Spnr_Shoe_DrM_Flower`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_DrM_Wing
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_F_DrM_02`
	}
	{
		desc_id = F_Spnr_Shoe_DrM_Brown
		frontend_desc = qs(0x524df651)
		mesh = `models/CAR/Female/F_Spnr_Shoe_DrM_Brown`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_DrM_Wing
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_M_DrM_03`
	}
	{
		desc_id = F_Spnr_Shoe_DrM_Green
		frontend_desc = qs(0x7955a93a)
		mesh = `models/CAR/Female/F_Spnr_Shoe_DrM_Green`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_DrM_Wing
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_M_DrM_04`
	}
	{
		desc_id = F_Shoe_DrMarten_01
		frontend_desc = qs(0x8deba1ef)
		mesh = `models/CAR/Female/F_Shoe_DrMarten_01`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_list = [
			F_Shoe_DrMarten_02
			F_Shoe_DrMarten_03
			F_Shoe_DrMarten_04
		]
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_M_DrMGuitar_01`
	}
	{
		desc_id = F_Shoe_DrMarten_02
		frontend_desc = qs(0xb9884560)
		mesh = `models/CAR/Female/F_Shoe_DrMarten_02`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Shoe_DrMarten_01
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_M_DrMGuitar_02`
	}
	{
		desc_id = F_Shoe_DrMarten_03
		frontend_desc = qs(0xc2aa3728)
		mesh = `models/CAR/Female/F_Shoe_DrMarten_03`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Shoe_DrMarten_01
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_M_DrMGuitar_03`
	}
	{
		desc_id = F_Shoe_DrMarten_04
		frontend_desc = qs(0x91b1a400)
		mesh = `models/CAR/Female/F_Shoe_DrMarten_04`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Shoe_DrMarten_01
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_M_DrMGuitar_04`
	}
	{
		desc_id = F_Spnr_Shoe_ConverseCS
		frontend_desc = qs(0x2f706601)
		mesh = `models/CAR/Female/F_Spnr_Shoe_ConverseCS`
		random_weight = 1.0
		genre = [
			rock
		]
		material_groups = [
			{
				materials = [
					Spnr_Shoe_ConverseCS_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x1e67e00d)
			}
			{
				materials = [
					Spnr_Shoe_ConverseCS_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x681917f4)
			}
			{
				materials = [
					Spnr_Shoe_ConverseCS_Tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x8f4f26f2)
			}
		]
	}
	{
		desc_id = F_Spnr_Shoe_Converse07
		frontend_desc = qs(0x5020acd3)
		mesh = `models/CAR/Female/F_Spnr_Shoe_Converse07`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_list = [
			F_Spnr_Shoe_Converse08
			F_Spnr_Shoe_Converse09
			F_Spnr_Shoe_Converse10
		]
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_Converse01`
	}
	{
		desc_id = F_Spnr_Shoe_Converse08
		frontend_desc = qs(0xe055adcc)
		mesh = `models/CAR/Female/F_Spnr_Shoe_Converse08`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_Converse07
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_Converse02`
	}
	{
		desc_id = F_Spnr_Shoe_Converse09
		frontend_desc = qs(0xee7dbc68)
		mesh = `models/CAR/Female/F_Spnr_Shoe_Converse09`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_Converse07
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_Converse03`
	}
	{
		desc_id = F_Spnr_Shoe_Converse10
		frontend_desc = qs(0x0c26ffcb)
		mesh = `models/CAR/Female/F_Spnr_Shoe_Converse10`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = F_Spnr_Shoe_Converse07
		swatch_texture = `tex/models/Characters/Car/Sponsor/Swach_Converse06`
	}
]
