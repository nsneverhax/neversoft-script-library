BAILSCRIPT = Kneeslide

script Bail_Spin_FWD_Regular 
	GeneralBail \{Anim1 = SK8_Bail_Spin_Fwd_F
		sound = bail_knee1
		BloodFrame = 13
		PureAnimPercent = 90
		bail_board_vel = (0.0, 0.0, -4.0)}
endscript

script Bail_Spin_BCK_Regular 
	GeneralBail \{Anim1 = SK8_Bail_Spin_Bck_F
		friction = 12
		sound = bail_knee1
		BloodFrame = 5
		PureAnimPercent = 50
		bail_board_vel = (0.0, 0.0, -4.0)}
endscript

script Bail_Spin_CCW_Regular 
	GeneralBail \{Anim1 = SK8_Bail_Spin_CW_F
		friction = 0.5
		HeavyFriction = 1.0
		sound = bail_knee1
		BloodFrame = 18
		PureAnimPercent = 50
		bail_board_rot_vel = (0.0, 0.0, 0.0)
		bail_board_vel = (7.0, 4.0, 0.0)}
endscript

script Bail_Spin_CW_Regular 
	GeneralBail \{Anim1 = SK8_Bail_Spin_CCW_F
		sound = bail_knee1
		BloodFrame = 13
		PureAnimPercent = 38
		bail_board_vel = (10.0, 4.0, 0.0)}
endscript

script Runout_FWD 
	GeneralBail \{Anim1 = SK8_Bail_Spin_Fwd_Runout_F
		friction = 11
		BoardAlwaysOn
		sound = Bailrunoutflip
		runoutbail}
endscript

script Runout_BCK 
	GeneralBail \{Anim1 = SK8_Bail_Spin_Bck_Runout_F
		friction = 13
		BoardAlwaysOn
		sound = Bailrunoutflip
		runoutbail}
endscript

script Runout_CW 
	GeneralBail \{Anim1 = SK8_Bail_Spin_CW_Runout_F
		friction = 17
		BoardAlwaysOn
		sound = Bailrunoutflip
		runoutbail}
endscript

script Runout_CCW 
	GeneralBail \{Anim1 = SK8_Bail_Spin_CCW_Runout_F
		friction = 13
		BoardAlwaysOn
		sound = bail_knee1
		BloodFrame = 6
		runoutbail}
endscript

script Bail_Ramp_Fwd 
	printf \{channel = bail
		'Bail_Ramp_FWD'}
	GeneralBail \{Anim1 = SK8_Bail_Spin_Fwd_Runout_F
		friction = 0.3
		HeavyFriction = 0.8
		sound = bail_knee1
		BloodFrame = 18
		PureAnimPercent = 5}
endscript

script Bail_Ramp_Bck 
	printf \{channel = bail
		'Bail_Ramp_BCK'}
	GeneralBail \{Anim1 = SK8_Bail_Spin_CCW_Runout_F
		friction = 0.3
		HeavyFriction = 0.8
		sound = bail_knee1
		BloodFrame = 2
		PureAnimPercent = 5}
endscript

script Bail_Ramp_CW 
	printf \{channel = bail
		'Bail_Ramp_CW'}
	GeneralBail \{Anim1 = SK8_Bail_Spin_CW_F
		friction = 0.3
		HeavyFriction = 0.8
		sound = bail_knee1
		BloodFrame = 2
		PureAnimPercent = 5}
endscript

script Bail_Ramp_CCW 
	printf \{channel = bail
		'Bail_Ramp_CCW'}
	GeneralBail \{Anim1 = SK8_Bail_Spin_CCW_F
		friction = 0.3
		HeavyFriction = 0.8
		sound = bail_knee1
		BloodFrame = 2
		PureAnimPercent = 5}
endscript

script Bail_Falling_RT 
	GeneralBail \{Anim1 = SK8_Bail_Rail_5050_L_F
		blendduration = 0.2
		friction = 0
		BloodFrame = 50
		sound = Bail04
		grindbail
		PureAnimPercent = 20
		bail_board_vel = (-5.0, 4.0, 0.0)
		bail_board_rot_vel = (10.0, 0.0, 0.0)}
endscript

script Bail_Falling_LT 
	GeneralBail \{Anim1 = SK8_Bail_Rail_5050_R_F
		blendduration = 0.35000002
		friction = 0
		BloodFrame = 7
		sound = Bail04
		grindbail
		PureAnimPercent = 30
		bail_board_vel = (8.0, 4.0, 0.0)
		bail_board_rot_vel = (10.0, 0.0, 0.0)}
endscript

script Bail_Nutter_FWD 
	GeneralBail \{Anim1 = SK8_Bail_Rail_BSBS_L_F
		friction = 0
		sound = Bail04
		Nutter
		grindbail
		PureAnimPercent = 90}
endscript

script Bail_Nutter_BCK 
	GeneralBail \{Anim1 = Bail_Nutter_BCK
		friction = 0
		sound = Bail04
		Nutter
		grindbail
		PureAnimPercent = 90}
endscript

script ManualBailSlow 
	GeneralBail \{Anim1 = SK8_Bail_Manual_F
		friction = 0
		BloodFrame = 15
		sound = Bail04
		PureAnimPercent = 55
		bail_board_vel = (0.0, 0.0, 4.0)
		bail_board_rot_vel = (0.0, 0.0, 0.0)}
endscript

script ManualBailFast 
	GeneralBail \{Anim1 = SK8_Bail_Manual_F
		friction = 0
		BloodFrame = 15
		sound = Bail04
		PureAnimPercent = 55
		bail_board_vel = (0.0, 0.0, 4.0)
		bail_board_rot_vel = (0.0, 0.0, 0.0)}
endscript

script ManualBailFlatlandForward 
	GeneralBail \{Anim1 = SK8_Bail_NoseManual_F
		friction = 0
		BloodFrame = 13
		sound = BoardBail0
		PureAnimPercent = 95
		flatland}
endscript

script ManualBailFlatlandBack 
	GeneralBail \{Anim1 = SK8_Bail_Manual_F
		friction = 0
		BloodFrame = 15
		sound = Bail04
		PureAnimPercent = 95
		flatland}
endscript

script NoseManualBailSlow 
	GeneralBail \{Anim1 = SK8_Bail_NoseManual_F
		friction = 0
		BloodFrame = 13
		sound = BoardBail01
		PureAnimPercent = 95}
endscript

script NoseManualBailFast 
	GeneralBail \{Anim1 = SK8_Bail_NoseManual_F
		friction = 0
		BloodFrame = 15
		sound = BoardBail01
		PureAnimPercent = 95}
endscript

script Bail_Forced 
	ntt_fail_safe_cleanup
	GeneralBail {
		Anim1 = human_default
		ForcedBail
		NoInit
		impact_impulse = <impact_impulse>
		impact_bone = <impact_bone>
		bail_board_vel = (0.0, 0.0, 0.0)
		bail_board_rot_vel = (0.0, 0.0, 0.0)
	}
endscript

script Bail_NoInit 
	printf \{'Bail_NoInit'}
	GeneralBail {
		Anim1 = human_default
		NoInit
		pitchbail = <pitchbail>
	}
endscript

script Bail_Runout_To_Ragdoll 
	printf 'Bail_Runout_To_Ragdoll'
	if NOT gotparam RunoutToRagdollGroundPush
		RunoutToRagdollGroundPush = 0.4
	endif
	if NOT gotparam RunoutToRagdollSpeed
		RunoutToRagdollSpeed = 5.0
	endif
	printf 'pushing away from ground... %f %g' f = <RunoutToRagdollGroundPush> g = <RunoutToRagdollSpeed>
	obj_getposition
	obj_getorientationvectors
	delta = (<RunoutToRagdollGroundPush> * <up_vector>)
	obj_setposition position = (<pos> + <delta>)
	ragdoll_movebones delta = <delta>
	obj_setvelocity vel = (<RunoutToRagdollSpeed> * <front_vector>)
	GeneralBail {
		Anim1 = human_default
		NoInit
		pitchbail = <pitchbail>
		BoardAlwaysOn
		recursive_general_bail_call
	}
endscript
