cas_reskin_materials = [
	car_female_head
	car_female_mouth
	car_female_eye
	car_female_eyebrows
	car_female_eyelashes
	car_female_eyeshell
	car_female_lips
	car_female_body
	car_male_head
	car_male_mouth
	car_male_eye
	car_male_eyebrows
	car_male_eyelashes
	car_male_shell
	car_male_body
]
cas_create_a_rocker_female = {
	mesh = 'models/CAR/Female/CAR_Female_Body.skin'
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
				car_female_feet
				car_female_midboot
				car_female_tallboot
			]
		}
		{
			desc_id = eyes
			materials = [
				car_female_eye
			]
		}
	]
	Skeleton = gh_rocker_female
	skeleton_path = 'skeletons/GH_Rocker_Female.ske'
	ragdoll = ragdoll_rocker_female
	ragdoll_path = 'Ragdolls/CAR/Female/GH_Rocker_Female_Ragdoll.rag'
	accessory_bones = rocker_accessory_bones
	ragdoll_collision_group = ragdollcollisiongroups_rocker_female
	ik_params_guitar = Hero_Ik_params
	ik_params_drum = Drummer_IK_Params
	ik_params_vocals = Singer_IK_Params
	ik_params_frontend = car_ik_params
	is_female = 1
	anim_struct = car_female_anim_struct
	deform_mesh = 'models/CAR/Female/CAR_Female_Body_Def.skin'
	deform_bones = car_bones_female_face
	deform_skel = face_deform
	deform_child_parts = [
		cas_female_hat
		cas_female_hair
		cas_female_hat_hair
		cas_female_facial_hair
		cas_female_acc_face
		cas_female_acc_ears
	]
	divisions = [
		{
			desc_id = head
			material = car_female_head
			target = cas_1
		}
		{
			desc_id = `left	arm`
			material = car_female_arml
			target = cas_1
		}
		{
			desc_id = `right	arm`
			material = car_female_armr
			target = cas_1
		}
		{
			desc_id = Body
			material = car_female_body
			target = cas_1
		}
	]
	sections = [
		{
			desc_id = `eye	makeup`
			frontend_desc = qs(0x67c0629b)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_female_makeup
			wrap_u
			cas_1
			omit_base_tex
			post_userlayer
		}
		{
			desc_id = `lip	makeup`
			frontend_desc = qs(0x2da130ff)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_female_makeup_lip
			wrap_u
			cas_1
			omit_base_tex
			post_userlayer
		}
		{
			desc_id = car_metallica
			frontend_desc = qs(0xa2a4f973)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_metallica
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_bands
			frontend_desc = qs(0xd3bf2886)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_bands
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_primitives
			frontend_desc = qs(0x7dc468d3)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_basic_primitives_1
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_outlines_primitives
			frontend_desc = qs(0x955f1285)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_basic_primitives_2
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_tattoo_decal
			frontend_desc = qs(0x80142024)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_gradiant_shapes
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_icon_decals
			frontend_desc = qs(0xcd9be7cd)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_icons
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_graphics
			frontend_desc = qs(0xde6cb37a)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_graphics
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_sponsors
			frontend_desc = qs(0xc26f9911)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_sponsors
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = `font	a1`
			frontend_desc = qs(0x272e6e53)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_fontgrid_title_a1
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 50
				y_scale = 50
			}
		}
		{
			desc_id = `font	a6`
			frontend_desc = qs(0x0c033d90)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_fontgrid_text_a6
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 50
				y_scale = 50
			}
		}
		{
			desc_id = `font	a8`
			frontend_desc = qs(0x15180cd1)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_female_head
			mask = $car_fontgrid_text_a8
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 50
				y_scale = 50
			}
		}
		{
			desc_id = car_metallica
			frontend_desc = qs(0xa2a4f973)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_metallica
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_bands
			frontend_desc = qs(0xd3bf2886)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_bands
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_primitives
			frontend_desc = qs(0x7dc468d3)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_basic_primitives_1
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_outlines_primitives
			frontend_desc = qs(0x955f1285)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_basic_primitives_2
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_tattoo_decal
			frontend_desc = qs(0x80142024)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_gradiant_shapes
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_icon_decals
			frontend_desc = qs(0xcd9be7cd)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_icons
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_graphics
			frontend_desc = qs(0xde6cb37a)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_graphics
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_sponsors
			frontend_desc = qs(0xc26f9911)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_sponsors
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = `font	a1`
			frontend_desc = qs(0x272e6e53)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_fontgrid_title_a1
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a6`
			frontend_desc = qs(0x0c033d90)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_fontgrid_text_a6
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a8`
			frontend_desc = qs(0x15180cd1)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_female_arml
			mask = $car_fontgrid_text_a8
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = car_metallica
			frontend_desc = qs(0xa2a4f973)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_metallica
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_bands
			frontend_desc = qs(0xd3bf2886)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_bands
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_primitives
			frontend_desc = qs(0x7dc468d3)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_basic_primitives_1
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_outlines_primitives
			frontend_desc = qs(0x955f1285)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_basic_primitives_2
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_tattoo_decal
			frontend_desc = qs(0x80142024)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_gradiant_shapes
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_icon_decals
			frontend_desc = qs(0xcd9be7cd)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_icons
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_graphics
			frontend_desc = qs(0xde6cb37a)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_graphics
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_sponsors
			frontend_desc = qs(0xc26f9911)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_sponsors
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = `font	a1`
			frontend_desc = qs(0x272e6e53)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_fontgrid_title_a1
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a6`
			frontend_desc = qs(0x0c033d90)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_fontgrid_text_a6
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a8`
			frontend_desc = qs(0x15180cd1)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_female_armr
			mask = $car_fontgrid_text_a8
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = car_metallica
			frontend_desc = qs(0xa2a4f973)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_metallica
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_bands
			frontend_desc = qs(0xd3bf2886)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_bands
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_primitives
			frontend_desc = qs(0x7dc468d3)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_basic_primitives_1
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_outlines_primitives
			frontend_desc = qs(0x955f1285)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_basic_primitives_2
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_tattoo_decal
			frontend_desc = qs(0x80142024)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_gradiant_shapes
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_icon_decals
			frontend_desc = qs(0xcd9be7cd)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_icons
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_graphics
			frontend_desc = qs(0xde6cb37a)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_graphics
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = car_sponsors
			frontend_desc = qs(0xc26f9911)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_sponsors
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 20
				y_scale = 20
			}
		}
		{
			desc_id = `font	a1`
			frontend_desc = qs(0x272e6e53)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_fontgrid_title_a1
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a6`
			frontend_desc = qs(0x0c033d90)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_fontgrid_text_a6
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a8`
			frontend_desc = qs(0x15180cd1)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_female_body
			mask = $car_fontgrid_text_a8
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
	]
	body_specific_parts = {
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
		cas_intro_anim = cas_female_intro_anim
		cas_win_anim = cas_female_win_anim
		cas_lose_anim = cas_female_lose_anim
	}
}
cas_create_a_rocker_male = {
	mesh = 'models/CAR/Male/CAR_Male_Body.skin'
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
				car_male_feet
				car_male_midboot
				car_male_tallboot
			]
		}
		{
			desc_id = eyes
			materials = [
				car_male_eye
			]
		}
	]
	Skeleton = gh_rocker_male
	skeleton_path = 'skeletons/GH_Rocker_Male.ske'
	ragdoll = ragdoll_rocker_male
	ragdoll_path = 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
	accessory_bones = rocker_accessory_bones
	ragdoll_collision_group = ragdollcollisiongroups_rocker_female
	ik_params_guitar = Hero_Ik_params
	ik_params_drum = Drummer_IK_Params
	ik_params_vocals = Singer_IK_Params
	ik_params_frontend = car_ik_params
	is_female = 0
	anim_struct = car_male_anim_struct
	deform_mesh = 'models/CAR/Male/CAR_Male_Body_Def.skin'
	deform_bones = car_bones_male_face
	deform_skel = gh_male_deform
	deform_child_parts = [
		cas_male_hat
		cas_male_hair
		cas_male_hat_hair
		cas_male_facial_hair
		cas_male_acc_face
		cas_male_acc_ears
	]
	divisions = [
		{
			desc_id = head
			material = car_male_head
			target = cas_1
		}
		{
			desc_id = `left	arm`
			material = car_male_arml
			target = cas_1
		}
		{
			desc_id = `right	arm`
			material = car_male_armr
			target = cas_1
		}
		{
			desc_id = Body
			material = car_male_body
			target = cas_1
		}
	]
	sections = [
		{
			desc_id = car_metallica
			frontend_desc = qs(0xa2a4f973)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_metallica
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_bands
			frontend_desc = qs(0xd3bf2886)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_bands
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_primitives
			frontend_desc = qs(0x7dc468d3)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_basic_primitives_1
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_outlines_primitives
			frontend_desc = qs(0x955f1285)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_basic_primitives_2
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_tattoo_decal
			frontend_desc = qs(0x80142024)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_gradiant_shapes
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_icon_decals
			frontend_desc = qs(0xcd9be7cd)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_icons
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_graphics
			frontend_desc = qs(0xde6cb37a)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_graphics
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_sponsors
			frontend_desc = qs(0xc26f9911)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_sponsors
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = `font	a1`
			frontend_desc = qs(0x272e6e53)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_fontgrid_title_a1
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 50
				y_scale = 50
			}
		}
		{
			desc_id = `font	a6`
			frontend_desc = qs(0x0c033d90)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_fontgrid_text_a6
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 50
				y_scale = 50
			}
		}
		{
			desc_id = `font	a8`
			frontend_desc = qs(0x15180cd1)
			base_tex = 'tex/models/Characters/Global/Global_Blank_Head_dnc.dds'
			material = car_male_head
			mask = $car_fontgrid_text_a8
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 50
				y_scale = 50
			}
		}
		{
			desc_id = car_metallica
			frontend_desc = qs(0xa2a4f973)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_metallica
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_bands
			frontend_desc = qs(0xd3bf2886)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_bands
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_primitives
			frontend_desc = qs(0x7dc468d3)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_basic_primitives_1
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_outlines_primitives
			frontend_desc = qs(0x955f1285)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_basic_primitives_2
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_tattoo_decal
			frontend_desc = qs(0x80142024)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_gradiant_shapes
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_icon_decals
			frontend_desc = qs(0xcd9be7cd)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_icons
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_graphics
			frontend_desc = qs(0xde6cb37a)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_graphics
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_sponsors
			frontend_desc = qs(0xc26f9911)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_sponsors
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = `font	a1`
			frontend_desc = qs(0x272e6e53)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_fontgrid_title_a1
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a6`
			frontend_desc = qs(0x0c033d90)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_fontgrid_text_a6
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a8`
			frontend_desc = qs(0x15180cd1)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
			material = car_male_armr
			mask = $car_fontgrid_text_a8
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = car_metallica
			frontend_desc = qs(0xa2a4f973)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_metallica
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_bands
			frontend_desc = qs(0xd3bf2886)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_bands
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_primitives
			frontend_desc = qs(0x7dc468d3)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_basic_primitives_1
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_outlines_primitives
			frontend_desc = qs(0x955f1285)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_basic_primitives_2
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_tattoo_decal
			frontend_desc = qs(0x80142024)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_gradiant_shapes
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_icon_decals
			frontend_desc = qs(0xcd9be7cd)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_icons
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_graphics
			frontend_desc = qs(0xde6cb37a)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_graphics
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_sponsors
			frontend_desc = qs(0xc26f9911)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_sponsors
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = `font	a1`
			frontend_desc = qs(0x272e6e53)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_fontgrid_title_a1
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a6`
			frontend_desc = qs(0x0c033d90)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_fontgrid_text_a6
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a8`
			frontend_desc = qs(0x15180cd1)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
			material = car_male_arml
			mask = $car_fontgrid_text_a8
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = car_metallica
			frontend_desc = qs(0xa2a4f973)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_metallica
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_bands
			frontend_desc = qs(0xd3bf2886)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_bands
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_primitives
			frontend_desc = qs(0x7dc468d3)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_basic_primitives_1
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_outlines_primitives
			frontend_desc = qs(0x955f1285)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_basic_primitives_2
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_tattoo_decal
			frontend_desc = qs(0x80142024)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_gradiant_shapes
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_icon_decals
			frontend_desc = qs(0xcd9be7cd)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_icons
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_graphics
			frontend_desc = qs(0xde6cb37a)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_graphics
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = car_sponsors
			frontend_desc = qs(0xc26f9911)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_sponsors
			userlayer
			omit_base_tex
			wrap_u
			cas_1
			initial_values = {
				x_scale = 30
				y_scale = 30
			}
		}
		{
			desc_id = `font	a1`
			frontend_desc = qs(0x272e6e53)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_fontgrid_title_a1
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a6`
			frontend_desc = qs(0x0c033d90)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_fontgrid_text_a6
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
		{
			desc_id = `font	a8`
			frontend_desc = qs(0x15180cd1)
			base_tex = 'tex\\models\\Characters\\CAR\\female\\CAR_female_BODY_tat_O_dnc.dds'
			material = car_male_body
			mask = $car_fontgrid_text_a8
			cas_1
			omit_base_tex
			wrap_u
			userlayer
			initial_values = {
				x_scale = 100
				y_scale = 100
			}
		}
	]
	body_specific_parts = {
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
		cas_intro_anim = cas_male_intro_anim
		cas_win_anim = cas_male_win_anim
		cas_lose_anim = cas_male_lose_anim
	}
}
cas_eyes = [
	{
		desc_id = car_blue_eyes
		frontend_desc = qs(0x6d040d7a)
	}
	{
		desc_id = car_deepblue_eyes
		frontend_desc = qs(0xa6b2b5c8)
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color01_D.dds'
		in = cas_body
	}
	{
		desc_id = car_hazel_eyes
		frontend_desc = qs(0x54841bcb)
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color02_D.dds'
		in = cas_body
	}
	{
		desc_id = car_green_eyes
		frontend_desc = qs(0x68c82dab)
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color03_D.dds'
		in = cas_body
	}
	{
		desc_id = car_brown_eyes
		frontend_desc = qs(0x302dbf59)
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color06_D.dds'
		in = cas_body
	}
	{
		desc_id = car_violet_eyes
		frontend_desc = qs(0x3b24b71c)
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color09_D.dds'
		in = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_dead_eyes
		frontend_desc = qs(0x5ab84039)
		genre = [
			goth
		]
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color04_D.dds'
		in = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_albino_eyes
		frontend_desc = qs(0x67c073e0)
		genre = [
			goth
			`black	metal`
		]
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color05_D.dds'
		in = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_red_eyes
		frontend_desc = qs(0x757051ca)
		genre = [
			goth
			`black	metal`
		]
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color07_D.dds'
		in = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_demon_eyes
		frontend_desc = qs(0xa9c873c9)
		genre = [
			`black	metal`
		]
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color08_D.dds'
		in = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_fire_eyes
		frontend_desc = qs(0x7938adaa)
		genre = [
			`black	metal`
		]
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color11_D.dds'
		in = cas_body
		random_weight = 0.0
	}
	{
		desc_id = car_blank_eyes
		frontend_desc = qs(0x7766b35f)
		genre = [
			`black	metal`
		]
		replace = 'tex\\models\\Characters\\Global\\Global_CAR_eye_D_xil.dds'
		with = 'tex\\models\\Characters\\Global\\Global_CAR_eye_color10_D.dds'
		in = cas_body
		random_weight = 0.0
	}
]
cas_body = [
	{
		$cas_create_a_rocker_female
		desc_id = gh4_car_female
		frontend_desc = qs(0x09b7b554)
		icon = icon_gender_female
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_male
		frontend_desc = qs(0xb08d72a6)
		icon = icon_gender_male
	}
	{
		desc_id = nobody
		hidden
		Skeleton = gh_rocker_female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		ragdoll = ragdoll_rocker_female
		ragdoll_path = 'Ragdolls/CAR/Female/GH_Rocker_Female_Ragdoll.rag'
		accessory_bones = rocker_accessory_bones
		ragdoll_collision_group = ragdollcollisiongroups_rocker_female
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = Drummer_IK_Params
		ik_params_vocals = Singer_IK_Params
		ik_params_frontend = car_ik_params
		is_female = 1
		anim_struct = car_female_anim_struct
		body_specific_parts = {
			cas_intro_anim = cas_female_intro_anim
			cas_win_anim = cas_female_win_anim
			cas_lose_anim = cas_female_lose_anim
		}
	}
	{
		$cas_create_a_rocker_female
		desc_id = gh4_car_pandora
		hidden
		replace = 'tex/models/Characters/car/female/car_female_head_d.dds'
		with = 'tex/models/Characters/car/female/car_female_headB_d.dds'
	}
	{
		$cas_create_a_rocker_female
		desc_id = gh4_car_casey
		hidden
		replace = 'tex\\models\\Characters\\CAR\\female\\CAR_female_body_tat_o_dnc.dds'
		with = 'tex\\models\\Characters\\CAR\\female\\CAR_Casey_TorsoTattoo_D_dnc.dds'
	}
	{
		$cas_create_a_rocker_female
		desc_id = gh4_car_midori
		hidden
		replace = 'tex/models/Characters/car/female/car_female_head_d.dds'
		with = 'tex/models/Characters/car/female/car_female_head_Midori_d.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_izzy
		hidden
		replace = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with = 'tex/models/Characters/car/male/car_male_headB_d.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_lars
		hidden
		replace = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with = 'tex/models/Characters/car/male/car_male_headC_d.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_Body_N.dds'
		with2 = 'tex/models/Characters/car/male/car_male_BodyB_N.dds'
		replace3 = 'tex/models/Characters/car/male/car_male_Head_N.dds'
		with3 = 'tex/models/Characters/car/male/car_male_HeadB_N.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_eddie
		hidden
		replace = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
		with = 'tex\\models\\Characters\\CAR\\Male\\CAR_male_EddieTatR_D_dnc.dds'
		replace2 = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
		with2 = 'tex\\models\\Characters\\CAR\\Male\\CAR_male_EddieTatL_D_dnc.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_johnny
		hidden
		replace = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
		with = 'tex\\models\\Characters\\CAR\\Male\\CAR_male_JohnnyTatR_D_dnc.dds'
		replace2 = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
		with2 = 'tex\\models\\Characters\\CAR\\Male\\CAR_male_JohnnyTatL_D_dnc.dds'
		replace3 = 'tex\\models\\Characters\\CAR\\female\\CAR_female_body_tat_o_dnc.dds'
		with3 = 'tex\\models\\Characters\\CAR\\Male\\CAR_male_JohnnyTatChest_D_dnc.dds'
		replace4 = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with4 = 'tex/models/Characters/car/male/car_male_head_johnny_d.dds'
		replace5 = 'tex/models/Characters/car/male/car_male_head_n.dds'
		with5 = 'tex/models/Characters/car/male/car_male_head_johnny_n.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_zach
		hidden
		replace = 'tex/models/Characters/car/male/car_male_brow_d.dds'
		with = 'tex/models/Characters/car/male/car_zach_brow_d.dds'
	}
	{
		$cas_create_a_rocker_female
		desc_id = gh4_car_judy
		hidden
		replace = 'tex/models/Characters/car/female/car_female_head_d.dds'
		with = 'tex/models/Characters/car/female/car_female_head_Judy_d.dds'
	}
]
cas_physique = [
	{
		desc_id = femalephysique
		deform_bones = car_bones_female_body
		deform_main_skeleton
		default_car_preset_build_index = 3
		preset_builds = [
			{
				additional_bone_transforms = [
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, -0.1, -0.025)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, -0.07, -0.07)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_R
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_L
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, 0.01, 0.0)
						}
					}
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, 0.01, 0.0)
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, -0.15, -0.05)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (-0.01, -0.01, -0.01)
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.015, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, -0.05, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_L
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_R
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.06, 0.06, 0.06)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (-0.0, -0.1, -0.1)
						}
					}
					{
						bone = Bone_Twist_Thigh_R
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_L
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (-0.005, -0.005, -0.005)
						}
					}
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, 0.0, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.35000002, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.25, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, -0.01, -0.0)
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, -0.01, 0.0)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_L
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_R
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Wrist_L
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Wrist_R
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.06, 0.06, 0.06)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Split_Ass_R
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Split_Ass_L
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_R
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_L
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, 0.25, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.5, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.4, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.0, 0.0, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, -0.025, 0.0)
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.0, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, -0.025, 0.0)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_L
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_R
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Wrist_L
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Wrist_R
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.06, 0.06, 0.06)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Split_Ass_R
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Split_Ass_L
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_R
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_L
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
				]
			}
		]
	}
	{
		desc_id = malephysique
		deform_bones = car_bones_male_body
		deform_main_skeleton
		default_car_preset_build_index = 3
		preset_builds = [
			{
				additional_bone_transforms = [
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.0, 0.0)
							stop_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.0, 0.0)
							stop_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_L
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_R
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
					{
						bone = Bone_Twist_Thigh_R
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_L
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.03, -0.03)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.03, -0.03)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = bone_head
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (-0.0, -0.05, -0.05)
							stop_propagate
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (-0.0, -0.15, -0.125)
							no_propagate
						}
					}
					{
						bone = Bone_Split_Ass_R
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_R
						scaling = {
							value = (0.0, -0.45000002, -0.45000002)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.025)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Toe_R
						scaling = {
							value = (0.4, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Split_Ass_L
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_L
						scaling = {
							value = (0.0, -0.45000002, -0.45000002)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.025)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Toe_L
						scaling = {
							value = (0.4, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.01, 0.01, 0.01)
							stop_propagate
						}
					}
					{
						bone = Bone_Hand_Thumb_Base_R
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Index_Base_R
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Middle_Base_R
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Ring_Base_R
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Pinkey_Base_R
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.01, 0.01, 0.01)
							stop_propagate
						}
					}
					{
						bone = Bone_Hand_Thumb_Base_L
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Index_Base_L
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Middle_Base_L
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Ring_Base_L
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Pinkey_Base_L
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.15, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.15, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_L
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_R
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = bone_chest
						scaling = {
							value = (0.075, 0.075, 0.075)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.2, 0.1, 0.1)
							no_propagate
						}
						translation = {
							value = (0.0, -0.015, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.2, 0.1, 0.1)
							no_propagate
						}
						translation = {
							value = (0.0, -0.015, 0.0)
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_R
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_L
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_R
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_L
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (-0.2, -0.1, -0.2)
							no_propagate
						}
						translation = {
							value = (-0.01, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (-0.1, -0.0, -0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.1, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.1, 0.2)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (-0.005, -0.005, -0.005)
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.1, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.1, 0.1, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.1, 0.2, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.05, 0.05, 0.05)
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.1, 0.3, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						rotation = {
							value = (0.0, -6.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						rotation = {
							value = (0.0, 6.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Wrist_R
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.0, 0.25, 0.25)
						}
					}
					{
						bone = Bone_Hand_Thumb_Base_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Index_Base_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Middle_Base_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Ring_Base_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Pinkey_Base_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Wrist_L
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.0, 0.25, 0.25)
						}
					}
					{
						bone = Bone_Hand_Thumb_Base_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Index_Base_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Middle_Base_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Ring_Base_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Pinkey_Base_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Split_Ass_R
						translation = {
							value = (0.0, 0.0, 0.05)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_R
						translation = {
							value = (0.0, 0.0, -0.025)
							no_propagate
						}
					}
					{
						bone = Bone_Split_Ass_L
						translation = {
							value = (0.0, 0.0, -0.05)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_L
						translation = {
							value = (0.0, 0.0, 0.025)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.25, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.1, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.1, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.1, 0.25, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.07, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.07, 0.0)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_R
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_L
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.5, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.5, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.13, 0.0, 0.3)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.13, 0.0, 0.3)
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = bone_head
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Neck
						scaling = {
							value = (0.3, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, 0.5, 0.35000002)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.5, 0.65000004)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Split_Ass_L
						scaling = {
							value = (0.0, 0.6, 0.8)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Split_Ass_R
						scaling = {
							value = (0.0, 0.6, 0.8)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 1.0, 0.65000004)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_R
						scaling = {
							value = (0.0, 1.0, 0.8)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.8, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 1.0, 0.65000004)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Mid_L
						scaling = {
							value = (0.0, 1.0, 0.8)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.8, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.7, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.7, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Twist_Thigh_R
						translation = {
							value = (0.0, 0.0, -0.027499998)
							no_propagate
						}
						scaling = {
							value = (0.0, 0.45000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Thigh_L
						translation = {
							value = (0.0, 0.0, 0.027499998)
							no_propagate
						}
						scaling = {
							value = (0.0, 0.45000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.5, 0.65000004)
							no_propagate
						}
						translation = {
							value = (-0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.5, 0.65000004)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
				]
			}
		]
	}
]
