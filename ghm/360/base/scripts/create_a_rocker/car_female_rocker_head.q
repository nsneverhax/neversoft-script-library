cas_female_hair_random_colors = [
	{
		Color = carblack_1
		random_weight = 1.0
	}
	{
		Color = yellow_4
		random_weight = 1.0
		genre = [
			punk
			`heavy	metal`
			`glam	rock`
			pop
			rock
			`classic	rock`
			`black	metal`
		]
	}
	{
		Color = yellow_2
		random_weight = 1.0
		genre = [
			punk
			`heavy	metal`
			`glam	rock`
			pop
			rock
			`classic	rock`
		]
	}
	{
		Color = red_2
		random_weight = 1.0
		genre = [
			punk
			goth
			rock
		]
	}
	{
		Color = brown_4
		random_weight = 1.0
		genre = [
			punk
			`heavy	metal`
			`glam	rock`
			pop
			rock
			`classic	rock`
		]
	}
	{
		Color = brown_3
		random_weight = 1.0
		genre = [
			punk
			`heavy	metal`
			`glam	rock`
			pop
			rock
			`classic	rock`
		]
	}
	{
		Color = brown_2
		random_weight = 1.0
		genre = [
			punk
			`heavy	metal`
			`glam	rock`
			pop
			rock
			`classic	rock`
		]
	}
	{
		Color = grey_5
		random_weight = 0.5
		genre = [
			`black	metal`
		]
	}
	{
		Color = pink_3
		random_weight = 0.5
		genre = [
			punk
			goth
			pop
		]
	}
]
cas_female_hair_common_settings = {
	modify_all_materials
	shader = $cas_shader_hair
	random_colors = $cas_female_hair_random_colors
}
cas_female_hair_common_settings_skinshader = {
	modify_all_materials
	shader = $cas_shader_skin
	random_colors = $cas_female_hair_random_colors
}
cas_female_hair = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 0.0
	}
	{
		desc_id = f_bmtl_hair_overeyes
		frontend_desc = qs(0x511858ef)
		mesh = 'models/CAR/Female/F_Bmtl_Hair_OverEyes.skin'
		deform_mesh = 'models/CAR/Female/F_Bmtl_Hair_OverEyes_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_bmtl_hathair_overeyes
		materials = [
			f_bmtl_hair_overeyes_primary
		]
		acc_skeleton = skel_f_bmtl_hair_overeyes
		acc_ragdoll = rag_f_bmtl_hair_overeyes
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = f_bmtl_hair_straight
		frontend_desc = qs(0x180c8fed)
		mesh = 'models/CAR/Female/F_Bmtl_Hair_Straight.skin'
		deform_mesh = 'models/CAR/Female/F_Bmtl_Hair_Straight_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_bmtl_hathair_straight
		materials = [
			f_bmtl_hair_straight_primary
		]
		acc_skeleton = skel_f_bmtl_hair_overeyes
		acc_ragdoll = rag_f_bmtl_hair_overeyes
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`black	metal`
			`heavy	metal`
		]
	}
	{
		desc_id = f_clsc_hair_blfro
		frontend_desc = qs(0x2c4c28bf)
		mesh = 'models/CAR/Female/F_Clsc_Hair_BlFro.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_Hair_BlFro_def.skin'
		$cas_female_hair_common_settings_skinshader
		hat_hair = f_clsc_hathair_blfro
		acc_skeleton = skel_f_clsc_hair_blfro
		acc_ragdoll = rag_f_clsc_hair_blfro
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`classic	rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = f_clsc_hair_farah
		frontend_desc = qs(0x728be496)
		mesh = 'models/CAR/Female/F_Clsc_Hair_Farah.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_Hair_Farah_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_clsc_hathair_farah
		acc_skeleton = skel_f_clsc_hair_farah
		acc_ragdoll = rag_f_clsc_hair_farah
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`classic	rock`
		]
	}
	{
		desc_id = f_clsc_hair_joplin
		frontend_desc = qs(0xcf1a9760)
		mesh = 'models/CAR/Female/F_Clsc_Hair_Joplin.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_Hair_Joplin_def.skin'
		$cas_female_hair_common_settings
		chosen_materials = {
			material1 = yellow_orange_1
		}
		hat_hair = f_clsc_hathair_joplin
		acc_skeleton = skel_f_clsc_hair_joplin
		acc_ragdoll = rag_f_clsc_hair_joplin
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`classic	rock`
		]
	}
	{
		desc_id = f_clsc_hair_sblack
		frontend_desc = qs(0x243da8c4)
		mesh = 'models/CAR/Female/F_Clsc_Hair_SBlack.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_Hair_SBlack_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_clsc_hathair_sblack
		acc_skeleton = skel_f_clsc_hair_sblack
		acc_ragdoll = rag_f_clsc_hair_sblack
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`classic	rock`
			pop
			rock
		]
	}
	{
		desc_id = f_glam_hair_bighair
		frontend_desc = qs(0xefb77695)
		mesh = 'models/CAR/Female/F_Glam_Hair_BigHair.skin'
		deform_mesh = 'models/CAR/Female/F_Glam_Hair_BigHair_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_glam_hathair_bighair
		acc_skeleton = skel_f_glam_hair_bighair
		acc_ragdoll = rag_f_glam_hair_bighair
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`glam	rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = f_glam_hair_palmtree
		frontend_desc = qs(0x55f7ebc8)
		mesh = 'models/CAR/Female/F_Glam_Hair_PalmTree.skin'
		deform_mesh = 'models/CAR/Female/F_Glam_Hair_PalmTree_def.skin'
		chosen_materials = {
			material1 = yellow_1
		}
		$cas_female_hair_common_settings
		hat_hair = f_glam_hathair_palmtree
		acc_skeleton = skel_f_glam_hair_palmtree
		acc_ragdoll = rag_f_glam_hair_palmtree
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`glam	rock`
		]
	}
	{
		desc_id = f_glam_hair_seagull
		frontend_desc = qs(0xa41beba1)
		mesh = 'models/CAR/Female/F_Glam_Hair_Seagull.skin'
		deform_mesh = 'models/CAR/Female/F_Glam_Hair_Seagull_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_glam_hathair_seagull
		acc_skeleton = skel_f_glam_hair_seagull
		acc_ragdoll = rag_f_glam_hair_seagull
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`glam	rock`
		]
	}
	{
		desc_id = f_goth_hair_bangslong
		frontend_desc = qs(0x9e84e518)
		mesh = 'models/CAR/Female/F_GOTH_Hair_BangsLong.skin'
		deform_mesh = 'models/CAR/Female/F_Goth_Hair_BangsLong_Def.skin'
		$cas_female_hair_common_settings
		materials = [
			f_goth_hair01_primary
			f_goth_hair01_secondary
		]
		hat_hair = f_goth_hathair_bangslong
		acc_skeleton = skel_f_goth_hair_bangslong
		acc_ragdoll = rag_f_goth_hair_bangslong
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_hair_dreads
		frontend_desc = qs(0xf8c444f0)
		mesh = 'models/CAR/Female/F_Goth_Hair_Dreads.skin'
		deform_mesh = 'models/CAR/Female/F_Goth_Hair_Dreads_def.skin'
		$cas_female_hair_common_settings_skinshader
		chosen_materials = {
			material1 = yellow_1
		}
		hat_hair = f_goth_hathair_dreads
		acc_skeleton = skel_f_goth_hair_dreads
		acc_ragdoll = rag_f_goth_hair_dreads
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_goth_hair_updo
		frontend_desc = qs(0x0fcbbbe1)
		mesh = 'models/CAR/Female/F_Goth_Hair_UpDo.skin'
		deform_mesh = 'models/CAR/Female/F_Goth_Hair_UpDo_Def.skin'
		material_groups = [
			{
				materials = [
					f_goth_hair_updo_hair
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					f_goth_hair_updo_vale
				]
				shader = $cas_shader_skin
			}
		]
		hat_hair = f_goth_hathair_updo
		acc_skeleton = skel_f_goth_hair_updo
		acc_ragdoll = rag_f_goth_hair_updo
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			goth
		]
	}
	{
		desc_id = f_metl_hair_midstrt
		frontend_desc = qs(0xd59055e8)
		mesh = 'models/CAR/Female/F_Metl_Hair_MidStrt.skin'
		deform_mesh = 'models/CAR/Female/F_Metl_Hair_MidStrt_def.skin'
		$cas_female_hair_common_settings
		chosen_materials = {
			material1 = yellow_orange_3
		}
		hat_hair = f_metl_hathair_midstrt
		acc_skeleton = skel_f_metl_hair_midstrt
		acc_ragdoll = rag_f_metl_hair_midstrt
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_metl_hair_twisty
		frontend_desc = qs(0xf3633235)
		mesh = 'models/CAR/Female/F_Metl_Hair_Twisty.skin'
		materials = [
			f_metl_hair_twisty_primary
			f_metl_hair_twisty_secondary
		]
		chosen_materials = {
			material1 = blue_1
			material2 = grey_2
		}
		$cas_female_hair_common_settings
		hat_hair = f_metl_hathair_twisty
		acc_skeleton = skel_f_metl_hair_twisty
		acc_ragdoll = rag_f_metl_hair_twisty
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_metl_hair_pony
		frontend_desc = qs(0xb84644d2)
		mesh = 'models/CAR/Female/F_Metl_Hair_Pony.skin'
		deform_mesh = 'models/CAR/Female/F_Metl_Hair_Pony_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_metl_hathair_pony
		materials = [
			f_metl_hair_ponytail_primary
			f_metl_hair_ponytail_secondary
		]
		acc_skeleton = skel_f_metl_hair_pony
		acc_ragdoll = rag_f_metl_hair_pony
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_metl_hair_skunk
		frontend_desc = qs(0xcf6e0971)
		mesh = 'models/CAR/Female/F_Metl_Hair_Skunk.skin'
		deform_mesh = 'models/CAR/Female/F_Metl_Hair_Skunk_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_metl_hathair_skunk
		materials = [
			f_metl_hair_skunk_primary
			f_metl_hair_skunk_secondary
		]
		acc_skeleton = skel_f_metl_hair_skunk
		acc_ragdoll = rag_f_metl_hair_skunk
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_mtl_hair_shortblack
		frontend_desc = qs(0xecd515ee)
		mesh = 'models/CAR/Female/F_Mtl_Hair_ShortBlack.skin'
		deform_mesh = 'models/CAR/Female/F_Mtl_Hair_ShortBlack_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_mtl_hathair_shortblack
		materials = [
			f_mtl_hair_shortblack_primary
		]
		chosen_materials = {
			material1 = yellow_2
		}
		acc_skeleton = skel_f_mtl_hair_shortblack
		acc_ragdoll = rag_f_mtl_hair_shortblack
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_metl_hair_chainmail
		frontend_desc = qs(0x413d491c)
		mesh = 'models/CAR/Female/F_Metl_Hair_chainmail.skin'
		deform_mesh = 'models/CAR/Female/F_Metl_Hair_chainmail_def.skin'
		materials = [
			f_mtlca_headdress_hair
		]
		$cas_female_hair_common_settings
		hat_hair = f_metl_hathair_chainmail
		acc_skeleton = skel_f_metl_hair_chainmail
		acc_ragdoll = rag_f_metl_hair_chainmail
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_07
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_pop_hair_fergie
		frontend_desc = qs(0xfbb46fb6)
		mesh = 'models/CAR/Female/F_Pop_Hair_Fergie.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_Hair_Fergie_Def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_pop_hathair_fergie
		acc_skeleton = skel_f_pop_hair_fergie
		acc_ragdoll = rag_f_pop_hair_fergie
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			pop
		]
	}
	{
		desc_id = f_pop_hair_midori
		frontend_desc = qs(0x4c47fb49)
		mesh = 'models/CAR/Female/F_Pop_Hair_Midori.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_Hair_Midori_Def.skin'
		material_groups = [
			{
				materials = [
					pop_midorihair_primary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					pop_midorihair_secondary
				]
				shader = $cas_shader_skin
			}
		]
		hat_hair = f_pop_hathair_midori
		acc_skeleton = skel_f_pop_hair_midori
		acc_ragdoll = rag_f_pop_hair_midori
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			pop
		]
		random_weight = 0.0
	}
	{
		desc_id = f_pop_hair_hayley
		frontend_desc = qs(0x0b249708)
		mesh = 'models/CAR/Female/F_Pop_Hair_Hayley.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_Hair_Hayley_Def.skin'
		materials = [
			f_pop_hair_hayley_primary
		]
		$cas_female_hair_common_settings
		hat_hair = f_pop_hathair_hayley
		acc_skeleton = skel_f_pop_hair_hayley
		acc_ragdoll = rag_f_pop_hair_hayley
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			pop
			rock
		]
	}
	{
		desc_id = f_punk_hair_downhawk
		frontend_desc = qs(0x5febcb62)
		mesh = 'models/CAR/Female/F_Punk_Hair_Downhawk.skin'
		deform_mesh = 'models/CAR/Female/F_Punk_Hair_Downhawk_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_punk_hathair_downhawk
		acc_skeleton = skel_f_punk_hair_downhawk
		acc_ragdoll = rag_f_punk_hair_downhawk
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_hair_hawk
		frontend_desc = qs(0x29146d81)
		mesh = 'models/CAR/Female/F_Punk_Hair_Hawk.skin'
		deform_mesh = 'models/CAR/Female/F_Punk_Hair_Hawk_def.skin'
		$cas_female_hair_common_settings
		hat_hair = None
		acc_skeleton = skel_f_punk_hair_hawk
		acc_ragdoll = rag_f_punk_hair_hawk
		acc_bones = [
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_hair_judynails1
		frontend_desc = qs(0xdc357545)
		mesh = 'models/CAR/Female/F_Punk_Hair_JudyNails1.skin'
		deform_mesh = 'models/CAR/Female/F_Punk_Hair_JudyNails1_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_punk_hathair_judynails1
		acc_skeleton = skel_f_punk_hair_judynails1
		acc_ragdoll = rag_f_punk_hair_judynails1
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		materials = [
			f_punk_hair_judynails1_primary
			f_punk_hair_judynails1_secondary
		]
		chosen_materials = {
			material1 = red_1
			material2 = carblack_1
		}
		genre = [
			punk
		]
	}
	{
		desc_id = f_punk_hair_ponytail
		frontend_desc = qs(0x9f43a382)
		mesh = 'models/CAR/Female/F_Punk_Hair_Ponytail.skin'
		deform_mesh = 'models/CAR/Female/F_Punk_Hair_Ponytail_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_punk_hathair_ponytail
		acc_skeleton = skel_f_punk_hair_ponytail
		acc_ragdoll = rag_f_punk_hair_ponytail
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			punk
		]
	}
	{
		desc_id = f_rock_hair_emo
		frontend_desc = qs(0xaeec633a)
		mesh = 'models/CAR/Female/F_Rock_Hair_Emo.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_Hair_Emo_def.skin'
		$cas_female_hair_common_settings
		materials = [
			f_rock_hair_emo_primary
			f_rock_hair_emo_secondary
		]
		hat_hair = f_rock_hathair_emo
		acc_skeleton = skel_f_rock_hair_emo
		acc_ragdoll = rag_f_rock_hair_emo
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_hair_short
		frontend_desc = qs(0x99c10acb)
		mesh = 'models/CAR/Female/F_Rock_Hair_Short.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_Hair_Short_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_rock_hathair_short
		acc_skeleton = skel_f_rock_head_hair_short
		acc_ragdoll = rag_f_rock_head_hair_short
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_hair_wavy
		frontend_desc = qs(0x66b782c7)
		mesh = 'models/CAR/Female/F_Rock_Hair_Wavy.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_Hair_Wavy_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_rock_hathair_wavy
		acc_skeleton = skel_f_rock_hair_wavy
		acc_ragdoll = rag_f_rock_hair_wavy
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			rock
		]
	}
	{
		desc_id = f_rock_hair_bass
		frontend_desc = qs(0x090d3c06)
		mesh = 'models/CAR/Female/F_Rock_Hair_Bass.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_Hair_Bass_def.skin'
		$cas_female_hair_common_settings
		hat_hair = f_rock_hathair_bass
		chosen_materials = {
			material1 = yellow_orange_1
		}
		acc_skeleton = skel_f_rock_hair_bass
		acc_ragdoll = rag_f_rock_hair_bass
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			rock
			pop
		]
	}
	{
		desc_id = f_rock_hair_bang
		frontend_desc = qs(0x6088ad0c)
		mesh = 'models/CAR/Female/F_Rock_Hair_Bang.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_Hair_Bang_def.skin'
		$cas_female_hair_common_settings
		materials = [
			f_rock_hair_bang_primary
		]
		hat_hair = f_rock_hathair_bang
		acc_skeleton = skel_f_rock_hair_bang
		acc_ragdoll = rag_f_rock_hair_bang
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		genre = [
			rock
			pop
		]
	}
]
cas_female_hat_hair_common_settings = {
	modify_all_materials
	shader = $cas_shader_hair
}
cas_female_hat_hair_common_settings_skinshader = {
	modify_all_materials
	shader = $cas_shader_skin
}
cas_female_hat_hair = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
	}
	{
		desc_id = f_bmtl_hathair_overeyes
		mesh = 'models/CAR/Female/F_Bmtl_HatHair_OverEyes.skin'
		deform_mesh = 'models/CAR/Female/F_Bmtl_HatHair_OverEyes_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_bmtl_hair_overeyes
		acc_ragdoll = rag_f_bmtl_hair_overeyes
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_bmtl_hathair_straight
		mesh = 'models/CAR/Female/F_Bmtl_HatHair_Straight.skin'
		deform_mesh = 'models/CAR/Female/F_Bmtl_HatHair_Straight_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_bmtl_hair_overeyes
		acc_ragdoll = rag_f_bmtl_hair_overeyes
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_clsc_hathair_blfro
		mesh = 'models/CAR/Female/F_Clsc_HatHair_BlFro.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_HatHair_BlFro_def.skin'
		$cas_female_hair_common_settings_skinshader
		acc_skeleton = skel_f_clsc_hair_blfro
		acc_ragdoll = rag_f_clsc_hair_blfro
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_clsc_hathair_farah
		mesh = 'models/CAR/Female/F_Clsc_HatHair_Farah.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_HatHair_Farah_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_clsc_hair_farah
		acc_ragdoll = rag_f_clsc_hair_farah
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_clsc_hathair_joplin
		mesh = 'models/CAR/Female/F_Clsc_HatHair_Joplin.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_HatHair_Joplin_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_clsc_hair_joplin
		acc_ragdoll = rag_f_clsc_hair_joplin
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_clsc_hathair_sblack
		mesh = 'models/CAR/Female/F_Clsc_HatHair_SBlack.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_HatHair_SBlack_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_clsc_hair_sblack
		acc_ragdoll = rag_f_clsc_hair_sblack
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_glam_hathair_bighair
		mesh = 'models/CAR/Female/F_Glam_HatHair_BigHair.skin'
		deform_mesh = 'models/CAR/Female/F_Glam_HatHair_BigHair_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_glam_hair_bighair
		acc_ragdoll = rag_f_glam_hair_bighair
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_glam_hathair_palmtree
		mesh = 'models/CAR/Female/F_Glam_HatHair_PalmTree.skin'
		deform_mesh = 'models/CAR/Female/F_Glam_HatHair_PalmTree_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_glam_hair_palmtree
		acc_ragdoll = rag_f_glam_hair_palmtree
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_glam_hathair_seagull
		mesh = 'models/CAR/Female/F_Glam_HatHair_Seagull.skin'
		deform_mesh = 'models/CAR/Female/F_Glam_HatHair_Seagull_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_glam_hair_seagull
		acc_ragdoll = rag_f_glam_hair_seagull
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_goth_hathair_bangslong
		mesh = 'models/CAR/Female/F_Goth_HatHair_BangsLong.skin'
		deform_mesh = 'models/CAR/Female/F_Goth_HatHair_BangsLong_def.skin'
		materials = [
			f_goth_hair01_primary
			f_goth_hair01_secondary
		]
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_goth_hair_bangslong
		acc_ragdoll = rag_f_goth_hair_bangslong
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_goth_hathair_dreads
		mesh = 'models/CAR/Female/F_Goth_HatHair_Dreads.skin'
		deform_mesh = 'models/CAR/Female/F_Goth_HatHair_Dreads_def.skin'
		$cas_female_hat_hair_common_settings_skinshader
		acc_skeleton = skel_f_goth_hair_dreads
		acc_ragdoll = rag_f_goth_hair_dreads
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_goth_hathair_updo
		mesh = 'models/CAR/Female/F_Goth_HatHair_UpDo.skin'
		deform_mesh = 'models/CAR/Female/F_Goth_HatHair_UpDo_def.skin'
		material_groups = [
			{
				materials = [
					f_goth_hair_updo_hair
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					f_goth_hair_updo_vale
				]
				shader = $cas_shader_skin
			}
		]
		acc_skeleton = skel_f_goth_hair_updo
		acc_ragdoll = rag_f_goth_hair_updo
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_metl_hathair_twisty
		mesh = 'models/CAR/Female/F_Metl_HatHair_Twisty.skin'
		materials = [
			f_metl_hair_twisty_primary
			f_metl_hair_twisty_secondary
		]
		chosen_materials = {
			material1 = blue_1
			material2 = grey_2
		}
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_metl_hair_twisty
		acc_ragdoll = rag_f_metl_hair_twisty
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_metl_hathair_midstrt
		mesh = 'models/CAR/Female/F_Metl_HatHair_MidStrt.skin'
		deform_mesh = 'models/CAR/Female/F_Metl_HatHair_MidStrt_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_metl_hair_midstrt
		acc_ragdoll = rag_f_metl_hair_midstrt
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_metl_hathair_pony
		materials = [
			f_metl_hair_ponytail_primary
			f_metl_hair_ponytail_secondary
		]
		mesh = 'models/CAR/Female/F_Metl_HatHair_Pony.skin'
		deform_mesh = 'models/CAR/Female/F_Metl_HatHair_Pony_def.skin'
		materials = [
			f_metl_hair_ponytail_primary
			f_metl_hair_ponytail_secondary
		]
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_metl_hair_pony
		acc_ragdoll = rag_f_metl_hair_pony
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
		]
	}
	{
		desc_id = f_metl_hathair_skunk
		mesh = 'models/CAR/Female/F_Metl_HatHair_Skunk.skin'
		deform_mesh = 'models/CAR/Female/F_Metl_HatHair_Skunk_def.skin'
		materials = [
			f_metl_hair_skunk_primary
			f_metl_hair_skunk_secondary
		]
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_metl_hair_skunk
		acc_ragdoll = rag_f_metl_hair_skunk
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
		]
	}
	{
		desc_id = f_mtl_hathair_shortblack
		mesh = 'models/CAR/Female/F_Mtl_HatHair_ShortBlack.skin'
		materials = [
			f_mtl_hair_shortblack_primary
		]
		deform_mesh = 'models/CAR/Female/F_Mtl_HatHair_ShortBlack_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_mtl_hair_shortblack
		acc_ragdoll = rag_f_mtl_hair_shortblack
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_metl_hathair_chainmail
		mesh = 'models/CAR/Female/F_Metl_HatHair_Chainmail.skin'
		materials = [
			f_mtlca_headdress_hair
		]
		deform_mesh = 'models/CAR/Female/F_Metl_HatHair_Chainmail_def.skin'
		$cas_female_hair_common_settings
		acc_skeleton = skel_f_metl_hair_chainmail
		acc_ragdoll = rag_f_metl_hair_chainmail
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_07
		]
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = f_pop_hathair_hayley
		mesh = 'models/CAR/Female/F_Pop_HatHair_Hayley.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_HatHair_Hayley_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_pop_hair_hayley
		acc_ragdoll = rag_f_pop_hair_hayley
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_pop_hathair_fergie
		mesh = 'models/CAR/Female/F_Pop_HatHair_Fergie.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_HatHair_Fergie_Def.skin'
		$cas_female_hair_common_settings
		acc_skeleton = skel_f_pop_hair_fergie
		acc_ragdoll = rag_f_pop_hair_fergie
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_pop_hathair_midori
		mesh = 'models/CAR/Female/F_Pop_HatHair_Midori.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_HatHair_Midori_Def.skin'
		material_groups = [
			{
				materials = [
					pop_midorihair_primary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					pop_midorihair_secondary
				]
				shader = $cas_shader_skin
			}
		]
		acc_skeleton = skel_f_pop_hair_midori
		acc_ragdoll = rag_f_pop_hair_midori
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_punk_hathair_downhawk
		mesh = 'models/CAR/Female/F_Punk_HatHair_Downhawk.skin'
		deform_mesh = 'models/CAR/Female/F_Punk_HatHair_Downhawk_def.skin'
		$cas_female_hair_common_settings
		acc_skeleton = skel_f_punk_hair_downhawk
		acc_ragdoll = rag_f_punk_hair_downhawk
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
		]
	}
	{
		desc_id = f_punk_hathair_judynails1
		mesh = 'models/CAR/Female/F_Punk_HatHair_JudyNails1.skin'
		deform_mesh = 'models/CAR/Female/F_Punk_HatHair_JudyNails1_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_punk_hair_judynails1
		acc_ragdoll = rag_f_punk_hair_judynails1
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
		materials = [
			f_punk_hair_judynails1_primary
			f_punk_hair_judynails1_secondary
		]
	}
	{
		desc_id = f_punk_hathair_ponytail
		mesh = 'models/CAR/Female/F_Punk_HatHair_Ponytail.skin'
		deform_mesh = 'models/CAR/Female/F_Punk_HatHair_Ponytail_def.skin'
		$cas_female_hair_common_settings
		acc_skeleton = skel_f_punk_hair_ponytail
		acc_ragdoll = rag_f_punk_hair_ponytail
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_rock_hathair_emo
		mesh = 'models/CAR/Female/F_Rock_HatHair_Emo.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_HatHair_Emo_def.skin'
		$cas_female_hair_common_settings
		materials = [
			f_rock_hair_emo_primary
			f_rock_hair_emo_secondary
		]
		acc_skeleton = skel_f_rock_hair_emo
		acc_ragdoll = rag_f_rock_hair_emo
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_rock_hathair_short
		mesh = 'models/CAR/Female/F_Rock_HatHair_Short.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_HatHair_Short_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_rock_head_hair_short
		acc_ragdoll = rag_f_rock_head_hair_short
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
		]
	}
	{
		desc_id = f_rock_hathair_wavy
		mesh = 'models/CAR/Female/F_Rock_HatHair_Wavy.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_HatHair_Wavy_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_rock_hair_wavy
		acc_ragdoll = rag_f_rock_hair_wavy
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_rock_hathair_bass
		mesh = 'models/CAR/Female/F_Rock_HatHair_Bass.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_HatHair_Bass_def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_rock_hair_bass
		acc_ragdoll = rag_f_rock_hair_bass
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
	{
		desc_id = f_rock_hathair_bang
		mesh = 'models/CAR/Female/F_Rock_HatHair_Bang.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_HatHair_Bang_Def.skin'
		$cas_female_hat_hair_common_settings
		acc_skeleton = skel_f_rock_hair_bang
		acc_ragdoll = rag_f_rock_hair_bang
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
			bone_acc_head_04
			bone_acc_head_05
			bone_acc_head_06
			bone_acc_head_07
			bone_acc_head_08
			bone_acc_head_09
		]
	}
]
cas_female_hat = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
	{
		desc_id = f_bmtl_hat_skullhelmet
		frontend_desc = qs(0x43aac8dc)
		mesh = 'models/CAR/Female/F_Bmtl_Hat_SkullHelmet.skin'
		deform_mesh = 'models/CAR/Female/F_Bmtl_Hat_SkullHelmet_def.skin'
		materials = [
			f_bmtl_hat_skullhelmet_primary
			f_bmtl_hat_skullhelmet_secondary
		]
		hat_hair = None
		genre = [
			`black	metal`
		]
		price = 6066
		polaroid = p_m_bmtl_hat_skullhelmet
		random_weight = 0.05
	}
	{
		desc_id = f_metl_head_hatstuds01
		frontend_desc = qs(0x3e943475)
		mesh = 'models/CAR/Female/F_Metl_Head_HatStuds01.skin'
		deform_mesh = 'models/CAR/Female/F_Metl_Head_HatStuds01_def.skin'
		genre = [
			`black	metal`
		]
		price = 150
		random_weight = 0.025
		polaroid = p_f_metl_head_hatstuds01
	}
	{
		desc_id = f_pop_hat_bucket
		frontend_desc = qs(0xff1d662e)
		mesh = 'models/CAR/Female/F_Pop_Hat_Bucket.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_Hat_Bucket_def.skin'
		materials = [
			m_pop_hat_bucket_primary
			m_pop_hat_bucket_secondary
		]
		genre = [
			pop
		]
		price = 75
		random_weight = 0.05
	}
	{
		desc_id = f_pop_head_ww2helm
		frontend_desc = qs(0x3f2a64bc)
		mesh = 'models/CAR/Female/F_Pop_Head_WW2Helm.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_Head_WW2Helm_def.skin'
		genre = [
			punk
			`heavy	metal`
			goth
		]
		price = 400
		random_weight = 0.025
		polaroid = p_m_pop_hat_ww2helm
	}
	{
		desc_id = f_pop_head_woolhat
		frontend_desc = qs(0xdb412f13)
		mesh = 'models/CAR/Female/F_Pop_Head_WoolHat.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_Head_WoolHat_def.skin'
		materials = [
			f_pop_woolhat_woolhat
		]
		genre = [
			pop
		]
		price = 75
		random_weight = 0.025
	}
	{
		desc_id = f_pop_acc_catears
		frontend_desc = qs(0x7c85e886)
		mesh = 'models/CAR/Female/F_Pop_Acc_Catears.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_Acc_Catears_def.skin'
		materials = [
			f_pop_acc_catears_primary
			f_pop_acc_catears_secondary
		]
		hat_hair = original_hair
		genre = [
			pop
		]
		price = 3000
		polaroid = p_f_pop_acc_catears
		random_weight = 0.0
	}
	{
		desc_id = f_rock_hat_cowboy
		frontend_desc = qs(0xe803c83b)
		mesh = 'models/CAR/Female/F_Rock_Hat_Cowboy.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_Hat_Cowboy_def.skin'
		materials = [
			f_rock_hat_cowboy_primary
			f_rock_hat_cowboy_secondary
		]
		genre = [
			rock
		]
		price = 100
		random_weight = 0.025
		polaroid = p_f_rock_hat_cowboy
	}
	{
		desc_id = f_rock_hat_starpin
		frontend_desc = qs(0x627fba5a)
		mesh = 'models/CAR/Female/F_Rock_Hat_Starpin.skin'
		deform_mesh = 'models/CAR/Female/F_Rock_Hat_Starpin_def.skin'
		materials = [
			f_rock_hat_starpin_primary
		]
		genre = [
			rock
		]
		price = 150
		random_weight = 0.025
		polaroid = p_f_rock_hat_starpin
	}
	{
		desc_id = f_clsc_hat_cptn
		frontend_desc = qs(0x815966f6)
		mesh = 'models/CAR/Female/F_Clsc_Hat_Cptn.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_Hat_Cptn_def.skin'
		materials = [
			m_clsc_hat_cptn_primary
		]
		genre = [
			`classic	rock`
		]
		price = 300
		random_weight = 0.0
		polaroid = p_f_clsc_hat_cptn
	}
	{
		desc_id = f_clsc_hat_cowboy
		frontend_desc = qs(0xe7e12c49)
		mesh = 'models/CAR/Female/F_Clsc_Hat_Cowboy.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_Hat_Cowboy_def.skin'
		genre = [
			`classic	rock`
		]
		price = 150
		random_weight = 0.025
	}
	{
		desc_id = f_clsc_hat_triangle
		frontend_desc = qs(0xd0fa14a6)
		mesh = 'models/CAR/Female/F_Clsc_Hat_Triangle.skin'
		deform_mesh = 'models/CAR/Female/F_Clsc_Hat_Triangle_def.skin'
		materials = [
			f_clsc_hat_triangle_primary
			f_clsc_hat_triangle_secondary
			f_clsc_hat_triangle_third
		]
		genre = [
			`classic	rock`
		]
		price = 500
		random_weight = 0.025
		polaroid = p_m_clsc_hat_triangle
	}
	{
		desc_id = f_goth_hat_tophat
		frontend_desc = qs(0xd9f3b456)
		mesh = 'models/CAR/Female/F_Goth_Hat_TopHat.skin'
		deform_mesh = 'models/CAR/Female/F_Goth_Hat_TopHat_def.skin'
		genre = [
			goth
		]
		price = 500
		polaroid = p_m_goth_hat_tophat
		random_weight = 0.025
	}
	{
		desc_id = f_pop_head_gasmask
		frontend_desc = qs(0x0039dd19)
		mesh = 'models/CAR/Female/F_Pop_Head_GasMask.skin'
		deform_mesh = 'models/CAR/Female/F_Pop_Head_GasMask_def.skin'
		materials = [
			m_pop_head_gasmask_mask
		]
		hat_hair = None
		price = 5000
		polaroid = p_f_pop_head_gasmask
		random_weight = 0.0
	}
	{
		desc_id = f_bmtl_head_viking
		frontend_desc = qs(0xbbf00af8)
		mesh = 'models/CAR/Female/F_Bmtl_Hat_Viking.skin'
		deform_mesh = 'models/CAR/Female/F_Bmtl_Hat_Viking_def.skin'
		genre = [
			`black	metal`
		]
		hat_hair = None
		price = 25000
		random_weight = 0.0
		polaroid = p_f_bmtl_hat_viking
	}
	{
		desc_id = f_fun_hat_eyeball
		frontend_desc = qs(0x3b86ba16)
		mesh = 'models/CAR/Female/F_Fun_Hat_EyeBall.skin'
		deform_mesh = 'models/CAR/Female/F_Fun_Hat_EyeBall_def.skin'
		genre = [
			goth
		]
		hat_hair = None
		polaroid = p_f_fun_hat_eyeball
		price = 15000
		random_weight = 0.0
	}
	{
		desc_id = f_bmtl_hat_chicken
		frontend_desc = qs(0xfcd7829c)
		mesh = 'models/CAR/Female/F_Bmtl_Hat_Chicken.skin'
		materials = [
			f_bmtl_hat_chicken_primary
			f_bmtl_hat_chicken_secondary
		]
		genre = [
			`black	metal`
		]
		hat_hair = None
		price = 50000
		polaroid = p_f_bmtl_hat_chicken
		random_weight = 0.0
	}
	{
		desc_id = f_metl_acc_horn
		frontend_desc = qs(0x4368b0cb)
		mesh = 'models/CAR/Female/F_Metl_Acc_Horn.skin'
		deform_mesh = 'models/CAR/Female/F_Metl_Acc_Horn_def.skin'
		materials = [
			f_metl_acc_horn_primary
		]
		genre = [
			`heavy	metal`
		]
		hat_hair = original_hair
		price = 667
		random_weight = 0.0
		polaroid = p_f_metl_acc_horn
	}
]
cas_female_facial_hair = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
	}
]
cas_female_age = [
	{
		desc_id = car_female_teen
		frontend_desc = qs(0xe40e025b)
	}
	{
		desc_id = car_female_mature
		random_weight = 0.0
		replace = 'tex/models/Characters/car/female/car_female_head_n.dds'
		with = 'tex/models/Characters/Layers/CAR/Female/Age/CAR_Female_Age03_N.dds'
		replace2 = 'tex/models/Characters/car/female/car_female_head_d.dds'
		with2 = 'tex/models/Characters/Layers/CAR/Female/Age/CAR_Female_Age03_D.dds'
		frontend_desc = qs(0xbe8a142d)
		in = cas_body
		in2 = cas_body
	}
	{
		desc_id = car_female_aged
		random_weight = 0.0
		replace = 'tex/models/Characters/car/female/car_female_head_n.dds'
		with = 'tex/models/Characters/Layers/CAR/Female/Age/CAR_Female_Age04_N.dds'
		replace2 = 'tex/models/Characters/car/female/car_female_head_d.dds'
		with2 = 'tex/models/Characters/Layers/CAR/Female/Age/CAR_Female_Age04_D.dds'
		frontend_desc = qs(0x1dd22d68)
		in = cas_body
		in2 = cas_body
	}
	{
		desc_id = car_female_old
		random_weight = 0.0
		replace = 'tex/models/Characters/car/female/car_female_head_n.dds'
		with = 'tex/models/Characters/Layers/CAR/Female/Age/CAR_Female_Age05_N.dds'
		replace2 = 'tex/models/Characters/car/female/car_female_head_d.dds'
		with2 = 'tex/models/Characters/Layers/CAR/Female/Age/CAR_Female_Age05_D.dds'
		frontend_desc = qs(0xc05200fd)
		in = cas_body
		in2 = cas_body
	}
]
