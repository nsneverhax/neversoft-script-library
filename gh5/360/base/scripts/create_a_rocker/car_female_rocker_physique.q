cas_female_physique_common_settings = {
	deform_bones = car_bones_female_body
	deform_main_skeleton
}
cas_female_physique = [
	{
		desc_id = femalephysiqueuntouched
		$cas_female_physique_common_settings
		hidden
		additional_bone_transforms = [
		]
	}
	{
		desc_id = femalephysique1
		$cas_female_physique_common_settings
		additional_bone_transforms = [
		]
	}
	{
		desc_id = femalephysique2
		$cas_female_physique_common_settings
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
		desc_id = femalephysique3
		$cas_female_physique_common_settings
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
		desc_id = femalephysique4
		$cas_female_physique_common_settings
		random_weight = 0.0
		additional_bone_transforms = [
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
					no_propagate
				}
			}
			{
				bone = Bone_Ankle_L
				scaling = {
					value = (0.0, 0.0, 0.1)
				}
			}
			{
				bone = Bone_Ankle_R
				scaling = {
					value = (0.0, 0.0, 0.1)
				}
			}
			{
				bone = Bone_Twist_Thigh_R
				scaling = {
					value = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Thigh_L
				scaling = {
					value = (0.0, 0.25, 0.25)
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
		desc_id = femalephysique5
		$cas_female_physique_common_settings
		random_weight = 0.0
		replace = `tex\models\characters\car\female\car_female_body_n`
		with = `tex\models\characters\car\female\car_female_body_fat_n`
		in = cas_body
		additional_bone_transforms = [
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
					no_propagate
				}
			}
			{
				bone = Bone_Ankle_L
				scaling = {
					value = (0.0, 0.0, 0.15)
				}
			}
			{
				bone = Bone_Ankle_R
				scaling = {
					value = (0.0, 0.0, 0.15)
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
		desc_id = femalephysique6
		$cas_female_physique_common_settings
		random_weight = 0.0
		replace = `tex\models\characters\car\female\car_female_body_n`
		with = `tex\models\characters\car\female\car_female_body_fat_n`
		in = cas_body
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
					value = (0.0, 0.55, 0.5)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Upper
				scaling = {
					value = (-0.0, 0.55, 0.45000002)
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
					value = (0.1, 0.15, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_L
				scaling = {
					value = (0.1, 0.15, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_L
				scaling = {
					value = (0.0, 0.55, 0.55)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_R
				scaling = {
					value = (0.0, 0.55, 0.55)
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
					no_propagate
				}
			}
			{
				bone = Bone_Ankle_L
				scaling = {
					value = (0.0, 0.0, 0.2)
				}
			}
			{
				bone = Bone_Ankle_R
				scaling = {
					value = (0.0, 0.0, 0.2)
				}
			}
			{
				bone = Bone_Split_Ass_R
				scaling = {
					value = (0.2, 0.45000002, 0.45000002)
					no_propagate
				}
			}
			{
				bone = Bone_Split_Ass_L
				scaling = {
					value = (0.2, 0.45000002, 0.45000002)
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
	{
		desc_id = judyphysique
		$cas_female_physique_common_settings
		random_weight = 0.0
		hidden
		additional_bone_transforms = [
			{
				bone = control_root
				scaling = {
					value = (-0.065, -0.065, -0.065)
				}
			}
		]
	}
	{
		desc_id = midoriphysique
		$cas_female_physique_common_settings
		random_weight = 0.0
		hidden
		additional_bone_transforms = [
			{
				bone = control_root
				scaling = {
					value = (-0.065, -0.065, -0.065)
				}
			}
		]
	}
]
