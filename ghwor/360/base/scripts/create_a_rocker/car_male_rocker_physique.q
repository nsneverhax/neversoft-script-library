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
				bone = Bone_Neck
				scaling = {
					value = (0.0, -0.3, -0.3)
					no_propagate
				}
			}
			{
				bone = BONE_PELVIS
				scaling = {
					value = (0.0, -0.1, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Lower
				scaling = {
					value = (0.0, -0.1, -0.1)
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
				bone = bone_chest
				scaling = {
					value = (0.0, -0.1, -0.1)
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
				bone = Bone_Forearm_R
				scaling = {
					value = (0.0, -0.2, -0.2)
					stop_propagate
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
				bone = Bone_Forearm_L
				scaling = {
					value = (0.0, -0.2, -0.2)
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
				bone = Bone_Ankle_L
				scaling = {
					value = (0.0, -0.1, -0.2)
				}
			}
			{
				bone = Bone_Ankle_R
				scaling = {
					value = (0.0, -0.1, -0.2)
				}
			}
			{
				bone = Bone_Twist_Thigh_R
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Thigh_L
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
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_L
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
				bone = Bone_Neck
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Lower
				scaling = {
					value = (0.0, -0.2, -0.2)
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
				bone = BONE_PELVIS
				scaling = {
					value = (-0.0, -0.15, -0.125)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Thigh_R
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_R
				scaling = {
					value = (0.0, -0.1, -0.1)
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
					value = (0.2, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Thigh_L
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_L
				scaling = {
					value = (0.0, -0.1, -0.1)
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
					value = (0.2, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Collar_L
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
				translation = {
					value = (0.0, -0.025, 0.0)
				}
			}
			{
				bone = Bone_Collar_R
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
				translation = {
					value = (0.0, -0.025, 0.0)
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_R
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_L
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_L
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_R
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_L
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_R
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Forearm_L
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Forearm_R
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
				bone = Bone_Collar_R
				scaling = {
					value = (0.1, 0.05, 0.05)
					no_propagate
				}
				translation = {
					value = (0.0, -0.01, 0.0)
				}
			}
			{
				bone = Bone_Collar_L
				scaling = {
					value = (0.1, 0.05, 0.05)
					no_propagate
				}
				translation = {
					value = (0.0, -0.01, 0.0)
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
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_R
				scaling = {
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_R
				scaling = {
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_L
				scaling = {
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_L
				scaling = {
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_L
				scaling = {
					value = (0.0, 0.1, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Thigh_R
				scaling = {
					value = (0.0, 0.015, 0.015)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Thigh_L
				scaling = {
					value = (0.0, 0.015, 0.015)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_R
				scaling = {
					value = (0.0, 0.02, 0.02)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_L
				scaling = {
					value = (0.0, 0.02, 0.02)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_R
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_L
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Ankle_R
				scaling = {
					value = (0.0, 0.15, 0.15)
				}
			}
			{
				bone = Bone_Ankle_L
				scaling = {
					value = (0.0, 0.15, 0.15)
				}
			}
			{
				bone = Bone_Stomach_Lower
				scaling = {
					value = (-0.1, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Upper
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
				bone = BONE_PELVIS
				scaling = {
					value = (0.0, 0.2, 0.05)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Lower
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Upper
				scaling = {
					value = (0.05, 0.1, 0.2)
					no_propagate
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
				bone = Bone_Twist_Bicep_Top_R
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
				bone = Bone_Forearm_R
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Wrist_R
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Palm_R
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Hand_Thumb_Base_R
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Hand_Index_Base_R
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Hand_Middle_Base_R
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Hand_Ring_Base_R
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Hand_Pinkey_Base_R
				scaling = {
					value = (0.0, 0.1, 0.1)
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
				bone = Bone_Twist_Wrist_L
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Palm_L
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Hand_Thumb_Base_L
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Hand_Index_Base_L
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Hand_Middle_Base_L
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Hand_Ring_Base_L
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Hand_Pinkey_Base_L
				scaling = {
					value = (0.0, 0.1, 0.1)
				}
			}
			{
				bone = Bone_Thigh_R
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_R
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Ankle_R
				scaling = {
					value = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_L
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_L
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Ankle_L
				scaling = {
					value = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = Bone_Split_Ass_R
			}
			{
				bone = Bone_Twist_Thigh_R
			}
			{
				bone = Bone_Split_Ass_L
			}
			{
				bone = Bone_Twist_Thigh_L
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
				bone = Bone_Neck
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
				bone = Bone_Stomach_Upper
				scaling = {
					value = (0.1, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Lower
			}
			{
				bone = Bone_Collar_R
				scaling = {
					value = (0.15, 0.15, 0.15)
					no_propagate
				}
				translation = {
					value = (0.0, -0.06, 0.0)
				}
			}
			{
				bone = Bone_Collar_L
				scaling = {
					value = (0.15, 0.15, 0.15)
					no_propagate
				}
				translation = {
					value = (0.0, -0.06, 0.0)
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_R
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_R
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_R
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_L
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_L
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_L
				scaling = {
					value = (0.0, 0.4, 0.4)
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
				bone = Bone_Forearm_R
				scaling = {
					value = (0.0, 0.3, 0.3)
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
				bone = Bone_Knee_R
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_L
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Ankle_R
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Ankle_L
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Toe_R
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Toe_L
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
				bone = Bone_Neck
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
				bone = Bone_Collar_R
				scaling = {
					value = (0.1, 0.23, 0.23)
					no_propagate
				}
				translation = {
					value = (0.0, -0.05, 0.0)
				}
			}
			{
				bone = Bone_Collar_L
				scaling = {
					value = (0.1, 0.23, 0.23)
					no_propagate
				}
				translation = {
					value = (0.0, -0.05, 0.0)
				}
			}
			{
				bone = Bone_Stomach_Lower
				scaling = {
					value = (0.0, 0.5, 0.4)
					no_propagate
				}
				translation = {
					value = (0.0, 0.0, 0.02)
				}
			}
			{
				bone = Bone_Stomach_Upper
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
				bone = BONE_PELVIS
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
				bone = Bone_Split_Ass_L
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
				bone = Bone_Split_Ass_R
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
				bone = Bone_Twist_Bicep_Top_R
				scaling = {
					value = (0.0, 0.6, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_R
				scaling = {
					value = (0.0, 0.6, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_R
				scaling = {
					value = (0.0, 0.6, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_L
				scaling = {
					value = (0.0, 0.6, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_L
				scaling = {
					value = (0.0, 0.6, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_L
				scaling = {
					value = (0.0, 0.6, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Forearm_L
				scaling = {
					value = (0.0, 0.5, 0.45000002)
					no_propagate
				}
			}
			{
				bone = Bone_Forearm_R
				scaling = {
					value = (0.0, 0.5, 0.45000002)
					no_propagate
				}
			}
			{
				bone = Bone_Palm_L
				scaling = {
					value = (0.0, 0.2, 0.2)
				}
			}
			{
				bone = Bone_Palm_R
				scaling = {
					value = (0.0, 0.2, 0.2)
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
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_L
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_R
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_L
				scaling = {
					value = (0.0, 0.4, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Ankle_R
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Ankle_L
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Toe_R
				scaling = {
					value = (0.0, 0.3, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Toe_L
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
				bone = Bone_Palm_L
				scaling = {
					value = (0.5, 0.5, 0.5)
				}
			}
			{
				bone = Bone_Palm_R
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
				bone = BONE_PELVIS
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
				bone = Bone_Stomach_Upper
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
					value = (0.0, -0.23, -0.23)
					no_propagate
				}
			}
			{
				bone = Bone_Forearm_L
				scaling = {
					value = (0.0, -0.23, -0.23)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Wrist_R
				scaling = {
					value = (0.0, -0.23, -0.23)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Wrist_L
				scaling = {
					value = (0.0, -0.23, -0.23)
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
				bone = Bone_Twist_Bicep_Mid_L
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
				bone = Bone_Twist_Thigh_R
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
				bone = Bone_Palm_L
				scaling = {
					value = (-0.34, -0.34, -0.34)
				}
			}
			{
				bone = Bone_Palm_R
				scaling = {
					value = (-0.34, -0.34, -0.34)
				}
			}
			{
				bone = Bone_Hand_Index_Base_L
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Index_Mid_L
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Middle_Base_L
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Middle_Mid_L
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Ring_Base_L
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Ring_Mid_L
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Pinkey_Base_L
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Pinkey_Mid_L
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Index_Base_R
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Middle_Base_R
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Ring_Base_R
				scaling = {
					value = (0.2, 0.0, 0.0)
				}
			}
			{
				bone = Bone_Hand_Pinkey_Base_R
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
				bone = BONE_GUITAR_FRET_POS
				scaling = {
					value = (0.0, 0.0, 0.0)
					stop_propagate
					no_propagate
				}
			}
		]
	}
]
