cas_male_physique_common_settings = {
	deform_bones = CAR_Bones_Female_Body
	deform_main_skeleton
}
CAS_Male_Physique = [
	{
		desc_id = MalePhysiqueUntouched
		$cas_male_physique_common_settings
		hidden
		additional_bone_transforms = [
		]
	}
	{
		desc_id = MalePhysique1
		$cas_male_physique_common_settings
		additional_bone_transforms = [
		]
	}
	{
		desc_id = MalePhysique2
		$cas_male_physique_common_settings
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
		desc_id = MalePhysique3
		$cas_male_physique_common_settings
		random_weight = 0.0
		additional_bone_transforms = [
			{
				bone = Bone_Head
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
				bone = Bone_Pelvis
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
		desc_id = MalePhysique4
		$cas_male_physique_common_settings
		random_weight = 0.0
		additional_bone_transforms = [
			{
				bone = Bone_Chest
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
				bone = Bone_Pelvis
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
					value = (0.0, 0.0, 0.025)
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
					value = (0.0, 0.0, -0.025)
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
		desc_id = MalePhysique5
		$cas_male_physique_common_settings
		random_weight = 0.0
		replace = `tex/models/Characters/car/male/car_male_Body_N`
		with = `tex/models/Characters/car/male/car_male_Body_fat_N`
		in = CAS_Body
		additional_bone_transforms = [
			{
				bone = control_root
				scaling = {
					value = (-0.005, -0.005, -0.005)
				}
			}
			{
				bone = Bone_Pelvis
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
				bone = Bone_Head
				scaling = {
					value = (0.05, 0.05, 0.05)
				}
			}
			{
				bone = Bone_Chest
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
		desc_id = MalePhysique6
		$cas_male_physique_common_settings
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
				bone = Bone_Chest
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
		desc_id = MalePhysique7
		$cas_male_physique_common_settings
		random_weight = 0.0
		replace = `tex/models/Characters/car/male/car_male_Body_N`
		with = `tex/models/Characters/car/male/car_male_Body_fat_N`
		in = CAS_Body
		additional_bone_transforms = [
			{
				bone = Bone_Head
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
				bone = Bone_Chest
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
					value = (0.0, 0.0, 0.0)
					no_propagate
				}
				translation = {
					value = (0.0, -0.05, 0.0)
				}
			}
			{
				bone = Bone_Collar_L
				scaling = {
					value = (0.0, 0.0, 0.0)
					no_propagate
				}
				translation = {
					value = (0.0, -0.05, 0.0)
				}
			}
			{
				bone = Bone_Pelvis
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
					value = (0.2, 0.8, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_R
				scaling = {
					value = (0.0, 1.0, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_R
				scaling = {
					value = (0.0, 0.8, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_L
				scaling = {
					value = (0.2, 0.8, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_L
				scaling = {
					value = (0.0, 1.0, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_L
				scaling = {
					value = (0.0, 0.8, 0.3)
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
					value = (0.0, 0.75, 0.5)
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
	{
		desc_id = SkeletonPhysique
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
		desc_id = AvatarPhysique
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
				bone = Bone_Head
				scaling = {
					value = (-0.225, -0.225, -0.225)
				}
			}
			{
				bone = Bone_Pelvis
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
				bone = Bone_Chest
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
