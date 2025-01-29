Single_Player_Bad_Note_Guitar_container = {
	Default_Buss = wrong_notes_guitar
	NoRepeatFor = 0.02
	InstanceLimit = 4
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
	Default_Buss = wrong_notes_bass
	NoRepeatFor = 0.02
	InstanceLimit = 4
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
First_Player_Bad_Note_Guitar_container = {
	Default_Buss = wrong_notes_guitar
	NoRepeatFor = 0.02
	InstanceLimit = 4
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
			pitch = -0.89
		}
		{
			bad_note3
			vol = -5.2599998
		}
		{
			bad_note4
			vol = -5.21
			pitch = 0.84000003
		}
		{
			bad_note6
			vol = -5.2599998
		}
	]
}
First_Player_Bad_Note_Bass_container = {
	Default_Buss = wrong_notes_bass
	NoRepeatFor = 0.02
	InstanceLimit = 4
	Randomness = RandomNoRepeatType
	slot = 2
	Sounds = [
		{
			bad_note_bass1
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
Second_Player_Bad_Note_Guitar_container = {
	Default_Buss = wrong_notes_guitar
	NoRepeatFor = 0.02
	InstanceLimit = 4
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
			pitch = -0.89
		}
		{
			bad_note3
			vol = -5.2599998
		}
		{
			bad_note4
			vol = -5.21
			pitch = 0.84000003
		}
		{
			bad_note6
			vol = -5.2599998
		}
	]
}
Second_Player_Bad_Note_Bass_container = {
	Default_Buss = wrong_notes_bass
	NoRepeatFor = 0.02
	InstanceLimit = 4
	Randomness = RandomNoRepeatType
	slot = 2
	Sounds = [
		{
			bad_note_bass1
			vol = -2
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
encore_pulsate_neon_loop_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.2
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			encore_pulsate_neon_loop
			num_loops = -1
			vol = -7
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
			vol = 0
			pan1x = -1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
		{
			sp_awarded2
			vol = 2
			pan1x = -1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
	]
}
star_meter_gain_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_meter_gain
			vol = -2
			pan1x = -0.25
			pan1y = 1.0
			pan2x = 0.75
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
			vol = 0
			pan1x = -1
			pan1y = 1
			pan2x = -0.5141509
			pan2y = 1
			panremovecenter = true
		}
		{
			sp_awarded2
			vol = 2
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
			vol = 0
			pan1x = 0.4669811
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
		{
			sp_awarded2
			vol = 2
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
			vol = 0
			pan1x = -0.45283026
			pan1y = 1
			pan2x = 0.45283026
			pan2y = 1
			panremovecenter = true
		}
		{
			sp_awarded2
			vol = 2
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
	slot = 1
	Sounds = [
		{
			sp_deployed
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
	slot = 1
	Sounds = [
		{
			sp_deployed
		}
	]
}
Menu_Guitar_Lick_SFX_container = {
	Default_Priority = 80
	Default_Buss = Front_End
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomType
}
Star_Power_Deployed_SFX_P2_container = {
	Default_Priority = 90
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	slot = 1
	Sounds = [
		{
			sp_deployed
		}
	]
}
Star_Power_Deployed_Cheer_SFX_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = Obj_PlaySound
	Randomness = None
	Sounds = [
		{
			sp_cheer1
			vol = 6
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
			vol = 6
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
			vol = 6
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
			vol = 6
			pan1x = 1
			pan1y = 1
			pan2x = 0.41
			pan2y = 1
			panremovecenter = true
		}
	]
}
ui_sfx_scroll_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.03
	InstanceLimit = 6
	Randomness = None
	slot = 1
	Sounds = [
		{
			scroll
		}
	]
}
ui_sfx_select_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.02
	InstanceLimit = 6
	slot = 1
	Randomness = None
	Sounds = [
		{
			UI_Sound_05
			vol = -3
		}
	]
}
GH_SFX_BattleMode_Lightning_Player1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_Lightning
			vol = -4.42
		}
	]
}
GH_SFX_BattleMode_Lightning_Player2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_Lightning
			vol = -4.42
		}
	]
}
GH_SFX_BeatSoundEvent_container = {
	Default_Buss = Test_Tones
	NoRepeatFor = 0.001
	InstanceLimit = 8
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
	Default_Buss = Test_Tones
	NoRepeatFor = 0.02
	InstanceLimit = 6
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
	Default_Buss = Test_Tones
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			GH3_Beat_Sound
			vol = 6
			pitch = -2.81
		}
	]
}
DoNothing_OneShot_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
}
0x31926793 = {
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			0x0a0edbfb
			vol = -6.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x7f4dc080 = {
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			0x0a0edbfb
			vol = -11.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0xf66c9b4e = {
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			0x9f084da0
			vol = -11.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x02dcdbc0 = {
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			0x9f084da0
			vol = -11.5
		}
	]
}
Crowd_OneShots_Boo_Close_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 1.5
	InstanceLimit = 1
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Boo_Sm_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					1.09
					2.06
				]
			}
		}
		{
			Crowd_Boo_Sm_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					1.09
					2.06
				]
			}
		}
		{
			Crowd_Boo_Sm_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					1.09
					2.06
				]
			}
		}
		{
			Crowd_Boo_Sm_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					1.09
					2.06
				]
			}
		}
		{
			Crowd_Boo_Sm_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					1.09
					2.06
				]
			}
		}
		{
			Crowd_Boo_Sm_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					1.09
					2.06
				]
			}
		}
		{
			Crowd_Boo_Sm_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					1.09
					2.06
				]
			}
		}
		{
			Crowd_Boo_Sm_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					1.09
					2.06
				]
			}
		}
		{
			Crowd_Boo_Sm_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					1.09
					2.06
				]
			}
		}
		{
			Crowd_Boo_Sm_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					1.09
					2.06
				]
			}
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
Generic_Menu_Back_SFX_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatType
	slot = 1
	Sounds = [
		{
			UI_Sound_09
			vol = -5.5
		}
	]
}
Notes_Ripple_Up_SFX_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.5
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Notes_Ripple_Up_01
			vol = -3.73
		}
	]
}
crowd_transition_large_ext_good_to_med_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			lg_crowd_good_to_neutral_01
			vol = -6.5
		}
	]
}
crowd_transition_medium_ext_good_to_med_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			md_crowd_good_to_neutral_01
			vol = -9.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_medium_int_good_to_med_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			md_crowd_good_to_neutral_01
			vol = -8.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_small_int_good_to_med_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sm_crowd_good_to_neutral_03
			vol = -8.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_large_ext_med_to_good_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_good_01
			vol = -8.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_medium_ext_med_to_good_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_good_01
			vol = -7.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_medium_int_med_to_good_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_good_01
			vol = -6.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_small_int_med_to_good_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_good_03
			vol = -19.0
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_large_ext_med_to_poor_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_bad_01
			vol = 0
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_large_ext_med_to_poor_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_bad_01
			vol = 0
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_med_to_poor_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_bad_02
			vol = -1
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_med_to_poor_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_bad_02
			vol = -1
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_med_to_poor_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_bad_02
			vol = -1
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_med_to_poor_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_bad_02
			vol = -19.0
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_small_int_med_to_poor_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_bad_03
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_med_to_poor_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_bad_03
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_med_to_poor_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_bad_03
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_large_ext_poor_to_med_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			lg_crowd_bad_to_neutral_01
			vol = -8.0
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_medium_ext_poor_to_med_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			md_crowd_bad_to_neutral_01
			vol = -5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_medium_int_poor_to_med_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			md_crowd_bad_to_neutral_01
			vol = 3.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_small_int_poor_to_med_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sm_crowd_bad_to_neutral_01
			vol = -2.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x0c77ca08 = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0xefe527ab
			vol = -13.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x75e83bef = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0x215f20c6
			vol = -11.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x5f0500c2 = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0x9f2b0ce3
			vol = -10.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x0683d46f = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0xc030a1f5
			vol = -11.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x7f1c2588 = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0x9783f722
			vol = -11.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0xabb5404c = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0x29f7db07
			vol = -12.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0xfe2684fa = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0xcc3f6614
			vol = -6.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x7ad61a83 = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0xcc3f6614
			vol = -11.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x87b9751d = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0x02856179
			vol = -6.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x0349eb64 = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0x02856179
			vol = -11.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x6c4bbc91 = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0x52ff2c70
			vol = -6.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x22941b82 = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0x52ff2c70
			vol = -12.5
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
Box_Check_SFX_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
		}
		{
			Checkbox_SFX
			vol = -1.93
		}
	]
}
Box_UnCheck_SFX_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
		}
		{
			Checkbox_SFX
			vol = -1.93
		}
	]
}
Cash_Sound_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			cash
			vol = -4.42
		}
	]
}
You_Rock_End_SFX_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			You_Rock
			vol = -2.5
		}
	]
}
ui_sfx_scroll_add_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_Scroll_Add2
			vol = -4.14
		}
	]
}
UI_SFX_Lose_Multiplier_2X_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_Lose_Multiplier
			vol = -8.38
			pitch = 1.65
		}
	]
}
UI_SFX_Lose_Multiplier_3X_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_Lose_Multiplier
			vol = -4.8700004
			pitch = 0.84000003
		}
	]
}
UI_SFX_Lose_Multiplier_4X_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_Lose_Multiplier
			vol = -2.49
			pitch = 0
		}
	]
}
Lose_Multiplier_Crowd_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
}
Song_Intro_Kick_SFX_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	slot = 1
	Sounds = [
		{
			UI_Song_Intro_Kick
			vol = 3.58
		}
	]
}
Song_Intro_Highway_Up_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Highway_Rise
			vol = 3.21
		}
	]
}
GH_SFX_BattleMode_DiffUp_P1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_Battle_DifficultyRampUp
			vol = -7.9300003
		}
	]
}
GH_SFX_BattleMode_DoubleNote_P1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_DoubleNoteAttack
			vol = -3.09
		}
	]
}
GH_SFX_BattleMode_Lefty_P1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_LeftyAttack
		}
	]
}
GH_SFX_BattleMode_Steal_P1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_StealPowerup
			vol = -6
		}
	]
}
GH_SFX_BattleMode_StringBreak_P1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_StringBreakAttack
			vol = -4.42
		}
	]
}
GH_SFX_BattleMode_WhammyAttack_P1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack
			vol = -7.9300003
		}
	]
}
GH_SFX_BattleMode_DiffUp_P2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_Battle_DifficultyRampUp
			vol = -7.9300003
		}
	]
}
GH_SFX_BattleMode_DoubleNote_P2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_DoubleNoteAttack
			vol = -3.09
		}
	]
}
GH_SFX_BattleMode_Lefty_P2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_LeftyAttack
		}
	]
}
GH_SFX_BattleMode_Steal_P2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_StealPowerup
			vol = -6
		}
	]
}
GH_SFX_BattleMode_StringBreak_P2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_StringBreakAttack
			vol = -4.42
		}
	]
}
GH_SFX_BattleMode_WhammyAttack_P2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack
			vol = -7.9300003
		}
	]
}
GH_SFX_BossBattle_PlayerDies_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_DeathFromSlash
		}
	]
}
GH_SFX_You_Lose_Single_Player_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_Sudden_Death
			vol = -2.49
		}
	]
}
GH_SFX_BattleMode_Attack_Over_P1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_Attack_Over
			vol = -6.9100003
		}
	]
}
GH_SFX_BattleMode_Attack_Over_P2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_Attack_Over
			vol = -6.9100003
		}
	]
}
Battle_Power_Awarded_SFX_P1_container = {
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
	Command = PlaySound
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
	Default_Buss = Test_Tones
	NoRepeatFor = 0.02
	InstanceLimit = 6
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 3
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 3
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 3
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = Countoffs
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = jammode_drums
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
}
Cheat_Single_Strum_Note_1_container = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
GH_SFX_BattleMode_WhammyAttack_Received_P1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack_Received
			vol = -9.09
		}
	]
}
GH_SFX_BattleMode_WhammyAttack_Received_P2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_BattleMode_WhammyAttack_Received
			vol = -9.09
		}
	]
}
Cheat_Chord_Strum_10_container = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Checkbox_SFX
			vol = -1.93
		}
	]
}
Checkbox_SFX_P1_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Checkbox_SFX
			vol = -1.93
		}
	]
}
Checkbox_SFX_P2_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Checkbox_SFX
			vol = -1.93
		}
	]
}
Whammy_Test_SFX_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 5
	Randomness = None
	Sounds = [
		{
			Whammy_Test_SFX
			vol = -3.09
		}
	]
}
POW_SFX_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 4
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
		}
	]
}
checkbox_check_2_sfx_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			checkbox_check_sfx_2
			vol = 8
		}
	]
}
CheckBox_Check_SFX_P1_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
		}
	]
}
CheckBox_Check_SFX_P2_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
		}
	]
}
Tutorial_Mode_Finish_Chord_container = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Finish_Chord
			vol = -7
		}
	]
}
UI_SFX_100_Note_Streak_SinglePlayer_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -3
		}
	]
}
UI_SFX_50_Note_Streak_SinglePlayer_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -3
		}
	]
}
UI_SFX_100_Note_Streak_P1_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_SFX_100_Note_Streak
		}
	]
}
UI_SFX_50_Note_Streak_P1_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_SFX_50_Note_Streak
		}
	]
}
UI_SFX_100_Note_Streak_P2_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -3
		}
	]
}
UI_SFX_50_Note_Streak_P2_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_SFX_50_Note_Streak
			vol = -3
		}
	]
}
Tutorial_Missed_HOPO_Free_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Tutorial_Missed_HOPO_Free
			vol = 3.51
		}
	]
}
Tutorial_String_1_HOPO_Free_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Tutorial_String_1_HOPO_Free
			vol = 3.51
		}
	]
}
Tutorial_String_1_Strum_Free_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Tutorial_String_1_Strum_Free
			vol = 3.51
		}
	]
}
Tutorial_String_2_HOPO_Free_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Tutorial_String_2_HOPO_Free
			vol = 3.51
		}
	]
}
Tutorial_String_2_Strum_Free_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Tutorial_String_2_Strum_Free
			vol = 3.51
		}
	]
}
Tutorial_String_3_HOPO_Free_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			Tutorial_String_3_HOPO_Free
			vol = 3.51
		}
	]
}
Tutorial_String_3_Strum_Free_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Tutorial_String_3_Strum_Free
			vol = 3.51
		}
	]
}
0xeafd6fc0 = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0xcd9525fb
			vol = -2
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0x0c9febbc = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0x92adc9ae
			vol = -6
		}
	]
}
0x75001a5b = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0xc51e9f79
			vol = -8
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
0xb724b4c2 = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0x7b6ab35c
			vol = -7
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
Battlemode_HeartBeat_P1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_Battlemode_Heartbeat
			vol = -9.09
			num_loops = -1
		}
	]
}
Battlemode_HeartBeat_P2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			GH3_Battlemode_Heartbeat
			vol = -9.09
			num_loops = -1
		}
	]
}
GH3_Star_FlyIn_container = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			Fly_In_Whoosh
			vol = -5.17
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
battle_boss_flyin_container = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			Fly_In_Whoosh
			vol = 0
			RandomPitch = {
				Type = RandomNoRepeatLastTwoType
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			Fly_In_Whoosh
			vol = -0.90999997
			pitch = -7.46
		}
	]
}
GH3_Cash_FlyIn_container = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			Fly_In_Whoosh
			vol = -1.41
			pitch = -5.9300003
		}
	]
}
GH3_Score_FlyIn_Hit_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_Song_Intro_Kick
			vol = -7.9300003
		}
	]
}
GH3_Cash_FlyIn_Hit_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			cash
			vol = -4.42
		}
	]
}
jam_sounds_template = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatType
}
star_power_deployed_front_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 5
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -5
		}
	]
}
star_power_deployed_lfe_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
			vol = -10
			pan1x = 0.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
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
			vol = -8
			pan1x = 0.0
			pan1y = 1.0
			pan2x = 0.69
			pan2y = 1.0
		}
	]
}
star_power_deployed_back_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_deployed_back
			vol = -5
		}
	]
}
star_power_release_center_gh4_container = {
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
			vol = -8
			pan1x = 0.38000003
			pan1y = 1.0
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
			vol = -10
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
			vol = -10
			pan1x = -0.32000002
			pan1y = 1
			pan2x = 0.32000002
			pan2y = 1
			panremovecenter = true
		}
	]
}
star_power_deployed_back_p1_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_deployed_back
			vol = -7
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
			vol = -8
			pan1x = -1.0
			pan1y = 1.0
		}
	]
}
star_power_deployed_back_p2_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_deployed_back
			vol = -7
		}
	]
}
star_power_deployed_back_p3_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_deployed_back
			vol = -7
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
			vol = -8
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
			vol = -8
			pan1x = -0.32000002
			pan1y = 1.0
			pan2x = 0.32000002
			pan2y = 1.0
		}
	]
}
star_power_deployed_front_p2_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -7
			panremovecenter = true
		}
	]
}
star_power_deployed_front_p3_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -7
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
			vol = -10
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
			vol = -8
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
			vol = -8
			pan1x = 0.0
			pan1y = 1.0
		}
	]
}
star_power_deployed_front_p1_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -7
			panremovecenter = true
		}
	]
}
star_power_deployed_lfe_p1_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_deployed_lfe
			lfeonly = true
			lfe_vol = -7
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
			vol = -8
			pan1x = -1.0
			pan1y = 0.48000002
			pan2x = -0.48000002
			pan2y = 1.0
		}
	]
}
jam_session_rhythm_guitar_template_template = {
	Default_Buss = jammode_rhythmguitar
	NoRepeatFor = 0
	InstanceLimit = 8
	Randomness = RandomNoRepeatType
}
jam_fret_noise_rhythm_container = {
	Default_Buss = jammode_rhythmguitar
	NoRepeatFor = 0
	InstanceLimit = 1
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
crowd_whistle_large_ext_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_lg_crowd_whistle_01
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_02
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_03
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_04
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_05
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_06
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_07
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_08
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_09
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_10
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_11
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_12
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_13
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_14
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_15
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_16
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_17
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_18
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_19
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_20
			vol = -2
			dropoff = 6000
			dropoff_function = linear
		}
	]
}
crowd_whistle_large_int_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			int_lg_crowd_whistle_01
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_02
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_03
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_04
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_05
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_06
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_07
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_08
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_09
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_11
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_12
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_13
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_14
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_15
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_16
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_17
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_18
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_19
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_20
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_whistle_medium_ext_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_md_crowd_whistle_01
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_02
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_03
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_04
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_05
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_06
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_07
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_08
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_09
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_10
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_11
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_12
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_13
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_14
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_15
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_16
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_17
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_18
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_19
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_20
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_whistle_small_ext_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_sm_crowd_whistle_01
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_02
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_03
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_04
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_05
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_06
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_07
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_08
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_09
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_10
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_11
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_13
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_14
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_15
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_16
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_17
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_18
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_19
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_20
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_whistle_small_int_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			int_sm_crowd_whistle_01
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_02
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_03
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_04
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_05
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_06
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_07
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_08
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_09
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_10
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_11
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_12
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_13
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_14
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_15
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_16
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_17
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_18
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_19
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_20
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_oneshot_large_ext_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			0x78719004
			vol = -9
		}
		{
			0xe178c1be
			vol = -9
		}
		{
			0x967ff128
			vol = -9
		}
		{
			0x081b648b
			vol = -9
		}
		{
			0x7f1c541d
			vol = -9
		}
		{
			0xe61505a7
			vol = -9
		}
		{
			0x91123531
			vol = -9
		}
		{
			0x01ad28a0
			vol = -9
		}
		{
			0x76aa1836
			vol = -9
		}
		{
			0x166d91d3
			vol = -9
		}
		{
			0x8ad606eb
			vol = -6
		}
		{
			0x13df5751
			vol = -6
		}
		{
			0x64d867c7
			vol = -6
		}
		{
			0xfabcf264
			vol = -6
		}
		{
			0x8dbbc2f2
			vol = -6
		}
		{
			0x14b29348
			vol = -6
		}
		{
			0xf30abe4f
			vol = -6
		}
		{
			0x840d8ed9
			vol = -6
		}
		{
			0xe4ca073c
			vol = -6
		}
		{
			ext_lg_crowd_whistle_01
			vol = -4
		}
		{
			ext_lg_crowd_whistle_02
			vol = -4
		}
		{
			ext_lg_crowd_whistle_03
			vol = -4
		}
		{
			ext_lg_crowd_whistle_04
			vol = -4
		}
		{
			ext_lg_crowd_whistle_05
			vol = -4
		}
		{
			ext_lg_crowd_whistle_06
			vol = -4
		}
		{
			ext_lg_crowd_whistle_07
			vol = -4
		}
		{
			ext_lg_crowd_whistle_08
			vol = -4
		}
		{
			ext_lg_crowd_whistle_09
			vol = -4
		}
		{
			ext_lg_crowd_whistle_10
			vol = -4
		}
		{
			ext_lg_crowd_whistle_11
			vol = -4
		}
		{
			ext_lg_crowd_whistle_12
			vol = -4
		}
		{
			ext_lg_crowd_whistle_13
			vol = -4
		}
		{
			ext_lg_crowd_whistle_14
			vol = -4
		}
		{
			ext_lg_crowd_whistle_15
			vol = -4
		}
		{
			ext_lg_crowd_whistle_16
			vol = -4
		}
		{
			ext_lg_crowd_whistle_17
			vol = -4
		}
		{
			ext_lg_crowd_whistle_18
			vol = -4
		}
		{
			ext_lg_crowd_whistle_19
			vol = -4
		}
		{
			ext_lg_crowd_whistle_20
			vol = -4
		}
	]
}
crowd_oneshot_large_int_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_lg_crowd_whistle_01
			vol = -3
		}
		{
			ext_lg_crowd_whistle_02
			vol = -3
		}
		{
			ext_lg_crowd_whistle_03
			vol = -3
		}
		{
			ext_lg_crowd_whistle_04
			vol = -3
		}
		{
			ext_lg_crowd_whistle_05
			vol = -3
		}
		{
			ext_lg_crowd_whistle_06
			vol = -3
		}
		{
			ext_lg_crowd_whistle_07
			vol = -3
		}
		{
			ext_lg_crowd_whistle_08
			vol = -3
		}
		{
			ext_lg_crowd_whistle_09
			vol = -3
		}
		{
			ext_lg_crowd_whistle_10
			vol = -3
		}
		{
			ext_lg_crowd_whistle_11
			vol = -3
		}
		{
			ext_lg_crowd_whistle_12
			vol = -3
		}
		{
			ext_lg_crowd_whistle_13
			vol = -3
		}
		{
			ext_lg_crowd_whistle_14
			vol = -3
		}
		{
			ext_lg_crowd_whistle_15
			vol = -3
		}
		{
			ext_lg_crowd_whistle_16
			vol = -3
		}
		{
			ext_lg_crowd_whistle_17
			vol = -3
		}
		{
			ext_lg_crowd_whistle_18
			vol = -3
		}
		{
			ext_lg_crowd_whistle_19
			vol = -3
		}
		{
			ext_lg_crowd_whistle_20
			vol = -3
		}
	]
}
crowd_oneshot_medium_ext_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			0x85338a07
			vol = -11
		}
		{
			0x1c3adbbd
			vol = -11
		}
		{
			0x6b3deb2b
			vol = -11
		}
		{
			0xf5597e88
			vol = -11
		}
		{
			0x825e4e1e
			vol = -11
		}
		{
			0x1b571fa4
			vol = -11
		}
		{
			0x6c502f32
			vol = -11
		}
		{
			0xfcef32a3
			vol = -11
		}
		{
			0x8be80235
			vol = -11
		}
		{
			0xeb2f8bd0
			vol = -11
		}
		{
			0x77941ce8
			vol = -8
		}
		{
			0xee9d4d52
			vol = -8
		}
		{
			0x999a7dc4
			vol = -8
		}
		{
			0x07fee867
			vol = -8
		}
		{
			0x70f9d8f1
			vol = -8
		}
		{
			0xe9f0894b
			vol = -8
		}
		{
			0x9ef7b9dd
			vol = -8
		}
		{
			0x0e48a44c
			vol = -8
		}
		{
			0x794f94da
			vol = -8
		}
		{
			0x19881d3f
			vol = -8
		}
		{
			ext_md_crowd_whistle_01
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_02
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_03
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_04
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_05
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_06
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_07
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_08
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_09
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_10
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_11
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_12
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_13
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_14
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_15
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_16
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_17
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_18
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_19
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_20
			vol = -7
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_oneshot_medium_ext_good_01_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceLimit = 5
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			0x85338a07
			vol = -15.5
		}
		{
			0x1c3adbbd
			vol = -15.5
		}
		{
			0x6b3deb2b
			vol = -15.5
		}
		{
			0xf5597e88
			vol = -15.5
		}
		{
			0x825e4e1e
			vol = -15.5
		}
		{
			0x1b571fa4
			vol = -15.5
		}
		{
			0x6c502f32
			vol = -15.5
		}
		{
			0xfcef32a3
			vol = -15.5
		}
		{
			0x8be80235
			vol = -15.5
		}
		{
			0xeb2f8bd0
			vol = -15.5
		}
		{
			0x77941ce8
			vol = -15.5
		}
		{
			0xee9d4d52
			vol = -15.5
		}
		{
			0x999a7dc4
			vol = -15.5
		}
		{
			0x07fee867
			vol = -15.5
		}
		{
			0x70f9d8f1
			vol = -15.5
		}
		{
			0xe9f0894b
			vol = -15.5
		}
		{
			0x9ef7b9dd
			vol = -15.5
		}
		{
			0x0e48a44c
			vol = -15.5
		}
		{
			0x794f94da
			vol = -15.5
		}
		{
			0x19881d3f
			vol = -15.5
		}
		{
			ext_md_crowd_whistle_01
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_02
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_03
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_04
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_05
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_06
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_07
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_08
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_09
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_10
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_11
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_12
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_13
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_14
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_15
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_16
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_17
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_18
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_19
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_20
			vol = -15.5
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_oneshot_medium_int_good_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_cheer_md_int_sg_01
			vol = -14.5
		}
		{
			crowd_cheer_md_int_sg_02
			vol = -14.5
		}
		{
			crowd_cheer_md_int_sg_03
			vol = -14.5
		}
		{
			crowd_cheer_md_int_sg_04
			vol = -14.5
		}
		{
			crowd_cheer_md_int_sg_05
			vol = -14.5
		}
		{
			crowd_cheer_md_int_sg_06
			vol = -14.5
		}
		{
			crowd_cheer_md_int_sg_07
			vol = -14.5
		}
		{
			crowd_cheer_md_int_sg_08
			vol = -14.5
		}
		{
			crowd_cheer_md_int_sg_09
			vol = -14.5
		}
		{
			crowd_cheer_md_int_sg_10
			vol = -14.5
		}
		{
			crowd_cheer_med_int_gr_01
			vol = -11.5
		}
		{
			crowd_cheer_med_int_gr_02
			vol = -11.5
		}
		{
			crowd_cheer_med_int_gr_03
			vol = -11.5
		}
		{
			crowd_cheer_med_int_gr_04
			vol = -11.5
		}
		{
			crowd_cheer_med_int_gr_05
			vol = -11.5
		}
		{
			crowd_cheer_med_int_gr_06
			vol = -11.5
		}
		{
			crowd_cheer_med_int_gr_07
			vol = -11.5
		}
		{
			crowd_cheer_med_int_gr_08
			vol = -11.5
		}
		{
			crowd_cheer_med_int_gr_09
			vol = -11.5
		}
		{
			crowd_cheer_med_int_gr_10
			vol = -11.5
		}
		{
			int_md_crowd_whistle_01
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_02
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_03
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_04
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_05
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_06
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_07
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_08
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_09
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_10
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_11
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_12
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_13
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_14
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_15
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_16
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_17
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_18
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_19
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_20
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_oneshot_small_ext_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_lg_crowd_whistle_01
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_02
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_03
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_04
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_05
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_06
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_07
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_08
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_09
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_10
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_11
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_12
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_13
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_14
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_15
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_16
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_17
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_18
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_19
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_20
			vol = -1
			dropoff = 6000
			dropoff_function = linear
		}
	]
}
crowd_oneshot_small_int_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			0xc874392b
			vol = -8
		}
		{
			0x517d6891
			vol = -8
		}
		{
			0x267a5807
			vol = -8
		}
		{
			0xb81ecda4
			vol = -8
		}
		{
			0xcf19fd32
			vol = -8
		}
		{
			0x5610ac88
			vol = -8
		}
		{
			0x21179c1e
			vol = -8
		}
		{
			0xb1a8818f
			vol = -8
		}
		{
			0xc6afb119
			vol = -8
		}
		{
			0xa66838fc
			vol = -8
		}
		{
			0x3ad3afc4
			vol = -8
		}
		{
			0xa3dafe7e
			vol = -8
		}
		{
			0xd4ddcee8
			vol = -8
		}
		{
			0x4ab95b4b
			vol = -8
		}
		{
			0x3dbe6bdd
			vol = -8
		}
		{
			0xa4b73a67
			vol = -8
		}
		{
			0xd3b00af1
			vol = -8
		}
		{
			0x430f1760
			vol = -8
		}
		{
			0x340827f6
			vol = -8
		}
		{
			0x54cfae13
			vol = -8
		}
		{
			int_sm_crowd_whistle_01
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_02
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_03
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_04
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_05
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_06
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_07
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_08
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_09
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_10
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_11
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_12
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_13
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_14
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_15
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_16
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_17
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_18
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_19
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_20
			vol = -9
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_oneshot_large_ext_bad_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_boo_grp_large_ext_01
			vol = -1.5
		}
		{
			crowd_boo_grp_large_ext_02
			vol = -1.5
		}
		{
			crowd_boo_grp_large_ext_03
			vol = -1.5
		}
		{
			crowd_boo_grp_large_ext_04
			vol = -1.5
		}
		{
			crowd_boo_grp_large_ext_05
			vol = -1.5
		}
		{
			crowd_boo_grp_large_ext_06
			vol = -1.5
		}
		{
			crowd_boo_grp_large_ext_07
			vol = -1.5
		}
		{
			crowd_boo_grp_large_ext_08
			vol = -1.5
		}
		{
			crowd_boo_grp_large_ext_09
			vol = -1.5
		}
		{
			crowd_boo_grp_large_ext_10
			vol = -1.5
		}
		{
			crowd_boo_lrg_outdoor_sg_01
			vol = -1.5
		}
		{
			crowd_boo_lrg_outdoor_sg_02
			vol = -1.5
		}
		{
			crowd_boo_lrg_outdoor_sg_03
			vol = -1.5
		}
		{
			crowd_boo_lrg_outdoor_sg_04
			vol = -1.5
		}
		{
			crowd_boo_lrg_outdoor_sg_05
			vol = -1.5
		}
		{
			crowd_boo_lrg_outdoor_sg_06
			vol = -1.5
		}
		{
			crowd_boo_lrg_outdoor_sg_07
			vol = -1.5
		}
		{
			crowd_boo_lrg_outdoor_sg_08
			vol = -1.5
		}
		{
			crowd_boo_lrg_outdoor_sg_09
			vol = -1.5
		}
		{
			crowd_boo_lrg_outdoor_sg_10
			vol = -1.5
		}
	]
}
crowd_oneshot_large_int_bad_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Boo_Sm_01
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_02
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_03
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_04
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_05
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_06
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_07
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_08
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_09
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_10
			vol = -4.5
		}
	]
}
crowd_oneshot_medium_ext_bad_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_boo_grp_medium_ext_01
			vol = 1.5
		}
		{
			crowd_boo_grp_medium_ext_02
			vol = 1.5
		}
		{
			crowd_boo_grp_medium_ext_03
			vol = 1.5
		}
		{
			crowd_boo_grp_medium_ext_04
			vol = 1.5
		}
		{
			crowd_boo_grp_medium_ext_05
			vol = 1.5
		}
		{
			crowd_boo_grp_medium_ext_06
			vol = 1.5
		}
		{
			crowd_boo_grp_medium_ext_07
			vol = 1.5
		}
		{
			crowd_boo_grp_medium_ext_08
			vol = 1.5
		}
		{
			crowd_boo_grp_medium_ext_09
			vol = 1.5
		}
		{
			crowd_boo_grp_medium_ext_10
			vol = 1.5
		}
		{
			crowd_boo_med_outdoor_sg_01
			vol = 1.5
		}
		{
			crowd_boo_med_outdoor_sg_02
			vol = 1.5
		}
		{
			crowd_boo_med_outdoor_sg_03
			vol = 1.5
		}
		{
			crowd_boo_med_outdoor_sg_04
			vol = 1.5
		}
		{
			crowd_boo_med_outdoor_sg_05
			vol = 1.5
		}
		{
			crowd_boo_med_outdoor_sg_06
			vol = 1.5
		}
		{
			crowd_boo_med_outdoor_sg_07
			vol = 1.5
		}
		{
			crowd_boo_med_outdoor_sg_08
			vol = 1.5
		}
		{
			crowd_boo_med_outdoor_sg_09
			vol = 1.5
		}
		{
			crowd_boo_med_outdoor_sg_10
			vol = 1.5
		}
	]
}
crowd_oneshot_medium_int_bad_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_boo_grp_medium_int_01
			vol = 2.5
		}
		{
			crowd_boo_grp_medium_int_02
			vol = 2.5
		}
		{
			crowd_boo_grp_medium_int_03
			vol = 2.5
		}
		{
			crowd_boo_grp_medium_int_04
			vol = 2.5
		}
		{
			crowd_boo_grp_medium_int_05
			vol = 2.5
		}
		{
			crowd_boo_grp_medium_int_06
			vol = 2.5
		}
		{
			crowd_boo_grp_medium_int_07
			vol = 2.5
		}
		{
			crowd_boo_grp_medium_int_08
			vol = 2.5
		}
		{
			crowd_boo_grp_medium_int_09
			vol = 2.5
		}
		{
			crowd_boo_grp_medium_int_10
			vol = 2.5
		}
		{
			crowd_boo_med_indoor_sg_01
			vol = 2.5
		}
		{
			crowd_boo_med_indoor_sg_02
			vol = 2.5
		}
		{
			crowd_boo_med_indoor_sg_03
			vol = 2.5
		}
		{
			crowd_boo_med_indoor_sg_04
			vol = 2.5
		}
		{
			crowd_boo_med_indoor_sg_05
			vol = 2.5
		}
		{
			crowd_boo_med_indoor_sg_06
			vol = 2.5
		}
		{
			crowd_boo_med_indoor_sg_07
			vol = 2.5
		}
		{
			crowd_boo_med_indoor_sg_08
			vol = 2.5
		}
		{
			crowd_boo_med_indoor_sg_09
			vol = 2.5
		}
		{
			crowd_boo_med_indoor_sg_10
			vol = 2.5
		}
	]
}
crowd_oneshot_small_ext_bad_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			Crowd_Boo_Sm_01
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_02
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_03
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_04
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_05
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_06
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_07
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_08
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_09
			vol = -4.5
		}
		{
			Crowd_Boo_Sm_10
			vol = -4.5
		}
	]
}
crowd_oneshot_small_int_bad_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_boo_grp_small_int_01
			vol = -1.5
		}
		{
			crowd_boo_grp_small_int_02
			vol = -1.5
		}
		{
			crowd_boo_grp_small_int_03
			vol = -1.5
		}
		{
			crowd_boo_grp_small_int_04
			vol = -1.5
		}
		{
			crowd_boo_grp_small_int_05
			vol = -1.5
		}
		{
			crowd_boo_grp_small_int_06
			vol = -1.5
		}
		{
			crowd_boo_grp_small_int_07
			vol = -1.5
		}
		{
			crowd_boo_grp_small_int_08
			vol = -1.5
		}
		{
			crowd_boo_grp_small_int_09
			vol = -1.5
		}
		{
			crowd_boo_grp_small_int_10
			vol = -1.5
		}
		{
			crowd_boo_sm_indoor_sg_01
			vol = -1.5
		}
		{
			crowd_boo_sm_indoor_sg_02
			vol = -1.5
		}
		{
			crowd_boo_sm_indoor_sg_03
			vol = -1.5
		}
		{
			crowd_boo_sm_indoor_sg_04
			vol = -1.5
		}
		{
			crowd_boo_sm_indoor_sg_05
			vol = -1.5
		}
		{
			crowd_boo_sm_indoor_sg_06
			vol = -1.5
		}
		{
			crowd_boo_sm_indoor_sg_07
			vol = -1.5
		}
		{
			crowd_boo_sm_indoor_sg_08
			vol = -1.5
		}
		{
			crowd_boo_sm_indoor_sg_09
			vol = -1.5
		}
		{
			crowd_boo_sm_indoor_sg_10
			vol = -1.5
		}
	]
}
large_ext_crowd_positive_swell_layer_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_lg_crowd_whistle_01
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_02
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_03
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_04
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_05
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_06
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_07
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_08
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_09
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_10
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_11
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_12
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_13
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_14
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_15
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_16
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_17
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_18
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_19
			vol = 4.5
		}
		{
			ext_lg_crowd_whistle_20
			vol = 4.5
		}
	]
}
jam_rhythm_event_container = {
	template = jam_session_rhythm_guitar_template
	Randomness = RandomNoRepeatType
}
jam_lead_event_container = {
	Default_Buss = jammode_leadguitar
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatType
}
jam_bass_event_container = {
	Default_Buss = jammode_bass
	NoRepeatFor = 0
	InstanceLimit = 8
	Randomness = RandomNoRepeatType
}
jamvoxtest_c5_container = {
	Default_Buss = jammode_vox
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			c5loop
			num_loops = -1
		}
	]
}
jamvoxtest_c3_container = {
	Default_Buss = jammode_vox
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = jammode_vox
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			c4loop
			num_loops = -1
		}
	]
}
gh4_jam_mode_bass_template_template = {
	Default_Buss = jammode_bass
	NoRepeatFor = 0
	InstanceLimit = 8
	Randomness = RandomNoRepeatType
}
jam_fret_noise_bass_short_container = {
	Default_Buss = jammode_bass
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			fj_b_fretnoise_s_01
			vol = -2
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fj_b_fretnoise_s_02
			vol = -2
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fj_b_fretnoise_s_03
			vol = -2
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
	Default_Buss = jammode_bass
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			fj_b_fretnoise_m_01
			vol = -7
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fj_b_fretnoise_m_02
			vol = -7
			RandomPitch = {
				Type = RandomRangeType
				vals = [
					-0.5
					0.5
				]
			}
		}
		{
			fj_b_fretnoise_m_03
			vol = -7
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
	Default_Buss = Front_End
	NoRepeatFor = 0.5
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			guitar_select_affirmation_1
		}
	]
}
guitar_lick_crowd_swell_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
}
song_affirmation_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			song_affirmation_01
			vol = -7
		}
		{
			song_affirmation_03
			vol = -7
		}
		{
			song_affirmation_02
			vol = -7
		}
		{
			song_affirmation_04
			vol = -7
		}
		{
			song_affirmation_05
			vol = -7
		}
		{
			song_affirmation_06
			vol = -7
		}
	]
}
drum_affirmation_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			drum_select_affirmation_01
		}
	]
}
mic_affirmation_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			mic_select_affirmation_01
		}
	]
}
vocal_selection_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 4
	Randomness = None
	Sounds = [
		{
			menu_select_microphone_2
		}
	]
}
drum_selection_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 4
	Randomness = None
	Sounds = [
		{
			menu_select_drums_1
		}
	]
}
guitar_select_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 4
	Randomness = None
	Sounds = [
		{
			menu_select_guitar_3
			vol = -7
		}
	]
}
bass_selection_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 4
	Randomness = None
	Sounds = [
		{
			bass_select_affirmation_03
			vol = -2
		}
	]
}
bass_affirmation_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			bass_select_affirmation_02
		}
	]
}
crowd_clap_to_beat_small_int_normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_small_int_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -3
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -3
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -3
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -3
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -3
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -3
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_small_int_right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -3
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -3
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -3
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -3
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -3
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -3
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_small_int_left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_small_int_right_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_small_int_left_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_int_normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_int_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -4
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -4
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -4
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -4
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -4
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -4
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_int_left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_int_right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -4
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -4
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -4
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -4
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -4
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -4
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_int_left_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -4
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_int_right_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -4
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -4
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -4
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -4
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -4
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -4
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_large_ext_normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = 0
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_large_ext_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -3
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -3
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -3
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -3
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -3
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -3
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_large_ext_right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -3
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -3
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -3
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -3
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -3
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -3
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_large_ext_left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_large_ext_right_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -3
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -3
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -3
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -3
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -3
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -3
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_large_ext_left_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -3
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_ext_normal_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = 1
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_ext_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -2
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -2
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -2
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -2
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -2
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -2
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_ext_left_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_ext_right_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -2
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -2
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -2
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -2
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -2
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -2
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_ext_left_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_ext_right_middle_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -2
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -2
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -2
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -2
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -2
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -2
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
menu_scroll_end_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_select_negative
			vol = -6
		}
	]
}
audio_options_fader_end_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.5
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			menu_select_negative
			vol = -1
		}
	]
}
jam_fret_noise_lead_container = {
	Default_Buss = jammode_leadguitar
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatType
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
crowd_reaction_bad_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 15
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			crowd_reaction_bad
			vol = 0.5
		}
	]
}
you_rock_explosion_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			you_rock_explosion
			vol = -4
		}
	]
}
starttesttones_sine_container = {
	Default_Buss = Master
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
}
starttesttones_pink_container = {
	Default_Buss = Master
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
}
ui_fader_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.0
	InstanceLimit = 10
	Randomness = None
	Sounds = [
		{
			menu_options_sound_fader_move
		}
	]
}
ui_knob_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.0
	InstanceLimit = 10
	Randomness = None
	Sounds = [
		{
			menu_options_sound_eqknob_move
		}
	]
}
dolby_off_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_options_sound_dolbydigitaldisable
		}
	]
}
dolby_on_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_options_sound_dolbydigitalenable
		}
	]
}
sound_options_select_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 4
	Randomness = None
	Sounds = [
		{
			menu_options_sound_select
		}
	]
}
sound_options_back_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 4
	Randomness = None
	Sounds = [
		{
			menu_options_sound_back
			vol = -5
		}
	]
}
menu_headtohead_zoomout_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_zoomout_headtohead
		}
	]
}
gigboard_zoom_left_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_gigboard_camerapan_left
			vol = -11
		}
	]
}
boss_battle_press_sound_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_gigboard_camerapan_left
			vol = 0
		}
	]
}
gigboard_zoom_right_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_gigboard_camerapan_right
			vol = -11
		}
	]
}
menu_career_zoomin_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			menu_zoomin_career
			vol = -4
		}
	]
}
menu_career_zoomout_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_zoomout_career
			vol = 0
		}
	]
}
menu_options_zoomout_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_zoomout_options
			vol = -7
		}
	]
}
menu_options_zoomin_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_zoomin_options
			vol = 1
		}
	]
}
menu_headtohead_zoomin_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_zoomin_headtohead
			vol = -4
		}
	]
}
colorwheel_rotate_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 8
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_rotate
		}
	]
}
colorwheel_deselect_piepiece_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_deselect_piepiece
		}
	]
}
colorwheel_highlight_up_down_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 8
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_3
			pitch = -2
		}
	]
}
colorwheel_selectcolor_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_selectcolor
		}
	]
}
colorwheel_gradientselect_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_gradientselect
		}
	]
}
colorwheel_selectpie_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_selectpie
		}
	]
}
colorwheel_selectshade_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_selectshade
		}
	]
}
enter_band_name_scroll_down_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 8
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			menu_entername_scroll_1
			vol = -1
		}
	]
}
enter_band_name_scroll_up_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 8
	Randomness = None
	Sounds = [
		{
			menu_entername_scroll_1
			pitch = 1
			vol = -1
		}
	]
}
enter_band_name_select_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 8
	Randomness = None
	Sounds = [
		{
			menu_entername_select
			vol = -10
		}
	]
}
guitarcenter_guitar_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			guitarcenter_randomnoodling_guitar_1
			vol = -3
		}
		{
			guitarcenter_randomnoodling_guitar_2
			vol = -3
		}
		{
			guitarcenter_randomnoodling_guitar_3
			vol = -3
		}
		{
			guitarcenter_randomnoodling_guitar_4
			vol = -3
		}
	]
}
guitarcenter_drums_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			guitarcenter_randomnoodling_drums_1
			vol = -3
		}
		{
			guitarcenter_randomnoodling_drums_2
			vol = -3
		}
		{
			guitarcenter_randomnoodling_drums_3
			vol = -3
		}
		{
			guitarcenter_randomnoodling_drums_4
			vol = -3
		}
		{
			guitarcenter_randomnoodling_drums_5
			vol = -3
		}
	]
}
guitarcenter_mic_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			guitarcenter_randomnoodling_mic_1
			vol = -3
		}
		{
			guitarcenter_randomnoodling_mic_3
			vol = -3
		}
		{
			guitarcenter_randomnoodling_mic_5
			vol = -3
		}
		{
			guitarcenter_randomnoodling_mic_6
			vol = -3
		}
	]
}
recording_start_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			jammode_dpad_recordingstart
			vol = 0
		}
	]
}
recording_stop_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			jammode_dpad_recordingstop
			vol = -5
		}
	]
}
dpad_stop_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			jammode_dpad_stop
			vol = -5
		}
	]
}
dpad_play_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			jammode_dpad_play
			vol = 0
		}
	]
}
ghmix_select_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			jammode_dpad_play
			vol = 5
		}
	]
}
ghmix_back_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			jammode_dpad_stop
			vol = -5
		}
	]
}
ghmix_scroll_up_down_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			menu_options_sound_fader_move
			vol = 6
		}
	]
}
line6_scroll_up_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			menu_options_sound_fader_move
			vol = 6
		}
	]
}
line6_scroll_down_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			menu_options_sound_fader_move
			vol = 6
		}
	]
}
online_instrument_change_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			jammode_dpad_play
			vol = 5
		}
	]
}
scale_scroll_up_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
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
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			jammode_dpad_play
			vol = 5
		}
	]
}
audio_options_up_down_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 8
	Randomness = None
	Sounds = [
		{
			menu_options_sound_fader_move
			vol = 6
		}
	]
}
audio_options_menu_guitar_container = {
	Default_Buss = options_guitar
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			audio_options_guitar
			vol = -12
		}
	]
}
audio_options_menu_bass_container = {
	Default_Buss = options_bass
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			audio_options_bass
			vol = -12
		}
	]
}
audio_options_menu_drums_container = {
	Default_Buss = options_drums
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			audio_options_drum
			vol = -12
		}
	]
}
audio_options_menu_vocals_container = {
	Default_Buss = options_vox
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			audio_options_vocals
			vol = -12
		}
	]
}
audio_options_menu_sfx_container = {
	Default_Buss = options_crowd
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
			ghtunes_menu_scroll
			vol = -2
			pitch = 4
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
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ghtunes_select
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
			ghtunes_back
		}
	]
}
pause_menu_sfx_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_into_pausemenu
			vol = -2
		}
	]
}
enter_band_name_finish_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0xa676c493
			vol = -2
		}
	]
}
enter_band_name_back_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 8
	Randomness = None
	Sounds = [
		{
			menu_entername_back
			vol = -7
		}
	]
}
band_mode_career_ready_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			0xa676c493
			vol = -6
		}
	]
}
gh4_gigcomplete_transitiontoresults_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gig_complete_to_results
		}
	]
}
gh4_gigcomplete_cashaward_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gig_complete_cash_award
		}
	]
}
gh4_gigcomplete_unlock_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gig_complete_unlock
		}
	]
}
gh4_gigcomplete_sponsor_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gig_complete_sponsor
			vol = -1
		}
	]
}
gh4_gigcomplete_magunfold_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gig_complete_mag_unfold
		}
	]
}
gh4_gigcomplete_highlight_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gig_complete_highlight
		}
	]
}
jammode_effects_ui_hud_offscreen_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			jammode_effects_hud_offscreen
		}
	]
}
jammode_effects_ui_hud_zoom_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			jammode_effects_hud_zoom
		}
	]
}
achievement_unlock_sfx_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			achievementunlock
		}
	]
}
audio_options_menu_enter_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			audio_options_enter
		}
	]
}
calibration_menu_exit_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			calibration_exit
		}
	]
}
audio_options_menu_exit_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			audio_options_exit
		}
	]
}
calibration_menu_enter_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			calibration_enter
		}
	]
}
calibration_menu_whammy_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			calibration_whammy
		}
	]
}
menu_cheat_correct_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			cheat_correct
		}
	]
}
menu_purchase_item_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			purchase_item
			vol = -3
		}
	]
}
menu_awarded_cash_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			awarded_cash
		}
	]
}
menu_award_large_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			award_large
		}
	]
}
menu_cheat_incorrect_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			cheat_incorrect
		}
	]
}
menu_award_medium_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			award_medium
		}
	]
}
menu_award_small_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			award_small
		}
	]
}
menu_text_zoom_in_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			text_zoom_in
		}
	]
}
menu_text_zoom_out_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			text_zoom_out
		}
	]
}
menu_character_bio_panel_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			character_bio
			vol = -10
		}
	]
}
camera_transition_difficulty_to_vip_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			transition_difficulty_to_vip
		}
	]
}
customize_character_out_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			edit_character_out
		}
	]
}
customize_character_in_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			edit_character_in
		}
	]
}
pause_menu_exit_sfx_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			menu_outof_pausemenu
			vol = -7
		}
	]
}
colorwheel_highlight_4_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_3
			pitch = 1
		}
	]
}
colorwheel_highlight_1_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_3
			pitch = -2
		}
	]
}
colorwheel_highlight_2_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_3
			pitch = -1
		}
	]
}
colorwheel_highlight_3_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_3
		}
	]
}
colorwheel_highlight_5_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_3
			pitch = 2
		}
	]
}
menu_recording_pause_panel_in_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			jam_pause_panel_in
			vol = -14
		}
	]
}
jam_advanced_record_pause_panel_out_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			jam_pause_panel_out
			vol = -14
		}
	]
}
jam_advanced_record_pause_panel_in_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 4
	Randomness = None
	Sounds = [
		{
			jam_pause_panel_in
			vol = -14
		}
	]
}
online_panel_out_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			jam_pause_panel_out
			vol = -14
		}
	]
}
online_panel_in_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 4
	Randomness = None
	Sounds = [
		{
			jam_pause_panel_in
			vol = -14
		}
	]
}
online_main_panel_in_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			jam_pause_panel_in
			vol = -14
		}
	]
}
menu_recording_pause_panel_out_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 4
	Randomness = None
	Sounds = [
		{
			jam_pause_panel_out
			vol = -14
		}
	]
}
band_drums_choose_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			drum_choose
		}
	]
}
band_bass_choose_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			bass_choose
		}
	]
}
band_guitar_choose_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			guitar_choose
		}
	]
}
band_mic_choose_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			mic_choose
		}
	]
}
oneshotsbetweensongs_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
}
surgebetweensongs_container = {
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Randomness = None
}
large_ext_crowd_song_transition_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			large_ext_crowd_song_transition
			vol = -10.5
		}
	]
}
medium_int_crowd_song_transition_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			medium_int_crowd_song_transition
			vol = -10.5
		}
	]
}
ui_sfx_scroll_up_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			menu_scroll_up
			vol = -8
			pitch = 0
		}
	]
}
ui_sfx_scroll_down_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			menu_scroll_down
			vol = -4.5
			pitch = 0
		}
	]
}
ui_sfx_negative_select_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 8
	Randomness = None
	Sounds = [
		{
			menu_select_negative
			vol = -8
		}
	]
}
enter_band_name_caps_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			menu_entername_caps
			vol = -4
		}
	]
}
menu_character_bio_panel_out_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			character_bio_out
			vol = -18
		}
	]
}
song_wizard_on_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_jammode_songwizard_on
			vol = -1
		}
	]
}
song_wizard_off_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_jammode_songwizard_off
			vol = -1
		}
	]
}
jam_mode_fxhud_off_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_jammode_fxhud_off
			vol = -2
		}
	]
}
jam_mode_fxhud_on_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_jammode_fxhud_on
			vol = -10
		}
	]
}
menu_audio_options_reset_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			soundoptions_menu_reset
			vol = 0
		}
	]
}
menu_cheat_enter_red_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			menu_cheat_red
			vol = -2
		}
	]
}
menu_cheat_enter_green_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			menu_cheat_green
			vol = -2
		}
	]
}
menu_cheat_enter_blue_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			menu_cheat_blue
			vol = -2
		}
	]
}
menu_cheat_enter_yellow_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			menu_cheat_yellow
			vol = -2
		}
	]
}
gig_board_zoom_out_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_zoomout_career
			vol = -1
		}
	]
}
gig_board_zoom_in_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_zoomin_career
			vol = -15
		}
	]
}
large_guitar_smash_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			guitar_smash_large_gh4_01
			vol = -1.5
		}
	]
}
medium_guitar_smash_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			guitar_smash_medium_gh4_01
			vol = -1.5
		}
	]
}
mic_feedback_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 3
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			mic_feedback_gh4_01
			vol = -6.5
		}
		{
			mic_feedback_gh4_02
			vol = -6.5
		}
		{
			mic_feedback_gh4_03
			vol = -6.5
		}
		{
			mic_feedback_gh4_04
			vol = -6.5
		}
	]
}
small_guitar_smash_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			guitar_smash_small_gh4_01
			vol = -7.5
		}
	]
}
mic_grab_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			mic_grab_gh4_04
			vol = 0.5
		}
		{
			mic_grab_gh4_05
			vol = 0.5
		}
	]
}
singer_anims_win_01_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			singer_win_anim_1_02
			vol = -10.5
		}
		{
			singer_win_anim_2_01
			vol = -10.5
		}
		{
			singer_win_anim_3_01
			vol = -13.5
		}
		{
			singer_win_anim_2_02
			vol = -10.5
		}
	]
}
bass_anims_win_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			bass_win_anim_1_01
			vol = -10.5
		}
		{
			bass_win_anim_1_02
			vol = -10.5
		}
		{
			bass_win_anim_2_01
			vol = -10.5
		}
		{
			bass_win_anim_2_02
			vol = -10.5
		}
		{
			bass_win_anim_3_01
			vol = -10.5
		}
		{
			bass_win_anim_3_02
			vol = -10.5
		}
		{
			bass_win_anim_4_01
			vol = -10.5
		}
		{
			bass_win_anim_4_02
			vol = -10.5
		}
	]
}
guitar_anims_win_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			guitar_win_anim_1_01
			vol = -10.5
		}
		{
			guitar_win_anim_1_02
			vol = -10.5
		}
		{
			guitar_win_anim_2_01
			vol = -10.5
		}
		{
			guitar_win_anim_2_02
			vol = -10.5
		}
		{
			guitar_win_anim_3_01
			vol = -10.5
		}
		{
			guitar_win_anim_3_02
			vol = -10.5
		}
		{
			guitar_win_anim_4_01
			vol = -10.5
		}
		{
			guitar_win_anim_4_02
			vol = -10.5
		}
		{
			guitar_win_anim_5_01
			vol = -10.5
		}
	]
}
drum_anims_win_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			drum_win_anim_1_01
			vol = -10.5
		}
		{
			drum_win_anim_1_02
			vol = -10.5
		}
		{
			drum_win_anim_2_01
			vol = -10.5
		}
		{
			drum_win_anim_2_02
			vol = -10.5
		}
		{
			drum_win_anim_3_01
			vol = -10.5
		}
		{
			drum_win_anim_3_02
			vol = -10.5
		}
	]
}
z_fairgrounds_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			fairgrounds_intro
			vol = -4.5
		}
	]
}
z_military_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			military_intro
			vol = 1.5
		}
	]
}
z_studio_intro_1_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			z_studio_intro
			vol = 1.5
		}
	]
}
z_scifi_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			scifi_intro
			vol = -7.5
		}
	]
}
z_frathouse_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			frathouse_intro
			vol = -1.5
		}
	]
}
z_metalfest_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			metalfest_intro
			vol = -4.5
		}
	]
}
z_harbor_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			harbor_intro
			vol = 1.5
		}
	]
}
z_castle_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			castle_intro
			vol = 1.5
		}
	]
}
ozzy_bucket_water_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ozzy_splash
			vol = -10.5
		}
	]
}
ozzy_bucket_throw_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ozzy_bucket
			vol = -10.5
		}
	]
}
drummer_sticks_throw_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			drummer_stickthrow_02
			vol = -6.5
		}
		{
			drummer_stickthrow_03
			vol = -6.5
		}
		{
			drummer_stickthrow_04
			vol = -6.5
		}
	]
}
drummer_tom_hit_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 3
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			drummer_tom_01
			vol = -10.5
		}
		{
			drummer_tom_02
			vol = -10.5
		}
	]
}
drummer_snare_hit_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 3
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			drummer_snare_01
			vol = -10.5
		}
		{
			drummer_snare_02
			vol = -10.5
		}
	]
}
large_bass_smash_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 8
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			bass_smash_large_gh4_01
			vol = -5.5
		}
		{
			bass_smash_large_gh4_02
			vol = -5.5
		}
	]
}
medium_bass_smash_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 8
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			bass_smash_medium_gh4_01
			vol = -5.5
		}
		{
			bass_smash_medium_gh4_02
			vol = -5.5
		}
	]
}
small_bass_smash_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 8
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			bass_smash_small_gh4_01
			vol = -5.5
		}
		{
			bass_smash_small_gh4_02
			vol = -5.5
		}
	]
}
mic_hit_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceLimit = 3
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			mic_grab_gh4_02
			vol = 3.5
		}
		{
			mic_grab_gh4_03
			vol = 3.5
		}
	]
}
select_band_leader_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			band_leader_affirmation
			vol = -1
		}
	]
}
save_confirmed_sfx_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			band_leader_affirmation
			vol = -4
		}
	]
}
gigboard_select_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			UI_Sound_05
			vol = -3
		}
	]
}
gigboard_select_back_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			UI_Sound_09
			vol = -5.5
		}
	]
}
quickplay_remove_song_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			menu_quickplay_removeallsongs
			vol = 0
		}
	]
}
quickplay_select_song_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			menu_quickplay_selectsong
			vol = -1
		}
	]
}
quickplay_remove_all_songs_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			menu_quickplay_removesong
		}
	]
}
front_end_main_menu_intro_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_main_intro
			vol = -2
		}
	]
}
menu_song_complete_out_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			songcomplete_out
			vol = -10
		}
	]
}
menu_song_complete_in_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			songcomplete_in
			vol = -9
		}
	]
}
unlock_new_item_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gigcomplete_unlock_new_item
			vol = -5
		}
	]
}
menu_band_ready_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			band_mode_ready
		}
	]
}
gh_sfx_battlemode_mine_explode_p2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 20
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
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 20
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
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 2
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
ghtunes_on_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_jammode_songwizard_off
			vol = -1
			pitch = 4
		}
	]
}
menu_car_zoomin_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			menu_zoomout_career
			vol = -4
			pitch = 7
		}
	]
}
menu_car_zoomout_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			menu_zoomout_career
			vol = -4
			pitch = 3
		}
	]
}
vocal_highway_appear_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			highway_vocal_remix_nofeedback
			vol = -6
		}
	]
}
character_reset_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			menu_restore_defaults
			vol = 5
		}
	]
}
ghtunes_warning_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghtunes_scroll_warning
		}
	]
}
boss_logo_first_part_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			boss_logo_1
			vol = 6
		}
	]
}
boss_logo_second_part_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			boss_logo_2
			vol = -6
		}
	]
}
do_or_die_sfx_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			doordie
			vol = -3
		}
	]
}
medium_ext_encore_crowd_container = {
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	slot = 3
	Sounds = [
		{
			medium_ext_encore_crowd
			num_loops = -1
			vol = -4
		}
	]
}
large_ext_encore_crowd_container = {
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	slot = 3
	Sounds = [
		{
			large_ext_encore_crowd
			num_loops = -1
			vol = -11
		}
	]
}
medium_int_encore_crowd_container = {
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	slot = 3
	Sounds = [
		{
			medium_int_encore_crowd
			num_loops = -1
			vol = -9
		}
	]
}
small_int_encore_crowd_container = {
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	slot = 3
	Sounds = [
		{
			small_int_encore_crowd
			num_loops = -1
			vol = -11
		}
	]
}
gigboard_scroll_up_down_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			ui_gigboard_scroll
			vol = -9
		}
	]
}
gigboard_gig_unlock_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gig_unlock
			vol = -3
		}
	]
}
unlock_item_text_appear_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 3
	Randomness = None
	Sounds = [
		{
			gigcomplete_unlock_item_text_appear
		}
	]
}
battle_boss_whoosh2_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gigcomplete_unlock_item_text_appear
			vol = 4
		}
	]
}
z_credits_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			intro_z_credits
			vol = -10.5
		}
	]
}
z_tool_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			intro_z_tool
			vol = -10.5
		}
	]
}
gigcomplete_magazine_out_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gig_complete_magazine_out
			vol = 5
		}
	]
}
gigcomplete_magazine_in_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			gig_complete_magazine_in
			vol = 5
		}
	]
}
loading_crowd_long_burst_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceLimit = 20
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_lg_l_02
			vol = -3.5
			pan1x = -1
			pan1y = 1
		}
		{
			ext_md_crowd_swell_lg_r_02
			vol = -3.5
			pan1x = 1
			pan1y = 1
		}
	]
}
loading_crowd_medium_burst_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceLimit = 20
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_md_l_02
			vol = -3.5
			pan1x = -1
			pan1y = 1
		}
		{
			ext_md_crowd_swell_md_r_02
			vol = -3.5
			pan1x = 1
			pan1y = 1
		}
	]
}
loading_crowd_short_burst_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceLimit = 20
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_sh_l_01
			vol = -3.5
			pan1x = -1
			pan1y = 1
		}
		{
			ext_md_crowd_swell_sh_r_01
			vol = -3.5
			pan1x = 1
			pan1y = 1
		}
	]
}
fireworks_last_venue_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			last_venue_fireworks
		}
	]
}
pyro_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			pyro_1
			vol = -3
		}
		{
			pyro_2
			vol = -3
		}
		{
			pyro_3
			vol = -3
		}
	]
}
james_song_1_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_song_1
		}
	]
}
james_song_2_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_song_2
		}
	]
}
james_song_3_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_song_3
		}
	]
}
james_song_5_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_song_5
		}
	]
}
james_song_6_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_song_6
		}
	]
}
james_generic_1_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_1
		}
	]
}
james_generic_10_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_10
		}
	]
}
james_generic_11_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_11
		}
	]
}
james_generic_12_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_12
		}
	]
}
james_generic_13_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_13
		}
	]
}
james_generic_14_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_14
		}
	]
}
james_generic_15_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_15
		}
	]
}
james_generic_16_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_16
		}
	]
}
james_generic_17_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_17
		}
	]
}
james_generic_18_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_18
		}
	]
}
james_generic_19_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_19
		}
	]
}
james_generic_2_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_2
		}
	]
}
james_generic_20_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_20
		}
	]
}
james_generic_3_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_3
		}
	]
}
james_generic_4_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_4
		}
	]
}
james_generic_5_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_5
		}
	]
}
james_generic_6_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_6
		}
	]
}
james_generic_7_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_7
		}
	]
}
james_generic_8_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_8
		}
	]
}
james_generic_9_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_generic_9
		}
	]
}
james_encore_2_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			james_vo_encore_2
		}
	]
}
vo_sb_hello_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_hello
			vol = 6
		}
	]
}
vo_sb_hey_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_hey
			vol = 6
		}
	]
}
vo_sb_metallica_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_metallica
			vol = 6
		}
	]
}
vo_sb_question_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_question
			vol = 6
		}
	]
}
vo_sb_killemall_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_killemall
			vol = 6
		}
	]
}
vo_sb_feelinggood_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_feelinggood
			vol = 6
		}
	]
}
vo_sb_havingfun_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_havingfun
			vol = 6
		}
	]
}
vo_sb_youfeelit_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_youfeelit
			vol = 6
		}
	]
}
vo_sb_wantmore_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sb_more1
			vol = 6
		}
		{
			sb_more2
			vol = 6
		}
		{
			sb_more3
			vol = 6
		}
	]
}
vo_sb_outthere_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_outthere
			vol = 6
		}
	]
}
vo_sb_whatdyousay_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_whatdyousay
			vol = 6
		}
	]
}
vo_sb_areyousure_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sb_areyousure1
			vol = 6
		}
		{
			sb_areyousure2
			vol = 6
		}
	]
}
vo_sb_ohyeah_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sb_ohyeah1
			vol = 6
		}
		{
			sb_ohyeah2
			vol = 6
		}
		{
			sb_ohyeah3
			vol = 6
		}
	]
}
vo_sb_yeah_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sb_yeah1
			vol = 6
		}
		{
			sb_yeah2
			vol = 6
		}
		{
			sb_yeah3
			vol = 6
		}
		{
			sb_yeah4
			vol = 6
		}
	]
}
vo_sb_no_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			sb_no1
			vol = 6
		}
		{
			sb_no2
			vol = 6
		}
		{
			sb_no3
			vol = 6
		}
		{
			sb_no4
			vol = 6
		}
	]
}
vo_sb_goodtohear_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_goodtohear
			vol = 6
		}
	]
}
vo_sb_thatsright_container = {
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sb_thatsright
			vol = 6
		}
	]
}
select_sound_small_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_Sound_05
			vol = -4
		}
	]
}
select_sound_big_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			UI_Sound_05
			vol = -3
		}
	]
}
precutscene_sfx_container = {
	Default_Buss = binkcutscenes
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			pre_cutscence_sfx
			vol = -18
		}
	]
}
ghm_trappedunderice_release_p1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_trappedunderice_release
			vol = -4
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.24528301
		}
	]
}
ghm_hitthelights_release_p2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_hitthelights_release
			vol = -1.5
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.103773
		}
	]
}
ghm_damageinc_attack_p1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_damageinc_attack
			vol = -2
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.2783019
		}
	]
}
ghm_ridethelightning_attack_p2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_ridethelightning_attack
			vol = -4
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.1037736
		}
	]
}
ghm_ridethelightning_release_p2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_ridethelightning_release
			vol = -4
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.16509429
		}
	]
}
ghm_hitthelights_attack_p1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_hitthelights_attack
			vol = -1
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.24056602
		}
	]
}
ghm_trappedunderice_attack_p1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_trappedunderice_attack
			vol = -5
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.24056602
		}
	]
}
ghm_trappedunderice_attack_p2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_trappedunderice_attack
			vol = -5
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.2216981
		}
	]
}
ghm_trappedunderice_release_p2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_trappedunderice_release
			vol = -4
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.2216981
		}
	]
}
ghm_ridethelightning_attack_p1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_ridethelightning_attack
			vol = -4
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.19811319
		}
	]
}
ghm_hitthelights_attack_p2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_hitthelights_attack
			vol = -1
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.2216981
		}
	]
}
ghm_damageinc_attack_p2_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_damageinc_attack
			vol = -2
			pan1x = 1
			pan1y = 1
			pan2x = 1
			pan2y = 0.2216981
		}
	]
}
ghm_hitthelights_release_p1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_hitthelights_release
			vol = -1.5
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.1415094
		}
	]
}
ghm_ridethelightning_release_p1_container = {
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghm_ridethelightning_release
			vol = -4
			pan1x = -1
			pan1y = 1
			pan2x = -1
			pan2y = 0.19339621
		}
	]
}
ui_band_mode_choose_sound_spawned_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 4
	Randomness = None
}
ui_band_mode_choose_sound_ready_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceLimit = 4
	Randomness = None
}
band_screen_ui_sound_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
}
band_failed_x_sfx_container = {
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			band_failed_x_sfx
			vol = 8
		}
	]
}
z_amazon_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			amazon_intro
			vol = 12
		}
	]
}
z_sphinx_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sphinx_intro
			vol = 12
		}
	]
}
z_canyon_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			canyon_intro
			vol = 12
		}
	]
}
z_greatwall_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			greatwall_intro
			vol = 12
		}
	]
}
z_icecap_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			icecap_intro
			vol = 12
		}
	]
}
z_london_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			london_intro
			vol = 12
		}
	]
}
z_quebec_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			quebec_intro
			vol = 12
		}
	]
}
z_atlantis_intro_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			atlantis_intro
			vol = 12
		}
	]
}
london_encore_crowd_container = {
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			medium_int_encore_crowd
			num_loops = -1
			vol = -6
			attack_time = 0.5
			attack_function = linear
		}
	]
}
london_crowd_song_transition_container = {
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			medium_int_crowd_song_transition
		}
	]
}
fail_screen_sfx_container = {
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			band_failed_x_sfx
			vol = 4
		}
	]
}
ui_crowd_vol_container = {
	Default_Buss = Encore_Events
	NoRepeatFor = 0.02
	InstanceLimit = 3
	slot = 1
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
	Randomness = None
	Sounds = {
		Sound1 = {
			StickClickMed
			vol_percent = 45
		}
	}
}
