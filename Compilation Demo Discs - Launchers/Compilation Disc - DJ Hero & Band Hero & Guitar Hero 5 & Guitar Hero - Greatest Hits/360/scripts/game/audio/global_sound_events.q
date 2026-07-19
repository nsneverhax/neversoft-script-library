Crowd_Individual_Clap_To_Beat_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Group_Clap_01
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			Crowd_Group_Clap_02
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			Crowd_Group_Clap_03
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			Crowd_Group_Clap_04
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			Crowd_Group_Clap_05
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			Crowd_Group_Clap_06
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
	]
}
Crowd_Fail_Song_SFX_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Crowd_Fail_Song
			vol = 3
			pan1x = -0.9
			pan1y = -0.55
			pan2x = 0.9
			pan2y = 0.120000005
		}
	]
}
Crowd_Fail_Song_SFX_softer_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Crowd_Fail_Song
			vol = 0
			pan1x = -0.9
			pan1y = -0.55
			pan2x = 0.9
			pan2y = 0.120000005
		}
	]
}
Star_Power_Awarded_SFX_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = 4.5
			pan1x = -1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
		{
			sp_awarded2
			vol = 5.5
			pan1x = -1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
	]
}
Star_Power_Awarded_SFX_P1_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = 1
			pan1x = -1
			pan1y = 1
			pan2x = -0.5141509
			pan2y = 1
			panRemoveCenter = true
		}
		{
			sp_awarded2
			vol = 3
			pan1x = -1
			pan1y = 1
			pan2x = -0.5141509
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Star_Power_Awarded_SFX_P2_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = 1
			pan1x = 0.4669811
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panRemoveCenter = true
		}
		{
			sp_awarded2
			vol = 3
			pan1x = 0.4669811
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Star_Power_Awarded_SFX_P3_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = 1
			pan1x = -0.45283026
			pan1y = 1
			pan2x = 0.45283026
			pan2y = 1
			panRemoveCenter = true
		}
		{
			sp_awarded2
			vol = 3
			pan1x = -0.45283026
			pan1y = 1
			pan2x = 0.45283026
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Star_Power_Ready_SFX_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			sp_available1
			vol = -5.17
		}
	]
}
Star_Power_Ready_SFX_P1_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			sp_available1
			vol = -7.51
			pan1x = -1
			pan1y = 0.504717
			pan2x = -0.5613208
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Star_Power_Ready_SFX_P2_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			sp_available1
			vol = -7.51
			pan1x = 0.53773576
			pan1y = 1
			pan2x = 1
			pan2y = 0.63
			panRemoveCenter = true
		}
	]
}
Star_Power_Deployed_SFX_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			sp_deployed
			vol = -10.42
		}
	]
}
Star_Power_Deployed_SFX_P1_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			sp_deployed
			vol = -12
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
Star_Power_Deployed_SFX_P2_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			sp_deployed
			vol = -12
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
Star_Power_Deployed_Cheer_SFX_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = Obj_PlaySound
	Randomness = none
	Sounds = [
		{
			sp_cheer1
			vol = 3
			dropoff = 50
			dropoff_function = linear
		}
	]
}
Star_Power_Deployed_Cheer_SFX_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			sp_cheer1
			vol = 3
			pan1x = -1
			pan1y = 0.27
			pan2x = -0.5283019
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Star_Power_Deployed_Cheer_SFX_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			sp_cheer1
			vol = 3
			pan1x = 0.5566037
			pan1y = 1
			pan2x = 1
			pan2y = 0.63
			panRemoveCenter = true
		}
	]
}
Star_Power_Deployed_Cheer_SFX_P3_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			sp_cheer1
			vol = 3
			pan1x = 1
			pan1y = 1
			pan2x = 0.41
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
ui_sfx_select_container = {
	Default_Priority = 90
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			ui_sound_05
			vol = -3
		}
	]
}
GH_SFX_BattleMode_Lightning_Player1_container = {
	Default_Priority = 90
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_Lightning
			vol = -4.42
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
GH_SFX_BattleMode_Lightning_Player2_container = {
	Default_Priority = 90
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_Lightning
			vol = -4.42
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
GH_SFX_BeatSoundEvent_container = {
	Default_Priority = 90
	Default_Buss = Test_Tones
	NoRepeatFor = 0.001
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_Beat_Sound
			vol = -3
			pitch = 12
		}
	]
}
GH_SFX_Calibration_BeatSoundEvent_container = {
	Default_Priority = 90
	Default_Buss = Test_Tones
	NoRepeatFor = 0.001
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_Beat_Sound
			vol = -9
			pitch = 15.860001
		}
	]
}
GH_SFX_BeatWindowOpenSoundEvent_container = {
	Default_Priority = 90
	Default_Buss = Test_Tones
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_Beat_Sound
			vol = 6
			pitch = 7.02
		}
	]
}
GH_SFX_BeatWindowCloseSoundEvent_container = {
	Default_Priority = 90
	Default_Buss = Test_Tones
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_Beat_Sound
			vol = 6
			pitch = -2.81
		}
	]
}
Dummy_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Applause_L_01
		}
		{
			EXT_LG_Crowd_Applause_L_02
		}
		{
			EXT_LG_Crowd_Applause_R_01
		}
		{
			EXT_LG_Crowd_Applause_R_02
		}
		{
			EXT_LG_Crowd_Bad_Loop_BK
		}
		{
			EXT_LG_Crowd_Bad_Loop_BL
		}
		{
			EXT_LG_Crowd_Bad_Loop_BR
		}
		{
			EXT_LG_Crowd_Bad_Loop_FL
		}
		{
			EXT_LG_Crowd_Bad_Loop_FR
		}
		{
			EXT_LG_Crowd_Bad_Loop_FT
		}
		{
			EXT_LG_Crowd_Good_Loop_BK
		}
		{
			EXT_LG_Crowd_Good_Loop_BL
		}
		{
			EXT_LG_Crowd_Good_Loop_BR
		}
		{
			EXT_LG_Crowd_Good_Loop_FL
		}
		{
			EXT_LG_Crowd_Good_Loop_FR
		}
		{
			EXT_LG_Crowd_Good_Loop_FT
		}
		{
			EXT_LG_Crowd_Neutral_Loop_BK
		}
		{
			EXT_LG_Crowd_Neutral_Loop_BL
		}
		{
			EXT_LG_Crowd_Neutral_Loop_BR
		}
		{
			EXT_LG_Crowd_Neutral_Loop_FL
		}
		{
			EXT_LG_Crowd_Neutral_Loop_FR
		}
		{
			EXT_LG_Crowd_Neutral_Loop_FT
		}
		{
			EXT_LG_Crowd_Swell_LG_L_01
		}
		{
			EXT_LG_Crowd_Swell_LG_R_01
		}
		{
			EXT_LG_Crowd_Swell_MD_L_01
		}
		{
			EXT_LG_Crowd_Swell_MD_R_01
		}
		{
			EXT_LG_Crowd_Swell_SH_L_01
		}
		{
			EXT_LG_Crowd_Swell_SH_R_01
		}
		{
			EXT_LG_Crowd_Whistle_01
		}
		{
			EXT_LG_Crowd_Whistle_02
		}
		{
			EXT_LG_Crowd_Whistle_03
		}
		{
			EXT_LG_Crowd_Whistle_04
		}
		{
			EXT_LG_Crowd_Whistle_05
		}
		{
			EXT_LG_Crowd_Whistle_06
		}
		{
			EXT_LG_Crowd_Whistle_07
		}
		{
			EXT_LG_Crowd_Whistle_08
		}
		{
			EXT_LG_Crowd_Whistle_09
		}
		{
			EXT_LG_Crowd_Whistle_10
		}
		{
			EXT_LG_Crowd_Whistle_11
		}
		{
			EXT_LG_Crowd_Whistle_12
		}
		{
			EXT_LG_Crowd_Whistle_13
		}
		{
			EXT_LG_Crowd_Whistle_14
		}
		{
			EXT_LG_Crowd_Whistle_15
		}
		{
			EXT_LG_Crowd_Whistle_16
		}
		{
			EXT_LG_Crowd_Whistle_17
		}
		{
			EXT_LG_Crowd_Whistle_18
		}
		{
			EXT_LG_Crowd_Whistle_19
		}
		{
			EXT_LG_Crowd_Whistle_20
		}
		{
			EXT_MD_Crowd_Bad_Loop_BK
		}
		{
			EXT_MD_Crowd_Bad_Loop_FT
		}
		{
			EXT_MD_Crowd_Good_Loop_BK
		}
		{
			EXT_MD_Crowd_Good_Loop_FT
		}
		{
			EXT_MD_Crowd_Neutral_Loop_BK
		}
		{
			EXT_MD_Crowd_Neutral_Loop_FT
		}
		{
			INT_MD_Crowd_Bad_Loop_BK
		}
		{
			INT_MD_Crowd_Bad_Loop_FT
		}
		{
			INT_MD_Crowd_Good_Loop_BK
		}
		{
			INT_MD_Crowd_Good_Loop_FT
		}
		{
			INT_MD_Crowd_Neutral_Loop_BK
		}
		{
			INT_MD_Crowd_Neutral_Loop_FT
		}
		{
			INT_SM_Crowd_Bad_Loop_BK
		}
		{
			INT_SM_Crowd_Bad_Loop_FT
		}
		{
			INT_SM_Crowd_Good_Loop_BK
		}
		{
			INT_SM_Crowd_Good_Loop_FT
		}
		{
			INT_SM_Crowd_Neutral_Loop_BK
		}
		{
			INT_SM_Crowd_Neutral_Loop_FT
		}
		{
			Large_EXT_Encore_Crowd
		}
		{
			Last_Venue_Fireworks
		}
		{
			LG_Crowd_Bad_To_Neutral_01
		}
		{
			LG_Crowd_Bad_To_Neutral_BL_01
		}
		{
			LG_Crowd_Bad_To_Neutral_BR_01
		}
		{
			LG_Crowd_Bad_To_Neutral_FL_01
		}
		{
			LG_Crowd_Bad_To_Neutral_FR_01
		}
		{
			LG_Crowd_Bad_To_Neutral_L_01
		}
		{
			LG_Crowd_Bad_To_Neutral_R_01
		}
		{
			LG_Crowd_Good_To_Neutral_01
		}
		{
			LG_Crowd_Neutral_To_Bad_01
		}
		{
			LG_Crowd_Neutral_To_Bad_BL_01
		}
		{
			LG_Crowd_Neutral_To_Bad_BR_01
		}
		{
			LG_Crowd_Neutral_To_Bad_FL_01
		}
		{
			LG_Crowd_Neutral_To_Bad_FR_01
		}
		{
			LG_Crowd_Neutral_To_Bad_L_01
		}
		{
			LG_Crowd_Neutral_To_Bad_R_01
		}
		{
			LG_Crowd_Neutral_To_Good_01
		}
		{
			LG_Crowd_Neutral_To_Good_BL_01
		}
		{
			LG_Crowd_Neutral_To_Good_BR_01
		}
		{
			LG_Crowd_Neutral_To_Good_FL_01
		}
		{
			LG_Crowd_Neutral_To_Good_FR_01
		}
		{
			LG_Crowd_Neutral_To_Good_L_01
		}
		{
			LG_Crowd_Neutral_To_Good_L_02
		}
		{
			LG_Crowd_Neutral_To_Good_R_01
		}
		{
			LG_Crowd_Neutral_To_Good_R_02
		}
		{
			LRG_Crowd_Bad_To_Neutral_L_01
		}
		{
			LRG_Crowd_Bad_To_Neutral_R_01
		}
		{
			LRG_Crowd_Good_To_Neutral_L_01
		}
		{
			LRG_Crowd_Good_To_Neutral_R_01
		}
		{
			LRG_Crowd_Neutral_To_Bad_L_01
		}
		{
			LRG_Crowd_Neutral_To_Bad_R_01
		}
		{
			LRG_Crowd_Neutral_To_Good_L_01
		}
		{
			LRG_Crowd_Neutral_To_Good_R_01
		}
		{
			MD_Crowd_Bad_To_Neutral_01
		}
		{
			MD_Crowd_Good_To_Neutral_01
		}
		{
			MD_Crowd_Neutral_To_Bad_02
		}
		{
			MD_Crowd_Neutral_To_Good_01
		}
		{
			Medium_EXT_Encore_Crowd
		}
		{
			Medium_INT_Encore_Crowd
		}
		{
			PinkNoise_Minnus_20
		}
		{
			Silence_Front_End_Crowd_Loop
		}
		{
			SM_Crowd_Bad_To_Neutral_01
		}
		{
			SM_Crowd_Good_To_Neutral_03
		}
		{
			SM_Crowd_Neutral_To_Bad_03
		}
		{
			SM_Crowd_Neutral_To_Good_03
		}
		{
			Small_INT_Encore_Crowd
		}
		{
			TestTones_BackupVocals
		}
		{
			TestTones_Band
		}
		{
			TestTones_Bass
		}
		{
			TestTones_Crowd
		}
		{
			TestTones_Cymbals
		}
		{
			TestTones_Guitar
		}
		{
			TestTones_KickDrum
		}
		{
			TestTones_LeadVocals
		}
		{
			TestTones_SnareDrum
		}
		{
			TestTones_Toms
		}
	]
}
DoNothing_OneShot_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
}
Crowd_Swell_Short_Large_EXT_L_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_SH_L_01
			vol = 4
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Short_Large_EXT_R_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_SH_R_01
			vol = 4
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Short_Soft_Large_EXT_L_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_SH_L_01
			vol = -2
			pan1x = -0.9811321
			pan1y = 0.4056604
		}
	]
}
Crowd_Swell_Short_Soft_Large_EXT_R_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_SH_R_01
			vol = -2
			pan1x = 1
			pan1y = 0.33962262
		}
	]
}
Crowd_Swell_Med_Large_EXT_L_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_MD_L_01
			vol = -3
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Med_Large_EXT_R_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_MD_R_01
			vol = -3
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Long_Large_EXT_L_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_MD_L_01
			vol = -3
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Long_Large_EXT_R_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_MD_R_01
			vol = -3
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_OneShots_Boo_Close_container = {
	Default_Priority = 20
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 1.5
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Boo_Sm_01
			pan1x = 0.61
			pan1y = -1.0
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			Crowd_Boo_Sm_02
			pan1x = 1.0
			pan1y = -0.13
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			Crowd_Boo_Sm_03
			pan1x = 0.69
			pan1y = -1.0
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			Crowd_Boo_Sm_04
			pan1x = 0.0
			pan1y = -1.0
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			Crowd_Boo_Sm_05
			pan1x = -0.69
			pan1y = -1.0
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			Crowd_Boo_Sm_06
			pan1x = -0.07
			pan1y = -0.7
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			Crowd_Boo_Sm_07
			pan1x = 0.31
			pan1y = -0.7
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			Crowd_Boo_Sm_08
			pan1x = 0.1
			pan1y = -0.7
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			Crowd_Boo_Sm_09
			pan1x = 0.6
			pan1y = -0.8
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			Crowd_Boo_Sm_10
			pan1x = 0.8
			pan1y = -0.26
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
		}
	]
}
Menu_Guitar_Lick_SFX_container = {
	Default_Priority = 80
	Default_Buss = front_end
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomType
}
Menu_Warning_SFX_container = {
	Default_Priority = 75
	Default_Buss = front_end
	NoRepeatFor = 0.5
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Warning_01
			vol = -6
		}
	]
}
Menu_Warning_SFX_softer_container = {
	Default_Priority = 75
	Default_Buss = front_end
	NoRepeatFor = 0.5
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Warning_01
			vol = -8
		}
	]
}
Menu_Music_SE_container = {
	Default_Priority = 90
	Default_Buss = Music_FrontEnd
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
}
Generic_Menu_Back_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_Sound_09
			vol = -6
		}
	]
}
Notes_Ripple_Up_SFX_container = {
	Default_Priority = 80
	Default_Buss = front_end
	NoRepeatFor = 0.5
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Notes_Ripple_Up_01
			vol = -3.73
		}
	]
}
Crowd_Battle_Cheer_Large_EXT_L_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_SH_L_01
			vol = 0
			pan1x = -1.0
			pan1y = 0.59
		}
	]
}
Crowd_Battle_Cheer_Large_EXT_R_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_SH_R_01
			vol = 0
			pan1x = -0.5
			pan1y = 1.0
			panRemoveCenter = true
		}
	]
}
Crowd_Battle_Cheer_Large_EXT_L_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_SH_L_01
			vol = 0
			pan1x = 0.52
			pan1y = 1.0
			panRemoveCenter = true
		}
	]
}
Crowd_Battle_Cheer_Large_EXT_R_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Swell_SH_R_01
			vol = 0
			pan1x = 1.0
			pan1y = 0.57
		}
	]
}
Crowd_Battle_Cheer_Medium_EXT_L_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_SH_L_02
			vol = 11.5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.59
		}
	]
}
Crowd_Battle_Cheer_Medium_EXT_R_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_SH_R_02
			vol = 11.5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -0.5
			pan1y = 1.0
			panRemoveCenter = true
		}
	]
}
Crowd_Battle_Cheer_Medium_EXT_L_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_SH_L_02
			vol = 11.5
			pan1x = 0.52
			pan1y = 1
			panRemoveCenter = true
		}
	]
}
Crowd_Battle_Cheer_Medium_EXT_R_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_SH_R_02
			vol = 11.5
			pan1x = 1
			pan1y = 0.57
		}
	]
}
Crowd_Battle_Cheer_Medium_INT_L_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_SH_L_02
			vol = 2
			pan1x = -1
			pan1y = 0.59
		}
	]
}
Crowd_Battle_Cheer_Medium_INT_R_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_SH_R_02
			vol = 2
			pan1x = -0.5
			pan1y = 1
			panRemoveCenter = true
		}
	]
}
Crowd_Battle_Cheer_Medium_INT_L_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_SH_L_02
			vol = 2
			pan1x = 0.52
			pan1y = 1
			panRemoveCenter = true
		}
	]
}
Crowd_Battle_Cheer_Medium_INT_R_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_SH_R_02
			vol = 2
			pan1x = 1
			pan1y = 0.57
		}
	]
}
Crowd_Battle_Cheer_LONDON_L_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_SH_L_02
			vol = 2
			pan1x = -1
			pan1y = 0.59
		}
	]
}
Crowd_Battle_Cheer_LONDON_R_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_SH_R_02
			vol = 2
			pan1x = -0.5
			pan1y = 1
			panRemoveCenter = true
		}
	]
}
Crowd_Battle_Cheer_LONDON_L_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_SH_L_02
			vol = 2
			pan1x = 0.52
			pan1y = 1
			panRemoveCenter = true
		}
	]
}
Crowd_Battle_Cheer_LONDON_R_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_SH_R_02
			vol = 2
			pan1x = 1
			pan1y = 0.57
		}
	]
}
Crowd_Battle_Cheer_Small_INT_L_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_SH_L_03
			vol = 2
			pan1x = -1
			pan1y = 0.59
		}
	]
}
Crowd_Battle_Cheer_Small_INT_R_P1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_SH_R_03
			vol = 2
			pan1x = -0.5
			pan1y = 1
			panRemoveCenter = true
		}
	]
}
Crowd_Battle_Cheer_Small_INT_L_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_SH_L_03
			vol = 2
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 0.52
			pan1y = 1.0
			panRemoveCenter = true
		}
	]
}
Crowd_Battle_Cheer_Small_INT_R_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_SH_R_03
			vol = 2
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.57
		}
	]
}
Crowd_Transition_Large_EXT_Good_To_Med_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Good_To_Neutral_01
			vol = 3
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Large_EXT_Good_To_Med_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Good_To_Neutral_01
			vol = 3
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Large_EXT_Good_To_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Good_To_Neutral_01
			vol = 3
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Large_EXT_Med_To_Good_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Neutral_To_Good_01
			vol = 0
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Large_EXT_Med_To_Good_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Neutral_To_Good_01
			vol = 0
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Large_EXT_Med_To_Good_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Neutral_To_Good_01
			vol = 0
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Large_EXT_Med_To_Poor_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Neutral_To_Bad_01
			vol = 0
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Large_EXT_Med_To_Poor_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Neutral_To_Bad_01
			vol = 0
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Large_EXT_Med_To_Poor_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Neutral_To_Bad_01
			vol = 0
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Large_EXT_Poor_To_Med_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Bad_To_Neutral_01
			vol = 12
			pan1x = -1.0
			pan1y = 1.0
			pan2x = -0.5
			pan2y = 1.0
		}
	]
}
Crowd_Transition_Large_EXT_Poor_To_Med_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Bad_To_Neutral_01
			vol = 12
			pan1x = 0.5
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
	]
}
Crowd_Transition_Large_EXT_Poor_To_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LG_Crowd_Bad_To_Neutral_01
			vol = 12
			pan1x = -1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
	]
}
Crowd_Transition_Medium_EXT_Good_To_Med_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Good_To_Neutral_01
			vol = 0.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Good_To_Med_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Good_To_Neutral_01
			vol = 0.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Good_To_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Good_To_Neutral_01
			vol = 0.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Good_To_Med_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Good_To_Neutral_01
			vol = -2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Good_To_Med_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Good_To_Neutral_01
			vol = -2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Good_To_Med_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Good_To_Neutral_01
			vol = -2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Good_To_Med_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Good_To_Neutral_01
			vol = -2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Good_To_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Good_To_Neutral_01
			vol = -2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Good_To_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Good_To_Neutral_01
			vol = -2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Med_To_Good_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Good_01
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Med_To_Good_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Good_01
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Med_To_Good_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Good_01
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Med_To_Good_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Good_01
			vol = 2.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Med_To_Good_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Good_01
			vol = 2.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Med_To_Good_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Good_01
			vol = 2.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Med_To_Good_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Neutral_To_Good_01
			vol = 2.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Med_To_Good_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Neutral_To_Good_01
			vol = 2.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Med_To_Good_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Neutral_To_Good_01
			vol = 2.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Med_To_Poor_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Bad_02
			vol = -4
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Med_To_Poor_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Bad_02
			vol = -3
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Med_To_Poor_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Bad_02
			vol = -1
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Med_To_Poor_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Bad_02
			vol = -1.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Med_To_Poor_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Bad_02
			vol = -1.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Med_To_Poor_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Bad_02
			vol = -1.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Med_To_Poor_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Neutral_To_Bad_02
			vol = -1.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Med_To_Poor_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Neutral_To_Bad_02
			vol = -1.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Med_To_Poor_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Neutral_To_Bad_02
			vol = -1.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Poor_To_Med_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Bad_To_Neutral_01
			vol = 12
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Poor_To_Med_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Bad_To_Neutral_01
			vol = 12
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_EXT_Poor_To_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Bad_To_Neutral_01
			vol = 12
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Poor_To_Med_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Bad_To_Neutral_01
			vol = 8
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Poor_To_Med_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Bad_To_Neutral_01
			vol = 8
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Medium_INT_Poor_To_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			MD_Crowd_Bad_To_Neutral_01
			vol = 8
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Poor_To_Med_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Bad_To_Neutral_01
			vol = 8
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Poor_To_Med_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Bad_To_Neutral_01
			vol = 8
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_LONDON_Poor_To_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Bad_To_Neutral_01
			vol = 8
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Good_To_Med_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Good_To_Neutral_03
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Good_To_Med_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Good_To_Neutral_03
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Good_To_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Good_To_Neutral_03
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Poor_To_Med_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Bad_To_Neutral_01
			vol = 6
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Poor_To_Med_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Bad_To_Neutral_01
			vol = 6
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Poor_To_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Bad_To_Neutral_01
			vol = 6
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Med_To_Good_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Neutral_To_Good_03
			vol = 3
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Med_To_Good_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Neutral_To_Good_03
			vol = 3
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Med_To_Good_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Neutral_To_Good_03
			vol = 3
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Med_To_Poor_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Neutral_To_Bad_03
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Med_To_Poor_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Neutral_To_Bad_03
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Transition_Small_INT_Med_To_Poor_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SM_Crowd_Neutral_To_Bad_03
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
Crowd_Swell_Long_Medium_EXT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_LG_L_02
			vol = 2.5
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Long_Medium_EXT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_LG_R_02
			vol = 2.5
			pan1x = 1
			pan1y = 0.25471702
		}
	]
}
Crowd_Swell_Long_Medium_INT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_LG_L_01
			vol = -5
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Long_Medium_INT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_LG_R_01
			vol = -5
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Long_LONDON_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_LG_L_01
			vol = 4
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Long_LONDON_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_LG_R_01
			vol = 4
			pan1x = 1
			pan1y = 0.24528301
		}
	]
}
Crowd_Swell_Long_Small_INT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_LG_L_02
			vol = -4
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Long_Small_INT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_LG_R_02
			vol = -4
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Med_Medium_EXT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_MD_L_02
			vol = -1
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Med_Medium_EXT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_MD_R_02
			vol = -1
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Med_Medium_INT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_MD_L_02
			vol = -3
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Med_Medium_INT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_MD_R_02
			vol = -3
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Med_LONDON_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_MD_L_02
			vol = 2
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Med_LONDON_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_MD_R_02
			vol = 2
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Med_Small_INT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_MD_L_01
			vol = -4
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Med_Small_INT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_MD_R_01
			vol = -4
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Short_Medium_EXT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_SH_L_02
			vol = 8.5
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Short_Medium_EXT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_SH_R_02
			vol = 8.5
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Short_Soft_Medium_EXT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_SH_L_02
			vol = -2.5
			pan1x = -1
			pan1y = 0.29716977
		}
	]
}
Crowd_Swell_Short_Soft_Medium_EXT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_SH_R_02
			vol = -2.5
			pan1x = 1
			pan1y = 0.3679245
		}
	]
}
Crowd_Swell_Short_Medium_INT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_SH_L_02
			vol = 4.5
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Short_Medium_INT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_SH_R_02
			vol = 4.5
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Short_Soft_Medium_INT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_SH_L_02
			vol = -5
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Short_Soft_Medium_INT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Swell_SH_R_02
			vol = -5
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Short_LONDON_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_SH_L_02
			vol = 4.5
			pan1x = -0.990566
			pan1y = 0.29716977
		}
	]
}
Crowd_Swell_Short_LONDON_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_SH_R_02
			vol = 4.5
			pan1x = 1
			pan1y = 0.3679245
		}
	]
}
Crowd_Swell_Short_Soft_LONDON_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_SH_L_02
			vol = -1
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Short_Soft_LONDON_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Swell_SH_R_02
			vol = -1
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Crowd_Swell_Short_Small_INT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_SH_L_03
			vol = 4
			pan1x = -1
			pan1y = 0.3962264
		}
	]
}
Crowd_Swell_Short_Small_INT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_SH_R_03
			vol = 4
			pan1x = 1
			pan1y = 0.3962264
		}
	]
}
Crowd_Swell_Short_Soft_Small_INT_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_SH_L_03
			vol = -6
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
Crowd_Swell_Short_Soft_Small_INT_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Swell_SH_R_03
			vol = -6
			pan1x = 1
			pan1y = 0.56
		}
	]
}
Box_Check_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
		}
		{
			checkbox_sfx
			vol = -1.93
		}
	]
}
Box_UnCheck_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
		}
		{
			checkbox_sfx
			vol = -1.93
		}
	]
}
Cash_Sound_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Cash
			vol = -4.42
		}
	]
}
You_Rock_End_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			you_rock
			vol = 2
		}
	]
}
UI_SFX_Lose_Multiplier_2X_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_Lose_Multiplier
			vol = -8.38
			pitch = 1.65
		}
	]
}
UI_SFX_Lose_Multiplier_3X_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_Lose_Multiplier
			vol = -4.8700004
			pitch = 0.84000003
		}
	]
}
UI_SFX_Lose_Multiplier_4X_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_Lose_Multiplier
			vol = -2.49
			pitch = 0
		}
	]
}
Lose_Multiplier_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
}
Song_Intro_Kick_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_Song_Intro_Kick
			vol = -4.5
		}
	]
}
Song_Intro_Highway_Up_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Highway_Rise
			vol = 3.21
		}
	]
}
GH_SFX_BattleMode_DiffUp_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_Battle_DifficultyRampUp
			vol = -4.9300003
			pan1x = -1.0
			pan1y = 0.72999996
			pan2x = -0.77
			pan2y = 1.0
		}
	]
}
GH_SFX_BattleMode_DoubleNote_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_DoubleNoteAttack
			vol = -4.09
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
GH_SFX_BattleMode_Lefty_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_LeftyAttack
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
GH_SFX_BattleMode_Steal_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_StealPowerup
			vol = -6
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
GH_SFX_BattleMode_StringBreak_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_StringBreakAttack
			vol = -4.42
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
GH_SFX_BattleMode_WhammyAttack_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack
			vol = -5.9300003
			pan1x = -1.0
			pan1y = 1.0
			pan2x = -1.0
			pan2y = 0.27
		}
	]
}
GH_SFX_BattleMode_DiffUp_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_Battle_DifficultyRampUp
			vol = -4.9300003
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
GH_SFX_BattleMode_DoubleNote_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_DoubleNoteAttack
			vol = -4.09
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
GH_SFX_BattleMode_Lefty_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_LeftyAttack
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
GH_SFX_BattleMode_Steal_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_StealPowerup
			vol = -6
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
GH_SFX_BattleMode_StringBreak_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_StringBreakAttack
			vol = -4.42
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
GH_SFX_BattleMode_WhammyAttack_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack
			vol = -5.9300003
			pan1x = 1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.71
		}
	]
}
GH_SFX_BossBattle_PlayerDies_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_DeathFromSlash
		}
	]
}
GH_SFX_You_Lose_Single_Player_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_Sudden_Death
			vol = -2.49
		}
	]
}
GH_SFX_BattleMode_Attack_Over_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_Attack_Over
			vol = -6.9100003
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
GH_SFX_BattleMode_Attack_Over_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_Attack_Over
			vol = -6.9100003
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
Battle_Power_Awarded_SFX_P1_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -3.73
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
Battle_Power_Awarded_SFX_P2_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -3.73
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
GH_SFX_HitNoteSoundEvent_container = {
	Default_Priority = 90
	Default_Buss = Test_Tones
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_Beat_Sound
			vol = 6
			pitch = 15.860001
		}
	]
}
Countoff_SFX_Sticks_Normal_Hard_container = {
	Default_Priority = 90
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			StickClickMed
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.51
					0.34
					0.17
					0.0
					-0.17
				]
			}
		}
	]
}
Countoff_SFX_Sticks_Normal_Med_container = {
	Default_Priority = 90
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			StickClickMed
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-3.73
					-4.14
					-5.17
					-6.0
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.17
					0.0
					-0.17
					-0.35000002
					-0.53
				]
			}
		}
	]
}
Countoff_SFX_Sticks_Normal_Soft_container = {
	Default_Priority = 90
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			StickClickMed
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-9.09
					-8.610001
					-7.9300003
					-7.51
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-0.17
					-0.35000002
					-0.53
					-0.71
					-0.89
				]
			}
		}
	]
}
Countoff_SFX_HiHat01_Hard_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			HiHatClosed01
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-0.90999997
					-0.44
					0.0
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.51
					0.34
					0.17
					0.0
					-0.17
				]
			}
		}
	]
}
Countoff_SFX_HiHat01_Med_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			HiHatClosed01
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-0.90999997
					-0.44
					0.0
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.17
					0.0
					-0.17
					-0.35000002
					-0.53
				]
			}
		}
	]
}
Countoff_SFX_HiHat01_Soft_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			HiHatClosed01
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-0.90999997
					-0.44
					0.0
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-0.17
					-0.35000002
					-0.53
					-0.71
					-0.89
				]
			}
		}
	]
}
Countoff_SFX_HiHat02_Hard_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			HiHatOpen02
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.42000002
					0.83
					1.21
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.17
					0.0
					0.0
				]
			}
		}
	]
}
Countoff_SFX_HiHat02_Med_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			HiHatOpen02
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.42000002
					0.83
					1.21
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.0
					-0.17
					-0.17
				]
			}
		}
	]
}
Countoff_SFX_HiHat02_Soft_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			HiHatOpen02
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.42000002
					0.83
					1.21
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-0.17
					-0.35000002
					-0.35000002
				]
			}
		}
	]
}
Countoff_SFX_HiHat03_Hard_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			HiHatPedal02
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.83
					1.58
					2.27
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.17
					0.0
					0.0
				]
			}
		}
	]
}
Countoff_SFX_HiHat03_Med_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			HiHatPedal02
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.83
					1.58
					2.27
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.0
					-0.17
					-0.17
				]
			}
		}
	]
}
Countoff_SFX_HiHat03_Soft_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			HiHatPedal02
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.83
					1.58
					2.27
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-0.17
					-0.35000002
					-0.35000002
				]
			}
		}
	]
}
Countoff_SFX_Sticks_Huge_Hard_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			StickClickLarge
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.51
					0.34
					0.17
					0.0
					-0.17
				]
			}
		}
	]
}
Countoff_SFX_Sticks_Huge_Med_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			StickClickLarge
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.17
					0.0
					-0.17
					-0.35000002
					-0.53
				]
			}
		}
	]
}
Countoff_SFX_Sticks_Huge_Soft_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			StickClickLarge
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-0.17
					-0.35000002
					-0.53
					-0.71
					-0.89
				]
			}
		}
	]
}
Countoff_SFX_Sticks_Tiny_Hard_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			StickClickSmall
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1.41
					-0.90999997
					-0.44
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.51
					0.34
					0.17
					0.0
					-0.17
				]
			}
		}
	]
}
Countoff_SFX_Sticks_Tiny_Med_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			StickClickSmall
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1.41
					-0.90999997
					-0.44
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					0.17
					0.0
					-0.17
					-0.35000002
					-0.53
				]
			}
		}
	]
}
Countoff_SFX_Sticks_Tiny_Soft_container = {
	Default_Priority = 50
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			StickClickSmall
			RandomVol = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1.41
					-0.90999997
					-0.44
				]
			}
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-0.17
					-0.35000002
					-0.53
					-0.71
					-0.89
				]
			}
		}
	]
}
Jam_Mode_Metronome_container = {
	Default_Priority = 90
	Default_Buss = Practice_Band_Playback
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
}
GH_SFX_BattleMode_WhammyAttack_Received_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack_Received
			vol = -6.09
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
GH_SFX_BattleMode_WhammyAttack_Received_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack_Received
			vol = -6.09
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
Checkbox_SFX_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			checkbox_sfx
			vol = -1.93
		}
	]
}
Checkbox_SFX_P1_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			checkbox_sfx
			vol = -1.93
			pan1x = -0.9
			pan1y = 1.0
		}
	]
}
Checkbox_SFX_P2_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			checkbox_sfx
			vol = -1.93
			pan1x = 0.9
			pan1y = 1.0
		}
	]
}
Whammy_Test_SFX_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Whammy_Test_SFX
			vol = -3.09
		}
	]
}
POW_SFX_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			POW_SFX_02
			vol = 6
		}
		{
			POW_SFX_05
			vol = 6
		}
		{
			POW_SFX_07
			vol = 6
		}
	]
}
CheckBox_Check_SFX_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
		}
	]
}
CheckBox_Check_2_SFX_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			CheckBox_Check_SFX_2
			vol = 8
		}
	]
}
CheckBox_Check_SFX_P1_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
			pan1x = -0.9
			pan1y = 1.0
		}
	]
}
CheckBox_Check_SFX_P2_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
			pan1x = 0.9
			pan1y = 1.0
		}
	]
}
Tutorial_Mode_Finish_Chord_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Finish_Chord
			vol = 2.27
		}
	]
}
UI_SFX_100_Note_Streak_SinglePlayer_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.5
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_SFX_100_Note_Streak
			vol = -4
		}
	]
}
UI_SFX_50_Note_Streak_SinglePlayer_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.5
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -3
		}
	]
}
UI_SFX_100_Note_Streak_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_SFX_100_Note_Streak
			vol = -5
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
UI_SFX_50_Note_Streak_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -7
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
UI_SFX_100_Note_Streak_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_SFX_100_Note_Streak
			vol = -5
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
UI_SFX_50_Note_Streak_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -7
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
Tutorial_Missed_HOPO_Free_container = {
	Default_Priority = 100
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Tutorial_Missed_HOPO_Free
			vol = 3.51
		}
	]
}
Tutorial_String_1_HOPO_Free_container = {
	Default_Priority = 100
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Tutorial_String_1_HOPO_Free
			vol = 8.51
		}
	]
}
Tutorial_String_1_Strum_Free_container = {
	Default_Priority = 100
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Tutorial_String_1_Strum_Free
			vol = 8.51
		}
	]
}
Tutorial_String_2_HOPO_Free_container = {
	Default_Priority = 100
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Tutorial_String_2_HOPO_Free
			vol = 8.51
		}
	]
}
Tutorial_String_2_Strum_Free_container = {
	Default_Priority = 100
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Tutorial_String_2_Strum_Free
			vol = 8.51
		}
	]
}
Tutorial_String_3_HOPO_Free_container = {
	Default_Priority = 100
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Tutorial_String_3_HOPO_Free
			vol = 8.51
		}
	]
}
Tutorial_String_3_Strum_Free_container = {
	Default_Priority = 100
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Tutorial_String_3_Strum_Free
			vol = 8.51
		}
	]
}
Crowd_Applause_Large_EXT_L_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Applause_L_01
			vol = -1
			pan1x = -1
			pan1y = 1
		}
	]
}
Crowd_Applause_Large_EXT_R_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_LG_Crowd_Applause_R_01
			vol = -1
			pan1x = 1
			pan1y = 1
		}
	]
}
Crowd_Applause_Medium_EXT_L_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Applause_L_02
			vol = -4
			pan1x = -1
			pan1y = 1
		}
	]
}
Crowd_Applause_Medium_EXT_R_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Applause_R_02
			vol = -4
			pan1x = 1
			pan1y = 0.47641513
		}
	]
}
Crowd_Applause_Medium_INT_L_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Applause_L_02
			vol = -6
			pan1x = -1
			pan1y = 1
		}
	]
}
Crowd_Applause_Medium_INT_R_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_MD_Crowd_Applause_R_02
			vol = -6
			pan1x = 1
			pan1y = 1
		}
	]
}
Crowd_Applause_Small_INT_L_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Applause_L_01
			vol = -9
			pan1x = -1
			pan1y = 1
		}
	]
}
Crowd_Applause_Small_INT_R_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			INT_SM_Crowd_Applause_R_01
			vol = -9
			pan1x = 1
			pan1y = 1
		}
	]
}
Battlemode_HeartBeat_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_Battlemode_Heartbeat
			vol = -9.09
			pan1x = -1.0
			pan1y = 1.0
			pan2x = -1.0
			pan2y = 1.0
			num_loops = -1
		}
	]
}
Battlemode_HeartBeat_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GH3_Battlemode_Heartbeat
			vol = -9.09
			pan1x = 1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
			num_loops = -1
		}
	]
}
GH3_Star_FlyIn_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Fly_In_Whoosh
			vol = -5.17
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					1.01
					0.68
					0.34
					0.0
					-0.35000002
				]
			}
		}
	]
}
Battle_Boss_FlyIn_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Fly_In_Whoosh
			vol = 0
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					1.01
					0.68
					0.34
					0.0
					-0.35000002
				]
			}
		}
	]
}
GH3_Score_FlyIn_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Fly_In_Whoosh
			vol = -0.90999997
			pitch = -7.46
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
GH3_Cash_FlyIn_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Fly_In_Whoosh
			vol = -1.41
			pitch = -5.9300003
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
GH3_Score_FlyIn_Hit_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_Song_Intro_Kick
			vol = -7.9300003
		}
	]
}
GH3_Cash_FlyIn_Hit_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Cash
			vol = -4.42
		}
	]
}
jam_sounds_template = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatType
}
Star_Power_Deployed_Front_Gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			star_deployed_front
			vol = -4
			pan1x = -1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
	]
}
Star_Power_Deployed_LFE_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Deployed_LFE
			LFEOnly = true
			LFE_vol = -7
		}
	]
}
Star_Power_Available_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Available
			vol = -7
			pan1x = -1
			pan1y = 0.9811321
			pan2x = 1
			pan2y = 1
		}
	]
}
Star_Power_Release_Front_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Release_Front
			vol = -8
			pan1x = 0.0
			pan1y = 1.0
			pan2x = 0.69
			pan2y = 1.0
		}
	]
}
Star_Power_Deployed_Back_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Deployed_Back
			vol = -6
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
Star_Power_Release_Center_Gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Release_Center
			vol = -8
			pan1x = 0.38000003
			pan1y = 1.0
		}
	]
}
Star_Power_Available_P2_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Available
			vol = 2
			pan1x = 0.58
			pan1y = 1
			pan2x = 1
			pan2y = 0.77
			panRemoveCenter = true
		}
	]
}
Star_Power_Available_P3_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Available
			vol = 2
			pan1x = -0.32000002
			pan1y = 1
			pan2x = 0.32000002
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Star_Power_Deployed_Back_P1_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Deployed_Back
			vol = -7
			pan1x = -1
			pan1y = -0.9811321
			pan2x = -0.38000003
			pan2y = -1
		}
	]
}
Star_Power_Release_Center_P1_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Release_Center
			vol = -8
			pan1x = -1.0
			pan1y = 1.0
		}
	]
}
Star_Power_Deployed_Back_P2_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Deployed_Back
			vol = -7
			pan1x = 1
			pan1y = -1
			pan2x = 0.3962264
			pan2y = -0.9952829
		}
	]
}
Star_Power_Deployed_Back_P3_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Deployed_Back
			vol = -7
			pan1x = -0.3490566
			pan1y = -1
			pan2x = 0.41
			pan2y = -1
		}
	]
}
Star_Power_Release_Front_P2_Gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Release_Front
			vol = -8
			pan1x = 0.54
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.71
		}
	]
}
Star_Power_Release_Front_P3_Gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Release_Front
			vol = -8
			pan1x = -0.32000002
			pan1y = 1.0
			pan2x = 0.32000002
			pan2y = 1.0
		}
	]
}
Star_Power_Deployed_Front_P2_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			star_deployed_front
			vol = -7
			pan1x = 0.48000002
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Star_Power_Deployed_Front_P3_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			star_deployed_front
			vol = -7
			pan1x = -0.32000002
			pan1y = 1
			pan2x = 0.32000002
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Star_Power_Available_P1_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Available
			vol = 2
			pan1x = -1
			pan1y = 0.48000002
			pan2x = -0.48000002
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Star_Power_Release_Center_P2_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Release_Center
			vol = -8
			pan1x = 1.0
			pan1y = 1.0
		}
	]
}
Star_Power_Release_Center_P3_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Release_Center
			vol = -8
			pan1x = 0.0
			pan1y = 1.0
		}
	]
}
Star_Power_Deployed_Front_P1_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			star_deployed_front
			vol = -7
			pan1x = -1
			pan1y = 1
			pan2x = -0.48000002
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Star_Power_Deployed_LFE_P1_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Deployed_LFE
			LFEOnly = true
			LFE_vol = -9
		}
	]
}
Star_Power_Release_Front_P1_Gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Release_Front
			vol = -8
			pan1x = -1.0
			pan1y = 0.48000002
			pan2x = -0.48000002
			pan2y = 1.0
		}
	]
}
Jam_Session_Rhythm_Guitar_Template_template = {
	Default_Priority = 25
	Default_Buss = JamMode_RhythmGuitar
	NoRepeatFor = 0
	InstanceManagement = ignore
	InstanceLimit = 8
	command = PlaySound
	Randomness = RandomNoRepeatType
}
Jam_Fret_Noise_Rhythm_container = {
	Default_Priority = 50
	Default_Buss = JamMode_RhythmGuitar
	NoRepeatFor = 0.5
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Fret_Noise_01
			vol = -12
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			Fret_Noise_02
			vol = -12
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			Fret_Noise_03
			vol = -12
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			Fret_Noise_05
			vol = -12
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			Fret_Noise_06
			vol = -12
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
	]
}
Crowd_Whistle_Large_EXT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			EXT_LG_Crowd_Whistle_01
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_02
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_03
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_04
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_05
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_06
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_07
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_08
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_09
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_10
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_11
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_12
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_13
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_14
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_15
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_16
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_17
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_18
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_19
			vol = -2
		}
		{
			EXT_LG_Crowd_Whistle_20
			vol = -2
		}
	]
}
Crowd_Whistle_Large_INT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			INT_LG_Crowd_Whistle_01
		}
		{
			INT_LG_Crowd_Whistle_02
		}
		{
			INT_LG_Crowd_Whistle_03
		}
		{
			INT_LG_Crowd_Whistle_04
		}
		{
			INT_LG_Crowd_Whistle_05
		}
		{
			INT_LG_Crowd_Whistle_06
		}
		{
			INT_LG_Crowd_Whistle_07
		}
		{
			INT_LG_Crowd_Whistle_08
		}
		{
			INT_LG_Crowd_Whistle_09
		}
		{
			INT_LG_Crowd_Whistle_10
		}
		{
			INT_LG_Crowd_Whistle_11
		}
		{
			INT_LG_Crowd_Whistle_12
		}
		{
			INT_LG_Crowd_Whistle_13
		}
		{
			INT_LG_Crowd_Whistle_14
		}
		{
			INT_LG_Crowd_Whistle_15
		}
		{
			INT_LG_Crowd_Whistle_16
		}
		{
			INT_LG_Crowd_Whistle_17
		}
		{
			INT_LG_Crowd_Whistle_18
		}
		{
			INT_LG_Crowd_Whistle_19
		}
		{
			INT_LG_Crowd_Whistle_20
		}
	]
}
Crowd_Whistle_Medium_EXT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			EXT_MD_Crowd_Whistle_01
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_02
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_03
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_04
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_05
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_06
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_07
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_08
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_09
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_10
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_11
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_12
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_13
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_14
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_15
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_16
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_17
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_18
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_19
			vol = -5
		}
		{
			EXT_MD_Crowd_Whistle_20
			vol = -5
		}
	]
}
Crowd_Whistle_Medium_EXT_Good_01_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			EXT_MD_Crowd_Whistle_01
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_02
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_03
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_04
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_05
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_06
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_07
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_08
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_09
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_10
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_11
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_12
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_13
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_14
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_15
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_16
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_17
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_18
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_19
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_MD_Crowd_Whistle_20
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
	]
}
Crowd_Whistle_Medium_INT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			INT_MD_Crowd_Whistle_01
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_02
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_03
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_04
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_05
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_06
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_07
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_08
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_09
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_10
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_11
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_12
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_13
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_14
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_15
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_16
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_17
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_18
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_19
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_20
			vol = -5
		}
	]
}
Crowd_Whistle_LONDON_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			INT_MD_Crowd_Whistle_01
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_02
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_03
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_04
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_05
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_06
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_07
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_08
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_09
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_10
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_11
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_12
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_13
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_14
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_15
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_16
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_17
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_18
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_19
			vol = -5
		}
		{
			INT_MD_Crowd_Whistle_20
			vol = -5
		}
	]
}
Crowd_Whistle_Small_EXT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			EXT_SM_Crowd_Whistle_01
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_02
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_03
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_04
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_05
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_06
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_07
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_08
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_09
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_10
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_11
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_12
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_13
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_14
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_15
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_16
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_17
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_18
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_19
			dropoff = 50
			dropoff_function = linear
		}
		{
			EXT_SM_Crowd_Whistle_20
			dropoff = 50
			dropoff_function = linear
		}
	]
}
Crowd_Whistle_Small_INT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			INT_SM_Crowd_Whistle_01
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_02
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_03
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_04
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_05
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_06
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_07
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_08
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_09
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_10
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_11
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_12
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_13
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_14
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_15
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_16
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_17
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_18
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_19
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			INT_SM_Crowd_Whistle_20
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
	]
}
Crowd_OneShot_Large_EXT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Cheer_LG_EXT_SG_01
			vol = -6
		}
		{
			Crowd_Cheer_LG_EXT_SG_02
			vol = -6
		}
		{
			Crowd_Cheer_LG_EXT_SG_03
			vol = -6
		}
		{
			Crowd_Cheer_LG_EXT_SG_04
			vol = -6
		}
		{
			Crowd_Cheer_LG_EXT_SG_05
			vol = -6
		}
		{
			Crowd_Cheer_LG_EXT_SG_06
			vol = -6
		}
		{
			Crowd_Cheer_LG_EXT_SG_07
			vol = -6
		}
		{
			Crowd_Cheer_LG_EXT_SG_08
			vol = -6
		}
		{
			Crowd_Cheer_LG_EXT_SG_09
			vol = -6
		}
		{
			Crowd_Cheer_LG_EXT_SG_10
			vol = -6
		}
		{
			Crowd_Cheer_LRG_EXT_GR_01
			vol = -6
		}
		{
			Crowd_Cheer_LRG_EXT_GR_02
			vol = -6
		}
		{
			Crowd_Cheer_LRG_EXT_GR_03
			vol = -6
		}
		{
			Crowd_Cheer_LRG_EXT_GR_04
			vol = -6
		}
		{
			Crowd_Cheer_LRG_EXT_GR_05
			vol = -6
		}
		{
			Crowd_Cheer_LRG_EXT_GR_06
			vol = -6
		}
		{
			Crowd_Cheer_LRG_EXT_GR_08
			vol = -6
		}
		{
			Crowd_Cheer_LRG_EXT_GR_09
			vol = -6
		}
		{
			Crowd_Cheer_LRG_EXT_GR_10
			vol = -6
		}
		{
			EXT_LG_Crowd_Whistle_01
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_02
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_03
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_04
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_05
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_06
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_07
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_08
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_09
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_10
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_11
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_12
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_13
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_14
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_15
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_16
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_17
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_18
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_19
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			EXT_LG_Crowd_Whistle_20
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
	]
}
Crowd_OneShot_Large_INT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			EXT_LG_Crowd_Whistle_01
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_02
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_03
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_04
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_05
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_06
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_07
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_08
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_09
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_10
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_11
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_12
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_13
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_14
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_15
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_16
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_17
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_18
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_19
			vol = -3
		}
		{
			EXT_LG_Crowd_Whistle_20
			vol = -3
		}
	]
}
Crowd_OneShot_Medium_EXT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Cheer_MD_EXT_SG_01
			vol = -6
		}
		{
			Crowd_Cheer_MD_EXT_SG_02
			vol = -6
		}
		{
			Crowd_Cheer_MD_EXT_SG_03
			vol = -6
		}
		{
			Crowd_Cheer_MD_EXT_SG_04
			vol = -6
		}
		{
			Crowd_Cheer_MD_EXT_SG_05
			vol = -6
		}
		{
			Crowd_Cheer_MD_EXT_SG_06
			vol = -6
		}
		{
			Crowd_Cheer_MD_EXT_SG_07
			vol = -6
		}
		{
			Crowd_Cheer_MD_EXT_SG_08
			vol = -6
		}
		{
			Crowd_Cheer_MD_EXT_SG_09
			vol = -6
		}
		{
			Crowd_Cheer_MD_EXT_SG_10
			vol = -6
		}
		{
			Crowd_Cheer_MED_EXT_GR_01
			vol = -8
		}
		{
			Crowd_Cheer_MED_EXT_GR_02
			vol = -8
		}
		{
			Crowd_Cheer_MED_EXT_GR_03
			vol = -8
		}
		{
			Crowd_Cheer_MED_EXT_GR_04
			vol = -8
		}
		{
			Crowd_Cheer_MED_EXT_GR_05
			vol = -8
		}
		{
			Crowd_Cheer_MED_EXT_GR_06
			vol = -8
		}
		{
			Crowd_Cheer_MED_EXT_GR_07
			vol = -8
		}
		{
			Crowd_Cheer_MED_EXT_GR_08
			vol = -8
		}
		{
			Crowd_Cheer_MED_EXT_GR_09
			vol = -8
		}
		{
			Crowd_Cheer_MED_EXT_GR_10
			vol = -8
		}
		{
			EXT_MD_Crowd_Whistle_01
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_02
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_03
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_04
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_05
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_06
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_07
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_08
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_09
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_10
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_11
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_12
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_13
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_14
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_15
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_16
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_17
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_18
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_19
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			EXT_MD_Crowd_Whistle_20
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
	]
}
Crowd_OneShot_Medium_EXT_Good_01_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Cheer_MD_EXT_SG_01
			vol = -12
		}
		{
			Crowd_Cheer_MD_EXT_SG_02
			vol = -12
		}
		{
			Crowd_Cheer_MD_EXT_SG_03
			vol = -12
		}
		{
			Crowd_Cheer_MD_EXT_SG_04
			vol = -12
		}
		{
			Crowd_Cheer_MD_EXT_SG_05
			vol = -12
		}
		{
			Crowd_Cheer_MD_EXT_SG_06
			vol = -12
		}
		{
			Crowd_Cheer_MD_EXT_SG_07
			vol = -12
		}
		{
			Crowd_Cheer_MD_EXT_SG_08
			vol = -12
		}
		{
			Crowd_Cheer_MD_EXT_SG_09
			vol = -12
		}
		{
			Crowd_Cheer_MD_EXT_SG_10
			vol = -12
		}
		{
			Crowd_Cheer_MED_EXT_GR_01
			vol = -12
		}
		{
			Crowd_Cheer_MED_EXT_GR_02
			vol = -12
		}
		{
			Crowd_Cheer_MED_EXT_GR_03
			vol = -12
		}
		{
			Crowd_Cheer_MED_EXT_GR_04
			vol = -12
		}
		{
			Crowd_Cheer_MED_EXT_GR_05
			vol = -12
		}
		{
			Crowd_Cheer_MED_EXT_GR_06
			vol = -12
		}
		{
			Crowd_Cheer_MED_EXT_GR_07
			vol = -12
		}
		{
			Crowd_Cheer_MED_EXT_GR_08
			vol = -12
		}
		{
			Crowd_Cheer_MED_EXT_GR_09
			vol = -12
		}
		{
			Crowd_Cheer_MED_EXT_GR_10
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_01
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_02
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_03
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_04
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_05
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_06
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_07
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_08
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_09
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_10
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_11
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_12
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_13
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_14
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_15
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_16
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_17
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_18
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_19
			vol = -12
		}
		{
			EXT_MD_Crowd_Whistle_20
			vol = -12
		}
	]
}
Crowd_OneShot_Medium_INT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Cheer_MD_INT_SG_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_11
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_12
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_13
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_14
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_15
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_16
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_17
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_18
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_19
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_20
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
	]
}
Crowd_OneShot_Small_EXT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			EXT_LG_Crowd_Whistle_01
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_02
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_03
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_04
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_05
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_06
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_07
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_08
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_09
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_10
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_11
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_12
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_13
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_14
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_15
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_16
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_17
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_18
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_19
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			EXT_LG_Crowd_Whistle_20
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
	]
}
Crowd_OneShot_Small_INT_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Cheer_SM_INT_GR_01
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_GR_02
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_GR_03
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_GR_04
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_GR_05
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_GR_06
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_GR_07
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_GR_08
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_GR_09
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_GR_10
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_SG_01
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_SG_02
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_SG_03
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_SG_04
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_SG_05
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_SG_06
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_SG_07
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_SG_08
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_SG_09
			vol = -8
		}
		{
			Crowd_Cheer_SM_INT_SG_10
			vol = -8
		}
		{
			INT_SM_Crowd_Whistle_01
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_02
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_03
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_04
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_05
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_06
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_07
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_08
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_09
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_10
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_11
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_12
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_13
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_14
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_15
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_16
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_17
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_18
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_19
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			INT_SM_Crowd_Whistle_20
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
	]
}
Crowd_OneShot_Large_EXT_Bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Boo_GRP_Large_EXT_01
			vol = -1
		}
		{
			Crowd_Boo_GRP_Large_EXT_02
			vol = -1
		}
		{
			Crowd_Boo_GRP_Large_EXT_03
			vol = -1
		}
		{
			Crowd_Boo_GRP_Large_EXT_04
			vol = -1
		}
		{
			Crowd_Boo_GRP_Large_EXT_05
			vol = -1
		}
		{
			Crowd_Boo_GRP_Large_EXT_06
			vol = -1
		}
		{
			Crowd_Boo_GRP_Large_EXT_07
			vol = -1
		}
		{
			Crowd_Boo_GRP_Large_EXT_08
			vol = -1
		}
		{
			Crowd_Boo_GRP_Large_EXT_09
			vol = -1
		}
		{
			Crowd_Boo_GRP_Large_EXT_10
			vol = -1
		}
		{
			Crowd_Boo_LRG_Outdoor_SG_01
			vol = -1
		}
		{
			Crowd_Boo_LRG_Outdoor_SG_02
			vol = -1
		}
		{
			Crowd_Boo_LRG_Outdoor_SG_03
			vol = -1
		}
		{
			Crowd_Boo_LRG_Outdoor_SG_04
			vol = -1
		}
		{
			Crowd_Boo_LRG_Outdoor_SG_05
			vol = -1
		}
		{
			Crowd_Boo_LRG_Outdoor_SG_06
			vol = -1
		}
		{
			Crowd_Boo_LRG_Outdoor_SG_07
			vol = -1
		}
		{
			Crowd_Boo_LRG_Outdoor_SG_08
			vol = -1
		}
		{
			Crowd_Boo_LRG_Outdoor_SG_09
			vol = -1
		}
		{
			Crowd_Boo_LRG_Outdoor_SG_10
			vol = -1
		}
	]
}
Crowd_OneShot_Large_INT_Bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Boo_Sm_01
			vol = -1
		}
		{
			Crowd_Boo_Sm_02
			vol = -1
		}
		{
			Crowd_Boo_Sm_03
			vol = -1
		}
		{
			Crowd_Boo_Sm_04
			vol = -1
		}
		{
			Crowd_Boo_Sm_05
			vol = -1
		}
		{
			Crowd_Boo_Sm_06
			vol = -1
		}
		{
			Crowd_Boo_Sm_07
			vol = -1
		}
		{
			Crowd_Boo_Sm_08
			vol = -1
		}
		{
			Crowd_Boo_Sm_09
			vol = -1
		}
		{
			Crowd_Boo_Sm_10
			vol = -1
		}
	]
}
Crowd_OneShot_Medium_EXT_Bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Boo_GRP_Medium_EXT_01
			vol = 0
		}
		{
			Crowd_Boo_GRP_Medium_EXT_02
			vol = 0
		}
		{
			Crowd_Boo_GRP_Medium_EXT_03
			vol = 0
		}
		{
			Crowd_Boo_GRP_Medium_EXT_04
			vol = 0
		}
		{
			Crowd_Boo_GRP_Medium_EXT_05
			vol = 0
		}
		{
			Crowd_Boo_GRP_Medium_EXT_06
			vol = 0
		}
		{
			Crowd_Boo_GRP_Medium_EXT_07
			vol = 0
		}
		{
			Crowd_Boo_GRP_Medium_EXT_08
			vol = 0
		}
		{
			Crowd_Boo_GRP_Medium_EXT_09
			vol = 0
		}
		{
			Crowd_Boo_GRP_Medium_EXT_10
			vol = 0
		}
		{
			Crowd_Boo_MED_Outdoor_SG_01
			vol = 0
		}
		{
			Crowd_Boo_MED_Outdoor_SG_02
			vol = 0
		}
		{
			Crowd_Boo_MED_Outdoor_SG_03
			vol = 0
		}
		{
			Crowd_Boo_MED_Outdoor_SG_04
			vol = 0
		}
		{
			Crowd_Boo_MED_Outdoor_SG_05
			vol = 0
		}
		{
			Crowd_Boo_MED_Outdoor_SG_06
			vol = 0
		}
		{
			Crowd_Boo_MED_Outdoor_SG_07
			vol = 0
		}
		{
			Crowd_Boo_MED_Outdoor_SG_08
			vol = 0
		}
		{
			Crowd_Boo_MED_Outdoor_SG_09
			vol = 0
		}
		{
			Crowd_Boo_MED_Outdoor_SG_10
			vol = 0
		}
	]
}
Crowd_OneShot_Medium_INT_Bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Boo_GRP_Medium_INT_01
			vol = 3
		}
		{
			Crowd_Boo_GRP_Medium_INT_02
			vol = 3
		}
		{
			Crowd_Boo_GRP_Medium_INT_03
			vol = 3
		}
		{
			Crowd_Boo_GRP_Medium_INT_04
			vol = 3
		}
		{
			Crowd_Boo_GRP_Medium_INT_05
			vol = 3
		}
		{
			Crowd_Boo_GRP_Medium_INT_06
			vol = 3
		}
		{
			Crowd_Boo_GRP_Medium_INT_07
			vol = 3
		}
		{
			Crowd_Boo_GRP_Medium_INT_08
			vol = 3
		}
		{
			Crowd_Boo_GRP_Medium_INT_09
			vol = 3
		}
		{
			Crowd_Boo_GRP_Medium_INT_10
			vol = 3
		}
		{
			Crowd_Boo_MED_Indoor_SG_01
			vol = 3
		}
		{
			Crowd_Boo_MED_Indoor_SG_02
			vol = 3
		}
		{
			Crowd_Boo_MED_Indoor_SG_03
			vol = 3
		}
		{
			Crowd_Boo_MED_Indoor_SG_04
			vol = 3
		}
		{
			Crowd_Boo_MED_Indoor_SG_05
			vol = 3
		}
		{
			Crowd_Boo_MED_Indoor_SG_06
			vol = 3
		}
		{
			Crowd_Boo_MED_Indoor_SG_07
			vol = 3
		}
		{
			Crowd_Boo_MED_Indoor_SG_08
			vol = 3
		}
		{
			Crowd_Boo_MED_Indoor_SG_09
			vol = 3
		}
		{
			Crowd_Boo_MED_Indoor_SG_10
			vol = 3
		}
	]
}
Crowd_OneShot_Small_EXT_Bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Boo_Sm_01
			vol = -1
		}
		{
			Crowd_Boo_Sm_02
			vol = -1
		}
		{
			Crowd_Boo_Sm_03
			vol = -1
		}
		{
			Crowd_Boo_Sm_04
			vol = -1
		}
		{
			Crowd_Boo_Sm_05
			vol = -1
		}
		{
			Crowd_Boo_Sm_06
			vol = -1
		}
		{
			Crowd_Boo_Sm_07
			vol = -1
		}
		{
			Crowd_Boo_Sm_08
			vol = -1
		}
		{
			Crowd_Boo_Sm_09
			vol = -1
		}
		{
			Crowd_Boo_Sm_10
			vol = -1
		}
	]
}
Crowd_OneShot_Small_INT_Bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Boo_GRP_Small_INT_01
			vol = -1
		}
		{
			Crowd_Boo_GRP_Small_INT_02
			vol = -1
		}
		{
			Crowd_Boo_GRP_Small_INT_03
			vol = -1
		}
		{
			Crowd_Boo_GRP_Small_INT_04
			vol = -1
		}
		{
			Crowd_Boo_GRP_Small_INT_05
			vol = -1
		}
		{
			Crowd_Boo_GRP_Small_INT_06
			vol = -1
		}
		{
			Crowd_Boo_GRP_Small_INT_07
			vol = -1
		}
		{
			Crowd_Boo_GRP_Small_INT_08
			vol = -1
		}
		{
			Crowd_Boo_GRP_Small_INT_09
			vol = -1
		}
		{
			Crowd_Boo_GRP_Small_INT_10
			vol = -1
		}
		{
			Crowd_Boo_SM_Indoor_SG_01
			vol = -1
		}
		{
			Crowd_Boo_SM_Indoor_SG_02
			vol = -1
		}
		{
			Crowd_Boo_SM_Indoor_SG_03
			vol = -1
		}
		{
			Crowd_Boo_SM_Indoor_SG_04
			vol = -1
		}
		{
			Crowd_Boo_SM_Indoor_SG_05
			vol = -1
		}
		{
			Crowd_Boo_SM_Indoor_SG_06
			vol = -1
		}
		{
			Crowd_Boo_SM_Indoor_SG_07
			vol = -1
		}
		{
			Crowd_Boo_SM_Indoor_SG_08
			vol = -1
		}
		{
			Crowd_Boo_SM_Indoor_SG_09
			vol = -1
		}
		{
			Crowd_Boo_SM_Indoor_SG_10
			vol = -1
		}
	]
}
Large_EXT_Crowd_Positive_Swell_Layer_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			EXT_LG_Crowd_Whistle_01
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_02
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_03
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_04
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_05
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_06
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_07
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_08
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_09
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_10
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_11
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_12
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_13
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_14
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_15
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_16
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_17
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_18
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_19
			vol = 8
		}
		{
			EXT_LG_Crowd_Whistle_20
			vol = 8
		}
	]
}
Jam_Rhythm_Event_container = {
	Template = Jam_Session_Rhythm_Guitar_Template
	command = PlaySound
	Randomness = RandomNoRepeatType
}
Jam_Lead_Event_container = {
	Default_Priority = 50
	Default_Buss = JamMode_LeadGuitar
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatType
}
Jam_Bass_Event_container = {
	Default_Priority = 50
	Default_Buss = JamMode_Bass
	NoRepeatFor = 0
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	command = PlaySound
	Randomness = RandomNoRepeatType
}
GH4_Jam_Mode_Bass_Template_template = {
	Default_Priority = 50
	Default_Buss = JamMode_Bass
	NoRepeatFor = 0
	InstanceManagement = ignore
	InstanceLimit = 8
	command = PlaySound
	Randomness = RandomNoRepeatType
}
Jam_Fret_Noise_bass_short_container = {
	Default_Priority = 25
	Default_Buss = JamMode_Bass
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			fj_b_fretnoise_s_01
			vol = 1
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fj_b_fretnoise_s_02
			vol = 1
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fj_b_fretnoise_s_03
			vol = 1
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
	]
}
Jam_Fret_Noise_bass_medium_container = {
	Default_Priority = 25
	Default_Buss = JamMode_Bass
	NoRepeatFor = 0.6
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			fj_b_fretnoise_m_01
			vol = -7
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fj_b_fretnoise_m_02
			vol = -7
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fj_b_fretnoise_m_03
			vol = -7
			priority = 1
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
	]
}
Guitar_Affirmation_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.5
	InstanceManagement = ignore
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Guitar_Select_Affirmation_1
		}
	]
}
Guitar_Lick_Crowd_Swell_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
}
Song_Affirmation_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Song_Affirmation_01
			vol = -5
		}
		{
			Song_Affirmation_02
			vol = -5
		}
		{
			Song_Affirmation_03
			vol = -5
		}
		{
			Song_Affirmation_05
			vol = -5
		}
		{
			Song_Affirmation_06
			vol = -5
		}
	]
}
Drum_Affirmation_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Drum_Select_Affirmation_01
		}
	]
}
Mic_Affirmation_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomType
	Sounds = [
		{
			Mic_Select_Affirmation_01
		}
	]
}
Bass_Affirmation_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Bass_Select_Affirmation_02
		}
	]
}
Crowd_Clap_To_Beat_Small_INT_Normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Small_INT_01
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_02
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_03
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_04
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_05
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_06
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Small_INT_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Small_INT_01
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_02
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_03
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_04
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_05
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_06
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Small_INT_Right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Small_INT_01
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_02
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_03
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_04
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_05
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_06
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Small_INT_Left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Small_INT_01
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_02
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_03
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_04
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_05
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_06
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Small_INT_Right_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Small_INT_01
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_02
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_03
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_04
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_05
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_06
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Small_INT_Left_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Small_INT_01
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_02
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_03
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_04
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_05
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			Crowd_Clap_Small_INT_06
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_INT_Normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_INT_01
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_02
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_03
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_04
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_05
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_06
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_INT_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_INT_01
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_02
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_03
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_04
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_05
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_06
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_INT_Left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_INT_01
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_02
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_03
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_04
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_05
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_06
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_INT_Right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_INT_01
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_02
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_03
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_04
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_05
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_06
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_INT_Left_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_INT_01
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_02
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_03
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_04
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_05
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_06
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_INT_Right_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_INT_01
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_02
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_03
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_04
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_05
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_INT_06
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Large_EXT_Normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Large_EXT_01
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_02
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_03
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_04
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_05
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_06
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Large_EXT_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Large_EXT_01
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_02
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_03
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_04
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_05
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_06
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Large_EXT_Right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Large_EXT_01
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_02
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_03
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_04
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_05
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_06
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Large_EXT_Left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Large_EXT_01
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_02
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_03
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_04
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_05
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_06
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Large_EXT_Right_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Large_EXT_01
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_02
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_03
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_04
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_05
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_06
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Large_EXT_Left_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Large_EXT_01
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_02
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_03
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_04
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_05
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			Crowd_Clap_Large_EXT_06
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_EXT_Normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_EXT_01
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_02
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_03
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_04
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_05
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_06
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_EXT_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_EXT_01
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_02
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_03
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_04
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_05
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_06
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_EXT_Left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_EXT_01
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_02
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_03
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_04
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_05
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_06
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_EXT_Right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_EXT_01
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_02
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_03
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_04
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_05
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_06
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_EXT_Left_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_EXT_01
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_02
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_03
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_04
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_05
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_06
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_Medium_EXT_Right_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Clap_Medium_EXT_01
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_02
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_03
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_04
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_05
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_Medium_EXT_06
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Menu_Scroll_End_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Select_Negative
			vol = -6
		}
	]
}
Audio_Options_Fader_End_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.5
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Select_Negative
			vol = -1
		}
	]
}
Jam_Fret_Noise_Lead_container = {
	Default_Priority = 1
	Default_Buss = JamMode_LeadGuitar
	NoRepeatFor = 0.75
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Fret_Noise_07
			vol = -6
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			Fret_Noise_08
			vol = -6
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			Fret_Noise_09
			vol = -6
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			Fret_Noise_10
			vol = -6
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			Fret_Noise_11
			vol = -6
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
	]
}
Crowd_Reaction_Bad_L_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 15
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Crowd_Reaction_Bad_L
			vol = 4
			pan1x = -1.0
			pan1y = 1.0
		}
	]
}
Crowd_Reaction_Bad_R_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 15
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Crowd_Reaction_Bad_R
			vol = 4
			pan1x = 1.0
			pan1y = 1.0
		}
	]
}
StartTestTones_Sine_container = {
	Default_Priority = 75
	Default_Buss = Band_Playback
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
}
StartTestTones_Pink_container = {
	Default_Priority = 75
	Default_Buss = Band_Playback
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
}
UI_Fader_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.0
	InstanceManagement = ignore
	InstanceLimit = 10
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Options_Sound_Fader_Move
			vol = 4
		}
	]
}
UI_Knob_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.0
	InstanceManagement = ignore
	InstanceLimit = 10
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Options_Sound_EQKnob_Move
		}
	]
}
Dolby_Off_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Options_Sound_DolbyDigitalDisable
		}
	]
}
Sound_Options_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Options_Sound_Select
		}
	]
}
Sound_Options_Back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Options_Sound_Back
			vol = -5
		}
	]
}
Menu_HeadToHead_ZoomOut_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ZoomOut_HeadToHead
		}
	]
}
GigBoard_Zoom_Left_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Gigboard_CameraPan_Left
			vol = -11
		}
	]
}
Boss_Battle_Press_Sound_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Gigboard_CameraPan_Left
			vol = 0
		}
	]
}
GigBoard_Zoom_Right_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Gigboard_CameraPan_Right
			vol = -11
		}
	]
}
Menu_Career_ZoomIn_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ZoomIn_Career
			vol = -4
		}
	]
}
Menu_Career_ZoomOut_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ZoomOut_Career
			vol = 0
		}
	]
}
Menu_Options_ZoomOut_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ZoomOut_Options
			vol = -7
		}
	]
}
Menu_Options_ZoomIn_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ZoomIn_Options
			vol = -2
		}
	]
}
Menu_HeadToHead_ZoomIn_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ZoomIn_HeadToHead
			vol = -4
		}
	]
}
ColorWheel_Rotate_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 8
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_Rotate
		}
	]
}
ColorWheel_Deselect_PiePiece_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_Deselect_PiePiece
		}
	]
}
ColorWheel_HighLight_1_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_HighLight_Up_Down_1
			vol = 3
		}
	]
}
ColorWheel_SelectColor_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_SelectColor
		}
	]
}
ColorWheel_GradientSelect_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_GradientSelect
		}
	]
}
ColorWheel_SelectPie_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_SelectPie
		}
	]
}
ColorWheel_ChoosePie_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_SelectPie
		}
	]
}
ColorWheel_FocusPie_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_SelectPie
		}
	]
}
ColorWheel_SelectShade_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_SelectShade
		}
	]
}
Enter_Band_Name_Scroll_Down_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Menu_EnterName_Scroll_2
			vol = -1
		}
		{
			Menu_EnterName_Scroll_3
			vol = -1
		}
	]
}
Enter_Band_Name_Scroll_Up_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_EnterName_Scroll_1
			pitch = 1
			vol = -1
		}
	]
}
Enter_Band_Name_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 8
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			ui_sound_05
			vol = -1
		}
	]
}
Recording_Start_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			JamMode_DPad_RecordingStart
		}
	]
}
Recording_Stop_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			JamMode_DPad_RecordingStop
			vol = -5
		}
	]
}
DPad_Stop_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			JamMode_DPad_Stop
			vol = -5
		}
	]
}
DPad_Play_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			JamMode_DPad_Play
		}
	]
}
GhMix_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			JamMode_DPad_Play
			vol = 5
		}
	]
}
GhMix_Back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			JamMode_DPad_Stop
			vol = -5
		}
	]
}
GhMix_Scroll_Up_Down_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Options_Sound_up_down
			vol = 6
		}
	]
}
Line6_Scroll_Up_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Options_Sound_up_down
			vol = 6
		}
	]
}
Line6_Scroll_Down_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Options_Sound_up_down
			vol = 6
		}
	]
}
Online_Instrument_Change_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			JamMode_DPad_Play
			vol = 5
		}
	]
}
Scale_Scroll_Up_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			JamMode_DPad_Play
			vol = 5
			pitch = 1
		}
	]
}
Scale_Scroll_Down_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			JamMode_DPad_Play
			vol = 5
		}
	]
}
audio_options_up_down_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Options_Sound_up_down
			vol = 6
		}
	]
}
Audio_Options_Menu_Guitar_container = {
	Default_Priority = 50
	Default_Buss = Options_Guitar
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Audio_Options_Guitar
			vol = -12
		}
	]
}
Audio_Options_Menu_Bass_container = {
	Default_Priority = 50
	Default_Buss = Options_Bass
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Audio_Options_Bass
			vol = -12
		}
	]
}
Audio_Options_Menu_Drums_container = {
	Default_Priority = 50
	Default_Buss = Options_Drums
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Audio_Options_Drum
			vol = -12
		}
	]
}
Audio_Options_Menu_Vocals_container = {
	Default_Priority = 50
	Default_Buss = Options_Vox
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Audio_Options_Vocals
			vol = -12
		}
	]
}
Audio_Options_Menu_SFX_container = {
	Default_Priority = 50
	Default_Buss = Options_Crowd
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Audio_Options_SFX
			vol = -4
		}
	]
}
GHTunes_UI_Scroll_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHTunes_Menu_Scroll
			vol = -2
			pitch = 4
		}
	]
}
GHTunes_UI_Scroll_Pan_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
}
GHTunes_UI_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHTunes_Select
		}
	]
}
GHTunes_UI_Back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHTunes_Back
		}
	]
}
Pause_Menu_Enter_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Into_PauseMenu
			vol = -1
			pitch = -2
		}
	]
}
Enter_Band_Name_Finish_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_EnterName_Finish_01
			vol = -2
		}
	]
}
Enter_Band_Name_Back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_QuickPlay_RemoveSong
			vol = -6
		}
	]
}
Band_Mode_Career_Ready_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Band_Mode_Ready
		}
	]
}
Gh4_GigComplete_Sponsor_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Gig_Complete_Sponsor
			vol = -1
		}
	]
}
GH4_Online_UI_05_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Online_UI_SFX_05
		}
	]
}
GH4_Online_UI_02_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Online_UI_SFX_02
		}
	]
}
GH4_Online_UI_03_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Online_UI_SFX_03
		}
	]
}
GH4_Online_UI_04_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Online_UI_SFX_04
		}
	]
}
GH4_Online_UI_01_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Online_UI_SFX_01
		}
	]
}
Menu_Purchase_Item_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Purchase_Item
			vol = -3
		}
	]
}
Menu_Text_Zoom_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Text_Zoom_In
		}
	]
}
Menu_Text_Zoom_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Text_Zoom_Out
		}
	]
}
Menu_Character_Bio_Panel_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Character_Bio
			vol = -10
		}
	]
}
Camera_Transition_Difficulty_to_VIP_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Transition_Difficulty_to_VIP
		}
	]
}
ColorWheel_HighLight_4_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_HighLight_Up_Down_4
		}
	]
}
ColorWheel_HighLight_2_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_HighLight_Up_Down_2
		}
	]
}
ColorWheel_HighLight_3_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_HighLight_Up_Down_3
		}
	]
}
ColorWheel_HighLight_5_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ColorWheel_HighLight_Up_Down_5
		}
	]
}
Menu_Recording_Pause_Panel_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Jam_Pause_Panel_In
			vol = -14
		}
	]
}
Jam_Advanced_Record_Pause_Panel_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Jam_Advanced_Pause_Out
			pitch = 4
			vol = -2
		}
	]
}
Jam_Advanced_Record_Pause_Panel_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Jam_Advanced_Pause_In
			vol = 6
			pitch = 2
		}
	]
}
Online_Panel_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Jam_Advanced_Pause_Out
			pitch = 4
			vol = -2
		}
	]
}
Online_Panel_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Jam_Advanced_Pause_In
			vol = 2
			pitch = 2
		}
	]
}
Online_Main_Panel_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Jam_Pause_Panel_In
			vol = -14
		}
	]
}
Menu_Recording_Pause_Panel_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Jam_Pause_Panel_Out
			vol = -14
		}
	]
}
OneShotsBetweenSongs_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
}
SurgeBetweenSongs_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
}
Large_EXT_Crowd_Song_Transition_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Large_EXT_Crowd_Song_Transition
		}
	]
}
Medium_INT_Crowd_Song_Transition_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Medium_INT_Crowd_Song_Transition
		}
	]
}
UI_SFX_Scroll_Up_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Scroll_Up
			vol = -8
		}
	]
}
UI_SFX_Scroll_Down_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Scroll_Down
			vol = -4.5
		}
	]
}
UI_SFX_Negative_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 8
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Select_Negative
			vol = -8
		}
	]
}
Enter_Band_Name_Caps_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_EnterName_Caps
			vol = -4
		}
	]
}
Menu_Character_Bio_Panel_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Character_Bio_Out
			vol = -18
		}
	]
}
Song_Wizard_On_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_JamMode_SongWizard_ON
			vol = -1
		}
	]
}
Song_Wizard_Off_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_JamMode_SongWizard_OFF
			vol = -1
		}
	]
}
Jam_Mode_FXHUD_Off_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_JamMode_FXHUD_Off
			vol = -2
		}
	]
}
Jam_Mode_FXHUD_ON_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_JamMode_FXHUD_On
			vol = -10
		}
	]
}
Menu_Audio_Options_Reset_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SoundOptions_Menu_Reset
			vol = 0
		}
	]
}
Menu_Cheat_Enter_Red_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Cheat_Red
			vol = -5
		}
	]
}
Menu_Cheat_Enter_Green_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Cheat_Green
			vol = -5
		}
	]
}
Menu_Cheat_Enter_Blue_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Cheat_Blue
			vol = -5
		}
	]
}
Menu_Cheat_Enter_Yellow_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Cheat_Yellow
			vol = -5
		}
	]
}
Gig_Board_Zoom_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ZoomOut_Career
			vol = -1
		}
	]
}
Gig_Board_Zoom_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ZoomIn_Career
			vol = -15
		}
	]
}
Large_Guitar_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Guitar_Smash_Large_GH4_01
			vol = 3
		}
		{
			Guitar_Smash_Large_GH4_02
			vol = 3
		}
		{
			Guitar_Smash_Large_GH4_04
			vol = 3
		}
		{
			Guitar_Smash_Large_GH4_06
			vol = 3
		}
	]
}
Medium_Guitar_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Guitar_Smash_Medium_GH4_01
			vol = 3
		}
		{
			Guitar_Smash_Medium_GH4_02
			vol = 3
		}
		{
			Guitar_Smash_Medium_GH4_03
			vol = 3
		}
	]
}
Mic_Feedback_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Mic_Feedback_GH4_01
			vol = 4
		}
		{
			Mic_Feedback_GH4_02
			vol = 4
		}
		{
			Mic_Feedback_GH4_03
			vol = 4
		}
		{
			Mic_Feedback_GH4_04
			vol = 4
		}
	]
}
Small_Guitar_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Guitar_Smash_Small_GH4_01
			vol = 3
		}
		{
			Guitar_Smash_Small_GH4_02
			vol = 3
		}
		{
			Guitar_Smash_Small_GH4_03
			vol = 3
		}
		{
			Guitar_Smash_Small_GH4_04
			vol = 3
		}
		{
			Guitar_Smash_Small_GH4_05
			vol = 3
		}
	]
}
Mic_Grab_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Mic_Grab_GH4_04
			vol = 11
		}
		{
			Mic_Grab_GH4_05
			vol = 11
		}
	]
}
Singer_Anims_WIN_01_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Singer_Win_Anim_1_02
		}
		{
			Singer_Win_Anim_2_01
		}
		{
			Singer_Win_Anim_3_01
			vol = -3
		}
		{
			Singer_Win_Anim_2_02
		}
	]
}
Bass_Anims_WIN_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Bass_Win_Anim_1_01
		}
		{
			Bass_Win_Anim_1_02
		}
		{
			Bass_Win_Anim_2_01
		}
		{
			Bass_Win_Anim_2_02
		}
		{
			Bass_Win_Anim_3_01
		}
		{
			Bass_Win_Anim_3_02
		}
		{
			Bass_Win_Anim_4_01
		}
		{
			Bass_Win_Anim_4_02
		}
	]
}
Guitar_Anims_WIN_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Guitar_Win_Anim_1_01
		}
		{
			Guitar_Win_Anim_1_02
		}
		{
			Guitar_Win_Anim_2_01
		}
		{
			Guitar_Win_Anim_2_02
		}
		{
			Guitar_Win_Anim_3_01
		}
		{
			Guitar_Win_Anim_3_02
		}
		{
			Guitar_Win_Anim_4_01
		}
		{
			Guitar_Win_Anim_4_02
		}
		{
			Guitar_Win_Anim_5_01
		}
	]
}
Drum_Anims_WIN_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Drum_Win_Anim_1_01
		}
		{
			Drum_Win_Anim_1_02
		}
		{
			Drum_Win_Anim_2_01
		}
		{
			Drum_Win_Anim_2_02
		}
		{
			Drum_Win_Anim_3_01
		}
		{
			Drum_Win_Anim_3_02
		}
	]
}
Drummer_Sticks_Throw_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Drummer_StickThrow_02
			vol = 4
		}
		{
			Drummer_StickThrow_03
			vol = 4
		}
		{
			Drummer_StickThrow_04
			vol = 4
		}
	]
}
Drummer_Tom_Hit_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Drummer_Tom_01
		}
		{
			Drummer_Tom_02
		}
	]
}
Drummer_Snare_Hit_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Drummer_Snare_01
		}
		{
			Drummer_Snare_02
		}
	]
}
Large_Bass_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Bass_Smash_Large_GH4_01
			vol = 5
		}
		{
			Bass_Smash_Large_GH4_02
			vol = 5
		}
	]
}
Medium_Bass_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Bass_Smash_Medium_GH4_01
			vol = 5
		}
		{
			Bass_Smash_Medium_GH4_02
			vol = 5
		}
	]
}
Small_Bass_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Bass_Smash_Small_GH4_01
			vol = 5
		}
		{
			Bass_Smash_Small_GH4_02
			vol = 5
		}
	]
}
Mic_Hit_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 3
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Mic_Grab_GH4_02
			vol = 15
		}
		{
			Mic_Grab_GH4_03
			vol = 15
		}
	]
}
Select_Band_Leader_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Band_leader_affirmation
			vol = -1
		}
	]
}
Save_Confirmed_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
}
Gigboard_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			ui_sound_05
			vol = -3
		}
	]
}
Gigboard_Select_back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			UI_Sound_09
			vol = -5.5
		}
	]
}
QuickPlay_Remove_Song_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_QuickPlay_RemoveSong
			vol = 0
		}
	]
}
QuickPlay_Select_Song_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_QuickPlay_SelectSong
			vol = -4
		}
	]
}
QuickPlay_Remove_All_Songs_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_QuickPlay_RemoveSong
		}
	]
}
Menu_Song_Complete_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SongComplete_Out
			vol = -10
		}
	]
}
Menu_Song_Complete_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			SongComplete_In
			vol = -9
		}
	]
}
Unlock_New_Item_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GigComplete_Unlock_New_Item
			vol = -5
		}
	]
}
Menu_Band_Ready_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Band_Mode_Ready
		}
	]
}
GH_SFX_BattleMode_Mine_Explode_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Battle_MineAttack_Explode
			vol = -6
			pan1x = 1
			pan1y = 0.44339618
			pan2x = 0.5424528
			pan2y = 1
		}
	]
}
GH_SFX_BattleMode_Mine_Explode_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Battle_MineAttack_Explode
			vol = -6
			pan1x = -1
			pan1y = 0.5707547
			pan2x = -0.5235849
			pan2y = 1
		}
	]
}
GH_SFX_BattleMode_Mine_Release_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Battle_MineAttack_Release
			pan1x = -1
			pan1y = 0.68867916
			pan2x = -0.6179245
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
GH_SFX_BattleMode_Mine_Release_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Battle_MineAttack_Release
			pan1x = 1
			pan1y = 0.5707547
			pan2x = 0.5707547
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
GHTunes_On_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_JamMode_SongWizard_ON
			vol = -1
			pitch = 2
		}
	]
}
GHTunes_Off_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_JamMode_SongWizard_OFF
			vol = -1
			pitch = 4
		}
	]
}
Menu_CAR_ZoomIn_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ZoomOut_Career
			vol = -4
			pitch = 7
		}
	]
}
Menu_CAR_ZoomOut_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_ZoomOut_Career
			vol = -4
			pitch = 3
		}
	]
}
Vocal_Highway_Appear_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Highway_Vocal_Remix_NoFeedBack
			vol = -6
		}
	]
}
Character_Reset_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Menu_Restore_Defaults
			vol = 5
		}
	]
}
GHTunes_Warning_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHTunes_Scroll_Warning
		}
	]
}
Do_Or_Die_SFX_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			DoOrDie
			vol = -3
		}
	]
}
Medium_EXT_Encore_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Encore_Loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Medium_EXT_Encore_Crowd
			num_loops = -1
			vol = -6
			attack_time = 0.5
			attack_function = linear
		}
	]
}
Large_EXT_Encore_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Encore_Loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Large_EXT_Encore_Crowd
			num_loops = -1
			vol = -10
			attack_time = 2.5
			attack_function = linear
		}
	]
}
Medium_INT_Encore_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Encore_Loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Medium_INT_Encore_Crowd
			num_loops = -1
			vol = -6
			attack_time = 0.5
			attack_function = linear
		}
	]
}
Small_INT_Encore_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Encore_Loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Small_INT_Encore_Crowd
			num_loops = -1
			vol = -8
			attack_time = 0.5
			attack_function = linear
		}
	]
}
Unlock_Item_Text_Appear_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GigComplete_Unlock_Item_Text_Appear
			vol = -2
		}
	]
}
Battle_Boss_Whoosh2_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GigComplete_Unlock_Item_Text_Appear
			vol = 4
		}
	]
}
GigComplete_Magazine_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Gig_Complete_Magazine_Out
			vol = 5
		}
	]
}
GigComplete_Magazine_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Gig_Complete_Magazine_In
			vol = 5
		}
	]
}
Loading_Crowd_Long_Burst_container = {
	Default_Priority = 100
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_LG_L_02
			pan1x = -1
			pan1y = 1
		}
		{
			EXT_MD_Crowd_Swell_LG_R_02
			pan1x = 1
			pan1y = 1
		}
	]
}
Loading_Crowd_Medium_Burst_container = {
	Default_Priority = 100
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_MD_L_02
			pan1x = -1
			pan1y = 1
		}
		{
			EXT_MD_Crowd_Swell_MD_R_02
			pan1x = 1
			pan1y = 1
		}
	]
}
Loading_Crowd_Short_Burst_container = {
	Default_Priority = 100
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			EXT_MD_Crowd_Swell_SH_L_02
			vol = 6.5
			pan1x = -1
			pan1y = 1
		}
		{
			EXT_MD_Crowd_Swell_SH_R_02
			vol = 6.5
			pan1x = 1
			pan1y = 1
		}
	]
}
Fireworks_Last_Venue_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Last_Venue_Fireworks
			vol = -2
		}
	]
}
Pyro_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Pyro_2
			vol = -2
		}
		{
			Pyro_1
			vol = -2
		}
	]
}
Select_Sound_Big_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			ui_sound_05
		}
	]
}
PreCutscene_Sfx_container = {
	Default_Priority = 50
	Default_Buss = binkcutscenes
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Pre_Cutscence_SFX
			vol = -18
		}
	]
}
GHM_TrappedUnderIce_Release_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_TrappedUnderIce_Release
			vol = -4
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.24528301
		}
	]
}
GHM_HitTheLights_Release_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_HitTheLights_Release
			vol = -1.5
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.103773
		}
	]
}
GHM_DamageInc_Attack_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_DamageInc_Attack
			vol = -2
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.2783019
		}
	]
}
GHM_RideTheLightning_Attack_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_RideTheLightning_Attack
			vol = -4
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.1037736
		}
	]
}
GHM_RideTheLightning_Release_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_RideTheLightning_Release
			vol = -4
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.16509429
		}
	]
}
GHM_HitTheLights_Attack_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_HitTheLights_Attack
			vol = -1
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.24056602
		}
	]
}
GHM_TrappedUnderIce_Attack_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_TrappedUnderIce_Attack
			vol = -5
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.24056602
		}
	]
}
GHM_TrappedUnderIce_Attack_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_TrappedUnderIce_Attack
			vol = -5
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.2216981
		}
	]
}
GHM_TrappedUnderIce_Release_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_TrappedUnderIce_Release
			vol = -4
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.2216981
		}
	]
}
GHM_RideTheLightning_Attack_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_RideTheLightning_Attack
			vol = -4
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.19811319
		}
	]
}
GHM_HitTheLights_Attack_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_HitTheLights_Attack
			vol = -1
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.2216981
		}
	]
}
GHM_DamageInc_Attack_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_DamageInc_Attack
			vol = -2
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.2216981
		}
	]
}
GHM_HitTheLights_Release_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_HitTheLights_Release
			vol = -1.5
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.1415094
		}
	]
}
GHM_RideTheLightning_Release_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			GHM_RideTheLightning_Release
			vol = -4
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.19339621
		}
	]
}
Star_Get_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Star_Get
			vol = -2
			pan1x = -1
			pan1y = 1
			pan2x = 0.3962264
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
z_icecave_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			IceCave_Intro
			vol = 10
		}
	]
}
z_mop_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			mop_Intro
			vol = 4.5
		}
	]
}
z_stone_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			stone_intro
			vol = 6
		}
	]
}
z_metalfest_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			metalfest_intro
		}
	]
}
z_donington_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			donnington_Intro
			vol = 5
		}
	]
}
z_justice_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			justice_Intro
			vol = 9
		}
	]
}
z_tushino_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			tushino_intro
			vol = 6
		}
	]
}
z_soundcheck2_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			z_soundcheck2_intro
			vol = 6
		}
	]
}
z_studio_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			studio2_Intro
			vol = 6
		}
	]
}
z_studio_intro2_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			studio2_Intro
			vol = 6
		}
	]
}
ui_band_mode_choose_sound_spawned_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = ignore
	InstanceLimit = 4
	command = PlaySound
	Randomness = none
}
ui_band_mode_choose_sound_ready_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = ignore
	InstanceLimit = 4
	command = PlaySound
	Randomness = none
}
Band_Screen_UI_Sound_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Randomness = none
}
Band_Failed_X_SFX_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Band_Failed_X_SFX
			vol = 8
		}
	]
}
Fail_Screen_SFX_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Band_Failed_X_SFX
			vol = -2
		}
	]
}
z_amazon_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Amazon_Intro
			vol = 12
		}
	]
}
z_sphinx_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Sphinx_Intro
			vol = 12
		}
	]
}
z_canyon_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			canyon_Intro
			vol = 12
		}
	]
}
z_greatwall_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			greatwall_Intro
			vol = 12
		}
	]
}
z_icecap_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			icecap_Intro
			vol = 12
		}
	]
}
z_london_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			london_Intro
			vol = 12
		}
	]
}
z_quebec_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			quebec_Intro
			vol = 12
		}
	]
}
z_atlantis_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			atlantis_Intro
			vol = 12
		}
	]
}
Encore_Pulsate_Neon_Loop_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.35000002
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Encore_Pulsate_Neon_Loop
			num_loops = -1
			vol = -7
		}
	]
}
Crowd_OneShot_LONDON_Good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Cheer_MD_INT_SG_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MD_INT_SG_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			Crowd_Cheer_MED_INT_GR_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_11
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_12
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_13
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_14
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_15
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_16
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_17
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_18
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_19
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			INT_MD_Crowd_Whistle_20
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
	]
}
Crowd_OneShot_LONDON_Bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Boo_GRP_Medium_INT_01
			vol = -11
			pan1randomleftext = 48.17983
			pan1randomrightext = 314.12747
		}
		{
			Crowd_Boo_GRP_Medium_INT_02
			vol = -11
			pan1randomleftext = 49.650177
			pan1randomrightext = 313.73822
		}
		{
			Crowd_Boo_GRP_Medium_INT_03
			vol = -11
			pan1randomleftext = 44.053047
			pan1randomrightext = 311.54672
		}
		{
			Crowd_Boo_GRP_Medium_INT_04
			vol = -11
			pan1randomleftext = 44.81091
			pan1randomrightext = 314.77533
		}
		{
			Crowd_Boo_GRP_Medium_INT_05
			vol = -11
			pan1randomleftext = 45.26162
			pan1randomrightext = 312.603
		}
		{
			Crowd_Boo_GRP_Medium_INT_06
			vol = -11
			pan1randomleftext = 42.68628
			pan1randomrightext = 315.4982
		}
		{
			Crowd_Boo_GRP_Medium_INT_07
			vol = -11
			pan1randomleftext = 43.394
			pan1randomrightext = 313.9488
		}
		{
			Crowd_Boo_GRP_Medium_INT_08
			vol = -11
			pan1randomleftext = 48.22104
			pan1randomrightext = 316.9001
		}
		{
			Crowd_Boo_GRP_Medium_INT_09
			vol = -11
			pan1randomleftext = 43.66778
			pan1randomrightext = 316.5765
		}
		{
			Crowd_Boo_GRP_Medium_INT_10
			vol = -11
			pan1randomleftext = 44.53795
			pan1randomrightext = 315.72522
		}
	]
}
Crowd_Clap_To_Beat_LONDON_Left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Clap_LONDON_01
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_02
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_03
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_04
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_05
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_06
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_LONDON_Right_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Clap_LONDON_01
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_02
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_03
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_04
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_05
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_06
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_LONDON_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Clap_LONDON_01
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_02
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_03
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_04
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_05
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_06
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_LONDON_Right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Clap_LONDON_01
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_02
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_03
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_04
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_05
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_06
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_LONDON_Left_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Clap_LONDON_01
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_02
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_03
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_04
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_05
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_06
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
Crowd_Clap_To_Beat_LONDON_Normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Clap_LONDON_01
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_02
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_03
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_04
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_05
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			Crowd_Clap_LONDON_06
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Crowd_Applause_LONDON_R_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Applause_R_02
			vol = -6
			pan1x = 1
			pan1y = 1
		}
	]
}
Crowd_Applause_LONDON_L_container = {
	Default_Priority = 50
	Default_Buss = `default`
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			LONDON_Crowd_Applause_L_02
			vol = -6
			pan1x = -1
			pan1y = 1
		}
	]
}
LONDON_Encore_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Encore_Loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Medium_INT_Encore_Crowd
			num_loops = -1
			vol = -6
			attack_time = 0.5
			attack_function = linear
		}
	]
}
LONDON_Crowd_Song_Transition_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			Medium_INT_Crowd_Song_Transition
		}
	]
}
Star_Meter_Gain_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	command = PlaySound
	Randomness = none
	Sounds = [
		{
			star_meter_gain
			vol = -2.5
			pan1x = -0.25
			pan1y = 1
			pan2x = 0.75
			pan2y = 1
		}
	]
}
