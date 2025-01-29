CAS_female_Eyebrows = [
	{
		desc_id = CAR_No_Brow
		frontend_desc = qs(0x9c1b5214)
		replace = `tex\models\Characters\CAR\Female\CAR_female_BROW_D`
		with = `tex\models\Characters\CAR\Female\CAR_female_BROW_00_D`
		in = CAS_Body
		random_weight = 0.0
	}
	{
		desc_id = CAR_Default_Brow
		frontend_desc = qs(0x675459e3)
		random_weight = 2.0
	}
	{
		desc_id = CAR_Default_Thick_Brow
		frontend_desc = qs(0x9fa40a31)
		replace = `tex\models\Characters\CAR\Female\CAR_female_BROW_D`
		with = `tex\models\Characters\CAR\Female\CAR_female_BROW_07_D`
		in = CAS_Body
		random_weight = 1.0
	}
	{
		desc_id = CAR_Rounded_Brow
		frontend_desc = qs(0xf9ea62fa)
		replace = `tex\models\Characters\CAR\Female\CAR_female_BROW_D`
		with = `tex\models\Characters\CAR\Female\CAR_female_BROW_02_D`
		in = CAS_Body
		random_weight = 1.0
	}
	{
		desc_id = CAR_Angled_Thin_Brow
		frontend_desc = qs(0xc0261551)
		replace = `tex\models\Characters\CAR\Female\CAR_female_BROW_D`
		with = `tex\models\Characters\CAR\Female\CAR_female_BROW_03_D`
		in = CAS_Body
		random_weight = 0.5
	}
	{
		desc_id = CAR_Angled_Thick_Brow
		frontend_desc = qs(0xba1e2269)
		replace = `tex\models\Characters\CAR\Female\CAR_female_BROW_D`
		with = `tex\models\Characters\CAR\Female\CAR_female_BROW_04_D`
		in = CAS_Body
		random_weight = 0.5
	}
	{
		desc_id = CAR_Straight_Brow
		frontend_desc = qs(0x98d6632b)
		replace = `tex\models\Characters\CAR\Female\CAR_female_BROW_D`
		with = `tex\models\Characters\CAR\Female\CAR_female_BROW_05_D`
		in = CAS_Body
		random_weight = 0.25
	}
	{
		desc_id = CAR_Dash_Brow
		frontend_desc = qs(0x200cdea3)
		replace = `tex\models\Characters\CAR\Female\CAR_female_BROW_D`
		with = `tex\models\Characters\CAR\Female\CAR_female_BROW_08_D`
		in = CAS_Body
		random_weight = 0.0
	}
	{
		desc_id = CAR_Uni_brow
		frontend_desc = qs(0xb662b00c)
		replace = `tex\models\Characters\CAR\Female\CAR_female_BROW_D`
		with = `tex\models\Characters\CAR\Female\CAR_female_BROW_09_D`
		in = CAS_Body
		random_weight = 0.0
	}
	{
		desc_id = CAR_Vulcan_Brow
		frontend_desc = qs(0x36cc96ef)
		replace = `tex\models\Characters\CAR\Female\CAR_female_BROW_D`
		with = `tex\models\Characters\CAR\Female\CAR_female_BROW_06_D`
		in = CAS_Body
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
			Pop
			`Glam	Rock`
			`Classic	Rock`
		]
	}
	{
		Color = hairred_orange_3
		random_weight = 1.0
		genre = [
			rock
			Pop
			`Glam	Rock`
			`Classic	Rock`
		]
	}
	{
		Color = yellow_4
		random_weight = 1.0
		genre = [
			Punk
			`Heavy	Metal`
			`Glam	Rock`
			Pop
			rock
			`Classic	Rock`
			`Black	Metal`
		]
	}
	{
		Color = yellow_2
		random_weight = 1.0
		genre = [
			Punk
			`Heavy	Metal`
			`Glam	Rock`
			Pop
			rock
			`Classic	Rock`
		]
	}
	{
		Color = red_2
		random_weight = 1.0
		genre = [
			Punk
			Goth
			rock
		]
	}
	{
		Color = brown_4
		random_weight = 1.0
		genre = [
			Punk
			`Heavy	Metal`
			`Glam	Rock`
			Pop
			rock
			`Classic	Rock`
		]
	}
	{
		Color = brown_3
		random_weight = 1.0
		genre = [
			Punk
			`Heavy	Metal`
			`Glam	Rock`
			Pop
			rock
			`Classic	Rock`
		]
	}
	{
		Color = brown_2
		random_weight = 1.0
		genre = [
			Punk
			`Heavy	Metal`
			`Glam	Rock`
			Pop
			rock
			`Classic	Rock`
		]
	}
	{
		Color = blue_3
		random_weight = 1.0
		genre = [
			Punk
			Goth
		]
	}
	{
		Color = blue_1
		random_weight = 1.0
		genre = [
			Punk
			Goth
		]
	}
	{
		Color = teal_3
		random_weight = 0.5
		genre = [
			Punk
			Goth
		]
	}
	{
		Color = green_1
		random_weight = 0.5
		genre = [
			Punk
			Goth
		]
	}
	{
		Color = grey_5
		random_weight = 0.5
		genre = [
			`Black	Metal`
		]
	}
	{
		Color = pink_3
		random_weight = 0.5
		genre = [
			Punk
			Goth
			Pop
		]
	}
	{
		Color = purple_1
		random_weight = 0.5
		genre = [
			Punk
			Goth
		]
	}
]
CAS_Female_Hair_Common_Settings = {
	modify_all_materials
	shader = $cas_shader_hair
	random_colors = $cas_female_hair_random_colors
}
CAS_Female_Hair_Common_Settings_SkinShader = {
	modify_all_materials
	shader = $cas_shader_skin
	random_colors = $cas_female_hair_random_colors
}
CAS_Female_Hair = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 0.0
	}
	{
		desc_id = F_Bmtl_Hair_OverEyes
		frontend_desc = qs(0x511858ef)
		mesh = `models/CAR/Female/F_Bmtl_Hair_OverEyes`
		deform_mesh = `models/CAR/Female/F_Bmtl_Hair_OverEyes_def`
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Bmtl_HatHair_OverEyes
		material_groups = [
			{
				materials = [
					F_Bmtl_Hair_OverEyes_Hair
				]
				shader = $cas_shader_hair
			}
		]
		acc_skeleton = `skeletons/Skel_F_Bmtl_Hair_OverEyes`
		acc_ragdoll = `Ragdolls/CAR/Female/Bmtl/Rag_F_Bmtl_Hair_OverEyes`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			`Black	Metal`
		]
		random_weight = 0.5
	}
	{
		desc_id = F_Bmtl_Hair_Straight
		frontend_desc = qs(0x180c8fed)
		mesh = `models/CAR/Female/F_Bmtl_Hair_Straight`
		deform_mesh = `models/CAR/Female/F_Bmtl_Hair_Straight_def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Bmtl_Hair_OverEyes_Hair
					F_Bmtl_Hair_OverEyes_Hair02
					F_Bmtl_Hair_OverEyes_Hair03
					F_Bmtl_Hair_OverEyes_Hair04
				]
				shader = $cas_shader_hair
			}
		]
		hat_hair = F_Bmtl_HatHair_Straight
		acc_skeleton = `skeletons/Skel_F_Bmtl_Hair_Straight`
		acc_ragdoll = `Ragdolls/CAR/Female/Bmtl/Rag_F_Bmtl_Hair_Straight`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			`Black	Metal`
			`Heavy	Metal`
		]
		random_weight = 0.3
	}
	{
		desc_id = F_Clsc_Hair_BlFro
		frontend_desc = qs(0x2114f878)
		mesh = `models/CAR/Female/F_Clsc_Hair_BlFro`
		deform_mesh = `models/CAR/Female/F_Clsc_Hair_BlFro_def`
		$CAS_Female_Hair_Common_Settings_SkinShader
		material_groups = [
			{
				materials = [
					F_Clsc_Hair_BlFro_base
					F_Clsc_Hair_BlFro_alpha
				]
				shader = $cas_shader_skin
			}
		]
		hat_hair = F_Clsc_HatHair_BlFro
		acc_skeleton = `skeletons/Skel_F_Clsc_Hair_BlFro`
		acc_ragdoll = `Ragdolls/CAR/Female/Clsc/Rag_F_Clsc_Hair_BlFro`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			`Classic	Rock`
			rock
		]
		random_weight = 0.5
	}
	{
		desc_id = F_Clsc_Hair_Farah
		frontend_desc = qs(0x728be496)
		mesh = `models/CAR/Female/F_Clsc_Hair_Farah`
		deform_mesh = `models/CAR/Female/F_Clsc_Hair_Farah_def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Clsc_Hair_Farah_hair
				]
				shader = $cas_shader_hair
			}
		]
		hat_hair = F_Clsc_HatHair_Farah
		acc_skeleton = `skeletons/Skel_F_Clsc_Hair_Farah`
		acc_ragdoll = `Ragdolls/CAR/Female/Clsc/Rag_F_Clsc_Hair_Farah`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			`Classic	Rock`
			Pop
		]
	}
	{
		desc_id = F_Glam_Hair_Seagull
		frontend_desc = qs(0xa41beba1)
		mesh = `models/CAR/Female/F_Glam_Hair_Seagull`
		deform_mesh = `models/CAR/Female/F_Glam_Hair_Seagull_def`
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Glam_HatHair_Seagull
		acc_skeleton = `skeletons/Skel_F_Glam_Hair_Seagull`
		acc_ragdoll = `Ragdolls/CAR/Female/Glam/Rag_F_Glam_Hair_Seagull`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			`Glam	Rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Goth_Hair_BangsLong
		frontend_desc = qs(0x9e84e518)
		mesh = `models/CAR/Female/F_GOTH_Hair_BangsLong`
		deform_mesh = `models/CAR/Female/F_Goth_Hair_BangsLong_Def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Goth_Hair01_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Goth_Hair01_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0x30f6b0fa)
			}
		]
		hat_hair = F_Goth_HatHair_BangsLong
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_BangsLong`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_BangsLong`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Goth
		]
		random_weight = 1.0
	}
	{
		desc_id = F_Goth_Hair_Dreads
		frontend_desc = qs(0xf8c444f0)
		mesh = `models/CAR/Female/F_Goth_Hair_Dreads`
		deform_mesh = `models/CAR/Female/F_Goth_Hair_Dreads_def`
		material_groups = [
			{
				materials = [
					F_Goth_Hair_dreads_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xdaa67e9a)
			}
		]
		hat_hair = F_Goth_HatHair_Dreads
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_Dreads`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_Dreads`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Goth
		]
		random_weight = 0.5
	}
	{
		desc_id = F_Goth_Hair_UpDo
		frontend_desc = qs(0x0fcbbbe1)
		mesh = `models/CAR/Female/F_Goth_Hair_UpDo`
		deform_mesh = `models/CAR/Female/F_Goth_Hair_UpDo_Def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Goth_Hair_Updo_hair
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Goth_Hair_Updo_vale
				]
				shader = $cas_shader_skin
				name = qs(0x85192032)
			}
		]
		hat_hair = F_Goth_HatHair_UpDo
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_UpDo`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_UpDo`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Goth
		]
		random_weight = 1.0
	}
	{
		desc_id = F_Goth_Hair_PndrClef
		frontend_desc = qs(0xe5ca8f32)
		mesh = `models/CAR/Female/F_Goth_Hair_PndrClef`
		deform_mesh = `models/CAR/Female/F_Goth_Hair_PndrClef_Def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Goth_Hair_PndrClef_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Goth_Hair_PndrClef_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x6387b943)
			}
		]
		hat_hair = F_Goth_HatHair_PndrClef
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_PndrClef`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_PndrClef`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Goth
		]
		random_weight = 0.5
	}
	{
		desc_id = F_Goth_Hair_2Tone
		frontend_desc = qs(0xe41cbf71)
		mesh = `models/CAR/Female/F_Goth_Hair_2Tone`
		deform_mesh = `models/CAR/Female/F_Goth_Hair_2Tone_Def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Goth_Hair_2Tone_Primary
				]
				shader = $cas_shader_hair_masked1
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Goth_Hair_2Tone_Primary
				]
				shader = $cas_shader_skin_masked2
				name = qs(0x6c3a1d9c)
			}
		]
		hat_hair = F_Goth_HatHair_2Tone
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_2Tone`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_2Tone`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Goth
			`Black	Metal`
		]
	}
	{
		desc_id = F_Goth_Hair_PndrCrow
		frontend_desc = qs(0xdb1ea893)
		mesh = `models/CAR/Female/F_Goth_Hair_PndrCrow`
		deform_mesh = `models/CAR/Female/F_Goth_Hair_PndrCrow_Def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Goth_Hair_PndrCrow_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Goth_Hair_PndrCrow_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0x30f6b0fa)
			}
			{
				materials = [
					F_Goth_Hair_PndrCrow_Tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x4c7bc1e4)
			}
		]
		hat_hair = F_Goth_HatHair_PndrCrow
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_PndrCrow`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_PndrCrow`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Goth
		]
		random_weight = 1.0
	}
	{
		desc_id = F_Goth_Hair_PndrTubes
		frontend_desc = qs(0xcb26fd1a)
		mesh = `models/CAR/Female/F_Goth_Hair_PndrTubes`
		deform_mesh = `models/CAR/Female/F_Goth_Hair_PndrTubes_Def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Goth_Hair_PndrTubes_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Goth_Hair_PndrTubes_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0x30f6b0fa)
			}
			{
				materials = [
					F_Goth_Hair_PndrTubes_TUBE1
				]
				shader = $cas_shader_skin
				name = qs(0x6e303558)
			}
			{
				materials = [
					F_Goth_Hair_PndrTubes_TUBE2
				]
				shader = $cas_shader_skin
				name = qs(0x12511083)
			}
			{
				materials = [
					F_Goth_Hair_PndrTubes_FOAM1
				]
				shader = $cas_shader_skin
				name = qs(0x4e7cc06d)
			}
			{
				materials = [
					F_Goth_Hair_PndrTubes_FOAM2
				]
				shader = $cas_shader_skin
				name = qs(0x321de5b6)
			}
		]
		hat_hair = F_Goth_HatHair_PndrTubes
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_PndrTubes`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_PndrTubes`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Goth
		]
		random_weight = 0.5
	}
	{
		desc_id = F_Goth_Hair_Pandora5
		frontend_desc = qs(0xcf38490c)
		mesh = `models/CAR/Female/F_Goth_Hair_Pandora5`
		deform_mesh = `models/CAR/Female/F_Goth_Hair_Pandora5_def`
		material_groups = [
			{
				materials = [
					F_Goth_Hair_Pandora5_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Goth_Hair_Pandora5_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd146e2ed)
			}
		]
		hat_hair = F_Goth_HatHair_Pandora5
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_Pandora5`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_Pandora5`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Goth
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Metl_Hair_MidStrt
		frontend_desc = qs(0xd59055e8)
		mesh = `models/CAR/Female/F_Metl_Hair_MidStrt`
		deform_mesh = `models/CAR/Female/F_Metl_Hair_MidStrt_def`
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Metl_HatHair_MidStrt
		acc_skeleton = `skeletons/Skel_F_Metl_Hair_MidStrt`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Hair_MidStrt`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			`Heavy	Metal`
			Pop
		]
	}
	{
		desc_id = F_Metl_Hair_Pony
		frontend_desc = qs(0xedad6688)
		mesh = `models/CAR/Female/F_Metl_Hair_Pony`
		deform_mesh = `models/CAR/Female/F_Metl_Hair_Pony_def`
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Metl_HatHair_pony
		material_groups = [
			{
				materials = [
					F_Metl_Hair_Ponytail_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Metl_Hair_Ponytail_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0x30f6b0fa)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Metl_Hair_Pony`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Hair_Pony`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
		]
		genre = [
			`Heavy	Metal`
			Pop
		]
	}
	{
		desc_id = F_Metl_Hair_Skunk
		frontend_desc = qs(0xcf6e0971)
		mesh = `models/CAR/Female/F_Metl_Hair_Skunk`
		deform_mesh = `models/CAR/Female/F_Metl_Hair_Skunk_def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Metl_Hair_Skunk_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Metl_Hair_Skunk_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0xbbaf5fd1)
			}
		]
		hat_hair = F_Metl_HatHair_Skunk
		acc_skeleton = `skeletons/Skel_F_Metl_Hair_Skunk`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Hair_Skunk`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
		]
		genre = [
			`Heavy	Metal`
		]
		random_weight = 0.75
	}
	{
		desc_id = F_Metl_Hair_Twisty
		frontend_desc = qs(0x0e45e013)
		mesh = `models/CAR/Female/F_Metl_Hair_Twisty`
		deform_mesh = `models/CAR/Female/F_Metl_Hair_Twisty_def`
		material_groups = [
			{
				materials = [
					F_Metl_Hair_Twisty_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Metl_Hair_Twisty_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0xbbaf5fd1)
			}
		]
		chosen_materials = {
			material1 = blue_1
			material2 = grey_2
		}
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Metl_HatHair_Twisty
		acc_skeleton = `skeletons/Skel_F_Metl_Hair_Twisty`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Hair_Twisty`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			`Heavy	Metal`
			`Glam	Rock`
		]
	}
	{
		desc_id = F_Pop_Hair_Fergie
		frontend_desc = qs(0xfbb46fb6)
		mesh = `models/CAR/Female/F_Pop_Hair_Fergie`
		deform_mesh = `models/CAR/Female/F_Pop_Hair_Fergie_Def`
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Pop_HatHair_Fergie
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Fergie`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Fergie`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Pop
		]
		random_weight = 0.7
	}
	{
		desc_id = F_Pop_Hair_Midori
		frontend_desc = qs(0x4c47fb49)
		mesh = `models/CAR/Female/F_Pop_Hair_Midori`
		deform_mesh = `models/CAR/Female/F_Pop_Hair_Midori_Def`
		material_groups = [
			{
				materials = [
					Pop_MidoriHair_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					Pop_MidoriHair_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd146e2ed)
			}
		]
		hat_hair = F_Pop_HatHair_Midori
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Midori`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Midori`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Pop
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Pop_Hair_Hayley
		frontend_desc = qs(0x00c0dae4)
		mesh = `models/CAR/Female/F_Pop_Hair_Hayley`
		deform_mesh = `models/CAR/Female/F_Pop_Hair_Hayley_Def`
		materials = [
			F_Pop_Hair_Hayley_Primary
		]
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Pop_HatHair_Hayley
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Hayley`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Hayley`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Pop
			rock
		]
		random_weight = 0.7
	}
	{
		desc_id = F_Pop_Hair_Midori01
		frontend_desc = qs(0x5695a80e)
		mesh = `models/CAR/Female/F_Pop_Hair_Midori01`
		deform_mesh = `models/CAR/Female/F_Pop_Hair_Midori01_DEF`
		materials = [
			F_Pop_Hair_Midori01_01
		]
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Pop_HatHair_Midori01
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Midori01`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Midori01`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Pop
		]
		random_weight = 0.2
	}
	{
		desc_id = F_Pop_Hair_Midori02
		frontend_desc = qs(0x793cf118)
		mesh = `models/CAR/Female/F_Pop_Hair_Midori02`
		deform_mesh = `models/CAR/Female/F_Pop_Hair_Midori02_DEF`
		materials = [
			F_Pop_Hair_Midori02_01
		]
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Pop_HatHair_Midori02
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Midori02`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Midori02`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Pop
		]
		random_weight = 0.5
	}
	{
		desc_id = F_Pop_Hair_Midori03
		frontend_desc = qs(0x556ea3d7)
		mesh = `models/CAR/Female/F_Pop_Hair_Midori03`
		deform_mesh = `models/CAR/Female/F_Pop_Hair_Midori03_DEF`
		materials = [
			F_Pop_Hair_Midori03_01
			F_Pop_Hair_Midori03_02
		]
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Pop_HatHair_Midori03
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Midori03`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Midori03`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Pop
		]
		random_weight = 1.0
	}
	{
		desc_id = F_Pop_Hair_Midori04
		frontend_desc = qs(0xecf288ba)
		mesh = `models/CAR/Female/F_Pop_Hair_Midori04`
		deform_mesh = `models/CAR/Female/F_Pop_Hair_Midori04_DEF`
		materials = [
			F_Pop_Hair_Midori04_01
		]
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Pop_HatHair_Midori04
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Midori04`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Midori04`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Pop
		]
		random_weight = 0.7
	}
	{
		desc_id = F_Punk_Hair_Downhawk
		frontend_desc = qs(0x5febcb62)
		mesh = `models/CAR/Female/F_Punk_Hair_Downhawk`
		deform_mesh = `models/CAR/Female/F_Punk_Hair_Downhawk_def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Punk_Hair_Downhawk_Hair
					F_Punk_Hair_Downhawk_Hair02
					F_Punk_Hair_Downhawk_Hair03
				]
				shader = $cas_shader_hair
			}
		]
		hat_hair = F_Punk_HatHair_Downhawk
		acc_skeleton = `skeletons/Skel_F_Punk_Hair_Downhawk`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Hair_Downhawk`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
		]
		genre = [
			Punk
		]
		random_weight = 0.7
	}
	{
		desc_id = F_Punk_Hair_Hawk
		frontend_desc = qs(0x29146d81)
		mesh = `models/CAR/Female/F_Punk_Hair_Hawk`
		deform_mesh = `models/CAR/Female/F_Punk_Hair_Hawk_def`
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Punk_HatHair_Hawk
		acc_skeleton = `skeletons/Skel_F_Punk_Hair_Hawk`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Hair_Hawk`
		acc_bones = [
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Punk
		]
		random_weight = 0.5
	}
	{
		desc_id = F_Punk_Hair_JudyNails1
		frontend_desc = qs(0xdc357545)
		mesh = `models/CAR/Female/F_Punk_Hair_JudyNails1`
		deform_mesh = `models/CAR/Female/F_Punk_Hair_JudyNails1_def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Punk_Hair_JudyNails1_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Punk_Hair_JudyNails1_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0xbbaf5fd1)
			}
		]
		hat_hair = F_Punk_HatHair_JudyNails1
		acc_skeleton = `skeletons/Skel_F_Punk_Hair_JudyNails1`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Hair_JudyNails1`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		chosen_materials = {
			material1 = red_1
			material2 = purple_blue_1
		}
		genre = [
			Punk
		]
		random_weight = 0.8
	}
	{
		desc_id = F_Punk_Hair_Judy5
		frontend_desc = qs(0x4a286574)
		mesh = `models/CAR/Female/F_Punk_Hair_Judy5`
		deform_mesh = `models/CAR/Female/F_Punk_Hair_Judy5_def`
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Punk_hatHair_Judy5
		acc_skeleton = `skeletons/Skel_F_Punk_Hair_Judy5`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Hair_Judy5`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		material_groups = [
			{
				materials = [
					F_Punk_Hair_Judy5_Primary
					F_Punk_Hair_Judy5_Primary2
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Punk_Hair_Judy5_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0xbbaf5fd1)
			}
		]
		genre = [
			Punk
		]
	}
	{
		desc_id = F_Rock_Hair_Casey5
		frontend_desc = qs(0xeab19e97)
		mesh = `models/CAR/Female/F_Rock_Hair_Casey5`
		deform_mesh = `models/CAR/Female/F_Rock_Hair_Casey5_def`
		$CAS_Female_Hair_Common_Settings
		materials = [
			F_Rock_Hair_Casey5_Primary
		]
		hat_hair = F_Rock_HatHair_Casey5
		genre = [
			rock
		]
		random_weight = 0.5
	}
	{
		desc_id = F_Rock_Hair_Emo
		frontend_desc = qs(0xaeec633a)
		mesh = `models/CAR/Female/F_Rock_Hair_Emo`
		deform_mesh = `models/CAR/Female/F_Rock_Hair_Emo_def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Rock_Hair_Emo_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Rock_Hair_Emo_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0xbbaf5fd1)
			}
		]
		hat_hair = F_Rock_HatHair_Emo
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_Emo`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_Emo`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			rock
			Pop
		]
	}
	{
		desc_id = F_Rock_Hair_ECPony
		frontend_desc = qs(0xb05dc5f5)
		mesh = `models/CAR/Female/F_Rock_Hair_ECPony`
		deform_mesh = `models/CAR/Female/F_Rock_Hair_ECPony_def`
		$CAS_Female_Hair_Common_Settings
		materials = [
			F_Rock_Hair_ECPony_Primary
		]
		hat_hair = F_Rock_HatHair_ECPony
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_ECPony`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_ECPony`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			rock
			Pop
		]
	}
	{
		desc_id = F_Rock_Hair_C_Mid
		frontend_desc = qs(0xa712a311)
		mesh = `models/CAR/Female/F_Rock_Hair_C_Mid`
		deform_mesh = `models/CAR/Female/F_Rock_Hair_C_Mid_def`
		$CAS_Female_Hair_Common_Settings
		materials = [
			F_Rock_Hair_C_Mid_Primary
		]
		hat_hair = F_Rock_HatHair_C_Mid
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_C_Mid`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_C_Mid`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			rock
			`Heavy	Metal`
		]
	}
	{
		desc_id = F_Rock_Hair_CBob
		frontend_desc = qs(0xb77163fa)
		mesh = `models/CAR/Female/F_Rock_Hair_CBob`
		deform_mesh = `models/CAR/Female/F_Rock_Hair_CBob_def`
		$CAS_Female_Hair_Common_Settings
		materials = [
			F_Rock_Hair_CBob_Primary
		]
		hat_hair = F_Rock_HatHair_CBob
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_CBob`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_CBobd`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			rock
			`Heavy	Metal`
			Pop
			`Glam	Rock`
		]
	}
	{
		desc_id = F_Rock_Hair_C2short
		frontend_desc = qs(0xe795b7c7)
		mesh = `models/CAR/Female/F_Rock_Hair_C2short`
		deform_mesh = `models/CAR/Female/F_Rock_Hair_C2short_DEF`
		$CAS_Female_Hair_Common_Settings
		materials = [
			F_Rock_Hair_C2short_Primary
		]
		hat_hair = F_Rock_HatHair_C2short
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_C2short`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_C2short`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			rock
		]
		random_weight = 0.35000002
	}
	{
		desc_id = F_Rock_Hair_Short
		frontend_desc = qs(0x99c10acb)
		mesh = `models/CAR/Female/F_Rock_Hair_Short`
		deform_mesh = `models/CAR/Female/F_Rock_Hair_Short_def`
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Rock_HatHair_Short
		acc_skeleton = `skeletons/Skel_F_Rock_Head_Hair_Short`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Head_Hair_Short`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
		]
		genre = [
			rock
			Pop
		]
	}
	{
		desc_id = F_Rock_Hair_Wavy
		frontend_desc = qs(0x66b782c7)
		mesh = `models/CAR/Female/F_Rock_Hair_Wavy`
		deform_mesh = `models/CAR/Female/F_Rock_Hair_Wavy_def`
		$CAS_Female_Hair_Common_Settings
		hat_hair = F_Rock_HatHair_Wavy
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_Wavy`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_Wavy`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			rock
			`Classic	Rock`
		]
	}
	{
		desc_id = F_Funpart_Hair_Octo
		frontend_desc = qs(0x5738bc5c)
		mesh = `models/CAR/Female/F_Funpart_Hair_Octo`
		deform_mesh = `models/CAR/Female/F_Funpart_Hair_Octo_DEF`
		hat_hair = F_Funpart_HatHair_Octo
		acc_skeleton = `skeletons/Skel_F_Funpart_Hair_Octo`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Funpart_Hair_Octo`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Funpart_Hair_Slime
		frontend_desc = qs(0xdbfe1db5)
		mesh = `models/CAR/Female/F_Funpart_Hair_Slime`
		deform_mesh = `models/CAR/Female/F_Funpart_Hair_Slime_DEF`
		hat_hair = F_Funpart_HatHair_Slime
		materials = [
			F_Funpart_Hair_Slime_Primary
		]
		acc_skeleton = `skeletons/Skel_F_Funpart_Hair_Slime`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Funpart_Hair_Slime`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		random_weight = 0.0
		locked
	}
]
CAS_Female_Hat_Hair_Common_Settings = {
	modify_all_materials
	shader = $cas_shader_hair
}
CAS_Female_Hat_Hair_Common_Settings_SkinShader = {
	modify_all_materials
	shader = $cas_shader_skin
}
CAS_Female_Hat_Hair = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
	}
	{
		desc_id = F_Bmtl_HatHair_OverEyes
		mesh = `models/CAR/Female/F_Bmtl_HatHair_OverEyes`
		deform_mesh = `models/CAR/Female/F_Bmtl_HatHair_OverEyes_def`
		$CAS_Female_Hat_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Bmtl_Hair_OverEyes_Hair
				]
			}
		]
		acc_skeleton = `skeletons/Skel_F_Bmtl_Hair_OverEyes`
		acc_ragdoll = `Ragdolls/CAR/Female/Bmtl/Rag_F_Bmtl_Hair_OverEyes`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Bmtl_HatHair_Straight
		mesh = `models/CAR/Female/F_Bmtl_HatHair_Straight`
		deform_mesh = `models/CAR/Female/F_Bmtl_HatHair_Straight_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Bmtl_Hair_Straight`
		acc_ragdoll = `Ragdolls/CAR/Female/Bmtl/Rag_F_Bmtl_Hair_Straight`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Clsc_HatHair_BlFro
		mesh = `models/CAR/Female/F_Clsc_HatHair_BlFro`
		deform_mesh = `models/CAR/Female/F_Clsc_HatHair_BlFro_def`
		$CAS_Female_Hair_Common_Settings_SkinShader
		acc_skeleton = `skeletons/Skel_F_Clsc_Hair_BlFro`
		acc_ragdoll = `Ragdolls/CAR/Female/Clsc/Rag_F_Clsc_Hair_BlFro`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Clsc_HatHair_Farah
		mesh = `models/CAR/Female/F_Clsc_HatHair_Farah`
		deform_mesh = `models/CAR/Female/F_Clsc_HatHair_Farah_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Clsc_Hair_Farah`
		acc_ragdoll = `Ragdolls/CAR/Female/Clsc/Rag_F_Clsc_Hair_Farah`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Glam_HatHair_Seagull
		mesh = `models/CAR/Female/F_Glam_HatHair_Seagull`
		deform_mesh = `models/CAR/Female/F_Glam_HatHair_Seagull_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Glam_Hair_Seagull`
		acc_ragdoll = `Ragdolls/CAR/Female/Glam/Rag_F_Glam_Hair_Seagull`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Goth_HatHair_BangsLong
		mesh = `models/CAR/Female/F_Goth_HatHair_BangsLong`
		deform_mesh = `models/CAR/Female/F_Goth_HatHair_BangsLong_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_BangsLong`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_BangsLong`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Goth_HatHair_Dreads
		mesh = `models/CAR/Female/F_Goth_HatHair_Dreads`
		deform_mesh = `models/CAR/Female/F_Goth_HatHair_Dreads_def`
		$CAS_Female_Hat_Hair_Common_Settings_SkinShader
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_Dreads`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_Dreads`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Goth_HatHair_UpDo
		mesh = `models/CAR/Female/F_Goth_HatHair_UpDo`
		deform_mesh = `models/CAR/Female/F_Goth_HatHair_UpDo_def`
		$CAS_Female_Hat_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Goth_Hair_Updo_hair
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					F_Goth_Hair_Updo_vale
				]
				shader = $cas_shader_skin
			}
		]
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_UpDo`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_UpDo`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Goth_HatHair_PndrClef
		mesh = `models/CAR/Female/F_Goth_HatHair_PndrClef`
		deform_mesh = `models/CAR/Female/F_Goth_HatHair_PndrClef_def`
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_PndrClef`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_PndrClef`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		$CAS_Female_Hat_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Goth_Hair_PndrClef_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
		]
	}
	{
		desc_id = F_Goth_HatHair_2Tone
		mesh = `models/CAR/Female/F_Goth_HatHair_2Tone`
		deform_mesh = `models/CAR/Female/F_Goth_HatHair_2Tone_DEF`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Goth_Hair_2Tone_Primary
				]
				shader = $cas_shader_hair_masked1
			}
			{
				materials = [
					F_Goth_Hair_2Tone_Primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_2Tone`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_2Tone`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Goth_HatHair_PndrCrow
		mesh = `models/CAR/Female/F_Goth_HatHair_PndrCrow`
		deform_mesh = `models/CAR/Female/F_Goth_HatHair_PndrCrow_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_PndrCrow`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_PndrCrow`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		material_groups = [
			{
				materials = [
					F_Goth_Hair_PndrCrow_Primary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					F_Goth_Hair_PndrCrow_Secondary
				]
				shader = $cas_shader_hair
			}
		]
	}
	{
		desc_id = F_Goth_HatHair_PndrTubes
		mesh = `models/CAR/Female/F_Goth_HatHair_PndrTubes`
		deform_mesh = `models/CAR/Female/F_Goth_HatHair_PndrTubes_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_PndrTubes`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_PndrTubes`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		material_groups = [
			{
				materials = [
					F_Goth_Hair_PndrTubes_Primary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					F_Goth_Hair_PndrTubes_Secondary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					F_Goth_Hair_PndrTubes_FOAM1
				]
				shader = $cas_shader_skin
			}
		]
	}
	{
		desc_id = F_Goth_HatHair_Pandora5
		mesh = `models/CAR/Female/F_Goth_HatHair_Pandora5`
		deform_mesh = `models/CAR/Female/F_Goth_HatHair_Pandora5_def`
		acc_skeleton = `skeletons/Skel_F_Goth_Hair_Pandora5`
		acc_ragdoll = `Ragdolls/CAR/Female/Goth/Rag_F_Goth_Hair_Pandora5`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		material_groups = [
			{
				materials = [
					F_Goth_Hair_Pandora5_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					F_Goth_Hair_Pandora5_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd146e2ed)
			}
		]
	}
	{
		desc_id = F_Metl_HatHair_MidStrt
		mesh = `models/CAR/Female/F_Metl_HatHair_MidStrt`
		deform_mesh = `models/CAR/Female/F_Metl_HatHair_MidStrt_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Metl_Hair_MidStrt`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Hair_MidStrt`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Metl_HatHair_pony
		mesh = `models/CAR/Female/F_Metl_HatHair_Pony`
		deform_mesh = `models/CAR/Female/F_Metl_HatHair_Pony_def`
		$CAS_Female_Hat_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Metl_Hair_Ponytail_Primary
				]
				shader = $cas_shader_hair
				name = qs(0x96d729f3)
			}
			{
				materials = [
					F_Metl_Hair_Ponytail_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0x667bb798)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Metl_Hair_Pony`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Hair_Pony`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
		]
	}
	{
		desc_id = F_Metl_HatHair_Skunk
		mesh = `models/CAR/Female/F_Metl_HatHair_Skunk`
		deform_mesh = `models/CAR/Female/F_Metl_HatHair_Skunk_def`
		$CAS_Female_Hat_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Metl_Hair_Skunk_Primary
				]
				shader = $cas_shader_hair
				name = qs(0x96d729f3)
			}
			{
				materials = [
					F_Metl_Hair_Skunk_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0x2201271b)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Metl_Hair_Skunk`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Hair_Skunk`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
		]
	}
	{
		desc_id = F_Metl_HatHair_Twisty
		frontend_desc = qs(0x0e45e013)
		mesh = `models/CAR/Female/F_Metl_HatHair_Twisty`
		deform_mesh = `models/CAR/Female/F_Metl_HatHair_Twisty_def`
		materials = [
			F_Metl_Hair_Twisty_Primary
			F_Metl_Hair_Twisty_Secondary
		]
		chosen_materials = {
			material1 = blue_1
			material2 = grey_2
		}
		$CAS_Female_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Metl_Hair_Twisty`
		acc_ragdoll = `Ragdolls/CAR/Female/Metl/Rag_F_Metl_Hair_Twisty`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			`Heavy	Metal`
		]
	}
	{
		desc_id = F_Pop_HatHair_Hayley
		mesh = `models/CAR/Female/F_Pop_HatHair_Hayley`
		deform_mesh = `models/CAR/Female/F_Pop_HatHair_Hayley_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Hayley`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Hayley`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Pop_HatHair_Fergie
		mesh = `models/CAR/Female/F_Pop_HatHair_Fergie`
		deform_mesh = `models/CAR/Female/F_Pop_HatHair_Fergie_Def`
		$CAS_Female_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Fergie`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Fergie`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Pop_HatHair_Midori
		mesh = `models/CAR/Female/F_Pop_HatHair_Midori`
		deform_mesh = `models/CAR/Female/F_Pop_HatHair_Midori_Def`
		material_groups = [
			{
				materials = [
					Pop_MidoriHair_Primary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					Pop_MidoriHair_Secondary
				]
				shader = $cas_shader_skin
			}
		]
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Midori`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Midori`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Pop_HatHair_Midori01
		mesh = `models/CAR/Female/F_Pop_HatHair_Midori01`
		deform_mesh = `models/CAR/Female/F_Pop_HatHair_Midori01_DEF`
		$CAS_Female_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Midori01`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Midori01`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Pop_HatHair_Midori02
		mesh = `models/CAR/Female/F_Pop_HatHair_Midori02`
		deform_mesh = `models/CAR/Female/F_Pop_HatHair_Midori02_def`
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Midori02`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Midori02`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		$CAS_Female_Hair_Common_Settings
	}
	{
		desc_id = F_Pop_HatHair_Midori03
		mesh = `models/CAR/Female/F_Pop_HatHair_Midori03`
		deform_mesh = `models/CAR/Female/F_Pop_HatHair_Midori03_def`
		$CAS_Female_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Midori03`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Midori03`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Pop_HatHair_Midori04
		mesh = `models/CAR/Female/F_Pop_HatHair_Midori04`
		deform_mesh = `models/CAR/Female/F_Pop_HatHair_Midori04_DEF`
		$CAS_Female_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Pop_Hair_Midori04`
		acc_ragdoll = `Ragdolls/CAR/Female/Pop/Rag_F_Pop_Hair_Midori04`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Punk_HatHair_Downhawk
		mesh = `models/CAR/Female/F_Punk_HatHair_Downhawk`
		deform_mesh = `models/CAR/Female/F_Punk_HatHair_Downhawk_def`
		$CAS_Female_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Punk_Hair_Downhawk`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Hair_Downhawk`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
		]
	}
	{
		desc_id = F_Punk_HatHair_Hawk
		mesh = `models/CAR/Female/F_Punk_HatHair_hawk`
		deform_mesh = `models/CAR/Female/F_Punk_HatHair_hawk_def`
		$CAS_Female_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Punk_Hair_Downhawk`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Hair_Downhawk`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
		]
	}
	{
		desc_id = F_Punk_HatHair_JudyNails1
		mesh = `models/CAR/Female/F_Punk_HatHair_JudyNails1`
		deform_mesh = `models/CAR/Female/F_Punk_HatHair_JudyNails1_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Punk_Hair_JudyNails1`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Hair_JudyNails1`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		materials = [
			F_Punk_Hair_JudyNails1_Primary
			F_Punk_Hair_JudyNails1_Secondary
		]
	}
	{
		desc_id = F_Punk_HatHair_Ponytail
		mesh = `models/CAR/Female/F_Punk_HatHair_Ponytail`
		deform_mesh = `models/CAR/Female/F_Punk_HatHair_Ponytail_def`
		$CAS_Female_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Punk_Hair_Ponytail`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Hair_Ponytail`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Punk_hatHair_Judy5
		mesh = `models/CAR/Female/F_Punk_HatHair_Judy5`
		deform_mesh = `models/CAR/Female/F_Punk_HatHair_Judy5_def`
		$CAS_Female_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					F_Punk_Hair_Judy5_Primary
					F_Punk_Hair_Judy5_Primary2
				]
				shader = $cas_shader_hair
				name = qs(0x5b41be49)
			}
			{
				materials = [
					F_Punk_Hair_Judy5_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0x68c22467)
			}
		]
		acc_skeleton = `skeletons/Skel_F_Punk_Hair_Judy5`
		acc_ragdoll = `Ragdolls/CAR/Female/Punk/Rag_F_Punk_Hair_Judy5`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Rock_HatHair_Casey5
		mesh = `models/CAR/Female/F_Rock_HatHair_Casey5`
		deform_mesh = `models/CAR/Female/F_Rock_HatHair_Casey5_def`
		$CAS_Female_Hair_Common_Settings
		materials = [
			F_Rock_Hair_Casey5_Primary
		]
	}
	{
		desc_id = F_Rock_HatHair_Emo
		mesh = `models/CAR/Female/F_Rock_HatHair_Emo`
		deform_mesh = `models/CAR/Female/F_Rock_HatHair_Emo_def`
		$CAS_Female_Hair_Common_Settings
		materials = [
			F_Rock_Hair_Emo_Primary
			F_Rock_Hair_Emo_Secondary
		]
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_Emo`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_Emo`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Rock_HatHair_Short
		mesh = `models/CAR/Female/F_Rock_HatHair_Short`
		deform_mesh = `models/CAR/Female/F_Rock_HatHair_Short_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Rock_Head_Hair_Short`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Head_Hair_Short`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
		]
	}
	{
		desc_id = F_Rock_HatHair_Wavy
		mesh = `models/CAR/Female/F_Rock_HatHair_Wavy`
		deform_mesh = `models/CAR/Female/F_Rock_HatHair_Wavy_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_Wavy`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_Wavy`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Rock_HatHair_Bass
		mesh = `models/CAR/Female/F_Rock_HatHair_Bass`
		deform_mesh = `models/CAR/Female/F_Rock_HatHair_Bass_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_Bass`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_Bass`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Rock_HatHair_CBob
		mesh = `models/CAR/Female/F_Rock_HatHair_CBob`
		deform_mesh = `models/CAR/Female/F_Rock_HatHair_CBob_def`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_CBob`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_CBobd`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Rock_HatHair_C2short
		mesh = `models/CAR/Female/F_Rock_HatHair_C2short`
		deform_mesh = `models/CAR/Female/F_Rock_HatHair_C2short_DEF`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_C2short`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_C2short`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Rock_HatHair_C_Mid
		mesh = `models/CAR/Female/F_Rock_HatHair_C_Mid`
		deform_mesh = `models/CAR/Female/F_Rock_HatHair_C_Mid_DEF`
		$CAS_Female_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_C_Mid`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_C_Mid`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Rock_HatHair_ECPony
		mesh = `models/CAR/Female/F_Rock_HatHair_ECPony`
		deform_mesh = `models/CAR/Female/F_Rock_HatHair_ECPony_DEF`
		$CAS_Female_Hair_Common_Settings
		materials = [
			F_Rock_Hair_ECPony_Primary
		]
		acc_skeleton = `skeletons/Skel_F_Rock_Hair_ECPony`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Rock_Hair_ECPony`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			rock
		]
	}
	{
		desc_id = F_Funpart_HatHair_Octo
		mesh = `models/CAR/Female/F_Funpart_HatHair_Octo`
		deform_mesh = `models/CAR/Female/F_Funpart_HatHair_Octo_DEF`
		acc_skeleton = `skeletons/Skel_F_Funpart_Hair_Octo`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Funpart_Hair_Octo`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = F_Funpart_HatHair_Slime
		mesh = `models/CAR/Female/F_Funpart_Hair_Slime`
		deform_mesh = `models/CAR/Female/F_Funpart_Hair_Slime_DEF`
		materials = [
			F_Funpart_Hair_Slime_Primary
		]
		acc_skeleton = `skeletons/Skel_F_Funpart_Hair_Slime`
		acc_ragdoll = `Ragdolls/CAR/Female/Rock/Rag_F_Funpart_Hair_Slime`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
]
CAS_Female_Hat = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
	{
		desc_id = F_Bmtl_Hat_SkullHelmet
		frontend_desc = qs(0xfbbb986e)
		mesh = `models/CAR/Female/F_Bmtl_Hat_SkullHelmet`
		deform_mesh = `models/CAR/Female/F_Bmtl_Hat_SkullHelmet_def`
		material_groups = [
			{
				materials = [
					F_Bmtl_Hat_SkullHelmet_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					F_Bmtl_Hat_SkullHelmet_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x60b5b214)
			}
		]
		hat_hair = None
		genre = [
			`Black	Metal`
		]
		random_weight = 0.05
		locked
	}
	{
		desc_id = F_Metl_Hat_Studs
		frontend_desc = qs(0x3e943475)
		mesh = `models/CAR/Female/F_Metl_Hat_Studs`
		deform_mesh = `models/CAR/Female/F_Metl_Hat_Studs_def`
		genre = [
			`Black	Metal`
			`Heavy	Metal`
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Metl_Acc_Horn
		frontend_desc = qs(0x4368b0cb)
		mesh = `models/CAR/Female/F_Metl_Acc_Horn`
		deform_mesh = `models/CAR/Female/F_Metl_Acc_Horn_def`
		materials = [
			F_Metl_Acc_Horn_Primary
		]
		genre = [
			`Heavy	Metal`
		]
		hat_hair = original_hair
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Pop_Hat_Bucket
		frontend_desc = qs(0xff1d662e)
		mesh = `models/CAR/Female/F_Pop_Hat_Bucket`
		deform_mesh = `models/CAR/Female/F_Pop_Hat_Bucket_def`
		material_groups = [
			{
				materials = [
					M_Pop_Hat_Bucket_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					M_Pop_Hat_Bucket_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xee3a510b)
			}
		]
		genre = [
			Pop
		]
		random_weight = 0.05
	}
	{
		desc_id = F_Pop_Head_WW2Helm
		frontend_desc = qs(0x3f2a64bc)
		mesh = `models/CAR/Female/F_Pop_Head_WW2Helm`
		deform_mesh = `models/CAR/Female/F_Pop_Head_WW2Helm_def`
		genre = [
			Punk
			`Heavy	Metal`
			Goth
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Pop_Head_WoolHat
		frontend_desc = qs(0xdb412f13)
		mesh = `models/CAR/Female/F_Pop_Head_WoolHat`
		deform_mesh = `models/CAR/Female/F_Pop_Head_WoolHat_def`
		materials = [
			F_Pop_WoolHat_WoolHat
		]
		genre = [
			Pop
		]
		random_weight = 0.025
	}
	{
		desc_id = F_Pop_Acc_Catears
		frontend_desc = qs(0x7c85e886)
		mesh = `models/CAR/Female/F_Pop_Acc_Catears`
		deform_mesh = `models/CAR/Female/F_Pop_Acc_Catears_def`
		material_groups = [
			{
				materials = [
					F_Pop_Acc_Catears_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xaeaba71b)
			}
			{
				materials = [
					F_Pop_Acc_Catears_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xd9f6ee9f)
			}
		]
		hat_hair = original_hair
		genre = [
			Pop
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Pop_Hat_Midori04
		frontend_desc = qs(0x090d3c06)
		mesh = `models/CAR/Female/F_Pop_Hat_Midori04`
		deform_mesh = `models/CAR/Female/F_Pop_Hat_Midori04_def`
		materials = [
			F_Pop_Hat_Midori04_01
		]
		genre = [
			Pop
		]
		polaroid = P_F_Pop_Hat_Midori04
		random_weight = 0.0
	}
	{
		desc_id = F_Rock_Hat_Cowboy
		frontend_desc = qs(0xe803c83b)
		mesh = `models/CAR/Female/F_Rock_Hat_Cowboy`
		deform_mesh = `models/CAR/Female/F_Rock_Hat_Cowboy_def`
		material_groups = [
			{
				materials = [
					F_Rock_Hat_Cowboy_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					F_Rock_Hat_Cowboy_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x55a35727)
			}
		]
		genre = [
			rock
		]
		random_weight = 0.025
	}
	{
		desc_id = F_Rock_Hat_Starpin
		frontend_desc = qs(0x627fba5a)
		mesh = `models/CAR/Female/F_Rock_Hat_Starpin`
		deform_mesh = `models/CAR/Female/F_Rock_Hat_Starpin_def`
		materials = [
			F_Rock_Hat_Starpin_Primary
		]
		genre = [
			rock
		]
		random_weight = 0.025
	}
	{
		desc_id = F_Clsc_Hat_Cptn
		frontend_desc = qs(0x815966f6)
		mesh = `models/CAR/Female/F_Clsc_Hat_Cptn`
		deform_mesh = `models/CAR/Female/F_Clsc_Hat_Cptn_def`
		genre = [
			`Classic	Rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = F_Clsc_Hat_Cowboy
		frontend_desc = qs(0xe7e12c49)
		mesh = `models/CAR/Female/F_Clsc_Hat_Cowboy`
		deform_mesh = `models/CAR/Female/F_Clsc_Hat_Cowboy_def`
		genre = [
			`Classic	Rock`
		]
		random_weight = 0.025
	}
	{
		desc_id = F_Clsc_Hat_Triangle
		frontend_desc = qs(0xd0fa14a6)
		mesh = `models/CAR/Female/F_Clsc_Hat_Triangle`
		deform_mesh = `models/CAR/Female/F_Clsc_Hat_Triangle_def`
		genre = [
			`Classic	Rock`
		]
		random_weight = 0.025
	}
	{
		desc_id = F_Goth_Hat_TopHat
		frontend_desc = qs(0xd9f3b456)
		mesh = `models/CAR/Female/F_Goth_Hat_TopHat`
		deform_mesh = `models/CAR/Female/F_Goth_Hat_TopHat_def`
		material_groups = [
			{
				materials = [
					M_Goth_Acc_TopHat_Primary
				]
				shader = $cas_shader_hair
				name = qs(0x4a6d745b)
			}
			{
				materials = [
					M_Goth_Acc_TopHat_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xee3a510b)
			}
		]
		genre = [
			Goth
		]
		random_weight = 0.025
	}
	{
		desc_id = F_Pop_Head_GasMask
		frontend_desc = qs(0x0039dd19)
		mesh = `models/CAR/Female/F_Pop_Head_GasMask`
		deform_mesh = `models/CAR/Female/F_Pop_Head_GasMask_def`
		materials = [
			M_Pop_Head_Gasmask_Mask
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Bmtl_Head_Viking
		frontend_desc = qs(0xbbf00af8)
		mesh = `models/CAR/Female/F_Bmtl_Hat_Viking`
		deform_mesh = `models/CAR/Female/F_Bmtl_Hat_Viking_def`
		genre = [
			`Black	Metal`
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Fun_Hat_EyeBall
		frontend_desc = qs(0x3b86ba16)
		mesh = `models/CAR/Female/F_Fun_Hat_EyeBall`
		deform_mesh = `models/CAR/Female/F_Fun_Hat_EyeBall_def`
		genre = [
			Goth
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Hat_Ninja_c1
		frontend_desc = qs(0x97d60449)
		mesh = `models/CAR/Female/F_Hat_Ninja_c1`
		deform_mesh = `models/CAR/Female/F_Hat_Ninja_c1_def`
		material_groups = [
			{
				materials = [
					M_Hat_Ninja_c1_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x24f7c8f6)
			}
			{
				materials = [
					M_Hat_Ninja_c1_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xf398865c)
			}
		]
		genre = [
			Goth
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Rock_hat_halo
		frontend_desc = qs(0x36f714a7)
		mesh = `models/CAR/Female/F_Rock_hat_halo`
		deform_mesh = `models/CAR/Female/F_Rock_hat_halo_def`
		hat_hair = original_hair
		genre = [
			rock
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = F_Fun_Hat_Chickenmask
		frontend_desc = qs(0x59a690d4)
		mesh = `models/CAR/Female/F_Fun_Hat_Chickenmask`
		genre = [
			Bmtl
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
]
CAS_Female_Facial_Hair = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
	}
]
CAS_Female_Age = [
	{
		desc_id = CAR_Female_Teen
		frontend_desc = qs(0xe40e025b)
	}
	{
		desc_id = CAR_Female_Mature
		random_weight = 0.0
		replace = `tex/models/Characters/car/female/car_female_head_n`
		with = `tex/models/Characters/Layers/CAR/Female/Age/CAR_Female_Age03_N`
		frontend_desc = qs(0xbe8a142d)
		in = CAS_Body
		in2 = CAS_Body
	}
	{
		desc_id = CAR_Female_Aged
		random_weight = 0.0
		replace = `tex/models/Characters/car/female/car_female_head_n`
		with = `tex/models/Characters/Layers/CAR/Female/Age/CAR_Female_Age04_N`
		frontend_desc = qs(0x1dd22d68)
		in = CAS_Body
		in2 = CAS_Body
	}
	{
		desc_id = CAR_Female_Old
		random_weight = 0.0
		replace = `tex/models/Characters/car/female/car_female_head_n`
		with = `tex/models/Characters/Layers/CAR/Female/Age/CAR_Female_Age05_N`
		frontend_desc = qs(0xc05200fd)
		in = CAS_Body
		in2 = CAS_Body
	}
]
CAS_Female_Teeth = [
	{
		desc_id = CAR_Female_teeth
		frontend_desc = qs(0x675459e3)
		mesh = `models/CAR/Female/CAR_Female_teeth`
		deform_mesh = `models/CAR/Female/CAR_Female_teeth_def`
	}
	{
		desc_id = CAR_Female_teeth01
		frontend_desc = qs(0x038dcbee)
		mesh = `models/CAR/Female/CAR_Female_teeth01`
		deform_mesh = `models/CAR/Female/CAR_Female_teeth01_def`
		random_weight = 0.0
	}
	{
		desc_id = CAR_Female_teeth02
		frontend_desc = qs(0x1a2ce811)
		mesh = `models/CAR/Female/CAR_Female_teeth02`
		deform_mesh = `models/CAR/Female/CAR_Female_teeth02_def`
		random_weight = 0.0
	}
	{
		desc_id = CAR_Female_teeth03
		frontend_desc = qs(0xd067d16e)
		mesh = `models/CAR/Female/CAR_Female_teeth03`
		deform_mesh = `models/CAR/Female/CAR_Female_teeth03_def`
		random_weight = 0.0
	}
]
