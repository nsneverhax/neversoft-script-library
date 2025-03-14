skateboard_rot_speed_shuffle = 0.7
skateboard_rot_speed_lean = 1.4

script InitDefaultAnimProfiles 
	default_anim_profile = {
		start_walk_blend_in_dur = 0.2
		start_walk_blend_out_dur = 0.2
		start_run_blend_in_dur = 0.2
		start_run_blend_out_dur = 0.2
		stop_walk_blend_in_dur = 0.2
		stop_walk_blend_out_dur = 0.2
		stop_run_blend_in_dur = 0.2
		stop_run_blend_out_dur = 0.2
		walk_run_blend_dur = 0.4
		stop_l_frame_factor = 0.5
		stop_r_frame_factor = 0.0
		Move_Ground_Idle = PedM_Idle02_F
		Move_Ground_Idle_Torso_Neg = PedM_Turn_50_xL_Dx
		Move_Ground_Idle_Torso_Pos = PedM_Turn_50_xR_Dx
		Move_Ground_Idle_Shuffle_Neg_1 = PedM_Turn_30_xLx
		Move_Ground_Idle_Shuffle_Neg_2 = PedM_Turn_90_xLx
		Move_Ground_Idle_Shuffle_Neg_3 = PedM_Turn_150_xLx
		Move_Ground_Idle_Shuffle_Pos_1 = PedM_Turn_30_xRx
		Move_Ground_Idle_Shuffle_Pos_2 = PedM_Turn_90_xRx
		Move_Ground_Idle_Shuffle_Pos_3 = PedM_Turn_150_xRx
		Move_Ground_Walk_F = [PedMGen_Wlk_xSlw_Fdx PedMGen_Wlk01_xSlw_Fdx PedMGen_Wlk02_xSlw_Fdx PedMGen_Wlk03_xSlw_Fdx PedMGen_Wlk04_xSlw_Fdx]
		Move_Ground_Walk_B = PedMGen_Wlk_xSlw_Bx
		Move_Ground_Walk_FL = PedMGen_Wlk_xSlw_FdLx
		Move_Ground_Walk_FR = PedMGen_Wlk_xSlw_FdRx
		Move_Ground_Walk_BL = PedMGen_Wlk_xSlw_BLx
		Move_Ground_Walk_BR = PedMGen_Wlk_xSlw_BRx
		Move_Ground_Walk_Start_F = PedMGen_WlkStr_xSlw_Fdx
		Move_Ground_Walk_Start_B = PedMGen_WlkStr_xSlw_Bx
		Move_Ground_Walk_Start_FL = PedMGen_WlkStr_xSlw_FdLx
		Move_Ground_Walk_Start_FR = PedMGen_WlkStr_xSlw_FdRx
		Move_Ground_Walk_Start_BL = PedMGen_WlkStr_xSlw_BLx
		Move_Ground_Walk_Start_BR = PedMGen_WlkStr_xSlw_BRx
		Move_Ground_Walk_StopL_F = PedMGen_WlkStpLf_xSlw_Fdx
		Move_Ground_Walk_StopL_B = PedMGen_WlkStpLf_xSlw_Bx
		Move_Ground_Walk_StopL_FL = PedMGen_WlkStpLf_xSlw_FdLx
		Move_Ground_Walk_StopL_FR = PedMGen_WlkStpLf_xSlw_FdRx
		Move_Ground_Walk_StopL_BL = PedMGen_WlkStpLf_xSlw_BLx
		Move_Ground_Walk_StopL_BR = PedMGen_WlkStpLf_xSlw_BRx
		Move_Ground_Walk_StopR_F = PedMGen_WlkStpRf_xSlw_Fdx
		Move_Ground_Walk_StopR_B = PedMGen_WlkStpRf_xSlw_Bx
		Move_Ground_Walk_StopR_FL = PedMGen_WlkStpRf_xSlw_FdLx
		Move_Ground_Walk_StopR_FR = PedMGen_WlkStpRf_xSlw_FdRx
		Move_Ground_Walk_StopR_BL = PedMGen_WlkStpRf_xSlw_BLx
		Move_Ground_Walk_StopR_BR = PedMGen_WlkStpRf_xSlw_BRx
		Move_Ground_Run_F = PedM_Run_xFst_Fdx
		Move_Ground_Run_B = PedM_Run_xFst_Bx
		Move_Ground_Run_FL = PedM_Run_xFst_FdLx
		Move_Ground_Run_FR = PedM_Run_xFst_FdRx
		Move_Ground_Run_BL = PedM_Run_xFst_BLx
		Move_Ground_Run_BR = PedM_Run_xFst_BRx
		Move_Ground_Run_Start_F = PedM_RunStr_xFst_Fdx
		Move_Ground_Run_Start_B = PedM_RunStr_xFst_Bx
		Move_Ground_Run_Start_FL = PedM_RunStr_xFst_FdLx
		Move_Ground_Run_Start_FR = PedM_RunStr_xFst_FdRx
		Move_Ground_Run_Start_BL = PedM_RunStr_xFst_BLx
		Move_Ground_Run_Start_BR = PedM_RunStr_xFst_BRx
		Move_Ground_Run_StopL_F = PedM_RunStpLf_xFst_Fdx
		Move_Ground_Run_StopL_B = PedM_RunStpLf_xFst_Bx
		Move_Ground_Run_StopL_FL = PedM_RunStpLf_xFst_FdLx
		Move_Ground_Run_StopL_FR = PedM_RunStpLf_xFst_FdRx
		Move_Ground_Run_StopL_BL = PedM_RunStpLf_xFst_BLx
		Move_Ground_Run_StopL_BR = PedM_RunStpLf_xFst_BRx
		Move_Ground_Run_StopR_F = PedM_RunStpRf_xFst_Fdx
		Move_Ground_Run_StopR_B = PedM_RunStpRf_xFst_Bx
		Move_Ground_Run_StopR_FL = PedM_RunStpRf_xFst_FdLx
		Move_Ground_Run_StopR_FR = PedM_RunStpRf_xFst_FdRx
		Move_Ground_Run_StopR_BL = PedM_RunStpRf_xFst_BLx
		Move_Ground_Run_StopR_BR = PedM_RunStpRf_xFst_BRx
		Move_Skateboard_Stopped = PedMsk8_gnd_Stop_base_F
		Move_Skateboard_Shuffle_Pos = PedMSk8_Gnd_Stop_Turn_L_F
		Move_Skateboard_Shuffle_Neg = PedMSk8_Gnd_Stop_Turn_R_F
		Rot_Speed_Skateboard_Shuffle = $skateboard_rot_speed_shuffle
		Move_Skateboard_Idle_Stand = [PedMSk8_Idle PedMSk8_Idle]
		Move_Skateboard_Idle_Crouch = PedMSk8_CrouchIdle
		Move_Skateboard_Stand_To_Crouch = PedMSk8_Crouch
		Move_Skateboard_Crouch_To_Stand = PedMSk8_CrouchIdleToIdle
		Move_Skateboard_LeanBack = pedmsk8_leanback
		Move_Skateboard_LeanIn = pedmsk8_leanin
		Rot_Speed_Skateboard_Lean = $skateboard_rot_speed_lean
		Move_Skateboard_PushInit = PedMSk8_PushINIT
		Move_Skateboard_PushCycle = PedMSk8_PushCycle
		Move_Skateboard_PushOut = PedMSk8_PushOut
		Enter_Skateboard_Item_Start = pedmsk8_onboard01a
		Enter_Skateboard_Item_Finish = pedmsk8_onboard01b
		Exit_Skateboard_Item_Start = pedmsk8_offboard01a
		Exit_Skateboard_Item_Finish = pedmsk8_offboard01b
		Move_NoItem_Land_Stand_Stop_Hor = PedM_Idle02_F
		Move_NoItem_Land_Stand_Run_Hor = PedM_Idle02_F
		Move_NoItem_Air_Stand_Hor = PedM_Idle02_F
		Use_Fist_1 = PedM_Gen_Punch01_F
		Dive_Attack = [PedM_Dive_F]
		Get_Attention_Far = [PedM_FarAttention01_P
			PedM_FarAttention02_P
			PedM_FarAttention03_P]
		Get_Attention_Close = [PedM_MedAttention01_P
			PedM_MedAttention02_P]
		Get_Attention_Idle = [PedM_Idle02_P]
		cheer = [PedM_Cheer01_P
			PedM_Cheer03_P
			PedM_Clap01_P
			PedM_Clap02_P
			PedM_Clap03_P
			PedM_Clap04_P]
		Full_Cheer = [PedM_Cheer05_F
			PedM_Cheer06_F
			PedM_DP_Cheer01_F
			PedM_DP_Cheer02_F
			PedM_DP_Cheer03_F
			PedM_DP_Cheer04_F]
		Cheerleader_Cheers = [
			PedFCheerleader_Idle02_04_F
			PedFCheerleader_Idle02_06_F
			PedFCheerleader_Idle02_07_F
			PedFCheerleader_Idle02_08_F]
		Jeer = [PedM_Disappointed01_P
			PedM_Disappointed02_P
			PedM_Disappointed03_P
			PedM_Disappointed04_P
			PedM_Disappointed05_P
			PedM_Disappointed07_P
			PedM_DP_Jeer03_F
			PedM_Jeer01_F
			PedM_Jeer02_F]
		Looking = [PedM_Looking01_F
			PedM_Looking02_F
			PedM_Looking03_F]
		talk = [PedM_NS_Talk01_F
			PedM_NS_Talk02_F
			PedM_NS_Talk03_F
			PedM_NS_Talk04_F
			PedM_NS_Talk05_F]
		Bumped_Small_F = PedM_BumpForward_F
		Bumped_Small_B = PedM_BumpBack_F
		Bumped_Small_L = PedM_BumpLeft_F
		Bumped_Small_R = PedM_BumpRight_F
		Bumped_Big_F = PedM_BigBumpForward_F
		Bumped_Big_B = PedM_BigBumpBack_F
		Bumped_Big_L = PedM_BigBumpLeft_F
		Bumped_Big_R = PedM_BigBumpRight_F
		Bumped_KnockDown_F = [PedM_FallForward01a_F]
		Bumped_KnockDown_B = [PedM_FallBack01a_F]
		Bumped_KnockDown_L = [PedM_FallLeft01a_F]
		Bumped_KnockDown_R = [PedM_FallRight01a_F]
		Normal_Dodge_Left = [PedM_DodgeLeft_F PedM_DodgeLeft01_F]
		Normal_Dodge_Right = [PedM_DodgeRight_F PedM_DodgeRight01_F]
		WallLean_Dodge_Left = [PedM_WallLean_DodgeLeft_F]
		WallLean_Dodge_Right = [PedM_WallLean_DodgeRight_F]
		Bumped_KnockDown_WallLean_F = [PedM_GPed_FallForward01a_F]
		Bumped_KnockDown_WallLean_B = [PedM_GPed_FallForward01a_F]
		Bumped_KnockDown_WallLean_L = [PedM_GPed_FallForward01a_F]
		Bumped_KnockDown_WallLean_R = [PedM_GPed_FallForward01a_F]
		FrontLean_Dodge_Left = [PedM_FrntLean_DodgeLeft_F]
		FrontLean_Dodge_Right = [PedM_FrntLean_DodgeRight_F]
		FrontLean_Dodge_Back = [PedM_FrntLean_Dodge01_F]
		Bumped_KnockDown_FrontLean_F = [PedM_GPed_FallBack01a_F]
		Bumped_KnockDown_FrontLean_B = [PedM_GPed_FallBack01a_F]
		Bumped_KnockDown_FrontLean_L = [PedM_GPed_FallBack01a_F]
		Bumped_KnockDown_FrontLean_R = [PedM_GPed_FallBack01a_F]
		BenchSit_Dodge_Left = [PedM_Sit_DodgeLeft01_F PedM_Sit_DodgeLeft02_F]
		BenchSit_Dodge_Right = [PedM_Sit_DodgeRight01_F PedM_Sit_DodgeRight02_F]
		BenchSit_Dodge_Front = [PedM_Sit_DodgeDuck_F]
		Bumped_KnockDown_BenchSit_F = [PedM_Sit_FallBack_F PedM_Sit_FallForward_F]
		Bumped_KnockDown_BenchSit_B = [PedM_Sit_FallBack_F PedM_Sit_FallForward_F]
		Bumped_KnockDown_BenchSit_L = [PedM_Sit_FallLeft_F]
		Bumped_KnockDown_BenchSit_R = [PedM_Sit_FallRight_F]
		FloorSit_Dodge_Left = [PedM_FloorSit_DodgeLeft_F]
		FloorSit_Dodge_Right = [PedM_FloorSit_DodgeRight_F]
		Bumped_KnockDown_FloorSit_F = [PedM_FloorSit_FallLeft_F PedM_FloorSit_FallRight_F]
		Bumped_KnockDown_FloorSit_B = [PedM_FloorSit_FallLeft_F PedM_FloorSit_FallRight_F]
		Bumped_KnockDown_FloorSit_L = [PedM_FloorSit_FallLeft_F]
		Bumped_KnockDown_FloorSit_R = [PedM_FloorSit_FallRight_F]
		Kneel_Dodge_Left = [PedM_Kneel_DodgeLeft_F]
		Kneel_Dodge_Right = [PedM_Kneel_DodgeRight_F]
		Kneel_Dodge_Front = [PedM_Kneel_DodgeDuck_F]
		Kneel_Dodge_Back = [PedM_Kneel_DodgeDuck_F]
		Bumped_KnockDown_Kneel_F = [PedM_Kneel_FallForward01_F PedM_Kneel_FallForward02_F]
		Bumped_KnockDown_Kneel_B = [PedM_Kneel_FallForward01_F PedM_Kneel_FallForward02_F]
		Bumped_KnockDown_Kneel_L = [PedM_Kneel_FallForward01_F PedM_Kneel_FallForward02_F]
		Bumped_KnockDown_Kneel_R = [PedM_Kneel_FallForward01_F PedM_Kneel_FallForward02_F]
		HighLedge_Dodge_Left = [PedM_StndLdg_DodgeLeft_F]
		HighLedge_Dodge_Right = [PedM_StndLdg_DodgeRight_F]
		HighLedge_Dodge_Back = [PedM_StndLdg_DodgeBack_F]
		Bumped_KnockDown_HighLedge_F = [PedM_StndLdg_FallBack01_F PedM_StndLdg_FallBack02_F]
		Bumped_KnockDown_HighLedge_B = [PedM_StndLdg_FallBack01_F PedM_StndLdg_FallBack02_F]
		Bumped_KnockDown_HighLedge_L = [PedM_StndLdg_FallBack01_F PedM_StndLdg_FallBack02_F]
		Bumped_KnockDown_HighLedge_R = [PedM_StndLdg_FallBack01_F PedM_StndLdg_FallBack02_F]
		RegLedge_Dodge_Left = [PedM_RegLdg_DodgeLeft_F]
		RegLedge_Dodge_Right = [PedM_RegLdg_DodgeRight_F]
		RegLedge_Dodge_Front = [PedM_RegLdg_DodgeDuck_F]
		Bumped_KnockDown_RegLedge_F = [PedM_RegLdg_FallForward01_F PedM_RegLdg_FallForward02_F]
		Bumped_KnockDown_RegLedge_B = [PedM_RegLdg_FallForward01_F PedM_RegLdg_FallForward02_F]
		Bumped_KnockDown_RegLedge_L = [PedM_RegLdg_FallForward01_F PedM_RegLdg_FallForward02_F]
		Bumped_KnockDown_RegLedge_R = [PedM_RegLdg_FallForward01_F PedM_RegLdg_FallForward02_F]
		Bumped_KnockDown_PedSkater_F = [PedM_FallForward01a_F]
		Bumped_KnockDown_PedSkater_B = [PedM_FallBack01a_F]
		Bumped_KnockDown_PedSkater_L = [PedM_FallLeft01a_F]
		Bumped_KnockDown_PedSkater_R = [PedM_FallRight01a_F]
		Bumped_KnockDown_DPSk8r_F = [PedM_GPed_FallForward01a_F PedM_GPed_Knockdown01_F]
		Bumped_KnockDown_DPSk8r_B = [PedM_GPed_FallBack01a_F PedM_GPed_Knockdown02_F]
		Bumped_KnockDown_DPSk8r_L = [PedM_GPed_FallLeft01a_F PedM_GPed_Knockdown01_F]
		Bumped_KnockDown_DPSk8r_R = [PedM_GPed_FallRight01a_F PedM_GPed_Knockdown02_F]
		Dummy_Bumped_Small_FloorSit_F = [PedM_DM_FSit_BumpLeft_F PedM_DM_FSit_BumpRight_F]
		Dummy_Bumped_Small_FloorSit_B = [PedM_DM_FSit_BumpLeft_F PedM_DM_FSit_BumpRight01_F]
		Dummy_Bumped_Small_FloorSit_L = [PedM_DM_FSit_BumpLeft_F]
		Dummy_Bumped_Small_FloorSit_R = [PedM_DM_FSit_BumpRight_F]
		Dummy_Bumped_Big_FloorSit_F = [PedM_DM_FSit_BumpLeft_F PedM_DM_FSit_BumpRight_F]
		Dummy_Bumped_Big_FloorSit_B = [PedM_DM_FSit_BumpLeft_F PedM_DM_FSit_BumpRight01_F]
		Dummy_Bumped_Big_FloorSit_L = [PedM_DM_FSit_BumpLeft_F]
		Dummy_Bumped_Big_FloorSit_R = [PedM_DM_FSit_BumpRight01_F]
		Dummy_Bumped_KnockDown_FloorSit_F = [PedM_DM_FSit_FallLeft_F PedM_DM_FSit_FallRight_F]
		Dummy_Bumped_KnockDown_FloorSit_B = [PedM_DM_FSit_FallLeft_F PedM_DM_FSit_FallRight_F]
		Dummy_Bumped_KnockDown_FloorSit_L = [PedM_DM_FSit_FallLeft_F]
		Dummy_Bumped_KnockDown_FloorSit_R = [PedM_DM_FSit_FallRight_F]
		Dummy_Bumped_KnockDown_F = [PedM_GPed_FallForward01a_F PedM_DM_KnockDownL01_F]
		Dummy_Bumped_KnockDown_B = [PedM_GPed_FallBack01a_F PedM_DM_KnockDownR01_F]
		Dummy_Bumped_KnockDown_L = [PedM_DM_KnockDownL_F PedM_DM_KnockDownL01_F PedM_GPed_FallLeft01a_F]
		Dummy_Bumped_KnockDown_R = [PedM_DM_KnockDownR_F PedM_DM_KnockDownR01_F PedM_GPed_FallRight01a_F]
		Dummy_Bumped_Small_BenchSit_F = [PedM_DM_BSit_SBumpL_F PedM_DM_BSit_SBumpR01_F]
		Dummy_Bumped_Small_BenchSit_B = [PedM_DM_BSit_SBumpL_F PedM_DM_BSit_SBumpR01_F]
		Dummy_Bumped_Small_BenchSit_L = [PedM_DM_BSit_SBumpL_F]
		Dummy_Bumped_Small_BenchSit_R = [PedM_DM_BSit_SBumpR01_F]
		Dummy_Bumped_Big_BenchSit_F = [PedM_DM_BSit_SBumpL_F PedM_DM_BSit_SBumpR01_F]
		Dummy_Bumped_Big_BenchSit_B = [PedM_DM_BSit_SBumpL_F PedM_DM_BSit_SBumpR01_F]
		Dummy_Bumped_Big_BenchSit_L = [PedM_DM_BSit_SBumpL_F]
		Dummy_Bumped_Big_BenchSit_R = [PedM_DM_BSit_SBumpR01_F]
		Dummy_Bumped_KnockDown_BenchSit_F = [PedM_DM_BSit_FallLeft_F PedM_DM_BSit_FallRight_F]
		Dummy_Bumped_KnockDown_BenchSit_B = [PedM_DM_BSit_FallLeft_F PedM_DM_BSit_FallRight_F]
		Dummy_Bumped_KnockDown_BenchSit_L = [PedM_DM_BSit_FallLeft_F]
		Dummy_Bumped_KnockDown_BenchSit_R = [PedM_DM_BSit_FallRight_F]
		Dummy_Bumped_Small_FloorSit02_F = [PedM_DM_FSit02_BumpL_F PedM_DM_FSit02_BumpR_F]
		Dummy_Bumped_Small_FloorSit02_B = [PedM_DM_FSit02_BumpL_F PedM_DM_FSit02_BumpR_F]
		Dummy_Bumped_Small_FloorSit02_L = [PedM_DM_FSit02_BumpL_F]
		Dummy_Bumped_Small_FloorSit02_R = [PedM_DM_FSit02_BumpR_F]
		Dummy_Bumped_Big_FloorSit02_F = [PedM_DM_FSit02_BumpL_F PedM_DM_FSit02_BumpR_F]
		Dummy_Bumped_Big_FloorSit02_B = [PedM_DM_FSit02_BumpL_F PedM_DM_FSit02_BumpR_F]
		Dummy_Bumped_Big_FloorSit02_L = [PedM_DM_FSit02_BumpL_F]
		Dummy_Bumped_Big_FloorSit02_R = [PedM_DM_FSit02_BumpR_F]
		Dummy_Bumped_KnockDown_FloorSit02_F = [PedM_DM_FSit02_FallLeft_F PedM_DM_FSit02_FallRight_F]
		Dummy_Bumped_KnockDown_FloorSit02_B = [PedM_DM_FSit02_FallLeft_F PedM_DM_FSit02_FallRight_F]
		Dummy_Bumped_KnockDown_FloorSit02_L = [PedM_DM_FSit02_FallLeft_F]
		Dummy_Bumped_KnockDown_FloorSit02_R = [PedM_DM_FSit02_FallRight_F]
		Dummy_Bumped_Small_FloorLie_F = [PedM_DM_FLie_Bump_F]
		Dummy_Bumped_Small_FloorLie_B = [PedM_DM_FLie_Bump_F]
		Dummy_Bumped_Small_FloorLie_L = [PedM_DM_FLie_BumpLeft_F]
		Dummy_Bumped_Small_FloorLie_R = [PedM_DM_FLie_BumpRight_F]
		Dummy_Bumped_Big_FloorLie_F = [PedM_DM_FLie_Bump_F]
		Dummy_Bumped_Big_FloorLie_B = [PedM_DM_FLie_Bump_F]
		Dummy_Bumped_Big_FloorLie_L = [PedM_DM_FLie_BumpLeft_F]
		Dummy_Bumped_Big_FloorLie_R = [PedM_DM_FLie_BumpRight_F]
		Dummy_Bumped_KnockDown_FloorLie_F = [PedM_DM_FLie_Bump_F PedM_DM_FLie_BumpLeft_F]
		Dummy_Bumped_KnockDown_FloorLie_B = [PedM_DM_FLie_Bump_F PedM_DM_FLie_BumpRight_F]
		Dummy_Bumped_KnockDown_FloorLie_L = [PedM_DM_FLie_BumpLeft_F]
		Dummy_Bumped_KnockDown_FloorLie_R = [PedM_DM_FLie_BumpRight_F]
		angry = [PedM_Disappointed06_F
			PedM_Disappointed07_P]
		Impatient_Idle = [PedM_Idle02_P]
		Impatient_Talk = [PedM_Disappointed07_P]
		Annoyed = [PedM_PissedOff01_F PedM_PissedOff02_F PedM_PissedOff03_F PedM_PissedOff04_F]
		Attack_FirstSuccess = [PedM_GangstaTaunt01_F PedM_GangstaTaunt02_F]
		Attack_Success = [PedM_GangstaTaunt01_F]
		Lost_Attack = [PedM_GangstaShout01_F PedM_GangstaShout02_F]
		Ollie_Prepare = PedMSk8_OllieINIT
		ollie = PedMSk8_Ollie
		Ollie_Idle = PedMSk8_landairidle
		Ollie_Land = PedMSk8_LandHard
		fliptrick = [PedMSk8_KickFlip
			PedMSk8_360KickFlip
			PedMSk8_heelflip
		]
	}
	RegisterDefaultAnimProfile profile = <default_anim_profile> profile_fast
endscript
skateboard_anim_profile = {
	Move_Ground_Shuffle_Pos = PedMSk8_Gnd_Stop_Turn_L_F_B
	Move_Ground_Shuffle_Neg = PedMSk8_Gnd_Stop_Turn_R_F_B
	Move_Ground_Stopped = PedMsk8_gnd_Stop_base_F_B
	Rot_Speed_Ground_Shuffle = $skateboard_rot_speed_shuffle
	Move_Ground_LeanBack = pedmsk8_leanback_B
	Move_Ground_LeanIn = pedmsk8_leanin_B
	Move_Ground_Idle = PedMSk8_Idle_B
	Rot_Speed_Ground_Lean = $skateboard_rot_speed_lean
}
Cam_anim_profile = {
}
Businessmen_anim_profile = {
	Move_Ground_Idle = PedMSk8_MainIdle01
	Move_Ground_Walk_F = PedMGen_Wlk_xSlw_Fdx
}
MrSkater01_anim_profile = {
	Move_Skateboard_Idle_Stand = PedMSk8_MainIdle01
	Move_Ground_Idle = PedMSk8_MainIdle01_B
}
MrSkater02_anim_profile = {
	Move_Skateboard_Idle_Stand = PedMSk8_MainIdle02
	Move_Ground_Idle = PedMSk8_MainIdle02_B
}
MrSkater03_anim_profile = {
	Move_Skateboard_Idle_Stand = PedMSk8_MainIdle03
	Move_Ground_Idle = PedMSk8_MainIdle03_B
}
TheGuard01_anim_profile = {
	Move_Ground_Walk_F = PedMGen_Wlk_xSlw_Fdx
	Move_Ground_Run_F = PedM_Run01_xFst_Fdx
}
TheGuard02_anim_profile = {
	Move_Ground_Walk_F = PedMGen_Wlk_xSlw_Fdx
	Move_Ground_Run_F = PedM_Run01_xFst_Fdx
}
TheGuard03_anim_profile = {
	Move_Ground_Walk_F = PedMGen_Wlk_xSlw_Fdx
	Move_Ground_Run_F = PedM_Run01_xFst_Fdx
}
Businessmen_anim_profile01 = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = PedMGen_Wlk01_xSlw_Fdx
}
Businessmen_anim_profile02 = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = PedMGen_Wlk02_xSlw_Fdx
}
Bum_human_anim_profile = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = [
		PedMBum_Walk_F
	]
	Move_Ground_Run_F = PedM_Run01_xFst_Fdx
}
Bum01_human_anim_profile = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = [
		PedMBum_Walk_F
	]
}
Gangster_anim_profile = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = [
		PedMGangster_Walk_F
	]
}
Gangster01_anim_profile = {
	Move_Ground_Idle = PedM_GangstaIdle01_F
	Move_Ground_Walk_F = PedMGen_Wlk_xSlw_Fdx
	Attack_Success = PedM_GangstaTaunt01_F
	Lost_Attack = [
		PedM_GangstaShout01_F
	]
	Move_Ground_Run_F = PedM_Run01_xFst_Fdx
}
Gangster02_anim_profile = {
	Move_Ground_Idle = PedM_GangstaIdle02_F
	Move_Ground_Walk_F = PedMGen_Wlk_xSlw_Fdx
	Attack_Success = PedM_GangstaTaunt02_F
	Lost_Attack = [
		PedM_GangstaShout02_F
	]
	Move_Ground_Run_F = PedM_Run01_xFst_Fdx
}
Female_anim_profile = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = [
		PedMGen_Wlk_xSlw_Fdx
		PedMGen_Wlk03_xSlw_Fdx
	]
}
DrunkBum_human_anim_profile = {
	Move_Ground_Idle = PedMDrunk_Idle_F
	Move_Ground_Walk_F = [
		PedMDrunk_Wlk_xSlw_Fdx
		PedMDrunk_Wlk02_xSlw_Fdx
		PedMDrunk_Wlk01_xSlw_Fdx
	]
}
SkaterKids_anim_profile = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = [
		PedMGen_Wlk_xSlw_Fdx
		PedMGen_Wlk01_xSlw_Fdx
		PedMGen_Wlk02_xSlw_Fdx
		PedMGen_Wlk03_xSlw_Fdx
	]
}
Kid_anim_profile = {
	Move_Ground_Idle = PedMKid_Idle_F
	Move_Ground_Walk_F = PedMGen_Wlk_xSlw_Fdx
}
Kid_anim_profile01 = {
	Move_Ground_Idle = PedMKid_Idle_F
	Move_Ground_Walk_F = PedMGen_Wlk01_xSlw_Fdx
}
Kid_anim_profile02 = {
	Move_Ground_Idle = PedMKid_Idle_F
	Move_Ground_Walk_F = PedMGen_Wlk02_xSlw_Fdx
}
Mascot_anim_profile = {
	Move_NoItem_Idle = PedMmascot_idl_jmpse
}
Lesbian01_anim_profile = {
	Move_Ground_Idle = PedF_01_Idle_F
	Move_Ground_Walk_F = [
		PedF_Walk01_F
		PedF_Walk03_F
		PedF_Walk02_F
	]
	Bumped_Small_F = PedF_01_BumpForward_F
	Bumped_Small_B = PedF_01_BumpBack_F
	Bumped_Small_L = PedF_01_BumpLeft_F
	Bumped_Small_R = PedF_01_BumpRight_F
	Bumped_Big_F = PedF_01_BigBumpForward_F
	Bumped_Big_B = PedF_01_BigBumpBack_F
	Bumped_Big_L = PedF_01_BigBumpLeft_F
	Bumped_Big_R = PedF_01_BigBumpRight_F
	Bumped_KnockDown_F = [
		PedM_FallForward01a_F
	]
	Bumped_KnockDown_B = [
		PedM_FallBack01a_F
	]
	Bumped_KnockDown_L = [
		PedM_FallLeft01a_F
	]
	Bumped_KnockDown_R = [
		PedM_FallRight01a_F
	]
}
Sk8rTest_anim_profile = {
	Move_NoItem_Walk_F = PedMSk8_Sk8IdleTest_F
}
Cop_anim_profile = {
	Move_Ground_Idle = PedMCop_Idle_F
	Move_Ground_Walk_F = PedMCop_Wlk_xSlw_Fdx
	Move_Ground_Run_F = [
		PedMCop_Run01_xFst_Fdx
		PedMCop_Run02_xFst_Fdx
	]
}
Cop_anim_profile01 = {
	Move_Ground_Idle = PedMCop_Idle_F
	Move_Ground_Walk_F = PedMCop_Wlk01_xSlw_Fdx
	Move_Ground_Run_F = [
		PedMCop_Run01_xFst_Fdx
		PedMCop_Run02_xFst_Fdx
	]
}
Cop_anim_profile02 = {
	Move_Ground_Idle = PedMCop_Idle_F
	Move_Ground_Walk_F = PedMCop_Wlk02_xSlw_Fdx
	Move_Ground_Run_F = [
		PedMCop_Run01_xFst_Fdx
		PedMCop_Run02_xFst_Fdx
	]
}
Colonel_anim_profile = {
	Move_Ground_Idle = PedMColonel_Idle_F
	Move_Ground_Walk_F = PedMColonel_Wlk_xSlw_Fdx
}
Cheerleader_anim_profile = {
	Move_Ground_Idle = PedF_01_Idle_F
	Move_Ground_Walk_F = PedFCheerleader_Wlk_xSlw_Fdx
}
Tourist_anim_profile = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = PedMGen_Wlk_xSlw_Fdx
}
Tourist_anim_profile01 = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = PedMGen_Wlk01_xSlw_Fdx
}
Tourist_anim_profile02 = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = PedMGen_Wlk03_xSlw_Fdx
}
Tourist_anim_profile03 = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = PedMGen_Wlk04_xSlw_Fdx
}
TouristF_anim_profile = {
	Move_Ground_Idle = PedF_01_Idle_F
	Move_Ground_Walk_F = [
		PedF_Walk01_F
		PedF_Walk02_F
		PedF_Walk03_F
	]
}
FactoryWorker_anim_profile = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = PedMGen_Wlk_xSlw_Fdx
}
FactoryWorker_anim_profile01 = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = PedMGen_Wlk01_xSlw_Fdx
}
FactoryWorker_anim_profile02 = {
	Move_Ground_Idle = pedm_idle00_f
	Move_Ground_Walk_F = PedMGen_Wlk02_xSlw_Fdx
}
FilmerPed_anim_profile = {
	Move_Skateboard_Idle_Stand = PedMFilmer_Idle_F
	Move_Skateboard_LeanBack = PedMFilmer_LeanBack_F
	Move_Skateboard_LeanIn = PedMFilmer_LeanIn_F
	Move_Skateboard_PushInit = PedMFilmer_PushINIT_F
	Move_Skateboard_PushCycle = PedMFilmer_PushCycle_F
	Move_Skateboard_PushOut = PedMFilmer_PushOut_F
}
Guard_anim_profile = {
	Move_Ground_Walk_F = PedMGen_Wlk_xSlw_Fdx
}
gped_anim_profile = {
	Bumped_Small_F = gped_bigbumpforward_f
	Bumped_Small_B = gped_bigbumpback_f
	Bumped_Small_L = gped_bigbumpleft_f
	Bumped_Small_R = gped_bigbumpright_f
	Bumped_Big_F = gped_bigbumpforward_f
	Bumped_Big_B = gped_bigbumpback_f
	Bumped_Big_L = gped_bigbumpleft_f
	Bumped_Big_R = gped_bigbumpright_f
	Bumped_KnockDown_F = [
		PedM_GPed_FallForward01a_F
		PedM_GPed_Knockdown01_F
		PedM_GPed_Knockdown02_F
	]
	Bumped_KnockDown_B = [
		PedM_GPed_FallBack01a_F
		PedM_GPed_Knockdown01_F
		PedM_GPed_Knockdown02_F
	]
	Bumped_KnockDown_L = [
		PedM_GPed_FallLeft01a_F
		PedM_GPed_Knockdown01_F
		PedM_GPed_Knockdown02_F
	]
	Bumped_KnockDown_R = [
		PedM_GPed_FallRight01a_F
		PedM_GPed_Knockdown01_F
		PedM_GPed_Knockdown02_F
	]
}
gped_Lesbian01_anim_profile = {
	$gped_anim_profile
	$Lesbian01_anim_profile
}
gped_Lesbian02_anim_profile = {
	$gped_anim_profile
	Get_Attention_Far = [
		gped_lesbian02_sign_F
	]
	Get_Attention_Close = [
		gped_lesbian02_sign_F
	]
	Get_Attention_Idle = [
		gped_lesbian02_sign_F
	]
	Impatient_Idle = [
		gped_lesbian02_sign_F
	]
	Impatient_Talk = [
		gped_lesbian02_sign_F
	]
}
gped_Mascot_anim_profile = {
	$gped_anim_profile
	$Mascot_anim_profile
}
gped_Mascot_rc_anim_profile = {
	$gped_Mascot_anim_profile
	Get_Attention_Far = [
		gped_mascot_rc_car_F
	]
	Get_Attention_Close = [
		gped_mascot_rc_car_F
	]
	Get_Attention_Idle = [
		gped_mascot_rc_car_F
	]
	Impatient_Idle = [
		gped_mascot_rc_car_F
	]
	Impatient_Talk = [
		gped_mascot_rc_car_F
	]
}
gped_Mascot_audition_anim_profile = {
	$gped_Mascot_anim_profile
	Move_Ground_Idle = [
		gped_mascot_pants_F
	]
	Get_Attention_Far = [
		gped_mascot_pants_F
	]
	Get_Attention_Close = [
		gped_mascot_pants_F
	]
	Get_Attention_Idle = [
		gped_mascot_pants_F
	]
	Impatient_Idle = [
		gped_mascot_pants_F
	]
	Impatient_Talk = [
		gped_mascot_pants_F
	]
}
gped_dad_anim_profile = {
	$gped_anim_profile
	Get_Attention_Close = [
		gped_golfer_sm_putt_F
		gped_golfer_full_swing_F
	]
	Get_Attention_Idle = [
		gped_golfer_sm_putt_F
		gped_golfer_full_swing_F
	]
	Impatient_Idle = [
		gped_golfer_sm_putt_F
		gped_golfer_full_swing_F
	]
	Impatient_Talk = [
		gped_golfer_sm_putt_F
		gped_golfer_full_swing_F
	]
	Move_Ground_Idle_Torso_Neg = Ska8_zacs_empty_anim_D
	Move_Ground_Idle_Torso_Pos = Ska8_zacs_empty_anim_D
}
