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
				bone = bone_neck
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
				bone = bone_stomach_upper
				scaling = {
					value = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_stomach_lower
				scaling = {
					value = (0.0, -0.08, -0.08)
					no_propagate
				}
			}
			{
				bone = bone_pelvis
				scaling = {
					value = (0.0, -0.07, -0.07)
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
				bone = bone_twist_bicep_mid_r
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
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, -0.15, -0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					value = (0.0, -0.08, -0.08)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, -0.08, -0.08)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					value = (0.0, -0.08, -0.08)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, -0.08, -0.08)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					value = (0.0, -0.08, -0.08)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
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
				bone = bone_neck
				scaling = {
					value = (0.0, -0.5, -0.5)
					no_propagate
				}
			}
			{
				bone = bone_collar_l
				translation = {
					value = (0.0, 0.01, 0.0)
				}
			}
			{
				bone = bone_collar_r
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
				bone = bone_stomach_upper
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
				bone = bone_pelvis
				scaling = {
					value = (0.0, -0.08, -0.08)
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
				bone = bone_twist_bicep_mid_r
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
				bone = bone_bicep_r
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
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
				bone = bone_forearm_r
				scaling = {
					value = (0.0, -0.2, -0.2)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, -0.2, -0.2)
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
				bone = bone_thigh_r
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
				bone = bone_thigh_l
				scaling = {
					value = (0.0, -0.15, -0.15)
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
		]
	}
	{
		desc_id = femalephysique4
		$cas_female_physique_common_settings
		random_weight = 0.0
		additional_bone_transforms = [
			{
				bone = bone_pelvis
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
				bone = bone_stomach_lower
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_collar_l
				translation = {
					value = (0.0, 0.0, -0.01)
					no_propagate
				}
			}
			{
				bone = bone_collar_r
				translation = {
					value = (0.0, 0.0, 0.01)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
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
				bone = bone_ankle_l
				scaling = {
					value = (0.0, 0.0, 0.1)
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (0.0, 0.0, 0.1)
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					value = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					value = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					value = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
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
				bone = bone_neck
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_pelvis
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
				bone = bone_stomach_lower
				scaling = {
					value = (0.0, 0.35000002, 0.3)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (0.0, 0.25, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.0, 0.0, 0.0)
					no_propagate
				}
				translation = {
					value = (0.0, -0.01, -0.0)
				}
			}
			{
				bone = bone_collar_r
				scaling = {
					value = (0.0, 0.0, 0.0)
					no_propagate
				}
				translation = {
					value = (0.0, -0.01, 0.0)
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
				bone = bone_forearm_r
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_wrist_l
				scaling = {
					value = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_wrist_r
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
				bone = bone_ankle_l
				scaling = {
					value = (0.0, 0.0, 0.15)
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (0.0, 0.0, 0.15)
				}
			}
			{
				bone = bone_split_ass_r
				scaling = {
					value = (0.0, 0.35000002, 0.35000002)
					no_propagate
				}
			}
			{
				bone = bone_split_ass_l
				scaling = {
					value = (0.0, 0.35000002, 0.35000002)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, 0.35000002, 0.35000002)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, 0.35000002, 0.35000002)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					value = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
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
				bone = bone_neck
				scaling = {
					value = (0.0, 0.4, 0.4)
					no_propagate
				}
			}
			{
				bone = bone_pelvis
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
				bone = bone_stomach_lower
				scaling = {
					value = (0.0, 0.55, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
				scaling = {
					value = (-0.0, 0.55, 0.45000002)
					no_propagate
				}
			}
			{
				bone = bone_collar_l
				scaling = {
					value = (0.0, 0.0, 0.05)
					no_propagate
				}
				translation = {
					value = (0.0, -0.025, 0.0)
				}
			}
			{
				bone = bone_collar_r
				scaling = {
					value = (0.0, 0.0, 0.05)
					no_propagate
				}
				translation = {
					value = (0.0, -0.025, 0.0)
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					value = (0.1, 0.15, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					value = (0.1, 0.15, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_l
				scaling = {
					value = (0.0, 0.55, 0.55)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
				scaling = {
					value = (0.0, 0.55, 0.55)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					value = (0.0, 0.45000002, 0.45000002)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					value = (0.0, 0.45000002, 0.45000002)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					value = (0.0, 0.35000002, 0.35000002)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					value = (0.0, 0.35000002, 0.35000002)
					no_propagate
				}
			}
			{
				bone = bone_twist_wrist_l
				scaling = {
					value = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_wrist_r
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
				bone = bone_ankle_l
				scaling = {
					value = (0.0, 0.0, 0.2)
				}
			}
			{
				bone = bone_ankle_r
				scaling = {
					value = (0.0, 0.0, 0.2)
				}
			}
			{
				bone = bone_split_ass_r
				scaling = {
					value = (0.2, 0.45000002, 0.45000002)
					no_propagate
				}
			}
			{
				bone = bone_split_ass_l
				scaling = {
					value = (0.2, 0.45000002, 0.45000002)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					value = (0.0, 0.5, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					value = (0.0, 0.5, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					value = (0.0, 0.5, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					value = (0.0, 0.5, 0.5)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					value = (0.0, 0.35000002, 0.35000002)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
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
