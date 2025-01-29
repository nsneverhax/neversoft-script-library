Crowd_Individual_Clap_To_Beat_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			sp_awarded1
			vol = -3
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			sp_awarded1
			vol = -8
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			sp_awarded1
			vol = -8
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			sp_awarded1
			vol = -8
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			sp_available1
			vol = 2
		}
	]
}
Star_Power_Ready_SFX_P1_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			sp_deployed
			vol = -12.42
		}
	]
}
Star_Power_Deployed_SFX_P1_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
		{
			sp_deployed
			vol = -14
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			sp_deployed
			vol = -14
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
Star_Power_Deployed_Cheer_SFX_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
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
ui_sfx_scroll_container = {
	Default_Priority = 90
	Default_Buss = front_end
	NoRepeatFor = 0.03
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
		{
			scroll
			vol = 2
		}
	]
}
Pause_Menu_SFX_container = {
	Default_Priority = 90
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Setlist_To_Playlist_Select
			vol = -3
		}
	]
}
ui_sfx_select_container = {
	Default_Priority = 90
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_Sound_05
			vol = -7.5
		}
	]
}
GH_SFX_BeatSoundEvent_container = {
	Default_Priority = 90
	Default_Buss = Test_Tones
	NoRepeatFor = 0.001
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GH3_Beat_Sound
			vol = 6
			pitch = -2.81
		}
	]
}
Dummy_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			EXT_LG_Crowd_Applause
		}
		{
			LoadScreen_Electrical_Loop_Long
		}
		{
			LoadScreen_Music
		}
		{
			LoadScreen_Star_Explode
		}
	]
}
DoNothing_OneShot_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
}
LG_EXT_Crowd_Swell_Short_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_EXT_Crowd_Swell_SH
			vol = 4
		}
	]
}
LG_EXT_Crowd_Swell_Short_Soft_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_EXT_Crowd_Swell_SH
			vol = -5
		}
	]
}
LG_EXT_Crowd_Swell_Med_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_EXT_Crowd_Swell_MD
			vol = 2
		}
	]
}
LG_EXT_Crowd_Swell_Long_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_EXT_Crowd_Swell_LG
			vol = 3
		}
	]
}
Crowd_OneShots_Boo_Close_container = {
	Default_Priority = 20
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 1.5
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			SM_Crowd_Boo_01
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.61
			pan1y = -1
		}
		{
			SM_Crowd_Boo_02
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 1
			pan1y = -0.13
		}
		{
			SM_Crowd_Boo_03
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.69
			pan1y = -1
		}
		{
			SM_Crowd_Boo_04
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0
			pan1y = -1
		}
		{
			SM_Crowd_Boo_05
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = -0.69
			pan1y = -1
		}
		{
			SM_Crowd_Boo_06
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = -0.07
			pan1y = -0.7
		}
		{
			SM_Crowd_Boo_07
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.31
			pan1y = -0.7
		}
		{
			SM_Crowd_Boo_08
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.1
			pan1y = -0.7
		}
		{
			SM_Crowd_Boo_09
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.6
			pan1y = -0.8
		}
		{
			SM_Crowd_Boo_10
			RandomVol = {
				type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.8
			pan1y = -0.26
		}
	]
}
Menu_Warning_SFX_container = {
	Default_Priority = 75
	Default_Buss = front_end
	NoRepeatFor = 0.5
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
}
Generic_Menu_Back_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_Sound_09
			vol = -7
		}
	]
}
Notes_Ripple_Up_SFX_container = {
	Default_Priority = 80
	Default_Buss = front_end
	NoRepeatFor = 0.5
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Notes_Ripple_Up_01
			vol = -3.73
		}
	]
}
LG_EXT_Crowd_Transition_Positive_To_Neutral_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Positive_To_Neutral
			vol = 13
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
LG_EXT_Crowd_Transition_Positive_To_Neutral_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Positive_To_Neutral
			vol = 3
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
LG_EXT_Crowd_Transition_Positive_To_Neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Positive_To_Neutral
			vol = 3
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
LG_EXT_Crowd_Transition_Neutral_To_Positive_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Neutral_To_Positive
			vol = 0
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
LG_EXT_Crowd_Transition_Neutral_To_Positive_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Neutral_To_Positive
			vol = 0
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
LG_EXT_Crowd_Transition_Neutral_To_Positive_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Neutral_To_Positive
			vol = 0
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
LG_EXT_Crowd_Transition_Neutral_To_Negative_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Neutral_To_Negative
			vol = 0
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
LG_EXT_Crowd_Transition_Neutral_To_Negative_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Neutral_To_Negative
			vol = 0
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
LG_EXT_Crowd_Transition_Neutral_To_Negative_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Neutral_To_Negative
			vol = 0
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
LG_EXT_Crowd_Transition_Negative_To_Neutral_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Negative_To_Neutral
			vol = 12
			pan1x = -1
			pan1y = 1
			pan2x = -0.5
			pan2y = 1
		}
	]
}
LG_EXT_Crowd_Transition_Negative_To_Neutral_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Negative_To_Neutral
			vol = 12
			pan1x = 0.5
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
	]
}
LG_EXT_Crowd_Transition_Negative_To_Neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_Crowd_Negative_To_Neutral
			vol = 12
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
	]
}
MD_EXT_Crowd_Transition_Positive_To_Neutral_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Positive_To_Neutral
			vol = 0.5
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Positive_To_Neutral_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Positive_To_Neutral
			vol = 0.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Positive_To_Neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Positive_To_Neutral
			vol = 0.5
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Positive_To_Neutral_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Positive_To_Neutral
			vol = -2
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Positive_To_Neutral_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Positive_To_Neutral
			vol = -2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Positive_To_Neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Positive_To_Neutral
			vol = -2
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Neutral_To_Positive_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Positive
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Neutral_To_Positive_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Positive
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Neutral_To_Positive_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Positive
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Neutral_To_Positive_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Positive_01
			vol = 2.5
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Neutral_To_Positive_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Positive
			vol = 2.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Neutral_To_Positive_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Positive
			vol = 2.5
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Neutral_To_Negative_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Negative
			vol = -1
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Neutral_To_Negative_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Negative
			vol = -1
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Neutral_To_Negative_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Negative
			vol = -1
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Neutral_To_Negative_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Negative
			vol = -1.5
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Neutral_To_Negative_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Negative
			vol = -1.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Neutral_To_Negative_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Neutral_To_Negative
			vol = -1.5
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Negative_To_Neutral_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Negative_To_Neutral
			vol = 12
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Negative_To_Neutral_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Negative_To_Neutral
			vol = 12
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Transition_Negative_To_Neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Negative_To_Neutral
			vol = 12
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Negative_To_Neutral_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Negative_To_Neutral
			vol = 8
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Negative_To_Neutral_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Negative_To_Neutral
			vol = 8
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_INT_Crowd_Transition_Negative_To_Neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_Crowd_Negative_To_Neutral
			vol = 8
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Positive_To_Neutral_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Positive_To_Neutral
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Positive_To_Neutral_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Positive_To_Neutral
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Positive_To_Neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Positive_To_Neutral
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Negative_To_Neutral_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Negative_To_Neutral
			vol = 6
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Negative_To_Neutral_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Negative_To_Neutral
			vol = 6
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition__Negative_To_Neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Negative_To_Neutral
			vol = 6
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Neutral_To_Positive_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Neutral_To_Positive
			vol = 3
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Neutral_To_Positive_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Neutral_To_Positive
			vol = 3
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Neutral_To_Positive_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Neutral_To_Positive
			vol = 3
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Neutral_To_Negative_L_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Neutral_To_Negative
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Neutral_To_Negative_R_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Neutral_To_Negative
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
SM_INT_Crowd_Transition_Neutral_To_Negative_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_Crowd_Neutral_To_Negative
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
MD_EXT_Crowd_Swell_Long_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_EXT_Crowd_Swell_LG
			vol = 3
		}
	]
}
MD_INT_Crowd_Swell_Long_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_INT_Crowd_Swell_LG
			vol = 5
		}
	]
}
SM_INT_Crowd_Swell_Long_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_INT_Crowd_Swell_LG
			vol = 2
		}
	]
}
MD_EXT_Crowd_Swell_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_EXT_Crowd_Swell_MD
			vol = 3
		}
	]
}
MD_INT_Crowd_Swell_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_INT_Crowd_Swell_MD
			vol = 2
		}
	]
}
SM_INT_Crowd_Swell_Med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_INT_Crowd_Swell_MD
			vol = 2
		}
	]
}
MD_EXT_Crowd_Swell_Short_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_EXT_Crowd_Swell_SH
			vol = 3
		}
	]
}
MD_EXT_Crowd_Swell_Short_Soft_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_EXT_Crowd_Swell_SH
			vol = -3
		}
	]
}
MD_INT_Crowd_Swell_Short_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_INT_Crowd_Swell_SH
			vol = 2.5
		}
	]
}
MD_INT_Crowd_Swell_Short_Soft_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_INT_Crowd_Swell_SH
			vol = -3
		}
	]
}
SM_INT_Crowd_Swell_Short_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_INT_Crowd_Swell_SH
			vol = 4
		}
	]
}
SM_INT_Crowd_Swell_Short_Soft_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_INT_Crowd_Swell_SH
			vol = -4
		}
	]
}
Box_Check_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			CheckBox_Check_SFX
			pitch = 2
			vol = 0
		}
	]
}
Box_UnCheck_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			CheckBox_Uncheck_SFX
			pitch = 0
			vol = -3
		}
	]
}
You_Rock_End_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			You_Rock
			vol = -3
		}
	]
}
ui_sfx_scroll_add_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_Scroll_Add2
			vol = -4.14
		}
	]
}
UI_SFX_Lose_Multiplier_2X_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GH5_1_Lose_Multiplier
			vol = -7
			pitch = -3
		}
	]
}
UI_SFX_Lose_Multiplier_2X_Band_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GH5_1_Lose_Multiplier
			vol = -10
			pitch = -3
		}
	]
}
UI_SFX_Lose_Multiplier_3X_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GH5_1_Lose_Multiplier
			vol = -7
			pitch = -3
		}
	]
}
UI_SFX_Lose_Multiplier_3X_Band_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GH5_1_Lose_Multiplier
			vol = -10
			pitch = -3
		}
	]
}
UI_SFX_Lose_Multiplier_4X_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GH5_1_Lose_Multiplier
			vol = -7
			pitch = -3
		}
	]
}
UI_SFX_Lose_Multiplier_4X_Band_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GH5_1_Lose_Multiplier
			vol = -10
			pitch = -3
		}
	]
}
Lose_Multiplier_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
}
Song_Intro_Kick_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Highway_Rise
			vol = 3.21
		}
	]
}
GH_SFX_HitNoteSoundEvent_container = {
	Default_Priority = 90
	Default_Buss = Test_Tones
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
}
Cheat_Single_Strum_Note_1_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_pk_A3_S2_F12_01
		}
		{
			sg_b_pk_A3_S2_F12_02
		}
		{
			sg_b_pk_A3_S2_F12_03
		}
	]
}
Cheat_Single_Strum_Note_2_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_pk_Bb3_S4_F3_01
		}
		{
			sg_b_pk_Bb3_S4_F3_02
		}
		{
			sg_b_pk_Bb3_S4_F3_03
		}
	]
}
Cheat_Single_Strum_Note_3_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_pk_D4_S4_F7_01
		}
		{
			sg_b_pk_D4_S4_F7_02
		}
		{
			sg_b_pk_D4_S4_F7_03
		}
	]
}
Cheat_Single_Strum_Note_4_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_pk_E4_S6_F0_01
		}
		{
			sg_b_pk_E4_S6_F0_02
		}
		{
			sg_b_pk_E4_S6_F0_03
		}
	]
}
Cheat_Single_Strum_Note_5_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_pk_G4_S6_F3_01
		}
		{
			sg_b_pk_G4_S6_F3_02
		}
		{
			sg_b_pk_G4_S6_F3_03
		}
	]
}
Cheat_Chord_Strum_1_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_E5_S1_F0_01
		}
		{
			sg_b_chrd_down_E5_S1_F0_02
		}
		{
			sg_b_chrd_down_E5_S1_F0_03
		}
	]
}
Cheat_Chord_Strum_2_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_G5_S1_F3_01
		}
		{
			sg_b_chrd_down_G5_S1_F3_02
		}
		{
			sg_b_chrd_down_G5_S1_F3_03
		}
	]
}
Cheat_Chord_Strum_3_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_A5_S1_F5_01
		}
		{
			sg_b_chrd_down_A5_S1_F5_02
		}
		{
			sg_b_chrd_down_A5_S1_F5_03
		}
	]
}
Cheat_Chord_Strum_4_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_F5_S1_F1_01
			pitch = 1
		}
		{
			sg_b_chrd_down_F5_S1_F1_02
			pitch = 1
		}
		{
			sg_b_chrd_down_F5_S1_F1_03
			pitch = 1
		}
	]
}
Cheat_Chord_Strum_5_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_C5_S2_F3_01
		}
		{
			sg_b_chrd_down_C5_S2_F3_02
		}
		{
			sg_b_chrd_down_C5_S2_F3_03
		}
	]
}
Cheat_Chord_Strum_6_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_B5_S1_F7_01
		}
		{
			sg_b_chrd_down_B5_S1_F7_02
		}
		{
			sg_b_chrd_down_B5_S1_F7_03
		}
	]
}
Cheat_Chord_Strum_7_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_D5_S2_F5_01
		}
		{
			sg_b_chrd_down_D5_S2_F5_02
		}
		{
			sg_b_chrd_down_D5_S2_F5_03
		}
	]
}
Cheat_Chord_Strum_8_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_F5_S1_F1_01
			pitch = 1
		}
		{
			sg_b_chrd_down_F5_S1_F1_02
			pitch = 1
		}
		{
			sg_b_chrd_down_F5_S1_F1_03
			pitch = 1
		}
	]
}
Cheat_Chord_Strum_9_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_E5_S1_F0_01
		}
		{
			sg_b_chrd_down_E5_S1_F0_02
		}
		{
			sg_b_chrd_down_E5_S1_F0_03
		}
	]
}
Cheat_Chord_Strum_10_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_F5_S1_F1_01
		}
		{
			sg_b_chrd_down_F5_S1_F1_02
		}
		{
			sg_b_chrd_down_F5_S1_F1_03
		}
	]
}
Cheat_Chord_Strum_11_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_A5_S1_F5_01
		}
		{
			sg_b_chrd_down_A5_S1_F5_02
		}
		{
			sg_b_chrd_down_A5_S1_F5_03
		}
	]
}
Cheat_Chord_Strum_12_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			sg_b_chrd_down_C5_S2_F3_01
		}
		{
			sg_b_chrd_down_C5_S2_F3_02
		}
		{
			sg_b_chrd_down_C5_S2_F3_03
		}
	]
}
Checkbox_SFX_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			CheckBox_Check_SFX
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Checkbox_SFX
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Checkbox_SFX
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Whammy_Test_SFX
			vol = -3.09
		}
	]
}
CheckBox_Check_SFX_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
		}
	]
}
CheckBox_Check_SFX_P1_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Finish_Chord
			vol = 2.27
		}
	]
}
UI_SFX_100_Note_Streak_SinglePlayer_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_SFX_100_Note_Streak
			vol = -15
		}
	]
}
UI_SFX_50_Note_Streak_SinglePlayer_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -15
		}
	]
}
UI_SFX_100_Note_Streak_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_SFX_100_Note_Streak
			vol = -15
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
UI_SFX_50_Note_Streak_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -15
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
UI_SFX_100_Note_Streak_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -15
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
UI_SFX_50_Note_Streak_P2_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -15
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Tutorial_String_3_Strum_Free
			vol = 8.51
		}
	]
}
LG_EXT_Crowd_Applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_EXT_Crowd_Applause
			vol = -3
		}
	]
}
LG_INT_Crowd_Applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_INT_Crowd_Applause
			vol = -3
		}
	]
}
MD_EXT_Crowd_Applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_EXT_Crowd_Applause
			vol = -5
		}
	]
}
MD_INT_Crowd_Applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			INT_MD_Crowd_Applause
			vol = -8
		}
	]
}
SM_INT_Crowd_Applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_INT_Crowd_Applause
			vol = -11
		}
	]
}
SM_EXT_Crowd_Applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_EXT_Crowd_Applause
			vol = -11
		}
	]
}
GH3_Score_FlyIn_Hit_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			cash
			vol = -4.42
		}
	]
}
jam_sounds_template = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
}
Star_Power_Deployed_Front_Gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Front
			vol = -6
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_LFE
			LFEOnly = true
			LFE_vol = -5
		}
	]
}
Star_Power_Available_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Available
			vol = -10.5
		}
	]
}
Star_Power_Release_Front_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Release_Front
			vol = -11
		}
	]
}
Star_Power_Deployed_Back_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power_Delay
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 20
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Back
			vol = 3
		}
	]
}
Star_Power_Available_P2_GH4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Available
			vol = -10.5
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Available
			vol = -10.5
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Back
			vol = -10.5
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Release_Center
			vol = -100
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Back
			vol = -10.5
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Back
			vol = -10.5
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Release_Front
			vol = -16
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Release_Front
			vol = -16
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Front
			vol = -10.5
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Front
			vol = -10.5
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Available
			vol = -10.5
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Release_Center
			vol = -100
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Release_Center
			vol = -100
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Front
			vol = -10.5
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_LFE
			LFEOnly = true
			LFE_vol = -5
		}
	]
}
Star_Power_Release_Front_P1_Gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Release_Front
			vol = -16
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
	Command = PlaySound
	randomness = RandomNoRepeatType
}
Jam_Fret_Noise_Rhythm_container = {
	Default_Priority = 50
	Default_Buss = JamMode_RhythmGuitar
	NoRepeatFor = 0.5
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			Fret_Noise_01
			vol = -12
			Priority = 1
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
			Priority = 1
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
			Priority = 1
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
			Priority = 1
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
			Priority = 1
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
LG_EXT_Crowd_Whistle_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			LG_EXT_Crowd_Whistle_01
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_02
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_03
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_04
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_05
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_06
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_07
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_08
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_09
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_10
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_11
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_12
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_13
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_14
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_15
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_16
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_17
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_18
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_19
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_20
			vol = -4
		}
	]
}
LG_INT_Crowd_Whistle_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			LG_INT_Crowd_Whistle_01
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_02
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_03
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_04
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_05
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_06
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_07
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_08
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_09
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_10
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_11
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_12
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_13
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_14
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_15
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_16
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_17
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_18
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_19
			vol = -2
		}
		{
			LG_INT_Crowd_Whistle_20
			vol = -2
		}
	]
}
MD_EXT_Crowd_Whistle_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			MD_EXT_Crowd_Whistle_01
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_02
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_03
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_04
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_05
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_06
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_07
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_08
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_09
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_10
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_11
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_12
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_13
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_14
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_15
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_16
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_17
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_18
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_19
			vol = -2
		}
		{
			MD_EXT_Crowd_Whistle_20
			vol = -2
		}
	]
}
MD_EXT_Crowd_Whistle_Positive_01_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			MD_EXT_Crowd_Whistle_01
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_02
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_03
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_04
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_05
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_06
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_07
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_08
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_09
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_10
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_11
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_12
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_13
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_14
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_15
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_16
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_17
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_18
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_19
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_20
			vol = -12
		}
	]
}
MD_INT_Crowd_Whistle_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			MD_INT_Crowd_Whistle_01
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_02
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_03
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_04
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_05
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_06
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_07
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_08
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_09
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_10
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_11
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_12
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_13
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_14
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_15
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_16
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_17
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_18
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_19
			vol = 5
		}
		{
			MD_INT_Crowd_Whistle_20
			vol = 5
		}
	]
}
SM_EXT_Crowd_Whistle_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
}
SM_INT_Crowd_Whistle_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			SM_INT_Crowd_Whistle_01
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_02
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_03
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_04
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_05
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_06
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_07
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_08
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_09
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_10
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_11
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_12
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_13
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_14
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_15
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_16
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_17
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_18
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_19
			vol = -2
		}
		{
			SM_INT_Crowd_Whistle_20
			vol = -2
		}
	]
}
LG_EXT_Crowd_OneShot_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			LG_EXT_Crowd_Cheer_GR_01
			vol = -6
		}
		{
			LG_EXT_Crowd_Cheer_GR_02
			vol = -6
		}
		{
			LG_EXT_Crowd_Cheer_GR_03
			vol = -6
		}
		{
			LG_EXT_Crowd_Cheer_GR_04
			vol = -6
		}
		{
			LG_EXT_Crowd_Cheer_GR_05
			vol = -6
		}
		{
			LG_EXT_Crowd_Cheer_GR_06
			vol = -6
		}
		{
			LG_EXT_Crowd_Cheer_GR_08
			vol = -6
		}
		{
			LG_EXT_Crowd_Cheer_GR_09
			vol = -6
		}
		{
			LG_EXT_Crowd_Cheer_GR_10
			vol = -6
		}
		{
			LG_EXT_Crowd_Cheer_SG_01
			vol = -9
		}
		{
			LG_EXT_Crowd_Cheer_SG_02
			vol = -9
		}
		{
			LG_EXT_Crowd_Cheer_SG_03
			vol = -9
		}
		{
			LG_EXT_Crowd_Cheer_SG_04
			vol = -9
		}
		{
			LG_EXT_Crowd_Cheer_SG_05
			vol = -9
		}
		{
			LG_EXT_Crowd_Cheer_SG_06
			vol = -9
		}
		{
			LG_EXT_Crowd_Cheer_SG_07
			vol = -9
		}
		{
			LG_EXT_Crowd_Cheer_SG_08
			vol = -9
		}
		{
			LG_EXT_Crowd_Cheer_SG_09
			vol = -9
		}
		{
			LG_EXT_Crowd_Cheer_SG_10
			vol = -9
		}
		{
			LG_EXT_Crowd_Whistle_01
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_02
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_03
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_04
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_05
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_06
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_07
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_08
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_09
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_10
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_11
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_12
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_13
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_14
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_15
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_16
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_17
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_18
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_19
			vol = -4
		}
		{
			LG_EXT_Crowd_Whistle_20
			vol = -4
		}
	]
}
LG_INT_Crowd_OneShot_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			LG_INT_Crowd_Whistle_01
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_02
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_03
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_04
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_05
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_06
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_07
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_08
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_09
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_10
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_11
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_12
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_13
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_14
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_15
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_16
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_17
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_18
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_19
			vol = -3
		}
		{
			LG_INT_Crowd_Whistle_20
			vol = -3
		}
	]
}
MD_EXT_Crowd_OneShot_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			MD_EXT_Crowd_Cheer_GR_01
			vol = -8
		}
		{
			MD_EXT_Crowd_Cheer_GR_02
			vol = -8
		}
		{
			MD_EXT_Crowd_Cheer_GR_03
			vol = -8
		}
		{
			MD_EXT_Crowd_Cheer_GR_04
			vol = -8
		}
		{
			MD_EXT_Crowd_Cheer_GR_05
			vol = -8
		}
		{
			MD_EXT_Crowd_Cheer_GR_06
			vol = -8
		}
		{
			MD_EXT_Crowd_Cheer_GR_07
			vol = -8
		}
		{
			MD_EXT_Crowd_Cheer_GR_08
			vol = -8
		}
		{
			MD_EXT_Crowd_Cheer_GR_09
			vol = -8
		}
		{
			MD_EXT_Crowd_Cheer_GR_10
			vol = -8
		}
		{
			MD_EXT_Crowd_Cheer_SG_01
			vol = -11
		}
		{
			MD_EXT_Crowd_Cheer_SG_02
			vol = -11
		}
		{
			MD_EXT_Crowd_Cheer_SG_03
			vol = -11
		}
		{
			MD_EXT_Crowd_Cheer_SG_04
			vol = -11
		}
		{
			MD_EXT_Crowd_Cheer_SG_05
			vol = -11
		}
		{
			MD_EXT_Crowd_Cheer_SG_06
			vol = -11
		}
		{
			MD_EXT_Crowd_Cheer_SG_07
			vol = -11
		}
		{
			MD_EXT_Crowd_Cheer_SG_08
			vol = -11
		}
		{
			MD_EXT_Crowd_Cheer_SG_09
			vol = -11
		}
		{
			MD_EXT_Crowd_Cheer_SG_10
			vol = -11
		}
		{
			MD_EXT_Crowd_Whistle_01
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_02
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_03
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_04
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_05
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_06
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_07
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_08
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_09
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_10
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_11
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_12
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_13
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_14
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_15
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_16
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_17
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_18
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_19
			vol = -7
		}
		{
			MD_EXT_Crowd_Whistle_20
			vol = -7
		}
	]
}
MD_EXT_Crowd_OneShot_Positive_01_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			MD_EXT_Crowd_Cheer_GR_01
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_GR_02
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_GR_03
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_GR_04
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_GR_05
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_GR_06
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_GR_07
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_GR_08
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_GR_09
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_GR_10
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_SG_01
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_SG_02
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_SG_03
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_SG_04
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_SG_05
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_SG_06
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_SG_07
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_SG_08
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_SG_09
			vol = -12
		}
		{
			MD_EXT_Crowd_Cheer_SG_10
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_01
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_02
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_03
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_04
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_05
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_06
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_07
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_08
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_09
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_10
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_11
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_12
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_13
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_14
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_15
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_16
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_17
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_18
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_19
			vol = -12
		}
		{
			MD_EXT_Crowd_Whistle_20
			vol = -12
		}
	]
}
MD_INT_Crowd_OneShot_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			MD_INT_Crowd_Cheer_GR_01
			vol = -8
		}
		{
			MD_INT_Crowd_Cheer_GR_02
			vol = -8
		}
		{
			MD_INT_Crowd_Cheer_GR_03
			vol = -8
		}
		{
			MD_INT_Crowd_Cheer_GR_04
			vol = -8
		}
		{
			MD_INT_Crowd_Cheer_GR_05
			vol = -8
		}
		{
			MD_INT_Crowd_Cheer_GR_06
			vol = -8
		}
		{
			MD_INT_Crowd_Cheer_GR_07
			vol = -8
		}
		{
			MD_INT_Crowd_Cheer_GR_08
			vol = -8
		}
		{
			MD_INT_Crowd_Cheer_GR_09
			vol = -8
		}
		{
			MD_INT_Crowd_Cheer_GR_10
			vol = -8
		}
		{
			MD_INT_Crowd_Cheer_SG_01
			vol = -11
		}
		{
			MD_INT_Crowd_Cheer_SG_02
			vol = -11
		}
		{
			MD_INT_Crowd_Cheer_SG_03
			vol = -11
		}
		{
			MD_INT_Crowd_Cheer_SG_04
			vol = -11
		}
		{
			MD_INT_Crowd_Cheer_SG_05
			vol = -11
		}
		{
			MD_INT_Crowd_Cheer_SG_06
			vol = -11
		}
		{
			MD_INT_Crowd_Cheer_SG_07
			vol = -11
		}
		{
			MD_INT_Crowd_Cheer_SG_08
			vol = -11
		}
		{
			MD_INT_Crowd_Cheer_SG_09
			vol = -11
		}
		{
			MD_INT_Crowd_Cheer_SG_10
			vol = -11
		}
		{
			MD_INT_Crowd_Whistle_01
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_02
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_03
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_04
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_05
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_06
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_07
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_08
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_09
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_10
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_11
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_12
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_13
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_14
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_15
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_16
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_17
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_18
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_19
			vol = -7
		}
		{
			MD_INT_Crowd_Whistle_20
			vol = -7
		}
	]
}
SM_EXT_Crowd_OneShot_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			LG_EXT_Crowd_Whistle_01
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_02
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_03
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_04
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_05
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_06
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_07
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_08
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_09
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_10
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_11
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_12
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_13
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_14
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_15
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_16
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_17
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_18
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_19
			vol = -1
		}
		{
			LG_EXT_Crowd_Whistle_20
			vol = -1
		}
	]
}
SM_INT_Crowd_OneShot_Positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			SM_INT_Crowd_Cheer_GR_01
		}
		{
			SM_INT_Crowd_Cheer_GR_02
		}
		{
			SM_INT_Crowd_Cheer_GR_03
		}
		{
			SM_INT_Crowd_Cheer_GR_04
		}
		{
			SM_INT_Crowd_Cheer_GR_05
		}
		{
			SM_INT_Crowd_Cheer_GR_06
		}
		{
			SM_INT_Crowd_Cheer_GR_07
		}
		{
			SM_INT_Crowd_Cheer_GR_08
		}
		{
			SM_INT_Crowd_Cheer_GR_09
		}
		{
			SM_INT_Crowd_Cheer_GR_10
		}
		{
			SM_INT_Crowd_Cheer_SG_01
		}
		{
			SM_INT_Crowd_Cheer_SG_02
		}
		{
			SM_INT_Crowd_Cheer_SG_03
		}
		{
			SM_INT_Crowd_Cheer_SG_04
		}
		{
			SM_INT_Crowd_Cheer_SG_05
		}
		{
			SM_INT_Crowd_Cheer_SG_06
		}
		{
			SM_INT_Crowd_Cheer_SG_07
		}
		{
			SM_INT_Crowd_Cheer_SG_08
		}
		{
			SM_INT_Crowd_Cheer_SG_09
		}
		{
			SM_INT_Crowd_Cheer_SG_10
		}
		{
			SM_INT_Crowd_Whistle_01
		}
		{
			SM_INT_Crowd_Whistle_02
		}
		{
			SM_INT_Crowd_Whistle_03
		}
		{
			SM_INT_Crowd_Whistle_04
		}
		{
			SM_INT_Crowd_Whistle_05
		}
		{
			SM_INT_Crowd_Whistle_06
		}
		{
			SM_INT_Crowd_Whistle_07
		}
		{
			SM_INT_Crowd_Whistle_08
		}
		{
			SM_INT_Crowd_Whistle_09
		}
		{
			SM_INT_Crowd_Whistle_10
		}
		{
			SM_INT_Crowd_Whistle_11
		}
		{
			SM_INT_Crowd_Whistle_12
		}
		{
			SM_INT_Crowd_Whistle_13
		}
		{
			SM_INT_Crowd_Whistle_14
		}
		{
			SM_INT_Crowd_Whistle_15
		}
		{
			SM_INT_Crowd_Whistle_16
		}
		{
			SM_INT_Crowd_Whistle_17
		}
		{
			SM_INT_Crowd_Whistle_18
		}
		{
			SM_INT_Crowd_Whistle_19
		}
		{
			SM_INT_Crowd_Whistle_20
		}
	]
}
LG_EXT_Crowd_OneShot_Negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			LG_EXT_Crowd_Boo_GR_01
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_GR_02
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_GR_03
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_GR_04
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_GR_05
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_GR_06
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_GR_07
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_GR_08
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_GR_09
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_GR_10
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_SG_01
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_SG_02
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_SG_03
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_SG_04
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_SG_05
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_SG_06
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_SG_07
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_SG_08
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_SG_09
			vol = -1
		}
		{
			LG_EXT_Crowd_Boo_SG_10
			vol = -1
		}
	]
}
LG_INT_Crowd_OneShot_Negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			SM_Crowd_Boo_01
			vol = -1
		}
		{
			SM_Crowd_Boo_02
			vol = -1
		}
		{
			SM_Crowd_Boo_03
			vol = -1
		}
		{
			SM_Crowd_Boo_04
			vol = -1
		}
		{
			SM_Crowd_Boo_05
			vol = -1
		}
		{
			SM_Crowd_Boo_06
			vol = -1
		}
		{
			SM_Crowd_Boo_07
			vol = -1
		}
		{
			SM_Crowd_Boo_08
			vol = -1
		}
		{
			SM_Crowd_Boo_09
			vol = -1
		}
		{
			SM_Crowd_Boo_10
			vol = -1
		}
	]
}
MD_EXT_Crowd_OneShot_Negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			MD_EXT_Crowd_Boo_GR_01
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_GR_02
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_GR_03
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_GR_04
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_GR_05
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_GR_06
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_GR_07
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_GR_08
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_GR_09
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_GR_10
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_SG_01
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_SG_02
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_SG_03
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_SG_04
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_SG_05
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_SG_06
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_SG_07
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_SG_08
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_SG_09
			vol = 2
		}
		{
			MD_EXT_Crowd_Boo_SG_10
			vol = 2
		}
	]
}
MD_INT_Crowd_OneShot_Negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			MD_INT_Crowd_Boo_GR_01
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_GR_02
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_GR_03
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_GR_04
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_GR_05
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_GR_06
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_GR_07
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_GR_08
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_GR_09
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_GR_10
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_SG_01
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_SG_02
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_SG_03
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_SG_04
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_SG_05
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_SG_06
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_SG_07
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_SG_08
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_SG_09
			vol = 3
		}
		{
			MD_INT_Crowd_Boo_SG_10
			vol = 3
		}
	]
}
SM_EXT_Crowd_OneShot_Negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			SM_Crowd_Boo_01
			vol = -1
		}
		{
			SM_Crowd_Boo_02
			vol = -1
		}
		{
			SM_Crowd_Boo_03
			vol = -1
		}
		{
			SM_Crowd_Boo_04
			vol = -1
		}
		{
			SM_Crowd_Boo_05
			vol = -1
		}
		{
			SM_Crowd_Boo_06
			vol = -1
		}
		{
			SM_Crowd_Boo_07
			vol = -1
		}
		{
			SM_Crowd_Boo_08
			vol = -1
		}
		{
			SM_Crowd_Boo_09
			vol = -1
		}
		{
			SM_Crowd_Boo_10
			vol = -1
		}
	]
}
SM_INT_Crowd_OneShot_Negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			SM_INT_Crowd_Boo_GR_01
		}
		{
			SM_INT_Crowd_Boo_GR_02
		}
		{
			SM_INT_Crowd_Boo_GR_03
		}
		{
			SM_INT_Crowd_Boo_GR_04
		}
		{
			SM_INT_Crowd_Boo_GR_05
		}
		{
			SM_INT_Crowd_Boo_GR_06
		}
		{
			SM_INT_Crowd_Boo_GR_07
		}
		{
			SM_INT_Crowd_Boo_GR_08
		}
		{
			SM_INT_Crowd_Boo_GR_09
		}
		{
			SM_INT_Crowd_Boo_GR_10
		}
		{
			SM_INT_Crowd_Boo_SG_01
		}
		{
			SM_INT_Crowd_Boo_SG_02
		}
		{
			SM_INT_Crowd_Boo_SG_03
		}
		{
			SM_INT_Crowd_Boo_SG_04
		}
		{
			SM_INT_Crowd_Boo_SG_05
		}
		{
			SM_INT_Crowd_Boo_SG_06
		}
		{
			SM_INT_Crowd_Boo_SG_07
		}
		{
			SM_INT_Crowd_Boo_SG_08
		}
		{
			SM_INT_Crowd_Boo_SG_09
		}
		{
			SM_INT_Crowd_Boo_SG_10
		}
	]
}
LG_EXT_Crowd_Positive_Swell_Layer_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			LG_EXT_Crowd_Whistle_01
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_02
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_03
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_04
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_05
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_06
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_07
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_08
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_09
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_10
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_11
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_12
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_13
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_14
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_15
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_16
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_17
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_18
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_19
			vol = 8
		}
		{
			LG_EXT_Crowd_Whistle_20
			vol = 8
		}
	]
}
Jam_Rhythm_Event_container = {
	template = Jam_Session_Rhythm_Guitar_Template
	Command = PlaySound
	randomness = RandomNoRepeatType
}
Jam_Lead_Event_container = {
	Default_Priority = 50
	Default_Buss = JamMode_LeadGuitar
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
}
Jam_Bass_Event_container = {
	Default_Priority = 50
	Default_Buss = JamMode_Bass
	NoRepeatFor = 0
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	randomness = RandomNoRepeatType
}
JamVoxTest_C5_container = {
	Default_Priority = 50
	Default_Buss = JamMode_Vox
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			C5loop
			num_loops = -1
		}
	]
}
JamVoxTest_C3_container = {
	Default_Priority = 50
	Default_Buss = JamMode_Vox
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			C3loop
			num_loops = -1
			vol = 12
		}
	]
}
JamVoxTest_C4_container = {
	Default_Priority = 50
	Default_Buss = JamMode_Vox
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			C4loop
			num_loops = -1
		}
	]
}
GH4_Jam_Mode_Bass_Template_template = {
	Default_Priority = 50
	Default_Buss = JamMode_Bass
	NoRepeatFor = 0
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	randomness = RandomNoRepeatType
}
Jam_Fret_Noise_bass_short_container = {
	Default_Priority = 25
	Default_Buss = JamMode_Bass
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			fj_b_fretnoise_s_01
			vol = 1
			Priority = 1
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
			Priority = 1
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
			Priority = 1
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
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			fj_b_fretnoise_m_01
			vol = -7
			Priority = 1
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
			Priority = 1
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
			Priority = 1
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Guitar_Select_Affirmation_1
			vol = -8.5
		}
	]
}
Guitar_Lick_Crowd_Swell_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
}
Song_Affirmation_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			Song_Affirmation_02
			vol = -8
		}
		{
			Song_Affirmation_03
			vol = -8
		}
		{
			Song_Affirmation_05
			vol = -8
		}
	]
}
Drum_Affirmation_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Drum_Select_Affirmation_01
			vol = -7
		}
	]
}
Mic_Affirmation_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	randomness = RandomType
	sounds = [
		{
			Mic_Select_Affirmation_01
			vol = 3
		}
	]
}
Vocal_Selection_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Select_Microphone_2
		}
	]
}
Drum_Selection_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Select_Drums_1
		}
	]
}
Guitar_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Select_Guitar_3
			vol = -7
		}
	]
}
Bass_Selection_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Bass_Select_Affirmation_03
			vol = -2
		}
	]
}
Bass_Affirmation_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Bass_Select_Affirmation_02
			vol = -6
		}
	]
}
SM_INT_Crowd_Clap_To_Beat_Normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			SM_INT_Crowd_Clap_01
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_02
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_03
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_04
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_05
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_06
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
	]
}
SM_INT_Crowd_Clap_To_Beat_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			SM_INT_Crowd_Clap_01
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_02
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_03
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_04
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_05
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_06
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
	]
}
SM_INT_Crowd_Clap_To_Beat_Right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			SM_INT_Crowd_Clap_01
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
			vol = -3
		}
		{
			SM_INT_Crowd_Clap_02
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
			vol = -3
		}
		{
			SM_INT_Crowd_Clap_03
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
			vol = -3
		}
		{
			SM_INT_Crowd_Clap_04
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
			vol = -3
		}
		{
			SM_INT_Crowd_Clap_05
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
			vol = -3
		}
		{
			SM_INT_Crowd_Clap_06
			vol = -3
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
SM_INT_Crowd_Clap_To_Beat_Left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			SM_INT_Crowd_Clap_01
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
		{
			SM_INT_Crowd_Clap_02
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
		{
			SM_INT_Crowd_Clap_03
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
		{
			SM_INT_Crowd_Clap_04
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
		{
			SM_INT_Crowd_Clap_05
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
		{
			SM_INT_Crowd_Clap_06
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
	]
}
SM_INT_Crowd_Clap_To_Beat_Right_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			SM_INT_Crowd_Clap_01
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_02
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_03
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_04
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_05
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_06
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
SM_INT_Crowd_Clap_To_Beat_Left_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			SM_INT_Crowd_Clap_01
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_02
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_03
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_04
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_05
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			SM_INT_Crowd_Clap_06
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
MD_INT_Crowd_Clap_To_Beat_Normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_INT_Crowd_Clap_01
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_02
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_03
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_04
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_05
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_06
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
MD_INT_Crowd_Clap_To_Beat_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_INT_Crowd_Clap_01
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_02
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_03
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_04
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_05
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_06
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
	]
}
MD_INT_Crowd_Clap_To_Beat_Left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_INT_Crowd_Clap_01
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_02
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_03
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_04
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_05
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_06
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
MD_INT_Crowd_Clap_To_Beat_Right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_INT_Crowd_Clap_01
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_02
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_03
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_04
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_05
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_06
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
MD_INT_Crowd_Clap_To_Beat_Left_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_INT_Crowd_Clap_01
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_02
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_03
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_04
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_05
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_06
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
MD_INT_Crowd_Clap_To_Beat_Right_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_INT_Crowd_Clap_01
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_02
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_03
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_04
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_05
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_INT_Crowd_Clap_06
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
LG_EXT_Crowd_Clap_To_Beat_Normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			LG_EXT_Crowd_Clap_01
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_02
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_03
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_04
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_05
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_06
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
LG_EXT_Crowd_Clap_To_Beat_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			LG_EXT_Crowd_Clap_01
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_02
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_03
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_04
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_05
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_06
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
	]
}
LG_EXT_Crowd_Clap_To_Beat_Right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			LG_EXT_Crowd_Clap_01
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_02
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_03
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_04
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_05
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_06
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
LG_EXT_Crowd_Clap_To_Beat_Left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			LG_EXT_Crowd_Clap_01
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_02
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_03
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_04
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_05
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_06
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
LG_EXT_Crowd_Clap_To_Beat_Right_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			LG_EXT_Crowd_Clap_01
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_02
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_03
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_04
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_05
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_06
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
LG_EXT_Crowd_Clap_To_Beat_Left_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			LG_EXT_Crowd_Clap_01
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_02
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_03
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_04
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_05
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			LG_EXT_Crowd_Clap_06
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
	]
}
MD_EXT_Crowd_Clap_To_Beat_Normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_EXT_Crowd_Clap_01
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_02
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_03
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_04
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_05
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_06
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
MD_EXT_Crowd_Clap_To_Beat_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_EXT_Crowd_Clap_01
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_02
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_03
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_04
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_05
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_06
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
	]
}
MD_EXT_Crowd_Clap_To_Beat_Left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_EXT_Crowd_Clap_01
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_02
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_03
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_04
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_05
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_06
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
	]
}
MD_EXT_Crowd_Clap_To_Beat_Right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_EXT_Crowd_Clap_01
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_02
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_03
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_04
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_05
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_06
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
MD_EXT_Crowd_Clap_To_Beat_Left_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_EXT_Crowd_Clap_01
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_02
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_03
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_04
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_05
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_06
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
	]
}
MD_EXT_Crowd_Clap_To_Beat_Right_Middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.001
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			MD_EXT_Crowd_Clap_01
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_02
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_03
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_04
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_05
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			MD_EXT_Crowd_Clap_06
			vol = -2
			pan1x = -0.37
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Select_Negative
			pitch = 0
			vol = -4
		}
	]
}
Audio_Options_Fader_End_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Select_Negative
			pitch = 0
			vol = 7
		}
	]
}
Jam_Fret_Noise_Lead_container = {
	Default_Priority = 1
	Default_Buss = JamMode_LeadGuitar
	NoRepeatFor = 0.75
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
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
You_Rock_Explosion_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			You_Rock_Explode
		}
	]
}
StartTestTones_Sine_container = {
	Default_Priority = 75
	Default_Buss = Test_Tones
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
}
StartTestTones_Pink_container = {
	Default_Priority = 75
	Default_Buss = Test_Tones
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
}
UI_Fader_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.0
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Audio_Options_Fader_Scroll
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Options_Sound_EQKnob_Move
		}
	]
}
Dolby_Off_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Options_Sound_DolbyDigitalDisable
			vol = -1
		}
	]
}
Dolby_On_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_DolbyDigitalEnable_Surround_L
			vol = -2
			pan1x = -1.0
			pan1y = 1.0
		}
		{
			Menu_DolbyDigitalEnable_Surround_C
			vol = -2
			pan1x = 0.0
			pan1y = 1.0
		}
		{
			Menu_DolbyDigitalEnable_Surround_R
			vol = -2
			pan1x = 1.0
			pan1y = 1.0
		}
		{
			Menu_DolbyDigitalEnable_Surround_Ls
			vol = -2
			pan1x = -1.0
			pan1y = -1.0
		}
		{
			Menu_DolbyDigitalEnable_Surround_Rs
			vol = -2
			pan1x = 1.0
			pan1y = -1.0
		}
		{
			Menu_DolbyDigitalEnable_Surround_Lf
			vol = -2
			LFEOnly = true
			LFE_vol = -15
		}
	]
}
Sound_Options_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Audio_Options_Select
			vol = 4
		}
	]
}
Sound_Options_Back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Audio_Options_Back
			vol = 1
		}
	]
}
GigBoard_Zoom_Left_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Gigboard_CameraPan_Left
			vol = -12.5
		}
	]
}
GigBoard_Zoom_Right_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Gigboard_CameraPan_Left
			vol = -12.5
		}
	]
}
ColorWheel_Rotate_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_ColorWheel_Rotate
			vol = 2
		}
	]
}
ColorWheel_Deselect_PiePiece_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_ColorWheel_Deselect_PiePiece
		}
	]
}
ColorWheel_HighLight_1_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_ColorWheel_HighLight_Up_Down_1
			vol = -7
		}
	]
}
ColorWheel_SelectColor_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_ColorWheel_GradientSelect
		}
	]
}
ColorWheel_SelectPie_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_ColorWheel_SelectPie
			vol = -4
		}
	]
}
ColorWheel_SelectShade_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_EnterName_Scroll_3
			pitch = -2
			vol = -11
		}
	]
}
Enter_Band_Name_Scroll_Up_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_EnterName_Scroll_3
			pitch = -2
			vol = -11
		}
	]
}
Enter_Band_Name_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_EnterName_Select
			pitch = 0
			vol = -5
		}
	]
}
Recording_Start_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Options_Sound_up_down
			vol = 6
		}
	]
}
Audio_Options_Menu_Guitar_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			audio_options_guitar
			vol = -12
		}
	]
}
Audio_Options_Menu_Bass_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			audio_options_bass
			vol = -12
		}
	]
}
Audio_Options_Menu_Drums_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			audio_options_drum
			vol = -12
		}
	]
}
Audio_Options_Menu_Vocals_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Audio_Options_Vocals
			vol = -12
		}
	]
}
Audio_Options_Menu_SFX_container = {
	Default_Priority = 50
	Default_Buss = Options_SFX
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			bad_note1
			vol = -8.63
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panRemoveCenter = true
		}
		{
			bad_note2
			vol = -7.02
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panRemoveCenter = true
		}
		{
			bad_note3
			vol = -8.26
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panRemoveCenter = true
		}
		{
			bad_note4
			vol = -8.21
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panRemoveCenter = true
		}
		{
			bad_note6
			vol = -8.26
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panRemoveCenter = true
		}
	]
}
Audio_Options_Menu_Microphone_container = {
	Default_Priority = 50
	Default_Buss = Mic_Options_SFX_Buss
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Audio_Options_Mic
			vol = -10
			pitch = -0.95
		}
	]
}
Audio_Options_Menu_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Options_Crowd
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHMix2_Scroll_Sound
		}
	]
}
GHTunes_UI_Scroll_Pan_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
}
GHTunes_UI_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHMix2_Select_Sound
		}
	]
}
GHTunes_UI_Back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHMix2_Back_Sound
		}
	]
}
Pause_Menu_Enter_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_PauseMenu_In
		}
	]
}
Enter_Band_Name_Finish_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_EnterName_Finish_01
			vol = -8.5
		}
	]
}
UI_Unlock_Item_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			Song_Affirmation_02
			vol = -8
		}
		{
			Song_Affirmation_03
			vol = -8
		}
		{
			Song_Affirmation_05
			vol = -8
		}
	]
}
Enter_Band_Name_Back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_EnterName_Back
			vol = -7
		}
	]
}
Band_Mode_Career_Ready_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_EnterName_Finish_01
			vol = -2
		}
	]
}
Gh4_GigComplete_Sponsor_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Gig_Complete_Sponsor
			vol = -1
		}
	]
}
Pause_Menu_Exit_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_PauseMenu_Out
		}
	]
}
ColorWheel_HighLight_4_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_ColorWheel_HighLight_Up_Down_4
			vol = -5
		}
	]
}
ColorWheel_HighLight_2_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_ColorWheel_HighLight_Up_Down_2
			vol = -5
		}
	]
}
ColorWheel_HighLight_3_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_ColorWheel_HighLight_Up_Down_3
			vol = -5
		}
	]
}
ColorWheel_HighLight_5_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_ColorWheel_HighLight_Up_Down_5
			vol = -5
		}
	]
}
Menu_Recording_Pause_Panel_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Jam_Pause_Panel_in
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Jam_Pause_Panel_in
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Jam_Pause_Panel_out
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
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
}
SurgeBetweenSongs_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
}
Large_EXT_Crowd_Song_Transition_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_EXT_Crowd_Song_Transition
		}
	]
}
MD_INT_Crowd_Song_Transition_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_INT_Crowd_Song_Transition
		}
	]
}
UI_SFX_Scroll_Up_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Scroll_Up
			vol = -6
			pitch = 0
		}
	]
}
UI_SFX_Scroll_Down_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Scroll_down
			vol = -6
			pitch = 0
		}
	]
}
UI_SFX_Negative_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Select_Negative
			pitch = 0
			vol = -4
		}
	]
}
Band_Lobby_Negative_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Select_Negative
			pitch = 0
			vol = -1
		}
	]
}
Enter_Band_Name_Caps_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_EnterName_Caps
			vol = -4
		}
	]
}
Song_Wizard_On_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SoundOptions_Menu_Reset
			vol = -2
		}
	]
}
Menu_Cheat_Enter_Red_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Cheat_Red
			vol = -9
			pan1x = -0.5
			pan1y = 1.0
			pan2x = 0.5
			pan2y = 1.0
		}
	]
}
Menu_Cheat_Enter_Green_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Cheat_Green
			vol = -9
			pan1x = -0.5
			pan1y = 1.0
			pan2x = 0.5
			pan2y = 1.0
		}
	]
}
Menu_Cheat_Enter_Blue_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Cheat_Blue
			vol = -9
			pan1x = -0.5
			pan1y = 1.0
			pan2x = 0.5
			pan2y = 1.0
		}
	]
}
Menu_Cheat_Enter_Yellow_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Cheat_Yellow
			vol = -9
			pan1x = -0.5
			pan1y = 1.0
			pan2x = 0.5
			pan2y = 1.0
		}
	]
}
Large_Guitar_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			Guitar_Smash_Large_GH4_01
			vol = 3
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
		{
			Guitar_Smash_Large_GH4_04
			vol = 3
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
	]
}
Medium_Guitar_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			Guitar_Smash_Medium_GH4_02
			vol = 3
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
		{
			Guitar_Smash_Medium_GH4_03
			vol = 3
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
	]
}
Mic_Feedback_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			Mic_Feedback_GH4_01
			vol = 4
		}
		{
			Mic_Feedback_GH4_02
			vol = 4
		}
	]
}
Small_Guitar_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			Guitar_Smash_Small_GH4_02
			vol = 3
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
		{
			Guitar_Smash_Small_GH4_03
			vol = 3
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
	]
}
Mic_Grab_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
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
Drummer_Sticks_Throw_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
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
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
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
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
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
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			Bass_Smash_Large_GH4_01
			vol = 5
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
		{
			Bass_Smash_Large_GH4_02
			vol = 5
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
	]
}
Medium_Bass_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			Bass_Smash_Medium_GH4_01
			vol = 5
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
		{
			Bass_Smash_Medium_GH4_02
			vol = 5
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
	]
}
Small_Bass_Smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			Bass_Smash_Small_GH4_01
			vol = 5
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
		{
			Bass_Smash_Small_GH4_02
			vol = 5
			RandomPitch = {
				type = RandomNoRepeatLastTwoType
				vals = [
					-1
					0
					1
					2
					-2
				]
			}
		}
	]
}
Mic_Hit_container = {
	Default_Priority = 50
	Default_Buss = Crowd_beds
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Band_leader_affirmation
			vol = -4
		}
	]
}
Gigboard_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_Sound_05
			vol = -7.5
		}
	]
}
Gigboard_Select_back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_Sound_09
			vol = -7
		}
	]
}
QuickPlay_Remove_Song_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_QuickPlay_RemoveSong
			pitch = 0
			vol = 1
		}
	]
}
QuickPlay_Select_Song_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_QuickPlay_SelectSong
			pitch = 2
			vol = 12
		}
	]
}
QuickPlay_Remove_All_Songs_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_QuickPlay_RemoveAllSongs
			pitch = 0
			vol = -8
		}
	]
}
Front_End_Main_Menu_Intro_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Main_Intro
			vol = -2
		}
	]
}
Front_End_Main_Menu_Intro_Rears_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Main_Intro_Rears
			vol = -2
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
Menu_Song_Complete_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SongComplete_Out
			vol = -80
		}
	]
}
Menu_Song_Complete_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SongComplete_In
			vol = -80
		}
	]
}
Unlock_New_Item_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Band_Mode_Ready
			vol = -11
		}
	]
}
GHTunes_On_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_JamMode_SongWizard_OFF
			vol = -1
			pitch = 4
		}
	]
}
Vocal_Highway_Appear_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHTunes_Scroll_Warning
		}
	]
}
MD_EXT_Encore_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Encore_Loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_EXT_Encore_Crowd
			vol = -8
		}
	]
}
LG_EXT_Encore_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Encore_Loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			LG_EXT_Encore_Crowd
			vol = -8
		}
	]
}
MD_INT_Encore_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Encore_Loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_INT_Encore_Crowd
			vol = -8
		}
	]
}
SM_INT_Encore_Crowd_container = {
	Default_Priority = 50
	Default_Buss = Encore_Loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			SM_INT_Encore_Crowd
			vol = -8
		}
	]
}
Gigboard_Scroll_Up_Down_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			UI_GigBoard_Scroll
			vol = -9
		}
	]
}
Gigboard_Gig_Unlock_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Gig_Unlock
			vol = -3
		}
	]
}
Unlock_Item_Text_Appear_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GigComplete_Unlock_Item_Text_Appear
			vol = -2
		}
	]
}
GigComplete_Magazine_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Gig_Complete_Magazine_Out
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
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_EXT_Crowd_Swell_LG
			vol = -6
		}
	]
}
Loading_Crowd_Medium_Burst_container = {
	Default_Priority = 100
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_EXT_Crowd_Swell_MD
			vol = -6
		}
	]
}
Loading_Crowd_Short_Burst_container = {
	Default_Priority = 100
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	Command = PlaySound
	randomness = None
	sounds = [
		{
			MD_EXT_Crowd_Swell_SH
			vol = -6
		}
	]
}
Fireworks_Last_Venue_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Last_Venue_Fireworks
			vol = -2
		}
	]
}
Countdown_Timer_Beep_SFX_container = {
	Default_Priority = 51
	Default_Buss = front_end
	NoRepeatFor = 0.0001
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GH_Countdown_Timer_SFX
			vol = -7.0
			pitch = 7
		}
	]
}
play_transition_sfx_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
}
Meter_Fade_In_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Meter_Fade_In
		}
	]
}
Quick_Play_Clear_One_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Quick_Play_Clear_One
		}
	]
}
Quick_Play_Clear_All_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Quick_Play_Clear_All
		}
	]
}
Quick_Play_Choose_Song_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Quick_Play_Choose_Song
		}
	]
}
Online_UI_Team_Result_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			Online_UI_Team_Result_01
		}
		{
			Online_UI_Team_Result_02
		}
		{
			Online_UI_Team_Result_03
		}
		{
			Online_UI_Team_Result_04
		}
		{
			Online_UI_Team_Result_05
		}
	]
}
Menu_Calibration_Exit_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Calibration_Exit
		}
	]
}
Menu_Calibration_Enter_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Calibration_Enter
		}
	]
}
Menu_Character_Restore_Defaults_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Character_Restore_Defaults
		}
	]
}
Menu_Cheat_Incorrect_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Cheat_Incorrect
		}
	]
}
Menu_Cheat_Correct_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Cheat_Correct
		}
	]
}
Character_Edit_Transition_Out_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Character_Edit_Transition_Out
		}
	]
}
Character_Edit_Transition_In_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Character_Edit_Transition_In
		}
	]
}
Menu_Character_Gradient_Slider_Move_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Character_Gradient_Slider_Move
		}
	]
}
Menu_ZoomIn_Text_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_ZoomIn_Text
		}
	]
}
Menu_zoomOut_Text_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_zoomOut_Text
		}
	]
}
GHTunes_Menu_Down_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHTunes_Menu_Down
		}
	]
}
GHTunes_Menu_Up_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHTunes_Menu_Up
		}
	]
}
Music_Store_Buy_Song_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Music_Store_Buy_Song
		}
	]
}
Leaderboard_Song_To_Difficulty_Transition_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Leaderboard_Song_To_Difficulty_Transition
		}
	]
}
GHMix2_StopSong_Sound_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHMix2_StopSong_Sound
		}
	]
}
GHMix2_Scroll_Sound_01_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHMix2_Scroll_Sound
		}
	]
}
GHMix2_Select_Sound_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHMix2_Select_Sound
		}
	]
}
GHMix2_Back_Sound_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHMix2_Back_Sound
		}
	]
}
GHMix2_StartSong_Sound_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHMix2_StartSong_Sound
		}
	]
}
GHMix2_Scroll_Sound_02_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GHMix2_Scroll_Sound_02
		}
	]
}
Outro_Three_Stars_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Outro_Three_Stars
			vol = -6
		}
	]
}
Outro_Two_Stars_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Outro_Two_Stars
			vol = -6
		}
	]
}
playlist_scroll_sound_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Playlist_Scroll
			vol = -17
		}
	]
}
songlist_scroll_sound_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Playlist_Scroll
			vol = -17
		}
	]
}
songlist_to_playlist_switch_sfx_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Setlist_To_Playlist_Select
			vol = -2
		}
	]
}
Outro_Five_Stars_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Outro_Five_Stars
			vol = -6
		}
	]
}
Outro_Four_Stars_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Outro_Four_Stars
			vol = -6
		}
	]
}
Outro_One_Star_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Outro_One_Star
			vol = -6
		}
	]
}
Sort_Songlist_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Songlist_Sort_Songs
			vol = 6
			pitch = 0
		}
	]
}
Star_Counter_01_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 15
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Counter_01
			vol = 7
		}
	]
}
Star_Counter_02_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Counter_02
			vol = -6
		}
	]
}
ShredFest_Momentum_Diff_Up_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Shredfest_Momentum_Difficulty_Up
			vol = -3
		}
	]
}
ShredFest_Momentum_Diff_Down_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Shredfest_Momentum_Difficulty_Down
			vol = -6
		}
	]
}
Audio_Options_Scroll_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Audio_Options_Scroll
			vol = -2
		}
	]
}
Shredfest_Play_SuddenDeath_Dropped_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Shredfest_Player_Dropout
			vol = -12.0
		}
	]
}
Point_Awarded_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Point_Awarded
			vol = -6.0
		}
	]
}
Band_Lobby_Leader_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Band_Leader_SFX
			vol = -4
		}
	]
}
Online_Team_Switch_Affirmation_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Band_Leader_SFX
			vol = -4
		}
	]
}
Band_Lobby_Complete_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Band_Complete_SFX
			vol = -1.0
		}
	]
}
Freeplay_Enter_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Freeplay_Enter_SFX
		}
	]
}
CAR_Zoom_In_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			CAR_Zoom_In
			vol = -7
		}
	]
}
Outro_Six_Stars_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Outro_Six_Stars
		}
	]
}
CAR_Zoom_Out_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 5
	Command = PlaySound
	randomness = None
	sounds = [
		{
			CAR_Zoom_Out
			vol = -5
		}
	]
}
End_Of_Song_Camera_Movement_Sound_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			Camera_Whoosh_1
			vol = 0
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			Camera_Whoosh_2
			vol = 0
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			Camera_Whoosh_3
			vol = 0
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			Camera_Whoosh_4
			vol = 0
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
	]
}
JM_Menu_Scroll_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatType
	sounds = [
		{
			JM_Menu_Scroll_B2
			vol = -3
			attack_length = 0.0
			attack_function = linear
			decay_length = 0.0
			release_length = 0.3
			decay_function = linear
			release_function = linear
		}
		{
			JM_Menu_Scroll_C3
			vol = -3
			attack_length = 0.0
			attack_function = linear
			decay_length = 0.0
			release_length = 0.3
			decay_function = linear
			release_function = linear
		}
		{
			JM_Menu_Scroll_E3
			vol = -3
			attack_length = 0.0
			attack_function = linear
			decay_length = 0.0
			release_length = 0.3
			decay_function = linear
			release_function = linear
		}
	]
}
JM_Menu_Back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			JM_Menu_Back
			vol = -3
		}
	]
}
JM_Menu_Check_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			JM_Menu_Check
			vol = -3
		}
	]
}
JM_Menu_UnCheck_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			JM_Menu_UnCheck
			vol = -3
		}
	]
}
JM_Menu_Select_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			JM_Menu_Select
			vol = -5
		}
	]
}
JM_Menu_FinalSelect_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			JM_Menu_FinalSelect
			vol = -3
		}
	]
}
JM_Menu_Loop_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			JM_Menu_Loop_01
			vol = -4
			num_loops = -1
			attack_length = 2.5
			attack_function = linear
			decay_length = 1
			release_length = 1
			decay_function = linear
			release_function = linear
		}
		{
			JM_Menu_Loop_02
			vol = -4
			num_loops = -1
			attack_length = 2.5
			attack_function = linear
			decay_length = 1
			release_length = 1
			decay_function = linear
			release_function = linear
		}
	]
}
GH_SFX_You_Lose_Single_Player_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			GH3_Sudden_Death
			vol = -6.0
		}
	]
}
Surge_During_Stats_Screen_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			surge_01
			vol = 7
		}
		{
			surge_02
			vol = 7
		}
		{
			surge_03
			vol = 5
		}
		{
			surge_04
			vol = 7
		}
		{
			surge_05
			vol = 3
		}
		{
			surge_06
			vol = 1
		}
	]
}
CAR_Widget_Select_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Car_Widget_Select
			vol = -11
		}
	]
}
CAR_Widget_DeSelect_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Car_Widget_DeSelect
			vol = -8
		}
	]
}
CAR_Widget_Scroll_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Car_Widget_Scroll
		}
	]
}
EndOfSong_Camera_Cheer_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			New_Crowd_Cheer_01
			vol = -5
		}
		{
			New_Crowd_Cheer_02
			vol = -5
		}
		{
			New_Crowd_Cheer_03
			vol = -5
		}
		{
			New_Crowd_Cheer_04
			vol = -5
		}
		{
			New_Crowd_Cheer_05
			vol = -5
		}
	]
}
Pyro_container = {
	Default_Priority = 50
	Default_Buss = Pyro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			Pyro_1
			send_vol1 = 9
			RandomVol = {
				type = RandomRangeType
				vals = [
					-14
					-11
				]
			}
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			Pyro_2
			send_vol1 = 9
			RandomVol = {
				type = RandomRangeType
				vals = [
					-14
					-11
				]
			}
			RandomPitch = {
				type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			Pyro_3
			send_vol1 = 9
			RandomVol = {
				type = RandomRangeType
				vals = [
					-14
					-11
				]
			}
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
You_Rock_Back_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			You_Rock_Back
			vol = 2.5
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
You_Rock_LFE_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			You_Rock_LFE
			LFEOnly = true
			LFE_vol = -8.5
		}
	]
}
You_Rock_Front_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			You_Rock_Front
			vol = 2.5
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
	]
}
EndOfSong_Camera_Cheer_Softer_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			New_Crowd_Cheer_01
			vol = -8
		}
		{
			New_Crowd_Cheer_02
			vol = -8
		}
		{
			New_Crowd_Cheer_03
			vol = -8
		}
		{
			New_Crowd_Cheer_04
			vol = -8
		}
		{
			New_Crowd_Cheer_05
			vol = -8
		}
	]
}
Gig_Challenge_Complete_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Gig_Challenge
			vol = -17
		}
	]
}
Band_Moment_SFX_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			band_moments
			vol = -9
		}
	]
}
Gameplay_Vote_Heaven_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Gameplay_Vote_Heaven
			vol = -5
			pitch = 0
		}
	]
}
Gameplay_Vote_Hell_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Gameplay_Vote_Hell
			vol = -8
			pitch = 0
		}
	]
}
Gameplay_Spin_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Gameplay_Spin
			vol = -13
		}
	]
}
Gameplay_Spin_Winner_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Gameplay_Spin
			vol = -15
			pitch = 2
		}
	]
}
vote_tie_crowd_swell_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Vote_Affimation_Tie_Swell
			vol = -4
		}
	]
}
vote_hell_crowd_swell_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Vote_Affimation_Hell_Swell
			vol = -4
		}
	]
}
vote_heaven_crowd_swell_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Vote_Affimation_Heaven_Swell
		}
	]
}
Gameplay_Vote_Countdown_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Menu_Gameplay_Vote_Countdown_01
			vol = -3
			pitch = 0
		}
	]
}
EndOfSong_Camera_Cheer_Quiet_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			New_Crowd_Cheer_01
			vol = -22
		}
		{
			New_Crowd_Cheer_02
			vol = -22
		}
		{
			New_Crowd_Cheer_03
			vol = -22
		}
		{
			New_Crowd_Cheer_04
			vol = -22
		}
		{
			New_Crowd_Cheer_05
			vol = -22
		}
	]
}
EndOfSong_Camera_Cheer_Quieter_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	randomness = RandomNoRepeatLastTwoType
	sounds = [
		{
			New_Crowd_Cheer_01
			vol = -24
		}
		{
			New_Crowd_Cheer_02
			vol = -24
		}
		{
			New_Crowd_Cheer_03
			vol = -24
		}
		{
			New_Crowd_Cheer_04
			vol = -24
		}
		{
			New_Crowd_Cheer_05
			vol = -24
		}
	]
}
Beginning_Crowd_Swell_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Beginning_Crowd_Swell
			vol = -15
		}
	]
}
Surge_From_Main_To_Freeplay_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Crowd_From_Main_To_Freeplay
			vol = -24
		}
	]
}
bandlineup_scroll_event_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			PlaySound
			lobbyscroll01
			vol = -5
			pitch = 1
		}
	]
}
lobbyback_sfx_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			PlaySound
			lobbyback06
			vol = -8
		}
	]
}
Venue_Unlock_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			unlock_venue
			vol = 10
		}
	]
}
Online_Team_Switch_Resend_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Team_Switch_Resend
		}
	]
}
Online_Team_Switch_Request_SFX_container = {
	Default_Priority = 50
	Default_Buss = front_end
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Team_Switch_Request
		}
	]
}
Band_Moment_Back_container = {
	Default_Priority = 50
	Default_Buss = UI_InGame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Band_Moments_Back
			vol = -9
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
Star_Power_Delay_Normal_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power_Delay
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 20
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Back
			vol = 5
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
	]
}
Star_Power_Delay_Middle_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power_Delay
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 20
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Back
			vol = 3
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
	]
}
Star_Power_Delay_Left_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power_Delay
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 20
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Back
			vol = 3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
Star_Power_Delay_Right_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power_Delay
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 20
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Back
			vol = 3
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Star_Power_Delay_Right_Middle_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power_Delay
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 20
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Back
			vol = 3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
Star_Power_Delay_Left_Middle_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power_Delay
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 20
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Star_Deployed_Back
			vol = 3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
Space_Intro_FT_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Space_Intro_FT
			vol = 8
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
	]
}
Space_Intro_BK_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	randomness = None
	sounds = [
		{
			Space_Intro_BK
			vol = 6
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
