cas_reskin_materials = [
	CAR_Female_Head
	CAR_Female_Mouth
	CAR_Female_Eye
	CAR_female_EYEBROWS
	CAR_Female_Eyelashes
	CAR_Female_EyeShell
	CAR_Female_Lips
	CAR_Female_BODY
	CAR_Female_teeth
	CAR_Male_Head
	CAR_Male_Mouth
	CAR_Male_Eye
	CAR_Male_Eyebrows
	CAR_Male_Eyelashes
	CAR_Male_Shell
	CAR_Male_Body
	CAR_male_teeth
]
cas_create_a_rocker_female = {
	mesh = `models/CAR/Female/CAR_Female_Body`
	shader = $cas_shader_skin
	material_groups = [
		{
			desc_id = skin
			materials = [
				CAR_Female_Head
				CAR_Female_BODY
				CAR_female_ArmL
				CAR_female_ArmR
				CAR_female_Hands
				CAR_female_Legs
				CAR_female_Midboot
				CAR_female_Tallboot
				CAR_female_Feet
			]
		}
		{
			desc_id = Eyes
			materials = [
				CAR_Female_Eye
			]
		}
		{
			desc_id = Nails
			materials = [
				CAR_female_Nails
			]
		}
		{
			desc_id = Eyebrows
			materials = [
				CAR_female_EYEBROWS
			]
		}
	]
	Skeleton = gh_rocker_female
	skeleton_path = 'skeletons/GH_Rocker_Female.ske'
	Ragdoll = ragdoll_Rocker_Female
	ragdoll_path = 'Ragdolls/CAR/Female/GH_Rocker_Female_Ragdoll.rag'
	accessory_bones = Rocker_accessory_bones
	ragdoll_collision_group = RagdollCollisionGroups_Rocker_Female
	ik_params_guitar = hero_IK_Params
	ik_params_drum = Drummer_IK_Params
	ik_params_vocals = singer_IK_Params
	ik_params_frontend = CAR_IK_Params
	is_female = 1
	uv_textures = {
		CAR_Brow = {
			pass = m_sampPass2Diffuse
			material = CAR_female_EYEBROWS
		}
	}
	anim_struct = car_female_anim_struct
	deform_mesh = `models/CAR/Female/CAR_Female_Body_Def`
	deform_bones = CAR_Bones_Female_Face
	deform_skel = face_deform
	deform_child_parts = [
		CAS_Female_Hat
		CAS_Female_Hair
		CAS_Female_Hat_Hair
		CAS_Female_Facial_Hair
		CAS_Female_Acc_Face
		CAS_Female_Acc_Ears
		CAS_Female_Teeth
	]
	divisions = [
		{
			desc_id = Head
			material = CAR_Female_Head
			target = cas_1
		}
		{
			desc_id = `Left	Arm`
			material = CAR_female_ArmL
			target = cas_1
		}
		{
			desc_id = `Right	Arm`
			material = CAR_female_ArmR
			target = cas_1
		}
		{
			desc_id = Body
			material = CAR_Female_BODY
			target = cas_1
		}
	]
	cap_textures = [
		{
			base_tex = `tex/models/Characters/Global/Global_Blank_Head_dnc`
			material = CAR_Female_Head
			omit_base_tex
			preset_layers = [
				{
					desc_id = `Eyeshadow2	makeup`
					frontend_desc = qs(0x07d16722)
					mask = $car_female_makeup_eyeshadow2
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `Eyeshadow1	makeup`
					frontend_desc = qs(0x2e19d3d0)
					mask = $car_female_makeup_eyeshadow1
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `Blush	makeup`
					frontend_desc = qs(0x72f57d70)
					mask = $car_female_makeup_blush
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `Eyeliner	makeup`
					frontend_desc = qs(0xf981e4bc)
					mask = $car_female_makeup_eyeliner
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `Lip	Makeup`
					frontend_desc = qs(0x2da130ff)
					mask = $car_female_makeup_lip
					wrap_u
					cas_1
					post_userlayer
				}
			]
			user_layer_settings = {
				wrap_u
				cas_1
				initial_values = {
					x_scale = 20
					y_scale = 20
				}
			}
		}
		{
			base_tex = `tex/models/Characters/CAR/female/CAR_female_ARML_tat_O_dnc`
			material = CAR_female_ArmL
			omit_base_tex
			user_layer_settings = {
				wrap_u
				cas_1
				initial_values = {
					x_scale = 30
					y_scale = 30
				}
			}
		}
		{
			base_tex = `tex/models/Characters/CAR/female/CAR_female_ARMR_tat_O_dnc`
			material = CAR_female_ArmR
			omit_base_tex
			user_layer_settings = {
				wrap_u
				cas_1
				initial_values = {
					x_scale = 30
					y_scale = 30
				}
			}
		}
		{
			base_tex = `tex/models/Characters/CAR/female/CAR_female_BODY_tat_O_dnc`
			material = CAR_Female_BODY
			omit_base_tex
			user_layer_settings = {
				wrap_u
				cas_1
				initial_values = {
					x_scale = 20
					y_scale = 20
				}
			}
		}
	]
	body_specific_parts = {
		CAS_Physique = CAS_Female_Physique
		CAS_Eyebrows = CAS_female_Eyebrows
		CAS_Hair = CAS_Female_Hair
		CAS_Hat_Hair = CAS_Female_Hat_Hair
		CAS_Hat = CAS_Female_Hat
		cas_facial_hair = CAS_Female_Facial_Hair
		CAS_Torso = CAS_Female_Torso
		CAS_Legs = CAS_Female_Legs
		CAS_Shoes = CAS_Female_Shoes
		CAS_Acc_Left = CAS_Female_Acc_Left
		CAS_Acc_Right = CAS_Female_Acc_Right
		CAS_Acc_Face = CAS_Female_Acc_Face
		CAS_Acc_Ears = CAS_Female_Acc_Ears
		CAS_Age = CAS_Female_Age
		CAS_Teeth = CAS_Female_Teeth
	}
}
cas_create_a_rocker_male = {
	mesh = `models/CAR/Male/CAR_Male_Body`
	shader = $cas_shader_skin
	material_groups = [
		{
			desc_id = skin
			materials = [
				CAR_Male_Head
				CAR_Male_Body
				CAR_male_ArmL
				CAR_male_ArmR
				CAR_male_Hands
				CAR_male_Legs
				CAR_male_Midboot
				CAR_male_Tallboot
				CAR_male_Feet
			]
		}
		{
			desc_id = Eyes
			materials = [
				CAR_Male_Eye
			]
		}
		{
			desc_id = Nails
			materials = [
				CAR_male_Nails
			]
		}
		{
			desc_id = Eyebrows
			materials = [
				CAR_Male_Eyebrows
			]
		}
	]
	Skeleton = gh_rocker_male
	skeleton_path = 'skeletons/GH_Rocker_Male.ske'
	Ragdoll = ragdoll_Rocker_male
	ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
	accessory_bones = Rocker_accessory_bones
	ragdoll_collision_group = RagdollCollisionGroups_Rocker_Female
	ik_params_guitar = hero_IK_Params
	ik_params_drum = Drummer_IK_Params
	ik_params_vocals = singer_IK_Params
	ik_params_frontend = CAR_IK_Params
	is_female = 0
	uv_textures = {
		CAR_Brow = {
			pass = m_sampPass2Diffuse
			material = CAR_Male_Eyebrows
		}
	}
	anim_struct = car_male_anim_struct
	deform_mesh = `models/CAR/Male/CAR_Male_Body_Def`
	deform_bones = CAR_Bones_Male_Face
	deform_skel = GH_Male_Deform
	deform_child_parts = [
		CAS_Male_Hat
		CAS_Male_Hair
		CAS_Male_Hat_Hair
		CAS_Male_Facial_Hair
		CAS_Male_Acc_Face
		CAS_Male_Acc_Ears
		CAS_Male_Teeth
	]
	divisions = [
		{
			desc_id = Head
			material = CAR_Male_Head
			target = cas_1
		}
		{
			desc_id = `Left	Arm`
			material = CAR_male_ArmL
			target = cas_1
		}
		{
			desc_id = `Right	Arm`
			material = CAR_male_ArmR
			target = cas_1
		}
		{
			desc_id = Body
			material = CAR_Male_Body
			target = cas_1
		}
	]
	cap_textures = [
		{
			base_tex = `tex/models/Characters/Global/Global_Blank_Head_dnc`
			material = CAR_Male_Head
			omit_base_tex
			preset_layers = [
				{
					desc_id = `Eyeshadow2	makeup`
					frontend_desc = qs(0x07d16722)
					mask = $car_male_makeup_eyeshadow2
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `Eyeshadow1	makeup`
					frontend_desc = qs(0x2e19d3d0)
					mask = $car_male_makeup_eyeshadow1
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `Blush	makeup`
					frontend_desc = qs(0x72f57d70)
					mask = $car_male_makeup_blush
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `Eyeliner	makeup`
					frontend_desc = qs(0xf981e4bc)
					mask = $car_male_makeup_eyeliner
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `Lip	Makeup`
					frontend_desc = qs(0x2da130ff)
					mask = $car_male_makeup_lip
					wrap_u
					cas_1
					post_userlayer
				}
			]
			user_layer_settings = {
				wrap_u
				cas_1
				initial_values = {
					x_scale = 30
					y_scale = 30
				}
			}
		}
		{
			base_tex = `tex/models/Characters/CAR/female/CAR_female_ARML_tat_O_dnc`
			material = CAR_male_ArmL
			omit_base_tex
			user_layer_settings = {
				wrap_u
				cas_1
				initial_values = {
					x_scale = 30
					y_scale = 30
				}
			}
		}
		{
			base_tex = `tex/models/Characters/CAR/female/CAR_female_ARMR_tat_O_dnc`
			material = CAR_male_ArmR
			omit_base_tex
			user_layer_settings = {
				wrap_u
				cas_1
				initial_values = {
					x_scale = 30
					y_scale = 30
				}
			}
		}
		{
			base_tex = `tex/models/Characters/CAR/female/CAR_female_BODY_tat_O_dnc`
			material = CAR_Male_Body
			omit_base_tex
			user_layer_settings = {
				wrap_u
				cas_1
				initial_values = {
					x_scale = 30
					y_scale = 30
				}
			}
		}
	]
	body_specific_parts = {
		CAS_Physique = CAS_Male_Physique
		CAS_Eyebrows = CAS_male_Eyebrows
		CAS_Hair = CAS_Male_Hair
		CAS_Hat_Hair = CAS_Male_Hat_Hair
		CAS_Hat = CAS_Male_Hat
		cas_facial_hair = CAS_Male_Facial_Hair
		CAS_Torso = CAS_Male_Torso
		CAS_Legs = CAS_Male_Legs
		CAS_Shoes = CAS_Male_Shoes
		CAS_Acc_Left = CAS_Male_Acc_Left
		CAS_Acc_Right = CAS_Male_Acc_Right
		CAS_Acc_Face = CAS_Male_Acc_Face
		CAS_Acc_Ears = CAS_Male_Acc_Ears
		CAS_Age = CAS_Male_Age
		CAS_Teeth = CAS_Male_Teeth
	}
}
CAS_Eyes = [
	{
		desc_id = CAR_Blue_Eyes
		frontend_desc = qs(0xc2a332ac)
	}
	{
		desc_id = CAR_DeepBlue_Eyes
		frontend_desc = qs(0x145e08d7)
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color01_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Hazel_Eyes
		frontend_desc = qs(0x3580fbc8)
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color02_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Green_Eyes
		frontend_desc = qs(0x09cccda8)
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color03_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Brown_Eyes
		frontend_desc = qs(0x51295f5a)
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color06_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Violet_Eyes
		frontend_desc = qs(0xb00367a3)
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color09_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Dead_Eyes
		frontend_desc = qs(0xf51f7fef)
		genre = [
			Goth
		]
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color04_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Albino_Eyes
		frontend_desc = qs(0xece7a35f)
		genre = [
			Goth
			`Black	Metal`
		]
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color05_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Red_Eyes
		frontend_desc = qs(0x3662bea0)
		genre = [
			Goth
			`Black	Metal`
		]
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color07_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Demon_Eyes
		frontend_desc = qs(0xc8cc93ca)
		genre = [
			`Black	Metal`
		]
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color08_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Fire_Eyes
		frontend_desc = qs(0xd69f927c)
		genre = [
			`Black	Metal`
		]
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color11_D`
		in = CAS_Body
	}
	{
		desc_id = CAR_Blank_Eyes
		frontend_desc = qs(0x1662535c)
		genre = [
			`Black	Metal`
		]
		replace = `tex\models\Characters\Global\Global_CAR_eye_D_xil`
		with = `tex\models\Characters\Global\Global_CAR_eye_color10_D`
		in = CAS_Body
	}
]
CAS_Body = [
	{
		$cas_create_a_rocker_female
		desc_id = GH4_CAR_Female
		frontend_desc = qs(0x09b7b554)
		frontend_desc_with_avatar = qs(0x09b7b554)
		icon = icon_gender_Female
	}
	{
		$cas_create_a_rocker_male
		desc_id = GH4_CAR_Male
		frontend_desc = qs(0xb08d72a6)
		frontend_desc_with_avatar = qs(0xb08d72a6)
		icon = icon_gender_Male
	}
	{
		desc_id = NoBody
		hidden
		Skeleton = gh_rocker_female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		Ragdoll = ragdoll_Rocker_Female
		ragdoll_path = 'Ragdolls/CAR/Female/GH_Rocker_Female_Ragdoll.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Female
		ik_params_guitar = hero_IK_Params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		is_female = 1
		anim_struct = car_female_anim_struct
		body_specific_parts = {
			CAS_Physique = CAS_Female_Physique
		}
	}
]
