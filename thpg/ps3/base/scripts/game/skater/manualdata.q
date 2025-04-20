shared_manual_data = {
	speed_threshold = 15
	crouch_blend_time = 1.0
	land_blend_curve = [
		1.0
		0.99992794
		0.9996729
		0.99917895
		0.9983869
		0.99723995
		0.9956799
		0.99364996
		0.99109197
		0.98794895
		0.984163
		0.97967595
		0.974432
		0.968372
		0.96143895
		0.953576
		0.944724
		0.93307495
		0.91668594
		0.895341
		0.868906
		0.83737
		0.80088603
		0.75981206
		0.714724
		0.66641206
		0.615836
		0.564045
		0.512092
		0.460943
		0.411421
		0.364168
		0.319647
		0.278159
		0.23986502
		0.20482399
		0.17301701
		0.144371
		0.118778
		0.0961085
		0.0762226
		0.0589764
		0.0442264
		0.031833395
		0.021664
		0.0135916
		0.0074969004
		0.00326838
		0.000801771
		0.0
		0.0
	]
	land_blend_time = 1.66
	turn_blend_curve = [
		1.0
		0.0
	]
	turn_blend_time = 0.8
	turn_blend_out_time = 0.8
	balance_blend_curve = [
		1.0
		0.959364
		0.872435
		0.7612739
		0.63478297
		0.50311404
		0.37482902
		0.252956
		0.141611
		0.048841998
		0.0
	]
	speed_blend_curve = [
		1.0
		0.988541
		0.954055
		0.896426
		0.815658
		0.71198994
		0.58613694
		0.43985602
		0.27747902
		0.11143701
		0.0
	]
	speed_min_strength = 0.6
	crouch_blend_curve = [
		1.0
		0.97199994
		0.89599997
		0.784
		0.64800006
		0.5
		0.35200003
		0.216
		0.104
		0.027999999
		0.0
	]
	crouch_blend_time = 0.1
	crouch_min_strength = 0.4
	crouchslope_min_strength = 0.4
	landslope_min_strength = 0.4
	landing_balance_min_strength = 0.5
}
manual_data = {
	struct = manual_data
	string = 'manual'
	base_anim = Sk8_Manu_Manual_Base_F
	land_anim = Sk8_Manu_Manual_LndO_D
	crouch_anim = Sk8_Manu_Manual_Prep_D
	trans_anim = Sk8_Manu_Manual_180T_F
	back_anim = Sk8_Manu_Manual_OffB_D
	forward_anim = Sk8_Manu_Manual_OffF_D
	range_anim = Sk8_Manu_Manual_Range_D
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
	transitions = {
		AntiCasper_Data = 1
		Casper_Data = 10
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
nosemanual_data = {
	struct = nosemanual_data
	string = 'nosemanual'
	base_anim = Sk8_Manu_NSManu_Base_F
	land_anim = Sk8_Manu_NSManu_LndO_D
	crouch_anim = Sk8_Manu_NSManu_Prep_D
	trans_anim = Sk8_Manu_NSManu_180T_F
	back_anim = Sk8_Manu_NSManu_OffB_D
	forward_anim = Sk8_Manu_NSManu_OffF_D
	range_anim = Sk8_Manu_NSManu_Range_D
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
OneFootNosemanual_Data = {
	struct = OneFootNosemanual_Data
	string = 'OneFootNoseManual'
	base_anim = Sk8_Manu_OFNMnu_Base_F
	land_anim = Ska8_zacs_empty_anim_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_Manu_OFNMnu_OffB_D
	forward_anim = Sk8_Manu_OFNMnu_OffF_D
	range_anim = Sk8_Manu_OFNMnu_Range_D
	back_slopef = Sk8_Manu_OFNMnu_OffB_SlpF_D
	back_slopeb = Sk8_Manu_OFNMnu_OffB_SlpB_D
	back_slopel = Sk8_Manu_OFNMnu_OffB_SlpL_D
	back_sloper = Sk8_Manu_OFNMnu_OffB_SlpR_D
	forward_slopef = Sk8_Manu_OFNMnu_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_OFNMnu_OffF_SlpB_D
	forward_slopel = Sk8_Manu_OFNMnu_OffF_SlpL_D
	forward_sloper = Sk8_Manu_OFNMnu_OffF_SlpR_D
	slopef = Sk8_Manu_OFNMnu_SlpF_D
	slopeb = Sk8_Manu_OFNMnu_SlpB_D
	slopel = Sk8_Manu_OFNMnu_SlpL_D
	sloper = Sk8_Manu_OFNMnu_SlpR_D
	fast_anim = Sk8_Manu_OFNMnu_Fast_D
	slow_anim = Sk8_Manu_OFNMnu_Slow_D
	turn_left = Sk8_Manu_OFNMnu_Turn_L_D
	turn_right = Sk8_Manu_OFNMnu_Turn_R_D
	$shared_manual_data
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
		CrossfootPogo_Data = 1
		OneFootManual_Data = 1
		Pogo_Data = 1
		Rail_Data = 1
		Spacewalk_Data = 1
		SwitchFootPogo_Data = 1
		Truckstand_Data = 1
	}
}
OneFootManual_Data = {
	struct = OneFootManual_Data
	string = 'OneFootManual'
	base_anim = sk8_manu_ofmanu_base_F
	land_anim = Ska8_zacs_empty_anim_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_Manu_OFmanu_OffB_D
	forward_anim = Sk8_Manu_OFmanu_OffF_D
	range_anim = Sk8_Manu_OFmanu_Range_D
	back_slopef = Sk8_Manu_OFmanu_OffB_SlpF_D
	back_slopeb = Sk8_Manu_OFmanu_OffB_SlpB_D
	back_slopel = Sk8_Manu_OFmanu_OffB_SlpL_D
	back_sloper = Sk8_Manu_OFmanu_OffB_SlpR_D
	forward_slopef = Sk8_Manu_OFmanu_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_OFmanu_OffF_SlpB_D
	forward_slopel = Sk8_Manu_OFmanu_OffF_SlpL_D
	forward_sloper = Sk8_Manu_OFmanu_OffF_SlpR_D
	slopef = Sk8_Manu_OFmanu_SlpF_D
	slopeb = Sk8_Manu_OFmanu_SlpB_D
	slopel = Sk8_Manu_OFmanu_SlpL_D
	sloper = Sk8_Manu_OFmanu_SlpR_D
	fast_anim = Sk8_Manu_OFmanu_Fast_D
	slow_anim = Sk8_Manu_OFmanu_Slow_D
	turn_left = Sk8_Manu_OFmanu_Turn_L_D
	turn_right = Sk8_Manu_OFmanu_Turn_R_D
	$shared_manual_data
	speed_min_strength = 0
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
		CrossfootPogo_Data = 1
		OneFootNosemanual_Data = 1
		Pogo_Data = 1
		Rail_Data = 1
		Spacewalk_Data = 1
		SwitchFootPogo_Data = 1
		Truckstand_Data = 1
	}
}
Spacewalk_Data = {
	struct = Spacewalk_Data
	string = 'Spacewalk'
	base_anim = Sk8_Manu_SpaceW_Base_F
	land_anim = Ska8_zacs_empty_anim_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Ska8_zacs_empty_anim_D
	forward_anim = Ska8_zacs_empty_anim_D
	range_anim = Ska8_zacs_empty_anim_D
	back_slopef = Sk8_Root_Slope_F_D
	back_slopeb = Sk8_Root_Slope_B_D
	back_slopel = Sk8_Root_Slope_L_D
	back_sloper = Sk8_Root_Slope_R_D
	forward_slopef = Sk8_Root_Slope_F_D
	forward_slopeb = Sk8_Root_Slope_B_D
	forward_slopel = Sk8_Root_Slope_L_D
	forward_sloper = Sk8_Root_Slope_R_D
	slopef = Sk8_Root_Slope_F_D
	slopeb = Sk8_Root_Slope_B_D
	slopel = Sk8_Root_Slope_L_D
	sloper = Sk8_Root_Slope_R_D
	fast_anim = Sk8_Manu_SpaceW_Fast_D
	slow_anim = sk8_manu_spacew_slow_D
	turn_left = Sk8_Manu_SpaceW_Turn_L_D
	turn_right = Sk8_Manu_SpaceW_Turn_R_D
	$shared_manual_data
	speed_threshold = 15
	speed_min_strength = 1
	land_blend_time = 0.0
	turn_blend_time = 1
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
		Truckstand_Data = 1
	}
}
CrossfootPogo_Data = {
	struct = CrossfootPogo_Data
	string = 'CrossfootPogo'
	friction = 0.0055
	base_anim = sk8_manu_cfpogo_base_F
	land_anim = Ska8_zacs_empty_anim_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Ska8_zacs_empty_anim_D
	forward_anim = Ska8_zacs_empty_anim_D
	range_anim = Sk8_Manu_CFpogo_Range_D
	back_slopef = Sk8_Root_Slope_F_D
	back_slopeb = Sk8_Root_Slope_B_D
	back_slopel = Sk8_Root_Slope_L_D
	back_sloper = Sk8_Root_Slope_R_D
	forward_slopef = Sk8_Root_Slope_F_D
	forward_slopeb = Sk8_Root_Slope_B_D
	forward_slopel = Sk8_Root_Slope_L_D
	forward_sloper = Sk8_Root_Slope_R_D
	slopef = Sk8_Root_Slope_F_D
	slopeb = Sk8_Root_Slope_B_D
	slopel = Sk8_Root_Slope_L_D
	sloper = Sk8_Root_Slope_R_D
	fast_anim = Sk8_Manu_CFpogo_Fast_D
	slow_anim = sk8_manu_cfpogo_slow_D
	turn_left = Sk8_Manu_CFpogo_Turn_L_D
	turn_right = Sk8_Manu_CFpogo_Turn_R_D
	fliptrick = Sk8_Manu_pogo_to_pogo_D
	$shared_manual_data
	speed_threshold = 7
	land_blend_time = 0.0
	speed_blend_curve = [
		1.0
		0.988541
		0.954055
		0.896426
		0.815658
		0.71198994
		0.58613694
		0.43985602
		0.27747902
		0.11143701
		0.0
	]
	speed_min_strength = 1.0
	turn_blend_curve = [
		1.0
		0.0
	]
	turn_blend_time = 1.2
	turn_blend_out_time = 0.8
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
		OneFootManual_Data = 1
		OneFootNosemanual_Data = 1
		Pogo_Data = 1
		Rail_Data = 1
		Spacewalk_Data = 1
		SwitchFootPogo_Data = 1
		Truckstand_Data = 1
	}
}
Casper_Data = {
	struct = Casper_Data
	string = 'Casper'
	friction = 0.04
	base_anim = sk8_manu_casper_base_F
	land_anim = Ska8_zacs_empty_anim_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_Manu_casper_OffB_D
	forward_anim = Sk8_Manu_casper_OffF_D
	range_anim = Sk8_Manu_casper_Range_D
	back_slopef = Sk8_Manu_casper_OffB_SlpF_D
	back_slopeb = Sk8_Manu_casper_OffB_SlpB_D
	back_slopel = Sk8_Manu_casper_OffB_SlpL_D
	back_sloper = Sk8_Manu_casper_OffB_SlpR_D
	forward_slopef = Sk8_Manu_casper_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_casper_OffF_SlpB_D
	forward_slopel = Sk8_Manu_casper_OffF_SlpL_D
	forward_sloper = Sk8_Manu_casper_OffF_SlpR_D
	slopef = Sk8_Manu_casper_SlpF_D
	slopeb = Sk8_Manu_casper_SlpB_D
	slopel = Sk8_Manu_casper_SlpL_D
	sloper = Sk8_Manu_casper_SlpR_D
	fast_anim = Sk8_Manu_casper_Fast_D
	slow_anim = Sk8_Manu_casper_Slow_D
	turn_left = Sk8_Manu_casper_Turn_L_D
	turn_right = Sk8_Manu_casper_Turn_R_D
	fliptrick = Sk8_Manu_pogo_to_pogo_D
	$shared_manual_data
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
AntiCasper_Data = {
	struct = AntiCasper_Data
	string = 'AntiCasper'
	friction = 0.042999998
	base_anim = sk8_manu_antica_base_F
	land_anim = Ska8_zacs_empty_anim_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_Manu_antica_OffB_D
	forward_anim = Sk8_Manu_antica_OffF_D
	range_anim = Sk8_Manu_antica_Range_D
	back_slopef = Sk8_Manu_antica_OffB_SlpF_D
	back_slopeb = Sk8_Manu_antica_OffB_SlpB_D
	back_slopel = Sk8_Manu_antica_OffB_SlpL_D
	back_sloper = Sk8_Manu_antica_OffB_SlpR_D
	forward_slopef = Sk8_Manu_antica_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_antica_OffF_SlpB_D
	forward_slopel = Sk8_Manu_antica_OffF_SlpL_D
	forward_sloper = Sk8_Manu_antica_OffF_SlpR_D
	slopef = Sk8_Manu_antica_SlpF_D
	slopeb = Sk8_Manu_antica_SlpB_D
	slopel = Sk8_Manu_antica_SlpL_D
	sloper = Sk8_Manu_antica_SlpR_D
	fast_anim = Sk8_Manu_antica_Fast_D
	slow_anim = Sk8_Manu_antica_Slow_D
	turn_left = Sk8_Manu_antica_Turn_L_D
	turn_right = Sk8_Manu_antica_Turn_R_D
	fliptrick = Sk8_Manu_pogo_to_pogo_D
	$shared_manual_data
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
Truckstand_Data = {
	struct = Truckstand_Data
	string = 'Truckstand'
	friction = 0.02
	base_anim = sk8_manu_trcksd_base_F
	land_anim = Ska8_zacs_empty_anim_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_Manu_TrckSd_OffB_D
	forward_anim = Sk8_Manu_TrckSd_OffF_D
	range_anim = Sk8_Manu_TrckSd_Range_D
	back_slopef = Sk8_Manu_TrckSd_OffB_SlpF_D
	back_slopeb = Sk8_Manu_TrckSd_OffB_SlpB_D
	back_slopel = Sk8_Manu_TrckSd_OffB_SlpL_D
	back_sloper = Sk8_Manu_TrckSd_OffB_SlpR_D
	forward_slopef = Sk8_Manu_TrckSd_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_TrckSd_OffF_SlpB_D
	forward_slopel = Sk8_Manu_TrckSd_OffF_SlpL_D
	forward_sloper = Sk8_Manu_TrckSd_OffF_SlpR_D
	slopef = Sk8_Manu_TrckSd_SlpF_D
	slopeb = Sk8_Manu_TrckSd_SlpB_D
	slopel = Sk8_Manu_TrckSd_SlpL_D
	sloper = Sk8_Manu_TrckSd_SlpR_D
	fast_anim = Sk8_Manu_TrckSd_Fast_D
	slow_anim = Sk8_Manu_TrckSd_Slow_D
	turn_left = Sk8_Manu_TrckSd_Turn_L_D
	turn_right = Sk8_Manu_TrckSd_Turn_R_D
	$shared_manual_data
	speed_threshold = 6
	speed_min_strength = 0.5
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
		CrossfootPogo_Data = 1
		OneFootManual_Data = 1
		OneFootNosemanual_Data = 1
		Pogo_Data = 1
		Rail_Data = 1
		Spacewalk_Data = 1
		SwitchFootPogo_Data = 1
	}
}
SwitchFootPogo_Data = {
	struct = SwitchFootPogo_Data
	string = 'SwitchFootPogo'
	friction = 0.05
	base_anim = sk8_manu_sfpogo_base_F
	land_anim = Ska8_zacs_empty_anim_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_Manu_SFpogo_OffB_D
	forward_anim = Sk8_Manu_SFpogo_OffF_D
	range_anim = Sk8_Manu_SFpogo_Range_D
	back_slopef = Sk8_Root_Slope_F_D
	back_slopeb = Sk8_Root_Slope_B_D
	back_slopel = Sk8_Root_Slope_L_D
	back_sloper = Sk8_Root_Slope_R_D
	forward_slopef = Sk8_Root_Slope_F_D
	forward_slopeb = Sk8_Root_Slope_B_D
	forward_slopel = Sk8_Root_Slope_L_D
	forward_sloper = Sk8_Root_Slope_R_D
	slopef = Sk8_Root_Slope_F_D
	slopeb = Sk8_Root_Slope_B_D
	slopel = Sk8_Root_Slope_L_D
	sloper = Sk8_Root_Slope_R_D
	fast_anim = sk8_manu_sfpogo_slow_D
	slow_anim = sk8_manu_sfpogo_slow_D
	turn_left = Sk8_Manu_SFpogo_Turn_L_D
	turn_right = Sk8_Manu_SFpogo_Turn_R_D
	fliptrick = Sk8_Manu_pogo_to_pogo_D
	fliptrick2 = Sk8_Manu_pogo_to_pogo_D
	$shared_manual_data
	speed_threshold = 9
	land_blend_time = 0.0
	balance_blend_curve = [
		1.0
		0.0
	]
	speed_blend_curve = [
		1.0
		0.0
	]
	speed_min_strength = 0.0
	turn_blend_curve = [
		1.0
		0.0
	]
	turn_blend_time = 1.2
	turn_blend_out_time = 0.8
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
		CrossfootPogo_Data = 1
		OneFootManual_Data = 1
		OneFootNosemanual_Data = 1
		Pogo_Data = 5
		Rail_Data = 1
		Spacewalk_Data = 1
		Truckstand_Data = 11
	}
}
Pogo_Data = {
	struct = Pogo_Data
	string = 'Pogo'
	friction = 0.005
	base_anim = sk8_manu_pogo_base_F
	land_anim = Ska8_zacs_empty_anim_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Sk8_Manu_Pogo_180T_F
	back_anim = Ska8_zacs_empty_anim_D
	forward_anim = Ska8_zacs_empty_anim_D
	range_anim = Sk8_Manu_Pogo_Range_D
	back_slopef = Sk8_Root_Slope_F_D
	back_slopeb = Sk8_Root_Slope_B_D
	back_slopel = Sk8_Root_Slope_L_D
	back_sloper = Sk8_Root_Slope_R_D
	forward_slopef = Sk8_Root_Slope_F_D
	forward_slopeb = Sk8_Root_Slope_B_D
	forward_slopel = Sk8_Root_Slope_L_D
	forward_sloper = Sk8_Root_Slope_R_D
	slopef = Sk8_Root_Slope_F_D
	slopeb = Sk8_Root_Slope_B_D
	slopel = Sk8_Root_Slope_L_D
	sloper = Sk8_Root_Slope_R_D
	fast_anim = Sk8_Manu_Pogo_Fast_D
	slow_anim = sk8_manu_pogo_slow_D
	turn_left = Sk8_Manu_Pogo_Turn_L_D
	turn_right = Sk8_Manu_Pogo_Turn_R_D
	$shared_manual_data
	speed_threshold = 5
	land_blend_time = 0.0
	speed_blend_curve = [
		1.0
		0.988541
		0.954055
		0.896426
		0.815658
		0.71198994
		0.58613694
		0.43985602
		0.27747902
		0.11143701
		0.0
	]
	speed_min_strength = 1.0
	turn_blend_curve = [
		1.0
		0.0
	]
	turn_blend_time = 1.2
	turn_blend_out_time = 0.8
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
		CrossfootPogo_Data = 4
		OneFootManual_Data = 1
		OneFootNosemanual_Data = 1
		Rail_Data = 1
		Spacewalk_Data = 1
		SwitchFootPogo_Data = 1
		Truckstand_Data = 12
	}
}
Rail_Data = {
	struct = Rail_Data
	string = 'Rail'
	friction = 0.023
	base_anim = sk8_manu_primo_base_F
	land_anim = Ska8_zacs_empty_anim_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_Manu_Primo_OffB_D
	forward_anim = Sk8_Manu_Primo_OffF_D
	range_anim = Sk8_Manu_Primo_Range_D
	back_slopef = Sk8_Manu_Primo_OffB_SlpF_D
	back_slopeb = Sk8_Manu_Primo_OffB_SlpB_D
	back_slopel = Sk8_Manu_Primo_OffB_SlpL_D
	back_sloper = Sk8_Manu_Primo_OffB_SlpR_D
	forward_slopef = Sk8_Manu_Primo_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_Primo_OffF_SlpB_D
	forward_slopel = Sk8_Manu_Primo_OffF_SlpL_D
	forward_sloper = Sk8_Manu_Primo_OffF_SlpR_D
	slopef = Sk8_Manu_Primo_SlpF_D
	slopeb = Sk8_Manu_Primo_SlpB_D
	slopel = Sk8_Manu_Primo_SlpL_D
	sloper = Sk8_Manu_Primo_SlpR_D
	fast_anim = Sk8_Manu_Primo_Fast_D
	slow_anim = Sk8_Manu_Primo_Slow_D
	turn_left = Sk8_Manu_Primo_Turn_L_D
	turn_right = Sk8_Manu_Primo_Turn_R_D
	$shared_manual_data
	speed_threshold = 9
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 10
		CrossfootPogo_Data = 1
		OneFootManual_Data = 1
		OneFootNosemanual_Data = 1
		Pogo_Data = 1
		Spacewalk_Data = 1
		SwitchFootPogo_Data = 1
		Truckstand_Data = 1
	}
}
Rodney_data = {
	struct = Rodney_data
	string = 'Rodney'
	base_anim = Sk8_Manu_Rodney_Base_F
	land_anim = Sk8_Manu_Rodney_LndO_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Ska8_zacs_empty_anim_D
	forward_anim = Ska8_zacs_empty_anim_D
	range_anim = Sk8_Manu_Rodney_Range_D
	back_slopef = Sk8_Manu_Rodney_OffB_SlpF_D
	back_slopeb = Sk8_Manu_Rodney_OffB_SlpB_D
	back_slopel = Sk8_Manu_Rodney_OffB_SlpL_D
	back_sloper = Sk8_Manu_Rodney_OffB_SlpR_D
	forward_slopef = Sk8_Manu_Rodney_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_Rodney_OffF_SlpB_D
	forward_slopel = Sk8_Manu_Rodney_OffF_SlpL_D
	forward_sloper = Sk8_Manu_Rodney_OffF_SlpR_D
	slopef = Sk8_Manu_Rodney_SlpF_D
	slopeb = Sk8_Manu_Rodney_SlpB_D
	slopel = Sk8_Manu_Rodney_SlpL_D
	sloper = Sk8_Manu_Rodney_SlpR_D
	fast_anim = Sk8_Manu_Rodney_Fast_D
	slow_anim = Sk8_Manu_Rodney_Slow_D
	turn_left = Sk8_Manu_Rodney_Turn_L_D
	turn_right = Sk8_Manu_Rodney_Turn_R_D
	$shared_manual_data
	speed_min_strength = 1
	land_blend_curve = [
		0.0
		0.0
	]
	land_blend_time = 0
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
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
MCA_data = {
	struct = MCA_data
	string = 'MCA'
	base_anim = Sk8_Manu_MCA_Base_F
	land_anim = Sk8_Manu_MCA_LndO_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Ska8_zacs_empty_anim_D
	forward_anim = Ska8_zacs_empty_anim_D
	range_anim = Ska8_zacs_empty_anim_D
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
	fast_anim = Sk8_Manu_MCA_fast_D
	slow_anim = Sk8_Manu_MCA_slow_D
	turn_left = Sk8_Manu_MCA_Turn_L_D
	turn_right = Sk8_Manu_MCA_Turn_R_D
	$shared_manual_data
	speed_threshold = 10.71989
	speed_min_strength = 1
	land_blend_curve = [
		0.0
		0.0
	]
	land_blend_time = 0
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
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
Staab_data = {
	struct = Staab_data
	string = 'Staab'
	base_anim = Sk8_Manu_Staab_Base_F
	land_anim = Sk8_Manu_Staab_LndO_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Sk8_Manu_Staab_OffB_D
	forward_anim = Sk8_Manu_Staab_OffF_D
	range_anim = Sk8_Manu_Staab_Range_D
	back_slopef = Sk8_Manu_Staab_OffB_SlpF_D
	back_slopeb = Sk8_Manu_Staab_OffB_SlpB_D
	back_slopel = Sk8_Manu_Staab_OffB_SlpL_D
	back_sloper = Sk8_Manu_Staab_OffB_SlpR_D
	forward_slopef = Sk8_Manu_Staab_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_Staab_OffF_SlpB_D
	forward_slopel = Sk8_Manu_Staab_OffF_SlpL_D
	forward_sloper = Sk8_Manu_Staab_OffF_SlpR_D
	slopef = Sk8_Manu_Staab_SlpF_D
	slopeb = Sk8_Manu_Staab_SlpB_D
	slopel = Sk8_Manu_Staab_SlpL_D
	sloper = Sk8_Manu_Staab_SlpR_D
	fast_anim = Sk8_Manu_Staab_Fast_D
	slow_anim = Sk8_Manu_Staab_Slow_D
	turn_left = Sk8_Manu_Staab_Turn_L_D
	turn_right = Sk8_Manu_Staab_Turn_R_D
	$shared_manual_data
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
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
Mosh_data = {
	struct = Mosh_data
	string = 'Mosh'
	base_anim = Sk8_Manu_Mosh_Base_F
	land_anim = Sk8_Manu_Mosh_LndO_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Ska8_zacs_empty_anim_D
	forward_anim = Ska8_zacs_empty_anim_D
	range_anim = Sk8_Manu_Mosh_Range_D
	back_slopef = Sk8_Manu_Mosh_OffB_SlpF_D
	back_slopeb = Sk8_Manu_Mosh_OffB_SlpB_D
	back_slopel = Sk8_Manu_Mosh_OffB_SlpL_D
	back_sloper = Sk8_Manu_Mosh_OffB_SlpR_D
	forward_slopef = Sk8_Manu_Mosh_OffF_SlpF_D
	forward_slopeb = Sk8_Manu_Mosh_OffF_SlpB_D
	forward_slopel = Sk8_Manu_Mosh_OffF_SlpL_D
	forward_sloper = Sk8_Manu_Mosh_OffF_SlpR_D
	slopef = Sk8_Manu_Mosh_SlpF_D
	slopeb = Sk8_Manu_Mosh_SlpB_D
	slopel = Sk8_Manu_Mosh_SlpL_D
	sloper = Sk8_Manu_Mosh_SlpR_D
	fast_anim = Sk8_Manu_Mosh_Fast_D
	slow_anim = Sk8_Manu_Mosh_Fast_D
	turn_left = Sk8_Manu_Mosh_Turn_L_D
	turn_right = Sk8_Manu_Mosh_Turn_R_D
	$shared_manual_data
	speed_min_strength = 1
	land_blend_time = 1
	land_blend_curve = [
		1.0
		1.0
		1.0
		0.990026
		0.96173394
		0.91756606
		0.859963
		0.7913699
		0.714228
		0.63097894
		0.544067
		0.45593303
		0.36902103
		0.285772
		0.20863
		0.140037
		0.0824344
		0.0382658
		0.00997354
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
	]
	landing_balance_min_strength = 1
	speed_threshold = 8
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
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
MikeV_data = {
	struct = MikeV_data
	string = 'MikeV'
	friction = 0.01
	base_anim = Sk8_Manu_MikeV_Base_F
	land_anim = Sk8_Manu_MikeV_LndO_D
	crouch_anim = Ska8_zacs_empty_anim_D
	trans_anim = Ska8_zacs_empty_anim_D
	back_anim = Ska8_zacs_empty_anim_D
	forward_anim = Ska8_zacs_empty_anim_D
	range_anim = Ska8_zacs_empty_anim_D
	back_slopef = Sk8_Root_Slope_F_D
	back_slopeb = Sk8_Root_Slope_B_D
	back_slopel = Sk8_Root_Slope_L_D
	back_sloper = Sk8_Root_Slope_R_D
	forward_slopef = Sk8_Root_Slope_F_D
	forward_slopeb = Sk8_Root_Slope_B_D
	forward_slopel = Sk8_Root_Slope_L_D
	forward_sloper = Sk8_Root_Slope_R_D
	slopef = Sk8_Root_Slope_F_D
	slopeb = Sk8_Root_Slope_B_D
	slopel = Sk8_Root_Slope_L_D
	sloper = Sk8_Root_Slope_R_D
	fast_anim = Sk8_Manu_MikeV_Fast_D
	slow_anim = Sk8_Manu_MikeV_Slow_D
	turn_left = Ska8_zacs_empty_anim_D
	turn_right = Ska8_zacs_empty_anim_D
	$shared_manual_data
	land_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.98876995
		0.957031
		0.907715
		0.84375006
		0.76806605
		0.68359405
		0.593262
		0.5
		0.406738
		0.316406
		0.231934
		0.15625
		0.0922851
		0.042968698
		0.0112304995
		0.0
	]
	land_blend_time = 1.3
	speed_min_strength = 1
	speed_threshold = 5
	landslope_min_strength = 1
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
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
TEST_SLOPE_data = {
	struct = TEST_SLOPE_data
	string = 'TEST_SLOPE'
	friction = 4
	base_anim = Sk8_Manu_Rodney_Base_F
	land_anim = Sk8_Manu_Rodney_LndO_D
	crouch_anim = Sk8_Manu_Rodney_Prep_D
	trans_anim = Sk8_Manu_Rodney_180T_F
	back_anim = Ska8_zacs_empty_anim_D
	forward_anim = Ska8_zacs_empty_anim_D
	range_anim = Ska8_zacs_empty_anim_D
	back_slopef = Sk8_Manu_Rodney_SlpF_D
	back_slopeb = Sk8_Manu_Rodney_SlpB_D
	back_slopel = Sk8_Manu_Rodney_SlpL_D
	back_sloper = Sk8_Manu_Rodney_SlpR_D
	forward_slopef = Sk8_Manu_Rodney_SlpF_D
	forward_slopeb = Sk8_Manu_Rodney_SlpB_D
	forward_slopel = Sk8_Manu_Rodney_SlpL_D
	forward_sloper = Sk8_Manu_Rodney_SlpR_D
	slopef = Sk8_Manu_Rodney_SlpF_D
	slopeb = Sk8_Manu_Rodney_SlpB_D
	slopel = Sk8_Manu_Rodney_SlpL_D
	sloper = Sk8_Manu_Rodney_SlpR_D
	fast_anim = Ska8_zacs_empty_anim_D
	slow_anim = Ska8_zacs_empty_anim_D
	turn_left = Ska8_zacs_empty_anim_D
	turn_right = Ska8_zacs_empty_anim_D
	$shared_manual_data
	speed_min_strength = 1
	land_blend_curve = [
		0.0
		0.0
	]
	land_blend_time = 0
	transitions = {
		manual_data = 1
		nosemanual_data = 1
		AntiCasper_Data = 1
		Casper_Data = 1
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
AntiCasper_flip_1 = {
	anim = Sk8_Manu_AntiCa_to_AntiCa_D
	balance_blend_curve = [
		0.0
		0.25925902
		0.740741
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9927499
		0.97199994
		0.93924993
		0.89599997
		0.84375006
		0.784
		0.71825
		0.64800006
		0.57475
		0.5
		0.42525002
		0.35200003
		0.28175
		0.216
		0.15625
		0.104
		0.06075
		0.027999999
		0.0072500003
		0.0
	]
	slope_blend_curve = [
		0.0
		0.25925902
		0.740741
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9927499
		0.97199994
		0.93924993
		0.89599997
		0.84375006
		0.784
		0.71825
		0.64800006
		0.57475
		0.5
		0.42525002
		0.35200003
		0.28175
		0.216
		0.15625
		0.104
		0.06075
		0.027999999
		0.0072500003
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Casper_flip_1 = {
	anim = Sk8_Manu_Casper_to_Casper_D
	balance_blend_curve = [
		0.0
		1.0
		0.0
	]
	slope_blend_curve = [
		0.0
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
CrossfootPogo_flip_1 = {
	anim = Sk8_Manu_CFpogo_to_CFpogo_D
	balance_blend_curve = [
		0.0
		0.014577299
		0.0553936
		0.118076
		0.198251
		0.29154497
		0.39358598
		0.5
		0.606414
		0.708455
		0.801749
		0.881924
		0.944606
		0.98542297
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9919809
		0.969092
		0.933081
		0.88569796
		0.828692
		0.76381403
		0.692812
		0.617437
		0.53943694
		0.460563
		0.38256302
		0.30718797
		0.23618601
		0.17130801
		0.114301994
		0.0669194
		0.0309083
		0.008018659
		0.0
	]
	slope_blend_curve = [
		0.0
		0.014577299
		0.0553936
		0.118076
		0.198251
		0.29154497
		0.39358598
		0.5
		0.606414
		0.708455
		0.801749
		0.881924
		0.944606
		0.98542297
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9919809
		0.969092
		0.933081
		0.88569796
		0.828692
		0.76381403
		0.692812
		0.617437
		0.53943694
		0.460563
		0.38256302
		0.30718797
		0.23618601
		0.17130801
		0.114301994
		0.0669194
		0.0309083
		0.008018659
		0.0
	]
	balance_blend_time = 0.1
	slope_blend_time = 0.1
	use_anim_length
}
Pogo_flip_1 = {
	anim = Sk8_Manu_pogo_to_pogo_D
	balance_blend_curve = [
		0.0
		0.014577299
		0.0553936
		0.118076
		0.198251
		0.29154497
		0.39358598
		0.5
		0.606414
		0.708455
		0.801749
		0.881924
		0.944606
		0.98542297
		1.0
		1.0
		1.0
		1.0
		0.9959859
		0.984352
		0.965706
		0.940659
		0.90982103
		0.87380004
		0.833206
		0.78865
		0.740741
		0.690088
		0.637301
		0.58298993
		0.52776504
		0.47223502
		0.41701
		0.36269903
		0.30991203
		0.25925902
		0.21135001
		0.16679399
		0.1262
		0.0901793
		0.0593405
		0.034293596
		0.015648
		0.00401362
		0.0
	]
	slope_blend_curve = [
		0.0
		0.014577299
		0.0553936
		0.118076
		0.198251
		0.29154497
		0.39358598
		0.5
		0.606414
		0.708455
		0.801749
		0.881924
		0.944606
		0.98542297
		1.0
		1.0
		1.0
		1.0
		0.9959859
		0.984352
		0.965706
		0.940659
		0.90982103
		0.87380004
		0.833206
		0.78865
		0.740741
		0.690088
		0.637301
		0.58298993
		0.52776504
		0.47223502
		0.41701
		0.36269903
		0.30991203
		0.25925902
		0.21135001
		0.16679399
		0.1262
		0.0901793
		0.0593405
		0.034293596
		0.015648
		0.00401362
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Rail_flip_1 = {
	anim = Sk8_Manu_Rail_to_Rail_D
	balance_blend_curve = [
		0.0
		1.0
		0.0
	]
	slope_blend_curve = [
		0.0
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Spacewalk_flip_1 = {
	anim = Sk8_Manu_pogo_to_pogo_D
	balance_blend_curve = [
		0.0
		1.0
		0.0
	]
	slope_blend_curve = [
		0.0
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
SwitchFootPogo_flip_1 = {
	anim = Sk8_Manu_SFpogo_to_SFpogo_D
	balance_blend_curve = [
		0.0
		0.014580899
		0.0553972
		0.118079
		0.19825399
		0.29154795
		0.393589
		0.500002
		0.60641605
		0.70845604
		0.80175
		0.881925
		0.94460696
		0.98542297
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.997732
		0.99060994
		0.97815603
		0.95990795
		0.93547994
		0.904632
		0.867377
		0.82406604
		0.775464
		0.72273195
		0.6673211
		0.610782
		0.55457205
		0.499902
		0.44767
		0.398463
		0.35261306
		0.310252
		0.27137798
		0.235901
		0.20367701
		0.17453699
		0.14829801
		0.12478
		0.103805
		0.085205205
		0.06882379
		0.054514803
		0.042143397
		0.0315858
		0.0227282
		0.0154662
		0.009703958
		0.0053537493
		0.0023348301
		0.00057300605
		0.0
	]
	slope_blend_curve = [
		0.0
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Truckstand_flip_1 = {
	anim = Sk8_Manu_Truck_to_Truck_D
	balance_blend_curve = [
		0.0
		1.0
		0.0
	]
	slope_blend_curve = [
		0.0
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Truckstand_flip_2 = {
	anim = Sk8_Manu_HFpogo_to_HFpogo_D
	balance_blend_curve = [
		0.0
		1.0
		0.0
	]
	slope_blend_curve = [
		0.0
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
OneFoot_flip_1 = {
	anim = Sk8_Manu_OFmanu_to_OFmanu_D
	balance_blend_curve = [
		0.0
		0.0168411
		0.0637232
		0.13518399
		0.225762
		0.32999504
		0.44242102
		0.55757904
		0.670005
		0.77423793
		0.86481607
		0.93627685
		0.983159
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9919809
		0.969092
		0.933081
		0.88569796
		0.828692
		0.76381403
		0.692812
		0.617437
		0.53943694
		0.460563
		0.38256302
		0.30718797
		0.23618601
		0.17130801
		0.114301994
		0.0669194
		0.0309083
		0.008018659
		0.0
	]
	slope_blend_curve = [
		0.0
		0.0168411
		0.0637232
		0.13518399
		0.225762
		0.32999504
		0.44242102
		0.55757904
		0.670005
		0.77423793
		0.86481607
		0.93627685
		0.983159
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9919809
		0.969092
		0.933081
		0.88569796
		0.828692
		0.76381403
		0.692812
		0.617437
		0.53943694
		0.460563
		0.38256302
		0.30718797
		0.23618601
		0.17130801
		0.114301994
		0.0669194
		0.0309083
		0.008018659
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
OneFootNose_flip_1 = {
	anim = Sk8_Manu_OfNsMl_to_OfNsMl_D
	balance_blend_curve = [
		0.0
		0.0127407005
		0.0485926
		0.104
		0.175407
		0.25925902
		0.35200003
		0.45007402
		0.54992604
		0.64800006
		0.740741
		0.824593
		0.89599997
		0.95140696
		0.987259
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.98876995
		0.957031
		0.907715
		0.84375006
		0.76806605
		0.68359405
		0.593262
		0.5
		0.406738
		0.316406
		0.231934
		0.15625
		0.0922851
		0.042968698
		0.0112304995
		0.0
	]
	slope_blend_curve = [
		0.0
		0.0127407005
		0.0485926
		0.104
		0.175407
		0.25925902
		0.35200003
		0.45007402
		0.54992604
		0.64800006
		0.740741
		0.824593
		0.89599997
		0.95140696
		0.987259
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.98876995
		0.957031
		0.907715
		0.84375006
		0.76806605
		0.68359405
		0.593262
		0.5
		0.406738
		0.316406
		0.231934
		0.15625
		0.0922851
		0.042968698
		0.0112304995
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
wall_push_fs_data = {
	anim = sk8_manu_agropush_frontside_D
	balance_blend_curve = [
		0.0
		0.25925902
		0.740741
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.97670895
		0.91284794
		0.81743103
		0.699475
		0.567994
		0.432006
		0.300526
		0.18257001
		0.0871526
		0.023290798
		0.0
	]
	slope_blend_curve = [
		0.0
		0.25925902
		0.740741
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.97670895
		0.91284794
		0.81743103
		0.699475
		0.567994
		0.432006
		0.300526
		0.18257001
		0.0871526
		0.023290798
		0.0
	]
	balance_blend_time = 1.066
	slope_blend_time = 1.066
	use_anim_length
}
wall_push_bs_data = {
	anim = sk8_manu_agropush_backside_D
	balance_blend_curve = [
		0.0
		0.15625
		0.49999902
		0.84375006
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.987259
		0.95140696
		0.89599997
		0.824593
		0.740741
		0.64800006
		0.54992604
		0.45007402
		0.35200003
		0.25925902
		0.175407
		0.104
		0.0485926
		0.0127407005
		0.0
	]
	slope_blend_curve = [
		0.0
		0.15625
		0.49999902
		0.84375006
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.987259
		0.95140696
		0.89599997
		0.824593
		0.740741
		0.64800006
		0.54992604
		0.45007402
		0.35200003
		0.25925902
		0.175407
		0.104
		0.0485926
		0.0127407005
		0.0
	]
	balance_blend_time = 1.066
	slope_blend_time = 1.066
	use_anim_length
}
wall_push_fs_nose_data = {
	anim = sk8_manu_noseagropush_frontside_D
	balance_blend_curve = [
		0.0
		0.156251
		0.500001
		0.84375006
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.983159
		0.93627685
		0.86481506
		0.7742369
		0.670004
		0.557578
		0.44242102
		0.32999504
		0.225762
		0.13518399
		0.0637232
		0.0168411
		0.0
	]
	slope_blend_curve = [
		0.0
		0.156251
		0.500001
		0.84375006
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.983159
		0.93627685
		0.86481506
		0.7742369
		0.670004
		0.557578
		0.44242102
		0.32999504
		0.225762
		0.13518399
		0.0637232
		0.0168411
		0.0
	]
	balance_blend_time = 1.066
	slope_blend_time = 1.066
	use_anim_length
}
wall_push_bs_nose_data = {
	anim = sk8_manu_noseagropush_backside_D
	balance_blend_curve = [
		0.0
		0.25925902
		0.740741
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.990026
		0.96173394
		0.91756606
		0.859964
		0.7913699
		0.714228
		0.63097894
		0.544067
		0.45593303
		0.36902103
		0.285773
		0.20863
		0.140037
		0.0824344
		0.0382658
		0.00997354
		0.0
	]
	slope_blend_curve = [
		0.0
		0.25925902
		0.740741
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.990026
		0.96173394
		0.91756606
		0.859964
		0.7913699
		0.714228
		0.63097894
		0.544067
		0.45593303
		0.36902103
		0.285773
		0.20863
		0.140037
		0.0824344
		0.0382658
		0.00997354
		0.0
	]
	balance_blend_time = 1.066
	slope_blend_time = 1.066
	use_anim_length
}
Manual_flip_Special_1 = {
	anim = Sk8_Manu_BonelessSpc_D
	balance_blend_curve = [
		0.0
		0.0065867603
		0.0254832
		0.0553936
		0.0950221
		0.14307301
		0.198251
		0.25925902
		0.32480305
		0.39358598
		0.46431303
		0.5356869
		0.606414
		0.675197
		0.740741
		0.801749
		0.856927
		0.9049779
		0.944606
		0.974517
		0.993413
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9910839
		0.965706
		0.92592597
		0.87380004
		0.811385
		0.740741
		0.663923
		0.58298993
		0.5
		0.41701
		0.33607703
		0.25925902
		0.18861501
		0.1262
		0.0740741
		0.034293495
		0.00891633
		0.0
	]
	slope_blend_curve = [
		0.0
		0.0065867603
		0.0254832
		0.0553936
		0.0950221
		0.14307301
		0.198251
		0.25925902
		0.32480305
		0.39358598
		0.46431303
		0.5356869
		0.606414
		0.675197
		0.740741
		0.801749
		0.856927
		0.9049779
		0.944606
		0.974517
		0.993413
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9910839
		0.965706
		0.92592597
		0.87380004
		0.811385
		0.740741
		0.663923
		0.58298993
		0.5
		0.41701
		0.33607703
		0.25925902
		0.18861501
		0.1262
		0.0740741
		0.034293495
		0.00891633
		0.0
	]
	balance_blend_time = 2.1333332
	slope_blend_time = 2.1333332
}
Manual_out_1 = {
	anim = Sk8_Manu_Exit_Manual_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.1
	slope_blend_time = 0.3
	use_anim_length
	boardrotate = 1
}
Manual_out_Pivot = {
	anim = Sk8_Manu_Exit_Manual_P_D
	balance_blend_curve = [
		0.0
		0.0196759
		0.0740741
		0.15625
		0.25925902
		0.37615702
		0.5
		0.623843
		0.740741
		0.84375006
		0.92592597
		0.980324
		1.0
	]
	slope_blend_curve = [
		0.0
		0.0196759
		0.0740741
		0.15625
		0.25925902
		0.37615702
		0.5
		0.623843
		0.740741
		0.84375006
		0.92592597
		0.980324
		1.0
	]
	balance_blend_time = 0.4
	slope_blend_time = 0.4
	use_anim_length
	flipafter
}
Manual_out_To_Nose = {
	anim = Sk8_Manu_Exit_manu_360fgflp_D
	balance_blend_curve = [
		0.0
		0.0232907
		0.087152496
		0.18256901
		0.300526
		0.432006
		0.567994
		0.699474
		0.81743
		0.9128469
		0.97670895
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	slope_blend_curve = [
		0.0
		0.0232907
		0.087152496
		0.18256901
		0.300526
		0.432006
		0.567994
		0.699474
		0.81743
		0.9128469
		0.97670895
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	boardrotate = 1
}
Manual_out_Wallpush = {
	anim = Sk8_Manu_Exit_Manu_WP_D
	balance_blend_curve = [
		0.0
		1.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	flipafter
}
Manual_out_3 = {
	anim = Sk8_Manu_Exit_Manual_3_D
	balance_blend_curve = [
		0.0
		0.0168412
		0.0637234
		0.135185
		0.225763
		0.32999602
		0.442422
		0.55757904
		0.670005
		0.77423793
		0.86481607
		0.93627685
		0.983159
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	slope_blend_curve = [
		0.0
		0.0168412
		0.0637234
		0.135185
		0.225763
		0.32999602
		0.442422
		0.55757904
		0.670005
		0.77423793
		0.86481607
		0.93627685
		0.983159
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Manual_out_7 = {
	anim = Sk8_Manu_Exit_manual_7_D
	balance_blend_curve = [
		0.0
		0.004672
		0.018175999
		0.039744
		0.068608
		0.104
		0.14515199
		0.19129601
		0.241664
		0.29548797
		0.35200003
		0.410432
		0.470016
		0.52998394
		0.589568
		0.64800006
		0.70451206
		0.758336
		0.808704
		0.854848
		0.89599997
		0.93139195
		0.960256
		0.981824
		0.99532795
		1.0
	]
	slope_blend_curve = [
		0.0
		0.004672
		0.018175999
		0.039744
		0.068608
		0.104
		0.14515199
		0.19129601
		0.241664
		0.29548797
		0.35200003
		0.410432
		0.470016
		0.52998394
		0.589568
		0.64800006
		0.70451206
		0.758336
		0.808704
		0.854848
		0.89599997
		0.93139195
		0.960256
		0.981824
		0.99532795
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Manual_out_10 = {
	anim = Sk8_Manu_Exit_manual_10_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Manual_out_Special_1 = {
	anim = Sk8_Manu_Exit_Special_Manual_1_D
	balance_blend_curve = [
		1.0
		1.0
	]
	slope_blend_curve = [
		1.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Manual_out_Special_2 = {
	anim = Sk8_Manu_Exit_Special_Manual_2_D
	balance_blend_curve = [
		0.0
		0.00997355
		0.0382659
		0.0824344
		0.140037
		0.20863
		0.285773
		0.36902103
		0.45593303
		0.544067
		0.63097894
		0.714228
		0.7913699
		0.859963
		0.91756606
		0.96173394
		0.990026
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	slope_blend_curve = [
		0.0
		0.00997355
		0.0382659
		0.0824344
		0.140037
		0.20863
		0.285773
		0.36902103
		0.45593303
		0.544067
		0.63097894
		0.714228
		0.7913699
		0.859963
		0.91756606
		0.96173394
		0.990026
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
NoseManual_out_1 = {
	anim = Sk8_Manu_Exit_NSmanu_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	boardrotate = 1
}
NoseManual_out_9 = {
	anim = Sk8_Manu_Exit_NSmanu_9_D
	balance_blend_curve = [
		0.0
		0.014577299
		0.0553936
		0.118076
		0.198251
		0.29154497
		0.39358598
		0.5
		0.606414
		0.708455
		0.801749
		0.881924
		0.944606
		0.98542297
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	slope_blend_curve = [
		0.0
		0.014577299
		0.0553936
		0.118076
		0.198251
		0.29154497
		0.39358598
		0.5
		0.606414
		0.708455
		0.801749
		0.881924
		0.944606
		0.98542297
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
NoseManual_out_Pivot = {
	anim = Sk8_Manu_Exit_NSmanu_P_D
	balance_blend_curve = [
		0.0
		0.0127407005
		0.0485926
		0.104
		0.175407
		0.25925902
		0.35200003
		0.45007402
		0.54992604
		0.64800006
		0.740741
		0.824593
		0.89599997
		0.95140696
		0.987259
		1.0
	]
	slope_blend_curve = [
		0.0
		0.0127407005
		0.0485926
		0.104
		0.175407
		0.25925902
		0.35200003
		0.45007402
		0.54992604
		0.64800006
		0.740741
		0.824593
		0.89599997
		0.95140696
		0.987259
		1.0
	]
	balance_blend_time = 0.5
	slope_blend_time = 0.5
	use_anim_length
	flipafter
}
NoseManual_out_To_Manual = {
	anim = Sk8_Manu_Exit_NSmanu_A_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
NoseManual_out_Wallpush = {
	anim = Sk8_Manu_Exit_Nose_WP_D
	balance_blend_curve = [
		0.0
		1.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	flipafter
}
AntiCasper_out_1 = {
	anim = Sk8_Manu_Exit_AntiCa_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
AntiCasper_out_8 = {
	anim = Sk8_Manu_Exit_AntiCa_8_D
	balance_blend_curve = [
		0.0
		0.0072500003
		0.027999999
		0.06075
		0.104
		0.15625
		0.216
		0.28175
		0.35200003
		0.42525002
		0.5
		0.57475
		0.64800006
		0.71825
		0.784
		0.84375006
		0.89599997
		0.93924993
		0.97199994
		0.9927499
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	slope_blend_curve = [
		0.0
		0.0072500003
		0.027999999
		0.06075
		0.104
		0.15625
		0.216
		0.28175
		0.35200003
		0.42525002
		0.5
		0.57475
		0.64800006
		0.71825
		0.784
		0.84375006
		0.89599997
		0.93924993
		0.97199994
		0.9927499
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Casper_out_1 = {
	anim = Sk8_Manu_Exit_Casper_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
CrossfootPogo_out_1 = {
	anim = Sk8_Manu_Exit_CFPogo_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
OneFootManual_out_1 = {
	anim = Sk8_Manu_Exit_OFManu_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	boardrotate = 1
}
OneFootNosemanual_out_1 = {
	anim = Sk8_Manu_Exit_OFNMnu_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	boardrotate = 1
}
Pogo_out_1 = {
	anim = Sk8_Manu_Exit_Pogo_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Pogo_out_4 = {
	anim = Sk8_Manu_Exit_Pogo_4_D
	balance_blend_curve = [
		0.0
		0.0127407005
		0.0485926
		0.104
		0.175407
		0.25925902
		0.35200003
		0.45007402
		0.54992604
		0.64800006
		0.740741
		0.824593
		0.89599997
		0.95140696
		0.987259
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	slope_blend_curve = [
		0.0
		0.0127407005
		0.0485926
		0.104
		0.175407
		0.25925902
		0.35200003
		0.45007402
		0.54992604
		0.64800006
		0.740741
		0.824593
		0.89599997
		0.95140696
		0.987259
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	flipafter
}
Pogo_out_12 = {
	anim = Sk8_Manu_Exit_Pogo_12_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Rail_out_1 = {
	anim = Sk8_Manu_Exit_Primo_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Rail_out_10 = {
	anim = Sk8_Manu_Exit_Primo_10_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Spacewalk_out_1 = {
	anim = Sk8_Manu_Exit_Manual_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	boardrotate = 1
}
SwitchFootPogo_out_1 = {
	anim = Sk8_Manu_Exit_SFPogo_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
SwitchFootPogo_out_5 = {
	anim = Sk8_Manu_Exit_SFPogo_5_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
SwitchFootPogo_out_11 = {
	anim = Sk8_Manu_Exit_SFPogo_11_D
	balance_blend_curve = [
		0.0
		0.042968698
		0.15625
		0.316406
		0.5
		0.68359405
		0.84375006
		0.957031
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	slope_blend_curve = [
		0.0
		0.042968698
		0.15625
		0.316406
		0.5
		0.68359405
		0.84375006
		0.957031
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
}
Truckstand_out_1 = {
	anim = Sk8_Manu_Exit_TrckSd_1_D
	balance_blend_curve = [
		0.0
		1.0
	]
	slope_blend_curve = [
		0.0
		1.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	boardrotate = 1
}
Manual_in_1 = {
	anim = Sk8_Manu_Entr_Manual_1_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 35
}
Manual_in_Pivot = {
	anim = Sk8_Manu_Entr_Manual_P_D
	balance_blend_curve = [
		1.0
		0.987259
		0.95140696
		0.89599997
		0.824593
		0.740741
		0.64800006
		0.54992604
		0.45007402
		0.35200003
		0.25925902
		0.175407
		0.104
		0.0485926
		0.0127407005
		0.0
	]
	slope_blend_curve = [
		1.0
		0.987259
		0.95140696
		0.89599997
		0.824593
		0.740741
		0.64800006
		0.54992604
		0.45007402
		0.35200003
		0.25925902
		0.175407
		0.104
		0.0485926
		0.0127407005
		0.0
	]
	balance_blend_time = 0.5
	slope_blend_time = 0.5
	use_anim_length
	min_percent = 30
}
Manual_in_From_Nose = {
	anim = Sk8_Manu_Entr_Manual_A_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 20
}
Manual_in_Wallpush = {
	anim = Sk8_Manu_Entr_Manu_WP_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
NoseManual_in_1 = {
	anim = Sk8_Manu_Entr_Nose_1_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
NoseManual_in_Pivot = {
	anim = Sk8_Manu_Entr_NSManu_P_D
	balance_blend_curve = [
		1.0
		0.99532795
		0.981824
		0.960256
		0.93139195
		0.89599997
		0.854848
		0.808704
		0.758336
		0.70451206
		0.64800006
		0.589568
		0.52998394
		0.470016
		0.410432
		0.35200003
		0.29548797
		0.241664
		0.19129601
		0.14515199
		0.104
		0.068608
		0.039744
		0.018175999
		0.004672
		0.0
	]
	slope_blend_curve = [
		1.0
		0.99532795
		0.981824
		0.960256
		0.93139195
		0.89599997
		0.854848
		0.808704
		0.758336
		0.70451206
		0.64800006
		0.589568
		0.52998394
		0.470016
		0.410432
		0.35200003
		0.29548797
		0.241664
		0.19129601
		0.14515199
		0.104
		0.068608
		0.039744
		0.018175999
		0.004672
		0.0
	]
	balance_blend_time = 0.8333
	slope_blend_time = 0.8333
	use_anim_length
	min_percent = 30
}
NoseManual_in_From_Manual = {
	anim = Sk8_Manu_Entr_NSman_360fgflp_D
	balance_blend_curve = [
		1.0
		0.99783695
		0.99150497
		0.9812349
		0.967263
		0.94982004
		0.929141
		0.905459
		0.879006
		0.850018
		0.81872606
		0.785364
		0.75016505
		0.713364
		0.67519206
		0.635884
		0.5956729
		0.55479205
		0.513474
		0.471953
		0.430462
		0.38923505
		0.348505
		0.308505
		0.269469
		0.231629
		0.195219
		0.160474
		0.127625
		0.0969058
		0.0685506
		0.0427924
		0.019864399
		0.0
	]
	slope_blend_curve = [
		1.0
		0.99783695
		0.99150497
		0.9812349
		0.967263
		0.94982004
		0.929141
		0.905459
		0.879006
		0.850018
		0.81872606
		0.785364
		0.75016505
		0.713364
		0.67519206
		0.635884
		0.5956729
		0.55479205
		0.513474
		0.471953
		0.430462
		0.38923505
		0.348505
		0.308505
		0.269469
		0.231629
		0.195219
		0.160474
		0.127625
		0.0969058
		0.0685506
		0.0427924
		0.019864399
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
NoseManual_in_Wallpush = {
	anim = Sk8_Manu_Entr_Nose_WP_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
AntiCasper_in_1 = {
	anim = Sk8_Manu_Entr_AntiCa_1_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
Casper_in_1 = {
	anim = Sk8_Manu_Entr_Casper_1_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
Casper_in_10 = {
	anim = Sk8_Manu_Entr_Casper_10_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 85
}
Casper_in_Special_1 = {
	anim = Sk8_Manu_Entr_Special_Casper_1_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 85
}
CrossfootPogo_in_1 = {
	anim = Sk8_Manu_Entr_CFPogo_1_D
	balance_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9969449
		0.98805
		0.973717
		0.954349
		0.9303479
		0.90211797
		0.87006104
		0.834581
		0.7960789
		0.75496
		0.71162397
		0.66647696
		0.619919
		0.57235396
		0.524185
		0.47581503
		0.427646
		0.38008103
		0.333524
		0.28837597
		0.24504
		0.203921
		0.165419
		0.129939
		0.0978819
		0.0696519
		0.045651395
		0.0262831
		0.011949901
		0.00305461
		0.0
	]
	slope_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9969449
		0.98805
		0.973717
		0.954349
		0.9303479
		0.90211797
		0.87006104
		0.834581
		0.7960789
		0.75496
		0.71162397
		0.66647696
		0.619919
		0.57235396
		0.524185
		0.47581503
		0.427646
		0.38008103
		0.333524
		0.28837597
		0.24504
		0.203921
		0.165419
		0.129939
		0.0978819
		0.0696519
		0.045651395
		0.0262831
		0.011949901
		0.00305461
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
CrossfootPogo_in_4 = {
	anim = Sk8_Manu_Entr_CFpogo_4_D
	balance_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9959859
		0.984352
		0.965706
		0.940659
		0.90982103
		0.87380004
		0.833206
		0.78865
		0.740741
		0.690088
		0.637301
		0.58298993
		0.52776504
		0.47223502
		0.41701
		0.36269903
		0.30991203
		0.25925902
		0.21135001
		0.16679399
		0.1262
		0.0901793
		0.0593405
		0.034293596
		0.015648
		0.00401362
		0.0
	]
	slope_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.9959859
		0.984352
		0.965706
		0.940659
		0.90982103
		0.87380004
		0.833206
		0.78865
		0.740741
		0.690088
		0.637301
		0.58298993
		0.52776504
		0.47223502
		0.41701
		0.36269903
		0.30991203
		0.25925902
		0.21135001
		0.16679399
		0.1262
		0.0901793
		0.0593405
		0.034293596
		0.015648
		0.00401362
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
OneFootManual_in_1 = {
	anim = Sk8_Manu_Entr_OFManu_1_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
OneFootManual_in_7 = {
	anim = Sk8_Manu_Entr_OFManu_7_D
	balance_blend_curve = [
		1.0
		0.993413
		0.974517
		0.944606
		0.9049779
		0.856927
		0.801749
		0.740741
		0.675197
		0.606414
		0.5356869
		0.46431303
		0.39358598
		0.32480305
		0.25925902
		0.198251
		0.14307301
		0.0950221
		0.0553936
		0.0254832
		0.0065867603
		0.0
	]
	slope_blend_curve = [
		1.0
		0.993413
		0.974517
		0.944606
		0.9049779
		0.856927
		0.801749
		0.740741
		0.675197
		0.606414
		0.5356869
		0.46431303
		0.39358598
		0.32480305
		0.25925902
		0.198251
		0.14307301
		0.0950221
		0.0553936
		0.0254832
		0.0065867603
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 20
}
OneFootNosemanual_in_1 = {
	anim = Sk8_Manu_Entr_OFNMnu_1_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
Pogo_in_1 = {
	anim = Sk8_Manu_Entr_Pogo_1_D
	balance_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.99449295
		0.97863096
		0.953399
		0.91978294
		0.87877
		0.8313469
		0.778499
		0.7212129
		0.660475
		0.59727097
		0.53258795
		0.46741202
		0.402729
		0.339525
		0.278787
		0.221501
		0.16865298
		0.12123001
		0.080217004
		0.046601497
		0.021369299
		0.0055067
		0.0
	]
	slope_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.99449295
		0.97863096
		0.953399
		0.91978294
		0.87877
		0.8313469
		0.778499
		0.7212129
		0.660475
		0.59727097
		0.53258795
		0.46741202
		0.402729
		0.339525
		0.278787
		0.221501
		0.16865298
		0.12123001
		0.080217004
		0.046601497
		0.021369299
		0.0055067
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 60
}
Pogo_in_5 = {
	anim = Sk8_Manu_Entr_Pogo_5_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
Rail_in_1 = {
	anim = Sk8_Manu_Entr_Primo_1_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 1.5
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 45
}
Spacewalk_in_1 = {
	anim = Sk8_Manu_Entr_Manual_1_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
SwitchFootPogo_in_1 = {
	anim = Sk8_Manu_Entr_SFPogo_1_D
	balance_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.99449295
		0.97863096
		0.953399
		0.91978294
		0.87877
		0.8313469
		0.778499
		0.7212129
		0.660475
		0.59727097
		0.53258795
		0.46741202
		0.402729
		0.339525
		0.278787
		0.221501
		0.16865298
		0.12123001
		0.080217004
		0.046601497
		0.021369299
		0.0055067
		0.0
	]
	slope_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.99449295
		0.97863096
		0.953399
		0.91978294
		0.87877
		0.8313469
		0.778499
		0.7212129
		0.660475
		0.59727097
		0.53258795
		0.46741202
		0.402729
		0.339525
		0.278787
		0.221501
		0.16865298
		0.12123001
		0.080217004
		0.046601497
		0.021369299
		0.0055067
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 80
}
SwitchfootPogo_in_3 = {
	anim = Sk8_Manu_Entr_SFpogo_3_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 60
}
SwitchfootPogo_in_8 = {
	anim = Sk8_Manu_Entr_SFpogo_8_D
	balance_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.99674094
		0.987259
		0.97199994
		0.95140696
		0.92592597
		0.89599997
		0.86207396
		0.824593
		0.784
		0.740741
		0.695259
		0.64800006
		0.59940696
		0.54992604
		0.5
		0.45007402
		0.400593
		0.35200003
		0.30474102
		0.25925902
		0.216
		0.175407
		0.137926
		0.104
		0.0740741
		0.0485926
		0.027999999
		0.0127407005
		0.00325926
		0.0
	]
	slope_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.99674094
		0.987259
		0.97199994
		0.95140696
		0.92592597
		0.89599997
		0.86207396
		0.824593
		0.784
		0.740741
		0.695259
		0.64800006
		0.59940696
		0.54992604
		0.5
		0.45007402
		0.400593
		0.35200003
		0.30474102
		0.25925902
		0.216
		0.175407
		0.137926
		0.104
		0.0740741
		0.0485926
		0.027999999
		0.0127407005
		0.00325926
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 75
}
SwitchFootPogo_in_Special_2 = {
	anim = Sk8_Manu_Entr_Special_SFPogo_2_D
	balance_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.997301
		0.989426
		0.97670895
		0.959485
		0.938086
		0.9128469
		0.884103
		0.852186
		0.81743
		0.780171
		0.740741
		0.699474
		0.656705
		0.612767
		0.567994
		0.52272
		0.47728
		0.432006
		0.38723305
		0.343295
		0.300526
		0.25925902
		0.21982901
		0.18256901
		0.14781399
		0.11589701
		0.087152496
		0.061913896
		0.0405153
		0.0232907
		0.0105741
		0.00269916
		0.0
	]
	slope_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.997301
		0.989426
		0.97670895
		0.959485
		0.938086
		0.9128469
		0.884103
		0.852186
		0.81743
		0.780171
		0.740741
		0.699474
		0.656705
		0.612767
		0.567994
		0.52272
		0.47728
		0.432006
		0.38723305
		0.343295
		0.300526
		0.25925902
		0.21982901
		0.18256901
		0.14781399
		0.11589701
		0.087152496
		0.061913896
		0.0405153
		0.0232907
		0.0105741
		0.00269916
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 80
}
Truckstand_in_1 = {
	anim = Sk8_Manu_Entr_TrckSd_1_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 50
}
Truckstand_in_9 = {
	anim = Sk8_Manu_Entr_TrckSd_9_D
	balance_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.996515
		0.9863869
		0.970109
		0.948173
		0.92107093
		0.88929397
		0.85333604
		0.81368697
		0.770839
		0.72528595
		0.6775191
		0.62802905
		0.577309
		0.525852
		0.47414798
		0.42269105
		0.371971
		0.32248104
		0.27471402
		0.22916101
		0.186314
		0.146664
		0.110705994
		0.078929
		0.0518266
		0.029890498
		0.013612699
		0.00348518
		0.0
	]
	slope_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.996515
		0.9863869
		0.970109
		0.948173
		0.92107093
		0.88929397
		0.85333604
		0.81368697
		0.770839
		0.72528595
		0.6775191
		0.62802905
		0.577309
		0.525852
		0.47414798
		0.42269105
		0.371971
		0.32248104
		0.27471402
		0.22916101
		0.186314
		0.146664
		0.110705994
		0.078929
		0.0518266
		0.029890498
		0.013612699
		0.00348518
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
Truckstand_in_11 = {
	anim = Sk8_Manu_Entr_TrckSd_11_D
	balance_blend_curve = [
		1.0
		0.9956069
		0.98264194
		0.961506
		0.9327069
		0.89686203
		0.854689
		0.80700105
		0.754686
		0.698695
		0.64001507
		0.57964796
		0.51859003
		0.45780203
		0.398199
		0.34062502
		0.28585103
		0.23455898
		0.187342
		0.14470299
		0.10706
		0.0747467
		0.0480234
		0.027081499
		0.012052
		0.0030136702
		0.0
	]
	slope_blend_curve = [
		1.0
		0.9956069
		0.98264194
		0.961506
		0.9327069
		0.89686203
		0.854689
		0.80700105
		0.754686
		0.698695
		0.64001507
		0.57964796
		0.51859003
		0.45780203
		0.398199
		0.34062502
		0.28585103
		0.23455898
		0.187342
		0.14470299
		0.10706
		0.0747467
		0.0480234
		0.027081499
		0.012052
		0.0030136702
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
Truckstand_in_12 = {
	anim = Sk8_Manu_Entr_TrckSd_12_D
	balance_blend_curve = [
		1.0
		0.0
	]
	slope_blend_curve = [
		1.0
		0.0
	]
	balance_blend_time = 0.3
	slope_blend_time = 0.3
	use_anim_length
	min_percent = 30
}
