ntg_left_stick_anim_data = {
	blend_out_ik_grab = Bone_IK_Hand_Board_R
	blend_out_ik_finger = Bone_IK_Hand_Board_L
	front = {
		finger_flip_play_speed = $ntg_finger_flip_anim_speed
		grab_from_spin = 0
		trucks_up_rot_start = $ntg_default_trucks_up_rot_start
		trucks_up_rot_time = $ntg_default_trucks_up_rot_time
		trucks_up_rot_dir = $ntg_default_trucks_up_rot_dir
		Grab = NTG_LArm_Grab_F_Apx_D
		grab_spinning = NTG_LArm_Grab_F_FromNTT_Apx_D
		grab_trucks_up = NTG_LArm_Grab_F_Trksup_Apx_D
		grab_release = NTG_LArm_Grab_F_Ungrab_Apx_D
		grab_base = NTG_LArm_Grab_F
		shake_front = NTG_LArm_Grab_F_Shake_F_D
		shake_back = NTG_LArm_Grab_F_Shake_B_D
		shake_left = NTG_LArm_Grab_F_Shake_L_D
		shake_right = NTG_LArm_Grab_F_Shake_R_D
		shake_center = NTG_LArm_Grab_F_Shake_R_D
		mini_tweak_front = [
			NTG_LArm_Grab_F_Arm_F_D
		]
		mini_tweak_back = [
			NTG_LArm_Grab_F_Arm_B_D
		]
		mini_tweak_left = [
			NTG_LArm_Grab_F_Arm_L_D
		]
		mini_tweak_right = [
			NTG_LArm_Grab_F_Arm_R_D
		]
		mini_tweak_center = [
			NTG_LArm_Grab_F_Arm_D
		]
		idle_front = NTG_LArm_Grab_F_Idle_F_D
		idle_back = NTG_LArm_Grab_F_Idle_B_D
		idle_left = NTG_LArm_Grab_F_Idle_L_D
		idle_right = NTG_LArm_Grab_F_Idle_R_D
		idle_center = NTG_LArm_Grab_F_Idle_D
		finger_flip_rot_type = kickflip
		finger_front = {
			cw = {
				init = NTG_LArm_Grab_F_FngrFlp_Init_F_D
				idle = NTG_LArm_Grab_F_FngrFlp_Idle_F_D
				regrab = NTG_LArm_Grab_F_FngrFlp_Rtrn_F_D
			}
			ccw = {
				init = NTG_LArm_Grab_F_FgrFlpCCW_Init_F_D
				idle = NTG_LArm_Grab_F_FgrFlpCCW_Idle_F_D
				regrab = NTG_LArm_Grab_F_FgrFlpCCW_Rtrn_F_D
			}
			branch_offset = 0.0
		}
		finger_back = {
			cw = {
				init = NTG_LArm_Grab_F_FngrFlp_Init_B_D
				idle = NTG_LArm_Grab_F_FngrFlp_Idle_B_D
				regrab = NTG_LArm_Grab_F_FngrFlp_Rtrn_B_D
			}
			ccw = {
				init = NTG_LArm_Grab_F_FgrFlpCCW_Init_B_D
				idle = NTG_LArm_Grab_F_FgrFlpCCW_Idle_B_D
				regrab = NTG_LArm_Grab_F_FgrFlpCCW_Rtrn_B_D
			}
			branch_offset = 0.0
		}
		finger_left = {
			cw = {
				init = NTG_LArm_Grab_F_FngrFlp_Init_L_D
				idle = NTG_LArm_Grab_F_FngrFlp_Idle_L_D
				regrab = NTG_LArm_Grab_F_FngrFlp_Rtrn_L_D
			}
			ccw = {
				init = NTG_LArm_Grab_F_FgrFlpCCW_Init_L_D
				idle = NTG_LArm_Grab_F_FgrFlpCCW_Idle_L_D
				regrab = NTG_LArm_Grab_F_FgrFlpCCW_Rtrn_L_D
			}
			branch_offset = 0.0
		}
		finger_right = {
			cw = {
				init = NTG_LArm_Grab_F_FngrFlp_Init_R_D
				idle = NTG_LArm_Grab_F_FngrFlp_Idle_R_D
				regrab = NTG_LArm_Grab_F_FngrFlp_Rtrn_R_D
			}
			ccw = {
				init = NTG_LArm_Grab_F_FgrFlpCCW_Init_R_D
				idle = NTG_LArm_Grab_F_FgrFlpCCW_Idle_R_D
				regrab = NTG_LArm_Grab_F_FgrFlpCCW_Rtrn_R_D
			}
			branch_offset = 0.0
		}
		finger_center = {
			cw = {
				init = NTG_LArm_Grab_F_FngrFlp_Init_D
				idle = NTG_LArm_Grab_F_FngrFlp_Idle_D
				regrab = NTG_LArm_Grab_F_FngrFlp_Rtrn_D
			}
			ccw = {
				init = NTG_LArm_Grab_F_FgrFlpCCW_Init_D
				idle = NTG_LArm_Grab_F_FgrFlpCCW_Idle_D
				regrab = NTG_LArm_Grab_F_FgrFlpCCW_Rtrn_D
			}
			branch_offset = 0.0
		}
		tweak_rings = [
			NTG_LArm_Grab_F_TweekX_D
			NTG_LArm_Grab_F_TweekY_D
			NTG_LArm_Grab_F_TweekZ_D
		]
	}
	back = {
		finger_flip_play_speed = $ntg_finger_flip_anim_speed
		grab_from_spin = 0
		trucks_up_rot_start = $ntg_default_trucks_up_rot_start
		trucks_up_rot_time = $ntg_default_trucks_up_rot_time
		trucks_up_rot_dir = ccw
		Grab = NTG_LArm_Grab_B_Apx_D
		grab_spinning = NTG_LArm_Grab_B_FromNTT_Apx_D
		grab_trucks_up = NTG_LArm_Grab_B_Trksup_Apx_D
		grab_release = NTG_LArm_Grab_B_Ungrab_Apx_D
		grab_base = NTG_LArm_Grab_B
		shake_front = NTG_LArm_Grab_B_Shake_F_D
		shake_back = NTG_LArm_Grab_B_Shake_B_D
		shake_left = NTG_LArm_Grab_B_Shake_L_D
		shake_right = NTG_LArm_Grab_B_Shake_R_D
		shake_center = NTG_LArm_Grab_B_Shake_R_D
		mini_tweak_front = [
			NTG_LArm_Grab_B_Arm_F_D
		]
		mini_tweak_back = [
			NTG_LArm_Grab_B_Arm_B_D
		]
		mini_tweak_left = [
			NTG_LArm_Grab_B_Arm_L_D
		]
		mini_tweak_right = [
			NTG_LArm_Grab_B_Arm_R_D
		]
		mini_tweak_center = [
			NTG_LArm_Grab_B_Arm_D
		]
		idle_front = NTG_LArm_Grab_B_Idle_F_D
		idle_back = NTG_LArm_Grab_B_Idle_B_D
		idle_left = NTG_LArm_Grab_B_Idle_L_D
		idle_right = NTG_LArm_Grab_B_Idle_R_D
		idle_center = NTG_LArm_Grab_B_Idle_D
		finger_flip_rot_type = kickflip
		finger_front = {
			cw = {
				init = NTG_LArm_Grab_B_FngrFlp_Init_F_D
				idle = NTG_LArm_Grab_B_FngrFlp_Idle_F_D
				regrab = NTG_LArm_Grab_B_FngrFlp_Rtrn_F_D
			}
			ccw = {
				init = NTG_LArm_Grab_B_FgrFlpCCW_Init_F_D
				idle = NTG_LArm_Grab_B_FgrFlpCCW_Idle_F_D
				regrab = NTG_LArm_Grab_B_FgrFlpCCW_Rtrn_F_D
			}
			branch_offset = 0.0
		}
		finger_back = {
			cw = {
				init = NTG_LArm_Grab_B_FngrFlp_Init_B_D
				idle = NTG_LArm_Grab_B_FngrFlp_Idle_B_D
				regrab = NTG_LArm_Grab_B_FngrFlp_Rtrn_B_D
			}
			ccw = {
				init = NTG_LArm_Grab_B_FgrFlpCCW_Init_B_D
				idle = NTG_LArm_Grab_B_FgrFlpCCW_Idle_B_D
				regrab = NTG_LArm_Grab_B_FgrFlpCCW_Rtrn_B_D
			}
			branch_offset = 0.0
		}
		finger_left = {
			cw = {
				init = NTG_LArm_Grab_B_FngrFlp_Init_L_D
				idle = NTG_LArm_Grab_B_FngrFlp_Idle_L_D
				regrab = NTG_LArm_Grab_B_FngrFlp_Rtrn_L_D
			}
			ccw = {
				init = NTG_LArm_Grab_B_FgrFlpCCW_Init_L_D
				idle = NTG_LArm_Grab_B_FgrFlpCCW_Idle_L_D
				regrab = NTG_LArm_Grab_B_FgrFlpCCW_Rtrn_L_D
			}
			branch_offset = 0.0
		}
		finger_right = {
			cw = {
				init = NTG_LArm_Grab_B_FngrFlp_Init_R_D
				idle = NTG_LArm_Grab_B_FngrFlp_Idle_R_D
				regrab = NTG_LArm_Grab_B_FngrFlp_Rtrn_R_D
			}
			ccw = {
				init = NTG_LArm_Grab_B_FgrFlpCCW_Init_R_D
				idle = NTG_LArm_Grab_B_FgrFlpCCW_Idle_R_D
				regrab = NTG_LArm_Grab_B_FgrFlpCCW_Rtrn_R_D
			}
			branch_offset = 0.0
		}
		finger_center = {
			cw = {
				init = NTG_LArm_Grab_B_FngrFlp_Init_D
				idle = NTG_LArm_Grab_B_FngrFlp_Idle_D
				regrab = NTG_LArm_Grab_B_FngrFlp_Rtrn_D
			}
			ccw = {
				init = NTG_LArm_Grab_B_FgrFlpCCW_Init_D
				idle = NTG_LArm_Grab_B_FgrFlpCCW_Idle_D
				regrab = NTG_LArm_Grab_B_FgrFlpCCW_Rtrn_D
			}
			branch_offset = 0.0
		}
		tweak_rings = [
			NTG_LArm_Grab_B_TweekX_D
			NTG_LArm_Grab_B_TweekY_D
			NTG_LArm_Grab_B_TweekZ_D
		]
	}
	left = {
		finger_flip_play_speed = 4.0
		grab_from_spin = 0
		trucks_up_rot_start = $ntg_default_trucks_up_rot_start
		trucks_up_rot_time = $ntg_default_trucks_up_rot_time
		trucks_up_rot_dir = ccw
		Grab = NTG_LArm_Grab_L_Apx_D
		grab_spinning = NTG_LArm_Grab_L_FromNTT_Apx_D
		grab_trucks_up = NTG_LArm_Grab_L_Trksup_Apx_D
		grab_release = NTG_LArm_Grab_L_Ungrab_Apx_D
		grab_base = NTG_LArm_Grab_L
		shake_front = NTG_LArm_Grab_L_Shake_F_D
		shake_back = NTG_LArm_Grab_L_Shake_B_D
		shake_left = NTG_LArm_Grab_L_Shake_L_D
		shake_right = NTG_LArm_Grab_L_Shake_R_D
		shake_center = NTG_LArm_Grab_L_Shake_R_D
		mini_tweak_front = [
			NTG_LArm_Grab_L_Arm_F_D
		]
		mini_tweak_back = [
			NTG_LArm_Grab_L_Arm_B_D
		]
		mini_tweak_left = [
			NTG_LArm_Grab_L_Arm_L_D
		]
		mini_tweak_right = [
			NTG_LArm_Grab_L_Arm_R_D
		]
		mini_tweak_center = [
			NTG_LArm_Grab_L_Arm_D
		]
		idle_front = NTG_LArm_Grab_L_Idle_F_D
		idle_back = NTG_LArm_Grab_L_Idle_B_D
		idle_left = NTG_LArm_Grab_L_Idle_L_D
		idle_right = NTG_LArm_Grab_L_Idle_R_D
		idle_center = NTG_LArm_Grab_L_Idle_D
		finger_flip_rot_type = shoveit
		finger_front = {
			cw = {
				init = NTG_LArm_Grab_L_FngrFlp_Init_F_D
				idle = NTG_LArm_Grab_L_FngrFlp_Idle_F_D
				regrab = NTG_LArm_Grab_L_FngrFlp_Rtrn_F_D
			}
			ccw = {
				init = NTG_LArm_Grab_L_FgrFlpCCW_Init_F_D
				idle = NTG_LArm_Grab_L_FgrFlpCCW_Idle_F_D
				regrab = NTG_LArm_Grab_L_FgrFlpCCW_Rtrn_F_D
			}
			branch_offset = 0.0
		}
		finger_back = {
			cw = {
				init = NTG_LArm_Grab_L_FngrFlp_Init_B_D
				idle = NTG_LArm_Grab_L_FngrFlp_Idle_B_D
				regrab = NTG_LArm_Grab_L_FngrFlp_Rtrn_B_D
			}
			ccw = {
				init = NTG_LArm_Grab_L_FgrFlpCCW_Init_B_D
				idle = NTG_LArm_Grab_L_FgrFlpCCW_Idle_B_D
				regrab = NTG_LArm_Grab_L_FgrFlpCCW_Rtrn_B_D
			}
			branch_offset = 0.0
		}
		finger_left = {
			cw = {
				init = NTG_LArm_Grab_L_FngrFlp_Init_L_D
				idle = NTG_LArm_Grab_L_FngrFlp_Idle_L_D
				regrab = NTG_LArm_Grab_L_FngrFlp_Rtrn_L_D
			}
			ccw = {
				init = NTG_LArm_Grab_L_FgrFlpCCW_Init_L_D
				idle = NTG_LArm_Grab_L_FgrFlpCCW_Idle_L_D
				regrab = NTG_LArm_Grab_L_FgrFlpCCW_Rtrn_L_D
			}
			branch_offset = 0.0
		}
		finger_right = {
			cw = {
				init = NTG_LArm_Grab_L_FngrFlp_Init_R_D
				idle = NTG_LArm_Grab_L_FngrFlp_Idle_R_D
				regrab = NTG_LArm_Grab_L_FngrFlp_Rtrn_R_D
			}
			ccw = {
				init = NTG_LArm_Grab_L_FgrFlpCCW_Init_R_D
				idle = NTG_LArm_Grab_L_FgrFlpCCW_Idle_R_D
				regrab = NTG_LArm_Grab_L_FgrFlpCCW_Rtrn_R_D
			}
			branch_offset = 0.0
		}
		finger_center = {
			cw = {
				init = NTG_LArm_Grab_L_FngrFlp_Init_D
				idle = NTG_LArm_Grab_L_FngrFlp_Idle_D
				regrab = NTG_LArm_Grab_L_FngrFlp_Rtrn_D
			}
			ccw = {
				init = NTG_LArm_Grab_L_FgrFlpCCW_Init_D
				idle = NTG_LArm_Grab_L_FgrFlpCCW_Idle_D
				regrab = NTG_LArm_Grab_L_FgrFlpCCW_Rtrn_D
			}
			branch_offset = 0.0
		}
		tweak_rings = [
			NTG_LArm_Grab_L_TweekX_D
			NTG_LArm_Grab_L_TweekY_D
			NTG_LArm_Grab_L_TweekZ_D
		]
	}
	right = {
		finger_flip_play_speed = 4.0
		grab_from_spin = 0
		trucks_up_rot_start = $ntg_default_trucks_up_rot_start
		trucks_up_rot_time = $ntg_default_trucks_up_rot_time
		trucks_up_rot_dir = $ntg_default_trucks_up_rot_dir
		Grab = NTG_LArm_Grab_R_Apx_D
		grab_spinning = NTG_LArm_Grab_R_FromNTT_Apx_D
		grab_trucks_up = NTG_LArm_Grab_R_Trksup_Apx_D
		grab_release = NTG_LArm_Grab_R_Ungrab_Apx_D
		grab_base = NTG_LArm_Grab_R
		shake_front = NTG_LArm_Grab_R_Shake_F_D
		shake_back = NTG_LArm_Grab_R_Shake_B_D
		shake_left = NTG_LArm_Grab_R_Shake_L_D
		shake_right = NTG_LArm_Grab_R_Shake_R_D
		shake_center = NTG_LArm_Grab_R_Shake_R_D
		mini_tweak_front = [
			NTG_LArm_Grab_R_Arm_F_D
		]
		mini_tweak_back = [
			NTG_LArm_Grab_R_Arm_B_D
		]
		mini_tweak_left = [
			NTG_LArm_Grab_R_Arm_L_D
		]
		mini_tweak_right = [
			NTG_LArm_Grab_R_Arm_R_D
		]
		mini_tweak_center = [
			NTG_LArm_Grab_R_Arm_D
		]
		idle_front = NTG_LArm_Grab_R_Idle_F_D
		idle_back = NTG_LArm_Grab_R_Idle_B_D
		idle_left = NTG_LArm_Grab_R_Idle_L_D
		idle_right = NTG_LArm_Grab_R_Idle_R_D
		idle_center = NTG_LArm_Grab_R_Idle_D
		finger_flip_rot_type = shoveit
		finger_front = {
			cw = {
				init = NTG_LArm_Grab_R_FngrFlp_Init_F_D
				idle = NTG_LArm_Grab_R_FngrFlp_Idle_F_D
				regrab = NTG_LArm_Grab_R_FngrFlp_Rtrn_F_D
			}
			ccw = {
				init = NTG_LArm_Grab_R_FgrFlpCCW_Init_F_D
				idle = NTG_LArm_Grab_R_FgrFlpCCW_Idle_F_D
				regrab = NTG_LArm_Grab_R_FgrFlpCCW_Rtrn_F_D
			}
			branch_offset = 0.0
		}
		finger_back = {
			cw = {
				init = NTG_LArm_Grab_R_FngrFlp_Init_B_D
				idle = NTG_LArm_Grab_R_FngrFlp_Idle_B_D
				regrab = NTG_LArm_Grab_R_FngrFlp_Rtrn_B_D
			}
			ccw = {
				init = NTG_LArm_Grab_R_FgrFlpCCW_Init_B_D
				idle = NTG_LArm_Grab_R_FgrFlpCCW_Idle_B_D
				regrab = NTG_LArm_Grab_R_FgrFlpCCW_Rtrn_B_D
			}
			branch_offset = 0.0
		}
		finger_left = {
			cw = {
				init = NTG_LArm_Grab_R_FngrFlp_Init_L_D
				idle = NTG_LArm_Grab_R_FngrFlp_Idle_L_D
				regrab = NTG_LArm_Grab_R_FngrFlp_Rtrn_L_D
			}
			ccw = {
				init = NTG_LArm_Grab_R_FgrFlpCCW_Init_L_D
				idle = NTG_LArm_Grab_R_FgrFlpCCW_Idle_L_D
				regrab = NTG_LArm_Grab_R_FgrFlpCCW_Rtrn_L_D
			}
			branch_offset = 0.0
		}
		finger_right = {
			cw = {
				init = NTG_LArm_Grab_R_FngrFlp_Init_R_D
				idle = NTG_LArm_Grab_R_FngrFlp_Idle_R_D
				regrab = NTG_LArm_Grab_R_FngrFlp_Rtrn_R_D
			}
			ccw = {
				init = NTG_LArm_Grab_R_FgrFlpCCW_Init_R_D
				idle = NTG_LArm_Grab_R_FgrFlpCCW_Idle_R_D
				regrab = NTG_LArm_Grab_R_FgrFlpCCW_Rtrn_R_D
			}
			branch_offset = 0.0
		}
		finger_center = {
			cw = {
				init = NTG_LArm_Grab_R_FngrFlp_Init_D
				idle = NTG_LArm_Grab_R_FngrFlp_Idle_D
				regrab = NTG_LArm_Grab_R_FngrFlp_Rtrn_D
			}
			ccw = {
				init = NTG_LArm_Grab_R_FgrFlpCCW_Init_D
				idle = NTG_LArm_Grab_R_FgrFlpCCW_Idle_D
				regrab = NTG_LArm_Grab_R_FgrFlpCCW_Rtrn_D
			}
			branch_offset = 0.0
		}
		tweak_rings = [
			NTG_LArm_Grab_R_TweekX_D
			NTG_LArm_Grab_R_TweekY_D
			NTG_LArm_Grab_R_TweekZ_D
		]
	}
}
ntg_right_stick_anim_data = {
	blend_out_ik_grab = Bone_IK_Hand_Board_L
	blend_out_ik_finger = Bone_IK_Hand_Board_R
	front = {
		finger_flip_play_speed = $ntg_finger_flip_anim_speed
		grab_from_spin = 0
		trucks_up_rot_start = $ntg_default_trucks_up_rot_start
		trucks_up_rot_time = $ntg_default_trucks_up_rot_time
		trucks_up_rot_dir = ccw
		Grab = NTG_RArm_Grab_F_Apx_D
		grab_spinning = NTG_RArm_Grab_F_FromNTT_Apx_D
		grab_trucks_up = NTG_RArm_Grab_F_Trksup_Apx_D
		grab_release = NTG_RArm_Grab_F_Ungrab_Apx_D
		grab_base = NTG_RArm_Grab_F
		shake_front = Ska8_zacs_empty_anim_D
		shake_back = Ska8_zacs_empty_anim_D
		shake_left = Ska8_zacs_empty_anim_D
		shake_right = Ska8_zacs_empty_anim_D
		shake_center = Ska8_zacs_empty_anim_D
		mini_tweak_front = [
			NTG_RArm_Grab_F_Arm_F_D
		]
		mini_tweak_back = [
			NTG_RArm_Grab_F_Arm_B_D
		]
		mini_tweak_left = [
			NTG_RArm_Grab_F_Arm_L_D
		]
		mini_tweak_right = [
			NTG_RArm_Grab_F_Arm_R_D
		]
		mini_tweak_center = [
			NTG_RArm_Grab_F_Arm_D
		]
		idle_front = NTG_RArm_Grab_F_Idle_F_D
		idle_back = NTG_RArm_Grab_F_Idle_B_D
		idle_left = NTG_RArm_Grab_F_Idle_L_D
		idle_right = NTG_RArm_Grab_F_Idle_R_D
		idle_center = NTG_RArm_Grab_F_Idle_D
		finger_flip_rot_type = kickflip
		finger_front = {
			cw = {
				init = NTG_RArm_Grab_F_FngrFlp_Init_F_D
				idle = NTG_RArm_Grab_F_FngrFlp_Idle_F_D
				regrab = NTG_RArm_Grab_F_FngrFlp_Rtrn_F_D
			}
			ccw = {
				init = NTG_RArm_Grab_F_FgrFlpCCW_Init_F_D
				idle = NTG_RArm_Grab_F_FgrFlpCCW_Idle_F_D
				regrab = NTG_RArm_Grab_F_FgrFlpCCW_Rtrn_F_D
			}
			branch_offset = 0.0
		}
		finger_back = {
			cw = {
				init = NTG_RArm_Grab_F_FngrFlp_Init_B_D
				idle = NTG_RArm_Grab_F_FngrFlp_Idle_B_D
				regrab = NTG_RArm_Grab_F_FngrFlp_Rtrn_B_D
			}
			ccw = {
				init = NTG_RArm_Grab_F_FgrFlpCCW_Init_B_D
				idle = NTG_RArm_Grab_F_FgrFlpCCW_Idle_B_D
				regrab = NTG_RArm_Grab_F_FgrFlpCCW_Rtrn_B_D
			}
			branch_offset = 0.0
		}
		finger_left = {
			cw = {
				init = NTG_RArm_Grab_F_FngrFlp_Init_L_D
				idle = NTG_RArm_Grab_F_FngrFlp_Idle_L_D
				regrab = NTG_RArm_Grab_F_FngrFlp_Rtrn_L_D
			}
			ccw = {
				init = NTG_RArm_Grab_F_FgrFlpCCW_Init_L_D
				idle = NTG_RArm_Grab_F_FgrFlpCCW_Idle_L_D
				regrab = NTG_RArm_Grab_F_FgrFlpCCW_Rtrn_L_D
			}
			branch_offset = 0.0
		}
		finger_right = {
			cw = {
				init = NTG_RArm_Grab_F_FngrFlp_Init_R_D
				idle = NTG_RArm_Grab_F_FngrFlp_Idle_R_D
				regrab = NTG_RArm_Grab_F_FngrFlp_Rtrn_R_D
			}
			ccw = {
				init = NTG_RArm_Grab_F_FgrFlpCCW_Init_R_D
				idle = NTG_RArm_Grab_F_FgrFlpCCW_Idle_R_D
				regrab = NTG_RArm_Grab_F_FgrFlpCCW_Rtrn_R_D
			}
			branch_offset = 0.0
		}
		finger_center = {
			cw = {
				init = NTG_RArm_Grab_F_FngrFlp_Init_D
				idle = NTG_RArm_Grab_F_FngrFlp_Idle_D
				regrab = NTG_RArm_Grab_F_FngrFlp_Rtrn_D
			}
			ccw = {
				init = NTG_RArm_Grab_F_FgrFlpCCW_Init_D
				idle = NTG_RArm_Grab_F_FgrFlpCCW_Idle_D
				regrab = NTG_RArm_Grab_F_FgrFlpCCW_Rtrn_D
			}
			branch_offset = 0.0
		}
		tweak_rings = [
			NTG_RArm_Grab_F_TweekX_D
			NTG_RArm_Grab_F_TweekY_D
			NTG_RArm_Grab_F_TweekZ_D
		]
	}
	back = {
		finger_flip_play_speed = $ntg_finger_flip_anim_speed
		grab_from_spin = 0
		trucks_up_rot_start = $ntg_default_trucks_up_rot_start
		trucks_up_rot_time = $ntg_default_trucks_up_rot_time
		trucks_up_rot_dir = $ntg_default_trucks_up_rot_dir
		Grab = NTG_RArm_Grab_B_Apx_D
		grab_spinning = NTG_RArm_Grab_B_FromNTT_Apx_D
		grab_trucks_up = NTG_RArm_Grab_B_Trksup_Apx_D
		grab_release = NTG_RArm_Grab_B_Ungrab_Apx_D
		grab_base = NTG_RArm_Grab_B
		shake_front = NTG_RArm_Grab_B_Shake_F_D
		shake_back = NTG_RArm_Grab_B_Shake_B_D
		shake_left = NTG_RArm_Grab_B_Shake_L_D
		shake_right = NTG_RArm_Grab_B_Shake_R_D
		shake_center = NTG_RArm_Grab_B_Shake_D
		mini_tweak_front = [
			NTG_RArm_Grab_B_Arm_F_D
		]
		mini_tweak_back = [
			NTG_RArm_Grab_B_Arm_B_D
		]
		mini_tweak_left = [
			NTG_RArm_Grab_B_Arm_L_D
		]
		mini_tweak_right = [
			NTG_RArm_Grab_B_Arm_R_D
		]
		mini_tweak_center = [
			NTG_RArm_Grab_B_Arm_D
		]
		idle_front = NTG_RArm_Grab_B_Idle_F_D
		idle_back = NTG_RArm_Grab_B_Idle_B_D
		idle_left = NTG_RArm_Grab_B_Idle_L_D
		idle_right = NTG_RArm_Grab_B_Idle_R_D
		idle_center = NTG_RArm_Grab_B_Idle_D
		finger_flip_rot_type = kickflip
		finger_front = {
			cw = {
				init = NTG_RArm_Grab_B_FngrFlp_Init_F_D
				idle = NTG_RArm_Grab_B_FngrFlp_Idle_F_D
				regrab = NTG_RArm_Grab_B_FngrFlp_Rtrn_F_D
			}
			ccw = {
				init = NTG_RArm_Grab_B_FgrFlpCCW_Init_F_D
				idle = NTG_RArm_Grab_B_FgrFlpCCW_Idle_F_D
				regrab = NTG_RArm_Grab_B_FgrFlpCCW_Rtrn_F_D
			}
			branch_offset = 0.0
		}
		finger_back = {
			cw = {
				init = NTG_RArm_Grab_B_FngrFlp_Init_B_D
				idle = NTG_RArm_Grab_B_FngrFlp_Idle_B_D
				regrab = NTG_RArm_Grab_B_FngrFlp_Rtrn_B_D
			}
			ccw = {
				init = NTG_RArm_Grab_B_FgrFlpCCW_Init_B_D
				idle = NTG_RArm_Grab_B_FgrFlpCCW_Idle_B_D
				regrab = NTG_RArm_Grab_B_FgrFlpCCW_Rtrn_B_D
			}
			branch_offset = 0.0
		}
		finger_left = {
			cw = {
				init = NTG_RArm_Grab_B_FngrFlp_Init_L_D
				idle = NTG_RArm_Grab_B_FngrFlp_Idle_L_D
				regrab = NTG_RArm_Grab_B_FngrFlp_Rtrn_L_D
			}
			ccw = {
				init = NTG_RArm_Grab_B_FgrFlpCCW_Init_L_D
				idle = NTG_RArm_Grab_B_FgrFlpCCW_Idle_L_D
				regrab = NTG_RArm_Grab_B_FgrFlpCCW_Rtrn_L_D
			}
			branch_offset = 0.0
		}
		finger_right = {
			cw = {
				init = NTG_RArm_Grab_B_FngrFlp_Init_R_D
				idle = NTG_RArm_Grab_B_FngrFlp_Idle_R_D
				regrab = NTG_RArm_Grab_B_FngrFlp_Rtrn_R_D
			}
			ccw = {
				init = NTG_RArm_Grab_B_FgrFlpCCW_Init_R_D
				idle = NTG_RArm_Grab_B_FgrFlpCCW_Idle_R_D
				regrab = NTG_RArm_Grab_B_FgrFlpCCW_Rtrn_R_D
			}
			branch_offset = 0.0
		}
		finger_center = {
			cw = {
				init = NTG_RArm_Grab_B_FngrFlp_Init_D
				idle = NTG_RArm_Grab_B_FngrFlp_Idle_D
				regrab = NTG_RArm_Grab_B_FngrFlp_Rtrn_D
			}
			ccw = {
				init = NTG_RArm_Grab_B_FgrFlpCCW_Init_D
				idle = NTG_RArm_Grab_B_FgrFlpCCW_Idle_D
				regrab = NTG_RArm_Grab_B_FgrFlpCCW_Rtrn_D
			}
			branch_offset = 0.0
		}
		tweak_rings = [
			NTG_RArm_Grab_B_TweekX_D
			NTG_RArm_Grab_B_TweekY_D
			NTG_RArm_Grab_B_TweekZ_D
		]
	}
	left = {
		finger_flip_play_speed = 4.0
		grab_from_spin = 0
		trucks_up_rot_start = $ntg_default_trucks_up_rot_start
		trucks_up_rot_time = $ntg_default_trucks_up_rot_time
		trucks_up_rot_dir = ccw
		Grab = NTG_RArm_Grab_L_Apx_D
		grab_spinning = NTG_RArm_Grab_L_FromNTT_Apx_D
		grab_trucks_up = NTG_RArm_Grab_L_Trksup_Apx_D
		grab_release = NTG_RArm_Grab_L_Ungrab_Apx_D
		grab_base = NTG_RArm_Grab_L
		shake_front = Ska8_zacs_empty_anim_D
		shake_back = Ska8_zacs_empty_anim_D
		shake_left = Ska8_zacs_empty_anim_D
		shake_right = Ska8_zacs_empty_anim_D
		shake_center = Ska8_zacs_empty_anim_D
		mini_tweak_front = [
			NTG_RArm_Grab_L_Arm_F_D
		]
		mini_tweak_back = [
			NTG_RArm_Grab_L_Arm_B_D
		]
		mini_tweak_left = [
			NTG_RArm_Grab_L_Arm_L_D
		]
		mini_tweak_right = [
			NTG_RArm_Grab_L_Arm_R_D
		]
		mini_tweak_center = [
			NTG_RArm_Grab_L_Arm_D
		]
		idle_front = NTG_RArm_Grab_L_Idle_F_D
		idle_back = NTG_RArm_Grab_L_Idle_B_D
		idle_left = NTG_RArm_Grab_L_Idle_L_D
		idle_right = NTG_RArm_Grab_L_Idle_R_D
		idle_center = NTG_RArm_Grab_L_Idle_D
		finger_flip_rot_type = shoveit
		finger_front = {
			cw = {
				init = NTG_RArm_Grab_L_FngrFlp_Init_F_D
				idle = NTG_RArm_Grab_L_FngrFlp_Idle_F_D
				regrab = NTG_RArm_Grab_L_FngrFlp_Rtrn_F_D
			}
			ccw = {
				init = NTG_RArm_Grab_L_FgrFlpCCW_Init_F_D
				idle = NTG_RArm_Grab_L_FgrFlpCCW_Idle_F_D
				regrab = NTG_RArm_Grab_L_FgrFlpCCW_Rtrn_F_D
			}
			branch_offset = 0.0
		}
		finger_back = {
			cw = {
				init = NTG_RArm_Grab_L_FngrFlp_Init_B_D
				idle = NTG_RArm_Grab_L_FngrFlp_Idle_B_D
				regrab = NTG_RArm_Grab_L_FngrFlp_Rtrn_B_D
			}
			ccw = {
				init = NTG_RArm_Grab_L_FgrFlpCCW_Init_B_D
				idle = NTG_RArm_Grab_L_FgrFlpCCW_Idle_B_D
				regrab = NTG_RArm_Grab_L_FgrFlpCCW_Rtrn_B_D
			}
			branch_offset = 0.0
		}
		finger_left = {
			cw = {
				init = NTG_RArm_Grab_L_FngrFlp_Init_L_D
				idle = NTG_RArm_Grab_L_FngrFlp_Idle_L_D
				regrab = NTG_RArm_Grab_L_FngrFlp_Rtrn_L_D
			}
			ccw = {
				init = NTG_RArm_Grab_L_FgrFlpCCW_Init_L_D
				idle = NTG_RArm_Grab_L_FgrFlpCCW_Idle_L_D
				regrab = NTG_RArm_Grab_L_FgrFlpCCW_Rtrn_L_D
			}
			branch_offset = 0.0
		}
		finger_right = {
			cw = {
				init = NTG_RArm_Grab_L_FngrFlp_Init_R_D
				idle = NTG_RArm_Grab_L_FngrFlp_Idle_R_D
				regrab = NTG_RArm_Grab_L_FngrFlp_Rtrn_R_D
			}
			ccw = {
				init = NTG_RArm_Grab_L_FgrFlpCCW_Init_R_D
				idle = NTG_RArm_Grab_L_FgrFlpCCW_Idle_R_D
				regrab = NTG_RArm_Grab_L_FgrFlpCCW_Rtrn_R_D
			}
			branch_offset = 0.0
		}
		finger_center = {
			cw = {
				init = NTG_RArm_Grab_L_FngrFlp_Init_D
				idle = NTG_RArm_Grab_L_FngrFlp_Idle_D
				regrab = NTG_RArm_Grab_L_FngrFlp_Rtrn_D
			}
			ccw = {
				init = NTG_RArm_Grab_L_FgrFlpCCW_Init_D
				idle = NTG_RArm_Grab_L_FgrFlpCCW_Idle_D
				regrab = NTG_RArm_Grab_L_FgrFlpCCW_Rtrn_D
			}
			branch_offset = 0.0
		}
		tweak_rings = [
			NTG_RArm_Grab_L_TweekX_D
			NTG_RArm_Grab_L_TweekY_D
			NTG_RArm_Grab_L_TweekZ_D
		]
	}
	right = {
		finger_flip_play_speed = 4.0
		grab_from_spin = 1
		trucks_up_rot_start = $ntg_default_trucks_up_rot_start
		trucks_up_rot_time = $ntg_default_trucks_up_rot_time
		trucks_up_rot_dir = $ntg_default_trucks_up_rot_dir
		Grab = NTG_RArm_Grab_R_Apx_D
		grab_spinning = NTG_RArm_Grab_R_FromNTT_Apx_D
		grab_trucks_up = NTG_RArm_Grab_R_Trksup_Apx_D
		grab_release = NTG_RArm_Grab_R_Ungrab_Apx_D
		grab_base = NTG_RArm_Grab_R
		shake_front = NTG_RArm_Grab_R_Shake_F_D
		shake_back = NTG_RArm_Grab_R_Shake_B_D
		shake_left = NTG_RArm_Grab_R_Shake_L_D
		shake_right = NTG_RArm_Grab_R_Shake_R_D
		shake_center = NTG_RArm_Grab_R_Shake_D
		mini_tweak_front = [
			NTG_RArm_Grab_R_Arm_F_D
		]
		mini_tweak_back = [
			NTG_RArm_Grab_R_Arm_B_D
		]
		mini_tweak_left = [
			NTG_RArm_Grab_R_Arm_L_D
		]
		mini_tweak_right = [
			NTG_RArm_Grab_R_Arm_R_D
		]
		mini_tweak_center = [
			NTG_RArm_Grab_R_Arm_D
		]
		idle_front = NTG_RArm_Grab_R_Idle_F_D
		idle_back = NTG_RArm_Grab_R_Idle_B_D
		idle_left = NTG_RArm_Grab_R_Idle_L_D
		idle_right = NTG_RArm_Grab_R_Idle_R_D
		idle_center = NTG_RArm_Grab_R_Idle_D
		finger_flip_rot_type = shoveit
		finger_front = {
			cw = {
				init = NTG_RArm_Grab_R_FngrFlp_Init_F_D
				idle = NTG_RArm_Grab_R_FngrFlp_Idle_F_D
				regrab = NTG_RArm_Grab_R_FngrFlp_Rtrn_F_D
			}
			ccw = {
				init = NTG_RArm_Grab_R_FgrFlpCCW_Init_F_D
				idle = NTG_RArm_Grab_R_FgrFlpCCW_Idle_F_D
				regrab = NTG_RArm_Grab_R_FgrFlpCCW_Rtrn_F_D
			}
			branch_offset = 0.0
		}
		finger_back = {
			cw = {
				init = NTG_RArm_Grab_R_FngrFlp_Init_B_D
				idle = NTG_RArm_Grab_R_FngrFlp_Idle_B_D
				regrab = NTG_RArm_Grab_R_FngrFlp_Rtrn_B_D
			}
			ccw = {
				init = NTG_RArm_Grab_R_FgrFlpCCW_Init_B_D
				idle = NTG_RArm_Grab_R_FgrFlpCCW_Idle_B_D
				regrab = NTG_RArm_Grab_R_FgrFlpCCW_Rtrn_B_D
			}
			branch_offset = 0.0
		}
		finger_left = {
			cw = {
				init = NTG_RArm_Grab_R_FngrFlp_Init_L_D
				idle = NTG_RArm_Grab_R_FngrFlp_Idle_L_D
				regrab = NTG_RArm_Grab_R_FngrFlp_Rtrn_L_D
			}
			ccw = {
				init = NTG_RArm_Grab_R_FgrFlpCCW_Init_L_D
				idle = NTG_RArm_Grab_R_FgrFlpCCW_Idle_L_D
				regrab = NTG_RArm_Grab_R_FgrFlpCCW_Rtrn_L_D
			}
			branch_offset = 0.0
		}
		finger_right = {
			cw = {
				init = NTG_RArm_Grab_R_FngrFlp_Init_R_D
				idle = NTG_RArm_Grab_R_FngrFlp_Idle_R_D
				regrab = NTG_RArm_Grab_R_FngrFlp_Rtrn_R_D
			}
			ccw = {
				init = NTG_RArm_Grab_R_FgrFlpCCW_Init_R_D
				idle = NTG_RArm_Grab_R_FgrFlpCCW_Idle_R_D
				regrab = NTG_RArm_Grab_R_FgrFlpCCW_Rtrn_R_D
			}
			branch_offset = 0.0
		}
		finger_center = {
			cw = {
				init = NTG_RArm_Grab_R_FngrFlp_Init_D
				idle = NTG_RArm_Grab_R_FngrFlp_Idle_D
				regrab = NTG_RArm_Grab_R_FngrFlp_Rtrn_D
			}
			ccw = {
				init = NTG_RArm_Grab_R_FgrFlpCCW_Init_D
				idle = NTG_RArm_Grab_R_FgrFlpCCW_Idle_D
				regrab = NTG_RArm_Grab_R_FgrFlpCCW_Rtrn_D
			}
			branch_offset = 0.0
		}
		tweak_rings = [
			NTG_RArm_Grab_R_TweekX_D
			NTG_RArm_Grab_R_TweekY_D
			NTG_RArm_Grab_R_TweekZ_D
		]
	}
}
