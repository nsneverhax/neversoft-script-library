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
				bone = bone_head
				scaling = {
					value = (-0.025, -0.025, -0.025)
				}
			}
			{
				bone = bone_neck
				scaling = {
					value = (0.0, -0.3, -0.3)
					no_propagate
				}
			}
			{
				bone = bone_pelvis
				scaling = {
					value = (0.0, -0.1, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_chest
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					value = (0.0, -0.2, -0.2)
					stop_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, -0.2, -0.2)
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
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_ankle_l
				scaling = {
					value = (0.0, -0.1, -0.2)
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (0.0, -0.1, -0.2)
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
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
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
				scaling = {
					value = (0.0, -0.2, -0.2)
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
					value = (0.05, 0.05, 0.05)
				}
			}
			{
				bone = bone_neck
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
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
				bone = bone_twist_thigh_r
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, -0.1, -0.1)
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
					value = (0.2, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, -0.1, -0.1)
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
					value = (0.2, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
				translation = {
					value = (0.0, -0.025, 0.0)
				}
			}
			{
				bone = bone_collar_r
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
				translation = {
					value = (0.0, -0.025, 0.0)
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					value = (0.0, -0.1, -0.1)
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
					value = (0.035, 0.035, 0.035)
					no_propagate
				}
			}
			{
				bone = bone_collar_r
				scaling = {
					value = (0.1, 0.05, 0.05)
					no_propagate
				}
				translation = {
					value = (0.0, -0.01, 0.0)
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.1, 0.05, 0.05)
					no_propagate
				}
				translation = {
					value = (0.0, -0.01, 0.0)
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
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					value = (0.0, 0.015, 0.015)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					value = (0.0, 0.015, 0.015)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, 0.02, 0.02)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, 0.02, 0.02)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (0.0, 0.15, 0.15)
				}
			}
			{
				bone = bone_ankle_l
				scaling = {
					value = (0.0, 0.15, 0.15)
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (-0.1, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (-0.05, -0.05, -0.05)
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
		is_fat = 1
		additional_bone_transforms = [
			{
				bone = control_root
			}
			{
				bone = bone_pelvis
				scaling = {
					value = (0.0, 0.2, 0.05)
					no_propagate
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (0.05, 0.1, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_neck
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_head
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_chest
				scaling = {
					value = (0.1, 0.1, 0.1)
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
					value = (0.0, -0.05, 0.0)
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.2, 0.2, 0.2)
					no_propagate
				}
				translation = {
					value = (0.0, -0.05, 0.0)
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_wrist_r
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_palm_r
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_hand_thumb_base_r
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_hand_index_base_r
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_hand_middle_base_r
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_hand_ring_base_r
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_hand_pinkey_base_r
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_wrist_l
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_palm_l
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_hand_thumb_base_l
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_hand_index_base_l
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_hand_middle_base_l
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_hand_ring_base_l
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_hand_pinkey_base_l
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_ankle_l
				scaling = {
					value = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = bone_split_ass_r
			}
			{
				bone = bone_twist_thigh_r
			}
			{
				bone = bone_split_ass_l
			}
			{
				bone = bone_twist_thigh_l
			}
		]
	}
	{
		desc_id = malephysique6
		$cas_male_physique_common_settings
		random_weight = 0.0
		additional_bone_transforms = [
			{
				bone = bone_head
				scaling = {
					value = (0.05, 0.05, 0.05)
				}
			}
			{
				bone = bone_neck
				scaling = {
					value = (0.15, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_chest
				scaling = {
					value = (0.1, 0.2, 0.2)
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
			}
			{
				bone = bone_collar_r
				scaling = {
					value = (0.15, 0.15, 0.15)
					no_propagate
				}
				translation = {
					value = (0.0, -0.06, 0.0)
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.15, 0.15, 0.15)
					no_propagate
				}
				translation = {
					value = (0.0, -0.06, 0.0)
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, 0.4, 0.4)
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
				bone = bone_forearm_r
				scaling = {
					value = (0.0, 0.3, 0.3)
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
				bone = bone_knee_r
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_ankle_l
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_toe_r
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_toe_l
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
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
		is_fat = 1
		guitar_offset = (0.0, 0.5, 0.0)
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
					value = (0.1, 0.23, 0.23)
					no_propagate
				}
				translation = {
					value = (0.0, -0.05, 0.0)
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.1, 0.23, 0.23)
					no_propagate
				}
				translation = {
					value = (0.0, -0.05, 0.0)
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (0.0, 0.5, 0.4)
					no_propagate
				}
				translation = {
					value = (0.0, 0.0, 0.02)
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (0.0, 0.6, 0.2)
					no_propagate
				}
				translation = {
					value = (0.0, 0.0, 0.01)
					no_propagate
				}
			}
			{
				bone = bone_pelvis
				scaling = {
					value = (0.0, 0.1, 0.3)
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
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
				translation = {
					value = (0.0, 0.0, -0.02)
					no_propagate
				}
			}
			{
				bone = bone_split_ass_r
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
				translation = {
					value = (0.0, 0.0, 0.02)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.0, 0.6, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, 0.6, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, 0.6, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, 0.6, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, 0.6, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, 0.6, 0.3)
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
					value = (0.0, 0.2, 0.2)
				}
			}
			{
				bone = bone_palm_r
				scaling = {
					value = (0.0, 0.2, 0.2)
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_ankle_l
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_toe_r
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_toe_l
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
		]
	}
	{
		desc_id = ampzillaphysique
		$cas_female_physique_common_settings
		random_weight = 0.0
		hidden
		additional_bone_transforms = [
			{
				bone = control_root
				scaling = {
					value = (0.0, 0.0, 0.0)
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
		desc_id = demigodscaledphysique
		$cas_male_physique_common_settings
		random_weight = 0.0
		hidden
		additional_bone_transforms = [
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
