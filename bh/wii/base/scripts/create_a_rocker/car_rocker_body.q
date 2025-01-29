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
ps2_colorable_skin_materials = [
	{
		car_base_mesh_torso
		0
	}
	{
		car_base_mesh_arml
		0
	}
	{
		car_base_mesh_legs
		0
	}
	{
		car_base_mesh_hands
		0
	}
	{
		car_base_mesh_armr
		0
	}
	{
		car_base_mesh_head1
		0
	}
	{
		car_base_mesh_head2
		0
	}
	{
		car_base_mesh_lips
		0
	}
]
cas_create_a_rocker_female = {
	Skeleton = gh_rocker_female
	skeleton_path = 'skeletons/GH_Rocker_Female.ske'
	ik_params = Hero_Ik_params
	ik_params_guitar = Hero_Ik_params
	ik_params_drum = car_ik_params
	ik_params_vocals = car_ik_params
	ik_params_frontend = car_ik_params
	is_female = 1
	anim_struct = car_female_anim_struct
	deform_bones = car_bones_female_face
	deform_main_skeleton
	body_specific_parts = {
		cas_base_face = cas_female_base_face
		cas_base_arms = cas_female_base_arms
		cas_base_hands = cas_female_base_hands
		cas_base_legs = cas_female_base_legs
		cas_base_shoes = cas_female_base_shoes
		cas_base_torso = cas_female_base_torso
		cas_physique = cas_female_physique
		cas_hair = cas_female_hair
		cas_hat_hair = cas_female_hat_hair
		cas_hat = cas_female_hat
		cas_torso = cas_female_torso
		cas_legs = cas_female_legs
		cas_shoes = cas_female_shoes
		cas_shoes_cutoff = cas_female_shoes_cutoff
		cas_acc_left = cas_female_acc_left
		cas_acc_left_small = cas_female_acc_left_small
		cas_acc_right = cas_female_acc_right
		cas_acc_right_small = cas_female_acc_right_small
		cas_acc_face = cas_female_acc_face
		cas_acc_ears = cas_female_acc_ears
		cas_age = cas_female_age
	}
}
cas_create_a_rocker_male = {
	Skeleton = gh_rocker_male
	skeleton_path = 'skeletons/GH_Rocker_Male.ske'
	ik_params = Hero_Ik_params
	ik_params_guitar = Hero_Ik_params
	ik_params_drum = car_ik_params
	ik_params_vocals = car_ik_params
	ik_params_frontend = car_ik_params
	is_female = 0
	anim_struct = car_male_anim_struct
	deform_bones = car_bones_male_face
	deform_main_skeleton
	body_specific_parts = {
		cas_physique = cas_male_physique
		cas_hair = cas_male_hair
		cas_hat_hair = cas_male_hat_hair
		cas_hat = cas_male_hat
		cas_facial_hair = cas_male_facial_hair
		cas_base_face = cas_male_base_face
		cas_base_arms = cas_male_base_arms
		cas_base_hands = cas_male_base_hands
		cas_base_legs = cas_male_base_legs
		cas_base_shoes = cas_male_base_shoes
		cas_base_torso = cas_male_base_torso
		cas_torso = cas_male_torso
		cas_legs = cas_male_legs
		cas_socks = cas_male_socks
		cas_shoes = cas_male_shoes
		cas_shoes_cutoff = cas_male_shoes_cutoff
		cas_acc_left = cas_male_acc_left
		cas_acc_left_small = cas_male_acc_left_small
		cas_acc_right = cas_male_acc_right
		cas_acc_right_small = cas_male_acc_right_small
		cas_acc_face = cas_male_acc_face
		cas_acc_ears = cas_male_acc_ears
		cas_age = cas_male_age
	}
}
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
		}
	}
	{
		$cas_create_a_rocker_female
		desc_id = gh4_car_pandora
		hidden
		rocker_skeleton = 'GH_Rocker_Pandora_1'
		drummer_skeleton = 'GH_Drummer_Pandora_1'
	}
	{
		$cas_create_a_rocker_female
		desc_id = gh4_car_casey
		hidden
		rocker_skeleton = 'GH_Rocker_Casey_1'
		drummer_skeleton = 'GH_Drummer_Casey_1'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_izzy
		hidden
		rocker_skeleton = 'GH_Rocker_Izzy_1'
		drummer_skeleton = 'GH_Drummer_Izzy_1'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_lars
		hidden
		rocker_skeleton = 'GH_Rocker_Lars_1'
		drummer_skeleton = 'GH_Drummer_Lars_1'
		large_hands = 1
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_eddie
		hidden
		rocker_skeleton = 'GH_Rocker_Eddie_1'
		drummer_skeleton = 'GH_Drummer_Eddie_1'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_johnny
		hidden
		rocker_skeleton = 'GH_Rocker_Johnny_1'
		drummer_skeleton = 'GH_Drummer_Johnny_1'
	}
	{
		$cas_create_a_rocker_female
		desc_id = gh4_car_judy
		hidden
		replace = 'tex/models/Characters/car/female/car_female_head_d.dds'
		with = 'tex/models/Characters/car/female/car_female_head_Judy_d.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_axel
		hidden
		rocker_skeleton = 'GH_Rocker_Axel_1'
		drummer_skeleton = 'GH_Drummer_Axel_1'
		large_hands = 1
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_clive
		hidden
		rocker_skeleton = 'GH_Rocker_Clive_1'
		drummer_skeleton = 'GH_Drummer_Clive_1'
	}
	{
		$cas_create_a_rocker_male
		desc_id = 0x2744d92e
		hidden
		rocker_skeleton = 'GH_Rocker_Quinton_1'
		drummer_skeleton = 'GH_Drummer_Quinton_1'
	}
	{
		$cas_create_a_rocker_female
		desc_id = gh4_car_midori
		hidden
		rocker_skeleton = 'GH_Rocker_Midori_1'
		drummer_skeleton = 'GH_Drummer_Midori_1'
	}
	{
		$cas_create_a_rocker_male
		desc_id = `bestbuy	kid`
		hidden
		replace = 'tex/models/Characters/car/male/car_male_head_N.dds'
		with = 'tex\\models\\Characters\\CAR\\Male\\car_male_BestBuy_N.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_head_D.dds'
		with2 = 'tex/models/Characters/car/male/car_male_BestBuy_D.dds'
		replace3 = 'tex/models/Characters/car/male/car_male_brow_D.dds'
		with3 = 'tex/models/Characters/car/male/car_male_brow_D2.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = aaronsteele
		hidden
		replace = 'tex/models/Characters/car/male/car_male_head_N.dds'
		with = 'tex\\models\\Characters\\CAR\\Male\\car_male_Aaron_N.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_winner
		hidden
		replace = 'tex/models/Characters/car/male/car_male_HEAD_D.dds'
		with = 'tex/models/Characters/car/male/car_male_HEADCW_D.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_head_n.dds'
		with2 = 'tex/models/Characters/car/male/car_male_headCW_n.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = gh4_car_matty
		hidden
		additional_bone_transforms = [
			{
				bone = bone_head
			}
			{
				bone = bone_scale_cheek_r
				translation = {
					value = (-0.001, 0.001, 0.0)
				}
			}
			{
				bone = bone_scale_cheek_l
				translation = {
					value = (0.001, 0.001, 0.0)
				}
			}
			{
				bone = bone_trans_chin
				translation = {
					value = (0.0, 0.005, 0.0)
				}
			}
			{
				bone = bone_trans_mouth
				scaling = {
					value = (0.155, 0.0, 0.0)
				}
			}
			{
				bone = bone_scale_nostrils
				translation = {
					value = (0.0, 0.003, 0.0)
				}
			}
		]
	}
	{
		desc_id = gh4_mii
		frontend_desc = qs(0x0fea2f89)
		Skeleton = gh4_mii
		ragdoll = None
		ragdoll_collision_group = None
		ik_params = mii_ik_params
		Skeleton = gh4_mii
		skeleton_path = 'skeletons/GH4_Mii.ske'
		ragdoll = None
		ragdoll_path = ''
		accessory_bones = None
		ragdoll_collision_group = None
		ik_params_guitar = mii_ik_params
		ik_params_drum = mii_ik_params
		ik_params_vocals = mii_ik_params
		ik_params_frontend = mii_ik_params
		anim_struct = mii_anim_struct
		deform_bones = None
		hidden
	}
	{
		desc_id = gh4_mii_drummer
		frontend_desc = qs(0x8fe042e4)
		Skeleton = gh4_mii_drummer
		ragdoll = None
		ragdoll_collision_group = None
		ik_params = Hero_Ik_params
		Skeleton = gh4_mii_drummer
		skeleton_path = 'skeletons/GH4_Mii_Drummer.ske'
		ragdoll = None
		ragdoll_path = ''
		accessory_bones = None
		ragdoll_collision_group = None
		ik_params_guitar = empty_ik_params
		ik_params_drum = empty_ik_params
		ik_params_vocals = empty_ik_params
		ik_params_frontend = empty_ik_params
		anim_struct = mii_drummer_anim_struct
		deform_bones = None
		hidden
	}
	{
		desc_id = gh4_mii_crowd
		frontend_desc = qs(0x0fea2f89)
		Skeleton = gh4_mii
		ragdoll = None
		ragdoll_collision_group = None
		Skeleton = gh4_mii
		skeleton_path = 'skeletons/GH4_Mii.ske'
		ragdoll = None
		ragdoll_path = ''
		accessory_bones = None
		ragdoll_collision_group = None
		anim_struct = mii_anim_struct
		deform_bones = None
		hidden
	}
]
