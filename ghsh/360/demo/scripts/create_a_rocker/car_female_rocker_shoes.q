cas_female_shoes = [
	{
		desc_id = f_pop_shoe_platforms
		frontend_desc = qs(0x13038d3b)
		mesh = 'models/CAR/Female/F_Pop_Shoe_Platforms.skin'
		diff_anim = 'female_heels_highplat_d'
		materials = [
			f_pop_shoe_platforms_primary
		]
		genre = [
			pop
		]
		random_weight = 0.0
	}
	{
		desc_id = f_punk_shoe_army
		frontend_desc = qs(0x32f046fc)
		mesh = 'models/CAR/Female/F_Punk_Shoe_Army.skin'
		materials = [
			f_punk_shoe_army_primary
			f_punk_shoe_army_secondary
		]
		chosen_materials = {
			material1 = red_1
			material2 = grey_4
		}
		diff_anim = 'female_heels_med_d'
		genre = [
			punk
		]
	}
	{
		desc_id = f_glam_shoes_velvetbaggyboots
		frontend_desc = qs(0x76585e26)
		mesh = 'models/CAR/Female/F_Glam_Shoes_VelvetBaggyBoots.skin'
		diff_anim = 'female_heels_high_d'
		genre = [
			`glam rock`
		]
		materials = [
			f_glam_shoes_velvetbaggyboots_primary
			f_glam_shoes_velvetbaggyboots_secondary
		]
		chosen_materials = {
			material1 = grey_1
		}
		price = 150
		random_weight = 0.0
	}
	{
		desc_id = f_goth_shoes_maryjanes
		frontend_desc = qs(0xaa08c478)
		mesh = 'models/CAR/Female/F_Goth_Shoes_Maryjanes.skin'
		material_groups = [
			{
				materials = [
					f_goth_shoes_maryjanes_shoe
					f_goth_shoes_maryjanes_sole
				]
			}
		]
		diff_anim = 'female_heels_highplat_d'
		genre = [
			goth
		]
	}
]
