CAS_male_Eyebrows = [
	{
		desc_id = CAR_No_Brow
		frontend_desc = qs(0x9c1b5214)
		replace = `tex\models\Characters\CAR\Male\CAR_male_BROW_D`
		with = `tex\models\Characters\CAR\male\CAR_male_BROW_00_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Default_Brow
		frontend_desc = qs(0x675459e3)
	}
	{
		desc_id = CAR_Rounded
		frontend_desc = qs(0xf9ea62fa)
		replace = `tex\models\Characters\CAR\Male\CAR_male_BROW_D`
		with = `tex\models\Characters\CAR\Male\CAR_male_BROW_02_D`
		in = CAS_Body
	}
]
cas_male_hair_random_colors = [
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
]
CAS_Male_Hair_Common_Settings = {
	modify_all_materials
	shader = $cas_shader_hair
	random_colors = $cas_male_hair_random_colors
}
CAS_Male_Hair_Common_Settings_SkinShader = {
	modify_all_materials
	shader = $cas_shader_skin
	random_colors = $cas_male_hair_random_colors
}
CAS_Male_Hair = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 0.0
	}
	{
		desc_id = M_Clsc_Hair_George
		frontend_desc = qs(0xcf536075)
		mesh = `models/CAR/Male/M_Clsc_Hair_George`
		deform_mesh = `models/CAR/Male/M_Clsc_Hair_George_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Clsc_HatHair_George
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_George`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_George`
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
			Pop
		]
		hidden
	}
	{
		desc_id = M_Clsc_Hair_Contest
		frontend_desc = qs(0x0bb644b3)
		mesh = `models/CAR/Male/M_Clsc_Hair_Contest`
		deform_mesh = `models/CAR/Male/M_Clsc_Hair_Contest_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Clsc_HatHair_Contest
		random_weight = 0.0
		hidden
	}
	{
		desc_id = M_Bmtl_Hair_Straight
		frontend_desc = qs(0x295bdc1d)
		mesh = `models/CAR/Male/M_Bmtl_Hair_Straight`
		deform_mesh = `models/CAR/Male/M_Bmtl_Hair_Straight_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Bmtl_HatHair_Straight
		acc_skeleton = `skeletons/Skel_M_Bmtl_Hair_Straight`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Hair_Straight`
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
	}
	{
		desc_id = M_Bmtl_Hair_Lars_3
		frontend_desc = qs(0x47b5e332)
		mesh = `models/CAR/Male/M_Bmtl_Hair_Lars_3`
		deform_mesh = `models/CAR/Male/M_Bmtl_Hair_Lars_3_Def`
		hat_hair = M_Bmtl_HatHair_Lars_3
		$CAS_Male_Hair_Common_Settings_SkinShader
		material_groups = [
			{
				materials = [
					M_Bmtl_Hair_Lars_3_Primary
				]
				shader = $cas_shader_skin
			}
		]
		acc_skeleton = `skeletons/Skel_M_Bmtl_Hair_Lars_3`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Hair_Lars_3`
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
	}
	{
		desc_id = M_Bmtl_Hair_Lars4
		frontend_desc = qs(0xf01f6780)
		mesh = `models/CAR/Male/M_Bmtl_Hair_Lars4`
		deform_mesh = `models/CAR/Male/M_Bmtl_Hair_Lars4_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Bmtl_HatHair_Lars4
		acc_skeleton = `skeletons/Skel_M_Bmtl_Hair_Lars_4`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Hair_Lars_4`
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
	}
	{
		desc_id = M_Bmtl_Hair_Dread
		frontend_desc = qs(0x3d5f28b1)
		mesh = `models/CAR/Male/M_Bmtl_Hair_Dread`
		deform_mesh = `models/CAR/Male/M_Bmtl_Hair_Dread_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Bmtl_HatHair_Dread
		acc_skeleton = `skeletons/Skel_M_Bmtl_Hair_Dread`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Hair_Dread`
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
	}
	{
		desc_id = M_Clsc_Hair_Clive
		frontend_desc = qs(0xb243be28)
		mesh = `models/CAR/Male/M_Clsc_Hair_Clive`
		deform_mesh = `models/CAR/Male/M_Clsc_Hair_Clive_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Clsc_HatHair_Clive
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Clive`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Clive`
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
			M_Clsc_Hair_Clive_Primary
		]
		genre = [
			`Classic	Rock`
		]
	}
	{
		desc_id = M_Clsc_Hair_Clive2
		frontend_desc = qs(0x19161011)
		mesh = `models/CAR/Male/M_Clsc_Hair_Clive2`
		deform_mesh = `models/CAR/Male/M_Clsc_Hair_Clive2_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Clsc_HatHair_Clive2
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Clive2`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Clive2`
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
			M_Clsc_Hair_Clive2_Primary
		]
		genre = [
			`Classic	Rock`
		]
	}
	{
		desc_id = M_Clsc_Hair_Clive3
		frontend_desc = qs(0x02788adf)
		mesh = `models/CAR/Male/M_Clsc_Hair_Clive3`
		deform_mesh = `models/CAR/Male/M_Clsc_Hair_Clive3_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Clsc_HatHair_Clive3
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Clive3`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Clive3`
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
			M_Clsc_Hair_Clive3_Primary
		]
		genre = [
			`Classic	Rock`
		]
	}
	{
		desc_id = M_Clsc_Hair_Clive4
		frontend_desc = qs(0x25206033)
		mesh = `models/CAR/Male/M_Clsc_Hair_Clive4`
		deform_mesh = `models/CAR/Male/M_Clsc_Hair_Clive4_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Clsc_HatHair_Clive4
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Clive4`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Clive4`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
		]
		material_groups = [
			{
				materials = [
					M_Clsc_Hair_Clive4_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					M_Clsc_Hair_Clive4_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xda6ae6fb)
			}
		]
		genre = [
			`Classic	Rock`
		]
	}
	{
		desc_id = M_Clsc_Hair_Country
		frontend_desc = qs(0x479d7f40)
		mesh = `models/CAR/Male/M_Clsc_hair_Country`
		deform_mesh = `models/CAR/Male/M_Clsc_hair_Country_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Clsc_Hathair_Country
		materials = [
			M_Clsc_Hair_Country_hair
		]
		acc_skeleton = `skeletons/Skel_M_Clsc_hair_Country`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_hair_Country`
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
		hidden
	}
	{
		desc_id = M_Clsc_Hair_Messy
		frontend_desc = qs(0x925e89e6)
		mesh = `models/CAR/Male/M_Clsc_Hair_Messy`
		deform_mesh = `models/CAR/Male/M_Clsc_Hair_Messy_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Clsc_HatHair_Messy
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Messy`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Messy`
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
		]
		random_weight = 0.0
		hidden
	}
	{
		desc_id = M_Clsc_Hair_BlFro
		frontend_desc = qs(0x2114f878)
		mesh = `models/CAR/Male/M_Clsc_Hair_BlFro`
		deform_mesh = `models/CAR/Male/M_Clsc_Hair_BlFro_DEF`
		$CAS_Male_Hair_Common_Settings_SkinShader
		material_groups = [
			{
				materials = [
					M_Clsc_Hair_BlFro_base
					M_Clsc_Hair_BlFro_alpha
				]
				shader = $cas_shader_skin
			}
		]
		hat_hair = M_Clsc_HatHair_BlFro
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_BlFro`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_BlFro`
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
		]
	}
	{
		desc_id = M_Clsc_Hair_Jimi
		frontend_desc = qs(0xd3f52ad2)
		mesh = `models/CAR/Male/M_Clsc_Hair_Jimi`
		deform_mesh = `models/CAR/Male/M_Clsc_Hair_Jimi_Def`
		$CAS_Male_Hair_Common_Settings_SkinShader
		hat_hair = M_Clsc_HatHair_Jimi
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Jimi`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Jimi`
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
			M_Clsc_Hair_Jimi_Primary
			M_Clsc_Hair_Jimi_Secondary
		]
		genre = [
			`Classic	Rock`
		]
		random_weight = 0.25
		hidden
	}
	{
		desc_id = M_Glam_Hair_LaPalms
		frontend_desc = qs(0xbd135a6c)
		mesh = `models/CAR/Male/M_Glam_Hair_LaPalms`
		deform_mesh = `models/CAR/Male/M_Glam_Hair_LaPalms_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Glam_HatHair_LaPalms
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_LaPalms`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_LaPalms`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
		]
		genre = [
			`Glam	Rock`
		]
		random_weight = 0.25
		hidden
	}
	{
		desc_id = M_Glam_Hair_Seagull
		frontend_desc = qs(0x75a88322)
		mesh = `models/CAR/Male/M_Glam_Hair_Seagull`
		deform_mesh = `models/CAR/Male/M_Glam_Hair_Seagull_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Glam_HatHair_Seagull
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Seagull`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Seagull`
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
	}
	{
		desc_id = M_Glam_Hair_Gold
		frontend_desc = qs(0xb8f4def5)
		mesh = `models/CAR/Male/M_Glam_Hair_Gold`
		deform_mesh = `models/CAR/Male/M_Glam_Hair_Gold_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Glam_HatHair_Gold
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Gold`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Gold`
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
		hidden
	}
	{
		desc_id = M_Glam_Hair_Izzy1
		frontend_desc = qs(0x92f3930e)
		mesh = `models/CAR/Male/M_Glam_Hair_Izzy1`
		deform_mesh = `models/CAR/Male/M_Glam_Hair_Izzy1_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Glam_HatHair_Izzy1
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Izzy1`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Izzy1`
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
	}
	{
		desc_id = M_Glam_Hair_Izzy2
		frontend_desc = qs(0xf02a101d)
		mesh = `models/CAR/Male/M_Glam_Hair_Izzy2`
		deform_mesh = `models/CAR/Male/M_Glam_Hair_Izzy2_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Glam_HatHair_Izzy2
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Izzy2`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Izzy2`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_05
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			`Glam	Rock`
		]
	}
	{
		desc_id = M_Glam_Hair_Izzy3
		frontend_desc = qs(0x4b945d02)
		mesh = `models/CAR/Male/M_Glam_Hair_Izzy3`
		deform_mesh = `models/CAR/Male/M_Glam_Hair_Izzy3_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Glam_HatHair_Izzy3
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Izzy3`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Izzy3`
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
	}
	{
		desc_id = M_Glam_Hair_Izzy4
		frontend_desc = qs(0xe4de4c10)
		mesh = `models/CAR/Male/M_Glam_Hair_Izzy4`
		deform_mesh = `models/CAR/Male/M_Glam_Hair_Izzy4_DEF`
		$CAS_Male_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					M_Glam_Hair_Izzy4_Primary
				]
				shader = $cas_shader_hair
				name = qs(0x44458d9d)
			}
			{
				materials = [
					M_Glam_Hair_Izzy4_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0x947362be)
			}
			{
				materials = [
					M_Glam_Hair_Izzy4_torso_ETC
				]
				shader = $cas_shader_skin
				name = qs(0xda6ae6fb)
			}
		]
		hat_hair = M_Glam_HatHair_Izzy4
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Izzy4`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Izzy4`
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
	}
	{
		desc_id = M_Glam_Hair_5_1
		frontend_desc = qs(0x222b3c01)
		mesh = `models/CAR/Male/M_Glam_Hair_5_1`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Glam_HatHair_5_1
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_5_1`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_5_1`
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
	}
	{
		desc_id = M_Goth_Hair_Remedy
		frontend_desc = qs(0xcafba8c1)
		mesh = `models/CAR/Male/M_Goth_Hair_Remedy`
		deform_mesh = `models/CAR/Male/M_Goth_Hair_Remedy_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Goth_Hathair_Remedy
		acc_skeleton = `skeletons/Skel_M_Goth_Hair_Remedy`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Hair_Remedy`
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
			Goth
		]
	}
	{
		desc_id = M_Goth_Hair_Dreads
		frontend_desc = qs(0x4f27cb2e)
		mesh = `models/CAR/Male/M_Goth_Hair_Dreads`
		deform_mesh = `models/CAR/Male/M_Goth_Hair_Dreads_def`
		$CAS_Male_Hair_Common_Settings_SkinShader
		hat_hair = M_Goth_HatHair_Dreads
		materials = [
			M_Goth_Hair_Dreads_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Goth_Hair_Dreads`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Hair_Dreads`
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
	}
	{
		desc_id = M_Goth_Hair_Devilock
		frontend_desc = qs(0x959ee9ad)
		mesh = `models/CAR/Male/M_Goth_Hair_Devilock`
		deform_mesh = `models/CAR/Male/M_Goth_Hair_Devilock_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Goth_HatHair_Devilock
		acc_skeleton = `skeletons/Skel_M_Goth_Hair_Devilock`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Hair_Devilock`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_03
			Bone_ACC_Head_05
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
		genre = [
			Goth
			Punk
		]
		material_groups = [
			{
				materials = [
					M_Goth_Hair_Devilock_hair
					M_Goth_Hair_Devilock_hairtop
				]
				shader = $cas_shader_hair
			}
		]
	}
	{
		desc_id = M_Metl_Hair_Axel_1
		frontend_desc = qs(0x26aa668b)
		mesh = `models/CAR/Male/M_Metl_Hair_Axel_1`
		deform_mesh = `models/CAR/Male/M_Metl_Hair_Axel_1_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Metl_HatHair_Axel_1
		materials = [
			M_Metl_Hair_Axel_1_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_Axel_1`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_Axel_1`
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
			rock
		]
	}
	{
		desc_id = M_Metl_Hair_Axel_4
		frontend_desc = qs(0xe5e630c4)
		mesh = `models/CAR/Male/M_Metl_Hair_Axel_4`
		deform_mesh = `models/CAR/Male/M_Metl_Hair_Axel_4_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Metl_HatHair_Axel_4
		materials = [
			Axel4_Hair_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_Axel_4`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_Axel_4`
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
		desc_id = M_Metl_Hair_Axel5
		frontend_desc = qs(0x3405f866)
		mesh = `models/CAR/Male/M_Metl_Hair_Axel5`
		deform_mesh = `models/CAR/Male/M_Metl_Hair_Axel5_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Metl_HatHair_Axel5
		materials = [
			Axel5_Hair_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_Axel5`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_Axel5`
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
			`Heavy	Metal`
		]
	}
	{
		desc_id = M_Metl_Hair_Curlio
		frontend_desc = qs(0x75e6742b)
		mesh = `models/CAR/Male/M_Metl_Hair_Curlio`
		deform_mesh = `models/CAR/Male/M_Metl_Hair_Curlio_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Metl_HatHair_Curlio
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_Curlio`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_Curlio`
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
			rock
		]
	}
	{
		desc_id = M_Metl_Hair_Lars
		frontend_desc = qs(0x2c2db6e7)
		mesh = `models/CAR/Male/M_Metl_Hair_Lars`
		deform_mesh = `models/CAR/Male/M_Metl_Hair_Lars_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Metl_HatHair_Lars
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_Lars`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_Lars`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_05
			Bone_ACC_Head_06
		]
		genre = [
			Pop
			`Heavy	Metal`
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Pop_Hair_Clive5
		frontend_desc = qs(0xccc932ef)
		mesh = `models/CAR/Male/M_Pop_Hair_Clive5`
		deform_mesh = `models/CAR/Male/M_Pop_Hair_Clive5_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Pop_HatHair_Clive5
		acc_skeleton = `skeletons/Skel_M_Pop_Hair_Clive5`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Hair_Clive5`
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
		random_weight = 0.25
	}
	{
		desc_id = M_Pop_Hair_Buzz
		frontend_desc = qs(0x28da4eed)
		mesh = `models/CAR/Male/M_Pop_Hair_Buzz`
		deform_mesh = `models/CAR/Male/M_Pop_Hair_Buzz_def`
		$CAS_Male_Hair_Common_Settings_SkinShader
		hat_hair = M_Pop_HatHair_Buzz
		genre = [
			Pop
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Pop_Hair_Quin3
		frontend_desc = qs(0x4ba2b26b)
		mesh = `models/CAR/Male/M_Pop_Hair_Quin3`
		deform_mesh = `models/CAR/Male/M_Pop_Hair_Quin3_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Pop_HatHair_Quin3
		genre = [
			Pop
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Pop_Hair_Quinton4
		frontend_desc = qs(0x3b4876b6)
		mesh = `models/CAR/Male/M_Pop_Hair_Quinton4`
		deform_mesh = `models/CAR/Male/M_Pop_Hair_Quinton4_DEF`
		$CAS_Male_Hair_Common_Settings_SkinShader
		hat_hair = M_Pop_HatHair_Quinton4
		genre = [
			Pop
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Pop_Hair_Emo1
		frontend_desc = qs(0x8024e99c)
		mesh = `models/CAR/Male/M_Pop_Hair_Emo1`
		deform_mesh = `models/CAR/Male/M_Pop_Hair_Emo1_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Pop_HatHair_Emo1
		acc_skeleton = `skeletons/Skel_M_Pop_Hair_Emo1`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Hair_Emo1`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
		]
		genre = [
			Pop
			rock
		]
	}
	{
		desc_id = M_Pop_Hair_Pomp
		frontend_desc = qs(0xd965807d)
		mesh = `models/CAR/Male/M_Pop_Hair_Pomp`
		deform_mesh = `models/CAR/Male/M_Pop_Hair_Pomp_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Pop_HatHair_Pomp
		acc_skeleton = `skeletons/Skel_M_Pop_Hair_Pomp`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Hair_Pomp`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
		]
		genre = [
			Pop
			rock
		]
	}
	{
		desc_id = M_Pop_Hair_EddieKnox
		frontend_desc = qs(0x51aae246)
		mesh = `models/CAR/Male/M_Pop_Hair_EddieKnox`
		deform_mesh = `models/CAR/Male/M_Pop_Hair_EddieKnox_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Pop_HatHair_Pomp
		acc_skeleton = `skeletons/Skel_M_Pop_Hair_Pomp`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Hair_Pomp`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
		]
		hidden
	}
	{
		desc_id = M_Punk_Hair_Hawk
		frontend_desc = qs(0x29146d81)
		mesh = `models/CAR/Male/M_Punk_Hair_Hawk`
		deform_mesh = `models/CAR/Male/M_Punk_Hair_Hawk_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Punk_hathair_hawk
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_Hawk`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_Hawk`
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
	}
	{
		desc_id = M_Punk_Hair_LSpike
		frontend_desc = qs(0x4a5273e4)
		mesh = `models/CAR/Male/M_Punk_Hair_LSpike`
		deform_mesh = `models/CAR/Male/M_Punk_Hair_LSpike_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Punk_Hathair_LSpike
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_LSpike`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_LSpike`
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
			Punk
		]
	}
	{
		desc_id = M_Punk_Hair_J4Spike
		frontend_desc = qs(0x37f5abc9)
		mesh = `models/CAR/Male/M_Punk_Hair_J4Spike`
		deform_mesh = `models/CAR/Male/M_Punk_Hair_J4Spike_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Punk_HatHair_J4Spike
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_J4Spike`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_J4Spike`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
		]
		genre = [
			Punk
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Punk_Hair_Spike
		frontend_desc = qs(0xcca40c61)
		mesh = `models/CAR/Male/M_Punk_Hair_Spike`
		deform_mesh = `models/CAR/Male/M_Punk_Hair_Spike_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Punk_HatHair_Spike
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_Spike`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_Spike`
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
			Punk
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Punk_Hair_Jny_1
		frontend_desc = qs(0xb14dcfd4)
		mesh = `models/CAR/Male/M_Punk_Hair_Jny_1`
		deform_mesh = `models/CAR/Male/M_Punk_Hair_Jny_1_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = None
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_Jny_1`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_Jny_1`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
		]
		genre = [
			Punk
		]
	}
	{
		desc_id = M_Punk_Hair_Jny_2
		frontend_desc = qs(0x840db1c5)
		mesh = `models/CAR/Male/M_Punk_Hair_Jny_2`
		deform_mesh = `models/CAR/Male/M_Punk_Hair_Jny_2_Def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Punk_HatHair_Jny_2
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_Jny_2`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_Jny_2`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
		]
		genre = [
			Punk
		]
	}
	{
		desc_id = M_Punk_Hair_Jny_5
		frontend_desc = qs(0xb384678a)
		mesh = `models/CAR/Male/M_Punk_Hair_Jny_5`
		deform_mesh = `models/CAR/Male/M_Punk_Hair_Jny_5_Def`
		$CAS_Male_Hair_Common_Settings
		materials = [
			Jny5_Hair_Primary
		]
		hat_hair = None
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_Jny_5`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_Jny_5`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
		]
		genre = [
			Punk
		]
	}
	{
		desc_id = M_Rock_Hair_Drummer
		frontend_desc = qs(0x7a5a66fa)
		mesh = `models/CAR/Male/M_Rock_Hair_Drummer`
		deform_mesh = `models/CAR/Male/M_Rock_Hair_Drummer_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Rock_HatHair_Drummer
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Drummer`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Drummer`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_03
			Bone_ACC_Head_05
			Bone_ACC_Head_07
		]
		genre = [
			rock
		]
	}
	{
		desc_id = M_Rock_Hair_Guitarist
		frontend_desc = qs(0x5bccca2d)
		mesh = `models/CAR/Male/M_Rock_Hair_Guitarist`
		deform_mesh = `models/CAR/Male/M_Rock_Hair_Guitarist_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Rock_HatHair_Guitarist
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Guitarist`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Guitarist`
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
		random_weight = 0.1
	}
	{
		desc_id = M_Rock_Hair_MidPart
		frontend_desc = qs(0xb8b238cc)
		mesh = `models/CAR/Male/M_Rock_Hair_MidPart`
		deform_mesh = `models/CAR/Male/M_Rock_Hair_MidPart_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Rock_HatHair_MidPart
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_MidPart`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_MidPart`
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
			rock
		]
	}
	{
		desc_id = M_Rock_Hair_Slash
		frontend_desc = qs(0xdaa3e182)
		mesh = `models/CAR/Male/M_Rock_Hair_Slash`
		deform_mesh = `models/CAR/Male/M_Rock_Hair_Slash_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Rock_HatHair_Slash
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Slash`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Slash`
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
		random_weight = 0.0
		hidden
	}
	{
		desc_id = M_Rock_Hair_Braids
		frontend_desc = qs(0x2922f18c)
		mesh = `models/CAR/Male/M_Rock_Hair_Braids`
		deform_mesh = `models/CAR/Male/M_Rock_Hair_Braids_def`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Rock_HatHair_Braids
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Braids`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Braids`
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
		random_weight = 0.0
	}
	{
		desc_id = M_Rock_Hair_Eddie2
		frontend_desc = qs(0x10b39ebd)
		mesh = `models/CAR/Male/M_Rock_Hair_Eddie2`
		deform_mesh = `models/CAR/Male/M_Rock_Hair_Eddie2_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Rock_HatHair_Eddie2
		materials = [
			M_Rock_Hair_Eddie2_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Eddie3`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Eddie3`
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
		]
	}
	{
		desc_id = M_Rock_Hair_Eddie3
		frontend_desc = qs(0x563e0ee1)
		mesh = `models/CAR/Male/M_Rock_Hair_Eddie3`
		deform_mesh = `models/CAR/Male/M_Rock_Hair_Eddie3_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Rock_HatHair_Eddie3
		material_groups = [
			{
				materials = [
					M_Rock_Hair_Eddie3_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					M_Rock_Hair_Eddie3_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0xbbaf5fd1)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Eddie3`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Eddie3`
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
		]
	}
	{
		desc_id = M_Rock_Hair_Eddie4
		frontend_desc = qs(0xd254aac2)
		mesh = `models/CAR/Male/M_Rock_Hair_Eddie4`
		deform_mesh = `models/CAR/Male/M_Rock_Hair_Eddie4_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Rock_HatHair_Eddie4
		materials = [
			M_Rock_Hair_Eddie4_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Eddie3`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Eddie3`
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
		]
	}
	{
		desc_id = M_Rock_Hair_Eddie5
		frontend_desc = qs(0x2fb6e6eb)
		mesh = `models/CAR/Male/M_Rock_Hair_Eddie5`
		deform_mesh = `models/CAR/Male/M_Rock_Hair_Eddie5_DEF`
		$CAS_Male_Hair_Common_Settings
		hat_hair = M_Rock_HatHair_Eddie5
		material_groups = [
			{
				materials = [
					Eddie5_Hair_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdaa67e9a)
			}
			{
				materials = [
					Eddie5_Hair_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0xbbaf5fd1)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Eddie5`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Eddie5`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
		]
		genre = [
			rock
		]
	}
	{
		desc_id = M_Funpart_Hair_Octo
		frontend_desc = qs(0xec85351c)
		mesh = `models/CAR/Male/M_Funpart_Hair_Octo`
		deform_mesh = `models/CAR/Male/M_Funpart_Hair_Octo_DEF`
		hat_hair = M_Funpart_HatHair_Octo
		acc_skeleton = `skeletons/Skel_M_Funpart_Hair_Octo`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Funpart_Hair_Octo`
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
		desc_id = M_Funpart_Hair_Slime
		frontend_desc = qs(0xdbfe1db5)
		mesh = `models/CAR/Male/M_Funpart_Hair_Slime`
		deform_mesh = `models/CAR/Male/M_Funpart_Hair_Slime_DEF`
		hat_hair = M_Funpart_HatHair_Slime
		materials = [
			M_Funpart_Hair_Slime_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Funpart_Hair_Slime`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Funpart_Hair_Slime`
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
CAS_Male_Hat_Hair_Common_Settings = {
	modify_all_materials
	shader = $cas_shader_hair
}
CAS_Male_Hat_Hair_Common_Settings_SkinShader = {
	modify_all_materials
	shader = $cas_shader_skin
}
CAS_Male_Hat_Hair = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
	}
	{
		desc_id = M_Bmtl_HatHair_Straight
		mesh = `models/CAR/Male/M_Bmtl_HatHair_Straight`
		deform_mesh = `models/CAR/Male/M_Bmtl_HatHair_Straight_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Bmtl_Hair_Straight`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Hair_Straight`
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
		desc_id = M_Bmtl_HatHair_Dread
		mesh = `models/CAR/Male/M_Bmtl_HatHair_Dread`
		deform_mesh = `models/CAR/Male/M_Bmtl_HatHair_Dread_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Bmtl_Hair_Dread`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Hair_Dread`
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
		desc_id = M_Bmtl_HatHair_Lars_3
		mesh = `models/CAR/Male/M_Bmtl_HatHair_Lars_3`
		deform_mesh = `models/CAR/Male/M_Bmtl_HatHair_Lars_3_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					M_Bmtl_Hair_Lars_3_Primary
				]
				shader = $cas_shader_skin
				name = qs(0xabcff5c4)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Bmtl_Hair_Lars_3`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Hair_Lars_3`
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
		desc_id = M_Bmtl_HatHair_Lars4
		mesh = `models/CAR/Male/M_Bmtl_HatHair_Lars4`
		deform_mesh = `models/CAR/Male/M_Bmtl_HatHair_Lars4_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Bmtl_Hair_Lars_4`
		acc_ragdoll = `Ragdolls/CAR/Male/Bmtl/Rag_M_Bmtl_Hair_Lars_4`
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
		desc_id = M_Clsc_HatHair_Clive
		mesh = `models/CAR/Male/M_Clsc_HatHair_Clive`
		deform_mesh = `models/CAR/Male/M_Clsc_HatHair_Clive_DEF`
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Clive`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Clive`
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
		$CAS_Male_Hat_Hair_Common_Settings
	}
	{
		desc_id = M_Clsc_HatHair_Clive2
		mesh = `models/CAR/Male/M_Clsc_HatHair_Clive2`
		deform_mesh = `models/CAR/Male/M_Clsc_HatHair_Clive2_DEF`
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Clive2`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Clive2`
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
		$CAS_Male_Hat_Hair_Common_Settings
	}
	{
		desc_id = M_Clsc_HatHair_Clive3
		mesh = `models/CAR/Male/M_Clsc_HatHair_Clive3`
		deform_mesh = `models/CAR/Male/M_Clsc_HatHair_Clive3_DEF`
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Clive3`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Clive3`
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
		$CAS_Male_Hat_Hair_Common_Settings
	}
	{
		desc_id = M_Clsc_HatHair_Clive4
		mesh = `models/CAR/Male/M_Clsc_HatHair_Clive4`
		deform_mesh = `models/CAR/Male/M_Clsc_HatHair_Clive4_DEF`
		$CAS_Male_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Clive4`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Clive4`
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
		$CAS_Male_Hat_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					M_Clsc_HatHair_Clive4_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xabcff5c4)
			}
		]
	}
	{
		desc_id = M_Clsc_HatHair_Messy
		mesh = `models/CAR/Male/M_Clsc_HatHair_Messy`
		deform_mesh = `models/CAR/Male/M_Clsc_HatHair_Messy_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Messy`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Messy`
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
		desc_id = M_Clsc_Hathair_Country
		mesh = `models/CAR/Male/M_Clsc_Hathair_Country`
		deform_mesh = `models/CAR/Male/M_Clsc_Hathair_Country_def`
		$CAS_Male_Hat_Hair_Common_Settings
		materials = [
			M_Clsc_Hair_Country_hair
		]
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_Messy`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_Messy`
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
		desc_id = M_Clsc_HatHair_George
		mesh = `models/CAR/Male/M_Clsc_HatHair_George`
		deform_mesh = `models/CAR/Male/M_Clsc_HatHair_George_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_George`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_George`
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
		desc_id = M_Clsc_HatHair_Contest
		mesh = `models/CAR/Male/M_Clsc_HatHair_Contest`
		deform_mesh = `models/CAR/Male/M_Clsc_HatHair_Contest_def`
		$CAS_Male_Hat_Hair_Common_Settings
	}
	{
		desc_id = M_Clsc_HatHair_Jimi
		mesh = `models/CAR/Male/M_Clsc_HatHair_Jimi`
		deform_mesh = `models/CAR/Male/M_Clsc_HatHair_Jimi_def`
		$CAS_Male_Hair_Common_Settings_SkinShader
		materials = [
			M_Clsc_Hair_Jimi_Primary
			M_Clsc_Hair_Jimi_Secondary
		]
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_George`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_George`
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
		desc_id = M_Clsc_HatHair_BlFro
		mesh = `models/CAR/Male/M_Clsc_HatHair_BlFro`
		deform_mesh = `models/CAR/Male/M_Clsc_HatHair_BlFro_DEF`
		material_groups = [
			{
				materials = [
					M_Clsc_Hair_BlFro_base
					M_Clsc_Hair_BlFro_alpha
				]
				shader = $cas_shader_skin
				name = qs(0xdaa67e9a)
			}
		]
		$CAS_Male_Hair_Common_Settings_SkinShader
		acc_skeleton = `skeletons/Skel_M_Clsc_Hair_BlFro`
		acc_ragdoll = `Ragdolls/CAR/Male/Clsc/Rag_M_Clsc_Hair_BlFro`
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
		desc_id = M_Glam_HatHair_LaPalms
		mesh = `models/CAR/Male/M_Glam_HatHair_LaPalms`
		deform_mesh = `models/CAR/Male/M_Glam_HatHair_LaPalms_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_LaPalms`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_LaPalms`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
		]
	}
	{
		desc_id = M_Glam_HatHair_Seagull
		mesh = `models/CAR/Male/M_Glam_HatHair_Seagull`
		deform_mesh = `models/CAR/Male/M_Glam_HatHair_Seagull_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Seagull`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Seagull`
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
		desc_id = M_Glam_HatHair_Gold
		mesh = `models/CAR/Male/M_Glam_HatHair_Gold`
		deform_mesh = `models/CAR/Male/M_Glam_HatHair_Gold_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Gold`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Gold`
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
		desc_id = M_Glam_HatHair_Izzy1
		mesh = `models/CAR/Male/M_Glam_HatHair_Izzy1`
		deform_mesh = `models/CAR/Male/M_Glam_HatHair_Izzy1_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Izzy1`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Izzy1`
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
		desc_id = M_Glam_HatHair_Izzy2
		mesh = `models/CAR/Male/M_Glam_HatHair_Izzy2`
		deform_mesh = `models/CAR/Male/M_Glam_HatHair_Izzy2_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Izzy2`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Izzy2`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_05
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = M_Glam_HatHair_Izzy3
		mesh = `models/CAR/Male/M_Glam_HatHair_Izzy3`
		deform_mesh = `models/CAR/Male/M_Glam_HatHair_Izzy3_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Izzy3`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Izzy3`
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
		desc_id = M_Glam_HatHair_Izzy4
		mesh = `models/CAR/Male/M_Glam_HatHair_Izzy4`
		deform_mesh = `models/CAR/Male/M_Glam_HatHair_Izzy4_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		material_groups = [
			{
				materials = [
					M_Glam_Hair_Izzy4_Primary
				]
				shader = $cas_shader_hair
				name = qs(0xdcb77541)
			}
			{
				materials = [
					M_Glam_Hair_Izzy4_Secondary
				]
				shader = $cas_shader_hair
				name = qs(0x62587786)
			}
			{
				materials = [
					M_Glam_Hair_Izzy4_torso_ETC
				]
				shader = $cas_shader_skin
				name = qs(0xa6a2ed9c)
			}
		]
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_Izzy4`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_Izzy4`
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
		desc_id = M_Glam_HatHair_5_1
		mesh = `models/CAR/Male/M_Glam_HatHair_5_1`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Glam_Hair_5_1`
		acc_ragdoll = `Ragdolls/CAR/Male/Glam/Rag_M_Glam_Hair_5_1`
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
		desc_id = M_Metl_HatHair_Axel_1
		mesh = `models/CAR/Male/M_Metl_HatHair_Axel_1`
		deform_mesh = `models/CAR/Male/M_Metl_HatHair_Axel_1_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_Axel_1`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_Axel_1`
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
		desc_id = M_Metl_HatHair_Axel_4
		mesh = `models/CAR/Male/M_Metl_HatHair_Axel_4`
		deform_mesh = `models/CAR/Male/M_Metl_HatHair_Axel_4_DEF`
		$CAS_Male_Hair_Common_Settings
		materials = [
			Axel4_Hair_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_Axel_4`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_Axel_4`
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
		desc_id = M_Metl_HatHair_Axel5
		mesh = `models/CAR/Male/M_Metl_HatHair_Axel5`
		deform_mesh = `models/CAR/Male/M_Metl_HatHair_Axel5_DEF`
		$CAS_Male_Hair_Common_Settings
		materials = [
			Axel5_Hair_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_Axel5`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_Axel5`
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
		desc_id = M_Metl_HatHair_Curlio
		mesh = `models/CAR/Male/M_Metl_HatHair_Curlio`
		deform_mesh = `models/CAR/Male/M_Metl_HatHair_Curlio_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_Curlio`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_Curlio`
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
		desc_id = M_Metl_HatHair_Lars
		mesh = `models/CAR/Male/M_Metl_HatHair_Lars`
		deform_mesh = `models/CAR/Male/M_Metl_HatHair_Lars_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_Lars`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_Lars`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_05
			Bone_ACC_Head_06
		]
	}
	{
		desc_id = M_Metl_HatHair_MidHigh
		mesh = `models/CAR/Male/M_Metl_HatHair_MidHigh`
		deform_mesh = `models/CAR/Male/M_Metl_HatHair_MidHigh_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Metl_Hair_MidHigh`
		acc_ragdoll = `Ragdolls/CAR/Male/Metl/Rag_M_Metl_Hair_MidHigh`
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
		desc_id = M_Pop_HatHair_Clive5
		mesh = `models/CAR/Male/M_Pop_HatHair_Clive5`
		deform_mesh = `models/CAR/Male/M_Pop_HatHair_Clive5_DEF`
		acc_skeleton = `skeletons/Skel_M_Pop_Hair_Clive5`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Hair_Clive5`
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
		$CAS_Male_Hat_Hair_Common_Settings
	}
	{
		desc_id = M_Pop_HatHair_Buzz
		mesh = `models/CAR/Male/M_Pop_HatHair_Buzz`
		deform_mesh = `models/CAR/Male/M_Pop_HatHair_Buzz_def`
		$CAS_Male_Hair_Common_Settings_SkinShader
	}
	{
		desc_id = M_Pop_HatHair_Pomp
		mesh = `models/CAR/Male/M_Pop_HatHair_Pomp`
		deform_mesh = `models/CAR/Male/M_Pop_HatHair_Pomp_def`
		$CAS_Male_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Pop_Hair_Pomp`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Hair_Pomp`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
			Bone_ACC_Head_05
			Bone_ACC_Head_06
			Bone_ACC_Head_07
			Bone_ACC_Head_08
		]
	}
	{
		desc_id = M_Pop_HatHair_Emo1
		mesh = `models/CAR/Male/M_Pop_HatHair_Emo1`
		deform_mesh = `models/CAR/Male/M_Pop_HatHair_Emo1_def`
		$CAS_Male_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Pop_Hair_Emo1`
		acc_ragdoll = `Ragdolls/CAR/Male/Pop/Rag_M_Pop_Hair_Emo1`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
			Bone_ACC_Head_04
		]
	}
	{
		desc_id = M_Pop_HatHair_Quin3
		mesh = `models/CAR/Male/M_Pop_HatHair_Quin3`
		deform_mesh = `models/CAR/Male/M_Pop_HatHair_Quin3_def`
		$CAS_Male_Hair_Common_Settings
	}
	{
		desc_id = M_Pop_HatHair_Quinton4
		mesh = `models/CAR/Male/M_Pop_HatHair_Quinton4`
		deform_mesh = `models/CAR/Male/M_Pop_HatHair_Quinton4_DEF`
		$CAS_Male_Hair_Common_Settings
	}
	{
		desc_id = M_Punk_HatHair_Spike
		mesh = `models/CAR/Male/M_Punk_Hathair_Spike`
		deform_mesh = `models/CAR/Male/M_Punk_Hathair_Spike_Def`
		$CAS_Male_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_Spike`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_Spike`
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
		desc_id = M_Punk_hathair_hawk
		mesh = `models/CAR/Male/M_Punk_Hathair_Hawk`
		deform_mesh = `models/CAR/Male/M_Punk_Hathair_Hawk_Def`
		$CAS_Male_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_Hawk`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_Hawk`
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
		desc_id = M_Punk_Hathair_LSpike
		mesh = `models/CAR/Male/M_Punk_Hathair_LSpike`
		deform_mesh = `models/CAR/Male/M_Punk_Hathair_LSpike_Def`
		$CAS_Male_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_LSpike`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_LSpike`
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
		desc_id = M_Punk_HatHair_Jny_2
		mesh = `models/CAR/Male/M_Punk_Hathair_Jny_2`
		deform_mesh = `models/CAR/Male/M_Punk_Hathair_Jny_2_Def`
		$CAS_Male_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_Jny_2`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_Jny_2`
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
		desc_id = M_Punk_HatHair_J4Spike
		mesh = `models/CAR/Male/M_Punk_Hathair_j4Spike`
		deform_mesh = `models/CAR/Male/M_Punk_Hathair_j4Spike_Def`
		$CAS_Male_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Punk_Hair_J4Spike`
		acc_ragdoll = `Ragdolls/CAR/Male/Punk/Rag_M_Punk_Hair_J4Spike`
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
		desc_id = M_Rock_HatHair_Drummer
		mesh = `models/CAR/Male/M_Rock_HatHair_Drummer`
		deform_mesh = `models/CAR/Male/M_Rock_HatHair_Drummer_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Drummer`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Drummer`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_03
			Bone_ACC_Head_05
			Bone_ACC_Head_07
		]
	}
	{
		desc_id = M_Rock_HatHair_MidPart
		mesh = `models/CAR/Male/M_Rock_HatHair_MidPart`
		deform_mesh = `models/CAR/Male/M_Rock_HatHair_MidPart_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_MidPart`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_MidPart`
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
		desc_id = M_Rock_HatHair_Slash
		mesh = `models/CAR/Male/M_Rock_HatHair_Slash`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Slash`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Slash`
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
		desc_id = M_Rock_HatHair_Guitarist
		mesh = `models/CAR/Male/M_Rock_HatHair_Guitarist`
		deform_mesh = `models/CAR/Male/M_Rock_HatHair_Guitarist_def`
		$CAS_Male_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Guitarist`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Guitarist`
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
		desc_id = M_Rock_HatHair_Braids
		mesh = `models/CAR/Male/M_Rock_HatHair_Braids`
		deform_mesh = `models/CAR/Male/M_Rock_HatHair_Braids_Def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Braids`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Braids`
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
		desc_id = M_Rock_HatHair_Eddie2
		mesh = `models/CAR/Male/M_Rock_HatHair_Eddie2`
		deform_mesh = `models/CAR/Male/M_Rock_HatHair_Eddie2_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		materials = [
			M_Rock_Hair_Eddie2_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Eddie3`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Eddie3`
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
		desc_id = M_Rock_HatHair_Eddie3
		mesh = `models/CAR/Male/M_Rock_HatHair_Eddie3`
		deform_mesh = `models/CAR/Male/M_Rock_HatHair_Eddie3_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		materials = [
			M_Rock_Hair_Eddie3_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Eddie3`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Eddie3`
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
		desc_id = M_Rock_HatHair_Eddie4
		mesh = `models/CAR/Male/M_Rock_HatHair_Eddie4`
		deform_mesh = `models/CAR/Male/M_Rock_HatHair_Eddie4_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		materials = [
			M_Rock_Hair_Eddie4_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Eddie3`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Eddie3`
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
		desc_id = M_Rock_HatHair_Eddie5
		mesh = `models/CAR/Male/M_Rock_HatHair_Eddie5`
		deform_mesh = `models/CAR/Male/M_Rock_HatHair_Eddie5_DEF`
		$CAS_Male_Hat_Hair_Common_Settings
		materials = [
			Eddie5_Hair_Primary
			Eddie5_Hair_Secondary
		]
		acc_skeleton = `skeletons/Skel_M_Rock_Hair_Eddie5`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Rock_Hair_Eddie5`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_02
			Bone_ACC_Head_03
		]
	}
	{
		desc_id = M_Funpart_HatHair_Octo
		mesh = `models/CAR/Male/M_Funpart_HatHair_Octo`
		deform_mesh = `models/CAR/Male/M_Funpart_HatHair_Octo_DEF`
		acc_skeleton = `skeletons/Skel_M_Funpart_Hair_Octo`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Funpart_Hair_Octo`
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
		desc_id = M_Funpart_HatHair_Slime
		mesh = `models/CAR/Male/M_Funpart_Hair_Slime`
		deform_mesh = `models/CAR/Male/M_Funpart_Hair_Slime_DEF`
		materials = [
			M_Funpart_Hair_Slime_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Funpart_Hair_Slime`
		acc_ragdoll = `Ragdolls/CAR/Male/Rock/Rag_M_Funpart_Hair_Slime`
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
		desc_id = M_Goth_HatHair_Devilock
		mesh = `models/CAR/Male/M_Goth_HatHair_Devilock`
		deform_mesh = `models/CAR/Male/M_Goth_HatHair_Devilock_def`
		$CAS_Male_Hat_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Goth_Hair_Devilock`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Hair_Devilock`
		acc_bones = [
			Bone_ACC_Head_01
			Bone_ACC_Head_03
			Bone_ACC_Head_05
			Bone_ACC_Head_07
			Bone_ACC_Head_08
			Bone_ACC_Head_09
		]
	}
	{
		desc_id = M_Goth_HatHair_Dreads
		mesh = `models/CAR/Male/M_Goth_HatHair_Dreads`
		deform_mesh = `models/CAR/Male/M_Goth_HatHair_Dreads_def`
		$CAS_Male_Hair_Common_Settings_SkinShader
		materials = [
			M_Goth_Hair_Dreads_Primary
		]
		acc_skeleton = `skeletons/Skel_M_Goth_Hair_Dreads`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Hair_Dreads`
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
		desc_id = M_Goth_Hathair_Remedy
		mesh = `models/CAR/Male/M_Goth_HatHair_Remedy`
		deform_mesh = `models/CAR/Male/M_Goth_HatHair_Remedy_def`
		$CAS_Male_Hair_Common_Settings
		acc_skeleton = `skeletons/Skel_M_Goth_Hair_Remedy`
		acc_ragdoll = `Ragdolls/CAR/Male/Goth/Rag_M_Goth_Hair_Remedy`
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
]
CAS_Male_Hat = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 4.0
	}
	{
		desc_id = M_Clsc_Hat_Cowboy
		frontend_desc = qs(0xffaea878)
		mesh = `models/CAR/Male/M_Clsc_Hat_Cowboy`
		deform_mesh = `models/CAR/Male/M_Clsc_Hat_Cowboy_def`
		genre = [
			`Classic	Rock`
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Clsc_Hat_Clive3
		frontend_desc = qs(0x953c0bb9)
		mesh = `models/CAR/Male/M_Clsc_Hat_Clive3`
		deform_mesh = `models/CAR/Male/M_Clsc_Hat_Clive3_DEF`
		material_groups = [
			{
				materials = [
					M_Clsc_Hat_Clive3_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					M_Clsc_Hat_Clive3_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xee3a510b)
			}
		]
		genre = [
			`Classic	Rock`
		]
		random_weight = 0.25
		locked
	}
	{
		desc_id = M_Punk_Hat_Helmet
		frontend_desc = qs(0xef1f656a)
		mesh = `models/CAR/Male/M_Punk_Hat_Helmet`
		deform_mesh = `models/CAR/Male/M_Punk_Hat_Helmet_def`
		genre = [
			Punk
		]
		random_weight = 0
	}
	{
		desc_id = M_Rock_hat_Spacehelmet
		frontend_desc = qs(0x348960af)
		mesh = `models/CAR/Male/M_Rock_hat_Spacehelmet`
		deform_mesh = `models/CAR/Male/M_Rock_hat_Spacehelmet_def`
		hat_hair = None
		genre = [
			rock
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Rock_hat_halo
		frontend_desc = qs(0x36f714a7)
		mesh = `models/CAR/Male/M_Rock_hat_halo`
		deform_mesh = `models/CAR/Male/M_Rock_hat_halo_def`
		hat_hair = original_hair
		genre = [
			rock
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Clsc_Hat_Cptn
		frontend_desc = qs(0xeb12864d)
		mesh = `models/CAR/Male/M_Clsc_Hat_Cptn`
		materials = [
			M_Clsc_Hat_Cptn_Primary
		]
		deform_mesh = `models/CAR/Male/M_Clsc_Hat_Cptn_def`
		genre = [
			`Classic	Rock`
		]
		random_weight = 0.1
	}
	{
		desc_id = M_Fun_Hat_EyeBall
		frontend_desc = qs(0x3b86ba16)
		mesh = `models/CAR/Male/M_Fun_Hat_EyeBall`
		deform_mesh = `models/CAR/Male/M_Fun_Hat_EyeBall_def`
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Clsc_Hat_Triangle
		frontend_desc = qs(0xa1bdcefb)
		mesh = `models/CAR/Male/M_Clsc_Hat_Triangle`
		deform_mesh = `models/CAR/Male/M_Clsc_Hat_Triangle_def`
		material_groups = [
			{
				materials = [
					M_Clsc_Hat_Triangle_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					M_Clsc_Hat_Triangle_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x9266c624)
			}
		]
		genre = [
			`Classic	Rock`
		]
		random_weight = 0.0
	}
	{
		desc_id = M_Pop_Hat_Beanie
		frontend_desc = qs(0x8cfec6e5)
		mesh = `models/CAR/Male/M_Pop_Hat_Beanie`
		deform_mesh = `models/CAR/Male/M_Pop_Hat_Beanie_DEF`
		materials = [
			M_Pop_Hat_Beanie_Primary
		]
		genre = [
			Pop
		]
		random_weight = 0.5
	}
	{
		desc_id = M_Pop_Hat_Bucket
		frontend_desc = qs(0xff1d662e)
		mesh = `models/CAR/Male/M_Pop_Hat_Bucket`
		deform_mesh = `models/CAR/Male/M_Pop_Hat_Bucket_def`
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
		random_weight = 0.5
	}
	{
		desc_id = M_Pop_Hat_Bucket2
		frontend_desc = qs(0x520453e4)
		mesh = `models/CAR/Male/M_Pop_Hat_Bucket2`
		deform_mesh = `models/CAR/Male/M_Pop_Hat_Bucket2_def`
		material_groups = [
			{
				materials = [
					M_Pop_Hat_Bucket2_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					M_Pop_Hat_Bucket2_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0xee3a510b)
			}
		]
		genre = [
			Pop
		]
		random_weight = 0.5
	}
	{
		desc_id = M_Pop_Head_GasMask
		frontend_desc = qs(0x0039dd19)
		mesh = `models/CAR/Male/M_Pop_Head_GasMask`
		deform_mesh = `models/CAR/Male/M_Pop_Head_GasMask_def`
		materials = [
			M_Pop_Head_Gasmask_Mask
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Pop_Head_WW2Helm
		frontend_desc = qs(0xa1ed9a95)
		mesh = `models/CAR/Male/M_Pop_Head_WW2Helm`
		deform_mesh = `models/CAR/Male/M_Pop_Head_WW2Helm_def`
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Pop_Hat_QuinCap
		frontend_desc = qs(0xa691c807)
		mesh = `models/CAR/Male/M_Pop_Hat_QuinCap`
		deform_mesh = `models/CAR/Male/M_Pop_Hat_QuinCap_def`
		materials = [
			M_Pop_Hat_QuinCap_Primary
		]
		genre = [
			Pop
		]
		random_weight = 0.0
	}
	{
		desc_id = M_Pop_Hat_Quinton2
		frontend_desc = qs(0x05549fc9)
		mesh = `models/CAR/Male/M_Pop_Hat_Quinton2`
		deform_mesh = `models/CAR/Male/M_Pop_Hat_Quinton2_def`
		hat_hair = None
		material_groups = [
			{
				materials = [
					Quinton2_Hat_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					Quinton2_Hat_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x58cf8c6c)
			}
			{
				materials = [
					Quinton2_Hat_Tertiary
				]
				shader = $cas_shader_skin
				name = qs(0x974dd072)
			}
		]
		genre = [
			Pop
		]
		random_weight = 0.0
	}
	{
		desc_id = M_Rock_Hat_Starpin
		frontend_desc = qs(0x4be7facb)
		mesh = `models/CAR/Male/M_Rock_Hat_Starpin`
		deform_mesh = `models/CAR/Male/M_Rock_Hat_Starpin_def`
		materials = [
			M_Rock_Hat_Starpin_Primary
		]
		genre = [
			rock
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Rock_Hat_Cowboy
		frontend_desc = qs(0x2e4734b1)
		mesh = `models/CAR/Male/M_Rock_Hat_Cowboy`
		deform_mesh = `models/CAR/Male/M_Rock_Hat_Cowboy_def`
		material_groups = [
			{
				materials = [
					M_Rock_Hat_Cowboy_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					M_Rock_Hat_Cowboy_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x55a35727)
			}
		]
		genre = [
			rock
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Metl_Hat_Zakk
		frontend_desc = qs(0xf8ed58a5)
		mesh = `models/CAR/Male/M_Metl_Hat_Zakk`
		deform_mesh = `models/CAR/Male/M_Metl_Hat_Zakk_def`
		genre = [
			`Heavy	Metal`
		]
		random_weight = 0.25
	}
	{
		desc_id = M_Metl_Hat_ArmorHelm
		frontend_desc = qs(0x7adc03ce)
		mesh = `models/CAR/Male/M_Metl_Hat_ArmorHelm`
		deform_mesh = `models/CAR/Male/M_Metl_Hat_ArmorHelm_def`
		hat_hair = None
		genre = [
			`Heavy	Metal`
		]
		random_weight = 0.0
	}
	{
		desc_id = M_Metl_Hat_Axel2
		frontend_desc = qs(0xc2879778)
		mesh = `models/CAR/Male/M_Metl_Hat_Axel2`
		deform_mesh = `models/CAR/Male/M_Metl_Hat_Axel2_def`
		genre = [
			`Heavy	Metal`
		]
		random_weight = 0.4
	}
	{
		desc_id = M_Metl_Hat_Studs
		frontend_desc = qs(0x3e943475)
		mesh = `models/CAR/Male/M_Metl_Hat_Studs`
		deform_mesh = `models/CAR/Male/M_Metl_Hat_Studs_def`
		genre = [
			`Heavy	Metal`
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Metl_Horn
		frontend_desc = qs(0x6fea43c1)
		mesh = `models/CAR/Male/M_Metl_acc_Horn`
		deform_mesh = `models/CAR/Male/M_Metl_acc_Horn_def`
		material_groups = [
			{
				materials = [
					M_Metl_Acc_Horn_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x3330d471)
			}
			{
				materials = [
					M_Metl_Acc_Horn_hornbase
				]
				shader = $cas_shader_skin
				name = qs(0x9c58ccba)
			}
		]
		hat_hair = original_hair
		genre = [
			`Heavy	Metal`
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Bmtl_Hat_Viking
		frontend_desc = qs(0xbbf00af8)
		mesh = `models/CAR/Male/M_Bmtl_Hat_Viking`
		deform_mesh = `models/CAR/Male/M_Bmtl_Hat_Viking_def`
		genre = [
			`Black	Metal`
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Bmtl_Hat_Lars4
		frontend_desc = qs(0x055650a5)
		mesh = `models/CAR/Male/M_Bmtl_Hat_Lars4`
		hat_hair = None
		deform_mesh = `models/CAR/Male/M_Bmtl_Hat_Lars4_def`
		genre = [
			`Black	Metal`
		]
		locked
	}
	{
		desc_id = M_Bmtl_Hat_SkullHelmet
		frontend_desc = qs(0xea89ff84)
		mesh = `models/CAR/Male/M_Bmtl_Hat_SkullHelmet`
		material_groups = [
			{
				materials = [
					M_Bmtl_Hat_SkullHelmet_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x9c33f5de)
			}
			{
				materials = [
					M_Bmtl_Hat_SkullHelmet_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x60b5b214)
			}
		]
		deform_mesh = `models/CAR/Male/M_Bmtl_Hat_SkullHelmet_def`
		genre = [
			`Black	Metal`
		]
		hat_hair = None
		random_weight = 0.5
		locked
	}
	{
		desc_id = M_Bmtl_Hat_Brain
		frontend_desc = qs(0xe5baded2)
		mesh = `models/CAR/Male/M_Bmtl_Hat_Brain`
		deform_mesh = `models/CAR/Male/M_Bmtl_Hat_Brain_def`
		genre = [
			`Black	Metal`
		]
		material_groups = [
			{
				materials = [
					M_Bmtl_Hat_Brain_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x782c48e1)
			}
			{
				materials = [
					M_Bmtl_Hat_Brain_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x10a77f06)
			}
		]
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Goth_Hat_TopHat
		frontend_desc = qs(0xd9f3b456)
		mesh = `models/CAR/Male/M_Goth_Hat_TopHat`
		deform_mesh = `models/CAR/Male/M_Goth_Hat_TopHat_def`
		$CAS_Male_Hair_Common_Settings
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
		random_weight = 0.25
	}
	{
		desc_id = M_Hat_Ninja_c1
		frontend_desc = qs(0x97d60449)
		mesh = `models/CAR/Male/M_Hat_Ninja_c1`
		deform_mesh = `models/CAR/Male/M_Hat_Ninja_c1_def`
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
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Hat_Gorilla
		frontend_desc = qs(0x6d95532b)
		mesh = `models/CAR/Male/M_Hat_Gorilla`
		deform_mesh = `models/CAR/Male/M_Hat_Gorilla_def`
		hat_hair = None
		materials = [
			M_Hat_Gorilla_Primary
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Hat_Pimp
		frontend_desc = qs(0xd8a55f8a)
		mesh = `models/CAR/Male/M_Hat_Pimp`
		deform_mesh = `models/CAR/Male/M_Hat_Pimp_def`
		material_groups = [
			{
				materials = [
					M_Hat_Pimp_Primary
				]
				shader = $cas_shader_skin
				name = qs(0x34df28da)
			}
			{
				materials = [
					M_Hat_Pimp_Secondary
				]
				shader = $cas_shader_skin
				name = qs(0x8cff0357)
			}
			{
				materials = [
					M_Hat_Pimp_Feather
				]
				shader = $cas_shader_skin
				name = qs(0x9266c624)
			}
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Rock_Hat_RetroTV
		frontend_desc = qs(0xaf00387d)
		mesh = `models/CAR/Male/M_Rock_Hat_RetroTv`
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Fun_Hat_WW2Helmet
		frontend_desc = qs(0x8db59eb9)
		mesh = `models/CAR/Male/M_Fun_Hat_WW2Helmet`
		deform_mesh = `models/CAR/Male/M_Fun_Hat_WW2Helmet_DEF`
		hat_hair = None
		materials = [
			M_Fun_Hat_WW2Helmet_helmet
		]
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Fun_Hat_Demon
		frontend_desc = qs(0x364f141c)
		mesh = `models/CAR/Male/M_Rock_Hat_Cyclops`
		deform_mesh = `models/CAR/Male/M_Rock_Hat_Cyclops_def`
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Funpart_hat_clown
		frontend_desc = qs(0x102e4c2d)
		mesh = `models/CAR/Male/M_Funpart_hat_clown`
		deform_mesh = `models/CAR/Male/M_Funpart_hat_clown_def`
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Rock_Hat_Pumpkin
		frontend_desc = qs(0x6ee59962)
		mesh = `models/CAR/Male/M_Rock_Hat_Pumpkin`
		hat_hair = None
		random_weight = 0.0
		locked
	}
	{
		desc_id = M_Fun_Hat_Magical
		frontend_desc = qs(0x82770ec9)
		mesh = `models/CAR/Male/M_Fun_Hat_Hannya`
		deform_mesh = `models/CAR/Male/M_Fun_Hat_Hannya_def`
		hat_hair = None
		random_weight = 0.0
		locked
	}
]
CAS_Male_Facial_Hair_Common_Settings = {
	modify_all_materials
	shader = $cas_shader_hair
	random_weight = 0.0
}
CAS_Male_Facial_Hair = [
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 25.0
	}
	{
		desc_id = M_Rock_Fhair_Stub
		frontend_desc = qs(0x4371be74)
		mesh = `models/CAR/Male/M_Rock_Fhair_Stub`
		deform_mesh = `models/CAR/Male/M_Rock_Fhair_Stub_def`
		$CAS_Male_Hair_Common_Settings_SkinShader
		random_weight = 0.0
	}
	{
		desc_id = M_Rock_Fhair_Goatee01
		frontend_desc = qs(0x51861c55)
		mesh = `models/CAR/Male/M_Rock_Fhair_Goatee01`
		deform_mesh = `models/CAR/Male/M_Rock_Fhair_Goatee01_def`
		$CAS_Male_Hair_Common_Settings
		random_weight = 1.0
	}
	{
		desc_id = M_Rock_Fhair_Goatee02
		frontend_desc = qs(0x3ffb7e3d)
		mesh = `models/CAR/Male/M_Rock_Fhair_Goatee02`
		deform_mesh = `models/CAR/Male/M_Rock_Fhair_Goatee02_def`
		$CAS_Male_Hair_Common_Settings
		random_weight = 1.0
	}
	{
		desc_id = M_Rock_Fhair_Goatee03
		frontend_desc = qs(0x963b21da)
		mesh = `models/CAR/Male/M_Rock_Fhair_Goatee03`
		deform_mesh = `models/CAR/Male/M_Rock_Fhair_Goatee03_def`
		$CAS_Male_Hair_Common_Settings
		random_weight = 1.0
	}
	{
		desc_id = M_Clsc_Fhair_Stache01
		frontend_desc = qs(0xb4651acf)
		mesh = `models/CAR/Male/M_Clsc_Fhair_Stache01`
		deform_mesh = `models/CAR/Male/M_Clsc_Fhair_Stache01_def`
		$CAS_Male_Hair_Common_Settings
		random_weight = 0.0
	}
	{
		desc_id = M_Clsc_Fhair_Stache04
		frontend_desc = qs(0xe1760794)
		mesh = `models/CAR/Male/M_Clsc_Fhair_Stache02`
		deform_mesh = `models/CAR/Male/M_Clsc_Fhair_Stache02_def`
		$CAS_Male_Hair_Common_Settings
		random_weight = 0.0
	}
	{
		desc_id = M_Clsc_FHair_Soulpatch
		frontend_desc = qs(0x507ad5bb)
		mesh = `models/CAR/Male/M_Clsc_FHair_Soulpatch`
		deform_mesh = `models/CAR/Male/M_Clsc_FHair_Soulpatch_def`
		$CAS_Male_Hair_Common_Settings_SkinShader
		$CAS_Male_Hair_Common_Settings
		random_weight = 0.0
	}
	{
		desc_id = M_Clsc_FHair_Clive
		frontend_desc = qs(0xe9db2fa2)
		mesh = `models/CAR/Male/M_Clsc_FHair_Clive`
		deform_mesh = `models/CAR/Male/M_Clsc_FHair_Clive_DEF`
		$CAS_Male_Hair_Common_Settings
		random_weight = 0.0
		materials = [
			M_Clsc_FHair_Clive_Primary
		]
	}
	{
		desc_id = M_Clsc_FHair_Clive3
		frontend_desc = qs(0xb4593717)
		mesh = `models/CAR/Male/M_Clsc_FHair_Clive3`
		deform_mesh = `models/CAR/Male/M_Clsc_FHair_Clive3_DEF`
		$CAS_Male_Hair_Common_Settings
		random_weight = 0.0
		materials = [
			M_Clsc_FHair_Clive3_Primary
		]
	}
	{
		desc_id = M_Clsc_Fhair_Burns01
		frontend_desc = qs(0xeb07e68a)
		mesh = `models/CAR/Male/M_Rock_Fhair_Burns01`
		deform_mesh = `models/CAR/Male/M_Rock_Fhair_Burns01_def`
		$CAS_Male_Hair_Common_Settings
		random_weight = 0.0
	}
	{
		desc_id = M_Clsc_Fhair_Country
		frontend_desc = qs(0xddb9e702)
		mesh = `models/CAR/Male/M_Clsc_Fhair_Country`
		deform_mesh = `models/CAR/Male/M_Clsc_Fhair_Country_def`
		$CAS_Male_Hair_Common_Settings
		random_weight = 0.0
	}
	{
		desc_id = M_Bmtl_FHair_Beard
		frontend_desc = qs(0xecf78185)
		mesh = `models/CAR/Male/M_Bmtl_FHair_Beard`
		deform_mesh = `models/CAR/Male/M_Bmtl_FHair_Beard_def`
		$CAS_Male_Hair_Common_Settings
		random_weight = 0.0
	}
	{
		desc_id = M_Metl_Fhair_Overgrth
		frontend_desc = qs(0x46c59274)
		mesh = `models/CAR/Male/M_Metl_Fhair_Overgrth`
		materials = [
			M_Metl_Fhair_Overgrth_Primary
		]
		deform_mesh = `models/CAR/Male/M_Metl_Fhair_Overgrth_def`
		CAS_Male_Hair_Common_Settings_SkinShader
		random_weight = 0.0
	}
	{
		desc_id = M_Metl_Fhair_Zzbeard
		frontend_desc = qs(0xad162047)
		mesh = `models/CAR/Male/M_Metl_Fhair_Zzbeard`
		materials = [
			M_Metl_Fhair_Zzbeard_Primary
		]
		deform_mesh = `models/CAR/Male/M_Metl_Fhair_Zzbeard_def`
		CAS_Male_Hair_Common_Settings_SkinShader
		random_weight = 0.0
	}
	{
		desc_id = M_Metl_Fhair_BlackB
		frontend_desc = qs(0x0652f2e0)
		mesh = `models/CAR/Male/M_Metl_Fhair_BlackB`
		materials = [
			M_Metl_Fhair_BlackB_Primary
			M_Metl_Fhair_BlackB_Secondary
		]
		deform_mesh = `models/CAR/Male/M_Metl_Fhair_BlackB_def`
		CAS_Male_Hair_Common_Settings_SkinShader
		random_weight = 0.0
	}
	{
		desc_id = M_Mtl_Fhair_Axel4
		frontend_desc = qs(0x910e3ea9)
		mesh = `models/CAR/Male/M_Mtl_Fhair_Axel4`
		deform_mesh = `models/CAR/Male/M_Mtl_Fhair_Axel4_def`
		materials = [
			Axel4_Fhair_Primary
		]
		$CAS_Male_Hair_Common_Settings
		random_weight = 0.0
	}
]
CAS_Male_Age = [
	{
		desc_id = CAR_Male_Teen
		frontend_desc = qs(0xe40e025b)
	}
	{
		desc_id = CAR_Male_Mature
		replace = `tex/models/Characters/car/male/car_GH5_male_head_n`
		with = `tex/models/Characters/Layers/CAR/Male/Age/CAR_Male_Age03_N`
		frontend_desc = qs(0xbe8a142d)
		in = CAS_Body
		in2 = CAS_Body
		random_weight = 0.25
	}
	{
		desc_id = CAR_Male_Aged
		replace = `tex/models/Characters/car/male/car_GH5_male_head_n`
		with = `tex/models/Characters/Layers/CAR/Male/Age/CAR_Male_Age04_N`
		frontend_desc = qs(0x1dd22d68)
		in = CAS_Body
		in2 = CAS_Body
		random_weight = 0.0
	}
	{
		desc_id = CAR_Male_Old
		replace = `tex/models/Characters/car/male/car_GH5_male_head_n`
		with = `tex/models/Characters/Layers/CAR/Male/Age/CAR_Male_Age05_N`
		frontend_desc = qs(0xc05200fd)
		in = CAS_Body
		in2 = CAS_Body
		random_weight = 0.0
	}
]
CAS_Male_Teeth = [
	{
		desc_id = CAR_male_teeth
		frontend_desc = qs(0x675459e3)
		mesh = `models/CAR/male/CAR_male_teeth`
		deform_mesh = `models/CAR/male/CAR_male_teeth_def`
	}
	{
		desc_id = CAR_male_teeth01
		frontend_desc = qs(0x038dcbee)
		mesh = `models/CAR/male/CAR_male_teeth01`
		deform_mesh = `models/CAR/male/CAR_male_teeth01_def`
		random_weight = 0.0
	}
	{
		desc_id = CAR_male_teeth02
		frontend_desc = qs(0x1a2ce811)
		mesh = `models/CAR/male/CAR_male_teeth02`
		deform_mesh = `models/CAR/male/CAR_male_teeth02_def`
		random_weight = 0.0
	}
	{
		desc_id = CAR_male_teeth03
		frontend_desc = qs(0xd067d16e)
		mesh = `models/CAR/male/CAR_male_teeth03`
		deform_mesh = `models/CAR/male/CAR_male_teeth03_def`
		random_weight = 0.0
	}
]
