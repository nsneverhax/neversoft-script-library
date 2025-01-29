car_bones_female_face = [
	{
		frontend_desc = qs(0xba9759e2)
		group_name = headsize
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_head
				scaling = {
					from = -0.05
					to = 0.1
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc53990a7)
		group_name = facefullness
		bones = [
			{
				bone = Bone_Jaw
				translation = {
					from = (0.0, 0.01, 0.0)
					to = (0.0, -0.01, 0.0)
				}
			}
			{
				bone = bone_trans_chin
				scaling = {
					from = (0.2, 0.0, -0.3)
					to = (-0.1, 0.0, 0.0)
				}
				translation = {
					from = (0.0, -0.01, 0.0)
					to = (0.0, 0.01, 0.0)
				}
			}
			{
				bone = bone_scale_cheek_l
				scaling = {
					from = (-0.1, 0.0, 0.0)
					to = (0.1, 0.03, 0.07)
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.006, -0.003, 0.0)
				}
				rotation = {
					from = (0.0, 0.0, 0.0)
					to = (5.0, 5.0, 0.0)
				}
			}
			{
				bone = bone_scale_cheek_r
				scaling = {
					from = (-0.1, 0.0, 0.0)
					to = (0.1, 0.03, 0.07)
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (-0.006, -0.003, 0.0)
				}
				rotation = {
					from = (0.0, 0.0, 0.0)
					to = (5.0, -5.0, 0.0)
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
					to = 0.1
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc652367a)
		group_name = chinsize
		bones = [
			{
				bone = bone_trans_chin
				scaling = {
					from = (-0.015, -0.025, -0.025)
					to = (0.3, 0.0, 0.1)
				}
				translation = {
					from = (0.0, 0.002, 0.005)
					to = (0.0, -0.002, -0.01)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x6fdcd073)
		group_name = chinwidth
		bones = [
			{
				bone = bone_trans_chin
				scaling = {
					from = (-0.5, 0.0, 0.0)
					to = (0.5, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x8a18a79f)
		group_name = earangle
		bones = [
			{
				bone = bone_rot_ear_l
				rotation = {
					from = (0.0, 0.0, -10.0)
					to = (0.0, 0.0, 60.0)
				}
			}
			{
				bone = bone_rot_ear_r
				rotation = {
					from = (0.0, 0.0, 10.0)
					to = (0.0, 0.0, -60.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xad6d83ae)
		group_name = eartip
		bones = [
			{
				bone = bone_eartip_l
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.004, 0.01, 0.001)
				}
			}
			{
				bone = bone_eartip_r
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (-0.01, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x0d17431d)
		group_name = nosesize
		bones = [
			{
				bone = bone_scale_nose
				scaling = {
					from = -0.2
					to = 0.3
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, 0.003)
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
				}
			}
		]
	}
	{
		frontend_desc = qs(0x650f63e5)
		group_name = nosewidth
		bones = [
			{
				bone = bone_scale_nostrils
				scaling = {
					from = (-0.35000002, 0.0, -0.003)
					to = (0.3, 0.0, 0.0015)
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, 0.002)
				}
			}
			{
				bone = bone_scale_nose_tip
				scaling = {
					from = (-0.2, 0.0, -0.0025000002)
					to = (0.4, 0.0, 0.0015)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe3ede8c0)
		group_name = noseangle
		bones = [
			{
				bone = bone_scale_nostrils
				translation = {
					from = (0.0, -0.002, 0.0)
					to = (0.0, 0.001, 0.0)
				}
				rotation = {
					from = (15.0, 0.0, 0.0)
					to = (-25.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_scale_nose_tip
				translation = {
					from = (0.0, 0.002, 0.0)
					to = (0.0, -0.005, -0.002)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x667e0ccc)
		group_name = nosedepth
		bones = [
			{
				bone = bone_scale_nose
				scaling = {
					from = (0.0, -0.4, 0.0)
					to = (0.0, 0.5, 0.0)
				}
				translation = {
					from = (0.0, 0.0, 0.002)
					to = (0.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_scale_nose_tip
				translation = {
					from = (0.0, 0.0, 0.002)
					to = (0.0, 0.0, -0.001)
				}
			}
			{
				bone = bone_scale_nostrils
				translation = {
					from = (0.0, 0.0, 0.002)
					to = (0.0, 0.0, 0.0)
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
					from = (0.0, -0.005, 0.0)
					to = (0.0, 0.007, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xbd5bf853)
		group_name = noseposition
		bones = [
			{
				bone = bone_scale_nose
				translation = {
					from = (0.0, 0.006, 0.0)
					to = (0.0, -0.005, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xbb2a8f38)
		group_name = cheekboneshape
		bones = [
			{
				bone = Bone_Cheek_Upper_L
				translation = {
					from = (0.0, 0.0, -0.0061)
					to = (0.0, -0.002, 0.001)
				}
			}
			{
				bone = bone_cheek_lower_l
				translation = {
					from = (-0.008, 0.0, 0.008)
					to = (0.005, 0.0, -0.003)
				}
			}
			{
				bone = Bone_Cheek_Upper_R
				translation = {
					from = (0.0, 0.001, -0.006)
					to = (0.0, -0.002, 0.001)
				}
			}
			{
				bone = bone_cheek_lower_r
				translation = {
					from = (0.008, 0.0, 0.008)
					to = (-0.005, 0.0, -0.003)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x1b2ced47)
		group_name = mouthscale
		bones = [
			{
				bone = bone_trans_mouth
				scaling = {
					from = (-0.2, -0.1, 0.0)
					to = (0.3, 0.15, 0.05)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x3a68360e)
		group_name = mouthposition
		bones = [
			{
				bone = bone_trans_mouth
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.005, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xf0b8ae52)
		group_name = mouthdepth
		bones = [
			{
				bone = bone_trans_mouth
				translation = {
					from = (0.0, 0.0, -0.004)
					to = (0.0, 0.0, 0.006)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x752b4a5e)
		group_name = mouthangle
		bones = [
			{
				bone = bone_scale_lip_upper
				translation = {
					from = (0.0, 0.0, -0.003)
					to = (0.0, 0.0, 0.003)
				}
			}
			{
				bone = bone_scale_lip_lower
				translation = {
					from = (0.0, 0.0, 0.003)
					to = (0.0, 0.0, -0.003)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc9c4b7f8)
		group_name = lipshape
		bones = [
			{
				bone = bone_trans_lip_outer
				translation = {
					from = (0.0, -0.001, 0.0)
					to = (0.0, 0.0015, 0.0)
				}
			}
			{
				bone = bone_trans_lip_mid
				translation = {
					from = (0.0, 0.001, 0.0)
					to = (0.0, -0.001, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x24446c16)
		group_name = upperlipthickness
		bones = [
			{
				bone = bone_scale_lip_upper
				scaling = {
					from = (-0.5, -0.1, -0.6)
					to = (0.3, 0.1, 0.4)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x99c1df96)
		group_name = lowerlipthickness
		bones = [
			{
				bone = bone_scale_lip_lower
				scaling = {
					from = (-0.1, -0.2, -0.4)
					to = (0.2, 0.5, 0.7)
				}
				translation = {
					from = (0.0, 0.003, 0.0)
					to = (0.0, -0.003, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x1c5390e2)
		group_name = eyeangle
		bones = [
			{
				bone = bone_rot_eye_l
				rotation = {
					from = (0.0, 14.0, 0.0)
					to = (0.0, -15.0, 0.0)
				}
			}
			{
				bone = bone_rot_eye_r
				rotation = {
					from = (0.0, -14.0, 0.0)
					to = (0.0, 15.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x35f1c38a)
		group_name = eyeshape
		bones = [
			{
				bone = bone_rot_eye_l
				scaling = {
					from = (0.0, 0.0, -0.55)
					to = (0.0, 0.0, 0.120000005)
				}
			}
			{
				bone = bone_rot_eye_r
				scaling = {
					from = (0.0, 0.0, -0.55)
					to = (0.0, 0.0, 0.120000005)
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
					from = (0.0, -0.005, 0.0)
					to = (0.0, 0.004, 0.0)
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (0.0, -0.005, 0.0)
					to = (0.0, 0.004, 0.0)
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
					from = (0.0, 0.0, -0.005)
					to = (0.0, 0.0, 0.002)
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (0.0, 0.0, -0.005)
					to = (0.0, 0.0, 0.002)
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
				}
			}
			{
				bone = bone_trans_eye_l
				scaling = {
					from = -0.1
					to = 0.1
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
					from = (0.003, 0.0, 0.0)
					to = (-0.004, 0.0, 0.0)
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (-0.003, 0.0, 0.0)
					to = (0.004, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x4c2f4656)
		group_name = eyebrowshape
		bones = [
			{
				bone = bone_browshapeside_l
				translation = {
					from = (0.0, -0.002, 0.0)
					to = (0.0, 0.0025000002, 0.0)
				}
			}
			{
				bone = bone_browshapemid_l
				translation = {
					from = (0.0, 0.0025000002, 0.0)
					to = (0.0, -0.001, 0.0)
				}
			}
			{
				bone = bone_browshapeside_r
				translation = {
					from = (0.0, -0.002, 0.0)
					to = (0.0, 0.0025000002, 0.0)
				}
			}
			{
				bone = bone_browshapemid_r
				translation = {
					from = (0.0, 0.0025000002, 0.0)
					to = (0.0, -0.001, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x4447bde5)
		group_name = eyebrowsize
		bones = [
			{
				bone = bone_trans_brow_r
				scaling = {
					from = (-0.1, 0.0, -0.2)
					to = (0.03, 0.0, 0.25)
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.0018000001, 0.0)
				}
			}
			{
				bone = bone_trans_brow_l
				scaling = {
					from = (-0.1, 0.0, -0.2)
					to = (0.03, 0.0, 0.25)
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.0018000001, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x658d153e)
		group_name = eyebrowangle
		bones = [
			{
				bone = bone_trans_brow_r
				rotation = {
					from = (0.0, 10.0, 0.0)
					to = (0.0, -18.0, 0.0)
				}
			}
			{
				bone = bone_trans_brow_l
				rotation = {
					from = (0.0, -10.0, 0.0)
					to = (0.0, 18.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x6401de94)
		group_name = eyebrowdistance
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_trans_brow_r
				translation = {
					from = (0.008, 0.0, 0.0)
					to = (-0.004, 0.0, 0.0)
				}
			}
			{
				bone = bone_trans_brow_l
				translation = {
					from = (-0.008, 0.0, 0.0)
					to = (0.004, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe1bed922)
		group_name = browposition
		bones = [
			{
				bone = bone_trans_brow
				translation = {
					from = (0.0, -0.003, 0.0)
					to = (0.0, 0.007, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xae99b743)
		group_name = browdepth
		bones = [
			{
				bone = bone_trans_brow
				translation = {
					from = (0.0, 0.0, -0.002)
					to = (0.0, 0.0, 0.005)
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
				bone = bone_head
				scaling = {
					from = -0.05
					to = 0.1
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc53990a7)
		group_name = facefullness
		bones = [
			{
				bone = Bone_Jaw
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.02, 0.0)
				}
			}
			{
				bone = bone_trans_chin
				scaling = {
					from = (0.2, 0.0, -0.3)
					to = (-0.1, 0.0, 0.0)
				}
				translation = {
					from = (0.0, -0.015, 0.0)
					to = (0.0, 0.02, 0.0)
				}
			}
			{
				bone = bone_scale_cheek_l
				scaling = {
					from = (-0.1, 0.0, 0.0)
					to = (0.1, 0.03, 0.07)
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.009, -0.003, 0.0)
				}
				rotation = {
					from = (0.0, 0.0, 0.0)
					to = (5.0, 5.0, 0.0)
				}
			}
			{
				bone = bone_scale_cheek_r
				scaling = {
					from = (-0.1, 0.0, 0.0)
					to = (0.1, 0.03, 0.07)
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (-0.009, -0.003, 0.0)
				}
				rotation = {
					from = (0.0, 0.0, 0.0)
					to = (5.0, -5.0, 0.0)
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
					from = -0.2
					to = 0.2
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc652367a)
		group_name = chinsize
		bones = [
			{
				bone = bone_trans_chin
				scaling = {
					from = (-0.015, -0.025, -0.025)
					to = (0.3, 0.0, 0.1)
				}
				translation = {
					from = (0.0, -0.002, -0.005)
					to = (0.0, 0.002, 0.007)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x6fdcd073)
		group_name = chinwidth
		bones = [
			{
				bone = bone_trans_chin
				scaling = {
					from = (-0.7, 0.0, 0.0)
					to = (0.15, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x8a18a79f)
		group_name = earangle
		bones = [
			{
				bone = bone_rot_ear_l
				rotation = {
					from = (0.0, 0.0, -10.0)
					to = (0.0, 0.0, 60.0)
				}
			}
			{
				bone = bone_rot_ear_r
				rotation = {
					from = (0.0, 0.0, 10.0)
					to = (0.0, 0.0, -60.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xad6d83ae)
		group_name = eartip
		bones = [
			{
				bone = bone_eartip_l
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.004, 0.01, 0.001)
				}
			}
			{
				bone = bone_eartip_r
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (-0.01, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x0d17431d)
		group_name = nosesize
		bones = [
			{
				bone = bone_scale_nose
				scaling = {
					from = -0.2
					to = 0.3
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.005, 0.0)
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
					from = (-0.5, 0.0, -0.5)
					to = (0.5, 0.25, 0.4)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x650f63e5)
		group_name = nosewidth
		bones = [
			{
				bone = bone_scale_nostrils
				scaling = {
					from = (-0.3, 0.0, -0.0025000002)
					to = (0.5, 0.0, 0.0015)
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, 0.002)
				}
			}
			{
				bone = bone_scale_nose_tip
				scaling = {
					from = (-0.1, 0.0, -0.0025000002)
					to = (0.4, 0.0, 0.0015)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe3ede8c0)
		group_name = noseangle
		bones = [
			{
				bone = bone_scale_nostrils
				translation = {
					from = (0.0, -0.005, 0.0)
					to = (0.0, 0.001, 0.0)
				}
				rotation = {
					from = (17.0, 0.0, 0.0)
					to = (-25.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_scale_nose_tip
				translation = {
					from = (0.0, 0.004, 0.0)
					to = (0.0, -0.005, -0.002)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x667e0ccc)
		group_name = nosedepth
		bones = [
			{
				bone = bone_scale_nose
				scaling = {
					from = (0.0, -0.4, 0.0)
					to = (0.0, 0.5, 0.0)
				}
				translation = {
					from = (0.0, 0.0, 0.002)
					to = (0.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_scale_nose_tip
				translation = {
					from = (0.0, 0.0, 0.002)
					to = (0.0, 0.0, -0.001)
				}
			}
			{
				bone = bone_scale_nostrils
				translation = {
					from = (0.0, 0.0, 0.002)
					to = (0.0, 0.0, 0.0)
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
					from = (0.0, -0.005, 0.0)
					to = (0.0, 0.007, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x1ab9805b)
		group_name = nosebroken
		bones = [
			{
				bone = bone_trans_nosebridge
				translation = {
					from = (-0.01, 0.0, 0.0)
					to = (0.01, 0.0, 0.0)
				}
			}
			{
				bone = bone_scale_nose
				rotation = {
					from = (0.0, -8.0, 0.0)
					to = (0.0, 8.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xbd5bf853)
		group_name = noseposition
		bones = [
			{
				bone = bone_scale_nose
				translation = {
					from = (0.0, 0.008, 0.0)
					to = (0.0, -0.005, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xbb2a8f38)
		group_name = cheekboneshape
		bones = [
			{
				bone = Bone_Cheek_Upper_L
				translation = {
					from = (0.0, 0.001, -0.006)
					to = (0.0, -0.002, 0.001)
				}
			}
			{
				bone = bone_cheek_lower_l
				translation = {
					from = (-0.008, 0.0, 0.008)
					to = (0.005, 0.0, -0.003)
				}
			}
			{
				bone = Bone_Cheek_Upper_R
				translation = {
					from = (0.0, 0.001, -0.006)
					to = (0.0, -0.002, 0.001)
				}
			}
			{
				bone = bone_cheek_lower_r
				translation = {
					from = (0.008, 0.0, 0.008)
					to = (-0.005, 0.0, -0.003)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x1b2ced47)
		group_name = mouthscale
		bones = [
			{
				bone = bone_trans_mouth
				scaling = {
					from = (-0.2, 0.0, -0.1)
					to = (0.3, 0.05, 0.15)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x3a68360e)
		group_name = mouthposition
		bones = [
			{
				bone = bone_trans_mouth
				translation = {
					from = (0.0, 0.008, 0.0)
					to = (0.0, -0.008, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xf0b8ae52)
		group_name = mouthdepth
		bones = [
			{
				bone = bone_trans_mouth
				translation = {
					from = (0.0, 0.0, -0.004)
					to = (0.0, 0.0, 0.006)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x752b4a5e)
		group_name = mouthangle
		bones = [
			{
				bone = bone_scale_lip_upper
				translation = {
					from = (0.0, 0.0, -0.003)
					to = (0.0, 0.0, 0.003)
				}
			}
			{
				bone = bone_scale_lip_lower
				translation = {
					from = (0.0, 0.0, 0.003)
					to = (0.0, 0.0, -0.003)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc9c4b7f8)
		group_name = lipshape
		bones = [
			{
				bone = bone_trans_lip_outer
				translation = {
					from = (0.0, -0.001, 0.0)
					to = (0.0, 0.0015, 0.0)
				}
			}
			{
				bone = bone_trans_lip_mid
				translation = {
					from = (0.0, 0.001, 0.0)
					to = (0.0, -0.001, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x24446c16)
		group_name = upperlipthickness
		bones = [
			{
				bone = bone_scale_lip_upper
				scaling = {
					from = (-0.5, -0.1, -0.6)
					to = (0.3, 0.1, 0.4)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x99c1df96)
		group_name = lowerlipthickness
		bones = [
			{
				bone = bone_scale_lip_lower
				scaling = {
					from = (-0.1, -0.2, -0.4)
					to = (0.2, 0.5, 0.7)
				}
				translation = {
					from = (0.0, 0.003, 0.0)
					to = (0.0, -0.003, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x1c5390e2)
		group_name = eyeangle
		bones = [
			{
				bone = bone_rot_eye_l
				rotation = {
					from = (0.0, 8.0, 0.0)
					to = (0.0, -10.0, 0.0)
				}
			}
			{
				bone = bone_rot_eye_r
				rotation = {
					from = (0.0, -8.0, 0.0)
					to = (0.0, 10.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x35f1c38a)
		group_name = eyeshape
		bones = [
			{
				bone = bone_rot_eye_l
				scaling = {
					from = (0.0, 0.0, -0.8)
					to = (0.0, 0.0, 0.2)
				}
			}
			{
				bone = bone_rot_eye_r
				scaling = {
					from = (0.0, 0.0, -0.8)
					to = (0.0, 0.0, 0.2)
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
					from = (0.0, -0.007, 0.0)
					to = (0.0, 0.004, 0.0)
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (0.0, -0.007, 0.0)
					to = (0.0, 0.004, 0.0)
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
					from = (0.0, 0.0, -0.003)
					to = (0.0, 0.0, 0.004)
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (0.0, 0.0, -0.003)
					to = (0.0, 0.0, 0.004)
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
					from = -0.3
					to = 0.008
				}
			}
			{
				bone = bone_trans_eye_l
				scaling = {
					from = -0.3
					to = 0.008
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
					from = (0.005, 0.0, 0.0)
					to = (-0.003, 0.0, 0.0)
				}
			}
			{
				bone = bone_trans_eye_l
				translation = {
					from = (-0.005, 0.0, 0.0)
					to = (0.003, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x4c2f4656)
		group_name = eyebrowshape
		bones = [
			{
				bone = bone_browshapeside_l
				translation = {
					from = (0.0, -0.002, 0.0)
					to = (0.0, 0.0025000002, 0.0)
				}
			}
			{
				bone = bone_browshapemid_l
				translation = {
					from = (0.0, 0.0025000002, 0.0)
					to = (0.0, -0.001, 0.0)
				}
			}
			{
				bone = bone_browshapeside_r
				translation = {
					from = (0.0, -0.002, 0.0)
					to = (0.0, 0.0025000002, 0.0)
				}
			}
			{
				bone = bone_browshapemid_r
				translation = {
					from = (0.0, 0.0025000002, 0.0)
					to = (0.0, -0.001, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x4447bde5)
		group_name = eyebrowsize
		bones = [
			{
				bone = bone_trans_brow_r
				scaling = {
					from = (-0.1, 0.0, -0.2)
					to = (0.1, 0.0, 0.5)
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.004, 0.0)
				}
			}
			{
				bone = bone_trans_brow_l
				scaling = {
					from = (-0.1, 0.0, -0.2)
					to = (0.1, 0.0, 0.5)
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.004, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x658d153e)
		group_name = eyebrowangle
		bones = [
			{
				bone = bone_trans_brow_r
				rotation = {
					from = (0.0, 7.0, 0.0)
					to = (0.0, -18.0, 0.0)
				}
			}
			{
				bone = bone_trans_brow_l
				rotation = {
					from = (0.0, -7.0, 0.0)
					to = (0.0, 18.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x6401de94)
		group_name = eyebrowdistance
		min = -1.0
		Max = 1.0
		bones = [
			{
				bone = bone_trans_brow_r
				translation = {
					from = (0.001, 0.0, 0.0)
					to = (-0.006, 0.0, 0.0)
				}
			}
			{
				bone = bone_trans_brow_l
				translation = {
					from = (-0.001, 0.0, 0.0)
					to = (0.006, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe1bed922)
		group_name = browposition
		bones = [
			{
				bone = bone_trans_brow
				translation = {
					from = (0.0, -0.002, 0.0)
					to = (0.0, 0.007, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xae99b743)
		group_name = browdepth
		bones = [
			{
				bone = bone_trans_brow
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, 0.01)
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
