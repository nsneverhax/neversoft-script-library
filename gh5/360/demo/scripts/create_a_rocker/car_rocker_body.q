cas_reskin_materials = [
	car_female_head
	car_female_mouth
	car_female_eye
	car_female_eyebrows
	car_female_eyelashes
	car_female_eyeshell
	car_female_lips
	car_female_body
	car_female_teeth
	car_male_head
	car_male_mouth
	car_male_eye
	car_male_eyebrows
	car_male_eyelashes
	car_male_shell
	car_male_body
	car_male_teeth
]
cas_create_a_rocker_female = {
	mesh = `models/car/female/car_female_body`
	shader = $cas_shader_skin
	material_groups = [
		{
			desc_id = skin
			materials = [
				car_female_head
				car_female_body
				car_female_arml
				car_female_armr
				car_female_hands
				car_female_legs
				car_female_midboot
				car_female_tallboot
				car_female_feet
			]
		}
		{
			desc_id = eyes
			materials = [
				car_female_eye
			]
		}
		{
			desc_id = nails
			materials = [
				car_female_nails
			]
		}
		{
			desc_id = eyebrows
			materials = [
				car_female_eyebrows
			]
		}
	]
	skeleton = gh_rocker_female
	skeleton_path = 'skeletons/GH_Rocker_Female.ske'
	ragdoll = ragdoll_rocker_female
	ragdoll_path = 'Ragdolls/CAR/Female/GH_Rocker_Female_Ragdoll.rag'
	accessory_bones = rocker_accessory_bones
	ragdoll_collision_group = ragdollcollisiongroups_rocker_female
	ik_params_guitar = hero_ik_params
	ik_params_drum = drummer_ik_params
	ik_params_vocals = singer_ik_params
	ik_params_frontend = car_ik_params
	is_female = 1
	uv_textures = {
		car_brow = {
			pass = m_samppass2diffuse
			material = car_female_eyebrows
		}
	}
	anim_struct = car_female_anim_struct
	deform_mesh = `models/car/female/car_female_body_def`
	deform_bones = car_bones_female_face
	deform_skel = face_deform
	deform_child_parts = [
		cas_female_hat
		cas_female_hair
		cas_female_hat_hair
		cas_female_facial_hair
		cas_female_acc_face
		cas_female_acc_ears
		cas_female_teeth
	]
	divisions = [
		{
			desc_id = head
			material = car_female_head
			target = cas_1
		}
		{
			desc_id = `left arm`
			material = car_female_arml
			target = cas_1
		}
		{
			desc_id = `right arm`
			material = car_female_armr
			target = cas_1
		}
		{
			desc_id = body
			material = car_female_body
			target = cas_1
		}
	]
	cap_textures = [
		{
			base_tex = `tex/models/characters/global/global_blank_head_dnc`
			material = car_female_head
			omit_base_tex
			preset_layers = [
				{
					desc_id = `eyeshadow2 makeup`
					frontend_desc = qs(0x07d16722)
					mask = $car_female_makeup_eyeshadow2
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `eyeshadow1 makeup`
					frontend_desc = qs(0x2e19d3d0)
					mask = $car_female_makeup_eyeshadow1
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `blush makeup`
					frontend_desc = qs(0x72f57d70)
					mask = $car_female_makeup_blush
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `eyeliner makeup`
					frontend_desc = qs(0xf981e4bc)
					mask = $car_female_makeup_eyeliner
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `lip makeup`
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
			base_tex = `tex\models\characters\car\female\car_female_arml_tat_o_dnc`
			material = car_female_arml
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
			base_tex = `tex\models\characters\car\female\car_female_armr_tat_o_dnc`
			material = car_female_armr
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
			base_tex = `tex\models\characters\car\female\car_female_body_tat_o_dnc`
			material = car_female_body
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
		cas_physique = cas_female_physique
		cas_eyebrows = cas_female_eyebrows
		cas_hair = cas_female_hair
		cas_hat_hair = cas_female_hat_hair
		cas_hat = cas_female_hat
		cas_facial_hair = cas_female_facial_hair
		cas_torso = cas_female_torso
		cas_legs = cas_female_legs
		cas_shoes = cas_female_shoes
		cas_acc_left = cas_female_acc_left
		cas_acc_right = cas_female_acc_right
		cas_acc_face = cas_female_acc_face
		cas_acc_ears = cas_female_acc_ears
		cas_age = cas_female_age
		cas_teeth = cas_female_teeth
	}
}
cas_create_a_rocker_male = {
	mesh = `models/car/male/car_male_body`
	shader = $cas_shader_skin
	material_groups = [
		{
			desc_id = skin
			materials = [
				car_male_head
				car_male_body
				car_male_arml
				car_male_armr
				car_male_hands
				car_male_legs
				car_male_midboot
				car_male_tallboot
				car_male_feet
			]
		}
		{
			desc_id = eyes
			materials = [
				car_male_eye
			]
		}
		{
			desc_id = nails
			materials = [
				car_male_nails
			]
		}
		{
			desc_id = eyebrows
			materials = [
				car_male_eyebrows
			]
		}
	]
	skeleton = gh_rocker_male
	skeleton_path = 'skeletons/GH_Rocker_Male.ske'
	ragdoll = ragdoll_rocker_male
	ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
	accessory_bones = rocker_accessory_bones
	ragdoll_collision_group = ragdollcollisiongroups_rocker_female
	ik_params_guitar = hero_ik_params
	ik_params_drum = drummer_ik_params
	ik_params_vocals = singer_ik_params
	ik_params_frontend = car_ik_params
	is_female = 0
	uv_textures = {
		car_brow = {
			pass = m_samppass2diffuse
			material = car_male_eyebrows
		}
	}
	anim_struct = car_male_anim_struct
	deform_mesh = `models/car/male/car_male_body_def`
	deform_bones = car_bones_male_face
	deform_skel = gh_male_deform
	deform_child_parts = [
		cas_male_hat
		cas_male_hair
		cas_male_hat_hair
		cas_male_facial_hair
		cas_male_acc_face
		cas_male_acc_ears
		cas_male_teeth
	]
	divisions = [
		{
			desc_id = head
			material = car_male_head
			target = cas_1
		}
		{
			desc_id = `left arm`
			material = car_male_arml
			target = cas_1
		}
		{
			desc_id = `right arm`
			material = car_male_armr
			target = cas_1
		}
		{
			desc_id = body
			material = car_male_body
			target = cas_1
		}
	]
	cap_textures = [
		{
			base_tex = `tex/models/characters/global/global_blank_head_dnc`
			material = car_male_head
			omit_base_tex
			preset_layers = [
				{
					desc_id = `eyeshadow2 makeup`
					frontend_desc = qs(0x07d16722)
					mask = $car_male_makeup_eyeshadow2
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `eyeshadow1 makeup`
					frontend_desc = qs(0x2e19d3d0)
					mask = $car_male_makeup_eyeshadow1
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `blush makeup`
					frontend_desc = qs(0x72f57d70)
					mask = $car_male_makeup_blush
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `eyeliner makeup`
					frontend_desc = qs(0xf981e4bc)
					mask = $car_male_makeup_eyeliner
					wrap_u
					cas_1
					post_userlayer
				}
				{
					desc_id = `lip makeup`
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
			base_tex = `tex\models\characters\car\female\car_female_arml_tat_o_dnc`
			material = car_male_arml
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
			base_tex = `tex\models\characters\car\female\car_female_armr_tat_o_dnc`
			material = car_male_armr
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
			base_tex = `tex\models\characters\car\female\car_female_body_tat_o_dnc`
			material = car_male_body
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
		cas_physique = cas_male_physique
		cas_eyebrows = cas_male_eyebrows
		cas_hair = cas_male_hair
		cas_hat_hair = cas_male_hat_hair
		cas_hat = cas_male_hat
		cas_facial_hair = cas_male_facial_hair
		cas_torso = cas_male_torso
		cas_legs = cas_male_legs
		cas_shoes = cas_male_shoes
		cas_acc_left = cas_male_acc_left
		cas_acc_right = cas_male_acc_right
		cas_acc_face = cas_male_acc_face
		cas_acc_ears = cas_male_acc_ears
		cas_age = cas_male_age
		cas_teeth = cas_male_teeth
	}
}
cas_eyes = [
	{
		desc_id = car_blue_eyes
		frontend_desc = qs(0xc2a332ac)
	}
	{
		desc_id = car_deepblue_eyes
		frontend_desc = qs(0x145e08d7)
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color01_d`
		in = cas_body
	}
	{
		desc_id = car_hazel_eyes
		frontend_desc = qs(0x3580fbc8)
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color02_d`
		in = cas_body
	}
	{
		desc_id = car_green_eyes
		frontend_desc = qs(0x09cccda8)
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color03_d`
		in = cas_body
	}
	{
		desc_id = car_brown_eyes
		frontend_desc = qs(0x51295f5a)
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color06_d`
		in = cas_body
	}
	{
		desc_id = car_violet_eyes
		frontend_desc = qs(0xb00367a3)
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color09_d`
		in = cas_body
	}
	{
		desc_id = car_dead_eyes
		frontend_desc = qs(0xf51f7fef)
		genre = [
			goth
		]
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color04_d`
		in = cas_body
	}
	{
		desc_id = car_albino_eyes
		frontend_desc = qs(0xece7a35f)
		genre = [
			goth
			`black metal`
		]
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color05_d`
		in = cas_body
	}
	{
		desc_id = car_red_eyes
		frontend_desc = qs(0x3662bea0)
		genre = [
			goth
			`black metal`
		]
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color07_d`
		in = cas_body
	}
	{
		desc_id = car_demon_eyes
		frontend_desc = qs(0xc8cc93ca)
		genre = [
			`black metal`
		]
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color08_d`
		in = cas_body
	}
	{
		desc_id = car_fire_eyes
		frontend_desc = qs(0xd69f927c)
		genre = [
			`black metal`
		]
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color11_d`
		in = cas_body
	}
	{
		desc_id = car_blank_eyes
		frontend_desc = qs(0x1662535c)
		genre = [
			`black metal`
		]
		replace = `tex\models\characters\global\global_car_eye_d_xil`
		with = `tex\models\characters\global\global_car_eye_color10_d`
		in = cas_body
	}
]
cas_body = [
	{
		$cas_create_a_rocker_female
		desc_id = gh4_car_female
		frontend_desc = qs(0x09b7b554)
		frontend_desc_with_avatar = qs(0x29c6468e)
		icon = icon_gender_female
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_male
		frontend_desc = qs(0xb08d72a6)
		frontend_desc_with_avatar = qs(0x59b45130)
		icon = icon_gender_male
	}
	{
		desc_id = nobody
		hidden
		skeleton = gh_rocker_female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		ragdoll = ragdoll_rocker_female
		ragdoll_path = 'Ragdolls/CAR/Female/GH_Rocker_Female_Ragdoll.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_female
		ik_params_guitar = hero_ik_params
		ik_params_drum = drummer_ik_params
		ik_params_vocals = singer_ik_params
		ik_params_frontend = car_ik_params
		is_female = 1
		anim_struct = car_female_anim_struct
		body_specific_parts = {
			cas_physique = cas_female_physique
		}
	}
]
