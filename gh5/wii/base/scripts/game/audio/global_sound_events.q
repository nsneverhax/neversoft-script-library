Crowd_Individual_Clap_To_Beat_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
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
	Command = PlaySound
	Randomness = None
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
crowd_fail_song_sfx_softer_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = 2
			pan1x = -1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
		{
			sp_awarded2
			vol = 3
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -1
			pan1x = -1
			pan1y = 1
			pan2x = -0.5141509
			pan2y = 1
			panremovecenter = true
		}
		{
			sp_awarded2
			vol = 0
			pan1x = -1
			pan1y = 1
			pan2x = -0.5141509
			pan2y = 1
			panremovecenter = true
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -1
			pan1x = 0.4669811
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
		{
			sp_awarded2
			vol = 0
			pan1x = 0.4669811
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
	]
}
star_power_awarded_sfx_p3_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -1
			pan1x = -0.45283026
			pan1y = 1
			pan2x = 0.45283026
			pan2y = 1
			panremovecenter = true
		}
		{
			sp_awarded2
			vol = 0
			pan1x = -0.45283026
			pan1y = 1
			pan2x = 0.45283026
			pan2y = 1
			panremovecenter = true
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
	Randomness = None
	Sounds = [
		{
			sp_available1
			vol = 3.5
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
	Randomness = None
	Sounds = [
		{
			sp_available1
			vol = -7.51
			pan1x = -1
			pan1y = 0.504717
			pan2x = -0.5613208
			pan2y = 1
			panremovecenter = true
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
	Randomness = None
	Sounds = [
		{
			sp_available1
			vol = -7.51
			pan1x = 0.53773576
			pan1y = 1
			pan2x = 1
			pan2y = 0.63
			panremovecenter = true
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
	Randomness = None
	Sounds = [
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
	Randomness = None
	Sounds = [
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
	Randomness = None
	Sounds = [
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
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sp_cheer1
			vol = 3
			pan1x = -1
			pan1y = 0.27
			pan2x = -0.5283019
			pan2y = 1
			panremovecenter = true
		}
	]
}
Star_Power_Deployed_Cheer_SFX_P2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sp_cheer1
			vol = 3
			pan1x = 0.5566037
			pan1y = 1
			pan2x = 1
			pan2y = 0.63
			panremovecenter = true
		}
	]
}
star_power_deployed_cheer_sfx_p3_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sp_cheer1
			vol = 3
			pan1x = 1
			pan1y = 1
			pan2x = 0.41
			pan2y = 1
			panremovecenter = true
		}
	]
}
ui_sfx_scroll_container = {
	Default_Priority = 90
	Default_Buss = Front_End
	NoRepeatFor = 0.03
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			scroll
			vol = 2
		}
	]
}
pause_menu_sfx_container = {
	Default_Priority = 90
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Sound_05
			vol = -3
		}
	]
}
ui_sfx_select_container = {
	Default_Priority = 90
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Sound_05
			vol = -3
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
	Randomness = None
	Sounds = [
		{
			GH3_Beat_Sound
			vol = -3
			pitch = 12
		}
	]
}
gh_sfx_calibration_beatsoundevent_container = {
	Default_Priority = 90
	Default_Buss = Test_Tones
	NoRepeatFor = 0.001
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_applause
		}
		{
			loadscreen_electrical_loop_long
		}
		{
			loadscreen_music
		}
		{
			loadscreen_star_explode
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
	Randomness = None
}
lg_ext_crowd_swell_short_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_ext_crowd_swell_sh
			vol = 2
		}
	]
}
lg_ext_crowd_swell_short_soft_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_ext_crowd_swell_sh
			vol = -7
		}
	]
}
lg_ext_crowd_swell_med_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_ext_crowd_swell_md
			vol = 0
		}
	]
}
lg_ext_crowd_swell_long_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_ext_crowd_swell_lg
			vol = 1
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sm_crowd_boo_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.61
			pan1y = -1
		}
		{
			sm_crowd_boo_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 1
			pan1y = -0.13
		}
		{
			sm_crowd_boo_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.69
			pan1y = -1
		}
		{
			sm_crowd_boo_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0
			pan1y = -1
		}
		{
			sm_crowd_boo_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = -0.69
			pan1y = -1
		}
		{
			sm_crowd_boo_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = -0.07
			pan1y = -0.7
		}
		{
			sm_crowd_boo_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.31
			pan1y = -0.7
		}
		{
			sm_crowd_boo_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.1
			pan1y = -0.7
		}
		{
			sm_crowd_boo_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					4.59
					5.56
				]
			}
			pan1x = 0.6
			pan1y = -0.8
		}
		{
			sm_crowd_boo_10
			RandomVol = {
				Type = RandomRangeType
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
	Default_Buss = Front_End
	NoRepeatFor = 0.5
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Menu_Warning_01
			vol = -6
		}
	]
}
menu_warning_sfx_softer_container = {
	Default_Priority = 75
	Default_Buss = Front_End
	NoRepeatFor = 0.5
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
}
Generic_Menu_Back_SFX_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Sound_09
			vol = -5.5
		}
	]
}
Notes_Ripple_Up_SFX_container = {
	Default_Priority = 80
	Default_Buss = Front_End
	NoRepeatFor = 0.5
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Notes_Ripple_Up_01
			vol = -3.73
		}
	]
}
lg_ext_crowd_transition_positive_to_neutral_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_positive_to_neutral
			vol = 13
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
lg_ext_crowd_transition_positive_to_neutral_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_positive_to_neutral
			vol = 3
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
lg_ext_crowd_transition_positive_to_neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_positive_to_neutral
			vol = 3
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
lg_ext_crowd_transition_neutral_to_positive_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_positive
			vol = 0
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
lg_ext_crowd_transition_neutral_to_positive_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_positive
			vol = 0
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
lg_ext_crowd_transition_neutral_to_positive_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_positive
			vol = 0
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
lg_ext_crowd_transition_neutral_to_negative_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_negative
			vol = 0
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
lg_ext_crowd_transition_neutral_to_negative_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_negative
			vol = 0
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
lg_ext_crowd_transition_neutral_to_negative_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_negative
			vol = 0
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
lg_ext_crowd_transition_negative_to_neutral_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_negative_to_neutral
			vol = 12
			pan1x = -1
			pan1y = 1
			pan2x = -0.5
			pan2y = 1
		}
	]
}
lg_ext_crowd_transition_negative_to_neutral_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_negative_to_neutral
			vol = 12
			pan1x = 0.5
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
	]
}
lg_ext_crowd_transition_negative_to_neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_negative_to_neutral
			vol = 12
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
	]
}
md_ext_crowd_transition_positive_to_neutral_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_positive_to_neutral
			vol = 0.5
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_positive_to_neutral_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_positive_to_neutral
			vol = 0.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_positive_to_neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_positive_to_neutral
			vol = 0.5
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_positive_to_neutral_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_positive_to_neutral
			vol = -2
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_positive_to_neutral_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_positive_to_neutral
			vol = -2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_positive_to_neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_positive_to_neutral
			vol = -2
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_neutral_to_positive_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_positive
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_neutral_to_positive_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_positive
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_neutral_to_positive_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_positive
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_neutral_to_positive_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_positive_01
			vol = 2.5
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_neutral_to_positive_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_positive
			vol = 2.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_neutral_to_positive_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_positive
			vol = 2.5
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_neutral_to_negative_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_negative
			vol = -1
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_neutral_to_negative_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_negative
			vol = -1
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_neutral_to_negative_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_negative
			vol = -1
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_neutral_to_negative_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_negative
			vol = -1.5
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_neutral_to_negative_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_negative
			vol = -1.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_neutral_to_negative_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_negative
			vol = -1.5
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_negative_to_neutral_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_negative_to_neutral
			vol = 12
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_negative_to_neutral_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_negative_to_neutral
			vol = 12
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_ext_crowd_transition_negative_to_neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_negative_to_neutral
			vol = 12
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_negative_to_neutral_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_negative_to_neutral
			vol = 8
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_negative_to_neutral_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_negative_to_neutral
			vol = 8
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_int_crowd_transition_negative_to_neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_negative_to_neutral
			vol = 8
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_positive_to_neutral_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_positive_to_neutral
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_positive_to_neutral_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_positive_to_neutral
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_positive_to_neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_positive_to_neutral
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_negative_to_neutral_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_negative_to_neutral
			vol = 6
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_negative_to_neutral_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_negative_to_neutral
			vol = 6
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition__negative_to_neutral_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_negative_to_neutral
			vol = 6
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_neutral_to_positive_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_positive
			vol = 3
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_neutral_to_positive_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_positive
			vol = 3
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_neutral_to_positive_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_positive
			vol = 3
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_neutral_to_negative_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_negative
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_neutral_to_negative_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_negative
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
sm_int_crowd_transition_neutral_to_negative_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_negative
			vol = 2
			pan1x = -1
			pan1y = 0.25
			pan2x = 1
			pan2y = 0.25
		}
	]
}
md_ext_crowd_swell_long_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_crowd_swell_lg
			vol = 1
		}
	]
}
md_int_crowd_swell_long_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_int_crowd_swell_lg
			vol = 3
		}
	]
}
sm_int_crowd_swell_long_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_int_crowd_swell_lg
			vol = 0
		}
	]
}
md_ext_crowd_swell_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_crowd_swell_md
			vol = 1
		}
	]
}
md_int_crowd_swell_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_int_crowd_swell_md
			vol = 0
		}
	]
}
sm_int_crowd_swell_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_int_crowd_swell_md
			vol = 0
		}
	]
}
md_ext_crowd_swell_short_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_crowd_swell_sh
			vol = 1
		}
	]
}
md_ext_crowd_swell_short_soft_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_crowd_swell_sh
			vol = -5
		}
	]
}
md_int_crowd_swell_short_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_int_crowd_swell_sh
			vol = 0.5
		}
	]
}
md_int_crowd_swell_short_soft_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_int_crowd_swell_sh
			vol = -5
		}
	]
}
sm_int_crowd_swell_short_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_int_crowd_swell_sh
			vol = 2
		}
	]
}
sm_int_crowd_swell_short_soft_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_int_crowd_swell_sh
			vol = -6
		}
	]
}
Box_Check_SFX_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			CheckBox_Check_SFX
			pitch = 0
			vol = -1.93
		}
	]
}
Box_UnCheck_SFX_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			checkbox_uncheck_sfx
			pitch = 0
			vol = -1.93
		}
	]
}
You_Rock_End_SFX_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			You_Rock
			vol = -3
		}
	]
}
ui_sfx_scroll_add_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Scroll_Add2
			vol = -4.14
		}
	]
}
UI_SFX_Lose_Multiplier_2X_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Lose_Multiplier
			vol = -14.38
			pitch = 1.65
		}
	]
}
UI_SFX_Lose_Multiplier_3X_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Lose_Multiplier
			vol = -10.87
			pitch = 0.84000003
		}
	]
}
UI_SFX_Lose_Multiplier_4X_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Lose_Multiplier
			vol = -8.49
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
	Command = PlaySound
	Randomness = None
}
Song_Intro_Kick_SFX_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Song_Intro_Kick
			vol = -4.5
		}
	]
}
Song_Intro_Highway_Up_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
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
	Randomness = None
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			StickClickMed
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			StickClickMed
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-3.73
					-4.14
					-5.17
					-6.0
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			StickClickMed
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-9.09
					-8.610001
					-7.9300003
					-7.51
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			HiHatClosed01
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-0.90999997
					-0.44
					0.0
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			HiHatClosed01
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-0.90999997
					-0.44
					0.0
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			HiHatClosed01
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-0.90999997
					-0.44
					0.0
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			HiHatOpen02
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					0.42000002
					0.83
					1.21
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			HiHatOpen02
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					0.42000002
					0.83
					1.21
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			HiHatOpen02
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					0.42000002
					0.83
					1.21
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			HiHatPedal02
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					0.83
					1.58
					2.27
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			HiHatPedal02
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					0.83
					1.58
					2.27
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			HiHatPedal02
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					0.83
					1.58
					2.27
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			StickClickLarge
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			StickClickLarge
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			StickClickLarge
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			StickClickSmall
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-1.41
					-0.90999997
					-0.44
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			StickClickSmall
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-1.41
					-0.90999997
					-0.44
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Randomness = None
	Sounds = [
		{
			StickClickSmall
			RandomVol = {
				Type = RandomNoRepeatLastTwoType
				vals = [
					-1.41
					-0.90999997
					-0.44
				]
			}
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
jam_mode_metronome_container = {
	Default_Priority = 90
	Default_Buss = Practice_Band_Playback
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
}
Cheat_Single_Strum_Note_1_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_pk_a3_s2_f12_01
		}
		{
			sg_b_pk_a3_s2_f12_02
		}
		{
			sg_b_pk_a3_s2_f12_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_pk_bb3_s4_f3_01
		}
		{
			sg_b_pk_bb3_s4_f3_02
		}
		{
			sg_b_pk_bb3_s4_f3_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_pk_d4_s4_f7_01
		}
		{
			sg_b_pk_d4_s4_f7_02
		}
		{
			sg_b_pk_d4_s4_f7_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_pk_e4_s6_f0_01
		}
		{
			sg_b_pk_e4_s6_f0_02
		}
		{
			sg_b_pk_e4_s6_f0_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_pk_g4_s6_f3_01
		}
		{
			sg_b_pk_g4_s6_f3_02
		}
		{
			sg_b_pk_g4_s6_f3_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_e5_s1_f0_01
		}
		{
			sg_b_chrd_down_e5_s1_f0_02
		}
		{
			sg_b_chrd_down_e5_s1_f0_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_g5_s1_f3_01
		}
		{
			sg_b_chrd_down_g5_s1_f3_02
		}
		{
			sg_b_chrd_down_g5_s1_f3_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_a5_s1_f5_01
		}
		{
			sg_b_chrd_down_a5_s1_f5_02
		}
		{
			sg_b_chrd_down_a5_s1_f5_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_f5_s1_f1_01
			pitch = 1
		}
		{
			sg_b_chrd_down_f5_s1_f1_02
			pitch = 1
		}
		{
			sg_b_chrd_down_f5_s1_f1_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_c5_s2_f3_01
		}
		{
			sg_b_chrd_down_c5_s2_f3_02
		}
		{
			sg_b_chrd_down_c5_s2_f3_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_b5_s1_f7_01
		}
		{
			sg_b_chrd_down_b5_s1_f7_02
		}
		{
			sg_b_chrd_down_b5_s1_f7_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_d5_s2_f5_01
		}
		{
			sg_b_chrd_down_d5_s2_f5_02
		}
		{
			sg_b_chrd_down_d5_s2_f5_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_f5_s1_f1_01
			pitch = 1
		}
		{
			sg_b_chrd_down_f5_s1_f1_02
			pitch = 1
		}
		{
			sg_b_chrd_down_f5_s1_f1_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_e5_s1_f0_01
		}
		{
			sg_b_chrd_down_e5_s1_f0_02
		}
		{
			sg_b_chrd_down_e5_s1_f0_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_f5_s1_f1_01
		}
		{
			sg_b_chrd_down_f5_s1_f1_02
		}
		{
			sg_b_chrd_down_f5_s1_f1_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_a5_s1_f5_01
		}
		{
			sg_b_chrd_down_a5_s1_f5_02
		}
		{
			sg_b_chrd_down_a5_s1_f5_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sg_b_chrd_down_c5_s2_f3_01
		}
		{
			sg_b_chrd_down_c5_s2_f3_02
		}
		{
			sg_b_chrd_down_c5_s2_f3_03
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
	Randomness = None
	Sounds = [
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
	Randomness = None
	Sounds = [
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
	Randomness = None
	Sounds = [
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
	Randomness = None
	Sounds = [
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
	Randomness = None
	Sounds = [
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
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Finish_Chord
			vol = 2.27
		}
	]
}
UI_SFX_100_Note_Streak_SinglePlayer_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_SFX_100_Note_Streak
			vol = -15
		}
	]
}
UI_SFX_50_Note_Streak_SinglePlayer_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -15
		}
	]
}
UI_SFX_100_Note_Streak_P1_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
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
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
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
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
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
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
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
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Tutorial_Missed_HOPO_Free
			vol = 3.51
		}
	]
}
Tutorial_String_1_HOPO_Free_container = {
	Default_Priority = 100
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Tutorial_String_1_HOPO_Free
			vol = 8.51
		}
	]
}
Tutorial_String_1_Strum_Free_container = {
	Default_Priority = 100
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Tutorial_String_1_Strum_Free
			vol = 8.51
		}
	]
}
Tutorial_String_2_HOPO_Free_container = {
	Default_Priority = 100
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Tutorial_String_2_HOPO_Free
			vol = 8.51
		}
	]
}
Tutorial_String_2_Strum_Free_container = {
	Default_Priority = 100
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Tutorial_String_2_Strum_Free
			vol = 8.51
		}
	]
}
Tutorial_String_3_HOPO_Free_container = {
	Default_Priority = 100
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Tutorial_String_3_HOPO_Free
			vol = 8.51
		}
	]
}
Tutorial_String_3_Strum_Free_container = {
	Default_Priority = 100
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Tutorial_String_3_Strum_Free
			vol = 8.51
		}
	]
}
lg_ext_crowd_applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_ext_crowd_applause
			vol = -3
		}
	]
}
lg_int_crowd_applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_int_crowd_applause
			vol = -3
		}
	]
}
md_ext_crowd_applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_crowd_applause
			vol = -5
		}
	]
}
md_int_crowd_applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_applause
			vol = -8
		}
	]
}
sm_int_crowd_applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_int_crowd_applause
			vol = -11
		}
	]
}
sm_ext_crowd_applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_ext_crowd_applause
			vol = -11
		}
	]
}
GH3_Score_FlyIn_Hit_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Song_Intro_Kick
			vol = -7.9300003
		}
	]
}
GH3_Cash_FlyIn_Hit_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
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
	Randomness = RandomNoRepeatType
}
star_power_deployed_front_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -10.5
			pan1x = -1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
	]
}
star_power_deployed_lfe_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_deployed_lfe
			lfeonly = true
			lfe_vol = -5
		}
	]
}
star_power_available_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_available
			vol = -9
		}
	]
}
star_power_release_front_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_release_front
			vol = -11
		}
	]
}
star_power_deployed_back_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_deployed_back
			vol = -10.5
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
star_power_available_p2_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_available
			vol = -10.5
			pan1x = 0.58
			pan1y = 1
			pan2x = 1
			pan2y = 0.77
			panremovecenter = true
		}
	]
}
star_power_available_p3_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_available
			vol = -10.5
			pan1x = -0.32000002
			pan1y = 1
			pan2x = 0.32000002
			pan2y = 1
			panremovecenter = true
		}
	]
}
star_power_deployed_back_p1_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_deployed_back
			vol = -10.5
			pan1x = -1
			pan1y = -0.9811321
			pan2x = -0.38000003
			pan2y = -1
		}
	]
}
star_power_release_center_p1_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_release_center
			vol = -100
			pan1x = -1.0
			pan1y = 1.0
		}
	]
}
star_power_deployed_back_p2_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_deployed_back
			vol = -10.5
			pan1x = 1
			pan1y = -1
			pan2x = 0.3962264
			pan2y = -0.9952829
		}
	]
}
star_power_deployed_back_p3_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_deployed_back
			vol = -10.5
			pan1x = -0.3490566
			pan1y = -1
			pan2x = 0.41
			pan2y = -1
		}
	]
}
star_power_release_front_p2_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_release_front
			vol = -11
			pan1x = 0.54
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.71
		}
	]
}
star_power_release_front_p3_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_release_front
			vol = -11
			pan1x = -0.32000002
			pan1y = 1.0
			pan2x = 0.32000002
			pan2y = 1.0
		}
	]
}
star_power_deployed_front_p2_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -10.5
			pan1x = 0.48000002
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
	]
}
star_power_deployed_front_p3_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -10.5
			pan1x = -0.32000002
			pan1y = 1
			pan2x = 0.32000002
			pan2y = 1
			panremovecenter = true
		}
	]
}
star_power_available_p1_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_available
			vol = -10.5
			pan1x = -1
			pan1y = 0.48000002
			pan2x = -0.48000002
			pan2y = 1
			panremovecenter = true
		}
	]
}
star_power_release_center_p2_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_release_center
			vol = -100
			pan1x = 1.0
			pan1y = 1.0
		}
	]
}
star_power_release_center_p3_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_release_center
			vol = -100
			pan1x = 0.0
			pan1y = 1.0
		}
	]
}
star_power_deployed_front_p1_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -10.5
			pan1x = -1
			pan1y = 1
			pan2x = -0.48000002
			pan2y = 1
			panremovecenter = true
		}
	]
}
star_power_deployed_lfe_p1_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_deployed_lfe
			lfeonly = true
			lfe_vol = -5
		}
	]
}
star_power_release_front_p1_gh4_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_release_front
			vol = -11
			pan1x = -1.0
			pan1y = 0.48000002
			pan2x = -0.48000002
			pan2y = 1.0
		}
	]
}
jam_session_rhythm_guitar_template_template = {
	Default_Priority = 25
	Default_Buss = jammode_rhythmguitar
	NoRepeatFor = 0
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	Randomness = RandomNoRepeatType
}
jam_fret_noise_rhythm_container = {
	Default_Priority = 50
	Default_Buss = jammode_rhythmguitar
	NoRepeatFor = 0.5
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			fret_noise_01
			vol = -12
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_02
			vol = -12
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_03
			vol = -12
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_05
			vol = -12
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_06
			vol = -12
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
	]
}
lg_ext_crowd_whistle_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			lg_ext_crowd_whistle_01
			vol = -4
		}
		{
			lg_ext_crowd_whistle_02
			vol = -4
		}
		{
			lg_ext_crowd_whistle_03
			vol = -4
		}
		{
			lg_ext_crowd_whistle_04
			vol = -4
		}
	]
}
lg_int_crowd_whistle_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			lg_int_crowd_whistle_01
			vol = -2
		}
		{
			lg_int_crowd_whistle_02
			vol = -2
		}
		{
			lg_int_crowd_whistle_03
			vol = -2
		}
		{
			lg_int_crowd_whistle_04
			vol = -2
		}
	]
}
md_ext_crowd_whistle_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_ext_crowd_whistle_01
			vol = -2
		}
		{
			md_ext_crowd_whistle_02
			vol = -2
		}
		{
			md_ext_crowd_whistle_03
			vol = -2
		}
		{
			md_ext_crowd_whistle_04
			vol = -2
		}
	]
}
md_ext_crowd_whistle_positive_01_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_ext_crowd_whistle_01
			vol = -12
		}
		{
			md_ext_crowd_whistle_02
			vol = -12
		}
		{
			md_ext_crowd_whistle_03
			vol = -12
		}
		{
			md_ext_crowd_whistle_04
			vol = -12
		}
	]
}
md_int_crowd_whistle_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_int_crowd_whistle_01
			vol = 5
		}
		{
			md_int_crowd_whistle_02
			vol = 5
		}
		{
			md_int_crowd_whistle_03
			vol = 5
		}
		{
			md_int_crowd_whistle_04
			vol = 5
		}
	]
}
sm_ext_crowd_whistle_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
}
sm_int_crowd_whistle_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_int_crowd_whistle_01
			vol = -2
		}
		{
			sm_int_crowd_whistle_02
			vol = -2
		}
		{
			sm_int_crowd_whistle_03
			vol = -2
		}
		{
			sm_int_crowd_whistle_04
			vol = -2
		}
	]
}
lg_ext_crowd_oneshot_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			lg_ext_crowd_cheer_gr_01
			vol = -6
		}
		{
			lg_ext_crowd_cheer_gr_02
			vol = -6
		}
		{
			lg_ext_crowd_cheer_gr_03
			vol = -6
		}
		{
			lg_ext_crowd_cheer_gr_04
			vol = -6
		}
		{
			lg_ext_crowd_cheer_sg_01
			vol = -9
		}
		{
			lg_ext_crowd_cheer_sg_02
			vol = -9
		}
		{
			lg_ext_crowd_cheer_sg_03
			vol = -9
		}
		{
			lg_ext_crowd_cheer_sg_04
			vol = -9
		}
		{
			lg_ext_crowd_whistle_01
			vol = -4
		}
		{
			lg_ext_crowd_whistle_02
			vol = -4
		}
		{
			lg_ext_crowd_whistle_03
			vol = -4
		}
		{
			lg_ext_crowd_whistle_04
			vol = -4
		}
	]
}
lg_int_crowd_oneshot_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			lg_int_crowd_whistle_01
			vol = -3
		}
		{
			lg_int_crowd_whistle_02
			vol = -3
		}
		{
			lg_int_crowd_whistle_03
			vol = -3
		}
		{
			lg_int_crowd_whistle_04
			vol = -3
		}
	]
}
md_ext_crowd_oneshot_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_ext_crowd_cheer_gr_01
			vol = -8
		}
		{
			md_ext_crowd_cheer_gr_02
			vol = -8
		}
		{
			md_ext_crowd_cheer_gr_03
			vol = -8
		}
		{
			md_ext_crowd_cheer_gr_04
			vol = -8
		}
		{
			md_ext_crowd_cheer_sg_01
			vol = -11
		}
		{
			md_ext_crowd_cheer_sg_02
			vol = -11
		}
		{
			md_ext_crowd_cheer_sg_03
			vol = -11
		}
		{
			md_ext_crowd_cheer_sg_04
			vol = -11
		}
		{
			md_ext_crowd_whistle_01
			vol = -7
		}
		{
			md_ext_crowd_whistle_02
			vol = -7
		}
		{
			md_ext_crowd_whistle_03
			vol = -7
		}
		{
			md_ext_crowd_whistle_04
			vol = -7
		}
	]
}
md_ext_crowd_oneshot_positive_01_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_ext_crowd_cheer_gr_01
			vol = -12
		}
		{
			md_ext_crowd_cheer_gr_02
			vol = -12
		}
		{
			md_ext_crowd_cheer_gr_03
			vol = -12
		}
		{
			md_ext_crowd_cheer_gr_04
			vol = -12
		}
		{
			md_ext_crowd_cheer_sg_01
			vol = -12
		}
		{
			md_ext_crowd_cheer_sg_02
			vol = -12
		}
		{
			md_ext_crowd_cheer_sg_03
			vol = -12
		}
		{
			md_ext_crowd_cheer_sg_04
			vol = -12
		}
		{
			md_ext_crowd_whistle_01
			vol = -12
		}
		{
			md_ext_crowd_whistle_02
			vol = -12
		}
		{
			md_ext_crowd_whistle_03
			vol = -12
		}
		{
			md_ext_crowd_whistle_04
			vol = -12
		}
	]
}
md_int_crowd_oneshot_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_int_crowd_cheer_gr_01
			vol = -8
		}
		{
			md_int_crowd_cheer_gr_02
			vol = -8
		}
		{
			md_int_crowd_cheer_gr_03
			vol = -8
		}
		{
			md_int_crowd_cheer_gr_04
			vol = -8
		}
		{
			md_int_crowd_cheer_sg_01
			vol = -11
		}
		{
			md_int_crowd_cheer_sg_02
			vol = -11
		}
		{
			md_int_crowd_cheer_sg_03
			vol = -11
		}
		{
			md_int_crowd_cheer_sg_04
			vol = -11
		}
		{
			md_int_crowd_whistle_01
			vol = -7
		}
		{
			md_int_crowd_whistle_02
			vol = -7
		}
		{
			md_int_crowd_whistle_03
			vol = -7
		}
		{
			md_int_crowd_whistle_04
			vol = -7
		}
	]
}
sm_ext_crowd_oneshot_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			lg_ext_crowd_whistle_01
			vol = -1
		}
		{
			lg_ext_crowd_whistle_02
			vol = -1
		}
		{
			lg_ext_crowd_whistle_03
			vol = -1
		}
		{
			lg_ext_crowd_whistle_04
			vol = -1
		}
	]
}
sm_int_crowd_oneshot_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_int_crowd_cheer_gr_01
		}
		{
			sm_int_crowd_cheer_gr_02
		}
		{
			sm_int_crowd_cheer_gr_03
		}
		{
			sm_int_crowd_cheer_gr_04
		}
		{
			sm_int_crowd_cheer_sg_01
		}
		{
			sm_int_crowd_cheer_sg_02
		}
		{
			sm_int_crowd_cheer_sg_03
		}
		{
			sm_int_crowd_cheer_sg_04
		}
		{
			sm_int_crowd_whistle_01
		}
		{
			sm_int_crowd_whistle_02
		}
		{
			sm_int_crowd_whistle_03
		}
		{
			sm_int_crowd_whistle_04
		}
	]
}
lg_ext_crowd_oneshot_negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			lg_ext_crowd_boo_gr_01
			vol = -1
		}
		{
			lg_ext_crowd_boo_gr_02
			vol = -1
		}
		{
			lg_ext_crowd_boo_gr_03
			vol = -1
		}
		{
			lg_ext_crowd_boo_gr_04
			vol = -1
		}
		{
			lg_ext_crowd_boo_sg_01
			vol = -1
		}
		{
			lg_ext_crowd_boo_sg_02
			vol = -1
		}
		{
			lg_ext_crowd_boo_sg_03
			vol = -1
		}
		{
			lg_ext_crowd_boo_sg_04
			vol = -1
		}
	]
}
lg_int_crowd_oneshot_negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_crowd_boo_01
			vol = -1
		}
		{
			sm_crowd_boo_02
			vol = -1
		}
		{
			sm_crowd_boo_03
			vol = -1
		}
		{
			sm_crowd_boo_04
			vol = -1
		}
		{
			sm_crowd_boo_05
			vol = -1
		}
		{
			sm_crowd_boo_06
			vol = -1
		}
		{
			sm_crowd_boo_07
			vol = -1
		}
		{
			sm_crowd_boo_08
			vol = -1
		}
		{
			sm_crowd_boo_09
			vol = -1
		}
		{
			sm_crowd_boo_10
			vol = -1
		}
	]
}
md_ext_crowd_oneshot_negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_ext_crowd_boo_gr_01
			vol = 2
		}
		{
			md_ext_crowd_boo_gr_02
			vol = 2
		}
		{
			md_ext_crowd_boo_gr_03
			vol = 2
		}
		{
			md_ext_crowd_boo_gr_04
			vol = 2
		}
		{
			md_ext_crowd_boo_sg_01
			vol = 2
		}
		{
			md_ext_crowd_boo_sg_02
			vol = 2
		}
		{
			md_ext_crowd_boo_sg_03
			vol = 2
		}
		{
			md_ext_crowd_boo_sg_04
			vol = 2
		}
	]
}
md_int_crowd_oneshot_negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_int_crowd_boo_gr_01
			vol = 3
		}
		{
			md_int_crowd_boo_gr_02
			vol = 3
		}
		{
			md_int_crowd_boo_gr_03
			vol = 3
		}
		{
			md_int_crowd_boo_gr_04
			vol = 3
		}
		{
			md_int_crowd_boo_sg_01
			vol = 3
		}
		{
			md_int_crowd_boo_sg_02
			vol = 3
		}
		{
			md_int_crowd_boo_sg_03
			vol = 3
		}
		{
			md_int_crowd_boo_sg_04
			vol = 3
		}
	]
}
sm_ext_crowd_oneshot_negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_crowd_boo_01
			vol = -1
		}
		{
			sm_crowd_boo_02
			vol = -1
		}
		{
			sm_crowd_boo_03
			vol = -1
		}
		{
			sm_crowd_boo_04
			vol = -1
		}
	]
}
sm_int_crowd_oneshot_negative_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_int_crowd_boo_gr_01
		}
		{
			sm_int_crowd_boo_gr_02
		}
		{
			sm_int_crowd_boo_gr_03
		}
		{
			sm_int_crowd_boo_gr_04
		}
		{
			sm_int_crowd_boo_sg_01
		}
		{
			sm_int_crowd_boo_sg_02
		}
		{
			sm_int_crowd_boo_sg_03
		}
		{
			sm_int_crowd_boo_sg_04
		}
	]
}
lg_ext_crowd_positive_swell_layer_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			lg_ext_crowd_whistle_01
			vol = 8
		}
		{
			lg_ext_crowd_whistle_02
			vol = 8
		}
		{
			lg_ext_crowd_whistle_03
			vol = 8
		}
		{
			lg_ext_crowd_whistle_04
			vol = 8
		}
	]
}
jam_rhythm_event_container = {
	template = jam_session_rhythm_guitar_template
	Command = PlaySound
	Randomness = RandomNoRepeatType
}
jam_lead_event_container = {
	Default_Priority = 50
	Default_Buss = jammode_leadguitar
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
}
jam_bass_event_container = {
	Default_Priority = 50
	Default_Buss = jammode_bass
	NoRepeatFor = 0
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = RandomNoRepeatType
}
jamvoxtest_c5_container = {
	Default_Priority = 50
	Default_Buss = jammode_vox
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			c5loop
			num_loops = -1
		}
	]
}
jamvoxtest_c3_container = {
	Default_Priority = 50
	Default_Buss = jammode_vox
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			c3loop
			num_loops = -1
			vol = 12
		}
	]
}
jamvoxtest_c4_container = {
	Default_Priority = 50
	Default_Buss = jammode_vox
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			c4loop
			num_loops = -1
		}
	]
}
gh4_jam_mode_bass_template_template = {
	Default_Priority = 50
	Default_Buss = jammode_bass
	NoRepeatFor = 0
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	Randomness = RandomNoRepeatType
}
jam_fret_noise_bass_short_container = {
	Default_Priority = 25
	Default_Buss = jammode_bass
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			fretnoise_s_01
			vol = 1
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fretnoise_s_02
			vol = 1
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fretnoise_s_03
			vol = 1
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
	]
}
jam_fret_noise_bass_medium_container = {
	Default_Priority = 25
	Default_Buss = jammode_bass
	NoRepeatFor = 0.6
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			fretnoise_m_01
			vol = -7
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fretnoise_m_02
			vol = -7
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fretnoise_m_03
			vol = -7
			Priority = 1
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
	]
}
guitar_affirmation_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.5
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			guitar_select_affirmation_1
		}
	]
}
guitar_lick_crowd_swell_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
}
song_affirmation_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			song_affirmation_01
			vol = -9
		}
		{
			song_affirmation_02
			vol = -9
		}
		{
			song_affirmation_03
			vol = -9
		}
		{
			song_affirmation_04
			vol = -9
		}
		{
			song_affirmation_05
			vol = -9
		}
	]
}
drum_affirmation_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			drum_select_affirmation_01
		}
	]
}
mic_affirmation_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomType
	Sounds = [
		{
			mic_select_affirmation_01
		}
	]
}
vocal_selection_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_select_microphone_2
		}
	]
}
drum_selection_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_select_drums_1
		}
	]
}
guitar_select_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_select_guitar_3
			vol = -7
		}
	]
}
bass_selection_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			bass_select_affirmation_03
			vol = -2
		}
	]
}
bass_affirmation_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			bass_select_affirmation_02
		}
	]
}
sm_int_crowd_clap_to_beat_normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sm_int_crowd_clap_01
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
		{
			sm_int_crowd_clap_02
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
		{
			sm_int_crowd_clap_03
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
		{
			sm_int_crowd_clap_04
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
	]
}
sm_int_crowd_clap_to_beat_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sm_int_crowd_clap_01
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
		{
			sm_int_crowd_clap_02
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
		{
			sm_int_crowd_clap_03
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
		{
			sm_int_crowd_clap_04
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
	]
}
sm_int_crowd_clap_to_beat_right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sm_int_crowd_clap_01
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
			vol = -3
		}
		{
			sm_int_crowd_clap_02
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
			vol = -3
		}
		{
			sm_int_crowd_clap_03
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
			vol = -3
		}
		{
			sm_int_crowd_clap_04
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
			vol = -3
		}
	]
}
sm_int_crowd_clap_to_beat_left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sm_int_crowd_clap_01
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
		{
			sm_int_crowd_clap_02
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
		{
			sm_int_crowd_clap_03
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
		{
			sm_int_crowd_clap_04
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
	]
}
sm_int_crowd_clap_to_beat_right_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sm_int_crowd_clap_01
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			sm_int_crowd_clap_02
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			sm_int_crowd_clap_03
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			sm_int_crowd_clap_04
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
sm_int_crowd_clap_to_beat_left_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sm_int_crowd_clap_01
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			sm_int_crowd_clap_02
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			sm_int_crowd_clap_03
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			sm_int_crowd_clap_04
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
md_int_crowd_clap_to_beat_normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_int_crowd_clap_01
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_02
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_03
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_04
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
md_int_crowd_clap_to_beat_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_int_crowd_clap_01
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			md_int_crowd_clap_02
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			md_int_crowd_clap_03
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			md_int_crowd_clap_04
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
	]
}
md_int_crowd_clap_to_beat_left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_int_crowd_clap_01
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			md_int_crowd_clap_02
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			md_int_crowd_clap_03
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			md_int_crowd_clap_04
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
md_int_crowd_clap_to_beat_right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_int_crowd_clap_01
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_02
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_03
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_04
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
md_int_crowd_clap_to_beat_left_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_int_crowd_clap_01
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			md_int_crowd_clap_02
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			md_int_crowd_clap_03
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			md_int_crowd_clap_04
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
md_int_crowd_clap_to_beat_right_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_int_crowd_clap_01
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_02
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_03
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_04
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
lg_ext_crowd_clap_to_beat_normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			lg_ext_crowd_clap_01
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_02
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_03
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_04
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
lg_ext_crowd_clap_to_beat_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			lg_ext_crowd_clap_01
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_02
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_03
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_04
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
	]
}
lg_ext_crowd_clap_to_beat_right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			lg_ext_crowd_clap_01
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_02
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_03
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_04
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
lg_ext_crowd_clap_to_beat_left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			lg_ext_crowd_clap_01
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_02
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_03
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_04
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
lg_ext_crowd_clap_to_beat_right_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			lg_ext_crowd_clap_01
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_02
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_03
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_04
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
lg_ext_crowd_clap_to_beat_left_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			lg_ext_crowd_clap_01
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_02
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_03
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_04
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
	]
}
md_ext_crowd_clap_to_beat_normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_ext_crowd_clap_01
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_02
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_03
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_04
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
md_ext_crowd_clap_to_beat_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_ext_crowd_clap_01
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
		{
			md_ext_crowd_clap_02
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
		{
			md_ext_crowd_clap_03
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
		{
			md_ext_crowd_clap_04
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
	]
}
md_ext_crowd_clap_to_beat_left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_ext_crowd_clap_01
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
		{
			md_ext_crowd_clap_02
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
		{
			md_ext_crowd_clap_03
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
		{
			md_ext_crowd_clap_04
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
	]
}
md_ext_crowd_clap_to_beat_right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_ext_crowd_clap_01
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_02
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_03
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_04
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
md_ext_crowd_clap_to_beat_left_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_ext_crowd_clap_01
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
		{
			md_ext_crowd_clap_02
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
		{
			md_ext_crowd_clap_03
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
		{
			md_ext_crowd_clap_04
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
	]
}
md_ext_crowd_clap_to_beat_right_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_ext_crowd_clap_01
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_02
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_03
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_04
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
menu_scroll_end_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_select_negative
			pitch = 0
			vol = -4
		}
	]
}
audio_options_fader_end_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_select_negative
			pitch = 0
			vol = 7
		}
	]
}
jam_fret_noise_lead_container = {
	Default_Priority = 1
	Default_Buss = jammode_leadguitar
	NoRepeatFor = 0.75
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			fret_noise_07
			vol = -6
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_08
			vol = -6
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_09
			vol = -6
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_10
			vol = -6
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_11
			vol = -6
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
	]
}
you_rock_explosion_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			you_rock_explode
		}
	]
}
starttesttones_sine_container = {
	Default_Priority = 75
	Default_Buss = Test_Tones
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
}
starttesttones_pink_container = {
	Default_Priority = 75
	Default_Buss = Test_Tones
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
}
ui_fader_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.0
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_fader_scroll
			vol = 4
		}
	]
}
ui_knob_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.0
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_options_sound_eqknob_move
		}
	]
}
dolby_off_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_options_sound_dolbydigitaldisable
			vol = 1
		}
	]
}
dolby_on_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_dolbydigitalenable_surround_l
			vol = 4
			pan1x = -1.0
			pan1y = 1.0
		}
		{
			menu_dolbydigitalenable_surround_c
			vol = 4
			pan1x = 0.0
			pan1y = 1.0
		}
		{
			menu_dolbydigitalenable_surround_r
			vol = 4
			pan1x = 1.0
			pan1y = 1.0
		}
		{
			menu_dolbydigitalenable_surround_ls
			vol = 4
			pan1x = -1.0
			pan1y = -1.0
		}
		{
			menu_dolbydigitalenable_surround_rs
			vol = 4
			pan1x = 1.0
			pan1y = -1.0
		}
		{
			menu_dolbydigitalenable_surround_lf
			vol = 4
			lfeonly = true
			lfe_vol = -15
		}
	]
}
sound_options_select_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_select
			vol = 4
		}
	]
}
sound_options_back_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_back
			vol = 1
		}
	]
}
gigboard_zoom_left_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_gigboard_camerapan_left
			vol = -12.5
		}
	]
}
gigboard_zoom_right_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_gigboard_camerapan_left
			vol = -12.5
		}
	]
}
colorwheel_rotate_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_rotate
			vol = 2
		}
	]
}
colorwheel_deselect_piepiece_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_deselect_piepiece
		}
	]
}
colorwheel_highlight_1_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_1
			vol = -7
		}
	]
}
colorwheel_selectcolor_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_selectcolor
		}
	]
}
colorwheel_gradientselect_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_gradientselect
		}
	]
}
colorwheel_selectpie_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_selectpie
			vol = -4
		}
	]
}
colorwheel_selectshade_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_selectshade
		}
	]
}
enter_band_name_scroll_down_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_entername_scroll_3
			pitch = -2
			vol = -11
		}
	]
}
enter_band_name_scroll_up_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_entername_scroll_3
			pitch = -2
			vol = -11
		}
	]
}
enter_band_name_select_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_entername_select
			pitch = 0
			vol = -5
		}
	]
}
recording_start_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_dpad_recordingstart
		}
	]
}
recording_stop_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_dpad_recordingstop
			vol = -5
		}
	]
}
dpad_stop_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_dpad_stop
			vol = -5
		}
	]
}
dpad_play_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_dpad_play
		}
	]
}
ghmix_select_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_dpad_play
			vol = 5
		}
	]
}
ghmix_back_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_dpad_stop
			vol = -5
		}
	]
}
ghmix_scroll_up_down_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_options_sound_up_down
			vol = 6
		}
	]
}
line6_scroll_up_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_options_sound_up_down
			vol = 6
		}
	]
}
line6_scroll_down_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_options_sound_up_down
			vol = 6
		}
	]
}
online_instrument_change_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_dpad_play
			vol = 5
		}
	]
}
scale_scroll_up_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_dpad_play
			vol = 5
			pitch = 1
		}
	]
}
scale_scroll_down_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_dpad_play
			vol = 5
		}
	]
}
audio_options_up_down_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_options_sound_up_down
			vol = 6
		}
	]
}
audio_options_menu_guitar_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_guitar
			vol = -12
		}
	]
}
audio_options_menu_bass_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_bass
			vol = -12
		}
	]
}
audio_options_menu_drums_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_drum
			vol = -12
		}
	]
}
audio_options_menu_vocals_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_vocals
			vol = -12
		}
	]
}
audio_options_menu_sfx_container = {
	Default_Priority = 50
	Default_Buss = options_sfx
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			bad_note1
			vol = -8.63
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
		{
			bad_note2
			vol = -7.02
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
		{
			bad_note3
			vol = -8.26
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
		{
			bad_note4
			vol = -8.21
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
		{
			bad_note6
			vol = -8.26
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
	]
}
audio_options_menu_microphone_container = {
	Default_Priority = 50
	Default_Buss = mic_options_sfx_buss
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_mic
			vol = -10
			pitch = -0.95
		}
	]
}
audio_options_menu_crowd_container = {
	Default_Priority = 50
	Default_Buss = options_crowd
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_sfx
			vol = -4
		}
	]
}
ghtunes_ui_scroll_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghmix2_scroll_sound
		}
	]
}
ghtunes_ui_scroll_pan_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
}
ghtunes_ui_select_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghmix2_select_sound
		}
	]
}
ghtunes_ui_back_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghmix2_back_sound
		}
	]
}
pause_menu_enter_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_pausemenu_in
		}
	]
}
enter_band_name_finish_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_entername_finish_01
			vol = -10.0
		}
	]
}
ui_unlock_item_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			song_affirmation_01
			vol = -9
		}
		{
			song_affirmation_02
			vol = -9
		}
		{
			song_affirmation_03
			vol = -9
		}
		{
			song_affirmation_04
			vol = -9
		}
		{
			song_affirmation_05
			vol = -9
		}
	]
}
enter_band_name_back_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_entername_back
			vol = -7
		}
	]
}
band_mode_career_ready_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_entername_finish_01
			vol = -2
		}
	]
}
gh4_gigcomplete_sponsor_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gig_complete_sponsor
			vol = -1
		}
	]
}
pause_menu_exit_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_pausemenu_out
		}
	]
}
colorwheel_highlight_4_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_4
			vol = -5
		}
	]
}
colorwheel_highlight_2_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_2
			vol = -5
		}
	]
}
colorwheel_highlight_3_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_3
			vol = -5
		}
	]
}
colorwheel_highlight_5_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_5
			vol = -5
		}
	]
}
menu_recording_pause_panel_in_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jam_pause_panel_in
			vol = -14
		}
	]
}
jam_advanced_record_pause_panel_out_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jam_advanced_pause_out
			pitch = 4
			vol = -2
		}
	]
}
jam_advanced_record_pause_panel_in_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jam_advanced_pause_in
			vol = 6
			pitch = 2
		}
	]
}
online_panel_out_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jam_advanced_pause_out
			pitch = 4
			vol = -2
		}
	]
}
online_panel_in_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jam_advanced_pause_in
			vol = 2
			pitch = 2
		}
	]
}
online_main_panel_in_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jam_pause_panel_in
			vol = -14
		}
	]
}
menu_recording_pause_panel_out_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jam_pause_panel_out
			vol = -14
		}
	]
}
oneshotsbetweensongs_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
}
surgebetweensongs_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
}
large_ext_crowd_song_transition_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_ext_crowd_song_transition
		}
	]
}
md_int_crowd_song_transition_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_int_crowd_song_transition
		}
	]
}
ui_sfx_scroll_up_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_scroll_up
			vol = -4
			pitch = 0
		}
	]
}
ui_sfx_scroll_down_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_scroll_down
			vol = -4
			pitch = 0
		}
	]
}
ui_sfx_negative_select_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_select_negative
			pitch = 0
			vol = -4
		}
	]
}
band_lobby_negative_select_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_select_negative
			pitch = 0
			vol = -1
		}
	]
}
enter_band_name_caps_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_entername_caps
			vol = -4
		}
	]
}
song_wizard_on_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_jammode_songwizard_on
			vol = -1
		}
	]
}
song_wizard_off_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_jammode_songwizard_off
			vol = -1
		}
	]
}
jam_mode_fxhud_off_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_jammode_fxhud_off
			vol = -2
		}
	]
}
jam_mode_fxhud_on_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_jammode_fxhud_on
			vol = -10
		}
	]
}
menu_audio_options_reset_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			soundoptions_menu_reset
			vol = -2
		}
	]
}
menu_cheat_enter_red_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_cheat_red
			vol = -2
		}
	]
}
menu_cheat_enter_green_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_cheat_green
			vol = -2
		}
	]
}
menu_cheat_enter_blue_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_cheat_blue
			vol = -2
		}
	]
}
menu_cheat_enter_yellow_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_cheat_yellow
			vol = -2
		}
	]
}
large_guitar_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			guitar_smash_large_gh4_01
			vol = 3
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
medium_guitar_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			guitar_smash_medium_gh4_02
			vol = 3
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
mic_feedback_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			mic_feedback_gh4_01
			vol = 4
		}
	]
}
small_guitar_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			guitar_smash_small_gh4_02
			vol = 3
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
mic_grab_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			mic_grab_gh4_04
			vol = 11
		}
	]
}
drummer_sticks_throw_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			drummer_stickthrow_02
			vol = 4
		}
	]
}
drummer_tom_hit_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			drummer_tom_01
		}
	]
}
drummer_snare_hit_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			drummer_snare_01
		}
	]
}
large_bass_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			bass_smash_large_gh4_01
			vol = 5
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
medium_bass_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			bass_smash_medium_gh4_01
			vol = 5
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
small_bass_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			bass_smash_small_gh4_01
			vol = 5
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
mic_hit_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			mic_grab_gh4_02
			vol = 15
		}
	]
}
select_band_leader_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			band_leader_affirmation
			vol = -1
		}
	]
}
save_confirmed_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			band_leader_affirmation
			vol = -4
		}
	]
}
gigboard_select_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Sound_05
			vol = -3
		}
	]
}
gigboard_select_back_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			UI_Sound_09
			vol = -5.5
		}
	]
}
quickplay_remove_song_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_quickplay_removesong
			pitch = 0
			vol = 1
		}
	]
}
quickplay_select_song_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_quickplay_selectsong
			pitch = 2
			vol = 12
		}
	]
}
quickplay_remove_all_songs_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_quickplay_removeallsongs
			pitch = 0
			vol = -8
		}
	]
}
front_end_main_menu_intro_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_main_intro
			vol = -2
		}
	]
}
front_end_main_menu_intro_rears_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_main_intro_rears
			vol = -2
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
menu_song_complete_out_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			songcomplete_out
			vol = -10
		}
	]
}
menu_song_complete_in_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			songcomplete_in
			vol = -9
		}
	]
}
unlock_new_item_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gigcomplete_unlock_new_item
			vol = -5
		}
	]
}
menu_band_ready_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			band_mode_ready
			vol = -11
		}
	]
}
ghtunes_on_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_jammode_songwizard_on
			vol = -1
			pitch = 2
		}
	]
}
ghtunes_off_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_jammode_songwizard_off
			vol = -1
			pitch = 4
		}
	]
}
vocal_highway_appear_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			highway_vocal_remix_nofeedback
			vol = -6
		}
	]
}
character_reset_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_restore_defaults
			vol = 5
		}
	]
}
ghtunes_warning_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghtunes_scroll_warning
		}
	]
}
md_ext_encore_crowd_container = {
	Default_Priority = 50
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_encore_crowd
			vol = -8
		}
	]
}
lg_ext_encore_crowd_container = {
	Default_Priority = 50
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_ext_encore_crowd
			vol = -8
		}
	]
}
md_int_encore_crowd_container = {
	Default_Priority = 50
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_int_encore_crowd
			vol = -8
		}
	]
}
sm_int_encore_crowd_container = {
	Default_Priority = 50
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_int_encore_crowd
			vol = -8
		}
	]
}
gigboard_scroll_up_down_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ui_gigboard_scroll
			vol = -9
		}
	]
}
gigboard_gig_unlock_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gig_unlock
			vol = -3
		}
	]
}
unlock_item_text_appear_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gigcomplete_unlock_item_text_appear
			vol = -2
		}
	]
}
gigcomplete_magazine_out_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gig_complete_magazine_out
			vol = 5
		}
	]
}
loading_crowd_long_burst_container = {
	Default_Priority = 100
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_crowd_swell_lg
			vol = -6
		}
	]
}
loading_crowd_medium_burst_container = {
	Default_Priority = 100
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_crowd_swell_md
			vol = -6
		}
	]
}
loading_crowd_short_burst_container = {
	Default_Priority = 100
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_crowd_swell_sh
			vol = -6
		}
	]
}
fireworks_last_venue_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			last_venue_fireworks
			vol = -2
		}
	]
}
countdown_timer_beep_sfx_container = {
	Default_Priority = 51
	Default_Buss = Front_End
	NoRepeatFor = 0.0001
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gh_countdown_timer_sfx
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
	Randomness = None
}
meter_fade_in_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			meter_fade_in
		}
	]
}
quick_play_clear_one_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			quick_play_clear_one
		}
	]
}
quick_play_clear_all_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			quick_play_clear_all
		}
	]
}
quick_play_choose_song_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			quick_play_choose_song
		}
	]
}
online_ui_team_result_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			online_ui_team_result_01
		}
		{
			online_ui_team_result_02
		}
		{
			online_ui_team_result_03
		}
		{
			online_ui_team_result_04
		}
		{
			online_ui_team_result_05
		}
	]
}
menu_calibration_exit_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_calibration_exit
		}
	]
}
menu_calibration_enter_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_calibration_enter
		}
	]
}
menu_character_restore_defaults_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_character_restore_defaults
		}
	]
}
menu_cheat_incorrect_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_cheat_incorrect
		}
	]
}
menu_cheat_correct_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_cheat_correct
		}
	]
}
character_edit_transition_out_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			character_edit_transition_out
		}
	]
}
character_edit_transition_in_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			character_edit_transition_in
		}
	]
}
menu_character_gradient_slider_move_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_character_gradient_slider_move
		}
	]
}
menu_zoomin_text_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_zoomin_text
		}
	]
}
menu_zoomout_text_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_zoomout_text
		}
	]
}
ghtunes_menu_down_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghtunes_menu_down
		}
	]
}
ghtunes_menu_up_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghtunes_menu_up
		}
	]
}
music_store_buy_song_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			music_store_buy_song
		}
	]
}
leaderboard_song_to_difficulty_transition_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			leaderboard_song_to_difficulty_transition
		}
	]
}
ghmix2_stopsong_sound_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghmix2_stopsong_sound
		}
	]
}
ghmix2_scroll_sound_01_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghmix2_scroll_sound
		}
	]
}
ghmix2_select_sound_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghmix2_select_sound
		}
	]
}
ghmix2_back_sound_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghmix2_back_sound
		}
	]
}
ghmix2_startsong_sound_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghmix2_startsong_sound
		}
	]
}
ghmix2_scroll_sound_02_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghmix2_scroll_sound_02
		}
	]
}
outro_three_stars_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			outro_three_stars
			vol = -6
		}
	]
}
outro_two_stars_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			outro_two_stars
			vol = -6
		}
	]
}
playlist_scroll_sound_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			playlist_scroll
			vol = -8
		}
	]
}
songlist_scroll_sound_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_scroll_up
			vol = -8
			pitch = 2
		}
	]
}
songlist_to_playlist_switch_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			setlist_to_playlist_select
			vol = -2
		}
	]
}
outro_five_stars_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			outro_five_stars
			vol = -6
		}
	]
}
outro_four_stars_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			outro_four_stars
			vol = -6
		}
	]
}
outro_one_star_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			outro_one_star
			vol = -6
		}
	]
}
sort_songlist_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			songlist_sort_songs
			vol = 6
			pitch = 0
		}
	]
}
star_counter_01_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 15
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_counter_01
			vol = 7
		}
	]
}
star_counter_02_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_counter_02
			vol = -6
		}
	]
}
shredfest_momentum_diff_up_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			shredfest_momentum_difficulty_up
			vol = -3
		}
	]
}
shredfest_momentum_diff_down_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			shredfest_momentum_difficulty_down
			vol = -6
		}
	]
}
audio_options_scroll_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_scroll
			vol = -2
		}
	]
}
shredfest_play_suddendeath_dropped_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			shredfest_player_dropout
			vol = -12.0
		}
	]
}
point_awarded_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			point_awarded
			vol = -6.0
		}
	]
}
band_lobby_leader_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			band_leader_sfx
			vol = -4
		}
	]
}
online_team_switch_affirmation_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			band_leader_sfx
			vol = -4
		}
	]
}
band_lobby_complete_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			band_complete_sfx
			vol = -8.5
		}
	]
}
freeplay_enter_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			freeplay_enter_sfx
		}
	]
}
car_zoom_in_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			car_zoom_in
			vol = -3
		}
	]
}
outro_six_stars_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			outro_six_stars
		}
	]
}
car_zoom_out_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			car_zoom_out
			vol = -5
		}
	]
}
end_of_song_camera_movement_sound_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			camera_whoosh_1
			vol = 0
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			camera_whoosh_2
			vol = 0
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
	]
}
jm_menu_scroll_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			jm_menu_scroll_b2
			vol = -3
			attack_length = 0.0
			attack_function = linear
			decay_length = 0.0
			release_length = 0.3
			decay_function = linear
			release_function = linear
		}
		{
			jm_menu_scroll_c3
			vol = -3
			attack_length = 0.0
			attack_function = linear
			decay_length = 0.0
			release_length = 0.3
			decay_function = linear
			release_function = linear
		}
		{
			jm_menu_scroll_e3
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
jm_menu_back_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jm_menu_back
			vol = -3
		}
	]
}
jm_menu_check_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jm_menu_check
			vol = -3
		}
	]
}
jm_menu_uncheck_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jm_menu_uncheck
			vol = -3
		}
	]
}
jm_menu_select_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jm_menu_select
			vol = -5
		}
	]
}
jm_menu_finalselect_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jm_menu_finalselect
			vol = -3
		}
	]
}
jm_menu_loop_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jm_menu_loop_01
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
			jm_menu_loop_02
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
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			GH3_Sudden_Death
			vol = -6.0
		}
	]
}
surge_during_stats_screen_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
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
car_widget_select_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			car_widget_select
			vol = 6
			pitch = 0
		}
	]
}
car_widget_deselect_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			car_widget_deselect
			vol = 3
			pitch = 1
		}
	]
}
car_widget_scroll_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			car_widget_scroll
		}
	]
}
endofsong_camera_cheer_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			new_crowd_cheer_01
			vol = -5
		}
		{
			new_crowd_cheer_02
			vol = -5
		}
		{
			new_crowd_cheer_03
			vol = -5
		}
		{
			new_crowd_cheer_04
			vol = -5
		}
		{
			new_crowd_cheer_05
			vol = -5
		}
	]
}
pyro_container = {
	Default_Priority = 50
	Default_Buss = pyro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			pyro_1
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-13
					-10
				]
			}
		}
		{
			pyro_2
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-13
					-10
				]
			}
		}
		{
			pyro_3
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-13
					-10
				]
			}
		}
	]
}
you_rock_back_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			you_rock_back
			vol = -6
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
you_rock_lfe_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			you_rock_lfe
			lfeonly = true
			lfe_vol = -6
		}
	]
}
you_rock_front_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			you_rock_front
			vol = -6
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
	]
}
endofsong_camera_cheer_softer_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			new_crowd_cheer_01
			vol = -8
		}
		{
			new_crowd_cheer_02
			vol = -8
		}
		{
			new_crowd_cheer_03
			vol = -8
		}
		{
			new_crowd_cheer_04
			vol = -8
		}
		{
			new_crowd_cheer_05
			vol = -8
		}
	]
}
gig_challenge_complete_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gig_challenge
			vol = -17
		}
	]
}
band_moment_sfx_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			band_moments
			vol = -9
		}
	]
}
gameplay_vote_heaven_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_gameplay_vote_heaven
			vol = -5
			pitch = 0
		}
	]
}
gameplay_vote_hell_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_gameplay_vote_hell
			vol = -8
			pitch = 0
		}
	]
}
gameplay_spin_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_gameplay_spin
			vol = -13
		}
	]
}
gameplay_spin_winner_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_gameplay_spin
			vol = -15
			pitch = 2
		}
	]
}
vote_tie_crowd_swell_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vote_affimation_tie_swell
			vol = -4
		}
	]
}
vote_hell_crowd_swell_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vote_affimation_hell_swell
			vol = -4
		}
	]
}
vote_heaven_crowd_swell_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vote_affimation_heaven_swell
		}
	]
}
gameplay_vote_countdown_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_gameplay_vote_countdown_01
			vol = -3
			pitch = 0
		}
	]
}
endofsong_camera_cheer_quiet_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			new_crowd_cheer_01
			vol = -22
		}
		{
			new_crowd_cheer_02
			vol = -22
		}
		{
			new_crowd_cheer_03
			vol = -22
		}
		{
			new_crowd_cheer_04
			vol = -22
		}
		{
			new_crowd_cheer_05
			vol = -22
		}
	]
}
endofsong_camera_cheer_quieter_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 4
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			new_crowd_cheer_01
			vol = -24
		}
		{
			new_crowd_cheer_02
			vol = -24
		}
		{
			new_crowd_cheer_03
			vol = -24
		}
		{
			new_crowd_cheer_04
			vol = -24
		}
		{
			new_crowd_cheer_05
			vol = -24
		}
	]
}
beginning_crowd_swell_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			beginning_crowd_swell
			vol = -15
		}
	]
}
surge_from_main_to_freeplay_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			crowd_from_main_to_freeplay
			vol = -24
		}
	]
}
bandlineup_scroll_event_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			PlaySound
			lobbyscroll01
			vol = -5
			pitch = 1
		}
	]
}
venue_unlock_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			unlock_venue
			vol = 10
		}
	]
}
online_team_switch_resend_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			team_switch_resend
		}
	]
}
online_team_switch_request_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			team_switch_request
		}
	]
}
band_moment_back_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			band_moments_back
			vol = -9
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
roadie_battle_roadie1_laugh_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_mockinglaughter
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_laugh2_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_approvingnoise_a
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_laugh3_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_amusedlaughter_a
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_laugh4_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_amusedlaughter
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_cough_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_coughshort_a
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_win_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_approvingnoise_a
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_win_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_woohoo
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_aww_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_aww
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_cough_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_coughshort
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_laugh_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_excitedstrong
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_laugh2_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_excitedexcessive
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_laugh3_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_successstrong
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_laugh4_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_successexcessive
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_pant_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_pantingshort_a
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_pant_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_pantingshort
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_sabotaged1_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_unsuccessfulmedium
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_sabotaged2_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_unsuccessfulmedium_a
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_sabotaged3_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_unsuccessfulstrong
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_sabotaged4_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_unsuccessfulstrong_a
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_sabotaged1_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_worriedyelp
			0
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_sabotaged2_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_cryingshort
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_sabotaged3_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_frustratedstrong
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_choosesides_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_yeah
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_choosesides2_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_yeah_a
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_choosesides_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_ha
			vol = -8
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_choosesides2_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_aha
			vol = -8
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_repairs1_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_yeah
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_repairs2_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_yeah_a
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_repairs1_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_aha
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie2_repairs2_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_ha
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_pyrointro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_pyro_intro
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
roadie_battle_pyrointror_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_pyro_intro
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_roadie1_pyrointro_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_airplanecrash_a
		}
	]
}
roadie_battle_roadie2_pyrointro_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_explosion_a
		}
	]
}
roadie_battle_pyrooutro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_pyro_outro
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_pyrooutror_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_pyro_outro
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_hyperspeed_start_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_hyperspeed_start
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
roadie_battle_hyperspeedr_start_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_hyperspeed_start
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_hyperspeedr_end_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_hyperspeed_end
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_hyperspeed_end_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_hyperspeed_end
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
roadie_battle_lefty_sign_p1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_lefty_sign
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_lefty_sign_p2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_lefty_sign
			vol_percent = 70
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_speaker_spits_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_speaker_spits
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
roadie_battle_speaker_spitsr_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_speaker_spits
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_speaker_intro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_speaker_intro
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
roadie_battle_speaker_outro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_speaker_outro
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
roadie_battle_speakerr_intro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_speaker_intro
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_speakerr_outro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_speaker_outro
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_amp_intro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_amp_intro
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
roadie_battle_amp_outro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_amp_outro
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
roadie_battle_ampr_intro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_amp_intro
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_ampr_outro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_amp_outro
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_mine_explode_p1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_speaker_note_explode
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_mine_explode_p2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_speaker_note_explode
			vol_percent = 70
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_fretboard_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p1_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice2_fretboard
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_fretboard2_container = {
	Default_Priority = 50
	Default_Buss = roadie_battle_p2_mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			vv_voice3_fretboard_c
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_repair_sfx_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_repair
		}
	]
}
roadie_battle_sabotage_sfx_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_sabotage
		}
	]
}
roadie_battle_lefty_intro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_lefty_intro
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
roadie_battle_leftyr_intro_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_lefty_intro
			vol_percent = 70
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
roadie_battle_lefty_tornadol_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_lefty_tornado
			vol_percent = 70
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
roadie_battle_lefty_tornador_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			rb_lefty_tornado
			vol_percent = 70
			pan1x = 0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
freestyle_applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Applause
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_crowd_positive_loop_ft
			num_loops = -1
			vol_percent = 100
		}
	]
}
freestyle_ambient_crowd_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Applause
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_ext_crowd_neutral_loop_ft
			num_loops = -1
			vol_percent = 60
		}
	]
}
freestyle_countdown_1_1_container = {
	Default_Priority = 80
	Default_Buss = Front_End
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			countdown_1_1
			vol_percent = 100
		}
	]
}
freestyle_countdown_1_2_container = {
	Default_Priority = 80
	Default_Buss = Front_End
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			countdown_1_2
			vol_percent = 100
		}
	]
}
freestyle_countdown_2_1_container = {
	Default_Priority = 80
	Default_Buss = Front_End
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			countdown_2_1
			vol_percent = 100
		}
	]
}
freestyle_countdown_2_2_container = {
	Default_Priority = 80
	Default_Buss = Front_End
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			countdown_2_2
			vol_percent = 100
		}
	]
}
freestyle_countdown_3_container = {
	Default_Priority = 80
	Default_Buss = Front_End
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			countdown_3
			vol_percent = 100
		}
	]
}
freestyle_countdown_4_container = {
	Default_Priority = 80
	Default_Buss = Front_End
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			countdown_4
			vol_percent = 100
		}
	]
}
achievement_unlock_sfx_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			achievementunlock
		}
	]
}
audio_options_menu_enter_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_enter
		}
	]
}
audio_options_menu_exit_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			audio_options_exit
		}
	]
}
band_drums_choose_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			drum_choose
		}
	]
}
band_bass_choose_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			bass_choose
		}
	]
}
band_guitar_choose_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			guitar_choose
		}
	]
}
band_mic_choose_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			mic_choose
		}
	]
}
Battlemode_HeartBeat_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
calibration_menu_exit_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			calibration_exit
		}
	]
}
calibration_menu_enter_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			calibration_enter
		}
	]
}
calibration_menu_whammy_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			calibration_whammy
		}
	]
}
camera_transition_difficulty_to_vip_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			transition_difficulty_to_vip
		}
	]
}
colorwheel_highlight_up_down_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_1
			pitch = -2
		}
	]
}
crowd_reaction_bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 15
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			crowd_reaction_bad
			vol = 0.5
		}
	]
}
customize_character_out_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			edit_character_out
		}
	]
}
customize_character_in_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			edit_character_in
		}
	]
}
do_or_die_sfx_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			doordie
			vol = -3
		}
	]
}
First_Player_Bad_Note_Guitar_container = {
	Default_Priority = 90
	Default_Buss = wrong_notes_guitar
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = RandomNoRepeatType
	slot = 2
	Sounds = [
		{
			bad_note1
			vol = -5.63
			pan1x = -0.76199996
			pan1y = 0.6470001
			pan2x = -0.44799998
			pan2y = 0.894
		}
		{
			bad_note2
			vol = -4.02
			pitch = -0.89
			pan1x = -0.76199996
			pan1y = 0.6470001
			pan2x = -0.44799998
			pan2y = 0.894
		}
		{
			bad_note3
			vol = -5.2599998
			pan1x = -0.76199996
			pan1y = 0.6470001
			pan2x = -0.44799998
			pan2y = 0.894
		}
		{
			bad_note4
			vol = -5.21
			pitch = 0.84000003
			pan1x = -0.76199996
			pan1y = 0.6470001
			pan2x = -0.44799998
			pan2y = 0.894
		}
		{
			bad_note6
			vol = -5.2599998
			pan1x = -0.76199996
			pan1y = 0.6470001
			pan2x = -0.44799998
			pan2y = 0.894
		}
	]
}
First_Player_Bad_Note_Bass_container = {
	Default_Priority = 90
	Default_Buss = wrong_notes_bass
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = RandomNoRepeatType
	slot = 2
	Sounds = [
		{
			bad_note_bass1
			vol = -2
			pan1x = -0.76199996
			pan1y = 0.6470001
			pan2x = -0.44799998
			pan2y = 0.894
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			bad_note_bass2
			vol = -2
			pan1x = -0.76199996
			pan1y = 0.6470001
			pan2x = -0.44799998
			pan2y = 0.894
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			bad_note_bass4
			vol = -2
			pan1x = -0.76199996
			pan1y = 0.6470001
			pan2x = -0.44799998
			pan2y = 0.894
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			bad_note_bass6
			vol = -2
			pan1x = -0.76199996
			pan1y = 0.6470001
			pan2x = -0.44799998
			pan2y = 0.894
			vol = 0
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
	]
}
gh4_gigcomplete_transitiontoresults_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gig_complete_to_results
		}
	]
}
gh4_gigcomplete_cashaward_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gig_complete_cash_award
		}
	]
}
gh4_gigcomplete_unlock_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gig_complete_unlock
		}
	]
}
gh4_gigcomplete_magunfold_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gig_complete_mag_unfold
		}
	]
}
gh4_gigcomplete_highlight_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gig_complete_highlight
		}
	]
}
GH_SFX_BattleMode_Lightning_Player1_container = {
	Default_Priority = 90
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
GH_SFX_BattleMode_DiffUp_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			GH3_Battle_DifficultyRampUp
			vol = -7.9300003
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_DoubleNoteAttack
			vol = -3.09
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack
			vol = -7.9300003
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			GH3_Battle_DifficultyRampUp
			vol = -7.9300003
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_DoubleNoteAttack
			vol = -3.09
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack
			vol = -7.9300003
			pan1x = 1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.71
		}
	]
}
GH_SFX_BattleMode_Attack_Over_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
GH_SFX_BattleMode_WhammyAttack_Received_P1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack_Received
			vol = -9.09
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack_Received
			vol = -9.09
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
gh_sfx_battlemode_mine_explode_p2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			battle_mineattack_explode
			vol = -6
			pan1x = 1
			pan1y = 0.44339618
			pan2x = 0.5424528
			pan2y = 1
		}
	]
}
gh_sfx_battlemode_mine_explode_p1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 20
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			battle_mineattack_explode
			vol = -6
			pan1x = -1
			pan1y = 0.5707547
			pan2x = -0.5235849
			pan2y = 1
		}
	]
}
gh_sfx_battlemode_mine_release_p1_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			battle_mineattack_release
			pan1x = -1
			pan1y = 0.68867916
			pan2x = -0.6179245
			pan2y = 1
			panremovecenter = true
		}
	]
}
gh_sfx_battlemode_mine_release_p2_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			battle_mineattack_release
			pan1x = 1
			pan1y = 0.5707547
			pan2x = 0.5707547
			pan2y = 1
			panremovecenter = true
		}
	]
}
gig_board_zoom_out_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_zoomout_career
			vol = -1
		}
	]
}
gig_board_zoom_in_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_zoomin_career
			vol = -15
		}
	]
}
guitarcenter_guitar_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			guitarcenter_randomnoodling_guitar_1
			vol = -3
			pan1x = -0.7122641
			pan1y = 1
			pan2x = -0.35377362
			pan2y = 1
		}
		{
			guitarcenter_randomnoodling_guitar_2
			vol = -3
			pan1x = 0.4009434
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
		{
			guitarcenter_randomnoodling_guitar_3
			vol = -3
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = -0.2830189
		}
		{
			guitarcenter_randomnoodling_guitar_4
			vol = -3
			pan1x = 0.30660385
			pan1y = 0.68396235
			pan2x = 1
			pan2y = -0.754717
		}
	]
}
guitarcenter_drums_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			guitarcenter_randomnoodling_drums_1
			vol = -3
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = -1
		}
		{
			guitarcenter_randomnoodling_drums_2
			vol = -3
			pan1x = -1
			pan1y = 1
			pan2x = -0.35377362
			pan2y = 1
		}
		{
			guitarcenter_randomnoodling_drums_3
			vol = -3
			pan1x = 0.18396232
			pan1y = 1
			pan2x = 0.60849065
			pan2y = 1
		}
		{
			guitarcenter_randomnoodling_drums_4
			vol = -3
			pan1x = 0.36320752
			pan1y = 1
			pan2x = 1
			pan2y = 0.504717
		}
		{
			guitarcenter_randomnoodling_drums_5
			vol = -3
			pan1x = -0.5141509
			pan1y = 1
			pan2x = -1
			pan2y = 0.16037741
		}
	]
}
guitarcenter_mic_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			guitarcenter_randomnoodling_mic_1
			vol = -3
			pan1x = 0.87264144
			pan1y = 1
			pan2x = 0.9811321
			pan2y = 0.28773582
		}
		{
			guitarcenter_randomnoodling_mic_3
			vol = -3
			pan1x = 0.3443396
			pan1y = 1
			pan2x = 0.990566
			pan2y = 1
		}
		{
			guitarcenter_randomnoodling_mic_5
			vol = -3
			pan1x = -0.7641509
			pan1y = 1
			pan2x = 0.25471702
			pan2y = 1
		}
		{
			guitarcenter_randomnoodling_mic_6
			vol = -3
			pan1x = 1
			pan1y = 0.22641511
			pan2x = 1
			pan2y = -0.7264151
		}
	]
}
jammode_effects_ui_hud_offscreen_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_effects_hud_offscreen
		}
	]
}
jammode_effects_ui_hud_zoom_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			jammode_effects_hud_zoom
		}
	]
}
menu_award_medium_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			award_medium
		}
	]
}
menu_award_small_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			award_small
		}
	]
}
menu_text_zoom_in_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			text_zoom_in
		}
	]
}
menu_text_zoom_out_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			text_zoom_out
		}
	]
}
ozzy_bucket_water_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ozzy_splash
			vol = -10.5
		}
	]
}
ozzy_bucket_throw_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ozzy_bucket
			vol = -10.5
		}
	]
}
Second_Player_Bad_Note_Guitar_container = {
	Default_Priority = 90
	Default_Buss = wrong_notes_guitar
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = RandomNoRepeatType
	slot = 2
	Sounds = [
		{
			bad_note1
			vol = -5.63
			pan1x = 0.47
			pan1y = 0.883
			pan2x = 0.728
			pan2y = 0.685
		}
		{
			bad_note2
			vol = -4.02
			pitch = -0.89
			pan1x = 0.47
			pan1y = 0.883
			pan2x = 0.728
			pan2y = 0.685
		}
		{
			bad_note3
			vol = -5.2599998
			pan1x = 0.47
			pan1y = 0.883
			pan2x = 0.728
			pan2y = 0.685
		}
		{
			bad_note4
			vol = -5.21
			pitch = 0.84000003
			pan1x = 0.47
			pan1y = 0.883
			pan2x = 0.728
			pan2y = 0.685
		}
		{
			bad_note6
			vol = -5.2599998
			pan1x = 0.47
			pan1y = 0.883
			pan2x = 0.728
			pan2y = 0.685
		}
	]
}
Second_Player_Bad_Note_Bass_container = {
	Default_Priority = 90
	Default_Buss = wrong_notes_bass
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = RandomNoRepeatType
	slot = 2
	Sounds = [
		{
			bad_note_bass1
			vol = -2
			pan1x = 0.47
			pan1y = 0.883
			pan2x = 0.728
			pan2y = 0.685
			vol = 0
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			bad_note_bass2
			vol = -2
			pan1x = 0.47
			pan1y = 0.883
			pan2x = 0.728
			pan2y = 0.685
			vol = 0
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			bad_note_bass4
			vol = -2
			pan1x = 0.47
			pan1y = 0.883
			pan2x = 0.728
			pan2y = 0.685
			vol = 0
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			bad_note_bass6
			vol = -2
			pan1x = 0.47
			pan1y = 0.883
			pan2x = 0.728
			pan2y = 0.685
			vol = 0
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
	]
}
Single_Player_Bad_Note_Guitar_container = {
	Default_Priority = 90
	Default_Buss = wrong_notes_guitar
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = RandomNoRepeatType
	slot = 2
	Sounds = [
		{
			bad_note1
			vol = -5.63
		}
		{
			bad_note2
			vol = -4.02
		}
		{
			bad_note4
			vol = -5.21
		}
		{
			bad_note6
			vol = -5.2599998
		}
		{
			bad_note3
			vol = -5.2599998
		}
	]
}
Single_Player_Bad_Note_Bass_container = {
	Default_Priority = 90
	Default_Buss = wrong_notes_bass
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = RandomNoRepeatType
	slot = 2
	Sounds = [
		{
			bad_note_bass2
			vol = -2
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			bad_note_bass4
			vol = -2
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
		{
			bad_note_bass6
			vol = -2
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-1
					1
				]
			}
		}
	]
}
ui_crowd_vol_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.02
	InstanceLimit = 3
	slot = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = {
		Sound1 = {
			Crowd_Group_Clap_01
			vol_percent = 100
		}
		Sound2 = {
			Crowd_Group_Clap_02
			vol_percent = 100
		}
		Sound3 = {
			Crowd_Group_Clap_03
			vol_percent = 100
		}
		Sound4 = {
			Crowd_Group_Clap_04
			vol_percent = 100
		}
		Sound5 = {
			Crowd_Group_Clap_05
			vol_percent = 100
		}
		Sound6 = {
			Crowd_Group_Clap_06
			vol_percent = 100
		}
	}
}
ui_guitar_vol_container = {
	Default_Buss = First_Player_Lead_Playback
	NoRepeatFor = 0.02
	InstanceLimit = 3
	slot = 1
	Command = PlaySound
	Randomness = None
	Sounds = {
		Sound1 = {
			bad_note_bass4
			vol_percent = 55
		}
	}
}
ui_band_vol_container = {
	Default_Buss = Band_Playback
	NoRepeatFor = 0.02
	InstanceLimit = 3
	slot = 1
	Command = PlaySound
	Randomness = None
	Sounds = {
		Sound1 = {
			StickClickMed
			vol_percent = 45
		}
	}
}
GH_SFX_BossBattle_PlayerDies_container = {
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_DeathFromSlash
		}
	]
}
