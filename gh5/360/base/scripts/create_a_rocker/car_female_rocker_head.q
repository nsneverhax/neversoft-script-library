cas_female_eyebrows = [
	{
		desc_id = car_no_brow
		frontend_desc = qs(0x9c1b5214)
		replace = `tex\models\characters\car\female\car_female_brow_d`
		with = `tex\models\characters\car\female\car_female_brow_00_d`
		in = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_default_brow
		frontend_desc = qs(0x675459e3)
		random_weight = 2.0
	}
	{
		desc_id = car_default_thick_brow
		frontend_desc = qs(0x9fa40a31)
		replace = `tex\models\characters\car\female\car_female_brow_d`
		with = `tex\models\characters\car\female\car_female_brow_07_d`
		in = cas_body
		random_weight = 1.0
	}
	{
		desc_id = car_rounded_brow
		frontend_desc = qs(0xf9ea62fa)
		replace = `tex\models\characters\car\female\car_female_brow_d`
		with = `tex\models\characters\car\female\car_female_brow_02_d`
		in = cas_body
		random_weight = 1.0
	}
	{
		desc_id = car_angled_thin_brow
		frontend_desc = qs(0xc0261551)
		replace = `tex\models\characters\car\female\car_female_brow_d`
		with = `tex\models\characters\car\female\car_female_brow_03_d`
		in = cas_body
		random_weight = 0.5
	}
	{
		desc_id = car_angled_thick_brow
		frontend_desc = qs(0xba1e2269)
		replace = `tex\models\characters\car\female\car_female_brow_d`
		with = `tex\models\characters\car\female\car_female_brow_04_d`
		in = cas_body
		random_weight = 0.5
	}
	{
		desc_id = car_straight_brow
		frontend_desc = qs(0x98d6632b)
		replace = `tex\models\characters\car\female\car_female_brow_d`
		with = `tex\models\characters\car\female\car_female_brow_05_d`
		in = cas_body
		random_weight = 0.25
	}
	{
		desc_id = car_dash_brow
		frontend_desc = qs(0x200cdea3)
		replace = `tex\models\characters\car\female\car_female_brow_d`
		with = `tex\models\characters\car\female\car_female_brow_08_d`
		in = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_uni_brow
		frontend_desc = qs(0xb662b00c)
		replace = `tex\models\characters\car\female\car_female_brow_d`
		with = `tex\models\characters\car\female\car_female_brow_09_d`
		in = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_vulcan_brow
		frontend_desc = qs(0x36cc96ef)
		replace = `tex\models\characters\car\female\car_female_brow_d`
		with = `tex\models\characters\car\female\car_female_brow_06_d`
		in = cas_body
		random_weight = 0.0
	}
]
cas_female_hair_random_colors = [
	{
		Color = carblack_1
		random_weight = 1.0
	}
	{
		Color = hairorange_3
		random_weight = 1.0
		genre = [
			rock
			pop
			`glam	rock`
			`classic	rock`
		]
	}
	{
		Color = hairred_orange_3
		random_weight = 1.0
		genre = [
			rock
			pop
			`glam	rock`
			`classic	rock`
		]
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
		Color = blue_3
		random_weight = 1.0
		genre = [
			punk
			goth
		]
	}
	{
		Color = blue_1
		random_weight = 1.0
		genre = [
			punk
			goth
		]
	}
	{
		Color = teal_3
		random_weight = 0.5
		genre = [
			punk
			goth
		]
	}
	{
		Color = green_1
		random_weight = 0.5
		genre = [
			punk
			goth
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
	{
		Color = purple_1
		random_weight = 0.5
		genre = [
			punk
			goth
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
		mesh = `models/car/female/f_bmtl_hair_overeyes`
		deform_mesh = `models/car/female/f_bmtl_hair_overeyes_def`
		$cas_female_hair_common_settings
		hat_hair = f_bmtl_hathair_overeyes
		material_groups = [
			{
				materials = [
					f_bmtl_hair_overeyes_hair
					f_bmtl_hair_overeyes_hair02
					f_bmtl_hair_overeyes_hair03
					f_bmtl_hair_overeyes_hair04
				]
				shader = $cas_shader_hair
				Name = qs(0x1a32079f)
			}
		]
		acc_skeleton = `skeletons/skel_f_bmtl_hair_overeyes`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_hair_overeyes`
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
		mesh = `models/car/female/f_bmtl_hair_straight`
		deform_mesh = `models/car/female/f_bmtl_hair_straight_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_bmtl_hair_overeyes_hair
					f_bmtl_hair_overeyes_hair02
					f_bmtl_hair_overeyes_hair03
					f_bmtl_hair_overeyes_hair04
				]
				shader = $cas_shader_hair
				Name = qs(0x1a32079f)
			}
		]
		hat_hair = f_bmtl_hathair_straight
		acc_skeleton = `skeletons/skel_f_bmtl_hair_straight`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_hair_straight`
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
		frontend_desc = qs(0x2114f878)
		mesh = `models/car/female/f_clsc_hair_blfro`
		deform_mesh = `models/car/female/f_clsc_hair_blfro_def`
		$cas_female_hair_common_settings_skinshader
		material_groups = [
			{
				materials = [
					f_clsc_hair_blfro_base
					f_clsc_hair_blfro_alpha
				]
				shader = $cas_shader_skin
				Name = qs(0x1a32079f)
			}
		]
		hat_hair = f_clsc_hathair_blfro
		acc_skeleton = `skeletons/skel_f_clsc_hair_blfro`
		acc_ragdoll = `ragdolls/car/female/clsc/rag_f_clsc_hair_blfro`
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
			rock
		]
		random_weight = 0.5
	}
	{
		desc_id = f_clsc_hair_farah
		frontend_desc = qs(0x728be496)
		mesh = `models/car/female/f_clsc_hair_farah`
		deform_mesh = `models/car/female/f_clsc_hair_farah_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_clsc_hair_farah_hair
				]
				shader = $cas_shader_hair
				Name = qs(0x1a32079f)
			}
		]
		hat_hair = f_clsc_hathair_farah
		acc_skeleton = `skeletons/skel_f_clsc_hair_farah`
		acc_ragdoll = `ragdolls/car/female/clsc/rag_f_clsc_hair_farah`
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
		]
	}
	{
		desc_id = f_glam_hair_seagull
		frontend_desc = qs(0xa41beba1)
		mesh = `models/car/female/f_glam_hair_seagull`
		deform_mesh = `models/car/female/f_glam_hair_seagull_def`
		$cas_female_hair_common_settings
		hat_hair = f_glam_hathair_seagull
		acc_skeleton = `skeletons/skel_f_glam_hair_seagull`
		acc_ragdoll = `ragdolls/car/female/glam/rag_f_glam_hair_seagull`
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
		mesh = `models/car/female/f_goth_hair_bangslong`
		deform_mesh = `models/car/female/f_goth_hair_bangslong_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_goth_hair01_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_goth_hair01_secondary
				]
				shader = $cas_shader_hair
				Name = qs(0x667bb798)
			}
		]
		hat_hair = f_goth_hathair_bangslong
		acc_skeleton = `skeletons/skel_f_goth_hair_bangslong`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_bangslong`
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
		mesh = `models/car/female/f_goth_hair_dreads`
		deform_mesh = `models/car/female/f_goth_hair_dreads_def`
		$cas_female_hair_common_settings_skinshader
		material_groups = [
			{
				materials = [
					f_goth_hair_dreads_dreads
				]
				shader = $cas_shader_skin
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_goth_hair_dreads_metal
				]
				shader = $cas_shader_skin
				Name = qs(0xab9d3c68)
			}
			{
				materials = [
					f_goth_hair_dreads_tubes
				]
				shader = $cas_shader_skin
				Name = qs(0x880fbb4c)
			}
		]
		hat_hair = f_goth_hathair_dreads
		acc_skeleton = `skeletons/skel_f_goth_hair_dreads`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_dreads`
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
		mesh = `models/car/female/f_goth_hair_updo`
		deform_mesh = `models/car/female/f_goth_hair_updo_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_goth_hair_updo_hair
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_goth_hair_updo_vale
				]
				shader = $cas_shader_skin
				Name = qs(0xc968775b)
			}
		]
		hat_hair = f_goth_hathair_updo
		acc_skeleton = `skeletons/skel_f_goth_hair_updo`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_updo`
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
		desc_id = f_goth_hair_pndrclef
		frontend_desc = qs(0xe5ca8f32)
		mesh = `models/car/female/f_goth_hair_pndrclef`
		deform_mesh = `models/car/female/f_goth_hair_pndrclef_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_goth_hair_pndrclef_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_goth_hair_pndrclef_secondary
				]
				shader = $cas_shader_skin
				Name = qs(0x2ff6ee2a)
			}
		]
		hat_hair = f_goth_hathair_pndrclef
		acc_skeleton = `skeletons/skel_f_goth_hair_pndrclef`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_pndrclef`
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
		desc_id = f_goth_hair_2tone
		frontend_desc = qs(0xe41cbf71)
		mesh = `models/car/female/f_goth_hair_2tone`
		deform_mesh = `models/car/female/f_goth_hair_2tone_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_goth_hair_2tone_primary
				]
				shader = $cas_shader_hair_masked1
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_goth_hair_2tone_primary
				]
				shader = $cas_shader_skin_masked2
				Name = qs(0x7d0df2c5)
			}
		]
		hat_hair = f_goth_hathair_2tone
		acc_skeleton = `skeletons/skel_f_goth_hair_2tone`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_2tone`
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
			`black	metal`
		]
	}
	{
		desc_id = f_goth_hair_pndrcrow
		frontend_desc = qs(0xdb1ea893)
		mesh = `models/car/female/f_goth_hair_pndrcrow`
		deform_mesh = `models/car/female/f_goth_hair_pndrcrow_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_goth_hair_pndrcrow_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_goth_hair_pndrcrow_secondary
				]
				shader = $cas_shader_hair
				Name = qs(0x667bb798)
			}
			{
				materials = [
					f_goth_hair_pndrcrow_tertiary
				]
				shader = $cas_shader_skin
				Name = qs(0x000a968d)
			}
		]
		hat_hair = f_goth_hathair_pndrcrow
		acc_skeleton = `skeletons/skel_f_goth_hair_pndrcrow`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_pndrcrow`
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
		desc_id = f_goth_hair_pndrtubes
		frontend_desc = qs(0xcb26fd1a)
		mesh = `models/car/female/f_goth_hair_pndrtubes`
		deform_mesh = `models/car/female/f_goth_hair_pndrtubes_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_goth_hair_pndrtubes_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_goth_hair_pndrtubes_secondary
				]
				shader = $cas_shader_hair
				Name = qs(0x667bb798)
			}
			{
				materials = [
					f_goth_hair_pndrtubes_tube1
				]
				shader = $cas_shader_skin
				Name = qs(0x6a79a35c)
			}
			{
				materials = [
					f_goth_hair_pndrtubes_tube2
				]
				shader = $cas_shader_skin
				Name = qs(0x16188687)
			}
			{
				materials = [
					f_goth_hair_pndrtubes_foam1
				]
				shader = $cas_shader_skin
				Name = qs(0x4a355669)
			}
			{
				materials = [
					f_goth_hair_pndrtubes_foam2
				]
				shader = $cas_shader_skin
				Name = qs(0x365473b2)
			}
		]
		hat_hair = f_goth_hathair_pndrtubes
		acc_skeleton = `skeletons/skel_f_goth_hair_pndrtubes`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_pndrtubes`
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
		mesh = `models/car/female/f_metl_hair_midstrt`
		deform_mesh = `models/car/female/f_metl_hair_midstrt_def`
		$cas_female_hair_common_settings
		hat_hair = f_metl_hathair_midstrt
		acc_skeleton = `skeletons/skel_f_metl_hair_midstrt`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_hair_midstrt`
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
			pop
		]
	}
	{
		desc_id = f_metl_hair_pony
		frontend_desc = qs(0xb84644d2)
		mesh = `models/car/female/f_metl_hair_pony`
		deform_mesh = `models/car/female/f_metl_hair_pony_def`
		$cas_female_hair_common_settings
		hat_hair = f_metl_hathair_pony
		material_groups = [
			{
				materials = [
					f_metl_hair_ponytail_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_metl_hair_ponytail_secondary
				]
				shader = $cas_shader_hair
				Name = qs(0x667bb798)
			}
		]
		acc_skeleton = `skeletons/skel_f_metl_hair_pony`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_hair_pony`
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
			pop
		]
	}
	{
		desc_id = f_metl_hair_skunk
		frontend_desc = qs(0xcf6e0971)
		mesh = `models/car/female/f_metl_hair_skunk`
		deform_mesh = `models/car/female/f_metl_hair_skunk_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_metl_hair_skunk_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_metl_hair_skunk_secondary
				]
				shader = $cas_shader_hair
				Name = qs(0x2201271b)
			}
		]
		hat_hair = f_metl_hathair_skunk
		acc_skeleton = `skeletons/skel_f_metl_hair_skunk`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_hair_skunk`
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
		desc_id = f_metl_hair_twisty
		frontend_desc = qs(0x0e45e013)
		mesh = `models/car/female/f_metl_hair_twisty`
		deform_mesh = `models/car/female/f_metl_hair_twisty_def`
		material_groups = [
			{
				materials = [
					f_metl_hair_twisty_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_metl_hair_twisty_secondary
				]
				shader = $cas_shader_hair
				Name = qs(0x2201271b)
			}
		]
		chosen_materials = {
			material1 = blue_1
			material2 = grey_2
		}
		$cas_female_hair_common_settings
		hat_hair = f_metl_hathair_twisty
		acc_skeleton = `skeletons/skel_f_metl_hair_twisty`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_hair_twisty`
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
			`glam	rock`
		]
	}
	{
		desc_id = f_pop_hair_fergie
		frontend_desc = qs(0xfbb46fb6)
		mesh = `models/car/female/f_pop_hair_fergie`
		deform_mesh = `models/car/female/f_pop_hair_fergie_def`
		$cas_female_hair_common_settings
		hat_hair = f_pop_hathair_fergie
		acc_skeleton = `skeletons/skel_f_pop_hair_fergie`
		acc_ragdoll = `ragdolls/car/female/pop/rag_f_pop_hair_fergie`
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
		desc_id = f_punk_hair_downhawk
		frontend_desc = qs(0x5febcb62)
		mesh = `models/car/female/f_punk_hair_downhawk`
		deform_mesh = `models/car/female/f_punk_hair_downhawk_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_punk_hair_downhawk_hair
					f_punk_hair_downhawk_hair02
					f_punk_hair_downhawk_hair03
				]
				shader = $cas_shader_hair
				Name = qs(0x1a32079f)
			}
		]
		hat_hair = f_punk_hathair_downhawk
		acc_skeleton = `skeletons/skel_f_punk_hair_downhawk`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_hair_downhawk`
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
		mesh = `models/car/female/f_punk_hair_hawk`
		deform_mesh = `models/car/female/f_punk_hair_hawk_def`
		$cas_female_hair_common_settings
		hat_hair = f_punk_hathair_hawk
		acc_skeleton = `skeletons/skel_f_punk_hair_hawk`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_hair_hawk`
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
		mesh = `models/car/female/f_punk_hair_judynails1`
		deform_mesh = `models/car/female/f_punk_hair_judynails1_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_punk_hair_judynails1_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_punk_hair_judynails1_secondary
				]
				shader = $cas_shader_hair
				Name = qs(0x2201271b)
			}
		]
		hat_hair = f_punk_hathair_judynails1
		acc_skeleton = `skeletons/skel_f_punk_hair_judynails1`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_hair_judynails1`
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
		chosen_materials = {
			material1 = red_1
			material2 = purple_blue_1
		}
		genre = [
			punk
		]
	}
	{
		desc_id = f_rock_hair_emo
		frontend_desc = qs(0xaeec633a)
		mesh = `models/car/female/f_rock_hair_emo`
		deform_mesh = `models/car/female/f_rock_hair_emo_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_rock_hair_emo_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_rock_hair_emo_secondary
				]
				shader = $cas_shader_hair
				Name = qs(0x2201271b)
			}
		]
		hat_hair = f_rock_hathair_emo
		acc_skeleton = `skeletons/skel_f_rock_hair_emo`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_emo`
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
		desc_id = f_rock_hair_ecpony
		frontend_desc = qs(0xb05dc5f5)
		mesh = `models/car/female/f_rock_hair_ecpony`
		deform_mesh = `models/car/female/f_rock_hair_ecpony_def`
		$cas_female_hair_common_settings
		materials = [
			f_rock_hair_ecpony_primary
		]
		hat_hair = f_rock_hathair_ecpony
		acc_skeleton = `skeletons/skel_f_rock_hair_ecpony`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_ecpony`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
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
		desc_id = f_rock_hair_c_mid
		frontend_desc = qs(0xa712a311)
		mesh = `models/car/female/f_rock_hair_c_mid`
		deform_mesh = `models/car/female/f_rock_hair_c_mid_def`
		$cas_female_hair_common_settings
		materials = [
			f_rock_hair_c_mid_primary
		]
		hat_hair = f_rock_hathair_c_mid
		acc_skeleton = `skeletons/skel_f_rock_hair_c_mid`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_c_mid`
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
			`heavy	metal`
		]
	}
	{
		desc_id = f_rock_hair_cbob
		frontend_desc = qs(0xb77163fa)
		mesh = `models/car/female/f_rock_hair_cbob`
		deform_mesh = `models/car/female/f_rock_hair_cbob_def`
		$cas_female_hair_common_settings
		materials = [
			f_rock_hair_cbob_primary
		]
		hat_hair = f_rock_hathair_cbob
		acc_skeleton = `skeletons/skel_f_rock_hair_cbob`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_cbobd`
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
			`heavy	metal`
			pop
			`glam	rock`
		]
	}
	{
		desc_id = f_rock_hair_c2short
		frontend_desc = qs(0xe795b7c7)
		mesh = `models/car/female/f_rock_hair_c2short`
		deform_mesh = `models/car/female/f_rock_hair_c2short_def`
		$cas_female_hair_common_settings
		materials = [
			f_rock_hair_c2short_primary
		]
		hat_hair = f_rock_hathair_c2short
		acc_skeleton = `skeletons/skel_f_rock_hair_c2short`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_c2short`
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
		mesh = `models/car/female/f_rock_hair_short`
		deform_mesh = `models/car/female/f_rock_hair_short_def`
		$cas_female_hair_common_settings
		hat_hair = f_rock_hathair_short
		acc_skeleton = `skeletons/skel_f_rock_head_hair_short`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_head_hair_short`
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
			pop
		]
	}
	{
		desc_id = f_rock_hair_wavy
		frontend_desc = qs(0x66b782c7)
		mesh = `models/car/female/f_rock_hair_wavy`
		deform_mesh = `models/car/female/f_rock_hair_wavy_def`
		$cas_female_hair_common_settings
		hat_hair = f_rock_hathair_wavy
		acc_skeleton = `skeletons/skel_f_rock_hair_wavy`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_wavy`
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
			`classic	rock`
		]
	}
	{
		desc_id = f_funpart_hair_octo
		frontend_desc = qs(0x5738bc5c)
		mesh = `models/car/female/f_funpart_hair_octo`
		deform_mesh = `models/car/female/f_funpart_hair_octo_def`
		hat_hair = f_funpart_hathair_octo
		acc_skeleton = `skeletons/skel_f_funpart_hair_octo`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_funpart_hair_octo`
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
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_funpart_hair_slime
		frontend_desc = qs(0xdbfe1db5)
		mesh = `models/car/female/f_funpart_hair_slime`
		deform_mesh = `models/car/female/f_funpart_hair_slime_def`
		hat_hair = f_funpart_hathair_slime
		materials = [
			f_funpart_hair_slime_primary
		]
		acc_skeleton = `skeletons/skel_f_funpart_hair_slime`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_funpart_hair_slime`
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
		random_weight = 0.0
		locked
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
		mesh = `models/car/female/f_bmtl_hathair_overeyes`
		deform_mesh = `models/car/female/f_bmtl_hathair_overeyes_def`
		$cas_female_hat_hair_common_settings
		material_groups = [
			{
				materials = [
					f_bmtl_hair_overeyes_hair
				]
			}
			{
				materials = [
					f_bmtl_hair_overeyes_hair02
				]
			}
			{
				materials = [
					f_bmtl_hair_overeyes_hair03
				]
			}
			{
				materials = [
					f_bmtl_hair_overeyes_hair04
				]
			}
		]
		acc_skeleton = `skeletons/skel_f_bmtl_hair_overeyes`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_hair_overeyes`
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
		mesh = `models/car/female/f_bmtl_hathair_straight`
		deform_mesh = `models/car/female/f_bmtl_hathair_straight_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_bmtl_hair_straight`
		acc_ragdoll = `ragdolls/car/female/bmtl/rag_f_bmtl_hair_straight`
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
		mesh = `models/car/female/f_clsc_hathair_blfro`
		deform_mesh = `models/car/female/f_clsc_hathair_blfro_def`
		$cas_female_hair_common_settings_skinshader
		acc_skeleton = `skeletons/skel_f_clsc_hair_blfro`
		acc_ragdoll = `ragdolls/car/female/clsc/rag_f_clsc_hair_blfro`
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
		mesh = `models/car/female/f_clsc_hathair_farah`
		deform_mesh = `models/car/female/f_clsc_hathair_farah_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_clsc_hair_farah`
		acc_ragdoll = `ragdolls/car/female/clsc/rag_f_clsc_hair_farah`
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
		mesh = `models/car/female/f_glam_hathair_seagull`
		deform_mesh = `models/car/female/f_glam_hathair_seagull_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_glam_hair_seagull`
		acc_ragdoll = `ragdolls/car/female/glam/rag_f_glam_hair_seagull`
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
		mesh = `models/car/female/f_goth_hathair_bangslong`
		deform_mesh = `models/car/female/f_goth_hathair_bangslong_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_goth_hair_bangslong`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_bangslong`
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
		mesh = `models/car/female/f_goth_hathair_dreads`
		deform_mesh = `models/car/female/f_goth_hathair_dreads_def`
		$cas_female_hat_hair_common_settings_skinshader
		acc_skeleton = `skeletons/skel_f_goth_hair_dreads`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_dreads`
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
		mesh = `models/car/female/f_goth_hathair_updo`
		deform_mesh = `models/car/female/f_goth_hathair_updo_def`
		$cas_female_hat_hair_common_settings
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
		acc_skeleton = `skeletons/skel_f_goth_hair_updo`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_updo`
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
		desc_id = f_goth_hathair_pndrclef
		mesh = `models/car/female/f_goth_hathair_pndrclef`
		deform_mesh = `models/car/female/f_goth_hathair_pndrclef_def`
		acc_skeleton = `skeletons/skel_f_goth_hair_pndrclef`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_pndrclef`
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
		$cas_female_hat_hair_common_settings
		material_groups = [
			{
				materials = [
					f_goth_hair_pndrclef_primary
				]
				shader = $cas_shader_hair
				Name = qs(0xdaa67e9a)
			}
		]
	}
	{
		desc_id = f_goth_hathair_2tone
		mesh = `models/car/female/f_goth_hathair_2tone`
		deform_mesh = `models/car/female/f_goth_hathair_2tone_def`
		$cas_female_hair_common_settings
		material_groups = [
			{
				materials = [
					f_goth_hair_2tone_primary
				]
				shader = $cas_shader_hair_masked1
			}
			{
				materials = [
					f_goth_hair_2tone_primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		acc_skeleton = `skeletons/skel_f_goth_hair_2tone`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_2tone`
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
		desc_id = f_goth_hathair_pndrcrow
		mesh = `models/car/female/f_goth_hathair_pndrcrow`
		deform_mesh = `models/car/female/f_goth_hathair_pndrcrow_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_goth_hair_pndrcrow`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_pndrcrow`
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
		material_groups = [
			{
				materials = [
					f_goth_hair_pndrcrow_primary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					f_goth_hair_pndrcrow_secondary
				]
				shader = $cas_shader_hair
			}
		]
	}
	{
		desc_id = f_goth_hathair_pndrtubes
		mesh = `models/car/female/f_goth_hathair_pndrtubes`
		deform_mesh = `models/car/female/f_goth_hathair_pndrtubes_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_goth_hair_pndrtubes`
		acc_ragdoll = `ragdolls/car/female/goth/rag_f_goth_hair_pndrtubes`
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
		material_groups = [
			{
				materials = [
					f_goth_hair_pndrtubes_primary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					f_goth_hair_pndrtubes_secondary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					f_goth_hair_pndrtubes_foam1
				]
				shader = $cas_shader_skin
			}
		]
	}
	{
		desc_id = f_metl_hathair_midstrt
		mesh = `models/car/female/f_metl_hathair_midstrt`
		deform_mesh = `models/car/female/f_metl_hathair_midstrt_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_metl_hair_midstrt`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_hair_midstrt`
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
		mesh = `models/car/female/f_metl_hathair_pony`
		deform_mesh = `models/car/female/f_metl_hathair_pony_def`
		$cas_female_hat_hair_common_settings
		material_groups = [
			{
				materials = [
					f_metl_hair_ponytail_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_metl_hair_ponytail_secondary
				]
				shader = $cas_shader_hair
				Name = qs(0x667bb798)
			}
		]
		acc_skeleton = `skeletons/skel_f_metl_hair_pony`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_hair_pony`
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
		mesh = `models/car/female/f_metl_hathair_skunk`
		deform_mesh = `models/car/female/f_metl_hathair_skunk_def`
		$cas_female_hat_hair_common_settings
		material_groups = [
			{
				materials = [
					f_metl_hair_skunk_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x96d729f3)
			}
			{
				materials = [
					f_metl_hair_skunk_secondary
				]
				shader = $cas_shader_hair
				Name = qs(0x2201271b)
			}
		]
		acc_skeleton = `skeletons/skel_f_metl_hair_skunk`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_hair_skunk`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
		]
	}
	{
		desc_id = f_metl_hathair_twisty
		frontend_desc = qs(0x0e45e013)
		mesh = `models/car/female/f_metl_hathair_twisty`
		deform_mesh = `models/car/female/f_metl_hathair_twisty_def`
		materials = [
			f_metl_hair_twisty_primary
			f_metl_hair_twisty_secondary
		]
		chosen_materials = {
			material1 = blue_1
			material2 = grey_2
		}
		$cas_female_hair_common_settings
		acc_skeleton = `skeletons/skel_f_metl_hair_twisty`
		acc_ragdoll = `ragdolls/car/female/metl/rag_f_metl_hair_twisty`
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
		desc_id = f_pop_hathair_fergie
		mesh = `models/car/female/f_pop_hathair_fergie`
		deform_mesh = `models/car/female/f_pop_hathair_fergie_def`
		$cas_female_hair_common_settings
		acc_skeleton = `skeletons/skel_f_pop_hair_fergie`
		acc_ragdoll = `ragdolls/car/female/pop/rag_f_pop_hair_fergie`
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
		desc_id = f_punk_hathair_downhawk
		mesh = `models/car/female/f_punk_hathair_downhawk`
		deform_mesh = `models/car/female/f_punk_hathair_downhawk_def`
		$cas_female_hair_common_settings
		acc_skeleton = `skeletons/skel_f_punk_hair_downhawk`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_hair_downhawk`
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
		desc_id = f_punk_hathair_hawk
		mesh = `models/car/female/f_punk_hathair_hawk`
		deform_mesh = `models/car/female/f_punk_hathair_hawk_def`
		$cas_female_hair_common_settings
		acc_skeleton = `skeletons/skel_f_punk_hair_downhawk`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_hair_downhawk`
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
		mesh = `models/car/female/f_punk_hathair_judynails1`
		deform_mesh = `models/car/female/f_punk_hathair_judynails1_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_punk_hair_judynails1`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_hair_judynails1`
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
		mesh = `models/car/female/f_punk_hathair_ponytail`
		deform_mesh = `models/car/female/f_punk_hathair_ponytail_def`
		$cas_female_hair_common_settings
		acc_skeleton = `skeletons/skel_f_punk_hair_ponytail`
		acc_ragdoll = `ragdolls/car/female/punk/rag_f_punk_hair_ponytail`
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
		mesh = `models/car/female/f_rock_hathair_emo`
		deform_mesh = `models/car/female/f_rock_hathair_emo_def`
		$cas_female_hair_common_settings
		materials = [
			f_rock_hair_emo_primary
			f_rock_hair_emo_secondary
		]
		acc_skeleton = `skeletons/skel_f_rock_hair_emo`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_emo`
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
		mesh = `models/car/female/f_rock_hathair_short`
		deform_mesh = `models/car/female/f_rock_hathair_short_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_rock_head_hair_short`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_head_hair_short`
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
		mesh = `models/car/female/f_rock_hathair_wavy`
		deform_mesh = `models/car/female/f_rock_hathair_wavy_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_rock_hair_wavy`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_wavy`
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
		mesh = `models/car/female/f_rock_hathair_bass`
		deform_mesh = `models/car/female/f_rock_hathair_bass_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_rock_hair_bass`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_bass`
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
		desc_id = f_rock_hathair_cbob
		mesh = `models/car/female/f_rock_hathair_cbob`
		deform_mesh = `models/car/female/f_rock_hathair_cbob_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_rock_hair_cbob`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_cbobd`
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
		desc_id = f_rock_hathair_c2short
		mesh = `models/car/female/f_rock_hathair_c2short`
		deform_mesh = `models/car/female/f_rock_hathair_c2short_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_rock_hair_c2short`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_c2short`
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
		desc_id = f_rock_hathair_c_mid
		mesh = `models/car/female/f_rock_hathair_c_mid`
		deform_mesh = `models/car/female/f_rock_hathair_c_mid_def`
		$cas_female_hat_hair_common_settings
		acc_skeleton = `skeletons/skel_f_rock_hair_c_mid`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_c_mid`
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
		desc_id = f_rock_hathair_ecpony
		mesh = `models/car/female/f_rock_hathair_ecpony`
		deform_mesh = `models/car/female/f_rock_hathair_ecpony_def`
		$cas_female_hair_common_settings
		materials = [
			f_rock_hair_ecpony_primary
		]
		acc_skeleton = `skeletons/skel_f_rock_hair_ecpony`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_rock_hair_ecpony`
		acc_bones = [
			bone_acc_head_01
			bone_acc_head_02
			bone_acc_head_03
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
		desc_id = f_funpart_hathair_octo
		mesh = `models/car/female/f_funpart_hathair_octo`
		deform_mesh = `models/car/female/f_funpart_hathair_octo_def`
		acc_skeleton = `skeletons/skel_f_funpart_hair_octo`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_funpart_hair_octo`
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
		desc_id = f_funpart_hathair_slime
		mesh = `models/car/female/f_funpart_hair_slime`
		deform_mesh = `models/car/female/f_funpart_hair_slime_def`
		materials = [
			f_funpart_hair_slime_primary
		]
		acc_skeleton = `skeletons/skel_f_funpart_hair_slime`
		acc_ragdoll = `ragdolls/car/female/rock/rag_f_funpart_hair_slime`
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
		frontend_desc = qs(0xfbbb986e)
		mesh = `models/car/female/f_bmtl_hat_skullhelmet`
		deform_mesh = `models/car/female/f_bmtl_hat_skullhelmet_def`
		materials = [
			f_bmtl_hat_skullhelmet_primary
			f_bmtl_hat_skullhelmet_secondary
		]
		hat_hair = None
		genre = [
			`black	metal`
		]
		random_weight = 0.05
		locked
	}
	{
		desc_id = f_metl_hat_studs
		frontend_desc = qs(0x3e943475)
		mesh = `models/car/female/f_metl_hat_studs`
		deform_mesh = `models/car/female/f_metl_hat_studs_def`
		genre = [
			`black	metal`
			`heavy	metal`
		]
		random_weight = 0.025
	}
	{
		desc_id = f_metl_acc_horn
		frontend_desc = qs(0x4368b0cb)
		mesh = `models/car/female/f_metl_acc_horn`
		deform_mesh = `models/car/female/f_metl_acc_horn_def`
		materials = [
			f_metl_acc_horn_primary
		]
		genre = [
			`heavy	metal`
		]
		hat_hair = original_hair
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_pop_hat_bucket
		frontend_desc = qs(0xff1d662e)
		mesh = `models/car/female/f_pop_hat_bucket`
		deform_mesh = `models/car/female/f_pop_hat_bucket_def`
		materials = [
			m_pop_hat_bucket_primary
			m_pop_hat_bucket_secondary
		]
		genre = [
			pop
		]
		random_weight = 0.05
	}
	{
		desc_id = f_pop_head_ww2helm
		frontend_desc = qs(0x3f2a64bc)
		mesh = `models/car/female/f_pop_head_ww2helm`
		deform_mesh = `models/car/female/f_pop_head_ww2helm_def`
		genre = [
			punk
			`heavy	metal`
			goth
		]
		random_weight = 0.025
		locked
	}
	{
		desc_id = f_pop_head_woolhat
		frontend_desc = qs(0xdb412f13)
		mesh = `models/car/female/f_pop_head_woolhat`
		deform_mesh = `models/car/female/f_pop_head_woolhat_def`
		materials = [
			f_pop_woolhat_woolhat
		]
		genre = [
			pop
		]
		random_weight = 0.025
	}
	{
		desc_id = f_pop_acc_catears
		frontend_desc = qs(0x7c85e886)
		mesh = `models/car/female/f_pop_acc_catears`
		deform_mesh = `models/car/female/f_pop_acc_catears_def`
		materials = [
			f_pop_acc_catears_primary
			f_pop_acc_catears_secondary
		]
		hat_hair = original_hair
		genre = [
			pop
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_rock_hat_cowboy
		frontend_desc = qs(0xe803c83b)
		mesh = `models/car/female/f_rock_hat_cowboy`
		deform_mesh = `models/car/female/f_rock_hat_cowboy_def`
		materials = [
			f_rock_hat_cowboy_primary
			f_rock_hat_cowboy_secondary
		]
		genre = [
			rock
		]
		random_weight = 0.025
	}
	{
		desc_id = f_rock_hat_starpin
		frontend_desc = qs(0x627fba5a)
		mesh = `models/car/female/f_rock_hat_starpin`
		deform_mesh = `models/car/female/f_rock_hat_starpin_def`
		materials = [
			f_rock_hat_starpin_primary
		]
		genre = [
			rock
		]
		random_weight = 0.025
	}
	{
		desc_id = f_clsc_hat_cptn
		frontend_desc = qs(0x815966f6)
		mesh = `models/car/female/f_clsc_hat_cptn`
		deform_mesh = `models/car/female/f_clsc_hat_cptn_def`
		genre = [
			`classic	rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = f_clsc_hat_cowboy
		frontend_desc = qs(0xe7e12c49)
		mesh = `models/car/female/f_clsc_hat_cowboy`
		deform_mesh = `models/car/female/f_clsc_hat_cowboy_def`
		genre = [
			`classic	rock`
		]
		random_weight = 0.025
	}
	{
		desc_id = f_clsc_hat_triangle
		frontend_desc = qs(0xd0fa14a6)
		mesh = `models/car/female/f_clsc_hat_triangle`
		deform_mesh = `models/car/female/f_clsc_hat_triangle_def`
		genre = [
			`classic	rock`
		]
		random_weight = 0.025
	}
	{
		desc_id = f_goth_hat_tophat
		frontend_desc = qs(0xd9f3b456)
		mesh = `models/car/female/f_goth_hat_tophat`
		deform_mesh = `models/car/female/f_goth_hat_tophat_def`
		material_groups = [
			{
				materials = [
					m_goth_acc_tophat_primary
				]
				shader = $cas_shader_hair
				Name = qs(0x4a6d745b)
			}
			{
				materials = [
					m_goth_acc_tophat_secondary
				]
				shader = $cas_shader_skin
				Name = qs(0xee3a510b)
			}
		]
		genre = [
			goth
		]
		random_weight = 0.025
	}
	{
		desc_id = f_pop_head_gasmask
		frontend_desc = qs(0x0039dd19)
		mesh = `models/car/female/f_pop_head_gasmask`
		deform_mesh = `models/car/female/f_pop_head_gasmask_def`
		materials = [
			m_pop_head_gasmask_mask
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_bmtl_head_viking
		frontend_desc = qs(0xbbf00af8)
		mesh = `models/car/female/f_bmtl_hat_viking`
		deform_mesh = `models/car/female/f_bmtl_hat_viking_def`
		genre = [
			`black	metal`
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_fun_hat_eyeball
		frontend_desc = qs(0x3b86ba16)
		mesh = `models/car/female/f_fun_hat_eyeball`
		deform_mesh = `models/car/female/f_fun_hat_eyeball_def`
		genre = [
			goth
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = f_fun_hat_chickenmask
		frontend_desc = qs(0x59a690d4)
		mesh = `models/car/female/f_fun_hat_chickenmask`
		genre = [
			bmtl
		]
		hat_hair = None
		random_weight = 0.0
		locked
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
		replace = `tex/models/characters/car/female/car_female_head_n`
		with = `tex/models/characters/layers/car/female/age/car_female_age03_n`
		frontend_desc = qs(0xbe8a142d)
		in = cas_body
		in2 = cas_body
	}
	{
		desc_id = car_female_aged
		random_weight = 0.0
		replace = `tex/models/characters/car/female/car_female_head_n`
		with = `tex/models/characters/layers/car/female/age/car_female_age04_n`
		frontend_desc = qs(0x1dd22d68)
		in = cas_body
		in2 = cas_body
	}
	{
		desc_id = car_female_old
		random_weight = 0.0
		replace = `tex/models/characters/car/female/car_female_head_n`
		with = `tex/models/characters/layers/car/female/age/car_female_age05_n`
		frontend_desc = qs(0xc05200fd)
		in = cas_body
		in2 = cas_body
	}
]
cas_female_teeth = [
	{
		desc_id = car_female_teeth
		frontend_desc = qs(0x675459e3)
		mesh = `models/car/female/car_female_teeth`
		deform_mesh = `models/car/female/car_female_teeth_def`
	}
	{
		desc_id = car_female_teeth01
		frontend_desc = qs(0x038dcbee)
		mesh = `models/car/female/car_female_teeth01`
		deform_mesh = `models/car/female/car_female_teeth01_def`
		random_weight = 0.0
	}
	{
		desc_id = car_female_teeth02
		frontend_desc = qs(0x1a2ce811)
		mesh = `models/car/female/car_female_teeth02`
		deform_mesh = `models/car/female/car_female_teeth02_def`
		random_weight = 0.0
	}
	{
		desc_id = car_female_teeth03
		frontend_desc = qs(0xd067d16e)
		mesh = `models/car/female/car_female_teeth03`
		deform_mesh = `models/car/female/car_female_teeth03_def`
		random_weight = 0.0
	}
]
