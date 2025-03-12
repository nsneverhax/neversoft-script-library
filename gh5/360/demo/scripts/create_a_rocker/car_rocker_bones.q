car_bones_female_face = [
	{
		frontend_desc = qs(0xc53990a7)
		group_name = facefullness
		bones = [
			{
				bone = bone_def_cheeks
				scaling = {
					from = -0.2
					to = 0.2
				}
			}
		]
	}
	{
		frontend_desc = qs(0xdaf7f650)
		group_name = jawprominence
		bones = [
			{
				bone = bone_def_jawline
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.25, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xd1663ef2)
		group_name = jawshape
		bones = [
			{
				bone = bone_def_jaw_l_shape
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (-0.007, 0.0, -0.01)
				}
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.2, 0.0)
				}
			}
			{
				bone = bone_def_jaw_r_shape
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.007, 0.0, -0.01)
				}
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.2, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x4a5d3edf)
		group_name = chinprominence
		bones = [
			{
				bone = bone_def_chin
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.55, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x6fdcd073)
		group_name = chinwidth
		bones = [
			{
				bone = bone_def_chin
				scaling = {
					from = (-0.15, 0.0, 0.0)
					to = (0.55, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xb365dc28)
		group_name = chinheight
		bones = [
			{
				bone = bone_def_chin
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, 0.5)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe93e5b56)
		group_name = chinangle
		bones = [
			{
				bone = bone_def_chin
				rotation = {
					from = (-20.0, 0.0, 0.0)
					to = (20.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xde42ee69)
		group_name = chincleft
		bones = [
			{
				bone = bone_def_chin_cleft
				scaling = {
					from = 0.0
					to = -0.1
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.015, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x52ec040c)
		group_name = cheekboneprominence
		bones = [
			{
				bone = bone_def_cheekbone
				scaling = {
					from = (-0.025, 0.0, 0.0)
					to = (0.15, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x314245a2)
		group_name = cheekbonedepth
		bones = [
			{
				bone = bone_def_cheekbone
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, 0.012)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xbb2a8f38)
		group_name = cheekboneshape
		bones = [
			{
				bone = bone_def_cheekbone
				translation = {
					from = (0.0, 0.0, -0.0061)
					to = (0.0, -0.002, 0.001)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x5c52d109)
		group_name = waddle
		bones = [
			{
				bone = bone_def_jaw_waddle
				translation = {
					from = (0.0, -0.01, 0.0)
					to = (0.0, 0.0, 0.0)
				}
				scaling = {
					from = (0.5, 0.0, 0.5)
					to = (0.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x3b721693)
		group_name = earprominence
		bones = [
			{
				bone = bone_def_ear_r_master
				rotation = {
					from = (0.0, 0.0, 5.0)
					to = (20.0, 0.0, -60.0)
				}
			}
			{
				bone = bone_def_ear_l_master
				rotation = {
					from = (0.0, 0.0, -5.0)
					to = (20.0, 0.0, 60.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x39c7980f)
		group_name = earsize
		bones = [
			{
				bone = bone_def_ear_r_master
				scaling = {
					from = -0.1
					to = 0.2
				}
			}
			{
				bone = bone_def_ear_l_master
				scaling = {
					from = -0.1
					to = 0.2
				}
			}
		]
	}
	{
		frontend_desc = qs(0xa3baf4f7)
		group_name = earshape
		bones = [
			{
				bone = bone_def_ear_l_shape
				translation = {
					from = (0.0, 0.0, 0.002)
					to = (0.0, 0.0, -0.008)
				}
			}
			{
				bone = bone_def_ear_r_shape
				translation = {
					from = (0.0, 0.0, 0.002)
					to = (0.0, 0.0, -0.008)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xad6d83ae)
		group_name = eartip
		bones = [
			{
				bone = bone_def_ear_l_tip
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, -0.015)
					no_propagate
				}
			}
			{
				bone = bone_def_ear_r_tip
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, -0.015)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xf4e8b164)
		group_name = earlobesize
		bones = [
			{
				bone = bone_def_ear_r_lobe
				scaling = {
					from = 0.0
					to = 0.5
				}
			}
			{
				bone = bone_def_ear_l_lobe
				scaling = {
					from = 0.0
					to = 0.5
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc45f612f)
		group_name = earlobelength
		bones = [
			{
				bone = bone_def_ear_r_lobe
				translation = {
					from = (-0.0025000002, -0.01, -0.005)
					to = (0.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_def_ear_l_lobe
				translation = {
					from = (0.0025000002, -0.01, -0.005)
					to = (0.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x725437fb)
		group_name = eyescale
		bones = [
			{
				bone = bone_def_eye_l_master
				scaling = {
					from = -0.25
					to = 0.1
				}
			}
			{
				bone = bone_def_eye_r_master
				scaling = {
					from = -0.25
					to = 0.1
				}
			}
		]
	}
	{
		frontend_desc = qs(0x35f1c38a)
		group_name = eyeshape
		bones = [
			{
				bone = bone_def_eye_ll_shape
				scaling = {
					from = (0.0, 0.0, -0.8)
					to = (0.0, 0.0, 0.5)
				}
			}
			{
				bone = bone_def_eye_lu_shape
				scaling = {
					from = (0.0, 0.0, -0.8)
					to = (0.0, 0.0, 0.5)
				}
			}
			{
				bone = bone_def_eye_rl_shape
				scaling = {
					from = (0.0, 0.0, -0.8)
					to = (0.0, 0.0, 0.5)
				}
			}
			{
				bone = bone_def_eye_ru_shape
				scaling = {
					from = (0.0, 0.0, -0.8)
					to = (0.0, 0.0, 0.5)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe72f88f9)
		group_name = eyecornershape
		bones = [
			{
				bone = bone_def_eye_l_corner
				translation = {
					from = (0.0, -0.01, 0.0)
					to = (0.0, 0.01, 0.0)
				}
			}
			{
				bone = bone_def_eye_r_corner
				translation = {
					from = (0.0, -0.01, 0.0)
					to = (0.0, 0.01, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x1c5390e2)
		group_name = eyeangle
		bones = [
			{
				bone = bone_def_eye_l_master
				rotation = {
					from = (0.0, 14.0, 0.0)
					to = (0.0, -15.0, 0.0)
				}
			}
			{
				bone = bone_def_eye_r_master
				rotation = {
					from = (0.0, -14.0, 0.0)
					to = (0.0, 15.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x7da8fa24)
		group_name = eyeposition
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = bone_def_eye_l_master
				translation = {
					from = (0.0, -0.005, 0.0)
					to = (0.0, 0.004, 0.0)
				}
			}
			{
				bone = bone_def_eye_r_master
				translation = {
					from = (0.0, -0.005, 0.0)
					to = (0.0, 0.004, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe550a057)
		group_name = eyedistance
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = bone_def_eye_r_master
				translation = {
					from = (0.003, 0.0, 0.0)
					to = (-0.004, 0.0, 0.0)
				}
			}
			{
				bone = bone_def_eye_l_master
				translation = {
					from = (-0.003, 0.0, 0.0)
					to = (0.004, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x4447bde5)
		group_name = eyebrowsize
		bones = [
			{
				bone = bone_def_brow_master
				scaling = {
					from = (0.0, 0.0, -0.3)
					to = (0.2, 0.0, 0.5)
				}
			}
		]
		texture_info = {
			name = car_brow
			scaling = {
				from = 0.0
				to = 1.0
			}
		}
	}
	{
		frontend_desc = qs(0x658d153e)
		group_name = eyebrowangle
		bones = [
			{
				bone = bone_def_brow_r
				rotation = {
					from = (0.0, 20.0, 0.0)
					to = (0.0, -15.0, 0.0)
				}
			}
			{
				bone = bone_def_brow_l
				rotation = {
					from = (0.0, -20.0, 0.0)
					to = (0.0, 15.0, 0.0)
				}
			}
		]
		texture_info = {
			name = car_brow
			rotation = {
				from = 0.0
				to = 1.0
			}
		}
	}
	{
		frontend_desc = qs(0x6401de94)
		group_name = eyebrowdistance
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = bone_def_brow_r
				translation = {
					from = (0.008, 0.0, 0.0)
					to = (-0.004, 0.0, 0.0)
				}
			}
			{
				bone = bone_def_brow_l
				translation = {
					from = (-0.008, 0.0, 0.0)
					to = (0.004, 0.0, 0.0)
				}
			}
		]
		texture_info = {
			name = car_brow
			translation = {
				from = (-1.0, 0.0)
				to = (1.0, 0.0)
			}
		}
	}
	{
		frontend_desc = qs(0xe1bed922)
		group_name = browposition
		bones = [
			{
				bone = bone_def_brow_l
				translation = {
					from = (0.0, -0.003, 0.0)
					to = (0.0, 0.007, 0.0)
				}
			}
			{
				bone = bone_def_brow_r
				translation = {
					from = (0.0, -0.003, 0.0)
					to = (0.0, 0.007, 0.0)
				}
			}
		]
		texture_info = {
			name = car_brow
			translation = {
				from = (0.0, -1.0)
				to = (0.0, 1.0)
			}
		}
	}
	{
		frontend_desc = qs(0xae99b743)
		group_name = browdepth
		bones = [
			{
				bone = bone_def_brow_l
				translation = {
					from = (0.0, 0.0, -0.002)
					to = (0.0, 0.0, 0.005)
				}
			}
			{
				bone = bone_def_brow_r
				translation = {
					from = (0.0, 0.0, -0.002)
					to = (0.0, 0.0, 0.005)
				}
			}
		]
		texture_info = {
			name = car_brow
			rotation = {
				from = -1.0
				to = 0.0
			}
		}
	}
	{
		frontend_desc = qs(0x0d17431d)
		group_name = nosesize
		bones = [
			{
				bone = bone_def_nose_master
				scaling = {
					from = -0.2
					to = 0.2
				}
			}
		]
	}
	{
		frontend_desc = qs(0x650f63e5)
		group_name = nosewidth
		bones = [
			{
				bone = bone_def_nose_master
				scaling = {
					from = (-0.2, 0.0, 0.0)
					to = (0.3, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x336d9e4d)
		group_name = noselength
		bones = [
			{
				bone = bone_def_nose_master
				scaling = {
					from = (0.0, -0.3, 0.0)
					to = (0.0, 0.3, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe3ede8c0)
		group_name = noseangle
		bones = [
			{
				bone = bone_def_nose_angle
				rotation = {
					from = (-30.0, 0.0, 0.0)
					to = (20.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xbd5bf853)
		group_name = noseposition
		bones = [
			{
				bone = bone_def_nose_master
				translation = {
					from = (0.0, 0.006, 0.0)
					to = (0.0, -0.002, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x57f8824f)
		group_name = nosetipheight
		bones = [
			{
				bone = bone_def_nose_tip
				scaling = {
					from = (0.0, 0.0, -0.3)
					to = (0.0, 0.0, 0.3)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xf74fc1fe)
		group_name = nosetipwidth
		bones = [
			{
				bone = bone_def_nose_tip
				scaling = {
					from = (-0.3, 0.0, 0.0)
					to = (0.3, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xa2830553)
		group_name = nosetiplength
		bones = [
			{
				bone = bone_def_nose_tip
				scaling = {
					from = (0.0, -0.3, 0.0)
					to = (0.0, 0.3, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x71ad4adb)
		group_name = nosetipangle
		bones = [
			{
				bone = bone_def_nose_tip
				rotation = {
					from = (-30.0, 0.0, 0.0)
					to = (20.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x8e53cf80)
		group_name = nosenostrilsize
		bones = [
			{
				bone = bone_def_nostril_l
				scaling = {
					from = (-0.3, -0.3, -0.3)
					to = (0.3, 0.3, 0.3)
				}
			}
			{
				bone = bone_def_nostril_r
				scaling = {
					from = (-0.3, -0.3, -0.3)
					to = (0.3, 0.3, 0.3)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x81b79a57)
		group_name = nosenostrilheight
		bones = [
			{
				bone = bone_def_nostril_l
				scaling = {
					from = (0.0, 0.0, -0.7)
					to = (0.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_def_nostril_r
				scaling = {
					from = (0.0, 0.0, -0.7)
					to = (0.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc30c50d8)
		group_name = nosenostrilangle
		bones = [
			{
				bone = bone_def_nostril_l
				rotation = {
					from = (-10.0, 0.0, 0.0)
					to = (20.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_def_nostril_r
				rotation = {
					from = (-10.0, 0.0, 0.0)
					to = (20.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x647d2a49)
		group_name = nosebridge
		bones = [
			{
				bone = bone_def_nose_bridge
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.006, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x1b2ced47)
		group_name = mouthscale
		bones = [
			{
				bone = bone_def_mouth_master
				scaling = {
					from = (-0.2, -0.2, 0.0)
					to = (0.2, 0.2, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x3a68360e)
		group_name = mouthposition
		bones = [
			{
				bone = bone_def_mouth_master
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
				bone = bone_def_mouth_master
				translation = {
					from = (0.0, 0.0, -0.004)
					to = (0.0, 0.0, 0.0045000003)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x752b4a5e)
		group_name = mouthangle
		bones = [
			{
				bone = bone_def_lip_upper
				translation = {
					from = (0.0, 0.0, -0.003)
					to = (0.0, 0.0, 0.003)
				}
			}
			{
				bone = bone_def_lip_lower
				translation = {
					from = (0.0, 0.0, 0.003)
					to = (0.0, 0.0, -0.003)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xa08efec2)
		group_name = lipshapeupper
		bones = [
			{
				bone = bone_def_lip_u_shape
				scaling = {
					from = (0.0, 0.0, -0.25)
					to = (0.0, 0.0, 0.4)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc3ab47df)
		group_name = lipshapelower
		bones = [
			{
				bone = bone_def_lip_l_shape
				scaling = {
					from = (0.0, 0.0, -0.7)
					to = (0.0, 0.0, 0.4)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x24446c16)
		group_name = upperlipthickness
		bones = [
			{
				bone = bone_def_lip_upper
				scaling = {
					from = (0.0, 0.0, -0.4)
					to = (0.2, 0.5, 0.5)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x99c1df96)
		group_name = lowerlipthickness
		bones = [
			{
				bone = bone_def_lip_lower
				scaling = {
					from = (0.0, -0.4, -0.4)
					to = (0.2, 0.5, 0.5)
				}
			}
		]
	}
]
car_bones_male_face = [
	{
		frontend_desc = qs(0xc53990a7)
		group_name = facefullness
		bones = [
			{
				bone = bone_def_cheeks
				scaling = {
					from = -0.2
					to = 0.2
				}
			}
		]
	}
	{
		frontend_desc = qs(0xdaf7f650)
		group_name = jawprominence
		bones = [
			{
				bone = bone_def_jawline
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.13, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xd1663ef2)
		group_name = jawshape
		bones = [
			{
				bone = bone_def_jaw_l_shape
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (-0.004, 0.0, -0.01)
				}
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.1, 0.0)
				}
			}
			{
				bone = bone_def_jaw_r_shape
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.004, 0.0, -0.01)
				}
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.1, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x4a5d3edf)
		group_name = chinprominence
		bones = [
			{
				bone = bone_def_chin
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.65000004, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x6fdcd073)
		group_name = chinwidth
		bones = [
			{
				bone = bone_def_chin
				scaling = {
					from = (-0.15, 0.0, 0.0)
					to = (0.55, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xb365dc28)
		group_name = chinheight
		bones = [
			{
				bone = bone_def_chin
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, 0.5)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe93e5b56)
		group_name = chinangle
		bones = [
			{
				bone = bone_def_chin
				rotation = {
					from = (-20.0, 0.0, 0.0)
					to = (20.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xde42ee69)
		group_name = chincleft
		bones = [
			{
				bone = bone_def_chin_cleft
				scaling = {
					from = 0.0
					to = -0.1
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.007, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0x52ec040c)
		group_name = cheekboneprominence
		bones = [
			{
				bone = bone_def_cheekbone
				scaling = {
					from = (-0.025, 0.0, 0.0)
					to = (0.15, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x314245a2)
		group_name = cheekbonedepth
		bones = [
			{
				bone = bone_def_cheekbone
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, 0.012)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xbb2a8f38)
		group_name = cheekboneshape
		bones = [
			{
				bone = bone_def_cheekbone
				translation = {
					from = (0.0, 0.0, -0.0061)
					to = (0.0, -0.002, 0.001)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x5c52d109)
		group_name = waddle
		bones = [
			{
				bone = bone_def_jaw_waddle
				translation = {
					from = (0.0, -0.01, 0.0)
					to = (0.0, 0.0, 0.0)
				}
				scaling = {
					from = (0.5, 0.0, 0.5)
					to = (0.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x3b721693)
		group_name = earprominence
		bones = [
			{
				bone = bone_def_ear_r_master
				rotation = {
					from = (0.0, 0.0, 5.0)
					to = (20.0, 0.0, -60.0)
				}
			}
			{
				bone = bone_def_ear_l_master
				rotation = {
					from = (0.0, 0.0, -5.0)
					to = (20.0, 0.0, 60.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x39c7980f)
		group_name = earsize
		bones = [
			{
				bone = bone_def_ear_r_master
				scaling = {
					from = -0.1
					to = 0.2
				}
			}
			{
				bone = bone_def_ear_l_master
				scaling = {
					from = -0.1
					to = 0.2
				}
			}
		]
	}
	{
		frontend_desc = qs(0xa3baf4f7)
		group_name = earshape
		bones = [
			{
				bone = bone_def_ear_l_shape
				translation = {
					from = (0.0, 0.0, 0.002)
					to = (0.0, 0.0, -0.008)
				}
			}
			{
				bone = bone_def_ear_r_shape
				translation = {
					from = (0.0, 0.0, 0.002)
					to = (0.0, 0.0, -0.008)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xad6d83ae)
		group_name = eartip
		bones = [
			{
				bone = bone_def_ear_l_tip
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, -0.015)
					no_propagate
				}
			}
			{
				bone = bone_def_ear_r_tip
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, -0.015)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs(0xf4e8b164)
		group_name = earlobesize
		bones = [
			{
				bone = bone_def_ear_r_lobe
				scaling = {
					from = 0.0
					to = 0.5
				}
			}
			{
				bone = bone_def_ear_l_lobe
				scaling = {
					from = 0.0
					to = 0.5
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc45f612f)
		group_name = earlobelength
		bones = [
			{
				bone = bone_def_ear_r_lobe
				translation = {
					from = (-0.0025000002, -0.01, -0.005)
					to = (0.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_def_ear_l_lobe
				translation = {
					from = (0.0025000002, -0.01, -0.005)
					to = (0.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x725437fb)
		group_name = eyescale
		bones = [
			{
				bone = bone_def_eye_l_master
				scaling = {
					from = -0.25
					to = 0.1
				}
			}
			{
				bone = bone_def_eye_r_master
				scaling = {
					from = -0.25
					to = 0.1
				}
			}
		]
	}
	{
		frontend_desc = qs(0x35f1c38a)
		group_name = eyeshape
		bones = [
			{
				bone = bone_def_eye_ll_shape
				scaling = {
					from = (0.0, 0.0, -0.8)
					to = (0.0, 0.0, 0.5)
				}
			}
			{
				bone = bone_def_eye_lu_shape
				scaling = {
					from = (0.0, 0.0, -0.8)
					to = (0.0, 0.0, 0.5)
				}
			}
			{
				bone = bone_def_eye_rl_shape
				scaling = {
					from = (0.0, 0.0, -0.8)
					to = (0.0, 0.0, 0.5)
				}
			}
			{
				bone = bone_def_eye_ru_shape
				scaling = {
					from = (0.0, 0.0, -0.8)
					to = (0.0, 0.0, 0.5)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe72f88f9)
		group_name = eyecornershape
		bones = [
			{
				bone = bone_def_eye_l_corner
				translation = {
					from = (0.0, -0.007, 0.0)
					to = (0.0, 0.01, 0.0)
				}
			}
			{
				bone = bone_def_eye_r_corner
				translation = {
					from = (0.0, -0.007, 0.0)
					to = (0.0, 0.01, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x1c5390e2)
		group_name = eyeangle
		bones = [
			{
				bone = bone_def_eye_l_master
				rotation = {
					from = (0.0, 14.0, 0.0)
					to = (0.0, -15.0, 0.0)
				}
			}
			{
				bone = bone_def_eye_r_master
				rotation = {
					from = (0.0, -14.0, 0.0)
					to = (0.0, 15.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x7da8fa24)
		group_name = eyeposition
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = bone_def_eye_l_master
				translation = {
					from = (0.0, -0.005, 0.0)
					to = (0.0, 0.004, 0.0)
				}
			}
			{
				bone = bone_def_eye_r_master
				translation = {
					from = (0.0, -0.005, 0.0)
					to = (0.0, 0.004, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe550a057)
		group_name = eyedistance
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = bone_def_eye_r_master
				translation = {
					from = (0.003, 0.0, 0.0)
					to = (-0.004, 0.0, 0.0)
				}
			}
			{
				bone = bone_def_eye_l_master
				translation = {
					from = (-0.003, 0.0, 0.0)
					to = (0.004, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x4447bde5)
		group_name = eyebrowsize
		bones = [
			{
				bone = bone_def_brow_master
				scaling = {
					from = (0.0, 0.0, -0.3)
					to = (0.2, 0.0, 0.5)
				}
			}
		]
		texture_info = {
			name = car_brow
			scaling = {
				from = 0.0
				to = 1.0
			}
		}
	}
	{
		frontend_desc = qs(0x658d153e)
		group_name = eyebrowangle
		bones = [
			{
				bone = bone_def_brow_r
				rotation = {
					from = (0.0, 20.0, 0.0)
					to = (0.0, -15.0, 0.0)
				}
			}
			{
				bone = bone_def_brow_l
				rotation = {
					from = (0.0, -20.0, 0.0)
					to = (0.0, 15.0, 0.0)
				}
			}
		]
		texture_info = {
			name = car_brow
			rotation = {
				from = 0.0
				to = 1.0
			}
		}
	}
	{
		frontend_desc = qs(0x6401de94)
		group_name = eyebrowdistance
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = bone_def_brow_r
				translation = {
					from = (0.008, 0.0, 0.0)
					to = (-0.004, 0.0, 0.0)
				}
			}
			{
				bone = bone_def_brow_l
				translation = {
					from = (-0.008, 0.0, 0.0)
					to = (0.004, 0.0, 0.0)
				}
			}
		]
		texture_info = {
			name = car_brow
			translation = {
				from = (-1.0, 0.0)
				to = (1.0, 0.0)
			}
		}
	}
	{
		frontend_desc = qs(0xe1bed922)
		group_name = browposition
		bones = [
			{
				bone = bone_def_brow_l
				translation = {
					from = (0.0, -0.003, 0.0)
					to = (0.0, 0.007, 0.0)
				}
			}
			{
				bone = bone_def_brow_r
				translation = {
					from = (0.0, -0.003, 0.0)
					to = (0.0, 0.007, 0.0)
				}
			}
		]
		texture_info = {
			name = car_brow
			translation = {
				from = (0.0, -1.0)
				to = (0.0, 1.0)
			}
		}
	}
	{
		frontend_desc = qs(0xae99b743)
		group_name = browdepth
		bones = [
			{
				bone = bone_def_brow_l
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, 0.01)
				}
			}
			{
				bone = bone_def_brow_r
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.0, 0.01)
				}
			}
		]
		texture_info = {
			name = car_brow
			rotation = {
				from = -1.0
				to = 0.0
			}
		}
	}
	{
		frontend_desc = qs(0x0d17431d)
		group_name = nosesize
		bones = [
			{
				bone = bone_def_nose_master
				scaling = {
					from = -0.2
					to = 0.2
				}
			}
		]
	}
	{
		frontend_desc = qs(0x650f63e5)
		group_name = nosewidth
		bones = [
			{
				bone = bone_def_nose_master
				scaling = {
					from = (-0.2, 0.0, 0.0)
					to = (0.3, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x336d9e4d)
		group_name = noselength
		bones = [
			{
				bone = bone_def_nose_master
				scaling = {
					from = (0.0, -0.3, 0.0)
					to = (0.0, 0.3, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xe3ede8c0)
		group_name = noseangle
		bones = [
			{
				bone = bone_def_nose_angle
				rotation = {
					from = (-30.0, 0.0, 0.0)
					to = (30.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xbd5bf853)
		group_name = noseposition
		bones = [
			{
				bone = bone_def_nose_master
				translation = {
					from = (0.0, 0.006, 0.0)
					to = (0.0, -0.00135, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x57f8824f)
		group_name = nosetipheight
		bones = [
			{
				bone = bone_def_nose_tip
				scaling = {
					from = (0.0, 0.0, -0.3)
					to = (0.0, 0.0, 0.3)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xf74fc1fe)
		group_name = nosetipwidth
		bones = [
			{
				bone = bone_def_nose_tip
				scaling = {
					from = (-0.3, 0.0, 0.0)
					to = (0.3, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xa2830553)
		group_name = nosetiplength
		bones = [
			{
				bone = bone_def_nose_tip
				scaling = {
					from = (0.0, -0.3, 0.0)
					to = (0.0, 0.3, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x71ad4adb)
		group_name = nosetipangle
		bones = [
			{
				bone = bone_def_nose_tip
				rotation = {
					from = (-30.0, 0.0, 0.0)
					to = (20.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x8e53cf80)
		group_name = nosenostrilsize
		bones = [
			{
				bone = bone_def_nostril_l
				scaling = {
					from = (-0.3, -0.3, -0.3)
					to = (0.3, 0.3, 0.3)
				}
			}
			{
				bone = bone_def_nostril_r
				scaling = {
					from = (-0.3, -0.3, -0.3)
					to = (0.3, 0.3, 0.3)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x81b79a57)
		group_name = nosenostrilheight
		bones = [
			{
				bone = bone_def_nostril_l
				scaling = {
					from = (0.0, 0.0, -0.7)
					to = (0.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_def_nostril_r
				scaling = {
					from = (0.0, 0.0, -0.7)
					to = (0.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc30c50d8)
		group_name = nosenostrilangle
		bones = [
			{
				bone = bone_def_nostril_l
				rotation = {
					from = (-10.0, 0.0, 0.0)
					to = (20.0, 0.0, 0.0)
				}
			}
			{
				bone = bone_def_nostril_r
				rotation = {
					from = (-10.0, 0.0, 0.0)
					to = (20.0, 0.0, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x647d2a49)
		group_name = nosebridge
		bones = [
			{
				bone = bone_def_nose_bridge
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.006, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x1b2ced47)
		group_name = mouthscale
		bones = [
			{
				bone = bone_def_mouth_master
				scaling = {
					from = (-0.2, -0.2, 0.0)
					to = (0.155, 0.155, 0.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x3a68360e)
		group_name = mouthposition
		bones = [
			{
				bone = bone_def_mouth_master
				translation = {
					from = (0.0, 0.0035, 0.0)
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
				bone = bone_def_mouth_master
				translation = {
					from = (0.0, 0.0, -0.004)
					to = (0.0, 0.0, 0.0025000002)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x752b4a5e)
		group_name = mouthangle
		bones = [
			{
				bone = bone_def_lip_upper
				translation = {
					from = (0.0, 0.0, -0.003)
					to = (0.0, 0.0, 0.003)
				}
			}
			{
				bone = bone_def_lip_lower
				translation = {
					from = (0.0, 0.0, 0.003)
					to = (0.0, 0.0, -0.003)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xa08efec2)
		group_name = lipshapeupper
		bones = [
			{
				bone = bone_def_lip_u_shape
				scaling = {
					from = (0.0, 0.0, -10.0)
					to = (0.0, 0.0, 30.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0xc3ab47df)
		group_name = lipshapelower
		bones = [
			{
				bone = bone_def_lip_l_shape
				scaling = {
					from = (0.0, 0.0, -1.0)
					to = (0.0, 0.0, 2.0)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x24446c16)
		group_name = upperlipthickness
		bones = [
			{
				bone = bone_def_lip_upper
				scaling = {
					from = (0.0, 0.0, -0.4)
					to = (0.2, 0.5, 0.5)
				}
			}
		]
	}
	{
		frontend_desc = qs(0x99c1df96)
		group_name = lowerlipthickness
		bones = [
			{
				bone = bone_def_lip_lower
				scaling = {
					from = (0.0, -0.4, -0.4)
					to = (0.2, 0.5, 0.5)
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
		max = 1.0
		bones = [
			{
				bone = bone_pelvis
				scaling = {
					from = (0.0, -0.2, -0.15)
					to = (0.0, 0.2, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_split_ass_l
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
				bone = bone_split_ass_r
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
				bone = bone_stomach_upper
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
				bone = bone_neck
				scaling = {
					from = (0.0, 0.2, 0.2)
					to = (0.0, -0.4, -0.4)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_r
				scaling = {
					from = (-0.2, -0.2, -0.2)
					to = (0.35000002, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_l
				scaling = {
					from = (-0.2, -0.2, -0.2)
					to = (0.35000002, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_bicep_l
				scaling = {
					from = (0.0, -0.3, -0.3)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					from = (0.0, -0.3, -0.3)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
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
		max = 1.0
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
		max = 1.0
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
		max = 1.0
		bones = [
			{
				bone = bone_pelvis
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_split_ass_l
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
				bone = bone_split_ass_r
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
				bone = bone_stomach_lower
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = bone_stomach_upper
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
				bone = bone_neck
				scaling = {
					from = (0.0, -0.4, -0.4)
					to = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_top_r
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
				bone = bone_twist_bicep_top_l
				scaling = {
					from = (-0.2, -0.2, -0.35000002)
					to = (0.2, 0.5, 0.75)
					no_propagate
				}
			}
			{
				bone = bone_twist_bicep_mid_r
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
				bone = bone_twist_bicep_mid_l
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
				bone = bone_bicep_l
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_bicep_r
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = bone_forearm_l
				scaling = {
					from = (0.0, -0.2, -0.2)
					to = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = bone_forearm_r
				scaling = {
					from = (0.0, -0.2, -0.2)
					to = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_r
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_twist_thigh_l
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = bone_thigh_r
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_thigh_l
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_knee_r
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = bone_knee_l
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
		max = 1.0
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
