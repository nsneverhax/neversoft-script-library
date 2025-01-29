eruption_intro_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			eruption_intro
			vol = 9
		}
	]
}
eddie_chant_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			eddie_chant
			vol = 9
		}
	]
}
pyro_large_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			pyro_large
			vol = 9
		}
	]
}
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
			vol = 1
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
			vol = 1
			pan1x = -1
			pan1y = 1
			pan2x = -0.5141509
			pan2y = 1
			panremovecenter = true
		}
		{
			sp_awarded2
			vol = 3
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
			vol = 1
			pan1x = 0.4669811
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
		{
			sp_awarded2
			vol = 3
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
			vol = 1
			pan1x = -0.45283026
			pan1y = 1
			pan2x = 0.45283026
			pan2y = 1
			panremovecenter = true
		}
		{
			sp_awarded2
			vol = 3
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = Obj_PlaySound
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
ui_sfx_select_container = {
	Default_Priority = 90
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
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
			ext_lg_crowd_applause_l_01
		}
		{
			ext_lg_crowd_applause_l_02
		}
		{
			ext_lg_crowd_applause_r_01
		}
		{
			ext_lg_crowd_applause_r_02
		}
		{
			ext_lg_crowd_bad_loop_bk
		}
		{
			ext_lg_crowd_bad_loop_bl
		}
		{
			ext_lg_crowd_bad_loop_br
		}
		{
			ext_lg_crowd_bad_loop_fl
		}
		{
			ext_lg_crowd_bad_loop_fr
		}
		{
			ext_lg_crowd_bad_loop_ft
		}
		{
			ext_lg_crowd_good_loop_bk
		}
		{
			ext_lg_crowd_good_loop_bl
		}
		{
			ext_lg_crowd_good_loop_br
		}
		{
			ext_lg_crowd_good_loop_fl
		}
		{
			ext_lg_crowd_good_loop_fr
		}
		{
			ext_lg_crowd_good_loop_ft
		}
		{
			ext_lg_crowd_neutral_loop_bk
		}
		{
			ext_lg_crowd_neutral_loop_bl
		}
		{
			ext_lg_crowd_neutral_loop_br
		}
		{
			ext_lg_crowd_neutral_loop_fl
		}
		{
			ext_lg_crowd_neutral_loop_fr
		}
		{
			ext_lg_crowd_neutral_loop_ft
		}
		{
			ext_lg_crowd_swell_lg_l_01
		}
		{
			ext_lg_crowd_swell_lg_r_01
		}
		{
			ext_lg_crowd_swell_md_l_01
		}
		{
			ext_lg_crowd_swell_md_r_01
		}
		{
			ext_lg_crowd_swell_sh_l_01
		}
		{
			ext_lg_crowd_swell_sh_r_01
		}
		{
			ext_lg_crowd_whistle_01
		}
		{
			ext_lg_crowd_whistle_02
		}
		{
			ext_lg_crowd_whistle_03
		}
		{
			ext_lg_crowd_whistle_04
		}
		{
			ext_lg_crowd_whistle_05
		}
		{
			ext_lg_crowd_whistle_06
		}
		{
			ext_lg_crowd_whistle_07
		}
		{
			ext_lg_crowd_whistle_08
		}
		{
			ext_lg_crowd_whistle_09
		}
		{
			ext_lg_crowd_whistle_10
		}
		{
			ext_lg_crowd_whistle_11
		}
		{
			ext_lg_crowd_whistle_12
		}
		{
			ext_lg_crowd_whistle_13
		}
		{
			ext_lg_crowd_whistle_14
		}
		{
			ext_lg_crowd_whistle_15
		}
		{
			ext_lg_crowd_whistle_16
		}
		{
			ext_lg_crowd_whistle_17
		}
		{
			ext_lg_crowd_whistle_18
		}
		{
			ext_lg_crowd_whistle_19
		}
		{
			ext_lg_crowd_whistle_20
		}
		{
			ext_md_crowd_bad_loop_bk
		}
		{
			ext_md_crowd_bad_loop_ft
		}
		{
			ext_md_crowd_good_loop_bk
		}
		{
			ext_md_crowd_good_loop_ft
		}
		{
			ext_md_crowd_neutral_loop_bk
		}
		{
			ext_md_crowd_neutral_loop_ft
		}
		{
			int_md_crowd_bad_loop_bk
		}
		{
			int_md_crowd_bad_loop_ft
		}
		{
			int_md_crowd_good_loop_bk
		}
		{
			int_md_crowd_good_loop_ft
		}
		{
			int_md_crowd_neutral_loop_bk
		}
		{
			int_md_crowd_neutral_loop_ft
		}
		{
			int_sm_crowd_bad_loop_bk
		}
		{
			int_sm_crowd_bad_loop_ft
		}
		{
			int_sm_crowd_good_loop_bk
		}
		{
			int_sm_crowd_good_loop_ft
		}
		{
			int_sm_crowd_neutral_loop_bk
		}
		{
			int_sm_crowd_neutral_loop_ft
		}
		{
			large_ext_encore_crowd
		}
		{
			last_venue_fireworks
		}
		{
			lg_crowd_bad_to_neutral_01
		}
		{
			lg_crowd_bad_to_neutral_bl_01
		}
		{
			lg_crowd_bad_to_neutral_br_01
		}
		{
			lg_crowd_bad_to_neutral_fl_01
		}
		{
			lg_crowd_bad_to_neutral_fr_01
		}
		{
			lg_crowd_bad_to_neutral_l_01
		}
		{
			lg_crowd_bad_to_neutral_r_01
		}
		{
			lg_crowd_good_to_neutral_01
		}
		{
			lg_crowd_neutral_to_bad_01
		}
		{
			lg_crowd_neutral_to_bad_bl_01
		}
		{
			lg_crowd_neutral_to_bad_br_01
		}
		{
			lg_crowd_neutral_to_bad_fl_01
		}
		{
			lg_crowd_neutral_to_bad_fr_01
		}
		{
			lg_crowd_neutral_to_bad_l_01
		}
		{
			lg_crowd_neutral_to_bad_r_01
		}
		{
			lg_crowd_neutral_to_good_01
		}
		{
			lg_crowd_neutral_to_good_bl_01
		}
		{
			lg_crowd_neutral_to_good_br_01
		}
		{
			lg_crowd_neutral_to_good_fl_01
		}
		{
			lg_crowd_neutral_to_good_fr_01
		}
		{
			lg_crowd_neutral_to_good_l_01
		}
		{
			lg_crowd_neutral_to_good_l_02
		}
		{
			lg_crowd_neutral_to_good_r_01
		}
		{
			lg_crowd_neutral_to_good_r_02
		}
		{
			lrg_crowd_bad_to_neutral_l_01
		}
		{
			lrg_crowd_bad_to_neutral_r_01
		}
		{
			lrg_crowd_good_to_neutral_l_01
		}
		{
			lrg_crowd_good_to_neutral_r_01
		}
		{
			lrg_crowd_neutral_to_bad_l_01
		}
		{
			lrg_crowd_neutral_to_bad_r_01
		}
		{
			lrg_crowd_neutral_to_good_l_01
		}
		{
			lrg_crowd_neutral_to_good_r_01
		}
		{
			md_crowd_bad_to_neutral_01
		}
		{
			md_crowd_good_to_neutral_01
		}
		{
			md_crowd_neutral_to_bad_02
		}
		{
			md_crowd_neutral_to_good_01
		}
		{
			medium_ext_encore_crowd
		}
		{
			medium_int_encore_crowd
		}
		{
			pinknoise_minnus_20
		}
		{
			Silence_Front_End_Crowd_Loop
		}
		{
			sm_crowd_bad_to_neutral_01
		}
		{
			sm_crowd_good_to_neutral_03
		}
		{
			sm_crowd_neutral_to_bad_03
		}
		{
			sm_crowd_neutral_to_good_03
		}
		{
			small_int_encore_crowd
		}
		{
			testtones_backupvocals
		}
		{
			testtones_band
		}
		{
			testtones_bass
		}
		{
			testtones_crowd
		}
		{
			testtones_cymbals
		}
		{
			testtones_guitar
		}
		{
			testtones_kickdrum
		}
		{
			testtones_leadvocals
		}
		{
			testtones_snaredrum
		}
		{
			testtones_toms
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
crowd_swell_short_large_ext_l_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_sh_l_01
			vol = 4
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_large_ext_r_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_sh_r_01
			vol = 4
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
intro_cheer_l_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			ext_lg_crowd_swell_sh_l_01
			vol = 0
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
		{
			ext_lg_crowd_swell_sh_l_02
			vol = 0
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
		{
			ext_lg_crowd_swell_sh_l_03
			vol = 0
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
intro_cheer_r_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			ext_lg_crowd_swell_sh_r_01
			vol = 0
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.24000001
		}
		{
			ext_lg_crowd_swell_sh_r_02
			vol = 0
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.24000001
		}
		{
			ext_lg_crowd_swell_sh_r_03
			vol = 0
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_soft_large_ext_l_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_sh_l_01
			vol = -7
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_soft_large_ext_r_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_sh_r_01
			vol = -7
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_med_large_ext_l_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_md_l_01
			vol = -7
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_med_large_ext_r_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_md_r_01
			vol = -7
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_long_large_ext_l_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_md_l_01
			vol = -7
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_long_large_ext_r_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Cheers
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_md_r_01
			vol = -7
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
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
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			Crowd_Boo_Sm_01
			pan1x = 0.61
			pan1y = -1.0
			RandomVol = {
				Type = RandomRangeType
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
				Type = RandomRangeType
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
				Type = RandomRangeType
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
				Type = RandomRangeType
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
				Type = RandomRangeType
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
				Type = RandomRangeType
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
				Type = RandomRangeType
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
				Type = RandomRangeType
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
				Type = RandomRangeType
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
				Type = RandomRangeType
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
	Default_Buss = Front_End
	NoRepeatFor = 2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomType
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
crowd_battle_cheer_large_ext_l_p1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_sh_l_01
			vol = 0
			pan1x = -1.0
			pan1y = 0.59
		}
	]
}
crowd_battle_cheer_large_ext_r_p1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_sh_r_01
			vol = 0
			pan1x = -0.5
			pan1y = 1.0
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_large_ext_l_p2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_sh_l_01
			vol = 0
			pan1x = 0.52
			pan1y = 1.0
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_large_ext_r_p2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_swell_sh_r_01
			vol = 0
			pan1x = 1.0
			pan1y = 0.57
		}
	]
}
crowd_battle_cheer_medium_ext_l_p1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_sh_l_01
			vol = 5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.59
		}
	]
}
crowd_battle_cheer_medium_ext_r_p1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_sh_r_01
			vol = 5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -0.5
			pan1y = 1.0
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_medium_ext_l_p2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_sh_l_01
			vol = 5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 0.52
			pan1y = 1.0
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_medium_ext_r_p2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_sh_r_01
			vol = 5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.57
		}
	]
}
crowd_battle_cheer_medium_int_l_p1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_sh_l_02
			vol = 2
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.59
		}
	]
}
crowd_battle_cheer_medium_int_r_p1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_sh_r_02
			vol = 2
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -0.5
			pan1y = 1.0
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_medium_int_l_p2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_sh_l_02
			vol = 2
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 0.52
			pan1y = 1.0
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_medium_int_r_p2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_sh_r_02
			vol = 2
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.57
		}
	]
}
crowd_battle_cheer_small_int_l_p1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_sh_l_03
			vol = 2
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.59
		}
	]
}
crowd_battle_cheer_small_int_r_p1_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_sh_r_03
			vol = 2
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -0.5
			pan1y = 1.0
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_small_int_l_p2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_sh_l_03
			vol = 2
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 0.52
			pan1y = 1.0
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_small_int_r_p2_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_sh_r_03
			vol = 2
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.57
		}
	]
}
crowd_transition_large_ext_good_to_med_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_good_to_neutral_01
			vol = 3
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_large_ext_good_to_med_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_good_to_neutral_01
			vol = 3
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_large_ext_good_to_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_good_to_neutral_01
			vol = 3
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_large_ext_med_to_good_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_good_01
			vol = 0
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_large_ext_med_to_good_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_good_01
			vol = 0
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_large_ext_med_to_good_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_neutral_to_good_01
			vol = 0
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
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
crowd_transition_large_ext_med_to_poor_container = {
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
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_large_ext_poor_to_med_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_bad_to_neutral_01
			vol = 12
			pan1x = -1.0
			pan1y = 1.0
			pan2x = -0.5
			pan2y = 1.0
		}
	]
}
crowd_transition_large_ext_poor_to_med_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_bad_to_neutral_01
			vol = 12
			pan1x = 0.5
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
	]
}
crowd_transition_large_ext_poor_to_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			lg_crowd_bad_to_neutral_01
			vol = 12
			pan1x = -1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		}
	]
}
crowd_transition_medium_ext_good_to_med_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_good_to_neutral_01
			vol = 0.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_good_to_med_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_good_to_neutral_01
			vol = 0.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_good_to_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_good_to_neutral_01
			vol = 0.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_good_to_med_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_good_to_neutral_01
			vol = -2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_good_to_med_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_good_to_neutral_01
			vol = -2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_good_to_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_good_to_neutral_01
			vol = -2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_med_to_good_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_good_01
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_med_to_good_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_good_01
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_med_to_good_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_good_01
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_med_to_good_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_good_01
			vol = 2.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_med_to_good_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_good_01
			vol = 2.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_med_to_good_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_neutral_to_good_01
			vol = 2.5
			pan1x = -1.0
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
crowd_transition_medium_int_med_to_poor_l_container = {
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
			vol = -1.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_med_to_poor_r_container = {
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
			vol = -1.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_med_to_poor_container = {
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
			vol = -1.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_poor_to_med_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_bad_to_neutral_01
			vol = 12
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_poor_to_med_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_bad_to_neutral_01
			vol = 12
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_poor_to_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_bad_to_neutral_01
			vol = 12
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_poor_to_med_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_bad_to_neutral_01
			vol = 8
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_poor_to_med_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_bad_to_neutral_01
			vol = 8
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_poor_to_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			md_crowd_bad_to_neutral_01
			vol = 8
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_good_to_med_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_good_to_neutral_03
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_good_to_med_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_good_to_neutral_03
			vol = 2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_good_to_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_good_to_neutral_03
			vol = 2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_poor_to_med_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_bad_to_neutral_01
			vol = 6
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_poor_to_med_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_bad_to_neutral_01
			vol = 6
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_poor_to_med_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_bad_to_neutral_01
			vol = 6
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_med_to_good_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_good_03
			vol = 3
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_med_to_good_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_good_03
			vol = 3
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_med_to_good_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.2
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sm_crowd_neutral_to_good_03
			vol = 3
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
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
crowd_swell_long_medium_ext_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_lg_l_02
			vol = -3
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_long_medium_ext_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_lg_r_02
			vol = -3
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_long_medium_int_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_lg_l_01
			vol = -5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_long_medium_int_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_lg_r_01
			vol = -5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_long_small_int_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_lg_l_02
			vol = -4
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_long_small_int_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_lg_r_02
			vol = -4
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_med_medium_ext_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_md_l_02
			vol = 0
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_med_medium_ext_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_md_r_02
			vol = 0
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_med_medium_int_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_md_l_02
			vol = -3
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_med_medium_int_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_md_r_02
			vol = -3
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_med_small_int_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_md_l_01
			vol = -4
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_med_small_int_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_md_r_01
			vol = -4
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_short_medium_ext_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_sh_l_01
			vol = 6
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_medium_ext_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_sh_r_01
			vol = 6
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_short_soft_medium_ext_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_sh_l_01
			vol = -5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_soft_medium_ext_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_swell_sh_r_01
			vol = -5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_short_medium_int_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_sh_l_02
			vol = 4.5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_medium_int_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_sh_r_02
			vol = 4.5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_short_soft_medium_int_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_sh_l_02
			vol = -5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_soft_medium_int_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_swell_sh_r_02
			vol = -5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_short_small_int_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_sh_l_03
			vol = 4
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_small_int_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_sh_r_03
			vol = 4
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
		}
	]
}
crowd_swell_short_soft_small_int_l_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_sh_l_03
			vol = -6
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_soft_small_int_r_container = {
	Default_Priority = 90
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_swell_sh_r_03
			vol = -6
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 0.56
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
			vol = -1.93
		}
		{
			Checkbox_SFX
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
			vol = 0
		}
	]
}
UI_SFX_Lose_Multiplier_2X_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			Checkbox_SFX
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
POW_SFX_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 4
	Command = PlaySound
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			CheckBox_Check_SFX
			vol = -1.93
		}
	]
}
checkbox_check_2_sfx_container = {
	Default_Priority = 80
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			checkbox_check_sfx_2
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
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.5
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
crowd_applause_large_ext_l_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_applause_l_01
			vol = -1
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 1.0
		}
	]
}
crowd_applause_large_ext_r_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_lg_crowd_applause_r_01
			vol = -1
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 1.0
		}
	]
}
crowd_applause_medium_ext_l_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_applause_l_02
			vol = -3
			pan1x = -1.0
			pan1y = 1.0
		}
	]
}
crowd_applause_medium_ext_r_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ext_md_crowd_applause_r_02
			vol = -3
			pan1x = 1
			pan1y = 1
		}
	]
}
crowd_applause_medium_int_l_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_applause_l_02
			vol = -6
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 1.0
		}
	]
}
crowd_applause_medium_int_r_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_md_crowd_applause_r_02
			vol = -6
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = 1.0
			pan1y = 1.0
		}
	]
}
crowd_applause_small_int_l_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_applause_l_01
			vol = -9
			pan1x = -1
			pan1y = 1
		}
	]
}
crowd_applause_small_int_r_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			int_sm_crowd_applause_r_01
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
GH3_Star_FlyIn_container = {
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
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
	Default_Buss = Default
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = None
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
			vol = -4
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
			lfe_vol = -7
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
			vol = -7
			pan1x = -1
			pan1y = 0.9811321
			pan2x = 1
			pan2y = 1
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
			vol = -6
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
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
			vol = 2
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
			vol = 2
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
			vol = -7
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
			vol = -8
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
			vol = -7
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
			vol = -7
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
			vol = -7
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
			vol = -7
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
			vol = 2
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
			vol = -7
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
			lfe_vol = -9
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
crowd_whistle_medium_ext_good_01_container = {
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
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_02
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_03
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_04
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_05
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_06
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_07
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_08
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_09
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_10
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_11
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_12
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_13
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_14
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_15
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_16
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_17
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_18
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_19
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_20
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_whistle_medium_int_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 10
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			int_md_crowd_whistle_01
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_02
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_03
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_04
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_05
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_06
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_07
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_08
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_09
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_10
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_11
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_12
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_13
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_14
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_15
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_16
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_17
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_18
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_19
			vol = -5
			dropoff = 50
			dropoff_function = linear
		}
		{
			int_md_crowd_whistle_20
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
			crowd_cheer_lg_ext_sg_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_01
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_02
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_03
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_04
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_05
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_06
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_07
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_08
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_09
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_10
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_11
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_12
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_13
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_14
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_15
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_16
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_17
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_18
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_19
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
		}
		{
			ext_lg_crowd_whistle_20
			pan1randomleft = 34.01935
			pan1randomright = 322.37378
			vol = -7
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
			crowd_cheer_md_ext_sg_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_md_ext_sg_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_md_ext_sg_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_md_ext_sg_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_md_ext_sg_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_md_ext_sg_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_md_ext_sg_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_md_ext_sg_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_md_ext_sg_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_md_ext_sg_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_med_ext_gr_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_med_ext_gr_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_med_ext_gr_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_med_ext_gr_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_med_ext_gr_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_med_ext_gr_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_med_ext_gr_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_med_ext_gr_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_med_ext_gr_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			crowd_cheer_med_ext_gr_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_01
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_02
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_03
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_04
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_05
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_06
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_07
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_08
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_09
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_10
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_11
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_12
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_13
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_14
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_15
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_16
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_17
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_18
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_19
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
		{
			ext_md_crowd_whistle_20
			vol = -7
			pan1randomleft = 37.568592
			pan1randomright = 321.76624
		}
	]
}
crowd_oneshot_medium_ext_good_01_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_cheer_md_ext_sg_01
			vol = -12
		}
		{
			crowd_cheer_md_ext_sg_02
			vol = -12
		}
		{
			crowd_cheer_md_ext_sg_03
			vol = -12
		}
		{
			crowd_cheer_md_ext_sg_04
			vol = -12
		}
		{
			crowd_cheer_md_ext_sg_05
			vol = -12
		}
		{
			crowd_cheer_md_ext_sg_06
			vol = -12
		}
		{
			crowd_cheer_md_ext_sg_07
			vol = -12
		}
		{
			crowd_cheer_md_ext_sg_08
			vol = -12
		}
		{
			crowd_cheer_md_ext_sg_09
			vol = -12
		}
		{
			crowd_cheer_md_ext_sg_10
			vol = -12
		}
		{
			crowd_cheer_med_ext_gr_01
			vol = -12
		}
		{
			crowd_cheer_med_ext_gr_02
			vol = -12
		}
		{
			crowd_cheer_med_ext_gr_03
			vol = -12
		}
		{
			crowd_cheer_med_ext_gr_04
			vol = -12
		}
		{
			crowd_cheer_med_ext_gr_05
			vol = -12
		}
		{
			crowd_cheer_med_ext_gr_06
			vol = -12
		}
		{
			crowd_cheer_med_ext_gr_07
			vol = -12
		}
		{
			crowd_cheer_med_ext_gr_08
			vol = -12
		}
		{
			crowd_cheer_med_ext_gr_09
			vol = -12
		}
		{
			crowd_cheer_med_ext_gr_10
			vol = -12
		}
		{
			ext_md_crowd_whistle_01
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_02
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_03
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_04
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_05
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_06
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_07
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_08
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_09
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_10
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_11
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_12
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_13
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_14
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_15
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_16
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_17
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_18
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_19
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
		{
			ext_md_crowd_whistle_20
			vol = -12
			dropoff = 50
			dropoff_function = linear
		}
	]
}
crowd_oneshot_medium_int_good_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_cheer_md_int_sg_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			int_md_crowd_whistle_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_11
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_12
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_13
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_14
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_15
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_16
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_17
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_18
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_19
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			int_md_crowd_whistle_20
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
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
			crowd_cheer_sm_int_gr_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_01
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_02
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_03
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_04
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_05
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_06
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_07
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_08
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_09
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_10
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_11
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_12
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_13
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_14
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_15
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_16
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_17
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_18
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_19
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
		{
			int_sm_crowd_whistle_20
			vol = -9
			pan1randomleft = 39.59621
			pan1randomright = 321.3402
		}
	]
}
crowd_oneshot_large_ext_bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_boo_grp_large_ext_01
			vol = -1
		}
		{
			crowd_boo_grp_large_ext_02
			vol = -1
		}
		{
			crowd_boo_grp_large_ext_03
			vol = -1
		}
		{
			crowd_boo_grp_large_ext_04
			vol = -1
		}
		{
			crowd_boo_grp_large_ext_05
			vol = -1
		}
		{
			crowd_boo_grp_large_ext_06
			vol = -1
		}
		{
			crowd_boo_grp_large_ext_07
			vol = -1
		}
		{
			crowd_boo_grp_large_ext_08
			vol = -1
		}
		{
			crowd_boo_grp_large_ext_09
			vol = -1
		}
		{
			crowd_boo_grp_large_ext_10
			vol = -1
		}
		{
			crowd_boo_lrg_outdoor_sg_01
			vol = -1
		}
		{
			crowd_boo_lrg_outdoor_sg_02
			vol = -1
		}
		{
			crowd_boo_lrg_outdoor_sg_03
			vol = -1
		}
		{
			crowd_boo_lrg_outdoor_sg_04
			vol = -1
		}
		{
			crowd_boo_lrg_outdoor_sg_05
			vol = -1
		}
		{
			crowd_boo_lrg_outdoor_sg_06
			vol = -1
		}
		{
			crowd_boo_lrg_outdoor_sg_07
			vol = -1
		}
		{
			crowd_boo_lrg_outdoor_sg_08
			vol = -1
		}
		{
			crowd_boo_lrg_outdoor_sg_09
			vol = -1
		}
		{
			crowd_boo_lrg_outdoor_sg_10
			vol = -1
		}
	]
}
crowd_oneshot_large_int_bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
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
crowd_oneshot_medium_ext_bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_boo_grp_medium_ext_01
			vol = 2
		}
		{
			crowd_boo_grp_medium_ext_02
			vol = 2
		}
		{
			crowd_boo_grp_medium_ext_03
			vol = 2
		}
		{
			crowd_boo_grp_medium_ext_04
			vol = 2
		}
		{
			crowd_boo_grp_medium_ext_05
			vol = 2
		}
		{
			crowd_boo_grp_medium_ext_06
			vol = 2
		}
		{
			crowd_boo_grp_medium_ext_07
			vol = 2
		}
		{
			crowd_boo_grp_medium_ext_08
			vol = 2
		}
		{
			crowd_boo_grp_medium_ext_09
			vol = 2
		}
		{
			crowd_boo_grp_medium_ext_10
			vol = 2
		}
		{
			crowd_boo_med_outdoor_sg_01
			vol = 2
		}
		{
			crowd_boo_med_outdoor_sg_02
			vol = 2
		}
		{
			crowd_boo_med_outdoor_sg_03
			vol = 2
		}
		{
			crowd_boo_med_outdoor_sg_04
			vol = 2
		}
		{
			crowd_boo_med_outdoor_sg_05
			vol = 2
		}
		{
			crowd_boo_med_outdoor_sg_06
			vol = 2
		}
		{
			crowd_boo_med_outdoor_sg_07
			vol = 2
		}
		{
			crowd_boo_med_outdoor_sg_08
			vol = 2
		}
		{
			crowd_boo_med_outdoor_sg_09
			vol = 2
		}
		{
			crowd_boo_med_outdoor_sg_10
			vol = 2
		}
	]
}
crowd_oneshot_medium_int_bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_boo_grp_medium_int_01
			vol = 3
		}
		{
			crowd_boo_grp_medium_int_02
			vol = 3
		}
		{
			crowd_boo_grp_medium_int_03
			vol = 3
		}
		{
			crowd_boo_grp_medium_int_04
			vol = 3
		}
		{
			crowd_boo_grp_medium_int_05
			vol = 3
		}
		{
			crowd_boo_grp_medium_int_06
			vol = 3
		}
		{
			crowd_boo_grp_medium_int_07
			vol = 3
		}
		{
			crowd_boo_grp_medium_int_08
			vol = 3
		}
		{
			crowd_boo_grp_medium_int_09
			vol = 3
		}
		{
			crowd_boo_grp_medium_int_10
			vol = 3
		}
		{
			crowd_boo_med_indoor_sg_01
			vol = 3
		}
		{
			crowd_boo_med_indoor_sg_02
			vol = 3
		}
		{
			crowd_boo_med_indoor_sg_03
			vol = 3
		}
		{
			crowd_boo_med_indoor_sg_04
			vol = 3
		}
		{
			crowd_boo_med_indoor_sg_05
			vol = 3
		}
		{
			crowd_boo_med_indoor_sg_06
			vol = 3
		}
		{
			crowd_boo_med_indoor_sg_07
			vol = 3
		}
		{
			crowd_boo_med_indoor_sg_08
			vol = 3
		}
		{
			crowd_boo_med_indoor_sg_09
			vol = 3
		}
		{
			crowd_boo_med_indoor_sg_10
			vol = 3
		}
	]
}
crowd_oneshot_small_ext_bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
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
crowd_oneshot_small_int_bad_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 3
	InstanceManagement = ignore
	InstanceLimit = 2
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_boo_grp_small_int_01
			vol = -1
		}
		{
			crowd_boo_grp_small_int_02
			vol = -1
		}
		{
			crowd_boo_grp_small_int_03
			vol = -1
		}
		{
			crowd_boo_grp_small_int_04
			vol = -1
		}
		{
			crowd_boo_grp_small_int_05
			vol = -1
		}
		{
			crowd_boo_grp_small_int_06
			vol = -1
		}
		{
			crowd_boo_grp_small_int_07
			vol = -1
		}
		{
			crowd_boo_grp_small_int_08
			vol = -1
		}
		{
			crowd_boo_grp_small_int_09
			vol = -1
		}
		{
			crowd_boo_grp_small_int_10
			vol = -1
		}
		{
			crowd_boo_sm_indoor_sg_01
			vol = -1
		}
		{
			crowd_boo_sm_indoor_sg_02
			vol = -1
		}
		{
			crowd_boo_sm_indoor_sg_03
			vol = -1
		}
		{
			crowd_boo_sm_indoor_sg_04
			vol = -1
		}
		{
			crowd_boo_sm_indoor_sg_05
			vol = -1
		}
		{
			crowd_boo_sm_indoor_sg_06
			vol = -1
		}
		{
			crowd_boo_sm_indoor_sg_07
			vol = -1
		}
		{
			crowd_boo_sm_indoor_sg_08
			vol = -1
		}
		{
			crowd_boo_sm_indoor_sg_09
			vol = -1
		}
		{
			crowd_boo_sm_indoor_sg_10
			vol = -1
		}
	]
}
large_ext_crowd_positive_swell_layer_container = {
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
			vol = 8
		}
		{
			ext_lg_crowd_whistle_02
			vol = 8
		}
		{
			ext_lg_crowd_whistle_03
			vol = 8
		}
		{
			ext_lg_crowd_whistle_04
			vol = 8
		}
		{
			ext_lg_crowd_whistle_05
			vol = 8
		}
		{
			ext_lg_crowd_whistle_06
			vol = 8
		}
		{
			ext_lg_crowd_whistle_07
			vol = 8
		}
		{
			ext_lg_crowd_whistle_08
			vol = 8
		}
		{
			ext_lg_crowd_whistle_09
			vol = 8
		}
		{
			ext_lg_crowd_whistle_10
			vol = 8
		}
		{
			ext_lg_crowd_whistle_11
			vol = 8
		}
		{
			ext_lg_crowd_whistle_12
			vol = 8
		}
		{
			ext_lg_crowd_whistle_13
			vol = 8
		}
		{
			ext_lg_crowd_whistle_14
			vol = 8
		}
		{
			ext_lg_crowd_whistle_15
			vol = 8
		}
		{
			ext_lg_crowd_whistle_16
			vol = 8
		}
		{
			ext_lg_crowd_whistle_17
			vol = 8
		}
		{
			ext_lg_crowd_whistle_18
			vol = 8
		}
		{
			ext_lg_crowd_whistle_19
			vol = 8
		}
		{
			ext_lg_crowd_whistle_20
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
			fj_b_fretnoise_s_01
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
			fj_b_fretnoise_s_02
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
			fj_b_fretnoise_s_03
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
			fj_b_fretnoise_m_01
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
			fj_b_fretnoise_m_02
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
			fj_b_fretnoise_m_03
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			song_affirmation_01
			vol = -6
		}
		{
			song_affirmation_02
			vol = -3
		}
		{
			song_affirmation_03
			vol = -3
		}
		{
			song_affirmation_04
			vol = -3
		}
		{
			song_affirmation_05
			vol = -3
		}
		{
			song_affirmation_06
			vol = -3
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
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -2
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -2
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
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -5
			pan1x = -0.32547173
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -5
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
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -5
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -5
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
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = -0.29716977
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -5
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
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -5
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -5
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
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			crowd_clap_small_int_02
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			crowd_clap_small_int_03
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			crowd_clap_small_int_04
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			crowd_clap_small_int_05
			vol = -5
			pan1x = -1
			pan1y = 0
			pan2x = 0.24528301
			pan2y = 0
		}
		{
			crowd_clap_small_int_06
			vol = -5
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
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -2.5
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
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -5.5
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -5.5
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
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -5.5
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
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -5.5
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -5.5
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
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -5.5
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
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_02
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_03
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_04
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_05
			vol = -5.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_int_06
			vol = -5.5
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
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -2.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -2.5
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
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -5.5
			pan1x = -0.4150943
			pan1y = 0
			pan2x = 0.3207547
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -5.5
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
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -5.5
			pan1x = 0.20754719
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -5.5
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
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -5.5
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
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -5.5
			pan1x = -0.3773585
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -5.5
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
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -5.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.2830189
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -5.5
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
			vol = -4.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -4.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -4.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -4.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -4.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -4.5
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
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -7.5
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 0.31132078
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -7.5
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
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = -0.3773585
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -7.5
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
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -7.5
			pan1x = 0.2830189
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -7.5
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
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 0.26886788
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -7.5
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
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -7.5
			pan1x = -0.3679245
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -7.5
			pan1x = -0.3679245
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
			vol = -6
		}
	]
}
audio_options_fader_end_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.5
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_select_negative
			vol = -1
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
crowd_reaction_bad_l_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 15
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			crowd_reaction_bad_l
			vol = 4
			pan1x = -1.0
			pan1y = 1.0
		}
	]
}
crowd_reaction_bad_r_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 15
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			crowd_reaction_bad_r
			vol = 4
			pan1x = 1.0
			pan1y = 1.0
		}
	]
}
starttesttones_sine_container = {
	Default_Priority = 75
	Default_Buss = Master
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
}
starttesttones_pink_container = {
	Default_Priority = 75
	Default_Buss = Master
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
			menu_options_sound_fader_move
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
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_options_sound_dolbydigitaldisable
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
			menu_options_sound_select
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
			menu_options_sound_back
			vol = -5
		}
	]
}
menu_headtohead_zoomout_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_zoomout_headtohead
		}
	]
}
gigboard_zoom_left_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_gigboard_camerapan_left
			vol = -11
		}
	]
}
boss_battle_press_sound_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_gigboard_camerapan_left
			vol = 0
		}
	]
}
gigboard_zoom_right_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_gigboard_camerapan_right
			vol = -11
		}
	]
}
menu_career_zoomin_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_zoomin_career
			vol = -4
		}
	]
}
menu_career_zoomout_container = {
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
			vol = 0
		}
	]
}
menu_options_zoomout_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_zoomout_options
			vol = -7
		}
	]
}
menu_options_zoomin_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_zoomin_options
			vol = -2
		}
	]
}
menu_headtohead_zoomin_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_zoomin_headtohead
			vol = -4
		}
	]
}
colorwheel_rotate_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_rotate
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
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_1
		}
	]
}
colorwheel_selectcolor_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
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
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_selectpie
		}
	]
}
colorwheel_choosepie_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_selectpie
		}
	]
}
colorwheel_focuspie_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_selectpie
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			menu_entername_scroll_2
			vol = -1
		}
		{
			menu_entername_scroll_3
			vol = -1
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
			menu_entername_scroll_1
			pitch = 1
			vol = -1
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
			select_sound_small
			vol = -1
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
	Default_Buss = options_guitar
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
	Default_Buss = options_bass
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
	Default_Buss = options_drums
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
	Default_Buss = options_vox
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
			menu_into_pausemenu
			vol = -7
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
			vol = -2
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
			menu_quickplay_removesong
			vol = -6
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
			band_mode_ready
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
gh4_online_ui_05_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			online_ui_sfx_05
		}
	]
}
gh4_online_ui_02_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			online_ui_sfx_02
		}
	]
}
gh4_online_ui_03_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			online_ui_sfx_03
		}
	]
}
gh4_online_ui_04_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			online_ui_sfx_04
		}
	]
}
gh4_online_ui_01_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			online_ui_sfx_01
		}
	]
}
menu_purchase_item_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			purchase_item
			vol = -3
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
menu_character_bio_panel_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			character_bio
			vol = -10
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
colorwheel_highlight_4_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_4
		}
	]
}
colorwheel_highlight_2_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_2
		}
	]
}
colorwheel_highlight_3_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_3
		}
	]
}
colorwheel_highlight_5_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_colorwheel_highlight_up_down_5
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
			large_ext_crowd_song_transition
		}
	]
}
medium_int_crowd_song_transition_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			medium_int_crowd_song_transition
		}
	]
}
ui_sfx_scroll_up_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_scroll_up
			vol = -8
			pitch = 1
		}
	]
}
ui_sfx_scroll_down_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			menu_scroll_down
			vol = -4.5
			pitch = 3
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
			vol = -8
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
menu_character_bio_panel_out_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			character_bio_out
			vol = -18
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
			vol = 0
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
eddie_lose_01_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			eddie_lose_guitar01
			vol = 4
		}
	]
}
wolf_lose_01_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			wolf_lose_bass01
			vol = 6
		}
	]
}
wolf_lose_02_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			wolf_lose_bass02
			vol = 6
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			guitar_smash_large_gh4_01
			vol = 3
		}
		{
			guitar_smash_large_gh4_02
			vol = 3
		}
		{
			guitar_smash_large_gh4_04
			vol = 3
		}
		{
			guitar_smash_large_gh4_06
			vol = 3
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			guitar_smash_medium_gh4_01
			vol = 3
		}
		{
			guitar_smash_medium_gh4_02
			vol = 3
		}
		{
			guitar_smash_medium_gh4_03
			vol = 3
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
		{
			mic_feedback_gh4_03
			vol = 4
		}
		{
			mic_feedback_gh4_04
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			guitar_smash_small_gh4_01
			vol = 3
		}
		{
			guitar_smash_small_gh4_02
			vol = 3
		}
		{
			guitar_smash_small_gh4_03
			vol = 3
		}
		{
			guitar_smash_small_gh4_04
			vol = 3
		}
		{
			guitar_smash_small_gh4_05
			vol = 3
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
singer_anims_win_01_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			singer_win_anim_1_02
		}
		{
			singer_win_anim_2_01
		}
		{
			singer_win_anim_3_01
			vol = -3
		}
		{
			singer_win_anim_2_02
		}
	]
}
bass_anims_win_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			bass_win_anim_1_01
		}
		{
			bass_win_anim_1_02
		}
		{
			bass_win_anim_2_01
		}
		{
			bass_win_anim_2_02
		}
		{
			bass_win_anim_3_01
		}
		{
			bass_win_anim_3_02
		}
		{
			bass_win_anim_4_01
		}
		{
			bass_win_anim_4_02
		}
	]
}
guitar_anims_win_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			guitar_win_anim_1_01
		}
		{
			guitar_win_anim_1_02
		}
		{
			guitar_win_anim_2_01
		}
		{
			guitar_win_anim_2_02
		}
		{
			guitar_win_anim_3_01
		}
		{
			guitar_win_anim_3_02
		}
		{
			guitar_win_anim_4_01
		}
		{
			guitar_win_anim_4_02
		}
		{
			guitar_win_anim_5_01
		}
	]
}
drum_anims_win_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			drum_win_anim_1_01
		}
		{
			drum_win_anim_1_02
		}
		{
			drum_win_anim_2_01
		}
		{
			drum_win_anim_2_02
		}
		{
			drum_win_anim_3_01
		}
		{
			drum_win_anim_3_02
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
drummer_tom_hit_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Beds
	NoRepeatFor = 0.01
	InstanceManagement = stop_oldest
	InstanceLimit = 3
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			drummer_tom_01
		}
		{
			drummer_tom_02
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
large_bass_smash_container = {
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
		}
		{
			bass_smash_large_gh4_02
			vol = 5
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			bass_smash_medium_gh4_01
			vol = 5
		}
		{
			bass_smash_medium_gh4_02
			vol = 5
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
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			bass_smash_small_gh4_01
			vol = 5
		}
		{
			bass_smash_small_gh4_02
			vol = 5
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
			vol = 0
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
			vol = -4
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
menu_car_zoomin_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 2
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = stop_oldest
	InstanceLimit = 1
	Command = PlaySound
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
medium_ext_encore_crowd_container = {
	Default_Priority = 50
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			medium_ext_encore_crowd
			num_loops = -1
			vol = -6
			attack_time = 0.5
			attack_function = linear
		}
	]
}
large_ext_encore_crowd_container = {
	Default_Priority = 50
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			large_ext_encore_crowd
			num_loops = -1
			vol = -10
			attack_time = 2.5
			attack_function = linear
		}
	]
}
medium_int_encore_crowd_container = {
	Default_Priority = 50
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
small_int_encore_crowd_container = {
	Default_Priority = 50
	Default_Buss = encore_loops
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			small_int_encore_crowd
			num_loops = -1
			vol = -8
			attack_time = 0.5
			attack_function = linear
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
battle_boss_whoosh2_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gigcomplete_unlock_item_text_appear
			vol = 4
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
gigcomplete_magazine_in_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			gig_complete_magazine_in
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
			ext_md_crowd_swell_lg_l_02
			pan1x = -1
			pan1y = 1
		}
		{
			ext_md_crowd_swell_lg_r_02
			pan1x = 1
			pan1y = 1
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
			ext_md_crowd_swell_md_l_02
			pan1x = -1
			pan1y = 1
		}
		{
			ext_md_crowd_swell_md_r_02
			pan1x = 1
			pan1y = 1
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
			ext_md_crowd_swell_sh_l_01
			pan1x = -1
			pan1y = 1
		}
		{
			ext_md_crowd_swell_sh_r_01
			pan1x = 1
			pan1y = 1
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
pyro_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 6
	Command = PlaySound
	Randomness = RandomNoRepeatType
	Sounds = [
		{
			pyro_1
			vol = 0
		}
		{
			pyro_2
			vol = 0
		}
		{
			pyro_3
			vol = 0
		}
	]
}
ecstacyofgold_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			ecstacyofgold
		}
	]
}
ecstacyofgoldcrowds_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Transitions
	NoRepeatFor = 2.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
}
james_song_1_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_song_1
		}
	]
}
james_song_2_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_song_2
		}
	]
}
james_song_3_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_song_3
		}
	]
}
james_song_5_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_song_5
		}
	]
}
james_song_6_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_song_6
		}
	]
}
james_generic_1_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_1
		}
	]
}
james_generic_10_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_10
		}
	]
}
james_generic_11_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_11
		}
	]
}
james_generic_12_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_12
		}
	]
}
james_generic_13_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_13
		}
	]
}
james_generic_14_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_14
		}
	]
}
james_generic_15_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_15
		}
	]
}
james_generic_16_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_16
		}
	]
}
james_generic_17_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_17
		}
	]
}
james_generic_18_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_18
		}
	]
}
james_generic_19_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_19
		}
	]
}
james_generic_2_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_2
		}
	]
}
james_generic_20_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_20
		}
	]
}
james_generic_3_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_3
		}
	]
}
james_generic_4_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_4
		}
	]
}
james_generic_5_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_5
		}
	]
}
james_generic_6_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_6
		}
	]
}
james_generic_7_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_7
		}
	]
}
james_generic_8_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_8
		}
	]
}
james_generic_9_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_generic_9
		}
	]
}
james_encore_2_container = {
	Default_Priority = 50
	Default_Buss = Encore_Events
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			james_vo_encore_2
		}
	]
}
crowd_oneshot_metallica_medium_int_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_cheer_md_int_sg_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_md_int_sg_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_cheer_med_int_gr_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 39.00747
			pan1randomright = 320.55298
		}
		{
			crowd_metallica_med_int_1
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4.5
					-3.0
				]
			}
			pan1randomleft = 39.47246
			pan1randomright = 320.6595
		}
		{
			crowd_metallica_med_int_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3.5
					-3.0
				]
			}
			pan1randomleft = 39.47246
			pan1randomright = 320.6595
		}
		{
			crowd_metallica_med_int_2
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4.5
					-3.0
				]
			}
			pan1randomleft = 39.47246
			pan1randomright = 320.6595
		}
		{
			crowd_metallica_med_int_3
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4.5
					-3.0
				]
			}
			pan1randomleft = 39.47246
			pan1randomright = 320.6595
		}
		{
			crowd_metallica_med_int_4
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4.5
					-3.0
				]
			}
			pan1randomleft = 39.47246
			pan1randomright = 320.6595
		}
		{
			crowd_metallica_med_int_5
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4.5
					-3.0
				]
			}
			pan1randomleft = 39.47246
			pan1randomright = 320.6595
		}
		{
			crowd_metallica_med_int_6
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4.5
					-3.0
				]
			}
			pan1randomleft = 39.47246
			pan1randomright = 320.6595
		}
		{
			crowd_metallica_med_int_7
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4.5
					-3.0
				]
			}
			pan1randomleft = 39.47246
			pan1randomright = 320.6595
		}
		{
			crowd_metallica_med_int_8
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4.5
					-3.0
				]
			}
			pan1randomleft = 39.47246
			pan1randomright = 320.6595
		}
		{
			crowd_metallica_med_int_9
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4.5
					-3.0
				]
			}
			pan1randomleft = 39.47246
			pan1randomright = 320.6595
		}
		{
			int_md_crowd_whistle_01
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_02
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_03
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_04
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_05
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_06
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_07
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_08
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_09
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_10
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_11
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_12
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_13
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_14
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_15
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_16
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_17
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_18
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_19
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
		{
			int_md_crowd_whistle_20
			vol = -7
			pan1randomleft = 36.27386
			pan1randomright = 324.1448
		}
	]
}
crowd_oneshot_metallica_small_int_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_cheer_sm_int_gr_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_gr_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_cheer_sm_int_sg_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_metallica_sm_int_1
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_metallica_sm_int_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_metallica_sm_int_2
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_metallica_sm_int_3
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_metallica_sm_int_4
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_metallica_sm_int_5
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_metallica_sm_int_6
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_metallica_sm_int_7
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_metallica_sm_int_8
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			crowd_metallica_sm_int_9
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-5
					-4
				]
			}
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_01
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_02
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_03
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_04
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_05
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_06
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_07
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_08
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_09
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_10
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_11
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_12
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_13
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_14
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_15
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_16
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_17
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_18
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_19
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
		{
			int_sm_crowd_whistle_20
			vol = -9
			pan1randomleft = 37.76308
			pan1randomright = 322.33438
		}
	]
}
crowd_oneshot_metallica_large_ext_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_cheer_lg_ext_sg_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lg_ext_sg_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_cheer_lrg_ext_gr_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					-2
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_metallica_lg_ext_1
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_metallica_lg_ext_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_metallica_lg_ext_2
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_metallica_lg_ext_3
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_metallica_lg_ext_4
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_metallica_lg_ext_5
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_metallica_lg_ext_6
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_metallica_lg_ext_7
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_metallica_lg_ext_8
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			crowd_metallica_lg_ext_9
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-4
					-3
				]
			}
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_01
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_02
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_03
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_04
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_05
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_06
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_07
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_08
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_09
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_10
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_11
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_12
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_13
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_14
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_15
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_16
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_17
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_18
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_19
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
		{
			ext_lg_crowd_whistle_20
			vol = -7
			pan1randomleft = 38.546013
			pan1randomright = 323.59122
		}
	]
}
crowd_oneshot_metallica_medium_ext_container = {
	Default_Priority = 50
	Default_Buss = Crowd_One_Shots
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 5
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			crowd_cheer_md_ext_sg_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_md_ext_sg_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_md_ext_sg_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_md_ext_sg_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_md_ext_sg_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_md_ext_sg_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_md_ext_sg_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_md_ext_sg_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_md_ext_sg_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_md_ext_sg_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_med_ext_gr_01
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_med_ext_gr_02
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_med_ext_gr_03
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_med_ext_gr_04
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_med_ext_gr_05
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_med_ext_gr_06
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_med_ext_gr_07
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_med_ext_gr_08
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_med_ext_gr_09
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_cheer_med_ext_gr_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_metallica_med_ext_1
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_metallica_med_ext_10
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_metallica_med_ext_2
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_metallica_med_ext_3
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_metallica_med_ext_4
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_metallica_med_ext_5
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_metallica_med_ext_6
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_metallica_med_ext_7
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_metallica_med_ext_8
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			crowd_metallica_med_ext_9
			RandomVol = {
				Type = RandomRangeType
				vals = [
					-3
					1
				]
			}
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_01
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_02
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_03
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_04
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_05
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_06
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_07
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_08
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_09
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_10
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_11
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_12
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_13
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_14
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_15
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_16
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_17
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_18
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_19
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
		{
			ext_md_crowd_whistle_20
			vol = -7
			pan1randomleft = 39.136127
			pan1randomright = 322.3058
		}
	]
}
metallica_encore_oneshots_container = {
	Default_Priority = 50
	Default_Buss = encore_loops
	NoRepeatFor = 0.6
	InstanceManagement = ignore
	InstanceLimit = 8
	Command = PlaySound
	Randomness = RandomNoRepeatLastTwoType
	Sounds = [
		{
			callout_a_5
			vol = -11
			pan1randomleft = 314.0065
			pan1randomright = 45.7639
		}
		{
			callout_b_3
			vol = -11
			pan1randomleft = 314.0065
			pan1randomright = 45.7639
		}
		{
			callout_c_22
			vol = -11
			pan1randomleft = 314.0065
			pan1randomright = 45.7639
		}
		{
			callout_d_17
			vol = -11
			pan1randomleft = 314.0065
			pan1randomright = 45.7639
		}
		{
			callout_d_8
			vol = -11
			pan1randomleft = 314.0065
			pan1randomright = 45.7639
		}
		{
			callout_e_7
			vol = -11
			pan1randomleft = 314.0065
			pan1randomright = 45.7639
		}
	]
}
vo_sb_hello_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_hello
			vol = 2
		}
	]
}
vo_sb_hey_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_hey
			vol = 2
		}
	]
}
vo_sb_question_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_question
			vol = 2
		}
	]
}
vo_sb_killemall_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_killemall
			vol = 2
		}
	]
}
vo_sb_feelinggood_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_feelinggood
			vol = 2
		}
	]
}
vo_sb_havingfun_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_havingfun
			vol = 2
		}
	]
}
vo_sb_youfeelit_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_youfeelit
			vol = 2
		}
	]
}
vo_sb_wantmore_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_more1
			vol = 2
		}
	]
}
vo_sb_outthere_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_outthere
			vol = 2
		}
	]
}
vo_sb_whatdyousay_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_whatdyousay
			vol = 2
		}
	]
}
vo_sb_areyousure_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_areyousure1
			vol = 2
		}
	]
}
vo_sb_ohyeah_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_ohyeah1
			vol = 2
		}
	]
}
vo_sb_yeah_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_yeah1
			vol = 2
		}
	]
}
vo_sb_no_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_no1
			vol = 2
		}
	]
}
vo_sb_goodtohear_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_goodtohear
			vol = 2
		}
	]
}
vo_sb_thatsright_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 1.0
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			sb_thatsright
			vol = 2
		}
	]
}
select_sound_small_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			select_sound_small
		}
	]
}
select_sound_big_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			select_sound_big
		}
	]
}
precutscene_sfx_container = {
	Default_Priority = 50
	Default_Buss = binkcutscenes
	NoRepeatFor = 0.1
	InstanceManagement = ignore
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
	Default_Priority = 50
	Default_Buss = UI_Battle_Mode
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
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
star_get_container = {
	Default_Priority = 50
	Default_Buss = UI_Star_Power
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			star_get
			vol = -2
			pan1x = -0.4
			pan1y = 1
			pan2x = 1
			pan2y = 1
			panremovecenter = true
		}
	]
}
z_icecave_intro_container = {
	Default_Priority = 50
	Default_Buss = Crowd_PreSong_Intro
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			icecave_intro
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			mop_intro
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			donnington_intro
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			justice_intro
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			studio2_intro
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
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			studio2_intro
			vol = 6
		}
	]
}
ui_band_mode_choose_sound_spawned_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = ignore
	InstanceLimit = 4
	Randomness = None
}
ui_band_mode_choose_sound_ready_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.05
	InstanceManagement = ignore
	InstanceLimit = 4
	Randomness = None
}
band_screen_ui_sound_container = {
	Default_Priority = 50
	Default_Buss = Front_End
	NoRepeatFor = 0.02
	InstanceManagement = stop_oldest
	InstanceLimit = 6
	Randomness = None
}
band_failed_x_sfx_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			band_failed_x_sfx
			vol = 8
		}
	]
}
fail_screen_sfx_container = {
	Default_Priority = 50
	Default_Buss = Crowd_Boos
	NoRepeatFor = 0.1
	InstanceManagement = ignore
	InstanceLimit = 1
	Command = PlaySound
	Randomness = None
	Sounds = [
		{
			band_failed_x_sfx
			vol = 4
		}
	]
}
