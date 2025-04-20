ntm_force_land_strength = 1.0
ntm_land_play_speed = 3.0
ntm_idle_play_speed = 4.0
NTM_Air_Data = {
	Manual = {
		takeoff = SK8_NTM_Manu_Range_TO
		apex = SK8_NTM_Manu_Range_APX
		land = SK8_NTM_Manu_Range_LndIn
		catch_takeoff_f = Ska8_zacs_empty_anim_D
		catch_takeoff_n = Ska8_zacs_empty_anim_D
		catch_takeoff_b = Ska8_zacs_empty_anim_D
		catch_apex_f = Ska8_zacs_empty_anim_D
		catch_apex_n = Ska8_zacs_empty_anim_D
		catch_apex_b = Ska8_zacs_empty_anim_D
		catch_land_f = Ska8_zacs_empty_anim_D
		catch_land_n = Ska8_zacs_empty_anim_D
		catch_land_b = Ska8_zacs_empty_anim_D
		trans_takeoff_f = Ska8_zacs_empty_anim_D
		trans_takeoff_n = Ska8_zacs_empty_anim_D
		trans_takeoff_b = Ska8_zacs_empty_anim_D
		trans_apex_f = Ska8_zacs_empty_anim_D
		trans_apex_n = Ska8_zacs_empty_anim_D
		trans_apex_b = Ska8_zacs_empty_anim_D
		trans_land_f = Ska8_zacs_empty_anim_D
		trans_land_n = Ska8_zacs_empty_anim_D
		trans_land_b = Ska8_zacs_empty_anim_D
	}
	casper = {
		takeoff = SK8_NTM_casp_Range_TO
		apex = SK8_NTM_casp_Range_APX
		land = SK8_NTM_casp_Range_LndIn
		catch_takeoff_f = SK8_NTM_casp_Catch_APX_D
		catch_takeoff_n = SK8_NTM_casp_Catch_APX_D
		catch_takeoff_b = SK8_NTM_casp_Catch_APX_D
		catch_apex_f = SK8_NTM_casp_Catch_APX_D
		catch_apex_n = SK8_NTM_casp_Catch_APX_D
		catch_apex_b = SK8_NTM_casp_Catch_APX_D
		catch_land_f = SK8_NTM_casp_Catch_LndIn_D
		catch_land_n = SK8_NTM_casp_Catch_LndIn_D
		catch_land_b = SK8_NTM_casp_Catch_LndIn_D
		trans_takeoff_f = SK8_NTM_casp_Frm_Anti_N_TO_D
		trans_takeoff_n = SK8_NTM_casp_Frm_Anti_N_TO_D
		trans_takeoff_b = SK8_NTM_casp_Frm_Anti_B_TO_D
		trans_apex_f = SK8_NTM_casp_Frm_Anti_N_APX_D
		trans_apex_n = SK8_NTM_casp_Frm_Anti_N_APX_D
		trans_apex_b = SK8_NTM_casp_Frm_Anti_B_APX_D
		trans_land_f = SK8_NTM_casp_Frm_Anti_N_LndIn_D
		trans_land_n = SK8_NTM_casp_Frm_Anti_N_LndIn_D
		trans_land_b = SK8_NTM_casp_Frm_Anti_B_LndIn_D
	}
	anticasper = {
		takeoff = SK8_NTM_Anti_Range_TO
		apex = SK8_NTM_Anti_Range_APX
		land = SK8_NTM_Anti_Range_LndIn
		catch_takeoff_f = SK8_NTM_Anti_Catch_APX_D
		catch_takeoff_n = SK8_NTM_Anti_Catch_APX_D
		catch_takeoff_b = SK8_NTM_Anti_Catch_APX_D
		catch_apex_f = SK8_NTM_Anti_Catch_APX_D
		catch_apex_n = SK8_NTM_Anti_Catch_APX_D
		catch_apex_b = SK8_NTM_Anti_Catch_APX_D
		catch_land_f = SK8_NTM_Anti_Catch_LndIn_D
		catch_land_n = SK8_NTM_Anti_Catch_LndIn_D
		catch_land_b = SK8_NTM_Anti_Catch_LndIn_D
		trans_takeoff_f = SK8_NTM_Anti_Frm_Casp_N_TO_D
		trans_takeoff_n = SK8_NTM_Anti_Frm_Casp_N_TO_D
		trans_takeoff_b = SK8_NTM_Anti_Frm_Casp_F_TO_D
		trans_apex_f = SK8_NTM_Anti_Frm_Casp_N_APX_D
		trans_apex_n = SK8_NTM_Anti_Frm_Casp_N_APX_D
		trans_apex_b = SK8_NTM_Anti_Frm_Casp_F_APX_D
		trans_land_f = SK8_NTM_Anti_Frm_Casp_N_LndIn_D
		trans_land_n = SK8_NTM_Anti_Frm_Casp_N_LndIn_D
		trans_land_b = SK8_NTM_Anti_Frm_Casp_F_LndIn_D
	}
}
NTM_Manual_Data = {
	struct = manual_data
	string = 'manual'
	base_anim = Sk8_Manu_Manual_Base_F
	land_anim = SK8_NTM_Manu_LndIn
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_Manu_Manual_OffB_D
	forward_anim = Sk8_Manu_Manual_OffF_D
	range_anim = sk8_ntm_manu_range_ground_D
	back_slopef = Sk8_Manu_Manual_OffB_SlpF_D
	back_slopeb = Sk8_Manu_Manual_OffB_SlpB_D
	back_slopel = Sk8_Manu_Manual_OffB_SlpL_D
	back_sloper = Sk8_Manu_Manual_OffB_SlpR_D
	forward_slopef = Sk8_Manu_Manual_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_Manual_OffF_SlpB_D
	forward_slopel = Sk8_Manu_Manual_OffF_SlpL_D
	forward_sloper = Sk8_Manu_Manual_OffF_SlpR_D
	slopef = Sk8_Manu_Manual_SlpF_D
	slopeb = Sk8_Manu_Manual_SlpB_D
	slopel = Sk8_Manu_Manual_SlpL_D
	sloper = Sk8_Manu_Manual_SlpR_D
	fast_anim = Sk8_Manu_Manual_Fast_D
	slow_anim = Sk8_Manu_Manual_Slow_D
	turn_left = Sk8_Manu_Manual_Turn_L_D
	turn_right = Sk8_Manu_Manual_Turn_R_D
	$shared_manual_data
	land_blend_time = 0.1
	transitions = {
		AntiCasper_Data = 1
		Casper_Data = 6
		CrossfootPogo_Data = 1
		OneFootManual_Data = 7
		OneFootNosemanual_Data = 1
		Pogo_Data = 1
		Rail_Data = 1
		Spacewalk_Data = 1
		SwitchFootPogo_Data = 3
		Truckstand_Data = 1
	}
}
NTM_NoseManual_Data = {
	struct = nosemanual_data
	string = 'nosemanual'
	base_anim = Sk8_Manu_NSManu_Base_F
	land_anim = Sk8_Manu_NSManu_LndO_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_Manu_NSManu_OffB_D
	forward_anim = Sk8_Manu_NSManu_OffF_D
	range_anim = sk8_ntm_nsmanu_range_ground_D
	back_slopef = Sk8_Manu_NSManu_OffB_SlpF_D
	back_slopeb = Sk8_Manu_NSManu_OffB_SlpB_D
	back_slopel = Sk8_Manu_NSManu_OffB_SlpL_D
	back_sloper = Sk8_Manu_NSManu_OffB_SlpR_D
	forward_slopef = Sk8_Manu_NSManu_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_NSManu_OffF_SlpB_D
	forward_slopel = Sk8_Manu_NSManu_OffF_SlpL_D
	forward_sloper = Sk8_Manu_NSManu_OffF_SlpR_D
	slopef = Sk8_Manu_NSManu_SlpF_D
	slopeb = Sk8_Manu_NSManu_SlpB_D
	slopel = Sk8_Manu_NSManu_SlpL_D
	sloper = Sk8_Manu_NSManu_SlpR_D
	fast_anim = Sk8_Manu_NSManu_Fast_D
	slow_anim = Sk8_Manu_NSManu_Slow_D
	turn_left = Sk8_Manu_NSManu_Turn_L_D
	turn_right = Sk8_Manu_NSManu_Turn_R_D
	$shared_manual_data
	land_blend_time = 0.1
	transitions = {
		AntiCasper_Data = 1
		Casper_Data = 1
		CrossfootPogo_Data = 1
		OneFootManual_Data = 1
		OneFootNosemanual_Data = 1
		Pogo_Data = 1
		Rail_Data = 1
		Spacewalk_Data = 1
		SwitchFootPogo_Data = 1
		Truckstand_Data = 9
	}
}
NTM_Casper_Data = {
	struct = Casper_Data
	string = 'Casper'
	friction = 0.04
	base_anim = Sk8_NTM_casp_Base_F
	land_anim = SK8_NTM_Casp_LndIn
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_NTM_Casper_OffB_D
	forward_anim = Sk8_NTM_Casper_OffF_D
	range_anim = Sk8_NTM_casp_Range_Ground_D
	back_slopef = Ska8_zacs_empty_anim_D
	back_slopeb = Ska8_zacs_empty_anim_D
	back_slopel = Ska8_zacs_empty_anim_D
	back_sloper = Ska8_zacs_empty_anim_D
	forward_slopef = Ska8_zacs_empty_anim_D
	forward_slopeb = Ska8_zacs_empty_anim_D
	forward_slopel = Ska8_zacs_empty_anim_D
	forward_sloper = Ska8_zacs_empty_anim_D
	slopef = Ska8_zacs_empty_anim_D
	slopeb = Ska8_zacs_empty_anim_D
	slopel = Ska8_zacs_empty_anim_D
	sloper = Ska8_zacs_empty_anim_D
	fast_anim = Sk8_NTM_casper_Fast_D
	slow_anim = Sk8_NTM_casper_Slow_D
	turn_left = Ska8_zacs_empty_anim_D
	turn_right = Ska8_zacs_empty_anim_D
	fliptrick = Sk8_Manu_pogo_to_pogo_D
	$shared_manual_data
	land_blend_time = 0.1
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		CrossfootPogo_Data = 1
		OneFootManual_Data = 1
		OneFootNosemanual_Data = 1
		Pogo_Data = 1
		Rail_Data = 1
		Spacewalk_Data = 1
		SwitchFootPogo_Data = 1
		Truckstand_Data = 1
	}
}
NTM_AntiCasper_Data = {
	struct = AntiCasper_Data
	string = 'AntiCasper'
	friction = 0.042999998
	base_anim = Sk8_NTM_anti_Base_F
	land_anim = SK8_NTM_Anti_LndIn
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_NTM_anticas_OffB_D
	forward_anim = Sk8_NTM_anticas_OffF_D
	range_anim = Sk8_NTM_anti_Range_Ground_D
	back_slopef = Ska8_zacs_empty_anim_D
	back_slopeb = Ska8_zacs_empty_anim_D
	back_slopel = Ska8_zacs_empty_anim_D
	back_sloper = Ska8_zacs_empty_anim_D
	forward_slopef = Ska8_zacs_empty_anim_D
	forward_slopeb = Ska8_zacs_empty_anim_D
	forward_slopel = Ska8_zacs_empty_anim_D
	forward_sloper = Ska8_zacs_empty_anim_D
	slopef = Ska8_zacs_empty_anim_D
	slopeb = Ska8_zacs_empty_anim_D
	slopel = Ska8_zacs_empty_anim_D
	sloper = Ska8_zacs_empty_anim_D
	fast_anim = Sk8_NTM_anticas_Fast_D
	slow_anim = Sk8_NTM_anticas_Slow_D
	turn_left = Ska8_zacs_empty_anim_D
	turn_right = Ska8_zacs_empty_anim_D
	fliptrick = Sk8_Manu_pogo_to_pogo_D
	$shared_manual_data
	land_blend_time = 0.1
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		Casper_Data = 1
		CrossfootPogo_Data = 1
		OneFootManual_Data = 1
		OneFootNosemanual_Data = 1
		Pogo_Data = 1
		Rail_Data = 1
		Spacewalk_Data = 1
		SwitchFootPogo_Data = 8
		Truckstand_Data = 1
	}
}
NTM_Ollie_data = {
	struct = Ollie_data
	base_anim = Sk8_Ollie_Ollie_Base_F
	takeoff_anim = Sk8_Ollie_TakeOff_TO_D
	land_anim = Sk8_Ollie_LandNoSpd_LndIn_D
	takeoff_LR_anim = Ska8_zacs_empty_anim_D
	takeoff_arm_anim = Ska8_zacs_empty_anim_D
	takeoff_feet_anim = Sk8_NTT_Ollie_Manual_Foot_TO_D
	takeoff_ground_anim = Ska8_zacs_empty_anim_D
	apex_arm_anim = Sk8_Ollie_Arm_Apx_D
	apex_foot_anim = Sk8_Ollie_Foot_Apx_D
	apex_foot90_anim = Sk8_Ollie_Foot90_Apx_D
	apex_foot180_anim = Sk8_Ollie_Foot180_Apx_D
	apex_foot270_anim = Sk8_Ollie_Foot270_Apx_D
	apex_spinlook_anim = Ska8_zacs_empty_anim_D
	apex_spinright_anim = Sk8_Ollie_SpinR_Spn_D
	apex_spinleft_anim = Sk8_Ollie_SpinL_Spn_D
	takeoff_spinlook_anim = Ska8_zacs_empty_anim_D
	takeoff_spinright_anim = Sk8_Ollie_SpinR_TO_Spn_D
	takeoff_spinleft_anim = Sk8_Ollie_SpinL_TO_Spn_D
	land_spinlook_anim = Ska8_zacs_empty_anim_D
	land_spinright_anim = Sk8_Ollie_SpinR_Land_Spn_D
	land_spinleft_anim = Sk8_Ollie_SpinL_Land_Spn_D
	takeoff_blend_curve = [
		1.0
		1.0
		1.0
		0.9926819
		0.96517897
		0.910056
		0.826763
		0.72596496
		0.61715305
		0.50532
		0.395458
		0.292561
		0.19940501
		0.12321401
		0.0690006
		0.0340209
		0.013377
		0.0029908603
		0.0
	]
	takeoff_blend_time = 0.6
	land_blend_curve = [
		1.0
		0.979592
		0.91836697
		0.816327
		0.67346907
		0.489796
		0.26530597
		0.05
		0.0
	]
	land_blend_time = 0.3
	land_blend_max = 0.7
	land_blend_threshold = 3
	land_hold_time = 0.0
	Land_speed_threshold = 2.5
	Spin_in_duration = 0.3
	Spin_out_duration = 0.3
	blendduration = 0.2
}
NTM_Nollie_data = {
	struct = Nollie_data
	base_anim = Sk8_Ollie_Ollie_Base_F
	takeoff_anim = Sk8_Ollie_TakeOff_TO_D
	land_anim = Sk8_Ollie_LandNoSpd_LndIn_D
	takeoff_LR_anim = Ska8_zacs_empty_anim_D
	takeoff_arm_anim = Ska8_zacs_empty_anim_D
	takeoff_feet_anim = Sk8_NTT_Ollie_NoseMan_Foot_TO_D
	takeoff_ground_anim = Ska8_zacs_empty_anim_D
	apex_arm_anim = Sk8_Ollie_Arm_Apx_D
	apex_foot_anim = Sk8_Ollie_Foot_Apx_D
	apex_foot90_anim = Sk8_Ollie_Foot90_Apx_D
	apex_foot180_anim = Sk8_Ollie_Foot180_Apx_D
	apex_foot270_anim = Sk8_Ollie_Foot270_Apx_D
	apex_spinlook_anim = Ska8_zacs_empty_anim_D
	apex_spinright_anim = Sk8_Ollie_SpinR_Spn_D
	apex_spinleft_anim = Sk8_Ollie_SpinL_Spn_D
	takeoff_spinlook_anim = Ska8_zacs_empty_anim_D
	takeoff_spinright_anim = Sk8_Ollie_SpinR_TO_Spn_D
	takeoff_spinleft_anim = Sk8_Ollie_SpinL_TO_Spn_D
	land_spinlook_anim = Ska8_zacs_empty_anim_D
	land_spinright_anim = Sk8_Ollie_SpinR_Land_Spn_D
	land_spinleft_anim = Sk8_Ollie_SpinL_Land_Spn_D
	takeoff_blend_curve = [
		1.0
		1.0
		1.0
		0.9926819
		0.96517897
		0.910056
		0.826763
		0.72596496
		0.61715305
		0.50532
		0.395458
		0.292561
		0.19940501
		0.12321401
		0.0690006
		0.0340209
		0.013377
		0.0029908603
		0.0
	]
	takeoff_blend_time = 0.6
	land_blend_curve = [
		1.0
		0.979592
		0.91836697
		0.816327
		0.67346907
		0.489796
		0.26530597
		0.05
		0.0
	]
	land_blend_time = 0.3
	land_blend_max = 0.7
	land_blend_threshold = 3
	land_hold_time = 0.0
	Land_speed_threshold = 2.5
	Spin_in_duration = 0.3
	Spin_out_duration = 0.3
	blendduration = 0.35000002
}
NTM_Casper_Ollie_data = {
	struct = Ollie_data
	base_anim = Sk8_NTT_Casper_Base_Apex_F
	takeoff_anim = Sk8_NTT_Casper_Base_TO_F
	land_anim = Sk8_NTT_Casper_Base_Land_F
	takeoff_LR_anim = Ska8_zacs_empty_anim_D
	takeoff_arm_anim = Ska8_zacs_empty_anim_D
	takeoff_feet_anim = Sk8_NTT_Ollie_Casper_Foot_TO_D
	takeoff_ground_anim = Ska8_zacs_empty_anim_D
	apex_arm_anim = Sk8_Ollie_Arm_Apx_D
	apex_foot_anim = Sk8_Ollie_Foot_Apx_D
	apex_foot90_anim = Sk8_Ollie_Foot90_Apx_D
	apex_foot180_anim = Sk8_Ollie_Foot180_Apx_D
	apex_foot270_anim = Sk8_Ollie_Foot270_Apx_D
	apex_spinlook_anim = Ska8_zacs_empty_anim_D
	apex_spinright_anim = Sk8_Ollie_SpinR_Spn_D
	apex_spinleft_anim = Sk8_Ollie_SpinL_Spn_D
	takeoff_spinlook_anim = Ska8_zacs_empty_anim_D
	takeoff_spinright_anim = Sk8_Ollie_SpinR_TO_Spn_D
	takeoff_spinleft_anim = Sk8_Ollie_SpinL_TO_Spn_D
	land_spinlook_anim = Ska8_zacs_empty_anim_D
	land_spinright_anim = Sk8_Ollie_SpinR_Land_Spn_D
	land_spinleft_anim = Sk8_Ollie_SpinL_Land_Spn_D
	takeoff_blend_curve = [
		1.0
		1.0
		1.0
		0.9926819
		0.96517897
		0.910056
		0.826763
		0.72596496
		0.61715305
		0.50532
		0.395458
		0.292561
		0.19940501
		0.12321401
		0.0690006
		0.0340209
		0.013377
		0.0029908603
		0.0
	]
	takeoff_blend_time = 0.6
	land_blend_curve = [
		1.0
		0.979592
		0.91836697
		0.816327
		0.67346907
		0.489796
		0.26530597
		0.05
		0.0
	]
	land_blend_time = 0.3
	land_blend_max = 0.7
	land_blend_threshold = 3
	land_hold_time = 0.0
	Land_speed_threshold = 2.5
	Spin_in_duration = 0.3
	Spin_out_duration = 0.3
	blendduration = 0.0
}
NTM_Anticasper_Nollie_data = {
	struct = Nollie_data
	base_anim = Sk8_NTT_Casper_Base_Apex_F
	takeoff_anim = Sk8_NTT_Casper_Base_TO_F
	land_anim = Sk8_NTT_Casper_Base_Land_F
	takeoff_LR_anim = Ska8_zacs_empty_anim_D
	takeoff_arm_anim = Ska8_zacs_empty_anim_D
	takeoff_feet_anim = Sk8_NTT_Ollie_AntiCasper_Foot_TO_D
	takeoff_ground_anim = Ska8_zacs_empty_anim_D
	apex_arm_anim = Sk8_Ollie_Arm_Apx_D
	apex_foot_anim = Sk8_Ollie_Foot_Apx_D
	apex_foot90_anim = Sk8_Ollie_Foot90_Apx_D
	apex_foot180_anim = Sk8_Ollie_Foot180_Apx_D
	apex_foot270_anim = Sk8_Ollie_Foot270_Apx_D
	apex_spinlook_anim = Ska8_zacs_empty_anim_D
	apex_spinright_anim = Sk8_Ollie_SpinR_Spn_D
	apex_spinleft_anim = Sk8_Ollie_SpinL_Spn_D
	takeoff_spinlook_anim = Ska8_zacs_empty_anim_D
	takeoff_spinright_anim = Sk8_Ollie_SpinR_TO_Spn_D
	takeoff_spinleft_anim = Sk8_Ollie_SpinL_TO_Spn_D
	land_spinlook_anim = Ska8_zacs_empty_anim_D
	land_spinright_anim = Sk8_Ollie_SpinR_Land_Spn_D
	land_spinleft_anim = Sk8_Ollie_SpinL_Land_Spn_D
	takeoff_blend_curve = [
		1.0
		1.0
		1.0
		0.9926819
		0.96517897
		0.910056
		0.826763
		0.72596496
		0.61715305
		0.50532
		0.395458
		0.292561
		0.19940501
		0.12321401
		0.0690006
		0.0340209
		0.013377
		0.0029908603
		0.0
	]
	takeoff_blend_time = 0.6
	land_blend_curve = [
		1.0
		0.979592
		0.91836697
		0.816327
		0.67346907
		0.489796
		0.26530597
		0.05
		0.0
	]
	land_blend_time = 0.3
	land_blend_max = 0.7
	land_blend_threshold = 3
	land_hold_time = 0.0
	Land_speed_threshold = 2.5
	Spin_in_duration = 0.3
	Spin_out_duration = 0.3
	blendduration = 0.35000002
}
NTM_Ollie_ntt_TO_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_TO_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_TO_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_TO_Fwd_D
	base_anim_left_down = SK8_NTT_MoveLFoot_TO_Bck_D
	base_anim_right_left = SK8_NTT_MoveRFoot_TO_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_TO_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_TO_Fwd_D
	base_anim_right_down = SK8_NTT_MoveRFoot_TO_Bck_D
	neutral_foot_pos_left = Ska8_zacs_empty_anim_D
	neutral_foot_pos_right = Ska8_zacs_empty_anim_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_TO_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_TO_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_TO_Fwd_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_TO_Bck_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_TO_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_TO_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_TO_Fwd_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_TO_Bck_D
}
NTM_Ollie_ntt_TO_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_TO_L_D
	anim_left_right = SK8_NTT_FlickLFoot_TO_R_D
	anim_left_up = SK8_NTT_FlickLFoot_TO_Fwd_D
	anim_left_down = SK8_NTT_FlickLFoot_TO_Bck_D
	anim_right_left = SK8_NTT_FlickRFoot_TO_L_D
	anim_right_right = SK8_NTT_FlickRFoot_TO_R_D
	anim_right_up = SK8_NTT_FlickRFoot_TO_Fwd_D
	anim_right_down = SK8_NTT_FlickRFoot_TO_Bck_D
}
NTM_Ollie_ntt_TO_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_TO_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_TO_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_TO_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_TO_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_TO_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_TO_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_TO_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_TO_Bck_D
}
NTM_Nollie_ntt_TO_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_TO_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_TO_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_TO_Fwd_D
	base_anim_left_down = SK8_NTT_MoveLFoot_TO_Bck_D
	base_anim_right_left = SK8_NTT_MoveRFoot_TO_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_TO_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_TO_Fwd_D
	base_anim_right_down = SK8_NTT_MoveRFoot_TO_Bck_D
	neutral_foot_pos_left = Ska8_zacs_empty_anim_D
	neutral_foot_pos_right = Ska8_zacs_empty_anim_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_TO_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_TO_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_TO_Fwd_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_TO_Bck_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_TO_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_TO_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_TO_Fwd_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_TO_Bck_D
}
NTM_Nollie_ntt_TO_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_TO_L_D
	anim_left_right = SK8_NTT_FlickLFoot_TO_R_D
	anim_left_up = SK8_NTT_FlickLFoot_TO_Fwd_D
	anim_left_down = SK8_NTT_FlickLFoot_TO_Bck_D
	anim_right_left = SK8_NTT_FlickRFoot_TO_L_D
	anim_right_right = SK8_NTT_FlickRFoot_TO_R_D
	anim_right_up = SK8_NTT_FlickRFoot_TO_Fwd_D
	anim_right_down = SK8_NTT_FlickRFoot_TO_Bck_D
}
NTM_Nollie_ntt_TO_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_TO_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_TO_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_TO_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_TO_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_TO_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_TO_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_TO_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_TO_Bck_D
}
NTM_Casper_ntt_TO_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_Casper_TO_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_Casper_TO_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_Casper_TO_F_D
	base_anim_left_down = SK8_NTT_MoveLFoot_Casper_TO_B_D
	base_anim_right_left = SK8_NTT_MoveRFoot_Casper_TO_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_Casper_TO_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_Casper_TO_F_D
	base_anim_right_down = SK8_NTT_MoveRFoot_Casper_TO_B_D
	neutral_foot_pos_left = Ska8_zacs_empty_anim_D
	neutral_foot_pos_right = Ska8_zacs_empty_anim_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_Casper_TO_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_Casper_TO_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_Casper_TO_F_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_Casper_TO_B_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_Casper_TO_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_Casper_TO_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_Casper_TO_F_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_Casper_TO_B_D
}
NTM_Casper_ntt_TO_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_Casper_TO_L_D
	anim_left_right = SK8_NTT_FlickLFoot_Casper_TO_R_D
	anim_left_up = SK8_NTT_FlickLFoot_Casper_TO_F_D
	anim_left_down = SK8_NTT_FlickLFoot_Casper_TO_B_D
	anim_right_left = SK8_NTT_FlickRFoot_Casper_TO_L_D
	anim_right_right = SK8_NTT_FlickRFoot_Casper_TO_R_D
	anim_right_up = SK8_NTT_FlickRFoot_Casper_TO_F_D
	anim_right_down = SK8_NTT_FlickRFoot_Casper_TO_B_D
}
NTM_Casper_ntt_TO_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_TO_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_TO_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_TO_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_TO_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_TO_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_TO_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_TO_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_TO_Bck_D
}
NTM_Anticasper_ntt_TO_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_Casper_TO_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_Casper_TO_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_Casper_TO_F_D
	base_anim_left_down = SK8_NTT_MoveLFoot_Casper_TO_B_D
	base_anim_right_left = SK8_NTT_MoveRFoot_Casper_TO_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_Casper_TO_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_Casper_TO_F_D
	base_anim_right_down = SK8_NTT_MoveRFoot_Casper_TO_B_D
	neutral_foot_pos_left = Ska8_zacs_empty_anim_D
	neutral_foot_pos_right = Ska8_zacs_empty_anim_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_Casper_TO_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_Casper_TO_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_Casper_TO_F_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_Casper_TO_B_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_Casper_TO_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_Casper_TO_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_Casper_TO_F_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_Casper_TO_B_D
}
NTM_Anticasper_ntt_TO_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_Casper_TO_L_D
	anim_left_right = SK8_NTT_FlickLFoot_Casper_TO_R_D
	anim_left_up = SK8_NTT_FlickLFoot_Casper_TO_F_D
	anim_left_down = SK8_NTT_FlickLFoot_Casper_TO_B_D
	anim_right_left = SK8_NTT_FlickRFoot_Casper_TO_L_D
	anim_right_right = SK8_NTT_FlickRFoot_Casper_TO_R_D
	anim_right_up = SK8_NTT_FlickRFoot_Casper_TO_F_D
	anim_right_down = SK8_NTT_FlickRFoot_Casper_TO_B_D
}
NTM_Anticasper_ntt_TO_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_TO_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_TO_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_TO_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_TO_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_TO_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_TO_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_TO_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_TO_Bck_D
}
NTM_Ollie_ntt_Apex_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_Apex_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_Apex_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_Apex_Fwd_D
	base_anim_left_down = SK8_NTT_MoveLFoot_Apex_Bck_D
	base_anim_right_left = SK8_NTT_MoveRFoot_Apex_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_Apex_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_Apex_Fwd_D
	base_anim_right_down = SK8_NTT_MoveRFoot_Apex_Bck_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_Apex_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_Apex_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_Apex_Fwd_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_Apex_Bck_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_Apex_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_Apex_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_Apex_Fwd_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_Apex_Bck_D
}
NTM_Ollie_ntt_Apex_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_Apex_L_D
	anim_left_right = SK8_NTT_FlickLFoot_Apex_R_D
	anim_left_up = SK8_NTT_FlickLFoot_Apex_Fwd_D
	anim_left_down = SK8_NTT_FlickLFoot_Apex_Bck_D
	anim_right_left = SK8_NTT_FlickRFoot_Apex_L_D
	anim_right_right = SK8_NTT_FlickRFoot_Apex_R_D
	anim_right_up = SK8_NTT_FlickRFoot_Apex_Fwd_D
	anim_right_down = SK8_NTT_FlickRFoot_Apex_Bck_D
}
NTM_Ollie_ntt_Apex_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_Apex_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_Apex_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_Apex_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_Apex_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_Apex_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_Apex_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_Apex_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_Apex_Bck_D
}
NTM_Nollie_ntt_Apex_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_Apex_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_Apex_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_Apex_Fwd_D
	base_anim_left_down = SK8_NTT_MoveLFoot_Apex_Bck_D
	base_anim_right_left = SK8_NTT_MoveRFoot_Apex_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_Apex_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_Apex_Fwd_D
	base_anim_right_down = SK8_NTT_MoveRFoot_Apex_Bck_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_Apex_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_Apex_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_Apex_Fwd_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_Apex_Bck_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_Apex_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_Apex_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_Apex_Fwd_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_Apex_Bck_D
}
NTM_Nollie_ntt_Apex_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_Apex_L_D
	anim_left_right = SK8_NTT_FlickLFoot_Apex_R_D
	anim_left_up = SK8_NTT_FlickLFoot_Apex_Fwd_D
	anim_left_down = SK8_NTT_FlickLFoot_Apex_Bck_D
	anim_right_left = SK8_NTT_FlickRFoot_Apex_L_D
	anim_right_right = SK8_NTT_FlickRFoot_Apex_R_D
	anim_right_up = SK8_NTT_FlickRFoot_Apex_Fwd_D
	anim_right_down = SK8_NTT_FlickRFoot_Apex_Bck_D
}
NTM_Nollie_ntt_Apex_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_Apex_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_Apex_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_Apex_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_Apex_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_Apex_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_Apex_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_Apex_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_Apex_Bck_D
}
NTM_Casper_ntt_Apex_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_Casper_Apex_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_Casper_Apex_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_Casper_Apex_F_D
	base_anim_left_down = SK8_NTT_MoveLFoot_Casper_Apex_B_D
	base_anim_right_left = SK8_NTT_MoveRFoot_Casper_Apex_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_Casper_Apex_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_Casper_Apex_F_D
	base_anim_right_down = SK8_NTT_MoveRFoot_Casper_Apex_B_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_Casper_Apex_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_Casper_Apex_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_Casper_Apex_F_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_Casper_Apex_B_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_Casper_Apex_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_Casper_Apex_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_Casper_Apex_F_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_Casper_Apex_B_D
}
NTM_Casper_ntt_Apex_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_Casper_Apex_L_D
	anim_left_right = SK8_NTT_FlickLFoot_Casper_Apex_R_D
	anim_left_up = SK8_NTT_FlickLFoot_Casper_Apex_F_D
	anim_left_down = SK8_NTT_FlickLFoot_Casper_Apex_B_D
	anim_right_left = SK8_NTT_FlickRFoot_Casper_Apex_L_D
	anim_right_right = SK8_NTT_FlickRFoot_Casper_Apex_R_D
	anim_right_up = SK8_NTT_FlickRFoot_Casper_Apex_F_D
	anim_right_down = SK8_NTT_FlickRFoot_Casper_Apex_B_D
}
NTM_Casper_ntt_Apex_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_Apex_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_Apex_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_Apex_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_Apex_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_Apex_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_Apex_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_Apex_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_Apex_Bck_D
}
NTM_Anticasper_ntt_Apex_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_Casper_Apex_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_Casper_Apex_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_Casper_Apex_F_D
	base_anim_left_down = SK8_NTT_MoveLFoot_Casper_Apex_B_D
	base_anim_right_left = SK8_NTT_MoveRFoot_Casper_Apex_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_Casper_Apex_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_Casper_Apex_F_D
	base_anim_right_down = SK8_NTT_MoveRFoot_Casper_Apex_B_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_Casper_Apex_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_Casper_Apex_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_Casper_Apex_F_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_Casper_Apex_B_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_Casper_Apex_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_Casper_Apex_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_Casper_Apex_F_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_Casper_Apex_B_D
}
NTM_Anticasper_ntt_Apex_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_Casper_Apex_L_D
	anim_left_right = SK8_NTT_FlickLFoot_Casper_Apex_R_D
	anim_left_up = SK8_NTT_FlickLFoot_Casper_Apex_F_D
	anim_left_down = SK8_NTT_FlickLFoot_Casper_Apex_B_D
	anim_right_left = SK8_NTT_FlickRFoot_Casper_Apex_L_D
	anim_right_right = SK8_NTT_FlickRFoot_Casper_Apex_R_D
	anim_right_up = SK8_NTT_FlickRFoot_Casper_Apex_F_D
	anim_right_down = SK8_NTT_FlickRFoot_Casper_Apex_B_D
}
NTM_Anticasper_ntt_Apex_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_Apex_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_Apex_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_Apex_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_Apex_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_Apex_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_Apex_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_Apex_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_Apex_Bck_D
}
NTM_Ollie_ntt_Land_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_Land_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_Land_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_Land_Fwd_D
	base_anim_left_down = SK8_NTT_MoveLFoot_Land_Bck_D
	base_anim_right_left = SK8_NTT_MoveRFoot_Land_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_Land_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_Land_Fwd_D
	base_anim_right_down = SK8_NTT_MoveRFoot_Land_Bck_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_Land_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_Land_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_Land_Fwd_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_Land_Bck_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_Land_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_Land_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_Land_Fwd_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_Land_Bck_D
}
NTM_Ollie_ntt_Land_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_Land_L_D
	anim_left_right = SK8_NTT_FlickLFoot_Land_R_D
	anim_left_up = SK8_NTT_FlickLFoot_Land_Fwd_D
	anim_left_down = SK8_NTT_FlickLFoot_Land_Bck_D
	anim_right_left = SK8_NTT_FlickRFoot_Land_L_D
	anim_right_right = SK8_NTT_FlickRFoot_Land_R_D
	anim_right_up = SK8_NTT_FlickRFoot_Land_Fwd_D
	anim_right_down = SK8_NTT_FlickRFoot_Land_Bck_D
}
NTM_Ollie_ntt_Land_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_Land_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_Land_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_Land_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_Land_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_Land_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_Land_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_Land_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_Land_Bck_D
}
NTM_Nollie_ntt_Land_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_Land_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_Land_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_Land_Fwd_D
	base_anim_left_down = SK8_NTT_MoveLFoot_Land_Bck_D
	base_anim_right_left = SK8_NTT_MoveRFoot_Land_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_Land_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_Land_Fwd_D
	base_anim_right_down = SK8_NTT_MoveRFoot_Land_Bck_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_Land_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_Land_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_Land_Fwd_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_Land_Bck_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_Land_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_Land_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_Land_Fwd_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_Land_Bck_D
}
NTM_Nollie_ntt_Land_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_Land_L_D
	anim_left_right = SK8_NTT_FlickLFoot_Land_R_D
	anim_left_up = SK8_NTT_FlickLFoot_Land_Fwd_D
	anim_left_down = SK8_NTT_FlickLFoot_Land_Bck_D
	anim_right_left = SK8_NTT_FlickRFoot_Land_L_D
	anim_right_right = SK8_NTT_FlickRFoot_Land_R_D
	anim_right_up = SK8_NTT_FlickRFoot_Land_Fwd_D
	anim_right_down = SK8_NTT_FlickRFoot_Land_Bck_D
}
NTM_Nollie_ntt_Land_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_Land_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_Land_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_Land_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_Land_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_Land_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_Land_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_Land_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_Land_Bck_D
}
NTM_Casper_ntt_Land_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_Casper_Land_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_Casper_Land_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_Casper_Land_F_D
	base_anim_left_down = SK8_NTT_MoveLFoot_Casper_Land_B_D
	base_anim_right_left = SK8_NTT_MoveRFoot_Casper_Land_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_Casper_Land_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_Casper_Land_F_D
	base_anim_right_down = SK8_NTT_MoveRFoot_Casper_Land_B_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_Casper_Land_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_Casper_Land_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_Casper_Land_F_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_Casper_Land_B_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_Casper_Land_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_Casper_Land_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_Casper_Land_F_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_Casper_Land_B_D
}
NTM_Casper_ntt_Land_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_Casper_Land_L_D
	anim_left_right = SK8_NTT_FlickLFoot_Casper_Land_R_D
	anim_left_up = SK8_NTT_FlickLFoot_Casper_Land_F_D
	anim_left_down = SK8_NTT_FlickLFoot_Casper_Land_B_D
	anim_right_left = SK8_NTT_FlickRFoot_Casper_Land_L_D
	anim_right_right = SK8_NTT_FlickRFoot_Casper_Land_R_D
	anim_right_up = SK8_NTT_FlickRFoot_Casper_Land_F_D
	anim_right_down = SK8_NTT_FlickRFoot_Casper_Land_B_D
}
NTM_Casper_ntt_Land_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_Land_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_Land_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_Land_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_Land_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_Land_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_Land_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_Land_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_Land_Bck_D
}
NTM_Anticasper_ntt_Land_anims = {
	base_anim_left_left = SK8_NTT_MoveLFoot_Casper_Land_L_D
	base_anim_left_right = SK8_NTT_MoveLFoot_Casper_Land_R_D
	base_anim_left_up = SK8_NTT_MoveLFoot_Casper_Land_F_D
	base_anim_left_down = SK8_NTT_MoveLFoot_Casper_Land_B_D
	base_anim_right_left = SK8_NTT_MoveRFoot_Casper_Land_L_D
	base_anim_right_right = SK8_NTT_MoveRFoot_Casper_Land_R_D
	base_anim_right_up = SK8_NTT_MoveRFoot_Casper_Land_F_D
	base_anim_right_down = SK8_NTT_MoveRFoot_Casper_Land_B_D
	idle_anim_left_left = SK8_NTT_Idle_LFoot_Casper_Land_L_D
	idle_anim_left_right = SK8_NTT_Idle_LFoot_Casper_Land_R_D
	idle_anim_left_up = SK8_NTT_Idle_LFoot_Casper_Land_F_D
	idle_anim_left_down = SK8_NTT_Idle_LFoot_Casper_Land_B_D
	idle_anim_right_left = SK8_NTT_Idle_RFoot_Casper_Land_L_D
	idle_anim_right_right = SK8_NTT_Idle_RFoot_Casper_Land_R_D
	idle_anim_right_up = SK8_NTT_Idle_RFoot_Casper_Land_F_D
	idle_anim_right_down = SK8_NTT_Idle_RFoot_Casper_Land_B_D
}
NTM_Anticasper_ntt_Land_flicks = {
	anim_left_left = SK8_NTT_FlickLFoot_Casper_Land_L_D
	anim_left_right = SK8_NTT_FlickLFoot_Casper_Land_R_D
	anim_left_up = SK8_NTT_FlickLFoot_Casper_Land_F_D
	anim_left_down = SK8_NTT_FlickLFoot_Casper_Land_B_D
	anim_right_left = SK8_NTT_FlickRFoot_Casper_Land_L_D
	anim_right_right = SK8_NTT_FlickRFoot_Casper_Land_R_D
	anim_right_up = SK8_NTT_FlickRFoot_Casper_Land_F_D
	anim_right_down = SK8_NTT_FlickRFoot_Casper_Land_B_D
}
NTM_Anticasper_ntt_Land_flicks_trucks = {
	anim_left_left = SK8_NTT_TrckFlckLFoot_Land_L_D
	anim_left_right = SK8_NTT_TrckFlckLFoot_Land_R_D
	anim_left_up = SK8_NTT_TrckFlckLFoot_Land_Fwd_D
	anim_left_down = SK8_NTT_TrckFlckLFoot_Land_Bck_D
	anim_right_left = SK8_NTT_TrckFlckRFoot_Land_L_D
	anim_right_right = SK8_NTT_TrckFlckRFoot_Land_R_D
	anim_right_up = SK8_NTT_TrckFlckRFoot_Land_Fwd_D
	anim_right_down = SK8_NTT_TrckFlckRFoot_Land_Bck_D
}
