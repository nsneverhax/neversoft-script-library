audio_crowd_fail_container = {
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
audio_star_power_awarded_container = {
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
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
		{
			sp_awarded2
			vol = 3
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
	]
}
audio_star_power_awarded_p1_container = {
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
			pan2x = -0.51
			pan2y = 1
			panremovecenter = true
		}
		{
			sp_awarded2
			vol = 0
			pan1x = -1
			pan1y = 1
			pan2x = -0.51
			pan2y = 1
			panremovecenter = true
		}
	]
}
audio_star_power_awarded_p2_container = {
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
audio_star_power_awarded_p3_container = {
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
audio_star_power_cheer_deployed_container = {
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
		}
	]
}
audio_star_power_cheer_deployed_p1_container = {
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
audio_star_power_cheer_deployed_p2_container = {
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
audio_star_power_cheer_deployed_p3_container = {
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
0x826c400f = {
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
audio_ui_generic_select_container = {
	Default_Priority = 90
	Default_Buss = Front_End
	NoRepeatFor = 0.3
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			0x7affde14
			vol = -17
			pitch = 4
		}
		{
			0xea40c385
			vol = -10
			pitch = 0
		}
		{
			0x64892b4c
			vol = -14
			pitch = 0
		}
	]
}
audio_calibrate_beat_sfx_container = {
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
audio_calibrate_beat_close_sfx_container = {
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
audio_dummy_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			0x7e381279
		}
		{
			0x90367355
		}
		{
			0x0a952a9b
		}
		{
			0x7affde14
		}
		{
			0xea40c385
		}
		{
			0x64892b4c
		}
		{
			0xc8a34227
		}
		{
			0x51aa139d
		}
		{
			0xd39491f8
		}
		{
			0x3d9af0d4
		}
	]
}
audio_crowd_oneshots_do_nothing_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
}
audio_crowd_lg_ext_swell_short_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			lg_ext_crowd_swell_sh
			vol = 2
		}
		{
			lg_ext_crowd_swell_sh_02
		}
		{
			lg_ext_crowd_swell_sh_03
		}
	]
}
audio_crowd_lg_ext_swell_short_soft_container = {
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
audio_crowd_lg_ext_swell_med_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			lg_ext_crowd_swell_md
			vol = 0
		}
		{
			lg_ext_crowd_swell_md_02
		}
		{
			lg_ext_crowd_swell_md_03
		}
	]
}
audio_crowd_lg_ext_swell_long_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			lg_ext_crowd_swell_lg
			vol = 1
		}
		{
			lg_ext_crowd_swell_lg_02
		}
	]
}
audio_crowd_oneshots_boo_close_container = {
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
audio_ui_generic_warning_container = {
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
audio_ui_generic_back_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			0x0a952a9b
			vol = -16
			pitch = 0
		}
	]
}
audio_ui_gameplay_ripple_up_container = {
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
audio_crowd_lg_ext_transition_positive_to_neutral_l_container = {
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
audio_crowd_lg_ext_transition_positive_to_neutral_r_container = {
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
audio_crowd_lg_ext_transition_positive_to_neutral_container = {
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
audio_crowd_lg_ext_transition_neutral_to_positive_l_container = {
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
audio_crowd_lg_ext_transition_neutral_to_positive_r_container = {
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
audio_crowd_lg_ext_transition_neutral_to_positive_container = {
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
audio_crowd_lg_ext_transition_neutral_to_negative_l_container = {
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
audio_crowd_lg_ext_transition_neutral_to_negative_r_container = {
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
audio_crowd_lg_ext_transition_neutral_to_negative_container = {
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
audio_crowd_lg_ext_transition_negative_to_neutral_l_container = {
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
audio_crowd_lg_ext_transition_negative_to_neutral_r_container = {
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
audio_crowd_lg_ext_transition_negative_to_neutral_container = {
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
audio_crowd_md_ext_transition_positive_to_neutral_l_container = {
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
audio_crowd_md_ext_transition_positive_to_neutral_r_container = {
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
audio_crowd_md_ext_transition_positive_to_neutral_container = {
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
audio_crowd_md_int_transition_positive_to_neutral_l_container = {
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
audio_crowd_md_int_transition_positive_to_neutral_r_container = {
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
audio_crowd_md_int_transition_positive_to_neutral_container = {
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
audio_crowd_md_ext_transition_neutral_to_positive_l_container = {
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
audio_crowd_md_ext_transition_neutral_to_positive_r_container = {
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
audio_crowd_md_ext_transition_neutral_to_positive_container = {
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
audio_crowd_md_int_transition_neutral_to_positive_l_container = {
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
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
audio_crowd_md_int_transition_neutral_to_positive_r_container = {
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
audio_crowd_md_int_transition_neutral_to_positive_container = {
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
audio_crowd_md_ext_transition_neutral_to_negative_l_container = {
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
audio_crowd_md_ext_transition_neutral_to_negative_r_container = {
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
audio_crowd_md_ext_transition_neutral_to_negative_container = {
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
audio_crowd_md_int_transition_neutral_to_negative_l_container = {
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
audio_crowd_md_int_transition_neutral_to_negative_r_container = {
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
audio_crowd_md_int_transition_neutral_to_negative_container = {
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
audio_crowd_md_ext_transition_negative_to_neutral_l_container = {
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
audio_crowd_md_ext_transition_negative_to_neutral_r_container = {
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
audio_crowd_md_ext_transition_negative_to_neutral_container = {
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
audio_crowd_md_int_transition_negative_to_neutral_l_container = {
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
audio_crowd_md_int_transition_negative_to_neutral_r_container = {
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
audio_crowd_md_int_transition_negative_to_neutral_container = {
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
audio_crowd_sm_int_transition_positive_to_neutral_l_container = {
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
audio_crowd_sm_int_transition_positive_to_neutral_r_container = {
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
audio_crowd_sm_int_transition_positive_to_neutral_container = {
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
audio_crowd_sm_int_transition_negative_to_neutral_l_container = {
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
audio_crowd_sm_int_transition_negative_to_neutral_r_container = {
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
audio_crowd_sm_int_transition_negative_to_neutral_container = {
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
audio_crowd_sm_int_transition_neutral_to_positive_l_container = {
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
audio_crowd_sm_int_transition_neutral_to_positive_r_container = {
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
audio_crowd_sm_int_transition_neutral_to_positive_container = {
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
audio_crowd_sm_int_transition_neutral_to_negative_l_container = {
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
audio_crowd_sm_int_transition_neutral_to_negative_r_container = {
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
audio_crowd_sm_int_transition_neutral_to_negative_container = {
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
audio_crowd_md_ext_swell_long_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_ext_crowd_swell_lg
			vol = 1
		}
		{
			md_ext_crowd_swell_lg_02
		}
	]
}
audio_crowd_md_int_swell_long_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			md_int_crowd_swell_lg
			vol = 3
		}
		{
			md_int_crowd_swell_lg_02
		}
	]
}
audio_crowd_sm_int_swell_long_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sm_int_crowd_swell_lg
			vol = 0
		}
		{
			sm_int_crowd_swell_lg_02
			vol = 0
		}
	]
}
audio_crowd_md_ext_swell_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_ext_crowd_swell_md
			vol = 1
		}
		{
			md_ext_crowd_swell_md_02
		}
		{
			md_ext_crowd_swell_md_03
		}
	]
}
audio_crowd_md_int_swell_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_int_crowd_swell_md
			vol = 0
		}
		{
			md_int_crowd_swell_md_02
		}
		{
			md_int_crowd_swell_md_03
		}
	]
}
audio_crowd_sm_int_swell_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_int_crowd_swell_md
			vol = 0
		}
		{
			sm_int_crowd_swell_md_02
		}
		{
			sm_int_crowd_swell_md_03
		}
	]
}
audio_crowd_md_ext_swell_short_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_ext_crowd_swell_sh
			vol = 1
		}
		{
			md_ext_crowd_swell_sh_02
		}
		{
			md_ext_crowd_swell_sh_03
		}
	]
}
audio_crowd_md_ext_swell_short_soft_container = {
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
audio_crowd_md_int_swell_short_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			md_int_crowd_swell_sh
			vol = 0.5
		}
		{
			md_int_crowd_swell_sh_02
		}
		{
			md_int_crowd_swell_sh_03
		}
	]
}
audio_crowd_md_int_swell_short_soft_container = {
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
audio_crowd_sm_int_swell_short_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_int_crowd_swell_sh
			vol = 2
		}
		{
			sm_int_crowd_swell_sh_02
		}
		{
			sm_int_crowd_swell_sh_03
		}
	]
}
audio_crowd_sm_int_swell_short_soft_container = {
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
audio_ui_generic_box_check_container = {
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
audio_ui_generic_box_uncheck_container = {
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
audio_ui_gameplay_lose_multiplier_2x_container = {
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
			vol = -15.38
			pitch = 1.65
		}
	]
}
audio_ui_gameplay_lose_multiplier_3x_container = {
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
			vol = -14.87
			pitch = 0.84000003
		}
	]
}
audio_ui_gameplay_lose_multiplier_4x_container = {
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
			vol = -13.49
			pitch = 0
		}
	]
}
audio_ui_gameplay_intro_kick_container = {
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
audio_ui_gameplay_highway_up_container = {
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
audio_debug_hit_note_container = {
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
audio_countoff_sticks_normal_hard_container = {
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
audio_countoff_sticks_normal_med_container = {
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
audio_countoff_sticks_normal_soft_container = {
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
audio_countoff_hihat01_hard_container = {
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
audio_countoff_hihat01_med_container = {
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
audio_countoff_hihat01_soft_container = {
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
audio_countoff_hihat02_hard_container = {
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
audio_countoff_hihat02_med_container = {
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
audio_countoff_hihat02_soft_container = {
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
audio_countoff_hihat03_hard_container = {
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
audio_countoff_hihat03_med_container = {
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
audio_countoff_hihat03_soft_container = {
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
audio_countoff_sticks_huge_hard_container = {
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
audio_countoff_sticks_huge_med_container = {
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
audio_countoff_sticks_huge_soft_container = {
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
audio_countoff_sticks_tiny_hard_container = {
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
audio_countoff_sticks_tiny_med_container = {
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
audio_countoff_sticks_tiny_soft_container = {
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
audio_crowd_lg_ext_applause_container = {
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
audio_crowd_md_ext_applause_container = {
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
audio_crowd_md_int_applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_int_crowd_applause
			vol = -8
		}
	]
}
audio_crowd_sm_int_applause_container = {
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
audio_crowd_sm_ext_applause_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
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
audio_star_power_deployed_front_container = {
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
			pan2x = 1
			pan2y = 1
		}
	]
}
audio_star_power_deployed_lfe_container = {
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
audio_star_power_available_container = {
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
audio_star_power_release_front_container = {
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
audio_star_power_deployed_back_container = {
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
audio_star_power_available_p2_container = {
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
audio_star_power_available_p3_container = {
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
audio_star_power_deployed_back_p1_container = {
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
audio_star_power_deployed_back_p2_container = {
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
audio_star_power_deployed_back_p3_container = {
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
audio_star_power_release_front_p2_container = {
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
			pan1y = 1
			pan2x = 1
			pan2y = 0.71
		}
	]
}
audio_star_power_release_front_p3_container = {
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
			pan1y = 1
			pan2x = 0.32000002
			pan2y = 1
		}
	]
}
audio_star_power_deployed_front_p2_container = {
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
audio_star_power_deployed_front_p3_container = {
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
audio_star_power_available_p1_container = {
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
audio_star_power_deployed_front_p1_container = {
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
audio_star_power_deployed_lfe_p1_container = {
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
audio_star_power_release_front_p1_container = {
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
			pan1x = -1
			pan1y = 0.48000002
			pan2x = -0.48000002
			pan2y = 1
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
audio_crowd_lg_ext_whistle_positive_container = {
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
		{
			lg_ext_crowd_whistle_05
			vol = -4
		}
		{
			lg_ext_crowd_whistle_06
			vol = -4
		}
		{
			lg_ext_crowd_whistle_07
			vol = -4
		}
		{
			lg_ext_crowd_whistle_08
			vol = -4
		}
		{
			lg_ext_crowd_whistle_09
			vol = -4
		}
		{
			lg_ext_crowd_whistle_10
			vol = -4
		}
		{
			lg_ext_crowd_whistle_11
			vol = -4
		}
		{
			lg_ext_crowd_whistle_12
			vol = -4
		}
		{
			lg_ext_crowd_whistle_13
			vol = -4
		}
		{
			lg_ext_crowd_whistle_14
			vol = -4
		}
		{
			lg_ext_crowd_whistle_15
			vol = -4
		}
		{
			lg_ext_crowd_whistle_16
			vol = -4
		}
		{
			lg_ext_crowd_whistle_17
			vol = -4
		}
		{
			lg_ext_crowd_whistle_18
			vol = -4
		}
		{
			lg_ext_crowd_whistle_19
			vol = -4
		}
		{
			lg_ext_crowd_whistle_20
			vol = -4
		}
	]
}
audio_crowd_md_ext_whistle_positive_container = {
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
		{
			md_ext_crowd_whistle_05
			vol = -2
		}
		{
			md_ext_crowd_whistle_06
			vol = -2
		}
		{
			md_ext_crowd_whistle_07
			vol = -2
		}
		{
			md_ext_crowd_whistle_08
			vol = -2
		}
		{
			md_ext_crowd_whistle_09
			vol = -2
		}
		{
			md_ext_crowd_whistle_10
			vol = -2
		}
		{
			md_ext_crowd_whistle_11
			vol = -2
		}
		{
			md_ext_crowd_whistle_12
			vol = -2
		}
		{
			md_ext_crowd_whistle_13
			vol = -2
		}
		{
			md_ext_crowd_whistle_14
			vol = -2
		}
		{
			md_ext_crowd_whistle_15
			vol = -2
		}
		{
			md_ext_crowd_whistle_16
			vol = -2
		}
		{
			md_ext_crowd_whistle_17
			vol = -2
		}
		{
			md_ext_crowd_whistle_18
			vol = -2
		}
		{
			md_ext_crowd_whistle_19
			vol = -2
		}
		{
			md_ext_crowd_whistle_20
			vol = -2
		}
	]
}
audio_crowd_md_ext_whistle_positive_01_container = {
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
		{
			md_ext_crowd_whistle_05
			vol = -12
		}
		{
			md_ext_crowd_whistle_06
			vol = -12
		}
		{
			md_ext_crowd_whistle_07
			vol = -12
		}
		{
			md_ext_crowd_whistle_08
			vol = -12
		}
		{
			md_ext_crowd_whistle_09
			vol = -12
		}
		{
			md_ext_crowd_whistle_10
			vol = -12
		}
		{
			md_ext_crowd_whistle_11
			vol = -12
		}
		{
			md_ext_crowd_whistle_12
			vol = -12
		}
		{
			md_ext_crowd_whistle_13
			vol = -12
		}
		{
			md_ext_crowd_whistle_14
			vol = -12
		}
		{
			md_ext_crowd_whistle_15
			vol = -12
		}
		{
			md_ext_crowd_whistle_16
			vol = -12
		}
		{
			md_ext_crowd_whistle_17
			vol = -12
		}
		{
			md_ext_crowd_whistle_18
			vol = -12
		}
		{
			md_ext_crowd_whistle_19
			vol = -12
		}
		{
			md_ext_crowd_whistle_20
			vol = -12
		}
	]
}
audio_crowd_md_int_whistle_positive_container = {
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
		{
			md_int_crowd_whistle_05
			vol = 5
		}
		{
			md_int_crowd_whistle_06
			vol = 5
		}
		{
			md_int_crowd_whistle_07
			vol = 5
		}
		{
			md_int_crowd_whistle_08
			vol = 5
		}
		{
			md_int_crowd_whistle_09
			vol = 5
		}
		{
			md_int_crowd_whistle_10
			vol = 5
		}
		{
			md_int_crowd_whistle_11
			vol = 5
		}
		{
			md_int_crowd_whistle_12
			vol = 5
		}
		{
			md_int_crowd_whistle_13
			vol = 5
		}
		{
			md_int_crowd_whistle_14
			vol = 5
		}
		{
			md_int_crowd_whistle_15
			vol = 5
		}
		{
			md_int_crowd_whistle_16
			vol = 5
		}
		{
			md_int_crowd_whistle_17
			vol = 5
		}
		{
			md_int_crowd_whistle_18
			vol = 5
		}
		{
			md_int_crowd_whistle_19
			vol = 5
		}
		{
			md_int_crowd_whistle_20
			vol = 5
		}
	]
}
audio_crowd_sm_ext_whistle_positive_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
}
audio_crowd_sm_int_whistle_positive_container = {
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
		{
			sm_int_crowd_whistle_05
			vol = -2
		}
		{
			sm_int_crowd_whistle_06
			vol = -2
		}
		{
			sm_int_crowd_whistle_07
			vol = -2
		}
		{
			sm_int_crowd_whistle_08
			vol = -2
		}
		{
			sm_int_crowd_whistle_09
			vol = -2
		}
		{
			sm_int_crowd_whistle_10
			vol = -2
		}
		{
			sm_int_crowd_whistle_11
			vol = -2
		}
		{
			sm_int_crowd_whistle_12
			vol = -2
		}
		{
			sm_int_crowd_whistle_13
			vol = -2
		}
		{
			sm_int_crowd_whistle_14
			vol = -2
		}
		{
			sm_int_crowd_whistle_15
			vol = -2
		}
		{
			sm_int_crowd_whistle_16
			vol = -2
		}
		{
			sm_int_crowd_whistle_17
			vol = -2
		}
		{
			sm_int_crowd_whistle_18
			vol = -2
		}
		{
			sm_int_crowd_whistle_19
			vol = -2
		}
		{
			sm_int_crowd_whistle_20
			vol = -2
		}
	]
}
audio_crowd_lg_ext_oneshot_positive_container = {
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
			lg_ext_crowd_cheer_gr_05
			vol = -6
		}
		{
			lg_ext_crowd_cheer_gr_06
			vol = -6
		}
		{
			lg_ext_crowd_cheer_gr_08
			vol = -6
		}
		{
			lg_ext_crowd_cheer_gr_09
			vol = -6
		}
		{
			lg_ext_crowd_cheer_gr_10
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
			lg_ext_crowd_cheer_sg_05
			vol = -9
		}
		{
			lg_ext_crowd_cheer_sg_06
			vol = -9
		}
		{
			lg_ext_crowd_cheer_sg_07
			vol = -9
		}
		{
			lg_ext_crowd_cheer_sg_08
			vol = -9
		}
		{
			lg_ext_crowd_cheer_sg_09
			vol = -9
		}
		{
			lg_ext_crowd_cheer_sg_10
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
		{
			lg_ext_crowd_whistle_05
			vol = -4
		}
		{
			lg_ext_crowd_whistle_06
			vol = -4
		}
		{
			lg_ext_crowd_whistle_07
			vol = -4
		}
		{
			lg_ext_crowd_whistle_08
			vol = -4
		}
		{
			lg_ext_crowd_whistle_09
			vol = -4
		}
		{
			lg_ext_crowd_whistle_10
			vol = -4
		}
		{
			lg_ext_crowd_whistle_11
			vol = -4
		}
		{
			lg_ext_crowd_whistle_12
			vol = -4
		}
		{
			lg_ext_crowd_whistle_13
			vol = -4
		}
		{
			lg_ext_crowd_whistle_14
			vol = -4
		}
		{
			lg_ext_crowd_whistle_15
			vol = -4
		}
		{
			lg_ext_crowd_whistle_16
			vol = -4
		}
		{
			lg_ext_crowd_whistle_17
			vol = -4
		}
		{
			lg_ext_crowd_whistle_18
			vol = -4
		}
		{
			lg_ext_crowd_whistle_19
			vol = -4
		}
		{
			lg_ext_crowd_whistle_20
			vol = -4
		}
	]
}
audio_crowd_md_ext_oneshot_positive_container = {
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
			md_ext_crowd_cheer_gr_05
			vol = -8
		}
		{
			md_ext_crowd_cheer_gr_06
			vol = -8
		}
		{
			md_ext_crowd_cheer_gr_07
			vol = -8
		}
		{
			md_ext_crowd_cheer_gr_08
			vol = -8
		}
		{
			md_ext_crowd_cheer_gr_09
			vol = -8
		}
		{
			md_ext_crowd_cheer_gr_10
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
			md_ext_crowd_cheer_sg_05
			vol = -11
		}
		{
			md_ext_crowd_cheer_sg_06
			vol = -11
		}
		{
			md_ext_crowd_cheer_sg_07
			vol = -11
		}
		{
			md_ext_crowd_cheer_sg_08
			vol = -11
		}
		{
			md_ext_crowd_cheer_sg_09
			vol = -11
		}
		{
			md_ext_crowd_cheer_sg_10
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
		{
			md_ext_crowd_whistle_05
			vol = -7
		}
		{
			md_ext_crowd_whistle_06
			vol = -7
		}
		{
			md_ext_crowd_whistle_07
			vol = -7
		}
		{
			md_ext_crowd_whistle_08
			vol = -7
		}
		{
			md_ext_crowd_whistle_09
			vol = -7
		}
		{
			md_ext_crowd_whistle_10
			vol = -7
		}
		{
			md_ext_crowd_whistle_11
			vol = -7
		}
		{
			md_ext_crowd_whistle_12
			vol = -7
		}
		{
			md_ext_crowd_whistle_13
			vol = -7
		}
		{
			md_ext_crowd_whistle_14
			vol = -7
		}
		{
			md_ext_crowd_whistle_15
			vol = -7
		}
		{
			md_ext_crowd_whistle_16
			vol = -7
		}
		{
			md_ext_crowd_whistle_17
			vol = -7
		}
		{
			md_ext_crowd_whistle_18
			vol = -7
		}
		{
			md_ext_crowd_whistle_19
			vol = -7
		}
		{
			md_ext_crowd_whistle_20
			vol = -7
		}
	]
}
audio_crowd_md_ext_oneshot_positive_01_container = {
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
			md_ext_crowd_cheer_gr_05
			vol = -12
		}
		{
			md_ext_crowd_cheer_gr_06
			vol = -12
		}
		{
			md_ext_crowd_cheer_gr_07
			vol = -12
		}
		{
			md_ext_crowd_cheer_gr_08
			vol = -12
		}
		{
			md_ext_crowd_cheer_gr_09
			vol = -12
		}
		{
			md_ext_crowd_cheer_gr_10
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
			md_ext_crowd_cheer_sg_05
			vol = -12
		}
		{
			md_ext_crowd_cheer_sg_06
			vol = -12
		}
		{
			md_ext_crowd_cheer_sg_07
			vol = -12
		}
		{
			md_ext_crowd_cheer_sg_08
			vol = -12
		}
		{
			md_ext_crowd_cheer_sg_09
			vol = -12
		}
		{
			md_ext_crowd_cheer_sg_10
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
		{
			md_ext_crowd_whistle_05
			vol = -12
		}
		{
			md_ext_crowd_whistle_06
			vol = -12
		}
		{
			md_ext_crowd_whistle_07
			vol = -12
		}
		{
			md_ext_crowd_whistle_08
			vol = -12
		}
		{
			md_ext_crowd_whistle_09
			vol = -12
		}
		{
			md_ext_crowd_whistle_10
			vol = -12
		}
		{
			md_ext_crowd_whistle_11
			vol = -12
		}
		{
			md_ext_crowd_whistle_12
			vol = -12
		}
		{
			md_ext_crowd_whistle_13
			vol = -12
		}
		{
			md_ext_crowd_whistle_14
			vol = -12
		}
		{
			md_ext_crowd_whistle_15
			vol = -12
		}
		{
			md_ext_crowd_whistle_16
			vol = -12
		}
		{
			md_ext_crowd_whistle_17
			vol = -12
		}
		{
			md_ext_crowd_whistle_18
			vol = -12
		}
		{
			md_ext_crowd_whistle_19
			vol = -12
		}
		{
			md_ext_crowd_whistle_20
			vol = -12
		}
	]
}
audio_crowd_md_int_oneshot_positive_container = {
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
			md_int_crowd_cheer_gr_05
			vol = -8
		}
		{
			md_int_crowd_cheer_gr_06
			vol = -8
		}
		{
			md_int_crowd_cheer_gr_08
			vol = -8
		}
		{
			md_int_crowd_cheer_gr_09
			vol = -8
		}
		{
			md_int_crowd_cheer_gr_10
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
			md_int_crowd_cheer_sg_05
			vol = -11
		}
		{
			md_int_crowd_cheer_sg_06
			vol = -11
		}
		{
			md_int_crowd_cheer_sg_07
			vol = -11
		}
		{
			md_int_crowd_cheer_sg_08
			vol = -11
		}
		{
			md_int_crowd_cheer_sg_09
			vol = -11
		}
		{
			md_int_crowd_cheer_sg_10
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
		{
			md_int_crowd_whistle_05
			vol = -7
		}
		{
			md_int_crowd_whistle_06
			vol = -7
		}
		{
			md_int_crowd_whistle_07
			vol = -7
		}
		{
			md_int_crowd_whistle_08
			vol = -7
		}
		{
			md_int_crowd_whistle_09
			vol = -7
		}
		{
			md_int_crowd_whistle_10
			vol = -7
		}
		{
			md_int_crowd_whistle_11
			vol = -7
		}
		{
			md_int_crowd_whistle_12
			vol = -7
		}
		{
			md_int_crowd_whistle_13
			vol = -7
		}
		{
			md_int_crowd_whistle_14
			vol = -7
		}
		{
			md_int_crowd_whistle_15
			vol = -7
		}
		{
			md_int_crowd_whistle_16
			vol = -7
		}
		{
			md_int_crowd_whistle_17
			vol = -7
		}
		{
			md_int_crowd_whistle_18
			vol = -7
		}
		{
			md_int_crowd_whistle_19
			vol = -7
		}
		{
			md_int_crowd_whistle_20
			vol = -7
		}
	]
}
audio_crowd_sm_ext_oneshot_positive_container = {
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
		{
			lg_ext_crowd_whistle_05
			vol = -1
		}
		{
			lg_ext_crowd_whistle_06
			vol = -1
		}
		{
			lg_ext_crowd_whistle_07
			vol = -1
		}
		{
			lg_ext_crowd_whistle_08
			vol = -1
		}
		{
			lg_ext_crowd_whistle_09
			vol = -1
		}
		{
			lg_ext_crowd_whistle_10
			vol = -1
		}
		{
			lg_ext_crowd_whistle_11
			vol = -1
		}
		{
			lg_ext_crowd_whistle_12
			vol = -1
		}
		{
			lg_ext_crowd_whistle_13
			vol = -1
		}
		{
			lg_ext_crowd_whistle_14
			vol = -1
		}
		{
			lg_ext_crowd_whistle_15
			vol = -1
		}
		{
			lg_ext_crowd_whistle_16
			vol = -1
		}
		{
			lg_ext_crowd_whistle_17
			vol = -1
		}
		{
			lg_ext_crowd_whistle_18
			vol = -1
		}
		{
			lg_ext_crowd_whistle_19
			vol = -1
		}
		{
			lg_ext_crowd_whistle_20
			vol = -1
		}
	]
}
audio_crowd_sm_int_oneshot_positive_container = {
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
			sm_int_crowd_cheer_gr_05
		}
		{
			sm_int_crowd_cheer_gr_06
		}
		{
			sm_int_crowd_cheer_gr_07
		}
		{
			sm_int_crowd_cheer_gr_08
		}
		{
			sm_int_crowd_cheer_gr_09
		}
		{
			sm_int_crowd_cheer_gr_10
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
			sm_int_crowd_cheer_sg_05
		}
		{
			sm_int_crowd_cheer_sg_06
		}
		{
			sm_int_crowd_cheer_sg_07
		}
		{
			sm_int_crowd_cheer_sg_08
		}
		{
			sm_int_crowd_cheer_sg_09
		}
		{
			sm_int_crowd_cheer_sg_10
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
		{
			sm_int_crowd_whistle_05
		}
		{
			sm_int_crowd_whistle_06
		}
		{
			sm_int_crowd_whistle_07
		}
		{
			sm_int_crowd_whistle_08
		}
		{
			sm_int_crowd_whistle_09
		}
		{
			sm_int_crowd_whistle_10
		}
		{
			sm_int_crowd_whistle_11
		}
		{
			sm_int_crowd_whistle_12
		}
		{
			sm_int_crowd_whistle_13
		}
		{
			sm_int_crowd_whistle_14
		}
		{
			sm_int_crowd_whistle_15
		}
		{
			sm_int_crowd_whistle_16
		}
		{
			sm_int_crowd_whistle_17
		}
		{
			sm_int_crowd_whistle_18
		}
		{
			sm_int_crowd_whistle_19
		}
		{
			sm_int_crowd_whistle_20
		}
	]
}
audio_crowd_lg_ext_oneshot_negative_container = {
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
			lg_ext_crowd_boo_gr_05
			vol = -1
		}
		{
			lg_ext_crowd_boo_gr_06
			vol = -1
		}
		{
			lg_ext_crowd_boo_gr_07
			vol = -1
		}
		{
			lg_ext_crowd_boo_gr_08
			vol = -1
		}
		{
			lg_ext_crowd_boo_gr_09
			vol = -1
		}
		{
			lg_ext_crowd_boo_gr_10
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
		{
			lg_ext_crowd_boo_sg_05
			vol = -1
		}
		{
			lg_ext_crowd_boo_sg_06
			vol = -1
		}
		{
			lg_ext_crowd_boo_sg_07
			vol = -1
		}
		{
			lg_ext_crowd_boo_sg_08
			vol = -1
		}
		{
			lg_ext_crowd_boo_sg_09
			vol = -1
		}
		{
			lg_ext_crowd_boo_sg_10
			vol = -1
		}
	]
}
audio_crowd_md_ext_oneshot_negative_container = {
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
			md_ext_crowd_boo_gr_05
			vol = 2
		}
		{
			md_ext_crowd_boo_gr_06
			vol = 2
		}
		{
			md_ext_crowd_boo_gr_07
			vol = 2
		}
		{
			md_ext_crowd_boo_gr_08
			vol = 2
		}
		{
			md_ext_crowd_boo_gr_09
			vol = 2
		}
		{
			md_ext_crowd_boo_gr_10
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
		{
			md_ext_crowd_boo_sg_05
			vol = 2
		}
		{
			md_ext_crowd_boo_sg_06
			vol = 2
		}
		{
			md_ext_crowd_boo_sg_07
			vol = 2
		}
		{
			md_ext_crowd_boo_sg_08
			vol = 2
		}
		{
			md_ext_crowd_boo_sg_09
			vol = 2
		}
		{
			md_ext_crowd_boo_sg_10
			vol = 2
		}
	]
}
audio_crowd_md_int_oneshot_negative_container = {
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
			md_int_crowd_boo_gr_05
			vol = 3
		}
		{
			md_int_crowd_boo_gr_06
			vol = 3
		}
		{
			md_int_crowd_boo_gr_07
			vol = 3
		}
		{
			md_int_crowd_boo_gr_08
			vol = 3
		}
		{
			md_int_crowd_boo_gr_09
			vol = 3
		}
		{
			md_int_crowd_boo_gr_10
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
		{
			md_int_crowd_boo_sg_05
			vol = 3
		}
		{
			md_int_crowd_boo_sg_06
			vol = 3
		}
		{
			md_int_crowd_boo_sg_07
			vol = 3
		}
		{
			md_int_crowd_boo_sg_08
			vol = 3
		}
		{
			md_int_crowd_boo_sg_09
			vol = 3
		}
		{
			md_int_crowd_boo_sg_10
			vol = 3
		}
	]
}
audio_crowd_sm_ext_oneshot_negative_container = {
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
audio_crowd_sm_int_oneshot_negative_container = {
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
			sm_int_crowd_boo_gr_05
		}
		{
			sm_int_crowd_boo_gr_06
		}
		{
			sm_int_crowd_boo_gr_07
		}
		{
			sm_int_crowd_boo_gr_08
		}
		{
			sm_int_crowd_boo_gr_09
		}
		{
			sm_int_crowd_boo_gr_10
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
		{
			sm_int_crowd_boo_sg_05
		}
		{
			sm_int_crowd_boo_sg_06
		}
		{
			sm_int_crowd_boo_sg_07
		}
		{
			sm_int_crowd_boo_sg_08
		}
		{
			sm_int_crowd_boo_sg_09
		}
		{
			sm_int_crowd_boo_sg_10
		}
	]
}
audio_crowd_lg_ext_positive_swell_layer_container = {
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
		{
			lg_ext_crowd_whistle_05
			vol = 8
		}
		{
			lg_ext_crowd_whistle_06
			vol = 8
		}
		{
			lg_ext_crowd_whistle_07
			vol = 8
		}
		{
			lg_ext_crowd_whistle_08
			vol = 8
		}
		{
			lg_ext_crowd_whistle_09
			vol = 8
		}
		{
			lg_ext_crowd_whistle_10
			vol = 8
		}
		{
			lg_ext_crowd_whistle_11
			vol = 8
		}
		{
			lg_ext_crowd_whistle_12
			vol = 8
		}
		{
			lg_ext_crowd_whistle_13
			vol = 8
		}
		{
			lg_ext_crowd_whistle_14
			vol = 8
		}
		{
			lg_ext_crowd_whistle_15
			vol = 8
		}
		{
			lg_ext_crowd_whistle_16
			vol = 8
		}
		{
			lg_ext_crowd_whistle_17
			vol = 8
		}
		{
			lg_ext_crowd_whistle_18
			vol = 8
		}
		{
			lg_ext_crowd_whistle_19
			vol = 8
		}
		{
			lg_ext_crowd_whistle_20
			vol = 8
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
0xfd8015ff = {
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
0xf69a303e = {
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
0x00a15c0e = {
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
0xf88299f2 = {
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
audio_crowd_sm_int_clap_to_beat_normal_container = {
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
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			sm_int_crowd_clap_02
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			sm_int_crowd_clap_03
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			sm_int_crowd_clap_04
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			sm_int_crowd_clap_05
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			sm_int_crowd_clap_06
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_sm_int_clap_to_beat_middle_container = {
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
		{
			sm_int_crowd_clap_05
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
		{
			sm_int_crowd_clap_06
			vol = -3
			pan1x = -0.3
			pan1y = 0
			pan2x = 0.3
			pan2y = 0
		}
	]
}
audio_crowd_sm_int_clap_to_beat_right_container = {
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
		{
			sm_int_crowd_clap_05
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
			vol = -3
		}
		{
			sm_int_crowd_clap_06
			vol = -3
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_sm_int_clap_to_beat_left_container = {
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
		{
			sm_int_crowd_clap_05
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
		{
			sm_int_crowd_clap_06
			pan1x = -0.25
			pan1y = 0
			pan2x = -1
			pan2y = 0
			vol = -3
		}
	]
}
audio_crowd_sm_int_clap_to_beat_right_middle_container = {
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
		{
			sm_int_crowd_clap_05
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			sm_int_crowd_clap_06
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_sm_int_clap_to_beat_left_middle_container = {
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
		{
			sm_int_crowd_clap_05
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			sm_int_crowd_clap_06
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
audio_crowd_md_int_clap_to_beat_normal_container = {
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
		{
			md_int_crowd_clap_05
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_06
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_md_int_clap_to_beat_middle_container = {
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
		{
			md_int_crowd_clap_05
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			md_int_crowd_clap_06
			vol = -4
			pan1x = -0.31
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
	]
}
audio_crowd_md_int_clap_to_beat_left_container = {
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
		{
			md_int_crowd_clap_05
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			md_int_crowd_clap_06
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
audio_crowd_md_int_clap_to_beat_right_container = {
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
		{
			md_int_crowd_clap_05
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_06
			vol = -4
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_md_int_clap_to_beat_left_middle_container = {
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
		{
			md_int_crowd_clap_05
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			md_int_crowd_clap_06
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
audio_crowd_md_int_clap_to_beat_right_middle_container = {
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
		{
			md_int_crowd_clap_05
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_int_crowd_clap_06
			vol = -4
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_lg_ext_clap_to_beat_normal_container = {
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
		{
			lg_ext_crowd_clap_05
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_06
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_lg_ext_clap_to_beat_middle_container = {
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
		{
			lg_ext_crowd_clap_05
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_06
			vol = -3
			pan1x = -0.42000002
			pan1y = 0
			pan2x = 0.32000002
			pan2y = 0
		}
	]
}
audio_crowd_lg_ext_clap_to_beat_right_container = {
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
		{
			lg_ext_crowd_clap_05
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_06
			vol = -3
			pan1x = 0.21000001
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_lg_ext_clap_to_beat_left_container = {
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
		{
			lg_ext_crowd_clap_05
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_06
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
audio_crowd_lg_ext_clap_to_beat_right_middle_container = {
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
		{
			lg_ext_crowd_clap_05
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_06
			vol = -3
			pan1x = -0.38000003
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_lg_ext_clap_to_beat_left_middle_container = {
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
		{
			lg_ext_crowd_clap_05
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
		{
			lg_ext_crowd_clap_06
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.28
			pan2y = 0
		}
	]
}
audio_crowd_md_ext_clap_to_beat_normal_container = {
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
		{
			md_ext_crowd_clap_05
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_06
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_md_ext_clap_to_beat_middle_container = {
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
		{
			md_ext_crowd_clap_05
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
		{
			md_ext_crowd_clap_06
			vol = -2
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
	]
}
audio_crowd_md_ext_clap_to_beat_left_container = {
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
		{
			md_ext_crowd_clap_05
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
		{
			md_ext_crowd_clap_06
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.38000003
			pan2y = 0
		}
	]
}
audio_crowd_md_ext_clap_to_beat_right_container = {
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
		{
			md_ext_crowd_clap_05
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_06
			vol = -2
			pan1x = 0.28
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_crowd_md_ext_clap_to_beat_left_middle_container = {
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
		{
			md_ext_crowd_clap_05
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
		{
			md_ext_crowd_clap_06
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.27
			pan2y = 0
		}
	]
}
audio_crowd_md_ext_clap_to_beat_right_middle_container = {
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
		{
			md_ext_crowd_clap_05
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			md_ext_crowd_clap_06
			vol = -2
			pan1x = -0.37
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
audio_ui_generic_scroll_end_container = {
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
			vol = -10
		}
	]
}
audio_ui_audio_options_fader_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0
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
audio_ui_audio_options_dolby_off_container = {
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
audio_ui_audio_options_dolby_on_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_dolbydigitalenable_surround_c
			vol = 4
			pan1x = 0
			pan1y = 1
		}
		{
			menu_dolbydigitalenable_surround_l
			vol = 4
			pan1x = -1
			pan1y = 1
		}
		{
			menu_dolbydigitalenable_surround_lf
			vol = 4
			lfeonly = true
			lfe_vol = -15
		}
		{
			menu_dolbydigitalenable_surround_ls
			vol = 4
			pan1x = -1
			pan1y = -1
		}
		{
			menu_dolbydigitalenable_surround_r
			vol = 4
			pan1x = 1
			pan1y = 1
		}
		{
			menu_dolbydigitalenable_surround_rs
			vol = 4
			pan1x = 1
			pan1y = -1
		}
	]
}
audio_ui_audio_options_select_container = {
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
audio_ui_audio_options_back_container = {
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
audio_ui_car_zoom_left_container = {
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
			vol = -11
			pitch = -5
		}
	]
}
audio_ui_car_zoom_right_container = {
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
			vol = -11
			pitch = -5
		}
	]
}
audio_ui_car_colorwheel_rotate_container = {
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
			vol = -10
		}
	]
}
audio_ui_car_colorwheel_back_container = {
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
			vol = -5
		}
	]
}
audio_ui_car_colorwheel_highlight_1_container = {
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
			vol = -9
			pitch = -2
		}
	]
}
audio_ui_car_colorwheel_select_container = {
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
			vol = -6
		}
	]
}
audio_ui_text_entry_scroll_down_container = {
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
			vol = -15
		}
	]
}
audio_ui_text_entry_scroll_up_container = {
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
			vol = -15
		}
	]
}
audio_ui_text_entry_select_container = {
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
			vol = -7
		}
	]
}
audio_ui_jam_recording_start_container = {
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
audio_ui_jam_recording_stop_container = {
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
audio_ui_jam_stop_container = {
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
audio_ui_jam_play_container = {
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
audio_ui_audio_options_scroll_container = {
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
audio_ui_audio_options_sfx_container = {
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
audio_ui_audio_options_microphone_container = {
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
audio_ui_audio_options_crowd_container = {
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
audio_ui_ghtunes_scroll_container = {
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
audio_ui_ghtunes_select_container = {
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
audio_ui_ghtunes_back_container = {
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
audio_ui_text_entry_finish_container = {
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
			vol = -10
		}
	]
}
0xf8778617 = {
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
audio_ui_text_entry_back_container = {
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
			vol = -9
		}
	]
}
0x77d13995 = {
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
audio_ui_car_colorwheel_highlight_4_container = {
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
			vol = -9
			pitch = -2
		}
	]
}
audio_ui_car_colorwheel_highlight_2_container = {
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
			vol = -9
			pitch = -2
		}
	]
}
audio_ui_car_colorwheel_highlight_3_container = {
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
			vol = -9
			pitch = -2
		}
	]
}
audio_ui_car_colorwheel_highlight_5_container = {
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
			vol = -9
			pitch = -2
		}
	]
}
audio_ui_generic_scroll_up_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			0xc8a34227
			vol = -18
			pitch = 0
		}
	]
}
audio_ui_generic_scroll_down_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			0x51aa139d
			vol = -22
			pitch = 0
		}
	]
}
audio_ui_generic_negative_select_container = {
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
audio_ui_band_lobby_negative_select_container = {
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
			vol = -8
		}
	]
}
audio_ui_text_entry_caps_container = {
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
audio_ui_audio_options_reset_container = {
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
audio_ui_cheat_select_red_container = {
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
audio_ui_cheat_select_green_container = {
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
audio_ui_cheat_select_blue_container = {
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
audio_ui_cheat_select_yellow_container = {
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
audio_winloseanims_large_guitar_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomNoRepeatType
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
		{
			guitar_smash_large_gh4_04
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
audio_winloseanims_medium_guitar_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomNoRepeatType
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
		{
			guitar_smash_medium_gh4_03
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
audio_winloseanims_mic_feedback_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			mic_feedback_gh4_01
			vol = 4
		}
		{
			mic_feedback_gh4_02
			vol = 4
		}
	]
}
audio_winloseanims_small_guitar_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomNoRepeatType
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
		{
			guitar_smash_small_gh4_03
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
audio_winloseanims_mic_grab_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			mic_grab_gh4_04
			vol = 11
		}
		{
			mic_grab_gh4_05
			vol = 11
		}
	]
}
audio_winloseanims_sticks_throw_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			drummer_stickthrow_02
			vol = 4
		}
		{
			drummer_stickthrow_03
			vol = 4
		}
		{
			drummer_stickthrow_04
			vol = 4
		}
	]
}
audio_winloseanims_tom_hit_container = {
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
audio_winloseanims_snare_hit_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			drummer_snare_01
		}
		{
			drummer_snare_02
		}
	]
}
audio_winloseanims_large_bass_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = RandomNoRepeatType
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
		{
			bass_smash_large_gh4_02
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
audio_winloseanims_medium_bass_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = RandomNoRepeatType
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
		{
			bass_smash_medium_gh4_02
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
audio_winloseanims_small_bass_smash_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 8
	Command = PlaySound
	Randomness = RandomNoRepeatType
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
		{
			bass_smash_small_gh4_02
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
audio_winloseanims_mic_hit_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			mic_grab_gh4_02
			vol = 15
		}
		{
			mic_grab_gh4_03
			vol = 15
		}
	]
}
audio_ui_setlist_remove_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			0x90367355
			vol = -12
			pitch = 0
		}
	]
}
audio_ui_setlist_select_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_songlist_select
			vol = -4
		}
	]
}
audio_ui_song_complete_menu_out_container = {
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
			vol = -80
		}
	]
}
audio_ui_song_complete_menu_in_container = {
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
			vol = -80
		}
	]
}
audio_ui_song_complete_unlock_new_item_container = {
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
audio_ui_ghtunes_on_container = {
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
audio_ui_ghtunes_off_container = {
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
audio_ui_gameplay_vocal_highway_appear_container = {
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
audio_ui_car_reset_container = {
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
0xb0780f43 = {
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
audio_ui_gameplay_countdown_timer_beep_container = {
	Default_Priority = 51
	Default_Buss = ui_ingame
	NoRepeatFor = 0.0001
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gh_countdown_timer_sfx
			vol = -8
			pitch = 0
		}
	]
}
audio_ui_jam_stop_song_container = {
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
audio_ui_jam_scroll_container = {
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
audio_ui_jam_select_container = {
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
audio_ui_jam_back_container = {
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
audio_ui_jam_start_song_container = {
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
audio_ui_setlist_playlist_scroll_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_songlist_scroll
			vol = -14
		}
	]
}
audio_ui_setlist_scroll_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_songlist_scroll
			vol = -14
		}
	]
}
audio_ui_setlist_switch_container = {
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
audio_ui_setlist_sort_container = {
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
0xace1b5e6 = {
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
audio_multiplayer_sudden_death_dropped_container = {
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
			vol = -12
		}
	]
}
audio_ui_band_lobby_leader_container = {
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
audio_ui_online_team_switch_container = {
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
audio_ui_band_lobby_complete_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			0xd39491f8
			vol = -8.5
		}
	]
}
audio_ui_car_zoom_in_container = {
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
			vol = -9
		}
	]
}
audio_ui_car_zoom_out_container = {
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
			vol = -6
		}
	]
}
audio_ui_song_complete_camera_movement_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			camera_whoosh_1
			vol = 0
			pan1x = -1
			pan1y = 0.5
			pan2x = 1
			pan2y = 0.5
		}
		{
			camera_whoosh_2
			vol = 0
			pan1x = -1
			pan1y = 0.5
			pan2x = 1
			pan2y = 0.5
		}
		{
			camera_whoosh_3
			vol = 0
			pan1x = -1
			pan1y = 0.5
			pan2x = 1
			pan2y = 0.5
		}
		{
			camera_whoosh_4
			vol = 0
			pan1x = -1
			pan1y = 0.5
			pan2x = 1
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
			vol = -9
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
			vol = -5
			pitch = 0
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
			vol = -50
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
			vol = -50
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
audio_crowd_play_quiet_crowd_one_shots_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			quiet_crowd_oneshot_01
			vol = 3
		}
		{
			quiet_crowd_oneshot_02
			vol = 3
		}
		{
			quiet_crowd_oneshot_03
			vol = 3
		}
		{
			quiet_crowd_oneshot_04
			vol = 3
		}
		{
			quiet_crowd_oneshot_05
			vol = 3
		}
		{
			quiet_crowd_oneshot_09
			vol = 3
		}
		{
			quiet_crowd_oneshot_10
			vol = 3
		}
		{
			quiet_crowd_oneshot_12
			vol = 3
		}
		{
			quiet_crowd_oneshot_14
			vol = 3
		}
		{
			quiet_crowd_oneshot_16
			vol = 3
		}
		{
			quiet_crowd_oneshot_21
			vol = 3
		}
	]
}
close_crowd_whistle_container = {
	Default_Priority = 50
	Default_Buss = inner_crowd_one_shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_int_crowd_whistle_01
			vol = 5
		}
		{
			sm_int_crowd_whistle_02
			vol = 5
		}
		{
			sm_int_crowd_whistle_03
			vol = 5
		}
		{
			sm_int_crowd_whistle_04
			vol = 5
		}
		{
			sm_int_crowd_whistle_05
			vol = 5
		}
		{
			sm_int_crowd_whistle_06
			vol = 5
		}
		{
			sm_int_crowd_whistle_07
			vol = 5
		}
		{
			sm_int_crowd_whistle_08
			vol = 5
		}
		{
			sm_int_crowd_whistle_09
			vol = 5
		}
		{
			sm_int_crowd_whistle_10
			vol = 5
		}
		{
			sm_int_crowd_whistle_11
			vol = 5
		}
		{
			sm_int_crowd_whistle_12
			vol = 5
		}
		{
			sm_int_crowd_whistle_13
			vol = 5
		}
		{
			sm_int_crowd_whistle_14
			vol = 5
		}
		{
			sm_int_crowd_whistle_15
			vol = 5
		}
		{
			sm_int_crowd_whistle_16
			vol = 5
		}
		{
			sm_int_crowd_whistle_17
			vol = 5
		}
		{
			sm_int_crowd_whistle_18
			vol = 5
		}
		{
			sm_int_crowd_whistle_19
			vol = 5
		}
		{
			sm_int_crowd_whistle_20
			vol = 5
		}
	]
}
close_crowd_individual_container = {
	Default_Priority = 50
	Default_Buss = inner_crowd_one_shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_int_crowd_cheer_sg_01
			vol = 8
		}
		{
			sm_int_crowd_cheer_sg_02
			vol = 8
		}
		{
			sm_int_crowd_cheer_sg_03
			vol = 8
		}
		{
			sm_int_crowd_cheer_sg_04
			vol = 8
		}
		{
			sm_int_crowd_cheer_sg_05
			vol = 8
		}
		{
			sm_int_crowd_cheer_sg_06
			vol = 8
		}
		{
			sm_int_crowd_cheer_sg_07
			vol = 8
		}
		{
			sm_int_crowd_cheer_sg_08
			vol = 8
		}
		{
			sm_int_crowd_cheer_sg_09
			vol = 8
		}
		{
			sm_int_crowd_cheer_sg_10
			vol = 8
		}
	]
}
close_crowd_group_container = {
	Default_Priority = 50
	Default_Buss = inner_crowd_one_shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_int_crowd_cheer_gr_01
			vol = 9
		}
		{
			sm_int_crowd_cheer_gr_02
			vol = 9
		}
		{
			sm_int_crowd_cheer_gr_03
			vol = 9
		}
		{
			sm_int_crowd_cheer_gr_04
			vol = 9
		}
		{
			sm_int_crowd_cheer_gr_05
			vol = 9
		}
		{
			sm_int_crowd_cheer_gr_06
			vol = 9
		}
		{
			sm_int_crowd_cheer_gr_07
			vol = 9
		}
		{
			sm_int_crowd_cheer_gr_08
			vol = 9
		}
		{
			sm_int_crowd_cheer_gr_09
			vol = 9
		}
		{
			sm_int_crowd_cheer_gr_10
			vol = 9
		}
	]
}
close_crowd_individual_new_container = {
	Default_Priority = 50
	Default_Buss = inner_crowd_one_shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			quiet_crowd_oneshot_02
			vol = 6
		}
		{
			quiet_crowd_oneshot_03
			vol = 6
		}
		{
			quiet_crowd_oneshot_04
			vol = 6
		}
		{
			quiet_crowd_oneshot_05
			vol = 6
		}
		{
			quiet_crowd_oneshot_06
			vol = 6
		}
		{
			quiet_crowd_oneshot_07
			vol = 6
		}
	]
}
close_crowd_individual_negative_container = {
	Default_Priority = 50
	Default_Buss = inner_crowd_one_shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_int_crowd_boo_sg_01
			vol = 11
		}
		{
			sm_int_crowd_boo_sg_02
			vol = 11
		}
		{
			sm_int_crowd_boo_sg_03
			vol = 11
		}
		{
			sm_int_crowd_boo_sg_04
			vol = 11
		}
		{
			sm_int_crowd_boo_sg_05
			vol = 11
		}
		{
			sm_int_crowd_boo_sg_06
			vol = 11
		}
		{
			sm_int_crowd_boo_sg_07
			vol = 11
		}
		{
			sm_int_crowd_boo_sg_08
			vol = 11
		}
		{
			sm_int_crowd_boo_sg_09
			vol = 11
		}
		{
			sm_int_crowd_boo_sg_10
			vol = 11
		}
	]
}
close_crowd_group_negative_container = {
	Default_Priority = 50
	Default_Buss = inner_crowd_one_shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sm_int_crowd_boo_gr_01
			vol = 11
		}
		{
			sm_int_crowd_boo_gr_02
			vol = 11
		}
		{
			sm_int_crowd_boo_gr_03
			vol = 11
		}
		{
			sm_int_crowd_boo_gr_04
			vol = 11
		}
		{
			sm_int_crowd_boo_gr_05
			vol = 11
		}
		{
			sm_int_crowd_boo_gr_06
			vol = 11
		}
		{
			sm_int_crowd_boo_gr_07
			vol = 11
		}
		{
			sm_int_crowd_boo_gr_08
			vol = 11
		}
		{
			sm_int_crowd_boo_gr_09
			vol = 11
		}
		{
			sm_int_crowd_boo_gr_10
			vol = 11
		}
	]
}
ui_sfx_rewind_highway_container = {
	Default_Priority = 50
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ui_rewind_highway_sound
			vol = -4
		}
	]
}
audio_career_map_select_sound_container = {
	Default_Priority = 50
	Default_Buss = UI
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			career_map_select1
			vol = -5
		}
	]
}
audio_career_map_scroll_sound_container = {
	Default_Priority = 50
	Default_Buss = UI
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 15
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			career_map_scroll
			vol = -15
		}
	]
}
audio_career_map_back_sound_container = {
	Default_Priority = 50
	Default_Buss = UI
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			career_map_back
			vol = -18
		}
	]
}
audio_ui_main_menu_ambience_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			0x7a5811ef
			vol = 0
		}
		{
			0xe3514055
			vol = 0
		}
		{
			0x945670c3
			vol = 0
		}
		{
			0x0a32e560
			vol = 0
		}
		{
			0x5f73339b
			vol = 0
		}
		{
			0xc67a6221
			vol = 0
		}
		{
			0xb17d52b7
			vol = 0
		}
		{
			0x2f19c714
			vol = 0
		}
		{
			0xda5ce7ec
			vol = 0
		}
	]
}
audio_ui_setlist_back_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_songlist_back
			vol = -6
		}
	]
}
0xb00236e6 = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			bh2_video_challenge_good
			vol = 6
		}
	]
}
0x06ce2cda = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			bh2_video_challenge_bad
			vol = 4
			pitch = 1
		}
	]
}
0xc0ad3d62 = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			bh2_video_challenge_start
			vol = -5
		}
	]
}
