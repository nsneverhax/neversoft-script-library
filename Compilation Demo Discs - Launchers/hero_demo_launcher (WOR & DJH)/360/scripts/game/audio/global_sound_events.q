crowd_individual_clap_to_beat_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			crowd_group_clap_01
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			crowd_group_clap_02
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			crowd_group_clap_03
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			crowd_group_clap_04
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			crowd_group_clap_05
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			crowd_group_clap_06
			vol = 11
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
	]
}
crowd_fail_song_sfx_container = {
	default_priority = 90
	default_buss = crowd_boos
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			crowd_fail_song
			vol = 3
			pan1x = -0.9
			pan1y = -0.55
			pan2x = 0.9
			pan2y = 0.120000005
		}
	]
}
crowd_fail_song_sfx_softer_container = {
	default_priority = 90
	default_buss = crowd_boos
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			crowd_fail_song
			vol = 0
			pan1x = -0.9
			pan1y = -0.55
			pan2x = 0.9
			pan2y = 0.120000005
		}
	]
}
star_power_awarded_sfx_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
star_power_awarded_sfx_p1_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
star_power_awarded_sfx_p2_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
star_power_ready_sfx_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			sp_available1
			vol = -5.17
		}
	]
}
star_power_ready_sfx_p1_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
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
star_power_ready_sfx_p2_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
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
star_power_deployed_sfx_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			sp_deployed
			vol = -10.42
		}
	]
}
star_power_deployed_sfx_p1_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
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
star_power_deployed_sfx_p2_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
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
star_power_deployed_cheer_sfx_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = obj_playsound
	randomness = none
	sounds = [
		{
			sp_cheer1
			vol = 3
			dropoff = 50
			dropoff_function = linear
		}
	]
}
star_power_deployed_cheer_sfx_p1_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
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
star_power_deployed_cheer_sfx_p2_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sound_05
			vol = -3
		}
	]
}
gh_sfx_battlemode_lightning_player1_container = {
	default_priority = 90
	default_buss = ui_battle_mode
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_lightning
			vol = -4.42
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
gh_sfx_battlemode_lightning_player2_container = {
	default_priority = 90
	default_buss = ui_battle_mode
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_lightning
			vol = -4.42
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
gh_sfx_beatsoundevent_container = {
	default_priority = 90
	default_buss = test_tones
	norepeatfor = 0.001
	instancemanagement = stop_oldest
	instancelimit = 8
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_beat_sound
			vol = -3
			pitch = 12
		}
	]
}
gh_sfx_calibration_beatsoundevent_container = {
	default_priority = 90
	default_buss = test_tones
	norepeatfor = 0.001
	instancemanagement = stop_oldest
	instancelimit = 8
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_beat_sound
			vol = -9
			pitch = 15.860001
		}
	]
}
gh_sfx_beatwindowopensoundevent_container = {
	default_priority = 90
	default_buss = test_tones
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_beat_sound
			vol = 6
			pitch = 7.02
		}
	]
}
gh_sfx_beatwindowclosesoundevent_container = {
	default_priority = 90
	default_buss = test_tones
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_beat_sound
			vol = 6
			pitch = -2.81
		}
	]
}
dummy_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
			silence_front_end_crowd_loop
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
donothing_oneshot_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
}
crowd_swell_short_large_ext_l_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_swell_sh_l_01
			vol = 4
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_large_ext_r_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_swell_sh_r_01
			vol = 4
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_short_soft_large_ext_l_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_swell_sh_l_01
			vol = -2
			pan1x = -0.9811321
			pan1y = 0.4056604
		}
	]
}
crowd_swell_short_soft_large_ext_r_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_swell_sh_r_01
			vol = -2
			pan1x = 1
			pan1y = 0.33962262
		}
	]
}
crowd_swell_med_large_ext_l_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_swell_md_l_01
			vol = -3
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_med_large_ext_r_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_swell_md_r_01
			vol = -3
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_long_large_ext_l_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_swell_md_l_01
			vol = -3
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_long_large_ext_r_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_swell_md_r_01
			vol = -3
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_oneshots_boo_close_container = {
	default_priority = 20
	default_buss = crowd_one_shots
	norepeatfor = 1.5
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			crowd_boo_sm_01
			pan1x = 0.61
			pan1y = -1.0
			randomvol = {
				type = randomrangetype
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			crowd_boo_sm_02
			pan1x = 1.0
			pan1y = -0.13
			randomvol = {
				type = randomrangetype
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			crowd_boo_sm_03
			pan1x = 0.69
			pan1y = -1.0
			randomvol = {
				type = randomrangetype
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			crowd_boo_sm_04
			pan1x = 0.0
			pan1y = -1.0
			randomvol = {
				type = randomrangetype
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			crowd_boo_sm_05
			pan1x = -0.69
			pan1y = -1.0
			randomvol = {
				type = randomrangetype
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			crowd_boo_sm_06
			pan1x = -0.07
			pan1y = -0.7
			randomvol = {
				type = randomrangetype
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			crowd_boo_sm_07
			pan1x = 0.31
			pan1y = -0.7
			randomvol = {
				type = randomrangetype
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			crowd_boo_sm_08
			pan1x = 0.1
			pan1y = -0.7
			randomvol = {
				type = randomrangetype
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			crowd_boo_sm_09
			pan1x = 0.6
			pan1y = -0.8
			randomvol = {
				type = randomrangetype
				vals = [
					4.59
					5.56
				]
			}
		}
		{
			crowd_boo_sm_10
			pan1x = 0.8
			pan1y = -0.26
			randomvol = {
				type = randomrangetype
				vals = [
					4.59
					5.56
				]
			}
		}
	]
}
menu_guitar_lick_sfx_container = {
	default_priority = 80
	default_buss = front_end
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomtype
}
menu_warning_sfx_container = {
	default_priority = 75
	default_buss = front_end
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_warning_01
			vol = -6
		}
	]
}
menu_warning_sfx_softer_container = {
	default_priority = 75
	default_buss = front_end
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_warning_01
			vol = -8
		}
	]
}
menu_music_se_container = {
	default_priority = 90
	default_buss = music_frontend
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
}
generic_menu_back_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sound_09
			vol = -6
		}
	]
}
notes_ripple_up_sfx_container = {
	default_priority = 80
	default_buss = front_end
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			notes_ripple_up_01
			vol = -3.73
		}
	]
}
crowd_battle_cheer_large_ext_l_p1_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_swell_sh_l_01
			vol = 0
			pan1x = -1.0
			pan1y = 0.59
		}
	]
}
crowd_battle_cheer_large_ext_r_p1_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_swell_sh_r_01
			vol = 0
			pan1x = 1.0
			pan1y = 0.57
		}
	]
}
crowd_battle_cheer_medium_ext_l_p1_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_sh_l_02
			vol = 11.5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -1.0
			pan1y = 0.59
		}
	]
}
crowd_battle_cheer_medium_ext_r_p1_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_sh_r_02
			vol = 11.5
			dropoff = 6000
			dropoff_function = inv_exponential
			pan1x = -0.5
			pan1y = 1.0
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_medium_ext_l_p2_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_sh_l_02
			vol = 11.5
			pan1x = 0.52
			pan1y = 1
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_medium_ext_r_p2_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_sh_r_02
			vol = 11.5
			pan1x = 1
			pan1y = 0.57
		}
	]
}
crowd_battle_cheer_medium_int_l_p1_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_sh_l_02
			vol = 2
			pan1x = -1
			pan1y = 0.59
		}
	]
}
crowd_battle_cheer_medium_int_r_p1_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_sh_r_02
			vol = 2
			pan1x = -0.5
			pan1y = 1
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_medium_int_l_p2_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_sh_l_02
			vol = 2
			pan1x = 0.52
			pan1y = 1
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_medium_int_r_p2_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_sh_r_02
			vol = 2
			pan1x = 1
			pan1y = 0.57
		}
	]
}
crowd_battle_cheer_london_l_p1_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_sh_l_02
			vol = 2
			pan1x = -1
			pan1y = 0.59
		}
	]
}
crowd_battle_cheer_london_r_p1_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_sh_r_02
			vol = 2
			pan1x = -0.5
			pan1y = 1
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_london_l_p2_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_sh_l_02
			vol = 2
			pan1x = 0.52
			pan1y = 1
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_london_r_p2_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_sh_r_02
			vol = 2
			pan1x = 1
			pan1y = 0.57
		}
	]
}
crowd_battle_cheer_small_int_l_p1_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_swell_sh_l_03
			vol = 2
			pan1x = -1
			pan1y = 0.59
		}
	]
}
crowd_battle_cheer_small_int_r_p1_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_swell_sh_r_03
			vol = 2
			pan1x = -0.5
			pan1y = 1
			panremovecenter = true
		}
	]
}
crowd_battle_cheer_small_int_l_p2_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
crowd_transition_london_good_to_med_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_good_to_neutral_01
			vol = -2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_good_to_med_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
crowd_transition_london_good_to_med_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_good_to_neutral_01
			vol = -2
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_int_good_to_med_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
crowd_transition_london_good_to_med_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_good_to_neutral_01
			vol = -2
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_med_to_good_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
crowd_transition_london_med_to_good_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_neutral_to_good_01
			vol = 2.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_london_med_to_good_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_neutral_to_good_01
			vol = 2.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_london_med_to_good_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_neutral_to_good_01
			vol = 2.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_med_to_poor_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			md_crowd_neutral_to_bad_02
			vol = -4
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_med_to_poor_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			md_crowd_neutral_to_bad_02
			vol = -3
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_medium_ext_med_to_poor_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
crowd_transition_london_med_to_poor_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_neutral_to_bad_02
			vol = -1.5
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_london_med_to_poor_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_neutral_to_bad_02
			vol = -1.5
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_london_med_to_poor_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
crowd_transition_london_poor_to_med_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_bad_to_neutral_01
			vol = 8
			pan1x = -1.0
			pan1y = 0.25
			pan2x = -0.5
			pan2y = 0.25
		}
	]
}
crowd_transition_london_poor_to_med_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_bad_to_neutral_01
			vol = 8
			pan1x = 0.5
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_london_poor_to_med_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_bad_to_neutral_01
			vol = 8
			pan1x = -1.0
			pan1y = 0.25
			pan2x = 1.0
			pan2y = 0.25
		}
	]
}
crowd_transition_small_int_good_to_med_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_lg_l_02
			vol = 2.5
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_long_medium_ext_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_lg_r_02
			vol = 2.5
			pan1x = 1
			pan1y = 0.25471702
		}
	]
}
crowd_swell_long_medium_int_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_lg_l_01
			vol = -5
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_long_medium_int_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_lg_r_01
			vol = -5
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_long_london_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_lg_l_01
			vol = 4
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_long_london_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_lg_r_01
			vol = 4
			pan1x = 1
			pan1y = 0.24528301
		}
	]
}
crowd_swell_long_small_int_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_swell_lg_l_02
			vol = -4
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_long_small_int_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_swell_lg_r_02
			vol = -4
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_med_medium_ext_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_md_l_02
			vol = -1
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_med_medium_ext_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_md_r_02
			vol = -1
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_med_medium_int_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_md_l_02
			vol = -3
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_med_medium_int_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_md_r_02
			vol = -3
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_med_london_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_md_l_02
			vol = 2
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_med_london_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_md_r_02
			vol = 2
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_med_small_int_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_swell_md_l_01
			vol = -4
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_med_small_int_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_swell_md_r_01
			vol = -4
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_short_medium_ext_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_sh_l_02
			vol = 8.5
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_medium_ext_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_sh_r_02
			vol = 8.5
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_short_soft_medium_ext_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_sh_l_02
			vol = -2.5
			pan1x = -1
			pan1y = 0.29716977
		}
	]
}
crowd_swell_short_soft_medium_ext_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_sh_r_02
			vol = -2.5
			pan1x = 1
			pan1y = 0.3679245
		}
	]
}
crowd_swell_short_medium_int_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_sh_l_02
			vol = 4.5
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_medium_int_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_sh_r_02
			vol = 4.5
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_short_soft_medium_int_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_sh_l_02
			vol = -5
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_soft_medium_int_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_swell_sh_r_02
			vol = -5
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_short_london_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_sh_l_02
			vol = 4.5
			pan1x = -0.990566
			pan1y = 0.29716977
		}
	]
}
crowd_swell_short_london_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_sh_r_02
			vol = 4.5
			pan1x = 1
			pan1y = 0.3679245
		}
	]
}
crowd_swell_short_soft_london_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_sh_l_02
			vol = -1
			pan1x = -1
			pan1y = 0.24000001
		}
	]
}
crowd_swell_short_soft_london_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_swell_sh_r_02
			vol = -1
			pan1x = 1
			pan1y = 0.56
		}
	]
}
crowd_swell_short_small_int_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_swell_sh_l_03
			vol = 4
			pan1x = -1
			pan1y = 0.3962264
		}
	]
}
crowd_swell_short_small_int_r_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_swell_sh_r_03
			vol = 4
			pan1x = 1
			pan1y = 0.3962264
		}
	]
}
crowd_swell_short_soft_small_int_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_swell_sh_r_03
			vol = -6
			pan1x = 1
			pan1y = 0.56
		}
	]
}
box_check_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			checkbox_check_sfx
			vol = -1.93
		}
		{
			checkbox_sfx
			vol = -1.93
		}
	]
}
box_uncheck_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			checkbox_check_sfx
			vol = -1.93
		}
		{
			checkbox_sfx
			vol = -1.93
		}
	]
}
cash_sound_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			cash
			vol = -4.42
		}
	]
}
you_rock_end_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			you_rock
			vol = 2
		}
	]
}
ui_sfx_lose_multiplier_2x_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_lose_multiplier
			vol = -8.38
			pitch = 1.65
		}
	]
}
ui_sfx_lose_multiplier_3x_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_lose_multiplier
			vol = -4.8700004
			pitch = 0.84000003
		}
	]
}
ui_sfx_lose_multiplier_4x_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_lose_multiplier
			vol = -2.49
			pitch = 0
		}
	]
}
lose_multiplier_crowd_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
}
song_intro_kick_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_song_intro_kick
			vol = -4.5
		}
	]
}
song_intro_highway_up_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			highway_rise
			vol = 3.21
		}
	]
}
gh_sfx_battlemode_diffup_p1_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battle_difficultyrampup
			vol = -4.9300003
			pan1x = -1.0
			pan1y = 0.72999996
			pan2x = -0.77
			pan2y = 1.0
		}
	]
}
gh_sfx_battlemode_doublenote_p1_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_doublenoteattack
			vol = -4.09
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
gh_sfx_battlemode_lefty_p1_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_leftyattack
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
gh_sfx_battlemode_steal_p1_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_stealpowerup
			vol = -6
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
gh_sfx_battlemode_stringbreak_p1_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_stringbreakattack
			vol = -4.42
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
gh_sfx_battlemode_whammyattack_p1_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_whammyattack
			vol = -5.9300003
			pan1x = -1.0
			pan1y = 1.0
			pan2x = -1.0
			pan2y = 0.27
		}
	]
}
gh_sfx_battlemode_diffup_p2_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battle_difficultyrampup
			vol = -4.9300003
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
gh_sfx_battlemode_doublenote_p2_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_doublenoteattack
			vol = -4.09
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
gh_sfx_battlemode_lefty_p2_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_leftyattack
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
gh_sfx_battlemode_steal_p2_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_stealpowerup
			vol = -6
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
gh_sfx_battlemode_stringbreak_p2_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_stringbreakattack
			vol = -4.42
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
gh_sfx_battlemode_whammyattack_p2_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_whammyattack
			vol = -5.9300003
			pan1x = 1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.71
		}
	]
}
gh_sfx_bossbattle_playerdies_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_deathfromslash
		}
	]
}
gh_sfx_you_lose_single_player_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_sudden_death
			vol = -2.49
		}
	]
}
gh_sfx_battlemode_attack_over_p1_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_attack_over
			vol = -6.9100003
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
gh_sfx_battlemode_attack_over_p2_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_attack_over
			vol = -6.9100003
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
battle_power_awarded_sfx_p1_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
battle_power_awarded_sfx_p2_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
gh_sfx_hitnotesoundevent_container = {
	default_priority = 90
	default_buss = test_tones
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_beat_sound
			vol = 6
			pitch = 15.860001
		}
	]
}
countoff_sfx_sticks_normal_hard_container = {
	default_priority = 90
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			stickclickmed
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_sticks_normal_med_container = {
	default_priority = 90
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			stickclickmed
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-3.73
					-4.14
					-5.17
					-6.0
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_sticks_normal_soft_container = {
	default_priority = 90
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			stickclickmed
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-9.09
					-8.610001
					-7.9300003
					-7.51
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_hihat01_hard_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			hihatclosed01
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-0.90999997
					-0.44
					0.0
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_hihat01_med_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			hihatclosed01
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-0.90999997
					-0.44
					0.0
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_hihat01_soft_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			hihatclosed01
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-0.90999997
					-0.44
					0.0
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_hihat02_hard_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			hihatopen02
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					0.42000002
					0.83
					1.21
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
				vals = [
					0.17
					0.0
					0.0
				]
			}
		}
	]
}
countoff_sfx_hihat02_med_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			hihatopen02
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					0.42000002
					0.83
					1.21
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
				vals = [
					0.0
					-0.17
					-0.17
				]
			}
		}
	]
}
countoff_sfx_hihat02_soft_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			hihatopen02
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					0.42000002
					0.83
					1.21
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
				vals = [
					-0.17
					-0.35000002
					-0.35000002
				]
			}
		}
	]
}
countoff_sfx_hihat03_hard_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			hihatpedal02
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					0.83
					1.58
					2.27
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
				vals = [
					0.17
					0.0
					0.0
				]
			}
		}
	]
}
countoff_sfx_hihat03_med_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			hihatpedal02
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					0.83
					1.58
					2.27
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
				vals = [
					0.0
					-0.17
					-0.17
				]
			}
		}
	]
}
countoff_sfx_hihat03_soft_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			hihatpedal02
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					0.83
					1.58
					2.27
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
				vals = [
					-0.17
					-0.35000002
					-0.35000002
				]
			}
		}
	]
}
countoff_sfx_sticks_huge_hard_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			stickclicklarge
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_sticks_huge_med_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			stickclicklarge
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_sticks_huge_soft_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			stickclicklarge
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-3.09
					-2.84
					-2.49
					-2.3799999
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_sticks_tiny_hard_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			stickclicksmall
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-1.41
					-0.90999997
					-0.44
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_sticks_tiny_med_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			stickclicksmall
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-1.41
					-0.90999997
					-0.44
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
countoff_sfx_sticks_tiny_soft_container = {
	default_priority = 50
	default_buss = countoffs
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			stickclicksmall
			randomvol = {
				type = randomnorepeatlasttwotype
				vals = [
					-1.41
					-0.90999997
					-0.44
				]
			}
			randompitch = {
				type = randomnorepeatlasttwotype
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
	default_priority = 90
	default_buss = practice_band_playback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
}
gh_sfx_battlemode_whammyattack_received_p1_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_whammyattack_received
			vol = -6.09
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
gh_sfx_battlemode_whammyattack_received_p2_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_whammyattack_received
			vol = -6.09
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
checkbox_sfx_container = {
	default_priority = 80
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			checkbox_sfx
			vol = -1.93
		}
	]
}
checkbox_sfx_p1_container = {
	default_priority = 80
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			checkbox_sfx
			vol = -1.93
			pan1x = -0.9
			pan1y = 1.0
		}
	]
}
checkbox_sfx_p2_container = {
	default_priority = 80
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			checkbox_sfx
			vol = -1.93
			pan1x = 0.9
			pan1y = 1.0
		}
	]
}
whammy_test_sfx_container = {
	default_priority = 80
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			whammy_test_sfx
			vol = -3.09
		}
	]
}
pow_sfx_container = {
	default_priority = 80
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			pow_sfx_02
			vol = 6
		}
		{
			pow_sfx_05
			vol = 6
		}
		{
			pow_sfx_07
			vol = 6
		}
	]
}
checkbox_check_sfx_container = {
	default_priority = 80
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			checkbox_check_sfx
			vol = -1.93
		}
	]
}
checkbox_check_2_sfx_container = {
	default_priority = 80
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			checkbox_check_sfx_2
			vol = 8
		}
	]
}
checkbox_check_sfx_p1_container = {
	default_priority = 80
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			checkbox_check_sfx
			vol = -1.93
			pan1x = -0.9
			pan1y = 1.0
		}
	]
}
checkbox_check_sfx_p2_container = {
	default_priority = 80
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			checkbox_check_sfx
			vol = -1.93
			pan1x = 0.9
			pan1y = 1.0
		}
	]
}
tutorial_mode_finish_chord_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			finish_chord
			vol = 2.27
		}
	]
}
ui_sfx_100_note_streak_singleplayer_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_100_note_streak
			vol = -4
		}
	]
}
ui_sfx_50_note_streak_singleplayer_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_50_note_streak
			vol = -3
		}
	]
}
ui_sfx_100_note_streak_p1_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_100_note_streak
			vol = -5
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
ui_sfx_50_note_streak_p1_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_50_note_streak
			vol = -7
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
ui_sfx_100_note_streak_p2_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_100_note_streak
			vol = -5
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
ui_sfx_50_note_streak_p2_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_50_note_streak
			vol = -7
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
tutorial_missed_hopo_free_container = {
	default_priority = 100
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			tutorial_missed_hopo_free
			vol = 3.51
		}
	]
}
tutorial_string_1_hopo_free_container = {
	default_priority = 100
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			tutorial_string_1_hopo_free
			vol = 8.51
		}
	]
}
tutorial_string_1_strum_free_container = {
	default_priority = 100
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			tutorial_string_1_strum_free
			vol = 8.51
		}
	]
}
tutorial_string_2_hopo_free_container = {
	default_priority = 100
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			tutorial_string_2_hopo_free
			vol = 8.51
		}
	]
}
tutorial_string_2_strum_free_container = {
	default_priority = 100
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			tutorial_string_2_strum_free
			vol = 8.51
		}
	]
}
tutorial_string_3_hopo_free_container = {
	default_priority = 100
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			tutorial_string_3_hopo_free
			vol = 8.51
		}
	]
}
tutorial_string_3_strum_free_container = {
	default_priority = 100
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			tutorial_string_3_strum_free
			vol = 8.51
		}
	]
}
crowd_applause_large_ext_l_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_applause_l_01
			vol = -1
			pan1x = -1
			pan1y = 1
		}
	]
}
crowd_applause_large_ext_r_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ext_lg_crowd_applause_r_01
			vol = -1
			pan1x = 1
			pan1y = 1
		}
	]
}
crowd_applause_medium_ext_l_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_applause_l_02
			vol = -4
			pan1x = -1
			pan1y = 1
		}
	]
}
crowd_applause_medium_ext_r_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_applause_r_02
			vol = -4
			pan1x = 1
			pan1y = 0.47641513
		}
	]
}
crowd_applause_medium_int_l_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_applause_l_02
			vol = -6
			pan1x = -1
			pan1y = 1
		}
	]
}
crowd_applause_medium_int_r_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_applause_r_02
			vol = -6
			pan1x = 1
			pan1y = 1
		}
	]
}
crowd_applause_small_int_l_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_applause_l_01
			vol = -9
			pan1x = -1
			pan1y = 1
		}
	]
}
crowd_applause_small_int_r_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_sm_crowd_applause_r_01
			vol = -9
			pan1x = 1
			pan1y = 1
		}
	]
}
battlemode_heartbeat_p1_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_heartbeat
			vol = -9.09
			pan1x = -1.0
			pan1y = 1.0
			pan2x = -1.0
			pan2y = 1.0
			num_loops = -1
		}
	]
}
battlemode_heartbeat_p2_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_battlemode_heartbeat
			vol = -9.09
			pan1x = 1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
			num_loops = -1
		}
	]
}
gh3_star_flyin_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			fly_in_whoosh
			vol = -5.17
			randompitch = {
				type = randomnorepeatlasttwotype
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
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			fly_in_whoosh
			vol = 0
			randompitch = {
				type = randomnorepeatlasttwotype
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
gh3_score_flyin_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			fly_in_whoosh
			vol = -0.90999997
			pitch = -7.46
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
gh3_cash_flyin_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			fly_in_whoosh
			vol = -1.41
			pitch = -5.9300003
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
gh3_score_flyin_hit_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_song_intro_kick
			vol = -7.9300003
		}
	]
}
gh3_cash_flyin_hit_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			cash
			vol = -4.42
		}
	]
}
jam_sounds_template = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
}
star_power_deployed_front_gh4_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			star_deployed_lfe
			lfeonly = true
			lfe_vol = -7
		}
	]
}
star_power_available_gh4_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			star_release_center
			vol = -8
			pan1x = 0.38000003
			pan1y = 1.0
		}
	]
}
star_power_available_p2_gh4_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			star_release_center
			vol = -8
			pan1x = -1.0
			pan1y = 1.0
		}
	]
}
star_power_deployed_back_p2_gh4_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			star_release_center
			vol = -8
			pan1x = 1.0
			pan1y = 1.0
		}
	]
}
star_power_release_center_p3_gh4_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			star_release_center
			vol = -8
			pan1x = 0.0
			pan1y = 1.0
		}
	]
}
star_power_deployed_front_p1_gh4_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			star_deployed_lfe
			lfeonly = true
			lfe_vol = -9
		}
	]
}
star_power_release_front_p1_gh4_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 25
	default_buss = jammode_rhythmguitar
	norepeatfor = 0
	instancemanagement = ignore
	instancelimit = 8
	command = playsound
	randomness = randomnorepeattype
}
jam_fret_noise_rhythm_container = {
	default_priority = 50
	default_buss = jammode_rhythmguitar
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			fret_noise_01
			vol = -12
			priority = 1
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_02
			vol = -12
			priority = 1
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_03
			vol = -12
			priority = 1
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_05
			vol = -12
			priority = 1
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_06
			vol = -12
			priority = 1
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
	]
}
crowd_whistle_large_ext_good_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			ext_lg_crowd_whistle_01
			vol = -2
		}
		{
			ext_lg_crowd_whistle_02
			vol = -2
		}
		{
			ext_lg_crowd_whistle_03
			vol = -2
		}
		{
			ext_lg_crowd_whistle_04
			vol = -2
		}
		{
			ext_lg_crowd_whistle_05
			vol = -2
		}
		{
			ext_lg_crowd_whistle_06
			vol = -2
		}
		{
			ext_lg_crowd_whistle_07
			vol = -2
		}
		{
			ext_lg_crowd_whistle_08
			vol = -2
		}
		{
			ext_lg_crowd_whistle_09
			vol = -2
		}
		{
			ext_lg_crowd_whistle_10
			vol = -2
		}
		{
			ext_lg_crowd_whistle_11
			vol = -2
		}
		{
			ext_lg_crowd_whistle_12
			vol = -2
		}
		{
			ext_lg_crowd_whistle_13
			vol = -2
		}
		{
			ext_lg_crowd_whistle_14
			vol = -2
		}
		{
			ext_lg_crowd_whistle_15
			vol = -2
		}
		{
			ext_lg_crowd_whistle_16
			vol = -2
		}
		{
			ext_lg_crowd_whistle_17
			vol = -2
		}
		{
			ext_lg_crowd_whistle_18
			vol = -2
		}
		{
			ext_lg_crowd_whistle_19
			vol = -2
		}
		{
			ext_lg_crowd_whistle_20
			vol = -2
		}
	]
}
crowd_whistle_large_int_good_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			int_lg_crowd_whistle_01
		}
		{
			int_lg_crowd_whistle_02
		}
		{
			int_lg_crowd_whistle_03
		}
		{
			int_lg_crowd_whistle_04
		}
		{
			int_lg_crowd_whistle_05
		}
		{
			int_lg_crowd_whistle_06
		}
		{
			int_lg_crowd_whistle_07
		}
		{
			int_lg_crowd_whistle_08
		}
		{
			int_lg_crowd_whistle_09
		}
		{
			int_lg_crowd_whistle_10
		}
		{
			int_lg_crowd_whistle_11
		}
		{
			int_lg_crowd_whistle_12
		}
		{
			int_lg_crowd_whistle_13
		}
		{
			int_lg_crowd_whistle_14
		}
		{
			int_lg_crowd_whistle_15
		}
		{
			int_lg_crowd_whistle_16
		}
		{
			int_lg_crowd_whistle_17
		}
		{
			int_lg_crowd_whistle_18
		}
		{
			int_lg_crowd_whistle_19
		}
		{
			int_lg_crowd_whistle_20
		}
	]
}
crowd_whistle_medium_ext_good_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			ext_md_crowd_whistle_01
			vol = -5
		}
		{
			ext_md_crowd_whistle_02
			vol = -5
		}
		{
			ext_md_crowd_whistle_03
			vol = -5
		}
		{
			ext_md_crowd_whistle_04
			vol = -5
		}
		{
			ext_md_crowd_whistle_05
			vol = -5
		}
		{
			ext_md_crowd_whistle_06
			vol = -5
		}
		{
			ext_md_crowd_whistle_07
			vol = -5
		}
		{
			ext_md_crowd_whistle_08
			vol = -5
		}
		{
			ext_md_crowd_whistle_09
			vol = -5
		}
		{
			ext_md_crowd_whistle_10
			vol = -5
		}
		{
			ext_md_crowd_whistle_11
			vol = -5
		}
		{
			ext_md_crowd_whistle_12
			vol = -5
		}
		{
			ext_md_crowd_whistle_13
			vol = -5
		}
		{
			ext_md_crowd_whistle_14
			vol = -5
		}
		{
			ext_md_crowd_whistle_15
			vol = -5
		}
		{
			ext_md_crowd_whistle_16
			vol = -5
		}
		{
			ext_md_crowd_whistle_17
			vol = -5
		}
		{
			ext_md_crowd_whistle_18
			vol = -5
		}
		{
			ext_md_crowd_whistle_19
			vol = -5
		}
		{
			ext_md_crowd_whistle_20
			vol = -5
		}
	]
}
crowd_whistle_medium_ext_good_01_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			int_md_crowd_whistle_01
			vol = -5
		}
		{
			int_md_crowd_whistle_02
			vol = -5
		}
		{
			int_md_crowd_whistle_03
			vol = -5
		}
		{
			int_md_crowd_whistle_04
			vol = -5
		}
		{
			int_md_crowd_whistle_05
			vol = -5
		}
		{
			int_md_crowd_whistle_06
			vol = -5
		}
		{
			int_md_crowd_whistle_07
			vol = -5
		}
		{
			int_md_crowd_whistle_08
			vol = -5
		}
		{
			int_md_crowd_whistle_09
			vol = -5
		}
		{
			int_md_crowd_whistle_10
			vol = -5
		}
		{
			int_md_crowd_whistle_11
			vol = -5
		}
		{
			int_md_crowd_whistle_12
			vol = -5
		}
		{
			int_md_crowd_whistle_13
			vol = -5
		}
		{
			int_md_crowd_whistle_14
			vol = -5
		}
		{
			int_md_crowd_whistle_15
			vol = -5
		}
		{
			int_md_crowd_whistle_16
			vol = -5
		}
		{
			int_md_crowd_whistle_17
			vol = -5
		}
		{
			int_md_crowd_whistle_18
			vol = -5
		}
		{
			int_md_crowd_whistle_19
			vol = -5
		}
		{
			int_md_crowd_whistle_20
			vol = -5
		}
	]
}
crowd_whistle_london_good_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			int_md_crowd_whistle_01
			vol = -5
		}
		{
			int_md_crowd_whistle_02
			vol = -5
		}
		{
			int_md_crowd_whistle_03
			vol = -5
		}
		{
			int_md_crowd_whistle_04
			vol = -5
		}
		{
			int_md_crowd_whistle_05
			vol = -5
		}
		{
			int_md_crowd_whistle_06
			vol = -5
		}
		{
			int_md_crowd_whistle_07
			vol = -5
		}
		{
			int_md_crowd_whistle_08
			vol = -5
		}
		{
			int_md_crowd_whistle_09
			vol = -5
		}
		{
			int_md_crowd_whistle_10
			vol = -5
		}
		{
			int_md_crowd_whistle_11
			vol = -5
		}
		{
			int_md_crowd_whistle_12
			vol = -5
		}
		{
			int_md_crowd_whistle_13
			vol = -5
		}
		{
			int_md_crowd_whistle_14
			vol = -5
		}
		{
			int_md_crowd_whistle_15
			vol = -5
		}
		{
			int_md_crowd_whistle_16
			vol = -5
		}
		{
			int_md_crowd_whistle_17
			vol = -5
		}
		{
			int_md_crowd_whistle_18
			vol = -5
		}
		{
			int_md_crowd_whistle_19
			vol = -5
		}
		{
			int_md_crowd_whistle_20
			vol = -5
		}
	]
}
crowd_whistle_small_ext_good_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_cheer_lg_ext_sg_01
			vol = -6
		}
		{
			crowd_cheer_lg_ext_sg_02
			vol = -6
		}
		{
			crowd_cheer_lg_ext_sg_03
			vol = -6
		}
		{
			crowd_cheer_lg_ext_sg_04
			vol = -6
		}
		{
			crowd_cheer_lg_ext_sg_05
			vol = -6
		}
		{
			crowd_cheer_lg_ext_sg_06
			vol = -6
		}
		{
			crowd_cheer_lg_ext_sg_07
			vol = -6
		}
		{
			crowd_cheer_lg_ext_sg_08
			vol = -6
		}
		{
			crowd_cheer_lg_ext_sg_09
			vol = -6
		}
		{
			crowd_cheer_lg_ext_sg_10
			vol = -6
		}
		{
			crowd_cheer_lrg_ext_gr_01
			vol = -6
		}
		{
			crowd_cheer_lrg_ext_gr_02
			vol = -6
		}
		{
			crowd_cheer_lrg_ext_gr_03
			vol = -6
		}
		{
			crowd_cheer_lrg_ext_gr_04
			vol = -6
		}
		{
			crowd_cheer_lrg_ext_gr_05
			vol = -6
		}
		{
			crowd_cheer_lrg_ext_gr_06
			vol = -6
		}
		{
			crowd_cheer_lrg_ext_gr_08
			vol = -6
		}
		{
			crowd_cheer_lrg_ext_gr_09
			vol = -6
		}
		{
			crowd_cheer_lrg_ext_gr_10
			vol = -6
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_cheer_md_ext_sg_01
			vol = -6
		}
		{
			crowd_cheer_md_ext_sg_02
			vol = -6
		}
		{
			crowd_cheer_md_ext_sg_03
			vol = -6
		}
		{
			crowd_cheer_md_ext_sg_04
			vol = -6
		}
		{
			crowd_cheer_md_ext_sg_05
			vol = -6
		}
		{
			crowd_cheer_md_ext_sg_06
			vol = -6
		}
		{
			crowd_cheer_md_ext_sg_07
			vol = -6
		}
		{
			crowd_cheer_md_ext_sg_08
			vol = -6
		}
		{
			crowd_cheer_md_ext_sg_09
			vol = -6
		}
		{
			crowd_cheer_md_ext_sg_10
			vol = -6
		}
		{
			crowd_cheer_med_ext_gr_01
			vol = -8
		}
		{
			crowd_cheer_med_ext_gr_02
			vol = -8
		}
		{
			crowd_cheer_med_ext_gr_03
			vol = -8
		}
		{
			crowd_cheer_med_ext_gr_04
			vol = -8
		}
		{
			crowd_cheer_med_ext_gr_05
			vol = -8
		}
		{
			crowd_cheer_med_ext_gr_06
			vol = -8
		}
		{
			crowd_cheer_med_ext_gr_07
			vol = -8
		}
		{
			crowd_cheer_med_ext_gr_08
			vol = -8
		}
		{
			crowd_cheer_med_ext_gr_09
			vol = -8
		}
		{
			crowd_cheer_med_ext_gr_10
			vol = -8
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
		}
		{
			ext_md_crowd_whistle_02
			vol = -12
		}
		{
			ext_md_crowd_whistle_03
			vol = -12
		}
		{
			ext_md_crowd_whistle_04
			vol = -12
		}
		{
			ext_md_crowd_whistle_05
			vol = -12
		}
		{
			ext_md_crowd_whistle_06
			vol = -12
		}
		{
			ext_md_crowd_whistle_07
			vol = -12
		}
		{
			ext_md_crowd_whistle_08
			vol = -12
		}
		{
			ext_md_crowd_whistle_09
			vol = -12
		}
		{
			ext_md_crowd_whistle_10
			vol = -12
		}
		{
			ext_md_crowd_whistle_11
			vol = -12
		}
		{
			ext_md_crowd_whistle_12
			vol = -12
		}
		{
			ext_md_crowd_whistle_13
			vol = -12
		}
		{
			ext_md_crowd_whistle_14
			vol = -12
		}
		{
			ext_md_crowd_whistle_15
			vol = -12
		}
		{
			ext_md_crowd_whistle_16
			vol = -12
		}
		{
			ext_md_crowd_whistle_17
			vol = -12
		}
		{
			ext_md_crowd_whistle_18
			vol = -12
		}
		{
			ext_md_crowd_whistle_19
			vol = -12
		}
		{
			ext_md_crowd_whistle_20
			vol = -12
		}
	]
}
crowd_oneshot_medium_int_good_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_cheer_md_int_sg_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_cheer_sm_int_gr_01
			vol = -8
		}
		{
			crowd_cheer_sm_int_gr_02
			vol = -8
		}
		{
			crowd_cheer_sm_int_gr_03
			vol = -8
		}
		{
			crowd_cheer_sm_int_gr_04
			vol = -8
		}
		{
			crowd_cheer_sm_int_gr_05
			vol = -8
		}
		{
			crowd_cheer_sm_int_gr_06
			vol = -8
		}
		{
			crowd_cheer_sm_int_gr_07
			vol = -8
		}
		{
			crowd_cheer_sm_int_gr_08
			vol = -8
		}
		{
			crowd_cheer_sm_int_gr_09
			vol = -8
		}
		{
			crowd_cheer_sm_int_gr_10
			vol = -8
		}
		{
			crowd_cheer_sm_int_sg_01
			vol = -8
		}
		{
			crowd_cheer_sm_int_sg_02
			vol = -8
		}
		{
			crowd_cheer_sm_int_sg_03
			vol = -8
		}
		{
			crowd_cheer_sm_int_sg_04
			vol = -8
		}
		{
			crowd_cheer_sm_int_sg_05
			vol = -8
		}
		{
			crowd_cheer_sm_int_sg_06
			vol = -8
		}
		{
			crowd_cheer_sm_int_sg_07
			vol = -8
		}
		{
			crowd_cheer_sm_int_sg_08
			vol = -8
		}
		{
			crowd_cheer_sm_int_sg_09
			vol = -8
		}
		{
			crowd_cheer_sm_int_sg_10
			vol = -8
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_boo_sm_01
			vol = -1
		}
		{
			crowd_boo_sm_02
			vol = -1
		}
		{
			crowd_boo_sm_03
			vol = -1
		}
		{
			crowd_boo_sm_04
			vol = -1
		}
		{
			crowd_boo_sm_05
			vol = -1
		}
		{
			crowd_boo_sm_06
			vol = -1
		}
		{
			crowd_boo_sm_07
			vol = -1
		}
		{
			crowd_boo_sm_08
			vol = -1
		}
		{
			crowd_boo_sm_09
			vol = -1
		}
		{
			crowd_boo_sm_10
			vol = -1
		}
	]
}
crowd_oneshot_medium_ext_bad_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_boo_grp_medium_ext_01
			vol = 0
		}
		{
			crowd_boo_grp_medium_ext_02
			vol = 0
		}
		{
			crowd_boo_grp_medium_ext_03
			vol = 0
		}
		{
			crowd_boo_grp_medium_ext_04
			vol = 0
		}
		{
			crowd_boo_grp_medium_ext_05
			vol = 0
		}
		{
			crowd_boo_grp_medium_ext_06
			vol = 0
		}
		{
			crowd_boo_grp_medium_ext_07
			vol = 0
		}
		{
			crowd_boo_grp_medium_ext_08
			vol = 0
		}
		{
			crowd_boo_grp_medium_ext_09
			vol = 0
		}
		{
			crowd_boo_grp_medium_ext_10
			vol = 0
		}
		{
			crowd_boo_med_outdoor_sg_01
			vol = 0
		}
		{
			crowd_boo_med_outdoor_sg_02
			vol = 0
		}
		{
			crowd_boo_med_outdoor_sg_03
			vol = 0
		}
		{
			crowd_boo_med_outdoor_sg_04
			vol = 0
		}
		{
			crowd_boo_med_outdoor_sg_05
			vol = 0
		}
		{
			crowd_boo_med_outdoor_sg_06
			vol = 0
		}
		{
			crowd_boo_med_outdoor_sg_07
			vol = 0
		}
		{
			crowd_boo_med_outdoor_sg_08
			vol = 0
		}
		{
			crowd_boo_med_outdoor_sg_09
			vol = 0
		}
		{
			crowd_boo_med_outdoor_sg_10
			vol = 0
		}
	]
}
crowd_oneshot_medium_int_bad_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_boo_sm_01
			vol = -1
		}
		{
			crowd_boo_sm_02
			vol = -1
		}
		{
			crowd_boo_sm_03
			vol = -1
		}
		{
			crowd_boo_sm_04
			vol = -1
		}
		{
			crowd_boo_sm_05
			vol = -1
		}
		{
			crowd_boo_sm_06
			vol = -1
		}
		{
			crowd_boo_sm_07
			vol = -1
		}
		{
			crowd_boo_sm_08
			vol = -1
		}
		{
			crowd_boo_sm_09
			vol = -1
		}
		{
			crowd_boo_sm_10
			vol = -1
		}
	]
}
crowd_oneshot_small_int_bad_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	command = playsound
	randomness = randomnorepeattype
}
jam_lead_event_container = {
	default_priority = 50
	default_buss = jammode_leadguitar
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
}
jam_bass_event_container = {
	default_priority = 50
	default_buss = jammode_bass
	norepeatfor = 0
	instancemanagement = stop_oldest
	instancelimit = 8
	command = playsound
	randomness = randomnorepeattype
}
gh4_jam_mode_bass_template_template = {
	default_priority = 50
	default_buss = jammode_bass
	norepeatfor = 0
	instancemanagement = ignore
	instancelimit = 8
	command = playsound
	randomness = randomnorepeattype
}
jam_fret_noise_bass_short_container = {
	default_priority = 25
	default_buss = jammode_bass
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			fj_b_fretnoise_s_01
			vol = 1
			priority = 1
			randompitch = {
				type = randomrangetype
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
			randompitch = {
				type = randomrangetype
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
			randompitch = {
				type = randomrangetype
				vals = [
					-0.5
					0.5
				]
			}
		}
	]
}
jam_fret_noise_bass_medium_container = {
	default_priority = 25
	default_buss = jammode_bass
	norepeatfor = 0.6
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			fj_b_fretnoise_m_01
			vol = -7
			priority = 1
			randompitch = {
				type = randomrangetype
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
			randompitch = {
				type = randomrangetype
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
			randompitch = {
				type = randomrangetype
				vals = [
					-0.5
					0.5
				]
			}
		}
	]
}
guitar_affirmation_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			guitar_select_affirmation_1
		}
	]
}
guitar_lick_crowd_swell_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
}
song_affirmation_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			song_affirmation_01
			vol = -5
		}
		{
			song_affirmation_02
			vol = -5
		}
		{
			song_affirmation_03
			vol = -5
		}
		{
			song_affirmation_05
			vol = -5
		}
		{
			song_affirmation_06
			vol = -5
		}
	]
}
drum_affirmation_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			drum_select_affirmation_01
		}
	]
}
mic_affirmation_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 3
	command = playsound
	randomness = randomtype
	sounds = [
		{
			mic_select_affirmation_01
		}
	]
}
bass_affirmation_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			bass_select_affirmation_02
		}
	]
}
crowd_clap_to_beat_small_int_normal_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			crowd_clap_large_ext_01
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_02
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_03
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_04
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_05
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_large_ext_06
			vol = -6.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_large_ext_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			crowd_clap_medium_ext_01
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_02
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_03
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_04
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_05
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_medium_ext_06
			vol = -6
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_medium_ext_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.02
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_select_negative
			vol = -6
		}
	]
}
audio_options_fader_end_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_select_negative
			vol = -1
		}
	]
}
jam_fret_noise_lead_container = {
	default_priority = 1
	default_buss = jammode_leadguitar
	norepeatfor = 0.75
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			fret_noise_07
			vol = -6
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_08
			vol = -6
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_09
			vol = -6
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_10
			vol = -6
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
		{
			fret_noise_11
			vol = -6
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
	]
}
crowd_reaction_bad_l_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 15
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			crowd_reaction_bad_l
			vol = 4
			pan1x = -1.0
			pan1y = 1.0
		}
	]
}
crowd_reaction_bad_r_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 15
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			crowd_reaction_bad_r
			vol = 4
			pan1x = 1.0
			pan1y = 1.0
		}
	]
}
starttesttones_sine_container = {
	default_priority = 75
	default_buss = band_playback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
}
starttesttones_pink_container = {
	default_priority = 75
	default_buss = band_playback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
}
ui_fader_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = none
	sounds = [
		{
			menu_options_sound_fader_move
			vol = 4
		}
	]
}
ui_knob_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = none
	sounds = [
		{
			menu_options_sound_eqknob_move
		}
	]
}
dolby_off_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_options_sound_dolbydigitaldisable
		}
	]
}
sound_options_select_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			menu_options_sound_select
		}
	]
}
sound_options_back_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			menu_options_sound_back
			vol = -5
		}
	]
}
menu_headtohead_zoomout_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomout_headtohead
		}
	]
}
gigboard_zoom_left_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_gigboard_camerapan_left
			vol = -11
		}
	]
}
boss_battle_press_sound_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_gigboard_camerapan_left
			vol = 0
		}
	]
}
gigboard_zoom_right_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_gigboard_camerapan_right
			vol = -11
		}
	]
}
menu_career_zoomin_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomin_career
			vol = -4
		}
	]
}
menu_career_zoomout_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomout_career
			vol = 0
		}
	]
}
menu_options_zoomout_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomout_options
			vol = -7
		}
	]
}
menu_options_zoomin_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomin_options
			vol = -2
		}
	]
}
menu_headtohead_zoomin_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomin_headtohead
			vol = -4
		}
	]
}
colorwheel_rotate_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 8
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_rotate
		}
	]
}
colorwheel_deselect_piepiece_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_deselect_piepiece
		}
	]
}
colorwheel_highlight_1_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_highlight_up_down_1
			vol = 3
		}
	]
}
colorwheel_selectcolor_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_selectcolor
		}
	]
}
colorwheel_gradientselect_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_gradientselect
		}
	]
}
colorwheel_selectpie_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_selectpie
		}
	]
}
colorwheel_choosepie_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_selectpie
		}
	]
}
colorwheel_focuspie_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_selectpie
		}
	]
}
colorwheel_selectshade_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_selectshade
		}
	]
}
enter_band_name_scroll_down_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_entername_scroll_1
			pitch = 1
			vol = -1
		}
	]
}
enter_band_name_select_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 8
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sound_05
			vol = -1
		}
	]
}
recording_start_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			jammode_dpad_recordingstart
		}
	]
}
recording_stop_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			jammode_dpad_recordingstop
			vol = -5
		}
	]
}
dpad_stop_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			jammode_dpad_stop
			vol = -5
		}
	]
}
dpad_play_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			jammode_dpad_play
		}
	]
}
ghmix_select_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			jammode_dpad_play
			vol = 5
		}
	]
}
ghmix_back_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			jammode_dpad_stop
			vol = -5
		}
	]
}
ghmix_scroll_up_down_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_options_sound_up_down
			vol = 6
		}
	]
}
line6_scroll_up_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_options_sound_up_down
			vol = 6
		}
	]
}
line6_scroll_down_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_options_sound_up_down
			vol = 6
		}
	]
}
online_instrument_change_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			jammode_dpad_play
			vol = 5
		}
	]
}
scale_scroll_up_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			jammode_dpad_play
			vol = 5
			pitch = 1
		}
	]
}
scale_scroll_down_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			jammode_dpad_play
			vol = 5
		}
	]
}
audio_options_up_down_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_options_sound_up_down
			vol = 6
		}
	]
}
audio_options_menu_guitar_container = {
	default_priority = 50
	default_buss = options_guitar
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			audio_options_guitar
			vol = -12
		}
	]
}
audio_options_menu_bass_container = {
	default_priority = 50
	default_buss = options_bass
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			audio_options_bass
			vol = -12
		}
	]
}
audio_options_menu_drums_container = {
	default_priority = 50
	default_buss = options_drums
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			audio_options_drum
			vol = -12
		}
	]
}
audio_options_menu_vocals_container = {
	default_priority = 50
	default_buss = options_vox
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			audio_options_vocals
			vol = -12
		}
	]
}
audio_options_menu_sfx_container = {
	default_priority = 50
	default_buss = options_crowd
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			audio_options_sfx
			vol = -4
		}
	]
}
ghtunes_ui_scroll_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			ghtunes_menu_scroll
			vol = -2
			pitch = 4
		}
	]
}
ghtunes_ui_scroll_pan_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
}
ghtunes_ui_select_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ghtunes_select
		}
	]
}
ghtunes_ui_back_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ghtunes_back
		}
	]
}
pause_menu_enter_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_into_pausemenu
			vol = -1
			pitch = -2
		}
	]
}
enter_band_name_finish_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_entername_finish_01
			vol = -2
		}
	]
}
enter_band_name_back_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_quickplay_removesong
			vol = -6
		}
	]
}
band_mode_career_ready_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			band_mode_ready
		}
	]
}
gh4_gigcomplete_sponsor_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gig_complete_sponsor
			vol = -1
		}
	]
}
gh4_online_ui_05_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			online_ui_sfx_05
		}
	]
}
gh4_online_ui_02_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			online_ui_sfx_02
		}
	]
}
gh4_online_ui_03_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			online_ui_sfx_03
		}
	]
}
gh4_online_ui_04_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			online_ui_sfx_04
		}
	]
}
gh4_online_ui_01_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			online_ui_sfx_01
		}
	]
}
menu_purchase_item_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			purchase_item
			vol = -3
		}
	]
}
menu_text_zoom_in_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			text_zoom_in
		}
	]
}
menu_text_zoom_out_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			text_zoom_out
		}
	]
}
menu_character_bio_panel_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			character_bio
			vol = -10
		}
	]
}
camera_transition_difficulty_to_vip_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			transition_difficulty_to_vip
		}
	]
}
colorwheel_highlight_4_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_highlight_up_down_4
		}
	]
}
colorwheel_highlight_2_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_highlight_up_down_2
		}
	]
}
colorwheel_highlight_3_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_highlight_up_down_3
		}
	]
}
colorwheel_highlight_5_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_highlight_up_down_5
		}
	]
}
menu_recording_pause_panel_in_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			jam_pause_panel_in
			vol = -14
		}
	]
}
jam_advanced_record_pause_panel_out_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			jam_advanced_pause_out
			pitch = 4
			vol = -2
		}
	]
}
jam_advanced_record_pause_panel_in_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			jam_advanced_pause_in
			vol = 6
			pitch = 2
		}
	]
}
online_panel_out_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			jam_advanced_pause_out
			pitch = 4
			vol = -2
		}
	]
}
online_panel_in_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			jam_advanced_pause_in
			vol = 2
			pitch = 2
		}
	]
}
online_main_panel_in_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			jam_pause_panel_in
			vol = -14
		}
	]
}
menu_recording_pause_panel_out_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			jam_pause_panel_out
			vol = -14
		}
	]
}
oneshotsbetweensongs_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
}
surgebetweensongs_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
}
large_ext_crowd_song_transition_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			large_ext_crowd_song_transition
		}
	]
}
medium_int_crowd_song_transition_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			medium_int_crowd_song_transition
		}
	]
}
ui_sfx_scroll_up_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_scroll_up
			vol = -8
		}
	]
}
ui_sfx_scroll_down_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_scroll_down
			vol = -4.5
		}
	]
}
ui_sfx_negative_select_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 8
	command = playsound
	randomness = none
	sounds = [
		{
			menu_select_negative
			vol = -8
		}
	]
}
enter_band_name_caps_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_entername_caps
			vol = -4
		}
	]
}
menu_character_bio_panel_out_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			character_bio_out
			vol = -18
		}
	]
}
song_wizard_on_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_jammode_songwizard_on
			vol = -1
		}
	]
}
song_wizard_off_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_jammode_songwizard_off
			vol = -1
		}
	]
}
jam_mode_fxhud_off_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_jammode_fxhud_off
			vol = -2
		}
	]
}
jam_mode_fxhud_on_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_jammode_fxhud_on
			vol = -10
		}
	]
}
menu_audio_options_reset_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			soundoptions_menu_reset
			vol = 0
		}
	]
}
menu_cheat_enter_red_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_cheat_red
			vol = -5
		}
	]
}
menu_cheat_enter_green_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_cheat_green
			vol = -5
		}
	]
}
menu_cheat_enter_blue_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_cheat_blue
			vol = -5
		}
	]
}
menu_cheat_enter_yellow_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_cheat_yellow
			vol = -5
		}
	]
}
gig_board_zoom_out_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomout_career
			vol = -1
		}
	]
}
gig_board_zoom_in_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomin_career
			vol = -15
		}
	]
}
large_guitar_smash_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			drummer_tom_01
		}
		{
			drummer_tom_02
		}
	]
}
drummer_snare_hit_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			drummer_snare_01
		}
		{
			drummer_snare_02
		}
	]
}
large_bass_smash_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 8
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 8
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 8
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = ignore
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			band_leader_affirmation
			vol = -1
		}
	]
}
save_confirmed_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
}
gigboard_select_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sound_05
			vol = -3
		}
	]
}
gigboard_select_back_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sound_09
			vol = -5.5
		}
	]
}
quickplay_remove_song_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_quickplay_removesong
			vol = 0
		}
	]
}
quickplay_select_song_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_quickplay_selectsong
			vol = -4
		}
	]
}
quickplay_remove_all_songs_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_quickplay_removesong
		}
	]
}
menu_song_complete_out_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			songcomplete_out
			vol = -10
		}
	]
}
menu_song_complete_in_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			songcomplete_in
			vol = -9
		}
	]
}
unlock_new_item_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gigcomplete_unlock_new_item
			vol = -5
		}
	]
}
menu_band_ready_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			band_mode_ready
		}
	]
}
gh_sfx_battlemode_mine_explode_p2_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_jammode_songwizard_on
			vol = -1
			pitch = 2
		}
	]
}
ghtunes_off_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_jammode_songwizard_off
			vol = -1
			pitch = 4
		}
	]
}
menu_car_zoomin_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomout_career
			vol = -4
			pitch = 7
		}
	]
}
menu_car_zoomout_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomout_career
			vol = -4
			pitch = 3
		}
	]
}
vocal_highway_appear_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			highway_vocal_remix_nofeedback
			vol = -6
		}
	]
}
character_reset_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_restore_defaults
			vol = 5
		}
	]
}
ghtunes_warning_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ghtunes_scroll_warning
		}
	]
}
do_or_die_sfx_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			doordie
			vol = -3
		}
	]
}
medium_ext_encore_crowd_container = {
	default_priority = 50
	default_buss = encore_loops
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = encore_loops
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = encore_loops
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = encore_loops
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			gigcomplete_unlock_item_text_appear
			vol = -2
		}
	]
}
battle_boss_whoosh2_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gigcomplete_unlock_item_text_appear
			vol = 4
		}
	]
}
gigcomplete_magazine_out_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gig_complete_magazine_out
			vol = 5
		}
	]
}
gigcomplete_magazine_in_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gig_complete_magazine_in
			vol = 5
		}
	]
}
loading_crowd_long_burst_container = {
	default_priority = 100
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 100
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 100
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
		{
			ext_md_crowd_swell_sh_l_02
			vol = 6.5
			pan1x = -1
			pan1y = 1
		}
		{
			ext_md_crowd_swell_sh_r_02
			vol = 6.5
			pan1x = 1
			pan1y = 1
		}
	]
}
fireworks_last_venue_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			last_venue_fireworks
			vol = -2
		}
	]
}
pyro_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			pyro_2
			vol = -2
		}
		{
			pyro_1
			vol = -2
		}
	]
}
select_sound_big_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sound_05
		}
	]
}
precutscene_sfx_container = {
	default_priority = 50
	default_buss = binkcutscenes
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			pre_cutscence_sfx
			vol = -18
		}
	]
}
ghm_trappedunderice_release_p1_container = {
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = ui_battle_mode
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			star_get
			vol = -2
			pan1x = -1
			pan1y = 1
			pan2x = 0.3962264
			pan2y = 1
			panremovecenter = true
		}
	]
}
z_icecave_intro_container = {
	default_priority = 50
	default_buss = crowd_presong_intro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			icecave_intro
			vol = 10
		}
	]
}
z_mop_intro_container = {
	default_priority = 50
	default_buss = crowd_presong_intro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			mop_intro
			vol = 4.5
		}
	]
}
z_stone_intro_container = {
	default_priority = 50
	default_buss = crowd_presong_intro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			stone_intro
			vol = 6
		}
	]
}
z_metalfest_intro_container = {
	default_priority = 50
	default_buss = crowd_presong_intro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			metalfest_intro
		}
	]
}
z_donington_intro_container = {
	default_priority = 50
	default_buss = crowd_presong_intro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			donnington_intro
			vol = 5
		}
	]
}
z_justice_intro_container = {
	default_priority = 50
	default_buss = crowd_presong_intro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			justice_intro
			vol = 9
		}
	]
}
z_tushino_intro_container = {
	default_priority = 50
	default_buss = crowd_presong_intro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			tushino_intro
			vol = 6
		}
	]
}
z_soundcheck2_intro_container = {
	default_priority = 50
	default_buss = crowd_presong_intro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			z_soundcheck2_intro
			vol = 6
		}
	]
}
z_studio_intro_container = {
	default_priority = 50
	default_buss = crowd_presong_intro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			studio2_intro
			vol = 6
		}
	]
}
z_studio_intro2_container = {
	default_priority = 50
	default_buss = crowd_presong_intro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			studio2_intro
			vol = 6
		}
	]
}
ui_band_mode_choose_sound_spawned_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = none
}
ui_band_mode_choose_sound_ready_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = none
}
band_screen_ui_sound_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	randomness = none
}
band_failed_x_sfx_container = {
	default_priority = 50
	default_buss = crowd_boos
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			band_failed_x_sfx
			vol = 8
		}
	]
}
fail_screen_sfx_container = {
	default_priority = 50
	default_buss = crowd_boos
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			band_failed_x_sfx
			vol = -2
		}
	]
}
z_amazon_intro_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			amazon_intro
			vol = 12
		}
	]
}
z_sphinx_intro_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			sphinx_intro
			vol = 12
		}
	]
}
z_canyon_intro_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			canyon_intro
			vol = 12
		}
	]
}
z_greatwall_intro_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			greatwall_intro
			vol = 12
		}
	]
}
z_icecap_intro_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			icecap_intro
			vol = 12
		}
	]
}
z_london_intro_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_intro
			vol = 12
		}
	]
}
z_quebec_intro_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			quebec_intro
			vol = 12
		}
	]
}
z_atlantis_intro_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			atlantis_intro
			vol = 12
		}
	]
}
encore_pulsate_neon_loop_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.35000002
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			encore_pulsate_neon_loop
			num_loops = -1
			vol = -7
		}
	]
}
crowd_oneshot_london_good_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_cheer_md_int_sg_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_md_int_sg_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_01
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_02
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_03
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_04
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_05
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_06
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_07
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_08
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_09
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
		}
		{
			crowd_cheer_med_int_gr_10
			vol = -7
			pan1randomleft = 38.453712
			pan1randomright = 321.3402
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
crowd_oneshot_london_bad_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_boo_grp_medium_int_01
			vol = -11
			pan1randomleftext = 48.17983
			pan1randomrightext = 314.12747
		}
		{
			crowd_boo_grp_medium_int_02
			vol = -11
			pan1randomleftext = 49.650177
			pan1randomrightext = 313.73822
		}
		{
			crowd_boo_grp_medium_int_03
			vol = -11
			pan1randomleftext = 44.053047
			pan1randomrightext = 311.54672
		}
		{
			crowd_boo_grp_medium_int_04
			vol = -11
			pan1randomleftext = 44.81091
			pan1randomrightext = 314.77533
		}
		{
			crowd_boo_grp_medium_int_05
			vol = -11
			pan1randomleftext = 45.26162
			pan1randomrightext = 312.603
		}
		{
			crowd_boo_grp_medium_int_06
			vol = -11
			pan1randomleftext = 42.68628
			pan1randomrightext = 315.4982
		}
		{
			crowd_boo_grp_medium_int_07
			vol = -11
			pan1randomleftext = 43.394
			pan1randomrightext = 313.9488
		}
		{
			crowd_boo_grp_medium_int_08
			vol = -11
			pan1randomleftext = 48.22104
			pan1randomrightext = 316.9001
		}
		{
			crowd_boo_grp_medium_int_09
			vol = -11
			pan1randomleftext = 43.66778
			pan1randomrightext = 316.5765
		}
		{
			crowd_boo_grp_medium_int_10
			vol = -11
			pan1randomleftext = 44.53795
			pan1randomrightext = 315.72522
		}
	]
}
crowd_clap_to_beat_london_left_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_clap_london_01
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_london_02
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_london_03
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_london_04
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_london_05
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
		{
			crowd_clap_london_06
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = -0.37264153
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_london_right_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_clap_london_01
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_02
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_03
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_04
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_05
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_06
			vol = -8
			pan1x = -0.3160377
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_london_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_clap_london_01
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_london_02
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_london_03
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_london_04
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_london_05
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
		{
			crowd_clap_london_06
			vol = -8
			pan1x = -0.31132078
			pan1y = 0
			pan2x = 0.2783019
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_london_right_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_clap_london_01
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_02
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_03
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_04
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_05
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_06
			vol = -8
			pan1x = 0.2783019
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_london_left_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_clap_london_01
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_london_02
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_london_03
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_london_04
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_london_05
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
		{
			crowd_clap_london_06
			vol = -8
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
crowd_clap_to_beat_london_normal_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			crowd_clap_london_01
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_02
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_03
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_04
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_05
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
		{
			crowd_clap_london_06
			vol = -7.5
			pan1x = -1
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
crowd_applause_london_r_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_applause_r_02
			vol = -6
			pan1x = 1
			pan1y = 1
		}
	]
}
crowd_applause_london_l_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			london_crowd_applause_l_02
			vol = -6
			pan1x = -1
			pan1y = 1
		}
	]
}
london_encore_crowd_container = {
	default_priority = 50
	default_buss = encore_loops
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			medium_int_crowd_song_transition
		}
	]
}
star_meter_gain_container = {
	default_priority = 50
	default_buss = ui_star_power
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
