car_bones_female_face = [
	{
		frontend_desc = qs(0xba9759e2)
		group_name = headsize
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_trans_eye_l
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = bone_trans_eye_r
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = bone_trans_nosebridge
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = bone_scale_nose_tip
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = Bone_Jaw
				scaling = {
					from = -0.05
					to = 0.09
					no_propagate
				}
			}
			{
				bone = bone_head
				scaling = {
					from = -0.025
					to = 0.05
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc53990a7)
		group_name = facefullness
		bones = [
			{
				bone = bone_head
				scaling = {
					from = (0.0, 0.0, -0.003)
					to = (0.0, 0.0, 0.085)
					no_propagate
				}
			}
			{
				bone = Bone_Jaw
				scaling = {
					from = (0.0, 0.0, -0.3)
					to = (0.0, 0.0, 0.2)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x96c3ca83)
		group_name = jawscale
		bones = [
			{
				bone = Bone_Jaw
				scaling = {
					from = -0.1
					to = 0.09
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x0d17431d)
		group_name = nosesize
		bones = [
			{
				bone = bone_trans_nosebridge
				scaling = {
					from = -0.3
					to = 0.4
					no_propagate
				}
			}
			{
				bone = bone_scale_nose_tip
				scaling = {
					from = -0.3
					to = 0.4
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xa493fadc)
		group_name = nosetip
		bones = [
			{
				bone = bone_scale_nose_tip
				scaling = {
					from = (-0.2, 0.0, -0.2)
					to = (0.3, 0.0, 0.2)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x650f63e5)
		group_name = nosewidth
		bones = [
			{
				bone = bone_trans_nosebridge
				scaling = {
					from = (-0.1, 0.0, -0.0025000002)
					to = (0.3, 0.0, 0.0015)
					no_propagate
				}
			}
			{
				bone = bone_scale_nose_tip
				scaling = {
					from = (-0.2, 0.0, -0.006)
					to = (0.6, 0.0, 0.0035)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe3ede8c0)
		group_name = noseangle
		bones = [
			{
				bone = bone_scale_nose_tip
				rotation = {
					from = (20.0, 0.0, 0.0)
					to = (-20.0, 0.0, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x647d2a49)
		group_name = nosebridge
		bones = [
			{
				bone = bone_trans_nosebridge
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.008, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x24446c16)
		group_name = upperlipthickness
		bones = [
			{
				bone = Bone_Lip_Upper_Corner_L
				scaling = {
					from = (-0.2, 0.0, -0.1)
					to = (0.3, 0.05, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Upper_Corner_R
				scaling = {
					from = (-0.2, 0.0, -0.1)
					to = (0.3, 0.05, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Upper_Mid
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.4, 0.1, 0.4)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x99c1df96)
		group_name = lowerlipthickness
		bones = [
			{
				bone = Bone_Lip_Lower_Corner_L
				scaling = {
					from = (-0.2, 0.0, -0.1)
					to = (0.3, 0.05, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Lower_Corner_R
				scaling = {
					from = (-0.2, 0.0, -0.1)
					to = (0.3, 0.05, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Lower_Mid
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.6, 0.1, 0.3)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x7da8fa24)
		group_name = eyeposition
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_trans_eye_r
				translation = {
					from = (0.004, 0.0, 0.0)
					to = (-0.004, 0.0, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (0.004, 0.0, 0.0)
					to = (-0.004, 0.0, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x99c074ee)
		group_name = eyedepth
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_trans_eye_r
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.001, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.001, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x725437fb)
		group_name = eyescale
		bones = [
			{
				bone = bone_trans_eye_r
				scaling = {
					from = -0.1
					to = 0.1
					no_propagate
				}
			}
			{
				bone = bone_trans_eye_l
				scaling = {
					from = -0.1
					to = 0.1
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe550a057)
		group_name = eyedistance
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_trans_eye_r
				translation = {
					from = (0.0, 0.0, 0.0015)
					to = (0.0, 0.0, -0.002)
					no_propagate
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (0.0, 0.0, -0.0015)
					to = (0.0, 0.0, 0.002)
					no_propagate
				}
			}
		]
	}
]
car_bones_male_face = [
	{
		frontend_desc = qs(0xba9759e2)
		group_name = headsize
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_trans_eye_l
				scaling = {
					from = -0.05
					to = 0.09
					no_propagate
				}
			}
			{
				bone = bone_trans_eye_r
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = bone_trans_nosebridge
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = bone_scale_nose_tip
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = Bone_Jaw
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = bone_head
				scaling = {
					from = -0.025
					to = 0.05
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc53990a7)
		group_name = facefullness
		bones = [
			{
				bone = bone_head
				scaling = {
					from = (0.0, 0.0, -0.002)
					to = (0.0, 0.0, 0.095000006)
					no_propagate
				}
			}
			{
				bone = Bone_Jaw
				scaling = {
					from = (0.0, 0.0, -0.15)
					to = (0.0, 0.0, 0.15)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x96c3ca83)
		group_name = jawscale
		bones = [
			{
				bone = Bone_Jaw
				scaling = {
					from = -0.05
					to = 0.08
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x0d17431d)
		group_name = nosesize
		bones = [
			{
				bone = bone_trans_nosebridge
				scaling = {
					from = -0.3
					to = 0.4
					no_propagate
				}
			}
			{
				bone = bone_scale_nose_tip
				scaling = {
					from = -0.3
					to = 0.4
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xa493fadc)
		group_name = nosetip
		bones = [
			{
				bone = bone_scale_nose_tip
				scaling = {
					from = (-0.2, 0.0, -0.2)
					to = (0.3, 0.0, 0.2)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x650f63e5)
		group_name = nosewidth
		bones = [
			{
				bone = bone_trans_nosebridge
				scaling = {
					from = (-0.2, 0.0, -0.006)
					to = (0.3, 0.0, 0.0015)
					no_propagate
				}
			}
			{
				bone = bone_scale_nose_tip
				scaling = {
					from = (-0.2, 0.0, -0.006)
					to = (0.7, 0.0, 0.004)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe3ede8c0)
		group_name = noseangle
		bones = [
			{
				bone = bone_scale_nose_tip
				rotation = {
					from = (20.0, 0.0, 0.0)
					to = (-20.0, 0.0, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x647d2a49)
		group_name = nosebridge
		bones = [
			{
				bone = bone_trans_nosebridge
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.005, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x24446c16)
		group_name = upperlipthickness
		bones = [
			{
				bone = Bone_Lip_Upper_Corner_L
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.3, 0.1, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Upper_Corner_R
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.3, 0.1, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Upper_Mid
				scaling = {
					from = (-0.5, 0.0, -0.25)
					to = (0.4, 0.15, 0.4)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x99c1df96)
		group_name = lowerlipthickness
		bones = [
			{
				bone = Bone_Lip_Lower_Corner_L
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.7, 0.2, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Lower_Corner_R
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.7, 0.2, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Lower_Mid
				scaling = {
					from = (-0.35000002, 0.0, -0.2)
					to = (0.35000002, 0.1, 0.35000002)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x7da8fa24)
		group_name = eyeposition
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_trans_eye_r
				translation = {
					from = (0.005, 0.0, 0.0)
					to = (-0.005, 0.0, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (0.005, 0.0, 0.0)
					to = (-0.005, 0.0, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x99c074ee)
		group_name = eyedepth
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_trans_eye_r
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.001, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.001, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x725437fb)
		group_name = eyescale
		bones = [
			{
				bone = bone_trans_eye_r
				scaling = {
					from = -0.25
					to = 0.25
					no_propagate
				}
			}
			{
				bone = bone_trans_eye_l
				scaling = {
					from = -0.25
					to = 0.25
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe550a057)
		group_name = eyedistance
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_trans_eye_r
				translation = {
					from = (0.0, 0.0, 0.0015)
					to = (0.0, 0.0, -0.002)
					no_propagate
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (0.0, 0.0, -0.0015)
					to = (0.0, 0.0, 0.002)
					no_propagate
				}
			}
		]
	}
]
car_bones_female_body = [
	{
		frontend_desc = qs(0x8bb5c297)
		group_name = physique
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = BONE_PELVIS
				scaling = {
					from = (0.0, -0.2, -0.15)
					to = (0.0, 0.2, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Split_Ass_L
				scaling = {
					from = (0.0, -0.2, -0.15)
					to = (0.0, 0.2, 0.15)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.03, 0.0, -0.01)
					no_propagate
				}
			}
			{
				bone = Bone_Split_Ass_R
				scaling = {
					from = (0.0, -0.2, -0.15)
					to = (0.0, 0.2, 0.15)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.03, 0.0, 0.01)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Upper
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_chest
				scaling = {
					from = (0.0, -0.05, -0.0125)
					to = (0.0, 0.05, 0.05)
					no_propagate
				}
			}
			{
				bone = Bone_Neck
				scaling = {
					from = (0.0, 0.2, 0.2)
					to = (0.0, -0.4, -0.4)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_R
				scaling = {
					from = (-0.2, -0.2, -0.2)
					to = (0.35000002, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_L
				scaling = {
					from = (-0.2, -0.2, -0.2)
					to = (0.35000002, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_L
				scaling = {
					from = (0.0, -0.3, -0.3)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_R
				scaling = {
					from = (0.0, -0.3, -0.3)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Thigh_R
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Thigh_L
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_R
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_L
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_R
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_L
				scaling = {
					from = (0.0, -0.05, -0.05)
					to = (0.0, 0.05, 0.05)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xea1fd0c6)
		group_name = height
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = control_root
				scaling = {
					from = (-0.025, -0.025, -0.025)
					to = (0.025, 0.025, 0.025)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x0016bd4d)
		group_name = chest
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_chest
				scaling = {
					from = (-0.015, -0.15, 0.0)
					to = (0.015, 0.1, 0.0)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.0015, 0.0)
					no_propagate
				}
			}
		]
	}
]
car_bones_male_body = [
	{
		frontend_desc = qs(0x8bb5c297)
		group_name = physique
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = BONE_PELVIS
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Split_Ass_L
				scaling = {
					from = (0.0, -0.2, -0.15)
					to = (0.0, 0.2, 0.15)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.03, 0.0, -0.01)
					no_propagate
				}
			}
			{
				bone = Bone_Split_Ass_R
				scaling = {
					from = (0.0, -0.2, -0.15)
					to = (0.0, 0.2, 0.15)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.03, 0.0, 0.01)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Lower
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Upper
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.0, 0.0)
					no_propagate
				}
			}
			{
				bone = bone_chest
				scaling = {
					from = (0.0, -0.2, -0.05)
					to = (0.15, 0.2, 0.2)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.005, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Neck
				scaling = {
					from = (0.0, -0.4, -0.4)
					to = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_R
				scaling = {
					from = (-0.2, -0.2, -0.35000002)
					to = (0.2, 0.5, 0.75)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0025000002, 0.0, -0.005)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_L
				scaling = {
					from = (-0.2, -0.2, -0.35000002)
					to = (0.2, 0.5, 0.75)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_R
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.5, 0.3)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0025000002, 0.0, -0.007)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Mid_L
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.5, 0.3)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0025000002, 0.0, 0.007)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_L
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_R
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Forearm_L
				scaling = {
					from = (0.0, -0.2, -0.2)
					to = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = Bone_Forearm_R
				scaling = {
					from = (0.0, -0.2, -0.2)
					to = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Thigh_R
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Thigh_L
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_R
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_L
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_R
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_L
				scaling = {
					from = (0.0, -0.05, -0.05)
					to = (0.0, 0.05, 0.05)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xea1fd0c6)
		group_name = height
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = control_root
				scaling = {
					from = (-0.025, -0.025, -0.025)
					to = (0.025, 0.025, 0.025)
				}
			}
		]
	}
]
