cas_male_physique_common_settings = {
	deform_bones = car_bones_female_body
	deform_main_skeleton
}
cas_male_physique = [
	{
		desc_id = malephysiqueuntouched
		$cas_male_physique_common_settings
		hidden
		additional_bone_transforms = [
		]
	}
	{
		desc_id = malephysique1
		$cas_male_physique_common_settings
		additional_bone_transforms = [
		]
	}
	{
		desc_id = malephysique2
		$cas_male_physique_common_settings
		random_weight = 0.0
		additional_bone_transforms = [
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, -0.25, -0.25)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					value = (0.0, 0.0, 0.0)
					stop_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, -0.25, -0.25)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, 0.0, 0.0)
					stop_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, -0.25, -0.25)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, -0.25, -0.25)
					no_propagate
				}
			}
			{
				bone = bone_ankle_l
				scaling = {
					value = (0.0, 0.1, 0.2)
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (0.0, 0.1, 0.2)
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					value = (0.0, -0.3, -0.3)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					value = (0.0, -0.3, -0.3)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, -0.3, -0.3)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, -0.3, -0.3)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					value = (0.0, -0.03, -0.03)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
				scaling = {
					value = (0.0, -0.03, -0.03)
					no_propagate
				}
			}
		]
	}
	{
		desc_id = malephysique3
		$cas_male_physique_common_settings
		random_weight = 0.0
		additional_bone_transforms = [
			{
				bone = bone_head
				scaling = {
					value = (0.1, 0.1, 0.1)
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (-0.0, -0.05, -0.05)
					stop_propagate
				}
			}
			{
				bone = bone_pelvis
				scaling = {
					value = (-0.0, -0.15, -0.125)
					no_propagate
				}
			}
			{
				bone = bone_split_ass_r
				translation = {
					value = (0.0, 0.0, 0.01)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_r
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
				bone = bone_thigh_r
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
				bone = bone_knee_r
				scaling = {
					value = (0.0, -0.25, -0.25)
					no_propagate
				}
			}
			{
				bone = bone_toe_r
				scaling = {
					value = (0.4, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_split_ass_l
				translation = {
					value = (0.0, 0.0, -0.01)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
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
				bone = bone_thigh_l
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
				bone = bone_knee_l
				scaling = {
					value = (0.0, -0.25, -0.25)
					no_propagate
				}
			}
			{
				bone = bone_toe_l
				scaling = {
					value = (0.4, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_palm_r
				scaling = {
					value = (0.01, 0.01, 0.01)
					stop_propagate
				}
			}
			{
				bone = bone_hand_thumb_base_r
				scaling = {
					value = (0.0, 0.5, 0.5)
				}
			}
			{
				bone = bone_hand_index_base_r
				scaling = {
					value = (0.0, 0.5, 0.5)
				}
			}
			{
				bone = bone_hand_middle_base_r
				scaling = {
					value = (0.0, 0.5, 0.5)
				}
			}
			{
				bone = bone_hand_ring_base_r
				scaling = {
					value = (0.0, 0.5, 0.5)
				}
			}
			{
				bone = bone_hand_pinkey_base_r
				scaling = {
					value = (0.0, 0.5, 0.5)
				}
			}
			{
				bone = bone_palm_l
				scaling = {
					value = (0.01, 0.01, 0.01)
					stop_propagate
				}
			}
			{
				bone = bone_hand_thumb_base_l
				scaling = {
					value = (0.0, 0.5, 0.5)
				}
			}
			{
				bone = bone_hand_index_base_l
				scaling = {
					value = (0.0, 0.5, 0.5)
				}
			}
			{
				bone = bone_hand_middle_base_l
				scaling = {
					value = (0.0, 0.5, 0.5)
				}
			}
			{
				bone = bone_hand_ring_base_l
				scaling = {
					value = (0.0, 0.5, 0.5)
				}
			}
			{
				bone = bone_hand_pinkey_base_l
				scaling = {
					value = (0.0, 0.5, 0.5)
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.15, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_collar_r
				scaling = {
					value = (0.15, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, -0.3, -0.3)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, -0.3, -0.3)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, -0.4, -0.4)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, -0.4, -0.4)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, -0.25, -0.25)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					value = (0.0, -0.25, -0.25)
					no_propagate
				}
			}
		]
	}
	{
		desc_id = malephysique4
		$cas_male_physique_common_settings
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
				bone = bone_collar_r
				scaling = {
					value = (0.2, 0.1, 0.1)
					no_propagate
				}
				translation = {
					value = (0.0, -0.015, 0.0)
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.2, 0.1, 0.1)
					no_propagate
				}
				translation = {
					value = (0.0, -0.015, 0.0)
				}
			}
			{
				bone = bone_pelvis
				scaling = {
					value = (-0.1, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (0.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.0, 0.2, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, 0.2, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, 0.2, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, 0.2, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, 0.2, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, 0.2, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_r
				translation = {
					value = (0.0, 0.0, 0.025)
					no_propagate
				}
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				translation = {
					value = (0.0, 0.0, -0.025)
					no_propagate
				}
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_stomach_lower
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
				bone = bone_stomach_upper
				scaling = {
					value = (-0.1, -0.1, -0.1)
					no_propagate
				}
			}
		]
	}
	{
		desc_id = malephysique5
		$cas_male_physique_common_settings
		random_weight = 0.0
		replace = `tex/models/characters/car/male/car_male_body_n`
		with = `tex/models/characters/car/male/car_male_body_fat_n`
		in = cas_body
		additional_bone_transforms = [
			{
				bone = control_root
				scaling = {
					value = (-0.005, -0.005, -0.005)
				}
			}
			{
				bone = bone_pelvis
				scaling = {
					value = (0.0, 0.1, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (0.1, 0.1, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (0.1, 0.2, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_neck
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
				bone = bone_collar_r
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
				bone = bone_collar_l
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
				bone = bone_bicep_r
				scaling = {
					value = (0.0, -0.3, -0.3)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_twist_wrist_r
				scaling = {
					value = (0.0, 0.5, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_palm_r
				scaling = {
					value = (0.0, 0.25, 0.25)
				}
			}
			{
				bone = bone_hand_thumb_base_r
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_hand_index_base_r
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_hand_middle_base_r
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_hand_ring_base_r
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_hand_pinkey_base_r
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, -0.3, -0.3)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_twist_wrist_l
				scaling = {
					value = (0.0, 0.5, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_palm_l
				scaling = {
					value = (0.0, 0.25, 0.25)
				}
			}
			{
				bone = bone_hand_thumb_base_l
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_hand_index_base_l
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_hand_middle_base_l
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_hand_ring_base_l
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_hand_pinkey_base_l
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_split_ass_r
				translation = {
					value = (0.0, 0.0, 0.05)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_r
				translation = {
					value = (0.0, 0.0, -0.025)
					no_propagate
				}
			}
			{
				bone = bone_split_ass_l
				translation = {
					value = (0.0, 0.0, -0.05)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				translation = {
					value = (0.0, 0.0, 0.025)
					no_propagate
				}
			}
		]
	}
	{
		desc_id = malephysique6
		$cas_male_physique_common_settings
		random_weight = 0.0
		additional_bone_transforms = [
			{
				bone = bone_neck
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
				bone = bone_stomach_upper
				scaling = {
					value = (0.1, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (0.1, 0.25, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_collar_r
				scaling = {
					value = (0.2, 0.2, 0.2)
					no_propagate
				}
				translation = {
					value = (0.0, -0.07, 0.0)
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.2, 0.2, 0.2)
					no_propagate
				}
				translation = {
					value = (0.0, -0.07, 0.0)
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.0, 0.65000004, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, 0.65000004, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, 0.65000004, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, 0.65000004, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, 0.65000004, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, 0.65000004, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, 0.5, 0.35000002)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					value = (0.0, 0.5, 0.35000002)
					no_propagate
				}
			}
			{
				bone = bone_palm_l
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_palm_r
				scaling = {
					value = (0.0, 0.3, 0.3)
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (0.13, 0.0, 0.3)
				}
			}
			{
				bone = bone_ankle_l
				scaling = {
					value = (0.13, 0.0, 0.3)
				}
			}
		]
	}
	{
		desc_id = malephysique7
		$cas_male_physique_common_settings
		random_weight = 0.0
		replace = `tex/models/characters/car/male/car_male_body_n`
		with = `tex/models/characters/car/male/car_male_body_fat_n`
		in = cas_body
		additional_bone_transforms = [
			{
				bone = bone_head
				scaling = {
					value = (0.1, 0.1, 0.1)
				}
			}
			{
				bone = bone_neck
				scaling = {
					value = (0.3, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_chest
				scaling = {
					value = (0.0, 0.3, 0.25)
					no_propagate
				}
				translation = {
					value = (0.0, 0.0, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_collar_r
				scaling = {
					value = (0.0, 0.0, 0.0)
					no_propagate
				}
				translation = {
					value = (0.0, -0.05, 0.0)
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.0, 0.0, 0.0)
					no_propagate
				}
				translation = {
					value = (0.0, -0.05, 0.0)
				}
			}
			{
				bone = bone_pelvis
				scaling = {
					value = (0.0, 0.25, 0.45000002)
					no_propagate
				}
				translation = {
					value = (0.0, 0.0, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_split_ass_l
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
				bone = bone_split_ass_r
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
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.2, 0.8, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, 1.0, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, 0.8, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.2, 0.8, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, 1.0, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, 0.8, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, 0.5, 0.45000002)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					value = (0.0, 0.5, 0.45000002)
					no_propagate
				}
			}
			{
				bone = bone_palm_l
				scaling = {
					value = (0.1, 0.1, 0.1)
				}
			}
			{
				bone = bone_palm_r
				scaling = {
					value = (0.1, 0.1, 0.1)
				}
			}
			{
				bone = bone_twist_thigh_r
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
				bone = bone_twist_thigh_l
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
				bone = bone_ankle_l
				scaling = {
					value = (-0.1, -0.1, -0.1)
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (-0.1, -0.1, -0.1)
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (0.0, 0.75, 0.5)
					no_propagate
				}
				translation = {
					value = (-0.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_stomach_upper
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
	{
		desc_id = skeletonphysique
		$cas_male_physique_common_settings
		random_weight = 0.0
		hidden
		additional_bone_transforms = [
			{
				bone = bone_palm_l
				scaling = {
					value = (0.5, 0.5, 0.5)
				}
			}
			{
				bone = bone_palm_r
				scaling = {
					value = (0.5, 0.5, 0.5)
				}
			}
		]
	}
	{
		desc_id = avatarphysique
		$cas_male_physique_common_settings
		random_weight = 0.0
		hidden
		additional_bone_transforms = [
			{
				bone = control_root
				scaling = {
					value = (-0.2, -0.2, -0.2)
				}
			}
			{
				bone = bone_head
				scaling = {
					value = (-0.225, -0.225, -0.225)
				}
			}
			{
				bone = bone_pelvis
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_chest
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.15, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_collar_r
				scaling = {
					value = (0.15, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					value = (0.0, -0.23, -0.23)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, -0.23, -0.23)
					no_propagate
				}
			}
			{
				bone = bone_twist_wrist_r
				scaling = {
					value = (0.0, -0.23, -0.23)
					no_propagate
				}
			}
			{
				bone = bone_twist_wrist_l
				scaling = {
					value = (0.0, -0.23, -0.23)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_palm_l
				scaling = {
					value = (-0.34, -0.34, -0.34)
				}
			}
			{
				bone = bone_palm_r
				scaling = {
					value = (-0.34, -0.34, -0.34)
				}
			}
			{
				bone = bone_hand_index_base_l
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_index_mid_l
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_middle_base_l
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_middle_mid_l
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_ring_base_l
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_ring_mid_l
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_pinkey_base_l
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_pinkey_mid_l
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_index_base_r
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_middle_base_r
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_ring_base_r
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_hand_pinkey_base_r
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = bone_guitar_body
				scaling = {
					value = (0.0, 0.0, 0.0)
					stop_propagate
					no_propagate
				}
			}
			{
				bone = bone_guitar_fret_pos
				scaling = {
					value = (0.0, 0.0, 0.0)
					stop_propagate
					no_propagate
				}
			}
		]
	}
]
