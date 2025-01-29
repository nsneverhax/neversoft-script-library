
script song_affirmation 
	SoundEvent \{0x5ea1b4e0}
endscript
Crowd_Fail_Song_SFX_container = {
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	slot = 2
	Sounds = [
		{
			Crowd_Fail_Song
			vol = -10.41
		}
	]
}
crowd_fail_song_sfx_softer_container = {
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	slot = 2
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -4
		}
	]
}
Star_Power_Awarded_SFX_P1_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -4
			panremovecenter = true
		}
	]
}
Star_Power_Awarded_SFX_P2_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -4
			panremovecenter = true
		}
	]
}
star_power_awarded_sfx_p3_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -4
			panremovecenter = true
		}
	]
}
Star_Power_Ready_SFX_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			sp_available1
			vol = -5.17
		}
	]
}
Star_Power_Ready_SFX_P1_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			sp_available1
			vol = -7.51
			panremovecenter = true
		}
	]
}
Star_Power_Ready_SFX_P2_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			sp_available1
			vol = -7.51
			panremovecenter = true
		}
	]
}
Star_Power_Deployed_SFX_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -5
		}
	]
}
Star_Power_Deployed_SFX_P1_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -5
		}
	]
}
Star_Power_Deployed_SFX_P2_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			star_deployed_front
			vol = -5
		}
	]
}
Star_Power_Deployed_Cheer_SFX_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Command = Obj_PlaySound
	Randomness = None
	Sounds = [
		{
			sp_cheer1
			vol = -6.5
			dropoff = 50
			dropoff_function = linear
		}
	]
}
Star_Power_Deployed_Cheer_SFX_P1_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			sp_cheer1
			vol = -6.5
			panremovecenter = true
		}
	]
}
Star_Power_Deployed_Cheer_SFX_P2_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			sp_cheer1
			vol = -6.5
			panremovecenter = true
		}
	]
}
star_power_deployed_cheer_sfx_p3_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = None
	Sounds = [
		{
			sp_cheer1
			vol = -6.5
			panremovecenter = true
		}
	]
}
outro_one_star_container = {
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			outro_one_star
		}
	]
}
outro_two_stars_container = {
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			outro_two_stars
		}
	]
}
outro_three_stars_container = {
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			outro_three_stars
		}
	]
}
outro_four_stars_container = {
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			outro_four_stars
		}
	]
}
outro_five_stars_container = {
	Default_Buss = ui_ingame
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			outro_five_stars
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
			vol = -16.5
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
			vol = -19.5
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
			vol = -19.5
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
			vol = -19.5
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
	Default_Buss = Front_End
	NoRepeatFor = 0.5
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			Menu_Warning_01
			vol = -6
		}
	]
}
menu_warning_sfx_softer_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.5
	InstanceLimit = 2
	Randomness = None
	Sounds = [
		{
			Menu_Warning_01
			vol = -8
		}
	]
}
0x5ed3cc68 = {
	Default_Buss = Front_End
	NoRepeatFor = 0.02
	InstanceLimit = 6
	slot = 1
	Randomness = None
	Sounds = [
		{
			UI_Sound_05
			vol = -2
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
			vol = -2
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
			vol = -6.5
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
crowd_transition_large_ext_med_to_poor_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_bad_01
			vol = -19.0
			dropoff = 6000
			dropoff_function = inv_exponential
		}
	]
}
crowd_transition_medium_ext_med_to_poor_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_bad_02
			vol = -20.0
			dropoff = 6000
			dropoff_function = inv_exponential
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
crowd_transition_small_int_med_to_poor_container = {
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_bad_03
			vol = -18.5
			dropoff = 6000
			dropoff_function = inv_exponential
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
			vol = 3.5
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
			vol = -21.5
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
			vol = -21.5
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
			vol = -18.5
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
			vol = -19.5
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
			vol = -21.5
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
			vol = -20.5
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
			vol = -16.5
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
			vol = -19.5
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
			vol = -18.5
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
			vol = -21.5
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
			vol = -16.5
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
			vol = -20.5
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
			vol = 1
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
			checkbox_uncheck_sfx
			vol = 1
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
			you_rock_front
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
			0x510b41c1
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
			0x510b41c1
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
			0x510b41c1
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
			vol = -2.58
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
			vol = -2.21
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -3.73
		}
	]
}
Battle_Power_Awarded_SFX_P2_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			sp_awarded1
			vol = -3.73
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
Tutorial_Mode_Finish_Chord_container = {
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			Finish_Chord
			vol = 2.27
		}
	]
}
0x5acfd516 = {
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
0xa25f400c = {
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
0x5a0c91a6 = {
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
			vol = -8
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
			vol = -12
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
			vol = -14
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
			vol = -13
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_available
			vol = -10
		}
	]
}
star_power_release_front_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_release_front
			vol = -8
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_release_center
			vol = -8
		}
	]
}
star_power_available_p2_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_available
			vol = -10
			panremovecenter = true
		}
	]
}
star_power_available_p3_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_available
			vol = -10
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_release_center
			vol = -8
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_release_front
			vol = -8
		}
	]
}
star_power_release_front_p3_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_release_front
			vol = -8
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_available
			vol = -10
			panremovecenter = true
		}
	]
}
star_power_release_center_p2_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_release_center
			vol = -8
		}
	]
}
star_power_release_center_p3_gh4_container = {
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_release_center
			vol = -8
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			star_release_front
			vol = -8
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
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_lg_crowd_whistle_01
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_02
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_03
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_04
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_05
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_06
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_07
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_08
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_09
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_10
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_11
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_12
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_13
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_14
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_15
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_16
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_17
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_18
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_19
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_20
			vol = -5.5
			dropoff = 6000
			dropoff_function = linear
		}
	]
}
crowd_whistle_large_int_good_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			int_lg_crowd_whistle_01
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_02
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_03
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_04
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_05
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_06
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_07
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_08
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_09
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_10
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_11
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_12
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_13
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_14
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_15
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_16
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_17
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_18
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_19
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_lg_crowd_whistle_20
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_whistle_medium_ext_good_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_md_crowd_whistle_01
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_02
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_03
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_04
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_05
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_06
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_07
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_08
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_09
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_10
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_11
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_12
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_13
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_14
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_15
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_16
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_17
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_18
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_19
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_20
			vol = -8.3
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_whistle_medium_int_good_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			int_md_crowd_whistle_01
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_02
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_03
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_04
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_05
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_06
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_07
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_08
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_09
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_10
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_11
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_12
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_13
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_14
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_15
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_16
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_17
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_18
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_19
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_20
			vol = -9.0
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_whistle_small_ext_good_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_sm_crowd_whistle_01
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_02
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_03
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_04
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_05
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_06
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_07
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_08
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_09
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_10
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_11
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_12
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_13
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_14
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_15
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_16
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_17
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_18
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_19
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_sm_crowd_whistle_20
			vol = -3.5
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_whistle_small_int_good_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			int_sm_crowd_whistle_01
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_02
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_03
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_04
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_05
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_06
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_07
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_08
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_09
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_10
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_11
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_12
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_13
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_14
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_15
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_16
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_17
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_18
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_19
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_20
			vol = -10
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_oneshot_large_ext_good_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_cheer_lg_ext_sg_01
			vol = -12.5
		}
		{
			crowd_cheer_lg_ext_sg_02
			vol = -12.5
		}
		{
			crowd_cheer_lg_ext_sg_03
			vol = -12.5
		}
		{
			crowd_cheer_lg_ext_sg_04
			vol = -12.5
		}
		{
			crowd_cheer_lg_ext_sg_05
			vol = -12.5
		}
		{
			crowd_cheer_lg_ext_sg_06
			vol = -12.5
		}
		{
			crowd_cheer_lg_ext_sg_07
			vol = -12.5
		}
		{
			crowd_cheer_lg_ext_sg_08
			vol = -12.5
		}
		{
			crowd_cheer_lg_ext_sg_09
			vol = -12.5
		}
		{
			crowd_cheer_lg_ext_sg_10
			vol = -12.5
		}
		{
			crowd_cheer_lrg_ext_gr_01
			vol = -9.5
		}
		{
			crowd_cheer_lrg_ext_gr_02
			vol = -9.5
		}
		{
			crowd_cheer_lrg_ext_gr_03
			vol = -9.5
		}
		{
			crowd_cheer_lrg_ext_gr_04
			vol = -9.5
		}
		{
			crowd_cheer_lrg_ext_gr_05
			vol = -9.5
		}
		{
			crowd_cheer_lrg_ext_gr_06
			vol = -9.5
		}
		{
			crowd_cheer_lrg_ext_gr_08
			vol = -9.5
		}
		{
			crowd_cheer_lrg_ext_gr_09
			vol = -9.5
		}
		{
			crowd_cheer_lrg_ext_gr_10
			vol = -9.5
		}
		{
			ext_lg_crowd_whistle_01
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_02
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_03
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_04
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_05
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_06
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_07
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_08
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_09
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_10
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_11
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_12
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_13
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_14
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_15
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_16
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_17
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_18
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_19
			vol = -7.5
		}
		{
			ext_lg_crowd_whistle_20
			vol = -7.5
		}
	]
}
crowd_oneshot_large_int_good_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_lg_crowd_whistle_01
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_02
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_03
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_04
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_05
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_06
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_07
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_08
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_09
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_10
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_11
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_12
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_13
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_14
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_15
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_16
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_17
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_18
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_19
			vol = -6.5
		}
		{
			ext_lg_crowd_whistle_20
			vol = -6.5
		}
	]
}
crowd_oneshot_medium_ext_good_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_cheer_md_ext_sg_01
			vol = -14.5
		}
		{
			crowd_cheer_md_ext_sg_02
			vol = -14.5
		}
		{
			crowd_cheer_md_ext_sg_03
			vol = -14.5
		}
		{
			crowd_cheer_md_ext_sg_04
			vol = -14.5
		}
		{
			crowd_cheer_md_ext_sg_05
			vol = -14.5
		}
		{
			crowd_cheer_md_ext_sg_06
			vol = -14.5
		}
		{
			crowd_cheer_md_ext_sg_07
			vol = -14.5
		}
		{
			crowd_cheer_md_ext_sg_08
			vol = -14.5
		}
		{
			crowd_cheer_md_ext_sg_09
			vol = -14.5
		}
		{
			crowd_cheer_md_ext_sg_10
			vol = -14.5
		}
		{
			crowd_cheer_med_ext_gr_01
			vol = -11.5
		}
		{
			crowd_cheer_med_ext_gr_02
			vol = -11.5
		}
		{
			crowd_cheer_med_ext_gr_03
			vol = -11.5
		}
		{
			crowd_cheer_med_ext_gr_04
			vol = -11.5
		}
		{
			crowd_cheer_med_ext_gr_05
			vol = -11.5
		}
		{
			crowd_cheer_med_ext_gr_06
			vol = -11.5
		}
		{
			crowd_cheer_med_ext_gr_07
			vol = -11.5
		}
		{
			crowd_cheer_med_ext_gr_08
			vol = -11.5
		}
		{
			crowd_cheer_med_ext_gr_09
			vol = -11.5
		}
		{
			crowd_cheer_med_ext_gr_10
			vol = -11.5
		}
		{
			ext_md_crowd_whistle_01
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_02
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_03
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_04
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_05
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_06
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_07
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_08
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_09
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_10
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_11
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_12
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_13
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_14
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_15
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_16
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_17
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_18
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_19
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_20
			vol = -10.5
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
			crowd_cheer_md_ext_sg_01
			vol = -15.5
		}
		{
			crowd_cheer_md_ext_sg_02
			vol = -15.5
		}
		{
			crowd_cheer_md_ext_sg_03
			vol = -15.5
		}
		{
			crowd_cheer_md_ext_sg_04
			vol = -15.5
		}
		{
			crowd_cheer_md_ext_sg_05
			vol = -15.5
		}
		{
			crowd_cheer_md_ext_sg_06
			vol = -15.5
		}
		{
			crowd_cheer_md_ext_sg_07
			vol = -15.5
		}
		{
			crowd_cheer_md_ext_sg_08
			vol = -15.5
		}
		{
			crowd_cheer_md_ext_sg_09
			vol = -15.5
		}
		{
			crowd_cheer_md_ext_sg_10
			vol = -15.5
		}
		{
			crowd_cheer_med_ext_gr_01
			vol = -15.5
		}
		{
			crowd_cheer_med_ext_gr_02
			vol = -15.5
		}
		{
			crowd_cheer_med_ext_gr_03
			vol = -15.5
		}
		{
			crowd_cheer_med_ext_gr_04
			vol = -15.5
		}
		{
			crowd_cheer_med_ext_gr_05
			vol = -15.5
		}
		{
			crowd_cheer_med_ext_gr_06
			vol = -15.5
		}
		{
			crowd_cheer_med_ext_gr_07
			vol = -15.5
		}
		{
			crowd_cheer_med_ext_gr_08
			vol = -15.5
		}
		{
			crowd_cheer_med_ext_gr_09
			vol = -15.5
		}
		{
			crowd_cheer_med_ext_gr_10
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
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			ext_lg_crowd_whistle_01
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_02
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_03
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_04
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_05
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_06
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_07
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_08
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_09
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_10
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_11
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_12
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_13
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_14
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_15
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_16
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_17
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_18
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_19
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
		{
			ext_lg_crowd_whistle_20
			vol = -4.5
			dropoff = 6000
			dropoff_function = linear
		}
	]
}
crowd_oneshot_small_int_good_container = {
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceLimit = 2
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_cheer_sm_int_gr_01
			vol = -8.5
		}
		{
			crowd_cheer_sm_int_gr_02
			vol = -8.5
		}
		{
			crowd_cheer_sm_int_gr_03
			vol = -8.5
		}
		{
			crowd_cheer_sm_int_gr_04
			vol = -8.5
		}
		{
			crowd_cheer_sm_int_gr_05
			vol = -8.5
		}
		{
			crowd_cheer_sm_int_gr_06
			vol = -8.5
		}
		{
			crowd_cheer_sm_int_gr_07
			vol = -8.5
		}
		{
			crowd_cheer_sm_int_gr_08
			vol = -8.5
		}
		{
			crowd_cheer_sm_int_gr_09
			vol = -8.5
		}
		{
			crowd_cheer_sm_int_gr_10
			vol = -8.5
		}
		{
			crowd_cheer_sm_int_sg_01
			vol = -12.5
		}
		{
			crowd_cheer_sm_int_sg_02
			vol = -12.5
		}
		{
			crowd_cheer_sm_int_sg_03
			vol = -12.5
		}
		{
			crowd_cheer_sm_int_sg_04
			vol = -12.5
		}
		{
			crowd_cheer_sm_int_sg_05
			vol = -12.5
		}
		{
			crowd_cheer_sm_int_sg_06
			vol = -12.5
		}
		{
			crowd_cheer_sm_int_sg_07
			vol = -12.5
		}
		{
			crowd_cheer_sm_int_sg_08
			vol = -12.5
		}
		{
			crowd_cheer_sm_int_sg_09
			vol = -12.5
		}
		{
			crowd_cheer_sm_int_sg_10
			vol = -12.5
		}
		{
			int_sm_crowd_whistle_01
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_02
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_03
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_04
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_05
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_06
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_07
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_08
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_09
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_10
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_11
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_12
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_13
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_14
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_15
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_16
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_17
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_18
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_19
			vol = -10.5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_sm_crowd_whistle_20
			vol = -10.5
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
			vol = -11
		}
	]
}
guitar_lick_crowd_swell_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
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

script 0xc3a711b0 
	SoundEvent \{mic_affirmation}
endscript
mic_affirmation_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			mic_select_affirmation_01
			vol = 2
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
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -8.5
		}
		{
			crowd_clap_small_int_02
			vol = -8.5
		}
		{
			crowd_clap_small_int_03
			vol = -8.5
		}
		{
			crowd_clap_small_int_04
			vol = -8.5
		}
		{
			crowd_clap_small_int_05
			vol = -8.5
		}
		{
			crowd_clap_small_int_06
			vol = -8.5
		}
	]
}
crowd_clap_to_beat_small_int_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -16.5
		}
		{
			crowd_clap_small_int_02
			vol = -16.5
		}
		{
			crowd_clap_small_int_03
			vol = -16.5
		}
		{
			crowd_clap_small_int_04
			vol = -16.5
		}
		{
			crowd_clap_small_int_05
			vol = -16.5
		}
		{
			crowd_clap_small_int_06
			vol = -16.5
		}
	]
}
crowd_clap_to_beat_small_int_right_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -16.5
		}
		{
			crowd_clap_small_int_02
			vol = -16.5
		}
		{
			crowd_clap_small_int_03
			vol = -16.5
		}
		{
			crowd_clap_small_int_04
			vol = -16.5
		}
		{
			crowd_clap_small_int_05
			vol = -16.5
		}
		{
			crowd_clap_small_int_06
			vol = -16.5
		}
	]
}
crowd_clap_to_beat_small_int_left_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -16.5
		}
		{
			crowd_clap_small_int_02
			vol = -16.5
		}
		{
			crowd_clap_small_int_03
			vol = -16.5
		}
		{
			crowd_clap_small_int_04
			vol = -16.5
		}
		{
			crowd_clap_small_int_05
			vol = -16.5
		}
		{
			crowd_clap_small_int_06
			vol = -16.5
		}
	]
}
crowd_clap_to_beat_small_int_right_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -16.5
		}
		{
			crowd_clap_small_int_02
			vol = -16.5
		}
		{
			crowd_clap_small_int_03
			vol = -16.5
		}
		{
			crowd_clap_small_int_04
			vol = -16.5
		}
		{
			crowd_clap_small_int_05
			vol = -16.5
		}
		{
			crowd_clap_small_int_06
			vol = -16.5
		}
	]
}
crowd_clap_to_beat_small_int_left_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_small_int_01
			vol = -8.5
		}
		{
			crowd_clap_small_int_02
			vol = -8.5
		}
		{
			crowd_clap_small_int_03
			vol = -8.5
		}
		{
			crowd_clap_small_int_04
			vol = -8.5
		}
		{
			crowd_clap_small_int_05
			vol = -8.5
		}
		{
			crowd_clap_small_int_06
			vol = -8.5
		}
	]
}
crowd_clap_to_beat_medium_int_normal_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -17.5
		}
		{
			crowd_clap_medium_int_02
			vol = -17.5
		}
		{
			crowd_clap_medium_int_03
			vol = -17.5
		}
		{
			crowd_clap_medium_int_04
			vol = -17.5
		}
		{
			crowd_clap_medium_int_05
			vol = -17.5
		}
		{
			crowd_clap_medium_int_06
			vol = -17.5
		}
	]
}
crowd_clap_to_beat_medium_int_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -14.5
		}
		{
			crowd_clap_medium_int_02
			vol = -14.5
		}
		{
			crowd_clap_medium_int_03
			vol = -14.5
		}
		{
			crowd_clap_medium_int_04
			vol = -14.5
		}
		{
			crowd_clap_medium_int_05
			vol = -14.5
		}
		{
			crowd_clap_medium_int_06
			vol = -14.5
		}
	]
}
crowd_clap_to_beat_medium_int_left_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -17.5
		}
		{
			crowd_clap_medium_int_02
			vol = -17.5
		}
		{
			crowd_clap_medium_int_03
			vol = -17.5
		}
		{
			crowd_clap_medium_int_04
			vol = -17.5
		}
		{
			crowd_clap_medium_int_05
			vol = -17.5
		}
		{
			crowd_clap_medium_int_06
			vol = -17.5
		}
	]
}
crowd_clap_to_beat_medium_int_right_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -14.5
		}
		{
			crowd_clap_medium_int_02
			vol = -14.5
		}
		{
			crowd_clap_medium_int_03
			vol = -14.5
		}
		{
			crowd_clap_medium_int_04
			vol = -14.5
		}
		{
			crowd_clap_medium_int_05
			vol = -14.5
		}
		{
			crowd_clap_medium_int_06
			vol = -14.5
		}
	]
}
crowd_clap_to_beat_medium_int_left_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -17.5
		}
		{
			crowd_clap_medium_int_02
			vol = -17.5
		}
		{
			crowd_clap_medium_int_03
			vol = -17.5
		}
		{
			crowd_clap_medium_int_04
			vol = -17.5
		}
		{
			crowd_clap_medium_int_05
			vol = -17.5
		}
		{
			crowd_clap_medium_int_06
			vol = -17.5
		}
	]
}
crowd_clap_to_beat_medium_int_right_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.3
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_int_01
			vol = -17.5
		}
		{
			crowd_clap_medium_int_02
			vol = -17.5
		}
		{
			crowd_clap_medium_int_03
			vol = -17.5
		}
		{
			crowd_clap_medium_int_04
			vol = -17.5
		}
		{
			crowd_clap_medium_int_05
			vol = -17.5
		}
		{
			crowd_clap_medium_int_06
			vol = -17.5
		}
	]
}
crowd_clap_to_beat_large_ext_normal_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -11.5
		}
		{
			crowd_clap_large_ext_02
			vol = -11.5
		}
		{
			crowd_clap_large_ext_03
			vol = -11.5
		}
		{
			crowd_clap_large_ext_04
			vol = -11.5
		}
		{
			crowd_clap_large_ext_05
			vol = -11.5
		}
		{
			crowd_clap_large_ext_06
			vol = -11.5
		}
	]
}
crowd_clap_to_beat_large_ext_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -13.5
		}
		{
			crowd_clap_large_ext_02
			vol = -13.5
		}
		{
			crowd_clap_large_ext_03
			vol = -13.5
		}
		{
			crowd_clap_large_ext_04
			vol = -13.5
		}
		{
			crowd_clap_large_ext_05
			vol = -13.5
		}
		{
			crowd_clap_large_ext_06
			vol = -13.5
		}
	]
}
crowd_clap_to_beat_large_ext_right_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -13.5
		}
		{
			crowd_clap_large_ext_02
			vol = -13.5
		}
		{
			crowd_clap_large_ext_03
			vol = -13.5
		}
		{
			crowd_clap_large_ext_04
			vol = -13.5
		}
		{
			crowd_clap_large_ext_05
			vol = -13.5
		}
		{
			crowd_clap_large_ext_06
			vol = -13.5
		}
	]
}
crowd_clap_to_beat_large_ext_left_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -13.5
		}
		{
			crowd_clap_large_ext_02
			vol = -13.5
		}
		{
			crowd_clap_large_ext_03
			vol = -13.5
		}
		{
			crowd_clap_large_ext_04
			vol = -13.5
		}
		{
			crowd_clap_large_ext_05
			vol = -13.5
		}
		{
			crowd_clap_large_ext_06
			vol = -13.5
		}
	]
}
crowd_clap_to_beat_large_ext_right_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -13.5
		}
		{
			crowd_clap_large_ext_02
			vol = -13.5
		}
		{
			crowd_clap_large_ext_03
			vol = -13.5
		}
		{
			crowd_clap_large_ext_04
			vol = -13.5
		}
		{
			crowd_clap_large_ext_05
			vol = -13.5
		}
		{
			crowd_clap_large_ext_06
			vol = -13.5
		}
	]
}
crowd_clap_to_beat_large_ext_left_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_large_ext_01
			vol = -13.5
		}
		{
			crowd_clap_large_ext_02
			vol = -13.5
		}
		{
			crowd_clap_large_ext_03
			vol = -13.5
		}
		{
			crowd_clap_large_ext_04
			vol = -13.5
		}
		{
			crowd_clap_large_ext_05
			vol = -13.5
		}
		{
			crowd_clap_large_ext_06
			vol = -13.5
		}
	]
}
crowd_clap_to_beat_medium_ext_normal_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -10.5
		}
		{
			crowd_clap_medium_ext_02
			vol = -10.5
		}
		{
			crowd_clap_medium_ext_03
			vol = -10.5
		}
		{
			crowd_clap_medium_ext_04
			vol = -10.5
		}
		{
			crowd_clap_medium_ext_05
			vol = -10.5
		}
		{
			crowd_clap_medium_ext_06
			vol = -10.5
		}
	]
}
crowd_clap_to_beat_medium_ext_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_02
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_03
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_04
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_05
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_06
			vol = -12.5
		}
	]
}
crowd_clap_to_beat_medium_ext_left_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_02
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_03
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_04
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_05
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_06
			vol = -12.5
		}
	]
}
crowd_clap_to_beat_medium_ext_right_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_02
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_03
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_04
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_05
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_06
			vol = -12.5
		}
	]
}
crowd_clap_to_beat_medium_ext_left_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_02
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_03
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_04
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_05
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_06
			vol = -12.5
		}
	]
}
crowd_clap_to_beat_medium_ext_right_middle_container = {
	Default_Buss = Crowd_Star_Power
	NoRepeatFor = 0.02
	InstanceLimit = 6
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_02
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_03
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_04
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_05
			vol = -12.5
		}
		{
			crowd_clap_medium_ext_06
			vol = -12.5
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
			vol = 1
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
			vol = 3
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
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
	Default_Buss = Front_End
	NoRepeatFor = 0.01
	InstanceLimit = 6
	Randomness = None
}
ghtunes_ui_select_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
	Randomness = None
	Sounds = [
		{
			ghtunes_select
		}
	]
}
ghtunes_ui_back_container = {
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceLimit = 1
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
			vol = -4
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
			menu_entername_finish_01
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
			vol = 3
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
			menu_entername_finish_01
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
			vol = 6
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
			vol = 6
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
			vol = 6
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
			vol = -9
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
