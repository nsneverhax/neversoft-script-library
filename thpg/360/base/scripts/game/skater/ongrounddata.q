ground_speed_threshold = 19.0
ground_turn_in_rate = 0.07
ground_turn_out_rate = 0.07
onground_diff_default_blend = 0.3
onground_blend_array = [
	[
		0.3
		0.4
		0.3
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.4
		0.3
		0.3
	]
	[
		0.3
		0.5
		0.25
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
	]
	[
		0.3
		0.15
		0.3
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
	]
	[
		0.1
		0.1
		0.1
		0.5
		0.1
		0.1
		0.1
		0.3
		0.1
		0.1
		0.1
		0.1
	]
	[
		0.3
		0.3
		0.3
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
	]
	[
		0.3
		0.3
		0.3
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
	]
	[
		0.3
		0.3
		0.3
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
	]
	[
		0.3
		0.3
		0.3
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
	]
	[
		0.3
		0.3
		0.3
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
	]
	[
		0.3
		0.3
		0.3
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
	]
	[
		0.3
		0.3
		0.3
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
	]
	[
		0.3
		0.3
		0.3
		0.5
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
		0.3
	]
]
blend_curve_01 = [
	0
	1
]
blend_curve_001 = [
	0
	0
	1
]
blend_curve_110 = [
	1
	1
	0
]
blend_curve_100 = [
	1
	0
	0
]
blend_curve_011 = [
	0
	1
	1
]
blend_curve_101 = [
	1
	0
	1
]
blend_curve_010 = [
	0
	1
	0
]
OnGround_data = {
	struct = OnGround_data
	blendduration = 0.25
	speed_threshold = $ground_speed_threshold
	base_neutral_fast = Sk8_Gnd_Oll_F_Base_Flat_F
	base_neutral_slow = Sk8_Gnd_Oll_S_Base_Flat_F
	base_slope45_fast = Sk8_Gnd_Oll_F_Base_Slp_45_F
	base_slope45_slow = Sk8_Gnd_Oll_S_Base_Slp_45_F
	base_slope90_fast = Sk8_Gnd_Oll_F_Base_Slp_90_F
	base_slope90_slow = Sk8_Gnd_Oll_S_Base_Slp_90_F
	takeoffground_anim = Ska8_zacs_empty_anim_D
}
land_data = {
	struct = land_data
	flat_fast = Sk8_Gnd_Oll_F_Land_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_Land_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_Land_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_Land_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_Land_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_Land_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_Land_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_Land_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_Land_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_Land_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_Land_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_Land_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_Land_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_Land_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_Land_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_Land_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_Land_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_Land_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_Land_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_Land_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_Land_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_Land_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_Land_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_Land_SlpR_90_D
}
Revert_Data = {
	struct = Revert_Data
	flat_fast = Sk8_Gnd_Oll_F_Revert_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_Revert_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_Revert_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_Revert_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_Revert_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_Revert_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_Revert_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_Revert_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_Revert_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_Revert_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_Revert_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_Revert_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_Revert_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_Revert_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_Revert_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_Revert_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_Revert_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_Revert_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_Revert_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_Revert_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_Revert_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_Revert_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_Revert_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_Revert_SlpR_90_D
}
BSRevert_Data = {
	struct = BSRevert_Data
	flat_fast = Sk8_Gnd_Oll_F_BSRevert_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_BSRevert_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_BSRevert_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_BSRevert_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_BSRevert_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_BSRevert_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_BSRevert_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_BSRevert_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_BSRevert_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_BSRevert_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_BSRevert_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_BSRevert_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_BSRevert_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_BSRevert_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_BSRevert_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_BSRevert_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_BSRevert_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_BSRevert_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_BSRevert_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_BSRevert_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_BSRevert_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_BSRevert_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_BSRevert_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_BSRevert_SlpR_90_D
}
Cess_Data = {
	struct = Cess_Data
	flat_fast = Sk8_Gnd_Oll_F_Cess_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_Cess_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_Cess_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_Cess_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_Cess_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_Cess_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_Cess_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_Cess_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_Cess_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_Cess_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_Cess_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_Cess_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_Cess_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_Cess_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_Cess_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_Cess_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_Cess_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_Cess_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_Cess_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_Cess_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_Cess_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_Cess_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_Cess_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_Cess_SlpR_90_D
}
BSCess_Data = {
	struct = BSCess_Data
	flat_fast = Sk8_Gnd_Oll_F_Cess_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_Cess_Flat_D
	partial_fast = Ska8_zacs_empty_anim_D
	partial_slow = Ska8_zacs_empty_anim_D
	turn_left_fast = Sk8_Gnd_Oll_F_Cess_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_Cess_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_Cess_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_Cess_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_Cess_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_Cess_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_Cess_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_Cess_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_Cess_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_Cess_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_Cess_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_Cess_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_Cess_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_Cess_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_Cess_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_Cess_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_Cess_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_Cess_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_Cess_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_Cess_SlpR_90_D
}
Slope_Turnaround_Data = {
	struct = Slope_Turnaround_Data
	flat_fast = Sk8_Gnd_Oll_S_180_flat_D
	flat_slow = Sk8_Gnd_Oll_S_180_flat_D
	partial_fast = Ska8_zacs_empty_anim_D
	partial_slow = Ska8_zacs_empty_anim_D
	turn_left_fast = Sk8_Gnd_Oll_S_180_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_180_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_S_180_Turn_r_D
	turn_right_slow = Sk8_Gnd_Oll_S_180_Turn_r_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_S_180_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_180_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_S_180_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_180_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_S_180_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_180_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_S_180_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_180_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_S_180_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_180_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_S_180_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_180_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_S_180_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_180_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_S_180_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_180_SlpR_90_D
}
Run_To_Skate_Data = {
	struct = Run_To_Skate_Data
	flat_fast = Sk8_Gnd_Oll_F_RunToSkate_flat_D
	flat_slow = Sk8_Gnd_Oll_S_RunToSkate_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_RunToSkate_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_RunToSkate_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_RunToSkate_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_RunToSkate_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_RunToSkate_Turn_r_D
	turn_right_slow = Sk8_Gnd_Oll_S_RunToSkate_Turn_r_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_RunToSkate_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_RunToSkate_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_S_RunToSkate_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_RunToSkate_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_RunToSkate_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_RunToSkate_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_S_RunToSkate_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_RunToSkate_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_RunToSkate_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_RunToSkate_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_S_RunToSkate_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_RunToSkate_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_RunToSkate_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_RunToSkate_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_S_RunToSkate_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_RunToSkate_SlpR_90_D
}
StoppedOut_Data = {
	struct = StoppedOut_Data
	flat_fast = Sk8_Gnd_oll_S_Stop2Skate_Flat_D
	flat_slow = Sk8_Gnd_oll_S_Stop2Skate_Flat_D
	partial_fast = Ska8_zacs_empty_anim_D
	partial_slow = Ska8_zacs_empty_anim_D
	turn_left_fast = Sk8_Gnd_oll_S_Stop2Skate_Turn_L_D
	turn_left_slow = Sk8_Gnd_oll_S_Stop2Skate_Turn_L_D
	turn_right_fast = Sk8_Gnd_oll_S_Stop2Skate_Turn_R_D
	turn_right_slow = Sk8_Gnd_oll_S_Stop2Skate_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_oll_S_Stop2Skate_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_oll_S_Stop2Skate_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_oll_S_Stop2Skate_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_oll_S_Stop2Skate_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_oll_S_Stop2Skate_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_oll_S_Stop2Skate_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_oll_S_Stop2Skate_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_oll_S_Stop2Skate_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_oll_S_Stop2Skate_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_oll_S_Stop2Skate_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_oll_S_Stop2Skate_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_oll_S_Stop2Skate_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_oll_S_Stop2Skate_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_oll_S_Stop2Skate_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_oll_S_Stop2Skate_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_oll_S_Stop2Skate_SlpR_90_D
}
onground_idle_data = {
	struct = onground_idle_data
	flat_fast = Sk8_Gnd_Oll_F_Idle_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_Idle_Flat_D
	partial_fast = Ska8_zacs_empty_anim_D
	partial_slow = Ska8_zacs_empty_anim_D
	turn_left_fast = Sk8_Gnd_Oll_F_Idle_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_Idle_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_Idle_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_Idle_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_Idle_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_Idle_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_Idle_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_Idle_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_Idle_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_Idle_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_Idle_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_Idle_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_Idle_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_Idle_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_Idle_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_Idle_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_Idle_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_Idle_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_Idle_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_Idle_SlpR_90_D
}
pump_anims = {
	pump_up = sk9_gnd_stnd_PumpUp_D
	pump_down = sk9_gnd_stnd_PumpDown_D
	lean_left = sk9_gnd_stnd_PumpLeft_D
	lean_right = sk9_gnd_stnd_PumpRight_D
}
kick_slow_anims = [
	Sk8_Gnd_Oll_S_KickIn_Flat_D
	Sk8_Gnd_Oll_S_Kick_Flat_D
	Sk8_Gnd_Oll_S_KickRe_Flat_D
	Sk8_Gnd_Oll_S_KickOut_Flat_D
]
kick_fast_anims = [
	Sk8_Gnd_Oll_F_KickIn_Flat_D
	Sk8_Gnd_Oll_F_Kick_Flat_D
	Sk8_Gnd_Oll_F_KickRe_Flat_D
	Sk8_Gnd_Oll_F_KickOut_Flat_D
]
kick_in_data = {
	struct = kick_in_data
	flat_fast = Sk8_Gnd_Oll_F_KickIn_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_KickIn_Flat_D
	partial_fast = sk8_gnd_oll_f_kickin_shared_d
	partial_slow = sk8_gnd_oll_s_kickin_shared_d
	turn_left_fast = Sk8_Gnd_Oll_F_KickIn_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_KickIn_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_KickIn_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_KickIn_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_KickIn_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_KickIn_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_KickIn_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_KickIn_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_KickIn_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_KickIn_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_KickIn_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_KickIn_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_KickIn_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_KickIn_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_KickIn_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_KickIn_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_KickIn_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_KickIn_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_KickIn_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_KickIn_SlpR_90_D
}
kick_push_data = {
	struct = kick_push_data
	flat_fast = Sk8_Gnd_Oll_F_Kick_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_Kick_Flat_D
	partial_fast = sk8_gnd_oll_f_kick_shared_d
	partial_slow = sk8_gnd_oll_s_kick_shared_d
	turn_left_fast = Sk8_Gnd_Oll_F_Kick_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_Kick_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_Kick_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_Kick_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_Kick_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_Kick_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_Kick_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_Kick_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_Kick_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_Kick_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_Kick_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_Kick_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_Kick_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_Kick_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_Kick_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_Kick_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_Kick_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_Kick_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_Kick_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_Kick_SlpR_90_D
}
kick_reset_data = {
	struct = kick_reset_data
	flat_fast = Sk8_Gnd_Oll_F_KickRe_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_KickRe_Flat_D
	partial_fast = sk8_gnd_oll_f_kickre_shared_d
	partial_slow = sk8_gnd_oll_s_kickre_shared_d
	turn_left_fast = Sk8_Gnd_Oll_F_KickRe_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_KickRe_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_KickRe_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_KickRe_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_KickRe_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_KickRe_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_KickRe_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_KickRe_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_KickRe_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_KickRe_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_KickRe_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_KickRe_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_KickRe_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_KickRe_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_KickRe_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_KickRe_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_KickRe_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_KickRe_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_KickRe_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_KickRe_SlpR_90_D
}
kick_out_data = {
	struct = kick_out_data
	flat_fast = Sk8_Gnd_Oll_F_KickOut_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_KickOut_Flat_D
	partial_fast = sk8_gnd_oll_f_kickout_shared_d
	partial_slow = sk8_gnd_oll_s_kickout_shared_d
	turn_left_fast = Sk8_Gnd_Oll_F_KickOut_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_KickOut_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_KickOut_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_KickOut_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_KickOut_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_KickOut_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_KickOut_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_KickOut_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_KickOut_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_KickOut_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_KickOut_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_KickOut_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_KickOut_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_KickOut_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_KickOut_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_KickOut_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_KickOut_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_KickOut_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_KickOut_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_KickOut_SlpR_90_D
}
brake_data = {
	brake_blend_curve = [
		1.0
		0.0
	]
	brake_blend_time = 0.2
	brakeidle_out_time = 0.2
}
brake_slow_anims = [
	Sk8_Gnd_Oll_S_BrakeIn_Flat_D
	Sk8_Gnd_Oll_S_Brake_Flat_D
	Sk8_Gnd_Oll_S_BrakeOut_Flat_D
]
brake_fast_anims = [
	Sk8_Gnd_Oll_F_BrakeIn_Flat_D
	Sk8_Gnd_Oll_F_Brake_Flat_D
	Sk8_Gnd_Oll_F_BrakeOut_Flat_D
]
brake_in_data = {
	struct = brake_in_data
	flat_fast = Sk8_Gnd_Oll_F_BrakeIn_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_BrakeIn_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_BrakeIn_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_BrakeIn_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_BrakeIn_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_BrakeIn_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_BrakeIn_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_BrakeIn_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_BrakeIn_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_BrakeIn_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_BrakeIn_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_BrakeIn_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_BrakeIn_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_BrakeIn_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_BrakeIn_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_BrakeIn_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_BrakeIn_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_BrakeIn_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_BrakeIn_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_BrakeIn_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_BrakeIn_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_BrakeIn_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_BrakeIn_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_BrakeIn_SlpR_90_D
}
brake_idle_data = {
	struct = brake_idle_data
	flat_fast = Sk8_Gnd_Oll_F_Brake_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_Brake_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_Brake_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_Brake_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_Brake_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_Brake_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_Brake_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_Brake_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_Brake_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_Brake_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_Brake_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_Brake_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_Brake_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_Brake_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_Brake_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_Brake_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_Brake_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_Brake_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_Brake_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_Brake_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_Brake_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_Brake_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_Brake_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_Brake_SlpR_90_D
}
brake_out_data = {
	struct = brake_out_data
	flat_fast = Sk8_Gnd_Oll_F_BrakeOut_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_BrakeOut_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_BrakeOut_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_BrakeOut_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_BrakeOut_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_BrakeOut_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_BrakeOut_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_BrakeOut_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_BrakeOut_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_BrakeOut_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_BrakeOut_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_BrakeOut_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_BrakeOut_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_BrakeOut_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_BrakeOut_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_BrakeOut_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_BrakeOut_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_BrakeOut_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_BrakeOut_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_BrakeOut_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_BrakeOut_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_BrakeOut_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_BrakeOut_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_BrakeOut_SlpR_90_D
}
flailleft_data = {
	struct = flailleft_data
	flat_fast = Sk8_Gnd_Oll_F_BSFlail_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_BSFlail_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_BSFlail_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_BSFlail_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_BSFlail_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_BSFlail_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_BSFlail_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_BSFlail_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_BSFlail_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_BSFlail_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_BSFlail_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_BSFlail_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_BSFlail_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_BSFlail_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_BSFlail_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_BSFlail_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_BSFlail_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_BSFlail_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_BSFlail_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_BSFlail_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_BSFlail_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_BSFlail_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_BSFlail_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_BSFlail_SlpR_90_D
}
flailright_data = {
	struct = flailright_data
	flat_fast = Sk8_Gnd_Oll_F_FSFlail_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_FSFlail_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_FSFlail_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_FSFlail_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_FSFlail_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_FSFlail_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_FSFlail_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_FSFlail_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_FSFlail_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_FSFlail_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_FSFlail_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_FSFlail_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_FSFlail_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_FSFlail_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_FSFlail_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_FSFlail_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_FSFlail_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_FSFlail_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_FSFlail_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_FSFlail_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_FSFlail_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_FSFlail_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_FSFlail_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_FSFlail_SlpR_90_D
}
Carve_Data = {
	struct = Carve_Data
	flat_fast = Sk8_Gnd_Oll_F_Carve_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_Carve_Flat_D
	partial_fast = Sk8_Gnd_Oll_F_Carve_Shared_D
	partial_slow = Sk8_Gnd_Oll_S_Carve_Shared_D
	turn_left_fast = Sk8_Gnd_Oll_F_Carve_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_Carve_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_Carve_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_Carve_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_Carve_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_Carve_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_Carve_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_Carve_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_Carve_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_Carve_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_Carve_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_Carve_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_Carve_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_Carve_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_Carve_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_Carve_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_Carve_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_Carve_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_Carve_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_Carve_SlpR_90_D
}
BodyCheck_Basic_Data = {
	struct = BodyCheck_Basic_Data
	flat_fast = Sk8_Gnd_Oll_F_atckbsic_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_atckbsic_Flat_D
	partial_fast = Ska8_zacs_empty_anim_D
	partial_slow = Ska8_zacs_empty_anim_D
	turn_left_fast = Sk8_Gnd_Oll_F_atckbsic_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_atckbsic_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_atckbsic_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_atckbsic_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_atckbsic_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_atckbsic_SlpF_45_D
	slope_forward_fast_90 = Ska8_zacs_empty_anim_D
	slope_forward_slow_90 = Ska8_zacs_empty_anim_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_atckbsic_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_atckbsic_SlpB_45_D
	slope_back_fast_90 = Ska8_zacs_empty_anim_D
	slope_back_slow_90 = Ska8_zacs_empty_anim_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_atckbsic_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_atckbsic_SlpL_45_D
	slope_left_fast_90 = Ska8_zacs_empty_anim_D
	slope_left_slow_90 = Ska8_zacs_empty_anim_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_atckbsic_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_atckbsic_SlpR_45_D
	slope_right_fast_90 = Ska8_zacs_empty_anim_D
	slope_right_slow_90 = Ska8_zacs_empty_anim_D
}
BodyCheck_Charge_Data = {
	struct = BodyCheck_Charge_Data
	flat_fast = Sk8_Gnd_Oll_F_atckchrgd_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_atckchrgd_Flat_D
	partial_fast = Ska8_zacs_empty_anim_D
	partial_slow = Ska8_zacs_empty_anim_D
	turn_left_fast = Sk8_Gnd_Oll_F_atckchrgd_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_atckchrgd_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_atckchrgd_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_atckchrgd_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_atckchrgd_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_atckchrgd_SlpF_45_D
	slope_forward_fast_90 = Ska8_zacs_empty_anim_D
	slope_forward_slow_90 = Ska8_zacs_empty_anim_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_atckchrgd_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_atckchrgd_SlpB_45_D
	slope_back_fast_90 = Ska8_zacs_empty_anim_D
	slope_back_slow_90 = Ska8_zacs_empty_anim_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_atckchrgd_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_atckchrgd_SlpL_45_D
	slope_left_fast_90 = Ska8_zacs_empty_anim_D
	slope_left_slow_90 = Ska8_zacs_empty_anim_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_atckchrgd_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_atckchrgd_SlpR_45_D
	slope_right_fast_90 = Ska8_zacs_empty_anim_D
	slope_right_slow_90 = Ska8_zacs_empty_anim_D
}
BodyCheck_Multi_Data = {
	struct = BodyCheck_Multi_Data
	flat_fast = Sk8_Gnd_Oll_F_atckmltipl_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_atckmltipl_Flat_D
	partial_fast = Ska8_zacs_empty_anim_D
	partial_slow = Ska8_zacs_empty_anim_D
	turn_left_fast = Sk8_Gnd_Oll_F_atckmltipl_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_atckmltipl_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_atckmltipl_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_atckmltipl_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_atckmltipl_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_atckmltipl_SlpF_45_D
	slope_forward_fast_90 = Ska8_zacs_empty_anim_D
	slope_forward_slow_90 = Ska8_zacs_empty_anim_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_atckmltipl_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_atckmltipl_SlpB_45_D
	slope_back_fast_90 = Ska8_zacs_empty_anim_D
	slope_back_slow_90 = Ska8_zacs_empty_anim_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_atckmltipl_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_atckmltipl_SlpL_45_D
	slope_left_fast_90 = Ska8_zacs_empty_anim_D
	slope_left_slow_90 = Ska8_zacs_empty_anim_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_atckmltipl_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_atckmltipl_SlpR_45_D
	slope_right_fast_90 = Ska8_zacs_empty_anim_D
	slope_right_slow_90 = Ska8_zacs_empty_anim_D
}
BodyCheck_MultiCharge_Data = {
	struct = BodyCheck_MultiCharge_Data
	flat_fast = Sk8_Gnd_Oll_F_atckchrgdmltipl_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_atckchrgdmltipl_Flat_D
	partial_fast = Ska8_zacs_empty_anim_D
	partial_slow = Ska8_zacs_empty_anim_D
	turn_left_fast = Sk8_Gnd_Oll_F_atckchrgdmltipl_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_atckchrgdmltipl_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_atckchrgdmltipl_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_atckchrgdmltipl_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_atckchrgdmltipl_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_atckchrgdmltipl_SlpF_45_D
	slope_forward_fast_90 = Ska8_zacs_empty_anim_D
	slope_forward_slow_90 = Ska8_zacs_empty_anim_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_atckchrgdmltipl_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_atckchrgdmltipl_SlpB_45_D
	slope_back_fast_90 = Ska8_zacs_empty_anim_D
	slope_back_slow_90 = Ska8_zacs_empty_anim_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_atckchrgdmltipl_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_atckchrgdmltipl_SlpL_45_D
	slope_left_fast_90 = Ska8_zacs_empty_anim_D
	slope_left_slow_90 = Ska8_zacs_empty_anim_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_atckchrgdmltipl_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_atckchrgdmltipl_SlpR_45_D
	slope_right_fast_90 = Ska8_zacs_empty_anim_D
	slope_right_slow_90 = Ska8_zacs_empty_anim_D
}
NollieOnGround_data = {
	struct = NollieOnGround_data
	blendduration = 0.25
	speed_threshold = $ground_speed_threshold
	base_neutral_fast = Sk8_Gnd_Nol_F_Base_flat_F
	base_neutral_slow = Sk8_Gnd_Nol_S_Base_flat_F
	base_slope45_fast = Sk8_Gnd_Nol_F_Base_Slp_45_F
	base_slope45_slow = Sk8_Gnd_Nol_S_Base_Slp_45_F
	base_slope90_fast = Sk8_Gnd_Nol_F_Base_Slp_90_F
	base_slope90_slow = Sk8_Gnd_Nol_S_Base_Slp_90_F
	takeoffground_anim = Sk8_Ollie_TakeOffGround_TO_D
}
nollie_onground_idle_data = {
	struct = nollie_onground_idle_data
	flat_fast = Sk8_Gnd_Oll_F_Idle_Flat_D
	flat_slow = Sk8_Gnd_Oll_S_Idle_Flat_D
	partial_fast = Ska8_zacs_empty_anim_D
	partial_slow = Ska8_zacs_empty_anim_D
	turn_left_fast = Sk8_Gnd_Oll_F_Idle_Turn_L_D
	turn_left_slow = Sk8_Gnd_Oll_S_Idle_Turn_L_D
	turn_right_fast = Sk8_Gnd_Oll_F_Idle_Turn_R_D
	turn_right_slow = Sk8_Gnd_Oll_S_Idle_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Oll_F_Idle_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Oll_S_Idle_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Oll_F_Idle_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Oll_S_Idle_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Oll_F_Idle_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Oll_S_Idle_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Oll_F_Idle_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Oll_S_Idle_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Oll_F_Idle_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Oll_S_Idle_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Oll_F_Idle_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Oll_S_Idle_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Oll_F_Idle_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Oll_S_Idle_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Oll_F_Idle_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Oll_S_Idle_SlpR_90_D
}
ollie_to_nollie_data = {
	struct = ollie_to_nollie_data
	flat_fast = Sk8_Gnd_Nol_F_Init_Flat_D
	flat_slow = Sk8_Gnd_Nol_S_Init_Flat_D
	partial_fast = Ska8_zacs_empty_anim_D
	partial_slow = Ska8_zacs_empty_anim_D
	turn_left_fast = Sk8_Gnd_Nol_F_Init_Turn_L_D
	turn_left_slow = Sk8_Gnd_Nol_S_Init_Turn_L_D
	turn_right_fast = Sk8_Gnd_Nol_F_Init_Turn_R_D
	turn_right_slow = Sk8_Gnd_Nol_S_Init_Turn_R_D
	slope_forward_fast_45 = Sk8_Gnd_Nol_F_Init_SlpF_45_D
	slope_forward_slow_45 = Sk8_Gnd_Nol_S_Init_SlpF_45_D
	slope_forward_fast_90 = Sk8_Gnd_Nol_F_Init_SlpF_90_D
	slope_forward_slow_90 = Sk8_Gnd_Nol_F_Init_SlpF_90_D
	slope_back_fast_45 = Sk8_Gnd_Nol_F_Init_SlpB_45_D
	slope_back_slow_45 = Sk8_Gnd_Nol_S_Init_SlpB_45_D
	slope_back_fast_90 = Sk8_Gnd_Nol_F_Init_SlpB_90_D
	slope_back_slow_90 = Sk8_Gnd_Nol_F_Init_SlpB_90_D
	slope_left_fast_45 = Sk8_Gnd_Nol_F_Init_SlpL_45_D
	slope_left_slow_45 = Sk8_Gnd_Nol_S_Init_SlpL_45_D
	slope_left_fast_90 = Sk8_Gnd_Nol_F_Init_SlpL_90_D
	slope_left_slow_90 = Sk8_Gnd_Nol_F_Init_SlpL_90_D
	slope_right_fast_45 = Sk8_Gnd_Nol_F_Init_SlpR_45_D
	slope_right_slow_45 = Sk8_Gnd_Nol_S_Init_SlpR_45_D
	slope_right_fast_90 = Sk8_Gnd_Nol_F_Init_SlpR_90_D
	slope_right_slow_90 = Sk8_Gnd_Nol_F_Init_SlpR_90_D
}
