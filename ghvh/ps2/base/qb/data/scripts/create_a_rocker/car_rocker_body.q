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
	ik_params_drum = Drummer_IK_Params
	ik_params_vocals = Singer_IK_Params
	ik_params_frontend = car_ik_params
	is_female = 1
	anim_struct = car_female_anim_struct
	deform_bones = car_bones_female_face
	deform_main_skeleton
	body_specific_parts = {
		cas_base_face = cas_female_base_face
		cas_base_torso = cas_female_base_torso
		cas_hair = cas_female_hair
		cas_hat_hair = cas_female_hat_hair
		cas_hat = cas_female_hat
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
		cas_hair = cas_male_hair
		cas_hat_hair = cas_male_hat_hair
		cas_hat = cas_male_hat
		cas_facial_hair = cas_male_facial_hair
		cas_base_face = cas_male_base_face
		cas_base_torso = cas_male_base_torso
		cas_torso = cas_male_torso
		cas_legs = cas_male_legs
		cas_socks = cas_male_socks
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
]
cas_physique = [
	{
		desc_id = femalephysique
		deform_bones = car_bones_female_body
		deform_main_skeleton
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
						bone = Bone_Thigh_R
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
						bone = Bone_Thigh_R
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
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.1, 0.1, 0.1)
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
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, 0.15, 0.15)
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
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
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
						bone = bone_head
						scaling = {
							value = (0.06, 0.06, 0.06)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.15, 0.15, 0.15)
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
							value = (0.0, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, 0.25, 0.25)
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
							value = (0.05, 0.3, 0.35000002)
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
							value = (0.0, 0.0, -0.05)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.0, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.05)
							no_propagate
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
						bone = bone_head
						scaling = {
							value = (0.06, 0.06, 0.06)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.2, 0.2, 0.2)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.2, 0.2, 0.2)
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
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
						bone = Bone_Palm_R
						scaling = {
							value = (0.01, 0.01, 0.01)
							stop_propagate
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
							value = (-0.1, -0.1, -0.1)
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
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.2, 0.15)
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
							value = (-0.2, -0.2, -0.2)
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
							value = (-0.1, -0.1, -0.1)
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
						bone = Bone_Palm_R
						scaling = {
							value = (0.0, 0.25, 0.25)
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
						bone = Bone_Palm_L
						scaling = {
							value = (0.0, 0.25, 0.25)
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
							value = (0.0, 0.65000004, 0.4)
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
							value = (0.0, 0.5, 0.5)
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
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
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
							value = (0.0, 0.6, 0.75)
							no_propagate
						}
						translation = {
							value = (-0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.7, 0.75)
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
