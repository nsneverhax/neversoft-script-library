behavior_end_events = {
	Bv_PedLife_Roam = pedlife_roam_finished
	Bv_PedLife_Roam_Loop = DoesNotFinish
	Bv_PedLife_Idle = PedLife_Idle_Finished
	Bv_Pedlife_Anim = pedlife_anim_finished
	Bv_PedLife_PlayAnim = pedlife_anim_finished
	Bv_PedLife_SetState = pedlife_setstate_finished
	Bv_Pedlife_ReactionFinished = none
	Bv_Print = none
	Bv_LookAt_Interact = none
	bv_moveto_once_interact = MoveTo_Finished
	Bv_PlayAnim = playanim_finished
	Bv_Pedlife_FindPed = none
	Bv_AcquireSteering = steering_acquired
	Bv_Attach = attached
	Bv_Detach = detached
	Bv_MoveTo_Loop = MoveTo_Finished
	Bv_PedLife_Follow = PedLife_Follow_Finished
	Bv_PedLife_Follow_Side = PedLife_Follow_Side_Finished
	Bv_PedLife_Chat_Talk = PedLife_Chat_Finished
	Bv_PedLife_Chat_Listen = PedLife_Chat_Finished
	Bv_PedLife_Avoid = invalid
	Bv_ReleaseSteering = steering_released
	Bv_CustomAnim = CustomAnimation_Finished
	Bv_CustomAnimLoop = DoesNotFinish
	Bv_LockedCustomAnim = CustomAnimation_Finished
	Bv_LockedCustomAnimLoop = DoesNotFinish
	Bv_NodeLockedCustomAnim = CustomAnimation_Finished
	Bv_NodeLockedCustomAnimLoop = DoesNotFinish
	Bv_NodeLockedCustomAnimTimer = CustomAnimation_Finished
	Bv_PlayAnim_Timer = playanim_timer_finished
	Bv_LockedPlayAnim_Timer = playanim_timer_finished
	Bv_SetExitSequence = none
	Bv_Pedlife_SetArea = none
	Z_Alhambra_Bv_Scr_PlayPiano = none
	Bv_AlhambraPlayPiano = playanim_finished
}
pedlife_default_state = [
	{
		pedlife_roam_sequence
		weight = 1
	}
	{
		pedlife_idle_sequence
		weight = 1
	}
]
global_pedlife_state = [
	{
		pedlife_roam_sequence
		weight = 5
	}
	{
		pedlife_idle_sequence
		weight = 1
	}
]
pedlife_roam_sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			movement_desc_id = $default_move
		}
	}
]
pedlife_idle_sequence = [
	{
		behavior = Bv_PedLife_Idle
		behavior_params = {
			min_duration_secs = 5
			max_duration_secs = 8
		}
	}
]
Kid_state_01 = [
	{
		Punch_House_sequence_01
		weight = 3
	}
]
PatrolGuard_State_01 = [
	{
		Guard_Patrol_Sequence_01
		weight = 3
	}
]
Colonel_State_01 = [
	{
		Colonel_HouseSit_sequence_01
		weight = 3
	}
]
Kid_SitState_01 = [
	{
		Kid_HouseSit_sequence_01
		weight = 3
	}
]
Kid_SitState_02 = [
	{
		Kid_HouseSitBY_sequence_01
		weight = 3
	}
]
Lean_01 = [
	{
		HousesLean_sequence_01
		weight = 3
	}
]
LeaningBasic01_Sequence = [
	{
		Lean01_Sequence
		weight = 2
	}
	{
		Lean01TO03_Sequence
		weight = 1
	}
	{
		Lean02_Sequence
		weight = 1
	}
]
LeaningBasic02_Sequence = [
	{
		Lean01_Sequence
		weight = 1
	}
	{
		Lean01TO03_Sequence
		weight = 1
	}
	{
		Lean02_Sequence
		weight = 1
	}
]
LeaningToKneel01_Sequence = [
	{
		Lean01_Sequence
		weight = 1
	}
	{
		Lean01TO03_Sequence
		weight = 1
	}
	{
		Lean02_Sequence
		weight = 1
	}
	{
		Lean01TOKneel01_Sequence
		weight = 1
	}
]
LeaningToKneel02_Sequence = [
	{
		Lean01_Sequence
		weight = 1
	}
	{
		Lean01TO03_Sequence
		weight = 1
	}
	{
		Lean02_Sequence
		weight = 1
	}
	{
		Lean01TOKneel02_Sequence
		weight = 1
	}
]
RandomIdles = [
	{
		Idle01_Sequence
		weight = 1
	}
	{
		Idle01_Sequence
		weight = 1
	}
]
UsuallyIdlesState_01 = [
	{
		pedlife_roam_sequence
		weight = 1
	}
	{
		pedlife_idle_sequence
		weight = 5
	}
]
ShopsParkConversationAState_01 = [
	{
		ShopsParkConversationA01_Sequence
		weight = 1
	}
]
ShopsParkConversationBState_01 = [
	{
		ShopsParkConversationB01_Sequence
		weight = 1
	}
]
ShopsWindowPeekerState_01 = [
	{
		ShopsWindowPeeker01_Sequence
		weight = 1
	}
]
ShopsWindowPeekerState_02 = [
	{
		ShopsWindowPeeker02_Sequence
		weight = 1
	}
]
Shops_ParkGuy01 = [
	{
		Shops_ParkGuy01_Sequence
		weight = 1
	}
]
Shops_ParkGuy02 = [
	{
		Shops_ParkGuy02_Sequence
		weight = 1
	}
]
Shops_ParkGuyLean01 = [
	{
		Shops_ParkGuy03_Sequence
		weight = 1
	}
]
Shops_StoreGuyLean01 = [
	{
		Shops_StoreWallLean01B01_Sequence
		weight = 1
	}
]
Shops_StoreGuyLean02 = [
	{
		Shops_StoreWallLean02B01_Sequence
		weight = 1
	}
]
Shops_StoreGuyLean03 = [
	{
		Shops_StoreWallLean03B01_Sequence
		weight = 1
	}
]
Shops_StoreGuyLean04 = [
	{
		Shops_StoreWallLean04B01_Sequence
		weight = 1
	}
]
Shops_StoreGuyLean05 = [
	{
		Shops_StoreWallLean05B01_Sequence
		weight = 1
	}
]
Shops_LedgeSit01 = [
	{
		Shops_StoreLedgeSit01_Sequence
		weight = 1
	}
]
Shops_LedgeSit02 = [
	{
		Shops_StoreLedgeSit02_Sequence
		weight = 1
	}
]
School_FrontSit01 = [
	{
		School_FrontSit01_Sequence
		weight = 1
	}
]
School_FrontSit02 = [
	{
		School_FrontSit02_Sequence
		weight = 1
	}
]
School_FrontSit03 = [
	{
		School_FrontSit03_Sequence
		weight = 1
	}
]
School_FrontTalk00a = [
	{
		School_FrontTalk00a_Sequence
		weight = 1
	}
]
School_FrontTalk00b = [
	{
		School_FrontTalk00b_Sequence
		weight = 1
	}
]
School_FrontTalk01a = [
	{
		School_FrontTalk01a_Sequence
		weight = 1
	}
]
School_FrontTalk01b = [
	{
		School_FrontTalk01b_Sequence
		weight = 1
	}
]
School_FrontWait00 = [
	{
		School_FrontWait00_Sequence
		weight = 1
	}
]
School_FrontWait01 = [
	{
		School_FrontWait01_Sequence
		weight = 1
	}
]
School_FrontWallLean01 = [
	{
		School_FrontWallLean01_Sequence
		weight = 1
	}
]
School_FrontWallLean02 = [
	{
		School_FrontWallLean02_Sequence
		weight = 1
	}
]
School_FrontWallLean03 = [
	{
		School_FrontWallLean03_Sequence
		weight = 1
	}
]
School_FrontWallLean04 = [
	{
		School_FrontWallLean04_Sequence
		weight = 1
	}
]
School_FrontWallLean05 = [
	{
		School_FrontWallLean05_Sequence
		weight = 1
	}
]
School_FrontWallLean06 = [
	{
		School_FrontWallLean06_Sequence
		weight = 1
	}
]
School_Sk8r00 = [
	{
		Shops_Sk8r00a_Sequence
		weight = 1
	}
	{
		Shops_Sk8r00b_Sequence
		weight = 1
	}
	{
		Shops_Sk8r00c_Sequence
		weight = 1
	}
	{
		Shops_Sk8r00d_Sequence
		weight = 1
	}
	{
		Shops_Sk8r00e_Sequence
		weight = 1
	}
	{
		Shops_Sk8r00f_Sequence
		weight = 1
	}
]
School_Sk8r01 = [
	{
		Shops_Sk8r00a_Sequence
		weight = 2
	}
	{
		Shops_Sk8r00b_Sequence
		weight = 2
	}
	{
		Shops_Sk8r00c_Sequence
		weight = 2
	}
	{
		Shops_Sk8r00d_Sequence
		weight = 2
	}
	{
		Shops_Sk8r00e_Sequence
		weight = 2
	}
	{
		Shops_Sk8r00f_Sequence
		weight = 1
	}
]
School_Sk8r02 = [
	{
		Shops_Sk8r00a_Sequence
		weight = 2
	}
	{
		Shops_Sk8r00b_Sequence
		weight = 2
	}
	{
		Shops_Sk8r00c_Sequence
		weight = 1
	}
	{
		Shops_Sk8r00d_Sequence
		weight = 2
	}
	{
		Shops_Sk8r00e_Sequence
		weight = 2
	}
	{
		Shops_Sk8r00f_Sequence
		weight = 2
	}
]
School_Sk8rCrowd01 = [
	{
		School_Sk8rCrowd01_Sequence
		weight = 1
	}
]
Shops_WPBlock01 = [
	{
		Shops_WPBlock01_Sequence
		weight = 1
	}
]
Shops_WPBlock02 = [
	{
		Shops_WPBlock02_Sequence
		weight = 1
	}
]
Shops_DrunkBum01 = [
	{
		Shop_DrunkBum_sequence
		weight = 1
	}
]
Houses_Dad01 = [
	{
		Dad_Houses_sequence
		weight = 1
	}
]
Idles_General01 = [
	{
		Idle01_Sequence
		weight = 1
	}
	{
		Idle02_Sequence
		weight = 1
	}
	{
		Idle03_Sequence
		weight = 1
	}
]
Idles_General02 = [
	{
		Idle01_Sequence
		weight = 2
	}
	{
		Idle02_Sequence
		weight = 2
	}
	{
		Idle03_Sequence
		weight = 2
	}
	{
		Kneel01_Sequence
		weight = 1
	}
	{
		Kneel02_Sequence
		weight = 1
	}
]
Idles_General03 = [
	{
		Idle01_Sequence
		weight = 2
	}
	{
		Idle02_Sequence
		weight = 2
	}
	{
		Idle03_Sequence
		weight = 2
	}
	{
		Kneel01_Sequence
		weight = 2
	}
	{
		Kneel02_Sequence
		weight = 2
	}
]
Idles_StepsIdles = [
	{
		Idle01_Sequence
		weight = 1
	}
	{
		Idle02_Sequence
		weight = 1
	}
	{
		Idle03_Sequence
		weight = 1
	}
	{
		Kneel01_Sequence
		weight = 1
	}
	{
		Kneel02_Sequence
		weight = 1
	}
	{
		Idle_StepsSit01_Sequence
		weight = 2
	}
]
Idles_BenchIdles = [
	{
		Idle01_Sequence
		weight = 1
	}
	{
		Idle02_Sequence
		weight = 1
	}
	{
		Idle03_Sequence
		weight = 1
	}
	{
		Idle_StepsBench_Sequence
		weight = 4
	}
]
Idles_LowLdgIdles = [
	{
		Idle01_Sequence
		weight = 1
	}
	{
		Idle02_Sequence
		weight = 1
	}
	{
		Idle03_Sequence
		weight = 1
	}
	{
		Idle_StepsBench_Sequence
		weight = 4
	}
]
Idles_SkaterDoodTest = [
	{
		Skatertest_sequence
		weight = 1
	}
]
Idles_BumIdles = [
	{
		BunIdles_Sequence
		weight = 1
	}
]
Idles_DrunkIdles = [
	{
		Houses_DrunkBum_sequence
		weight = 1
	}
]
Idles_KidIdles = [
	{
		Houses_Kid_sequence
		weight = 1
	}
]
Idles_TurningIdles000 = [
	{
		Houses_WorkMan_sequence
		weight = 1
	}
]
Idles_BasketBallIdles = [
	{
		School_BasketBallIdles_Sequence
		weight = 1
	}
]
Punch_House_sequence_01 = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TRG_HousePuncher01
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TRG_HousePuncher01
			anims = [
				{
					anim = PedM_Gen_Punch01_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TRG_HousePuncher01
			anims = [
				{
					anim = PedM_Idle01_f
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TRG_HousePuncher01
			anims = [
				{
					anim = PedM_Gen_Punch01_F
					weight = 1
				}
			]
		}
	}
]
Guard_Patrol_Sequence_01 = [
	{
		behavior = Bv_PedLife_Roam_Loop
	}
]
Kid_HouseSit_sequence_01 = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_KidSitChairA
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_KidSitChairA
			anims = [
				PedM_LwLdg_IdleToSit_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle02_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle02_F
				PedM_LwLdg_SitToSitBack_F
				PedM_LwLdg_SitBackIdle01_F
				PedM_LwLdg_SitBackIdle01_F
				PedM_LwLdg_SitBackIdle02_F
				PedM_LwLdg_SitBackIdle01_F
				PedM_LwLdg_SitBackToSit_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_KidSitChairC
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_KidSitChairC
			anims = [
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_LoosenUp01_F
				PedM_Looking02_F
				PedM_ShiftFeet_F
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_ShiftWeight01_F
				PedM_Looking03_F
				PedM_Looking01_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_KidSitChairB
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_KidSitChairB
			anims = [
				PedM_ShiftFeet_F
				PedM_Lean02_IdleToLean_F
				PedM_Lean02_Idle01_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_StrechArms_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_AdjustBody_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_StrechLegs_F
				PedM_Lean02_LeanToIdle_F
				PedM_Stretch02_F
			]
			sequence
		}
	}
]
Kid_HouseSitBY_sequence_01 = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_Backyard09
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_Backyard09
			anims = [
				PedM_LwLdg_IdleToSit_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle02_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle02_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_Backyard04
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_Backyard04
			anims = [
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_LoosenUp01_F
				PedM_Kneel01_IdleTOKneel_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle02_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle04_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle03_F
				PedM_Kneel01_Idle02_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_KneelToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_Backyard05
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_Backyard05
			anims = [
				PedM_Stretch02_F
				PedM_LwLdg_IdleToSit_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle02_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle02_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_Backyard07
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_Backyard07
			anims = [
				PedM_ShiftFeet_F
				PedM_Lean02_IdleToLean_F
				PedM_Lean02_Idle01_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_StrechArms_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_AdjustBody_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_StrechLegs_F
				PedM_Lean02_LeanToIdle_F
				PedM_Stretch02_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_Backyard06
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_Backyard06
			anims = [
				PedM_Looking01_F
				PedM_Lean01_IdleToLean_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_CheckingArea_F
				PedM_Lean01_LeanToIdle_F
				PedM_Kneel02_IdleToKneel_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle01_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle02_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle04_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle03_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_KneelToIdle_F
			]
			sequence
		}
	}
]
HousesLean_sequence_01 = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_StreetLean
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_Houses_StreetLean
			anims = [
				{
					anim = PedM_Lean03_Idle00_F
					weight = 1
				}
			]
		}
	}
]
ShopsParkConversationA01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Talk01_F
				PedM_Talk03_F
				PedM_Talk05_F
				PedM_Talk07_F
				PedM_Talk09_F
				PedM_Talk11_F
			]
			sequence
		}
	}
]
ShopsParkConversationB01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				{
					anim = PedM_Talk02_F
					weight = 1
				}
				{
					anim = PedM_Talk04_F
					weight = 1
				}
				{
					anim = PedM_Laugh01_F
					weight = 1
				}
				{
					anim = PedM_Talk11_F
					weight = 1
				}
				{
					anim = PedM_Talk06_F
					weight = 1
				}
				{
					anim = PedM_Laugh03_F
					weight = 1
				}
				{
					anim = PedM_Talk08_F
					weight = 1
				}
				{
					anim = PedM_Talk10_F
					weight = 1
				}
			]
		}
	}
]
ShopsWindowPeeker01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TRG_Shops_WindowPeek01
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TRG_Shops_WindowPeek01
			anims = [
				{
					anim = PedM_Looking01_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TRG_Shops_WindowPeek02
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimTimer
		behavior_params = {
			node = Global_TRG_Shops_WindowPeek02
			anims = [
				{
					anim = PedM_Looking02_F
					weight = 1
				}
			]
			min_duration_secs = 5
			max_duration_secs = 8
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TRG_Shops_WindowPeek03
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TRG_Shops_WindowPeek03
			anims = [
				{
					anim = PedM_Looking03_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TRG_Shops_WindowPeek04
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TRG_Shops_WindowPeek04
			anims = [
				{
					anim = PedM_Laugh01_F
					weight = 1
				}
			]
		}
	}
]
ShopsWindowPeeker02_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TRG_Shops_WindowPeek04
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TRG_Shops_WindowPeek04
			anims = [
				{
					anim = PedM_Looking01_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TRG_Shops_WindowPeek03
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TRG_Shops_WindowPeek03
			anims = [
				{
					anim = PedM_Laugh01_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TRG_Shops_WindowPeek02
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TRG_Shops_WindowPeek02
			anims = [
				{
					anim = PedM_Looking03_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TRG_Shops_WindowPeek01
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TRG_Shops_WindowPeek01
			anims = [
				{
					anim = PedM_Looking02_F
					weight = 1
				}
			]
		}
	}
]
Shops_ParkGuy01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_FloorSit01
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_Shops_FloorSit01
			anims = [
				{
					anim = PedM_FloorSit_SitBkIdle_F
					weight = 1
				}
			]
		}
	}
]
Shops_ParkGuy02_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_FloorSit02
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_Shops_FloorSit02
			anims = [
				{
					anim = PedM_FloorSit_Idle00_F
					weight = 1
				}
			]
		}
	}
]
Shops_ParkLean01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				{
					anim = PedM_Lean01_LookingAround_F
					weight = 1
				}
				{
					anim = PedM_Lean01_Idle00_F
					weight = 1
				}
				{
					anim = PedM_Lean01_CheckingArea_F
					weight = 1
				}
				{
					anim = PedM_Lean01_Idle00_F
					weight = 1
				}
			]
		}
	}
]
Shops_ParkGuy03_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_FloorSit03
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_Shops_FloorSit03
			anims = [
				{
					anim = PedM_Lean01_Idle00_F
					weight = 1
				}
			]
		}
	}
]
Shops_StoreWallLean01B01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallLean001
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_Shops_WallLean001
			anims = [
				{
					anim = PedM_Lean02_Idle02_F
					weight = 1
				}
			]
		}
	}
]
Shops_StoreWallLean02B01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallLean002
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallLean002
			anims = [
				PedM_Looking01_F
				PedM_Looking02_F
				PedM_Looking03_F
				PedM_LoosenUp02_F
				PedM_Lean02_IdleToLean_F
				PedM_Lean03_IdleToLean_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_Idle01_F
				PedM_Lean03_Waiting_F
				PedM_Lean03_LookAround_F
				PedM_Lean03_LeanToIdle_F
				PedM_Lean02_StrechLegs_F
				PedM_Lean02_LeanToIdle_F
				PedM_Looking01_F
				PedM_Looking02_F
				PedM_ShiftWeight01_F
				PedM_Stretch02_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallLean002b
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallLean002b
			anims = [
				PedM_Looking01_F
				PedM_idl2armCros_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle02_F
				PedM_ArmCrosIdle03_F
				PedM_ArmCrosIdle04_F
				PedM_ArmCrossToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallLean002c
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallLean002c
			anims = [
				PedM_Looking01_F
				PedM_Looking03_F
				PedM_Looking02_F
			]
			sequence
		}
	}
]
Shops_StoreWallLean03B01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_KneelWallLean003
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_Shops_KneelWallLean003
			anims = [
				{
					anim = PedM_Kneel01_Idle01_F
					weight = 1
				}
			]
		}
	}
]
Shops_StoreWallLean05B01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq01a
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq01a
			anims = [
				PedM_Lean01_IdleToLean_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_LookingAround_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_AdjustBody_F
				PedM_Lean01_LeanToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq01b
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq01b
			anims = [
				PedM_Lean02_IdleToLean_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_AdjustBody_F
				PedM_Lean02_LeanToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq01c
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq01c
			anims = [
				PedM_Looking01_F
				PedM_idl2armCros_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle02_F
				PedM_ArmCrosIdle03_F
				PedM_ArmCrosIdle04_F
				PedM_ArmCrossToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq01d
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq01d
			anims = [
				{
					anim = PedM_Disappointed06_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq01e
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq01e
			anims = [
				{
					anim = PedM_CloseAttention02
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq01f
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq01f
			anims = [
				{
					anim = PedM_Looking03_F
					weight = 1
				}
			]
		}
	}
]
School_FrontSit01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontSit00
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontSit00
			anims = [
				{
					anim = PedM_Bch_SitIdle00_F
					weight = 1
				}
			]
		}
	}
]
School_FrontSit02_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontSit01
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontSit01
			anims = [
				{
					anim = PedM_LwLdg_SitIdle01_F
					weight = 1
				}
			]
		}
	}
]
School_FrontSit03_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontSit02
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontSit02
			anims = [
				{
					anim = PedM_Bch_SitIdle01_F
					weight = 1
				}
			]
		}
	}
]
School_FrontTalk00a_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontTalking00a
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontTalking00a
			anims = [
				{
					anim = PedM_Talk11_F
					weight = 1
				}
			]
		}
	}
]
School_FrontTalk00b_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontTalking00b
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontTalking00b
			anims = [
				{
					anim = PedM_Talk10_F
					weight = 1
				}
			]
		}
	}
]
School_FrontTalk01a_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontTalking01a
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontTalking01a
			anims = [
				{
					anim = PedM_Talk09_F
					weight = 1
				}
			]
		}
	}
]
School_FrontTalk01b_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontTalking01b
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontTalking01b
			anims = [
				{
					anim = PedM_Talk11_F
					weight = 1
				}
			]
		}
	}
]
School_FrontWait00_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontWait00
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontWait00
			anims = [
				{
					anim = PedM_Looking02_F
					weight = 1
				}
			]
		}
	}
]
School_FrontWait01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontWait01
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontWait01
			anims = [
				{
					anim = PedM_Looking01_F
					weight = 1
				}
			]
		}
	}
]
School_FrontWallLean02_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontWallLean02
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontWallLean02
			anims = [
				{
					anim = PedM_Lean01_Idle00_F
					weight = 1
				}
			]
		}
	}
]
School_FrontWallLean01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontWallLean01
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontWallLean01
			anims = [
				{
					anim = PedM_Lean02_Idle02_F
					weight = 1
				}
			]
		}
	}
]
School_FrontWallLean03_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontWallLean03
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontWallLean03
			anims = [
				{
					anim = PedM_Lean03_Idle00_F
					weight = 1
				}
			]
		}
	}
]
School_FrontWallLean04_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontWallLean04
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontWallLean04
			anims = [
				{
					anim = PedM_Lean02_Idle02_F
					weight = 1
				}
			]
		}
	}
]
School_FrontWallLean05_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontWallLean05
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontWallLean05
			anims = [
				{
					anim = PedM_Kneel02_Idle00_F
					weight = 1
				}
			]
		}
	}
]
School_FrontWallLean06_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontWallLean06
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontWallLean06
			anims = [
				{
					anim = PedM_Lean02_Idle02_F
					weight = 1
				}
			]
		}
	}
]
Shops_StoreWallLean04B01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq03
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq03
			anims = [
				{
					anim = PedM_Talk10_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq03a
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq03a
			anims = [
				{
					anim = PedM_Clap02_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq03b
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq03b
			anims = [
				{
					anim = PedM_Talk09_F
					weight = 1
				}
			]
			min_duration_secs = 5
			max_duration_secs = 8
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq03c
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq03c
			anims = [
				{
					anim = PedM_Cheer04_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq03d
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq03d
			anims = [
				{
					anim = PedM_Talk10_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WallSeq03e
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WallSeq03e
			anims = [
				{
					anim = PedM_Looking03_F
					weight = 1
				}
			]
		}
	}
]
Shops_StoreLedgeSit01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle02_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle02_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitToIdle_F
				PedM_DustOff_F
				PedM_Looking01_F
				PedM_LoosenUp02_F
				PedM_HighLdg_IdleToLdgSit_F
				PedM_HighLdg_SitIdle00_F
			]
			sequence
		}
	}
]
Shops_StoreLedgeSit02_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_LdgSit_Idle00_F
				PedM_LdgSit_Idle01_F
				PedM_LdgSit_Idle02_F
				PedM_LdgSit_Idle02_F
				PedM_LdgSit_Idle03_F
				PedM_LdgSit_Idle02_F
				PedM_LdgSit_SitIdleToIdle_F
				PedM_ShakeLegs_F
				PedM_Looking02_F
				PedM_LdgSit_IdleToSitLedge_F
				PedM_LdgSit_Idle00_F
				PedM_LdgSit_Idle02_F
				PedM_LdgSit_Idle02_F
				PedM_LdgSit_SitIdleToIdle_F
				PedM_ShiftWeight02_F
				PedM_Looking02_F
				PedM_Looking02_F
				PedM_ShiftFeet_F
				PedM_LdgSit_IdleToSitLedge_F
			]
			sequence
		}
	}
]
Shops_Talk00a_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontTalking00a
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontTalking00a
			anims = [
				{
					anim = PedM_Talk11_F
					weight = 1
				}
			]
		}
	}
]
Shops_Talk00b_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_School_FrontTalking00b
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnimLoop
		behavior_params = {
			node = Global_School_FrontTalking00b
			anims = [
				{
					anim = PedM_Talk10_F
					weight = 1
				}
			]
		}
	}
]
Shops_Sk8r00a_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedMSk8r_OnBoardIdle_F
				PedMSk8r_OnBoardTrickStart_F
				PedMSk8r_OnBoardTrick01_F
				PedMSk8r_OnBoardIdle_F
			]
			sequence
		}
	}
]
Shops_Sk8r00b_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedMSk8r_OnBoardIdle_F
				PedMSk8r_OffBoard_F
				PedMSk8r_OffBoardIdle_F
				PedMSk8r_OffBoardIdle_F
				PedMSk8r_OffBoardIdle_F
				PedMSk8r_OffBoardIdle_F
				PedMSk8r_OnBoard_F
			]
			sequence
		}
	}
]
Shops_Sk8r00c_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedMSk8r_OnBoardIdle_F
				PedMSk8r_OnBoardTrickStart_F
				PedMSk8r_OnBoardTrick02_F
				PedMSk8r_OnBoardIdle_F
			]
			sequence
		}
	}
]
Shops_Sk8r00d_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedMSk8r_OnBoard2TruckRun_F
				PedSk8r_TruckRunLoop_F
				PedSk8r_TruckRunLoop_F
				PedSk8r_TruckRunLoop_F
				PedSk8r_TruckRun2Pogo_F
				PedMSk8r_PogoEnd02_F
			]
			sequence
		}
	}
]
Shops_Sk8r00e_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedMSk8r_OnBoard2TruckRun_F
				PedSk8r_TruckRunLoop_F
				PedSk8r_TruckRun2Pogo_F
				PedMSk8r_PogoLoop_F
				PedMSk8r_PogoLoop_F
				PedMSk8r_PogoLoop_F
				PedMSk8r_PogoEnd01_F
				PedMSk8r_OnBoardIdle_F
			]
			sequence
		}
	}
]
Shops_Sk8r00f_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedMSk8r_OnBoardIdle_F
				PedMSk8r_OnBoardTrickStart_F
				PedMSk8r_OnBoardTrick02_F
				PedMSk8r_OffBoard_F
				PedMSk8r_OffBoardIdle_F
				PedMSk8r_OnBoard_F
				PedMSk8r_OnBoard2TruckRun_F
				PedSk8r_TruckRunLoop_F
				PedSk8r_TruckRunLoop_F
				PedSk8r_TruckRunLoop_F
				PedSk8r_TruckRun2Pogo_F
				PedMSk8r_PogoLoop_F
				PedMSk8r_PogoLoop_F
				PedMSk8r_PogoLoop_F
				PedMSk8r_PogoEnd02_F
			]
			sequence
		}
	}
]
School_Sk8rCrowd01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				{
					anim = PedM_Cheer01_F
					weight = 1
				}
				{
					anim = PedM_Looking03_F
					weight = 1
				}
				{
					anim = PedM_Cheer02_F
					weight = 1
				}
				{
					anim = PedM_ShiftWeight02_F
					weight = 1
				}
				{
					anim = PedM_Cheer03_F
					weight = 1
				}
				{
					anim = PedM_Looking02_F
					weight = 1
				}
				{
					anim = PedM_Cheer04_F
					weight = 1
				}
				{
					anim = PedM_Clap01_F
					weight = 1
				}
				{
					anim = PedM_Clap02_F
					weight = 1
				}
				{
					anim = PedM_Looking01_F
					weight = 1
				}
				{
					anim = PedM_Clap03_F
					weight = 1
				}
				{
					anim = PedM_ShiftWeight01_F
					weight = 1
				}
				{
					anim = PedM_Clap04_F
					weight = 1
				}
			]
		}
	}
]
Lean01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_CheckingArea_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_AdjustBody_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_LookingAround_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
			]
			sequence
		}
	}
]
Lean01TO03_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Lean03_IdleToLean_F
				PedM_Lean03_AdjustArm_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_Waiting_F
				PedM_Lean03_Idle01_F
				PedM_Lean03_AdjustBody_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_LookAround_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_LeanToIdle_F
				PedM_Lean01_AdjustBody_F
			]
			sequence
		}
	}
]
Lean02_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Lean01_LeanToIdle_F
				PedM_DustBack_F
				PedM_ShiftFeet_F
				PedM_Lean02_IdleToLean_F
				PedM_Lean02_Idle01_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_StrechArms_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_AdjustBody_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_StrechLegs_F
				PedM_Lean02_LeanToIdle_F
				PedM_Stretch02_F
				PedM_Lean01_IdleToLean_F
			]
			sequence
		}
	}
]
Lean01TOKneel01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Lean01_LeanToIdle_F
				PedM_Kneel01_IdleTOKneel_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle02_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle04_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle03_F
				PedM_Kneel01_Idle02_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_KneelToIdle_F
				PedM_ShakeLegs_F
				PedM_Lean01_IdleToLean_F
			]
			sequence
		}
	}
]
Lean01TOKneel02_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Lean01_LeanToIdle_F
				PedM_Kneel02_IdleToKneel_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle01_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle02_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle04_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle03_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_KneelToIdle_F
				PedM_Lean01_IdleToLean_F
			]
			sequence
		}
	}
]
Idle01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_LoosenUp01_F
				PedM_Looking02_F
				PedM_ShiftFeet_F
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_ShiftWeight01_F
				PedM_Looking03_F
				PedM_Looking01_F
			]
			sequence
		}
	}
]
Idle02_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Stretch02_F
				PedM_Looking02_F
				PedM_LoosenUp02_F
				PedM_Looking01_F
				PedM_DustOff_F
				PedM_ShiftWeight02_F
				PedM_Looking03_F
				PedM_Looking02_F
				PedM_ShakeLegs_F
			]
			sequence
		}
	}
]
Idle03_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_idl2armCros_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle02_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle03_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle04_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrossToIdle_F
			]
			sequence
		}
	}
]
Kneel01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Kneel01_IdleTOKneel_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle02_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle03_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle02_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle04_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_Idle02_F
				PedM_Kneel01_Idle01_F
				PedM_Kneel01_KneelToIdle_F
			]
			sequence
		}
	}
]
Kneel02_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Kneel02_IdleToKneel_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle01_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle03_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle04_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle01_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_Idle00_F
				PedM_Kneel02_KneelToIdle_F
			]
			sequence
		}
	}
]
Idles_LowLdgSit01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_LwLdg_IdleToSit_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle02_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle02_F
				PedM_LwLdg_SitToSitBack_F
				PedM_LwLdg_SitBackIdle01_F
				PedM_LwLdg_SitBackIdle01_F
				PedM_LwLdg_SitBackIdle02_F
				PedM_LwLdg_SitBackIdle01_F
				PedM_LwLdg_SitBackToSit_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitIdle01_F
				PedM_LwLdg_SitToIdle_F
			]
			sequence
		}
	}
]
Idles_Lean01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_ShiftFeet_F
				PedM_Lean02_IdleToLean_F
				PedM_Lean02_Idle01_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_StrechArms_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_AdjustBody_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_StrechLegs_F
				PedM_Lean02_LeanToIdle_F
				PedM_Stretch02_F
			]
			sequence
		}
	}
]
Idles_Lean01TO03_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Lean01_IdleToLean_F
				PedM_Lean03_IdleToLean_F
				PedM_Lean03_AdjustArm_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_Waiting_F
				PedM_Lean03_Idle01_F
				PedM_Lean03_AdjustBody_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_LookAround_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_LeanToIdle_F
				PedM_Lean01_AdjustBody_F
				PedM_Lean01_LeanToIdle_F
			]
			sequence
		}
	}
]
Idle_StepsSit01_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Stretch01_F
				PedM_StepsSit_IdleToSit_F
				PedM_StepsSit_Idle01_F
				PedM_StepsSit_Idle02_F
				PedM_StepsSit_Idle01_F
				PedM_StepsSit_Idle01_F
				PedM_StepsSit_Idle03_F
				PedM_StepsSit_Idle01_F
				PedM_StepsSit_Idle01_F
				PedM_StepsSit_SitToLeanBk_F
				PedM_StepsSit_LeanBkIdle01_F
				PedM_StepsSit_LeanBkIdle01_F
				PedM_StepsSit_LeanBkIdle01_F
				PedM_StepsSit_LeanBkIdle01_F
				PedM_StepsSit_LeanBkIdle01_F
				PedM_StepsSit_LeanBkToSit_F
				PedM_StepsSit_Idle01_FPedM_StepsSit_Idle03_F
				PedM_StepsSit_SitToIdle_F
			]
			sequence
		}
	}
]
Idle_StepsBench_Sequence = [
	{
		behavior = Bv_LockedCustomAnim
		behavior_params = {
			anims = [
				PedM_Bch_IdleToSitIdle_F
				PedM_Bch_SitIdle00_F
				PedM_Bch_SitIdle00_F
				PedM_Bch_LookAtWatch_F
				PedM_Bch_SitIdle00_F
				PedM_Bch_SitIdle01_F
				PedM_Bch_SitIdle00_F
				PedM_Bch_SitIdle03_F
				PedM_Bch_SitIdleToLeanFd_F
				PedM_Bch_LeanFdIdle01_F
				PedM_Bch_LeanFdIdle01_F
				PedM_Bch_LeanFdIdle01_F
				PedM_LwLdg_SitToIdle_F
			]
			sequence
		}
	}
]
Shops_WPBlock01_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock01a
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock01a
			anims = [
				PedM_LdgSit_IdleToSitLedge_F
				PedM_LdgSit_Idle00_F
				PedM_LdgSit_Idle01_F
				PedM_LdgSit_Idle00_F
				PedM_LdgSit_Idle02_F
				PedM_LdgSit_Idle04_F
				PedM_LdgSit_Idle03_F
				PedM_LdgSit_Idle00_F
				PedM_LdgSit_Idle00_F
				PedM_LdgSit_Idle00_F
				PedM_LdgSit_Idle02_F
				PedM_LdgSit_SitIdleToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock01b
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock01b
			anims = [
				PedM_Looking01_F
				PedM_Looking02_F
				PedM_Looking03_F
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_LoosenUp01_F
				PedM_ShiftFeet_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock01c
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock01c
			anims = [
				PedM_ShiftFeet_F
				PedM_idl2armCros_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle02_F
				PedM_ArmCrosIdle03_F
				PedM_ArmCrosIdle04_F
				PedM_ArmCrossToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock01d
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock01d
			anims = [
				PedM_Looking01_F
				PedM_CallSk8r02_F
				PedM_ShiftWeight01_F
				PedM_Looking02_F
				PedM_LoosenUp01_F
				PedM_Looking02_F
				PedM_Looking02_F
				PedM_Looking03_F
			]
			sequence
		}
	}
]
Shops_WPBlock02_Sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock02a
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock02a
			anims = [
				PedM_Lean01_IdleToLean_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_CheckingArea_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_AdjustBody_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_LookingAround_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_LeanToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock02b
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock02b
			anims = [
				PedM_Looking01_F
				PedM_Looking02_F
				PedM_Looking03_F
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_LoosenUp01_F
				PedM_ShiftFeet_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock02c
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock02c
			anims = [
				PedM_ShiftFeet_F
				PedM_idl2armCros_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle02_F
				PedM_ArmCrosIdle03_F
				PedM_ArmCrosIdle04_F
				PedM_ArmCrossToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock02d
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock02d
			anims = [
				PedM_Talk01_F
				PedM_Talk03_F
				PedM_Talk05_F
				PedM_Talk07_F
				PedM_Talk09_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock02e
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock02e
			anims = [
				PedM_Looking01_F
				PedM_Looking02_F
				PedM_Looking03_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock02f
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock02f
			anims = [
				PedM_HighLdg_IdleToLdgSit_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle01_F
				PedM_HighLdg_SitIdle02_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle00_F
				PedM_HighLdg_SitIdle03_F
				PedM_HighLdg_SitToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock02g
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock02g
			anims = [
				PedM_Talk01_F
				PedM_Talk03_F
				PedM_Talk05_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock02h
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock02h
			anims = [
				PedM_Looking01_F
				PedM_CallSk8r02_F
				PedM_ShiftWeight01_F
				PedM_Looking02_F
				PedM_LoosenUp01_F
				PedM_Looking02_F
				PedM_Looking02_F
				PedM_Looking03_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Shops_WPBlock02i
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Shops_WPBlock02i
			anims = [
				PedM_Lean01_IdleToLean_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_CheckingArea_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_AdjustBody_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_LookingAround_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_LeanToIdle_F
			]
			sequence
		}
	}
]
Colonel_HouseSit_sequence_01 = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_ColonelDriveway01
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_ColonelDriveway01
			anims = [
				PedM_Lean02_IdleToLean_F
				PedM_Lean02_Idle01_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_StrechArms_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle03_F
				PedM_Lean02_AdjustBody_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_Idle02_F
				PedM_Lean02_StrechLegs_F
				PedM_Lean02_LeanToIdle_F
				PedM_Stretch02_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_ColonelDriveway02
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_ColonelDriveway02
			anims = [
				PedM_Lean01_IdleToLean_F
				PedM_Lean03_IdleToLean_F
				PedM_Lean03_AdjustArm_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_Waiting_F
				PedM_Lean03_Idle01_F
				PedM_Lean03_AdjustBody_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_LookAround_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_Idle00_F
				PedM_Lean03_LeanToIdle_F
				PedM_Lean01_AdjustBody_F
				PedM_Lean01_LeanToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_ColonelDriveway03
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_ColonelDriveway03
			anims = [
				PedM_idl2armCros_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle02_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle03_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle04_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrossToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_ColonelDriveway04
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_ColonelDriveway04
			anims = [
				PedM_idl2armCros_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle02_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle03_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle04_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrossToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_ColonelDriveway05
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_ColonelDriveway05
			anims = [
				PedM_idl2armCros_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle02_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle03_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle05_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle04_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrosIdle01_F
				PedM_ArmCrossToIdle_F
			]
			sequence
		}
	}
]
Dad_Houses_sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_DadAreaNode00c
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_DadAreaNode00c
			anims = [
				PedM_ShiftFeet_F
				PedM_Lean01_IdleToLean_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_AdjustBody_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_LookingAround_F
				PedM_Lean01_LeanToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_DadAreaNode00b
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_DadAreaNode00b
			anims = [
				PedM_CallSk8r02_F
				PedM_CloseAttention01
				PedM_Looking03_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_DadAreaNode00a
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_DadAreaNode00a
			anims = [
				PedM_Stretch01_F
				PedM_StepsSit_IdleToSit_F
				PedM_StepsSit_Idle01_F
				PedM_StepsSit_Idle02_F
				PedM_StepsSit_Idle01_F
				PedM_StepsSit_Idle01_F
				PedM_StepsSit_Idle03_F
				PedM_StepsSit_Idle01_F
				PedM_StepsSit_Idle01_F
				PedM_StepsSit_SitToLeanBk_F
				PedM_StepsSit_LeanBkIdle01_F
				PedM_StepsSit_LeanBkIdle01_F
				PedM_StepsSit_LeanBkIdle01_F
				PedM_StepsSit_LeanBkIdle01_F
				PedM_StepsSit_LeanBkIdle01_F
				PedM_StepsSit_LeanBkToSit_F
				PedM_StepsSit_Idle01_FPedM_StepsSit_Idle03_F
				PedM_StepsSit_SitToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Houses_DadAreaNode00d
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_Houses_DadAreaNode00d
			anims = [
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_LoosenUp01_F
				PedM_Looking02_F
				PedM_ShiftFeet_F
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_ShiftWeight01_F
				PedM_Looking03_F
				PedM_Looking01_F
			]
			sequence
		}
	}
]
Skatertest_sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Tets_Sk8erNode02
		}
	}
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			node = Global_Tets_Sk8erNode02
			anims = [
				{
					anim = PedMSk8_VertTest_F
					weight = 1
				}
			]
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_Tets_Sk8erNode03
		}
	}
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			node = Global_Tets_Sk8erNode03
			anims = [
				{
					anim = PedMSk8_VertTest_F
					weight = 1
				}
			]
		}
	}
]

script RegisterBehaviors_SkateSequences 
	registerstate {
		name = Bv_Sessioning
		transitions = [{events = [enter_behavior
					CustomAnimation_Finished]
				responses = [{replacement = child
						state = ChooseSessioningSequence
					}]
			}
			{events = [Play_Sequence_0]
				responses = [{replacement = child
						state = Bv_CustomAnim
						params = [{name = no_name val = sequence}
							{name = anims val = [PedMSk8r_OnBoardIdle_F
									PedMSk8r_OnBoardTrickStart_F
									PedMSk8r_OnBoardTrick01_F
									PedMSk8r_OnBoardIdle_F
									PedMSk8r_OnBoardIdle_F
									PedMSk8r_OnBoardIdle_F]
							}
						]
					}]
			}
			{events = [Play_Sequence_1]
				responses = [{replacement = child
						state = Bv_CustomAnim
						params = [{name = no_name val = sequence}
							{name = anims val = [PedMSk8r_OnBoardIdle_F
									PedMSk8r_OffBoard_F
									PedMSk8r_OffBoardIdle_F
									PedMSk8r_OffBoardIdle_F
									PedMSk8r_OffBoardIdle_F
									PedMSk8r_OffBoardIdle_F
									PedMSk8r_OnBoard_F]
							}
						]
					}]
			}
			{events = [Play_Sequence_2]
				responses = [{replacement = child
						state = Bv_CustomAnim
						params = [{name = no_name val = sequence}
							{name = anims val = [PedMSk8r_OnBoardIdle_F
									PedMSk8r_OnBoardTrickStart_F
									PedMSk8r_OnBoardTrick02_F
									PedMSk8r_OnBoardIdle_F
									PedMSk8r_OnBoardIdle_F]
							}
						]
					}]
			}
			{events = [Play_Sequence_3]
				responses = [{replacement = child
						state = Bv_CustomAnim
						params = [{name = no_name val = sequence}
							{name = anims val = [PedMSk8r_OnBoardIdle_F
									PedMSk8r_OnBoard2TruckRun_F
									PedSk8r_TruckRunLoop_F
									PedSk8r_TruckRunLoop_F
									PedSk8r_TruckRunLoop_F
									PedSk8r_TruckRun2Pogo_F
									PedMSk8r_PogoEnd02_F
									PedMSk8r_OnBoardIdle_F]
							}
						]
					}]
			}
			{events = [Play_Sequence_4]
				responses = [{replacement = child
						state = Bv_CustomAnim
						params = [{name = no_name val = sequence}
							{name = anims val = [PedMSk8r_OnBoardIdle_F
									PedMSk8r_OnBoard2TruckRun_F
									PedSk8r_TruckRunLoop_F
									PedSk8r_TruckRun2Pogo_F
									PedMSk8r_PogoLoop_F
									PedMSk8r_PogoLoop_F
									PedMSk8r_PogoLoop_F
									PedMSk8r_PogoEnd01_F
									PedMSk8r_OnBoardIdle_F]
							}
						]
					}]
			}
			{events = [Play_Sequence_5]
				responses = [{replacement = child
						state = Bv_CustomAnim
						params = [{name = no_name val = sequence}
							{name = anims val = [PedMSk8r_OnBoardIdle_F
									PedMSk8r_OnBoardTrickStart_F
									PedMSk8r_OnBoardTrick02_F
									PedMSk8r_OffBoard_F
									PedMSk8r_OnBoard_F
									PedMSk8r_OnBoard2TruckRun_F
									PedSk8r_TruckRunLoop_F
									PedSk8r_TruckRunLoop_F
									PedSk8r_TruckRunLoop_F
									PedSk8r_TruckRun2Pogo_F
									PedMSk8r_PogoLoop_F
									PedMSk8r_PogoLoop_F
									PedMSk8r_PogoLoop_F
									PedMSk8r_PogoEnd02_F]
							}
						]
					}]
			}]
	}
endscript

script ChooseSessioningSequence 
	Random (
		@ eventcache_add \{event_id = Play_Sequence_0}
		@ eventcache_add \{event_id = Play_Sequence_1}
		@ eventcache_add \{event_id = Play_Sequence_2}
		@ eventcache_add \{event_id = Play_Sequence_3}
		@ eventcache_add \{event_id = Play_Sequence_4}
		@ eventcache_add \{event_id = Play_Sequence_5}
		)
endscript
BumIdles_Sequence = [
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			anims = [
				PedMBum_Idle00_F
				PedMBum_IdleToForwardLeft_F
				PedMBum_Idle00_F
				PedMBum_Idle00_F
				PedMBum_IdleToStepBackLeft_F
				PedMBum_Idle00_F
				PedMBum_Idle00_F
				PedMBum_IdleToForwardRight_F
				PedMBum_Idle00_F
			]
			sequence
		}
	}
]
DrunkIdles_Sequence = [
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			anims = [
				PedMDrunk_Idle_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle03_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle04_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle01_F
			]
			sequence
		}
	}
]
Houses_DrunkBum_sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_BumArea02
		}
	}
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			node = Global_BumArea02
			anims = [
				PedMDrunk_Idle_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle03_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle04_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle01_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_BumArea0000
		}
	}
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			node = Global_BumArea0000
			anims = [
				PedMDrunk_Idle_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle03_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle04_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle01_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_BumArea01
		}
	}
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			node = Global_BumArea01
			anims = [
				PedMDrunk_Idle_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle03_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle04_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle01_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_BumArea03
		}
	}
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			node = Global_BumArea03
			anims = [
				PedMDrunk_Idle_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle03_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle04_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle02_F
				PedMDrunk_Idle_F
				PedMDrunk_Idle01_F
				PedMDrunk_Idle01_F
			]
			sequence
		}
	}
]
KidIdles_Sequence = [
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			anims = [
				PedM_Looking02_F
				PedM_Looking01_F
				PedM_Looking01_F
				PedMKid_Idle_F
				PedMKid_Idle_F
				PedM_Looking01_F
				PedM_Looking02_F
				PedM_Looking01_F
				PedM_Looking02_F
			]
			sequence
		}
	}
]
Houses_Kid_sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_KidArea01
		}
	}
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			node = Global_KidArea01
			anims = [
				PedM_Looking02_F
				PedM_Looking01_F
				PedM_Looking01_F
				PedMKid_Idle_F
				PedMKid_Idle_F
				PedM_Looking01_F
				PedM_Looking02_F
				PedM_Looking01_F
				PedM_Looking02_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_KidArea02
		}
	}
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			node = Global_KidArea02
			anims = [
				PedM_Looking02_F
				PedM_Looking01_F
				PedM_Looking01_F
				PedMKid_Idle_F
				PedMKid_Idle_F
				PedM_Looking02_F
				PedM_Looking02_F
				PedM_Looking01_F
				PedM_Looking02_F
			]
			sequence
		}
	}
]
Houses_TurnTest_sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TurningTest03
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TurningTest03
			anims = [
				PedM_Lean01_IdleToLean_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_LeanToIdle_F
				PedM_TurnRight_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TurningTest04
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TurningTest04
			anims = [
				PedM_Lean01_IdleToLean_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_LeanToIdle_F
				PedM_TurnRight_F
			]
			sequence
		}
	}
]
Houses_WorkMan_sequence = [
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TurningTest03
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TurningTest03
			anims = [
				PedM_TurnLeft_F
				PedM_Lean01_IdleToLean_F
				PedM_Lean01_Idle00_F
				PedM_Lean01_LeanToIdle_F
			]
			sequence
		}
	}
	{
		behavior = Bv_PedLife_Roam
		behavior_params = {
			waypoint = Global_TurningTest04
		}
	}
	{
		behavior = Bv_NodeLockedCustomAnim
		behavior_params = {
			node = Global_TurningTest04
			anims = [
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_LoosenUp01_F
				PedM_Looking02_F
				PedM_ShiftFeet_F
				PedM_Looking01_F
				PedM_Looking01_F
				PedM_ShiftWeight01_F
				PedM_Looking03_F
				PedM_Looking01_F
			]
			sequence
		}
	}
]
School_BasketBallIdles_Sequence = [
	{
		behavior = Bv_CustomAnim
		behavior_params = {
			anims = [
				PedM_BasketBall_Idle_F
				PedM_BasketBall_Idle_F
				PedM_BasketBall_Idle01_F
				PedM_BasketBall_Idle_F
				PedM_BasketBall_IdleToIdle02_F
				PedM_BasketBall_Idle02_F
				PedM_BasketBall_Idle02_F
				PedM_BasketBall_Idle02_01_F
				PedM_BasketBall_Idle02ToIdle_F
				PedM_BasketBall_Idle_F
			]
			sequence
		}
	}
]
